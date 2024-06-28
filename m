Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECFA91C103
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 16:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750662.1158740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNCdK-000222-01; Fri, 28 Jun 2024 14:31:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750662.1158740; Fri, 28 Jun 2024 14:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNCdJ-0001xe-QB; Fri, 28 Jun 2024 14:31:25 +0000
Received: by outflank-mailman (input) for mailman id 750662;
 Fri, 28 Jun 2024 14:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KV+V=N6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sNCdI-0001vg-PW
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2024 14:31:24 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1806494c-355b-11ef-90a3-e314d9c70b13;
 Fri, 28 Jun 2024 16:31:23 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-57d1d614049so953588a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jun 2024 07:31:23 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf63390sm84944566b.69.2024.06.28.07.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 07:31:22 -0700 (PDT)
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
X-Inumbo-ID: 1806494c-355b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719585082; x=1720189882; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HcoQ3jxCZ06h2GCy+THa2ZWR0EVbPJaxvXputzPwx0=;
        b=BziVxMbWZMiCPHzA6+OkT0V4E+B6qYrEQqWFeRux6NsXy/SUmDo4wLU0zafrpyCsVx
         nD2ZfNWSQMHlNYq5OVPGEutK2h9KHhD0SvDRUK0md+v94ol3E/30UvwulSqbJoQKWc67
         6UVfsz2sF2jk5HYyxO0nXCSYFQVQYpe4A7tnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719585082; x=1720189882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HcoQ3jxCZ06h2GCy+THa2ZWR0EVbPJaxvXputzPwx0=;
        b=g+nUO7xHhvel+mBgPyKVVtCnGsCCHBMHsVypPDjIATT2zmZryP2ww46u3eayJsup3A
         sD4kQEntRgVpq46koieEzHsxOwuAHfL2XnpsgkEjpRmneHCoFWkntcItl+jzxgTvLUis
         SdFuvAhmC6YcRHZM/xL+PGFr+OmaMOj8oyZLUQ6HenoeZIoUCe1JiFA2mlum60c+1q/f
         kbFm64EMOgFaTsnF/y8vBQlW8YHZCBa/XUrboICzqUvdN4NV6tV4BvZU6cYyfs1/W9+h
         bW7SrrLe+saobajFHPk2/y7v59OiIO6hduV4Wc3o4x6bFQKRjkRLfD2L00vawzFToP67
         3jww==
X-Gm-Message-State: AOJu0YyykN652JVhpfgdjNsmzKnUB8xijy4F2GOQ4EC6ZPB3NEqyYoet
	fx8ilydrql/owRivU4k0eUIqRikLZe2m7Ago/Wxn0YPM2fV7kPLGHksHMBXrCVYGA/jtuxEhxyE
	h+dk=
X-Google-Smtp-Source: AGHT+IF9o3Kg7jr3zKcI7qTmqOEqOBoKhlT5CXjFMwttb5naf+XjdFMl8lOQTAOMnf7ijdGKtzbaQw==
X-Received: by 2002:a17:906:f59b:b0:a72:b34f:e15b with SMTP id a640c23a62f3a-a72b34fe2e9mr130747566b.57.1719585082472;
        Fri, 28 Jun 2024 07:31:22 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 2/3] tools/libxs: Fix CLOEXEC handling in get_socket()
Date: Fri, 28 Jun 2024 15:31:15 +0100
Message-Id: <20240628143116.1044976-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628143116.1044976-1-andrew.cooper3@citrix.com>
References: <20240628143116.1044976-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

get_socket() opens a socket, then uses fcntl() to set CLOEXEC.  This is racy
with exec().

Open the socket with SOCK_CLOEXEC.  Use the same compatibility strategy as
O_CLOEXEC on ancient versions of Linux.

Reported-by: Frediano Ziglio <frediano.ziglio@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/libs/store/xs.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 037e79d98b58..11a766c50887 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -44,6 +44,10 @@
 #define O_CLOEXEC 0
 #endif
 
+#ifndef SOCK_CLOEXEC
+#define SOCK_CLOEXEC 0
+#endif
+
 struct xs_stored_msg {
 	XEN_TAILQ_ENTRY(struct xs_stored_msg) list;
 	struct xsd_sockmsg hdr;
@@ -207,16 +211,14 @@ int xs_fileno(struct xs_handle *h)
 static int get_socket(const char *connect_to)
 {
 	struct sockaddr_un addr;
-	int sock, saved_errno, flags;
+	int sock, saved_errno;
 
-	sock = socket(PF_UNIX, SOCK_STREAM, 0);
+	sock = socket(PF_UNIX, SOCK_STREAM | SOCK_CLOEXEC, 0);
 	if (sock < 0)
 		return -1;
 
-	if ((flags = fcntl(sock, F_GETFD)) < 0)
-		goto error;
-	flags |= FD_CLOEXEC;
-	if (fcntl(sock, F_SETFD, flags) < 0)
+	/* Compat for non-SOCK_CLOEXEC environments.  Racy. */
+	if (!SOCK_CLOEXEC && !set_cloexec(sock))
 		goto error;
 
 	addr.sun_family = AF_UNIX;
-- 
2.39.2


