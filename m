Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B8A2104CE
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 09:19:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqX1l-0001fA-Ga; Wed, 01 Jul 2020 07:19:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QDW7=AM=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1jqX1k-0001f0-9R
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 07:19:28 +0000
X-Inumbo-ID: 323dc5c6-bb6b-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 323dc5c6-bb6b-11ea-bb8b-bc764e2007e4;
 Wed, 01 Jul 2020 07:19:27 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h22so18537886lji.9
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2020 00:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Dzidh0Nswx9r0je/a6UkI0vRAjpCHlIaVow9ZwgeZoY=;
 b=SWcZvAHvHllVZRCfxUBGg8Rg05tjPl8Woq7ZnTkpvLRnA9jgCokK28s9asoUU5Vx9e
 LZlwGaVsrofdhr+9PSjihfd2v8d2poYKcjtVKmlxHhq+ca0DtYiBIMC0TU+fQ4ypRT02
 zcZmv9nyU7Zvdk4RS1cC8WiuKG8foMbNnbHlC6c0cjxcaclMWcRpwsaPBhYkDVi8M+2Y
 72e06QiAThuTKvxMEWlJXdbyTZotjIFun2iY9eAibIXNNoNsaTDK0cLnkYYDqJJdAtSh
 8BTdoBfZo1zdJ4AFrfHCR7pMiT/m3dK2d34dfOxHekoyKMCjRV2aUtRMGS/BZRP766WX
 ErOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Dzidh0Nswx9r0je/a6UkI0vRAjpCHlIaVow9ZwgeZoY=;
 b=GRFaxKkf0l/qYXsFsdrvY8QQg1AotkeHFKARbDHP2uBbwLl7hDkD4eJpLbv5q8famS
 F6v01pPSbl7iHHErFBvhVxRH5qZG6ld1tRaXQC3idON776fr150VaQFv+Dx5IRkNFw9o
 mAEFt8HkiWXEvit1gWpvIDfV29DtZQPVQLQxT5GFNcSrDUxWrftk7JwdwO51sk6MLoCa
 e7suuGdeGxA7cOczssFenUjV9JN+dAjM9vjOTkr0Jr/OcKiY6yyOLR4zYPmdFJqD6nXl
 BJomkPmV6sZ6IbYskjykn645ukZpC4M/vA6X4wGjJmQCDHx0L8X7iYpMqKtjuDT8/pa4
 tqiw==
X-Gm-Message-State: AOAM533CrxfJeq/8MbNkH0HtzlOGUmy4Y3qdec1QzpX2RBBWtXwKyKwH
 /xsyJ9mxoc9Wf929yNABs7OAXSpEhQs=
X-Google-Smtp-Source: ABdhPJzHeP5UUKvdKY9UVyzftvsX49OGMGlY57Lr8VA82TTNT1JkFN1xWJw8Jcb1mGcoT2PMhv+p2A==
X-Received: by 2002:a2e:a494:: with SMTP id h20mr7376403lji.435.1593587965653; 
 Wed, 01 Jul 2020 00:19:25 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id z11sm1501163ljh.115.2020.07.01.00.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 00:19:24 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, jgross@suse.com, ian.jackson@eu.citrix.com,
 wl@xen.org
Subject: [PATCH v2] xen/displif: Protocol version 2
Date: Wed,  1 Jul 2020 10:19:23 +0300
Message-Id: <20200701071923.18883-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

1. Add protocol version as an integer

Version string, which is in fact an integer, is hard to handle in the
code that supports different protocol versions. To simplify that
also add the version as an integer.

2. Pass buffer offset with XENDISPL_OP_DBUF_CREATE

There are cases when display data buffer is created with non-zero
offset to the data start. Handle such cases and provide that offset
while creating a display buffer.

3. Add XENDISPL_OP_GET_EDID command

Add an optional request for reading Extended Display Identification
Data (EDID) structure which allows better configuration of the
display connectors over the configuration set in XenStore.
With this change connectors may have multiple resolutions defined
with respect to detailed timing definitions and additional properties
normally provided by displays.

If this request is not supported by the backend then visible area
is defined by the relevant XenStore's "resolution" property.

If backend provides extended display identification data (EDID) with
XENDISPL_OP_GET_EDID request then EDID values must take precedence
over the resolutions defined in XenStore.

4. Bump protocol version to 2.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 xen/include/public/io/displif.h | 91 +++++++++++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/xen/include/public/io/displif.h b/xen/include/public/io/displif.h
index cc5de9cb1f35..0055895510f7 100644
--- a/xen/include/public/io/displif.h
+++ b/xen/include/public/io/displif.h
@@ -38,7 +38,8 @@
  *                           Protocol version
  ******************************************************************************
  */
