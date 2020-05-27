Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC5C1E4C39
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 19:44:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je05o-0004RL-GL; Wed, 27 May 2020 17:43:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/NoV=7J=kernel.org=helgaas@srs-us1.protection.inumbo.net>)
 id 1je05m-0004R0-Ia
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 17:43:50 +0000
X-Inumbo-ID: 9f6bdeac-a041-11ea-a76e-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f6bdeac-a041-11ea-a76e-12813bfff9fa;
 Wed, 27 May 2020 17:43:50 +0000 (UTC)
Received: from localhost (mobile-166-175-190-200.mycingular.net
 [166.175.190.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DCEE20663;
 Wed, 27 May 2020 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590601429;
 bh=qsk677uI1G7xG388JRQ1EJcb+HhzqzXoxdTlVWzea00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b38dsy5BnxkemvB3aPYKCSp1dQnRdVruwP9i/zmHaxl2Nc2tYliSvyXorhy6EveSt
 mrBcJSt8Swhi4bC7MYWSGFXFuo0fZmzniwoYXhi4KFqdazKK4EdZSWBjgFIgk8Nwlq
 pvKME8zXxxqF+hce0F4a5Kawn3FZbQjYHtntOCuI=
From: Bjorn Helgaas <helgaas@kernel.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/2] xenbus: Use dev_printk() when possible
Date: Wed, 27 May 2020 12:43:26 -0500
Message-Id: <20200527174326.254329-3-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200527174326.254329-1-helgaas@kernel.org>
References: <20200527174326.254329-1-helgaas@kernel.org>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Use dev_printk() when possible to include device and driver information in
the conventional format.

Add "#define dev_fmt" to preserve KBUILD_MODNAME in messages.

No functional change intended.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/xen/xenbus/xenbus_probe.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index 8c4d05b687b7..ee9a9170b43a 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -31,6 +31,7 @@
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#define dev_fmt pr_fmt
 
 #define DPRINTK(fmt, args...)				\
 	pr_debug("xenbus_probe (%s:%d) " fmt ".\n",	\
@@ -608,7 +609,7 @@ int xenbus_dev_suspend(struct device *dev)
 	if (drv->suspend)
 		err = drv->suspend(xdev);
 	if (err)
-		pr_warn("suspend %s failed: %i\n", dev_name(dev), err);
+		dev_warn(dev, "suspend failed: %i\n", err);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(xenbus_dev_suspend);
@@ -627,8 +628,7 @@ int xenbus_dev_resume(struct device *dev)
 	drv = to_xenbus_driver(dev->driver);
 	err = talk_to_otherend(xdev);
 	if (err) {
-		pr_warn("resume (talk_to_otherend) %s failed: %i\n",
-			dev_name(dev), err);
+		dev_warn(dev, "resume (talk_to_otherend) failed: %i\n", err);
 		return err;
 	}
 
@@ -637,15 +637,14 @@ int xenbus_dev_resume(struct device *dev)
 	if (drv->resume) {
 		err = drv->resume(xdev);
 		if (err) {
-			pr_warn("resume %s failed: %i\n", dev_name(dev), err);
+			dev_warn(dev, "resume failed: %i\n", err);
 			return err;
 		}
 	}
 
 	err = watch_otherend(xdev);
 	if (err) {
-		pr_warn("resume (watch_otherend) %s failed: %d.\n",
-			dev_name(dev), err);
+		dev_warn(dev, "resume (watch_otherend) failed: %d\n", err);
 		return err;
 	}
 
-- 
2.25.1


