Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C344987113
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:15:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805155.1216203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlW4-0005nY-9L; Thu, 26 Sep 2024 10:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805155.1216203; Thu, 26 Sep 2024 10:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlW4-0005lR-6I; Thu, 26 Sep 2024 10:14:32 +0000
Received: by outflank-mailman (input) for mailman id 805155;
 Thu, 26 Sep 2024 10:14:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2S5w=QY=bounce.vates.tech=bounce-md_30504962.66f53402.v1-8b1e87364ec749e9a3ab06a7add22449@srs-se1.protection.inumbo.net>)
 id 1stlW3-0005XB-0K
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:14:31 +0000
Received: from mail177-9.suw61.mandrillapp.com
 (mail177-9.suw61.mandrillapp.com [198.2.177.9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c950d43-7bf0-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 12:14:29 +0200 (CEST)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-9.suw61.mandrillapp.com (Mailchimp) with ESMTP id 4XDqFt4t2GzK5vrtM
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 10:14:26 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8b1e87364ec749e9a3ab06a7add22449; Thu, 26 Sep 2024 10:14:26 +0000
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
X-Inumbo-ID: 1c950d43-7bf0-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1727345666; x=1727606166;
	bh=DRimZkyYpcmRSMJFhksb4hjZDJ7L7Xbrn74CwG57nLQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=PcNK7XF9kRnnlvT9kGbORay6vWsL6O+Rtr0rnOG24qAZrkA+/HIf7lrTq3PNi2vpa
	 aiJjklG1TCPArzdY4YU+1cqR0OzCk5jmDk7dnNqH12OiW0+j8LmW0qK0YCbFEgWtrc
	 kZyfNZImwJY/WM0Q8xZcD9jwGJ/8zfCm1TI5mhslpZjIPoZNwUMPnKK4piqmhB+x07
	 F/SZOu3JvJFY8Vx1eHJ30w4YFlnLB9BGpCaKsY+AMq5pfgP/Zw03NlVI41vQJms58b
	 IQIL5c5rkbnVz+aOqPbzrBcXWOwzT9TyPmYO/snnaZ7xgXd6ElEldptlmiHUebW/+o
	 wlFsRViXzAWhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1727345666; x=1727606166; i=anthony.perard@vates.tech;
	bh=DRimZkyYpcmRSMJFhksb4hjZDJ7L7Xbrn74CwG57nLQ=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=z394Zolb7zwu51I2V02EKnuWI1LoPjiI4ff/pA04qh80FrJYDFXuTf0RDkyRTCOop
	 F34fKxGDYAyOMoEJwu72SryC442VwNtFz3gEcZcl55bzq9+hmxshoQrHYgIKh5+WOe
	 le2IZV56UYP4viMzB+kUyDN67dab/iYoNe9D2tgs99qViSh/6J9LzpMTvsHRSQhYQ7
	 XNNNJWm9QIt9pJA8v3Zpapja477MDrSGUKCrl5l1P3e9z749Xs2v65xATbcdyoMS6f
	 C5qBjU6bOl9qW+opVcLCZp2hoIlfg3rLWOqQl3PZR2JqExS354FYwND7G9M0YJ+iFt
	 tgK0NcfrABdUA==
From: Anthony PERARD <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[PATCH=202/2]=20hw/block/xen-block:=20Update=20sector-size=20handling?=
X-Mailer: git-send-email 2.39.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1727345665867
To: qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, xen-devel@lists.xenproject.org, qemu-block@nongnu.org
Message-Id: <20240926101334.2388-3-anthony.perard@vates.tech>
In-Reply-To: <20240926101334.2388-1-anthony.perard@vates.tech>
References: <20240926101334.2388-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8b1e87364ec749e9a3ab06a7add22449?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240926:md
Date: Thu, 26 Sep 2024 10:14:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

The use of "feature-large-sector-size" have been removed from the
protocol, as it hasn't been evenly implemented across all backend and
frontend. Linux for example will happily expose "sector-size" != 512
even when "feature-large-sector-size" hasn't been set by the frontend.

The specification have been clarified regarding what "sector" is by
Xen commit 221f2748e8da ("blkif: reconcile protocol specification with
in-use implementations").

https://xenbits.xenproject.org/gitweb/?p=xen.git;a=commit;h=221f2748e8dabe8361b8cdfcffbeab9102c4c899

So change QEMU to follow the updated specification.

Frontends that exposes "feature-large-sector-size" will most certainly
misbehave if "sector-size" is different than 512, so don't even try.
(Windows driver is likely to be the only one having implemented it.)

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 hw/block/dataplane/xen-block.c | 31 ++++++++++++++++++++++---------
 hw/block/xen-block.c           |  8 ++++----
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
index 98501e6885..43be97b4f3 100644
--- a/hw/block/dataplane/xen-block.c
+++ b/hw/block/dataplane/xen-block.c
@@ -176,7 +176,11 @@ static int xen_block_parse_request(XenBlockRequest *request)
         goto err;
     }
 
-    request->start = request->req.sector_number * dataplane->sector_size;
+    request->start = request->req.sector_number * XEN_BLKIF_SECTOR_SIZE;
+    if (!QEMU_IS_ALIGNED(request->start, dataplane->sector_size)) {
+        error_report("error: sector_number missaligned with sector-size");
+        goto err;
+    }
     for (i = 0; i < request->req.nr_segments; i++) {
         if (i == BLKIF_MAX_SEGMENTS_PER_REQUEST) {
             error_report("error: nr_segments too big");
@@ -186,14 +190,23 @@ static int xen_block_parse_request(XenBlockRequest *request)
             error_report("error: first > last sector");
             goto err;
         }
-        if (request->req.seg[i].last_sect * dataplane->sector_size >=
+        if (request->req.seg[i].last_sect * XEN_BLKIF_SECTOR_SIZE >=
             XEN_PAGE_SIZE) {
             error_report("error: page crossing");
             goto err;
         }
+        if (!QEMU_IS_ALIGNED(request->req.seg[i].first_sect,
+                             dataplane->sector_size / XEN_BLKIF_SECTOR_SIZE)) {
+            error_report("error: first_sect missaligned with sector-size");
+            goto err;
+        }
 
         len = (request->req.seg[i].last_sect -
-               request->req.seg[i].first_sect + 1) * dataplane->sector_size;
+               request->req.seg[i].first_sect + 1) * XEN_BLKIF_SECTOR_SIZE;
+        if (!QEMU_IS_ALIGNED(len, dataplane->sector_size)) {
+            error_report("error: segment size missaligned with sector-size");
+            goto err;
+        }
         request->size += len;
     }
     if (request->start + request->size > blk_getlength(dataplane->blk)) {
@@ -227,17 +240,17 @@ static int xen_block_copy_request(XenBlockRequest *request)
         if (to_domain) {
             segs[i].dest.foreign.ref = request->req.seg[i].gref;
             segs[i].dest.foreign.offset = request->req.seg[i].first_sect *
-                dataplane->sector_size;
+                XEN_BLKIF_SECTOR_SIZE;
             segs[i].source.virt = virt;
         } else {
             segs[i].source.foreign.ref = request->req.seg[i].gref;
             segs[i].source.foreign.offset = request->req.seg[i].first_sect *
-                dataplane->sector_size;
+                XEN_BLKIF_SECTOR_SIZE;
             segs[i].dest.virt = virt;
         }
         segs[i].len = (request->req.seg[i].last_sect -
                        request->req.seg[i].first_sect + 1) *
-                      dataplane->sector_size;
+                      XEN_BLKIF_SECTOR_SIZE;
         virt += segs[i].len;
     }
 
@@ -331,12 +344,12 @@ static bool xen_block_split_discard(XenBlockRequest *request,
 
     /* Wrap around, or overflowing byte limit? */
     if (sec_start + sec_count < sec_count ||
-        sec_start + sec_count > INT64_MAX / dataplane->sector_size) {
+        sec_start + sec_count > INT64_MAX / XEN_BLKIF_SECTOR_SIZE) {
         return false;
     }
 
-    byte_offset = sec_start * dataplane->sector_size;
-    byte_remaining = sec_count * dataplane->sector_size;
+    byte_offset = sec_start * XEN_BLKIF_SECTOR_SIZE;
+    byte_remaining = sec_count * XEN_BLKIF_SECTOR_SIZE;
 
     do {
         byte_chunk = byte_remaining > BDRV_REQUEST_MAX_BYTES ?
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index aed1d5c330..8c150c6c69 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -189,10 +189,10 @@ static void xen_block_connect(XenDevice *xendev, Error **errp)
         feature_large_sector_size = 0;
     }
 
-    if (feature_large_sector_size != 1 &&
+    if (feature_large_sector_size == 1 &&
         conf->logical_block_size != XEN_BLKIF_SECTOR_SIZE) {
-        error_setg(errp, "logical_block_size != %u not supported by frontend",
-                   XEN_BLKIF_SECTOR_SIZE);
+        error_setg(errp,
+                   "\"feature-large-sector-size\" not supported by backend");
         return;
     }
 
@@ -294,7 +294,7 @@ static void xen_block_set_size(XenBlockDevice *blockdev)
     const char *type = object_get_typename(OBJECT(blockdev));
     XenBlockVdev *vdev = &blockdev->props.vdev;
     BlockConf *conf = &blockdev->props.conf;
-    int64_t sectors = blk_getlength(conf->blk) / conf->logical_block_size;
+    int64_t sectors = blk_getlength(conf->blk) / XEN_BLKIF_SECTOR_SIZE;
     XenDevice *xendev = XEN_DEVICE(blockdev);
 
     trace_xen_block_size(type, vdev->disk, vdev->partition, sectors);
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

