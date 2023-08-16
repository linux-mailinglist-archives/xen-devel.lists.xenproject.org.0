Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B7B77DED0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584511.915421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpF-0007bt-TZ; Wed, 16 Aug 2023 10:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584511.915421; Wed, 16 Aug 2023 10:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpF-0007Iy-2S; Wed, 16 Aug 2023 10:32:29 +0000
Received: by outflank-mailman (input) for mailman id 584511;
 Wed, 16 Aug 2023 10:32:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDeH-0003R9-Ln
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:09 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 99ba0360-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:21:02 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-31972944f30so2802478f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:21:02 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.21.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:21:01 -0700 (PDT)
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
X-Inumbo-ID: 99ba0360-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181261; x=1692786061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRYz4a+r1jBecXHkDnckEiKNtokDBe/brUZr7KBy8rU=;
        b=ELqhJ+0W4oTx7lv2OlBtiYcxZvy3cR3ZyVWr9pVar3iUO+eM6Dr5yLkps1RQdRFiOr
         HNQ8x0NCK6OmKYwpCUeB93g9AhAYm5YRTK0Nzs8nuA5K2Anppyi0X+ta3ouIunJcwt5+
         qo0peqg+Xj0V/b4+NLsa8aOAay7VbBy+kKuFrkmAzyPiBL7lkTbpfqGX0s2vPhcIIA7c
         Wa5ta8yVQr3/AR8Xycn/C1aI+znVVsyTwkG9rtK0w9zvZJYY8QHw3ouIkhOiXkV12Ali
         lxqicz5yWOoiuXyNxNPTTTTpQ1ydRC4NnyykD1xBZdSaZ7/ps5VzMhvPhgWpw+STOE0P
         fEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181261; x=1692786061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRYz4a+r1jBecXHkDnckEiKNtokDBe/brUZr7KBy8rU=;
        b=M/IEtuSAkFIjvOLwMTssIU+WJp1frwcv4FYcVHa8HbAiTH13EBP1bsqrvpFralB4xD
         k7IOTAiv8/qcfNW3THXYMhD21/PtpGIKWA8e7XqVlLGGJUUN+V8udl1Ls6Imwac284fT
         xxRXsktk0gyWgPtp2dFbXylW9o1MbZXxZHVXNT1llJqOcrbnSOLQMTSK0wkRQi/st9CW
         qhujrCqG3N2rre7NeBwZkUEwfxoHM6GXQ0l/wwXpyCSz1bs8M5PmZaGUNR81rSmjRigt
         XsdzMmFNmbKpyqvjCyo7i8klXeZNg+nv0S6mAizlM8ZF4cKx2mpmtU1UWRiSplNgyBUa
         4U4g==
X-Gm-Message-State: AOJu0YyTD2mGQG4jI4q3+nyz6FkpZNm4wNpUvY9SvZf7Gyu98fSpUwD7
	ZEBmPKjO/DXh3z3kIpvomMopEee2EzSALK3q
X-Google-Smtp-Source: AGHT+IGuItZTgfXAPZ9uIQroIu7vFyaTZ/FFI1TTI8T42hpAndWvtAy2kipfHoKlu2f6ba33ke01Fw==
X-Received: by 2002:a5d:5651:0:b0:314:336e:d4d8 with SMTP id j17-20020a5d5651000000b00314336ed4d8mr1097858wrw.8.1692181261354;
        Wed, 16 Aug 2023 03:21:01 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v1 56/57] test only riscv
Date: Wed, 16 Aug 2023 13:20:09 +0300
Message-ID: <c78a33df6ad9e4b448976fa224d143696d849da0.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/gitlab-ci/analyze.yaml |  16 -
 automation/gitlab-ci/build.yaml   | 544 ------------------------------
 automation/gitlab-ci/test.yaml    | 308 -----------------
 3 files changed, 868 deletions(-)

diff --git a/automation/gitlab-ci/analyze.yaml b/automation/gitlab-ci/analyze.yaml
index 4aa4abe2ee..89cef96771 100644
--- a/automation/gitlab-ci/analyze.yaml
+++ b/automation/gitlab-ci/analyze.yaml
@@ -20,22 +20,6 @@
       codequality: gl-code-quality-report.json
   needs: []
 