-#define XENDISPL_PROTOCOL_VERSION     "1"
+#define XENDISPL_PROTOCOL_VERSION     "2"
+#define XENDISPL_PROTOCOL_VERSION_INT  2
 
 /*
  ******************************************************************************
@@ -202,6 +203,9 @@
  *      Width and height of the connector in pixels separated by
  *      XENDISPL_RESOLUTION_SEPARATOR. This defines visible area of the
  *      display.
+ *      If backend provides extended display identification data (EDID) with
+ *      XENDISPL_OP_GET_EDID request then EDID values must take precedence
+ *      over the resolutions defined here.
  *
  *------------------ Connector Request Transport Parameters -------------------
  *
@@ -349,6 +353,8 @@
 #define XENDISPL_OP_FB_DETACH         0x13
 #define XENDISPL_OP_SET_CONFIG        0x14
 #define XENDISPL_OP_PG_FLIP           0x15
+/* The below command is available in protocol version 2 and above. */
+#define XENDISPL_OP_GET_EDID          0x16
 
 /*
  ******************************************************************************
@@ -377,6 +383,10 @@
 #define XENDISPL_FIELD_BE_ALLOC       "be-alloc"
 #define XENDISPL_FIELD_UNIQUE_ID      "unique-id"
 
+#define XENDISPL_EDID_BLOCK_SIZE      128
+#define XENDISPL_EDID_BLOCK_COUNT     256
+#define XENDISPL_EDID_MAX_SIZE        (XENDISPL_EDID_BLOCK_SIZE * XENDISPL_EDID_BLOCK_COUNT)
+
 /*
  ******************************************************************************
  *                          STATUS RETURN CODES
@@ -451,7 +461,9 @@
  * +----------------+----------------+----------------+----------------+
  * |                           gref_directory                          | 40
  * +----------------+----------------+----------------+----------------+
- * |                             reserved                              | 44
+ * |                             data_ofs                              | 44
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 48
  * +----------------+----------------+----------------+----------------+
  * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
  * +----------------+----------------+----------------+----------------+
@@ -494,6 +506,7 @@
  *   buffer size (buffer_sz) exceeds what can be addressed by this single page,
  *   then reference to the next page must be supplied (see gref_dir_next_page
  *   below)
+ * data_ofs - uint32_t, offset of the data in the buffer, octets
  */
 
 #define XENDISPL_DBUF_FLG_REQ_ALLOC       (1 << 0)
@@ -506,6 +519,7 @@ struct xendispl_dbuf_create_req {
     uint32_t buffer_sz;
     uint32_t flags;
     grant_ref_t gref_directory;
+    uint32_t data_ofs;
 };
 
 /*
@@ -731,6 +745,44 @@ struct xendispl_page_flip_req {
     uint64_t fb_cookie;
 };
 
+/*
+ * Request EDID - request EDID describing current connector:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |               id                | _OP_GET_EDID   |   reserved     | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                             buffer_sz                             | 8
+ * +----------------+----------------+----------------+----------------+
+ * |                          gref_directory                           | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 16
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 64
+ * +----------------+----------------+----------------+----------------+
+ *
+ * Notes:
+ *   - This command is not available in protocol version 1 and should be
+ *     ignored.
+ *   - This request is optional and if not supported then visible area
+ *     is defined by the relevant XenStore's "resolution" property.
+ *   - Shared buffer, allocated for EDID storage, must not be less then
+ *     XENDISPL_EDID_MAX_SIZE octets.
+ *
+ * buffer_sz - uint32_t, buffer size to be allocated, octets
+ * gref_directory - grant_ref_t, a reference to the first shared page
+ *   describing EDID buffer references. See XENDISPL_OP_DBUF_CREATE for
+ *   grant page directory structure (struct xendispl_page_directory).
+ *
+ * See response format for this request.
+ */
+
+struct xendispl_get_edid_req {
+    uint32_t buffer_sz;
+    grant_ref_t gref_directory;
+};
+
 /*
  *---------------------------------- Responses --------------------------------
  *
@@ -753,6 +805,35 @@ struct xendispl_page_flip_req {
  * id - uint16_t, private guest value, echoed from request
  * status - int32_t, response status, zero on success and -XEN_EXX on failure
  *
+ *
+ * Get EDID response - response for XENDISPL_OP_GET_EDID:
+ *         0                1                 2               3        octet
+ * +----------------+----------------+----------------+----------------+
+ * |               id                |    operation   |    reserved    | 4
+ * +----------------+----------------+----------------+----------------+
+ * |                              status                               | 8
+ * +----------------+----------------+----------------+----------------+
+ * |                             edid_sz                               | 12
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 16
+ * +----------------+----------------+----------------+----------------+
+ * |/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/|
+ * +----------------+----------------+----------------+----------------+
+ * |                             reserved                              | 64
+ * +----------------+----------------+----------------+----------------+
+ *
+ * Notes:
+ *   - This response is not available in protocol version 1 and should be
+ *     ignored.
+ *
+ * edid_sz - uint32_t, size of the EDID, octets
+ */
+
+struct xendispl_get_edid_resp {
+    uint32_t edid_sz;
+};
+
+/*
  *----------------------------------- Events ----------------------------------
  *
  * Events are sent via a shared page allocated by the front and propagated by
@@ -804,6 +885,7 @@ struct xendispl_req {
         struct xendispl_fb_detach_req fb_detach;
         struct xendispl_set_config_req set_config;
         struct xendispl_page_flip_req pg_flip;
+        struct xendispl_get_edid_req get_edid;
         uint8_t reserved[56];
     } op;
 };
@@ -813,7 +895,10 @@ struct xendispl_resp {
     uint8_t operation;
     uint8_t reserved;
     int32_t status;
-    uint8_t reserved1[56];
+    union {
+        struct xendispl_get_edid_resp get_edid;
+        uint8_t reserved1[56];
+    } op;
 };
 
 struct xendispl_evt {
-- 
2.17.1


