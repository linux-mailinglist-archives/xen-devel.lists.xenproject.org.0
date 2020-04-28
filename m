Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6A91BB4FC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:07:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHWb-0001Yz-AL; Tue, 28 Apr 2020 04:07:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHWZ-0001XE-4f
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:07:11 +0000
X-Inumbo-ID: a27849d0-8905-11ea-b07b-bc764e2007e4
Received: from mail-qv1-xf41.google.com (unknown [2607:f8b0:4864:20::f41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a27849d0-8905-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 04:06:28 +0000 (UTC)
Received: by mail-qv1-xf41.google.com with SMTP id ck5so2986161qvb.11
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=62xznBzAJrZ5cBLJ6CH8pd+32QEr+JtnkMAlzxn5W2w=;
 b=bXTbQKnEynKDrvf8b9s3N/Gt9pB8jg+WpOAo3c8oczvyv/ZvMx+Vz3Bn27Up4YWLhM
 pmI5N8dyG6Pn80b8u4Rs/p5RxJUa0F7ar1LyF35vSW78hZaMa2OuEACpw/PLuYyov53k
 MmNcd5WjTDs2x3P5BjU1YDc+ONa/e89QUC/sd1cj2y3b+EOmQVuViqLcE8Y194DIlQ8R
 /ZVPOE+ylmS4+QEEEKxVwZ2ZYS2AtEKLUAwdH0hMbt5W8dWS0nhwUXM+df/lQEjZZnsI
 I+gZPwCllD/WUwUX61N31ah7t1g+yc8XKuGuR/ZtdwSqjjOXTiYIIJmOClGJX1VgAWsA
 yWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=62xznBzAJrZ5cBLJ6CH8pd+32QEr+JtnkMAlzxn5W2w=;
 b=YTd2Xviyk3xILYpKkufTSXSgFFLeMhbMiXOzYNZlrO130JRyznnAzlRT2dzVAV5yHe
 Ok7N5PFKlMlc3QF4o8zW22dCKYvgAPveMzmXY1Eh1ecuxv3Y8Hcn90Woi6rGVssu5NuO
 9kkpe9hgeDSCh9r50QQJcCVYYu4wLxzGsJu57BDDmFGIFd1/fWtZEmw2tWnkarx76SoO
 69sh3V6S+qz/1jhoNBa4XeKU0s3vclyniVai3tjsAKdKo9mVtf7w5l0edFUAK5oLLyhl
 0mU6R6fkzHQXXVv+sihMfBLAoTLtV+MVUe/MWBXA+XxELnJuAYgio0k7GBmHXYjTIuI1
 x2mw==
X-Gm-Message-State: AGi0PuZ3C7t97Yw8ixIxgMddEmYK5DWpbNfvidkVuUjpjOnsYAf0qXxy
 uFWegAJxV+2HNL3wmHChNgpmvmcm
X-Google-Smtp-Source: APiQypJJz9jy7S7Ew3uCA+nDzpyziyVQvXa9uf0vY7aQB+TGNx4mkQ5nvc2OxG8y5z5GaMBVpJH3xQ==
X-Received: by 2002:a05:6214:188a:: with SMTP id
 cx10mr26208160qvb.119.1588046787600; 
 Mon, 27 Apr 2020 21:06:27 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:06:26 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 21/21] tools: Clean up vchan-socket-proxy socket
Date: Tue, 28 Apr 2020 00:04:33 -0400
Message-Id: <20200428040433.23504-22-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
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
Cc: Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

To avoid socket files lingering in /run/xen, have vchan-socket-proxy
clean up the sockets it creates.  Use a signal handler as well as atexit
to handle both means of termination.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 13700c5d67..0fb42964b5 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -33,6 +33,7 @@
 
 #include <stdlib.h>
 #include <stdio.h>
+#include <signal.h>
 #include <string.h>
 #include <unistd.h>
 #include <fcntl.h>
@@ -88,6 +89,22 @@ char outbuf[BUFSIZE];
 int insiz = 0;
 int outsiz = 0;
 int verbose = 0;
+char *cleanup_socket;
+
+static void cleanup(void)
+{
+    if (cleanup_socket) {
+        unlink(cleanup_socket);
+        free(cleanup_socket);
+        cleanup_socket = NULL;
+    }
+}
+
+static void cleanup_exit(int signum)
+{
+    cleanup();
+    exit(0);
+}
 
 static void vchan_wr(struct libxenvchan *ctrl) {
     int ret;
@@ -394,6 +411,9 @@ int main(int argc, char **argv)
     vchan_path = argv[optind+1];
     socket_path = argv[optind+2];
 
+    signal(SIGHUP, cleanup_exit);
+    signal(SIGTERM, cleanup_exit);
+
     if (is_server) {
         ctrl = libxenvchan_server_init(NULL, domid, vchan_path, 0, 0);
         if (!ctrl) {
@@ -410,6 +430,8 @@ int main(int argc, char **argv)
                 perror("listen socket");
                 return 1;
             }
+            cleanup_socket = strdup(socket_path);
+            atexit(cleanup);
         }
     }
 
-- 
2.20.1


