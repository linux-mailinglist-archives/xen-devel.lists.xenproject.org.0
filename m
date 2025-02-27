Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E3AA4721A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 03:19:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897367.1306043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUW-0006Lw-7i; Thu, 27 Feb 2025 02:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897367.1306043; Thu, 27 Feb 2025 02:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnTUW-0006J7-2h; Thu, 27 Feb 2025 02:19:12 +0000
Received: by outflank-mailman (input) for mailman id 897367;
 Thu, 27 Feb 2025 02:19:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2ipX=VS=flex--seanjc.bounces.google.com=3msu_ZwYKCXUlXTgcVZhhZeX.VhfqXg-WXoXeeblml.qXgikhcXVm.hkZ@srs-se1.protection.inumbo.net>)
 id 1tnTUU-00063X-99
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 02:19:10 +0000
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com
 [2607:f8b0:4864:20::1049])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38b008da-f4b1-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 03:19:07 +0100 (CET)
Received: by mail-pj1-x1049.google.com with SMTP id
 98e67ed59e1d1-2fc4dc34291so1060409a91.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 18:19:07 -0800 (PST)
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
X-Inumbo-ID: 38b008da-f4b1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740622746; x=1741227546; darn=lists.xenproject.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwfv1w4tsOCmi3NCgULhIMD4IZcsOFfau2ULDYaMRLg=;
        b=N1qfhRChPdcad4Avh2DERSe+cjhEEl7TUjETVBdCtu8HuwYGn+OGofPczp6jyG0XG5
         qWONUxxJOcY/ZM8xSR7cXuAb+fKheA4B53nwqWZKe9pgoFc7z7dOSknTVrIUz9NaUDlf
         NQSFhl49AxbqZgsI2DbjbCpr8+3JJnDRf1z+3ay9bMPFrTaLJpAkKFSLiw9w1aeF4q2V
         Uc+N6H0E1gK7KNiRwrzCQ/j/M3SE8/84GgI3jWnrpdZY6XvyCOICovIUbkqFolxH/OH7
         vvFEKngbFmGw2x+vk2fqjyt0Mo/DRGHPczUOfQps9Ahvh0N8RUR+qC+VMoKkzublphFI
         pJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622746; x=1741227546;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dwfv1w4tsOCmi3NCgULhIMD4IZcsOFfau2ULDYaMRLg=;
        b=tTy7M2VTH35fWjiEgUatkdGZwu1i4qjm2//1MjNHKMal/Akjq/9g60qRfdZ267q5LF
         ib1hMFxKOW9tXGwehO3zno8nGf/ewVXQCKJbnwx6CMUMfGxXBGDKoecD92fiBwPrfb3C
         egW5rohMLZ0ewKItjmQkrx35xIrEPrbyYmV1eRfyjpt5QGBVz4Bx5vqjfG0KHNksAjQL
         auO5X9KbRMg+24R6PZGT2V/dTFuNQw35PVryt6biaRFC1f1DZe6rfjsL/ni0sOJNx088
         CjLTaNmLrK+98z3mHkOz6iZSabZkkZz6qrJPPsKL3bUbBW0jZtm0bPfVGof+AbSyFOHy
         uWFQ==
X-Forwarded-Encrypted: i=1; AJvYcCX11zNIkKgYzwpthKLwbWC3s4W82QYAkNTe5OLdVvrDJ9zCgW7LEPlDkbnbeLQnZAPwZVPxPmeZKiQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdKN4I2h7lV4Xtve0komaWpLzeVMSV376cw3LziQo0+OmsoZYB
	C/6YGrbjsvvQFRWA9OvRiy3gjEflUkwI2W7Vls9b2z5+PCyQuhRDTpoz0sHVuE4WPYXTMXm39wf
	z8w==
X-Google-Smtp-Source: AGHT+IH6wZ/mGewjHTQw2W+siQpDLDG/G2QvagXg40e21ebxNRSjKEBR8DQxe4UjV6eqsE0kkd3QFpygjvI=
X-Received: from pjbsn14.prod.google.com ([2002:a17:90b:2e8e:b0:2fc:15bf:92f6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1d83:b0:2fc:3264:3666
 with SMTP id 98e67ed59e1d1-2fce7b221c3mr36215820a91.30.1740622746375; Wed, 26
 Feb 2025 18:19:06 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Feb 2025 18:18:18 -0800
In-Reply-To: <20250227021855.3257188-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250227021855.3257188-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250227021855.3257188-3-seanjc@google.com>
Subject: [PATCH v2 02/38] x86/tsc: Add standalone helper for getting CPU
 frequency from CPUID
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

Extract the guts of cpu_khz_from_cpuid() to a standalone helper that
doesn't restrict the usage to Intel CPUs.  This will allow sharing the
core logic with kvmclock, as (a) CPUID.0x16 may be enumerated alongside
kvmclock, and (b) KVM generally doesn't restrict CPUID based on vendor.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/tsc.h |  1 +
 arch/x86/kernel/tsc.c      | 37 +++++++++++++++++++++++--------------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index a4d84f721775..c3a14df46327 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -36,6 +36,7 @@ struct cpuid_tsc_info {
 };
 extern int cpuid_get_tsc_info(struct cpuid_tsc_info *info);
 extern int cpuid_get_tsc_freq(struct cpuid_tsc_info *info);
+extern int cpuid_get_cpu_freq(unsigned int *cpu_khz);
 
 extern void tsc_early_init(void);
 extern void tsc_init(void);
diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index 93713eb81f52..bb4619148161 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -688,6 +688,24 @@ int cpuid_get_tsc_freq(struct cpuid_tsc_info *info)
 	return 0;
 }
 
+int cpuid_get_cpu_freq(unsigned int *cpu_khz)
+{
+	unsigned int eax_base_mhz, ebx, ecx, edx;
+
+	*cpu_khz = 0;
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
 /**
  * native_calibrate_tsc - determine TSC frequency
  * Determine TSC frequency via CPUID, else return 0.
@@ -723,13 +741,8 @@ unsigned long native_calibrate_tsc(void)
 	 * clock, but we can easily calculate it to a high degree of accuracy
 	 * by considering the crystal ratio and the CPU speed.
 	 */
-	if (!info.crystal_khz && boot_cpu_data.cpuid_level >= CPUID_LEAF_FREQ) {
-		unsigned int eax_base_mhz, ebx, ecx, edx;
-
-		cpuid(CPUID_LEAF_FREQ, &eax_base_mhz, &ebx, &ecx, &edx);
-		info.crystal_khz = eax_base_mhz * 1000 *
-			info.denominator / info.numerator;
-	}
+	if (!info.crystal_khz && !cpuid_get_cpu_freq(&cpu_khz))
+		info.crystal_khz = cpu_khz * info.denominator / info.numerator;
 
 	if (!info.crystal_khz)
 		return 0;
@@ -756,19 +769,15 @@ unsigned long native_calibrate_tsc(void)
 
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
2.48.1.711.g2feabab25a-goog


