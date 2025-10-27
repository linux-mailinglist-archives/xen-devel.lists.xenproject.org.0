Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A05E5C11A73
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 23:17:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151824.1482397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWg-0001nx-VS; Mon, 27 Oct 2025 22:17:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151824.1482397; Mon, 27 Oct 2025 22:17:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDVWg-0001e7-Mc; Mon, 27 Oct 2025 22:17:18 +0000
Received: by outflank-mailman (input) for mailman id 1151824;
 Mon, 27 Oct 2025 22:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vDVWe-0000qq-MZ
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 22:17:16 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1e9955c-b382-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 23:17:16 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47112a73785so33421095e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 15:17:16 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475de57b156sm148785595e9.13.2025.10.27.15.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 15:17:14 -0700 (PDT)
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
X-Inumbo-ID: b1e9955c-b382-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761603435; x=1762208235; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFg+MrgS3JAmSaxfSKWCNpVbupEI6lxBhJ1JFipFx3s=;
        b=DKjt0p7y+txA/YAkY+LE6bqMHzpKgW/nbIWg8Zjd6u3aQNmY697ytb1Uxx7UX8VC8r
         8PYIpO4ZEyGwzlostwd1ypGJwW4D2iTyvFsCWhXLLDBUobNdpJAu0YbyAHvNS/e9tH3T
         Ru4uZ6sni2YgMQMPPMOhuNdMGpRSiGAzu2w3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761603435; x=1762208235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFg+MrgS3JAmSaxfSKWCNpVbupEI6lxBhJ1JFipFx3s=;
        b=c36r8FzIHYPm7Yu5GIQiInEgYWl/bARXBqbaJ2QlmKzOkrUm+AnZxlReqfPAULe6PG
         POsascIUa5aHxmK+rZqCX9MgpQr9gXofYPpbzFz79+QetOGFdAKEzSSKJTvMPebebePR
         9sIRKn1BnsJ81Sy4cdI9R5+uOfZIWAAgDTPHMB4ruSiIsiDKfYeZoOSf1u6uYteiuGHN
         wsFcKI8juCWCd46dSgVW8+FiBLAl84Hs3c5RRdjnOHiEoL8MnFiXUKCIMzA9Yfaa4dgv
         BlH8Y5DGC5VbFYlihWtPAMNuJIMJw5RvAQCrI0NcTpMF8cjJWkN4D+QLDeNFlY+SZXhD
         CLHw==
X-Gm-Message-State: AOJu0YzU/lQ2KAMP7s6kOwnQby3hlSCtdgQZSiql+KzlQmtyp1UD4Oyh
	A9EhEZ+O4j+0UVam/ez2JAX1vynjn6Vly3YJOaYuF4a9NXFdIOdbSDlbwq0Ky9LyIObbWYOeYgB
	lf4t3EV5/LA==
X-Gm-Gg: ASbGncup6zajhhpUvnCHj5NZAdKGewXEl89BTSM2XBks1JvjQNNsr6JPNc02VFfamLP
	tkOVfbaZ0quzPJCgqGNcw9VZAwYoovhhlWGejbAAh0mfHcHQyOxooTagymLc5t2pCanMJ+CQD/B
	PJZ3pA12YaqEw+54QiHKx1/wjHr4OO2LRYLFylLUD/Ai0jy9nsb/qZGCsA7phdKTj4Tfb0l9PD3
	ZrpMbLdiP1ifYC80Ta8ZwSKclzVBL3r4BR4hktAUrB7A+ozbVp37HElcmqBuZmtj48mRzRptu3f
	QOjzP4VZuSvN+ewH4F6GT+gSGmairPd6Zheu7l/wFx8Cc4Oc9w4CGhj46Et8lIHD4Xex4twPV5G
	lfe8LM+jspbu9Dr2OAdW6Ks1On/rUD+7MywpaKWFHVKgrMoHhRKzUG5yqCzXxuM5FPJE+KHC5T9
	kufEO5Y+hIGVmGGQJz9TYbRaJU4HFwDNTfPsRiEXUUzEBa1vFXornGPRmM1gkFjQ==
X-Google-Smtp-Source: AGHT+IENdA4LEWfkLT3/8rVPLBEAQi17VCw5WRhElf149pX1W+1DZrAxUoANYp+daQSVSVKX1TI7iQ==
X-Received: by 2002:a05:600c:6215:b0:46e:33b2:c8da with SMTP id 5b1f17b1804b1-47717e416admr11550005e9.32.1761603435386;
        Mon, 27 Oct 2025 15:17:15 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 5/5] x86/ucode: Relax digest check when Entrysign is fixed in firmware
