Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF2B311CD1
	for <lists+xen-devel@lfdr.de>; Sat,  6 Feb 2021 12:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82138.151867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8LSk-0008N1-HS; Sat, 06 Feb 2021 11:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82138.151867; Sat, 06 Feb 2021 11:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8LSk-0008Me-Dx; Sat, 06 Feb 2021 11:09:14 +0000
Received: by outflank-mailman (input) for mailman id 82138;
 Sat, 06 Feb 2021 11:09:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l8LSi-0008MZ-6B
 for xen-devel@lists.xenproject.org; Sat, 06 Feb 2021 11:09:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l8LSg-000721-Mx; Sat, 06 Feb 2021 11:09:10 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l8LSg-0000z4-B6; Sat, 06 Feb 2021 11:09:10 +0000
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
	bh=e5i6NxZrM2fGvPLAGwDz2aKPTGuJQtRwfz0sok4jvOY=; b=xX9U2IdXnrSNvwEpXe7TmLKOES
	5SmMXQE405Mui+JCD+T8SbFGJ9fzhiQXw7tMJAZ7EWGWqcNr5H6C2k4/WaKjel0dmcLfKhJ7Q5lyT
	GRXfpjTnAKJ14QNqN+zTE5HDkkB01kTYf9d7fVivNWmgqlHS3U6QOjM73URMq5QK4dVE=;
Subject: Re: [PATCH] xen/arm: fix gnttab_need_iommu_mapping
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: lucmiccio@gmail.com, xen-devel@lists.xenproject.org,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com
References: <alpine.DEB.2.21.2102051604320.29047@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <247f517e-a283-12c8-2ccb-3915cda4ac2e@xen.org>
Date: Sat, 6 Feb 2021 11:09:08 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102051604320.29047@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 06/02/2021 00:38, Stefano Stabellini wrote:
> Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.

Doh :/.

> The offending chunk is: >
>   #define gnttab_need_iommu_mapping(d)                    \
> -    (is_domain_direct_mapped(d) && need_iommu(d))
> +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
> 
> On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
> directly mapped, like the old check did,

This is not entirely correct, we only need gnttab_need_iommu_mapping() 
to return true when the domain is direct mapped **and** the IOMMU is 
enabled for the domain.

> but the new check is always
> false. >
> In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
> need_sync is set as:
> 
>      if ( !is_hardware_domain(d) || iommu_hwdom_strict )
>          hd->need_sync = !iommu_use_hap_pt(d); >
> iommu_hwdom_strict is actually supposed to be ignored on ARM, see the
> definition in docs/misc/xen-command-line.pandoc:
> 
>      This option is hardwired to true for x86 PVH dom0's (as RAM belonging to
>      other domains in the system don't live in a compatible address space), and
>      is ignored for ARM.
> 
> But aside from that, the issue is that iommu_use_hap_pt(d) is true,
> hence, hd->need_sync is false, and gnttab_need_iommu_mapping(d) is false
> too.

need_sync means that you have a separate IOMMU page-table and they need 
to be updated for every change.

hap_pt means the page-table used by the IOMMU is the P2M.

For Arm, we always shared the P2M with the IOMMU.

> 
> As a consequence, when using PV network from a domU on a system where
> IOMMU is on from Dom0, I get:
> 
> (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0x8424cb148, fsynr=0xb0001, cb=0
> [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
> 
> The fix is to go back to the old implementation of
> gnttab_need_iommu_mapping.  However, we don't even need to specify &&
> need_iommu(d) since we don't actually need to check for the IOMMU to be
> enabled (iommu_map does it for us at the beginning of the function.)

gnttab_need_iommu_mapping() doesn't only gate the 
iommu_legacy_{,un}map() call but also decides whether we need to held 
both the local and remote grant-table write lock for the duration of the 
operation (see double_gt_lock()).

I'd like to avoid the requirement to held the double_gt_lock() if there 
is the domain is going to use the IOMMU.

> 
> This fix is preferrable to changing the implementation of need_sync or
> iommu_use_hap_pt because "need_sync" is not really the reason why we
> want gnttab_need_iommu_mapping to return true.

In 4.13, we introduced is_iommu_enabled() (see commit c45f59292367 
"domain: introduce XEN_DOMCTL_CDF_iommu flag") that should do the job 
for this patch.

For 4.12, we could use iommu_enabled as in general dom0 will use an 
IOMMU if Xen enable it globally. Note that 4.12 is only security 
supported since last October (see [1]). So this would be up to patch 
there tree.

> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Backport: 4.12+

I would suggest to use Fixes: tag if you know the exact commit. This 
would make easier for downstream users if they backported the offending 
patch.

> 
> ---
> 
> It is incredible that it was missed for this long, but it takes a full
> PV drivers test using DMA from a non-coherent device to trigger it, e.g.
> wget from a domU to an HTTP server on a different machine, ping or
> connections to dom0 won't trigger the bug.

Great finding!

> 
> It is interesting that given that IOMMU is on for dom0, Linux could
> have just avoided using swiotlb-xen and everything would have just
> worked. It is worth considering introducing a feature flag (e.g.
> XENFEAT_ARM_dom0_iommu) to let dom0 know that the IOMMU is on and
> swiotlb-xen is not necessary.
> Then Linux can avoid initializing
> swiotlb-xen and just rely on the IOMMU for translation.

The presence of an IOMMU on the system doesn't necessarily indicate that 
all the devices will be protected by an IOMMU. We can only turn off the 
swiotlb-xen when we know that **all** the devices are protected.

Therefore a simple feature flag is not going to do the job. Instead, we 
need to tell Linux which devices has been protected by an IOMMU. This is 
something I attempted to do a few years ago (see [2]).

In addition to that, we also need to know whether Linux is capable to 
disable swiotlb-xen. This would allow us to turn off all the mitigation 
we introduced in Xen for direct mapped domain. One possibility would be 
to introduce ELF note like for Arm (see [3]).

> 
> diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/asm-arm/grant_table.h
> index 6f585b1538..2a154d1851 100644
> --- a/xen/include/asm-arm/grant_table.h
> +++ b/xen/include/asm-arm/grant_table.h
> @@ -88,8 +88,7 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
>   #define gnttab_status_gfn(d, t, i)                                       \
>       (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
>   
> -#define gnttab_need_iommu_mapping(d)                    \
> -    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
> +#define gnttab_need_iommu_mapping(d)  (is_domain_direct_mapped(d))
>   
>   #endif /* __ASM_GRANT_TABLE_H__ */
>   /*
> 

Cheers,

[1] https://xenbits.xen.org/docs/unstable/support-matrix.html
[2] 
https://lists.infradead.org/pipermail/linux-arm-kernel/2014-February/234523.html
[3] 
https://patchwork.kernel.org/project/linux-arm-kernel/patch/5342AF59.3030405@linaro.org/


-- 
Julien Grall

