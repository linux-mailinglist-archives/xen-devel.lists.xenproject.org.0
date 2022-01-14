Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A6448E283
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jan 2022 03:27:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257524.442578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8CHm-0000A4-5x; Fri, 14 Jan 2022 02:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257524.442578; Fri, 14 Jan 2022 02:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n8CHm-00008p-2E; Fri, 14 Jan 2022 02:25:50 +0000
Received: by outflank-mailman (input) for mailman id 257524;
 Fri, 14 Jan 2022 02:25:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=chGx=R6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n8CHk-00008j-Dq
 for xen-devel@lists.xenproject.org; Fri, 14 Jan 2022 02:25:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46efe52d-74e1-11ec-bcf3-e9554a921baa;
 Fri, 14 Jan 2022 03:25:46 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89E36B82358;
 Fri, 14 Jan 2022 02:25:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFA5C36AEA;
 Fri, 14 Jan 2022 02:25:42 +0000 (UTC)
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
X-Inumbo-ID: 46efe52d-74e1-11ec-bcf3-e9554a921baa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642127143;
	bh=h2CI4MFj40SZYji614qdWM8/KjZ54LMSAPRImoP/AMI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=laVOzjWHOFOzNZv5wOJ84ol3/n4HkAAUK5qD43I6Q3XrygecetcrW4rrsdQsgAtss
	 brKERV+P3eZrZiCf9eCKoOnqKiBTfA7ymst/7nBq+xZAIYn3p1bBzIF/QRynYo6u+s
	 MYNF/I5160sDQM2C7nlNiDqR6gdNvkdh63B841gwgeb4V0SocobQPkYxZ3hZ76UzHi
	 eHzAv4+0E+/m91Aefww0zFva1UatW9LG5ugTs5eHPiiwQ6QNx/yLcNPTaNYNrPQuKY
	 NoDvyee9KJ8mU/LWo8gUS25engZIVFjdXdiACBe2JTFIFssAxGmvXG0OfrpXkgQ0HY
	 W0yb6xlquA0LA==
Date: Thu, 13 Jan 2022 18:25:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com, 
    xen-devel@lists.xenproject.org, Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [LINUX PATCH v2 1/1] xen: add support for initializing xenstore
 later as HVM domain
In-Reply-To: <aa934840-0862-7246-4318-a049aedcf0c3@suse.com>
Message-ID: <alpine.DEB.2.22.394.2201131723420.19362@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201121647460.19362@ubuntu-linux-20-04-desktop> <20220113010002.1180463-1-sstabellini@kernel.org> <aa934840-0862-7246-4318-a049aedcf0c3@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Jan 2022, Juergen Gross wrote:
> > @@ -907,6 +921,20 @@ static struct notifier_block xenbus_resume_nb = {
> >   	.notifier_call = xenbus_resume_cb,
> >   };
> >   +static irqreturn_t xenbus_late_init(int irq, void *unused)
> > +{
> > +	int err = 0;
> > +	uint64_t v = 0;
> > +
> > +	err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
> > +	if (err || !v || !~v)
> > +		return IRQ_HANDLED;
> > +	xen_store_gfn = (unsigned long)v;
> > +
> > +	wake_up(&xb_waitq);
> > +	return IRQ_HANDLED;
> > +}
> > +
> 
> Hmm, wouldn't it be easier to use a static key in the already existing
> irq handler instead of switching the handler?

I did some prototyping and it is certainly not going to be "easier" :-)

- xenbus_irq is setup by xb_init_comms, but xb_init_comms cannot be
  re-used as-is because it assumes xen_store_interface to be != NULL
- also, it is too early to start xenbus_thread at that point

So it looks like we shouldn't call xb_init_comms from xenbus_init
because it would increase the number of "if" statements in xb_init_comms
quiet a bit. 

