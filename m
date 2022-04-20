Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9B508B9E
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 17:10:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309352.525535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBy1-0004x6-0X; Wed, 20 Apr 2022 15:10:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309352.525535; Wed, 20 Apr 2022 15:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhBy0-0004pv-OS; Wed, 20 Apr 2022 15:10:04 +0000
Received: by outflank-mailman (input) for mailman id 309352;
 Wed, 20 Apr 2022 15:10:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTZJ=U6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nhBxy-0003l9-6f
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 15:10:02 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f21b4112-c0bb-11ec-8fbf-03012f2f19d4;
 Wed, 20 Apr 2022 17:09:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6714C2112B;
 Wed, 20 Apr 2022 15:09:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E37713AD5;
 Wed, 20 Apr 2022 15:09:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SGcBDkciYGJILQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Apr 2022 15:09:59 +0000
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
X-Inumbo-ID: f21b4112-c0bb-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1650467399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P9m9SWnGsWjRx9ANR0XSy+QMtPG0e3QupiRUzE89rSY=;
	b=FqRfpSvFwPYNTbSEb+BczfXaG/PTZ/jawRTYZIcGfRVWCFx/hIuhAVbgCyF6TW7nx10JYF
	FhE/gNjXdum/2VeRLcck0wNBZhBe41TwRXa/Uxr/OaE4aGv16cRpLtTDb3XaaCaQsxUm2+
	ubqyrMN6DY0Ttw/z5+7IZWwzUAbuaTo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 04/18] xen/usb: switch xen-hcd to use INVALID_GRANT_REF
Date: Wed, 20 Apr 2022 17:09:28 +0200
Message-Id: <20220420150942.31235-5-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220420150942.31235-1-jgross@suse.com>
References: <20220420150942.31235-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using a private macro for an invalid grant reference use
the common one.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/usb/host/xen-hcd.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xen-hcd.c b/drivers/usb/host/xen-hcd.c
index 3e487baf8422..9cbc7c2dab02 100644
--- a/drivers/usb/host/xen-hcd.c
+++ b/drivers/usb/host/xen-hcd.c
@@ -87,8 +87,6 @@ struct xenhcd_info {
 	bool error;
 };
 
-#define GRANT_INVALID_REF 0
-
 #define XENHCD_RING_JIFFIES (HZ/200)
 #define XENHCD_SCAN_JIFFIES 1
 
@@ -1100,17 +1098,17 @@ static void xenhcd_destroy_rings(struct xenhcd_info *info)
 		unbind_from_irqhandler(info->irq, info);
 	info->irq = 0;
 
-	if (info->urb_ring_ref != GRANT_INVALID_REF) {
+	if (info->urb_ring_ref != INVALID_GRANT_REF) {
 		gnttab_end_foreign_access(info->urb_ring_ref,
 					  (unsigned long)info->urb_ring.sring);
-		info->urb_ring_ref = GRANT_INVALID_REF;
+		info->urb_ring_ref = INVALID_GRANT_REF;
 	}
 	info->urb_ring.sring = NULL;
 
-	if (info->conn_ring_ref != GRANT_INVALID_REF) {
+	if (info->conn_ring_ref != INVALID_GRANT_REF) {
 		gnttab_end_foreign_access(info->conn_ring_ref,
 					  (unsigned long)info->conn_ring.sring);
-		info->conn_ring_ref = GRANT_INVALID_REF;
+		info->conn_ring_ref = INVALID_GRANT_REF;
 	}
 	info->conn_ring.sring = NULL;
 }
@@ -1123,8 +1121,8 @@ static int xenhcd_setup_rings(struct xenbus_device *dev,
 	grant_ref_t gref;
 	int err;
 
-	info->urb_ring_ref = GRANT_INVALID_REF;
-	info->conn_ring_ref = GRANT_INVALID_REF;
+	info->urb_ring_ref = INVALID_GRANT_REF;
+	info->conn_ring_ref = INVALID_GRANT_REF;
 
 	urb_sring = (struct xenusb_urb_sring *)get_zeroed_page(
 							GFP_NOIO | __GFP_HIGH);
-- 
2.34.1


