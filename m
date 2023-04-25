Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2136EE87F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 21:47:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526311.818003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prOcx-0002qV-Ao; Tue, 25 Apr 2023 19:47:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526311.818003; Tue, 25 Apr 2023 19:47:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prOcx-0002nt-75; Tue, 25 Apr 2023 19:47:03 +0000
Received: by outflank-mailman (input) for mailman id 526311;
 Tue, 25 Apr 2023 19:47:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v3bG=AQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1prOcw-0002TT-20
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 19:47:02 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2272a83-e3a1-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 21:47:01 +0200 (CEST)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-74e3de79bf2so451277685a.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Apr 2023 12:47:01 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 rv12-20020a05620a688c00b0074c438db55asm1492592qkn.74.2023.04.25.12.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 12:46:59 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: f2272a83-e3a1-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682452020; x=1685044020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25FZJHn3Q7EdEZTYmZxGRc3TdOIkqVjFElqtDI72BJ4=;
        b=i6CevYhNStE7bMNIT+4bmXCqXMPT07SuQuicjBVJfW/5T+457eq0HHcKMtK0pT85f7
         pCIMu1nzUshXvOMRBXtwC4cw7VjkQuUuVd+Py3Mvf3sAwKyppEzbaJrZW2r4o+wJX0xW
         6Eui4sgQwkFsAZ/YyPb3+bcQ18wDKXsbN995pZigahHx40i6ZcnThwNeko+pkRFi+q9F
         /OYUkdwHmfT00najpjRfW+Xf3JAMUHokdnG53zJxRWr/Y8cRmYFM7J04v4xoTfkt9HcH
         jxCKOZb53cOIUA22Ub6TaPYZ7KtsJ3qiS15+vjN0hQBPx3rrXzny/OXJyRwH8haI57dV
         jywg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682452020; x=1685044020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25FZJHn3Q7EdEZTYmZxGRc3TdOIkqVjFElqtDI72BJ4=;
        b=FS/m4aPY9R+a3xm0Hu3P0T5nfv9Zoh/VwU2tIxFM3ywCXKMhfG0hogDtXDjxRXhcXF
         EfEzJmGw6v7gss9ZleIi4pXD+UaAb1Dc2qAwtIiJvIy5yUY9+EMrNRbnY7wVUXXGbBUW
         +PNvcChJCZ5Mro/AsOauRkSShcBlKUlfmLvUpmfo6Tp8RonJqTON5ptswScf5F+KSySe
         5e1i2FRyfo214+8gCVBKJ0cBIzRTpFhbkZIbYj1CxZSLSh1882gmBHXZBpZ3Yx5TBw9d
         dmRTd1J+yRmaoZXZnJrlMnaJNa2mNpRY6/Ok/10FUix5Ovi9XYKtdLot9PUKZ5ASczGg
         lBmw==
X-Gm-Message-State: AAQBX9dakDZhnK89nRA2o7ofDQYoPi8NjCDagZjC9sSVcWADfZzdWfxh
	LqtFXDS/qAmhdufdaV48mwprtWErMQg=
X-Google-Smtp-Source: AKy350Y9bMblCI5bKH6aGwBZSHzcf7skrH8RmbpkKWpftFeFKbUvrtyyNkpkNaAqDsxlNtG1/7YAPg==
X-Received: by 2002:ac8:7d94:0:b0:3d9:cb72:3653 with SMTP id c20-20020ac87d94000000b003d9cb723653mr32039016qtd.25.1682452019795;
        Tue, 25 Apr 2023 12:46:59 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] libxl: Print device_kind as a string
Date: Tue, 25 Apr 2023 15:46:22 -0400
Message-Id: <20230425194622.114869-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425194622.114869-1-jandryuk@gmail.com>
References: <20230425194622.114869-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Printing the integer isn't particularly informative.  Switch to a
human-readable string when printing the device_kind in
libxl__get_hotplug_script_info().

Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 tools/libs/light/libxl_linux.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_linux.c b/tools/libs/light/libxl_linux.c
index 27f2bce718..f7c92ba562 100644
--- a/tools/libs/light/libxl_linux.c
+++ b/tools/libs/light/libxl_linux.c
@@ -231,8 +231,8 @@ int libxl__get_hotplug_script_info(libxl__gc *gc, libxl__device *dev,
         break;
     default:
         /* No need to execute any hotplug scripts */
-        LOGD(DEBUG, dev->domid,
-             "backend_kind %d, no need to execute scripts", dev->backend_kind);
+        LOGD(DEBUG, dev->domid, "backend_kind %s, no need to execute scripts",
+             libxl__device_kind_to_string(dev->backend_kind));
         rc = 0;
         break;
     }
-- 
2.40.0


