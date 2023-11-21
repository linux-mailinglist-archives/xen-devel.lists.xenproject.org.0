Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF7F7F3338
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:07:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637953.994144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THk-0003kA-Uh; Tue, 21 Nov 2023 16:07:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637953.994144; Tue, 21 Nov 2023 16:07:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THk-0003gp-PM; Tue, 21 Nov 2023 16:07:36 +0000
Received: by outflank-mailman (input) for mailman id 637953;
 Tue, 21 Nov 2023 16:07:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5THj-0002HT-9A
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:07:35 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14a11839-8888-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 17:07:34 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c5b7764016so69543181fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:07:34 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 e22-20020a5d5956000000b0032dbf6bf7a2sm14749789wri.97.2023.11.21.08.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:07:32 -0800 (PST)
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
X-Inumbo-ID: 14a11839-8888-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700582853; x=1701187653; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kmM/w/9TaHESzZwKotfNmIgZaxyBapwmYFaInyE/7U=;
        b=uMcSeF/wmhtKFVH608Sq/Hv+D7By8XCNaCPHkMlFLauc9lkwkUxxWxFZwFZnety0GL
         ftYxGNk2PDzShTA2TitKfFXlChRwYMiIgmM+XfyCu+dPlRko7Eat/v1ZYQbWagOGqdtc
         bC0/Erp7V+1UUUxEwrXpBem0FcqEaea5dtz+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582853; x=1701187653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kmM/w/9TaHESzZwKotfNmIgZaxyBapwmYFaInyE/7U=;
        b=OudTBkfBuZDKJMVtmYJEtWbL9WKmYNNLJRU12dZnb+9RhNOuxxF77qsvbekKHAZLM+
         4wWJro5dmKgFLJGSDrg2rivzPotrSEtHVRHmIm66k/83osxrZaRfV13P1hRFrM8awr4q
         LTuTWcM9Zoy4r2Ehk2yUhciCd0B1/hWm3YFBCLTVh5fEosHEqA78Cr+4K54EweT8FyUd
         rn5XY16POu3k2fO5I+DXK7HPHyvw+/4pekoSjgqqS8Tz9NHN81gtJyBUB3p/uxrJcP6r
         M4S4PY2eYBf2YWnFps7Nmd00+9+6vH59bL2yH9SoRsxapysMmowE4i+Z44RArup+8sy8
         MDyQ==
X-Gm-Message-State: AOJu0YzG6zcxn7OFnOrzp7herFJW+Sh9/hCNHTTyh3uZckUY/wmKKTLb
	JW1IXrYZEj7SZAVRxbp9bBXqTfeTPjrwKkle0mU=
X-Google-Smtp-Source: AGHT+IEti2nzUVhLiGjNIqWupHd4+A2qCCmv+0UoxlYvYGtBpB0v4kKRNlfFBufraWVlyrAflSYKWA==
X-Received: by 2002:a2e:2e10:0:b0:2c5:12c4:5ff with SMTP id u16-20020a2e2e10000000b002c512c405ffmr6899344lju.17.1700582853198;
        Tue, 21 Nov 2023 08:07:33 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 6/7] automation: set architecture in docker files
Date: Tue, 21 Nov 2023 17:03:57 +0100
Message-ID: <20231121160358.8080-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121160358.8080-1-roger.pau@citrix.com>
References: <20231121160358.8080-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pass the desired architecture of the image in the FROM instruction if the
image is possibly multi-platform.

This allows using the x86 Dockerfiles on OS X on arm64 hardware.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I haven't touched the Yocto dockerfile because I'm not sure how it's used.
---
 automation/build/alpine/3.18.dockerfile                       | 2 +-
 automation/build/archlinux/current-riscv64.dockerfile         | 2 +-
 automation/build/archlinux/current.dockerfile                 | 2 +-
 automation/build/centos/7.dockerfile                          | 2 +-
 automation/build/debian/bookworm.dockerfile                   | 2 +-
 automation/build/debian/bullseye-ppc64le.dockerfile           | 2 +-
 automation/build/debian/buster-gcc-ibt.dockerfile             | 4 ++--
 automation/build/debian/jessie.dockerfile                     | 2 +-
 automation/build/debian/stretch.dockerfile                    | 2 +-
 automation/build/fedora/29.dockerfile                         | 2 +-
 automation/build/suse/opensuse-leap.dockerfile                | 2 +-
 automation/build/suse/opensuse-tumbleweed.dockerfile          | 2 +-
 automation/build/ubuntu/bionic.dockerfile                     | 2 +-
 automation/build/ubuntu/focal.dockerfile                      | 2 +-
 automation/build/ubuntu/trusty.dockerfile                     | 2 +-
 automation/build/ubuntu/xenial-xilinx.dockerfile              | 2 +-
 automation/build/ubuntu/xenial.dockerfile                     | 2 +-
 automation/tests-artifacts/alpine/3.18.dockerfile             | 2 +-
 automation/tests-artifacts/kernel/6.1.19.dockerfile           | 2 +-
 .../tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile  | 2 +-
 20 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
