Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2576A8825
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 18:54:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505299.778014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7l-0000N6-Lc; Thu, 02 Mar 2023 17:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505299.778014; Thu, 02 Mar 2023 17:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7l-0000C6-Fe; Thu, 02 Mar 2023 17:53:49 +0000
Received: by outflank-mailman (input) for mailman id 505299;
 Thu, 02 Mar 2023 17:53:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPDg=62=citrix.com=prvs=418368d91=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pXn7j-00086w-IU
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 17:53:47 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cb47d8d-b923-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 18:53:45 +0100 (CET)
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
X-Inumbo-ID: 2cb47d8d-b923-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677779625;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5MNo1ps8O2O0aeLQiXGpyjU3jhCbvyS2iGWQkujCObw=;
  b=Ypta3oKZqs32cHavA+kXrbFJgcK10POplzP2LQeKkQ0iTVRb+V0dgw2S
   AOFF02FcuCr0lt0DwdRxSReKZcSRGslIRbRaol6ZlzYeyJ7RVVFXW/qAb
   j8XWswznmo7XEFB2zSile8ccySKj4GOulfdUu4H3A6K1HgCv3AWAB6q6Q
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 99135360
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Ywu3D6MFXMM7GF7vrR2+l8FynXyQoLVcMsEvi/4bfWQNrUolhjBWx
 zEcXGyBbv7ZN2Pze4t1aoq18x9UsZTTyNdmHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5gZmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0ulrAFoJ7
 +ckEh4IMhqlpvqb5+ujZfY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3bHJ4IxRjAz
 o7A10/zXj1KJeSH8yi61X2W2+bgghjnWLtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFaPtwQQXNd4GOQg5AaAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRSXKa9ECzHsO3O9HXrZHZTdDVZDcMZcecby9b/obp0lAnzdPhmTKSTr8XYPmjo7
 C/f+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJ2+nHYo62xlgnPdD4PuRE/XCetK8dd9jBEjFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm8zb67omhezO
 ic/XD+9A7cCVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOgD+zwRV8yfhmZ
 cbznSOQ4ZEyU/kP8dZLb71Fje9DKt4Wngs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iFy9z
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6SKneh6ItQ7xvU9eyWh1
 ijVZ3K0AWHX3RXvQThmoFg5AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:+aSsLaHsmK+8UxhYpLqE5seALOsnbusQ8zAXPiFKJSC9F/byqy
 nAppsmPHPP5gr5OktBpTnwAsi9qBrnnPYejLX5Vo3SPzUO1lHYSb1K3M/PxCDhBj271sM179
 YFT0GmMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.98,228,1673931600"; 
   d="scan'208";a="99135360"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 4/7] automation: Adding containers build jobs and test of thoses
Date: Thu, 2 Mar 2023 17:53:29 +0000
Message-ID: <20230302175332.56052-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230302175332.56052-1-anthony.perard@citrix.com>
References: <20230302175332.56052-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For the test-containers jobs, mostly copy from "build.yaml", rename
'.container-*-tmpl' templates to '.container-*-testtmpl', prefix build
jobs with "test-", add BUILD_CONTAINER and "needs" to container
template.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    WARNING: This is an incomplete list of the containers that can be
    rebuilt and tested.

 automation/gitlab-ci/containers.yaml      |  74 ++++++-
 automation/gitlab-ci/test-containers.yaml | 257 ++++++++++++++++++++++
 2 files changed, 330 insertions(+), 1 deletion(-)

diff --git a/automation/gitlab-ci/containers.yaml b/automation/gitlab-ci/containers.yaml
index ace93eaccf..a6d61980b1 100644
--- a/automation/gitlab-ci/containers.yaml
+++ b/automation/gitlab-ci/containers.yaml
@@ -18,8 +18,80 @@
   after_script:
     - docker logout
 
-debian-unstable-container:
+archlinux-current-container:
+  variables:
+    BUILD_CONTAINER: archlinux/current
+  extends:
+    - .container-build-tmpl
+
+centos-7-2-container:
+  variables:
+    BUILD_CONTAINER: centos/7.2
+  extends:
+    - .container-build-tmpl
+
+centos-7-container:
+  variables:
+    BUILD_CONTAINER: centos/7
+  extends:
+    - .container-build-tmpl
+
+debian-jessie-container:
+  variables:
+    BUILD_CONTAINER: debian/jessie
+  extends:
+    - .container-build-tmpl
+
+debian-jessie-32-container:
+  variables:
+    BUILD_CONTAINER: debian/jessie-i386
+  extends:
+    - .container-build-tmpl
+
+debian-stretch-container:
+  variables:
+    BUILD_CONTAINER: debian/stretch
+  extends:
+    - .container-build-tmpl
+
+debian-stretch-32-container:
+  variables:
+    BUILD_CONTAINER: debian/stretch-i386
   extends:
     - .container-build-tmpl
+
+debian-unstable-container:
   variables:
     BUILD_CONTAINER: debian/unstable
