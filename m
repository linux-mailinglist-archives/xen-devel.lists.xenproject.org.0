Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DF3BF1829
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 15:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146292.1478781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApo0-0001BW-PX; Mon, 20 Oct 2025 13:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146292.1478781; Mon, 20 Oct 2025 13:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vApo0-00019o-Km; Mon, 20 Oct 2025 13:20:08 +0000
Received: by outflank-mailman (input) for mailman id 1146292;
 Mon, 20 Oct 2025 13:20:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vApnz-0007j7-8I
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 13:20:07 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e1128d1-adb7-11f0-980a-7dc792cee155;
 Mon, 20 Oct 2025 15:20:05 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-42421b1514fso2728824f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 06:20:05 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c65sm15267835f8f.15.2025.10.20.06.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Oct 2025 06:20:03 -0700 (PDT)
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
X-Inumbo-ID: 7e1128d1-adb7-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1760966405; x=1761571205; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7U1lvFhiTkuuq1fJOCE2O4Cy9uGnElIdZlJyTgO8ts=;
        b=ko2hxvCooupRyF8dxh/FUnLeLK38/sWeG2E1/wHlHtZADmcKo4aQkUplJyu5wm2VSi
         RdsKtWzUfjjBdoLeFLuztavppwo4oCsLMHAAHFYjfgkkfblM+pyGRR6NYN61VN9EkSNz
         auLCXBLybyrL5vitUqgzSm2taRkdwsIUZHbmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760966405; x=1761571205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7U1lvFhiTkuuq1fJOCE2O4Cy9uGnElIdZlJyTgO8ts=;
        b=t7qsDktxJZodJ/ZR3CYR14Ihh/kHNow7cjFsdpffmsLhqIHBeJQ3yqy0Z+WcLo9/79
         swQbV31/126K+/dpqNZorhsWolMPNRUNURKax28kjK30n/TCXf0Z4IFPLz+H4igJm3jI
         4PHq3MSKvEbSDGxunHcdiGRa43KjEIeyWFyEjgtNwwcJ8rFhUZLEqkDFQWBPpePW3ods
         0+b8LAHQZMZea/Y0Duoh3k9HNQMmDkRpnl99KR+dCu3BRDfIFz+ONcrgtki4afRAeaTO
         HvX34gY7tee7IS69IEJDzRP1x3M65KfYRHEEJF/js+9pEXq7QPjnuWD/cnU4vakCUsUc
         Dz8A==
X-Gm-Message-State: AOJu0Ywq/jDUY7yxo/huuIplVa6/VLmabeXjFsoSWjCc5rW/Y2fla/BZ
	D/L++uclKd9nYmPyIuT3hgaQU6N3nIq4I5jc9aN2YF29dg7PbFphwMy8bDOwXb2EvRUStbndatj
	IZD+tO741bA==
X-Gm-Gg: ASbGncvCyTeu5Lw7WG8xUvwrhNwSR2cTBlqYVBZx3zz7yk9Dy3gvYATwN++jmByoqB4
	k+s3Q6M7M8ZikufsiHMJvA0AkMegqPrQGH89mmvOjit4BCDnVC3tEUwIrUnGTA6St0puvRXUrYF
	yRcyrfZ93fiy29vAYg+ozdPV2nuwa2aMQxuzhXyMlUQhmTrwJkEL0FrUy6Jooh5z3Z9Eiv3Njoj
	KIMZiLwWHm09Va/qUNOxeHxN8DXQ4xH/N9fwLlnoVo3tmXkXek78//UYtZtJTVa8AeXCbqxyiHY
	t+ZLLS74QomDOkqGXUCw2IefHURDGEp10hBJGF02sTdVElBxpwEu/iNiRoWgrZL9m7d4jBZoUPG
	LJsq3E3gXmgopeb2Bl3j4h+1mP9PZFEF64GLci6V85W0dw5iJHD2K0hB24AQ5Q8wW2l0f9tZC2E
	CTfjFWNNi9Ht/Wi1TJKbUawF3N0XlyXD1de4ujh8Brs/l/wC2XjSw=
X-Google-Smtp-Source: AGHT+IGt6etmuW+YxtwxSmoDBmcjvGWaKMcSQvb4fjMnId8i03Gd+DIzD2e48xJxhfNX75dr+WafbQ==
X-Received: by 2002:a05:6000:2884:b0:428:3f70:4b2 with SMTP id ffacd0b85a97d-4283f70078cmr5018119f8f.63.1760966404696;
        Mon, 20 Oct 2025 06:20:04 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 5/5] x86/ucode: Relax digest check when Entrysign is fixed in firmware
Date: Mon, 20 Oct 2025 14:19:55 +0100
Message-Id: <20251020131955.2928261-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When Entrysign has been mitigated in firwmare, it is believed to be safe to
pass blobs to the CPU again.  This avoids us needing to update the digest
table for new microcodes.

Relax the digest check when firmware looks to be up to date, and leave behind
a clear message when not.

This is best-effort only.  If a malicious microcode has been loaded prior to
Xen running, then all bets are off.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I need to double check the revision table.  I think I need to submit a
correction to Linux first.
---
 xen/arch/x86/cpu/microcode/amd.c     | 81 +++++++++++++++++++++++++++-
 xen/arch/x86/cpu/microcode/core.c    |  2 +
 xen/arch/x86/cpu/microcode/private.h |  2 +
 3 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 30bddc89da0a..b5b55b7a00cd 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -101,6 +101,7 @@ static const struct patch_digest {
 } patch_digests[] = {
 #include "amd-patch-digests.c"
 };
