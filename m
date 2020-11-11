Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED36F2AEBE4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 09:30:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24423.51754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kclVq-0004C3-Gx; Wed, 11 Nov 2020 08:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24423.51754; Wed, 11 Nov 2020 08:29:54 +0000
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
	id 1kclVp-0004AX-Uq; Wed, 11 Nov 2020 08:29:53 +0000
Received: by outflank-mailman (input) for mailman id 24423;
 Wed, 11 Nov 2020 08:29:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kclUQ-0002dF-Ia
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:28:26 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa1f05d0-9967-49ed-bbbe-693c00e77d6c;
 Wed, 11 Nov 2020 08:27:30 +0000 (UTC)
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kclTG-0007bi-W8; Wed, 11 Nov 2020 08:27:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kJD9=ER=casper.srs.infradead.org=batv+33c89f8a75624a8d62ce+6289+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kclUQ-0002dF-Ia
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 08:28:26 +0000
X-Inumbo-ID: fa1f05d0-9967-49ed-bbbe-693c00e77d6c
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id fa1f05d0-9967-49ed-bbbe-693c00e77d6c;
	Wed, 11 Nov 2020 08:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bgbs5emPj5p7gTWcmnEuks79StD6TA5roIn47mScHH4=; b=fBt6QhZHrv17/Y1zEBZjou8nag
	/S9UF+dPlT5bEmXhZ0AkX3Des+z44TDZwhlLf8UZwm1bya/Tw1ihVWQ1eo0/wpa9jcmRthywUSjkC
	a5WCNVJjuCks8OG28CqM1W4KLfPlPhhxQn2JdcTB6we015wUZWKRrDnDkhahK+xL2QOV8g1e7VDFb
	R8OvQOpZICV1BZy/htkG1su/uosUSegQuLRvZZFjPgBFD8n7wOMK+yVOakCbK2S5b4ZCm7OCaoLMu
	rE0BnJF3Xca/1n6MGkXXTyg53AWbOj3IBct9gJs8ljT/56L365ZklV7NkghnJYSHb0UpMIe95v8XT
	ZTecf9FA==;
Received: from [2001:4bb8:180:6600:bcde:334f:863c:27b8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kclTG-0007bi-W8; Wed, 11 Nov 2020 08:27:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Justin Sanders <justin@coraid.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Minchan Kim <minchan@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com,
	linux-block@vger.kernel.org,
	drbd-dev@lists.linbit.com,
	nbd@other.debian.org,
	ceph-devel@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-raid@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH 12/24] aoe: don't call set_capacity from irq context
Date: Wed, 11 Nov 2020 09:26:46 +0100
Message-Id: <20201111082658.3401686-13-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201111082658.3401686-1-hch@lst.de>
References: <20201111082658.3401686-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Updating the block device size from irq context can lead to torn
writes of the 64-bit value, and prevents us from using normal
process context locking primitives to serialize access to the 64-bit
nr_sectors value.  Defer the set_capacity to the already existing
workqueue handler, where it can be merged with the update of the
block device size by using set_capacity_and_notify.  As an extra
bonus this also adds proper uevent notifications for the resize.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/aoe/aoecmd.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
index 313f0b946fe2b3..ac720bdcd983e7 100644
--- a/drivers/block/aoe/aoecmd.c
+++ b/drivers/block/aoe/aoecmd.c
@@ -890,19 +890,13 @@ void
 aoecmd_sleepwork(struct work_struct *work)
 {
 	struct aoedev *d = container_of(work, struct aoedev, work);
-	struct block_device *bd;
-	u64 ssize;
 
 	if (d->flags & DEVFL_GDALLOC)
 		aoeblk_gdalloc(d);
 
 	if (d->flags & DEVFL_NEWSIZE) {
-		ssize = get_capacity(d->gd);
-		bd = bdget_disk(d->gd, 0);
-		if (bd) {
-			bd_set_nr_sectors(bd, ssize);
-			bdput(bd);
-		}
+		set_capacity_and_notify(d->gd, d->ssize);
+
 		spin_lock_irq(&d->lock);
 		d->flags |= DEVFL_UP;
 		d->flags &= ~DEVFL_NEWSIZE;
@@ -971,10 +965,9 @@ ataid_complete(struct aoedev *d, struct aoetgt *t, unsigned char *id)
 	d->geo.start = 0;
 	if (d->flags & (DEVFL_GDALLOC|DEVFL_NEWSIZE))
 		return;
-	if (d->gd != NULL) {
-		set_capacity(d->gd, ssize);
+	if (d->gd != NULL)
 		d->flags |= DEVFL_NEWSIZE;
-	} else
+	else
 		d->flags |= DEVFL_GDALLOC;
 	schedule_work(&d->work);
 }
-- 
2.28.0


