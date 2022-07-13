Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C271573990
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 17:03:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366763.597700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBdtZ-0004dL-78; Wed, 13 Jul 2022 15:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366763.597700; Wed, 13 Jul 2022 15:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBdtZ-0004aX-3g; Wed, 13 Jul 2022 15:03:21 +0000
Received: by outflank-mailman (input) for mailman id 366763;
 Wed, 13 Jul 2022 15:03:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y9RH=XS=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1oBdtX-0004E1-Bp
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 15:03:19 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed9936f4-02bc-11ed-bd2d-47488cf2e6aa;
 Wed, 13 Jul 2022 17:03:18 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 c131-20020a1c3589000000b003a2cc290135so1385728wma.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Jul 2022 08:03:18 -0700 (PDT)
Received: from localhost.localdomain ([91.219.254.75])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a05600c355000b003a2f88b2559sm2288417wmq.44.2022.07.13.08.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jul 2022 08:03:16 -0700 (PDT)
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
X-Inumbo-ID: ed9936f4-02bc-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2qTbh4tpMS6j5x7TCTmXIv/EUZ/EAznJ0phLdG3pq58=;
        b=iqk18XYU09ziI6hvxC/mACUSQu3gtBcBKyI2t28pyOsVmd2qqsOxznhK4mccXncoWH
         rv3C3bSf7Mr93rAfWraT6UgpfFE4seVkMeQJN2ABtWKlFByaHIik+Xx/1ZAuTBLa3Jko
         QJf77w4MymJb3eAw7kmwzSvHeBy8jDw19IjR0T3MI9QJouGOjFtx0ssFrJKaygbjkf2y
         +djwGNhLvL3+kTRyfD66fzcJCGopGI8pSPHfomLU+U3W3jQ4+E/goZphyg1MbBr162zN
         YjMHq5as1pFBSpOvA4ytXncLbuoWAzR0HaAwWrUnhUMlOsG76sjY+X+w1Rk4PEmVxFfx
         UwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2qTbh4tpMS6j5x7TCTmXIv/EUZ/EAznJ0phLdG3pq58=;
        b=h0ufmis/KeUT/QEryqpabdax9xZNtyRPjgSjVYjJXDPb8dRXsfAdlInUGqdkr1oG+W
         +8XxXbd27I5F0V5JFI75OIxvzAGC7CWBom0cxVmi3rCNkb5eV1bZVZJ7zTFcpiiJ8WeH
         LpNN1vrCc+dw+unhyx5P5Gq9DihRG1qLmPYTAT1mxAEFEodycCEaO9pk/YaV6EXG+x+/
         R21eh6U3tj1ZRfnYm8DPuvl3W0c4p6z1FAttl/V7Ofo8ES56yy++osAQyR06bqAxBjTB
         xY0Z3l1RCebC1J+9la3Zuya9btqkFhvt1IuNO64gYI6o1ID4gEqiCXHrgrotxD2ZByJ6
         +ckQ==
X-Gm-Message-State: AJIora9N7To2k1F2ZrFGSZhsKO8T96m2CWWeq0JTdAuJ6zREwfd28W47
	0WhbNjh0SfaySDEmFGc/xRESWUlyz6QrDg==
X-Google-Smtp-Source: AGRyM1vrgMedj+a8MCm/bI2NCaPYuCffnBm8rnBSxlOJSk9yQTchuHbf0MAt8Tg2xNi+VEd1gu6NXw==
X-Received: by 2002:a7b:cd84:0:b0:3a2:ddbe:220a with SMTP id y4-20020a7bcd84000000b003a2ddbe220amr4043631wmj.128.1657724597397;
        Wed, 13 Jul 2022 08:03:17 -0700 (PDT)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Dmytro Semenets <dmytro_semenets@epam.com>
