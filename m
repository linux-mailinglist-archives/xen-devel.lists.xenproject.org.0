Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84482A47213
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897371.1306083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUc-0007Og-Em; Thu, 27 Feb 2025 02:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897371.1306083; Thu, 27 Feb 2025 02:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUc-0007MQ-7E; Thu, 27 Feb 2025 02:19:18 +0000
Received: by outflank-mailman (input) for mailman id 897371;
 Thu, 27 Feb 2025 02:19:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Uu1=VS=flex--seanjc.bounces.google.com=3ocu_ZwYKCXwxjfsohlttlqj.htr2js-ij0jqqnxyx.2jsuwtojhy.twl@srs-se1.protection.inumbo.net>)
 id 1tnTUZ-0005qU-VV
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:15 +0000
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [2607:f8b0:4864:20::649])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d0b7bca-f4b1-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 03:19:15 +0100 (CET)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-220e04e67e2so10180855ad.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:15 -0800 (PST)
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
X-Inumbo-ID: 3d0b7bca-f4b1-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622753; x=1741227553; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yramOYZYSvDmgSz8M8zEvByRhd31043Cze2FYqM0HuQ=;
        b=yblITf8yRGWXe63wTFOCFb9Dsu0I7Tt4DfGmxd5B+W/jefrV+XhwBI91lTrM28Oy6S
         g2RXqDSuRSPxy6mhvOAduy9must7/L9/QInYFypbxB8XqNvF+URdSuycgS6LRBzYVB1D
         P9faqfDYYIFCca5tCwvxdkkWUERPmXtBliR4e+/Dsfr3ILLqKXUj5oFWI0Px8jUzRj1A
         dK2M9YEr8En9DgCHy7mCYObuHfBcG1sEekkTPQcJ2UCyGBy3JLpD0w4s7GT73Hr2eHKf
         xDbPfiWMitG9fTmgi4d33NsC9x9tPoM6Uwfo0zch5JrZdDgLt5TSt2/sIaRQHcecmot9
         PLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622753; x=1741227553;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yramOYZYSvDmgSz8M8zEvByRhd31043Cze2FYqM0HuQ=;
        b=voiL6hXyITG8QDTV3Q44BqViCwH4GqbERmHNtREKjWlUHtefVhCy35SzNRhXjUozEH
         h4EHoG7SCqbo2rKLgWoSWPIvwjKTCPyouZoaGNnTHRDqWOcOmpUNaxEOBIKFasJzddik
         9VehfdvErm+quJ9gLoncwdkbE4jOGZ2GFG1IU0Sq4/EC5GAT4P5WRWxhvSQtdQ4WYuJB
         +JioAicLrAsN/VaomXQsgiz56tMs770IJeTM7z4GyaATHQndIWqP9TPmx0dhzu+ptwfJ
         IRKRpP3UdGtd92tZhJkE1D61nQBKFd0bmXUaz/AV4XKNY6MAnamD/CsoSlLf80KNjcwa
         cHnA==
X-Forwarded-Encrypted: i=1; AJvYcCVkZxaHpfB9mD7I8Pb8uZi+AndweijEWVCvOlPkzAkyvDoWrgOkML7jI/Ki61g55e6ma0jFyi77h8s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwcxmTCN6GRavLlw49kwAk4NiIIMlPrG6BoJUwC4M4AEiTJGhxs
	SPd8R5Oj5e2uUoVhok2UjRA8YRsGRqC07SIcY+e+cQnJO3yjNMtVtghamH/BvOnAiNZpfNtkXKF
	+ZA==
X-Google-Smtp-Source: AGHT+IEj/1REcONxv6g8r36LvNpCxOj7lRlC5Gm8UGTSETJJJpMqJ2Q+yEo6DBGNGx6TMjORq5yBRC/aLmE=
X-Received: from pfbf4.prod.google.com ([2002:a05:6a00:ad84:b0:730:94db:d304])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:dacc:b0:220:d6ac:b5a3
 with SMTP id d9443c01a7336-22320214b94mr83920905ad.51.1740622753535; Wed, 26
 Feb 2025 18:19:13 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:22 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-7-seanjc@google.com>
Subject: [PATCH v2 06/38] x86/tdx: Override PV calibration routines with
 CPUID-based calibration
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	John Stultz <jstultz@google.com>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When running as a TDX guest, explicitly override the TSC frequency
calibration routine with CPUID-based calibration instead of potentially
relying on a hypervisor-controlled PV routine.  For TDX guests, CPUID.0x15
is always emulated by the TDX-Module, i.e. the information from CPUID is
more trustworthy than the information provided by the hypervisor.

