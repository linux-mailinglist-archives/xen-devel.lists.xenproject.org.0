Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0AA3117DD
	for <lists+xen-devel@lfdr.de>; Sat,  6 Feb 2021 01:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81999.151596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8BcT-0007OK-2W; Sat, 06 Feb 2021 00:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81999.151596; Sat, 06 Feb 2021 00:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8BcS-0007Nv-VY; Sat, 06 Feb 2021 00:38:36 +0000
Received: by outflank-mailman (input) for mailman id 81999;
 Sat, 06 Feb 2021 00:38:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8Bj=HI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l8BcQ-0007Nq-Qn
 for xen-devel@lists.xenproject.org; Sat, 06 Feb 2021 00:38:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f739bcf-dcd0-4450-ba04-385f4720d55c;
 Sat, 06 Feb 2021 00:38:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D82B64FEA;
 Sat,  6 Feb 2021 00:38:33 +0000 (UTC)
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
X-Inumbo-ID: 5f739bcf-dcd0-4450-ba04-385f4720d55c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612571913;
	bh=/K2eQTpPEn3hhRchfomiYUpVmHyLfVWO94ver0PRSKA=;
	h=Date:From:To:cc:Subject:From;
	b=gPxsO5UT8dIV5AMJKdeJsxtW8wortS8LIw1g/ewQcozPyQfTTqrK/phXWFVK0Jl7M
	 onyn710PQ0CArG5U8VF67vs5LAmZ0PxQxsouBuPOZfxdI2RbasiH/bb/Y7PvjGr7ZV
	 dyFL+XPCahGlmy7wPQ9E+D6pmAVX5rPf53UKmJE2GQvJSyyCPfDtYdGfocxfg8CCys
	 /SP1UfY2dVdh/ImB2BnmszyTilUPfOaWkz1oOcoI2xGR3dIVnFgaBjUx812CPfzBA7
	 c7E26HPQ0WhS5i/AqeIUeE9WBy0Ss/ZnN6t7F6IuhzsqegCv2Q0Tne7MfSdSTY995w
	 SGCYtJPQT9a5Q==
Date: Fri, 5 Feb 2021 16:38:32 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien@xen.org
cc: lucmiccio@gmail.com, sstabellini@kernel.org, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com
Subject: [PATCH] xen/arm: fix gnttab_need_iommu_mapping
Message-ID: <alpine.DEB.2.21.2102051604320.29047@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
The offending chunk is:

 #define gnttab_need_iommu_mapping(d)                    \
-    (is_domain_direct_mapped(d) && need_iommu(d))
+    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))

On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
directly mapped, like the old check did, but the new check is always
false.

In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
need_sync is set as:

    if ( !is_hardware_domain(d) || iommu_hwdom_strict )
        hd->need_sync = !iommu_use_hap_pt(d);

iommu_hwdom_strict is actually supposed to be ignored on ARM, see the
definition in docs/misc/xen-command-line.pandoc:

    This option is hardwired to true for x86 PVH dom0's (as RAM belonging to
    other domains in the system don't live in a compatible address space), and
    is ignored for ARM.

But aside from that, the issue is that iommu_use_hap_pt(d) is true,
hence, hd->need_sync is false, and gnttab_need_iommu_mapping(d) is false
too.

As a consequence, when using PV network from a domU on a system where
IOMMU is on from Dom0, I get:

(XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0x8424cb148, fsynr=0xb0001, cb=0
[   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK

The fix is to go back to the old implementation of
gnttab_need_iommu_mapping.  However, we don't even need to specify &&
need_iommu(d) since we don't actually need to check for the IOMMU to be
enabled (iommu_map does it for us at the beginning of the function.)

This fix is preferrable to changing the implementation of need_sync or
iommu_use_hap_pt because "need_sync" is not really the reason why we
want gnttab_need_iommu_mapping to return true.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Backport: 4.12+ 

---

It is incredible that it was missed for this long, but it takes a full
PV drivers test using DMA from a non-coherent device to trigger it, e.g.
wget from a domU to an HTTP server on a different machine, ping or
connections to dom0 won't trigger the bug.

It is interesting that given that IOMMU is on for dom0, Linux could
have just avoided using swiotlb-xen and everything would have just
worked. It is worth considering introducing a feature flag (e.g.
XENFEAT_ARM_dom0_iommu) to let dom0 know that the IOMMU is on and
swiotlb-xen is not necessary. Then Linux can avoid initializing
swiotlb-xen and just rely on the IOMMU for translation.

diff --git a/xen/include/asm-arm/grant_table.h b/xen/include/asm-arm/grant_table.h
index 6f585b1538..2a154d1851 100644
--- a/xen/include/asm-arm/grant_table.h
+++ b/xen/include/asm-arm/grant_table.h
@@ -88,8 +88,7 @@ int replace_grant_host_mapping(unsigned long gpaddr, mfn_t mfn,
 #define gnttab_status_gfn(d, t, i)                                       \
     (((i) >= nr_status_frames(t)) ? INVALID_GFN : (t)->arch.status_gfn[i])
 
-#define gnttab_need_iommu_mapping(d)                    \
-    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
+#define gnttab_need_iommu_mapping(d)  (is_domain_direct_mapped(d))
 
 #endif /* __ASM_GRANT_TABLE_H__ */
 /*

