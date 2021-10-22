Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC1A437231
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 08:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.214751.373489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdoMW-000658-QN; Fri, 22 Oct 2021 06:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 214751.373489; Fri, 22 Oct 2021 06:49:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdoMW-0005xs-LL; Fri, 22 Oct 2021 06:49:08 +0000
Received: by outflank-mailman (input) for mailman id 214751;
 Fri, 22 Oct 2021 06:49:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e5cR=PK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mdoMV-0005uk-B0
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 06:49:07 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25f39ae0-3304-11ec-83ad-12813bfff9fa;
 Fri, 22 Oct 2021 06:49:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D0BB121983;
 Fri, 22 Oct 2021 06:49:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92EEA13C79;
 Fri, 22 Oct 2021 06:49:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AF+wIuBecmEIEwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 22 Oct 2021 06:49:04 +0000
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
X-Inumbo-ID: 25f39ae0-3304-11ec-83ad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634885344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kLjFhRTaZVh+922MiISGe9xKfsnF1lnWNXu00NonX3Y=;
	b=Yz8ovdFyj3/pte4s30R5bKNii8Dj0Cui8WBkly6EcM+9mbjl8dcoRZskne4zX9d2rhTnSM
	nSZJZNU8MNvgJ0hVKAWx33tvmv06DzvqeJSYABc5kbSCmE3JCkFNf0szyoGGdajX9441j+
	iwpYYIVKuMs8a9+feAbvot98kgyfm38=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/5] xen: add "not_essential" flag to struct xenbus_driver
Date: Fri, 22 Oct 2021 08:47:56 +0200
Message-Id: <20211022064800.14978-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211022064800.14978-1-jgross@suse.com>
References: <20211022064800.14978-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
---
 drivers/input/misc/xen-kbdfront.c          |  1 +
 drivers/video/fbdev/xen-fbfront.c          |  1 +
 drivers/xen/xenbus/xenbus_probe_frontend.c | 14 +++-----------
 include/xen/xenbus.h                       |  1 +
 4 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/input/misc/xen-kbdfront.c b/drivers/input/misc/xen-kbdfront.c
index 4ff5cd2a6d8d..3d17a0b3fe51 100644
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
index 5ec51445bee8..6826f986da43 100644
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
index 480944606a3c..07b010a68fcf 100644
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
index b94074c82772..b13eb86395e0 100644
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
2.26.2


