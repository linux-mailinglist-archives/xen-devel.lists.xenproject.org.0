Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3C81F608B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 05:31:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjDv6-0007yC-8W; Thu, 11 Jun 2020 03:30:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjDv4-0007xd-RF
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:30:22 +0000
X-Inumbo-ID: e18f3772-ab93-11ea-bca7-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e18f3772-ab93-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 03:30:22 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id e16so3632004qtg.0
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HolYNn/5i3ZSFaAEzaxuKG/DWch8bwIGH3CfAGoU3Ss=;
 b=VVgNS8ITlTpaK8/lkmhim3IFmgZNw7DKAngtT00fCiDnKhyi/PhQ9DLcn2HoOkYlqF
 /jUWIOX4w26jasKRH8z1urMQ62Y+h5G/tS+xXwDopCSQkqlZo3r62ZeSCKSW+70TUlRZ
 jn6wZvU8Ca7/MGytIpdvxlvPZv61D88F0Dl4veVoFJ2TlE1bBjRGym1E8DMjskwxmHXS
 i35LUFJMZ1Cia6HnoLB/Q2WI3i2TMlazb5Cy1fy/bE2+vCyJfQiYayRR2dwQbF8KNKaM
 YUQJt2l0VGouCXlxveFZ8+GsUM+a8RkhW0JKT8u2GAsG60M11s6Ox3Sp3WUixnrUWFDG
 y02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HolYNn/5i3ZSFaAEzaxuKG/DWch8bwIGH3CfAGoU3Ss=;
 b=ZBl35zuI+i0kF/ffzM+AdfsKf6vW0IazoQ6fyWHtMUTazDc3rbiCty8/g53hDyOMxd
 vEVXKYvjJZgclgyb4I+tp5gfU8c3tmiR3JFT2bogwD4i/2HcuN8DSXfSVYZt8mqsZQki
 cD3isk5kAL2NdzQu3L9l6MoqHFhCABo0MfI0FOAd27GWe87b+iOMef9Ma6YlfVTk8k6J
 KOwgLgrgBfFBHWSR7yx+G+5WIRDvkNXqXUgH65wgJpWRhHwckynA5d2HQPlmOPDWcxQj
 WCsdQc6t2x/NZCm/isoA28BSfIqwv56D07Npo+zocIOdZK0S7WnZky4TNYu5afCGZmXR
 pwqw==
X-Gm-Message-State: AOAM531utmIPX4vy0hwlQWnUYDsHzx6Rs/ddGq+AJw/naGtl9HTa1Xfl
 fORPx9mIPlEpjf04qfjhK3TygvP2
X-Google-Smtp-Source: ABdhPJzlKG0E5XXLkreHbFwls+ALN2FyZ0CJj4vDAVLPJ/jsigbpwvPqDo+0W20M3K/N2KbwUEREbw==
X-Received: by 2002:ac8:23e3:: with SMTP id r32mr6698656qtr.268.1591846221569; 
 Wed, 10 Jun 2020 20:30:21 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id v3sm1164078qkh.130.2020.06.10.20.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:30:20 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 01/10] vchan-socket-proxy: Ensure UNIX path NUL terminated
Date: Wed, 10 Jun 2020 23:29:27 -0400
Message-Id: <20200611032936.350657-2-jandryuk@gmail.com>
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
Cc: Olaf Hering <olaf@aepfle.de>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Check the socket path length to ensure sun_path is NUL terminated.

This was spotted by Citrix's Coverity.

Also use strcpy to avoid a warning "'__builtin_strncpy' specified bound
108 equals destination size [-Werror=stringop-truncation]" flagged by
gcc 10.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
CC: Olaf Hering <olaf@aepfle.de>

With Ubuntu's gcc-10, which is a pre-release "gcc-10 (Ubuntu
10-20200411-0ubuntu1) 10.0.1 20200411 (experimental)", I couldn't
actualy generate the strncpy warning.

 tools/libvchan/vchan-socket-proxy.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 13700c5d67..6ae1d84143 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -148,12 +148,18 @@ static int connect_socket(const char *path_or_fd) {
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
 
     addr.sun_family = AF_UNIX;
-    strncpy(addr.sun_path, path_or_fd, sizeof(addr.sun_path));
+    strcpy(addr.sun_path, path_or_fd);
     if (connect(fd, (const struct sockaddr *)&addr, sizeof(addr)) == -1) {
         close(fd);
         return -1;
@@ -174,13 +180,19 @@ static int listen_socket(const char *path_or_fd) {
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
         return -1;
 
     addr.sun_family = AF_UNIX;
-    strncpy(addr.sun_path, path_or_fd, sizeof(addr.sun_path));
+    strcpy(addr.sun_path, path_or_fd);
     if (bind(fd, (const struct sockaddr *)&addr, sizeof(addr)) == -1) {
         close(fd);
         return -1;
-- 
2.25.1


