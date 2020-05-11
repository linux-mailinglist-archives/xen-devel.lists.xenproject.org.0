Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B401CD64C
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 12:18:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY5Vz-0003au-PB; Mon, 11 May 2020 10:18:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmMB=6Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jY5Vy-0003ap-KP
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 10:18:26 +0000
X-Inumbo-ID: bfc2315d-9370-11ea-a1fe-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bfc2315d-9370-11ea-a1fe-12813bfff9fa;
 Mon, 11 May 2020 10:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589192305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=toaCxfPBf5Yk338+hhpOIhTaQZYVwK3BeAiQLNq/LKc=;
 b=WlCIL18TQ1zZjBPM/bslttIoLwqgC0Wp0d49cnvocJ0m767ae87hH0bi
 TKT3sw9d8hD1QUHH3oPeocpeZ3j7DVS8LThBpAdzrQsrKdBIkZMp5fJsN
 pKTKhL174zVIEPj6w/kMMmAxJ/RE1a/voHAgMAdDZ83PYTUzcR2mYz827 c=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: Gmi11WsyMls3IOeIrSYnF6b62AFjF+vU8utGL2vILPN+kpy0Gl/0jK+kz1r7YWRmaWxAFxbk0M
 ves/jAZqZEc22LBhYWxHcMw/ilYnd7YGgiMDdEPY6btT91vqKH99RRtghh2OMduvBptJhslmG8
 KquW1njBhonN/R3KFTCvhzcd9XNlJK1cfviyx9HA4NWgFic+IB9Uqnd2gevjerztllXxEIL4J/
 bOQK8KkCFMK8pVMyu8H6yrCNtOInB+Noin/s14zw2+dOZcs2zoqM6IeLlgLpGIh33iVcFPFLQW
 Q68=
X-SBRS: 2.7
X-MesageID: 17480036
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,379,1583211600"; d="scan'208";a="17480036"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2] x86/idle: prevent entering C6 with in service interrupts
 on Intel
Date: Mon, 11 May 2020 12:17:53 +0200
Message-ID: <20200511101753.36610-1-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Apply a workaround for Intel errata CLX30: "A Pending Fixed Interrupt
May Be Dispatched Before an Interrupt of The Same Priority Completes".

It's not clear which models are affected, as the errata is listed in
the "Second Generation Intel Xeon Scalable Processors" specification
update, but the issue has been seen as far back as Nehalem processors.
Apply the workaround to all Intel processors, the condition can be
relaxed later.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Unify workaround with errata_c6_eoi_workaround.
 - Properly check state in both acpi and mwait drivers.
---
 docs/misc/xen-command-line.pandoc |  8 ++++++++
 xen/arch/x86/acpi/cpu_idle.c      | 23 ++++++++++++-----------
 xen/arch/x86/cpu/mwait-idle.c     |  3 +++
 xen/include/asm-x86/cpuidle.h     |  1 +
 4 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index ee12b0f53f..6e868a2185 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -652,6 +652,14 @@ Specify the size of the console debug trace buffer. By specifying `cpu:`
 additionally a trace buffer of the specified size is allocated per cpu.
 The debug trace feature is only enabled in debugging builds of Xen.
 
+### disable-c6-isr
+> `= <boolean>`
+
+> Default: `true for Intel CPUs`
+
+Workaround for Intel errata CLX30. Prevent entering C6 idle states with in
+service local APIC interrupts. Enabled by default for all Intel CPUs.
+
 ### dma_bits
 > `= <integer>`
 
diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index b83446e77d..8ef05aeba3 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -555,20 +555,21 @@ void trace_exit_reason(u32 *irq_traced)
  * There was an errata with some Core i7 processors that an EOI transaction 
  * may not be sent if software enters core C6 during an interrupt service 
  * routine. So we don't enter deep Cx state if there is an EOI pending.
+ *
+ * Errata CLX30: A Pending Fixed Interrupt May Be Dispatched Before an
+ * Interrupt of The Same Priority Completes.
+ *
+ * Prevent entering C6 if there are pending lapic interrupts, or else the
+ * processor might dispatch further pending interrupts before the first one has
+ * been completed.
  */
-static bool errata_c6_eoi_workaround(void)
+bool errata_c6_eoi_workaround(void)
 {
-    static int8_t fix_needed = -1;
+    static int8_t __read_mostly fix_needed = -1;
+    boolean_param("disable-c6-isr", fix_needed);
 
     if ( unlikely(fix_needed == -1) )
-    {
-        int model = boot_cpu_data.x86_model;
-        fix_needed = (cpu_has_apic && !directed_eoi_enabled &&
-                      (boot_cpu_data.x86_vendor == X86_VENDOR_INTEL) &&
-                      (boot_cpu_data.x86 == 6) &&
-                      ((model == 0x1a) || (model == 0x1e) || (model == 0x1f) ||
-                       (model == 0x25) || (model == 0x2c) || (model == 0x2f)));
-    }
+        fix_needed = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
 
     return (fix_needed && cpu_has_pending_apic_eoi());
 }
@@ -676,7 +677,7 @@ static void acpi_processor_idle(void)
         return;
     }
 
-    if ( (cx->type == ACPI_STATE_C3) && errata_c6_eoi_workaround() )
+    if ( (cx->type >= ACPI_STATE_C3) && errata_c6_eoi_workaround() )
         cx = power->safe_state;
 
 
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index b81937966e..bb017c488f 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -770,6 +770,9 @@ static void mwait_idle(void)
 		return;
 	}
 
+	if (cx->type >= 3 && errata_c6_eoi_workaround())
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


