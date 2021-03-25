Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9A7349753
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 17:52:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101471.194159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTDw-0008AE-CP; Thu, 25 Mar 2021 16:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101471.194159; Thu, 25 Mar 2021 16:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTDw-00089j-8N; Thu, 25 Mar 2021 16:52:44 +0000
Received: by outflank-mailman (input) for mailman id 101471;
 Thu, 25 Mar 2021 16:52:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSM8=IX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPTDu-00086s-8e
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 16:52:42 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e47308dd-7b06-4e4a-843d-dac0c04026ed;
 Thu, 25 Mar 2021 16:52:37 +0000 (UTC)
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
X-Inumbo-ID: e47308dd-7b06-4e4a-843d-dac0c04026ed
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616691155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LF+lVlyKXExW6Io/IYUvBnZgXV3D7BVJSGsgMrjUOUs=;
  b=YHFLKxJKVx870MMzJ9EdWJauFtoOfUtV4BMe5sZa4y/O11Oz3qJ9ssat
   pLR0q8mOEuz6YcHvX8IVXIRc7l0RxitN2ztaKS4d8MwTgSQM+43/Llcwi
   yT8+n1jvMmE8liPTBGAWl5lKNGogLRgleDhOtkbFAQ+qzD9AqTBECa20D
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: bmaiUR7yfJ8R/GUMREX9NrRJ3FNleS1FK8wrw7uP7vcOwjdf38dLKs2dKsdtryATOcOR42Dtxd
 egzIL1EYDR/v3bbaxkTW2FT7oW5ZdN4H36o6JrRLlRCqCM8g/ldjIgk1nqpMG7fF8AFgKPnyTP
 tAf9vYOjlD7wdi7nfOAXbsiPxXX4uubMpbAvJXCkqlBd9381O2OA7ibyd/sPSL81D9WQ/6FzuE
 pKlin/tTdVp06HLPidV8DDD2LZTewcPtrvmc8c6MLxDhoNFJbvH3HHYUn1Buenqx0eBsLGcd7o
 Zkw=
X-SBRS: 5.1
X-MesageID: 40150746
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:1/9vfaGHtPdr4ZzmpLqFMpHXdLJzesId70hD6mlYVQFVfsuEl8
 qngfQc0lvOhCwMXWw78OrsBICrR3TA+ZlppbQAJLvKZniChEKEDqFHqbHjzTrpBjHk+odmv5
 tIXqBiBLTLYmRSot395GCDfeoI5Pmi3OSWifzFz3FrJDsaCZ1IywtiEA6UHglXaWB9ZaYRL5
 aX6spZqzfIQx1+AviTPXUZQ/PF4+TCiZOOW3U7LiQ64wqDhy7A0s+YLzGk2H4lMg9n8PMZ3k
 Xu1yf44aiitP/T8G6n60bjq654tfGk5t9KBMmngtUYJDP2mm+TFflccozHhh8ZiqWC70srjc
 ntrn4bTrhOwkKURE6Zi1/M3BTtyzkn4XOK8y7mvVLT5fbXaRh/Lugpv/M8TjLpr3AOkfs57Y
 dwm0WejJZTBQOoplWE2/H4EytEu2DxnWAvioco/htieLpbUpB9h6oF8nhYFZ8RdRiKk7wPIa
 1VAMbQ6O0+SyL9U1np+m1mwNmbVn8uBBuxQk8bpsyP0zRN9UoJtncl+A==
X-IronPort-AV: E=Sophos;i="5.81,278,1610427600"; 
   d="scan'208";a="40150746"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret?=
	<frederic.pierret@qubes-os.org>
Subject: [PATCH 1/2] x86/hpet: Factor hpet_enable_legacy_replacement_mode() out of hpet_setup()
Date: Thu, 25 Mar 2021 16:52:23 +0000
Message-ID: <20210325165224.10306-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210325165224.10306-1-andrew.cooper3@citrix.com>
References: <20210325165224.10306-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... in preparation to introduce a second caller.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Frédéric Pierret <frederic.pierret@qubes-os.org>

For 4.15.  Pre-req for trying to unbreak AMD Ryzen 1800X systems.
---
 xen/arch/x86/hpet.c        | 116 ++++++++++++++++++++++++---------------------
 xen/include/asm-x86/hpet.h |   6 +++
 2 files changed, 68 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 1ff005fb4a..c73135bb15 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -754,11 +754,70 @@ int hpet_legacy_irq_tick(void)
 }
 
 static u32 *hpet_boot_cfg;
