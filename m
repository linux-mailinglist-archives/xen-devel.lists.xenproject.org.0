Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5111AF9868
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 18:34:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033541.1406893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMj-0005pW-0V; Fri, 04 Jul 2025 16:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033541.1406893; Fri, 04 Jul 2025 16:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXjMi-0005k9-RM; Fri, 04 Jul 2025 16:34:20 +0000
Received: by outflank-mailman (input) for mailman id 1033541;
 Fri, 04 Jul 2025 16:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FCR=ZR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXjMh-0005FA-FQ
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 16:34:19 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9c1b8db-58f4-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 18:34:16 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so932367f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 09:34:16 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9989fcesm59199345e9.16.2025.07.04.09.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 09:34:14 -0700 (PDT)
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
X-Inumbo-ID: b9c1b8db-58f4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751646855; x=1752251655; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5p9jnTI9OOKO89IBAp1RiVOJgBP+wGqib7qDxuX0FJc=;
        b=sxF7fjgd0qdWMpMEALperIkzhZpx001OGSF5TgMYRdijmcQc0XJSAlbwHVGMA+GTLR
         UF2690Rr26YlUToVUsvlwN8PmTOUy97zwMylJA9xdDiuQ3rleQKDUDryCTmgiUIDwNAI
         TtIrns6vDw9widtyftPnhqZPwsu/I8h52svcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646855; x=1752251655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5p9jnTI9OOKO89IBAp1RiVOJgBP+wGqib7qDxuX0FJc=;
        b=U0VbsuoBeVGzf7jBpV7lpuAO3aJaLm4wRu/2ZowmdhKEhnvvmVXFiphf1UVP3orNgf
         s9MHkaZF1q9+d4EpRVpFzXMCfqfT13/zPOMc/Cv1N1hOAK9BiOl5//xFtZ36Z3F6lAvI
         7jEvbeJeUWecBx/7gKdIulLpkWqFCPatwLkImYdknVUYC8sEA4VSn48c7jpDiUDnaiys
         nilKfrPPCpuJ7bQCQFx8Wlsc9YASnPHL5Yw5x2XIE32Z6a4ZUL840aID7h9AUWlNUBWG
         iF/F9NdiloD7QiSI9GpwrCQZ6fKzn9Bn5XqvNTcqcQKlam96rgYv3f9ku+yZ4yu2+sFc
         GSnw==
X-Gm-Message-State: AOJu0YzmjP0radV1OLFb89pqpYRzjW56IEq/lBIBTCt1/+ty/GY26s4s
	IfO4T+n1GHeGTYnWv89P1RH03O+yav04l61MisGfwkzob1p4IXvi0Qhc+JHgT2rfI/YUIOfkKOg
	jWkqHE0TjpQ==
X-Gm-Gg: ASbGncs7t7nZO0cXfK3kDXFf+Lvu1Be4w+TqUoAa7C9ZxzkDaJMyrKfHww+5wrzUEU7
	oXvnBxMQKgmeNSyHWfZeIhbTvAzjtr+hMntlgylgO+8zn1ieTsKtiFUQeaDVmh+wBqsCGRNEi5S
	JaYsA4991J2/ZHOJPa9F+Yx6ItWveUtUkmnHBLLjyAPsDk8Z5+MKnk62n/fN6oq6MsOAwxNAl6w
	mMBTDm1c6RCgZ06hUXJZt/4/5fE4eHEW3QNhDweyelgCrlT7mSubHDAvKFjIHy1GnyHbG+7ZT4w
	S2l1a+RSP//QA9+nb82gU7nyQc6NvEQPcIK4kg6sZcc7InqMeEXAra7zR3eqIWP8acWmY7LHyEs
	ldSpshtWoMLkLMcs/3r1lr6awomxxKInMLqg=
