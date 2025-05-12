Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34596AB3675
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 14:00:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981353.1367750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERpd-0001ky-AM; Mon, 12 May 2025 12:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981353.1367750; Mon, 12 May 2025 12:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uERpd-0001iG-7D; Mon, 12 May 2025 12:00:29 +0000
Received: by outflank-mailman (input) for mailman id 981353;
 Mon, 12 May 2025 12:00:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oz7/=X4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uERpb-0001i4-Vh
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 12:00:27 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0d4a3a1-2f28-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 14:00:26 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-440685d6afcso49085555e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 05:00:26 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f33b5sm12460480f8f.54.2025.05.12.05.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 05:00:24 -0700 (PDT)
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
X-Inumbo-ID: b0d4a3a1-2f28-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747051225; x=1747656025; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o9C25/zJkOBu3Gqsy7Zlw3kC1/MzrPAZCWFxQZ+xvH0=;
        b=HcDTe3MOPNcp+d2pVcD1FofJNUt6gl8tuQvSbcLnngEL2uuMKZ3I4WN162Q1uhkAyS
         V/L8XhPnBcIX9etzPospe8g58NuIail5vVvSBRRWpReTc7rDE162/PSeSxt2byeFzIsa
         PDBDhETnbPv9NiHnyEQ6aSb69lVkprbJm5QoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747051225; x=1747656025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o9C25/zJkOBu3Gqsy7Zlw3kC1/MzrPAZCWFxQZ+xvH0=;
        b=AkOv5HVHJRxuwE+IYeGh/SqMgv/sGX+yxlAgX4R8J8u5LRKzoJzn+2BE6cGhy+drHF
         DMTbXrNZS/IzBaVohqOOLT/ub9pSVFP6Q9Sws/SEowj2w3BH03NxwtEw6eHf4ooACY36
         IeZmoMu4Fqz7FtNXRTF0+2FnF86t4d/y9l2lARdgaSnc8nYY2YlJmFguTxoAexXsWxCV
         zVQT7bkuatIiTBS6anQQryRx05PDuHTP4Ma7LMnOw285l5HPamTt3Kb79rnDT86Hl2ht
         u671zqiRKogbq0BpnonGaYXvw4HrPhjqeuuPjPQTg/dvZG3AJMUFYNC/pDeGZ2UZapPs
         y3mg==
X-Gm-Message-State: AOJu0YwOfT3KwQb7atZ5/ZM5HU7Yb8y96e7PvLJtRjOPTySuakfPVYvO
	OAnXJbVJjeMqqvAX/jijr69b958vqnu1js75jNCn6bgOrfAFSLzTJZHPOcKVLFbCgrH1B74CSEB
	+
X-Gm-Gg: ASbGncvAYHiFw8wFHAexzrHCAkeyo2sIjpnMIbtassfoSogLN4UuWyXtaDQS+3o0LMa
	t027WYYymKZ7m7rV3Mo4us8PZoGScKE72pSkghM0ZxdvSE9VD1D7Q+8YPe8xl3Ix6+4P7uySNNn
	PSEOiFbCe0qK0pPL1POTuLyn1i+XF+1c2CeS7bhP5cFqWs28ozAzWvjQRfzrD+NNVFHAhgYPVy0
	VXc81vmLDEY7l0dGb8QVxwddcwyqWpeelYnXO2dkHsfUIA1/tg40hQ8Vued1CLMa3hIdjOlML1S
	oGHwOnZuVDczj6bbHDNhacFX+mTF6JkrwIzd7XrsSRipcz5X79EEQJ54frS+HJ9H1P4zEP8ZPNG
	Em5f18outQO3YaACJQA69OdJG
X-Google-Smtp-Source: AGHT+IEPYR4IRNTXWcqq94UhwJv9iE6hL37pLoU8EhyoZyHwEwnuQu782X7E0Zgx9cXdCy/i3Zxu4A==
X-Received: by 2002:a5d:588a:0:b0:3a0:b2ff:fb00 with SMTP id ffacd0b85a97d-3a1f64b4557mr8853139f8f.44.1747051225328;
        Mon, 12 May 2025 05:00:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/smp: Drop booting_cpu
Date: Mon, 12 May 2025 13:00:15 +0100
Message-Id: <20250512120015.3445217-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 434596bbd44a ("x86/smpboot: Write the top-of-stack block in
cpu_smpboot_alloc()"), smp_processor_id() is unconditionally usable on APs.
Drop the global variable.

Also drop the parameter from start_secondary().  It was introduced as unused
in commit e9ac3bbccab0 ("Move initial stack-pointer adjustment into assembly
bootstrap code.") in 2005.  At the time, the caller was a shared codepath with
__start_xen() with a parameter on the stack, but that never mattered for
start_secondary() which ultimately reset_stack_and_jump()'s out of context.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/smpboot.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 54207e6d8830..49e111018224 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -226,8 +226,6 @@ static void smp_callin(void)
         cpu_relax();
 }
 
-static int booting_cpu;
-
 /* CPUs for which sibling maps can be computed. */
 static cpumask_t cpu_sibling_setup_map;
 
@@ -315,15 +313,10 @@ static void set_cpu_sibling_map(unsigned int cpu)
     }
 }
 
-void asmlinkage start_secondary(void *unused)
+void asmlinkage start_secondary(void)
 {
     struct cpu_info *info = get_cpu_info();
-
-    /*
-     * Dont put anything before smp_callin(), SMP booting is so fragile that we
-     * want to limit the things done here to the most necessary things.
-     */
-    unsigned int cpu = booting_cpu;
+    unsigned int cpu = smp_processor_id();
 
     /* Critical region without IDT or TSS.  Any fault is deadly! */
 
@@ -571,8 +564,6 @@ static int do_boot_cpu(int apicid, int cpu)
      */
     mtrr_save_state();
 
-    booting_cpu = cpu;
-
     start_eip = bootsym_phys(entry_SIPI16);
 
     /* start_eip needs be page aligned, and below the 1M boundary. */
-- 
2.39.5


