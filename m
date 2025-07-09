Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF75AFF565
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 01:30:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038765.1410989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZeDn-0001Vy-1I; Wed, 09 Jul 2025 23:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038765.1410989; Wed, 09 Jul 2025 23:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZeDm-0001UG-Ut; Wed, 09 Jul 2025 23:29:02 +0000
Received: by outflank-mailman (input) for mailman id 1038765;
 Wed, 09 Jul 2025 23:29:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Zb/=ZW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uZeDm-0001UA-5e
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 23:29:02 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d6b99a2-5d1c-11f0-a317-13f23c93f187;
 Thu, 10 Jul 2025 01:29:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C84146C70;
 Wed,  9 Jul 2025 23:28:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629EAC4CEF1;
 Wed,  9 Jul 2025 23:28:57 +0000 (UTC)
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
X-Inumbo-ID: 7d6b99a2-5d1c-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752103738;
	bh=qmdkP/O/VAnbV0NpOO3Ta8MAuG6Y0tSi6b/Ncuxw1Ss=;
	h=Date:From:To:cc:Subject:From;
	b=NnEfABId3Ndo68NaoLn7IXqZw5Kzrm22lJKggFGoYW0FPkBwQ8g0NQrtzE4g+6wuo
	 JFU8g2lHiy6ZD4Qvx26UZrQN8ZPuEU1dgpsTFoFKjlsGDYLJ84jnOvZWznrTKRYsBK
	 Xg68FWRhb8f4pMedtRbJcSNNCNfV+yXKN2Sm8RjzXjBGNv13THoB2z3vLoomeqVLeF
	 BhIlrYN7LpDV+4cYz0yztGT5X8ZpAG0DFjpyrp0CAt0nKpCO58Vg0iFQu6GdendfKN
	 GNKgSGNWJaYnbth2/ggjDicon0eqgM6wi2ocm3Pr01t4OPL9DY/RU3t0GSFjuYLaca
	 Y3roJ8v/7eJbw==
Date: Wed, 9 Jul 2025 16:28:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Rahul Singh <rahul.singh@arm.com>, jason.andryuk@amd.com, 
    stewart.hildebrand@amd.com
Subject: [RFC] xen/arm: fix arm_iommu_map_page after f9f6b22ab
Message-ID: <alpine.DEB.2.22.394.2507091613161.605088@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

Up until f9f6b22ab "xen/arm: Map ITS doorbell register to IOMMU page
tables" the only caller of iommu_map on ARM was grant_table.c which has
a specific usage model and restrictions as described by the in-code
comment in arm_iommu_map_page.

f9f6b22ab introduced a second caller to iommu_map on ARM:
vgic_v3_its_init_virtual. This specific statement in the
f9f6b22ab commit message is wrong:

"Note that the 1:1 check in arm_iommu_map_page remains for now, as
virtual ITSes are currently only created for hwdom where the doorbell
mapping is always 1:1."

Leading to crashes any time the hardware domain is not direct-mapped
(e.g. cache coloring and non-Dom0 hardware domain):

