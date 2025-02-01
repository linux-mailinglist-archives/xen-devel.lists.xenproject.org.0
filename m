Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 575FEA2468D
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880052.1290229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34h-0003Dv-Ad; Sat, 01 Feb 2025 02:17:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880052.1290229; Sat, 01 Feb 2025 02:17:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34h-0003B6-7a; Sat, 01 Feb 2025 02:17:35 +0000
Received: by outflank-mailman (input) for mailman id 880052;
 Sat, 01 Feb 2025 02:17:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqwE=UY=flex--seanjc.bounces.google.com=3OoSdZwYKCfsvhdqmfjrrjoh.frp0hq-ghyhoolvwv.0hqsurmhfw.ruj@srs-se1.protection.inumbo.net>)
 id 1te34f-0002sH-OU
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:33 +0000
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com
 [2607:f8b0:4864:20::64a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1075438-e042-11ef-a0e6-8be0dac302b0;
 Sat, 01 Feb 2025 03:17:32 +0100 (CET)
Received: by mail-pl1-x64a.google.com with SMTP id
 d9443c01a7336-216728b170cso54748075ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:32 -0800 (PST)
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
X-Inumbo-ID: b1075438-e042-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376251; x=1738981051; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=E0C6rmJeK4TduAmeKIdyYwLof9bH1hCIL8jVX3VQ6HM=;
        b=2e4nEyp8XnyTG2PaDCpQeQiHQuvDrEt3vvWnFrny7qhab9Kc27JpbKVua8uQ+FwKko
         aUj96qOpKNGlnqxJohtiLUU1CcJESi0tSrOCcRkTwI1S88Z2Qwq2YBySRxKZ9i6JY3Gn
         L9ACnlNDyi967XSzaDku5IsDOq5kJIKWnklI9cOddXEsJXuL2ytyWOAuEcK8iBjnvip4
         l8mMV+zgqtXKXt8qNEPP+8U0D4e6E8BRgkN5unSkBOG2eBr9z+OsKu6f/rIwMNWzh0Eh
         6jV0TyYnKv+srObWeLUuGEHXwau2wpN5BDulZhU5fQOj7Q/M+CtQ+pGSUWAqOrPRp2+J
         fU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376251; x=1738981051;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0C6rmJeK4TduAmeKIdyYwLof9bH1hCIL8jVX3VQ6HM=;
        b=EtyWZWzThaZYgmOVJo/9mo/uvYYQuFhhNMUMWfXQ+CKv68/uhAk4Kgjf17lbOTsIiy
         lV8lzmjZ3E/WR1w8nyRqFFAEigI6K0d3AZz9evPXpcZBtTUNJSaZv6WieoZiyL5uNc2k
         rhSYxhzmTCumF65DxMfERqYpOGE+AwQYspm03ncV/6j7+yZTc779oEGqhj0yRdOkdhxF
         N1+bkQXux/FZUuNf3MzkZq5RMLnwaxzi9O0kfrN8h+KFoI7mL2/ZDoOYkjGr/0RMC1AA
         snrDBCGgNpxKOOSty3X3oyueT2/bhQKG3X+AGwjDbKGc/kx0JyMrQlwKGegJjscuySyl
         4g4w==
X-Forwarded-Encrypted: i=1; AJvYcCVdUfXpLBmCMPFTFgEUGByCcKdCxsTas5HGEOP2oKDoBUf29sBTtSfbx2f2L3RYOKCJW04ldqpmlFY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyLZm6Mywqflt/fdQ4Wnw87fyOFq7Mlg/sn2qvTMZvSEKhGvDPe
	wwMA47DL+iXD+gnOPgkmVxil+xHYzJ/5zIW8yYSOKgtQgUmqaP4WPpYnztN2XZ2c0qXDxs4vft4
	iXA==
X-Google-Smtp-Source: AGHT+IFlvWiOED1ZYXsClK6j8veie9a9mJfZCZQPkiq0i15PJ6F5P2kJWMXEZplyquyEAP3l8GbEgk3YB0s=
X-Received: from pghg16.prod.google.com ([2002:a63:e610:0:b0:ad0:f8ff:b90d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:6713:b0:1e0:d766:8da1
 with SMTP id adf61e73a8af0-1ed7a6e12f1mr21226332637.39.1738376250763; Fri, 31
 Jan 2025 18:17:30 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:04 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-3-seanjc@google.com>
Subject: [PATCH 02/16] x86/tsc: Add standalone helper for getting CPU
 frequency from CPUID
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Sean Christopherson <seanjc@google.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Extract the guts of cpu_khz_from_cpuid() to a standalone helper that
doesn't restrict the usage to Intel CPUs.  This will allow sharing the
core logic with kvmclock, as (a) CPUID.0x16 may be enumerated alongside
kvmclock, and (b) KVM generally doesn't restrict CPUID based on vendor.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tsc.h | 16 ++++++++++++++++
 arch/x86/kernel/tsc.c      | 21 ++++++---------------
 2 files changed, 22 insertions(+), 15 deletions(-)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index 14a81a66b37c..540e2a31c87d 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -69,6 +69,22 @@ static inline int cpuid_get_tsc_freq(unsigned int *tsc_khz,
 	return 0;
 }
 
+static inline int cpuid_get_cpu_freq(unsigned int *cpu_khz)
+{
+	unsigned int eax_base_mhz, ebx, ecx, edx;
+
+	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
+		return -ENOENT;
+
+	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
+
+	if (!eax_base_mhz)
+		return -ENOENT;
+
+	*cpu_khz = eax_base_mhz * 1000;
+	return 0;
+}
+
 extern void tsc_early_init(void);
 extern void tsc_init(void);
 extern void mark_tsc_unstable(char *reason);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index e3faa2b36910..4fc633ac5873 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -662,7 +662,7 @@ static unsigned long quick_pit_calibrate(void)
 unsigned long native_calibrate_tsc(void)
 {
 	unsigned int eax_denominator, ebx_numerator;
-	unsigned int crystal_khz;
+	unsigned int crystal_khz, cpu_khz;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return 0;
@@ -692,13 +692,8 @@ unsigned long native_calibrate_tsc(void)
 	 * clock, but we can easily calculate it to a high degree of accuracy
 	 * by considering the crystal ratio and the CPU speed.
 	 */
-	if (crystal_khz == 0 && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
-		unsigned int eax_base_mhz, ebx, ecx, edx;
-
-		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		crystal_khz = eax_base_mhz * 1000 *
-			eax_denominator / ebx_numerator;
-	}
+	if (crystal_khz == 0 && !cpuid_get_cpu_freq(&cpu_khz))
+		crystal_khz = cpu_khz * eax_denominator / ebx_numerator;
 
 	if (crystal_khz == 0)
 		return 0;
@@ -725,19 +720,15 @@ unsigned long native_calibrate_tsc(void)
 
 static unsigned long cpu_khz_from_cpuid(void)
 {
-	unsigned int eax_base_mhz, ebx_max_mhz, ecx_bus_mhz, edx;
+	unsigned int cpu_khz;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return 0;
 
-	if (boot_cpu_data.cpuid_level < CPUID_LEAF_FREQ)
+	if (cpuid_get_cpu_freq(&cpu_khz))
 		return 0;
 
-	eax_base_mhz = ebx_max_mhz = ecx_bus_mhz = edx = 0;
-
-	cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx_max_mhz, &ecx_bus_mhz, &edx);
-
-	return eax_base_mhz * 1000;
+	return cpu_khz;
 }
 
 /*
-- 
2.48.1.362.g079036d154-goog


