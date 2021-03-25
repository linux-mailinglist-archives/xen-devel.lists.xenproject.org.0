Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0C83497CF
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 18:22:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101498.194228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTg7-0003Y0-3u; Thu, 25 Mar 2021 17:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101498.194228; Thu, 25 Mar 2021 17:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTg7-0003Xb-0V; Thu, 25 Mar 2021 17:21:51 +0000
Received: by outflank-mailman (input) for mailman id 101498;
 Thu, 25 Mar 2021 17:21:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSM8=IX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPTg5-0003XV-2I
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 17:21:49 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af112a75-8ea3-4b1d-acf3-f547a9fbfe11;
 Thu, 25 Mar 2021 17:21:47 +0000 (UTC)
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
X-Inumbo-ID: af112a75-8ea3-4b1d-acf3-f547a9fbfe11
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616692907;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2FMF6636s1gd6L4x9OdWGb34bMRPcKFxHYCWNbXcEZg=;
  b=a0oJWyirGdR81W+NoOHdz2oWSncoaZ/IGTrsFn05R560G8Pv68S6jtO0
   ai9bvfQyxI0UJXmANUy1kmspJJHkYRmbXSodF9F09h36ePRArtnC8+mDG
   K4LYGmYOgtLClj+bn/ulWJAEanc40paNJrnP5xG87y1Vnwmqww8+8eDGe
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: m0+xdxxoX/hLVE7LURmN4a+75BCvTd9e4du/kfefGjjro87k4UuJk4CUhrYm6fE52kiwPmevUd
 EGV72VJ2MoQzi/XR++JZV0FmFt2cGpyR6AMk+k3+NEdqRqp+lRLRY0vsU08cEKCo5q2WL9RTLz
 VO6IQ3pYND16M8avFwLGw7+plKyFl1WLMc+sHopGDx/t5wHc5I//7CfNGZhwYlfJWwptKBpfNe
 qBXdli1t3x6K0pmGA7LOh9nhLjp1fot/k+sFTLanhGTH+d6GUVq6VpammCWcrUXz+kGtL07W5Y
 jik=
X-SBRS: 5.1
X-MesageID: 40027912
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:DtIqEamkPBwbuZ+2IH5hGMDyolHpDfP+imdD5ilNYBxZY6Wkvu
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/NIyKMaVI3DYCDNvmy0IIZ+qbbz2jGIIVybysdx94
 dFN5J/Btr5EERgga/BijWQPt48zLC8n5yAqvzZyx5WIz1CT4FFw0NHBh2AEktwLTM2YKYRMJ
 aH/MJIq36BVB0sH6eGL0IIVeTCuNHH/aiOCXI7LiUq9RWUineQ4KP6eiLy4j4lTzhNzb0+mF
 K18TDR26PLiZCG4y6Z7UD/xdB8mNztytxMbfb89/Q9G3HXpSuDIKhkU72GljgprO+o80ZCqq
 ixnz4Qe/5dxlmUUmapoQb8+wSI6kdQ11bSjWW2rFGmgcvlSCk0A8BM7LgpDCfx2g4bk/xXlI
 dotljp0KZ/PFf7swnWo+XsbVVMkHG5pHIz+NRj9EB3YM8lR5J66bAE8Fg9KuZnIAvKrLoJPc
 NJF8/m6PNfYTqhHgrkl1gq+tCqU3gpdy32O3Qqi4iQ2zhSqnhz01EV8swZhmsB75IwUfB/lp
 z5Dpg=
X-IronPort-AV: E=Sophos;i="5.81,278,1610427600"; 
   d="scan'208";a="40027912"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret?=
	<frederic.pierret@qubes-os.org>
Subject: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally
Date: Thu, 25 Mar 2021 17:21:32 +0000
Message-ID: <20210325172132.14980-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210325165224.10306-3-andrew.cooper3@citrix.com>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

