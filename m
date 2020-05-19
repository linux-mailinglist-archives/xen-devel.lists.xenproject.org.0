Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 898E21DA55E
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 01:26:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbBcP-0005QD-7u; Tue, 19 May 2020 23:25:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1yeG=7B=amazon.com=prvs=4015a1a96=anchalag@srs-us1.protection.inumbo.net>)
 id 1jbBcN-0005Pu-V3
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 23:25:51 +0000
X-Inumbo-ID: 1403dbe0-9a28-11ea-a9a0-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1403dbe0-9a28-11ea-a9a0-12813bfff9fa;
 Tue, 19 May 2020 23:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1589930751; x=1621466751;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=u2I4SVbLijVxq/T2OZK7zwcQCdIZfr/59rBd0BiigZo=;
 b=YZCkOO/8hzWi08cqB+yEJtfF/G8MiVyO41OGu3js6Oti75WS24ZC7Y6o
 amdqRzp/Rgizj+Bs7fS9uuXpi4d8Qb0g1P6MEEjx4vqInee0RLJiQOTcB
 VWtzMhq/mRfUI8VfMsVnhXtc5uTzYBrUvznWyK2JuySf77bVh65hruclx w=;
IronPort-SDR: PUzafnrD9npruL/kMbXLm5hpJ1popdhgSPJqodhqecm7/PsBTkLK6Um1IrM4U5sGzedbKOXRIc
 CO06+Sbl0hSw==
X-IronPort-AV: E=Sophos;i="5.73,411,1583193600"; d="scan'208";a="31182118"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 19 May 2020 23:25:37 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 76EF6A06D8; Tue, 19 May 2020 23:25:35 +0000 (UTC)
Received: from EX13D08UEE002.ant.amazon.com (10.43.62.92) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:25:09 +0000
Received: from EX13MTAUEA002.ant.amazon.com (10.43.61.77) by
 EX13D08UEE002.ant.amazon.com (10.43.62.92) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 19 May 2020 23:25:09 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.61.169) with Microsoft SMTP
 Server id 15.0.1497.2 via Frontend Transport; Tue, 19 May 2020 23:25:09 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id CE7BE40712; Tue, 19 May 2020 23:25:08 +0000 (UTC)
Date: Tue, 19 May 2020 23:25:08 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>, <hpa@zytor.com>, 
 <x86@kernel.org>, <boris.ostrovsky@oracle.com>, <jgross@suse.com>,
 <linux-pm@vger.kernel.org>, <linux-mm@kvack.org>, <kamatam@amazon.com>,
 <sstabellini@kernel.org>, <konrad.wilk@oracle.com>, <roger.pau@citrix.com>,
 <axboe@kernel.dk>, <davem@davemloft.net>, <rjw@rjwysocki.net>,
 <len.brown@intel.com>, <pavel@ucw.cz>, <peterz@infradead.org>,
 <eduval@amazon.com>, <sblbir@amazon.com>, <anchalag@amazon.com>,
 <xen-devel@lists.xenproject.org>, <vkuznets@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dwmw@amazon.co.uk>, <benh@kernel.crashing.org>
Subject: [PATCH 02/12] xenbus: add freeze/thaw/restore callbacks support
Message-ID: <7fd12227f923eacc5841b47bd69f72b4105843a7.1589926004.git.anchalag@amazon.com>
References: <cover.1589926004.git.anchalag@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1589926004.git.anchalag@amazon.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Munehisa Kamata <kamatam@amazon.com>

Since commit b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for
suspend/resume/chkpt"), xenbus uses PMSG_FREEZE, PMSG_THAW and
PMSG_RESTORE events for Xen suspend. However, they're actually assigned
to xenbus_dev_suspend(), xenbus_dev_cancel() and xenbus_dev_resume()
respectively, and only suspend and resume callbacks are supported at
driver level. To support PM suspend and PM hibernation, modify the bus
level PM callbacks to invoke not only device driver's suspend/resume but
also freeze/thaw/restore.

Note that we'll use freeze/restore callbacks even for PM suspend whereas
suspend/resume callbacks are normally used in the case, becausae the
existing xenbus device drivers already have suspend/resume callbacks
specifically designed for Xen suspend. So we can allow the device
drivers to keep the existing callbacks wihtout modification.

[Anchal Changelog: Refactored the callbacks code]
Signed-off-by: Agarwal Anchal <anchalag@amazon.com>
Signed-off-by: Munehisa Kamata <kamatam@amazon.com>
---
 drivers/xen/xenbus/xenbus_probe.c | 99 +++++++++++++++++++++++++------
 include/xen/xenbus.h              |  3 +
 2 files changed, 84 insertions(+), 18 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 8c4d05b687b7..1589b9b2cb56 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -49,6 +49,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/suspend.h>
 
 #include <asm/page.h>
 #include <asm/pgtable.h>
@@ -599,27 +600,44 @@ int xenbus_dev_suspend(struct device *dev)
 	struct xenbus_driver *drv;
 	struct xenbus_device *xdev
 		= container_of(dev, struct xenbus_device, dev);
