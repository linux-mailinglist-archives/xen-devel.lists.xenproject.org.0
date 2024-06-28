Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8133B91C102
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 16:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750661.1158734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNCdJ-0001xb-Ll; Fri, 28 Jun 2024 14:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750661.1158734; Fri, 28 Jun 2024 14:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNCdJ-0001vx-IR; Fri, 28 Jun 2024 14:31:25 +0000
Received: by outflank-mailman (input) for mailman id 750661;
 Fri, 28 Jun 2024 14:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KV+V=N6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sNCdI-0001vg-3X
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2024 14:31:24 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17d9ff0d-355b-11ef-90a3-e314d9c70b13;
 Fri, 28 Jun 2024 16:31:23 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a724a8097deso83092866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jun 2024 07:31:23 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf63390sm84944566b.69.2024.06.28.07.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 07:31:21 -0700 (PDT)
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
X-Inumbo-ID: 17d9ff0d-355b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719585082; x=1720189882; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rfv1TRT8DgfBFjODV1M7RVz/7dh85giKSn0Y1bjukyE=;
        b=bkOg5IW+rHEEaDaqvba9+5iGflgAT1BjJ+MC6Ag4h1v1Rqr3BLpGfCAgnpibAp3LfH
         vfjZmjCAd4jTXoawwMKe9ykxHCDSjj8AMfSsimG3dTAUaPrDk/9ubKDjqwFoHofT0pM+
         XusQ2/PbmcUMaFgU/ix+tzHVZOB47kfSlJ+G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719585082; x=1720189882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rfv1TRT8DgfBFjODV1M7RVz/7dh85giKSn0Y1bjukyE=;
        b=sjrXKQpxXRX8vwlzzTvYabxjrTqvSvHe2qZITYmgMiYghk0Rz2PvyNvoxj8A8aOVea
         BMHKjYjGbHZWmsgZXwAPwryoPByYZUzZqErxDEi6t/JQlPV/l5SWnDbDX1JwKIMjBsTl
         7AwBkq9+9VDUZj7aBkAVbibMc9HYoxOynLLNA3G3o10H5jrtsu+r+/Fi9EBk+90NLS37
         0f1nk6jz0KI8ZU9dSzcoHuVLCswRpNLRBphWQfJtUM48RD2ng4y7CV0DWSkyuhFiufIl
         ZW1JkDBv9qr8cjVcMdUtUUHEcAlC3EFUX9rHp/0cHHWvPRUCuW3xWZLNZ27PbGh2zb01
         MgRA==
X-Gm-Message-State: AOJu0YzLOsjlja6uClcL6znYa1F53XlrBLAFslKCoDAOG/85yrQBrq3+
	++PQ5u8UXOaef1lB72I2rYaEAHVl0R9aGPKvW94MLRyDFlVnqToUY97wK71kiSxt5/Nktvx9L1K
	iUuY=
X-Google-Smtp-Source: AGHT+IFPs7aSrfbhtvCVV1yH+c3angPA7Ax0G4Igm+BQEAUJNpmkSc8KgjnrxHqYCsmPzCLZvUgy7g==
X-Received: by 2002:a17:906:3651:b0:a72:50f7:3c6f with SMTP id a640c23a62f3a-a7250f744ccmr856963266b.14.1719585081777;
        Fri, 28 Jun 2024 07:31:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 1/3] tools/libxs: Fix CLOEXEC handling in get_dev()
Date: Fri, 28 Jun 2024 15:31:14 +0100
Message-Id: <20240628143116.1044976-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628143116.1044976-1-andrew.cooper3@citrix.com>
References: <20240628143116.1044976-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the O_CLOEXEC compatibility outside of an #ifdef USE_PTHREAD block.

Introduce set_cloexec() to wrap fcntl() setting FD_CLOEXEC.  It will be reused
for other CLOEXEC fixes too.

Use set_cloexec() when O_CLOEXEC isn't available as a best-effort fallback.

Fixes: f4f2f3402b2f ("tools/libxs: Open /dev/xen/xenbus fds as O_CLOEXEC")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/libs/store/xs.c | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 14985150737e..037e79d98b58 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -40,6 +40,10 @@
 #include <xentoolcore_internal.h>
 #include <xen_list.h>
 
+#ifndef O_CLOEXEC
+#define O_CLOEXEC 0
+#endif
+
 struct xs_stored_msg {
 	XEN_TAILQ_ENTRY(struct xs_stored_msg) list;
 	struct xsd_sockmsg hdr;
@@ -54,10 +58,6 @@ struct xs_stored_msg {
 #include <dlfcn.h>
 #endif
 
-#ifndef O_CLOEXEC
-#define O_CLOEXEC 0
-#endif
-
 struct xs_handle {
 	/* Communications channel to xenstore daemon. */
 	int fd;
@@ -176,6 +176,16 @@ static bool setnonblock(int fd, int nonblock) {
 	return true;
 }
 
+static bool set_cloexec(int fd)
+{
+	int flags = fcntl(fd, F_GETFL);
+
+	if (flags < 0)
+		return false;
+
+	return fcntl(fd, flags | FD_CLOEXEC) >= 0;
+}
+
 int xs_fileno(struct xs_handle *h)
 {
 	char c = 0;
@@ -230,8 +240,24 @@ static int get_socket(const char *connect_to)
 
 static int get_dev(const char *connect_to)
 {
-	/* We cannot open read-only because requests are writes */
-	return open(connect_to, O_RDWR | O_CLOEXEC);
+	int fd, saved_errno;
+
+	fd = open(connect_to, O_RDWR | O_CLOEXEC);
+	if (fd < 0)
+		return -1;
+
+	/* Compat for non-O_CLOEXEC environments.  Racy. */
+	if (!O_CLOEXEC && !set_cloexec(fd))
+		goto error;
+
+	return fd;
+
+error:
+	saved_errno = errno;
+	close(fd);
+	errno = saved_errno;
+
+	return -1;
 }
 
 static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid) {
-- 
2.39.2