-eclair-x86_64:
-  extends: .eclair-analysis
-  variables:
-    LOGFILE: "eclair-x86_64.log"
-    VARIANT: "X86_64"
-    RULESET: "Set1"
-  allow_failure: true
-
-eclair-ARM64:
-  extends: .eclair-analysis
-  variables:
-    LOGFILE: "eclair-ARM64.log"
-    VARIANT: "ARM64"
-    RULESET: "Set1"
-  allow_failure: true
-
 .eclair-analysis:on-schedule:
   extends: .eclair-analysis
   rules:
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 173613567c..210f7da264 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -271,247 +271,6 @@
   needs: []
   except: !reference [.test-jobs-common, except]
 
-# Arm test artifacts
-
-alpine-3.18-arm64-rootfs-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18-arm64v8
-  script:
-    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
-  artifacts:
-    paths:
-      - binaries/initrd.tar.gz
-  tags:
-    - arm64
-
-kernel-5.19-arm64-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.19-arm64v8
-  script:
-    - mkdir binaries && cp /Image binaries/Image
-  artifacts:
-    paths:
-      - binaries/Image
-  tags:
-    - arm64
-
-qemu-system-aarch64-6.0.0-arm64-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
-  script:
-    - mkdir binaries && cp /qemu-system-aarch64 binaries/qemu-system-aarch64
-  artifacts:
-    paths:
-      - binaries/qemu-system-aarch64
-  tags:
-    - arm64
-
-qemu-system-aarch64-6.0.0-arm32-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
-  script:
-    - mkdir binaries && cp /qemu-system-arm binaries/qemu-system-arm
-  artifacts:
-    paths:
-      - binaries/qemu-system-arm
-  tags:
-    - arm64
-
-# x86_64 test artifacts
-
-alpine-3.18-rootfs-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18
-  script:
-    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
-  artifacts:
-    paths:
-      - binaries/initrd.tar.gz
-  tags:
-    - x86_64
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
-# Jobs below this line
-
-# Build jobs needed for tests
-
-alpine-3.18-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: alpine:3.18
-
-alpine-3.18-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: alpine:3.18
-
-debian-stretch-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: debian:stretch
-
-debian-unstable-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: debian:unstable
-
-# Arm32 cross-build
-
-debian-unstable-gcc-arm32:
-  extends: .gcc-arm32-cross-build
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-
-debian-unstable-gcc-arm32-debug:
-  extends: .gcc-arm32-cross-build-debug
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-
-debian-unstable-gcc-arm32-randconfig:
-  extends: .gcc-arm32-cross-build
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-    RANDCONFIG: y
-
-debian-unstable-gcc-arm32-debug-randconfig:
-  extends: .gcc-arm32-cross-build-debug
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-    RANDCONFIG: y
-
-debian-unstable-gcc-arm32-staticmem:
-  extends: .gcc-arm32-cross-build
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-    EXTRA_XEN_CONFIG: |
-      CONFIG_EXPERT=y
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-
-debian-unstable-gcc-arm32-debug-staticmem:
-  extends: .gcc-arm32-cross-build-debug
-  variables:
-    CONTAINER: debian:unstable-arm64v8-arm32-gcc
-    HYPERVISOR_ONLY: y
-    EXTRA_XEN_CONFIG: |
-      CONFIG_EXPERT=y
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-
-# Arm builds
-
-debian-unstable-gcc-arm64:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: debian:unstable-arm64v8
-
-debian-unstable-gcc-debug-arm64:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: debian:unstable-arm64v8
-
-debian-unstable-gcc-arm64-randconfig:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: debian:unstable-arm64v8
-    RANDCONFIG: y
-
-debian-unstable-gcc-debug-arm64-randconfig:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: debian:unstable-arm64v8
-    RANDCONFIG: y
-
-alpine-3.18-gcc-arm64:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-
-alpine-3.18-gcc-debug-arm64:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-
-alpine-3.18-gcc-arm64-randconfig:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    RANDCONFIG: y
-
-alpine-3.18-gcc-debug-arm64-randconfig:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    RANDCONFIG: y
-
-alpine-3.18-gcc-arm64-staticmem:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    EXTRA_XEN_CONFIG: |
-      CONFIG_EXPERT=y
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-
-alpine-3.18-gcc-debug-arm64-staticmem:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    EXTRA_XEN_CONFIG: |
-      CONFIG_EXPERT=y
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-
-alpine-3.18-gcc-arm64-static-shared-mem:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    EXTRA_XEN_CONFIG: |
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-      CONFIG_STATIC_SHM=y
-
-alpine-3.18-gcc-debug-arm64-static-shared-mem:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    EXTRA_XEN_CONFIG: |
-      CONFIG_UNSUPPORTED=y
-      CONFIG_STATIC_MEMORY=y
-      CONFIG_STATIC_SHM=y
-
-alpine-3.18-gcc-arm64-boot-cpupools:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    EXTRA_XEN_CONFIG: |
-      CONFIG_EXPERT=y
-      CONFIG_UNSUPPORTED=y
-      CONFIG_SCHED_NULL=y
-      CONFIG_BOOT_TIME_CPUPOOLS=y
-
-alpine-3.18-gcc-debug-arm64-boot-cpupools:
-  extends: .gcc-arm64-build-debug
-  variables:
-    CONTAINER: alpine:3.18-arm64v8
-    EXTRA_XEN_CONFIG: |
-      CONFIG_BOOT_TIME_CPUPOOLS=y
-
 # RISC-V 64 cross-build
 archlinux-current-gcc-riscv64:
   extends: .gcc-riscv64-cross-build
