Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C736B5B46A3
	for <lists+xen-devel@lfdr.de>; Sat, 10 Sep 2022 16:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404759.647333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX1Tk-0007mx-Bl; Sat, 10 Sep 2022 14:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404759.647333; Sat, 10 Sep 2022 14:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oX1Tk-0007km-7L; Sat, 10 Sep 2022 14:29:04 +0000
Received: by outflank-mailman (input) for mailman id 404759;
 Sat, 10 Sep 2022 14:29:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oX1Ti-0007kf-Oo
 for xen-devel@lists.xenproject.org; Sat, 10 Sep 2022 14:29:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oX1Ti-0005Ra-32; Sat, 10 Sep 2022 14:29:02 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oX1Th-0004vk-Oo; Sat, 10 Sep 2022 14:29:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=7C1oIQuZovOjAI+3YoXfrCNWAmhV1q+wkSxNOLTtroI=; b=Bio2lkXbnT1e7+7BMeHKOFhUN9
	U1zm8jCI24UvoY+ZxTqAn1y1STuSWq1lxLct96MDD8ji4S+CqYpLgGiKel/EGc5u3ajLbSpYCrcap
	e0B568+wK9TPve7UyJA+ypaPg6EYHNHbvIq4ou6OcCLs+sm83eNIqBUymJxFoUmYYvFQ=;
Message-ID: <f2684d00-b23e-175d-8cef-7de361cba2ef@xen.org>
Date: Sat, 10 Sep 2022 15:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
To: Carlo Nonato <carlo.nonato@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-10-carlo.nonato@minervasys.tech>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 09/12] Revert "xen/arm: mm: Initialize page-tables
 earlier"
In-Reply-To: <20220826125111.152261-10-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Carlo,

On 26/08/2022 13:51, Carlo Nonato wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> This reverts commit 3a5d341681af650825bbe3bee9be5d187da35080.

Usually, this indicates that this was a clean revert. IOW, there was no 
clash or modification necessary. Looking at the diff below, this doesn't 
look to be the case because you are also reverting f8c818848fa6 
"xen/arm: mm: Re-implement early_fdt_map() using map_pages_to_xen()" 
and introduce a new version of create_boot_mappings().

So I think the commit message/title should be reworded to explain this 
is not a clean revert and what extra changes were made.

But see below about re-introducing create_boot_mapping().

> 
> The cache coloring support will be configurable within the Xen command line,
> but it will be initialized before the page-tables; this is necessary
> for coloring the hypervisor itself beacuse we will create a specific
> mapping for it that could be configured using some command line options.
> In order to parse all the needed information from the device tree, we
> need to revert the above commit and restore the previous order for
> page-tables initialization.
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   xen/arch/arm/mm.c    | 33 ++++++++++++++++++++-------------
>   xen/arch/arm/setup.c |  4 ++--
>   2 files changed, 22 insertions(+), 15 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b42cddb1b4..1afa02b4af 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -368,6 +368,17 @@ static inline lpae_t pte_of_xenaddr(vaddr_t va)
>       return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
>   }
>   
> +static void __init create_boot_mappings(unsigned long virt_offset,
> +                                        mfn_t base_mfn)
> +{
> +    lpae_t pte;
> +
> +    pte = mfn_to_xen_entry(base_mfn, MT_NORMAL);
> +    write_pte(&boot_second[second_table_offset(virt_offset)], pte);
> +    flush_xen_tlb_local();
> +}
Please don't introduce a new function that create mappings. All mappings 
should be done using map_pages_to_xen(). Looking at the implementation, 
it should be usable with the following diff:

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index c81c706c8b23..78afb8eb0ec1 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1104,7 +1104,7 @@ static int xen_pt_update(unsigned long virt,
       *
       * XXX: Add a check.
       */
-    const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
+    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));

      /*
       * The hardware was configured to forbid mapping both writeable and

With that there is no change required in early_fdt_map() and ...

>   
> +    /* ... DTB */
> +    pte = boot_second[second_table_offset(BOOT_FDT_VIRT_START)];
> +    xen_second[second_table_offset(BOOT_FDT_VIRT_START)] = pte;
> +    pte = boot_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)];
> +    xen_second[second_table_offset(BOOT_FDT_VIRT_START + SZ_2M)] = pte;
> +

... rather than copying the 2 entries, you could call early_fdt_map() 
after the switch. The advantage is it will avoid to hardoded more 
page-table entries.

As part of my switch_ttbr() rework, I am planning to re-introduce 
relocation (at least for testing). So I will include the changes I 
mention above in my series.

Cheers,

-- 
Julien Grall

