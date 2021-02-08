Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 564AA313FD0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 21:02:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83050.153799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Cjm-0001ph-7e; Mon, 08 Feb 2021 20:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83050.153799; Mon, 08 Feb 2021 20:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Cjm-0001pE-32; Mon, 08 Feb 2021 20:02:22 +0000
Received: by outflank-mailman (input) for mailman id 83050;
 Mon, 08 Feb 2021 20:02:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9Cjk-0001p7-0r
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 20:02:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9Cje-0003Kz-Fs; Mon, 08 Feb 2021 20:02:14 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9Cje-0008KB-7M; Mon, 08 Feb 2021 20:02:14 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=iWN4KTGXqqiuFOYIvQUkcnfQ2/Rs4mlupUFiDuC1wKc=; b=zU3gSypzmrxrJQc7F4FS3omuko
	J8InxXtpGFZzBWSbhVxF7YYoRYX/C+N6RW87/3v/+UhRgDO1lThqQaoptA4csCGdPElFbhS8V5vI3
	TGtQdGJ0n9E2BegQGqeg0OcxI4H8JywvqW9P6cGJ0/Sw78cTSvqvfFfGX7ElqZOQGAxc=;
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: lucmiccio@gmail.com, xen-devel@lists.xenproject.org,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com, Rahul.Singh@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <173ed75a-94cf-26a5-9271-a687bf201578@xen.org>
Date: Mon, 8 Feb 2021 20:02:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210208184932.23468-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

(+ Jan and Ian for RM/stable decision)

Hi Jan,

On 08/02/2021 18:49, Stefano Stabellini wrote:
> Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
> The offending chunk is:
> 
>   #define gnttab_need_iommu_mapping(d)                    \
> -    (is_domain_direct_mapped(d) && need_iommu(d))
> +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
> 
> On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
> directly mapped and IOMMU is enabled for the domain, like the old check
> did, but the new check is always false.
> 
> In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
> need_sync is set as:
> 
>      if ( !is_hardware_domain(d) || iommu_hwdom_strict )
>          hd->need_sync = !iommu_use_hap_pt(d);
> 
> iommu_use_hap_pt(d) means that the page-table used by the IOMMU is the
> P2M. It is true on ARM. need_sync means that you have a separate IOMMU
> page-table and it needs to be updated for every change. need_sync is set
> to false on ARM. Hence, gnttab_need_iommu_mapping(d) is false too,
> which is wrong.
> 
> As a consequence, when using PV network from a domU on a system where
> IOMMU is on from Dom0, I get:
> 
> (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0x8424cb148, fsynr=0xb0001, cb=0
> [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
> 
> The fix is to go back to something along the lines of the old
> implementation of gnttab_need_iommu_mapping.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Fixes: 91d4eca7add

The format for fixes tag is:

Fixes: sha ("<commit title>")

For staging fix:

Reviewed-by: Julien Grall <jgrall@amazon.com>

@Ian, I think this wants to go in 4.15. Without it, Xen may receive an 
IOMMU fault for DMA transaction using granted page.

> Backport: 4.12+
> 
> ---
> 
> Given the severity of the bug, I would like to request this patch to be
> backported to 4.12 too, even if 4.12 is security-fixes only since Oct
> 2020.

I would agree that the bug is bad, but it is not clear to me why this 
would be warrant for an exception for backporting. Can you outline 
what's the worse that can happen?

Correct me if I am wrong, if one can hit this error, then it should be 
pretty reliable. Therefore, anyone wanted to use 4.12 in production 
should have seen if the error on there setup by now (4.12 has been out 
for nearly two years). If not, then they are most likely not affected.

Any new users of Xen should use the latest stable rather than starting 
with an old version.

Other than the seriousness of the bug, I think there is also a fairness 
concern.

So far our rules says there is only security support backport allowed. 
If we start granting exception, then we need a way to prevent abuse of 
it. To take an extreme example, why one couldn't ask backport for 4.2?

That said, I vaguely remember this topic was brought up a few time on 
security@. So maybe it is time to have a new discussion about stable tree.

Cheers,

-- 
Julien Grall

