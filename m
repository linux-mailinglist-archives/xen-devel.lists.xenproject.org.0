Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E64171E04E8
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:51:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3Cl-0004PA-Nj; Mon, 25 May 2020 02:51:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jd3Ck-0004Ol-EJ
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:51:06 +0000
X-Inumbo-ID: 9005aba2-9e32-11ea-ae69-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9005aba2-9e32-11ea-ae69-bc764e2007e4;
 Mon, 25 May 2020 02:50:59 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id r3so7548284qve.1
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 19:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y9V1tgqrbsz8wnP0O1UzYnljlbdkN5+LC5mMxx9pPO4=;
 b=cnyTYQB33jVd69hyM6RmnHA2+rsRnAQVdhGjUC68MMxQbGsHlnpStndqhrcOoLGwP/
 HYVqoiTnWJ2kqpJWiL8Bk0dIOJh3eX0LNrS/pUvRQThjvzfT9VwKZ8VfXIxNJg+fAOVe
 OWJbriZfk4xqj82/E97TCGsSDT3LwGAzdAJ3uDfIx42sfsBrbuHRv+OZnkfq3eUz1gZr
 DzzZ1FOcOenLRZTw/6EbgwUfjRpqwyWmTmF1C09A4f7HTCrxgIoES9wTtYs2gJMjZadn
 llK0U86PwKlQiTIrGqk9zWjaty7YAYwO/nLMPL8S3MGcYtZl55oo2ul0ugX4UK3fFK+C
 PlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y9V1tgqrbsz8wnP0O1UzYnljlbdkN5+LC5mMxx9pPO4=;
 b=eRpKNsmN75ja5iSBHa72gxeGSIOr6CSFZNv0pkUNOaT55RuwlY7hllOP8ActCLbIKU
 O44KDq5bY3n8YwGGcjg/q3ux+IN65ZZVQVBZy4Jfau6yBNkQ80mU7B/cFqWb7bea0MPU
 mY/S0pMxfNKlFKR5r5TbswTnZi5f7LxPlrp5BIHf/euJXv+ccdFjKqJ79IVmi7UXecWL
 F3mw1dUdxejdcB7cgN+WimeVzNSBgQSywfc5aXkzS0WIIF6nVE7k2chvR1dXoQcWUiPX
 L8KHszXRQf/SIzAaM005foTah6Vr1jCjMYon1FW4uAuDEKrBE89NweOlXNC5J6yTwZPB
 AZcQ==
X-Gm-Message-State: AOAM530OFos4XhXiBl7Snty1KSGgDaeb3vL/yZ8gU+/x2GsqHTdytYZw
 uLtrtbwDUdsW4IwxuX8v7mxh0d+J
X-Google-Smtp-Source: ABdhPJyeCUoOdYimoZsXvuzqA0tzdnRAtxmTY6XHOdXIW6cDTT6vGhf5s3BHQpaKoNNCv5yFr+iCog==
X-Received: by 2002:ad4:57cb:: with SMTP id y11mr13770669qvx.26.1590375058455; 
 Sun, 24 May 2020 19:50:58 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:344b:9349:9475:b6a2])
 by smtp.gmail.com with ESMTPSA id h134sm13539512qke.6.2020.05.24.19.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 19:50:57 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 4/8] vchan-socket-proxy: Use a struct to store state
Date: Sun, 24 May 2020 22:49:51 -0400
Message-Id: <20200525024955.225415-5-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200525024955.225415-1-jandryuk@gmail.com>
References: <20200525024955.225415-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, marmarek@invisiblethingslab.com,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use a struct to group the vchan ctrl and FDs.  This will facilite
tracking the state of open and closed FDs and ctrl in data_loop().

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 52 +++++++++++++++++------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index d85e24ee93..39f4bb1452 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -89,6 +89,12 @@ int insiz = 0;
 int outsiz = 0;
 int verbose = 0;
 
