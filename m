Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /R9QOWVrRWqp/goAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7906F0E09
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 21:32:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=MkWv0KXC;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=google.com
Received: from list by lists.xenproject.org with outflank-mailman.1350375.1607901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fs-0001iJ-9I; Wed, 01 Jul 2026 19:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1350375.1607901; Wed, 01 Jul 2026 19:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wf0fr-0001a3-Tj; Wed, 01 Jul 2026 19:32:43 +0000
Received: by outflank-mailman (input) for mailman id 1350375;
 Wed, 01 Jul 2026 19:32:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3VmtFagYKCZsN95IE7BJJBG9.7JHS9I-89Q9GGDNON.S9IKMJE97O.JMB@flex--seanjc.bounces.google.com>)
 id 1wf0fp-00014U-4i
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 19:32:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wf0fo-00B3ua-Ho
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 21:32:40 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3VmtFagYKCZsN95IE7BJJBG9.7JHS9I-89Q9GGDNON.S9IKMJE97O.JMB@flex--seanjc.bounces.google.com>)
 id 6a456b2a-5cb7-0a2a0a5109dd-0a2a450184e4-20
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:40 +0200
Received: from [209.85.215.202] (helo=mail-pg1-f202.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3VmtFagYKCZsN95IE7BJJBG9.7JHS9I-89Q9GGDNON.S9IKMJE97O.JMB@flex--seanjc.bounces.google.com>)
 id 6a456b57-400f-0a2a45010019-d155d7cabc2b-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 21:32:40 +0200
Received: by mail-pg1-f202.google.com with SMTP id
 41be03b00d2f7-c89704da8c7so1485718a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 12:32:39 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782934358; x=1783539158; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dPlSt+N6Lt/Y9ZvBDGnN+olGzf3s7mk8869JKIa0HY=;
        b=MkWv0KXC4MXx6lGf//onmiIqh4yNwvQDXfcA2irvSslqrWxpkVO2AQG2SHgvRLeKND
         xKFW4TMiXR4aqkmmS70BFTQW1muy4PT2/9/m6M3sff8IMcfGI2XJaZy+k+Ne3p3M172d
         JBWpgEqqipqXxNyS+aTPrdHrkqkvLfXKcOx+28orrpACwbKyKAnecDI9pcjAFA0j6Bcd
         XcAt7M6irExNt8aKY8sajLYg+ABjTJtyLkLYZVZUfoaF+1QUFL0anBbz/aRktlytvkmK
         MFDyKvV6CJuU68aStM+KniqZJcyL2C7KCd7qNRugVucRoQyfp0dU69HfuZOt//EhVCIB
         NZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934358; x=1783539158;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5dPlSt+N6Lt/Y9ZvBDGnN+olGzf3s7mk8869JKIa0HY=;
        b=I4V4xejZrMqrJoxpos/IBM65flAzDyv8iYUNX9XS4sGa9Bd/1WgWZastUdNm2/KQ2e
         ETfvwrrSY+kVRxVicBjTufXHQXhcWdRfPEq35Xq7xFDCuI4WHKWdF+AJuu4N34eW6Grt
         BxfzZoRvaNcE/wUj54549Kyb7BmG4uHMD7Ud4nYZPXu+rwGFAAIuPw3SKSeXXzLNlemv
         SZmaYZ9WiEooff02STzeD/GvaiSQj1bODEzCfjI+E+snNuPGWM5p4xmrkYpGaEFYg9jH
         dWmjb39daaVq684qW8lChgulMIh5OFbKBWQounbPoh3oU6jpIiUWbVj1V3jTs5PFPl2v
         d2XA==
X-Forwarded-Encrypted: i=1; AFNElJ9ySgVDKW+YAMoOb2KW2j7br4eTbdCtDSYDYaFogGwtP99q48iCWzFzN5dZfKO7CBiHbGyoGcw/e+A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQb73iRe7wwEhIR1iwOmot+KvcigpGVIo5ILwVU7ZjE/sppkaj
	Z5uFeNC7ri8TwfOgQYS0zz1lPTRVR3icU8Iz8rUJsBD0CMEDRNvEED/vLph57p35v4RgsYPsqY6
	ISYQjiw==
