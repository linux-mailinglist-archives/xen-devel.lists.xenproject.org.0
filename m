Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AAC2433F9
	for <lists+xen-devel@lfdr.de>; Thu, 13 Aug 2020 08:22:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k66cO-00029S-8I; Thu, 13 Aug 2020 06:21:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7cFh=BX=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1k66cM-00025f-5i
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2020 06:21:38 +0000
X-Inumbo-ID: ce68b61a-6bc4-4276-8496-256b8c641462
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce68b61a-6bc4-4276-8496-256b8c641462;
 Thu, 13 Aug 2020 06:21:22 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id g6so4870133ljn.11
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2020 23:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IH75Bnms5DPUZxVd4scsKK5yOA6U4dgdsyqfLFTRRs0=;
 b=QKKKrIiwcWdX5YYhi+IBDzFnMzjp6BoSprArgCKJGaFTAFllL2t0ucD3tGKgBwpFvN
 in6kuJpiVUtaHTQ3TW4R/yzg0P2l0ntv2OQXzVQGcjgkUhOYlrGRAGy8n/Iyk8q8BFeu
 0S/pdYd7UYA/6paTgZms7xIXYMQgqQ9+8vtFqsuCQljaX/b4OSlc1s21jKsJqgd6jG+K
 StlWFVqsso5qkm3ZKbZfI/OYTvxWcpOjGenmx423rC41g52XKhksvmFWK7vYLG9BZ0oN
 hbwz5PzY8SVWx8BqvGgFNteRAgZmgIGQ7p1Pkkaxh+eqmGutPo5m7+oEyxVuY+ptdRtO
 4biQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IH75Bnms5DPUZxVd4scsKK5yOA6U4dgdsyqfLFTRRs0=;
 b=seAuTcz/LsJwNipPJMGbkz05lwl1+cf++5GPbZTz6LZby4BGt36kZT++TQhbud4hw6
 r/Pw+9l8PDCYMzUUzaTJNvKVfcONC6Dx3PZGtyFbq+fiAqGPf77XcwChEZzoiiak2y8+
 u7LfbpVxnJsQt66kYElHy/mfCvkyne94Iio5+xw9F/fyevzHk0BZ12E8BdGHL0kVg/zs
 onCoSp3UQprQBl7prfzlQ9Z9M5h029WmbQXE6QZbnY0a4DgidBac/+Qg66LaQSoeIAvh
 diRCpGLdDfdQwqHL4bJ/LpiD/a4gAIzDA2AZp7mrZplUlrIuaIAeKyaUz5JAcotOHREN
 LAyA==
X-Gm-Message-State: AOAM531iqKphUIQhWyHlMYVXo4tU9hJxBMMzgOYgIETQ6Hp5h/MGPIup
 blHV+MN3ytCf/vpuijEHiB7bY5Ecwno=
X-Google-Smtp-Source: ABdhPJzZ/6L5Z/fBwUE4Dex+np7ONiwAFJpUyzfR48jKW7Q6gk4iOCDuNNlT3JqaSw4e0sXtMyhQ8w==
X-Received: by 2002:a2e:804b:: with SMTP id p11mr1352175ljg.221.1597299680641; 
 Wed, 12 Aug 2020 23:21:20 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f14sm964060lfd.2.2020.08.12.23.21.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 23:21:20 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Cc: sstabellini@kernel.org, dan.carpenter@oracle.com,
 intel-gfx@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH v2 4/5] xen: Sync up with the canonical protocol definition in
 Xen
Date: Thu, 13 Aug 2020 09:21:12 +0300
Message-Id: <20200813062113.11030-5-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813062113.11030-1-andr2000@gmail.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

This is the sync up with the canonical definition of the
display protocol in Xen.

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
Reviewed-by: Juergen Gross <jgross@suse.com>
---
 include/xen/interface/io/displif.h | 91 +++++++++++++++++++++++++++++-
 1 file changed, 88 insertions(+), 3 deletions(-)

diff --git a/include/xen/interface/io/displif.h b/include/xen/interface/io/displif.h
index fdc279dc4a88..d43ca0361f86 100644
--- a/include/xen/interface/io/displif.h
+++ b/include/xen/interface/io/displif.h
@@ -38,7 +38,8 @@
  *                           Protocol version
  ******************************************************************************
  */
-#define XENDISPL_PROTOCOL_VERSION	"1"
+#define XENDISPL_PROTOCOL_VERSION	"2"
+#define XENDISPL_PROTOCOL_VERSION_INT	 2
 
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
 #define XENDISPL_OP_FB_DETACH		0x13
 #define XENDISPL_OP_SET_CONFIG		0x14
 #define XENDISPL_OP_PG_FLIP		0x15
+/* The below command is available in protocol version 2 and above. */
+#define XENDISPL_OP_GET_EDID		0x16
 
 /*
  ******************************************************************************
@@ -377,6 +383,10 @@
 #define XENDISPL_FIELD_BE_ALLOC		"be-alloc"
 #define XENDISPL_FIELD_UNIQUE_ID	"unique-id"
 
+#define XENDISPL_EDID_BLOCK_SIZE	128
+#define XENDISPL_EDID_BLOCK_COUNT	256
+#define XENDISPL_EDID_MAX_SIZE		(XENDISPL_EDID_BLOCK_SIZE * XENDISPL_EDID_BLOCK_COUNT)
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
 
 #define XENDISPL_DBUF_FLG_REQ_ALLOC	(1 << 0)
@@ -506,6 +519,7 @@ struct xendispl_dbuf_create_req {
 	uint32_t buffer_sz;
 	uint32_t flags;
 	grant_ref_t gref_directory;
+	uint32_t data_ofs;
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
+	uint32_t buffer_sz;
+	grant_ref_t gref_directory;
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
+	uint32_t edid_sz;
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
+		struct xendispl_get_edid_req get_edid;
 		uint8_t reserved[56];
 	} op;
 };
@@ -813,7 +895,10 @@ struct xendispl_resp {
 	uint8_t operation;
 	uint8_t reserved;
 	int32_t status;
-	uint8_t reserved1[56];
+	union {
+		struct xendispl_get_edid_resp get_edid;
+		uint8_t reserved1[56];
+	} op;
 };
 
 struct xendispl_evt {
-- 
2.17.1


