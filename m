Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F487EE07A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 13:13:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634151.989482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFb-0004wC-Iq; Thu, 16 Nov 2023 12:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634151.989482; Thu, 16 Nov 2023 12:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3bFb-0004t8-F5; Thu, 16 Nov 2023 12:13:39 +0000
Received: by outflank-mailman (input) for mailman id 634151;
 Thu, 16 Nov 2023 12:13:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flNc=G5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3bFZ-0003ma-Vw
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 12:13:37 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9168db25-8479-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 13:13:36 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d81864e3fso478568f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 04:13:36 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 dl15-20020a0560000b8f00b003232380ffd7sm13379446wrb.102.2023.11.16.04.13.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Nov 2023 04:13:34 -0800 (PST)
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
X-Inumbo-ID: 9168db25-8479-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700136815; x=1700741615; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qIspCe97azur24wlxRrY8XemEwF0HzaBD9Iy98M0AxI=;
        b=dcUinvlT7E6naWPDoUd4Xi9x0ENDyD6mUdgBIcQEJr2OakMugKUkdoYMMsRpOYkM5a
         WyYS90Fck2AnAkXAGf57ZjO9P4v81QSszMVV0uNvlgjiYCTEq8Mkq+pmfIgR/3pPn0tG
         FH4qvujrDnrPxQhj1guyANNSadtN+DACHS6eo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700136815; x=1700741615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIspCe97azur24wlxRrY8XemEwF0HzaBD9Iy98M0AxI=;
        b=gME5c/6Xb7h9KpAXZZaU3CpZXXo2ri6tOooklza4ac4XxI+ntbLv5eZkelDNbsP4Yj
         kJWGwu/E7A3RCKE4+KuAivX5Ho7CYNjqbh4yrHqi7yZBUhjrICHLZ2BZU4fH85sA7gkP
         Nx8jHwrqPY2Q3P18SbcEhZxw8berOJHvZwjP5FHqowwGDgGDJvOBIG+PMigqmVhzPLcv
         MCS5aXTgbj8E8yA+VxAqAEyp2ryEPpNL4vTmk8MGxNkuNUcHyw+e1vjWXi7hvFSmv+l0
         TPE8lcoE1wsJCtu+I4dSKq2xd35SWYEmQL+D0ps1btWLUIcYQouIUquMTuvaUOyDJQJg
         RKyw==
X-Gm-Message-State: AOJu0YzBjQL8qylASnlThyfwxklnv87pvNEw9F0Ppd9S1Fo46QOhyAFg
	OAvWmO8RzbFY3pAIlD+wulq7sy+SxR3zCUGoxaw=
X-Google-Smtp-Source: AGHT+IEg2sX+xnniGp39dWgTND5q0QxM53slzT80fjsMyrFYrVPNsCnrHPCgIzAWyFM3qz8+IMjFJQ==
X-Received: by 2002:adf:ef4a:0:b0:32d:be44:f70c with SMTP id c10-20020adfef4a000000b0032dbe44f70cmr10183840wrp.7.1700136815072;
        Thu, 16 Nov 2023 04:13:35 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 5/6] automation: set architecture in docker files
Date: Thu, 16 Nov 2023 13:13:09 +0100
Message-ID: <20231116121310.72210-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231116121310.72210-1-roger.pau@citrix.com>
References: <20231116121310.72210-1-roger.pau@citrix.com>
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
 automation/build/alpine/3.18.dockerfile               | 2 +-
 automation/build/archlinux/current-riscv64.dockerfile | 2 +-
 automation/build/archlinux/current.dockerfile         | 2 +-
 automation/build/centos/7.dockerfile                  | 2 +-
 automation/build/debian/bookworm.dockerfile           | 2 +-
 automation/build/debian/bullseye-ppc64le.dockerfile   | 2 +-
 automation/build/debian/buster-gcc-ibt.dockerfile     | 2 +-
 automation/build/debian/jessie.dockerfile             | 2 +-
 automation/build/debian/stretch.dockerfile            | 2 +-
 automation/build/fedora/29.dockerfile                 | 2 +-
 automation/build/suse/opensuse-leap.dockerfile        | 2 +-
 automation/build/suse/opensuse-tumbleweed.dockerfile  | 2 +-
 automation/build/ubuntu/bionic.dockerfile             | 2 +-
 automation/build/ubuntu/focal.dockerfile              | 2 +-
 automation/build/ubuntu/trusty.dockerfile             | 2 +-
 automation/build/ubuntu/xenial-xilinx.dockerfile      | 2 +-
 automation/build/ubuntu/xenial.dockerfile             | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

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
index 96ab4fe8a2f1..4328c109b72b 100644
--- a/automation/build/debian/buster-gcc-ibt.dockerfile
+++ b/automation/build/debian/buster-gcc-ibt.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:buster-slim AS builder
+FROM --platform=linux/amd64 debian:buster-slim AS builder
 
 ENV DEBIAN_FRONTEND=noninteractive
 ENV USER root
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
 
-- 
2.42.0


