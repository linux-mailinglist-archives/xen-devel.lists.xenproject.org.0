Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBCA391991
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 16:11:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132525.247161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lluEt-0003bm-H9; Wed, 26 May 2021 14:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132525.247161; Wed, 26 May 2021 14:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lluEt-0003Yh-Cq; Wed, 26 May 2021 14:10:27 +0000
Received: by outflank-mailman (input) for mailman id 132525;
 Wed, 26 May 2021 14:10:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nl8y=KV=huawei.com=yuehaibing@srs-us1.protection.inumbo.net>)
 id 1lluEs-0003Yb-9r
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 14:10:26 +0000
Received: from szxga06-in.huawei.com (unknown [45.249.212.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea4827a7-1acd-4e4c-abda-8d08324150fe;
 Wed, 26 May 2021 14:10:24 +0000 (UTC)
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Fqt7z5r8zzmZLL;
 Wed, 26 May 2021 22:07:59 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 22:10:20 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 22:10:20 +0800
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
X-Inumbo-ID: ea4827a7-1acd-4e4c-abda-8d08324150fe
From: YueHaibing <yuehaibing@huawei.com>
To: <boris.ostrovsky@oracle.com>, <jgross@suse.com>, <sstabellini@kernel.org>,
	<yuehaibing@huawei.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] xen: Use DEVICE_ATTR_*() macro
Date: Wed, 26 May 2021 22:10:19 +0800
Message-ID: <20210526141019.13752-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected

Use DEVICE_ATTR_*() helper instead of plain DEVICE_ATTR(),
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/xen/pcpu.c                |  6 +++---
 drivers/xen/xen-balloon.c         | 28 +++++++++++-----------------
 drivers/xen/xenbus/xenbus_probe.c | 15 +++++++--------
 3 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
index 1bcdd5227771..47aa3a1ccaf5 100644
--- a/drivers/xen/pcpu.c
+++ b/drivers/xen/pcpu.c
@@ -92,7 +92,7 @@ static int xen_pcpu_up(uint32_t cpu_id)
 	return HYPERVISOR_platform_op(&op);
 }
 
