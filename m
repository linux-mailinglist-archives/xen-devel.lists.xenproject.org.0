Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B80463741
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 15:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235191.408063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4Ra-0003SV-Qe; Tue, 30 Nov 2021 14:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235191.408063; Tue, 30 Nov 2021 14:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4Ra-0003Ng-Lc; Tue, 30 Nov 2021 14:49:18 +0000
Received: by outflank-mailman (input) for mailman id 235191;
 Tue, 30 Nov 2021 14:49:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fRDO=QR=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1ms4RZ-0003K0-TW
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 14:49:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b04cc086-51ec-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 15:49:16 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D5B3BCE1A55;
 Tue, 30 Nov 2021 14:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE41BC53FD1;
 Tue, 30 Nov 2021 14:49:09 +0000 (UTC)
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
X-Inumbo-ID: b04cc086-51ec-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638283750;
	bh=Gw5VQ3RYUXRNsUiATi1GYRmPBWdQxHeYZIBJlwYHLnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UbHT917w5sbc5FLhlCDUTHfQoevGT+ykC1Xo+FPPzepoU+mXmuKdP/4ZdrvLklWnN
	 Fpno/yBqaHqFKOzWTShzFU+yLtMEJ/j+6AlzyqBH+rnKltgIH+qFy3GXr6BmJ/TPwJ
	 26lDtMEu+fwn/KMzlzL+NDjRx8m03eT4AixbUZwAkbFjn6tdfHNBlYOANWpnMShDrQ
	 IUHvS74R0QDKEpCNlvylxSPXhxUvIAz8mjbz9rerpkCycITu4q+2MS/Gd46l4Aomcb
	 HsUO5JLlRuvqCLf05d1kkFIoLaLU4X59vRhcitSyIltcxxoEv7a/9QAW8M3iVZetRT
	 eHP6SUg86swfw==
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
Subject: [PATCH AUTOSEL 5.15 48/68] xen: add "not_essential" flag to struct xenbus_driver
Date: Tue, 30 Nov 2021 09:46:44 -0500
Message-Id: <20211130144707.944580-48-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
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
index b94074c827721..b13eb86395e05 100644
--- a/include/xen/xenbus.h
+++ b/include/xen/xenbus.h
@@ -112,6 +112,7 @@ struct xenbus_driver {
 	const char *name;       /* defaults to ids[0].devicetype */
 	const struct xenbus_device_id *ids;
 	bool allow_rebind; /* avoid setting xenstore closed during remove */
+	bool not_essential;     /* is not mandatory for boot progress */
 	int (*probe)(struct xenbus_device *dev,
 		     const struct xenbus_device_id *id);
 	void (*otherend_changed)(struct xenbus_device *dev,
-- 
2.33.0