@@ -544,306 +303,3 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     RANDCONFIG: y
     EXTRA_FIXED_RANDCONFIG:
       CONFIG_COVERAGE=n
-
-# Power cross-build
-debian-bullseye-gcc-ppc64le:
-  extends: .gcc-ppc64le-cross-build
-  variables:
-    CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: ppc64_defconfig
-    HYPERVISOR_ONLY: y
-
-debian-bullseye-gcc-ppc64le-debug:
-  extends: .gcc-ppc64le-cross-build-debug
-  variables:
-    CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: ppc64_defconfig
-    HYPERVISOR_ONLY: y
-
-debian-bullseye-gcc-ppc64le-randconfig:
-  extends: .gcc-ppc64le-cross-build
-  variables:
-    CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: ppc64_defconfig
-    RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
-
-debian-bullseye-gcc-ppc64le-debug-randconfig:
-  extends: .gcc-ppc64le-cross-build-debug
-  variables:
-    CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: ppc64_defconfig
-    RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
-
-# Yocto test jobs
-yocto-qemuarm64:
-  extends: .yocto-test-arm64
-  variables:
-    YOCTO_BOARD: qemuarm64
-
-yocto-qemuarm:
-  extends: .yocto-test-arm64
-  variables:
-    YOCTO_BOARD: qemuarm
-    YOCTO_OUTPUT: --copy-output
-
-yocto-qemux86-64:
-  extends: .yocto-test-arm64
-  variables:
-    YOCTO_BOARD: qemux86-64
-
-# Cppcheck analysis jobs
-
-debian-unstable-gcc-cppcheck:
-  extends: .gcc-x86-64-cross-build
-  variables:
-    CONTAINER: debian:unstable-cppcheck
-    CROSS_COMPILE: /usr/bin/x86_64-linux-gnu-
-    CPPCHECK: y
-    HYPERVISOR_ONLY: y
-
-debian-unstable-gcc-arm32-cppcheck:
-  extends: .gcc-arm32-cross-build
-  variables:
-    CONTAINER: debian:unstable-cppcheck
-    CROSS_COMPILE: /usr/bin/arm-linux-gnueabihf-
-    CPPCHECK: y
-    HYPERVISOR_ONLY: y
-
-debian-unstable-gcc-arm64-cppcheck:
-  extends: .gcc-arm64-build
-  variables:
-    CONTAINER: debian:unstable-cppcheck
-    CPPCHECK: y
-    HYPERVISOR_ONLY: y
-
-# Build jobs not needed for tests
-
-alpine-3.18-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: alpine:3.18
-
-alpine-3.18-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: alpine:3.18
-
-archlinux-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: archlinux:current
-
-archlinux-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: archlinux:current
-
-centos-7-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: centos:7
-
-centos-7-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: centos:7
-
-debian-stretch-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: debian:stretch
-
-debian-stretch-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: debian:stretch
-
-debian-stretch-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: debian:stretch
-
-debian-stretch-32-clang-debug:
-  extends: .clang-x86-32-build-debug
-  variables:
-    CONTAINER: debian:stretch-i386
-
-debian-stretch-32-gcc-debug:
-  extends: .gcc-x86-32-build-debug
-  variables:
-    CONTAINER: debian:stretch-i386
-
-debian-buster-gcc-ibt:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: debian:buster-gcc-ibt
-    RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG: |
-      CONFIG_XEN_IBT=y
-
-debian-unstable-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: debian:unstable
-
-debian-unstable-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: debian:unstable
-
-debian-unstable-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: debian:unstable
-
-debian-unstable-gcc-randconfig:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: debian:unstable
-    RANDCONFIG: y
-
-debian-unstable-gcc-debug-randconfig:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: debian:unstable
-    RANDCONFIG: y
-
-debian-unstable-32-clang-debug:
-  extends: .clang-x86-32-build-debug
-  variables:
-    CONTAINER: debian:unstable-i386
-
-debian-unstable-32-gcc-debug:
-  extends: .gcc-x86-32-build-debug
-  variables:
-    CONTAINER: debian:unstable-i386
-
-fedora-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: fedora:29
-
-fedora-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: fedora:29
-
-# Ubuntu Trusty's Clang is 3.4 while Xen requires 3.5
-
-ubuntu-trusty-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: ubuntu:trusty
-
-ubuntu-trusty-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:trusty
-
-ubuntu-xenial-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: ubuntu:xenial
-
-ubuntu-xenial-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:xenial
-
-ubuntu-xenial-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: ubuntu:xenial
-
-ubuntu-xenial-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:xenial
-
-ubuntu-bionic-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: ubuntu:bionic
-
-ubuntu-bionic-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:bionic
-
-ubuntu-bionic-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: ubuntu:bionic
-
-ubuntu-bionic-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:bionic
-
-ubuntu-focal-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: ubuntu:focal
-
-ubuntu-focal-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:focal
-
-ubuntu-focal-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: ubuntu:focal
-
-ubuntu-focal-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:focal
-
-opensuse-leap-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: suse:opensuse-leap
-
-opensuse-leap-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: suse:opensuse-leap
-
-opensuse-leap-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: suse:opensuse-leap
-
-opensuse-leap-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: suse:opensuse-leap
-
-opensuse-tumbleweed-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: suse:opensuse-tumbleweed
-  allow_failure: true
-
-opensuse-tumbleweed-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: suse:opensuse-tumbleweed
-  allow_failure: true
-
-opensuse-tumbleweed-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: suse:opensuse-tumbleweed
-  allow_failure: true
-
-opensuse-tumbleweed-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: suse:opensuse-tumbleweed
-  allow_failure: true
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 8ccce1fe26..869fe8cd9f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -149,308 +149,6 @@ build-each-commit-gcc:
   tags:
     - x86_64
 
