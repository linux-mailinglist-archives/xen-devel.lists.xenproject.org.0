Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCAD29003A
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 10:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7831.20638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTLUu-0002HK-Ty; Fri, 16 Oct 2020 08:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7831.20638; Fri, 16 Oct 2020 08:54:00 +0000
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
	id 1kTLUu-0002GL-Pg; Fri, 16 Oct 2020 08:54:00 +0000
Received: by outflank-mailman (input) for mailman id 7831;
 Fri, 16 Oct 2020 08:53:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kTLUt-0002Cr-6S
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:53:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0514ee4d-f27f-4eec-91c8-876f51d5a0c1;
 Fri, 16 Oct 2020 08:53:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 92038ADE8;
 Fri, 16 Oct 2020 08:53:52 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JQTg=DX=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kTLUt-0002Cr-6S
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 08:53:59 +0000
X-Inumbo-ID: 0514ee4d-f27f-4eec-91c8-876f51d5a0c1
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0514ee4d-f27f-4eec-91c8-876f51d5a0c1;
	Fri, 16 Oct 2020 08:53:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602838432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zyQ6eY76TMGPa8WVIau7vgU5vO2lNHpIxzzWhjQGo/o=;
	b=BZLrBXjW2NcVN4gnBUmmQWXJtGnOha8usIRFFMsQ2VKj+cEPtjvMRMe+WLRCvluBZBmLsv
	Mii/naLC/ClGU3oocMpFgwxQ7VGuXUPGEGb2b5Fvpx+5gFEimK2aYGzlnT9/rxIA/zVZIY
	MIeL9jIWDa6bq+svRUamZlH99qnEcUM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 92038ADE8;
	Fri, 16 Oct 2020 08:53:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 1/3] xen/x86: add nmi continuation framework
Date: Fri, 16 Oct 2020 10:53:48 +0200
Message-Id: <20201016085350.10233-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201016085350.10233-1-jgross@suse.com>
References: <20201016085350.10233-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Actions in NMI context are rather limited as e.g. locking is rather
fragile.

Add a generic framework to continue processing in normal interrupt
context after leaving NMI processing.

This is done by a high priority interrupt vector triggered via a
self IPI from NMI context, which will then call the continuation
function specified during NMI handling.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add prototype for continuation function (Roger Pau Monné)
- switch from softirq to explicit self-IPI (Jan Beulich)
---
 xen/arch/x86/apic.c       | 13 +++++++---
 xen/arch/x86/traps.c      | 52 +++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/nmi.h | 13 +++++++++-
 3 files changed, 74 insertions(+), 4 deletions(-)

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
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index bc5b8f8ea3..6f4db9d549 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -79,6 +79,7 @@
 #include <public/hvm/params.h>
 #include <asm/cpuid.h>
 #include <xsm/xsm.h>
+#include <asm/mach-default/irq_vectors.h>
 #include <asm/pv/traps.h>
 #include <asm/pv/mm.h>
 
@@ -1799,6 +1800,57 @@ void unset_nmi_callback(void)
     nmi_callback = dummy_nmi_callback;
 }
 
+static DEFINE_PER_CPU(nmi_contfunc_t *, nmi_cont_func);
+static DEFINE_PER_CPU(void *, nmi_cont_arg);
+static DEFINE_PER_CPU(bool, nmi_cont_busy);
+
+bool nmi_check_continuation(void)
+{
+    unsigned int cpu = smp_processor_id();
+    nmi_contfunc_t *func = per_cpu(nmi_cont_func, cpu);
+    void *arg = per_cpu(nmi_cont_arg, cpu);
+
+    if ( per_cpu(nmi_cont_busy, cpu) )
+    {
+        per_cpu(nmi_cont_busy, cpu) = false;
+        printk("Trying to set NMI continuation while still one active!\n");
+    }
+
+    /* Reads must be done before following write (local cpu ordering only). */
+    barrier();
+
+    per_cpu(nmi_cont_func, cpu) = NULL;
+
+    if ( func )
+        func(arg);
+
+    return func;
+}
+
+int set_nmi_continuation(nmi_contfunc_t *func, void *arg)
+{
+    unsigned int cpu = smp_processor_id();
+
+    if ( per_cpu(nmi_cont_func, cpu) )
+    {
+        per_cpu(nmi_cont_busy, cpu) = true;
+        return -EBUSY;
+    }
+
+    per_cpu(nmi_cont_func, cpu) = func;
+    per_cpu(nmi_cont_arg, cpu) = arg;
+
+    /*
+     * Issue a self-IPI. Handling is done in spurious_interrupt().
+     * NMI could have happened in IPI sequence, so wait for ICR being idle
+     * again before leaving NMI handler.
+     */
+    send_IPI_self(SPURIOUS_APIC_VECTOR);
+    apic_wait_icr_idle();
+
+    return 0;
+}
+
 void do_device_not_available(struct cpu_user_regs *regs)
 {
 #ifdef CONFIG_PV
diff --git a/xen/include/asm-x86/nmi.h b/xen/include/asm-x86/nmi.h
index a288f02a50..68db75b1ed 100644
--- a/xen/include/asm-x86/nmi.h
+++ b/xen/include/asm-x86/nmi.h
@@ -33,5 +33,16 @@ nmi_callback_t *set_nmi_callback(nmi_callback_t *callback);
 void unset_nmi_callback(void);
 
 DECLARE_PER_CPU(unsigned int, nmi_count);
- 
+
+typedef void nmi_contfunc_t(void *arg);
+
+/**
+ * set_nmi_continuation
+ *
+ * Schedule a function to be started in interrupt context after NMI handling.
+ */
+int set_nmi_continuation(nmi_contfunc_t *func, void *arg);
+
+/* Check for NMI continuation pending. */
+bool nmi_check_continuation(void);
 #endif /* ASM_NMI_H */
-- 
2.26.2


