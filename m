Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C588B1F6086
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 05:31:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjDvL-00081y-2L; Thu, 11 Jun 2020 03:30:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MzHD=7Y=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jjDvJ-0007xd-Rk
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 03:30:37 +0000
X-Inumbo-ID: e561a434-ab93-11ea-bca7-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e561a434-ab93-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 03:30:28 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id y1so3581221qtv.12
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2020 20:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=laRg1K8C6uMRUlZmD1dge7J/mbvALpacyvB5fuXQU54=;
 b=a7/hb9vsaW1Ysq7scxsVtU9RpygQmV9LYFn3t6AYoy45E8nA12+ux2ri78VaijfjiN
 G/Xu+wdZACU2soQYveVkUYkGsaoekaFhZehPn1ZV0zRnIqPeRvOLlchcns07ABG+NVmI
 NCqY/Yr2cYTUFccsQfhiIfuetj3sGLZ238U6qn/EmvWCw1c7uU7a6Eq8cn5d5WwZVq1X
 5wRRyfEJbsS+qnP17JfPU4OkP/hmvMZ/IRtFXzcNTF2/OK0Ho+p9T43QxYETOAKCR12S
 eGbud4eknYVdJ2nk9DEH6X3LZfSkiJ0Dni1kjRrzk3jycwPRlVhxjjWtGNgICp7WGhJF
 K51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=laRg1K8C6uMRUlZmD1dge7J/mbvALpacyvB5fuXQU54=;
 b=kG51DbajZyGt/tPLz7tGkwXdsuw+BVQ3+YtPiJk24aw4xjvejYiLu/ZlxauePJHvsY
 DOrGfY27IUl23EZoW0545rcPqamnz94mH4gUsafn9tKXDf+sjrbIzcHqliuE7E/G6fYd
 mFtMM54MWAo1z8GxqeotjHBIzs4ygn8iTxkaruloDsSwdCp/01tmmYSbsfV8NOS/sHDi
 aqHKskFQGjkiHoy6/YDLOFd3TYOFXuVq8r5sMw93B6MpXEjWUyzTx1+kUe2tSjgejUEw
 noYD93qEWos8tjANsL1DgVZ3Y66c9WqXZT9ueodVUxSdli80GqhR4WuEZLI05cu1dcZ0
 Ewfg==
X-Gm-Message-State: AOAM533PwucgxmwJLW9nh890GRUzQ4Aw767zf5FSMnKTFKZvopnQIucD
 tiARKG7muCW3Zc0075DvG3klAoXb
X-Google-Smtp-Source: ABdhPJx1Kszbf/65QiiO87mphpbrCYAKOz1s5J+KcxRZftbQxetEHhaR2JYIUroKxCwaaZF2CojUFQ==
X-Received: by 2002:ac8:3529:: with SMTP id y38mr6314203qtb.315.1591846228003; 
 Wed, 10 Jun 2020 20:30:28 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:dd4d:2b5c:f471:f332])
 by smtp.gmail.com with ESMTPSA id v3sm1164078qkh.130.2020.06.10.20.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:30:27 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 04/10] vchan-socket-proxy: Check xs_watch return value
Date: Wed, 10 Jun 2020 23:29:30 -0400
Message-Id: <20200611032936.350657-5-jandryuk@gmail.com>
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

Check the return value of xs_watch and error out on failure.

This was found by Citrix's Coverity.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index c6a83e4712..196f6016b9 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -232,8 +232,15 @@ static struct libxenvchan *connect_vchan(int domid, const char *path) {
         goto out;
     }
     /* wait for vchan server to create *path* */
-    xs_watch(xs, path, "path");
-    xs_watch(xs, "@releaseDomain", "release");
+    if (!xs_watch(xs, path, "path")) {
+        fprintf(stderr, "xs_watch(%s) failed.\n", path);
+        goto out;
+    }
+    if (!xs_watch(xs, "@releaseDomain", "release")) {
+        fprintf(stderr, "xs_watch(@releaseDomain failed.\n");
+        goto out;
+    }
+
     while ((watch_ret = xs_read_watch(xs, &watch_num))) {
         /* don't care about exact which fired the watch */
         free(watch_ret);
-- 
2.25.1


