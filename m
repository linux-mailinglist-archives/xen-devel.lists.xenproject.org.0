Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA22D3187EA
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 11:18:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83801.156875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA92x-0001wv-TF; Thu, 11 Feb 2021 10:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83801.156875; Thu, 11 Feb 2021 10:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA92x-0001w1-OA; Thu, 11 Feb 2021 10:18:03 +0000
Received: by outflank-mailman (input) for mailman id 83801;
 Thu, 11 Feb 2021 10:18:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/E5q=HN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lA92w-0001VI-8E
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 10:18:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 146ca085-a6ed-4f37-b0fd-9402351e30fd;
 Thu, 11 Feb 2021 10:17:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3841FAF11;
 Thu, 11 Feb 2021 10:17:41 +0000 (UTC)
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
X-Inumbo-ID: 146ca085-a6ed-4f37-b0fd-9402351e30fd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613038661; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3cGioF3XhVwmtqHEwtIlRzTuYQpd1I+EFdYzeGvtMh0=;
	b=nJWGxbfsZic/fqYIe+mxFP821DzSm6m2XntEhzUHGLp8ReTw/1Z9p6Wf+Zog36NLKvRkvP
	aBBHU2g6Du1VAciaM66Ag1GwoVvwYFf2dWM8ssG4kS8RlcudQi1k9volZsavYT1ss5EL3j
	JZviBo2JsyCZQjZJXlTkzxRB8siacRs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 6/8] xen/events: add per-xenbus device event statistics and settings
Date: Thu, 11 Feb 2021 11:16:14 +0100
Message-Id: <20210211101616.13788-7-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210211101616.13788-1-jgross@suse.com>
References: <20210211101616.13788-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add syfs nodes for each xenbus device showing event statistics (number
of events and spurious events, number of associated event channels)
and for setting a spurious event threshold in case a frontend is
sending too many events without being rogue on purpose.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- add documentation (Boris Ostrovsky)
---
 .../ABI/testing/sysfs-devices-xenbus          | 41 ++++++++++++
 drivers/xen/events/events_base.c              | 27 +++++++-
 drivers/xen/xenbus/xenbus_probe.c             | 66 +++++++++++++++++++
 include/xen/xenbus.h                          |  7 ++
 4 files changed, 139 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-xenbus

