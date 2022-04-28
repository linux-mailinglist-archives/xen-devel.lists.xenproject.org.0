Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CB3512E6A
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 10:28:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316185.535097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVT-0001aA-Jc; Thu, 28 Apr 2022 08:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316185.535097; Thu, 28 Apr 2022 08:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njzVS-0000xd-El; Thu, 28 Apr 2022 08:28:10 +0000
Received: by outflank-mailman (input) for mailman id 316185;
 Thu, 28 Apr 2022 08:27:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KUQd=VG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1njzVF-0005SL-Bj
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 08:27:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 187ae0aa-c6cd-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 10:27:52 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C6951F88B;
 Thu, 28 Apr 2022 08:27:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEBE613491;
 Thu, 28 Apr 2022 08:27:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GGn6OAdQamIBLgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Apr 2022 08:27:51 +0000
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
X-Inumbo-ID: 187ae0aa-c6cd-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651134472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1OIhlvhpDf96xGkhA26yZf7pns1SEZ9vLk/EobSBf7U=;
	b=e4ZiNoI9Kk/vxF6WBGPMvTgtaqzePnrbSEgd3HhKF9fP7PEcYc6C3tzqPjkZsraNDBQpgQ
	Xh5BmiCZb69+V49nJ6MhqGTMRLvrWvGZekAggS1g0NOR11UvMZk2/S6Lwh9yw+93369n8K
	zuoWN8JagVvATERzOOkykaCGvpybBDs=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH v2 16/19] xen/scsifront: use xenbus_setup_ring() and xenbus_teardown_ring()
Date: Thu, 28 Apr 2022 10:27:40 +0200
Message-Id: <20220428082743.16593-17-jgross@suse.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220428082743.16593-1-jgross@suse.com>
References: <20220428082743.16593-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify scsifront's ring creation and removal via xenbus_setup_ring()
and xenbus_teardown_ring().

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/scsi/xen-scsifront.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/scsi/xen-scsifront.c b/drivers/scsi/xen-scsifront.c
index 4c55e479fc36..51afc66e839d 100644
--- a/drivers/scsi/xen-scsifront.c
+++ b/drivers/scsi/xen-scsifront.c
@@ -798,27 +798,15 @@ static int scsifront_alloc_ring(struct vscsifrnt_info *info)
 {
 	struct xenbus_device *dev = info->dev;
 	struct vscsiif_sring *sring;
-	grant_ref_t gref;
-	int err = -ENOMEM;
+	int err;
 
 	/***** Frontend to Backend ring start *****/
-	sring = (struct vscsiif_sring *)__get_free_page(GFP_KERNEL);
-	if (!sring) {
-		xenbus_dev_fatal(dev, err,
-			"fail to allocate shared ring (Front to Back)");
+	err = xenbus_setup_ring(dev, GFP_KERNEL, (void **)&sring, 1,
+				&info->ring_ref);
+	if (err)
 		return err;
-	}
-	SHARED_RING_INIT(sring);
-	FRONT_RING_INIT(&info->ring, sring, PAGE_SIZE);
 
-	err = xenbus_grant_ring(dev, sring, 1, &gref);
-	if (err < 0) {
-		free_page((unsigned long)sring);
-		xenbus_dev_fatal(dev, err,
-			"fail to grant shared ring (Front to Back)");
-		return err;
-	}
-	info->ring_ref = gref;
+	XEN_FRONT_RING_INIT(&info->ring, sring, PAGE_SIZE);
 
 	err = xenbus_alloc_evtchn(dev, &info->evtchn);
 	if (err) {
@@ -847,8 +835,7 @@ static int scsifront_alloc_ring(struct vscsifrnt_info *info)
 free_irq:
 	unbind_from_irqhandler(info->irq, info);
 free_gnttab:
-	gnttab_end_foreign_access(info->ring_ref,
-				  (unsigned long)info->ring.sring);
+	xenbus_teardown_ring((void **)&sring, 1, &info->ring_ref);
 
 	return err;
 }
@@ -856,8 +843,7 @@ static int scsifront_alloc_ring(struct vscsifrnt_info *info)
 static void scsifront_free_ring(struct vscsifrnt_info *info)
 {
 	unbind_from_irqhandler(info->irq, info);
-	gnttab_end_foreign_access(info->ring_ref,
-				  (unsigned long)info->ring.sring);
+	xenbus_teardown_ring((void **)&info->ring.sring, 1, &info->ring_ref);
 }
 
 static int scsifront_init_ring(struct vscsifrnt_info *info)
-- 
2.34.1


