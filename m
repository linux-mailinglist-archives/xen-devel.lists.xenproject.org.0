Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E3687FFE3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 15:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695422.1085151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmalB-0006iy-2i; Tue, 19 Mar 2024 14:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695422.1085151; Tue, 19 Mar 2024 14:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmalA-0006gW-Vx; Tue, 19 Mar 2024 14:48:12 +0000
Received: by outflank-mailman (input) for mailman id 695422;
 Tue, 19 Mar 2024 14:48:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQvM=KZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmal9-0006Nt-61
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 14:48:11 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2d6c161-e5ff-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 15:48:07 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d28051376eso93189501fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 07:48:07 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 xi8-20020a170906dac800b00a46af0fbe83sm3335059ejb.76.2024.03.19.07.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 07:48:05 -0700 (PDT)
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
X-Inumbo-ID: b2d6c161-e5ff-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710859686; x=1711464486; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICFn6HYHLdztYm+7ek+tVrqiDg89lcf+qeTaqhK3dQQ=;
        b=vA+H0DpVgIXq7cG0ogY8kgL4iQIwDwK35jDccpAj5GYxqVk0eoUmkvoiKGMTH3OmzD
         7rkELJtae+DQoPRE5JUz0JJ6mYEkl0sEkbQEMpXBGBfytZgktUxD0xnK1Zk3ouiYPOc7
         fVACjSze1tQ2jy4MnqnGC2FM28n3FPQPQoUDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710859686; x=1711464486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICFn6HYHLdztYm+7ek+tVrqiDg89lcf+qeTaqhK3dQQ=;
        b=WugJ7tZYF4yWnt9eHzP7xs3I6w70lTwRukW77h2d1c4TLHzSXo73R3EN19qGoyhsVR
         Abxgba2OubjF44iYBUFk7uRpbD5+EM4nem7Tby3ukFX6lMfop+x2Gzmf7MGG0QWoybWV
         PGxrdSKV4+etkaUUAGm0U8SpWFrnkc0Ii+KjtiQPyMoF6pyb015JRiVwhZIcR26Ly084
         Y/taDLEPyie0+DIzD1ZZnlZPiIQzvdC8ycfNbA5TfUaSBBo2d4MwZ2/6iy2UF7tS+j4p
         idxT+aQVrVbAgBlee3sePGMBjhNjm2ibzUjAtJUeY5Geupe9dB7X2vaJoE9GaJoWIbpq
         EySQ==
X-Gm-Message-State: AOJu0Yyi/Sat+RaQA2S8dTabHz6Ur7Z6hY55DK/F3Cyi3zI8ctOEbZ8Z
	LKTkMYn5khvbQ8yKEVD3VxfUIAwokysRCUKJS0CuEgZzHiN5WguSe+HINGPBbC+Iwt9gY++nHOX
	D
X-Google-Smtp-Source: AGHT+IF5i5JE7N6DFA/B6ja5buYfxvVRqAa9umaE58q7GRlamTXFyPIexgPfCbnLDlBLo5TAMLMR0w==
X-Received: by 2002:a05:651c:50f:b0:2d4:6d56:4aa9 with SMTP id o15-20020a05651c050f00b002d46d564aa9mr10785801ljp.33.1710859685932;
        Tue, 19 Mar 2024 07:48:05 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86/boot: Fix setup_apic_nmi_watchdog() to fail more cleanly
Date: Tue, 19 Mar 2024 14:48:01 +0000
Message-Id: <20240319144802.3894710-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240319144802.3894710-1-andrew.cooper3@citrix.com>
References: <20240319144802.3894710-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, if the user requests the watchdog on the command line,
setup_apic_nmi_watchdog() will blindly assume that setting up the watchdog
worked.  Reuse nmi_perfctr_msr to identify when the watchdog has been set up.

Rearrange setup_p6_watchdog() to not set nmi_perfctr_msr until the sanity
checks are performed.  Turn setup_p4_watchdog() into a void function, matching
the others.

If the watchdog isn't set up, inform the user and override to NMI_NONE, which
will prevent check_nmi_watchdog() from claiming that all CPUs are stuck.

e.g.:

  (XEN) alt table ffff82d040697c38 -> ffff82d0406a97f0
  (XEN) Failed to configure NMI watchdog
  (XEN) Brought up 512 CPUs
  (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

This is all horrible code.
---
 xen/arch/x86/nmi.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 8994c50cb5e4..33f77a92047f 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -319,8 +319,6 @@ static void setup_p6_watchdog(unsigned counter)
 {
     unsigned int evntsel;
 
-    nmi_perfctr_msr = MSR_P6_PERFCTR(0);
-
     if ( !nmi_p6_event_width && current_cpu_data.cpuid_level >= 0xa )
         nmi_p6_event_width = MASK_EXTR(cpuid_eax(0xa), P6_EVENT_WIDTH_MASK);
     if ( !nmi_p6_event_width )
@@ -330,6 +328,8 @@ static void setup_p6_watchdog(unsigned counter)
          nmi_p6_event_width > BITS_PER_LONG )
         return;
 
+    nmi_perfctr_msr = MSR_P6_PERFCTR(0);
+
     clear_msr_range(MSR_P6_EVNTSEL(0), 2);
     clear_msr_range(MSR_P6_PERFCTR(0), 2);
 
@@ -345,13 +345,13 @@ static void setup_p6_watchdog(unsigned counter)
     wrmsr(MSR_P6_EVNTSEL(0), evntsel, 0);
 }
 
-static int setup_p4_watchdog(void)
+static void setup_p4_watchdog(void)
 {
     uint64_t misc_enable;
 
     rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
     if (!(misc_enable & MSR_IA32_MISC_ENABLE_PERF_AVAIL))
-        return 0;
+        return;
 
     nmi_perfctr_msr = MSR_P4_IQ_PERFCTR0;
     nmi_p4_cccr_val = P4_NMI_IQ_CCCR0;
@@ -374,13 +374,12 @@ static int setup_p4_watchdog(void)
     clear_msr_range(0x3E0, 2);
     clear_msr_range(MSR_P4_BPU_CCCR0, 18);
     clear_msr_range(MSR_P4_BPU_PERFCTR0, 18);
-        
+
     wrmsrl(MSR_P4_CRU_ESCR0, P4_NMI_CRU_ESCR0);
     wrmsrl(MSR_P4_IQ_CCCR0, P4_NMI_IQ_CCCR0 & ~P4_CCCR_ENABLE);
     write_watchdog_counter("P4_IQ_COUNTER0");
     apic_write(APIC_LVTPC, APIC_DM_NMI);
     wrmsrl(MSR_P4_IQ_CCCR0, nmi_p4_cccr_val);
-    return 1;
 }
 
 void setup_apic_nmi_watchdog(void)
@@ -395,8 +394,6 @@ void setup_apic_nmi_watchdog(void)
         case 0xf ... 0x19:
             setup_k7_watchdog();
             break;
-        default:
-            return;
         }
         break;
     case X86_VENDOR_INTEL:
@@ -407,14 +404,16 @@ void setup_apic_nmi_watchdog(void)
                               : CORE_EVENT_CPU_CLOCKS_NOT_HALTED);
             break;
         case 15:
-            if (!setup_p4_watchdog())
-                return;
+            setup_p4_watchdog();
             break;
-        default:
-            return;
         }
         break;
-    default:
+    }
+
+    if ( nmi_perfctr_msr == 0 )
+    {
+        printk(XENLOG_WARNING "Failed to configure NMI watchdog\n");
+        nmi_watchdog = NMI_NONE;
         return;
     }
 
-- 
2.30.2


