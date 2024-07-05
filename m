Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8F8928B87
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2024 17:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754381.1162823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkk8-0000z3-7i; Fri, 05 Jul 2024 15:21:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754381.1162823; Fri, 05 Jul 2024 15:21:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPkk8-0000x8-2j; Fri, 05 Jul 2024 15:21:00 +0000
Received: by outflank-mailman (input) for mailman id 754381;
 Fri, 05 Jul 2024 15:20:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4R/=OF=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sPkk6-00005r-7d
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2024 15:20:58 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cfda7dd-3ae2-11ef-8776-851b0ebba9a2;
 Fri, 05 Jul 2024 17:20:56 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52e97e5a84bso2653088e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jul 2024 08:20:56 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77c8ad6c6esm78100366b.49.2024.07.05.08.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jul 2024 08:20:53 -0700 (PDT)
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
X-Inumbo-ID: 2cfda7dd-3ae2-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720192855; x=1720797655; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT+xxLG3kZnyjXAlIz0M6MDg+PHf3LnnsejdSoFepz8=;
        b=lnRbrznt1xdP69UWQa7GMi2dY5QXw1H+qeuM8Zz2diar0bEGvnMnjTsI2p/D2oDAP9
         vzvSZQ03ccwnQ/NDlf0JiIt1yrxz3Ek8pbi2j0Rxz4WyLgqAswi8nR/J1faQIHKawMnB
         eVpWdxRRgEKODaCI/5sSpVZANihDWIgEwHEV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720192855; x=1720797655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sT+xxLG3kZnyjXAlIz0M6MDg+PHf3LnnsejdSoFepz8=;
        b=Yu/eJld8tQPuhffmTsvKyHWS0GmUjXf2Ra7Wm1PZALPFM68YzJFZfQoqmis1z4NpUN
         fOlqXxXeRZBKsNQ2KIi5S5TrGEPvf0uXV3q/iZFCH4EHl0k73g7rNqRhQRJ1Z+mO5Uel
         41F2AVC02nqMEdQNjhT4BtLL0AUg/PsPEl3m4cfKYWs4ttEmXnZe5c+KLv6MSqR7l2Tv
         32Hnr6lHmAXeqXVHZUXDewmv1vxn7ysBxgROyEahlltoW+WVGvV8Q+oAOcDvIjdFt6gJ
         7irDv9i9qxK4oMj8EQp7AQr6kBJJv76pM/HsK5jygVM+/tgyrq+T7Yx/2kL/kUWUCVr1
         5Yzg==
X-Gm-Message-State: AOJu0Yyho4fx+C5JTmWk+rZmZ2sxGvYqUhK9VMQD/bPMkmvWK+s01Gp1
	K1oAVdu416v33CnV6hL32ccTPM/4VcrbVS9x+vwlSuQCHfcmNWWi/W354l62gSRh+dEScxGQ/p4
	w
X-Google-Smtp-Source: AGHT+IHr/559GdKD55LPJiuUxD7c0dVxFt/ehoT4DI2J2v2gILtxbbGaqd7xzT+33/1n3Bfff7RkaA==
X-Received: by 2002:ac2:55a8:0:b0:52c:daa4:2f6a with SMTP id 2adb3069b0e04-52ea06c8b5dmr4219256e87.64.1720192854836;
        Fri, 05 Jul 2024 08:20:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 4/6] build: Drop openssl as a build dependency
Date: Fri,  5 Jul 2024 16:20:35 +0100
Message-Id: <20240705152037.1920276-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
References: <20240705152037.1920276-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The final user was blktap1, removed in Xen 4.6.

Fixes: f6bcc035084a ("tools: remove blktap1")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 README                                                    | 1 -
 automation/build/debian/bookworm-arm64v8.dockerfile       | 1 -
 automation/build/debian/bookworm-i386.dockerfile          | 1 -
 automation/build/debian/bookworm.dockerfile               | 1 -
 automation/build/debian/jessie-i386.dockerfile            | 1 -
 automation/build/debian/jessie.dockerfile                 | 1 -
 automation/build/debian/stretch-i386.dockerfile           | 1 -
 automation/build/debian/stretch.dockerfile                | 1 -
 automation/build/fedora/29.dockerfile                     | 1 -
 automation/build/ubuntu/bionic.dockerfile                 | 1 -
 automation/build/ubuntu/focal.dockerfile                  | 1 -
 automation/build/ubuntu/trusty.dockerfile                 | 1 -
 automation/build/ubuntu/xenial.dockerfile                 | 1 -
 automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile | 1 -
 automation/tests-artifacts/kernel/6.1.19.dockerfile       | 1 -
 15 files changed, 15 deletions(-)

