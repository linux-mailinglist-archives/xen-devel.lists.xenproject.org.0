Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB2CA8426F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 14:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945476.1343683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qeu-0007rS-Hw; Thu, 10 Apr 2025 12:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945476.1343683; Thu, 10 Apr 2025 12:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2qeu-0007p5-Dc; Thu, 10 Apr 2025 12:05:28 +0000
Received: by outflank-mailman (input) for mailman id 945476;
 Thu, 10 Apr 2025 12:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C125=W4=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u2qet-00077g-0l
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 12:05:27 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 154046e0-1604-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 14:05:24 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39bf44be22fso382810f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 05:05:24 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8938a6e7sm4522476f8f.44.2025.04.10.05.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Apr 2025 05:05:22 -0700 (PDT)
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
X-Inumbo-ID: 154046e0-1604-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744286723; x=1744891523; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7HMeZMfC77zMjKsgUg9IL6GNtcv2A8a8DBfH0m7hfA=;
        b=jOlA7voEkqkdtGBwdxqL5CJuqvcWfX3Zv3og6OtsZXzmrWSWSflCc9U92cFNDmBUL4
         WsA3JC8/HqFkYtK9hFJOhx3YfvuqhtTUzvhufEANJjsxK85TF6gX++2jVGFxMuzW7kfB
         24Na8iR9hXj/m0vCDW1+a8WJKzuF4k4lfiUaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744286723; x=1744891523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k7HMeZMfC77zMjKsgUg9IL6GNtcv2A8a8DBfH0m7hfA=;
        b=oyvp7DnZXricQLFIUMgKfezWcVDS2dE+S6S3V4PrpZeyx4aXa0NFSa5NoMq8N2WlmZ
         7b4nAPpELQGb5FxgOr8UmvgWxUZB7Y/t6Qsvr8ZPJ7AHgrl8aMwICLmRUxuJOrHpZjOM
         TUcLY9DAgLE2OlguNbuSyGy8T+GqICPNiAgnNSk0JxdaYK3hKclrLHDIy0C3AmSMhCh4
         3HiXPRa5T6PDLaTbVHKFgTBzZeJ89PXv0Qte/lWk0Reha//Mr5S5BFXTK1amS7ormxxA
         LMOrDO5HWjU3BNlAHap4kFxUKRg2C1b1Uh1muTiRpcG/1oAciEyT5By3LrrgAJmRfmp/
         x6VQ==
X-Gm-Message-State: AOJu0YwTN2BM1ZVrOP20h4ijFCfmwJ9ZfdUoEeul37RF6CG8sGwvFbvN
	c6xetzay/IfeIBxIpRc8aaQ+BuP6JRyffBRGjmW2rSLo5lTqQuwCHBNsTdXbgfJJ8QgbYumVu+x
	Y4l8=
X-Gm-Gg: ASbGncvn/VijuFxmjghBNrOIWElQS/8BlVQQAEYNiY7krDZnwzH0hGuzlQMxYfFX8Fl
	ypua/m+/h+1nP513CmaUAXqOP3AhJ7g/0FlPHMgYtQuIQITs+UEjsJwGd//sI7R9d5z0oylCejP
	CxZ5te5gYmRScEf9Gl7t0m6YLyHFJS2TAe2v2VZY1jbXZbk5jPWIRAvSXZWOXWjpEoPtjivMSRp
	4yAFJfZZWzN148fCPpMdr47ZQ3RlCYJphtgBfWG6eSToAR/IilR4udD2+Ecv/8jPw08tykUGcan
	eciy7ELZOx9H/OwzBJBhq/FROYU4Hcf2hais4YLh1GbUXcVGJmp+IUMMa+iknQsI4uDGbxD4upm
	Kl7NNpbpQSAKpKQ==
X-Google-Smtp-Source: AGHT+IHR1iEU54VMwG/6t2igVyxalbq5cM3lRoDTZXQ4vbh6WcN0QmvdBmQP3PSKkylwLG2hVRVImA==
X-Received: by 2002:a05:6000:1a8c:b0:391:4743:6dc2 with SMTP id ffacd0b85a97d-39d8f47307bmr2085287f8f.25.1744286723383;
        Thu, 10 Apr 2025 05:05:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH 1/3] CI: Update x86 tests from Linux 6.1.19 to 6.6.56
Date: Thu, 10 Apr 2025 13:05:18 +0100
Message-Id: <20250410120520.2062328-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410120520.2062328-1-andrew.cooper3@citrix.com>
References: <20250410120520.2062328-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Linux 6.6.56 was already added to test-artifacts for the argo testing, and
this removes one moving part while cleaning things up.

Drop the associated export job, and dockerfile.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Also, somewhere between 6.6.56 and 6.6.74, PVH stops working
---
 automation/gitlab-ci/build.yaml               | 13 ------
 automation/gitlab-ci/test.yaml                |  4 +-
 .../tests-artifacts/kernel/6.1.19.dockerfile  | 41 -------------------
 3 files changed, 3 insertions(+), 55 deletions(-)
 delete mode 100644 automation/tests-artifacts/kernel/6.1.19.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 169bebe3c775..ab758243c1ec 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -308,19 +308,6 @@ qemu-system-aarch64-6.0.0-arm32-export:
   tags:
     - arm64
 
-# x86_64 test artifacts
-
-kernel-6.1.19-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:6.1.19
-  script:
-    - mkdir binaries && cp /bzImage binaries/bzImage
-  artifacts:
-    paths:
-      - binaries/bzImage
-  tags:
-    - x86_64
-
 # Jobs below this line
 
 # Build jobs needed for tests
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index d05b9a98afa6..a23ff8a6e7fe 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -16,7 +16,9 @@
   - qemu-system-aarch64-6.0.0-arm32-export
 
 .x86-64-test-needs: &x86-64-test-needs
-  - kernel-6.1.19-export
+  - project: xen-project/hardware/test-artifacts
+    job: linux-6.6.56-x86_64
+    ref: master
   - project: xen-project/hardware/test-artifacts
     job: x86_64-rootfs-alpine-3.18
     ref: master
diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
deleted file mode 100644
index 073eaa0e11fa..000000000000
--- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
+++ /dev/null
@@ -1,41 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian:bookworm
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV LINUX_VERSION=6.1.19
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        bc \
-        curl \
-        flex \
-        bison \
-        libelf-dev \
-        && \
-    apt-get autoremove -y && \
-    apt-get clean && \
-    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-
-# Build the kernel
-RUN curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-"$LINUX_VERSION".tar.xz && \
-    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
-    cd linux-"$LINUX_VERSION" && \
-    make defconfig && \
-    make xen.config && \
-    scripts/config --enable BRIDGE && \
-    scripts/config --enable IGC && \
-    scripts/config --enable TUN && \
-    cp .config .config.orig && \
-    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
-    make -j$(nproc) bzImage && \
-    cp arch/x86/boot/bzImage / && \
-    cd /build && \
-    rm -rf linux-"$LINUX_VERSION"*
-- 
2.39.5


