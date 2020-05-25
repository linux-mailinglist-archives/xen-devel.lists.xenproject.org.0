Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4441E04E6
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:51:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3CX-0004La-Qs; Mon, 25 May 2020 02:50:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jd3CW-0004LS-Cv
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:50:52 +0000
X-Inumbo-ID: 8bc771ba-9e32-11ea-b9cf-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bc771ba-9e32-11ea-b9cf-bc764e2007e4;
 Mon, 25 May 2020 02:50:51 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id l1so12932530qtp.6
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 19:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TuFE1UFStx7DhYra1LcAmMWFmhp1FfRuQDwhQTRAYLQ=;
 b=a5R6y24hmZf7dseYfL279Z6P8Y/N4v32REhzXWvuI6RgseeMyz30DzODrA7F59/VeF
 VVMqWBMdPM43TC/sErMk6cyiuc1FBjV3KVGIpsHiaE463qPFvnucfc980Fw/WStrE4GR
 KrVpzAQNrqnCiRpbiUPW9pRY9XFfVINzYBEzWYc/se878fXjCqWn1oKwUQJ2YSyQfPjz
 +ZbawcHb84gd55HRTaBj1auKqYLRYCHR6jWm12LnjRCmDScGxiY3Ok08TxB4I2bffNwL
 oLZT96v4GZz+VoM1Cxiuy8MhumTmN6AQcU7wS89p+5fn8YnrcG4z7whjDkSl+AntixmM
 /jOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TuFE1UFStx7DhYra1LcAmMWFmhp1FfRuQDwhQTRAYLQ=;
 b=uh41joMsT7lXRpfraetULzxWvqhyJSlCysB58MZdTsZNPXca4lNAfPTCO2mdZEc1we
 J+MX3kSj2JZiW8kvXY/w+8/HUnZXMVHalgFEN9N6kt4uKCLw+YKYiMXGqlKS95WPe8ld
 tNURRKM2QsafeWVHBXpiujtQW1YFjyi5sR+Yg5Y/LD0EaofQirE2C+kmkgz9vLti4nTb
 yjt2rx9DybWA9aQeTJnmotJ+1NgyZJfhXXPfYhrexg5ALxCevkFCtCSg20WmjpvWwgB7
 gRy9dbPxD+1snysbwdqnG/Yr1L4sVpmEN4XmPX9aUpsGeUdIoeB5TJ7glPUPNZAw3faV
 VLtg==
X-Gm-Message-State: AOAM531iT4+S2d0p+QaXj08oaIaDHVmOGxgiUXxcrVwrtaXVAi5sgYm7
 1c3ohMwP0Tpx2mq+OA7hfq+49Yc7
X-Google-Smtp-Source: ABdhPJx6/03cefrmuDCSXXmpl/Oe1/sw6rOyEM8gKdoi/casVrLcDhpzCbgzgqTwZikXJCpRGw5g0A==
X-Received: by 2002:ac8:543:: with SMTP id c3mr25433015qth.8.1590375051323;
 Sun, 24 May 2020 19:50:51 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:344b:9349:9475:b6a2])
 by smtp.gmail.com with ESMTPSA id h134sm13539512qke.6.2020.05.24.19.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 19:50:50 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 1/8] vchan-socket-proxy: Ensure UNIX path NUL terminated
Date: Sun, 24 May 2020 22:49:48 -0400
Message-Id: <20200525024955.225415-2-jandryuk@gmail.com>
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

Check the socket path length to ensure sun_path is NUL terminated.

This was spotted by Citrix's Coverity.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 13700c5d67..6d860af340 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -148,6 +148,12 @@ static int connect_socket(const char *path_or_fd) {
         return fd;
     }
 
+    if (strlen(path_or_fd) >= sizeof(addr.sun_path)) {
+        fprintf(stderr, "UNIX socket path \"%s\" too long (%zd >= %zd)\n",
+                path_or_fd, strlen(path_or_fd), sizeof(addr.sun_path));
+        return -1;
+    }
+
     fd = socket(AF_UNIX, SOCK_STREAM, 0);
     if (fd == -1)
         return -1;
@@ -174,6 +180,12 @@ static int listen_socket(const char *path_or_fd) {
         return fd;
     }
 
+    if (strlen(path_or_fd) >= sizeof(addr.sun_path)) {
+        fprintf(stderr, "UNIX socket path \"%s\" too long (%zd >= %zd)\n",
+                path_or_fd, strlen(path_or_fd), sizeof(addr.sun_path));
+        return -1;
+    }
+
     /* if not a number, assume a socket path */
     fd = socket(AF_UNIX, SOCK_STREAM, 0);
     if (fd == -1)
-- 
2.25.1


