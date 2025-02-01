Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7ED5A24688
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2025 03:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880051.1290219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34g-0002x6-0B; Sat, 01 Feb 2025 02:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880051.1290219; Sat, 01 Feb 2025 02:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1te34f-0002uz-QQ; Sat, 01 Feb 2025 02:17:33 +0000
Received: by outflank-mailman (input) for mailman id 880051;
 Sat, 01 Feb 2025 02:17:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iPih=UY=flex--seanjc.bounces.google.com=3OYSdZwYKCfougcpleiqqing.eqozgp-fgxgnnkuvu.zgprtqlgev.qti@srs-se1.protection.inumbo.net>)
 id 1te34e-0002if-AR
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2025 02:17:32 +0000
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [2607:f8b0:4864:20::104a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b016f918-e042-11ef-99a4-01e77a169b0f;
 Sat, 01 Feb 2025 03:17:30 +0100 (CET)
Received: by mail-pj1-x104a.google.com with SMTP id
 98e67ed59e1d1-2ef9dbeb848so4914044a91.0
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jan 2025 18:17:30 -0800 (PST)
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
X-Inumbo-ID: b016f918-e042-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376249; x=1738981049; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3q3VtWChJd6qluhOhoVrZUOxKE25zEDROrS3h+FyOz0=;
        b=2cdtKeHgV8lDsMWkW+92/WDsnBqRqMS+nQSUMyZQ4CHTWuje8OGotpb2Uxo+F8gIx7
         G4wrisslOvefx15K14WoeCI2PBRZl+fiLjRc9SVy/thBMBQPvqvoYmUHqASaehKRU7jh
         XVKKGjDrW1nbu54dcpWToHyhHLGYRp9Aglcda2Mzm4nkw/zBS7nRGs/9zNnlRHHPlCYX
         l+h+e7Jb7J/9/msCS3jX2abu4N62zpXBI0zxB3xZVw6wIEnNswpWdOl2dGvCxrk5xAT1
         +IWPf4rlpQ+JBN/L1f0jV5TGTSQoh+xBi5YsIf4j9wSZlIqNZHjbhZLF+sUddqfetM8Q
         j7mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376249; x=1738981049;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3q3VtWChJd6qluhOhoVrZUOxKE25zEDROrS3h+FyOz0=;
        b=u42JSpY3pBDv8PTmah86jdEZZ+aFof+38s/XtTh/y3aqBdR3q2xdXmIkjfw8ZYJt2l
         eEBSR7kbfgO4hEvdNyiZ22EAHF6HsONDnoyVIHBURzcvO06/Cae35WQ2/2JQY2a74UB7
         2wYvArIKRKG7bz1kYidZRL62yAGq/ZSQ7Q3EJDrSJ+LWgH4xPJ8JCjoFyi5HPx7kRwjY
         RjzEcYY7WTSI82H68SkTn8ylT7Fvzlmk03pGZNQH93jLvW/XAjgdFPTvtkeJj+zeDw0r
         c5hxKhNThIyrbKZcPQtlYSl1xDKvk4WJ+iFwQIgR+p8iQwmPugQCMyhIm9CEFemuH3ek
         uSRA==
X-Forwarded-Encrypted: i=1; AJvYcCXiVNaqtOXNl5zDcB09lYAy9xI128JlYsS9kOC4rNRXEttm2RZGh8dkneazWEpW5ws0O1//TqSycPI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxM4Sjltr7H8KQJfY+9jK6SDp873OyyCbdkuzB6sIAXOqyByiIj
	3cu2T32rep10vNGTHZP9U70oHF6Kk7LiXSzfFpDBWwEdvFRllD/JNybcnkHyJkKKIniTHol+7EV
	5wQ==
X-Google-Smtp-Source: AGHT+IGlJL+gh3dhTIPqGXIyfYqBO171NEVUqAKwIwg+mryw0iUEaDc1VWsrQ1YFiTTJEYVX1rRFTepD4XE=
X-Received: from pjbpx11.prod.google.com ([2002:a17:90b:270b:b0:2e9:5043:f55b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:fc46:b0:2ee:af31:a7b3
 with SMTP id 98e67ed59e1d1-2f83ab8c3edmr21370350a91.7.1738376249247; Fri, 31
 Jan 2025 18:17:29 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:03 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-2-seanjc@google.com>
Subject: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC info
 from CPUID.0x15
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

Extract retrieval of TSC frequency information from CPUID into standalone
helpers so that TDX guest support and kvmlock can reuse the logic.  Provide
a version that includes the multiplier math as TDX in particular does NOT
want to use native_calibrate_tsc()'s fallback logic that derives the TSC
frequency based on CPUID.0x16 when the core crystal frequency isn't known.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tsc.h | 41 ++++++++++++++++++++++++++++++++++++++
 arch/x86/kernel/tsc.c      | 14 ++-----------
 2 files changed, 43 insertions(+), 12 deletions(-)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index 94408a784c8e..14a81a66b37c 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -28,6 +28,47 @@ static inline cycles_t get_cycles(void)
 }
 #define get_cycles get_cycles
 
+static inline int cpuid_get_tsc_info(unsigned int *crystal_khz,
+				     unsigned int *denominator,
+				     unsigned int *numerator)
+{
+	unsigned int ecx_hz, edx;
+
+	if (boot_cpu_data.cpuid_level < CPUID_LEAF_TSC)
+		return -ENOENT;
+
+	*crystal_khz = *denominator = *numerator = ecx_hz = edx = 0;
+
+	/* CPUID 15H TSC/Crystal ratio, plus optionally Crystal Hz */
+	cpuid(CPUID_LEAF_TSC, denominator, numerator, &ecx_hz, &edx);
+
+	if (!*denominator || !*numerator)
+		return -ENOENT;
+
+	/*
+	 * Note, some CPUs provide the multiplier information, but not the core
+	 * crystal frequency.  The multiplier information is still useful for
+	 * such CPUs, as the crystal frequency can be gleaned from CPUID.0x16.
+	 */
+	*crystal_khz = ecx_hz / 1000;
+	return 0;
+}
+
+static inline int cpuid_get_tsc_freq(unsigned int *tsc_khz,
+				     unsigned int *crystal_khz)
+{
+	unsigned int denominator, numerator;
+
+	if (cpuid_get_tsc_info(tsc_khz, &denominator, &numerator))
+		return -ENOENT;
+
+	if (!*crystal_khz)
+		return -ENOENT;
+
+	*tsc_khz = *crystal_khz * numerator / denominator;
+	return 0;
+}
+
 extern void tsc_early_init(void);
 extern void tsc_init(void);
 extern void mark_tsc_unstable(char *reason);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 34dec0b72ea8..e3faa2b36910 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -661,25 +661,15 @@ static unsigned long quick_pit_calibrate(void)
  */
 unsigned long native_calibrate_tsc(void)
 {
-	unsigned int eax_denominator, ebx_numerator, ecx_hz, edx;
+	unsigned int eax_denominator, ebx_numerator;
 	unsigned int crystal_khz;
 
 	if (boot_cpu_data.x86_vendor != X86_VENDOR_INTEL)
 		return 0;
 
-	if (boot_cpu_data.cpuid_level < CPUID_LEAF_TSC)
+	if (cpuid_get_tsc_info(&crystal_khz, &eax_denominator, &ebx_numerator))
 		return 0;
 
-	eax_denominator = ebx_numerator = ecx_hz = edx = 0;
-
-	/* CPUID 15H TSC/Crystal ratio, plus optionally Crystal Hz */
-	cpuid(CPUID_LEAF_TSC, &eax_denominator, &ebx_numerator, &ecx_hz, &edx);
-
-	if (ebx_numerator == 0 || eax_denominator == 0)
-		return 0;
-
-	crystal_khz = ecx_hz / 1000;
-
 	/*
 	 * Denverton SoCs don't report crystal clock, and also don't support
 	 * CPUID_LEAF_FREQ for the calculation below, so hardcode the 25MHz
-- 
2.48.1.362.g079036d154-goog


