Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6432B8F6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 16:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92872.175096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHTTY-0002db-1W; Wed, 03 Mar 2021 15:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92872.175096; Wed, 03 Mar 2021 15:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHTTX-0002dC-UC; Wed, 03 Mar 2021 15:31:47 +0000
Received: by outflank-mailman (input) for mailman id 92872;
 Wed, 03 Mar 2021 15:31:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0XjP=IB=gmail.com=akihiko.odaki@srs-us1.protection.inumbo.net>)
 id 1lHTTV-0002d7-WA
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 15:31:46 +0000
Received: from mail-pf1-x42b.google.com (unknown [2607:f8b0:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6553670c-8a9f-482d-8d5a-29de82ceef80;
 Wed, 03 Mar 2021 15:31:45 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id 192so9508933pfv.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Mar 2021 07:31:45 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:5c52:1484:d5e9:8785])
 by smtp.gmail.com with ESMTPSA id j125sm26705574pfd.27.2021.03.03.07.31.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Mar 2021 07:31:44 -0800 (PST)
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
X-Inumbo-ID: 6553670c-8a9f-482d-8d5a-29de82ceef80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HzvFVW88qJpeaN3PjiFjAaeml33FklJwImSBaghimzw=;
        b=LmLXlOEuOBa4KXlpnGJDtuvGZ971Oqx6hQRwB4XSUkkxWqzDIoB7O8AQl1wDiE5Aet
         zkCL89ORXECWQgF1ayZ2reO0+zlL7Qv7obWd3Cxl0FbY4XNBFxgX9IrnfDamhGRE2fd9
         D4Xqjf+xyZdnuMd90P0xPKt0p74ihOEtINjlEB1ozccXUihPdad5Nj4HoV7wMW0Eh0YI
         EHbYePWrmKeZ8RW00MQleXUpJPh5xh8KrzJvsn65/TG3SWJXzGNrIrycNZ1B5cS+M1VA
         C1Mum6jEW8zQjWMO6DXEldM/xNEUoEqFFyRh2R1HY4CAqUPB3ytAAmlJR91b2JFuaTmj
         KN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HzvFVW88qJpeaN3PjiFjAaeml33FklJwImSBaghimzw=;
        b=sOyEFRVrbFuMFu1whg1nu/bLNIVWbpeUijJ9hDZgxagK6YPA+HxCiNT+3Dp0SkA6vx
         bg5R/zLUeOJDMqPPwp6CGknmBcrBcrllaqlnXRzdI705uockCn/XZgswdBge6CUYOqSV
         Gb1yRhiN1JkLMay3xMRkyN8jJEu57Xp9nWSefUM1v9go8vTHtiOprk/JW+bWsMcEFbTq
         UBZ+WsqQz1pTXG0vUTLJDteENz878D/LmXljZsinAupFX57yKi2te7j31SyX0sRAyHg9
         2suMKse5MU7An8D51n5iI0INqGb6KLJ6OtrL9f0csTK7usKIQFTgp0tzhWw4OIKw8g69
         lPCw==
X-Gm-Message-State: AOAM531xG1g7lxsxpvlOlW3Omy1AvrSoRtimkGemOuINYIa0mOLti1vd
	d6PzlkBRtQUjPipKYF1a9Vc=
X-Google-Smtp-Source: ABdhPJz2v3aiEl2W3d0pgwVGvm8Dt1xQchoU1/bnxxhnp3Q7IZdvIzzh69s+bt6Jt50r+ED8MnBvXA==
X-Received: by 2002:a05:6a00:14d5:b029:1ec:c5e5:6041 with SMTP id w21-20020a056a0014d5b02901ecc5e56041mr24355361pfu.36.1614785504405;
        Wed, 03 Mar 2021 07:31:44 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: qemu Developers <qemu-devel@nongnu.org>,
	xen-devel@lists.xenproject.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH v2 1/2] edid: Make refresh rate configurable
