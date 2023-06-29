Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5369A7429E4
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 17:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556934.869843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtr4-0006Cl-2V; Thu, 29 Jun 2023 15:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556934.869843; Thu, 29 Jun 2023 15:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEtr3-0006AX-WD; Thu, 29 Jun 2023 15:46:46 +0000
Received: by outflank-mailman (input) for mailman id 556934;
 Thu, 29 Jun 2023 15:46:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=In7u=CR=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1qEtr1-0006AR-RJ
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 15:46:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 236fdc9e-1694-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 17:46:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6866DC14;
 Thu, 29 Jun 2023 08:47:23 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 769FB3F64C;
 Thu, 29 Jun 2023 08:46:38 -0700 (PDT)
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
X-Inumbo-ID: 236fdc9e-1694-11ee-8611-37d641c3527e
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: rahul.singh@arm.com,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Samuel Holland <samuel@sholland.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Jane Malalane <jane.malalane@citrix.com>
Subject: [PATCH v2] xen/evtchn: Introduce new IOCTL to bind static evtchn
Date: Thu, 29 Jun 2023 16:46:18 +0100
Message-Id: <764d561e3aecb7e63e8601dc50aaef9fc40834e4.1688051342.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen 4.17 supports the creation of static evtchns. To allow user space
application to bind static evtchns introduce new ioctl
"IOCTL_EVTCHN_BIND_STATIC". Existing IOCTL doing more than binding
that’s why we need to introduce the new IOCTL to only bind the static
event channels.

Also, static evtchns to be available for use during the lifetime of the
guest. When the application exits, __unbind_from_irq() ends up being
called from release() file operations because of that static evtchns
are getting closed. To avoid closing the static event channel, add the
new bool variable "is_static" in "struct irq_info" to mark the event
channel static when creating the event channel to avoid closing the
static evtchn.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
v2:
 * Use bool in place u8 to define is_static variable.
 * Avoid closing the static evtchns in error path.
