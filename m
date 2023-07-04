Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230CB7477A1
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 19:19:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558585.872817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGjgQ-0005Pw-P2; Tue, 04 Jul 2023 17:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558585.872817; Tue, 04 Jul 2023 17:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGjgQ-0005Nd-M1; Tue, 04 Jul 2023 17:19:22 +0000
Received: by outflank-mailman (input) for mailman id 558585;
 Tue, 04 Jul 2023 17:19:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U3Yz=CW=citrix.com=prvs=5427c2329=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1qGjgO-0005NX-Tj
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 17:19:20 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e780f911-1a8e-11ee-8611-37d641c3527e;
 Tue, 04 Jul 2023 19:19:18 +0200 (CEST)
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
X-Inumbo-ID: e780f911-1a8e-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688491158;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Eql3MawCi2ZfqehegLJ8cUT771NNec9LMnumXVGF1qE=;
  b=ZEYn5Lme1t0+H1RUjEtc6oNMvWnYCANF32UaxMNYmQm84sPJjUOA7Tbr
   GZFO15RSYAQJ0opBudZHyqVHCGjjuXXPaaYmMuTJFHYNXguPr9aNtZ/yo
   mtxNe3mZol0/lrnyPu+HX68hqWmAi0RgPlb58v6wkWjHpVXrVBLtVjFM0
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 115157045
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:g/iXMqsm1UGONY66HkDFEjp+hOfnVKBeMUV32f8akzHdYApBsoF/q
 tZmKWGFMq7eZzT9Ko8kOoS/8kkF7ZOGzoA2SFNlqCswFysV+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5ACGyyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwGDkEXyG7tf2P0aulZsROmPwfc5nlI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw/
 zubpjmmWk1HXDCZ4RW6ymumj+3ooWDUVMFKEvq72q9M33TGkwT/DzVJDADm8JFVkHWWQt9aN
 gkY9zQjqYA080qkSMS7WAe3yFacswIRQZxVGvw25QWJ4q7V5Q+DAS4DVDEpQMc9qMY8SDgu1
 1mIt9DkHzpitPuSU3313q+dsDeaKSUTa2gYakcsThQC59fLuow/jhvTCN1kFcadjsf4GC3i6
 yqHoCg3m/MYistj/7W2+xXLjiyhorDNTxUp/UPHU2S99AR7aYW5IYuy5jDz9PtFMcOTSl6Kv
 1ACnM6R6v1ICouC/BFhW81UQuvvvazcdmSB3xg2RcJJGymRF2CLTYlZ0QBGFlhQI98aVRLLf
 nfv5lNf+8oGVJe1VpObc75dGuxzk/iwSYq8C6GEBjZdSsMvLVHapUmCcWbVhjmwyxZ0zMnTL
 L/BKa6R4WAm5bOLJdZcb8MUyvcVyy833gs/rrirnk38gdJyiJN4IIrp0WdijchjtstoWC2Pr
 75i2zKikn2zqtHWbCjN6pI0JlsXN3U9Dp2eg5UJJr7fels8QT99V665LVYdl2tNxvU9qws11
 ivlBh8wJKTX2BUr1jlmmlg8MeiyDP6TXFowPDA2PEbA5pTQSd/H0UvrTLNuJeNP3LU6nZZJo
 wwtJ53o7gJnFm6WpFzwrPDV8ORfSfhcrVjfZnL4MGVmIsYIqs6g0oaMQzYDPRImVkKf3fbSa
 ZX5vu8HafLvnzhfMfs=
IronPort-HdrOrdr: A9a23:7HCrbqgBgYreQaAKaZfSTzWLknBQXtQji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZsljdMhy72ulB1b
 pxN4hSYeeAaWSSVPyKgjWFLw==
X-Talos-CUID: 9a23:HNyfVG4AIKYvsWnX5dssxEcdK/EdQGLk3W7OD2KaF15VF+2bVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AjOhlcA2EuH6aM7kVfYJV62N7vjUjzJuWEUoEk7I?=
 =?us-ascii?q?6+OaIdnR2fDSx3RLoa9py?=
X-IronPort-AV: E=Sophos;i="6.01,181,1684814400"; 
   d="scan'208";a="115157045"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <qemu-devel@nongnu.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Peter Maydell
	<peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>,
	"Paul Durrant" <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz
	<hreitz@redhat.com>, <xen-devel@lists.xenproject.org>,
	<qemu-block@nongnu.org>
Subject: [PATCH] xen-block: Avoid leaks on new error path
Date: Tue, 4 Jul 2023 18:18:19 +0100
Message-ID: <20230704171819.42564-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@citrix.com>

Commit 189829399070 ("xen-block: Use specific blockdev driver")
introduced a new error path, without taking care of allocated
resources.

So only allocate the qdicts after the error check, and free both
`filename` and `driver` when we are about to return and thus taking
care of both success and error path.

Coverity only spotted the leak of qdicts (*_layer variables).

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: Coverity CID 1508722, 1398649
Fixes: 189829399070 ("xen-block: Use specific blockdev driver")
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 hw/block/xen-block.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index f099914831..3906b9058b 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -781,14 +781,15 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
     drive = g_new0(XenBlockDrive, 1);
     drive->id = g_strdup(id);
 
-    file_layer = qdict_new();
-    driver_layer = qdict_new();
-
     rc = stat(filename, &st);
     if (rc) {
         error_setg_errno(errp, errno, "Could not stat file '%s'", filename);
         goto done;
     }
+
+    file_layer = qdict_new();
+    driver_layer = qdict_new();
+
     if (S_ISBLK(st.st_mode)) {
         qdict_put_str(file_layer, "driver", "host_device");
     } else {
@@ -796,7 +797,6 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
     }
 
     qdict_put_str(file_layer, "filename", filename);
-    g_free(filename);
 
     if (mode && *mode != 'w') {
         qdict_put_bool(file_layer, "read-only", true);
@@ -831,7 +831,6 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
     qdict_put_str(file_layer, "locking", "off");
 
     qdict_put_str(driver_layer, "driver", driver);
-    g_free(driver);
 
     qdict_put(driver_layer, "file", file_layer);
 
@@ -842,6 +841,8 @@ static XenBlockDrive *xen_block_drive_create(const char *id,
     qobject_unref(driver_layer);
 
 done:
+    g_free(filename);
+    g_free(driver);
     if (*errp) {
         xen_block_drive_destroy(drive, NULL);
         return NULL;
-- 
Anthony PERARD


