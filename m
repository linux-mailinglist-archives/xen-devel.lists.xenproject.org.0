Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B230542FEE2
	for <lists+xen-devel@lfdr.de>; Sat, 16 Oct 2021 01:31:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211129.368243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbWfC-0000kJ-Q1; Fri, 15 Oct 2021 23:30:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211129.368243; Fri, 15 Oct 2021 23:30:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbWfC-0000iT-Ms; Fri, 15 Oct 2021 23:30:58 +0000
Received: by outflank-mailman (input) for mailman id 211129;
 Fri, 15 Oct 2021 23:30:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZYBM=PD=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mbWfB-0000i4-64
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 23:30:57 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c09bccb6-a6e2-41b0-8ec2-4fc0a94e3e80;
 Fri, 15 Oct 2021 23:30:55 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mbWej-0095ut-6A; Fri, 15 Oct 2021 23:30:29 +0000
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
X-Inumbo-ID: c09bccb6-a6e2-41b0-8ec2-4fc0a94e3e80
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+CQFH8oK70TJq0uFxZnllLSBarTFCbdKjMNvi/6R0AU=; b=SaCfLufaBBFJ5YdrAwSo0fvVDu
	MEDLEYbBM5r6bkQBn40iujou+0VmJ+pOupACXUkgfZGd0H80fQ3GpVUXSJVd55U0FnAojp88La+XZ
	A+JVcfQjTDsMHFZCVKHc/NoxLOewX90cZOK69Bnxa6Ag4G+qF3x/srHfVcTZInS1uIgS4Gj22jaER
	AyKLtEOGF7EhRgLSMFpt0zATZcaMo6hIgbpKTGkt8dKK1stX24tf9yHxuprWxbJQHy82ZMGgrrG81
	+q26GmRzr157Y7UTbLCxP7FCp8Gq+lduxVAiLznbifG4GwAr/TTAIhSlPJFaFqM4qhw6Ut2dNf2+2
	dgm1lHrQ==;
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	agk@redhat.com,
	snitzer@redhat.com,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	roger.pau@citrix.com,
	geert@linux-m68k.org,
	ulf.hansson@linaro.org,
	tj@kernel.org,
	hare@suse.de,
	jdike@addtoit.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes.berg@intel.com,
	krisman@collabora.com,
	chris.obbard@collabora.com,
	thehajime@gmail.com,
	zhuyifei1999@gmail.com,
	haris.iqbal@ionos.com,
	jinpu.wang@ionos.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org
Cc: linux-scsi@vger.kernel.org,
	dm-devel@redhat.com,
	linux-bcache@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [PATCH 1/9] scsi/sd: add error handling support for add_disk()
Date: Fri, 15 Oct 2021 16:30:20 -0700
Message-Id: <20211015233028.2167651-2-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015233028.2167651-1-mcgrof@kernel.org>
References: <20211015233028.2167651-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

As with the error handling for device_add() we follow the same
logic and just put the device so that cleanup is done via the
scsi_disk_release().

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/scsi/sd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index a646d27df681..d69f2e626e76 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -3457,7 +3457,13 @@ static int sd_probe(struct device *dev)
 		pm_runtime_set_autosuspend_delay(dev,
 			sdp->host->hostt->rpm_autosuspend_delay);
 	}
-	device_add_disk(dev, gd, NULL);
+
+	error = device_add_disk(dev, gd, NULL);
+	if (error) {
+		put_device(&sdkp->dev);
+		goto out;
+	}
+
 	if (sdkp->capacity)
 		sd_dif_config_host(sdkp);
 
-- 
2.30.2


