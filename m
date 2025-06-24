Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB64AE5AB7
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:01:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022962.1398887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqH-0003ld-B9; Tue, 24 Jun 2025 04:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022962.1398887; Tue, 24 Jun 2025 04:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqH-0003gr-5F; Tue, 24 Jun 2025 04:01:05 +0000
Received: by outflank-mailman (input) for mailman id 1022962;
 Tue, 24 Jun 2025 04:01:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTum2-000639-16
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:56:42 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bdf5ff5-50af-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 05:56:40 +0200 (CEST)
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
X-Inumbo-ID: 3bdf5ff5-50af-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750737399; x=1750996599;
	bh=sQjr1X/MYLsD22+VDl+MPDWcSEB3K5kISaVn/vZXiZc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=b1UKBbzULeg7v54z7Ljx0Z2VGSOue5K5SfB0yMBtMo5kUuzLqPQzSRzovKOZHOO6M
	 XEfZGXLk/gHD7qNu+UBG1200PuQCdUI4WpK9GpR80v0hSUj20CynlwI10o7Mx7pa+W
	 Q/QvFBDaiysSBIY/ujsNxFa8WoTM5ZwFUNRHmZcsJgduvqBM2GKPAHwWNlEb+VMICa
	 hhKIsfjknRIypUH8rmNnoA88OgLqmvyVNnGKPUknShYXblDowddLL6ugQm4OTe0Zze
	 FHO4j1PECK3Hb8diDvzqrmdSMfq4FVtDm5VHMsb4VsIyWya3mnNvV0gYYEYMw4Px46
	 8uHpEY7CfmYZQ==
Date: Tue, 24 Jun 2025 03:56:34 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 11/16] xen/domain: introduce common emulation flags
Message-ID: <20250624035443.344099-12-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 46118646609cefd37d47d7fd8541f13c82208d7c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Add common emulation_flags for configuring domain emulation features.

Print d->emulation_flags from 'q' keyhandler for better traceability while
debugging.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Original patch: https://lore.kernel.org/r/20250602191717.148361-2-dmukhin@f=
ord.com
---
 xen/arch/x86/domain.c             |  2 +-
 xen/arch/x86/domctl.c             |  2 +-
 xen/arch/x86/include/asm/domain.h | 25 +++++++++++--------------
 xen/common/keyhandler.c           |  1 +
 xen/include/xen/sched.h           |  2 ++
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index d025befe3d8e..fc310b1164f4 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -881,7 +881,7 @@ int arch_domain_create(struct domain *d,
                emflags);
         return -EOPNOTSUPP;
     }
-    d->arch.emulation_flags =3D emflags;
+    d->emulation_flags =3D emflags;
=20
 #ifdef CONFIG_PV32
     HYPERVISOR_COMPAT_VIRT_START(d) =3D
diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 3044f706de1c..37d848f68339 100644
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
index 8c0dea12a526..eafd5cfc903d 100644
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
index b0a2051408d5..eccd97c565c6 100644
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
index fe53d4fab7ba..8b16efe6afd8 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -652,6 +652,8 @@ struct domain
     const unsigned int *llc_colors;
 #endif
=20
+    uint32_t emulation_flags;
+
     /* Console settings. */
     struct {
         /* Permission to take ownership of the physical console input. */
--=20
2.34.1



