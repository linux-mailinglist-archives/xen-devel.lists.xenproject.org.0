Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA53C2F4C30
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 14:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66526.118216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgAw-0002u0-VM; Wed, 13 Jan 2021 13:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66526.118216; Wed, 13 Jan 2021 13:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgAw-0002tN-Qx; Wed, 13 Jan 2021 13:27:02 +0000
Received: by outflank-mailman (input) for mailman id 66526;
 Wed, 13 Jan 2021 13:27:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=anHs=GQ=casper.srs.infradead.org=batv+0dec5b2398d3e162eee7+6352+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kzgAv-0002b0-IE
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:27:01 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 103f6eaf-5579-46d5-925d-ea5f697bf342;
 Wed, 13 Jan 2021 13:26:38 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1kzgA5-006IZR-9A; Wed, 13 Jan 2021 13:26:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kzgA4-001m36-Sg; Wed, 13 Jan 2021 13:26:08 +0000
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
X-Inumbo-ID: 103f6eaf-5579-46d5-925d-ea5f697bf342
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ho4i3xPvEsfhOFrN+XkJra5kbDJB4fktE5BGtTGmdkU=; b=vE/+eI9O0HlmkLl1r4pUM3OrUr
	9cWhNLpIvUHDvQjCWluhvgcsQG2NR8l3X+osqWAELZtGkEGbaycbXD36hKA0kmouxC3f8DuFWSObs
	pG33IKap2OjbCGCr9wzFOW8nMGWpyPJlG1aBQbb2YFfOSZrQIciokmJcQzOy2lFMyd/7bZX5OkRMC
	fkZ4wSBvpeOXeyQRrHwzlLQ0chWgKL1sp9BHQB5R9uAlLjDbGgk8pKRnfxqWV1EJAZp/woUNGTXYw
	jUOM6KZaAG074EGLd41HZIwHCS30mDkLoOw70aenwBULqfbymlcRIpU2XNkE4ZrteOJMzIZP7M/KA
	GQakA87Q==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v4 1/5] xen: Fix event channel callback via INTX/GSI
Date: Wed, 13 Jan 2021 13:26:02 +0000
Message-Id: <20210113132606.422794-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113132606.422794-1-dwmw2@infradead.org>
References: <20210113132606.422794-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

For a while, event channel notification via the PCI platform device
has been broken, because we attempt to communicate with xenstore before
we even have notifications working, with the xs_reset_watches() call
in xs_init().

We tend to get away with this on Xen versions below 4.0 because we avoid
calling xs_reset_watches() anyway, because xenstore might not cope with
reading a non-existent key. And newer Xen *does* have the vector
callback support, so we rarely fall back to INTX/GSI delivery.

To fix it, clean up a bit of the mess of xs_init() and xenbus_probe()
startup. Call xs_init() directly from xenbus_init() only in the !XS_HVM
case, deferring it to be called from xenbus_probe() in the XS_HVM case
instead.

Then fix up the invocation of xenbus_probe() to happen either from its
device_initcall if the callback is available early enough, or when the
callback is finally set up. This means that the hack of calling
xenbus_probe() from a workqueue after the first interrupt, or directly
from the PCI platform device setup, is no longer needed.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 arch/arm/xen/enlighten.c          |  2 +-
 drivers/xen/events/events_base.c  | 10 ----
 drivers/xen/platform-pci.c        |  1 -
 drivers/xen/xenbus/xenbus.h       |  1 +
 drivers/xen/xenbus/xenbus_comms.c |  8 ---
 drivers/xen/xenbus/xenbus_probe.c | 81 +++++++++++++++++++++++++------
 include/xen/xenbus.h              |  2 +-
 7 files changed, 70 insertions(+), 35 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 60e901cd0de6..5a957a9a0984 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -371,7 +371,7 @@ static int __init xen_guest_init(void)
 	}
 	gnttab_init();
 	if (!xen_initial_domain())
