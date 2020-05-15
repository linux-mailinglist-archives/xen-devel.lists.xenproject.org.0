Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 103AB1D4FAD
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 15:59:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZarP-0000RQ-Vc; Fri, 15 May 2020 13:58:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZarO-0000RH-Ji
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 13:58:46 +0000
X-Inumbo-ID: 2ed6e5d8-96b4-11ea-ae69-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ed6e5d8-96b4-11ea-ae69-bc764e2007e4;
 Fri, 15 May 2020 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589551123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGisH2+dxVByj66jlzhR1rIynA6hX56thdi9LQ2Txn8=;
 b=Lrt42LXdfj0SVEbkGqqXF/iVAdQ/lzk3L2NbHwMb/JnDLQijkYEt7fxJ
 Gf7nD7lHryCIbG9N4sDBKXlK0u7Zy+BrFL5Gv/MBLjfA6MewemeAOQl+V
 ySUBsEWjUiv8xkpdekg3LQBGEIepaDwqlKyroGfiB5dayPBuNeJCWUv9D o=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: IgMUU1DY5bJBi9zQvCIIKwh/7tktGi0K/5rxWMAYlvRkp5YlNyK37r+u/129x4e8ZFUTvS1pqF
 U1o4jbYJhBRPm7aLS0JG8dRr8Bq4pIR+1DeawfZDZGYqTce93pvYcIKWVJcEZU9UF1EGcFiIKM
 yFiISZWzJ5QdFwqyzxktWzH+uVtR0SWhWLV+5y7cc89gG2GGQ5w5uARvlDw15HQhLp4cQhYAtN
 TbFqNYt+IyzXg3ptbLAnsLVKkH73bgMdy8gO/G8j8vA9CgvsR9xITHyZmZynnQNZTjnHfVJLdU
 b3I=
X-SBRS: 2.7
X-MesageID: 17900393
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,395,1583211600"; d="scan'208";a="17900393"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 2/2] x86/idle: prevent entering C6 with in service
 interrupts on Intel
Date: Fri, 15 May 2020 15:58:02 +0200
Message-ID: <20200515135802.63853-3-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
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
Changes since v2:
 - Use x86_match_cpu and apply the workaround to all models from
   Broadwell to Cascade Lake.
 - Rename command line option to disable-c6-errata.

Changes since v1:
 - Unify workaround with errata_c6_eoi_workaround.
 - Properly check state in both acpi and mwait drivers.
---
 docs/misc/xen-command-line.pandoc |  9 +++++++
 xen/arch/x86/acpi/cpu_idle.c      | 39 +++++++++++++++++++++++++++----
 xen/arch/x86/cpu/mwait-idle.c     |  2 +-
 xen/include/asm-x86/cpuidle.h     |  2 +-
 4 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index ee12b0f53f..8dd944b357 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -652,6 +652,15 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
 additionally a trace buffer of the specified size is allocated per cpu.
 The debug trace feature is only enabled in debugging builds of Xen.
 
+### disable-c6-errata
+> `= <boolean>`
+
+> Default: `true for affected Intel CPUs`
+
+Workaround for Intel errata AAJ72 and BDX99, CLX30, SKX100, CFW125, BDF104,
+BDH85, BDM135, KWB131. Prevent entering C6 idle states when certain conditions
+are meet in order to avoid triggering the listed erratas.
+
 ### dma_bits
 > `= <integer>`
 
diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index 0efdaff21b..2fa1ccc031 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -548,9 +548,10 @@ void trace_exit_reason(u32 *irq_traced)
     }
 }
 
-bool errata_c6_eoi_workaround(void)
+bool errata_c6_workaround(void)
 {
     static int8_t __read_mostly fix_needed = -1;
+    boolean_param("disable-c6-errata", fix_needed);
 
     if ( unlikely(fix_needed == -1) )
     {
@@ -573,10 +574,40 @@ bool errata_c6_eoi_workaround(void)
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
+        const static struct x86_cpu_id isr_errata[] = {
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
@@ -685,7 +716,7 @@ static void acpi_processor_idle(void)
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
index 13879f58a1..dc7298a538 100644
--- a/xen/include/asm-x86/cpuidle.h
+++ b/xen/include/asm-x86/cpuidle.h
@@ -26,5 +26,5 @@ void update_idle_stats(struct acpi_processor_power *,
 void update_last_cx_stat(struct acpi_processor_power *,
                          struct acpi_processor_cx *, uint64_t);
 
-bool errata_c6_eoi_workaround(void);
+bool errata_c6_workaround(void);
 #endif /* __X86_ASM_CPUIDLE_H__ */
-- 
2.26.2