+  extends:
+    - .container-build-tmpl
+
+debian-unstable-32-container:
+  variables:
+    BUILD_CONTAINER: debian/unstable-i386
+  extends:
+    - .container-build-tmpl
+
+ubuntu-trusty-container:
+  variables:
+    BUILD_CONTAINER: ubuntu/trusty
+  extends:
+    - .container-build-tmpl
+
+ubuntu-xenial-container:
+  variables:
+    BUILD_CONTAINER: ubuntu/xenial
+  extends:
+    - .container-build-tmpl
+
+ubuntu-bionic-container:
+  variables:
+    BUILD_CONTAINER: ubuntu/bionic
+  extends:
+    - .container-build-tmpl
+
+ubuntu-focal-container:
+  variables:
+    BUILD_CONTAINER: ubuntu/focal
+  extends:
+    - .container-build-tmpl
diff --git a/automation/gitlab-ci/test-containers.yaml b/automation/gitlab-ci/test-containers.yaml
index 5dbf3902ff..4d5c6ba364 100644
--- a/automation/gitlab-ci/test-containers.yaml
+++ b/automation/gitlab-ci/test-containers.yaml
@@ -197,6 +197,148 @@
 
 # Jobs below this line
 
+.container-archlinux-testtmpl:
+  variables:
+    CONTAINER: archlinux:current
+    BUILD_CONTAINER: archlinux/current
+  needs:
+    - archlinux-current-container
+
+test-archlinux-gcc:
+  extends:
+    - .gcc-x86-64-testbuild
+    - .container-archlinux-testtmpl
+
+test-archlinux-gcc-debug:
+  extends:
+    - .gcc-x86-64-testbuild-debug
+    - .container-archlinux-testtmpl
+
+.container-centos-7-testtmpl:
+  variables:
+    CONTAINER: centos:7
+    BUILD_CONTAINER: centos/7
+  needs:
+    - centos-7-container
+
+test-centos-7-gcc:
+  extends:
+    - .gcc-x86-64-testbuild
+    - .container-centos-7-testtmpl
+
+test-centos-7-gcc-debug:
+  extends:
+    - .gcc-x86-64-testbuild-debug
+    - .container-centos-7-testtmpl
+
+.container-debian-jessie-testtmpl:
+  variables:
+    CONTAINER: debian:jessie
+    BUILD_CONTAINER: debian/jessie
+  needs:
+    - debian-jessie-container
+
+test-debian-jessie-clang:
+  extends:
+    - .clang-x86-64-testbuild
+    - .container-debian-jessie-testtmpl
+
+test-debian-jessie-clang-debug:
+  extends:
+    - .clang-x86-64-testbuild-debug
+    - .container-debian-jessie-testtmpl
+
+test-debian-jessie-gcc:
+  extends:
+    - .gcc-x86-64-testbuild
+    - .container-debian-jessie-testtmpl
+
+test-debian-jessie-gcc-debug:
+  extends:
+    - .gcc-x86-64-testbuild-debug
+    - .container-debian-jessie-testtmpl
+
+.container-debian-32-jessie-testtmpl:
+  variables:
+    CONTAINER: debian:jessie-i386
+    BUILD_CONTAINER: debian/jessie-i386
+  needs:
+    - debian-jessie-32-container
+
+test-debian-jessie-32-clang:
+  extends:
+    - .clang-x86-32-testbuild
+    - .container-debian-32-jessie-testtmpl
+
+test-debian-jessie-32-clang-debug:
+  extends:
+    - .clang-x86-32-testbuild-debug
+    - .container-debian-32-jessie-testtmpl
+
+test-debian-jessie-32-gcc:
+  extends:
+    - .gcc-x86-32-testbuild
+    - .container-debian-32-jessie-testtmpl
+
+test-debian-jessie-32-gcc-debug:
+  extends:
+    - .gcc-x86-32-testbuild-debug
+    - .container-debian-32-jessie-testtmpl
+
+.container-debian-stretch-testtmpl:
+  variables:
+    CONTAINER: debian:stretch
+    BUILD_CONTAINER: debian/stretch
+  needs:
+    - debian-stretch-container
+
+test-debian-stretch-clang:
+  extends:
+    - .clang-x86-64-testbuild
+    - .container-debian-stretch-testtmpl
+
+test-debian-stretch-clang-debug:
+  extends:
+    - .clang-x86-64-testbuild-debug
+    - .container-debian-stretch-testtmpl
+
+test-debian-stretch-clang-8:
+  extends:
+    - .clang-8-x86-64-testbuild
+    - .container-debian-stretch-testtmpl
+
+test-debian-stretch-clang-8-debug:
+  extends:
+    - .clang-8-x86-64-testbuild-debug
+    - .container-debian-stretch-testtmpl
+
+test-debian-stretch-gcc:
+  extends:
+    - .gcc-x86-64-testbuild
+    - .container-debian-stretch-testtmpl
+
+test-debian-stretch-gcc-debug:
+  extends:
+    - .gcc-x86-64-testbuild-debug
+    - .container-debian-stretch-testtmpl
+
+.container-debian-stretch-32-testtmpl:
+  variables:
+    CONTAINER: debian:stretch-i386
+    BUILD_CONTAINER: debian/stretch-i386
+  needs:
+    - debian-stretch-32-container
+
+test-debian-stretch-32-clang-debug:
+  extends:
+    - .clang-x86-32-testbuild-debug
+    - .container-debian-stretch-32-testtmpl
+
+test-debian-stretch-32-gcc-debug:
+  extends:
+    - .gcc-x86-32-testbuild-debug
+    - .container-debian-stretch-32-testtmpl
+
 .container-debian-unstable-testtmpl:
   variables:
     CONTAINER: debian:unstable
