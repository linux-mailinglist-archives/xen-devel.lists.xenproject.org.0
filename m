Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFB9512E6B
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:28:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316186.535107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVW-00028Q-34; Thu, 28 Apr 2022 08:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316186.535107; Thu, 28 Apr 2022 08:28:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVU-0001as-TC; Thu, 28 Apr 2022 08:28:12 +0000
Received: by outflank-mailman (input) for mailman id 316186;
 Thu, 28 Apr 2022 08:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzVG-0005SL-C6
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 189c7fbc-c6cd-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 10:27:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7237D1F88A;
 Thu, 28 Apr 2022 08:27:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43ED413491;
 Thu, 28 Apr 2022 08:27:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QF5XDwhQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:52 +0000
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
X-Inumbo-ID: 189c7fbc-c6cd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7cqwaPLtFzhyk9LMWncXmAETsj1bDnyp+ydH1my5u10=;
	b=XTUSjtzPzruE8bhqvv73TtSTB50qK9+aNrXbuRtAJ9c6hvz9KnGSHEC+p8iV6zrfVFvbr7
	Me2MbBlNtrfCJ/FKyPE9+PGYOV6x5DQhu0AqYudjZTvyTvrfxBYt3eMH0Ldo8Fj7KYWYxl
	hQkceNSNaNLcPkHDy8rh2e1023pRJhY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 17/19] xen/usbfront: use xenbus_setup_ring() and xenbus_teardown_ring()
Date: Thu, 28 Apr 2022 10:27:41 +0200
Message-Id: <20220428082743.16593-18-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify xen-hcd's ring creation and removal via xenbus_setup_ring()
and xenbus_teardown_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/host/xen-hcd.c | 61 ++++++++++----------------------------
 1 file changed, 15 insertions(+), 46 deletions(-)

diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index 9cbc7c2dab02..de1b09158318 100644
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
@@ -1118,46 +1109,24 @@ static int xenhcd_setup_rings(struct xenbus_device *dev,
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
-	}
-	SHARED_RING_INIT(urb_sring);
-	FRONT_RING_INIT(&info->urb_ring, urb_sring, PAGE_SIZE);
-
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
-		goto fail;
+	err = xenbus_setup_ring(dev, GFP_NOIO | __GFP_HIGH,
+				(void **)&urb_sring, 1, &info->urb_ring_ref);
+	if (err) {
+		xenbus_dev_fatal(dev, err, "allocating urb ring");
+		return err;
 	}
-	SHARED_RING_INIT(conn_sring);
-	FRONT_RING_INIT(&info->conn_ring, conn_sring, PAGE_SIZE);
+	XEN_FRONT_RING_INIT(&info->urb_ring, urb_sring, PAGE_SIZE);
 
-	err = xenbus_grant_ring(dev, conn_sring, 1, &gref);
-	if (err < 0) {
-		free_page((unsigned long)conn_sring);
-		info->conn_ring.sring = NULL;
+	err = xenbus_setup_ring(dev, GFP_NOIO | __GFP_HIGH,
+				(void **)&conn_sring, 1, &info->conn_ring_ref);
+	if (err) {
+		xenbus_dev_fatal(dev, err, "allocating conn ring");
 		goto fail;
 	}
-	info->conn_ring_ref = gref;
+	XEN_FRONT_RING_INIT(&info->conn_ring, conn_sring, PAGE_SIZE);
 
 	err = xenbus_alloc_evtchn(dev, &info->evtchn);
 	if (err) {
-- 
2.34.1


