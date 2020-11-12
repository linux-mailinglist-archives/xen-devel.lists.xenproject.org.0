Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022902B0616
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 14:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25847.53910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCQy-00069R-6A; Thu, 12 Nov 2020 13:14:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25847.53910; Thu, 12 Nov 2020 13:14:40 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdCQy-00068j-1V; Thu, 12 Nov 2020 13:14:40 +0000
Received: by outflank-mailman (input) for mailman id 25847;
 Thu, 12 Nov 2020 13:14:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kdCQw-0005zc-Lh
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:14:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8df1d582-b3fc-4503-9774-fc9fc284423b;
 Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E34EDAC75;
 Thu, 12 Nov 2020 13:14:26 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kdCQw-0005zc-Lh
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 13:14:38 +0000
X-Inumbo-ID: 8df1d582-b3fc-4503-9774-fc9fc284423b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8df1d582-b3fc-4503-9774-fc9fc284423b;
	Thu, 12 Nov 2020 13:14:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605186867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zktMZTHwnyh8KDaewloiOYrp8NVJ08f3acWn1GTzuRQ=;
	b=bwAv/CKwTJZpEl6+vBsDSeyO95J4zYnx4pm7vVM4JqM0x8OBmK9YXUTY2gKvlwrZFQy+MR
	OQQSn4+piHpPWQPoy2QctIrKrU/Xv3JMn1xXvdj7gPdEnc6IlWZHQoM7tpytZaUeZrjPh6
	BHC4IJtPNJ7lTEJY6jKRTFiczBDcpU8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E34EDAC75;
	Thu, 12 Nov 2020 13:14:26 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/3] xen/x86: add nmi continuation framework
Date: Thu, 12 Nov 2020 14:14:22 +0100
Message-Id: <20201112131424.9930-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201112131424.9930-1-jgross@suse.com>
References: <20201112131424.9930-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Actions in NMI context are rather limited as e.g. locking is rather
fragile.

Add a framework to continue processing in normal interrupt context
after leaving NMI processing.

This is done by a high priority interrupt vector triggered via a
self IPI from NMI context, which will then call the continuation
function specified during NMI handling.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
V5:
- add comment (Jan Beulich)

V4:
- make the framework less generic

V2:
- add prototype for continuation function (Roger Pau Monné)
- switch from softirq to explicit self-IPI (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/apic.c           | 13 ++++++++++---
 xen/arch/x86/genapic/x2apic.c |  1 +
 xen/arch/x86/smp.c            |  1 +
 xen/arch/x86/traps.c          | 21 +++++++++++++++++++++
 xen/include/asm-x86/nmi.h     | 11 ++++++++++-
 5 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 60627fd6e6..7497ddb5da 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -40,6 +40,7 @@
 #include <irq_vectors.h>
 #include <xen/kexec.h>
 #include <asm/guest.h>
+#include <asm/nmi.h>
 #include <asm/time.h>
 
 static bool __read_mostly tdt_enabled;
@@ -1376,16 +1377,22 @@ void spurious_interrupt(struct cpu_user_regs *regs)
 {
     /*
      * Check if this is a vectored interrupt (most likely, as this is probably
-     * a request to dump local CPU state). Vectored interrupts are ACKed;
-     * spurious interrupts are not.
+     * a request to dump local CPU state or to continue NMI handling).
+     * Vectored interrupts are ACKed; spurious interrupts are not.
      */
     if (apic_isr_read(SPURIOUS_APIC_VECTOR)) {
+        bool is_spurious;
+
         ack_APIC_irq();
+        is_spurious = !nmi_check_continuation();
         if (this_cpu(state_dump_pending)) {
             this_cpu(state_dump_pending) = false;
             dump_execstate(regs);
-            return;
+            is_spurious = false;
         }
+
+        if ( !is_spurious )
+            return;
     }
 
     /* see sw-dev-man vol 3, chapter 7.4.13.5 */
diff --git a/xen/arch/x86/genapic/x2apic.c b/xen/arch/x86/genapic/x2apic.c
index 077a576a7f..40284b70d1 100644
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -89,6 +89,7 @@ static unsigned int cpu_mask_to_apicid_x2apic_cluster(const cpumask_t *cpumask)
 
 static void send_IPI_self_x2apic(uint8_t vector)
 {
+    /* NMI continuation handling relies on using a shorthand here. */
     apic_wrmsr(APIC_SELF_IPI, vector);
 }
 
diff --git a/xen/arch/x86/smp.c b/xen/arch/x86/smp.c
index 14aa355a6b..eef0f9c6cb 100644
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -163,6 +163,7 @@ void send_IPI_self(int vector)
 
 void send_IPI_self_legacy(uint8_t vector)
 {
+    /* NMI continuation handling relies on using a shorthand here. */
     send_IPI_shortcut(APIC_DEST_SELF, vector, APIC_DEST_PHYSICAL);
 }
 
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index c27dd4cd43..5cbaa49031 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -79,6 +79,7 @@
 #include <public/hvm/params.h>
 #include <asm/cpuid.h>
 #include <xsm/xsm.h>
+#include <asm/mach-default/irq_vectors.h>
 #include <asm/pv/traps.h>
 #include <asm/pv/mm.h>
 
@@ -1800,6 +1801,26 @@ void unset_nmi_callback(void)
     nmi_callback = dummy_nmi_callback;
 }
 
+bool nmi_check_continuation(void)
+{
+    bool ret = false;
+
+    return ret;
+}
+
+void trigger_nmi_continuation(void)
+{
+    /*
+     * Issue a self-IPI. Handling is done in spurious_interrupt().
+     * NMI could have happened in IPI sequence, so wait for ICR being idle
+     * again before leaving NMI handler.
+     * This relies on self-IPI using a simple shorthand, thus avoiding any
+     * use of locking or percpu cpumasks.
+     */
+    send_IPI_self(SPURIOUS_APIC_VECTOR);
+    apic_wait_icr_idle();
+}
+
 void do_device_not_available(struct cpu_user_regs *regs)
 {
 #ifdef CONFIG_PV
diff --git a/xen/include/asm-x86/nmi.h b/xen/include/asm-x86/nmi.h
index a288f02a50..9a5da14162 100644
--- a/xen/include/asm-x86/nmi.h
+++ b/xen/include/asm-x86/nmi.h
@@ -33,5 +33,14 @@ nmi_callback_t *set_nmi_callback(nmi_callback_t *callback);
 void unset_nmi_callback(void);
 
 DECLARE_PER_CPU(unsigned int, nmi_count);
- 
+
+/**
+ * trigger_nmi_continuation
+ *
+ * Schedule continuation to be started in interrupt context after NMI handling.
+ */
+void trigger_nmi_continuation(void);
+
+/* Check for NMI continuation pending. */
+bool nmi_check_continuation(void);
 #endif /* ASM_NMI_H */
-- 
2.26.2


