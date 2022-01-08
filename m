Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC93488012
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 01:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254736.436602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zx8-0003wy-DT; Sat, 08 Jan 2022 00:51:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254736.436602; Sat, 08 Jan 2022 00:51:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5zx8-0003ss-A4; Sat, 08 Jan 2022 00:51:26 +0000
Received: by outflank-mailman (input) for mailman id 254736;
 Sat, 08 Jan 2022 00:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CE0l=RY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n5zx6-0003U9-Fm
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 00:51:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19929110-701d-11ec-9ce5-af14b9085ebd;
 Sat, 08 Jan 2022 01:51:23 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D36362033;
 Sat,  8 Jan 2022 00:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0B6AC36AEF;
 Sat,  8 Jan 2022 00:51:21 +0000 (UTC)
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
X-Inumbo-ID: 19929110-701d-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641603081;
	bh=Jru6tGMavNUeuCFUXUd/nBaH97FS3SVNSYf32+ByzXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HApksTU2rBHZBr+HoBqka+9zxnzSJuPolt2ZWa6jxuykcjrdlrX0Fu2aR9Vm3OHD7
	 HYDvXWHkomHaIcLBZ3c7Vqe2ZrIAL2+1uMiqn5TPvEj5Bnfw93J7M28PPBRSNQSqlH
	 ViH8QOmb7/P/PsaAVolfMY+6dVj5fcWQ3tmVYc0CdONbPNhs+g6Y9+2FjCLTWVXaBv
	 /9U9TOXuywIY1GLX9P57FlyJe+4wq1CvTayvVeI9BmxJIq5Q/6ELl/yFMxA3sgydoj
	 vjAos/HzXTmSGwd8dU0rnj3t1YfRmIQobBnX1Xs2+O02E6Jbk/dOYTZUrPJaLYdf36
	 ZlJ2Wsh6a0Rpw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: jgross@suse.com
Cc: boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	sstabellini@kernel.org,
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [LINUX PATCH 2/2] xen: add support for XENFEAT_xenstore_late_init
Date: Fri,  7 Jan 2022 16:51:19 -0800
Message-Id: <20220108005119.3820799-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2201071621100.2060010@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201071621100.2060010@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

XENFEAT_xenstore_late_init requires xenstore to be initialized later,
after receiving an event channel notification on the xenstore event
channel (which is available since boot).

This patch adds support for delaying the Xenstore initialization as
required when XENFEAT_xenstore_late_init is set.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 drivers/xen/xenbus/xenbus_probe.c | 78 ++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index fe360c33ce71..d4a982a883b7 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -65,6 +65,7 @@
 #include "xenbus.h"
 
 
+static int late_init_irq;
 int xen_store_evtchn;
 EXPORT_SYMBOL_GPL(xen_store_evtchn);
 
@@ -750,6 +751,17 @@ static void xenbus_probe(void)
 {
 	xenstored_ready = 1;
 
+	if (xen_feature(XENFEAT_xenstore_late_init)) {
+		xen_store_interface = xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
+						XEN_PAGE_SIZE);
+		/*
+		 * Now it is safe to free the IRQ used for xenstore late
+		 * initialization. No need to unbind: it is about to be
+		 * bound again.
+		 */
+		free_irq(late_init_irq, &xb_waitq);
+	}
+
 	/*
 	 * In the HVM case, xenbus_init() deferred its call to
 	 * xs_init() in case callbacks were not operational yet.
@@ -798,20 +810,23 @@ static int __init xenbus_probe_initcall(void)
 {
 	/*
 	 * Probe XenBus here in the XS_PV case, and also XS_HVM unless we
-	 * need to wait for the platform PCI device to come up.
+	 * need to wait for the platform PCI device to come up or
+	 * XENFEAT_xenstore_late_init is set.
 	 */
 	if (xen_store_domain_type == XS_PV ||
 	    (xen_store_domain_type == XS_HVM &&
-	     !xs_hvm_defer_init_for_callback()))
+	     !xs_hvm_defer_init_for_callback() &&
+	     !xen_feature(XENFEAT_xenstore_late_init)))
 		xenbus_probe();
 
 	/*
-	 * For XS_LOCAL, spawn a thread which will wait for xenstored
-	 * or a xenstore-stubdom to be started, then probe. It will be
-	 * triggered when communication starts happening, by waiting
-	 * on xb_waitq.
+	 * For XS_LOCAL or domains with XENFEAT_xenstore_late_init, spawn a
+	 * thread which will wait for xenstored or a xenstore-stubdom to be
+	 * started, then probe.  It will be triggered when communication
+	 * starts happening, by waiting on xb_waitq.
 	 */
-	if (xen_store_domain_type == XS_LOCAL) {
+	if (xen_store_domain_type == XS_LOCAL ||
+		xen_feature(XENFEAT_xenstore_late_init) ) {
 		struct task_struct *probe_task;
 
 		probe_task = kthread_run(xenbus_probe_thread, NULL,
@@ -907,6 +922,24 @@ static struct notifier_block xenbus_resume_nb = {
 	.notifier_call = xenbus_resume_cb,
 };
 
+static irqreturn_t xenbus_late_init(int irq, void *unused)
+{
+	int err = 0;
+	uint64_t v = 0;
+
+	err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
+	if (err)
+		return IRQ_HANDLED;
+	xen_store_evtchn = (int)v;
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
@@ -929,6 +962,36 @@ static int __init xenbus_init(void)
 	if (xen_pv_domain() && xen_start_info->store_evtchn)
 		xenstored_ready = 1;
 
+	/*
+	 * If a domain has been configured to initialize xenstore later
+	 * (e.g. dom0less domains), wait until the xenstore event channel is
+	 * triggered for the first time. The IRQ handler will take care for
+	 * initializing xenstore common variabiles that, in a standard
+	 * scenario, are configured here.
+	 */
+	if (xen_feature(XENFEAT_xenstore_late_init)) {
+		if (xen_store_domain_type != XS_HVM || xen_feature(XENFEAT_dom0)) {
+			pr_err("xenstore_late_init not supported this domain\n");
+			return -EINVAL;
+		}
+
+		err = hvm_get_parameter(HVM_PARAM_STORE_EVTCHN, &v);
+		if (err < 0) {
+			pr_err("xenstore_late_init err=%d\n", err);
+			return err;
+		}
+
+		err = bind_evtchn_to_irqhandler(v, xenbus_late_init,
+						0, "xenstore_late_init", &xb_waitq);
+		if (err < 0) {
+			pr_err("xenstore_late_init couldn't bind irq err=%d\n", err);
+			return err;
+		}
+
+		late_init_irq = err;
+		goto out_late_init;
+	}
+
 	switch (xen_store_domain_type) {
 	case XS_LOCAL:
 		err = xenstored_local_init();
@@ -995,6 +1058,7 @@ static int __init xenbus_init(void)
 		}
 	}
 
+out_late_init:
 	if ((xen_store_domain_type != XS_LOCAL) &&
 	    (xen_store_domain_type != XS_UNKNOWN))
 		xen_resume_notifier_register(&xenbus_resume_nb);
-- 
2.25.1


