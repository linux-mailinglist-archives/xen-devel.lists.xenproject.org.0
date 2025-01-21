Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB975A17FAF
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 15:25:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875470.1285913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taFBt-00084o-Mw; Tue, 21 Jan 2025 14:25:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875470.1285913; Tue, 21 Jan 2025 14:25:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taFBt-000837-KJ; Tue, 21 Jan 2025 14:25:17 +0000
Received: by outflank-mailman (input) for mailman id 875470;
 Tue, 21 Jan 2025 14:25:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQWO=UN=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1taFBs-000831-9q
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 14:25:16 +0000
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [2a00:1450:4864:20::543])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86a1dc3e-d803-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 15:25:13 +0100 (CET)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-5db689a87cbso11267258a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 06:25:13 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5db73eb5b05sm7059934a12.63.2025.01.21.06.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 06:25:11 -0800 (PST)
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
X-Inumbo-ID: 86a1dc3e-d803-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1737469512; x=1738074312; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvOrZpMGGQA+YD5BVos8SdHvfHAL1b+MsHG+uttROsU=;
        b=wY4SrTEqBYhQcY2g6gTCXrp68DwvM6faS+AEzIvajuZDZdh7qHAMoDmljKThDCq7fB
         CnTPEmt2Nf43CNCe+SxKeM620EDpzMuyOaOGji2ssby43KEMDZ7ynuNX1XJNH3XWnJsH
         +kqxqIEQK7QSdXYzXZYyWhsS8VB9zMXsdhOEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737469512; x=1738074312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvOrZpMGGQA+YD5BVos8SdHvfHAL1b+MsHG+uttROsU=;
        b=mhCLbHMW1/VLFn3eI0R7cJRlUoc4LD89yj+y9z1wWZD0jIZ55c8IIzTVrrhZEcHysW
         Xw0I7+6PvGdeL3nU/vmhAsAQB3C0J+HPifDqDPi1oJ2TvMQAGZaqdz86QUWTbXbop0TD
         w6jsHdQ79YLDXC9WNVIZ6vtq5TzuNcRMQeZHnzrcUNoVwixOoA0Lqkcj/5gajBoXspy+
         udAN6g6BXMw3STQ/daaF4KkrpOcT7b4sa803jZR+5j4Ds4LHwwgJNietoDXeB13kOgau
         pMzTLKRMF1TbnWp8GjnayEDwuDKzAygoeEcYJLWdp63b8iSOTth/GEM2IzRTf6ntDsmd
         /5+Q==
X-Gm-Message-State: AOJu0YxAB6s7cYHFgfTLE0SuYcDr/AuKn/KonfXzZqcv/y3fUqU8Wube
	EnJTw0Hu5HRi5hUQBL4HTH580B1UdzWT/pADe11SNxKV3HByfbDRrN4HnQFJgMarj3OWf7ikaG0
	pZRv64w==
X-Gm-Gg: ASbGncsleqhJgf3h0RK43LKyp15TFQR6red06lvIWSNfbZvSU36SbjtepdQpPKaUpdf
	aIkW8MynE8yHPWSQp6+/sUXq3oH8zKfpTJv+rttfP68ojXlmlufW901I6MG8a7LdvzA6c7qzUsq
	5924WsDXPOz7Y+8bCOrzj4lzI6j/UwkxxX5sZH9tXXeeUep1GDMSrC/1ztm5qlpal7R1rmRvJS7
	OX13nJcPDzbOc8GpjB6pdfvhrhQJvQjQ5fDqWTKhDag8CKK65YQ7R5nS3kZK3Du7PtWNXo4XNSE
	ULLeJe4L/nkdwgqNFW/+ZMVVKKVz7UuSzH4Q2eOUERZMPa36dQ==
X-Google-Smtp-Source: AGHT+IEMy3Ai4UyNazji72hNigCLpbTF1IMBzCiawudGVO2lvl8G22VxYDdUMslc2oapKeT+eO2YrA==
X-Received: by 2002:a05:6402:3483:b0:5d0:d30b:d53e with SMTP id 4fb4d7f45d1cf-5db7d318decmr15709509a12.19.1737469511924;
        Tue, 21 Jan 2025 06:25:11 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jonathan Katz <jonathan.katz@aptar.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.20] x86/intel: Fix PERF_GLOBAL fixup when virtualised
