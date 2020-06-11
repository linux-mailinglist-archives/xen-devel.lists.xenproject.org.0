Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C44201F6085
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 05:31:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjDva-0008A2-4N; Thu, 11 Jun 2020 03:30:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjDvY-0007xd-SQ
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:30:52 +0000
X-Inumbo-ID: e8951ee2-ab93-11ea-bca7-bc764e2007e4
Received: from mail-qk1-x744.google.com (unknown [2607:f8b0:4864:20::744])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8951ee2-ab93-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 03:30:33 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id q8so4321085qkm.12
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=acDEo8MXiNoRRWQ/LKc41cpCF79OTRwWmw6nG02XKJE=;
 b=sRbm1ow6OMy4RlPfEgTljW9izUWN0W3hAaRtX7YSpSJRbcPKUyJM977UrI/CqjreUt
 JRFwICjEeLa3I4zG7Y/PH9PcqVpW7tW6/Os4BzeHGJkZZiSV2seuia9LAo7FQ1m6oqPa
 vvIsj8YShjmxi/nWzcdRAhCKOMJjpXlhKmjcfYNsRMclOHXFtRulwfJgNDZnk813xPg5
 Zp/no8di6X9tDIZwJiNN2SlooqJgkZa3jRrpn0cuX1yzIx7n05+8F16TEUG5Xc415Q6E
 cFKmY6WAp45aSIpL1/i6XFGF14Kp79ZrUFVuttwaLJ8svEs/YS3AcnEcTOGHfzVvB0Ra
 czNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=acDEo8MXiNoRRWQ/LKc41cpCF79OTRwWmw6nG02XKJE=;
 b=cv17oiOiJZzA1YMmQwbDkmZz5/KTkSUeY10QZ3Eju9ah9mFnWiFyOtXXEL2O6B8EcT
 mt+5kHEiY2oyXCoqrVdmQESBWSI+t4cgTJnoTf4Gxhz473P4qvXwyysRvkMsUKpTUUBw
 PmDZKKoCqDHskDrjOJ9vzFfYYtH9w+oAlOTnfNY3L3p7GdXv6FJwIFbYUyH6PfGDjS43
 BRx7/tT0bj6ZJcKYS49Cjde/IRdizvtdYtKvbgA+3cLLDzlMPNLX6BexDnpk5KEmVDll
 vdZqBdUixL9/ZRhV2VvKdr6Jr2jv1T/59CKyHvX9NqXjHYSxh95vf8t6LaDkqkKXx+kj
 Wj7A==
X-Gm-Message-State: AOAM532LJQ6buj7YIc6AlaPAohSCGbQKe8evCTD40s0ZJYuJG15qMLoi
 LGthS+zhjBfSOLSlJSX0UNM82ba8
X-Google-Smtp-Source: ABdhPJxCYNtb5p4oYxf9KdVt/5taYFzlGn+/XLgqcMPRp/Tup+mWZ10k/7oJPMPupNmwbz2Vz0r50A==
X-Received: by 2002:a37:a416:: with SMTP id n22mr6190740qke.49.1591846233327; 
 Wed, 10 Jun 2020 20:30:33 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id v3sm1164078qkh.130.2020.06.10.20.30.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:30:32 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 07/10] vchan-socket-proxy: Switch data_loop() to take state
Date: Wed, 10 Jun 2020 23:29:33 -0400
Message-Id: <20200611032936.350657-8-jandryuk@gmail.com>
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

Switch data_loop to take a pointer to vchan_proxy_state.

No functional change.

This removes a dead store to input_fd identified by Coverity.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 65 +++++++++++++++--------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index a932c94c97..29a12260ed 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -286,13 +286,13 @@ static void discard_buffers(struct libxenvchan *ctrl) {
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
@@ -300,15 +300,15 @@ int data_loop(struct libxenvchan *ctrl, int input_fd, int output_fd)
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
@@ -319,52 +319,53 @@ int data_loop(struct libxenvchan *ctrl, int input_fd, int output_fd)
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
@@ -481,7 +482,7 @@ int main(int argc, char **argv)
                 ret = 1;
                 break;
             }
-            if (data_loop(state.ctrl, state.input_fd, state.output_fd) != 0)
+            if (data_loop(&state) != 0)
                 break;
             /* keep it running only when get UNIX socket path */
             if (socket_path[0] != '/')
@@ -504,7 +505,7 @@ int main(int argc, char **argv)
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