Subject: [PATCH v2 2/4] tools: allow vchan XenStore paths more then 64 bytes long
Date: Wed, 13 Jul 2022 18:03:09 +0300
Message-Id: <20220713150311.4152528-2-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Current vchan implementation, while dealing with XenStore paths,
allocates 64 bytes buffer on the stack which may not be enough for
some use-cases. Make the buffer longer to respect maximum allowed
XenStore path of XENSTORE_ABS_PATH_MAX.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Dmytro Semenets <dmytro_semenets@epam.com>
---
 tools/libs/vchan/init.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
index 9195bd3b98..38658f30af 100644
--- a/tools/libs/vchan/init.c
+++ b/tools/libs/vchan/init.c
@@ -249,7 +249,7 @@ static int init_xs_srv(struct libxenvchan *ctrl, int domain, const char* xs_base
 	int ret = -1;
 	struct xs_handle *xs;
 	struct xs_permissions perms[2];
-	char buf[64];
+	char *buf;
 	char ref[16];
 	char* domid_str = NULL;
 	xs_transaction_t xs_trans = XBT_NULL;
@@ -259,6 +259,12 @@ static int init_xs_srv(struct libxenvchan *ctrl, int domain, const char* xs_base
 	if (!ctrl->xs_path)
 		return -1; 
 
+	buf = malloc(XENSTORE_ABS_PATH_MAX);
+	if (!buf) {
+		free(ctrl);
+		return 0;
+	}
+
 	xs = xs_open(0);
 	if (!xs)
 		goto fail;
@@ -280,14 +286,14 @@ retry_transaction:
 		goto fail_xs_open;
 
 	snprintf(ref, sizeof ref, "%d", ring_ref);
-	snprintf(buf, sizeof buf, "%s/ring-ref", xs_base);
+	snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/ring-ref", xs_base);
 	if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
 		goto fail_xs_open;
 	if (!xs_set_permissions(xs, xs_trans, buf, perms, 2))
 		goto fail_xs_open;
 
 	snprintf(ref, sizeof ref, "%d", ctrl->event_port);
-	snprintf(buf, sizeof buf, "%s/event-channel", xs_base);
+	snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/event-channel", xs_base);
 	if (!xs_write(xs, xs_trans, buf, ref, strlen(ref)))
 		goto fail_xs_open;
 	if (!xs_set_permissions(xs, xs_trans, buf, perms, 2))
@@ -303,6 +309,7 @@ retry_transaction:
 	free(domid_str);
 	xs_close(xs);
  fail:
+	free(buf);
 	return ret;
 }
 
@@ -419,13 +426,20 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
 {
 	struct libxenvchan *ctrl = malloc(sizeof(struct libxenvchan));
 	struct xs_handle *xs = NULL;
-	char buf[64];
+	char *buf;
 	char *ref;
 	int ring_ref;
 	unsigned int len;
 
 	if (!ctrl)
 		return 0;
+
+	buf = malloc(XENSTORE_ABS_PATH_MAX);
+	if (!buf) {
+		free(ctrl);
+		return 0;
+	}
+
 	ctrl->ring = NULL;
 	ctrl->event = NULL;
 	ctrl->gnttab = NULL;
@@ -436,8 +450,9 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
 	if (!xs)
 		goto fail;
 
+
 // find xenstore entry
-	snprintf(buf, sizeof buf, "%s/ring-ref", xs_path);
+	snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/ring-ref", xs_path);
 	ref = xs_read(xs, 0, buf, &len);
 	if (!ref)
 		goto fail;
@@ -445,7 +460,7 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
 	free(ref);
 	if (!ring_ref)
 		goto fail;
-	snprintf(buf, sizeof buf, "%s/event-channel", xs_path);
+	snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/event-channel", xs_path);
 	ref = xs_read(xs, 0, buf, &len);
 	if (!ref)
 		goto fail;
@@ -475,6 +490,7 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
  out:
 	if (xs)
 		xs_close(xs);
+	free(buf);
 	return ctrl;
  fail:
 	libxenvchan_close(ctrl);
-- 
2.25.1


