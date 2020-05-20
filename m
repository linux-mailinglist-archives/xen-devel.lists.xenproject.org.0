Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7D41DAE4B
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 11:04:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbKeS-0002wu-4f; Wed, 20 May 2020 09:04:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cwnj=7C=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1jbKeQ-0002wo-5I
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 09:04:34 +0000
X-Inumbo-ID: e944c724-9a78-11ea-ae69-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e944c724-9a78-11ea-ae69-bc764e2007e4;
 Wed, 20 May 2020 09:04:29 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id b91so2221536edf.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2020 02:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cxVe7z5qO5Qs7eGgcvSh31+4K5/DeD3iRNuzH0HAxuk=;
 b=TXm3L+NIb3XAHg5yp445t0VZcIT8EbggRa9KdpEROqmJVDAorllnh26t5yqkvwlDKW
 m5PYDkHpx2PqIfT+SIzZTnPtrIR5PniAeBGoeJx6ByvxV8W+D//I+TZ1RYeMYUg56pGA
 Hp+md7wmt/K9hc5lEXoIf2byBQ9+5h8OLAM+npMWpK346fnn0SkPoGlQP7147bPACxhH
 +3dR3IXpZQMQ1Brb/iJZi3o/vdsQW0p5vonKvFtEjS2CyBcXcVk+qR7bE7HDDjtfZsDH
 HbSTNn2rVoSy7Zx6d1XKPtqF5tNGZu8Gaqj8LWbvyLlPH/1Z4BQD1hv8z54IJR4yORds
 hsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cxVe7z5qO5Qs7eGgcvSh31+4K5/DeD3iRNuzH0HAxuk=;
 b=UmQmGiG+8X+oIQx8szfvE3MmrpaKwo83sLuvi0p0b8zQSxQS8hbq1lfFbxb7BpRAME
 nkj5KgRsoZT+QLBdBqP/cT+ZxsZxQIuuY9IY++PNgMlbRL3FHsP0EFNO8BlR67beVMN4
 RW0xCP+fPg8ZQfO8HUjA80TaT4jwSvBnI4W/hc2R7O/OawBsB0Cktt8fMC2EXr93g6Kk
 KyS6XaygQad+b81tx9YZqDNORDAtfqMNrXJtNWAh4SziZqYlhFYyV238Jvik7qYcoYA3
 uUdFjJqIl2VR3WT1u7e4gQQ3/nbda0jO6iTGYPgSO9Z9CdvbrjIyrVxQHy9am3B1CqbM
 K5pA==
X-Gm-Message-State: AOAM530DLcRYdvx/GexYraIVqM4XPSZrmKN2n0ENI2g/nVejh46Ft9aI
 vKn6ZhY1v4Wg93fh0MDJA1fj+xHA
X-Google-Smtp-Source: ABdhPJy2i0oSG0uCwwcpW62NAlWD2JX+n/HqLBknlQfX98ojK0xiYyvde6gKBX5uCZRiWByiX3l0mA==
X-Received: by 2002:a50:b286:: with SMTP id p6mr2541409edd.350.1589965468129; 
 Wed, 20 May 2020 02:04:28 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id p5sm1324811edi.82.2020.05.20.02.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 02:04:27 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, jgross@suse.com, ian.jackson@eu.citrix.com,
 wei.liu2@citrix.com, konrad.wilk@oracle.com
Subject: [PATCH 1/2] xen/displif: Protocol version 2
Date: Wed, 20 May 2020 12:04:24 +0300
Message-Id: <20200520090425.28558-2-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520090425.28558-1-andr2000@gmail.com>
References: <20200520090425.28558-1-andr2000@gmail.com>
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

1. Change protocol version from string to integer

Version string, which is in fact an integer, is hard to handle in the
code that supports different protocol versions. To simplify that
make the version an integer.

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
 xen/include/public/io/displif.h | 83 +++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 3 deletions(-)

diff --git a/xen/include/public/io/displif.h b/xen/include/public/io/displif.h
index cc5de9cb1f35..4d43ba5078c8 100644
--- a/xen/include/public/io/displif.h
+++ b/xen/include/public/io/displif.h
@@ -38,7 +38,7 @@
  *                           Protocol version
  ******************************************************************************
  */
-#define XENDISPL_PROTOCOL_VERSION     "1"
+#define XENDISPL_PROTOCOL_VERSION     2
 
 /*
  ******************************************************************************
@@ -202,6 +202,9 @@
  *      Width and height of the connector in pixels separated by
  *      XENDISPL_RESOLUTION_SEPARATOR. This defines visible area of the
  *      display.
+ *      If backend provides extended display identification data (EDID) with
+ *      XENDISPL_OP_GET_EDID request then EDID values must take precedence
+ *      over the resolutions defined here.
  *
  *------------------ Connector Request Transport Parameters -------------------
  *
@@ -349,6 +352,7 @@
 #define XENDISPL_OP_FB_DETACH         0x13
 #define XENDISPL_OP_SET_CONFIG        0x14
 #define XENDISPL_OP_PG_FLIP           0x15
+#define XENDISPL_OP_GET_EDID          0x16
 
 /*
  ******************************************************************************
@@ -377,6 +381,10 @@
 #define XENDISPL_FIELD_BE_ALLOC       "be-alloc"
 #define XENDISPL_FIELD_UNIQUE_ID      "unique-id"
 
+#define XENDISPL_EDID_BLOCK_SIZE      128
+#define XENDISPL_EDID_BLOCK_COUNT     256
+#define XENDISPL_EDID_MAX_SIZE        (XENDISPL_EDID_BLOCK_SIZE * XENDISPL_EDID_BLOCK_COUNT)
+
 /*
  ******************************************************************************
  *                          STATUS RETURN CODES
@@ -451,7 +459,9 @@
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
@@ -494,6 +504,7 @@
  *   buffer size (buffer_sz) exceeds what can be addressed by this single page,
  *   then reference to the next page must be supplied (see gref_dir_next_page
  *   below)
+ * data_ofs - uint32_t, offset of the data in the buffer, octets
  */
 
 #define XENDISPL_DBUF_FLG_REQ_ALLOC       (1 << 0)
@@ -506,6 +517,7 @@ struct xendispl_dbuf_create_req {
     uint32_t buffer_sz;
     uint32_t flags;
     grant_ref_t gref_directory;
+    uint32_t data_ofs;
 };
 
 /*
@@ -731,6 +743,42 @@ struct xendispl_page_flip_req {
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
@@ -753,6 +801,31 @@ struct xendispl_page_flip_req {
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
@@ -804,6 +877,7 @@ struct xendispl_req {
         struct xendispl_fb_detach_req fb_detach;
         struct xendispl_set_config_req set_config;
         struct xendispl_page_flip_req pg_flip;
+        struct xendispl_get_edid_req get_edid;
         uint8_t reserved[56];
     } op;
 };
@@ -813,7 +887,10 @@ struct xendispl_resp {
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