Date: Thu,  4 Mar 2021 00:29:47 +0900
Message-Id: <20210303152948.59943-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 hw/display/edid-generate.c |  9 +++++----
 include/hw/display/edid.h  | 12 +++++++-----
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
index 1665b7cbb29..b0ce583d436 100644
--- a/hw/display/edid-generate.c
+++ b/hw/display/edid-generate.c
@@ -203,7 +203,7 @@ static void edid_desc_dummy(uint8_t *desc)
     edid_desc_type(desc, 0x10);
 }
 
-static void edid_desc_timing(uint8_t *desc,
+static void edid_desc_timing(uint8_t *desc, uint32_t refresh_rate,
                              uint32_t xres, uint32_t yres,
                              uint32_t xmm, uint32_t ymm)
 {
@@ -216,9 +216,9 @@ static void edid_desc_timing(uint8_t *desc,
     uint32_t ysync  = yres *  5 / 1000;
     uint32_t yblank = yres * 35 / 1000;
 
-    uint32_t clock  = 75 * (xres + xblank) * (yres + yblank);
+    uint64_t clock  = (uint64_t)refresh_rate * (xres + xblank) * (yres + yblank);
 
-    stl_le_p(desc, clock / 10000);
+    stl_le_p(desc, clock / 10000000);
 
     desc[2] = xres   & 0xff;
     desc[3] = xblank & 0xff;
@@ -303,6 +303,7 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
     uint8_t *xtra3 = NULL;
     uint8_t *dta = NULL;
     uint32_t width_mm, height_mm;
+    uint32_t refresh_rate = info->refresh_rate ? info->refresh_rate : 75000;
     uint32_t dpi = 100; /* if no width_mm/height_mm */
 
     /* =============== set defaults  =============== */
@@ -400,7 +401,7 @@ void qemu_edid_generate(uint8_t *edid, size_t size,
 
     /* =============== descriptor blocks =============== */
 
-    edid_desc_timing(edid + desc, info->prefx, info->prefy,
+    edid_desc_timing(edid + desc, refresh_rate, info->prefx, info->prefy,
                      width_mm, height_mm);
     desc += 18;
 
diff --git a/include/hw/display/edid.h b/include/hw/display/edid.h
index 1f8fc9b3750..520f8ec2027 100644
--- a/include/hw/display/edid.h
+++ b/include/hw/display/edid.h
@@ -11,6 +11,7 @@ typedef struct qemu_edid_info {
     uint32_t    prefy;
     uint32_t    maxx;
     uint32_t    maxy;
+    uint32_t    refresh_rate;
 } qemu_edid_info;
 
 void qemu_edid_generate(uint8_t *edid, size_t size,
@@ -21,10 +22,11 @@ void qemu_edid_region_io(MemoryRegion *region, Object *owner,
 
 uint32_t qemu_edid_dpi_to_mm(uint32_t dpi, uint32_t res);
 
-#define DEFINE_EDID_PROPERTIES(_state, _edid_info)              \
-    DEFINE_PROP_UINT32("xres", _state, _edid_info.prefx, 0),    \
-    DEFINE_PROP_UINT32("yres", _state, _edid_info.prefy, 0),    \
-    DEFINE_PROP_UINT32("xmax", _state, _edid_info.maxx, 0),     \
-    DEFINE_PROP_UINT32("ymax", _state, _edid_info.maxy, 0)
+#define DEFINE_EDID_PROPERTIES(_state, _edid_info)                         \
+    DEFINE_PROP_UINT32("xres", _state, _edid_info.prefx, 0),               \
+    DEFINE_PROP_UINT32("yres", _state, _edid_info.prefy, 0),               \
+    DEFINE_PROP_UINT32("xmax", _state, _edid_info.maxx, 0),                \
+    DEFINE_PROP_UINT32("ymax", _state, _edid_info.maxy, 0),                \
+    DEFINE_PROP_UINT32("refresh_rate", _state, _edid_info.refresh_rate, 0)
 
 #endif /* EDID_H */
-- 
2.24.3 (Apple Git-128)