An alternative would be to leave xb_init_comms unmodified, but reuse the
same interrupt handler (wake_waiting) and xenbus_irq. However, that
doesn't work either because rebind_evtchn_irq fails when it is called
later on from xb_init_comms. (I haven't investigated why.) Also,
xenbus_irq could be allocated as zero, so the existing check in
xb_init_comms also fails. 

To give you a concrete idea, after several tries I managed to get a
dirty patch that works but I don't think the changes to xb_init_comms
are actually correct.

In conclusion I think it is best to keep the current approach.



diff --git a/drivers/xen/xenbus/xenbus_comms.c b/drivers/xen/xenbus/xenbus_comms.c
index e5fda0256feb..bad87c3a9f72 100644
--- a/drivers/xen/xenbus/xenbus_comms.c
+++ b/drivers/xen/xenbus/xenbus_comms.c
@@ -54,15 +54,9 @@ DEFINE_MUTEX(xb_write_mutex);
 /* Protect xenbus reader thread against save/restore. */
 DEFINE_MUTEX(xs_response_mutex);
 
-static int xenbus_irq;
+int xenbus_irq = -1;
 static struct task_struct *xenbus_task;
 
-static irqreturn_t wake_waiting(int irq, void *unused)
-{
-	wake_up(&xb_waitq);
-	return IRQ_HANDLED;
-}
-
 static int check_indexes(XENSTORE_RING_IDX cons, XENSTORE_RING_IDX prod)
 {
 	return ((prod - cons) <= XENSTORE_RING_SIZE);
@@ -435,6 +429,7 @@ static int xenbus_thread(void *unused)
 /**
  * xb_init_comms - Set up interrupt handler off store event channel.
  */
+extern irqreturn_t wake_waiting(int irq, void *unused);
 int xb_init_comms(void)
 {
 	struct xenstore_domain_interface *intf = xen_store_interface;
@@ -451,10 +446,10 @@ int xb_init_comms(void)
 			intf->rsp_cons = intf->rsp_prod;
 	}
 
-	if (xenbus_irq) {
+	if (xenbus_irq > 0) {
 		/* Already have an irq; assume we're resuming */
 		rebind_evtchn_irq(xen_store_evtchn, xenbus_irq);
-	} else {
+	} else if (xenbus_irq < 0) {
 		int err;
 
 		err = bind_evtchn_to_irqhandler(xen_store_evtchn, wake_waiting,
@@ -465,13 +460,13 @@ int xb_init_comms(void)
 		}
 
 		xenbus_irq = err;
+	}
 
-		if (!xenbus_task) {
-			xenbus_task = kthread_run(xenbus_thread, NULL,
-						  "xenbus");
-			if (IS_ERR(xenbus_task))
-				return PTR_ERR(xenbus_task);
-		}
+	if (!xenbus_task) {
+		xenbus_task = kthread_run(xenbus_thread, NULL,
+				"xenbus");
+		if (IS_ERR(xenbus_task))
+			return PTR_ERR(xenbus_task);
 	}
 
 	return 0;
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index fe360c33ce71..ad8d640b75d2 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -65,6 +65,7 @@
 #include "xenbus.h"
 
 
+extern int xenbus_irq;
 int xen_store_evtchn;
 EXPORT_SYMBOL_GPL(xen_store_evtchn);
 
@@ -750,6 +751,11 @@ static void xenbus_probe(void)
 {
 	xenstored_ready = 1;
 
+	if (!xen_store_interface) {
+		xen_store_interface = xen_remap(xen_store_gfn << XEN_PAGE_SHIFT,
+						XEN_PAGE_SIZE);
+	}
+
 	/*
 	 * In the HVM case, xenbus_init() deferred its call to
 	 * xs_init() in case callbacks were not operational yet.
@@ -798,20 +804,22 @@ static int __init xenbus_probe_initcall(void)
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
@@ -907,6 +915,22 @@ static struct notifier_block xenbus_resume_nb = {
 	.notifier_call = xenbus_resume_cb,
 };
 
+irqreturn_t wake_waiting(int irq, void *unused)
+{
+	int err = 0;
+	uint64_t v = 0;
+
+	if (!xen_store_gfn) {
+		err = hvm_get_parameter(HVM_PARAM_STORE_PFN, &v);
+		if (err || !v || !~v)
+			return IRQ_HANDLED;
+		xen_store_gfn = (unsigned long)v;
+	}
+
+	wake_up(&xb_waitq);
+	return IRQ_HANDLED;
+}
+
 static int __init xenbus_init(void)
 {
 	int err;
@@ -959,23 +983,37 @@ static int __init xenbus_init(void)
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
+							wake_waiting,
+							0, "xenbus",
+							&xb_waitq);
+			if (err < 0) {
+				pr_err("xenstore_late_init couldn't bind irq err=%d\n",
+				       err);
+				return err;
+			}
+
+			xenbus_irq = err;
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

