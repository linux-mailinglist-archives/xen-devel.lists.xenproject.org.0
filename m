Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041522B7954
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 09:49:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29454.58898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJ9D-0007CO-Ow; Wed, 18 Nov 2020 08:49:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29454.58898; Wed, 18 Nov 2020 08:49:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJ9D-0007BS-Kc; Wed, 18 Nov 2020 08:49:03 +0000
Received: by outflank-mailman (input) for mailman id 29454;
 Wed, 18 Nov 2020 08:49:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kfJ9C-0006e0-2a
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:49:02 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3b98daa-67f0-4be6-a54f-a13add3a68af;
 Wed, 18 Nov 2020 08:48:28 +0000 (UTC)
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJ8Q-0007lQ-JE; Wed, 18 Nov 2020 08:48:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=7bqw=EY=casper.srs.infradead.org=batv+9f981d017e6f7609177a+6296+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kfJ9C-0006e0-2a
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 08:49:02 +0000
X-Inumbo-ID: b3b98daa-67f0-4be6-a54f-a13add3a68af
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b3b98daa-67f0-4be6-a54f-a13add3a68af;
	Wed, 18 Nov 2020 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=W6vAbrHw5UIe+hBqHSxB53buLdYkSelEr9Mgh5kMt7I=; b=tqlpD2LwWrfiR177Afk+lAf6gG
	SdmN28pAYbTuw2kFiO29RbN7xRKWcK+sQd821VIf7xVnbdqQONrfdCuRtoqMmY0zDB4DyogQkJMe7
	9KJZJnJN50aEkWC27Pt/nYWB/lO0+TLNoU3MJjrzcHqOdJLhZAe/lA/w0T2YZcgTl2HKfT7BX/UmQ
	qR0sr3QQ090u2mE8YUnyoTA6wu2oYHnwkBT2mdSvairMOUdPrhfoWp8XHx+R1gi5pmhnBe8qvea52
	8A5EiVzDe66E9rlleHsfTARbQmub+5RZzwBNLiRZMW1rvIw+AhtX9+xd6ISnwxbQOslYFzI6NMx5l
	zyrQfYxw==;
Received: from [2001:4bb8:18c:31ba:32b1:ec66:5459:36a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJ8Q-0007lQ-JE; Wed, 18 Nov 2020 08:48:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com,
	Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 07/20] init: refactor name_to_dev_t
Date: Wed, 18 Nov 2020 09:47:47 +0100
Message-Id: <20201118084800.2339180-8-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201118084800.2339180-1-hch@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Split each case into a self-contained helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/genhd.h |   7 +-
 init/do_mounts.c      | 183 +++++++++++++++++++++---------------------
 2 files changed, 91 insertions(+), 99 deletions(-)

diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 22f5b9fd96f8bf..ca5e356084c353 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -388,18 +388,13 @@ static inline void bd_unlink_disk_holder(struct block_device *bdev,
 }
 #endif /* CONFIG_SYSFS */
 
+dev_t blk_lookup_devt(const char *name, int partno);
 #ifdef CONFIG_BLOCK
 void printk_all_partitions(void);
-dev_t blk_lookup_devt(const char *name, int partno);
 #else /* CONFIG_BLOCK */
 static inline void printk_all_partitions(void)
 {
 }
-static inline dev_t blk_lookup_devt(const char *name, int partno)
-{
-	dev_t devt = MKDEV(0, 0);
-	return devt;
-}
 #endif /* CONFIG_BLOCK */
 
 #endif /* _LINUX_GENHD_H */
diff --git a/init/do_mounts.c b/init/do_mounts.c
index b5f9604d0c98a2..aef2f24461c7f1 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -90,7 +90,6 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
 	return 0;
 }
 