-
+	bool xen_suspend = xen_suspend_mode_is_xen_suspend();
 	DPRINTK("%s", xdev->nodename);
 
 	if (dev->driver == NULL)
 		return 0;
 	drv = to_xenbus_driver(dev->driver);
-	if (drv->suspend)
-		err = drv->suspend(xdev);
-	if (err)
-		pr_warn("suspend %s failed: %i\n", dev_name(dev), err);
+
+	if (xen_suspend) {
+		if (drv->suspend)
+			err = drv->suspend(xdev);
+	} else {
+		if (drv->freeze) {
+			err = drv->freeze(xdev);
+			if (!err) {
+				free_otherend_watch(xdev);
+				free_otherend_details(xdev);
+				return 0;
+			}
+		}
+	}
+
+	if (err) {
+		pr_warn("%s %s failed: %i\n", xen_suspend ?
+			"suspend" : "freeze", dev_name(dev), err);
+		return err;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xenbus_dev_suspend);
 
 int xenbus_dev_resume(struct device *dev)
 {
-	int err;
+	int err = 0;
 	struct xenbus_driver *drv;
 	struct xenbus_device *xdev
 		= container_of(dev, struct xenbus_device, dev);
-
+	bool xen_suspend = xen_suspend_mode_is_xen_suspend();
 	DPRINTK("%s", xdev->nodename);
 
 	if (dev->driver == NULL)
@@ -627,24 +645,32 @@ int xenbus_dev_resume(struct device *dev)
 	drv = to_xenbus_driver(dev->driver);
 	err = talk_to_otherend(xdev);
 	if (err) {
-		pr_warn("resume (talk_to_otherend) %s failed: %i\n",
+		pr_warn("%s (talk_to_otherend) %s failed: %i\n",
+			xen_suspend ? "resume" : "restore",
 			dev_name(dev), err);
 		return err;
 	}
 
-	xdev->state = XenbusStateInitialising;
+	if (xen_suspend) {
+		xdev->state = XenbusStateInitialising;
+		if (drv->resume)
+			err = drv->resume(xdev);
+	} else {
+		if (drv->restore)
+			err = drv->restore(xdev);
+	}
 
-	if (drv->resume) {
-		err = drv->resume(xdev);
-		if (err) {
-			pr_warn("resume %s failed: %i\n", dev_name(dev), err);
-			return err;
-		}
+	if (err) {
+		pr_warn("%s %s failed: %i\n",
+			xen_suspend ? "resume" : "restore",
+			dev_name(dev), err);
+		return err;
 	}
 
 	err = watch_otherend(xdev);
 	if (err) {
-		pr_warn("resume (watch_otherend) %s failed: %d.\n",
+		pr_warn("%s (watch_otherend) %s failed: %d.\n",
+			xen_suspend ? "resume" : "restore",
 			dev_name(dev), err);
 		return err;
 	}
@@ -655,8 +681,45 @@ EXPORT_SYMBOL_GPL(xenbus_dev_resume);
 
 int xenbus_dev_cancel(struct device *dev)
 {
-	/* Do nothing */
-	DPRINTK("cancel");
+	int err = 0;
+	struct xenbus_driver *drv;
+	struct xenbus_device *xdev
+		= container_of(dev, struct xenbus_device, dev);
+	bool xen_suspend = xen_suspend_mode_is_xen_suspend();
+
+	if (xen_suspend) {
+		/* Do nothing */
+		DPRINTK("cancel");
+		return 0;
+	}
+
+	DPRINTK("%s", xdev->nodename);
+
+	if (dev->driver == NULL)
+		return 0;
+	drv = to_xenbus_driver(dev->driver);
+	err = talk_to_otherend(xdev);
+	if (err) {
+		pr_warn("thaw (talk_to_otherend) %s failed: %d.\n",
+			dev_name(dev), err);
+		return err;
+	}
+
+	if (drv->thaw) {
+		err = drv->thaw(xdev);
+		if (err) {
+			pr_warn("thaw %s failed: %i\n", dev_name(dev), err);
+			return err;
+		}
+	}
+
+	err = watch_otherend(xdev);
+	if (err) {
+		pr_warn("thaw (watch_otherend) %s failed: %d.\n",
+			dev_name(dev), err);
+		return err;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xenbus_dev_cancel);
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index 5a8315e6d8a6..8da964763255 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -104,6 +104,9 @@ struct xenbus_driver {
 	int (*remove)(struct xenbus_device *dev);
 	int (*suspend)(struct xenbus_device *dev);
 	int (*resume)(struct xenbus_device *dev);
+	int (*freeze)(struct xenbus_device *dev);
+	int (*thaw)(struct xenbus_device *dev);
+	int (*restore)(struct xenbus_device *dev);
 	int (*uevent)(struct xenbus_device *, struct kobj_uevent_env *);
 	struct device_driver driver;
 	int (*read_otherend_details)(struct xenbus_device *dev);
-- 
2.24.1.AMZN