Commit e1de4c196a2e ("x86/timer: Fix boot on Intel systems using ITSSPRC
static PIT clock gating") was reported to cause boot failures on certain
AMD Ryzen systems.

Refine the fix to do nothing in the default case, and only attempt to
configure legacy replacement mode if IRQ0 is found to not be working.

In addition, introduce a "hpet" command line option so this heuristic
can be overridden.  Since it makes little sense to introduce just
"hpet=legacy-replacement", also allow for a boolean argument as well as
"broadcast" to replace the separate "hpetbroadcast" option.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Frédéric Pierret <frederic.pierret@qubes-os.org>

v2:
 * Drop missing hunk from Jan's original patch.

For 4.15: Attempt to unbreak AMD Ryzen 1800X systems.
---
 docs/misc/xen-command-line.pandoc | 33 +++++++++++++++++++++++++++
 xen/arch/x86/hpet.c               | 48 +++++++++++++++++++++++++--------------
 xen/arch/x86/io_apic.c            | 26 +++++++++++++++++++++
 xen/include/asm-x86/hpet.h        |  1 +
 4 files changed, 91 insertions(+), 17 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a0601ff838..4d020d4ad7 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1274,9 +1274,42 @@ supported. See docs/misc/arm/big.LITTLE.txt for more information.
 When the hmp-unsafe option is disabled (default), CPUs that are not
 identical to the boot CPU will be parked and not used by Xen.
 
+### hpet (x86)
+    = List of [ <bool> | broadcast=<bool> | legacy-replacement=<bool> ]
+
+    Applicability: x86
+
+Controls Xen's use of the system's High Precision Event Timer.  By default,
+Xen will use an HPET when available and not subject to errata.  Use of the
+HPET can be disabled by specifying `hpet=0`.
+
+ * The `broadcast` boolean is disabled by default, but forces Xen to keep
+   using the broadcast for CPUs in deep C-states even when an RTC interrupt is
+   enabled.  This then also affects raising of the RTC interrupt.
+
+ * The `legacy-replacement` boolean allows for control over whether Legacy
+   Replacement mode is enabled.
+
+   Legacy Replacement mode is intended for hardware which does not have an
+   8025 PIT, and allows the HPET to be configured into a compatible mode.
+   Intel chipsets from Skylake/ApolloLake onwards can turn the PIT off for
+   power saving reasons, and there is no platform-agnostic mechanism for
+   discovering this.
+
+   By default, Xen will not change hardware configuration, unless the PIT
+   appears to be absent, at which point Xen will try to enable Legacy
+   Replacement mode before falling back to pre-IO-APIC interrupt routing
+   options.
+
+   This behaviour can be inhibited by specifying `legacy-replacement=0`.
+   Alternatively, this mode can be enabled unconditionally (if available) by
+   specifying `legacy-replacement=1`.
+
 ### hpetbroadcast (x86)
 > `= <boolean>`
 
+Deprecated alternative of `hpet=broadcast`.
+
 ### hvm_debug (x86)
 > `= <integer>`
 
diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index c73135bb15..957e053a47 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -52,6 +52,8 @@ static unsigned int __read_mostly num_hpets_used;
 DEFINE_PER_CPU(struct hpet_event_channel *, cpu_bc_channel);
 
 unsigned long __initdata hpet_address;
+int8_t __initdata opt_hpet_legacy_replacement = -1;
+static bool __initdata opt_hpet = true;
 u8 __initdata hpet_blockid;
 u8 __initdata hpet_flags;
 
@@ -63,6 +65,32 @@ u8 __initdata hpet_flags;
 static bool __initdata force_hpet_broadcast;
 boolean_param("hpetbroadcast", force_hpet_broadcast);
 
+static int __init parse_hpet_param(const char *s)
+{
+    const char *ss;
+    int val, rc = 0;
+
+    do {
+        ss = strchr(s, ',');
+        if ( !ss )
+            ss = strchr(s, '\0');
+
+        if ( (val = parse_bool(s, ss)) >= 0 )
+            opt_hpet = val;
+        else if ( (val = parse_boolean("broadcast", s, ss)) >= 0 )
+            force_hpet_broadcast = val;
+        else if ( (val = parse_boolean("legacy-replacement", s, ss)) >= 0 )
+            opt_hpet_legacy_replacement = val;
+        else
+            rc = -EINVAL;
+
+        s = ss + 1;
+    } while ( *ss );
+
+    return rc;
+}
+custom_param("hpet", parse_hpet_param);
+
 /*
  * Calculate a multiplication factor for scaled math, which is used to convert
  * nanoseconds based values to clock ticks:
@@ -820,12 +848,9 @@ u64 __init hpet_setup(void)
     unsigned int hpet_id, hpet_period;
     unsigned int last, rem;
 
-    if ( hpet_rate )
+    if ( hpet_rate || !hpet_address || !opt_hpet )
         return hpet_rate;
 
-    if ( hpet_address == 0 )
-        return 0;
-
     set_fixmap_nocache(FIX_HPET_BASE, hpet_address);
 
     hpet_id = hpet_read32(HPET_ID);
@@ -852,19 +877,8 @@ u64 __init hpet_setup(void)
     if ( (rem * 2) > hpet_period )
         hpet_rate++;
 
-    /*
-     * Intel chipsets from Skylake/ApolloLake onwards can statically clock
-     * gate the 8259 PIT.  This option is enabled by default in slightly later
-     * systems, as turning the PIT off is a prerequisite to entering the C11
-     * power saving state.
-     *
-     * Xen currently depends on the legacy timer interrupt being active while
-     * IRQ routing is configured.
-     *
-     * Reconfigure the HPET into legacy mode to re-establish the timer
-     * interrupt.
-     */
-    hpet_enable_legacy_replacement_mode();
+    if ( opt_hpet_legacy_replacement > 0 )
+        hpet_enable_legacy_replacement_mode();
 
     return hpet_rate;
 }
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index e93265f379..f08c60d71f 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -29,6 +29,8 @@
 #include <xen/acpi.h>
 #include <xen/keyhandler.h>
 #include <xen/softirq.h>
