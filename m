Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5D5305F17
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 16:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76134.137252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4mP6-0007C3-Sv; Wed, 27 Jan 2021 15:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76134.137252; Wed, 27 Jan 2021 15:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4mP6-0007Be-Os; Wed, 27 Jan 2021 15:06:44 +0000
Received: by outflank-mailman (input) for mailman id 76134;
 Wed, 27 Jan 2021 15:06:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csCD=G6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4mP5-0007BZ-8N
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:06:43 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 797b74f3-723d-4349-a160-f92233ece703;
 Wed, 27 Jan 2021 15:06:42 +0000 (UTC)
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
X-Inumbo-ID: 797b74f3-723d-4349-a160-f92233ece703
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611760001;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Urw+0M2RN5OXbE1CP5wlKFIaC/7H3qvdf/pd1my9Rkw=;
  b=RPX+7ydV4T0IZl5CG5lnWhll03jyZftloKX8u0lVb9Sp7XhByfXIvKuO
   PxoIxs5I0cIvkKHrNyJTsn3A3+cM0sxAWaqoCYcoBYqNLopQZSuJRRUIa
   kSoHr12UYrL1YiuYOpYnn7XYboaShhDL7oRcn8uEUcvL8ByqaCZNoq3Sj
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: W+gU9OUiDWb2Ww5VsZyQ22ioZjuhkvFbvoE+zpbcJGE7x+HjjOAQqwTqUY+sdoHqiGUN3pt7Xt
 ma43YpWQJfsdjZ5jwrDtAPpQsDItelbFBMMZ6TKcwqCL7l1fHJcPSg/SFJuD047D0A1v85XCxN
 BANC1xWWKwMfnWWU1UH+8KkQr+3X9Qg/fjlola9i8t8cjzn8UAIYFlKI+VegT/X2S0QBKqTQxU
 o6Jp2NMOpF4bvvoSMo8HnGvXQ0nxbFKrDhLQs5t9ye2h6aGPWJ+qqrntJrjEhbJxb6kZtx8Lh3
 H9I=
X-SBRS: 5.2
X-MesageID: 37285657
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,379,1602561600"; 
   d="scan'208";a="37285657"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Aaron Janse <aaron@ajanse.me>,
	Jason Andryuk <jandryuk@gmail.com>, Ondrej Balaz <blami@blami.net>, "Tamas K
 Lengyel" <tamas@tklengyel.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH v2] x86/timer: Fix boot on Intel systems using ITSSPRC static PIT clock gating
Date: Wed, 27 Jan 2021 15:06:15 +0000
Message-ID: <20210127150615.641-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Recent Intel client devices have disabled the legacy PIT for powersaving
reasons, breaking compatibility with a traditional IBM PC.  Xen depends on a
legacy timer interrupt to check that the IO-APIC/PIC routing is configured
correctly, and fails to boot with:

  (XEN) *******************************
  (XEN) Panic on CPU 0:
  (XEN) IO-APIC + timer doesn't work!  Boot with apic_verbosity=debug and send report.  Then try booting with the `noapic` option
  (XEN) *******************************

While this setting can be undone by Xen, the details of how to differ by
chipset, and would be very short sighted for battery based devices.  See bit 2
"8254 Static Clock Gating Enable" in:

  https://edc.intel.com/content/www/us/en/design/products-and-solutions/processors-and-chipsets/comet-lake-u/intel-400-series-chipset-on-package-platform-controller-hub-register-database/itss-power-reduction-control-itssprc-offset-3300/

All impacted systems have an HPET, but there is no indication of the absence
of PIT functionality, nor a suitable way to probe for its absence.  As a short
term fix, reconfigure the HPET into legacy replacement mode.  A better
longterm fix would be to avoid the reliance on the timer interrupt entirely.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Aaron Janse <aaron@ajanse.me>
CC: Jason Andryuk <jandryuk@gmail.com>
CC: Ondrej Balaz <blami@blami.net>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v2:
 * Fix build - misplaced bracket.
 * Tweak description of SETVAL.

