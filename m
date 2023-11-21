Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6657F3337
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:07:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637954.994151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THl-0003u5-LQ; Tue, 21 Nov 2023 16:07:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637954.994151; Tue, 21 Nov 2023 16:07:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THl-0003nc-Ca; Tue, 21 Nov 2023 16:07:37 +0000
Received: by outflank-mailman (input) for mailman id 637954;
 Tue, 21 Nov 2023 16:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5THk-0002HT-1d
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:07:36 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15733784-8888-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 17:07:35 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-332c82400a5so1480015f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:07:35 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 m17-20020adfe0d1000000b0033130644c87sm14801636wri.54.2023.11.21.08.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:07:34 -0800 (PST)
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
X-Inumbo-ID: 15733784-8888-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700582854; x=1701187654; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEHkZfP8Vk93WUZy/CvbiKHsPZUEyAKQIBsJDl8fhZA=;
        b=ARgAfC65YO2TaSzWnhArNwfwfTo+mx8+c1zpqfGHMi+8HoRUj7eKjDwr0ZC2YgmFAF
         ZHg1r7l/myVAUeRIjOje5u6NdQzJMTQUb9xF+LjSGJ96sqJl7nUUpJU+J3alMz6EsXmQ
         xJ1hd5l3HK9Ko7p/ejE61yqk1LwlJW5HjElT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582854; x=1701187654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uEHkZfP8Vk93WUZy/CvbiKHsPZUEyAKQIBsJDl8fhZA=;
        b=gc449QrB917dqc8sEIo17c9jL7hKXPnkZdWu7vfSBlMITNSWVsVCA3kflfhQiqAxBi
         aJ95/Wv2+uz5zlrn9YBplCp2AeLHVmrJJ5mL6v3iHiLGO8oWotmGjOa3IMeVgHVggB3W
         crfDxCdqiyHA6Ewd62Douy4oXa2SghJ0SgZiqOY0tXmauoqvxFxwkPKkjLN3hrH10TKY
         AiOYxy9sn6aCIoFMpzz1tRMK8QmFm5dhYLvx04R5+0+SsNwHEv1D8EKP/1AW8NpDZczN
         rMpZvWYeWZqU1z+U7GSh0HluvAozpKUBQvwzTqgFj9R6u2k3NT0JJBgQiy4B6X08KaPu
         niNQ==
X-Gm-Message-State: AOJu0YzDEFHauUbBWnE6b33ukVszhE52beilRJ79IZL1DehtaHV+81ek
	ZXk1o8iSas52Hpi8fKFY+mts/m9wLo/fRIGnEMM=
X-Google-Smtp-Source: AGHT+IGkrtAyvOGWa6GXLFYjUAB5u29bqv+S2LJhB5SrZlwIViqvtnMwT3R2dFPw6HJLE0pZ0kXbfA==
X-Received: by 2002:a05:6000:4028:b0:32f:7fe4:45f2 with SMTP id cp40-20020a056000402800b0032f7fe445f2mr8713276wrb.4.1700582854590;
        Tue, 21 Nov 2023 08:07:34 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 7/7] automation: switch to multi-platform images when possible
Date: Tue, 21 Nov 2023 17:03:58 +0100
Message-ID: <20231121160358.8080-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121160358.8080-1-roger.pau@citrix.com>
References: <20231121160358.8080-1-roger.pau@citrix.com>
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
 automation/build/debian/bookworm-cppcheck.dockerfile          | 4 ++--
 automation/build/debian/bookworm-i386.dockerfile              | 2 +-
 automation/build/debian/stretch-i386.dockerfile               | 2 +-
 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile     | 2 +-
 automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile     | 2 +-
 .../qemu-system-aarch64/6.0.0-arm64v8.dockerfile              | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

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
index d64fb7b18c66..633268376d56 100644
--- a/automation/build/debian/bookworm-cppcheck.dockerfile
+++ b/automation/build/debian/bookworm-cppcheck.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/debian:bookworm AS builder
+FROM --platform=linux/arm64/v8 debian:bookworm AS builder
 
 ENV DEBIAN_FRONTEND=noninteractive
 ENV CPPCHECK_VERSION=2.7
@@ -24,7 +24,7 @@ RUN curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".t
         FILESDIR=/usr/share/cppcheck \
         HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
 
-FROM arm64v8/debian:bookworm
+FROM --platform=linux/arm64/v8 debian:bookworm
 COPY --from=builder /usr/bin/cppcheck /usr/bin/cppcheck
 COPY --from=builder /usr/share/cppcheck /usr/share/cppcheck
 
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
 
diff --git a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
index cbd96d9bc6b0..94f69621f40e 100644
--- a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/alpine:3.18
+FROM --platform=linux/arm64/v8 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
index a53a97d7277e..b0875ca0ddd1 100644
--- a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
+++ b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/debian:bookworm
+FROM --platform=linux/arm64/v8 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile b/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
index e277e13b60b9..fb7b7b506e94 100644
--- a/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
+++ b/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
@@ -1,4 +1,4 @@
-FROM arm64v8/debian:bookworm
+FROM --platform=linux/arm64/v8 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-- 
2.42.0


