Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54992E5C1
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757325.1166183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlp-0008Kb-KH; Thu, 11 Jul 2024 11:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757325.1166183; Thu, 11 Jul 2024 11:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlp-0008E7-E3; Thu, 11 Jul 2024 11:15:29 +0000
Received: by outflank-mailman (input) for mailman id 757325;
 Thu, 11 Jul 2024 11:15:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrlo-0007rJ-G8
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:28 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0005c60-3f76-11ef-8776-851b0ebba9a2;
 Thu, 11 Jul 2024 13:15:27 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-58b447c5112so1028030a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:27 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:23 -0700 (PDT)
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
X-Inumbo-ID: e0005c60-3f76-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696525; x=1721301325; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMdgJvw5BoA7Ynpn9dLAYsAUignCSQSLKykSZf64/SM=;
        b=jmMpoewFmF/AFx9Ygiex+EMmbg2sQXkFrGOh3Dz0gSSBgYgo/xAldIJkIDKedhj8N3
         +Wf6mDfusnQLxXLmtSWVsZ1rCkbOzWCnAFZGuStCe8F8LanSJVa4xWGSjLQovLbobOeN
         OlkYx1DA+y5MCZO5nLSKRVvCfEJBup5Au8+hA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696525; x=1721301325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMdgJvw5BoA7Ynpn9dLAYsAUignCSQSLKykSZf64/SM=;
        b=S1MJifeTx7fAOwjseITv63l2jqdWP4uUACeSDl3XEjIaz4MoptG20LU3wzU4CNWNig
         KQl2DpXstDZvzL1oDqBScnAo8klu0qLTj3S4DXTxDZmJf5hONtKf/rG5uu015Skd5yk6
         ZgIgPaD7cGLHofzEi5dvW+m2ioId3PGRgf8FoxHANZuCx6yHJuEnuGW42TnY/0s+oQUc
         arkluWhXHvNCJR3ofAByTe3U1uzE24mpavxB7mo7Qx/oW+Z9UBGS2Qwy+08gk49nHSVX
         ANcZbZKuTp6NrbdHLEfkanGwm3jHbSngCoZo6yPnZvyTXZ+JaMgfExCGv6iomTDuYx7y
         X5BQ==
X-Gm-Message-State: AOJu0YwKeCH9hSIRt//ofNdvwSKYNesVCVeT44bPKHi/phDv4QZEn7o6
	KQHrtnSaZ7AmUiwYov9Q+NQ66Rh6peprDaqlTIo5r0sbU49ZMoB2LoXeAtHGHHb26x3awcigCx6
	T
X-Google-Smtp-Source: AGHT+IHD3EHDyWvqIB6M7adyUPfxyLF5B36e8K5nWoAWp1Uc7hCbjfs8JXlEgfRiNZLawBZKHB2TLA==
X-Received: by 2002:a17:907:7247:b0:a77:e2e3:3546 with SMTP id a640c23a62f3a-a780b68a8d1mr755354766b.9.1720696525147;
        Thu, 11 Jul 2024 04:15:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 02/12] CI: Remove useless/misleading randconfig jobs
Date: Thu, 11 Jul 2024 12:15:07 +0100
Message-Id: <20240711111517.3064810-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Randconfig builds pick CONFIG_DEBUG with 50% probability.  Therefore
$foo{,-debug}-randconfig are two identical jobs with misleading names.

Furthermore, arm64 has a randconfig jobs for both the alpine and bookworm
build environments.  Both use GCC 12.2, so we have 4 identical jobs.  Delete 3
of them.

This leaves us with 4 primary randconfig jobs:

  gitlab-ci/build.yaml:381:debian-bookworm-gcc-arm32-randconfig:
  gitlab-ci/build.yaml:429:alpine-3.18-gcc-arm64-randconfig:
  gitlab-ci/build.yaml:495:archlinux-current-gcc-riscv64-randconfig:
  gitlab-ci/build.yaml:640:debian-bookworm-gcc-randconfig:

as PPC64 doesn't want randconfig right now, and buster-gcc-ibt is a special
job with a custom compiler.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

Here is an example debug-randconfig with a release builds:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7312848876

If we want to run multiple identical randconfig jobs, that's spelt

  parallel: 5

in the configuration, and here is an example of what such a run looks like:
  https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1368824041

Notice the randconfig jobs have a 5 in place of a retry button, and show a
submenu when clicked on.
---
 automation/gitlab-ci/build.yaml | 39 ---------------------------------
 1 file changed, 39 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index ff5c9055d1f0..da7b8885aa30 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -385,13 +385,6 @@ debian-bookworm-gcc-arm32-randconfig:
     HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
-debian-bookworm-gcc-arm32-debug-randconfig:
-  extends: .gcc-arm32-cross-build-debug
-  variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-    RANDCONFIG: y
-
 debian-bookworm-gcc-arm32-debug-staticmem:
   extends: .gcc-arm32-cross-build-debug
   variables:
@@ -423,18 +416,6 @@ debian-bookworm-gcc-debug-arm64:
   variables:
     CONTAINER: debian:bookworm-arm64v8
 
-debian-bookworm-gcc-arm64-randconfig:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: debian:bookworm-arm64v8
-    RANDCONFIG: y
-
-debian-bookworm-gcc-debug-arm64-randconfig:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: debian:bookworm-arm64v8
-    RANDCONFIG: y
-
 alpine-3.18-gcc-arm64:
   extends: .gcc-arm64-build
   variables:
@@ -451,12 +432,6 @@ alpine-3.18-gcc-arm64-randconfig:
     CONTAINER: alpine:3.18-arm64v8
     RANDCONFIG: y
 
-alpine-3.18-gcc-debug-arm64-randconfig:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    RANDCONFIG: y
-
 alpine-3.18-gcc-debug-arm64-staticmem:
   extends: .gcc-arm64-build-debug
   variables:
@@ -525,14 +500,6 @@ archlinux-current-gcc-riscv64-randconfig:
     RANDCONFIG: y
     <<: *riscv-fixed-randconfig
 
-archlinux-current-gcc-riscv64-debug-randconfig:
-  extends: .gcc-riscv64-cross-build-debug
-  variables:
-    CONTAINER: archlinux:current-riscv64
-    KBUILD_DEFCONFIG: tiny64_defconfig
-    RANDCONFIG: y
-    <<: *riscv-fixed-randconfig
-
 # Power cross-build
 debian-bullseye-gcc-ppc64le:
   extends: .gcc-ppc64le-cross-build
@@ -676,12 +643,6 @@ debian-bookworm-gcc-randconfig:
     CONTAINER: debian:bookworm
     RANDCONFIG: y
 
-debian-bookworm-gcc-debug-randconfig:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: debian:bookworm
-    RANDCONFIG: y
-
 debian-bookworm-32-clang-debug:
   extends: .clang-x86-32-build-debug
   variables:
-- 
2.39.2


