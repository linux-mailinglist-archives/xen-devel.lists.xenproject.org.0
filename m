Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351BC1E04EC
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:51:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3Cw-0004UQ-CV; Mon, 25 May 2020 02:51:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jd3Cu-0004TA-E9
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:51:16 +0000
X-Inumbo-ID: 919bb92a-9e32-11ea-ae69-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 919bb92a-9e32-11ea-ae69-bc764e2007e4;
 Mon, 25 May 2020 02:51:01 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id dh1so7485372qvb.13
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 19:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c+GBcLzdTfVlujqDgxVJJIXEMu0nDYhq6Ss2jg+Z8wQ=;
 b=oC0Y6l2LjLu/Y0zlJEc2vdTDFQkI7DecoziRTK9np3LNgQrgm0tm0uju7/F7CcyB7z
 70mb+ThUac1YUdZ2oOpOpc75eye9eO9erLaAwY2b3FEiqFIhERCW7h8FOK268/jl8ON2
 8M6TyCD2r44k3StyFFcNDIWLp/aSZsARlM4gF1HOKhQQaj3OT8CTnQK4GRqoVbyH8+Pj
 NTzRorLfvgL1Wrq0sn3h5KxeMlgKti7qJnXzsU4urdQiKCRz6Gtgw3nhgxGYn8n9/mou
 JJjmQETY1UrLpEOpWf4+iuegaT4OAvSy2YkTD1w11fLniGeZnMmq7ilZAa1Ym8K5xIrT
 7drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c+GBcLzdTfVlujqDgxVJJIXEMu0nDYhq6Ss2jg+Z8wQ=;
 b=PKnA99fc8izHIhesYHei0vq8dgo/u29VdnO7gE1k3GK4EDiDXe+HAoz6OmgwGRJ5eE
 J8/9vI9WAFCY+pXobdUBNQEfNPm8O8DOWCmdPti5U0j+2jhjOrzMUhhRYXpCrpnokTh9
 qep0P32xXAIQk4Y+2AX27oEAqR9LqYyUzdXZMaCpN4dHR3+uBEMM1KKUqOpEIg9N5u9b
 PhetEomxyoD5Pw7FGAZy/2Urc4vOP2hgmZuoRs87VEeOEwjjGE++IMyK5YtTYTXz7NmZ
 CXgmFgaOU333xo2MBl7DMtMJqwgKkFaRoo3AqFDtialbVg4w4ZTHYbN3amPQGiDCdnlm
 QXvw==
X-Gm-Message-State: AOAM533noFIgm6V/VJ46rfCWIKXSlzPIlhenJQMdif5e9h//k1Xvdcek
 lHgwC5cu1c1Ba1KqJHa5z0X63js8
X-Google-Smtp-Source: ABdhPJySewG2QNC01azxs4/d/Rg6cedR6xmr/aJH5EFOXstoH8Bi1+nJsZncrKYTGqifOvtadjfq9Q==
X-Received: by 2002:a0c:ee25:: with SMTP id l5mr13346075qvs.5.1590375060651;
 Sun, 24 May 2020 19:51:00 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:344b:9349:9475:b6a2])
 by smtp.gmail.com with ESMTPSA id h134sm13539512qke.6.2020.05.24.19.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 19:51:00 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 5/8] vchan-socket-proxy: Switch data_loop() to take state
Date: Sun, 24 May 2020 22:49:52 -0400
Message-Id: <20200525024955.225415-6-jandryuk@gmail.com>
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

Switch data_loop to take a pointer to vchan_proxy_state.

No functional change.

This removes a dead store to input_fd identified by Coverity.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 65 +++++++++++++++--------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 39f4bb1452..32be410609 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -279,13 +279,13 @@ static void discard_buffers(struct libxenvchan *ctrl) {
     }
 }
 
