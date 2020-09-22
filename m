Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE08274036
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 12:58:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKg0M-0002fW-CC; Tue, 22 Sep 2020 10:58:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1J9w=C7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kKg0K-0002eH-Gn
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 10:58:36 +0000
X-Inumbo-ID: a67fb3fc-4d5f-4935-b168-97b0d23d49c5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a67fb3fc-4d5f-4935-b168-97b0d23d49c5;
 Tue, 22 Sep 2020 10:58:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1600772308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gvV/6AUBRn3iyr7G7MIQr6c1JY593oPOEHum75Oq12E=;
 b=fPqa7Nk/C5Rdqdxq00C3hckZjNbLUH41347bJRZu1nmecYQjdOqYr5X05x1ajHVG++9udt
 WOqN9IJj4cuV1Snbcilg1G2FaA76ZCs4zn+KRVYpebDk5qIgSouYNeSiSoUJJ9p2UPxhRG
 yIGzlQTIpTdY6H8XM9jotsgB8W0mt9s=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 813F0AE09;
 Tue, 22 Sep 2020 10:59:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org, Juergen Gross <jgross@suse.com>
Subject: [PATCH 1/2] mini-os: netfront: retrieve netmask and gateway via extra
 function
Date: Tue, 22 Sep 2020 12:58:25 +0200
Message-Id: <20200922105826.26274-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200922105826.26274-1-jgross@suse.com>
References: <20200922105826.26274-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit 1b8ed31f4ce40 ("mini-os: netfront: Read netmask and gateway from
Xenstore") modified init_netfront() to take two additional parameters.
This broke the Xen build as init_netfront() is used in grub stubdom,
too.

So instead of tightly coupling Mini-OS and Xen build via this interface
modification undo this change of init_netfront() and add two other
functions for retrieving the netmask and gateway for a network device.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/netfront.h |  4 +++-
 lwip-net.c         |  4 +++-
 netfront.c         | 21 +++++++++++++++------
 test.c             |  2 +-
 4 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/include/netfront.h b/include/netfront.h
index bc3080e..ec641c8 100644
--- a/include/netfront.h
+++ b/include/netfront.h
@@ -7,7 +7,9 @@ struct netfront_dev *init_netfront(char *nodename,
                                    void (*netif_rx)(unsigned char *data,
                                                     int len, void* arg),
                                    unsigned char rawmac[6],
-                                   char **ip, char **mask, char **gw);
+                                   char **ip);
+char *netfront_get_netmask(struct netfront_dev *dev);
+char *netfront_get_gateway(struct netfront_dev *dev);
 void netfront_xmit(struct netfront_dev *dev, unsigned char* data,int len);
 void shutdown_netfront(struct netfront_dev *dev);
 void suspend_netfront(void);
diff --git a/lwip-net.c b/lwip-net.c
index 80d1c8f..7e0d871 100644
--- a/lwip-net.c
+++ b/lwip-net.c
@@ -347,7 +347,9 @@ void start_networking(void)
 
   tprintk("Waiting for network.\n");
 
-  dev = init_netfront(NULL, NULL, rawmac, &ip, &netmask_str, &gw_str);
+  dev = init_netfront(NULL, NULL, rawmac, &ip);
+  netmask_str = netfront_get_netmask(dev);
+  gw_str = netfront_get_gateway(dev);
   
   if (ip) {
     ipaddr.addr = inet_addr(ip);
diff --git a/netfront.c b/netfront.c
index 205484b..9057908 100644
--- a/netfront.c
+++ b/netfront.c
@@ -65,6 +65,8 @@ struct netfront_dev {
 
     void (*netif_rx)(unsigned char* data, int len, void* arg);
     void *netif_rx_arg;
+
+    struct netfront_dev_list *ldev;
 };
 
 struct netfront_dev_list {
@@ -303,7 +305,7 @@ struct netfront_dev *init_netfront(char *_nodename,
                                    void (*thenetif_rx)(unsigned char* data,
                                                        int len, void* arg),
                                    unsigned char rawmac[6],
-                                   char **ip, char **mask, char **gw)
+                                   char **ip)
 {
     char nodename[256];
     struct netfront_dev *dev;
@@ -347,6 +349,7 @@ struct netfront_dev *init_netfront(char *_nodename,
     memset(ldev, 0, sizeof(struct netfront_dev_list));
 
     if (_init_netfront(dev, ldev->rawmac, &(ldev->ip), &(ldev->mask), &(ldev->gw))) {
+        dev->ldev = ldev;
         ldev->dev = dev;
         ldev->refcount = 1;
         ldev->next = NULL;
@@ -376,15 +379,21 @@ out:
 	}
     if (ip)
         *ip = strdup(ldev->ip);
-    if (mask)
-        *mask = strdup(ldev->mask);
-    if (gw)
-        *gw = strdup(ldev->gw);
 
 err:
     return dev;
 }
 
+char *netfront_get_netmask(struct netfront_dev *dev)
+{
+    return dev->ldev->mask ? strdup(dev->ldev->mask) : NULL;
+}
+
+char *netfront_get_gateway(struct netfront_dev *dev)
+{
+    return dev->ldev->gw ? strdup(dev->ldev->gw) : NULL;
+}
+
 static struct netfront_dev *_init_netfront(struct netfront_dev *dev,
 					   unsigned char rawmac[6],
 					   char **ip, char **mask, char **gw)
@@ -576,7 +585,7 @@ error:
 int netfront_tap_open(char *nodename) {
     struct netfront_dev *dev;
 
-    dev = init_netfront(nodename, NETIF_SELECT_RX, NULL, NULL, NULL, NULL);
+    dev = init_netfront(nodename, NETIF_SELECT_RX, NULL, NULL);
     if (!dev) {
 	printk("TAP open failed\n");
 	errno = EIO;
diff --git a/test.c b/test.c
index 2e5f7f9..42a2666 100644
--- a/test.c
+++ b/test.c
@@ -91,7 +91,7 @@ static struct semaphore net_sem = __SEMAPHORE_INITIALIZER(net_sem, 0);
 
 static void netfront_thread(void *p)
 {
-    net_dev = init_netfront(NULL, NULL, NULL, NULL, NULL, NULL);
+    net_dev = init_netfront(NULL, NULL, NULL, NULL);
     up(&net_sem);
 }
 #endif
-- 
2.26.2