-		xenbus_probe(NULL);
+		xenbus_probe();
 
 	/*
 	 * Making sure board specific code will not set up ops for
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index a8030332a191..e850f79351cb 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -2060,16 +2060,6 @@ static struct irq_chip xen_percpu_chip __read_mostly = {
 	.irq_ack		= ack_dynirq,
 };
 
-int xen_set_callback_via(uint64_t via)
-{
-	struct xen_hvm_param a;
-	a.domid = DOMID_SELF;
-	a.index = HVM_PARAM_CALLBACK_IRQ;
-	a.value = via;
-	return HYPERVISOR_hvm_op(HVMOP_set_param, &a);
-}
-EXPORT_SYMBOL_GPL(xen_set_callback_via);
-
 #ifdef CONFIG_XEN_PVHVM
 /* Vector callbacks are better than PCI interrupts to receive event
  * channel notifications because we can receive vector callbacks on any
diff --git a/drivers/xen/platform-pci.c b/drivers/xen/platform-pci.c
index dd911e1ff782..9db557b76511 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -149,7 +149,6 @@ static int platform_pci_probe(struct pci_dev *pdev,
 	ret = gnttab_init();
 	if (ret)
 		goto grant_out;
-	xenbus_probe(NULL);
 	return 0;
 grant_out:
 	gnttab_free_auto_xlat_frames();
diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
index 2a93b7c9c159..dc1537335414 100644
--- a/drivers/xen/xenbus/xenbus.h
+++ b/drivers/xen/xenbus/xenbus.h
@@ -115,6 +115,7 @@ int xenbus_probe_node(struct xen_bus_type *bus,
 		      const char *type,
 		      const char *nodename);
 int xenbus_probe_devices(struct xen_bus_type *bus);
+void xenbus_probe(void);
 
 void xenbus_dev_changed(const char *node, struct xen_bus_type *bus);
 
diff --git a/drivers/xen/xenbus/xenbus_comms.c b/drivers/xen/xenbus/xenbus_comms.c
index eb5151fc8efa..e5fda0256feb 100644
--- a/drivers/xen/xenbus/xenbus_comms.c
+++ b/drivers/xen/xenbus/xenbus_comms.c
@@ -57,16 +57,8 @@ DEFINE_MUTEX(xs_response_mutex);
 static int xenbus_irq;
 static struct task_struct *xenbus_task;
 
-static DECLARE_WORK(probe_work, xenbus_probe);
-
-
 static irqreturn_t wake_waiting(int irq, void *unused)
 {
-	if (unlikely(xenstored_ready == 0)) {
-		xenstored_ready = 1;
-		schedule_work(&probe_work);
-	}
-
 	wake_up(&xb_waitq);
 	return IRQ_HANDLED;
 }
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 44634d970a5c..c8f0282bb649 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -683,29 +683,76 @@ void unregister_xenstore_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(unregister_xenstore_notifier);
 
-void xenbus_probe(struct work_struct *unused)
+void xenbus_probe(void)
 {
 	xenstored_ready = 1;
 
+	/*
+	 * In the HVM case, xenbus_init() deferred its call to
+	 * xs_init() in case callbacks were not operational yet.
+	 * So do it now.
+	 */
+	if (xen_store_domain_type == XS_HVM)
+		xs_init();
+
 	/* Notify others that xenstore is up */
 	blocking_notifier_call_chain(&xenstore_chain, 0, NULL);
 }
-EXPORT_SYMBOL_GPL(xenbus_probe);
 
-static int __init xenbus_probe_initcall(void)
+/*
+ * Returns true when XenStore init must be deferred in order to
+ * allow the PCI platform device to be initialised, before we
+ * can actually have event channel interrupts working.
+ */
+static bool xs_hvm_defer_init_for_callback(void)
 {
-	if (!xen_domain())
-		return -ENODEV;
+#ifdef CONFIG_XEN_PVHVM
+	return xen_store_domain_type == XS_HVM &&
+		!xen_have_vector_callback;
+#else
+	return false;
+#endif
+}
 
-	if (xen_initial_domain() || xen_hvm_domain())
-		return 0;
+static int __init xenbus_probe_initcall(void)
+{
+	/*
+	 * Probe XenBus here in the XS_PV case, and also XS_HVM unless we
+	 * need to wait for the platform PCI device to come up.
+	 */
+	if (xen_store_domain_type == XS_PV ||
+	    (xen_store_domain_type == XS_HVM &&
+	     !xs_hvm_defer_init_for_callback()))
+		xenbus_probe();
 
-	xenbus_probe(NULL);
 	return 0;
 }
-
 device_initcall(xenbus_probe_initcall);
 
+int xen_set_callback_via(uint64_t via)
+{
+	struct xen_hvm_param a;
+	int ret;
+
+	a.domid = DOMID_SELF;
+	a.index = HVM_PARAM_CALLBACK_IRQ;
+	a.value = via;
+
+	ret = HYPERVISOR_hvm_op(HVMOP_set_param, &a);
+	if (ret)
+		return ret;
+
+	/*
+	 * If xenbus_probe_initcall() deferred the xenbus_probe()
+	 * due to the callback not functioning yet, we can do it now.
+	 */
+	if (!xenstored_ready && xs_hvm_defer_init_for_callback())
+		xenbus_probe();
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xen_set_callback_via);
+
 /* Set up event channel for xenstored which is run as a local process
  * (this is normally used only in dom0)
  */
@@ -818,11 +865,17 @@ static int __init xenbus_init(void)
 		break;
 	}
 
-	/* Initialize the interface to xenstore. */
-	err = xs_init();
-	if (err) {
-		pr_warn("Error initializing xenstore comms: %i\n", err);
-		goto out_error;
+	/*
+	 * HVM domains may not have a functional callback yet. In that
+	 * case let xs_init() be called from xenbus_probe(), which will
+	 * get invoked at an appropriate time.
+	 */
+	if (xen_store_domain_type != XS_HVM) {
+		err = xs_init();
+		if (err) {
+			pr_warn("Error initializing xenstore comms: %i\n", err);
+			goto out_error;
+		}
 	}
 
 	if ((xen_store_domain_type != XS_LOCAL) &&
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 00c7235ae93e..2c43b0ef1e4d 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -192,7 +192,7 @@ void xs_suspend_cancel(void);
 
 struct work_struct;
 
-void xenbus_probe(struct work_struct *);
+void xenbus_probe(void);
 
 #define XENBUS_IS_ERR_READ(str) ({			\
 	if (!IS_ERR(str) && strlen(str) == 0) {		\
-- 
2.29.2


