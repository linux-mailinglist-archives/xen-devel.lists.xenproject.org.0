Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 886AD48CFE6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 02:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256947.441275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oTJ-0007EM-8e; Thu, 13 Jan 2022 01:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256947.441275; Thu, 13 Jan 2022 01:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7oTJ-000796-5S; Thu, 13 Jan 2022 01:00:09 +0000
Received: by outflank-mailman (input) for mailman id 256947;
 Thu, 13 Jan 2022 01:00:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7oTH-0006MA-2g
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 01:00:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24ece892-740c-11ec-bd6f-bfb69f65cdc7;
 Thu, 13 Jan 2022 02:00:05 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF4B361BCB;
 Thu, 13 Jan 2022 01:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E44C36AE9;
 Thu, 13 Jan 2022 01:00:03 +0000 (UTC)
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
X-Inumbo-ID: 24ece892-740c-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642035604;
	bh=894PkSIwThzVc3Bij8r5rtzhdxDcpe7P+4k/m0m/WcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Re7m3TDQ+0SxdSa5cbtOYK19kiY3H+rYiFfB/Xq+wslcjYWSlL12lmzTtrKEJ5RMw
	 VUqh5o0pJFNjXXZ/d+hAueor5CygVbEvEfFphvchCTwamz51ABnx6eF04XbkfD30Kv
	 Nmih5bsWNh2DRG9WABOIZUZncxuoQs0uN5mO539drlIFctiYNKikL7BOT9xeeSyFaH
	 5BYyk8yEMSARYsc0/5mjCOleh5aE99MaM5Roeh7jhzWBHS1GzUJVKr2Mt0gbyI4h8b
	 uzIW5PrZyTUMl2kN39x8b3et57e6C8dwlONwO3XXltC3qvstSNhCkZfVTlU2U4NQj9
	 gdqTzlx0i1zLA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com
Cc: sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [LINUX PATCH v2 1/1] xen: add support for initializing xenstore later as HVM domain
Date: Wed, 12 Jan 2022 17:00:02 -0800
Message-Id: <20220113010002.1180463-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201121647460.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121647460.19362@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

When running as dom0less guest (HVM domain on ARM) the xenstore event
channel is available at domain creation but the shared xenstore
interface page only becomes available later on.

In that case, wait for a notification on the xenstore event channel,
then complete the xenstore initialization later, when the shared page
is actually available.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- remove XENFEAT_xenstore_late_init
---
 drivers/xen/xenbus/xenbus_probe.c | 80 +++++++++++++++++++++++--------
 1 file changed, 61 insertions(+), 19 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index fe360c33ce71..51e52e175892 100644
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
@@ -907,6 +921,20 @@ static struct notifier_block xenbus_resume_nb = {
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
@@ -959,23 +987,37 @@ static int __init xenbus_init(void)
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
+		}
 		break;
 	default:
 		pr_warn("Xenstore state unknown\n");
-- 
2.25.1