X-Received: from pgmo11.prod.google.com ([2002:a63:5d4b:0:b0:c9e:63b8:11b5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d10e:b0:3b4:61f:1fec
 with SMTP id adf61e73a8af0-3bfed1c323amr3402841637.2.1782934358113; Wed, 01
 Jul 2026 12:32:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  1 Jul 2026 12:31:31 -0700
In-Reply-To: <20260701193212.749551-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260701193212.749551-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260701193212.749551-11-seanjc@google.com>
Subject: [PATCH v5 10/51] x86/tdx: Force TSC frequency with CPUID-based info
 provided by the TDX-Module
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, "K. Y. Srinivasan" <kys@microsoft.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, John Stultz <jstultz@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
	xen-devel@lists.xenproject.org, Tom Lendacky <thomas.lendacky@amd.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, David Woodhouse <dwmw@amazon.co.uk>, 
	David Woodhouse <dwmw2@infradead.org>, Michael Kelley <mhklinux@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1782934360-800EC1E0-D0B58536/0/0
X-purgate-type: clean
X-purgate-size: 6605
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,zytor.com,redhat.com,broadcom.com,oracle.com,kernel.org,vger.kernel.org,lists.linux.dev,lists.xenproject.org,amd.com,amazon.co.uk,infradead.org,outlook.com,linutronix.de];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:pbonzini@redhat.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:kas@kernel.org,m:rick.p.edgecombe@intel.com,m:seanjc@google.com,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ajay.kaher@broadcom.com,m:alexey.makhalov@broadcom.com,m:jan.kiszka@siemens.com,m:luto@kernel.org,m:peterz@infradead.org,m:jgross@suse.com,m:daniel.lezcano@kernel.org,m:jstultz@google.com,m:skhan@linuxfoundation.org,m:hpa@zytor.com,m:vkuznets@redhat.com,m:bcm-kernel-feedback-list@broadcom.com,m:boris.ostrovsky@oracle.com,m:sboyd@kernel.org,m:linux-doc@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-coco@lists.linux.dev,m:linux-hyperv@vger.kernel.org,m:virtualization@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:thomas.lendacky@amd.com,m:nikunj@amd.com,m:dwmw@amazon.co.uk,m:dwmw2@infradead.org,m:mhklinux@outlook.com
 ,m:tglx@linutronix.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[42];
	FORGED_SENDER(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[seanjc@google.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[seanjc@google.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B7906F0E09

When running as a TDX guest, explicitly set the TSC frequency to a known
value, using CPUID-based information, instead of potentially relying on a
hypervisor-controlled PV routine.  For TDX guests, CPUID.0x15 is always
emulated by the TDX-Module, i.e. the information from CPUID is more
trustworthy than the information provided by the hypervisor.

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

Deliberately leave CPU frequency calibration as is, since the TDX-Module
doesn't provide any guarantees with respect to CPUID.0x16.

Expose and use cpuid_get_tsc_info() instead of providing a wrapper to
get the TSC and core crystal frequency, as TDX is the only anticipated
user outside of the TSC code, i.e. adding a helper to dedup the math won't
actually dedup anything.  Having TDX use "struct cpuid_tsc_info" also
avoids the temptation of declaring a local "tsc_khz" variable and thus
unintentionally creating a shadow of the global "tsc_khz".

Cc: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../admin-guide/kernel-parameters.txt         |  4 ++--
 arch/x86/coco/tdx/tdx.c                       | 20 ++++++++++++++++---
 arch/x86/include/asm/tdx.h                    |  2 ++
 arch/x86/include/asm/tsc.h                    |  7 +++++++
 arch/x86/kernel/tsc.c                         | 11 ++++------
 5 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentatio=
n/admin-guide/kernel-parameters.txt
index 181149f633c3..490e6aa72fc2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7947,8 +7947,8 @@ Kernel parameters
 			Format: <unsigned int>
=20
 			Note, tsc_early_khz is ignored if the TSC frequency is
-			provided by trusted firmware when running as an SNP
-			guest.
+			provided by trusted firmware when running as an SNP or
+			TDX guest.
=20
 	tsx=3D		[X86] Control Transactional Synchronization
 			Extensions (TSX) feature in Intel processors that
diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index 29b6f1ed59ec..ae2d35f2ef33 100644
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
@@ -1123,9 +1124,6 @@ void __init tdx_early_init(void)
=20
 	setup_force_cpu_cap(X86_FEATURE_TDX_GUEST);
=20
-	/* TSC is the only reliable clock in TDX guest */
-	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
-
 	cc_vendor =3D CC_VENDOR_INTEL;
=20
 	/* Configure the TD */
@@ -1195,3 +1193,19 @@ void __init tdx_early_init(void)
=20
 	tdx_announce();
 }
+
+unsigned int __init tdx_tsc_init(void)
+{
+	struct cpuid_tsc_info info;
+
+	if (WARN_ON_ONCE(cpuid_get_tsc_info(&info) || !info.crystal_khz))
+		return 0;
+
+	apic_set_timer_period_khz(info.crystal_khz, "TDX-Module via CPUID");
+
+	/* TSC is the only reliable clock in TDX guest */
+	setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
+	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
+
+	return info.crystal_khz * info.numerator / info.denominator;
+}
diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 89e97d5761d8..d23ff06db41a 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -68,6 +68,7 @@ struct ve_info {
 #ifdef CONFIG_INTEL_TDX_GUEST
=20
 void __init tdx_early_init(void);
+unsigned int __init tdx_tsc_init(void);
=20
 void tdx_get_ve_info(struct ve_info *ve);
=20
@@ -89,6 +90,7 @@ void __init tdx_dump_td_ctls(u64 td_ctls);
 #else
=20
 static inline void tdx_early_init(void) { };
+static inline unsigned int tdx_tsc_init(void) { return 0; }
 static inline void tdx_halt(void) { };
=20
 static inline bool tdx_early_handle_ve(struct pt_regs *regs) { return fals=
e; }
diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index 4d2d2f21ff06..b6b86e24e1bf 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -82,6 +82,13 @@ static inline cycles_t get_cycles(void)
 }
 #define get_cycles get_cycles
=20
+struct cpuid_tsc_info {
+	unsigned int denominator;
+	unsigned int numerator;
+	unsigned int crystal_khz;
+};
+extern int cpuid_get_tsc_info(struct cpuid_tsc_info *info);
+
 extern void tsc_early_init(void);
 extern void tsc_init(void);
 extern void mark_tsc_unstable(char *reason);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 12043812c8f5..86384a83a5f6 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -34,6 +34,7 @@
 #include <asm/topology.h>
 #include <asm/uv/uv.h>
 #include <asm/sev.h>
+#include <asm/tdx.h>
=20
 unsigned int __read_mostly cpu_khz;	/* TSC clocks / usec, not used here */
 EXPORT_SYMBOL(cpu_khz);
@@ -645,13 +646,7 @@ static unsigned long quick_pit_calibrate(void)
 	return delta;
 }
=20
-struct cpuid_tsc_info {
-	unsigned int denominator;
-	unsigned int numerator;
-	unsigned int crystal_khz;
-};
-
-static int cpuid_get_tsc_info(struct cpuid_tsc_info *info)
+int cpuid_get_tsc_info(struct cpuid_tsc_info *info)
 {
 	unsigned int ecx_hz, edx;
=20
@@ -1529,6 +1524,8 @@ void __init tsc_early_init(void)
=20
 	if (cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
 		known_tsc_khz =3D snp_secure_tsc_init();
+	else if (boot_cpu_has(X86_FEATURE_TDX_GUEST))
+		known_tsc_khz =3D tdx_tsc_init();
=20
 	/*
 	 * Ignore the user-provided TSC frequency if the exact frequency was
--=20
2.55.0.rc0.799.gd6f94ed593-goog


