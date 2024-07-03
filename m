Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D64926341
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 16:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753083.1161357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0qC-0004NW-Gl; Wed, 03 Jul 2024 14:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753083.1161357; Wed, 03 Jul 2024 14:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP0qC-0004MH-Bn; Wed, 03 Jul 2024 14:20:12 +0000
Received: by outflank-mailman (input) for mailman id 753083;
 Wed, 03 Jul 2024 14:20:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i9qc=OD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sP0qA-00047x-Cx
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 14:20:10 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a1adb1f-3947-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 16:20:09 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-58b5f7bf3edso1396543a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 07:20:09 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f036sm7114707a12.34.2024.07.03.07.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jul 2024 07:20:07 -0700 (PDT)
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
X-Inumbo-ID: 5a1adb1f-3947-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720016408; x=1720621208; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Aqdfs/AvdoZx8uAWY1WwixoePkTnNArRhMfydyClSo=;
        b=ugI+BswBnnzcQeaGasZP37mXqf70D3luqOX9DD0yxVH/fxbDsTgDlBdfEcln5Cz9Gz
         agrzHygh9DOKp0OIiDzI/zL02bS37rteadH4yOsMEDdd80VSjtgf6YAzhuG9plAq5Yqg
         PUAvy5npJolQOvh0nq2icdewvmQcDVj3BxVms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720016408; x=1720621208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Aqdfs/AvdoZx8uAWY1WwixoePkTnNArRhMfydyClSo=;
        b=VYu237ZayrrXTE0/a5IMweLE4PmXLLto/IFRmPGQsnkExT6mTuuX3azTuJMGJXc9/w
         REsYhAWmkws58j2gpRgVIsozrrypzY4+hwqaJPVKPo2tCRbz9X5s1XZTNcBdkMPPwv39
         ++IzQwE6csk3gTJy9g4fJqqXFp6e0Z6KgiE8eypSvBNayAVQjT754sBIAD7Cg6zc98tL
         l9J1MUT08v3hpV0Pp6Q+ZMoMaMoNcrgeFKGPq2VBnQL/nXpr90ItmMfV/Uj+RjPq0SPv
         8LtxS2y9RMiaqx1uzcoV1ilZYhMW/99fetqvB/3OpHy/Rtxfpv2iYxfPBSHbypwL68J+
         gNEg==
X-Gm-Message-State: AOJu0YxzuURsYMBFmCA2iEFPymxgJkSYDeg8Vx6cpSWu9QeZwGx0wQQv
	r628koKDHtakLrwn/yIE0ZgOoVi8gIoiYuTFgLvTiCXGf/XhJFvnzKd4HSUmg5v2dzpLjeANJGF
	lZSw=
X-Google-Smtp-Source: AGHT+IG61/F5ONI0k0FJTm+23+yClcR035t48vCY4szzixkKpIusBv5GONFhW4YDklSrdIh6ezZEbQ==
X-Received: by 2002:a05:6402:13c2:b0:57d:4f47:d9f7 with SMTP id 4fb4d7f45d1cf-5879c08e17emr11392257a12.0.1720016407812;
        Wed, 03 Jul 2024 07:20:07 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 1/4] CI: Formalise the use of heredocs
Date: Wed,  3 Jul 2024 15:19:59 +0100
Message-Id: <20240703142002.1662874-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
References: <20240703142002.1662874-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit b5739330d7f4 introduced the use of heredocs in the jessie/stretch
dockerfiles.

It turns out this was introduced by BuildKit in 2018 along with a
standardisation of Dockerfile syntax, and has subsequently been adopted by the
docker community.

Annotate all dockerfiles with a statement of the syntax in use, and extend
README.md details including how to activate BuildKit when it's available but
off by default.