-xilinx-smoke-dom0less-arm64-gcc:
-  extends: .xilinx-arm64
-  script:
-    - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
-
-xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
-  extends: .xilinx-arm64
-  script:
-    - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh gem-passthrough 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
-
-adl-smoke-x86-64-gcc-debug:
-  extends: .adl-x86-64
-  script:
-    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
-
-adl-smoke-x86-64-dom0pvh-gcc-debug:
-  extends: .adl-x86-64
-  script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
-
-adl-suspend-x86-64-gcc-debug:
-  extends: .adl-x86-64
-  script:
-    - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
-  needs:
-    - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
-
-adl-pci-pv-x86-64-gcc-debug:
-  extends: .adl-x86-64
-  script:
-    - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
-  needs:
-    - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
-
-adl-pci-hvm-x86-64-gcc-debug:
-  extends: .adl-x86-64
-  variables:
-    PCIDEV_INTR: "MSI"
-  script:
-    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
-  needs:
-    - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
-
-zen3p-smoke-x86-64-gcc-debug:
-  extends: .zen3p-x86-64
-  script:
-    - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
-
-zen3p-smoke-x86-64-dom0pvh-gcc-debug:
-  extends: .zen3p-x86-64
-  script:
-    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
-
-zen3p-pci-hvm-x86-64-gcc-debug:
-  extends: .zen3p-x86-64
-  script:
-    - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
-  needs:
-    - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
-
-qemu-smoke-dom0-arm64-gcc:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
-
-qemu-smoke-dom0-arm64-gcc-debug:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64
-
-qemu-smoke-dom0less-arm64-gcc:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
-
-qemu-smoke-dom0less-arm64-gcc-debug:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64
-
-qemu-smoke-dom0less-arm64-gcc-staticmem:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-arm64-staticmem
-
-qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64-staticmem
-
-qemu-smoke-dom0less-arm64-gcc-staticheap:
- extends: .qemu-arm64
- script:
-   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
- needs:
-   - *arm64-test-needs
-   - alpine-3.18-gcc-arm64
-
-qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
- extends: .qemu-arm64
- script:
-   - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
- needs:
-   - *arm64-test-needs
-   - alpine-3.18-gcc-debug-arm64
-
-qemu-smoke-dom0less-arm64-gcc-static-shared-mem:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-arm64-static-shared-mem
-
-qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64-static-shared-mem
-
-qemu-smoke-dom0less-arm64-gcc-boot-cpupools:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-arm64-boot-cpupools
-
-qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64-boot-cpupools
-
-qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
-  needs:
-    - alpine-3.18-gcc-arm64
-    - qemu-system-aarch64-6.0.0-arm64-export
-
-qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
-  extends: .qemu-arm64
-  script:
-    - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
-  needs:
-    - alpine-3.18-gcc-debug-arm64
-    - qemu-system-aarch64-6.0.0-arm64-export
-
-qemu-smoke-dom0-arm32-gcc:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0-arm32.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - yocto-qemuarm
-
-qemu-smoke-dom0less-arm32-gcc:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - debian-unstable-gcc-arm32
-
-qemu-smoke-dom0less-arm32-gcc-debug:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - debian-unstable-gcc-arm32-debug
-
-qemu-smoke-dom0less-arm32-gcc-staticmem:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - debian-unstable-gcc-arm32-staticmem
-
-qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - debian-unstable-gcc-arm32-debug-staticmem
-
-qemu-smoke-dom0less-arm32-gcc-gzip:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - debian-unstable-gcc-arm32
-
-qemu-smoke-dom0less-arm32-gcc-debug-gzip:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - debian-unstable-gcc-arm32-debug
-
-qemu-smoke-dom0less-arm32-gcc-without-dom0:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - debian-unstable-gcc-arm32
-
-qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
-  extends: .qemu-arm32
-  script:
-    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
-  needs:
-    - *arm32-test-needs
-    - debian-unstable-gcc-arm32-debug
-
-qemu-alpine-x86_64-gcc:
-  extends: .qemu-x86-64
-  script:
-    - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee ${LOGFILE}
-  needs:
-    - *x86-64-test-needs
-    - alpine-3.18-gcc
-
-qemu-smoke-x86-64-gcc:
-  extends: .qemu-x86-64
-  script:
-    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
-  needs:
-    - debian-stretch-gcc-debug
-
-qemu-smoke-x86-64-clang:
-  extends: .qemu-x86-64
-  script:
-    - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
-  needs:
-    - debian-unstable-clang-debug
-
-qemu-smoke-x86-64-gcc-pvh:
-  extends: .qemu-x86-64
-  script:
-    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
-  needs:
-    - debian-stretch-gcc-debug
-
-qemu-smoke-x86-64-clang-pvh:
-  extends: .qemu-x86-64
-  script:
-    - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
-  needs:
-    - debian-unstable-clang-debug
-
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
   script:
@@ -458,9 +156,3 @@ qemu-smoke-riscv64-gcc:
   needs:
     - archlinux-current-gcc-riscv64-debug
 
-qemu-smoke-ppc64le-pseries-gcc:
-  extends: .qemu-ppc64le
-  script:
-    - ./automation/scripts/qemu-smoke-ppc64le.sh pseries-5.2 2>&1 | tee ${LOGFILE}
-  needs:
-    - debian-bullseye-gcc-ppc64le-debug
-- 
2.41.0


