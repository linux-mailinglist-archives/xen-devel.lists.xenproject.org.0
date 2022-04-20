Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983B9508BAD
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309363.525647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhByG-0008Dp-EB; Wed, 20 Apr 2022 15:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309363.525647; Wed, 20 Apr 2022 15:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhByE-0007t3-Qf; Wed, 20 Apr 2022 15:10:18 +0000
Received: by outflank-mailman (input) for mailman id 309363;
 Wed, 20 Apr 2022 15:10:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhBy4-0003l9-7c
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:10:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f3bbec23-c0bb-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 17:10:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 249321F755;
 Wed, 20 Apr 2022 15:10:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F294D13AD5;
 Wed, 20 Apr 2022 15:10:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wD8gOkkiYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:10:01 +0000
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
X-Inumbo-ID: f3bbec23-c0bb-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650467402; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4XO8mycpJSRe2vI+Vj0O3qJ4olWbFoCtMGHkp23ojsk=;
	b=Y/wHvCn79hpZ3MR5MUZgiZYUWb54QUxJMgP20Sni9+zhVg83Ad+Ow6g1GClmrtdxakPE9M
	cm1US8RDJtQ9jv+2INVLRiTBj/VTsmp/DbYnUzbcWFWq60WgTjevWgSCFhJG/LFhRTGMGS
	NcQBgF6wnnuAovRz8oLfTVPntt124Ag=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 16/18] xen/usbfront: use xenbus_setup_ring() and xenbus_teardown_ring()
Date: Wed, 20 Apr 2022 17:09:40 +0200
Message-Id: <20220420150942.31235-17-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420150942.31235-1-jgross@suse.com>
References: <20220420150942.31235-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify xen-hcd's ring creation and removal via xenbus_setup_ring()
and xenbus_teardown_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/usb/host/xen-hcd.c | 55 +++++++++-----------------------------
 1 file changed, 13 insertions(+), 42 deletions(-)

diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index 9cbc7c2dab02..0acb68eb37ee 100644
--- a/drivers/usb/host/xen-hcd.c
+++ b/drivers/usb/host/xen-hcd.c
@@ -1098,19 +1098,10 @@ static void xenhcd_destroy_rings(struct xenhcd_info *info)
 		unbind_from_irqhandler(info->irq, info);
 	info->irq = 0;
 
-	if (info->urb_ring_ref != INVALID_GRANT_REF) {
-		gnttab_end_foreign_access(info->urb_ring_ref,
-					  (unsigned long)info->urb_ring.sring);
-		info->urb_ring_ref = INVALID_GRANT_REF;
-	}
-	info->urb_ring.sring = NULL;
-
-	if (info->conn_ring_ref != INVALID_GRANT_REF) {
-		gnttab_end_foreign_access(info->conn_ring_ref,
-					  (unsigned long)info->conn_ring.sring);
-		info->conn_ring_ref = INVALID_GRANT_REF;
-	}
-	info->conn_ring.sring = NULL;
+	xenbus_teardown_ring((void **)&info->urb_ring.sring, 1,
+			     &info->urb_ring_ref);
+	xenbus_teardown_ring((void **)&info->conn_ring.sring, 1,
+			     &info->conn_ring_ref);
 }
 
 static int xenhcd_setup_rings(struct xenbus_device *dev,
@@ -1118,47 +1109,27 @@ static int xenhcd_setup_rings(struct xenbus_device *dev,
 {
 	struct xenusb_urb_sring *urb_sring;
 	struct xenusb_conn_sring *conn_sring;
-	grant_ref_t gref;
 	int err;
 
-	info->urb_ring_ref = INVALID_GRANT_REF;
 	info->conn_ring_ref = INVALID_GRANT_REF;
-
-	urb_sring = (struct xenusb_urb_sring *)get_zeroed_page(
-							GFP_NOIO | __GFP_HIGH);
-	if (!urb_sring) {
-		xenbus_dev_fatal(dev, -ENOMEM, "allocating urb ring");
-		return -ENOMEM;
+	err = xenbus_setup_ring(dev, GFP_NOIO | __GFP_HIGH,
+				(void **)&urb_sring, 1, &info->urb_ring_ref);
+	if (err) {
+		xenbus_dev_fatal(dev, err, "allocating urb ring");
+		return err;
 	}
 	SHARED_RING_INIT(urb_sring);
 	FRONT_RING_INIT(&info->urb_ring, urb_sring, PAGE_SIZE);
 
-	err = xenbus_grant_ring(dev, urb_sring, 1, &gref);
-	if (err < 0) {
-		free_page((unsigned long)urb_sring);
-		info->urb_ring.sring = NULL;
-		goto fail;
-	}
-	info->urb_ring_ref = gref;
-
-	conn_sring = (struct xenusb_conn_sring *)get_zeroed_page(
-							GFP_NOIO | __GFP_HIGH);
-	if (!conn_sring) {
-		xenbus_dev_fatal(dev, -ENOMEM, "allocating conn ring");
-		err = -ENOMEM;
+	err = xenbus_setup_ring(dev, GFP_NOIO | __GFP_HIGH,
+				(void **)&conn_sring, 1, &info->conn_ring_ref);
+	if (err) {
+		xenbus_dev_fatal(dev, err, "allocating conn ring");
 		goto fail;
 	}
 	SHARED_RING_INIT(conn_sring);
 	FRONT_RING_INIT(&info->conn_ring, conn_sring, PAGE_SIZE);
 
-	err = xenbus_grant_ring(dev, conn_sring, 1, &gref);
-	if (err < 0) {
-		free_page((unsigned long)conn_sring);
-		info->conn_ring.sring = NULL;
-		goto fail;
-	}
-	info->conn_ring_ref = gref;
-
 	err = xenbus_alloc_evtchn(dev, &info->evtchn);
 	if (err) {
 		xenbus_dev_fatal(dev, err, "xenbus_alloc_evtchn");
-- 
2.34.1


