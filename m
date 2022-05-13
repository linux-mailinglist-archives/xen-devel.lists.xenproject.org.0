Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22937526C41
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 23:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328859.552033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npchN-0003XB-QP; Fri, 13 May 2022 21:19:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328859.552033; Fri, 13 May 2022 21:19:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npchN-0003UA-Mz; Fri, 13 May 2022 21:19:45 +0000
Received: by outflank-mailman (input) for mailman id 328859;
 Fri, 13 May 2022 21:19:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npchL-0003Bg-Vn
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 21:19:43 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 672742ff-d302-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 23:19:42 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A4EB62314;
 Fri, 13 May 2022 21:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550F0C34113;
 Fri, 13 May 2022 21:19:40 +0000 (UTC)
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
X-Inumbo-ID: 672742ff-d302-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652476780;
	bh=bilc60kub9Jt+89+0VvQBOq5M0jsXFwdI/d4eFUURIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pOPTONZ+xevYYDUIfEq7+1V70ZmDaYD/GR9gzPL4FkPDqMRkApP6Q6SkT3QdynkkB
	 RpbNK5vj5xzQ8WtEyPbg07QzEphRck+zhn1+SZRN9Ugc6DSLDQ5Jj+0GrG4BxvSBev
	 lEgxidEInASsP7rqrzxBc3gC21thVD6AFgxW9PuK46YwQx1iG4tYgNCGte/s7w7LF2
	 +5LJcUC27u+kKJ4wZUUQzQKYX94eiFVulFxDN/uv9nArsTv3eNVYOnuf49VRZsehtI
	 Gp2+UizmCUX7XESzjLCSPpV4WNCYcGBgZWVwCDgyAaE8QobybmJkeP7vaWqYEsjTQT
	 c4k+I7h/ct/Og==
From: Stefano Stabellini <sstabellini@kernel.org>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH LINUX v5 2/2] xen: add support for initializing xenstore later as HVM domain
Date: Fri, 13 May 2022 14:19:38 -0700
Message-Id: <20220513211938.719341-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205131417320.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205131417320.3842@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

When running as dom0less guest (HVM domain on ARM) the xenstore event
channel is available at domain creation but the shared xenstore
interface page only becomes available later on.

In that case, wait for a notification on the xenstore event channel,
then complete the xenstore initialization later, when the shared page
is actually available.

The xenstore page has few extra field. Add them to the shared struct.
One of the field is "connection", when the connection is ready, it is
zero. If the connection is not-zero, wait for a notification.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
Changes in v5:
- no need to initialize local variable err
- code alignment

Changes in v4:
- improve in-code comments
- move header sync to separate patch
- use XENSTORE_CONNECTED

Changes in v3:
- check for the connection field, if it is not zero, wait for event

Changes in v2:
- remove XENFEAT_xenstore_late_init
---
 drivers/xen/xenbus/xenbus_probe.c | 91 ++++++++++++++++++++++++-------
 1 file changed, 71 insertions(+), 20 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index fe360c33ce71..d367f2bd2b93 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -65,6 +65,7 @@
 #include "xenbus.h"
 
 
+static int xs_init_irq;
 int xen_store_evtchn;
 EXPORT_SYMBOL_GPL(xen_store_evtchn);
 