+
+#include <asm/hpet.h>
 #include <asm/mc146818rtc.h>
 #include <asm/smp.h>
 #include <asm/desc.h>
@@ -1922,14 +1924,38 @@ static void __init check_timer(void)
            vector, apic1, pin1, apic2, pin2);
 
     if (pin1 != -1) {
+        bool hpet_changed = false;
+
         /*
          * Ok, does IRQ0 through the IOAPIC work?
          */
         unmask_IO_APIC_irq(irq_to_desc(0));
+    retry_ioapic_pin:
         if (timer_irq_works()) {
             local_irq_restore(flags);
             return;
         }
+
+        /*
+         * Intel chipsets from Skylake/ApolloLake onwards can statically clock
+         * gate the 8259 PIT.  This option is enabled by default in slightly
+         * later systems, as turning the PIT off is a prerequisite to entering
+         * the C11 power saving state.
+         *
+         * Xen currently depends on the legacy timer interrupt being active
+         * while IRQ routing is configured.
+         *
+         * If the user hasn't made an explicit option, attempt to reconfigure
+         * the HPET into legacy mode to re-establish the timer interrupt.
+         */
+        if ( opt_hpet_legacy_replacement < 0 &&
+             !hpet_changed && hpet_enable_legacy_replacement_mode() )
+        {
+            printk(XENLOG_ERR "..no 8254 timer found - trying HPET Legacy Replacement Mode\n");
+            hpet_changed = true;
+            goto retry_ioapic_pin;
+        }
+
         clear_IO_APIC_pin(apic1, pin1);
         printk(KERN_ERR "..MP-BIOS bug: 8254 timer not connected to "
                "IO-APIC\n");
diff --git a/xen/include/asm-x86/hpet.h b/xen/include/asm-x86/hpet.h
index 50176de3d2..07bc8d6079 100644
--- a/xen/include/asm-x86/hpet.h
+++ b/xen/include/asm-x86/hpet.h
@@ -53,6 +53,7 @@
 extern unsigned long hpet_address;
 extern u8 hpet_blockid;
 extern u8 hpet_flags;
+extern int8_t opt_hpet_legacy_replacement;
 
 /*
  * Detect and initialise HPET hardware: return counter update frequency.
-- 
2.11.0