+static bool __ro_after_init entrysign_mitigiated_in_firmware;
 
 static int cf_check cmp_patch_id(const void *key, const void *elem)
 {
@@ -125,7 +126,7 @@ static bool check_digest(const struct container_microcode *mc)
      * microcode updates.  Mitigate by checking the digest of the patch
      * against a list of known provenance.
      */
-    if ( boot_cpu_data.family < 0x17 ||
+    if ( boot_cpu_data.family < 0x17 || entrysign_mitigiated_in_firmware ||
          !opt_digest_check )
         return true;
 
@@ -597,3 +598,81 @@ static void __init __constructor test_digests_sorted(void)
     }
 }
 #endif /* CONFIG_SELF_TESTS */
+
+/*
+ * The Entrysign vulnerability affects all Zen1 thru Zen5 CPUs.  Firmware
+ * fixes were produced in Nov/Dec 2025.  Zen3 thru Zen5 can continue to take
+ * OS-loadable microcode updates using a new signature scheme, as long as
+ * firmware has been updated first.
+ */
+void __init amd_check_entrysign(void)
+{
+    unsigned int curr_rev;
+    uint8_t fixed_rev;
+
+    if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
+         boot_cpu_data.family < 0x17 ||
+         boot_cpu_data.family > 0x1a )
+        return;
+
+    /*
+     * Table taken from Linux, which is the only known source of information
+     * about client revisions.
+     */
+    curr_rev = this_cpu(cpu_sig).rev;
+    switch ( curr_rev >> 8 )
+    {
+    case 0x080012: fixed_rev = 0x6f; break;
+    case 0x080082: fixed_rev = 0x0f; break;
+    case 0x083010: fixed_rev = 0x7c; break;
+    case 0x086001: fixed_rev = 0x0e; break;
+    case 0x086081: fixed_rev = 0x08; break;
+    case 0x087010: fixed_rev = 0x34; break;
+    case 0x08a000: fixed_rev = 0x0a; break;
+    case 0x0a0010: fixed_rev = 0x7a; break;
+    case 0x0a0011: fixed_rev = 0xda; break;
+    case 0x0a0012: fixed_rev = 0x43; break;
+    case 0x0a0082: fixed_rev = 0x0e; break;
+    case 0x0a1011: fixed_rev = 0x53; break;
+    case 0x0a1012: fixed_rev = 0x4e; break;
+    case 0x0a1081: fixed_rev = 0x09; break;
+    case 0x0a2010: fixed_rev = 0x2f; break;
+    case 0x0a2012: fixed_rev = 0x12; break;
+    case 0x0a4041: fixed_rev = 0x09; break;
+    case 0x0a5000: fixed_rev = 0x13; break;
+    case 0x0a6012: fixed_rev = 0x0a; break;
+    case 0x0a7041: fixed_rev = 0x09; break;
+    case 0x0a7052: fixed_rev = 0x08; break;
+    case 0x0a7080: fixed_rev = 0x09; break;
+    case 0x0a70c0: fixed_rev = 0x09; break;
+    case 0x0aa001: fixed_rev = 0x16; break;
+    case 0x0aa002: fixed_rev = 0x18; break;
+    case 0x0b0021: fixed_rev = 0x46; break;
+    case 0x0b1010: fixed_rev = 0x46; break;
+    case 0x0b2040: fixed_rev = 0x31; break;
+    case 0x0b4040: fixed_rev = 0x31; break;
+    case 0x0b6000: fixed_rev = 0x31; break;
+    case 0x0b7000: fixed_rev = 0x31; break;
+    default:
+        printk(XENLOG_WARNING
+               "Unrecognised CPU %02x-%02x-%02x ucode 0x%08x, assuming vulnerable to Entrysign\n",
+               boot_cpu_data.family, boot_cpu_data.model,
+               boot_cpu_data.stepping, curr_rev);
+        return;
+    }
+
+    /*
+     * This check is best-effort.  If the platform looks to be out of date, it
+     * probably is.  If the platform looks to be fixed, it either genuinely
+     * is, or malware has gotten in before Xen booted and all bets are off.
+     */
+    if ( (uint8_t)curr_rev >= fixed_rev )
+    {
+        entrysign_mitigiated_in_firmware = true;
+        return;
+    }
+
+    printk(XENLOG_ERR
+           "Platform vulnerable to Entrysign (SB-7033, CVE-2024-36347) - firmware update required\n");
+    add_taint(TAINT_CPU_OUT_OF_SPEC);
+}
diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 2705bb43c97f..1d1a5aa4b097 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -750,6 +750,8 @@ static int __init early_microcode_load(struct boot_info *bi)
     int idx = opt_mod_idx;
     int rc;
 
+    amd_check_entrysign();
+
     /*
      * Cmdline parsing ensures this invariant holds, so that we don't end up
      * trying to mix multiple ways of finding the microcode.
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index f5e2bfee00d9..e6c965dc99dd 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -81,8 +81,10 @@ extern bool opt_digest_check;
  */
 #ifdef CONFIG_AMD
 void ucode_probe_amd(struct microcode_ops *ops);
+void amd_check_entrysign(void);
 #else
 static inline void ucode_probe_amd(struct microcode_ops *ops) {}
+static inline void amd_check_entrysign(void) {}
 #endif
 
 #ifdef CONFIG_INTEL
-- 
2.39.5