+static u64 __initdata hpet_rate;
+
+bool __init hpet_enable_legacy_replacement_mode(void)
+{
+    unsigned int id, cfg, c0_cfg, ticks, count;
+
+    if ( !hpet_rate ||
+         !((id = hpet_read32(HPET_ID)) & HPET_ID_LEGSUP) ||
+         (cfg = hpet_read32(HPET_CFG) & HPET_CFG_LEGACY) )
+        return false;
+
+    /* Stop the main counter. */
+    hpet_write32(cfg & ~HPET_CFG_ENABLE, HPET_CFG);
+
+    /* Reconfigure channel 0 to be 32bit periodic. */
+    c0_cfg = hpet_read32(HPET_Tn_CFG(0));
+    c0_cfg |= (HPET_TN_ENABLE | HPET_TN_PERIODIC | HPET_TN_SETVAL |
+               HPET_TN_32BIT);
+    hpet_write32(c0_cfg, HPET_Tn_CFG(0));
+
+    /*
+     * The exact period doesn't have to match a legacy PIT.  All we need
+     * is an interrupt queued up via the IO-APIC to check routing.
+     *
+     * Use HZ as the frequency.
+     */
+    ticks = ((SECONDS(1) / HZ) * div_sc(hpet_rate, SECONDS(1), 32)) >> 32;
+
+    count = hpet_read32(HPET_COUNTER);
+
+    /*
+     * HPET_TN_SETVAL above is atrociously documented in the spec.
+     *
+     * Periodic HPET channels have a main comparator register, and
+     * separate "accumulator" register.  Despite being named accumulator
+     * in the spec, this is not an accurate description of its behaviour
+     * or purpose.
+     *
+     * Each time an interrupt is generated, the "accumulator" register is
+     * re-added to the comparator set up the new period.
+     *
+     * Normally, writes to the CMP register update both registers.
+     * However, under these semantics, it is impossible to set up a
+     * periodic timer correctly without the main HPET counter being at 0.
+     *
+     * Instead, HPET_TN_SETVAL is a self-clearing control bit which we can
+     * use for periodic timers to mean that the second write to CMP
+     * updates the accumulator only, and not the absolute comparator
+     * value.
+     *
+     * This lets us set a period when the main counter isn't at 0.
+     */
+    hpet_write32(count + ticks, HPET_Tn_CMP(0));
+    hpet_write32(ticks,         HPET_Tn_CMP(0));
+
+    /* Restart the main counter, and legacy mode. */
+    hpet_write32(cfg | HPET_CFG_ENABLE | HPET_CFG_LEGACY, HPET_CFG);
+
+    return true;
+}
 
 u64 __init hpet_setup(void)
 {
-    static u64 __initdata hpet_rate;
-    unsigned int hpet_id, hpet_period, hpet_cfg;
+    unsigned int hpet_id, hpet_period;
     unsigned int last, rem;
 
     if ( hpet_rate )
@@ -805,58 +864,7 @@ u64 __init hpet_setup(void)
      * Reconfigure the HPET into legacy mode to re-establish the timer
      * interrupt.
      */
-    if ( hpet_id & HPET_ID_LEGSUP &&
-         !((hpet_cfg = hpet_read32(HPET_CFG)) & HPET_CFG_LEGACY) )
-    {
-        unsigned int c0_cfg, ticks, count;
-
-        /* Stop the main counter. */
-        hpet_write32(hpet_cfg & ~HPET_CFG_ENABLE, HPET_CFG);
-
-        /* Reconfigure channel 0 to be 32bit periodic. */
-        c0_cfg = hpet_read32(HPET_Tn_CFG(0));
-        c0_cfg |= (HPET_TN_ENABLE | HPET_TN_PERIODIC | HPET_TN_SETVAL |
-                   HPET_TN_32BIT);
-        hpet_write32(c0_cfg, HPET_Tn_CFG(0));
-
-        /*
-         * The exact period doesn't have to match a legacy PIT.  All we need
-         * is an interrupt queued up via the IO-APIC to check routing.
-         *
-         * Use HZ as the frequency.
-         */
-        ticks = ((SECONDS(1) / HZ) * div_sc(hpet_rate, SECONDS(1), 32)) >> 32;
-
-        count = hpet_read32(HPET_COUNTER);
-
-        /*
-         * HPET_TN_SETVAL above is atrociously documented in the spec.
-         *
-         * Periodic HPET channels have a main comparator register, and
-         * separate "accumulator" register.  Despite being named accumulator
-         * in the spec, this is not an accurate description of its behaviour
-         * or purpose.
-         *
-         * Each time an interrupt is generated, the "accumulator" register is
-         * re-added to the comparator set up the new period.
-         *
-         * Normally, writes to the CMP register update both registers.
-         * However, under these semantics, it is impossible to set up a
-         * periodic timer correctly without the main HPET counter being at 0.
-         *
-         * Instead, HPET_TN_SETVAL is a self-clearing control bit which we can
-         * use for periodic timers to mean that the second write to CMP
-         * updates the accumulator only, and not the absolute comparator
-         * value.
-         *
-         * This lets us set a period when the main counter isn't at 0.
-         */
-        hpet_write32(count + ticks, HPET_Tn_CMP(0));
-        hpet_write32(ticks,         HPET_Tn_CMP(0));
-
-        /* Restart the main counter, and legacy mode. */
-        hpet_write32(hpet_cfg | HPET_CFG_ENABLE | HPET_CFG_LEGACY, HPET_CFG);
-    }
+    hpet_enable_legacy_replacement_mode();
 
     return hpet_rate;
 }
diff --git a/xen/include/asm-x86/hpet.h b/xen/include/asm-x86/hpet.h
index fb6bf05065..50176de3d2 100644
--- a/xen/include/asm-x86/hpet.h
+++ b/xen/include/asm-x86/hpet.h
@@ -73,6 +73,12 @@ void hpet_disable(void);
 int hpet_legacy_irq_tick(void);
 
 /*
+ * Try to enable HPET Legacy Replacement mode.  Returns a boolean indicating
+ * whether the HPET configuration was changed.
+ */
+bool hpet_enable_legacy_replacement_mode(void);
+
+/*
  * Temporarily use an HPET event counter for timer interrupt handling,
  * rather than using the LAPIC timer. Used for Cx state entry.
  */
-- 
2.11.0


