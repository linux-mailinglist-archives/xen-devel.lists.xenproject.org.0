Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E23ACBB66
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 21:18:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003773.1383387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMAfE-0008Vk-ER; Mon, 02 Jun 2025 19:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003773.1383387; Mon, 02 Jun 2025 19:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMAfE-0008Tw-BO; Mon, 02 Jun 2025 19:17:40 +0000
Received: by outflank-mailman (input) for mailman id 1003773;
 Mon, 02 Jun 2025 19:17:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+98=YR=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uMAfD-0008Fp-AN
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 19:17:39 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3eb2f106-3fe6-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 21:17:37 +0200 (CEST)
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
X-Inumbo-ID: 3eb2f106-3fe6-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=jgi3by2g5zbwtl2dhg6cnbz7oi.protonmail; t=1748891855; x=1749151055;
	bh=OFArnTWm3efKFTWaDQu3LAnnzQ21K9gfY4s1Z9E7fps=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=dTwG7dyQ8lFni+GPW4RKWIAEKIPqm1iyRPjJ7c7224iJOzxQwkSfXywH67ZkDCTmk
	 5cEgaHvS1/Xk9yGCpv3vvbu/cGHknXiNcauJvJ9GN2zB0IwFD8R8LjW7nPNgjZD72X
	 JN1qJpaDuoZhbXVnXBJtfFLMjLe9IrnqjnhRWu22rbwt1bg3z501YjvllNRCKS2RK9
	 bQRw2w6u6iXxIKln//eTry6O1xNyCsJim7F14ljmcP1OF1xtL6u31WIjR2GzacPvWc
	 0OxVt0woO74feQFjHM0gjIcE28L4bl6ldsLyJwf9LPslq/3Aid+BbfAvM4AA/mrWY5
	 FnRb7iwW+VqZg==
Date: Mon, 02 Jun 2025 19:17:30 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com
Subject: [PATCH v5 1/2] xen/domain: introduce common hardware emulation flags
Message-ID: <20250602191717.148361-2-dmukhin@ford.com>
In-Reply-To: <20250602191717.148361-1-dmukhin@ford.com>
References: <20250602191717.148361-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 44152c72659e4f4e74e9162f3f36e24325a91f72
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add common emulation_flags for configuring domain emulation features.

Print d->emulation_flags from 'q' keyhandler for better traceability while
debugging.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes since v4:
- kept Stefano's R-b
---
 xen/arch/x86/domain.c             |  2 +-
 xen/arch/x86/domctl.c             |  2 +-
 xen/arch/x86/include/asm/domain.h | 25 +++++++++++--------------
 xen/common/keyhandler.c           |  1 +
 xen/include/xen/sched.h           |  2 ++
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7536b6c871..0363ccb384 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -831,7 +831,7 @@ int arch_domain_create(struct domain *d,
                emflags);
         return -EOPNOTSUPP;
     }
-    d->arch.emulation_flags =3D emflags;
+    d->emulation_flags =3D emflags;
=20
 #ifdef CONFIG_PV32
     HYPERVISOR_COMPAT_VIRT_START(d) =3D
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 3044f706de..37d848f683 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -144,7 +144,7 @@ void arch_get_domain_info(const struct domain *d,
     if ( paging_mode_hap(d) )
         info->flags |=3D XEN_DOMINF_hap;
=20
-    info->arch_config.emulation_flags =3D d->arch.emulation_flags;
+    info->arch_config.emulation_flags =3D d->emulation_flags;
     info->gpaddr_bits =3D hap_paddr_bits;
 }
=20
diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/d=
omain.h
index 8c0dea12a5..eafd5cfc90 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -455,9 +455,6 @@ struct arch_domain
=20
     /* Don't unconditionally inject #GP for unhandled MSRs. */
     bool msr_relaxed;
-
-    /* Emulated devices enabled bitmap. */
-    uint32_t emulation_flags;
 } __cacheline_aligned;
=20
 #ifdef CONFIG_HVM
@@ -494,17 +491,17 @@ struct arch_domain
                                  X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
                                  X86_EMU_VPCI)
=20
-#define has_vlapic(d)      (!!((d)->arch.emulation_flags & X86_EMU_LAPIC))
-#define has_vhpet(d)       (!!((d)->arch.emulation_flags & X86_EMU_HPET))
-#define has_vpm(d)         (!!((d)->arch.emulation_flags & X86_EMU_PM))
-#define has_vrtc(d)        (!!((d)->arch.emulation_flags & X86_EMU_RTC))
-#define has_vioapic(d)     (!!((d)->arch.emulation_flags & X86_EMU_IOAPIC)=
)
-#define has_vpic(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIC))
-#define has_vvga(d)        (!!((d)->arch.emulation_flags & X86_EMU_VGA))
-#define has_viommu(d)      (!!((d)->arch.emulation_flags & X86_EMU_IOMMU))
-#define has_vpit(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIT))
-#define has_pirq(d)        (!!((d)->arch.emulation_flags & X86_EMU_USE_PIR=
Q))
-#define has_vpci(d)        (!!((d)->arch.emulation_flags & X86_EMU_VPCI))
+#define has_vlapic(d)      (!!((d)->emulation_flags & X86_EMU_LAPIC))
+#define has_vhpet(d)       (!!((d)->emulation_flags & X86_EMU_HPET))
+#define has_vpm(d)         (!!((d)->emulation_flags & X86_EMU_PM))
+#define has_vrtc(d)        (!!((d)->emulation_flags & X86_EMU_RTC))
+#define has_vioapic(d)     (!!((d)->emulation_flags & X86_EMU_IOAPIC))
+#define has_vpic(d)        (!!((d)->emulation_flags & X86_EMU_PIC))
+#define has_vvga(d)        (!!((d)->emulation_flags & X86_EMU_VGA))
+#define has_viommu(d)      (!!((d)->emulation_flags & X86_EMU_IOMMU))
+#define has_vpit(d)        (!!((d)->emulation_flags & X86_EMU_PIT))
+#define has_pirq(d)        (!!((d)->emulation_flags & X86_EMU_USE_PIRQ))
+#define has_vpci(d)        (!!((d)->emulation_flags & X86_EMU_VPCI))
=20
 #define gdt_ldt_pt_idx(v) \
       ((v)->vcpu_id >> (PAGETABLE_ORDER - GDT_LDT_VCPU_SHIFT))
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 0bb842ec00..cd731452ba 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -306,6 +306,7 @@ static void cf_check dump_domains(unsigned char key)
             if ( test_bit(i, &d->watchdog_inuse_map) )
                 printk("    watchdog %d expires in %d seconds\n",
                        i, (u32)((d->watchdog_timer[i].expires - NOW()) >> =
30));
+        printk("    emulation_flags %#x\n", d->emulation_flags);
=20
         arch_dump_domain_info(d);
=20
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index b17aada5f5..1393923986 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -651,6 +651,8 @@ struct domain
     unsigned int num_llc_colors;
     const unsigned int *llc_colors;
 #endif
+
+    uint32_t emulation_flags;
 } __aligned(PAGE_SIZE);
=20
 static inline struct page_list_head *page_to_list(
--=20
2.34.1



