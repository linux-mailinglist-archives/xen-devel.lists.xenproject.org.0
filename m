Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D415622C18F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 10:59:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jytXx-0004Nq-6Q; Fri, 24 Jul 2020 08:59:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QctF=BD=canonical.com=andrea.righi@srs-us1.protection.inumbo.net>)
 id 1jytXv-0004Nj-9k
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 08:59:15 +0000
X-Inumbo-ID: f2665624-cd8b-11ea-87e7-bc764e2007e4
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2665624-cd8b-11ea-87e7-bc764e2007e4;
 Fri, 24 Jul 2020 08:59:14 +0000 (UTC)
Received: from mail-ej1-f72.google.com ([209.85.218.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andrea.righi@canonical.com>) id 1jytXt-0003cC-Ig
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 08:59:13 +0000
Received: by mail-ej1-f72.google.com with SMTP id q11so3434066eja.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2020 01:59:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=Hjub13SPe2wEgoDjP8LKlCX8Yl7alX0oGHdU3qzYDPM=;
 b=n/3zDNavFBwyidp5mK9uTIUnZfbHeSKJP4k6Md3Q+MmdkMWQ8FQ2ZbQoZ9SwA3NWvc
 EqtOXntSZ9x4rmez3Jw1+S/UWUPdrNW3an2O+mEV7odoE4wZzNDZ+X3zGsXQmmSSDML1
 HUBGuHZ3Fqz6BZLdd1A6yR6oULhBm5YpLuYv6THiBFs3tEbC56nM9xQSbfZHFkQzeDE9
 1CgAPQu5Aj+br1BdM0coAM1wKpocTKt3vQliydYhLgPhghicxYr0ml5+PJVXD7Ra6R+b
 oEITKCk0MfjzDcbkG4/CQsqTHla7AATJ0QGL0fxnsCRipvNErj59Y9tCgRj7LjHJ5V+B
 5RMA==
X-Gm-Message-State: AOAM533Jplrd6i3wjxEFqCFSpPFrzyDmGHKm3O5F+UGrSbqV2R4/TW6V
 TT6zn2/vYZUAZlbukFS4W+OF336yydgi6S0D8iQrD8GmW/yDuwKIAxjJ3bdKF0D56zJkyB+q1oA
 daE2tgRMNZdk22OWl4WIN+q9UkHsrmHS/IkoEACie2jlV
X-Received: by 2002:a17:906:c40d:: with SMTP id
 u13mr8037436ejz.519.1595581152669; 
 Fri, 24 Jul 2020 01:59:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLghkjxyAHSXRSJUM7yxIeHsXsl1Sx8URoFGpqj60bEA7IlZyIWZIUznr715CpupWlbmdO2A==
X-Received: by 2002:a17:906:c40d:: with SMTP id
 u13mr8037418ejz.519.1595581152278; 
 Fri, 24 Jul 2020 01:59:12 -0700 (PDT)
Received: from localhost (host-87-11-131-192.retail.telecomitalia.it.
 [87.11.131.192])
 by smtp.gmail.com with ESMTPSA id y22sm302547edl.84.2020.07.24.01.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 01:59:11 -0700 (PDT)
Date: Fri, 24 Jul 2020 10:59:10 +0200
From: Andrea Righi <andrea.righi@canonical.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen-netfront: fix potential deadlock in xennet_remove()
Message-ID: <20200724085910.GA1043801@xps-13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There's a potential race in xennet_remove(); this is what the driver is
doing upon unregistering a network device:

  1. state = read bus state
  2. if state is not "Closed":
  3.    request to set state to "Closing"
  4.    wait for state to be set to "Closing"
  5.    request to set state to "Closed"
  6.    wait for state to be set to "Closed"

If the state changes to "Closed" immediately after step 1 we are stuck
forever in step 4, because the state will never go back from "Closed" to
"Closing".

Make sure to check also for state == "Closed" in step 4 to prevent the
deadlock.

Also add a 5 sec timeout any time we wait for the bus state to change,
to avoid getting stuck forever in wait_event().

Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
Changes in v2:
 - remove all dev_dbg() calls (as suggested by David Miller)

 drivers/net/xen-netfront.c | 64 +++++++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 22 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 482c6c8b0fb7..88280057e032 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -63,6 +63,8 @@ module_param_named(max_queues, xennet_max_queues, uint, 0644);
 MODULE_PARM_DESC(max_queues,
 		 "Maximum number of queues per virtual interface");
 
+#define XENNET_TIMEOUT  (5 * HZ)
+
 static const struct ethtool_ops xennet_ethtool_ops;
 
 struct netfront_cb {
@@ -1334,12 +1336,15 @@ static struct net_device *xennet_create_dev(struct xenbus_device *dev)
 
 	netif_carrier_off(netdev);
 
-	xenbus_switch_state(dev, XenbusStateInitialising);
-	wait_event(module_wq,
-		   xenbus_read_driver_state(dev->otherend) !=
-		   XenbusStateClosed &&
-		   xenbus_read_driver_state(dev->otherend) !=
-		   XenbusStateUnknown);
+	do {
+		xenbus_switch_state(dev, XenbusStateInitialising);
+		err = wait_event_timeout(module_wq,
+				 xenbus_read_driver_state(dev->otherend) !=
+				 XenbusStateClosed &&
+				 xenbus_read_driver_state(dev->otherend) !=
+				 XenbusStateUnknown, XENNET_TIMEOUT);
+	} while (!err);
+
 	return netdev;
 
  exit:
@@ -2139,28 +2144,43 @@ static const struct attribute_group xennet_dev_group = {
 };
 #endif /* CONFIG_SYSFS */
 
-static int xennet_remove(struct xenbus_device *dev)
+static void xennet_bus_close(struct xenbus_device *dev)
 {
-	struct netfront_info *info = dev_get_drvdata(&dev->dev);
-
-	dev_dbg(&dev->dev, "%s\n", dev->nodename);
+	int ret;
 
-	if (xenbus_read_driver_state(dev->otherend) != XenbusStateClosed) {
+	if (xenbus_read_driver_state(dev->otherend) == XenbusStateClosed)
+		return;
+	do {
 		xenbus_switch_state(dev, XenbusStateClosing);
-		wait_event(module_wq,
-			   xenbus_read_driver_state(dev->otherend) ==
-			   XenbusStateClosing ||
-			   xenbus_read_driver_state(dev->otherend) ==
-			   XenbusStateUnknown);
+		ret = wait_event_timeout(module_wq,
+				   xenbus_read_driver_state(dev->otherend) ==
+				   XenbusStateClosing ||
+				   xenbus_read_driver_state(dev->otherend) ==
+				   XenbusStateClosed ||
+				   xenbus_read_driver_state(dev->otherend) ==
+				   XenbusStateUnknown,
+				   XENNET_TIMEOUT);
+	} while (!ret);
+
+	if (xenbus_read_driver_state(dev->otherend) == XenbusStateClosed)
+		return;
 
+	do {
 		xenbus_switch_state(dev, XenbusStateClosed);
-		wait_event(module_wq,
-			   xenbus_read_driver_state(dev->otherend) ==
-			   XenbusStateClosed ||
-			   xenbus_read_driver_state(dev->otherend) ==
-			   XenbusStateUnknown);
-	}
+		ret = wait_event_timeout(module_wq,
+				   xenbus_read_driver_state(dev->otherend) ==
+				   XenbusStateClosed ||
+				   xenbus_read_driver_state(dev->otherend) ==
+				   XenbusStateUnknown,
+				   XENNET_TIMEOUT);
+	} while (!ret);
+}
+
+static int xennet_remove(struct xenbus_device *dev)
+{
+	struct netfront_info *info = dev_get_drvdata(&dev->dev);
 
+	xennet_bus_close(dev);
 	xennet_disconnect_backend(info);
 
 	if (info->netdev->reg_state == NETREG_REGISTERED)
-- 
2.25.1


