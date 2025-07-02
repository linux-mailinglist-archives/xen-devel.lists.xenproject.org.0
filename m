Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6494AF5B57
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 16:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031263.1405044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeR-00085q-Lu; Wed, 02 Jul 2025 14:41:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031263.1405044; Wed, 02 Jul 2025 14:41:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWyeR-00084C-HQ; Wed, 02 Jul 2025 14:41:31 +0000
Received: by outflank-mailman (input) for mailman id 1031263;
 Wed, 02 Jul 2025 14:41:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4T1d=ZP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uWyeQ-0007qI-EB
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 14:41:30 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a35217b9-5752-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 16:41:28 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so5108940f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 07:41:28 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453823ad20bsm230946905e9.20.2025.07.02.07.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 07:41:27 -0700 (PDT)
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
X-Inumbo-ID: a35217b9-5752-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751467288; x=1752072088; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3UdrPpnVz1bdBWjp4Vfz0Zz3kJ6jFSf8VMOzn7gPgo=;
        b=InMruRehK2k/OPtI4mLwzj2kbC2g9nBjavXISjEjJcEBivDRH2QBZtYjmFSOfF5lSv
         si5Q945h0eAZMigbzqMZ9pwlR7ENNvYPNgbYUQ+sgof0UE8bnDXBqM2SMpjMYjsXqoak
         WlGAJeyGd6GplSFpcwxYQvOdkibVEYevLNkKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751467288; x=1752072088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3UdrPpnVz1bdBWjp4Vfz0Zz3kJ6jFSf8VMOzn7gPgo=;
        b=rimcvDNadWQDEsusvdShU225zJyIthv2NVDpokVi+HdaJS2fBnvwTgc6BrwlnQ/2ZV
         Kg/B2UvZSQan+tm4sY4qpq1EOt7ikJMQkwmdNhYSFEC6VaoR6D2VsiysqmrW76pH6a6J
         fERTOR/gg5obDEVcmB+LIFUp896C6DKTY7sFVFXswaQ1GnHIUEIonvbawcSTZ3+2rw94
         HPM7SxUAWuEXABj9Aoo4iyxqs3kYsFN2rqd4v7yFgRUSLa7W9XrJM6kNdhI6BIHBAUQq
         Ik4Fb8g19oaCN6yG7lFUJklrqatYhyRy11p8q63yHfaeV5EeBijwPC/KEz6kZDY88kIY
         8dpg==
X-Gm-Message-State: AOJu0YxjCkG4FK4+xGOqhYjuVU3PnEDPPiXVQWut8V7k8GJV6r7syCsK
	cSVCk88LRP5RZM52M91ujG+KtXfUcMi2djcZtyJmt5GX3G7FgvecKKiMz5c+BTS6GrqZOJHTW/W
	YuY8c++dSeA==
X-Gm-Gg: ASbGncs9HhJaT8q+eu7pzrgkQI8mUXQDQCfpa1IUbu4I3nUBrfSOvlsHv/YiroKeQLJ
	7jlIRHfwKfC18Ll+8fK0M5hojsKrm8QN7sGTY2XZwjz2IpiyffdSRlyaNTs/gaWYhrgUAr97bFF
	dJdvE1BBUMvuVHOSs4EDeJmeA/WxNXvvA9ffmJhmfFBXIavzhYKpDMbTzHR66k8e5+IQelG9q7d
	k3gEvJ1J/X8KfSAvG/meN9QgBbkeZjSJJFO4uK8viE/MUgiRbacf8yfR+/Z/4NnqseAJWARM2pF
	QsXZgD+gIORcmp/PsER6u+SSnf6VZGx6SioXwk/nEN7cBQ72pXJ0dZVUpYCwgbrXOrGYVR7rD4L
	utYOVMXIV1KB/Kwcd3H8+COb+tD0HKvNEHxE=
X-Google-Smtp-Source: AGHT+IE6XyKnf8Jg78X60Y8B4gr0ajIaNcDAjmJ4x4amxZW4xnl2pfGYH6o6v241bIRolL2YGjBIbw==
X-Received: by 2002:a05:6000:4023:b0:3af:1cba:1546 with SMTP id ffacd0b85a97d-3b1f80ed9b5mr2774898f8f.22.1751467287962;
        Wed, 02 Jul 2025 07:41:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/6] x86/idle: Convert force_mwait_ipi_wakeup to X86_BUG_MONITOR
Date: Wed,  2 Jul 2025 15:41:17 +0100
Message-Id: <20250702144121.1096448-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
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
index 141f0f0facf6..dbcb80d81db9 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -436,14 +436,8 @@ static int __init cf_check cpu_idle_key_init(void)
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


