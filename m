Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E4A46386C
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 15:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235238.408177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4aF-0002Lt-86; Tue, 30 Nov 2021 14:58:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235238.408177; Tue, 30 Nov 2021 14:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4aF-0002Jf-4P; Tue, 30 Nov 2021 14:58:15 +0000
Received: by outflank-mailman (input) for mailman id 235238;
 Tue, 30 Nov 2021 14:58:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fRDO=QR=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1ms4Tu-0003Jn-KO
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 14:51:42 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0799e548-51ed-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 15:51:41 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A0308B81A25;
 Tue, 30 Nov 2021 14:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E356C53FC1;
 Tue, 30 Nov 2021 14:51:39 +0000 (UTC)
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
X-Inumbo-ID: 0799e548-51ed-11ec-976b-d102b41d0961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638283900;
	bh=PfM6ae6GNFZCEw4a4VjeDB12qCeaG+vd7Sf6HSh7xCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M/XZ9QWX3+5gNGC7IsMT4I+34yJzwGQQEjwZt3AjKosHkaiS5c6LY4gEpx+ivvYj7
	 ySpQbrdVfc0cIHsOmIKAtJrVsv92do1onq9YXAz2ONLmrJcPzt7Wakla9FjrO4IuZ6
	 hzxT/ScncraPhpiOvJ6jQdTQpK0jr29RDydVRUQ738Qt1bogN0hXqNoxWQwZXujfPr
	 cZ7RxSdGtTK2vUgY/9HO78AQ/lSPMwpu0jgpv+D6b5RssSKPbsSe20iVY7aLyJM3K7
	 zXBsFgvEb0ISIr9UfRzozPl5+1HIEBpdA7sxWulHSjwHqcwcufh9a14T1CrBffEA/v
	 gteKp2H2/J9nw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.10 34/43] xen: add "not_essential" flag to struct xenbus_driver
Date: Tue, 30 Nov 2021 09:50:11 -0500
Message-Id: <20211130145022.945517-34-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130145022.945517-1-sashal@kernel.org>
References: <20211130145022.945517-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Juergen Gross <jgross@suse.com>

[ Upstream commit 37a72b08a3e1eb28053214dd8211eb09c2fd3187 ]

When booting the xenbus driver will wait for PV devices to have
connected to their backends before continuing. The timeout is different
between essential and non-essential devices.

Non-essential devices are identified by their nodenames directly in the
xenbus driver, which requires to update this list in case a new device
type being non-essential is added (this was missed for several types
in the past).

In order to avoid this problem, add a "not_essential" flag to struct
xenbus_driver which can be set to "true" by the respective frontend.

Set this flag for the frontends currently regarded to be not essential
(vkbs and vfb) and use it for testing in the xenbus driver.

Signed-off-by: Juergen Gross <jgross@suse.com>
Link: https://lore.kernel.org/r/20211022064800.14978-2-jgross@suse.com
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/input/misc/xen-kbdfront.c          |  1 +
 drivers/video/fbdev/xen-fbfront.c          |  1 +
 drivers/xen/xenbus/xenbus_probe_frontend.c | 14 +++-----------
 include/xen/xenbus.h                       |  1 +
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
index 4ff5cd2a6d8de..3d17a0b3fe511 100644
--- a/drivers/input/misc/xen-kbdfront.c
+++ b/drivers/input/misc/xen-kbdfront.c
@@ -542,6 +542,7 @@ static struct xenbus_driver xenkbd_driver = {
 	.remove = xenkbd_remove,
 	.resume = xenkbd_resume,
 	.otherend_changed = xenkbd_backend_changed,
+	.not_essential = true,
 };
 
 static int __init xenkbd_init(void)
diff --git a/drivers/video/fbdev/xen-fbfront.c b/drivers/video/fbdev/xen-fbfront.c
index 5ec51445bee88..6826f986da436 100644
--- a/drivers/video/fbdev/xen-fbfront.c
+++ b/drivers/video/fbdev/xen-fbfront.c
@@ -695,6 +695,7 @@ static struct xenbus_driver xenfb_driver = {
 	.remove = xenfb_remove,
 	.resume = xenfb_resume,
 	.otherend_changed = xenfb_backend_changed,
+	.not_essential = true,
 };
 
 static int __init xenfb_init(void)
diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
index 480944606a3c9..07b010a68fcf9 100644
--- a/drivers/xen/xenbus/xenbus_probe_frontend.c
+++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
@@ -211,19 +211,11 @@ static int is_device_connecting(struct device *dev, void *data, bool ignore_none
 	if (drv && (dev->driver != drv))
 		return 0;
 
-	if (ignore_nonessential) {
-		/* With older QEMU, for PVonHVM guests the guest config files
-		 * could contain: vfb = [ 'vnc=1, vnclisten=0.0.0.0']
-		 * which is nonsensical as there is no PV FB (there can be
-		 * a PVKB) running as HVM guest. */
+	xendrv = to_xenbus_driver(dev->driver);
 
-		if ((strncmp(xendev->nodename, "device/vkbd", 11) == 0))
-			return 0;
+	if (ignore_nonessential && xendrv->not_essential)
+		return 0;
 
-		if ((strncmp(xendev->nodename, "device/vfb", 10) == 0))
-			return 0;
-	}
-	xendrv = to_xenbus_driver(dev->driver);
 	return (xendev->state < XenbusStateConnected ||
 		(xendev->state == XenbusStateConnected &&
 		 xendrv->is_ready && !xendrv->is_ready(xendev)));
diff --git a/include/xen/xenbus.h b/include/xen/xenbus.h
index bf3cfc7c35d0b..b5626edda6f5b 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -106,6 +106,7 @@ struct xenbus_driver {
 	const char *name;       /* defaults to ids[0].devicetype */
 	const struct xenbus_device_id *ids;
 	bool allow_rebind; /* avoid setting xenstore closed during remove */
+	bool not_essential;     /* is not mandatory for boot progress */
 	int (*probe)(struct xenbus_device *dev,
 		     const struct xenbus_device_id *id);
 	void (*otherend_changed)(struct xenbus_device *dev,
-- 
2.33.0