-static ssize_t show_online(struct device *dev,
+static ssize_t online_show(struct device *dev,
 			   struct device_attribute *attr,
 			   char *buf)
 {
@@ -101,7 +101,7 @@ static ssize_t show_online(struct device *dev,
 	return sprintf(buf, "%u\n", !!(cpu->flags & XEN_PCPU_FLAGS_ONLINE));
 }
 
-static ssize_t __ref store_online(struct device *dev,
+static ssize_t __ref online_store(struct device *dev,
 				  struct device_attribute *attr,
 				  const char *buf, size_t count)
 {
@@ -130,7 +130,7 @@ static ssize_t __ref store_online(struct device *dev,
 		ret = count;
 	return ret;
 }
-static DEVICE_ATTR(online, S_IRUGO | S_IWUSR, show_online, store_online);
+static DEVICE_ATTR_RW(online);
 
 static struct attribute *pcpu_dev_attrs[] = {
 	&dev_attr_online.attr,
diff --git a/drivers/xen/xen-balloon.c b/drivers/xen/xen-balloon.c
index a8d24433c8e9..8cd583db20b1 100644
--- a/drivers/xen/xen-balloon.c
+++ b/drivers/xen/xen-balloon.c
@@ -134,13 +134,13 @@ void xen_balloon_init(void)
 EXPORT_SYMBOL_GPL(xen_balloon_init);
 
 #define BALLOON_SHOW(name, format, args...)				\
-	static ssize_t show_##name(struct device *dev,			\
+	static ssize_t name##_show(struct device *dev,			\
 				   struct device_attribute *attr,	\
 				   char *buf)				\
 	{								\
 		return sprintf(buf, format, ##args);			\
 	}								\
-	static DEVICE_ATTR(name, S_IRUGO, show_##name, NULL)
+	static DEVICE_ATTR_RO(name)
 
 BALLOON_SHOW(current_kb, "%lu\n", PAGES2KB(balloon_stats.current_pages));
 BALLOON_SHOW(low_kb, "%lu\n", PAGES2KB(balloon_stats.balloon_low));
@@ -152,16 +152,15 @@ static DEVICE_ULONG_ATTR(retry_count, 0444, balloon_stats.retry_count);
 static DEVICE_ULONG_ATTR(max_retry_count, 0644, balloon_stats.max_retry_count);
 static DEVICE_BOOL_ATTR(scrub_pages, 0644, xen_scrub_pages);
 
-static ssize_t show_target_kb(struct device *dev, struct device_attribute *attr,
+static ssize_t target_kb_show(struct device *dev, struct device_attribute *attr,
 			      char *buf)
 {
 	return sprintf(buf, "%lu\n", PAGES2KB(balloon_stats.target_pages));
 }
 
-static ssize_t store_target_kb(struct device *dev,
+static ssize_t target_kb_store(struct device *dev,
 			       struct device_attribute *attr,
-			       const char *buf,
-			       size_t count)
+			       const char *buf, size_t count)
 {
 	char *endchar;
 	unsigned long long target_bytes;
@@ -176,22 +175,19 @@ static ssize_t store_target_kb(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(target_kb, S_IRUGO | S_IWUSR,
-		   show_target_kb, store_target_kb);
+static DEVICE_ATTR_RW(target_kb);
 
-
-static ssize_t show_target(struct device *dev, struct device_attribute *attr,
-			      char *buf)
+static ssize_t target_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
 {
 	return sprintf(buf, "%llu\n",
 		       (unsigned long long)balloon_stats.target_pages
 		       << PAGE_SHIFT);
 }
 
-static ssize_t store_target(struct device *dev,
+static ssize_t target_store(struct device *dev,
 			    struct device_attribute *attr,
-			    const char *buf,
-			    size_t count)
+			    const char *buf, size_t count)
 {
 	char *endchar;
 	unsigned long long target_bytes;
@@ -206,9 +202,7 @@ static ssize_t store_target(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(target, S_IRUGO | S_IWUSR,
-		   show_target, store_target);
-
+static DEVICE_ATTR_RW(target);
 
 static struct attribute *balloon_attrs[] = {
 	&dev_attr_target_kb.attr,
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 97f0d234482d..33d09b3f6211 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -207,7 +207,7 @@ void xenbus_otherend_changed(struct xenbus_watch *watch,
 EXPORT_SYMBOL_GPL(xenbus_otherend_changed);
 
 #define XENBUS_SHOW_STAT(name)						\
-static ssize_t show_##name(struct device *_dev,				\
+static ssize_t name##_show(struct device *_dev,				\
 			   struct device_attribute *attr,		\
 			   char *buf)					\
 {									\
@@ -215,14 +215,14 @@ static ssize_t show_##name(struct device *_dev,				\
 									\
 	return sprintf(buf, "%d\n", atomic_read(&dev->name));		\
 }									\
-static DEVICE_ATTR(name, 0444, show_##name, NULL)
+static DEVICE_ATTR_RO(name)
 
 XENBUS_SHOW_STAT(event_channels);
 XENBUS_SHOW_STAT(events);
 XENBUS_SHOW_STAT(spurious_events);
 XENBUS_SHOW_STAT(jiffies_eoi_delayed);
 
-static ssize_t show_spurious_threshold(struct device *_dev,
+static ssize_t spurious_threshold_show(struct device *_dev,
 				       struct device_attribute *attr,
 				       char *buf)
 {
@@ -231,9 +231,9 @@ static ssize_t show_spurious_threshold(struct device *_dev,
 	return sprintf(buf, "%d\n", dev->spurious_threshold);
 }
 
-static ssize_t set_spurious_threshold(struct device *_dev,
-				      struct device_attribute *attr,
-				      const char *buf, size_t count)
+static ssize_t spurious_threshold_store(struct device *_dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
 {
 	struct xenbus_device *dev = to_xenbus_device(_dev);
 	unsigned int val;
@@ -248,8 +248,7 @@ static ssize_t set_spurious_threshold(struct device *_dev,
 	return count;
 }
 
-static DEVICE_ATTR(spurious_threshold, 0644, show_spurious_threshold,
-		   set_spurious_threshold);
+static DEVICE_ATTR_RW(spurious_threshold);
 
 static struct attribute *xenbus_attrs[] = {
 	&dev_attr_event_channels.attr,
-- 
2.17.1