index 5d2a69a06010..4ae9cb5e9e30 100644
--- a/automation/build/alpine/3.18.dockerfile
+++ b/automation/build/alpine/3.18.dockerfile
@@ -1,4 +1,4 @@
-FROM alpine:3.18
+FROM --platform=linux/amd64 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/archlinux/current-riscv64.dockerfile b/automation/build/archlinux/current-riscv64.dockerfile
index abf8e7bf0b88..af75b5c720ce 100644
--- a/automation/build/archlinux/current-riscv64.dockerfile
+++ b/automation/build/archlinux/current-riscv64.dockerfile
@@ -1,4 +1,4 @@
-FROM archlinux
+FROM --platform=linux/amd64 archlinux
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index 47e79637a4a6..d974a1434fd5 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -1,4 +1,4 @@
-FROM archlinux:base-devel
+FROM --platform=linux/amd64 archlinux:base-devel
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index 69dcefb2f011..ab450f0b3a0e 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -1,4 +1,4 @@
-FROM centos:7
+FROM --platform=linux/amd64 centos:7
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
index 7aea081c13a9..459f8e30bdc6 100644
--- a/automation/build/debian/bookworm.dockerfile
+++ b/automation/build/debian/bookworm.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:bookworm
+FROM --platform=linux/amd64 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
index 4de8458445ae..6fdfb6bc2b40 100644
--- a/automation/build/debian/bullseye-ppc64le.dockerfile
+++ b/automation/build/debian/bullseye-ppc64le.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:bullseye-slim
+FROM --platform=linux/amd64 debian:bullseye-slim
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/buster-gcc-ibt.dockerfile b/automation/build/debian/buster-gcc-ibt.dockerfile
index 96ab4fe8a2f1..6a3e50ef6b3f 100644
--- a/automation/build/debian/buster-gcc-ibt.dockerfile
+++ b/automation/build/debian/buster-gcc-ibt.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:buster-slim AS builder
+FROM --platform=linux/amd64 debian:buster-slim AS builder
 
 ENV DEBIAN_FRONTEND=noninteractive
 ENV USER root
@@ -41,7 +41,7 @@ RUN ./configure \
 RUN make -j`nproc` && make -j`nproc` install
 
 
-FROM debian:buster-slim
+FROM --platform=linux/amd64 debian:buster-slim
 COPY --from=builder /opt/gcc-11-ibt /opt/gcc-11-ibt
 
 LABEL maintainer.name="The Xen Project" \
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 5c71c3e3ea75..32fc952fbc2d 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -1,4 +1,4 @@
-FROM debian/eol:jessie
+FROM --platform=linux/amd64 debian/eol:jessie
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index 2f1a99f45017..e2706a8f3589 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:stretch
+FROM --platform=linux/amd64 debian:stretch
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
index e55b06a4517e..42a87ce6c84b 100644
--- a/automation/build/fedora/29.dockerfile
+++ b/automation/build/fedora/29.dockerfile
@@ -1,4 +1,4 @@
-FROM fedora:29
+FROM --platform=linux/amd64 fedora:29
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 7010b71acaa0..e1ec38a41445 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -1,4 +1,4 @@
-FROM opensuse/leap
+FROM --platform=linux/amd64 opensuse/leap
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 959e1f6939f0..38f6fda2ff1b 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -1,4 +1,4 @@
-FROM opensuse/tumbleweed
+FROM --platform=linux/amd64 opensuse/tumbleweed
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index e15f54431efb..77d7f933860c 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -1,4 +1,4 @@
-FROM ubuntu:18.04
+FROM --platform=linux/amd64 ubuntu:18.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index e3d11194ee2f..30a9b8e84ffe 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -1,4 +1,4 @@
-FROM ubuntu:20.04
+FROM --platform=linux/amd64 ubuntu:20.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index 22e294c20cac..0d33578c4e1d 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -1,4 +1,4 @@
-FROM ubuntu:14.04
+FROM --platform=linux/amd64 ubuntu:14.04
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/ubuntu/xenial-xilinx.dockerfile b/automation/build/ubuntu/xenial-xilinx.dockerfile
index 5f7087135213..49f27b322995 100644
--- a/automation/build/ubuntu/xenial-xilinx.dockerfile
+++ b/automation/build/ubuntu/xenial-xilinx.dockerfile
@@ -1,4 +1,4 @@
-FROM ubuntu:16.04
+FROM --platform=linux/amd64 ubuntu:16.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
index 2d2ba3e31f63..e8035434f804 100644
--- a/automation/build/ubuntu/xenial.dockerfile
+++ b/automation/build/ubuntu/xenial.dockerfile
@@ -1,4 +1,4 @@
-FROM ubuntu:16.04
+FROM --platform=linux/amd64 ubuntu:16.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
index 5f521572b8fb..f1b4a8b7a191 100644
--- a/automation/tests-artifacts/alpine/3.18.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18.dockerfile
@@ -1,4 +1,4 @@
-FROM alpine:3.18
+FROM --platform=linux/amd64 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
index d5b787c1cbb5..3a4096780d20 100644
--- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
+++ b/automation/tests-artifacts/kernel/6.1.19.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:bookworm
+FROM --platform=linux/amd64 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile b/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
index 7376ca46ff8e..65857147bf4f 100644
--- a/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
+++ b/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:bullseye-slim
+FROM --platform=linux/amd64 debian:bullseye-slim
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-- 
2.42.0