-
 /**
  * devt_from_partuuid - looks up the dev_t of a partition by its UUID
  * @uuid_str:	char array containing ascii UUID
@@ -186,7 +185,83 @@ static int match_dev_by_label(struct device *dev, const void *data)
 
 	return 0;
 }
-#endif
+
+static dev_t devt_from_partlabel(const char *label)
+{
+	struct device *dev;
+	dev_t devt = 0;
+
+	dev = class_find_device(&block_class, NULL, label, &match_dev_by_label);
+	if (dev) {
+		devt = dev->devt;
+		put_device(dev);
+	}
+
+	return devt;
+}
+
+static dev_t devt_from_devname(const char *name)
+{
+	dev_t devt = 0;
+	int part;
+	char s[32];
+	char *p;
+
+	if (strlen(name) > 31)
+		return 0;
+	strcpy(s, name);
+	for (p = s; *p; p++) {
+		if (*p == '/')
+			*p = '!';
+	}
+
+	devt = blk_lookup_devt(s, 0);
+	if (devt)
+		return devt;
+
+	/*
+	 * Try non-existent, but valid partition, which may only exist after
+	 * opening the device, like partitioned md devices.
+	 */
+	while (p > s && isdigit(p[-1]))
+		p--;
+	if (p == s || !*p || *p == '0')
+		return 0;
+
+	/* try disk name without <part number> */
+	part = simple_strtoul(p, NULL, 10);
+	*p = '\0';
+	devt = blk_lookup_devt(s, part);
+	if (devt)
+		return devt;
+
+	/* try disk name without p<part number> */
+	if (p < s + 2 || !isdigit(p[-2]) || p[-1] != 'p')
+		return 0;
+	p[-1] = '\0';
+	return blk_lookup_devt(s, part);
+}
+#endif /* CONFIG_BLOCK */
+
+static dev_t devt_from_devnum(const char *name)
+{
+	unsigned maj, min, offset;
+	dev_t devt = 0;
+	char *p, dummy;
+
+	if (sscanf(name, "%u:%u%c", &maj, &min, &dummy) == 2 ||
+	    sscanf(name, "%u:%u:%u:%c", &maj, &min, &offset, &dummy) == 3) {
+		devt = MKDEV(maj, min);
+		if (maj != MAJOR(devt) || min != MINOR(devt))
+			return 0;
+	} else {
+		devt = new_decode_dev(simple_strtoul(name, &p, 16));
+		if (*p)
+			return 0;
+	}
+
+	return devt;
+}
 
 /*
  *	Convert a name into device number.  We accept the following variants:
@@ -218,101 +293,23 @@ static int match_dev_by_label(struct device *dev, const void *data)
  *	name contains slashes, the device name has them replaced with
  *	bangs.
  */
-
 dev_t name_to_dev_t(const char *name)
 {
-	char s[32];
-	char *p;
-	dev_t res = 0;
-	int part;
-
+	if (strcmp(name, "/dev/nfs") == 0)
+		return Root_NFS;
+	if (strcmp(name, "/dev/cifs") == 0)
+		return Root_CIFS;
+	if (strcmp(name, "/dev/ram") == 0)
+		return Root_RAM0;
 #ifdef CONFIG_BLOCK
-	if (strncmp(name, "PARTUUID=", 9) == 0) {
-		name += 9;
-		res = devt_from_partuuid(name);
-		if (!res)
-			goto fail;
-		goto done;
-	} else if (strncmp(name, "PARTLABEL=", 10) == 0) {
-		struct device *dev;
-
-		dev = class_find_device(&block_class, NULL, name + 10,
-					&match_dev_by_label);
-		if (!dev)
-			goto fail;
-
-		res = dev->devt;
-		put_device(dev);
-		goto done;
-	}
+	if (strncmp(name, "PARTUUID=", 9) == 0)
+		return devt_from_partuuid(name + 9);
+	if (strncmp(name, "PARTLABEL=", 10) == 0)
+		return devt_from_partlabel(name + 10);
+	if (strncmp(name, "/dev/", 5) == 0)
+		return devt_from_devname(name + 5);
 #endif
-
-	if (strncmp(name, "/dev/", 5) != 0) {
-		unsigned maj, min, offset;
-		char dummy;
-
-		if ((sscanf(name, "%u:%u%c", &maj, &min, &dummy) == 2) ||
-		    (sscanf(name, "%u:%u:%u:%c", &maj, &min, &offset, &dummy) == 3)) {
-			res = MKDEV(maj, min);
-			if (maj != MAJOR(res) || min != MINOR(res))
-				goto fail;
-		} else {
-			res = new_decode_dev(simple_strtoul(name, &p, 16));
-			if (*p)
-				goto fail;
-		}
-		goto done;
-	}
-
-	name += 5;
-	res = Root_NFS;
-	if (strcmp(name, "nfs") == 0)
-		goto done;
-	res = Root_CIFS;
-	if (strcmp(name, "cifs") == 0)
-		goto done;
-	res = Root_RAM0;
-	if (strcmp(name, "ram") == 0)
-		goto done;
-
-	if (strlen(name) > 31)
-		goto fail;
-	strcpy(s, name);
-	for (p = s; *p; p++)
-		if (*p == '/')
-			*p = '!';
-	res = blk_lookup_devt(s, 0);
-	if (res)
-		goto done;
-
-	/*
-	 * try non-existent, but valid partition, which may only exist
-	 * after revalidating the disk, like partitioned md devices
-	 */
-	while (p > s && isdigit(p[-1]))
-		p--;
-	if (p == s || !*p || *p == '0')
-		goto fail;
-
-	/* try disk name without <part number> */
-	part = simple_strtoul(p, NULL, 10);
-	*p = '\0';
-	res = blk_lookup_devt(s, part);
-	if (res)
-		goto done;
-
-	/* try disk name without p<part number> */
-	if (p < s + 2 || !isdigit(p[-2]) || p[-1] != 'p')
-		goto fail;
-	p[-1] = '\0';
-	res = blk_lookup_devt(s, part);
-	if (res)
-		goto done;
-
-fail:
-	return 0;
-done:
-	return res;
+	return devt_from_devnum(name);
 }
 EXPORT_SYMBOL_GPL(name_to_dev_t);
 
-- 
2.29.2