diff --git a/README b/README
index 428e45549a88..bf6b8cd4d658 100644
--- a/README
+++ b/README
@@ -52,7 +52,6 @@ provided by your OS distributor:
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
     * Development install of curses (e.g., libncurses-dev)
-    * Development install of openssl (e.g., openssl-dev)
     * Development install of x11 (e.g. xorg-x11-dev)
     * Development install of uuid (e.g. uuid-dev)
     * Development install of yajl (e.g. libyajl-dev)
diff --git a/automation/build/debian/bookworm-arm64v8.dockerfile b/automation/build/debian/bookworm-arm64v8.dockerfile
index 3ab426a082d3..a36b04e75e95 100644
--- a/automation/build/debian/bookworm-arm64v8.dockerfile
+++ b/automation/build/debian/bookworm-arm64v8.dockerfile
@@ -15,7 +15,6 @@ RUN apt-get update && \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-        libssl-dev \
         python3-dev \
         python3-setuptools \
         xorg-dev \
diff --git a/automation/build/debian/bookworm-i386.dockerfile b/automation/build/debian/bookworm-i386.dockerfile
index 9a54bd7293dc..2ccf32193f26 100644
--- a/automation/build/debian/bookworm-i386.dockerfile
+++ b/automation/build/debian/bookworm-i386.dockerfile
@@ -17,7 +17,6 @@ RUN apt-get update && \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-        libssl-dev \
         python3-dev \
         python3-setuptools \
         xorg-dev \
diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
index bef44dd75300..d02e3df61f76 100644
--- a/automation/build/debian/bookworm.dockerfile
+++ b/automation/build/debian/bookworm.dockerfile
@@ -15,7 +15,6 @@ RUN apt-get update && \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-        libssl-dev \
         python3-dev \
         python3-setuptools \
         xorg-dev \
diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index 1eb7ff11c7d3..d66d0692029b 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -24,7 +24,6 @@ RUN apt-get update && \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-        libssl-dev \
         python-dev \
         xorg-dev \
         uuid-dev \
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 4c0ffe66f8fe..53c3bb28f175 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -22,7 +22,6 @@ RUN apt-get update && \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-        libssl-dev \
         python-dev \
         xorg-dev \
         uuid-dev \
diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
index 8ec9c3a24667..36108335e5c7 100644
--- a/automation/build/debian/stretch-i386.dockerfile
+++ b/automation/build/debian/stretch-i386.dockerfile
@@ -24,7 +24,6 @@ RUN apt-get update && \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-        libssl-dev \
         python-dev \
         python3-dev \
         xorg-dev \
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index 2db4552662de..c5339d3c835f 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -22,7 +22,6 @@ RUN apt-get update && \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-        libssl-dev \
         python-dev \
         python3-dev \
         xorg-dev \
diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
index 08edf70838f9..d5f017ac723d 100644
--- a/automation/build/fedora/29.dockerfile
+++ b/automation/build/fedora/29.dockerfile
@@ -10,7 +10,6 @@ RUN dnf -y install \
         gcc-c++ \
         ncurses-devel \
         zlib-devel \
-        openssl-devel \
         python-devel \
         python3-devel \
         libuuid-devel \
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index cc43fc4ade12..c83624e8ca1e 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -15,7 +15,6 @@ RUN apt-get update && \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-        libssl-dev \
         python-dev \
         python3-dev \
         xorg-dev \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index cb8bb2f6faee..cabbebf37754 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -15,7 +15,6 @@ RUN apt-get update && \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-        libssl-dev \
         python3-dev \
         python3-setuptools \
         xorg-dev \
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index e2a1bda7c3a8..ecbcb71b1c21 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -15,7 +15,6 @@ RUN apt-get update && \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-        libssl-dev \
         python-dev \
         python3-dev \
         xorg-dev \
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
index 168bc70ffad8..13ecae7a0b81 100644
--- a/automation/build/ubuntu/xenial.dockerfile
+++ b/automation/build/ubuntu/xenial.dockerfile
@@ -15,7 +15,6 @@ RUN apt-get update && \
         build-essential \
         zlib1g-dev \
         libncurses5-dev \
-        libssl-dev \
         python-dev \
         python3-dev \
         xorg-dev \
diff --git a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
index 22359c906630..8e33995ba34b 100644
--- a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
+++ b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
@@ -14,7 +14,6 @@ WORKDIR /build
 RUN apt-get update && \
     apt-get --quiet --yes install \
         build-essential \
-        libssl-dev \
         bc \
         curl \
         flex \
diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
index 5cf53d290c6f..073eaa0e11fa 100644
--- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
+++ b/automation/tests-artifacts/kernel/6.1.19.dockerfile
@@ -14,7 +14,6 @@ WORKDIR /build
 RUN apt-get update && \
     apt-get --quiet --yes install \
         build-essential \
-        libssl-dev \
         bc \
         curl \
         flex \
-- 
2.39.2