Date: Tue, 21 Jan 2025 14:25:10 +0000
Message-Id: <20250121142510.358996-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Logic using performance counters needs to look at
MSR_MISC_ENABLE.PERF_AVAILABLE before touching any other resources.

When virtualised under ESX, Xen dies with a #GP fault trying to read
MSR_CORE_PERF_GLOBAL_CTRL.

Factor this logic out into a separate function (it's already too squashed to
the RHS), and insert a check of MSR_MISC_ENABLE.PERF_AVAILABLE.

This also limits setting X86_FEATURE_ARCH_PERFMON, although oprofile (the only
consumer of this flag) cross-checks too.

Reported-by: Jonathan Katz <jonathan.katz@aptar.com>
Link: https://xcp-ng.org/forum/topic/10286/nesting-xcp-ng-on-esx-8
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Untested, but this is the same pattern used by oprofile and watchdog setup.

I've intentionally stopped using Intel style.  This file is already mixed (as
visible even in context), and it doesn't remotely resemble it's Linux origin
any more.

For 4.20.  This regressions has already been backported.
---
 xen/arch/x86/cpu/intel.c | 64 +++++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 6a7347968ba2..586ae84d806d 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -535,39 +535,49 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
     printk("%u MHz\n", (factor * max_ratio + 50) / 100);
 }
 
+static void init_intel_perf(struct cpuinfo_x86 *c)
+{
+    uint64_t val;
+    unsigned int eax, ver, nr_cnt;
+
+    if ( c->cpuid_level <= 9 ||
+         rdmsr_safe(MSR_IA32_MISC_ENABLE, val) ||
+         !(val & MSR_IA32_MISC_ENABLE_PERF_AVAIL) )
+        return;
+
+    eax = cpuid_eax(10);
+    ver = eax & 0xff;
+    nr_cnt = (eax >> 8) & 0xff;
+
+    if ( ver && nr_cnt > 1 && nr_cnt <= 32 )
+    {
+        unsigned int cnt_mask = (1UL << nr_cnt) - 1;
+
+        /*
+         * On (some?) Sapphire/Emerald Rapids platforms each package-BSP
+         * starts with all the enable bits for the general-purpose PMCs
+         * cleared.  Adjust so counters can be enabled from EVNTSEL.
+         */
+        rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val);
+
+        if ( (val & cnt_mask) != cnt_mask )
+        {
+            printk("FIRMWARE BUG: CPU%u invalid PERF_GLOBAL_CTRL: %#"PRIx64" adjusting to %#"PRIx64"\n",
+                   smp_processor_id(), val, val | cnt_mask);
+            wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL, val | cnt_mask);
+        }
+    }
+
+    __set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
+}
+
 static void cf_check init_intel(struct cpuinfo_x86 *c)
 {
 	/* Detect the extended topology information if available */
 	detect_extended_topology(c);
 
 	init_intel_cacheinfo(c);
-	if (c->cpuid_level > 9) {
-		unsigned eax = cpuid_eax(10);
-		unsigned int cnt = (eax >> 8) & 0xff;
-
-		/* Check for version and the number of counters */
-		if ((eax & 0xff) && (cnt > 1) && (cnt <= 32)) {
-			uint64_t global_ctrl;
-			unsigned int cnt_mask = (1UL << cnt) - 1;
-
-			/*
-			 * On (some?) Sapphire/Emerald Rapids platforms each
-			 * package-BSP starts with all the enable bits for the
-			 * general-purpose PMCs cleared.  Adjust so counters
-			 * can be enabled from EVNTSEL.
-			 */
-			rdmsrl(MSR_CORE_PERF_GLOBAL_CTRL, global_ctrl);
-			if ((global_ctrl & cnt_mask) != cnt_mask) {
-				printk("CPU%u: invalid PERF_GLOBAL_CTRL: %#"
-				       PRIx64 " adjusting to %#" PRIx64 "\n",
-				       smp_processor_id(), global_ctrl,
-				       global_ctrl | cnt_mask);
-				wrmsrl(MSR_CORE_PERF_GLOBAL_CTRL,
-				       global_ctrl | cnt_mask);
-			}
-			__set_bit(X86_FEATURE_ARCH_PERFMON, c->x86_capability);
-		}
-	}
+	init_intel_perf(c);
 
 	if ( !cpu_has(c, X86_FEATURE_XTOPOLOGY) )
 	{

base-commit: c3f5d1bb40b57d467cb4051eafa86f5933ec9003
-- 
2.39.5