@@ -237,3 +379,118 @@ test-debian-unstable-gcc-debug-randconfig:
     - .container-debian-unstable-testtmpl
   variables:
     RANDCONFIG: y
+
+.container-debian-unstable-32-testtmpl:
+  variables:
+    CONTAINER: debian:unstable-i386
+    BUILD_CONTAINER: debian/unstable-i386
+  needs:
+    - debian-unstable-32-container
+
+test-debian-unstable-32-clang-debug:
+  extends:
+    - .clang-x86-32-testbuild-debug
+    - .container-debian-unstable-32-testtmpl
+
+test-debian-unstable-32-gcc-debug:
+  extends:
+    - .gcc-x86-32-testbuild-debug
+    - .container-debian-unstable-32-testtmpl
+
+.container-ubuntu-trusty-testtmpl:
+  variables:
+    CONTAINER: ubuntu:trusty
+    BUILD_CONTAINER: ubuntu/trusty
+  needs:
+    - ubuntu-trusty-container
+
+test-ubuntu-trusty-gcc:
+  extends:
+    - .gcc-x86-64-testbuild
+    - .container-ubuntu-trusty-testtmpl
+
+test-ubuntu-trusty-gcc-debug:
+  extends:
+    - .gcc-x86-64-testbuild-debug
+    - .container-ubuntu-trusty-testtmpl
+
+.container-ubuntu-xenial-testtmpl:
+  variables:
+    CONTAINER: ubuntu:xenial
+    BUILD_CONTAINER: ubuntu/xenial
+  needs:
+    - ubuntu-xenial-container
+
+test-ubuntu-xenial-clang:
+  extends:
+    - .clang-x86-64-testbuild
+    - .container-ubuntu-xenial-testtmpl
+
+test-ubuntu-xenial-clang-debug:
+  extends:
+    - .clang-x86-64-testbuild-debug
+    - .container-ubuntu-xenial-testtmpl
+
+test-ubuntu-xenial-gcc:
+  extends:
+    - .gcc-x86-64-testbuild
+    - .container-ubuntu-xenial-testtmpl
+
+test-ubuntu-xenial-gcc-debug:
+  extends:
+    - .gcc-x86-64-testbuild-debug
+    - .container-ubuntu-xenial-testtmpl
+
+.container-ubuntu-bionic-testtmpl:
+  variables:
+    CONTAINER: ubuntu:bionic
+    BUILD_CONTAINER: ubuntu/bionic
+  needs:
+    - ubuntu-bionic-container
+
+test-ubuntu-bionic-clang:
+  extends:
+    - .clang-x86-64-testbuild
+    - .container-ubuntu-bionic-testtmpl
+
+test-ubuntu-bionic-clang-debug:
+  extends:
+    - .clang-x86-64-testbuild-debug
+    - .container-ubuntu-bionic-testtmpl
+
+test-ubuntu-bionic-gcc:
+  extends:
+    - .gcc-x86-64-testbuild
+    - .container-ubuntu-bionic-testtmpl
+
+test-ubuntu-bionic-gcc-debug:
+  extends:
+    - .gcc-x86-64-testbuild-debug
+    - .container-ubuntu-bionic-testtmpl
+
+.container-ubuntu-focal-testtmpl:
+  variables:
+    CONTAINER: ubuntu:focal
+    BUILD_CONTAINER: ubuntu/focal
+  needs:
+    - ubuntu-focal-container
+
+test-ubuntu-focal-gcc:
+  extends:
+    - .gcc-x86-64-testbuild
+    - .container-ubuntu-focal-testtmpl
+
+test-ubuntu-focal-gcc-debug:
+  extends:
+    - .gcc-x86-64-testbuild-debug
+    - .container-ubuntu-focal-testtmpl
+
+test-ubuntu-focal-clang:
+  extends:
+    - .clang-x86-64-testbuild
+    - .container-ubuntu-focal-testtmpl
+
+test-ubuntu-focal-clang-debug:
+  extends:
+    - .clang-x86-64-testbuild-debug
+    - .container-ubuntu-focal-testtmpl
-- 
Anthony PERARD


