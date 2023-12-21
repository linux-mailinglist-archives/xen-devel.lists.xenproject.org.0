Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B830381B330
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:09:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658739.1028061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGFyu-0005ZO-OO; Thu, 21 Dec 2023 10:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658739.1028061; Thu, 21 Dec 2023 10:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGFyu-0005Xf-Lm; Thu, 21 Dec 2023 10:08:44 +0000
Received: by outflank-mailman (input) for mailman id 658739;
 Thu, 21 Dec 2023 10:08:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8VCQ=IA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rGFyt-0005XZ-3l
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:08:43 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea93c2b6-9fe8-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 11:08:41 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3367601a301so529772f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 02:08:41 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 h1-20020a05600c350100b0040d3f4b1c8esm1281632wmq.36.2023.12.21.02.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Dec 2023 02:08:39 -0800 (PST)
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
X-Inumbo-ID: ea93c2b6-9fe8-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703153320; x=1703758120; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXEuHfdN0qmBa4xc//6/apbHR4jN7X0lLEk2wrnlY3c=;
        b=a+mhjtQglFKP8qEntFGDER6o9nfc+BkJynlBtLI0qiFb2rR4VSjm9/n83klnYYFj6z
         rDtOX5URPfZ4VoN8DtHM9PCsbVODLWY9hmLuKgs/9gNVby1fIIFqYP4XyT1jJZqD8t1S
         7kl/7QVTWCZSteQomXAVfw9bfzBfpoMB7i72Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703153320; x=1703758120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXEuHfdN0qmBa4xc//6/apbHR4jN7X0lLEk2wrnlY3c=;
        b=lgNhb3JUfpcb3T4ut4tVyW7vYbbMbWVjY0r1SkNr5z4LFxp8CEllc2ashKQGy3KqLz
         6SaxxtZZWRx5GKVdYqgTBouBjnPRrgBtKJ00/zGwPp/rbBNWdIcx9wT4n2CmHwjuDgY2
         idNc9OvSlqWlAnErmJp5KZGPcYhXNSyL6xdLZK+ujVnPrVRnUJXjbWw6j2KWu1SxlkKA
         tpaa+Kf4XctF6HnZ9ccBFH+UFd6Mz9OoWHmtlZuX3ssbAzGTKU7v9jfQF4tumhCbAQzR
         p9BCIEluzZNThfsd0b0shQXnGRqTscVITkJQXIrqsSzRTglaptHciKga1JKPE+lZfwfH
         +vQA==
X-Gm-Message-State: AOJu0YzeGkniNf1osdOrIVPQ0Hm5iqaY9cWtp1HihZ4PLmSbGxd12w4/
	T9YkVg7kbbw19pKormYsyxcqC7bbhXSenMbEAI8=
X-Google-Smtp-Source: AGHT+IENWfH93igo9afsnOcHpO0Uf+rxd3Z9t8g5VaxHDZJzvxwjrHr58dgODVqyJwgYQSMEqZEhMw==
X-Received: by 2002:a05:600c:4505:b0:40c:2cb0:b563 with SMTP id t5-20020a05600c450500b0040c2cb0b563mr429979wmo.121.1703153320031;
        Thu, 21 Dec 2023 02:08:40 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] x86/amd: extend CPU errata #1474 affected models
Date: Thu, 21 Dec 2023 11:08:31 +0100
Message-ID: <20231221100831.25570-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Errata #1474has now been extended to cover models from family 17h ranges
00-2Fh, so the errata now covers all the models released under Family 17h (Zen,
Zen+ and Zen2).

Additionally extend the workaround to Family 18h (Hygon), since it's based on
the Zen architecture and very likely affected.

Rename all the zen2 related symbols to fam17, since the errata doesn't
exclusively affect Zen2 anymore.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes since v1:
 - Use fam17 instead of zen prefix.
---
 xen/arch/x86/cpu/amd.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 0f305312ff2a..d43288ae9779 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -54,7 +54,7 @@ bool __read_mostly amd_acpi_c1e_quirk;
 bool __ro_after_init amd_legacy_ssbd;
 bool __initdata amd_virt_spec_ctrl;
 
-static bool __read_mostly zen2_c6_disabled;
+static bool __read_mostly fam17_c6_disabled;
 
 static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
 				 unsigned int *hi)
@@ -978,24 +978,24 @@ void amd_check_zenbleed(void)
 		       val & chickenbit ? "chickenbit" : "microcode");
 }
 
-static void cf_check zen2_disable_c6(void *arg)
+static void cf_check fam17_disable_c6(void *arg)
 {
 	/* Disable C6 by clearing the CCR{0,1,2}_CC6EN bits. */
 	const uint64_t mask = ~((1ul << 6) | (1ul << 14) | (1ul << 22));
 	uint64_t val;
 
-	if (!zen2_c6_disabled) {
+	if (!fam17_c6_disabled) {
 		printk(XENLOG_WARNING
     "Disabling C6 after 1000 days apparent uptime due to AMD errata 1474\n");
-		zen2_c6_disabled = true;
+		fam17_c6_disabled = true;
 		/*
 		 * Prevent CPU hotplug so that started CPUs will either see
-		 * zen2_c6_disabled set, or will be handled by
+		 * zen_c6_disabled set, or will be handled by
 		 * smp_call_function().
 		 */
 		while (!get_cpu_maps())
 			process_pending_softirqs();
-		smp_call_function(zen2_disable_c6, NULL, 0);
+		smp_call_function(fam17_disable_c6, NULL, 0);
 		put_cpu_maps();
 	}
 
@@ -1294,8 +1294,8 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	amd_check_zenbleed();
 	amd_check_erratum_1485();
 
-	if (zen2_c6_disabled)
-		zen2_disable_c6(NULL);
+	if (fam17_c6_disabled)
+		fam17_disable_c6(NULL);
 
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
+		init_timer(&errata_c6, fam17_disable_c6, NULL, 0);
 		set_timer(&errata_c6, NOW() + delta);
 	} else
-		zen2_disable_c6(NULL);
+		fam17_disable_c6(NULL);
 
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


