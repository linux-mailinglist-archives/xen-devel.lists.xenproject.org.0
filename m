Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 952D334AEDE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 20:00:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.102057.195526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPrgw-0007bS-7n; Fri, 26 Mar 2021 19:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102057.195526; Fri, 26 Mar 2021 19:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPrgv-0007aC-VI; Fri, 26 Mar 2021 19:00:17 +0000
Received: by outflank-mailman (input) for mailman id 102057;
 Fri, 26 Mar 2021 19:00:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPrgt-0007Ut-FD
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 19:00:15 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edcdd280-ad82-411d-99ca-a5063ee47bef;
 Fri, 26 Mar 2021 19:00:13 +0000 (UTC)
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
X-Inumbo-ID: edcdd280-ad82-411d-99ca-a5063ee47bef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616785212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pijmjnEufbImw81FhWbQec2beyZXgtBlQJQHB0Itw7E=;
  b=cUfm3dTQLCK7Ki/P5z68NDZxziXY/cto28/gLqs5+agNY5KDtycCYPiV
   9iA9OSPLltIpbqtWe0Kvd1eEE5q2oC7torGfSFUf67eXE3oWERuZdO6wu
   b+MGf41H+z8XtlKGNfjeSkpxtxaaVUq97ZfJHRumjCKCpIBD/x8AxAfG8
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: znjSmlvOe8c1BcBVKXTS8nqurRRZ9FyXKDFF9VBpV/8TYKpGQMXM94k1moU9xUUImDXT86RAd3
 afYVdG0L8cHK3Z066JpBRqeqy3rsRxoc3xId80Y5oLqxE4ONvnfExGRfDLMZkYgHvYhRyXfSfV
 54KrbBkuWQd54/PjwSk0VFYRzQl//KXYgXW0TcA6DgAti5XUUOnpPYTs3zKZLcskCHbS6hrKYR
 tvK+PCyMpf64RM0wVZWAhHI6FlRB96jfz0UEw8cxhWuAbZtHWm/zI7ClImQqm5/mmY9q3DKC4s
 JmY=
X-SBRS: 4.0
X-MesageID: 40605113
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:sR1ph6t38leYn8dlD/9y/ylP7skCzoYji2hD6mlwRA09T+WxrO
 rrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOj7U5FYyJGC3ronGhIo0n14vtxDX8Bzbzn9Qz6Y
 5JSII7MtH5CDFB4frSyAOzH888hPyO9661jenTpk0dMD1CQadm8gt/F0K/Gkp5WAFJCfMCZe
 ahz+BAoCetfmlSU9SjChA+LqT+jvDotLajWx4JABY79BKD5AnI1JfWGwWVty1uKg9n7qwl9Q
 H+4m7Ez4Wl98q20xrNk1LUhq4m4ufJ7vtmKIiyhtMOKjPq4zzYK7hJf7GZpjg6rKWOxT8R4a
 HxiiwtNchy9H/dF1vdyXCGtmmQswoG0HPsxUSVhnHuu6XCNUkHIvFMmJ5DdV/h41cg1esMiZ
 5j5X6TtJZcEHr77UDAzuXITB1jmw6VpncvgIco/hpieLYec7NYoMgj+lpUGv47bUXHwb0ged
 Meaf301bJzSxe3fnrZtm5gzJiHRXIoBCqLRUAEp4i8zyVWtGoR9TpX+OUv2lM7sL4tQZhN4O
 rJdo5ykqtVc8MQZaVhQM8cXMqMDHDXSx6kChPSHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHRVqHA1YECrLcGVxpVE/lTsTQyGLHTQ4/Abw6I8lqz3RbLtPyHGYkspidGcr/IWBdCeVO
 20PJ5QHv//PWrjEYtExGTFKttvAEhbdPdQlscwWlqIrM6OAJbtrPbnfPHaI6eoETtMYBK7Pl
 IzGBzIYOlQ5EGiXXH1xDLLXWn2R0D59ZVsVKzT/+0ZzpkRJpRB2zJlzWiR14WuE3lvo6Y2dE
 xxLPfMiaWgv1S7+m7O8iFuIRpSDkFc5b36SHNUrQoWM0f5GIxz+Om3SCR35j+qNxV/R8TZHE
 p0vFJs45+6KJSW2GQ/Ed69K3mbiHESvXqOSJ8ZlsS4lIDYU6J9KqxjdL16FA3NGRAwpB1jr3
 1bbhQYAmXFECn1tKmjhJsIJe3WetVmmj23KcpMpX+3jzTbmegfAl8gGx+nS4q+nBsnTTs8vC
 wPz4YvxJ673QuJBUR6quIiK1FIYHmQG9t9fXq4TbQRvKvqdgF2RXqNnhqAhXgICzLX3k0Pm2
 3sKjCVc/nXAlxb/mtVyLru7UkcTBTtQ2tgLn99qoFzDmLApzJ61vKKfLO61y+LZkIF2fx1Ck
 CPXRICZgdvzcuwzhibhXKLEmgn3IwnOoXmff0eWqCW3nOmM4uTk64aW/dS4ZZ+Ldjr9usGS/
 iWdQPQLDT2DYoSqkSoj2dgPCl/s38/l/z0nBXj8WijxXY6RePIP04OfcBuH/iMq2z/A/qY2p
 Rwitw4+eO2L2Xqc9aDjaXadSRKJB/fqXO/JttY46x8rOY3rv9+DpPbWTzH2DVc0BIyINz9mU
 keTK54iYqxTLNHbogXYWZU71ApnNOAIA83qQTwGPY5ZkxogHnBPd+FioC45IYHEwmEvk/3Nl
 ae+SEGoKuAUCuHyLIAC6U/ZW5Rc1Mx7Xx+/OWEM43cYT/aBd1r7R6/KDu6drQYVa2OXbMXpR
 x+68uTn+CWezHjsTqgygdTM+ZL6SK/Xci2AAiQAuZG/NyxJESUjsKRkb2OpSayTSH+dl8Rio
 JEf1EBd8hPijEti4sszyi5I5aH134Ngh9Z+jFollnkx4ig7iPaBCh9QH3kvqk=
