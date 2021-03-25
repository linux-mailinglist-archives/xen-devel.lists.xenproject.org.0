Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A82349752
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 17:52:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101472.194170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTDw-0008BS-RA; Thu, 25 Mar 2021 16:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101472.194170; Thu, 25 Mar 2021 16:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPTDw-0008AG-L7; Thu, 25 Mar 2021 16:52:44 +0000
Received: by outflank-mailman (input) for mailman id 101472;
 Thu, 25 Mar 2021 16:52:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gSM8=IX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPTDu-00089F-MZ
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 16:52:42 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c614e899-3e75-4f93-9eda-704564dac97a;
 Thu, 25 Mar 2021 16:52:41 +0000 (UTC)
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
X-Inumbo-ID: c614e899-3e75-4f93-9eda-704564dac97a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616691161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UmOB2jpI/LNrB0BQxya0yK8puikk3iTXwPa1pCoadQg=;
  b=MtzR9I0JgDMdaQNLPvFAoJiOpc/i+Ka+uS+vI9nSq9MlDfXgWbBib68Y
   3IMTWRwfW5vQzD9Oq7Ss3K/BdE8vNKFQwRmxhi0qjOIhBJR/ZcrwLzG1p
   IOH6pm0FasRgLtXiRYESs88tUUTDBxCEBKp9j83Zg71hNwaAzgcOtLoLD
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ZF5JUZj0PBnumeYqkxjXpDB5Z2DdwGuyRJDmERprCcJ4u4Ga1RzxYMvyBth5h0f0+GNast+IvF
 JXKM0sch9PNPhAFhVwVXcD/kH+pgBJ35h4pFyqqXgt9anXVbodmJHDl9g3RWEsPVwxf8rRKYoy
 49suzN2HEGxPsq8A4P2LjHLJi/DfkM1Dzwrw8XTudMDuWE5oErW2Jgbnb1/A+8jkrGzdLjRZ/X
 4q5DVrAogqBjRkmVtkyoqLYqRAumKEb/xVIwxL78doOQiV5wTHN8OymPWXmnebnkhhUURm/ILb
 55c=
X-SBRS: 5.1
X-MesageID: 40024416
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Iy04eK0FOg1DhiKEDkc51QqjBWByeYIsi2QD101hICF9WtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7LE/035Qd2+ksFJ2lWxTrv3btEZF64eLZslndMgDd1soY76
 dvdKBiFMb9ZGIRse/W6BS1euxO/PCp66at7N2x815IbSVHL55t9B14DAHzKDwSeCBjCYAiHJ
 SRouprzgDQGkg/VciwCnkbU+WrnbSi+K7OWhIaGwUhrDCHkDLA0tXHOiKF1RQTWS4n+8ZBzU
 H5lWXCh5mLgrWA5TL3k0TS6JlXn9WJ8Ko/OOW8zvI7Bx+ppgKhZIFKU6CPsjYvsIiUmSoXue
 iJmTgMFYBe7G7QY3GUrHLWqnbd+Qdr0VDO4xu5hmbuusPwTj5SMbs+uatpNiH3xmBlmfMU6t
 Mt40up86B5IDmFoQHGo//PbB1unlrcmwtYrccjy0ZxfKFbVKVctuUkjSVoOaZFJg3WwqY9Ht
 JjCcnNjcwmC2+yXjTism5jzMfEZAVLIj62BkwLusmi2zNLhnxOz0wB2MwFnnsbnahNM6V52w
 ==
X-IronPort-AV: E=Sophos;i="5.81,278,1610427600"; 
   d="scan'208";a="40024416"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret?=
	<frederic.pierret@qubes-os.org>
Subject: [PATCH 2/2] x86/hpet: Don't enable legacy replacement mode unconditionally
Date: Thu, 25 Mar 2021 16:52:24 +0000
Message-ID: <20210325165224.10306-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210325165224.10306-1-andrew.cooper3@citrix.com>
References: <20210325165224.10306-1-andrew.cooper3@citrix.com>
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

For 4.15: Attempt to unbreak AMD Ryzen 1800X systems.
---
 docs/misc/xen-command-line.pandoc | 33 ++++++++++++++++++++++++++++++
 xen/arch/x86/hpet.c               | 43 +++++++++++++++++++++++++++------------
 xen/arch/x86/io_apic.c            | 26 +++++++++++++++++++++++
 xen/include/asm-x86/hpet.h        |  1 +
 4 files changed, 90 insertions(+), 13 deletions(-)

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
index c73135bb15..270fef38c3 100644
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
@@ -852,19 +880,8 @@ u64 __init hpet_setup(void)
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


