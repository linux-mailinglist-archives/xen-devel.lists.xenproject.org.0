Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F2A66B0A3
	for <lists+xen-devel@lfdr.de>; Sun, 15 Jan 2023 12:31:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477858.740757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1EO-0004o0-0e; Sun, 15 Jan 2023 11:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477858.740757; Sun, 15 Jan 2023 11:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pH1EN-0004j8-TM; Sun, 15 Jan 2023 11:31:19 +0000
Received: by outflank-mailman (input) for mailman id 477858;
 Sun, 15 Jan 2023 11:31:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ytYW=5M=gmail.com=dmitry.semenets@srs-se1.protection.inumbo.net>)
 id 1pH1EM-0004co-En
 for xen-devel@lists.xenproject.org; Sun, 15 Jan 2023 11:31:18 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f70f17e-94c8-11ed-b8d0-410ff93cb8f0;
 Sun, 15 Jan 2023 12:31:16 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id u19so61973708ejm.8
 for <xen-devel@lists.xenproject.org>; Sun, 15 Jan 2023 03:31:16 -0800 (PST)
Received: from dsemenets-HP-EliteBook-850-G8-Notebook-PC.. ([91.219.254.73])
 by smtp.gmail.com with ESMTPSA id
 uj42-20020a170907c9aa00b0084d4e612a22sm7459961ejc.67.2023.01.15.03.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 03:31:15 -0800 (PST)
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
X-Inumbo-ID: 1f70f17e-94c8-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBqwkdTRqUwsY27EiP5YbesMgj7n7qTjOsQBFo8GYrE=;
        b=QwaIpJdnEWMrDV9ZVxPKuUyl7Pi8ECOWt8hyB4G2cSC+mNK0H+LMpIrDm2cl90+hbU
         FFJOD2E7WpDSliUnmb/Dno2Af+sHkwT7PBW0UjtFKHQBC6b/twmJ4C9M1A5JqRUsAu5l
         TRJJ4MGHYIiCRTZCKsT/2ueklyDo5xRdUHW4dGQgrAOxcqYckEAqT+oFDYbtZpkHJPyU
         +ppjHBSSKJzCM6T4WY74pT6ivefE3azDHm1XOqDF96/RcwYPNnbE10fS6L39V8gSbUrC
         t35/J+zp1j4PHLmdh2isTy1sLJ6LpQRrP7kySnCnHmBmGQw07ag6qnzT6r3S2fuRbX8O
         gnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TBqwkdTRqUwsY27EiP5YbesMgj7n7qTjOsQBFo8GYrE=;
        b=mlwivffz3BUF05TY7GwQYHoOK1EFyknsEHzrmZkOGEmmHQzF9I3rz+oFylMAvF6g3Q
         Sdv7Crn0GITZt8dXp4cw/sYcdy5kjbXZgDAqWThe/s6q9FclEsnBYhJSK2SWiQEKR7w/
         jxayyi403g9mnK8FFCkEV532/IC913lsifyIY2R+DRgs342TWo3C0Qq1imhy3aWZt64g
         fr6gQzI9pFn6CTK7P8iwqqbFUqR1DC0bzaYFDLM/ZtmG4Gsse5BzpVxJ9DvoQCqxyFN7
         v807fx4FEO1zfsJwYkpxO9cUfDO+EBCuY77ZP+GbihL3YIN4OZg9iwZRE4Nd9cLPHtab
         J2jA==
X-Gm-Message-State: AFqh2kpvFdx4piZ1C8JBS7V6pNM/yR7X+i8HO4F9w4wwpZwIgP2wmMxK
	HVrf3wiWbtmTEDNeTV0SWkhRrT9LaX0d+2bQ
X-Google-Smtp-Source: AMrXdXvZ32YsPLgOdTO+otsGGHFp+YCDuOV+0rKNF6of4w6hnrg24wnd22SuHOKktSTOClOxf4TYPw==
X-Received: by 2002:a17:906:2816:b0:7c0:d452:2e74 with SMTP id r22-20020a170906281600b007c0d4522e74mr75892077ejc.4.1673782275466;
        Sun, 15 Jan 2023 03:31:15 -0800 (PST)
From: Dmytro Semenets <dmitry.semenets@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Dmytro Semenets <dmytro_semenets@epam.com>
Subject: [RFC PATCH v3 01/10] tools: allow vchan XenStore paths more then 64 bytes long
Date: Sun, 15 Jan 2023 13:31:02 +0200
Message-Id: <20230115113111.1207605-2-dmitry.semenets@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
References: <20230115113111.1207605-1-dmitry.semenets@gmail.com>
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


