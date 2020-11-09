Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 477F62AB3FA
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 10:50:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.22269.48550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc3on-000387-3j; Mon, 09 Nov 2020 09:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 22269.48550; Mon, 09 Nov 2020 09:50:33 +0000
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
	id 1kc3om-00037L-W4; Mon, 09 Nov 2020 09:50:32 +0000
Received: by outflank-mailman (input) for mailman id 22269;
 Mon, 09 Nov 2020 09:50:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kc3ok-00032y-UC
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:50:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 73627980-4f17-4a32-8c9f-f9554f50e3a6;
 Mon, 09 Nov 2020 09:50:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AAA75AC23;
 Mon,  9 Nov 2020 09:50:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kc3ok-00032y-UC
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 09:50:30 +0000
X-Inumbo-ID: 73627980-4f17-4a32-8c9f-f9554f50e3a6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 73627980-4f17-4a32-8c9f-f9554f50e3a6;
	Mon, 09 Nov 2020 09:50:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604915423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1OcADNeqtn5le1IW034CfnSXJe+7ZXbQ3qogiKRAU7Y=;
	b=U584MBYlyKA0OmO+EmQRpJWo3L6D/lC8U9IOmHtAp+DfmcF7sHcckrOBXW5j73Dj/CNL8H
	JxejBerXqH53Nfby8wCmFQa0d5wqFUjEdmM24QOY1UWJ4OipRn0ZbZGdMqiZFJu6tXsVWV
	MF2SZMlAuDBx0XMRyEWC8P3zomCk7Aw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AAA75AC23;
	Mon,  9 Nov 2020 09:50:23 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/3] xen/x86: add nmi continuation framework
Date: Mon,  9 Nov 2020 10:50:19 +0100
Message-Id: <20201109095021.9897-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201109095021.9897-1-jgross@suse.com>
References: <20201109095021.9897-1-jgross@suse.com>
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
---
V4:
- make the framework less generic

V2:
- add prototype for continuation function (Roger Pau Monné)
- switch from softirq to explicit self-IPI (Jan Beulich)

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/apic.c       | 13 ++++++++++---
 xen/arch/x86/traps.c      | 19 +++++++++++++++++++
 xen/include/asm-x86/nmi.h | 11 ++++++++++-
 3 files changed, 39 insertions(+), 4 deletions(-)

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
index bc5b8f8ea3..5005ac6e6e 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -79,6 +79,7 @@
 #include <public/hvm/params.h>
 #include <asm/cpuid.h>
 #include <xsm/xsm.h>
+#include <asm/mach-default/irq_vectors.h>
 #include <asm/pv/traps.h>
 #include <asm/pv/mm.h>
 
@@ -1799,6 +1800,24 @@ void unset_nmi_callback(void)
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


