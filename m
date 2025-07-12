Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA36B02A5F
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 12:09:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041769.1412345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXAB-0002VM-KV; Sat, 12 Jul 2025 10:08:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041769.1412345; Sat, 12 Jul 2025 10:08:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaXAB-0002SS-Fr; Sat, 12 Jul 2025 10:08:59 +0000
Received: by outflank-mailman (input) for mailman id 1041769;
 Sat, 12 Jul 2025 10:08:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uaXA9-0002S6-AK
 for xen-devel@lists.xenproject.org; Sat, 12 Jul 2025 10:08:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXA8-00DmWU-2H;
 Sat, 12 Jul 2025 10:08:56 +0000
Received: from [2a02:8012:3a1:0:700f:1c87:7a7d:6616]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uaXA8-000pfF-1W;
 Sat, 12 Jul 2025 10:08:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=6auT+WNsTNziCAMo8SQGMQhs4tz8MtkUyGnWuo0JTNA=; b=CC+8T7HFMFQ1Exu6W+XEGzcCOx
	HdrGKgPWjkQM4QnEChHg97t0OlSsOBRg5Jqa/LGJ2Pfj7mjXq24tMpIlGdmIGSvL+T2L1yZlfZF0G
	u4PpqXWQ1bj9DZ9fsEnXvsZaLDTNpU8EIhUn/9/TNbORuSTiTinleEANiEn4PVQKKkpw=;
Message-ID: <d62f045d-86ae-4ef8-bee5-225b8fa6594d@xen.org>
Date: Sat, 12 Jul 2025 11:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: fix arm_iommu_map_page after f9f6b22ab
Content-Language: en-GB
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, jason.andryuk@amd.com,
 stewart.hildebrand@amd.com
References: <alpine.DEB.2.22.394.2507101724180.605088@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2507101724180.605088@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 11/07/2025 01:25, Stefano Stabellini wrote:
> Up until f9f6b22ab "xen/arm: Map ITS doorbell register to IOMMU page

Everywhere in this commit message, we are using 12 characters commit ID.

> tables" the only caller of iommu_map on ARM was grant_table.c which has
> a specific usage model and restrictions as described by the in-code
> comment in arm_iommu_map_page.
> 
> f9f6b22ab introduced a second caller to iommu_map on ARM:
> vgic_v3_its_init_virtual. This specific statement in the
> f9f6b22ab commit message is wrong:
> 
> "Note that the 1:1 check in arm_iommu_map_page remains for now, as
> virtual ITSes are currently only created for hwdom where the doorbell
> mapping is always 1:1."
> 
> Leading to crashes any time the hardware domain is not direct-mapped
> (e.g. cache coloring and non-Dom0 hardware domain):
> 
> (XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49

Are you using the last staging? Asking because line 49 is a blank line:

https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/drivers/passthrough/arm/iommu_helpers.c;h=5cb19874819357b5cd58638864b56c505d07b37a;hb=HEAD#l49

> [...]
> (XEN) Xen call trace:
> (XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
> (XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
> (XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
> (XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
> (XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
> (XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
> (XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
> (XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
> (XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
> (XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
> (XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10
> 
> Specifically, non-1:1 hardware domain exists with cache coloring
> enabled. For that, is_domain_direct_mapped(d) is false but
> domain_use_host_layout(d) is true.
> 
> At a minimum, we need to change the is_domain_direct_mapped(d) check in
> arm_iommu_map_page into a domain_use_host_layout(d) check. But in
> preparation of exposing vITS to domUs, let's take this opportunity to
> generalize the arm_iommu_map_page function further to be more generic
> and unopinionated. Move the in-code comment specific to the grant table
> can live in grant-table.c instead.
> 

Given this is a bug fix, a Fixes tag should be added.

> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   xen/common/grant_table.c                    | 10 ++++++++--
>   xen/drivers/passthrough/arm/iommu_helpers.c | 13 +------------
>   2 files changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index cf131c43a1..2e08dac656 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1274,8 +1274,14 @@ map_grant_ref(
>           }
>   
>           /*
> -         * We're not translated, so we know that dfns and mfns are
> -         * the same things, so the IOMMU entry is always 1-to-1.
> +         * Grant mappings can be used for DMA requests. The dev_bus_addr
> +         * returned by the hypercall is the MFN (not the IPA). For

I was under the impression that IPA is an Arm termonology. Yet this is 
common code. Also, it would be preferable if we don't mix frame and 
address. In this case, I think you want GFN (I think it would work for 
all the domains.

> +         * device protected by an IOMMU, Xen needs to add a 1:1 mapping
> +         * in the domain p2m to allow DMA request to work. This is only
 > +         * valid when the domain is directed mapped.
 > +         *> +         * We're not translated, so we know that dfns 
and mfns are the
> +         * same things, so the IOMMU entry is always 1-to-1.
>            */
>           if ( !(op->flags & GNTMAP_readonly) && node.cnt.wr == 1 )
>               kind = IOMMUF_readable | IOMMUF_writable;
> diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
> index 5cb1987481..dae5fc0caa 100644
> --- a/xen/drivers/passthrough/arm/iommu_helpers.c
> +++ b/xen/drivers/passthrough/arm/iommu_helpers.c
> @@ -36,17 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
>   {
>       p2m_type_t t;
>   
> -    /*
> -     * Grant mappings can be used for DMA requests. The dev_bus_addr
> -     * returned by the hypercall is the MFN (not the IPA). For device
> -     * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
> -     * p2m to allow DMA request to work.
> -     * This is only valid when the domain is directed mapped. Hence this
> -     * function should only be used by gnttab code with gfn == mfn == dfn.
> -     */
> -    BUG_ON(!is_domain_direct_mapped(d));
> -    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
> -

Shouldn't arm_iommu_unmap_page() also be updated? It would not result to 
a crash, but we would not be able to
remove the mapping.

Cheers,

-- 
Julien Grall