To maintain backwards compatibility with TDX guest kernels that use native
calibration, and because it's the least awful option, retain
native_calibrate_tsc()'s stuffing of the local APIC bus period using the
core crystal frequency.  While it's entirely possible for the hypervisor
to emulate the APIC timer at a different frequency than the core crystal
frequency, the commonly accepted interpretation of Intel's SDM is that APIC
timer runs at the core crystal frequency when that latter is enumerated via
CPUID:

  The APIC timer frequency will be the processor=E2=80=99s bus clock or cor=
e
  crystal clock frequency (when TSC/core crystal clock ratio is enumerated
  in CPUID leaf 0x15).

If the hypervisor is malicious and deliberately runs the APIC timer at the
wrong frequency, nothing would stop the hypervisor from modifying the
frequency at any time, i.e. attempting to manually calibrate the frequency
out of paranoia would be futile.

Deliberately leave the CPU frequency calibration routine as is, since the
TDX-Module doesn't provide any guarantees with respect to CPUID.0x16.

Opportunistically add a comment explaining that CoCo TSC initialization
needs to come after hypervisor specific initialization.

Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/coco/tdx/tdx.c    | 30 +++++++++++++++++++++++++++---
 arch/x86/include/asm/tdx.h |  2 ++
 arch/x86/kernel/tsc.c      |  8 ++++++++
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 32809a06dab4..42cdaa98dc5e 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -8,6 +8,7 @@
 #include <linux/export.h>
 #include <linux/io.h>
 #include <linux/kexec.h>
+#include <asm/apic.h>
 #include <asm/coco.h>
 #include <asm/tdx.h>
 #include <asm/vmx.h>
@@ -1063,9 +1064,6 @@ void __init tdx_early_init(void)
=20
 	setup_force_cpu_cap(X86_FEATURE_TDX_GUEST);
=20
-	/* TSC is the only reliable clock in TDX guest */
-	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
-
 	cc_vendor =3D CC_VENDOR_INTEL;
=20
 	/* Configure the TD */
@@ -1122,3 +1120,29 @@ void __init tdx_early_init(void)
=20
 	tdx_announce();
 }
+
+static unsigned long tdx_get_tsc_khz(void)
+{
+	struct cpuid_tsc_info info;
+
+	if (WARN_ON_ONCE(cpuid_get_tsc_freq(&info)))
+		return 0;
+
+	lapic_timer_period =3D info.crystal_khz * 1000 / HZ;
+
+	return info.tsc_khz;
+}
+
+void __init tdx_tsc_init(void)
+{
+	/* TSC is the only reliable clock in TDX guest */
+	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+
+	/*
+	 * Override the PV calibration routines (if set) with more trustworthy
+	 * CPUID-based calibration.  The TDX module emulates CPUID, whereas any
+	 * PV information is provided by the hypervisor.
+	 */
+	tsc_register_calibration_routines(tdx_get_tsc_khz, NULL);
+}
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index b4b16dafd55e..621fbdd101e2 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -53,6 +53,7 @@ struct ve_info {
 #ifdef CONFIG_INTEL_TDX_GUEST
=20
 void __init tdx_early_init(void);
+void __init tdx_tsc_init(void);
=20
 void tdx_get_ve_info(struct ve_info *ve);
=20
@@ -72,6 +73,7 @@ void __init tdx_dump_td_ctls(u64 td_ctls);
 #else
=20
 static inline void tdx_early_init(void) { };
+static inline void tdx_tsc_init(void) { }
 static inline void tdx_safe_halt(void) { };
=20
 static inline bool tdx_early_handle_ve(struct pt_regs *regs) { return fals=
e; }
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 6a011cd1ff94..472d6c71d3a5 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -32,6 +32,7 @@
 #include <asm/topology.h>
 #include <asm/uv/uv.h>
 #include <asm/sev.h>
+#include <asm/tdx.h>
=20
 unsigned int __read_mostly cpu_khz;	/* TSC clocks / usec, not used here */
 EXPORT_SYMBOL(cpu_khz);
@@ -1563,8 +1564,15 @@ void __init tsc_early_init(void)
 	if (is_early_uv_system())
 		return;
=20
+	/*
+	 * Do CoCo specific "secure" TSC initialization *after* hypervisor
+	 * platform initialization so that the secure variant can override the
+	 * hypervisor's PV calibration routine with a more trusted method.
+	 */
 	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
 		snp_secure_tsc_init();
+	else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
+		tdx_tsc_init();
=20
 	if (!determine_cpu_tsc_frequencies(true))
 		return;
--=20
2.48.1.711.g2feabab25a-goog


