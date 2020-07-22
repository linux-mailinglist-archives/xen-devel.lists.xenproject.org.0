Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54006229151
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 08:52:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jy8bz-00081f-MB; Wed, 22 Jul 2020 06:52:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oDH3=BB=canonical.com=andrea.righi@srs-us1.protection.inumbo.net>)
 id 1jy8by-00081a-8s
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 06:52:18 +0000
X-Inumbo-ID: e17134c4-cbe7-11ea-a183-12813bfff9fa
Received: from youngberry.canonical.com (unknown [91.189.89.112])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e17134c4-cbe7-11ea-a183-12813bfff9fa;
 Wed, 22 Jul 2020 06:52:17 +0000 (UTC)
Received: from mail-wr1-f70.google.com ([209.85.221.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <andrea.righi@canonical.com>) id 1jy8bw-0005y6-F8
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 06:52:16 +0000
Received: by mail-wr1-f70.google.com with SMTP id z1so240511wrn.18
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 23:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=uhBXqoms6Y2BJ+DRWgv1UXrLfuoV1AP2/YI2uOM0BIc=;
 b=VKuZA0gLSArZIZzP65NX/w+lRZXLiqbqUeLxvLOCQDaCsBoQNLjmwjEWDVk2gjatcG
 055x5H0Kj4+ERMlm+KInqvSZvTUSrxwyE6UhON9MaDugEHAVhyvLMXmepX2yTsZGxA3n
 U9yJufnHOw81xq40AFH+svD9gGgBB27SU/5vSjnJMB2WSzMO8Q0zASq5vv8cJ47TBIuR
 TygCY+zlGvhfpIov1eFmUojAj8hKdHB3Yzm4ge5iToxvaydpFgKz1Esh1rmrJ+QMN+kj
 Cc1AxqiyeVcWY5C9jdBR/4njZrJYtZZIYPSugpvCC/iI0FUXwZR3auWNYdmOBdwIjsGo
 xdGg==
X-Gm-Message-State: AOAM532SHylvegz0dr1zLXEpE2wJSq8VmlSNQWFLhehuAVxj5ja8Q18m
 39bN/SzkkzhIBzfEKvMC60cVnhaHbAz4cAK59xmPZDzwMpZyOSvqRxyjI0GIZ25GVR7OswUQREw
 ijsOJqq9v96xn1Hasc9wNQ+SZMUqtmBLo0NlK7bk6SNye
X-Received: by 2002:a7b:c05a:: with SMTP id u26mr1897720wmc.73.1595400733676; 
 Tue, 21 Jul 2020 23:52:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhC1gnk9TlQyUIEJ3tOszObyW4FaQs/e6/6fGBY61IX5lMt1lAPzd6jSpjxL2aHTCAHJKvaQ==
X-Received: by 2002:a7b:c05a:: with SMTP id u26mr1897700wmc.73.1595400733297; 
 Tue, 21 Jul 2020 23:52:13 -0700 (PDT)
Received: from localhost (host-87-11-131-192.retail.telecomitalia.it.
 [87.11.131.192])
 by smtp.gmail.com with ESMTPSA id g70sm2426599wmg.24.2020.07.21.23.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 23:52:12 -0700 (PDT)
Date: Wed, 22 Jul 2020 08:52:11 +0200
From: Andrea Righi <andrea.righi@canonical.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen-netfront: fix potential deadlock in xennet_remove()
Message-ID: <20200722065211.GA841369@xps-13>
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
to avoid getting stuck forever in wait_event() and add a debug message
to help tracking down potential similar issues.

Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 drivers/net/xen-netfront.c | 79 +++++++++++++++++++++++++++-----------
 1 file changed, 57 insertions(+), 22 deletions(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index 482c6c8b0fb7..e09caba93dd9 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -63,6 +63,8 @@ module_param_named(max_queues, xennet_max_queues, uint, 0644);
 MODULE_PARM_DESC(max_queues,
 		 "Maximum number of queues per virtual interface");
 
+#define XENNET_TIMEOUT  (5 * HZ)
+
 static const struct ethtool_ops xennet_ethtool_ops;
 
 struct netfront_cb {
@@ -1334,12 +1336,20 @@ static struct net_device *xennet_create_dev(struct xenbus_device *dev)
 
 	netif_carrier_off(netdev);
 
-	xenbus_switch_state(dev, XenbusStateInitialising);
-	wait_event(module_wq,
-		   xenbus_read_driver_state(dev->otherend) !=
-		   XenbusStateClosed &&
-		   xenbus_read_driver_state(dev->otherend) !=
-		   XenbusStateUnknown);
+	do {
+		dev_dbg(&dev->dev,
+			"%s: switching to XenbusStateInitialising\n",
+			dev->nodename);
+		xenbus_switch_state(dev, XenbusStateInitialising);
+		err = wait_event_timeout(module_wq,
+				 xenbus_read_driver_state(dev->otherend) !=
+				 XenbusStateClosed &&
+				 xenbus_read_driver_state(dev->otherend) !=
+				 XenbusStateUnknown, XENNET_TIMEOUT);
+		dev_dbg(&dev->dev, "%s: state = %d\n", dev->nodename,
+			xenbus_read_driver_state(dev->otherend));
+	} while (!err);
+
 	return netdev;
 
  exit:
@@ -2139,28 +2149,53 @@ static const struct attribute_group xennet_dev_group = {
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
+		dev_dbg(&dev->dev, "%s: switching to XenbusStateClosing\n",
+			dev->nodename);
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
+		dev_dbg(&dev->dev, "%s: state = %d\n", dev->nodename,
+			xenbus_read_driver_state(dev->otherend));
+	} while (!ret);
+
+	if (xenbus_read_driver_state(dev->otherend) == XenbusStateClosed)
+		return;
 
+	do {
+		dev_dbg(&dev->dev, "%s: switching to XenbusStateClosed\n",
+			dev->nodename);
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
+		dev_dbg(&dev->dev, "%s: state = %d\n", dev->nodename,
+			xenbus_read_driver_state(dev->otherend));
+	} while (!ret);
+}
+
+static int xennet_remove(struct xenbus_device *dev)
+{
+	struct netfront_info *info = dev_get_drvdata(&dev->dev);
+
+	dev_dbg(&dev->dev, "%s\n", dev->nodename);
 
+	xennet_bus_close(dev);
 	xennet_disconnect_backend(info);
 
 	if (info->netdev->reg_state == NETREG_REGISTERED)
-- 
2.25.1


