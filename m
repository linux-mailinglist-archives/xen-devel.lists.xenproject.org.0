Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D51AC9785
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 00:03:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001559.1381690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL7oe-0004Ex-0c; Fri, 30 May 2025 22:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001559.1381690; Fri, 30 May 2025 22:03:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL7od-00049M-TC; Fri, 30 May 2025 22:03:03 +0000
Received: by outflank-mailman (input) for mailman id 1001559;
 Fri, 30 May 2025 22:03:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AEV3=YO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uL7ob-00045N-U8
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 22:03:01 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9ce75ef-3da1-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 00:03:00 +0200 (CEST)
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
X-Inumbo-ID: d9ce75ef-3da1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748642579; x=1748901779;
	bh=iPUmleCFsvrITwKm2hZTfj52siQkStuU3fBh5FtzFpc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=eUFDMHsReAHhsVb6mEWAoGSwmOPhOxgbZ89bJKSB4rF/mPfbckPgIyxjx57KYs4SS
	 T9SFaEwO1FiCduOoF2Fa8Vy3wS/YHO7jEak7Hc5THR45LTF0FJUege01ypKJ6XwwcL
	 fyFMkxtrLzjZmhZSbQ7kfDcleOSauL+QDb3HBXFufHgMNWBmSsOUXt5mEIR/N9RyHW
	 6Ls4gxUHkkBiQlY/wLfHF3XO/szRL2rvM4P4DKAtuxpy2v0dbF0wL5HTI00cUEtmTt
	 tyLwXD0YuWXQ/PYZklOdG/hxy6YJazYxL2mBQWc/FOBCSEZNEzG/1AiLN8lytYD4g7
	 fbLrpEB+NGcSA==
Date: Fri, 30 May 2025 22:02:53 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 1/2] xen/domain: introduce common hardware emulation flags
Message-ID: <20250530220242.63175-2-dmukhin@ford.com>
In-Reply-To: <20250530220242.63175-1-dmukhin@ford.com>
References: <20250530220242.63175-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: eff43a14659db603409c559c1c83455b004d1ee7
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
Changes since v3:
- added R-b
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
index 559d201e0c..dc4f917664 100644
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



