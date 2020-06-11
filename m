Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F2F1F6088
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 05:31:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjDvU-00086a-MP; Thu, 11 Jun 2020 03:30:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjDvT-0007xd-S4
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:30:47 +0000
X-Inumbo-ID: e7aaa2cc-ab93-11ea-bb8b-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7aaa2cc-ab93-11ea-bb8b-bc764e2007e4;
 Thu, 11 Jun 2020 03:30:32 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id c185so4357305qke.7
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0QHpnXfDLIU42Ajcn7oe5u4g/H2EWJ6mBd+W546xwxc=;
 b=NYja3UulW133MDWz7THaPy5RuR9uRLPFZCcavpEeBICBdVNluA3ZqxpDPSIliOyRd5
 DNKunBo1ICSU7dvWYlQIK8GVeYywImCazfZOIIsPyUiJajpMj8+6SmV7UHHwnmHARr8j
 l0rmbWl/rz7QfzSo+l+MSkQQxIH7r6CtEq/ximG7YGnGkLtARyqdx30cnhYK8UtyZTgR
 /EwEFHWc4Wt4uAF9+VYOCiY/Gmu166QHSuwqeo9WSNDdjmsOs5cRcShgU8wFmYeVnHOA
 4OTs9lZ+GnbDX9b9Dis6xbIvvH43vBJb6Z0G8sjGSTmjap5ulZhq1nyu8uwWsu5Uofhg
 DOfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0QHpnXfDLIU42Ajcn7oe5u4g/H2EWJ6mBd+W546xwxc=;
 b=miuW/iMVzxqVEYsS2dSLiKoW5nRL8qg1FKaUFtI3ZK7+kZZGxFnHi+/hjLb9jTaJpx
 jFlhAdJn0PEMpiCWkDi21Rol6sKe8fQerXadTKSPnAFWLCK1u1yEhqalIgjTBwC6LMQS
 pl6hu+TVZYjQRr5K+5/z9XyMnWBB4Tyyz7OWOPeG4k1vGjrwo+UbrwPrDy54a9bp/wHa
 toVhRd+yUCFMzqeVdqeupwdr9RaoBaxA75S3Jvspl2scyJ7SN5nc1QJIxxB9ecEZ9Qe0
 QYDxRz7YQuJ3qHOJz0C9xlZ10jHjtfEwVOODqCVRnfDS2idAVwEdcLNBTYeOY07krYq2
 pG9g==
X-Gm-Message-State: AOAM533HucrZdPVvupr+mECX5vxEoPonpNC3PsCSnKMT+xfEgUDT7gvO
 sR03iPIidoQoHA8FhLlscVRm7EGV
X-Google-Smtp-Source: ABdhPJwdhVkHS2DNi9/Nuua9kYv3yXSI9U6EZrJZD0L9oLp14VJMoLqPgvUyonhT8Gg2MqBfLOmlcA==
X-Received: by 2002:a37:a64c:: with SMTP id p73mr6240900qke.273.1591846231748; 
 Wed, 10 Jun 2020 20:30:31 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id v3sm1164078qkh.130.2020.06.10.20.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:30:31 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 06/10] vchan-socket-proxy: Use a struct to store state
Date: Wed, 10 Jun 2020 23:29:32 -0400
Message-Id: <20200611032936.350657-7-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200611032936.350657-1-jandryuk@gmail.com>
References: <20200611032936.350657-1-jandryuk@gmail.com>
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Use a struct to group the vchan ctrl and FDs.  This will facilite
tracking the state of open and closed FDs and ctrl in data_loop().

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 52 +++++++++++++++++------------
 1 file changed, 30 insertions(+), 22 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 36a2fe2cb8..a932c94c97 100644
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
 
@@ -381,8 +387,9 @@ int main(int argc, char **argv)
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
@@ -422,15 +429,15 @@ int main(int argc, char **argv)
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
@@ -460,21 +467,21 @@ int main(int argc, char **argv)
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
                 fprintf(stderr, "connect_socket failed\n");
                 ret = 1;
                 break;
             }
-            if (data_loop(ctrl, input_fd, output_fd) != 0)
+            if (data_loop(state.ctrl, state.input_fd, state.output_fd) != 0)
                 break;
             /* keep it running only when get UNIX socket path */
             if (socket_path[0] != '/')
@@ -482,28 +489,29 @@ int main(int argc, char **argv)
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