---
 drivers/xen/events/events_base.c |  7 +++++--
 drivers/xen/evtchn.c             | 30 ++++++++++++++++++++++--------
 include/uapi/xen/evtchn.h        |  9 +++++++++
 include/xen/events.h             |  2 +-
 4 files changed, 37 insertions(+), 11 deletions(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index c7715f8bd452..5d3b5c7cfe64 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -112,6 +112,7 @@ struct irq_info {
 	unsigned int irq_epoch; /* If eoi_cpu valid: irq_epoch of event */
 	u64 eoi_time;           /* Time in jiffies when to EOI. */
 	raw_spinlock_t lock;
+	bool is_static;           /* Is event channel static */
 
 	union {
 		unsigned short virq;
@@ -982,7 +983,8 @@ static void __unbind_from_irq(unsigned int irq)
 		unsigned int cpu = cpu_from_irq(irq);
 		struct xenbus_device *dev;
 
-		xen_evtchn_close(evtchn);
+		if (!info->is_static)
+			xen_evtchn_close(evtchn);
 
 		switch (type_from_irq(irq)) {
 		case IRQT_VIRQ:
@@ -1574,7 +1576,7 @@ int xen_set_irq_priority(unsigned irq, unsigned priority)
 }
 EXPORT_SYMBOL_GPL(xen_set_irq_priority);
 
-int evtchn_make_refcounted(evtchn_port_t evtchn)
+int evtchn_make_refcounted(evtchn_port_t evtchn, bool is_static)
 {
 	int irq = get_evtchn_to_irq(evtchn);
 	struct irq_info *info;
@@ -1590,6 +1592,7 @@ int evtchn_make_refcounted(evtchn_port_t evtchn)
 	WARN_ON(info->refcnt != -1);
 
 	info->refcnt = 1;
+	info->is_static = is_static;
 
 	return 0;
 }
diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
index c99415a70051..e6d2303478b2 100644
--- a/drivers/xen/evtchn.c
+++ b/drivers/xen/evtchn.c
@@ -366,7 +366,8 @@ static int evtchn_resize_ring(struct per_user_data *u)
 	return 0;
 }
 
-static int evtchn_bind_to_user(struct per_user_data *u, evtchn_port_t port)
+static int evtchn_bind_to_user(struct per_user_data *u, evtchn_port_t port,
+			bool is_static)
 {
 	struct user_evtchn *evtchn;
 	struct evtchn_close close;
@@ -402,14 +403,16 @@ static int evtchn_bind_to_user(struct per_user_data *u, evtchn_port_t port)
 	if (rc < 0)
 		goto err;
 
-	rc = evtchn_make_refcounted(port);
+	rc = evtchn_make_refcounted(port, is_static);
 	return rc;
 
 err:
 	/* bind failed, should close the port now */
-	close.port = port;
-	if (HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) != 0)
-		BUG();
+	if (!is_static) {
+		close.port = port;
+		if (HYPERVISOR_event_channel_op(EVTCHNOP_close, &close) != 0)
+			BUG();
+	}
 	del_evtchn(u, evtchn);
 	return rc;
 }
@@ -456,7 +459,7 @@ static long evtchn_ioctl(struct file *file,
 		if (rc != 0)
 			break;
 
-		rc = evtchn_bind_to_user(u, bind_virq.port);
+		rc = evtchn_bind_to_user(u, bind_virq.port, false);
 		if (rc == 0)
 			rc = bind_virq.port;
 		break;
@@ -482,7 +485,7 @@ static long evtchn_ioctl(struct file *file,
 		if (rc != 0)
 			break;
 
-		rc = evtchn_bind_to_user(u, bind_interdomain.local_port);
+		rc = evtchn_bind_to_user(u, bind_interdomain.local_port, false);
 		if (rc == 0)
 			rc = bind_interdomain.local_port;
 		break;
@@ -507,7 +510,7 @@ static long evtchn_ioctl(struct file *file,
 		if (rc != 0)
 			break;
 
-		rc = evtchn_bind_to_user(u, alloc_unbound.port);
+		rc = evtchn_bind_to_user(u, alloc_unbound.port, false);
 		if (rc == 0)
 			rc = alloc_unbound.port;
 		break;
@@ -536,6 +539,17 @@ static long evtchn_ioctl(struct file *file,
 		break;
 	}
 
+	case IOCTL_EVTCHN_BIND_STATIC: {
+		struct ioctl_evtchn_bind bind;
+
+		rc = -EFAULT;
+		if (copy_from_user(&bind, uarg, sizeof(bind)))
+			break;
+
+		rc = evtchn_bind_to_user(u, bind.port, true);
+		break;
+	}
+
 	case IOCTL_EVTCHN_NOTIFY: {
 		struct ioctl_evtchn_notify notify;
 		struct user_evtchn *evtchn;
diff --git a/include/uapi/xen/evtchn.h b/include/uapi/xen/evtchn.h
index 7fbf732f168f..aef2b75f3413 100644
--- a/include/uapi/xen/evtchn.h
+++ b/include/uapi/xen/evtchn.h
@@ -101,4 +101,13 @@ struct ioctl_evtchn_restrict_domid {
 	domid_t domid;
 };
 
+/*
+ * Bind statically allocated @port.
+ */
+#define IOCTL_EVTCHN_BIND_STATIC			\
+	_IOC(_IOC_NONE, 'E', 7, sizeof(struct ioctl_evtchn_bind))
+struct ioctl_evtchn_bind {
+	unsigned int port;
+};
+
 #endif /* __LINUX_PUBLIC_EVTCHN_H__ */
diff --git a/include/xen/events.h b/include/xen/events.h
index ac1281c5ead6..377ad7e391e8 100644
--- a/include/xen/events.h
+++ b/include/xen/events.h
@@ -69,7 +69,7 @@ int xen_set_irq_priority(unsigned irq, unsigned priority);
 /*
  * Allow extra references to event channels exposed to userspace by evtchn
  */
-int evtchn_make_refcounted(evtchn_port_t evtchn);
+int evtchn_make_refcounted(evtchn_port_t evtchn, bool is_static);
 int evtchn_get(evtchn_port_t evtchn);
 void evtchn_put(evtchn_port_t evtchn);
 

base-commit: 3a8a670eeeaa40d87bd38a587438952741980c18
-- 
2.25.1