X-IronPort-AV: E=Sophos;i="5.81,281,1610427600"; 
   d="scan'208";a="40605113"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Pierret?=
	<frederic.pierret@qubes-os.org>
Subject: [PATCH v2 2/3] x86/hpet: Don't enable legacy replacement mode unconditionally
Date: Fri, 26 Mar 2021 18:59:46 +0000
Message-ID: <20210326185947.23243-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210326185947.23243-1-andrew.cooper3@citrix.com>
References: <20210326185947.23243-1-andrew.cooper3@citrix.com>
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
 * Reinstate missing hunk from Jan's original patch.
 * Fix up "8254 PIT".
 * Drop "goto retry".

For 4.15: Attempt to unbreak AMD Ryzen 1800X systems.
---
 docs/misc/xen-command-line.pandoc | 33 +++++++++++++++++++++++++++
 xen/arch/x86/hpet.c               | 48 +++++++++++++++++++++++++--------------
 xen/arch/x86/io_apic.c            | 27 ++++++++++++++++++++++
 xen/include/asm-x86/hpet.h        |  1 +
 4 files changed, 92 insertions(+), 17 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a0601ff838..a4bd3f12c5 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1274,9 +1274,42 @@ supported. See docs/misc/arm/big.LITTLE.txt for more information.
 When the hmp-unsafe option is disabled (default), CPUs that are not
 identical to the boot CPU will be parked and not used by Xen.
 
+### hpet
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
+   8254 PIT, and allows the HPET to be configured into a compatible mode.
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
index c1d04f184f..bfa75f135a 100644
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
index e93265f379..3f131a81fb 100644
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
@@ -1930,6 +1932,31 @@ static void __init check_timer(void)
             local_irq_restore(flags);
             return;
         }
+
+        /*
+         * Intel chipsets from Skylake/ApolloLake onwards can statically clock
+         * gate the 8254 PIT.  This option is enabled by default in slightly
+         * later systems, as turning the PIT off is a prerequisite to entering
+         * the C11 power saving state.
+         *
+         * Xen currently depends on the legacy timer interrupt being active
+         * while IRQ routing is configured.
+         *
+         * If the user hasn't made an explicit choice, attempt to reconfigure
+         * the HPET into legacy mode to re-establish the timer interrupt.
+         */
+        if ( opt_hpet_legacy_replacement < 0 &&
+             hpet_enable_legacy_replacement_mode() )
+        {
+            printk(XENLOG_ERR "..no 8254 timer found - trying HPET Legacy Replacement Mode\n");
+
+            if ( timer_irq_works() )
+            {
+                local_irq_restore(flags);
+                return;
+            }
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


