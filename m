Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 265751D4FAE
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 15:59:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZarK-0000R3-Nd; Fri, 15 May 2020 13:58:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZarJ-0000Qs-Iv
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 13:58:41 +0000
X-Inumbo-ID: 2b451bd8-96b4-11ea-b9cf-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b451bd8-96b4-11ea-b9cf-bc764e2007e4;
 Fri, 15 May 2020 13:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589551115;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9gp9wrRn7KriUqfiJcrm7JJ3iaK6QWAFr6UqKaTmPqA=;
 b=Nyu1ydGQhnnkTs3Z37gQQESMBInF4iQ6+07kuJZPkThc/rH5H0T4sXXQ
 8PlD1T8ZUIFIWrpAxRZOoCvks2o/nY97HRR6InIg5b9Pu6+UfZNpx2vdM
 O4DBSPgFrqyMO38xzJkgUajjsUj2NbeVvsMOltHEmdcbMYMBz0t9ZQzpZ g=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: wsU8T5RVIy4TwDZfNfGWqJH7KIhF++S5PgXkWVfYhWdlTE+WpOdLbtXF7aDDEHOnWURRrqNNfS
 wWXc5u/7PhSEO30wecvWa46Z13aWzgWuUbNdPdljwPlqP9vyUw6tBZVvFE9c+rchMnMuZf554P
 rlSy7nE6uGSA2dUigapgt4koBJKFMO5PwS3UKL6HoOuCJxlgEviR0BWBzq8NHDy7PCOLLsncG0
 TXvdt6lfEurwQGrzLI9K18c9sQJINEHnmDysrgx6YYbGRL1M+ofC/fB6zItluw/2rIOeZYixNl
 6J8=
X-SBRS: 2.7
X-MesageID: 17988403
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17988403"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 1/2] x86/idle: rework C6 EOI workaround
Date: Fri, 15 May 2020 15:58:01 +0200
Message-ID: <20200515135802.63853-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200515135802.63853-1-roger.pau@citrix.com>
References: <20200515135802.63853-1-roger.pau@citrix.com>
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

Change the C6 EOI workaround (errata AAJ72) to use x86_match_cpu. Also
call the workaround from mwait_idle, previously it was only used by
the ACPI idle driver. Finally make sure the routine is called for all
states equal or greater than ACPI_STATE_C3, note that the ACPI driver
doesn't currently handle them, but the errata condition shouldn't be
limited by that.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/x86/acpi/cpu_idle.c  | 43 +++++++++++++++++++++--------------
 xen/arch/x86/cpu/mwait-idle.c |  3 +++
 xen/include/asm-x86/cpuidle.h |  1 +
 3 files changed, 30 insertions(+), 17 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index b83446e77d..0efdaff21b 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -548,26 +548,35 @@ void trace_exit_reason(u32 *irq_traced)
     }
 }
 
-/*
- * "AAJ72. EOI Transaction May Not be Sent if Software Enters Core C6 During 
- * an Interrupt Service Routine"
- * 
- * There was an errata with some Core i7 processors that an EOI transaction 
- * may not be sent if software enters core C6 during an interrupt service 
- * routine. So we don't enter deep Cx state if there is an EOI pending.
- */
-static bool errata_c6_eoi_workaround(void)
+bool errata_c6_eoi_workaround(void)
 {
-    static int8_t fix_needed = -1;
+    static int8_t __read_mostly fix_needed = -1;
 
     if ( unlikely(fix_needed == -1) )
     {
-        int model = boot_cpu_data.x86_model;
-        fix_needed = (cpu_has_apic && !directed_eoi_enabled &&
-                      (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) &&
-                      (boot_cpu_data.x86 == 6) &&
-                      ((model == 0x1a) || (model == 0x1e) || (model == 0x1f) ||
-                       (model == 0x25) || (model == 0x2c) || (model == 0x2f)));
+#define INTEL_FAM6_MODEL(m) { X86_VENDOR_INTEL, 6, m, X86_FEATURE_ALWAYS }
+        /*
+         * Errata AAJ72: EOI Transaction May Not be Sent if Software Enters
+         * Core C6 During an Interrupt Service Routine"
+         *
+         * There was an errata with some Core i7 processors that an EOI
+         * transaction may not be sent if software enters core C6 during an
+         * interrupt service routine. So we don't enter deep Cx state if
+         * there is an EOI pending.
+         */
+        const static struct x86_cpu_id eoi_errata[] = {
+            INTEL_FAM6_MODEL(0x1a),
+            INTEL_FAM6_MODEL(0x1e),
+            INTEL_FAM6_MODEL(0x1f),
+            INTEL_FAM6_MODEL(0x25),
+            INTEL_FAM6_MODEL(0x2c),
+            INTEL_FAM6_MODEL(0x2f),
+            { }
+        };
+#undef INTEL_FAM6_MODEL
+
+        fix_needed = cpu_has_apic && !directed_eoi_enabled &&
+                     x86_match_cpu(eoi_errata);
     }
 
     return (fix_needed && cpu_has_pending_apic_eoi());
@@ -676,7 +685,7 @@ static void acpi_processor_idle(void)
         return;
     }
 
-    if ( (cx->type == ACPI_STATE_C3) && errata_c6_eoi_workaround() )
+    if ( (cx->type >= ACPI_STATE_C3) && errata_c6_eoi_workaround() )
         cx = power->safe_state;
 
 
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index b81937966e..88a3e160c5 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -770,6 +770,9 @@ static void mwait_idle(void)
 		return;
 	}
 
+	if ((cx->type >= 3) && errata_c6_eoi_workaround())
+		cx = power->safe_state;
+
 	eax = cx->address;
 	cstate = ((eax >> MWAIT_SUBSTATE_SIZE) & MWAIT_CSTATE_MASK) + 1;
 
diff --git a/xen/include/asm-x86/cpuidle.h b/xen/include/asm-x86/cpuidle.h
index 5d7dffd228..13879f58a1 100644
--- a/xen/include/asm-x86/cpuidle.h
+++ b/xen/include/asm-x86/cpuidle.h
@@ -26,4 +26,5 @@ void update_idle_stats(struct acpi_processor_power *,
 void update_last_cx_stat(struct acpi_processor_power *,
                          struct acpi_processor_cx *, uint64_t);
 
+bool errata_c6_eoi_workaround(void);
 #endif /* __X86_ASM_CPUIDLE_H__ */
-- 
2.26.2


