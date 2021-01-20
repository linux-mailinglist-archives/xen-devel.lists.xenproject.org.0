Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4842FC6AD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 02:28:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71185.127341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l22I9-0002R8-O7; Wed, 20 Jan 2021 01:28:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71185.127341; Wed, 20 Jan 2021 01:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l22I9-0002Ql-KX; Wed, 20 Jan 2021 01:28:13 +0000
Received: by outflank-mailman (input) for mailman id 71185;
 Wed, 20 Jan 2021 01:28:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AECs=GX=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1l22I7-0002QP-Ro
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 01:28:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00c4a390-a96d-432d-bec1-f643e0c5191e;
 Wed, 20 Jan 2021 01:28:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A39FE23447;
 Wed, 20 Jan 2021 01:28:09 +0000 (UTC)
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
X-Inumbo-ID: 00c4a390-a96d-432d-bec1-f643e0c5191e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611106090;
	bh=DTDXBYAvLegemn4pqnV8Hz8yupUpTspWp1Tmm7EXYbQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bT+PXvjXeSRV947sqls/73HqtETgVe75XWphwXPVpn+Mryl5KekAKHKnU6JjJnvy6
	 UrljeZfua6GPLVwfqkuI/MjRkOs5TSctbJOX/BCGiAj8VQG7pyLYODM9YeBE4j1Ao/
	 zYJLSQkscIlrF2idRk9JEYzRHUacoFbVSRk7Rxg70gFWw6IpJRcyONfN2s+P5NEQdr
	 UsJKKDsG9Sg1Ei3EtMtnWyMa/HGUu/bJW1pMV5ri5vjuTQ1OweDbInLn+ucc3IIBoK
	 4//BRo/OLnIz3UGXbiJpOweibOJsWVaL/vB0hw3Xt81rHLSNpTqZL2k4vEPDjZhl+x
	 MpszmbPZo57WQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: David Woodhouse <dwmw@amazon.co.uk>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 5/9] xen: Fix event channel callback via INTX/GSI
Date: Tue, 19 Jan 2021 20:27:58 -0500
Message-Id: <20210120012802.770525-5-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012802.770525-1-sashal@kernel.org>
References: <20210120012802.770525-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: David Woodhouse <dwmw@amazon.co.uk>

[ Upstream commit 3499ba8198cad47b731792e5e56b9ec2a78a83a2 ]

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
Link: https://lore.kernel.org/r/20210113132606.422794-2-dwmw2@infradead.org
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
index ba7f4c8f5c3e4..e8e637c4f354d 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -393,7 +393,7 @@ static int __init xen_guest_init(void)
 	}
 	gnttab_init();
 	if (!xen_initial_domain())
-		xenbus_probe(NULL);
+		xenbus_probe();
 
 	/*
 	 * Making sure board specific code will not set up ops for
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index aca8456752797..8c08c7d46d3d0 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1987,16 +1987,6 @@ static struct irq_chip xen_percpu_chip __read_mostly = {
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
index 5d7dcad0b0a0d..4cec8146609ad 100644
--- a/drivers/xen/platform-pci.c
+++ b/drivers/xen/platform-pci.c
@@ -162,7 +162,6 @@ static int platform_pci_probe(struct pci_dev *pdev,
 	ret = gnttab_init();
 	if (ret)
 		goto grant_out;
-	xenbus_probe(NULL);
 	return 0;
 grant_out:
 	gnttab_free_auto_xlat_frames();
diff --git a/drivers/xen/xenbus/xenbus.h b/drivers/xen/xenbus/xenbus.h
index 139539b0ab20d..e6a8d02d35254 100644
--- a/drivers/xen/xenbus/xenbus.h
+++ b/drivers/xen/xenbus/xenbus.h
@@ -114,6 +114,7 @@ int xenbus_probe_node(struct xen_bus_type *bus,
 		      const char *type,
 		      const char *nodename);
 int xenbus_probe_devices(struct xen_bus_type *bus);
+void xenbus_probe(void);
 
 void xenbus_dev_changed(const char *node, struct xen_bus_type *bus);
 
diff --git a/drivers/xen/xenbus/xenbus_comms.c b/drivers/xen/xenbus/xenbus_comms.c
index eb5151fc8efab..e5fda0256feb3 100644
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
index 217bcc092a968..fe24e8dcb2b8e 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -674,29 +674,76 @@ void unregister_xenstore_notifier(struct notifier_block *nb)
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
@@ -810,11 +857,17 @@ static int __init xenbus_init(void)
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
index eba01ab5a55e0..fe9a9fa2ebc45 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -187,7 +187,7 @@ void xs_suspend_cancel(void);
 
 struct work_struct;
 
-void xenbus_probe(struct work_struct *);
+void xenbus_probe(void);
 
 #define XENBUS_IS_ERR_READ(str) ({			\
 	if (!IS_ERR(str) && strlen(str) == 0) {		\
-- 
2.27.0


