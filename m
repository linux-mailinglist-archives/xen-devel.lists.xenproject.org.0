Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3710C1C8C02
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 15:23:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWgUB-0002k5-T5; Thu, 07 May 2020 13:22:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Plze=6V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jWgUA-0002jx-9A
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 13:22:46 +0000
X-Inumbo-ID: d634a900-9065-11ea-9f16-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d634a900-9065-11ea-9f16-12813bfff9fa;
 Thu, 07 May 2020 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588857765;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ohO7AnoRpCbzgs5lJJjQilidAWSjQyWi/0LojJaAd5g=;
 b=W4UWVyhsZrldF7CPOcNp+ElQMNkFBKVu2dGzcuF2cHWx15InN7cHaGjR
 BFl1MzD7LKE5ECCrzHHgtEFMGo8m1j7yhrcb/AZUMygmDXNGwjuqTNlTF
 W3m0h3al0QB+ieyWBDwuBejMfGCRdtZB2sPbcX3TH2C0NpNKnuDN7wJMz I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
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
IronPort-SDR: U8wNX+1i06jVBHHKqZ2ABG+xdmUlD413NO8xppoppu2nvmqGYVejyT6T1KhczayLAJtpCVtGj1
 FmrtELFMVMhNv1uK4X+Q2o4dYn2OAtbKV93nQE/lZNZVZQBIOz+hC6dnuReM57wkMhEY26Xl0e
 Vnjk46ZEbB3aX2Kg3IwDkhZG3ZvP6MkE88wsqFVT0fJ5tQLvbGxS1Hyq/rnOFqmB7qMPZjyQ7p
 i0RGtmLMkxXBqRU4JAmZkgZyNVIekapXWEEzZOMCPFRBhvOH7oPll0i83qmMM6iuoxlQ1qW8UB
 lSQ=
X-SBRS: 2.7
X-MesageID: 17344624
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,363,1583211600"; d="scan'208";a="17344624"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/idle: prevent entering C6 with in service interrupts on
 Intel
Date: Thu, 7 May 2020 15:22:36 +0200
Message-ID: <20200507132236.26010-1-roger.pau@citrix.com>
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
 docs/misc/xen-command-line.pandoc |  8 ++++++++
 xen/arch/x86/acpi/cpu_idle.c      | 22 +++++++++++++++++++++-
 xen/arch/x86/cpu/mwait-idle.c     |  3 +++
 xen/include/asm-x86/cpuidle.h     |  1 +
 4 files changed, 33 insertions(+), 1 deletion(-)

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
index b83446e77d..5023fea148 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -573,6 +573,25 @@ static bool errata_c6_eoi_workaround(void)
     return (fix_needed && cpu_has_pending_apic_eoi());
 }
 
+static int8_t __read_mostly disable_c6_isr = -1;
+boolean_param("disable-c6-isr", disable_c6_isr);
+
+/*
+ * Errata CLX30: A Pending Fixed Interrupt May Be Dispatched Before an
+ * Interrupt of The Same Priority Completes.
+ *
+ * Prevent entering C6 if there are pending lapic interrupts, or else the
+ * processor might dispatch further pending interrupts before the first one has
+ * been completed.
+ */
+bool errata_c6_isr_workaround(void)
+{
+    if ( unlikely(disable_c6_isr == -1) )
+        disable_c6_isr = boot_cpu_data.x86_vendor == X86_VENDOR_INTEL;
+
+    return disable_c6_isr && cpu_has_pending_apic_eoi();
+}
+
 void update_last_cx_stat(struct acpi_processor_power *power,
                          struct acpi_processor_cx *cx, uint64_t ticks)
 {
@@ -676,7 +695,8 @@ static void acpi_processor_idle(void)
         return;
     }
 
-    if ( (cx->type == ACPI_STATE_C3) && errata_c6_eoi_workaround() )
+    if ( (cx->type == ACPI_STATE_C3) &&
+         (errata_c6_eoi_workaround() || errata_c6_isr_workaround()) )
         cx = power->safe_state;
 
 
diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index b81937966e..e14cdaeed7 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -770,6 +770,9 @@ static void mwait_idle(void)
 		return;
 	}
 
+	if (cx->type == ACPI_STATE_C3 && errata_c6_isr_workaround())
+		cx = power->safe_state;
+
 	eax = cx->address;
 	cstate = ((eax >> MWAIT_SUBSTATE_SIZE) & MWAIT_CSTATE_MASK) + 1;
 
diff --git a/xen/include/asm-x86/cpuidle.h b/xen/include/asm-x86/cpuidle.h
index 5d7dffd228..8b9d6fdb15 100644
--- a/xen/include/asm-x86/cpuidle.h
+++ b/xen/include/asm-x86/cpuidle.h
@@ -26,4 +26,5 @@ void update_idle_stats(struct acpi_processor_power *,
 void update_last_cx_stat(struct acpi_processor_power *,
                          struct acpi_processor_cx *, uint64_t);
 
+bool errata_c6_isr_workaround(void);
 #endif /* __X86_ASM_CPUIDLE_H__ */
-- 
2.26.2