This allows the containers to be rebuilt following commit a0e29b316363 ("CI:
Drop glibc-i386 from the build containers").

Fixes: b5739330d7f4 ("automation: fix jessie/stretch images to use archive.debian.org apt repos")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/build/README.md                             | 10 +++++++++-
 automation/build/alpine/3.18-arm64v8.dockerfile        |  1 +
 automation/build/alpine/3.18.dockerfile                |  1 +
 automation/build/archlinux/current-riscv64.dockerfile  |  1 +
 automation/build/archlinux/current.dockerfile          |  1 +
 automation/build/centos/7.dockerfile                   |  1 +
 .../build/debian/bookworm-arm64v8-arm32-gcc.dockerfile |  1 +
 automation/build/debian/bookworm-arm64v8.dockerfile    |  1 +
 automation/build/debian/bookworm-cppcheck.dockerfile   |  1 +
 automation/build/debian/bookworm-i386.dockerfile       |  1 +
 automation/build/debian/bookworm.dockerfile            |  1 +
 automation/build/debian/bullseye-ppc64le.dockerfile    |  1 +
 automation/build/debian/buster-gcc-ibt.dockerfile      |  1 +
 automation/build/debian/jessie-i386.dockerfile         |  1 +
 automation/build/debian/jessie.dockerfile              |  1 +
 automation/build/debian/stretch-i386.dockerfile        |  1 +
 automation/build/debian/stretch.dockerfile             |  1 +
 automation/build/fedora/29.dockerfile                  |  1 +
 automation/build/suse/opensuse-leap.dockerfile         |  1 +
 automation/build/suse/opensuse-tumbleweed.dockerfile   |  1 +
 automation/build/ubuntu/bionic.dockerfile              |  1 +
 automation/build/ubuntu/focal.dockerfile               |  1 +
 automation/build/ubuntu/trusty.dockerfile              |  1 +
 automation/build/ubuntu/xenial-xilinx.dockerfile       |  1 +
 automation/build/ubuntu/xenial.dockerfile              |  1 +
 automation/build/yocto/yocto.dockerfile.in             |  2 ++
 .../tests-artifacts/alpine/3.18-arm64v8.dockerfile     |  1 +
 automation/tests-artifacts/alpine/3.18.dockerfile      |  1 +
 .../tests-artifacts/kernel/5.19-arm64v8.dockerfile     |  1 +
 automation/tests-artifacts/kernel/6.1.19.dockerfile    |  1 +
 .../qemu-system-aarch64/6.0.0-arm64v8.dockerfile       |  1 +
 .../qemu-system-ppc64/8.1.0-ppc64.dockerfile           |  1 +
 32 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/automation/build/README.md b/automation/build/README.md
index 1c040533fdd8..12a2b4af1807 100644
--- a/automation/build/README.md
+++ b/automation/build/README.md
@@ -81,7 +81,14 @@ Building a container
 
 There is a makefile to make this process easier. You should be
 able to run `make DISTRO/VERSION` to have Docker build the container
-for you. If you define the `PUSH` environment variable when running the
+for you.
+
+Xen's dockerfiles use heredocs, which depend on the standardised dockerfile
+syntax introduced by [BuiltKit].  This should work by default starting with
+docker 23.0, or podman/buildah v1.33.  For older versions of docker, it can be
+activated with `DOCKER_BUILDKIT=1` in the environment.
+
+If you define the `PUSH` environment variable when running the
 former `make` command, it will push the container to the [registry] if
 you have access to do so and have your Docker logged into the registry.
 
@@ -101,6 +108,7 @@ env CONTAINER_NO_PULL=1 \
 make -C automation/build suse/opensuse-tumbleweed PUSH=1
 ```
 
+[BuildKit]: https://docs.docker.com/build/buildkit/
 [registry]: https://gitlab.com/xen-project/xen/container_registry
 [registry help]: https://gitlab.com/help/user/project/container_registry
 
diff --git a/automation/build/alpine/3.18-arm64v8.dockerfile b/automation/build/alpine/3.18-arm64v8.dockerfile
index 91e90220240f..19fe46f8418f 100644
--- a/automation/build/alpine/3.18-arm64v8.dockerfile
+++ b/automation/build/alpine/3.18-arm64v8.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/arm64/v8 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
index 8d5dac05b01f..263e9e90d888 100644
--- a/automation/build/alpine/3.18.dockerfile
+++ b/automation/build/alpine/3.18.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/archlinux/current-riscv64.dockerfile b/automation/build/archlinux/current-riscv64.dockerfile
index af75b5c720ce..f7770bf82a78 100644
--- a/automation/build/archlinux/current-riscv64.dockerfile
+++ b/automation/build/archlinux/current-riscv64.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 archlinux
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index d29f1358c2bd..8929e9b5f022 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 archlinux:base-devel
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index 1cdc16fc05f9..657550f308bb 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 centos:7
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile b/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
index a05ffeac04f9..95b3f0428372 100644
--- a/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
+++ b/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/arm64/v8 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/debian/bookworm-arm64v8.dockerfile b/automation/build/debian/bookworm-arm64v8.dockerfile
index 2c432aacb765..3ab426a082d3 100644
--- a/automation/build/debian/bookworm-arm64v8.dockerfile
+++ b/automation/build/debian/bookworm-arm64v8.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/arm64/v8 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/debian/bookworm-cppcheck.dockerfile b/automation/build/debian/bookworm-cppcheck.dockerfile
index 633268376d56..fe4cd4a1aaab 100644
--- a/automation/build/debian/bookworm-cppcheck.dockerfile
+++ b/automation/build/debian/bookworm-cppcheck.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/arm64/v8 debian:bookworm AS builder
 
 ENV DEBIAN_FRONTEND=noninteractive
diff --git a/automation/build/debian/bookworm-i386.dockerfile b/automation/build/debian/bookworm-i386.dockerfile
index 89a650338566..9a54bd7293dc 100644
--- a/automation/build/debian/bookworm-i386.dockerfile
+++ b/automation/build/debian/bookworm-i386.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/i386 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
index d893218fc4bd..bef44dd75300 100644
--- a/automation/build/debian/bookworm.dockerfile
+++ b/automation/build/debian/bookworm.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
index 6fdfb6bc2b40..e166d205f38c 100644
--- a/automation/build/debian/bullseye-ppc64le.dockerfile
+++ b/automation/build/debian/bullseye-ppc64le.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 debian:bullseye-slim
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/debian/buster-gcc-ibt.dockerfile b/automation/build/debian/buster-gcc-ibt.dockerfile
index 6a3e50ef6b3f..ed9367aafbec 100644
--- a/automation/build/debian/buster-gcc-ibt.dockerfile
+++ b/automation/build/debian/buster-gcc-ibt.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 debian:buster-slim AS builder
 
 ENV DEBIAN_FRONTEND=noninteractive
diff --git a/automation/build/debian/jessie-i386.dockerfile b/automation/build/debian/jessie-i386.dockerfile
index a8dec82bb299..f6eaa94ee523 100644
--- a/automation/build/debian/jessie-i386.dockerfile
+++ b/automation/build/debian/jessie-i386.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/i386 debian/eol:jessie
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 308675cac150..a870e743fcaf 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 debian/eol:jessie
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/debian/stretch-i386.dockerfile b/automation/build/debian/stretch-i386.dockerfile
index da93fed8ea68..ad8db692aaf2 100644
--- a/automation/build/debian/stretch-i386.dockerfile
+++ b/automation/build/debian/stretch-i386.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/i386 debian:stretch
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index 59794ed4677b..4dfd40b54277 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 debian:stretch
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
index f473ae13e7c1..08edf70838f9 100644
--- a/automation/build/fedora/29.dockerfile
+++ b/automation/build/fedora/29.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 fedora:29
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 3ef33458a07c..28d333881233 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 opensuse/leap
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index a793601c876d..077fed22260c 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 opensuse/tumbleweed
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index 910d3c4b5315..cc43fc4ade12 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 ubuntu:18.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index 078abd56d56f..cb8bb2f6faee 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 ubuntu:20.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index 8bd8c085a781..e2a1bda7c3a8 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 ubuntu:14.04
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/ubuntu/xenial-xilinx.dockerfile b/automation/build/ubuntu/xenial-xilinx.dockerfile
index 49f27b322995..f03d62e8bd3f 100644
--- a/automation/build/ubuntu/xenial-xilinx.dockerfile
+++ b/automation/build/ubuntu/xenial-xilinx.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 ubuntu:16.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
index f6296d32925c..168bc70ffad8 100644
--- a/automation/build/ubuntu/xenial.dockerfile
+++ b/automation/build/ubuntu/xenial.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 ubuntu:16.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/build/yocto/yocto.dockerfile.in b/automation/build/yocto/yocto.dockerfile.in
index b0892d420377..fbaa4e191caa 100644
--- a/automation/build/yocto/yocto.dockerfile.in
+++ b/automation/build/yocto/yocto.dockerfile.in
@@ -1,3 +1,5 @@
+# syntax=docker/dockerfile:1
+
 # Docker file to create an environment to build yocto with virtualization
 #
 # Arguments that can be passed during image creation using --build-arg:
diff --git a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
index 0e5ae7f2b4d8..a4542f703997 100644
--- a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/arm64/v8 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
index 9cde6c9ad4da..311a92889b87 100644
--- a/automation/tests-artifacts/alpine/3.18.dockerfile
+++ b/automation/tests-artifacts/alpine/3.18.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
index b0875ca0ddd1..22359c906630 100644
--- a/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
+++ b/automation/tests-artifacts/kernel/5.19-arm64v8.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/arm64/v8 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/tests-artifacts/kernel/6.1.19.dockerfile b/automation/tests-artifacts/kernel/6.1.19.dockerfile
index 021bde26c790..5cf53d290c6f 100644
--- a/automation/tests-artifacts/kernel/6.1.19.dockerfile
+++ b/automation/tests-artifacts/kernel/6.1.19.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile b/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
index fb7b7b506e94..e9f5576be7a6 100644
--- a/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
+++ b/automation/tests-artifacts/qemu-system-aarch64/6.0.0-arm64v8.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/arm64/v8 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
diff --git a/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile b/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
index 65857147bf4f..e28d68649239 100644
--- a/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
+++ b/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
@@ -1,3 +1,4 @@
+# syntax=docker/dockerfile:1
 FROM --platform=linux/amd64 debian:bullseye-slim
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
-- 
2.39.2