-int data_loop(struct libxenvchan *ctrl, int input_fd, int output_fd)
+int data_loop(struct vchan_proxy_state *state)
 {
     int ret;
     int libxenvchan_fd;
     int max_fd;
 
-    libxenvchan_fd = libxenvchan_fd_for_select(ctrl);
+    libxenvchan_fd = libxenvchan_fd_for_select(state->ctrl);
     for (;;) {
         fd_set rfds;
         fd_set wfds;
@@ -293,15 +293,15 @@ int data_loop(struct libxenvchan *ctrl, int input_fd, int output_fd)
         FD_ZERO(&wfds);
 
         max_fd = -1;
-        if (input_fd != -1 && insiz != BUFSIZE) {
-            FD_SET(input_fd, &rfds);
-            if (input_fd > max_fd)
-                max_fd = input_fd;
+        if (state->input_fd != -1 && insiz != BUFSIZE) {
+            FD_SET(state->input_fd, &rfds);
+            if (state->input_fd > max_fd)
+                max_fd = state->input_fd;
         }
-        if (output_fd != -1 && outsiz) {
-            FD_SET(output_fd, &wfds);
-            if (output_fd > max_fd)
-                max_fd = output_fd;
+        if (state->output_fd != -1 && outsiz) {
+            FD_SET(state->output_fd, &wfds);
+            if (state->output_fd > max_fd)
+                max_fd = state->output_fd;
         }
         FD_SET(libxenvchan_fd, &rfds);
         if (libxenvchan_fd > max_fd)
@@ -312,52 +312,53 @@ int data_loop(struct libxenvchan *ctrl, int input_fd, int output_fd)
             exit(1);
         }
         if (FD_ISSET(libxenvchan_fd, &rfds)) {
-            libxenvchan_wait(ctrl);
-            if (!libxenvchan_is_open(ctrl)) {
+            libxenvchan_wait(state->ctrl);
+            if (!libxenvchan_is_open(state->ctrl)) {
                 if (verbose)
                     fprintf(stderr, "vchan client disconnected\n");
                 while (outsiz)
-                    socket_wr(output_fd);
-                close(output_fd);
-                close(input_fd);
-                discard_buffers(ctrl);
+                    socket_wr(state->output_fd);
+                close(state->output_fd);
+                close(state->input_fd);
+                discard_buffers(state->ctrl);
                 break;
             }
-            vchan_wr(ctrl);
+            vchan_wr(state->ctrl);
         }
 
-        if (FD_ISSET(input_fd, &rfds)) {
-            ret = read(input_fd, inbuf + insiz, BUFSIZE - insiz);
+        if (FD_ISSET(state->input_fd, &rfds)) {
+            ret = read(state->input_fd, inbuf + insiz, BUFSIZE - insiz);
             if (ret < 0 && errno != EAGAIN)
                 exit(1);
             if (verbose)
                 fprintf(stderr, "from-unix: %.*s\n", ret, inbuf + insiz);
             if (ret == 0) {
                 /* EOF on socket, write everything in the buffer and close the
-                 * input_fd socket */
+                 * state->input_fd socket */
                 while (insiz) {
-                    vchan_wr(ctrl);
-                    libxenvchan_wait(ctrl);
+                    vchan_wr(state->ctrl);
+                    libxenvchan_wait(state->ctrl);
                 }
-                close(input_fd);
-                input_fd = -1;
+                close(state->input_fd);
+                state->input_fd = -1;
                 /* TODO: maybe signal the vchan client somehow? */
                 break;
             }
             if (ret)
                 insiz += ret;
-            vchan_wr(ctrl);
+            vchan_wr(state->ctrl);
         }
-        if (FD_ISSET(output_fd, &wfds))
-            socket_wr(output_fd);
-        while (libxenvchan_data_ready(ctrl) && outsiz < BUFSIZE) {
-            ret = libxenvchan_read(ctrl, outbuf + outsiz, BUFSIZE - outsiz);
+        if (FD_ISSET(state->output_fd, &wfds))
+            socket_wr(state->output_fd);
+        while (libxenvchan_data_ready(state->ctrl) && outsiz < BUFSIZE) {
+            ret = libxenvchan_read(state->ctrl, outbuf + outsiz,
+                                   BUFSIZE - outsiz);
             if (ret < 0)
                 exit(1);
             if (verbose)
                 fprintf(stderr, "from-vchan: %.*s\n", ret, outbuf + outsiz);
             outsiz += ret;
-            socket_wr(output_fd);
+            socket_wr(state->output_fd);
         }
     }
     return 0;
@@ -474,7 +475,7 @@ int main(int argc, char **argv)
                 ret = 1;
                 break;
             }
-            if (data_loop(state.ctrl, state.input_fd, state.output_fd) != 0)
+            if (data_loop(&state) != 0)
                 break;
             /* keep it running only when get UNIX socket path */
             if (socket_path[0] != '/')
@@ -497,7 +498,7 @@ int main(int argc, char **argv)
                 ret = 1;
                 break;
             }
-            if (data_loop(state.ctrl, state.input_fd, state.output_fd) != 0)
+            if (data_loop(&state) != 0)
                 break;
             /* don't reconnect if output was stdout */
             if (strcmp(socket_path, "-") == 0)
-- 
2.25.1


