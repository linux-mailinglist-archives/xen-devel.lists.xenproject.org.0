Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D5B1E04EA
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 04:51:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd3Cc-0004M2-3K; Mon, 25 May 2020 02:50:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb8S=7H=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jd3Ca-0004Lo-Dm
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 02:50:56 +0000
X-Inumbo-ID: 8d478886-9e32-11ea-b9cf-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d478886-9e32-11ea-b9cf-bc764e2007e4;
 Mon, 25 May 2020 02:50:54 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id p4so7501250qvr.10
 for <xen-devel@lists.xenproject.org>; Sun, 24 May 2020 19:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T0BiCkhzclg2VvasscglUktTq98DwBMZs8CpLP6l+Lg=;
 b=A5uYZZ2wzL/XRZaWDvdvR+WIEUjNsUaDYhREgp5q/oggWg9b4VK9We2mfzinR3lXXT
 EgSB3jM6fAwWsrfr8vuAHnBvoHG5vIMjjiV3Qi9mKi6d/Si+PzsbnzMbgehVJfr8VP8X
 f+wHjkozqeBFVGi60RXJimffcBsM9e5BBslRc6wWvr58aPIzf2LwV5NxlvO642947tLG
 Un2+3BLVDfOgPBwDHJOyaVB1edpmnV6YC0DKRFuI6TPSHJZTEtHjsSK95g1Zz9/snez7
 DRQHsvXgD5iLVgnUF8d5kHMpteE+NJnqqkC7HoaHv3iZQl8k4Hp43+/iR+dlpWnRtrvF
 hxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T0BiCkhzclg2VvasscglUktTq98DwBMZs8CpLP6l+Lg=;
 b=qXt/iXpeiOb3R5aZbOlr8gWxLsLTQBDrY7CU6BiEYMaLBoS6pKyBI9gHe+r3dTryl+
 wlQ5jMpn2d8Jw3BNQgWtlvSdNDoIUx+vCNfi1I6jfOxY/vbU14gAlYqv9xwvc+bV5p1x
 65r3ipfZbgxdopVrlcpKQIPf06RC4iUtTlp7Jzc3L8C7Qe2AMgciNqO3xVUdMEddDzqh
 g0eY88OPYSVF551yUQx+Xx5+3sT8vZAAITO4QAwB5TANFmegy3SbhbPCyMNnN+TW0WHk
 IvK+uScg1Y33pw5GJYFHcjjupGcWb884Nas3XVnX2/PgF5/x45hSE++tEGkhpquSWa5H
 gAIQ==
X-Gm-Message-State: AOAM533V99aojHwSHjQ8Jgg6ldtZbta2pxAaPLS7qHWfsqrRt4PxGhid
 6GtgyO6rdPbBjnGl1L7Wcb/JauAs
X-Google-Smtp-Source: ABdhPJxUoxNI9bSF8blnHfGiLAFojgcXDTSl8/QBkDtJj1CY8bzGzXHV9M3Dgcidm14+QfZ0s4GmTQ==
X-Received: by 2002:a0c:fb4b:: with SMTP id b11mr13428732qvq.96.1590375053889; 
 Sun, 24 May 2020 19:50:53 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:344b:9349:9475:b6a2])
 by smtp.gmail.com with ESMTPSA id h134sm13539512qke.6.2020.05.24.19.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 19:50:53 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 2/8] vchan-socket-proxy: Check xs_watch return value
Date: Sun, 24 May 2020 22:49:49 -0400
Message-Id: <20200525024955.225415-3-jandryuk@gmail.com>
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

Check the return value of xs_watch and error out on failure.

This was found by Citrix's Coverity.

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libvchan/vchan-socket-proxy.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/libvchan/vchan-socket-proxy.c b/tools/libvchan/vchan-socket-proxy.c
index 6d860af340..bd12632311 100644
--- a/tools/libvchan/vchan-socket-proxy.c
+++ b/tools/libvchan/vchan-socket-proxy.c
@@ -225,8 +225,15 @@ static struct libxenvchan *connect_vchan(int domid, const char *path) {
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