@@ -750,6 +751,20 @@ static void xenbus_probe(void)
 {
 	xenstored_ready = 1;
 
+	if (!xen_store_interface) {
+		xen_store_interface = xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
+						XEN_PAGE_SIZE);
+		/*
+		 * Now it is safe to free the IRQ used for xenstore late
+		 * initialization. No need to unbind: it is about to be
+		 * bound again from xb_init_comms. Note that calling
+		 * unbind_from_irqhandler now would result in xen_evtchn_close()
+		 * being called and the event channel not being enabled again
+		 * afterwards, resulting in missed event notifications.
+		 */
+		free_irq(xs_init_irq, &xb_waitq);
+	}
+
 	/*
 	 * In the HVM case, xenbus_init() deferred its call to
 	 * xs_init() in case callbacks were not operational yet.
@@ -798,20 +813,22 @@ static int __init xenbus_probe_initcall(void)
 {
 	/*
 	 * Probe XenBus here in the XS_PV case, and also XS_HVM unless we
-	 * need to wait for the platform PCI device to come up.
+	 * need to wait for the platform PCI device to come up or
+	 * xen_store_interface is not ready.
 	 */
 	if (xen_store_domain_type == XS_PV ||
 	    (xen_store_domain_type == XS_HVM &&
-	     !xs_hvm_defer_init_for_callback()))
+	     !xs_hvm_defer_init_for_callback() &&
+	     xen_store_interface != NULL))
 		xenbus_probe();
 
 	/*
-	 * For XS_LOCAL, spawn a thread which will wait for xenstored
-	 * or a xenstore-stubdom to be started, then probe. It will be
-	 * triggered when communication starts happening, by waiting
-	 * on xb_waitq.
+	 * For XS_LOCAL or when xen_store_interface is not ready, spawn a
+	 * thread which will wait for xenstored or a xenstore-stubdom to be
+	 * started, then probe.  It will be triggered when communication
+	 * starts happening, by waiting on xb_waitq.
 	 */
-	if (xen_store_domain_type == XS_LOCAL) {
+	if (xen_store_domain_type == XS_LOCAL || xen_store_interface == NULL) {
 		struct task_struct *probe_task;
 
 		probe_task = kthread_run(xenbus_probe_thread, NULL,
@@ -907,10 +924,25 @@ static struct notifier_block xenbus_resume_nb = {
 	.notifier_call = xenbus_resume_cb,
 };
 
+static irqreturn_t xenbus_late_init(int irq, void *unused)
+{
+	int err;
+	uint64_t v = 0;
+
+	err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
+	if (err || !v || !~v)
+		return IRQ_HANDLED;
+	xen_store_gfn = (unsigned long)v;
+
+	wake_up(&xb_waitq);
+	return IRQ_HANDLED;
+}
+
 static int __init xenbus_init(void)
 {
 	int err;
 	uint64_t v = 0;
+	bool wait = false;
 	xen_store_domain_type = XS_UNKNOWN;
 
 	if (!xen_domain())
@@ -957,25 +989,44 @@ static int __init xenbus_init(void)
 		 * been properly initialized. Instead of attempting to map a
 		 * wrong guest physical address return error.
 		 *
-		 * Also recognize all bits set as an invalid value.
+		 * Also recognize all bits set as an invalid/uninitialized value.
 		 */
-		if (!v || !~v) {
+		if (!v) {
 			err = -ENOENT;
 			goto out_error;
 		}
-		/* Avoid truncation on 32-bit. */
+		if (v == ~0ULL) {
+			wait = true;
+		} else {
+			/* Avoid truncation on 32-bit. */
 #if BITS_PER_LONG == 32
-		if (v > ULONG_MAX) {
-			pr_err("%s: cannot handle HVM_PARAM_STORE_PFN=%llx > ULONG_MAX\n",
-			       __func__, v);
-			err = -EINVAL;
-			goto out_error;
-		}
+			if (v > ULONG_MAX) {
+				pr_err("%s: cannot handle HVM_PARAM_STORE_PFN=%llx > ULONG_MAX\n",
+				       __func__, v);
+				err = -EINVAL;
+				goto out_error;
+			}
 #endif
-		xen_store_gfn = (unsigned long)v;
-		xen_store_interface =
-			xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
-				  XEN_PAGE_SIZE);
+			xen_store_gfn = (unsigned long)v;
+			xen_store_interface =
+				xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
+					  XEN_PAGE_SIZE);
+			if (xen_store_interface->connection != XENSTORE_CONNECTED)
+				wait = true;
+		}
+		if (wait) {
+			err = bind_evtchn_to_irqhandler(xen_store_evtchn,
+							xenbus_late_init,
+							0, "xenstore_late_init",
+							&xb_waitq);
+			if (err < 0) {
+				pr_err("xenstore_late_init couldn't bind irq err=%d\n",
+				       err);
+				return err;
+			}
+
+			xs_init_irq = err;
+		}
 		break;
 	default:
 		pr_warn("Xenstore state unknown\n");
-- 
2.25.1


