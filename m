Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C640851B49E
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 02:23:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321229.542188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPGw-0004z4-T9; Thu, 05 May 2022 00:23:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321229.542188; Thu, 05 May 2022 00:23:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmPGw-0004t7-Ko; Thu, 05 May 2022 00:23:10 +0000
Received: by outflank-mailman (input) for mailman id 321229;
 Thu, 05 May 2022 00:23:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YLaE=VN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nmPGv-0004pS-Fc
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 00:23:09 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a0f85db-cc09-11ec-a406-831a346695d4;
 Thu, 05 May 2022 02:23:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3698B81AF2;
 Thu,  5 May 2022 00:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA06C385AA;
 Thu,  5 May 2022 00:23:06 +0000 (UTC)
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
X-Inumbo-ID: 8a0f85db-cc09-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651710186;
	bh=jzqqLYPIU8TZVMVWEtLKqhjo+o2vN0T5c9gjvg8DczU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mJa8DW7x8TN40d7joD6W/6C38az0F/jRNXIG9CyyceJoYItNDMBkl/DLsFfNuMcHx
	 W/PdfvS8c3bz38cQ1/kmOwFfWAwj+n0+udfAz0cM4edtjbKTzokjxAylNe6I9l7Ldz
	 qdcQYqUu2tpZqNsWW50xItFPHBO0OFSPssK6J+YDzsLfzXDo5d/mJ+ZlOSE1YPvH0s
	 MLG354Hq3fNC5C82yNKsrSfI9QjMUi/dsjOpC6CeJNvTnvdKUmtK3nMV/fRbHGnFR4
	 UvqmWgplAO57Xl3tkdr+6LwlTXRieCQWwauYMHO60qczyOYwhVZdTTisjpJlmQqUMG
	 yyag0n/GHQtaQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v4 2/2] xen: add support for initializing xenstore later as HVM domain
Date: Wed,  4 May 2022 17:23:04 -0700
Message-Id: <20220505002304.401417-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2205041717070.43560@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041717070.43560@ubuntu-linux-20-04-desktop>
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
---
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
index fe360c33ce71..0a785d5e3e40 100644
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


