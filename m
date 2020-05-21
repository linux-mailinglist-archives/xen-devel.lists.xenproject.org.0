Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BC41DC9F3
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 11:24:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbhQK-000425-DZ; Thu, 21 May 2020 09:23:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S6UB=7D=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jbhQI-000420-NU
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 09:23:30 +0000
X-Inumbo-ID: baa57a7c-9b44-11ea-aaeb-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id baa57a7c-9b44-11ea-aaeb-12813bfff9fa;
 Thu, 21 May 2020 09:23:28 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: kyRAjqcOd+fWqAf3a2AmUTJbOE4pK11IFSZLY/WDgzlKb/gif3ZyZhxKLrnWfMbdk6B7sZBw4v
 kzpgDXp4skGPCoN9LmL2JJfWCupc55sylwoKNqM5V/2jb8+GKgfhiEhgguBJI1YAXA3BCOjqht
 dMnTLoRt/IZbfXbGgs+jSBUMFMdzPxX1Hnf+aKiBJ7VtjPyKr9bfwSrf81ywj6ghMbvrlITC3v
 4aBQ4GDAJ0pOHc0eWGNmCB6nkeaNswSCT3hmArQpRN8vbYk2Wby9WCR0IcIyNRY73nA9riwQQS
 qMM=
X-SBRS: 2.7
X-MesageID: 18329862
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,417,1583211600"; d="scan'208";a="18329862"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v4] x86/idle: prevent entering C6 with in service interrupts
 on Intel
Date: Thu, 21 May 2020 11:22:58 +0200
Message-ID: <20200521092258.82503-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Apply a workaround for Intel errata BDX99, CLX30, SKX100, CFW125,
BDF104, BDH85, BDM135, KWB131: "A Pending Fixed Interrupt May Be
Dispatched Before an Interrupt of The Same Priority Completes".

Apply the errata to all server and client models (big cores) from
Broadwell to Cascade Lake. The workaround is grouped together with the
existing fix for errata AAJ72, and the eoi from the function name is
removed.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v3:
 - Remove command line option.
 - Switch order of static vs const.

Changes since v2:
 - Use x86_match_cpu and apply the workaround to all models from
   Broadwell to Cascade Lake.
 - Rename command line option to disable-c6-errata.

Changes since v1:
 - Unify workaround with errata_c6_eoi_workaround.
 - Properly check state in both acpi and mwait drivers.
---
 xen/arch/x86/acpi/cpu_idle.c  | 38 +++++++++++++++++++++++++++++++----
 xen/arch/x86/cpu/mwait-idle.c |  2 +-
 xen/include/asm-x86/cpuidle.h |  2 +-
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 82f108d301..178cb607c2 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -548,7 +548,7 @@ void trace_exit_reason(u32 *irq_traced)
     }
 }
 
-bool errata_c6_eoi_workaround(void)
+bool errata_c6_workaround(void)
 {
     static int8_t __read_mostly fix_needed = -1;
 
@@ -573,10 +573,40 @@ bool errata_c6_eoi_workaround(void)
             INTEL_FAM6_MODEL(0x2f),
             { }
         };
+        /*
+         * Errata BDX99, CLX30, SKX100, CFW125, BDF104, BDH85, BDM135, KWB131:
+         * A Pending Fixed Interrupt May Be Dispatched Before an Interrupt of
+         * The Same Priority Completes.
+         *
+         * Resuming from C6 Sleep-State, with Fixed Interrupts of the same
+         * priority queued (in the corresponding bits of the IRR and ISR APIC
+         * registers), the processor may dispatch the second interrupt (from
+         * the IRR bit) before the first interrupt has completed and written to
+         * the EOI register, causing the first interrupt to never complete.
+         */
+        static const struct x86_cpu_id isr_errata[] = {
+            /* Broadwell */
+            INTEL_FAM6_MODEL(0x47),
+            INTEL_FAM6_MODEL(0x3d),
+            INTEL_FAM6_MODEL(0x4f),
+            INTEL_FAM6_MODEL(0x56),
+            /* Skylake (client) */
+            INTEL_FAM6_MODEL(0x5e),
+            INTEL_FAM6_MODEL(0x4e),
+            /* {Sky/Cascade}lake (server) */
+            INTEL_FAM6_MODEL(0x55),
+            /* {Kaby/Coffee/Whiskey/Amber} Lake */
+            INTEL_FAM6_MODEL(0x9e),
+            INTEL_FAM6_MODEL(0x8e),
+            /* Cannon Lake */
+            INTEL_FAM6_MODEL(0x66),
+            { }
+        };
 #undef INTEL_FAM6_MODEL
 
-        fix_needed = cpu_has_apic && !directed_eoi_enabled &&
-                     x86_match_cpu(eoi_errata);
+        fix_needed = cpu_has_apic &&
+                     ((!directed_eoi_enabled && x86_match_cpu(eoi_errata)) ||
+                      x86_match_cpu(isr_errata));
     }
 
     return (fix_needed && cpu_has_pending_apic_eoi());
@@ -685,7 +715,7 @@ static void acpi_processor_idle(void)
         return;
     }
 
-    if ( (cx->type >= ACPI_STATE_C3) && errata_c6_eoi_workaround() )
+    if ( (cx->type >= ACPI_STATE_C3) && errata_c6_workaround() )
         cx = power->safe_state;
 
 
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 88a3e160c5..52eab81bf8 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -770,7 +770,7 @@ static void mwait_idle(void)
 		return;
 	}
 
-	if ((cx->type >= 3) && errata_c6_eoi_workaround())
+	if ((cx->type >= 3) && errata_c6_workaround())
 		cx = power->safe_state;
 
 	eax = cx->address;
diff --git a/xen/include/asm-x86/cpuidle.h b/xen/include/asm-x86/cpuidle.h
index 51368694dc..0981a8fd64 100644
--- a/xen/include/asm-x86/cpuidle.h
+++ b/xen/include/asm-x86/cpuidle.h
@@ -26,6 +26,6 @@ void update_idle_stats(struct acpi_processor_power *,
 void update_last_cx_stat(struct acpi_processor_power *,
                          struct acpi_processor_cx *, uint64_t);
 
-bool errata_c6_eoi_workaround(void);
+bool errata_c6_workaround(void);
 
 #endif /* __X86_ASM_CPUIDLE_H__ */
-- 
2.26.2


