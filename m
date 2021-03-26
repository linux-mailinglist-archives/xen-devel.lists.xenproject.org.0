Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4169234AEE1
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 20:00:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.102056.195515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPrgv-0007a7-KK; Fri, 26 Mar 2021 19:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102056.195515; Fri, 26 Mar 2021 19:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPrgv-0007ZM-Fo; Fri, 26 Mar 2021 19:00:17 +0000
Received: by outflank-mailman (input) for mailman id 102056;
 Fri, 26 Mar 2021 19:00:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPrgt-0007YF-Dl
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 19:00:15 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 921b78e8-fa6d-4e3d-b97b-20b3fe291f33;
 Fri, 26 Mar 2021 19:00:14 +0000 (UTC)
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
X-Inumbo-ID: 921b78e8-fa6d-4e3d-b97b-20b3fe291f33
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616785214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Owj/a0DofXQQ1pbrqHaoX4QZh8e96kJPF3mOvOw79JI=;
  b=dg2HOhy4dwC0tN4caOKSHYpERJEpLPzx41zc7pSGGrsjguP/q3+X9d8J
   Ic5loMKRwuWZ/JS6lClpGWe6EmnQ8JuYJEAqFHjj8XW9ZVh4m/tsJTDY5
   dhkSrxOk4P7liK+7fooezSeDtrGWgqBpzrYFBPUnm/pUgiuORsIyNmSFE
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: iUTJQ4F+iFWnnIvdcpZl+54dk/M1KanUpRnRglrSjSC1p6miXqPe5wm4dYwxZNJqdCJ1554XmY
 1ugTvLbKpAUFXax6CUsXSq7D7UseF5dkqKv7OQ40jqdPDazoO8ACduyvkfmkibfyzOD1GpaCYb
 47uQtuBqUkxvgFQlgwZiRdtOdYZiO1OJoqLAQ+tGf+B0kgOBx6PhnwznToxmpzOyfCraZXXyxu
 SySCEUqpqHDkjgVYg3vE9jjRGBOO7OVshs1VyJWMu47PkzNYoeKTuPgQ64o8cbx5eGpGn4hMFy
 iCU=
X-SBRS: 4.0
X-MesageID: 40605116
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0hFm9qqWi6uyRAbsXIigvGMaV5uTKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQa3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIFg/I
 9aWexFBNX0ZGIXse/T6gO1Cstl5dGB/ryhi+u29QYRcShBbaZ84wBlTiOSFUNrTAdLbKBJaK
 a0zMxBujamZDArft22b0N1E9Triv/qsNbdYRAADwM68wXmt1KVwZPzDhTw5GZmbxph2rEnmF
 K18TDRxqLmiP2jzw+Z6mm71eUtpPLE6v9uQPOBkdIULDKEsHfmWK1EV6eZtD445MGDgWxa6O
 XkmBsrM8Rt5365RAjcynGBu3iC7B8U53Dv0lOei3f4yPaJPw4SMMZdmZlfNiLQ9ktIhqAk7I
 tww2mbu5BLZCmw+BjV2tnSWxlm0mqyrHYy+NRj6UB3bIoEZLdd6bEY5UNeea1wex7S1YZPKp
 gKMOjsoNJtNX+KZXHQuWdihPa2WG4oIxuASk8e/uSIzjl/hhlCvgUl7f1auk1F2IM2SpFC6e
 iBGL9vjqtyQsgfar84LPsdQPGwFnfGTXv3QSOvCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEd19Eq2goeQbLBdeV1JNGtjDBKV/NHQjF+4V73dxUq7f8TL3kPWmoU1Y1ifatpP0ZH4nVQP
 C2NJVKA+LyLGfnFIpTtjeOGaV6GD07aok4q9w7U1WBrobgMYvxrNHWd/7VOf7sHF8fKybCK0
 pGeAK2CNRL70itVHO9qgPWQWnRdkv2+o81FKDb+uMU2ZUcL4EkiHlQtX2JouWwbRFSuK0/e0
 VzZJn9lLmgmGWw9WHUq2NzOhRcCU5R6K76U2xDoBILN0+cS8dBh/yvPURpmFeXLB52SM3bVC
 RFoU5sxK6xJ5uMgTw5B8m/KWKchXsLrHeMR5MR85fzovvNS9cdNNILSaZxHQLEG1hJgg5ssn
 5EcxJBbFTYDCnShaKsi4E0COnTe8JnuhqiJddZpBvkxAOhjPBqYkFefja1FeaLnA4lRlNv9y
 JM2p5apIDFpBGCBi8Uhv8iPFhFdWKNaYg2cjitVcFzgbDkeAZ5UGGQoyeV4itDIlbC/1kOh2
 DnMC2fcezKBF0YoXxDzqP26jpPBxSgVlM1ZXZgvYJnE2Pa/n51zO+Qf6K2l3Ccc10Y34gmQX
 r4SCpXJgNl3Nas0hGJ3D6ECHU9350rV9atRYgLYvXW2nm3LpePmrxDF/hI/Ix9PNSrtuMQS+
 qQd0uUKzz/YtlZkzC9tzIgOCNurmMjnu6t0Br57HKg1Hp6GOHMOj1dNsUmCsDZ63KhS+eD0Z
 1/g95wteysMn/pYtrDza3MdTZMJh7avGbedZBjlblE+aYp8LdjFZjSVjXFkGtK2xgzN8/4nk
 ITSqYT2sG2BqZ/O8gJPy5J9Fsgk9qCaFYxugvtG+kkYBUjiWTYM97h2cuElZM/Rkma4A3+Nl
 mU/3cDo7PLXy6f2aUbDKx1K2JMc0Q44Glj+uTHd4C4MnTZS8hTuF6hdnm6e/tBTaLAH7MapB
 Nz+cuJkO+abDCQ4nGmgRJrZqZVt3+6SsazCh+WEeFG89amKU2B65Hak/KbnXPyU3+ncEwWio
 1OaFwIYslCgjckipcr0iLacN2Dnms1111E4T9mkVbx2o+ppGfDdHs2QTHkvg==
X-IronPort-AV: E=Sophos;i="5.81,281,1610427600"; 
   d="scan'208";a="40605116"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret?=
	<frederic.pierret@qubes-os.org>
Subject: [PATCH v2 1/3] x86/hpet: Factor hpet_enable_legacy_replacement_mode() out of hpet_setup()
Date: Fri, 26 Mar 2021 18:59:45 +0000
Message-ID: <20210326185947.23243-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210326185947.23243-1-andrew.cooper3@citrix.com>
References: <20210326185947.23243-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... in preparation to introduce a second caller.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Frédéric Pierret <frederic.pierret@qubes-os.org>

For 4.15.  Pre-req for trying to unbreak AMD Ryzen 1800X systems.

v2:
 * s/u64/uint64_t/
 * Drop id local variable
---
 xen/arch/x86/hpet.c        | 116 ++++++++++++++++++++++++---------------------
 xen/include/asm-x86/hpet.h |   6 +++
 2 files changed, 68 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 1ff005fb4a..c1d04f184f 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -754,11 +754,70 @@ int hpet_legacy_irq_tick(void)
 }
 
 static u32 *hpet_boot_cfg;
+static uint64_t __initdata hpet_rate;
+
+bool __init hpet_enable_legacy_replacement_mode(void)
+{
+    unsigned int cfg, c0_cfg, ticks, count;
+
+    if ( !hpet_rate ||
+         !(hpet_read32(HPET_ID) & HPET_ID_LEGSUP) ||
+         ((cfg = hpet_read32(HPET_CFG)) & HPET_CFG_LEGACY) )
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


