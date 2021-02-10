Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53393317220
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 22:14:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83722.156533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9wnv-0001pQ-VZ; Wed, 10 Feb 2021 21:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83722.156533; Wed, 10 Feb 2021 21:13:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9wnv-0001p1-S7; Wed, 10 Feb 2021 21:13:43 +0000
Received: by outflank-mailman (input) for mailman id 83722;
 Wed, 10 Feb 2021 21:13:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QmaB=HM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l9wnu-0001ow-3Q
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 21:13:42 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c6d5d99-315c-4a61-8c32-96f762e94b34;
 Wed, 10 Feb 2021 21:13:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EDD964E31;
 Wed, 10 Feb 2021 21:13:40 +0000 (UTC)
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
X-Inumbo-ID: 2c6d5d99-315c-4a61-8c32-96f762e94b34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612991620;
	bh=pidYgsL7yGr1cf0tv9hCO5cPunWAz2rH8WLkJmo7WI8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MiKBlczchv7ysANd6UObc7XHhD5eF4YH7tmd6ZgVWtJgGaszGOVA51PPZ3YudM4xZ
	 t5BXMaIPSsw9hMdamWfKZ2NtLIbzMAlD0moi/ZUiI5DzWgTMRrIxVV0ZsKDWkmvPz6
	 vZQMb1M4IEITaG+8MfDHAlpaFVale0u4yVvvraLtL9pGA10S/fZAV0eej7MPf2JmJ5
	 PSoz6+YWQo8dRUEZi2WBUhErRlGgQpZKLXXd39Bz9OS5XJurTHEdTheTQpPyYy9pFB
	 M7gfzzflrbbGS9z217Jp3i3qI31wEhXOLSPSaTA/vJLzkz+kGvTeTpup9O5u1EiCR/
	 Ob+Njcaf3FFYw==
Date: Wed, 10 Feb 2021 13:13:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <Rahul.Singh@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "lucmiccio@gmail.com" <lucmiccio@gmail.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
In-Reply-To: <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
Message-ID: <alpine.DEB.2.21.2102101309230.7114@sstabellini-ThinkPad-T480s>
References: <20210208184932.23468-1-sstabellini@kernel.org> <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com> <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s> <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-397500670-1612991620=:7114"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-397500670-1612991620=:7114
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 10 Feb 2021, Rahul Singh wrote:
> > On 9 Feb 2021, at 8:36 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > On Tue, 9 Feb 2021, Rahul Singh wrote:
> >>> On 8 Feb 2021, at 6:49 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>> 
> >>> Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
> >>> The offending chunk is:
> >>> 
> >>> #define gnttab_need_iommu_mapping(d)                    \
> >>> -    (is_domain_direct_mapped(d) && need_iommu(d))
> >>> +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
> >>> 
> >>> On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
> >>> directly mapped and IOMMU is enabled for the domain, like the old check
> >>> did, but the new check is always false.
> >>> 
> >>> In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
> >>> need_sync is set as:
> >>> 
> >>>   if ( !is_hardware_domain(d) || iommu_hwdom_strict )
> >>>       hd->need_sync = !iommu_use_hap_pt(d);
> >>> 
> >>> iommu_use_hap_pt(d) means that the page-table used by the IOMMU is the
> >>> P2M. It is true on ARM. need_sync means that you have a separate IOMMU
> >>> page-table and it needs to be updated for every change. need_sync is set
> >>> to false on ARM. Hence, gnttab_need_iommu_mapping(d) is false too,
> >>> which is wrong.
> >>> 
> >>> As a consequence, when using PV network from a domU on a system where
> >>> IOMMU is on from Dom0, I get:
> >>> 
> >>> (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0x8424cb148, fsynr=0xb0001, cb=0
> >>> [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
> >>> 
> >>> The fix is to go back to something along the lines of the old
> >>> implementation of gnttab_need_iommu_mapping.
> >>> 
> >>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >>> Fixes: 91d4eca7add
> >>> Backport: 4.12+
> >>> 
> >>> ---
> >>> 
> >>> Given the severity of the bug, I would like to request this patch to be
> >>> backported to 4.12 too, even if 4.12 is security-fixes only since Oct
> >>> 2020.
> >>> 
> >>> For the 4.12 backport, we can use iommu_enabled() instead of
> >>> is_iommu_enabled() in the implementation of gnttab_need_iommu_mapping.
> >>> 
> >>> Changes in v2:
> >>> - improve commit message
> >>> - add is_iommu_enabled(d) to the check
> >>> ---
> >>> xen/include/asm-arm/grant_table.h | 2 +-
> >>> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> 
> >>> diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/asm-arm/grant_table.h
> >>> index 6f585b1538..0ce77f9a1c 100644
> >>> --- a/xen/include/asm-arm/grant_table.h
> >>> +++ b/xen/include/asm-arm/grant_table.h
> >>> @@ -89,7 +89,7 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
> >>>    (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
> >>> 
> >>> #define gnttab_need_iommu_mapping(d)                    \
> >>> -    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
> >>> +    (is_domain_direct_mapped(d) && is_iommu_enabled(d))
> >>> 
> >>> #endif /* __ASM_GRANT_TABLE_H__ */
> >> 
> >> I tested the patch and while creating the guest I observed the below warning from Linux for block device.
> >> https://elixir.bootlin.com/linux/v4.3/source/drivers/block/xen-blkback/xenbus.c#L258
> > 
> > So you are creating a guest with "xl create" in dom0 and you see the
> > warnings below printed by the Dom0 kernel? I imagine the domU has a
> > virtual "disk" of some sort.
> 
> Yes you are right I am trying to create the guest with "xl create” and before that, I created the logical volume and trying to attach the logical volume
> block to the domain with “xl block-attach”. I observed this error with the "xl block-attach” command.
> 
> This issue occurs after applying this patch as what I observed this patch introduce the calls to iommu_legacy_{, un}map() to map the grant pages for
> IOMMU that touches the page-tables. I am not sure but what I observed is that something is written wrong when iomm_unmap calls unmap the pages
> because of that issue is observed.
> 
> You can reproduce the issue by just creating the dummy image file and try to attach it with “xl block-attach”
> 
> dd if=/dev/zero of=test.img bs=1024 count=0 seek=1024
> xl block-attach 0 phy:test.img xvda w
> 
> Sequence of command that I follow is as follows to reproduce the issue:  
> 
> lvs vg-xen/myguest
> lvcreate -y -L 4G -n myguest vg-xen
> parted -s /dev/vg-xen/myguest mklabel msdos
> parted -s /dev/vg-xen/myguest unit MB mkpart primary 1 4096
> sync
> xl block-attach 0 phy:/dev/vg-xen/myguest xvda w

Ah! You are block-attaching a device in dom0 to dom0! So frontend and
backend are both in the same domain, dom0. Yeah that is not supposed to
work, and if it did before it was just by coincidence :-)

There are a number of checks in Linux that wouldn't work as intended if
the page is coming from itself. This is not an ARM-only issue either.

I tried it with dom0, like you did, and I am seeing the same warning. I
did try to do block-attach to a domU and it works fine.

I don't think this is a concern.
--8323329-397500670-1612991620=:7114--