Slightly RFC.  On older platforms this does generate some spurious PIC
interrupts during boot, but they're benign.  I was hoping to have time to fix
those too, but I'm getting an increasing number of requests to post this
patch.

Other followup actions:
 * Overhaul our setup logic.  Large quantities of it is legacy for pre-64bit
   systems, and not applicable to Xen these days.
 * Have Xen turn the PIT off when it isn't being used as the timesource.  Its
   a waste of time servicing useless interrupts.
 * Make `clocksource=pit` not enter an infinite loop on these systems
 * Drop all references to `noapic`.  These days, the only thing it will ever
   do is make a bad situation worse.
---
 xen/arch/x86/hpet.c | 64 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index e6fab8acd8..876c5e4769 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -758,7 +758,7 @@ static u32 *hpet_boot_cfg;
 u64 __init hpet_setup(void)
 {
     static u64 __initdata hpet_rate;
-    u32 hpet_id, hpet_period;
+    unsigned int hpet_id, hpet_period, hpet_cfg;
     unsigned int last, rem;
 
     if ( hpet_rate )
@@ -793,6 +793,68 @@ u64 __init hpet_setup(void)
     if ( (rem * 2) > hpet_period )
         hpet_rate++;
 
+    /*
+     * Intel chipsets from Skylake/ApolloLake onwards can statically clock
+     * gate the 8259 PIT.  This option is enabled by default in slightly later
+     * systems, as turning the PIT off is a prerequisite to entering the C11
+     * power saving state.
+     *
+     * Xen currently depends on the legacy timer interrupt being active while
+     * IRQ routing is configured.
+     *
+     * Reconfigure the HPET into legacy mode to re-establish the timer
+     * interrupt.
+     */
+    if ( hpet_id & HPET_ID_LEGSUP &&
+         !((hpet_cfg = hpet_read32(HPET_CFG)) & HPET_CFG_LEGACY) )
+    {
+        unsigned int c0_cfg, ticks, count;
+
+        /* Stop the main counter. */
+        hpet_write32(hpet_cfg & ~HPET_CFG_ENABLE, HPET_CFG);
+
+        /* Reconfigure channel 0 to be 32bit periodic. */
+        c0_cfg = hpet_read32(HPET_Tn_CFG(0));
+        c0_cfg |= (HPET_TN_ENABLE | HPET_TN_PERIODIC | HPET_TN_SETVAL |
+                   HPET_TN_32BIT);
+        hpet_write32(c0_cfg, HPET_Tn_CFG(0));
+
+        /*
+         * The exact period doesn't have to match a legacy PIT.  All we need
+         * is an interrupt queued up via the IO-APIC to check routing.
+         *
+         * Use HZ as the frequency.
+         */
+        ticks = ((SECONDS(1) / HZ) * div_sc(hpet_rate, SECONDS(1), 32)) >> 32;
+
+        count = hpet_read32(HPET_COUNTER);
+
+        /*
+         * HPET_TN_SETVAL above is atrociously documented in the spec.
+         *
+         * Periodic HPET channels have a main comparator register, and
+         * separate accumulator register.  Each time an interrupt is
+         * generated, the accumulator register is re-added to the comparator
+         * set up the new period.
+         *
+         * Normally, writes to the CMP register update both registers.
+         * However, under these semantics, it is impossible to set up a
+         * periodic timer correctly without the main HPET counter being at 0.
+         *
+         * Instead, HPET_TN_SETVAL is a self-clearing control bit which we can
+         * use for periodic timers to mean that the second write to CMP
+         * updates the accumulator only, and not the absolute comparator
+         * value.
+         *
+         * This lets us set a period when the main counter isn't at 0.
+         */
+        hpet_write32(count + ticks, HPET_Tn_CMP(0));
+        hpet_write32(ticks,         HPET_Tn_CMP(0));
+
+        /* Restart the main counter, and legacy mode. */
+        hpet_write32(hpet_cfg | HPET_CFG_ENABLE | HPET_CFG_LEGACY, HPET_CFG);
+    }
+
     return hpet_rate;
 }
 
-- 
2.11.0


