Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC0E91C101
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jun 2024 16:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750664.1158764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNCdM-0002fq-G5; Fri, 28 Jun 2024 14:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750664.1158764; Fri, 28 Jun 2024 14:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNCdM-0002dI-CC; Fri, 28 Jun 2024 14:31:28 +0000
Received: by outflank-mailman (input) for mailman id 750664;
 Fri, 28 Jun 2024 14:31:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KV+V=N6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sNCdK-0001vh-5U
 for xen-devel@lists.xenproject.org; Fri, 28 Jun 2024 14:31:26 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18abf6f8-355b-11ef-b4bb-af5377834399;
 Fri, 28 Jun 2024 16:31:24 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-584ef6c07c2so2726740a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Jun 2024 07:31:24 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72aaf63390sm84944566b.69.2024.06.28.07.31.22
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
X-Inumbo-ID: 18abf6f8-355b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719585084; x=1720189884; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NdLvmDIa3nEZMz+AIRiV7A13HKXJr2DbGh0lxxYahWU=;
        b=EtNWVEfcwMfiX50+98HpaJq5RKwhtknWaSiwXeI9IdUB1HwE4jTNI+IYiq5790m1Wt
         gfGJvZg5XeLtdM8LrYUXuBn7v83Fib7YpQB3D1uIyKiCwRqRzlvm/Q4yqw+NR81fgcVT
         MCH5ybwKPUM+RkusUEh8T/1scXRKbdCbc1/1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719585084; x=1720189884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NdLvmDIa3nEZMz+AIRiV7A13HKXJr2DbGh0lxxYahWU=;
        b=l7bopm46xvouw0x8Iy0U2N6Q8BtizvATp4z5UC6oO7UtknQyNgByoLpEYrIhxmZ3fi
         yyYP+R6QfHf9WiKgKToQrybFc0VttozU7DI2ojWQeKgNKHBHqUlmeyIvSlXyCg8TED+m
         akdLkxOJLp3+N8NIDiDKxEyK1RCfNc6MB9HNZNMFckLGtZy0LNtWMdrRiu3xzHBdvVb9
         p51RSs3JoaNYy1Q3PVyxiG7DPqWLdVMoERholuAlNw6JmhflYW30NVHJsIrN8fcTkwAh
         suh9y6f2y04Do7eTkP2GgYI9e79xWMKPy7b2eQHWS0IdvhwQGRvQ9VopogQR42KRb6a+
         taTQ==
X-Gm-Message-State: AOJu0YxeIN6htE9167GUG+KCvpRnVNLWBaA4VwiuMJR7nODuf0c/j91s
	3lhm1KQ5+Oc+IHrG7ZVRq9aGz/7SCCFGVSuSsVX3weuHIegymLcDQIMtTRpwTiAuDdAJ0Vw87mb
	d8ek=
X-Google-Smtp-Source: AGHT+IH0Vk3s+qgCV1Zk3GHG2PVLElkv8IK3qGoOJzLuF5QlAFWgK8137FGB4jtTGQEENAUKrepxKw==
X-Received: by 2002:a17:906:5fd3:b0:a6f:b352:a74b with SMTP id a640c23a62f3a-a72aefd2d3cmr123807966b.38.1719585083864;
        Fri, 28 Jun 2024 07:31:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 3/3] tools/libxs: Fix CLOEXEC handling in xs_fileno()
Date: Fri, 28 Jun 2024 15:31:16 +0100
Message-Id: <20240628143116.1044976-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628143116.1044976-1-andrew.cooper3@citrix.com>
References: <20240628143116.1044976-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xs_fileno() opens a pipe on first use to communicate between the watch thread
and the main thread.  Nothing ever sets CLOEXEC on the file descriptors.

Check for the availability of the pipe2() function with configure.  Despite
starting life as Linux-only, FreeBSD and NetBSD have gained it.

When pipe2() isn't available, try our best with pipe() and set_cloexec().

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 tools/config.h.in     |  3 +++
 tools/configure       | 12 ++++++++++++
 tools/configure.ac    |  2 ++
 tools/libs/store/xs.c | 16 +++++++++++++++-
 4 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/tools/config.h.in b/tools/config.h.in
index 0bb2fe08a143..50ad60fcb091 100644
--- a/tools/config.h.in
+++ b/tools/config.h.in
@@ -39,6 +39,9 @@
 /* Define to 1 if you have the <memory.h> header file. */
 #undef HAVE_MEMORY_H
 
+/* Define to 1 if you have the `pipe2' function. */
+#undef HAVE_PIPE2
+
 /* pygrub enabled */
 #undef HAVE_PYGRUB
 
diff --git a/tools/configure b/tools/configure
index 459bfb56520e..a6b43bfc6064 100755
--- a/tools/configure
+++ b/tools/configure
@@ -9751,6 +9751,18 @@ if test "$ax_found" = "0"; then :
 fi
 
 
+for ac_func in pipe2
+do :
+  ac_fn_c_check_func "$LINENO" "pipe2" "ac_cv_func_pipe2"
+if test "x$ac_cv_func_pipe2" = xyes; then :
+  cat >>confdefs.h <<_ACEOF
+#define HAVE_PIPE2 1
+_ACEOF
+
+fi
+done
+
+
 cat >confcache <<\_ACEOF
 # This file is a shell script that caches the results of configure
 # tests run on this system so they can be shared between configure
diff --git a/tools/configure.ac b/tools/configure.ac
index 851887080c5e..ac0fdc4314c4 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -543,4 +543,6 @@ AS_IF([test "x$pvshim" = "xy"], [
 
 AX_FIND_HEADER([INCLUDE_ENDIAN_H], [endian.h sys/endian.h])
 
+AC_CHECK_FUNCS([pipe2])
+
 AC_OUTPUT()
diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 11a766c50887..27bd20933efd 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -190,13 +190,27 @@ static bool set_cloexec(int fd)
 	return fcntl(fd, flags | FD_CLOEXEC) >= 0;
 }
 
+static int pipe_cloexec(int fds[2])
+{
+#if HAVE_PIPE2
+	return pipe2(fds, O_CLOEXEC);
+#else
+	if (pipe(fds) < 0)
+		return -1;
+	/* Best effort to set CLOEXEC. Racy. */
+	set_cloexec(fds[0]);
+	set_cloexec(fds[1]);
+	return 0;
+#endif
+}
+
 int xs_fileno(struct xs_handle *h)
 {
 	char c = 0;
 
 	mutex_lock(&h->watch_mutex);
 
-	if ((h->watch_pipe[0] == -1) && (pipe(h->watch_pipe) != -1)) {
+	if ((h->watch_pipe[0] == -1) && (pipe_cloexec(h->watch_pipe) != -1)) {
 		/* Kick things off if the watch list is already non-empty. */
 		if (!XEN_TAILQ_EMPTY(&h->watch_list))
 			while (write(h->watch_pipe[1], &c, 1) != 1)
-- 
2.39.2