(XEN) Loading d1 initrd from 0000000045800000 to 
0x0000000048200000-0x000000004bdcd615
(XEN) Loading d1 DTB to 0x0000000048000000-0x00000000480005c4
(XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
(XEN) ----[ Xen-4.21-unstable  arm64  debug=y  Tainted: I      ]----
(XEN) CPU:    0
(XEN) PC:     00000a000024c758 arm_iommu_map_page+0x80/0x90
(XEN) LR:     00000a000024c750
(XEN) SP:     00000a000032fb70
(XEN) CPSR:   0000000080000249 MODE:64-bit EL2h (Hypervisor, handler)
(XEN)      X0: 0000000000000008  X1: 0000000000000000  X2: 0000000000000000
(XEN)      X3: 0000000000000001  X4: 00000a00002c98e0  X5: 0000000000000000
(XEN)      X6: 00008000ffffa710  X7: 00008000ffffa710  X8: 7f7f7f7f7f7f7f7f
(XEN)      X9: 0000000000000080 X10: 7f7f7f7f7f7f7f7f X11: 0101010101010101
(XEN)     X12: 0000000000000008 X13: 0000000000000020 X14: 0000000000000000
(XEN)     X15: ffffffffffffffff X16: 00000a000033cce8 X17: 0000000000000000
(XEN)     X18: 000000013e688d90 X19: 0000000000008090 X20: 0000000000000080
(XEN)     X21: 00008000f3a01000 X22: 0000000000008090 X23: 0000000000000080
(XEN)     X24: 0000000000008090 X25: 0000000000008090 X26: 0000000000000001
(XEN)     X27: 0000000000008090 X28: 0000000000000000  FP: 00000a000032fb70
(XEN)
(XEN)   VTCR_EL2: 0000000080043594
(XEN)  VTTBR_EL2: 000000013fdcb000
(XEN)
(XEN)  SCTLR_EL2: 0000000030cd183d
(XEN)    HCR_EL2: 0000000000000039
(XEN)  TTBR0_EL2: 000000004dd50000
(XEN)
(XEN)    ESR_EL2: 00000000f2000001
(XEN)  HPFAR_EL2: 0000000000000000
(XEN)    FAR_EL2: 0000000000000000
(XEN)
(XEN) Xen stack trace from sp=00000a000032fb70:
(XEN)    00000a000032fba0 00000a0000250884 0000000000000000 0000000000000000
(XEN)    00008000ffffa410 00008000f3a01000 00000a000032fc30 00000a0000288024
(XEN)    00008000f3a07010 00008000f3a01000 00008000ffffa410 0000000008080000
(XEN)    0000000008090040 00008000f3a01570 0000000000000010 0000000000000010
(XEN)    0000000000010040 3800000000000400 0000000000000010 00000a000032fc9c
(XEN)    0000000000008090 00008000f3a01150 00000a0000339388 00000a000033df80
(XEN)    00000a000032fca0 00000a0000285228 00008000f3a01000 0000000000000001
(XEN)    0000000000003800 0000000000000008 0000000000000000 0000000000000000
(XEN)    0000000000000001 0000000000000003 000000013e6c9950 000000013e6c9920
(XEN)    00008000f3a01000 0000000000000008 00000a000032fce0 00000a0000281dcc
(XEN)    00008000f3a01000 0000000000000100 00000a000032fce0 00000a0000281d40
(XEN)    0000000000000000 00000000000000ff 00000a000032fd10 00000a00002705a4
(XEN)    0000000000000000 00008000f3a01000 00000a000032fe08 00000a0000270578
(XEN)    00000a000032fd50 00000a00002055e8 00008000f3a01000 00000a000032fe08
(XEN)    0000000000000000 00000a00002053a8 00008000f3a01000 000000030032fda0
(XEN)    00000a000032fda0 00000a00002cf090 00008000fffed4c8 0000000000000003
(XEN)    0000000000000008 00000a00002f1bb8 0000000000000004 0000000000000048
(XEN)    19170c1f5f0cee0e 0000000000000002 00000a000032fe60 00000a00002eb588
(XEN)    0000000000000004 00000a00002bc000 00000a00002bd900 00000a00002b7c28
(XEN)    0000000000000004 0000000000000000 0000000000000000 0000000000000000
(XEN)    00000a000032fe20 00000000ffffffc8 000000030032fe60 0000000000000000
(XEN)    0000000000000000 0000012300000000 0000000100000000 00000040ffffffff
(XEN)    00000001ffffffff 0000000000000000 0000000200000000 0000000000000100
(XEN)    0000000000000000 00008000ffffa710 000000013e588620 00000a000020018c
(XEN)    000000004dc00000 fffff6004da00000 000000004de00000 0000000000001710
(XEN)    000000013e5887a0 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
(XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
(XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
(XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
(XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
(XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
(XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
(XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
(XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
(XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
(XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...

Credits go to Jason for spotting this problem.

It makes sense to generalize the arm_iommu_map_page function to be more
generic and unopinionated. The comment specific to the grant table can
live in grant-table.c instead.

Opinions?

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..5c841d4f17 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1274,8 +1274,14 @@ map_grant_ref(
         }
 
         /*
-         * We're not translated, so we know that dfns and mfns are
-         * the same things, so the IOMMU entry is always 1-to-1.
+         * Grant mappings can be used for DMA requests. The dev_bus_addr
+         * returned by the hypercall is the MFN (not the IPA). For
+         * device protected by an IOMMU, Xen needs to add a 1:1 mapping
+         * in the domain p2m to allow DMA request to work. This is only
+         * valid when the domain is directed mapped.
+         * 
+         * We're not translated, so we know that dfns and mfns are the
+         * same things, so the IOMMU entry is always 1-to-1.
          */
         if ( !(op->flags & GNTMAP_readonly) && node.cnt.wr == 1 )
             kind = IOMMUF_readable | IOMMUF_writable;
diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
index 5cb1987481..2585f2e526 100644
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -36,17 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
 {
     p2m_type_t t;
 
-    /*
-     * Grant mappings can be used for DMA requests. The dev_bus_addr
-     * returned by the hypercall is the MFN (not the IPA). For device
-     * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
-     * p2m to allow DMA request to work.
-     * This is only valid when the domain is directed mapped. Hence this
-     * function should only be used by gnttab code with gfn == mfn == dfn.
-     */
-    BUG_ON(!is_domain_direct_mapped(d));
-    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
-
     /* We only support readable and writable flags */
     if ( !(flags & (IOMMUF_readable | IOMMUF_writable)) )
         return -EINVAL;
@@ -57,7 +46,7 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
      * The function guest_physmap_add_entry replaces the current mapping
      * if there is already one...
      */
-    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
+    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(mfn)),
                                    IOMMUF_order(flags), t);
 }
 

