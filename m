Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B947EE07C
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 13:13:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634152.989493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFc-0005Dn-UQ; Thu, 16 Nov 2023 12:13:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634152.989493; Thu, 16 Nov 2023 12:13:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFc-0005A6-PD; Thu, 16 Nov 2023 12:13:40 +0000
Received: by outflank-mailman (input) for mailman id 634152;
 Thu, 16 Nov 2023 12:13:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flNc=G5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3bFa-0003ma-W3
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 12:13:39 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9207801e-8479-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 13:13:37 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c742186a3bso9207661fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 04:13:37 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 j41-20020a05600c1c2900b00401e32b25adsm3546845wms.4.2023.11.16.04.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 04:13:36 -0800 (PST)
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
X-Inumbo-ID: 9207801e-8479-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700136816; x=1700741616; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRJkkyFmkuBC8WFdcMa+KWUUy8Cc06O02MjHNIPMUf0=;
        b=K8IscRT3RHMNqlc1BTeuUwRLsSnPrRtVMv94tVRxsAqBXgXqoPMRFNAqx1Z9OdX/Eq
         NYAYRV20t9dK7uaPPWS3Nd8c39mAS9ZP1lfeL7GGWFQreKHvNIfw4pa3LxW/xoAe3jSt
         8cVvQVlBBiiepo9N2b/KwUL4SuxezJTQdZens=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136816; x=1700741616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRJkkyFmkuBC8WFdcMa+KWUUy8Cc06O02MjHNIPMUf0=;
        b=YhdRHzMr5xKArNYuQWXG/7JbR2BKvQLjdQOsJHC+WPIzFIjgj06eEICflfQ0rJiXm7
         Bp3pcOx5AaO9zXb0sHFzg1p2EA7nKWhjwicMWeivrEYQfQPESzYOG2jPs46hitu9VxIA
         1baibK+nmpT0gnqDLGLdn9JpsyU6d08lEn4uaGxQlvF07ZqltWcD1/KYFbqvLp09stsf
         4mY8RdedhmTilJIsBRiQgWbnGJikqZN20xB/U6qqKV7uNf7iVrWvo7Zu4pecjNt5ihZI
         V8pn5lK1pW+s+13L071D0kWH3UI+3XW3FR1zygNJeGYTkeO+qoL22eaCIK1rQalsE8yg
         PSEw==
X-Gm-Message-State: AOJu0Yylu1Vn58RB2k8jTxjbNbeoPsJ6BuMk0vKoAorjV9o8a71rKmvo
	p92KqmuQBFFC8oiEPBPtxV3QqIS+POSG7x5kCfQ=
X-Google-Smtp-Source: AGHT+IGMtxxKv8jfrZgrGv0d8OB6C403oXIC6WXU5UmTXkOGUb+0rbuZgTEFO+uVplUMBDxb1pXEpQ==
X-Received: by 2002:a2e:a592:0:b0:2c8:3571:b070 with SMTP id m18-20020a2ea592000000b002c83571b070mr8524414ljp.39.1700136816460;
        Thu, 16 Nov 2023 04:13:36 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 6/6] automation: switch to multi-platform images when possible
Date: Thu, 16 Nov 2023 13:13:10 +0100
Message-ID: <20231116121310.72210-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116121310.72210-1-roger.pau@citrix.com>
References: <20231116121310.72210-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of using specific architecture image, switch to using multi-arch ones
and specify the desired architecture using the --platform option.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I haven't touched the Yocto dockerfile because I'm not sure how it's used.
---
 automation/build/alpine/3.18-arm64v8.dockerfile               | 2 +-
 automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile | 2 +-
 automation/build/debian/bookworm-arm64v8.dockerfile           | 2 +-
 automation/build/debian/bookworm-cppcheck.dockerfile          | 2 +-
 automation/build/debian/bookworm-i386.dockerfile              | 2 +-
 automation/build/debian/stretch-i386.dockerfile               | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/automation/build/alpine/3.18-arm64v8.dockerfile b/automation/build/alpine/3.18-arm64v8.dockerfile
index 470f5d72a921..91e90220240f 100644
--- a/automation/build/alpine/3.18-arm64v8.dockerfile
+++ b/automation/build/alpine/3.18-arm64v8.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/alpine:3.18
+FROM --platform=linux/arm64/v8 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile b/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
index b3295c435ed5..a05ffeac04f9 100644
--- a/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
+++ b/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/debian:bookworm
+FROM --platform=linux/arm64/v8 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/bookworm-arm64v8.dockerfile b/automation/build/debian/bookworm-arm64v8.dockerfile
index 640b1e0eadf2..2c432aacb765 100644
--- a/automation/build/debian/bookworm-arm64v8.dockerfile
+++ b/automation/build/debian/bookworm-arm64v8.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/debian:bookworm
+FROM --platform=linux/arm64/v8 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/bookworm-cppcheck.dockerfile b/automation/build/debian/bookworm-cppcheck.dockerfile
index d64fb7b18c66..d368d69472cb 100644
--- a/automation/build/debian/bookworm-cppcheck.dockerfile
+++ b/automation/build/debian/bookworm-cppcheck.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/debian:bookworm AS builder
+FROM --platform=linux/arm64/v8 debian:bookworm AS builder
 
 ENV DEBIAN_FRONTEND=noninteractive
 ENV CPPCHECK_VERSION=2.7
diff --git a/automation/build/debian/bookworm-i386.dockerfile b/automation/build/debian/bookworm-i386.dockerfile
index 559bf670f0f1..89a650338566 100644
--- a/automation/build/debian/bookworm-i386.dockerfile
+++ b/automation/build/debian/bookworm-i386.dockerfile
@@ -1,4 +1,4 @@
-FROM i386/debian:bookworm
+FROM --platform=linux/i386 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
index 9739651e25dd..da93fed8ea68 100644
--- a/automation/build/debian/stretch-i386.dockerfile
+++ b/automation/build/debian/stretch-i386.dockerfile
@@ -1,4 +1,4 @@
-FROM i386/debian:stretch
+FROM --platform=linux/i386 debian:stretch
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-- 
2.42.0


