Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E221AB1768E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 21:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066268.1431479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYqg-00078x-NB; Thu, 31 Jul 2025 19:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066268.1431479; Thu, 31 Jul 2025 19:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYqg-00075w-K8; Thu, 31 Jul 2025 19:21:54 +0000
Received: by outflank-mailman (input) for mailman id 1066268;
 Thu, 31 Jul 2025 19:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhYqd-00075q-F1
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 19:21:52 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aad6a79-6e43-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 21:21:48 +0200 (CEST)
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
X-Inumbo-ID: 9aad6a79-6e43-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753989707; x=1754248907;
	bh=kCruUDXq5HF2kSnc48JXZZgLcUf+E//SCabRXJdb8sw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=W+GYRt9eCDyveUZDjlt1w71dtlkh8HiSfCVRGvnqAW89kYU+Js3YcaWU2yTrQBFsF
	 lCwqdJ95I4HfSzhUGZA/P0Xxs0VoI1w02ek3lXPiiopiAnkyjfzbK9UIJbrVMComeU
	 iCM/WUY+tGLHNfNimIruUVFauCePR6eUZ5aPFfXvwh8P9t00FiLZOe07D21EmyYRT0
	 1kCOuL2Afm+9smnuviy/VOyvOfXwVtbUEFFkPgj6JjToikzcUF6aTLz9n9obOmX9FP
	 4wT6pUdGyt01BPxHmK5wlHnko2QqrAx15SKwquOjsTvSb6Nnfy6oXiKgOyRvr4EWV9
	 x8rrGGKxWnNqA==
Date: Thu, 31 Jul 2025 19:21:43 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 1/8] xen/domain: introduce common emulation flags
Message-ID: <20250731192130.3948419-2-dmukhin@ford.com>
In-Reply-To: <20250731192130.3948419-1-dmukhin@ford.com>
References: <20250731192130.3948419-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4800da3837c08361cb4f9883d03a3eb87453d832
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
Original patch: https://lore.kernel.org/xen-devel/20250624035443.344099-12-=
dmukhin@ford.com/
---
 xen/arch/x86/domain.c             |  2 +-
 xen/arch/x86/domctl.c             |  2 +-
 xen/arch/x86/include/asm/domain.h | 25 +++++++++++--------------
 xen/common/keyhandler.c           |  1 +
 xen/include/xen/sched.h           |  2 ++
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 56c381618712..7fd4f7a831dc 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -863,7 +863,7 @@ int arch_domain_create(struct domain *d,
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
index fd5c9f933373..f423a0ef714c 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -652,6 +652,8 @@ struct domain
     unsigned int *llc_colors;
 #endif
=20
+    uint32_t emulation_flags;
+
     /* Console settings. */
     struct {
         /* Permission to take ownership of the physical console input. */
--=20
2.34.1



