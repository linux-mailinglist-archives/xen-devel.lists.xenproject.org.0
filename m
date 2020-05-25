Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C6A1E04E9
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:51:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3Ch-0004NC-B0; Mon, 25 May 2020 02:51:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jd3Cf-0004Mo-D8
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:51:01 +0000
X-Inumbo-ID: 8ec275b8-9e32-11ea-b9cf-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ec275b8-9e32-11ea-b9cf-bc764e2007e4;
 Mon, 25 May 2020 02:50:56 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id o19so12912009qtr.10
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 19:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3D6lM8zZXrDZrYYs+sM9xLtHGYSewtj+rrLJ+C4zgl4=;
 b=myWRm19nfnWsV4/CRIazx+Qpwm3OypAgqd6JXVhMlnbvpdVctR7ZkbvcDEmYTTZrB3
 rj3W0eFYZeBRWs3DVQafy+38/4VG4sKlqmoeiWnNV0dRPABzREMDEV9IW7+1LqV3BiN4
 dvDjxI/dJFSQTzODcueatJRivY0yeUwKyGBjIV203VWeC2pLm6WwtroxWsjD6MchYz0P
 Cg9iIFgb+mEsaBcPLo0uBBszY5dkcs7hQ9tCIiTXY5tBfg1p45cMDgQTwpd2JM10E9OK
 SKh/z3ytasVvUOrIPt8g0LRI20bouAewUd3NZHOk6tuMooCImAqGlfIm+7GafZdBbE8p
 vX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3D6lM8zZXrDZrYYs+sM9xLtHGYSewtj+rrLJ+C4zgl4=;
 b=q3dt/pPkQPm17sg6+gvwztfRSabZXq4v6er/UbiBvsHEl1Bsess5DiuDtLM75z3FnW
 5VFU5/kr1WZsyOHwX0i3vm21Qz9q1FRk82vXd9WIEVKwquVlfOfKVVlMdAywvS83QSHN
 xrtRmSIDnPJvye4+39GShYCK49kQa4PFdBhJJ6BOWtPbp58wz7xJr+z5j+1ZfNzWLuPd
 N25g9cuEN2XLEYgotzRMgK1v6/NtG/OK8r0ql2EZNjkONR/JorFJvLxS+dG7c2LXCtzy
 IAqJ3fUesa64a5bVCwNj4tohOP6X8MekVxnqi/8dki9n3bnqluVBYUGBMDySxghAln+I
 wjDQ==
X-Gm-Message-State: AOAM5300vT6UKmnp7of3e5/mTkt4E8lD2p6FLwWXJ+LXqiNSvPlicqBL
 T2PUnghwFgkD7xXIo9bzotAC0qLK
X-Google-Smtp-Source: ABdhPJx+rgbZ9bRQ3+GrhZW7rJFE2qtB40YncDhT2ua91BgbMD+5muIbaNWUuBv5zcCLqYFB120now==
X-Received: by 2002:ac8:65d1:: with SMTP id t17mr18084693qto.46.1590375056329; 
 Sun, 24 May 2020 19:50:56 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:344b:9349:9475:b6a2])
 by smtp.gmail.com with ESMTPSA id h134sm13539512qke.6.2020.05.24.19.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 19:50:55 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 3/8] vchan-socket-proxy: Unify main return value
Date: Sun, 24 May 2020 22:49:50 -0400
Message-Id: <20200525024955.225415-4-jandryuk@gmail.com>
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

Introduce 'ret' for main's return value and remove direct returns.  This
is in preparation for a unified exit path with resource cleanup.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index bd12632311..d85e24ee93 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -381,6 +381,7 @@ int main(int argc, char **argv)
     const char *vchan_path;
     const char *state_path = NULL;
     int opt;
+    int ret;
 
     while ((opt = getopt_long(argc, argv, "m:vs:", options, NULL)) != -1) {
         switch (opt) {
@@ -447,6 +448,8 @@ int main(int argc, char **argv)
         xs_close(xs);
     }
 
+    ret = 0;
+
     for (;;) {
         if (is_server) {
             /* wait for vchan connection */
@@ -461,7 +464,8 @@ int main(int argc, char **argv)
             }
             if (input_fd == -1) {
                 perror("connect socket");
-                return 1;
+                ret = 1;
+                break;
             }
             if (data_loop(ctrl, input_fd, output_fd) != 0)
                 break;
@@ -474,14 +478,16 @@ int main(int argc, char **argv)
                 input_fd = output_fd = accept(socket_fd, NULL, NULL);
             if (input_fd == -1) {
                 perror("accept");
-                return 1;
+                ret = 1;
+                break;
             }
             set_nonblocking(input_fd, 1);
             set_nonblocking(output_fd, 1);
             ctrl = connect_vchan(domid, vchan_path);
             if (!ctrl) {
                 perror("vchan client init");
-                return 1;
+                ret = 1;
+                break;
             }
             if (data_loop(ctrl, input_fd, output_fd) != 0)
                 break;
@@ -493,5 +499,6 @@ int main(int argc, char **argv)
             ctrl = NULL;
         }
     }
-    return 0;
+
+    return ret;
 }
-- 
2.25.1


