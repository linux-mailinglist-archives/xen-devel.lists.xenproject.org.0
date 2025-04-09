Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5283A82C98
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 18:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944340.1342827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQJ-0004tz-Ae; Wed, 09 Apr 2025 16:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944340.1342827; Wed, 09 Apr 2025 16:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2YQJ-0004s2-6P; Wed, 09 Apr 2025 16:37:11 +0000
Received: by outflank-mailman (input) for mailman id 944340;
 Wed, 09 Apr 2025 16:37:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fbf/=W3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2YQI-0004du-Fz
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 16:37:10 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1d912c0-1560-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 18:37:10 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so41017625e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 09:37:10 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c817dsm20947455e9.23.2025.04.09.09.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 09:37:08 -0700 (PDT)
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
X-Inumbo-ID: e1d912c0-1560-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744216629; x=1744821429; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HPj2BkEUlG19zfMbN8eKndFls2Zns5SZnbPzD3KxiXw=;
        b=GwDU6u2JfWP9nKc/jsTflcNXZc/ldRL2c9KHd8eMtnuy01+p9g7NPV1aQe9qTQ3/Y0
         rYW5SIv+j9kbskPGEoylAz4DYAw3PcnrStceBdm5da7SbspMxfK03XdAN06FAJ1DyZm4
         EErAHaTwVxXZi49BttxMPiwM6HgPaVa+RQSow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744216629; x=1744821429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPj2BkEUlG19zfMbN8eKndFls2Zns5SZnbPzD3KxiXw=;
        b=LjNlczB6I1leIZlO59FThG6xM6e5MPwC8G9QHN4jhbot9yAJ03PyO5ejUVVGnm1RZb
         MKAiiXoQPIlJkBQoUeCA7f6BnpvfV+eiP7BgVL431d9XR+INM3JP0DeLDj2hJa6x1g0B
         y1n6PtmxnUtAbtp2+zgF2qa4S2efJ7vIE2SUTckDd7BMdp7IUPUSuXWMRBHECPBFZKLP
         5PXOFq49/kJsBoEUgpk3dM5BzoXcq0zT6GaWOHWPVhVr55NNDXkzwcWlpvSivVcvIaiO
         Xi9X7J98Yxdup9l4Hmn268GnIp/Az1fvwFCSEaofXTIwVi4GV7qtzRCX6h1w926kvJLO
         AwsQ==
X-Gm-Message-State: AOJu0Yyyhy9pnvZDjwdFdh5XsRV5wnqlHM7B9YLWGF1W170vbdiUxcD2
	/wgRUAb3CwMqUEcua7633mVJ08KHU42kR/gkGlKfPDZMTeU1q5lMsIf6fLuVf4CoYaDu+57StI7
	G4Hc=
X-Gm-Gg: ASbGncsR8xRvy1HmM7M/WcI3OCICuWHOD0+d+RMD9Y/Nh3BVbLUZ3/+UXM/mdCB3zUP
	sUrez0cxFdxD96Xp9D9gdAIrqpgRa5pVQSAO3izcG51Zee9aMoMxL4+EPYfuH9Dwz1TYDmLXfO8
	QIQXEieVUyPw93gJ/bD95udJ1Vda27YgTk1ZnF+cdlTZEUH1FvSpHdmOo3B2gAWvn9ujaTuzQb/
	OrRvpBFk35uRe+HNwscOG8y9D7Z4xqR0fsT+qNNJAcb8NcXFvKTDVE87Dcgx4UqdTHjPycrJoPd
	IBivQQ9V8S1RG7SS4xRdh8pT4xWUHxh+f+BVSfIik4Rp9el8TMCKZEzE2/jF5HfTTP+1V6WNr47
	ddVuUXcIfmAd5wQ==
X-Google-Smtp-Source: AGHT+IEhNqBFFFM0nTh5hLtgrHCJrROHI9w4zseqll/oh/0Ofo7RMHkm7cZtluTAVt65V+deuommFA==
X-Received: by 2002:a05:600c:1c02:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-43f1ec7cc9cmr38097685e9.2.1744216629188;
        Wed, 09 Apr 2025 09:37:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH 3/8] Fix container user setup
Date: Wed,  9 Apr 2025 17:36:57 +0100
Message-Id: <20250409163702.2037301-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
References: <20250409163702.2037301-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use USER (and 'user' as normal), rather than specifying configuration from the
outside.  This also fixes the fact that root-needing containers need to
override the default.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Anthony PERARD <anthony.perard@vates.tech>
---
 .gitlab-ci.yml                        | 7 -------
 images/alpine/x86_64-build.dockerfile | 7 ++++---
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 7e18a87b3a07..36ec6a7e1ee5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -14,10 +14,6 @@ workflow:
 
 .x86_64-artifacts:
   extends: .artifacts
-  image:
-    docker:
-      platform: linux/amd64
-      user: xenproject
   tags:
     - x86_64
   variables:
@@ -32,9 +28,6 @@ x86_64-kernel-linux-6.6.56:
 
 x86_64-rootfs-alpine-3.18:
   extends: .x86_64-artifacts
-  image:
-    docker:
-      user: root
   script:
     - . scripts/x86_64-rootfs-alpine.sh
   variables:
diff --git a/images/alpine/x86_64-build.dockerfile b/images/alpine/x86_64-build.dockerfile
index 3bfd17248d0a..6bfdb6ff5a0c 100644
--- a/images/alpine/x86_64-build.dockerfile
+++ b/images/alpine/x86_64-build.dockerfile
@@ -3,12 +3,10 @@ FROM --platform=linux/amd64 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-WORKDIR /build/
-
 RUN apk --no-cache add bash
 
 RUN bash -ex <<EOF
-      adduser -D xenproject --shell bash
+      adduser -D user --shell bash
 
       DEPS=(
             musl-dev
@@ -29,3 +27,6 @@ RUN bash -ex <<EOF
 
       apk add --no-cache "\${DEPS[@]}"
 EOF
+
+USER user
+WORKDIR /build
-- 
2.39.5