Date: Mon, 27 Oct 2025 22:17:02 +0000
Message-Id: <20251027221702.3362552-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
References: <20251027221702.3362552-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When Entrysign has been mitigated in firwmare, it is believed to be safe to
rely on the CPU patchloader again.  This avoids us needing to maintain the
digest table for all new microcode indefinitely.

Relax the digest check when firmware looks to be up to date, and leave behind
a clear message when not.

This is best-effort only.  If a malicious microcode has been loaded prior to
Xen running, then all bets are off.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Corrections to the revision table.
 * Updates to various comments.
 * Add a "WARNING: " prefix to the message about vulnerability
---
 xen/arch/x86/cpu/microcode/amd.c     | 86 +++++++++++++++++++++++++++-
 xen/arch/x86/cpu/microcode/core.c    |  2 +
 xen/arch/x86/cpu/microcode/private.h |  2 +
 3 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index f331d9dfee6e..9ecf6c37d3f4 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -101,6 +101,7 @@ static const struct patch_digest {
 } patch_digests[] = {
 #include "amd-patch-digests.c"
 };
+static bool __ro_after_init entrysign_mitigiated_in_firmware;
 
 static int cf_check cmp_patch_id(const void *key, const void *elem)
 {
@@ -122,11 +123,11 @@ static bool check_digest(const struct container_microcode *mc)
 
     /*
      * Zen1 thru Zen5 CPUs are known to use a weak signature algorithm on
-     * microcode updates.  Mitigate by checking the digest of the patch
-     * against a list of known provenance.
+     * microcode updates.  If this has not been mitigated in firmware,
+     * checking the digest of the patch against a list of known provenance.
      */
     if ( boot_cpu_data.family < 0x17 || boot_cpu_data.family > 0x1a ||
-         !opt_digest_check )
+         entrysign_mitigiated_in_firmware || !opt_digest_check )
         return true;
 
     pd = bsearch(&patch->patch_id, patch_digests, ARRAY_SIZE(patch_digests),
@@ -603,3 +604,82 @@ static void __init __constructor test_digests_sorted(void)
     }
 }
 #endif /* CONFIG_SELF_TESTS */
+
+/*
+ * The Entrysign vulnerability affects all Zen1 thru Zen5 CPUs.  Firmware
+ * fixes were produced from Nov 2024.  Zen3 thru Zen5 can continue to take
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
+     * about client revisions.  Note, Linux expresses "last-vulnerable-rev"
+     * while Xen wants "first-fixed-rev".
+     */
+    curr_rev = this_cpu(cpu_sig).rev;
+    switch ( curr_rev >> 8 )
+    {
+    case 0x080012: fixed_rev = 0x78; break;
+    case 0x080082: fixed_rev = 0x10; break;
+    case 0x083010: fixed_rev = 0x7d; break;
+    case 0x086001: fixed_rev = 0x0f; break;
+    case 0x086081: fixed_rev = 0x09; break;
+    case 0x087010: fixed_rev = 0x35; break;
+    case 0x08a000: fixed_rev = 0x0b; break;
+    case 0x0a0010: fixed_rev = 0x7b; break;
+    case 0x0a0011: fixed_rev = 0xdb; break;
+    case 0x0a0012: fixed_rev = 0x44; break;
+    case 0x0a0082: fixed_rev = 0x0f; break;
+    case 0x0a1011: fixed_rev = 0x54; break;
+    case 0x0a1012: fixed_rev = 0x4f; break;
+    case 0x0a1081: fixed_rev = 0x0a; break;
+    case 0x0a2010: fixed_rev = 0x30; break;
+    case 0x0a2012: fixed_rev = 0x13; break;
+    case 0x0a4041: fixed_rev = 0x0a; break;
+    case 0x0a5000: fixed_rev = 0x14; break;
+    case 0x0a6012: fixed_rev = 0x0b; break;
+    case 0x0a7041: fixed_rev = 0x0a; break;
+    case 0x0a7052: fixed_rev = 0x09; break;
+    case 0x0a7080: fixed_rev = 0x0a; break;
+    case 0x0a70c0: fixed_rev = 0x0a; break;
+    case 0x0aa001: fixed_rev = 0x17; break;
+    case 0x0aa002: fixed_rev = 0x19; break;
+    case 0x0b0021: fixed_rev = 0x47; break;
+    case 0x0b1010: fixed_rev = 0x47; break;
+    case 0x0b2040: fixed_rev = 0x32; break;
+    case 0x0b4040: fixed_rev = 0x32; break;
+    case 0x0b6000: fixed_rev = 0x32; break;
+    case 0x0b7000: fixed_rev = 0x32; break;
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
+    printk(XENLOG_WARNING
+           "WARNING: Platform vulnerable to Entrysign (SB-7033, CVE-2024-36347) - firmware update required\n");
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


