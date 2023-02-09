Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CAB690DAC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 16:56:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492670.762328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Hj-0006wO-AH; Thu, 09 Feb 2023 15:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492670.762328; Thu, 09 Feb 2023 15:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQ9Hj-0006uE-5r; Thu, 09 Feb 2023 15:56:31 +0000
Received: by outflank-mailman (input) for mailman id 492670;
 Thu, 09 Feb 2023 15:56:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vyas=6F=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pQ9Hh-0006cl-H3
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 15:56:29 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fe65f33-a892-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 16:56:27 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id p26so7633950ejx.13
 for <xen-devel@lists.xenproject.org>; Thu, 09 Feb 2023 07:56:27 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.72])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a170906b00100b0087862f45a29sm1027594ejy.174.2023.02.09.07.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 07:56:26 -0800 (PST)
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
X-Inumbo-ID: 4fe65f33-a892-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBqwkdTRqUwsY27EiP5YbesMgj7n7qTjOsQBFo8GYrE=;
        b=Otue27v9JKkHSwyRJM7inigaaJ/A+nbUdm6nZA67OVZlQxRV2xH6IO+UkKh40PN8xB
         gWeXV+CpZp2jp5QOYprBO4JngVU9bzeiYjYYXRQGzqdDyvTgWe3DH6EhBJvJ0nrGRLA8
         jCZ8w3K7PCdkgSUPL1rWA6Zo8PHMZIxP6Vf7QPZNeqbjX/YMGqjAPzNRiOtDbEqZJthw
         XDwXJnzBVvintI3+0my827uVjYyy5wHDcB7KQhYJbFqE838Ol7ozyeqk8t2rIXh5dUr6
         urhnHkBIV3BKesNt2F7IbEr5Sma4fNYyOoh9+/zbbLHzS9l5hn4TxT/KHXfbOvsU0Srx
         U+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBqwkdTRqUwsY27EiP5YbesMgj7n7qTjOsQBFo8GYrE=;
        b=xa5D7uPWlej6ux3cqXPXQnEMGEvVXoTVIwZdh334bjVdjCaKKuCkcwMv/pgz0pJj6Y
         aV5KHXSs2OsikVGGvA5za/pHEfoyHxbWaVzAmls4zpNQ18KT4wqMS+LrW50xIsUgDnFg
         w4+wtiHOJImX4gwgHui6sbk8kxmU2M0Zla/nlOOtZEuSBTpfo3KoA5/5MJCp1zAQWKpN
         MWzI7WOe2ZBvkgGDg+0wRysqKfm4gk6NtdJzudhjS7NZfDb2CvpXcYON+jqh2aOMLAST
         YaBIGAu41R//RdPpgWeikLFsLwS3RHBm6ts1Ks5cal8lYieZpu51ZMvZcRRLtZ0QSBdw
         0gpA==
X-Gm-Message-State: AO0yUKWQFNwjvhUlVq+3ZAgB3uPYPIlplJpJlGpchJiPzny19s+4Qjsr
	bbx1uvcjzwS1Pkgx9QbR81V7vt5VjbZBSQ==
X-Google-Smtp-Source: AK7set/puazmZO3ubl7G7w9/AN0S6fj2NUEpt69AFT0wH2aw4Z2mQuXg8i+CRoMJLfRMK0hs7qYXjA==
X-Received: by 2002:a17:906:7383:b0:88d:5f84:2756 with SMTP id f3-20020a170906738300b0088d5f842756mr10021510ejl.0.1675958187167;
        Thu, 09 Feb 2023 07:56:27 -0800 (PST)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Dmytro Semenets <dmytro_semenets@epam.com>
Subject: [RFC PATCH v4 1/9] tools: allow vchan XenStore paths more then 64 bytes long
Date: Thu,  9 Feb 2023 17:55:55 +0200
Message-Id: <20230209155604.2753219-2-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
References: <20230209155604.2753219-1-dmitry.semenets@gmail.com>
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
 tools/libs/vchan/init.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
index 9195bd3b98..fec650dc32 100644
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
@@ -259,6 +259,10 @@ static int init_xs_srv(struct libxenvchan *ctrl, int domain, const char* xs_base
 	if (!ctrl->xs_path)
 		return -1; 
 
+	buf = malloc(XENSTORE_ABS_PATH_MAX);
+	if (!buf)
+		return -1;
+
 	xs = xs_open(0);
 	if (!xs)
 		goto fail;
@@ -280,14 +284,14 @@ retry_transaction:
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
@@ -303,6 +307,7 @@ retry_transaction:
 	free(domid_str);
 	xs_close(xs);
  fail:
+	free(buf);
 	return ret;
 }
 
@@ -419,13 +424,20 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
 {
 	struct libxenvchan *ctrl = malloc(sizeof(struct libxenvchan));
 	struct xs_handle *xs = NULL;
-	char buf[64];
+	char *buf;
 	char *ref;
 	int ring_ref;
 	unsigned int len;
 
 	if (!ctrl)
-		return 0;
+		return NULL;
+
+	buf = malloc(XENSTORE_ABS_PATH_MAX);
+	if (!buf) {
+		free(ctrl);
+		return NULL;
+	}
+
 	ctrl->ring = NULL;
 	ctrl->event = NULL;
 	ctrl->gnttab = NULL;
@@ -436,8 +448,9 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
 	if (!xs)
 		goto fail;
 
+
 // find xenstore entry
-	snprintf(buf, sizeof buf, "%s/ring-ref", xs_path);
+	snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/ring-ref", xs_path);
 	ref = xs_read(xs, 0, buf, &len);
 	if (!ref)
 		goto fail;
@@ -445,7 +458,7 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
 	free(ref);
 	if (!ring_ref)
 		goto fail;
-	snprintf(buf, sizeof buf, "%s/event-channel", xs_path);
+	snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/event-channel", xs_path);
 	ref = xs_read(xs, 0, buf, &len);
 	if (!ref)
 		goto fail;
@@ -475,6 +488,7 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
  out:
 	if (xs)
 		xs_close(xs);
+	free(buf);
 	return ctrl;
  fail:
 	libxenvchan_close(ctrl);
-- 
2.34.1


