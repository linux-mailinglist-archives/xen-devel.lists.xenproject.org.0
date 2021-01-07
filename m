Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 263AA2EC795
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 02:08:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62735.111229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxJlO-0002FV-G4; Thu, 07 Jan 2021 01:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62735.111229; Thu, 07 Jan 2021 01:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxJlO-0002Ee-CZ; Thu, 07 Jan 2021 01:06:54 +0000
Received: by outflank-mailman (input) for mailman id 62735;
 Thu, 07 Jan 2021 01:06:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF5u=GK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kxJlM-0002EZ-Th
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 01:06:53 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f68fabf4-056b-481f-8d64-799f6c8c77f4;
 Thu, 07 Jan 2021 01:06:51 +0000 (UTC)
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
X-Inumbo-ID: f68fabf4-056b-481f-8d64-799f6c8c77f4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609981611;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vR9nesXtTOSixMgyzb7aT0cXHKCwDH7p8HXXH0yewMM=;
  b=AxoNYj2gviSdoiqCouaucipRHZlHPdvQbIfJKu0cbQTETi2mlmWzf6e+
   6krF3IZl9fpez2EtcxRPUYlWonSRS4/IjZWUFg81MZu3TTFj2WJlIFnBJ
   FX9mapRX0Is5Fc+7TtPP28hL9aEadmac1VGP8JEL2j9pIRnTGStUn0lgn
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: v2/oISLZVvTIoB7qCaQB90H8q31ztRQLknPgZHvxdnr12iGTBFTg5uXdldsKUCiol5y3xETbX3
 uKFMW2SPVoH3f1enKcKmgn3PunwL+juhG/D7NyYCpdhAqkNuI6fLAF6VLCtWIw7QjZ5bOEjgaq
 J3VH7K982gAtjJj8uPD5kCMqDM4QnfhMcpJp2dyYUCVqGC07W6mN18ejRhzmyxQuAPIlkNMGIq
 D1ZtD8h4tQbpcpVUdyQqtkHtSvWPqZAvtBrEQGJ3e6Gvmpxm/vWh7OO2S89BlCJlw57PFYPuT0
 14A=
X-SBRS: 5.2
X-MesageID: 34544464
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,328,1602561600"; 
   d="scan'208";a="34544464"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Aaron Janse <aaron@ajanse.me>,
	Jason Andryuk <jandryuk@gmail.com>, Ondrej Balaz <blami@blami.net>, "Tamas K
 Lengyel" <tamas@tklengyel.com>, =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>
Subject: [PATCH] x86/timer: Fix boot on Intel systems using ITSSPRC static PIT clock gating
Date: Thu, 7 Jan 2021 01:06:25 +0000
Message-ID: <20210107010625.5993-1-andrew.cooper3@citrix.com>
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
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Aaron Janse <aaron@ajanse.me>
CC: Jason Andryuk <jandryuk@gmail.com>
CC: Ondrej Balaz <blami@blami.net>
CC: Tamas K Lengyel <tamas@tklengyel.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

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
 xen/arch/x86/hpet.c | 67 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index e6fab8acd8..f9541af537 100644
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
@@ -793,6 +793,71 @@ u64 __init hpet_setup(void)
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
+        ticks = (SECONDS(1) / HZ) * div_sc(hpet_rate, SECONDS(1), 32)) >> 32;
+
+        count = hpet_read32(HPET_COUNTER);
+
+        /*
+         * HPET_TN_SETVAL above is atrociously documented in the spec.
+         *
+         * Periodic HPET channels have a main comparator register, and cache
+         * the "last write to cmp", as a hidden register.
+         *
+         * The semantics on generating a periodic interrupt is:
+         *   cmp += "last value written to the cmp register"
+         * which will reload a new period.
+         *
+         * Normally, writes to cmp update the main comparator as well as being
+         * cached for the reload value.  However, under these semantics, the
+         * HPET main counter needs resetting to 0 to be able to configure the
+         * period correctly.
+         *
+         * Instead, HPET_TN_SETVAL is a self-clearing control bit which we can
+         * use for periodic timers to mean that the second write to the
+         * comparator updates only the "last written" cache, and not the
+         * absolute comparator value.
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