X-Google-Smtp-Source: AGHT+IHswtAm/LmWb7CmazSM1x7eZIHusL64Hapm3ly1PC5a9RGKAlsNjY7rapAh+P3ZPIq2zhHLLA==
X-Received: by 2002:adf:b643:0:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3b496607b62mr2103761f8f.34.1751646855260;
        Fri, 04 Jul 2025 09:34:15 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/6] x86/idle: Convert force_mwait_ipi_wakeup to X86_BUG_MONITOR
Date: Fri,  4 Jul 2025 17:34:07 +0100
Message-Id: <20250704163410.1412367-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
References: <20250704163410.1412367-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're going to want alternative-patch based on it.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/arch/x86/acpi/cpu_idle.c           | 6 ------
 xen/arch/x86/cpu/intel.c               | 2 +-
 xen/arch/x86/include/asm/cpufeatures.h | 1 +
 xen/arch/x86/include/asm/mwait.h       | 3 ---
 4 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 68dd44be5bb0..07056a91a29e 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -440,14 +440,8 @@ static int __init cf_check cpu_idle_key_init(void)
 }
 __initcall(cpu_idle_key_init);
 
-/* Force sending of a wakeup IPI regardless of mwait usage. */
-bool __ro_after_init force_mwait_ipi_wakeup;
-
 bool arch_skip_send_event_check(unsigned int cpu)
 {
-    if ( force_mwait_ipi_wakeup )
-        return false;
-
     return false;
 }
 
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 5215b5405c76..f7bd0d777289 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -436,7 +436,7 @@ static void __init probe_mwait_errata(void)
     {
         printk(XENLOG_WARNING
                "Forcing IPI MWAIT wakeup due to CPU erratum\n");
-        force_mwait_ipi_wakeup = true;
+        setup_force_cpu_cap(X86_BUG_MONITOR);
     }
 }
 
diff --git a/xen/arch/x86/include/asm/cpufeatures.h b/xen/arch/x86/include/asm/cpufeatures.h
index 84c93292c80c..56231b00f15d 100644
--- a/xen/arch/x86/include/asm/cpufeatures.h
+++ b/xen/arch/x86/include/asm/cpufeatures.h
@@ -53,6 +53,7 @@ XEN_CPUFEATURE(USE_VMCALL,        X86_SYNTH(30)) /* Use VMCALL instead of VMMCAL
 #define X86_BUG_CLFLUSH_MFENCE    X86_BUG( 2) /* MFENCE needed to serialise CLFLUSH */
 #define X86_BUG_IBPB_NO_RET       X86_BUG( 3) /* IBPB doesn't flush the RSB/RAS */
 #define X86_BUG_CLFLUSH_MONITOR   X86_BUG( 4) /* MONITOR requires CLFLUSH */
+#define X86_BUG_MONITOR           X86_BUG( 5) /* MONITOR doesn't always notice writes (force IPIs) */
 
 #define X86_SPEC_NO_LFENCE_ENTRY_PV X86_BUG(16) /* (No) safety LFENCE for SPEC_CTRL_ENTRY_PV. */
 #define X86_SPEC_NO_LFENCE_ENTRY_INTR X86_BUG(17) /* (No) safety LFENCE for SPEC_CTRL_ENTRY_INTR. */
diff --git a/xen/arch/x86/include/asm/mwait.h b/xen/arch/x86/include/asm/mwait.h
index c52cd3f51011..000a692f6d19 100644
--- a/xen/arch/x86/include/asm/mwait.h
+++ b/xen/arch/x86/include/asm/mwait.h
@@ -13,9 +13,6 @@
 
 #define MWAIT_ECX_INTERRUPT_BREAK	0x1
 
-/* Force sending of a wakeup IPI regardless of mwait usage. */
-extern bool force_mwait_ipi_wakeup;
-
 void mwait_idle_with_hints(unsigned int eax, unsigned int ecx);
 #ifdef CONFIG_INTEL
 bool mwait_pc10_supported(void);
-- 
2.39.5


