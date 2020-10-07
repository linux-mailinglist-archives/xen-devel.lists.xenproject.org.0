Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6B2286027
	for <lists+xen-devel@lfdr.de>; Wed,  7 Oct 2020 15:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.3510.10083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQ9WV-0007wB-Kg; Wed, 07 Oct 2020 13:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 3510.10083; Wed, 07 Oct 2020 13:30:27 +0000
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
	id 1kQ9WV-0007vR-GU; Wed, 07 Oct 2020 13:30:27 +0000
Received: by outflank-mailman (input) for mailman id 3510;
 Wed, 07 Oct 2020 13:30:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kQ9WT-0007q4-Ss
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:30:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 803b2796-2b01-4962-970d-9d3c4ba9ea5f;
 Wed, 07 Oct 2020 13:30:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 541FEAF27;
 Wed,  7 Oct 2020 13:30:14 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Gg45=DO=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kQ9WT-0007q4-Ss
	for xen-devel@lists.xenproject.org; Wed, 07 Oct 2020 13:30:25 +0000
X-Inumbo-ID: 803b2796-2b01-4962-970d-9d3c4ba9ea5f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 803b2796-2b01-4962-970d-9d3c4ba9ea5f;
	Wed, 07 Oct 2020 13:30:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602077414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3mWN7Jm1cNuFETK+fgXLvgGY+7f39A/ML24lxKYie30=;
	b=sgXW1lw2xTYycx2+CiKHRUPRqfY7jshh3bK5pJhK8uBciUXE/wbknecRq6JpCtiXtDHJmX
	dh8zNvgrMFerWngwxWYFBITJzGkJhL8/k0ReHRoH6wL1RYXr9jwg8PHqQRYRYjaLM4UXCE
	7Q+BVFm/77kfL4Dx1pRlk/mzM2T9YSw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 541FEAF27;
	Wed,  7 Oct 2020 13:30:14 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/2] xen/x86: add nmi continuation framework
Date: Wed,  7 Oct 2020 15:30:10 +0200
Message-Id: <20201007133011.18871-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007133011.18871-1-jgross@suse.com>
References: <20201007133011.18871-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Actions in NMI context are rather limited as e.g. locking is rather
fragile.

Add a generic framework to continue processing in softirq context after
leaving NMI processing. This is working for NMIs happening in guest
context as NMI exit handling will issue an IPI to itself in case a
softirq is pending, resulting in the continuation running before the
guest gets control again.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/traps.c      | 37 +++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/nmi.h |  8 +++++++-
 xen/include/xen/softirq.h |  5 ++++-
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index bc5b8f8ea3..f433fe5acb 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1799,6 +1799,42 @@ void unset_nmi_callback(void)
     nmi_callback = dummy_nmi_callback;
 }
 
+static DEFINE_PER_CPU(void (*)(void *), nmi_cont_func);
+static DEFINE_PER_CPU(void *, nmi_cont_par);
+
+static void nmi_cont_softirq(void)
+{
+    unsigned int cpu = smp_processor_id();
+    void (*func)(void *par) = per_cpu(nmi_cont_func, cpu);
+    void *par = per_cpu(nmi_cont_par, cpu);
+
+    /* Reads must be done before following write (local cpu ordering only). */
+    barrier();
+
+    per_cpu(nmi_cont_func, cpu) = NULL;
+
+    if ( func )
+        func(par);
+}
+
+int set_nmi_continuation(void (*func)(void *par), void *par)
+{
+    unsigned int cpu = smp_processor_id();
+
+    if ( per_cpu(nmi_cont_func, cpu) )
+    {
+        printk("Trying to set NMI continuation while still one active!\n");
+        return -EBUSY;
+    }
+
+    per_cpu(nmi_cont_func, cpu) = func;
+    per_cpu(nmi_cont_par, cpu) = par;
+
+    raise_softirq(NMI_CONT_SOFTIRQ);
+
+    return 0;
+}
+
 void do_device_not_available(struct cpu_user_regs *regs)
 {
 #ifdef CONFIG_PV
@@ -2132,6 +2168,7 @@ void __init trap_init(void)
 
     cpu_init();
 
+    open_softirq(NMI_CONT_SOFTIRQ, nmi_cont_softirq);
     open_softirq(PCI_SERR_SOFTIRQ, pci_serr_softirq);
 }
 
diff --git a/xen/include/asm-x86/nmi.h b/xen/include/asm-x86/nmi.h
index a288f02a50..da40fb6599 100644
--- a/xen/include/asm-x86/nmi.h
+++ b/xen/include/asm-x86/nmi.h
@@ -33,5 +33,11 @@ nmi_callback_t *set_nmi_callback(nmi_callback_t *callback);
 void unset_nmi_callback(void);
 
 DECLARE_PER_CPU(unsigned int, nmi_count);
- 
+
+/**
+ * set_nmi_continuation
+ *
+ * Schedule a function to be started in softirq context after NMI handling.
+ */
+int set_nmi_continuation(void (*func)(void *par), void *par);
 #endif /* ASM_NMI_H */
diff --git a/xen/include/xen/softirq.h b/xen/include/xen/softirq.h
index 1f6c4783da..14c744bbf7 100644
--- a/xen/include/xen/softirq.h
+++ b/xen/include/xen/softirq.h
@@ -3,7 +3,10 @@
 
 /* Low-latency softirqs come first in the following list. */
 enum {
-    TIMER_SOFTIRQ = 0,
+#ifdef CONFIG_X86
+    NMI_CONT_SOFTIRQ,
+#endif
+    TIMER_SOFTIRQ,
     RCU_SOFTIRQ,
     SCHED_SLAVE_SOFTIRQ,
     SCHEDULE_SOFTIRQ,
-- 
2.26.2


