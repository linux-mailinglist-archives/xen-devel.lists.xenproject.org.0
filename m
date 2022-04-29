Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB046515667
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 23:10:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317758.537252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXsn-0005aw-Vk; Fri, 29 Apr 2022 21:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317758.537252; Fri, 29 Apr 2022 21:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkXsn-0005Z0-Sq; Fri, 29 Apr 2022 21:10:33 +0000
Received: by outflank-mailman (input) for mailman id 317758;
 Fri, 29 Apr 2022 21:10:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nkXsn-0005Yu-BJ
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 21:10:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd00835f-c800-11ec-8fc4-03012f2f19d4;
 Fri, 29 Apr 2022 23:10:31 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48B056222F;
 Fri, 29 Apr 2022 21:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0BDFC385A4;
 Fri, 29 Apr 2022 21:10:29 +0000 (UTC)
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
X-Inumbo-ID: cd00835f-c800-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651266630;
	bh=KmdTjeuSqmh9CE/tUKpNwFrF67mIaEHHOltqgoCVtxU=;
	h=From:To:Cc:Subject:Date:From;
	b=PzF6qHNaUB/VAMyIG0sbhyLAUhcomOyqMW5RBsN/PwMcQx8Onu6SZGUaqqtlrdSfL
	 wXYHCcb5v6M9tfxr1jcujJLv/WFIZvEN/DVe+tWMb+ULLDqSynkSzMngh5KVSImNTc
	 AA01tsxJXXdWhN5hxqNcIwlUo+DcQXNA84G38YdeJ6zAg4rK3aqv2XoiNwY7tlsOef
	 DpYpi17UELRvIy7FP7qtK7DfzCeFmOVwr2vvQJHEnS5+rFRjj/M5qUSu9hB9UCXQ67
	 3vmjesrEkA4OfY42Q17o1JqVX6L5xqMPs1vpNrOqqUvUUETVYvPmZETLkoHXsihGuZ
	 rcK06oCBG+tDA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	jgross@suse.com,
	boris.ostrovsky@oracle.com
Subject: [LINUX PATCH v3] xen: add support for initializing xenstore later as HVM domain
Date: Fri, 29 Apr 2022 14:10:27 -0700
Message-Id: <20220429211027.2034134-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
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
CC: jgross@suse.com
CC: boris.ostrovsky@oracle.com
---
Changes in v3:
- check for the connection field, if it is not zero, wait for event

Changes in v2:
- remove XENFEAT_xenstore_late_init
---
 drivers/xen/xenbus/xenbus_probe.c  | 86 +++++++++++++++++++++++-------
 include/xen/interface/io/xs_wire.h |  3 ++
 2 files changed, 70 insertions(+), 19 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index fe360c33ce71..dc046d25789e 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -65,6 +65,7 @@
 #include "xenbus.h"
 
 
+static int xs_init_irq;
 int xen_store_evtchn;
 EXPORT_SYMBOL_GPL(xen_store_evtchn);
 
@@ -750,6 +751,17 @@ static void xenbus_probe(void)
 {
 	xenstored_ready = 1;
 
+	if (!xen_store_interface) {
+		xen_store_interface = xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
+						XEN_PAGE_SIZE);
+		/*
+		 * Now it is safe to free the IRQ used for xenstore late
+		 * initialization. No need to unbind: it is about to be
+		 * bound again.
+		 */
+		free_irq(xs_init_irq, &xb_waitq);
+	}
+
 	/*
 	 * In the HVM case, xenbus_init() deferred its call to
 	 * xs_init() in case callbacks were not operational yet.
@@ -798,20 +810,22 @@ static int __init xenbus_probe_initcall(void)
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
@@ -907,10 +921,25 @@ static struct notifier_block xenbus_resume_nb = {
 	.notifier_call = xenbus_resume_cb,
 };
 
+static irqreturn_t xenbus_late_init(int irq, void *unused)
+{
+	int err = 0;
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
@@ -959,23 +988,42 @@ static int __init xenbus_init(void)
 		 *
 		 * Also recognize all bits set as an invalid value.
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
+						__func__, v);
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
+			if (xen_store_interface->connection != 0)
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
diff --git a/include/xen/interface/io/xs_wire.h b/include/xen/interface/io/xs_wire.h
index d40a44f09b16..cd7ae5ebb133 100644
--- a/include/xen/interface/io/xs_wire.h
+++ b/include/xen/interface/io/xs_wire.h
@@ -87,6 +87,9 @@ struct xenstore_domain_interface {
     char rsp[XENSTORE_RING_SIZE]; /* Replies and async watch events. */
     XENSTORE_RING_IDX req_cons, req_prod;
     XENSTORE_RING_IDX rsp_cons, rsp_prod;
+    uint32_t server_features; /* Bitmap of features supported by the server */
+    uint32_t connection;
+    uint32_t error;
 };
 
 /* Violating this is very bad.  See docs/misc/xenstore.txt. */
-- 
2.25.1