+struct vchan_proxy_state {
+    struct libxenvchan *ctrl;
+    int output_fd;
+    int input_fd;
+};
+
 static void vchan_wr(struct libxenvchan *ctrl) {
     int ret;
 
@@ -374,8 +380,9 @@ int main(int argc, char **argv)
 {
     int is_server = 0;
     int socket_fd = -1;
-    int input_fd, output_fd;
-    struct libxenvchan *ctrl = NULL;
+    struct vchan_proxy_state state = { .ctrl = NULL,
+                                       .input_fd = -1,
+                                       .output_fd = -1 };
     const char *socket_path;
     int domid;
     const char *vchan_path;
@@ -415,15 +422,15 @@ int main(int argc, char **argv)
     socket_path = argv[optind+2];
 
     if (is_server) {
-        ctrl = libxenvchan_server_init(NULL, domid, vchan_path, 0, 0);
-        if (!ctrl) {
+        state.ctrl = libxenvchan_server_init(NULL, domid, vchan_path, 0, 0);
+        if (!state.ctrl) {
             perror("libxenvchan_server_init");
             exit(1);
         }
     } else {
         if (strcmp(socket_path, "-") == 0) {
-            input_fd = 0;
-            output_fd = 1;
+            state.input_fd = 0;
+            state.output_fd = 1;
         } else {
             socket_fd = listen_socket(socket_path);
             if (socket_fd == -1) {
@@ -453,21 +460,21 @@ int main(int argc, char **argv)
     for (;;) {
         if (is_server) {
             /* wait for vchan connection */
-            while (libxenvchan_is_open(ctrl) != 1)
-                libxenvchan_wait(ctrl);
+            while (libxenvchan_is_open(state.ctrl) != 1)
+                libxenvchan_wait(state.ctrl);
             /* vchan client connected, setup local FD if needed */
             if (strcmp(socket_path, "-") == 0) {
-                input_fd = 0;
-                output_fd = 1;
+                state.input_fd = 0;
+                state.output_fd = 1;
             } else {
-                input_fd = output_fd = connect_socket(socket_path);
+                state.input_fd = state.output_fd = connect_socket(socket_path);
             }
-            if (input_fd == -1) {
+            if (state.input_fd == -1) {
                 perror("connect socket");
                 ret = 1;
                 break;
             }
-            if (data_loop(ctrl, input_fd, output_fd) != 0)
+            if (data_loop(state.ctrl, state.input_fd, state.output_fd) != 0)
                 break;
             /* keep it running only when get UNIX socket path */
             if (socket_path[0] != '/')
@@ -475,28 +482,29 @@ int main(int argc, char **argv)
         } else {
             /* wait for local socket connection */
             if (strcmp(socket_path, "-") != 0)
-                input_fd = output_fd = accept(socket_fd, NULL, NULL);
-            if (input_fd == -1) {
+                state.input_fd = state.output_fd = accept(socket_fd,
+                                                          NULL, NULL);
+            if (state.input_fd == -1) {
                 perror("accept");
                 ret = 1;
                 break;
             }
-            set_nonblocking(input_fd, 1);
-            set_nonblocking(output_fd, 1);
-            ctrl = connect_vchan(domid, vchan_path);
-            if (!ctrl) {
+            set_nonblocking(state.input_fd, 1);
+            set_nonblocking(state.output_fd, 1);
+            state.ctrl = connect_vchan(domid, vchan_path);
+            if (!state.ctrl) {
                 perror("vchan client init");
                 ret = 1;
                 break;
             }
-            if (data_loop(ctrl, input_fd, output_fd) != 0)
+            if (data_loop(state.ctrl, state.input_fd, state.output_fd) != 0)
                 break;
             /* don't reconnect if output was stdout */
             if (strcmp(socket_path, "-") == 0)
                 break;
 
-            libxenvchan_close(ctrl);
-            ctrl = NULL;
+            libxenvchan_close(state.ctrl);
+            state.ctrl = NULL;
         }
     }
 
-- 
2.25.1