diff --git a/Documentation/ABI/testing/sysfs-devices-xenbus b/Documentation/ABI/testing/sysfs-devices-xenbus
new file mode 100644
index 000000000000..fd796cb4f315
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-xenbus
@@ -0,0 +1,41 @@
+What:		/sys/devices/*/xenbus/event_channels
+Date:		February 2021
+Contact:	Xen Developers mailing list <xen-devel@lists.xenproject.org>
+Description:
+		Number of Xen event channels associated with a kernel based
+		paravirtualized device frontend or backend.
+
+What:		/sys/devices/*/xenbus/events
+Date:		February 2021
+Contact:	Xen Developers mailing list <xen-devel@lists.xenproject.org>
+Description:
+		Total number of Xen events received for a Xen pv device
+		frontend or backend.
+
+What:		/sys/devices/*/xenbus/jiffies_eoi_delayed
+Date:		February 2021
+Contact:	Xen Developers mailing list <xen-devel@lists.xenproject.org>
+Description:
+		Summed up time in jiffies the EOI of an interrupt for a Xen
+		pv device has been delayed in order to avoid stalls due to
+		event storms. This value rising is a first sign for a rogue
+		other end of the pv device.
+
+What:		/sys/devices/*/xenbus/spurious_events
+Date:		February 2021
+Contact:	Xen Developers mailing list <xen-devel@lists.xenproject.org>
+Description:
+		Number of events received for a Xen pv device which did not
+		require any action. Too many spurious events in a row will
+		trigger delayed EOI processing.
+
+What:		/sys/devices/*/xenbus/spurious_threshold
+Date:		February 2021
+Contact:	Xen Developers mailing list <xen-devel@lists.xenproject.org>
+Description:
+		Controls the tolerated number of subsequent spurious events
+		before delayed EOI processing is triggered for a Xen pv
+		device. Default is 1. This can be modified in case the other
+		end of the pv device is issuing spurious events on a regular
+		basis and is known not to be malicious on purpose. Raising
+		the value for such cases can improve pv device performance.
diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index a5cce4c626c2..48210c1e62e3 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -332,6 +332,8 @@ static int xen_irq_info_evtchn_setup(unsigned irq,
 
 	ret = xen_irq_info_common_setup(info, irq, IRQT_EVTCHN, evtchn, 0);
 	info->u.interdomain = dev;
+	if (dev)
+		atomic_inc(&dev->event_channels);
 
 	return ret;
 }
@@ -606,18 +608,28 @@ static void xen_irq_lateeoi_locked(struct irq_info *info, bool spurious)
 		return;
 
 	if (spurious) {
+		struct xenbus_device *dev = info->u.interdomain;
+		unsigned int threshold = 1;
+
+		if (dev && dev->spurious_threshold)
+			threshold = dev->spurious_threshold;
+
 		if ((1 << info->spurious_cnt) < (HZ << 2)) {
 			if (info->spurious_cnt != 0xFF)
 				info->spurious_cnt++;
 		}
-		if (info->spurious_cnt > 1) {
-			delay = 1 << (info->spurious_cnt - 2);
+		if (info->spurious_cnt > threshold) {
+			delay = 1 << (info->spurious_cnt - 1 - threshold);
 			if (delay > HZ)
 				delay = HZ;
 			if (!info->eoi_time)
 				info->eoi_cpu = smp_processor_id();
 			info->eoi_time = get_jiffies_64() + delay;
+			if (dev)
+				atomic_add(delay, &dev->jiffies_eoi_delayed);
 		}
+		if (dev)
+			atomic_inc(&dev->spurious_events);
 	} else {
 		info->spurious_cnt = 0;
 	}
@@ -950,6 +962,7 @@ static void __unbind_from_irq(unsigned int irq)
 
 	if (VALID_EVTCHN(evtchn)) {
 		unsigned int cpu = cpu_from_irq(irq);
+		struct xenbus_device *dev;
 
 		xen_evtchn_close(evtchn);
 
@@ -960,6 +973,11 @@ static void __unbind_from_irq(unsigned int irq)
 		case IRQT_IPI:
 			per_cpu(ipi_to_irq, cpu)[ipi_from_irq(irq)] = -1;
 			break;
+		case IRQT_EVTCHN:
+			dev = info->u.interdomain;
+			if (dev)
+				atomic_dec(&dev->event_channels);
+			break;
 		default:
 			break;
 		}
@@ -1623,6 +1641,7 @@ void handle_irq_for_port(evtchn_port_t port, struct evtchn_loop_ctrl *ctrl)
 {
 	int irq;
 	struct irq_info *info;
+	struct xenbus_device *dev;
 
 	irq = get_evtchn_to_irq(port);
 	if (irq == -1)
@@ -1654,6 +1673,10 @@ void handle_irq_for_port(evtchn_port_t port, struct evtchn_loop_ctrl *ctrl)
 	if (xchg_acquire(&info->is_active, 1))
 		return;
 
+	dev = (info->type == IRQT_EVTCHN) ? info->u.interdomain : NULL;
+	if (dev)
+		atomic_inc(&dev->events);
+
 	if (ctrl->defer_eoi) {
 		info->eoi_cpu = smp_processor_id();
 		info->irq_epoch = __this_cpu_read(irq_epoch);
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 18ffd0551b54..9494ecad3c92 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -206,6 +206,65 @@ void xenbus_otherend_changed(struct xenbus_watch *watch,
 }
 EXPORT_SYMBOL_GPL(xenbus_otherend_changed);
 
+#define XENBUS_SHOW_STAT(name)						\
+static ssize_t show_##name(struct device *_dev,				\
+			   struct device_attribute *attr,		\
+			   char *buf)					\
+{									\
+	struct xenbus_device *dev = to_xenbus_device(_dev);		\
+									\
+	return sprintf(buf, "%d\n", atomic_read(&dev->name));		\
+}									\
+static DEVICE_ATTR(name, 0444, show_##name, NULL)
+
+XENBUS_SHOW_STAT(event_channels);
+XENBUS_SHOW_STAT(events);
+XENBUS_SHOW_STAT(spurious_events);
+XENBUS_SHOW_STAT(jiffies_eoi_delayed);
+
+static ssize_t show_spurious_threshold(struct device *_dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	struct xenbus_device *dev = to_xenbus_device(_dev);
+
+	return sprintf(buf, "%d\n", dev->spurious_threshold);
+}
+
+static ssize_t set_spurious_threshold(struct device *_dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct xenbus_device *dev = to_xenbus_device(_dev);
+	unsigned int val;
+	ssize_t ret;
+
+	ret = kstrtouint(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	dev->spurious_threshold = val;
+
+	return count;
+}
+
+static DEVICE_ATTR(spurious_threshold, 0644, show_spurious_threshold,
+		   set_spurious_threshold);
+
+static struct attribute *xenbus_attrs[] = {
+	&dev_attr_event_channels.attr,
+	&dev_attr_events.attr,
+	&dev_attr_spurious_events.attr,
+	&dev_attr_jiffies_eoi_delayed.attr,
+	&dev_attr_spurious_threshold.attr,
+	NULL
+};
+
+static const struct attribute_group xenbus_group = {
+	.name = "xenbus",
+	.attrs = xenbus_attrs,
+};
+
 int xenbus_dev_probe(struct device *_dev)
 {
 	struct xenbus_device *dev = to_xenbus_device(_dev);
@@ -253,6 +312,11 @@ int xenbus_dev_probe(struct device *_dev)
 		return err;
 	}
 
+	dev->spurious_threshold = 1;
+	if (sysfs_create_group(&dev->dev.kobj, &xenbus_group))
+		dev_warn(&dev->dev, "sysfs_create_group on %s failed.\n",
+			 dev->nodename);
+
 	return 0;
 fail_put:
 	module_put(drv->driver.owner);
@@ -269,6 +333,8 @@ int xenbus_dev_remove(struct device *_dev)
 
 	DPRINTK("%s", dev->nodename);
 
+	sysfs_remove_group(&dev->dev.kobj, &xenbus_group);
+
 	free_otherend_watch(dev);
 
 	if (drv->remove) {
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 2c43b0ef1e4d..13ee375a1f05 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -88,6 +88,13 @@ struct xenbus_device {
 	struct completion down;
 	struct work_struct work;
 	struct semaphore reclaim_sem;
+
+	/* Event channel based statistics and settings. */
+	atomic_t event_channels;
+	atomic_t events;
+	atomic_t spurious_events;
+	atomic_t jiffies_eoi_delayed;
+	unsigned int spurious_threshold;
 };
 
 static inline struct xenbus_device *to_xenbus_device(struct device *dev)
-- 
2.26.2


