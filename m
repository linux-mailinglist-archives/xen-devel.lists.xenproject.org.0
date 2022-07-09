Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C9556C8E1
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jul 2022 12:11:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363780.594496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA7QJ-0002Au-4m; Sat, 09 Jul 2022 10:10:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363780.594496; Sat, 09 Jul 2022 10:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oA7QJ-000283-1W; Sat, 09 Jul 2022 10:10:51 +0000
Received: by outflank-mailman (input) for mailman id 363780;
 Sat, 09 Jul 2022 10:10:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+pVM=XO=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1oA7QH-0001pr-DZ
 for xen-devel@lists.xenproject.org; Sat, 09 Jul 2022 10:10:49 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 678e645a-ff6f-11ec-bd2d-47488cf2e6aa;
 Sat, 09 Jul 2022 12:10:48 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id q9so1249160wrd.8
 for <xen-devel@lists.xenproject.org>; Sat, 09 Jul 2022 03:10:48 -0700 (PDT)
Received: from localhost.localdomain ([91.219.254.75])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a5d6941000000b00210bac248c8sm1095853wrw.11.2022.07.09.03.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Jul 2022 03:10:47 -0700 (PDT)
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
X-Inumbo-ID: 678e645a-ff6f-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FdgXdjgQh89IeUkwMBUPt38dYuhV59i+wwEctSJttBo=;
        b=XUZyAbm/HuK+KfFKLsWaB5JNhioNRO8XZDjHEY+Dmcx0RPK29l9yP1uzinmFxHcwAN
         5hHd2HgHRZ9zZwxBDgRcLCwkZdXqWGmMXIq1ZmVnvazkBW34un+0P2Eh0Lgpxv3nGusI
         8NNmH3bcuCYZJBd6k4pR11TghUgyyHlTbnN1ejofXARgf01m0Y6B3iahCfO4opfoTNA6
         RF7lg1S96OMee/7ijiyEYEec9atn9K4DanCVQE21nON/EjWUiFfYsJXhh+1wQmLzDtVY
         r8artQWFxCRxwNjePt7nAqU8JgYfERBUxVAaTk0wK5AG4TXkOs1z6LjhwHfT/+b07Z7E
         oWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FdgXdjgQh89IeUkwMBUPt38dYuhV59i+wwEctSJttBo=;
        b=gjV6zi+WTyB0vvhbiqGY3GFmDfdwBCue0YCgT+qmaqu1hYEXvlXw3FjPE0f4V8GXOC
         4rPDEPEuTLaJf2Yu/tYAy3TM/A1UQed2rcxcvcvTklPENzieTZ/jE2BqVX292C3/GHaP
         T/Umasqd/73hcyxOzCu/OsXVY8SEKLvrpOh0kCF0jpQYyKVfWg0MF5XNDp0mCa1lMbvw
         QyoGscfyuNAcWbSJ2vegFOvE7QhuMNvFqhupQcxgG+AHdOcSiD1BIQYDpiYJGVgOzod8
         WHTQnNuq9VyNkD1JoFSpsKaQUyx15boLm5TgZ4XhegXkg2SHUjBO8rpc9IdfkBw2faLp
         kjOA==
X-Gm-Message-State: AJIora+XmTOhmfPdLvye/PHgsQtnUPRZUdTTb4kKOMiFTM7sqvJo97KZ
	GaVpodLekJK5zYEuohdvjhb4P8ReLPWFJ/d9
X-Google-Smtp-Source: AGRyM1s3flc8y7JDH8oC5SdUmy3+K27fy4iI+qwUMNPEojWjB0DIN7ZHYlXa76JGOR5J/zoUUcp51w==
X-Received: by 2002:adf:ffc1:0:b0:21d:66a1:c3ee with SMTP id x1-20020adfffc1000000b0021d66a1c3eemr7178495wrs.364.1657361447755;
        Sat, 09 Jul 2022 03:10:47 -0700 (PDT)
From: dmitry.semenets@gmail.com
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 2/4] tools: allow vchan XenStore paths more then 64 bytes long
Date: Sat,  9 Jul 2022 13:10:33 +0300
Message-Id: <20220709101035.2989428-2-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
References: <20220709101035.2989428-1-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Current vchan implementation, while dealing with XenStore paths,
allocates 64 bytes buffer on the stack which may not be enough for
some use-cases. Make the buffer longer to respect maximum allowed
XenStore path of XENSTORE_ABS_PATH_MAX.

Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 tools/libs/vchan/init.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
index c6b8674ef5..17945c24a1 100644
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
@@ -257,6 +257,12 @@ static int init_xs_srv(struct libxenvchan *ctrl, int domain, const char* xs_base
 	// store the base path so we can clean up on server closure
 	ctrl->xs_path = strdup(xs_base);
 
+	buf = malloc(XENSTORE_ABS_PATH_MAX);
+	if (!buf) {
+		free(ctrl);
+		return 0;
+	}
+
 	xs = xs_open(0);
 	if (!xs)
 		goto fail;
@@ -278,14 +284,14 @@ retry_transaction:
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
@@ -301,6 +307,7 @@ retry_transaction:
 	free(domid_str);
 	xs_close(xs);
  fail:
+	free(buf);
 	return ret;
 }
 
@@ -418,13 +425,20 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
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
@@ -435,8 +449,9 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
 	if (!xs)
 		goto fail;
 
+
 // find xenstore entry
-	snprintf(buf, sizeof buf, "%s/ring-ref", xs_path);
+	snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/ring-ref", xs_path);
 	ref = xs_read(xs, 0, buf, &len);
 	if (!ref)
 		goto fail;
@@ -444,7 +459,7 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
 	free(ref);
 	if (!ring_ref)
 		goto fail;
-	snprintf(buf, sizeof buf, "%s/event-channel", xs_path);
+	snprintf(buf, XENSTORE_ABS_PATH_MAX, "%s/event-channel", xs_path);
 	ref = xs_read(xs, 0, buf, &len);
 	if (!ref)
 		goto fail;
@@ -474,6 +489,7 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
  out:
 	if (xs)
 		xs_close(xs);
+	free(buf);
 	return ctrl;
  fail:
 	libxenvchan_close(ctrl);
-- 
2.25.1


