Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A7981A109
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 15:23:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658015.1027105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxT4-0006a1-G2; Wed, 20 Dec 2023 14:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658015.1027105; Wed, 20 Dec 2023 14:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFxT4-0006XM-D9; Wed, 20 Dec 2023 14:22:38 +0000
Received: by outflank-mailman (input) for mailman id 658015;
 Wed, 20 Dec 2023 14:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWXp=H7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rFxT3-0006XG-1K
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 14:22:37 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37fad25d-9f43-11ee-9b0f-b553b5be7939;
 Wed, 20 Dec 2023 15:22:34 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3367903b4dcso932946f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 06:22:35 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 bg5-20020a05600c3c8500b0040c4c9c52a3sm7648810wmb.12.2023.12.20.06.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 06:22:33 -0800 (PST)
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
X-Inumbo-ID: 37fad25d-9f43-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703082154; x=1703686954; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/b+Wb4Yy7ZZ/+P3oSE+3rWWGbRIiai4YHUTvommzc/U=;
        b=ncpZjHzJRThreCu5PO6q/tJV7bW/kunQl/yr3hXaX10QzzYE6F5t9Z8yUdCUNu7qkd
         FlAu3ZMrfjsp7ViIekb5QDRRRpNCJqthLrZ3laWE5+YlN15jhIGIJ0jjD4boJ6WOk4Os
         4ziz0nOxUFQM6kKIlsPWhYysgfp3UOvZdvxVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703082154; x=1703686954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/b+Wb4Yy7ZZ/+P3oSE+3rWWGbRIiai4YHUTvommzc/U=;
        b=Vs6GB7ldHszMvu6nHVR2tXOMocGISaASZj7byXQ9Fh8NVS2rSjYv8nXamTb+XVBTE5
         HQN3x/FudCldqB2VNm1pTK7/h8gqwjVzURoqSIIZx637koq49PtxneicR768L4UujyyU
         oKhhDG6HMuH5chShd55FcieEf0sB9gHYsl8B3mJkrfe+HktoXExIAfvTkujZgOkssUP1
         gzd0K6Ghu9svR7K1sNN2Tt0WuYnKpTvYOmUv72LY1+pcRqNo02jvIOEJ92/7qLHFo+52
         bmVcy0/sF597TXcEW20/sedl/5VTydpB+x61wRHGTkY+xrtAxEeqhST7aA0QS4TMVYum
         USSA==
X-Gm-Message-State: AOJu0Yxowq8pV+jN+2Us/mur/jWd7BXgXQ0YCQSdzDrX+M4PHq2N3Iji
	ziEbKYkHtlyTapRuoG47ztoMIgd50eqtY55dl/Q=
X-Google-Smtp-Source: AGHT+IGP4Hhfa/kRuS1WkJo1Rb8P6zjwjICnl/t5/YT/rRpDw/+X4ukChu7/+AVaYRK1qrE60capRw==
X-Received: by 2002:a05:600c:1384:b0:40c:521a:5d11 with SMTP id u4-20020a05600c138400b0040c521a5d11mr8184731wmf.39.1703082153733;
        Wed, 20 Dec 2023 06:22:33 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/amd: extend CPU errata #1474 affected models
Date: Wed, 20 Dec 2023 15:22:18 +0100
Message-ID: <20231220142218.22850-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Errata #1474 does also affect models from family 17h ranges 00-2Fh, so the
errata now covers all the models released under Family 17h (Zen, Zen+ and
Zen2).

Additionally extend the workaround to Family 18h (Hygon), since it's based on
the Zen architecture and very likely affected.

Rename all the zen2 related symbols to plain zen, since the errata doesn't
exclusively affect Zen2 anymore.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I'm unsure whether to just drop the zen_ prefix altogether, to not make it look
to only affect plain Zen (Zen1) models.
---
 xen/arch/x86/cpu/amd.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 0f305312ff2a..099646dc3994 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -54,7 +54,7 @@ bool __read_mostly amd_acpi_c1e_quirk;
 bool __ro_after_init amd_legacy_ssbd;
 bool __initdata amd_virt_spec_ctrl;
 
-static bool __read_mostly zen2_c6_disabled;
+static bool __read_mostly zen_c6_disabled;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
@@ -978,24 +978,24 @@ void amd_check_zenbleed(void)
 		       val & chickenbit ? "chickenbit" : "microcode");
 }
 
-static void cf_check zen2_disable_c6(void *arg)
+static void cf_check zen_disable_c6(void *arg)
 {
 	/* Disable C6 by clearing the CCR{0,1,2}_CC6EN bits. */
 	const uint64_t mask = ~((1ul << 6) | (1ul << 14) | (1ul << 22));
 	uint64_t val;
 
-	if (!zen2_c6_disabled) {
+	if (!zen_c6_disabled) {
 		printk(XENLOG_WARNING
     "Disabling C6 after 1000 days apparent uptime due to AMD errata 1474\n");
-		zen2_c6_disabled = true;
+		zen_c6_disabled = true;
 		/*
 		 * Prevent CPU hotplug so that started CPUs will either see
-		 * zen2_c6_disabled set, or will be handled by
+		 * zen_c6_disabled set, or will be handled by
 		 * smp_call_function().
 		 */
 		while (!get_cpu_maps())
 			process_pending_softirqs();
-		smp_call_function(zen2_disable_c6, NULL, 0);
+		smp_call_function(zen_disable_c6, NULL, 0);
 		put_cpu_maps();
 	}
 
@@ -1294,8 +1294,8 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	amd_check_zenbleed();
 	amd_check_erratum_1485();
 
-	if (zen2_c6_disabled)
-		zen2_disable_c6(NULL);
+	if (zen_c6_disabled)
+		zen_disable_c6(NULL);
 
 	check_syscfg_dram_mod_en();
 
@@ -1307,7 +1307,7 @@ const struct cpu_dev amd_cpu_dev = {
 	.c_init		= init_amd,
 };
 
-static int __init cf_check zen2_c6_errata_check(void)
+static int __init cf_check amd_check_erratum_1474(void)
 {
 	/*
 	 * Errata #1474: A Core May Hang After About 1044 Days
@@ -1315,7 +1315,8 @@ static int __init cf_check zen2_c6_errata_check(void)
 	 */
 	s_time_t delta;
 
-	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x17 || !is_zen2_uarch())
+	if (cpu_has_hypervisor ||
+	    (boot_cpu_data.x86 != 0x17 && boot_cpu_data.x86 != 0x18))
 		return 0;
 
 	/*
@@ -1330,10 +1331,10 @@ static int __init cf_check zen2_c6_errata_check(void)
 	if (delta > 0) {
 		static struct timer errata_c6;
 
-		init_timer(&errata_c6, zen2_disable_c6, NULL, 0);
+		init_timer(&errata_c6, zen_disable_c6, NULL, 0);
 		set_timer(&errata_c6, NOW() + delta);
 	} else
-		zen2_disable_c6(NULL);
+		zen_disable_c6(NULL);
 
 	return 0;
 }
@@ -1341,4 +1342,4 @@ static int __init cf_check zen2_c6_errata_check(void)
  * Must be executed after early_time_init() for tsc_ticks2ns() to have been
  * calibrated.  That prevents us doing the check in init_amd().
  */
-presmp_initcall(zen2_c6_errata_check);
+presmp_initcall(amd_check_erratum_1474);
-- 
2.43.0


