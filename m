Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB706A8828
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 18:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505296.777991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7k-0008PQ-Gf; Thu, 02 Mar 2023 17:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505296.777991; Thu, 02 Mar 2023 17:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7k-0008MN-DB; Thu, 02 Mar 2023 17:53:48 +0000
Received: by outflank-mailman (input) for mailman id 505296;
 Thu, 02 Mar 2023 17:53:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPDg=62=citrix.com=prvs=418368d91=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pXn7i-00086w-IU
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 17:53:46 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bc319f9-b923-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 18:53:44 +0100 (CET)
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
X-Inumbo-ID: 2bc319f9-b923-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677779624;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mVBiVBPMb7eSTKOxEt/bZdgZZJJ4ZGwNZDi0xUkKmco=;
  b=JPU3yzpMe1mh0pupu9DKCrC88lp9jsFKwiljP0IM2ThbOblAUsZ0R5/D
   BLFh5EfvFlgaFxFkxQ79ezJz3JMHMrGjf2AXfC3HvqrvcTpEuBGnHdtB8
   RDkPUUN2uknAf1WNVTUJD0iFzXYfit2Ov7xMUh/Gf9/SaJFBkilLIA21A
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 99632357
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Q7fdK6vn/E9s/P8F3ezscJYhi+fnVE1eMUV32f8akzHdYApBsoF/q
 tZmKW6EP/jeMTD1eI1/PYW2oxwB65LRydNhS1Y9pHtgHyoU+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj6Fv0gnRkPaoQ5ASGzSFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwIQsqZx6B27KN8YmkZNJKosYBBtjJBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WzRetFKSo7tx+2XJxRZ9+LPsLMDUapqBQsA9ckOw9
 zOYpD6iX05y2Nq39WqMqVGQjNDztwz7QJsZC5ylxuNojwjGroAUIEJPDgbqyRWjsWa1UshTL
 EE88SM0oa8/skesS7HVRAakqXSJuhodXdt4EOAg7gyJjK3O7G6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thvrZ3JTdzVbI3ZZE01cuYKLTJwPYgznR+1EGaC30o3OKArv7
 QusiCocraQxtJtev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJcvV/BFhVtnhC11ACxytFDTHyWBiEJA6n9hG0y7yJNsAiN2SyaoADyrlRdMLS
 BWO0e+yzMUJVJdPUUOQS9PZNijS5fK8fekJr9iNBja0XrB/dRWc4AZlblOK0mbmnSAEyP9gZ
 snKLJb0VC9GWMyLKQZaoM9HjNcWKt0WnzuPFfgXMTz8uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75i2ziikn1ivBnFSnCPq+Y7dAlaRUXX8Liq86S7gMbfeFs5cIzgYteNqY4cl3tNxP8JzbyRp
 i/kCye1CjPX3BX6FOlDUVg7AJuHYHq1hStT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:+qbiMKGgH5xKE1X4pLqE/8eALOsnbusQ8zAXPiFKOH9om6mj/K
 qTdZsgpH3JYUkqKRQdcLy7VZVoIkm9yXcW2+cs1N6ZNWHbUQ2TQL2KhrGC/9SPIULDH+dmpM
 NdT5Q=
X-IronPort-AV: E=Sophos;i="5.98,228,1673931600"; 
   d="scan'208";a="99632357"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 3/7] automation: Add a template per container for build jobs.
Date: Thu, 2 Mar 2023 17:53:28 +0000
Message-ID: <20230302175332.56052-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230302175332.56052-1-anthony.perard@citrix.com>
References: <20230302175332.56052-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Have one template per container, which each build job will extend.
This will allow to add more variable which are linked to a used
container.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/gitlab-ci/build.yaml | 327 ++++++++++++++++++++------------
 1 file changed, 202 insertions(+), 125 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 38bb22d860..1f186bf346 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -255,285 +255,346 @@
 
 # Jobs below this line
 
-archlinux-gcc:
-  extends: .gcc-x86-64-build
+.container-archlinux:
   variables:
     CONTAINER: archlinux:current
 
+archlinux-gcc:
+  extends:
+    - .gcc-x86-64-build
+    - .container-archlinux
+
 archlinux-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: archlinux:current
+  extends:
+    - .gcc-x86-64-build-debug
+    - .container-archlinux
 
-centos-7-gcc:
-  extends: .gcc-x86-64-build
+.container-centos-7:
   variables:
     CONTAINER: centos:7
 
+centos-7-gcc:
+  extends:
+    - .gcc-x86-64-build
+    - .container-centos-7
+
 centos-7-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: centos:7
+  extends:
+    - .gcc-x86-64-build-debug
+    - .container-centos-7
 
-debian-stretch-clang:
-  extends: .clang-x86-64-build
+.container-debian-stretch:
   variables:
     CONTAINER: debian:stretch
 
+debian-stretch-clang:
+  extends:
+    - .clang-x86-64-build
+    - .container-debian-stretch
+
 debian-stretch-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: debian:stretch
+  extends:
+    - .clang-x86-64-build-debug
+    - .container-debian-stretch
 
 debian-stretch-clang-8:
-  extends: .clang-8-x86-64-build
-  variables:
-    CONTAINER: debian:stretch
+  extends:
+    - .clang-8-x86-64-build
+    - .container-debian-stretch
 
 debian-stretch-clang-8-debug:
-  extends: .clang-8-x86-64-build-debug
-  variables:
-    CONTAINER: debian:stretch
+  extends:
+    - .clang-8-x86-64-build-debug
+    - .container-debian-stretch
 
 debian-stretch-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: debian:stretch
+  extends:
+    - .gcc-x86-64-build
+    - .container-debian-stretch
 
 debian-stretch-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: debian:stretch
+  extends:
+    - .gcc-x86-64-build-debug
+    - .container-debian-stretch
 
-debian-stretch-32-clang-debug:
-  extends: .clang-x86-32-build-debug
+.container-debian-stretch-32:
   variables:
     CONTAINER: debian:stretch-i386
 
+debian-stretch-32-clang-debug:
+  extends:
+    - .clang-x86-32-build-debug
+    - .container-debian-stretch-32
+
 debian-stretch-32-gcc-debug:
-  extends: .gcc-x86-32-build-debug
-  variables:
-    CONTAINER: debian:stretch-i386
+  extends:
+    - .gcc-x86-32-build-debug
+    - .container-debian-stretch-32
 
 debian-buster-gcc-ibt:
-  extends: .gcc-x86-64-build
+  extends:
+    - .gcc-x86-64-build
   variables:
     CONTAINER: debian:buster-gcc-ibt
     RANDCONFIG: y
     EXTRA_FIXED_RANDCONFIG: |
       CONFIG_XEN_IBT=y
 
-debian-unstable-clang:
-  extends: .clang-x86-64-build
+.container-debian-unstable:
   variables:
     CONTAINER: debian:unstable
 
+debian-unstable-clang:
+  extends:
+    - .clang-x86-64-build
+    - .container-debian-unstable
+
 debian-unstable-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: debian:unstable
+  extends:
+    - .clang-x86-64-build-debug
+    - .container-debian-unstable
 
 debian-unstable-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: debian:unstable
+  extends:
+    - .gcc-x86-64-build
+    - .container-debian-unstable
 
 debian-unstable-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: debian:unstable
+  extends:
+    - .gcc-x86-64-build-debug
+    - .container-debian-unstable
 
 debian-unstable-gcc-randconfig:
-  extends: .gcc-x86-64-build
+  extends:
+    - .gcc-x86-64-build
+    - .container-debian-unstable
   variables:
-    CONTAINER: debian:unstable
     RANDCONFIG: y
 
 debian-unstable-gcc-debug-randconfig:
-  extends: .gcc-x86-64-build-debug
+  extends:
+    - .gcc-x86-64-build-debug
+    - .container-debian-unstable
   variables:
-    CONTAINER: debian:unstable
     RANDCONFIG: y
 
-debian-unstable-32-clang-debug:
-  extends: .clang-x86-32-build-debug
+.container-debian-unstable-32:
   variables:
     CONTAINER: debian:unstable-i386
 
+debian-unstable-32-clang-debug:
+  extends:
+    - .clang-x86-32-build-debug
+    - .container-debian-unstable-32
+
 debian-unstable-32-gcc-debug:
-  extends: .gcc-x86-32-build-debug
-  variables:
-    CONTAINER: debian:unstable-i386
+  extends:
+    - .gcc-x86-32-build-debug
+    - .container-debian-unstable-32
 
 fedora-gcc:
-  extends: .gcc-x86-64-build
+  extends:
+    - .gcc-x86-64-build
   variables:
     CONTAINER: fedora:29
 
 fedora-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends:
+    - .gcc-x86-64-build-debug
   variables:
     CONTAINER: fedora:29
 
 # Ubuntu Trusty's Clang is 3.4 while Xen requires 3.5
 
-ubuntu-trusty-gcc:
-  extends: .gcc-x86-64-build
+.container-ubuntu-trusty:
   variables:
     CONTAINER: ubuntu:trusty
 
+ubuntu-trusty-gcc:
+  extends:
+    - .gcc-x86-64-build
+    - .container-ubuntu-trusty
+
 ubuntu-trusty-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:trusty
+  extends:
+    - .gcc-x86-64-build-debug
+    - .container-ubuntu-trusty
 
-ubuntu-xenial-clang:
-  extends: .clang-x86-64-build
+.container-ubuntu-xenial:
   variables:
     CONTAINER: ubuntu:xenial
 
+ubuntu-xenial-clang:
+  extends:
+    - .clang-x86-64-build
+    - .container-ubuntu-xenial
+
 ubuntu-xenial-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:xenial
+  extends:
+    - .clang-x86-64-build-debug
+    - .container-ubuntu-xenial
 
 ubuntu-xenial-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: ubuntu:xenial
+  extends:
+    - .gcc-x86-64-build
+    - .container-ubuntu-xenial
 
 ubuntu-xenial-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:xenial
+  extends:
+    - .gcc-x86-64-build-debug
+    - .container-ubuntu-xenial
 
-ubuntu-bionic-clang:
-  extends: .clang-x86-64-build
+.container-ubuntu-bionic:
   variables:
     CONTAINER: ubuntu:bionic
 
+ubuntu-bionic-clang:
+  extends:
+    - .clang-x86-64-build
+    - .container-ubuntu-bionic
+
 ubuntu-bionic-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:bionic
+  extends:
+    - .clang-x86-64-build-debug
+    - .container-ubuntu-bionic
 
 ubuntu-bionic-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: ubuntu:bionic
+  extends:
+    - .gcc-x86-64-build
+    - .container-ubuntu-bionic
 
 ubuntu-bionic-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:bionic
+  extends:
+    - .gcc-x86-64-build-debug
+    - .container-ubuntu-bionic
 
-ubuntu-focal-gcc:
-  extends: .gcc-x86-64-build
+.container-ubuntu-focal:
   variables:
     CONTAINER: ubuntu:focal
 
+ubuntu-focal-gcc:
+  extends:
+    - .gcc-x86-64-build
+    - .container-ubuntu-focal
+
 ubuntu-focal-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:focal
+  extends:
+    - .gcc-x86-64-build-debug
+    - .container-ubuntu-focal
 
 ubuntu-focal-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: ubuntu:focal
+  extends:
+    - .clang-x86-64-build
+    - .container-ubuntu-focal
 
 ubuntu-focal-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: ubuntu:focal
+  extends:
+    - .clang-x86-64-build-debug
+    - .container-ubuntu-focal
 
 opensuse-leap-clang:
-  extends: .clang-x86-64-build
+  extends:
+    - .clang-x86-64-build
   variables:
     CONTAINER: suse:opensuse-leap
 
 opensuse-leap-clang-debug:
-  extends: .clang-x86-64-build-debug
+  extends:
+    - .clang-x86-64-build-debug
   variables:
     CONTAINER: suse:opensuse-leap
 
 opensuse-leap-gcc:
-  extends: .gcc-x86-64-build
+  extends:
+    - .gcc-x86-64-build
   variables:
     CONTAINER: suse:opensuse-leap
 
 opensuse-leap-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends:
+    - .gcc-x86-64-build-debug
   variables:
     CONTAINER: suse:opensuse-leap
 
 opensuse-tumbleweed-clang:
-  extends: .clang-x86-64-build
+  extends:
+    - .clang-x86-64-build
   variables:
     CONTAINER: suse:opensuse-tumbleweed
   allow_failure: true
 
 opensuse-tumbleweed-clang-debug:
-  extends: .clang-x86-64-build-debug
+  extends:
+    - .clang-x86-64-build-debug
   variables:
     CONTAINER: suse:opensuse-tumbleweed
   allow_failure: true
 
 opensuse-tumbleweed-gcc:
-  extends: .gcc-x86-64-build
+  extends:
+    - .gcc-x86-64-build
   variables:
     CONTAINER: suse:opensuse-tumbleweed
   allow_failure: true
 
 opensuse-tumbleweed-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends:
+    - .gcc-x86-64-build-debug
   variables:
     CONTAINER: suse:opensuse-tumbleweed
   allow_failure: true
 
 alpine-3.12-gcc:
-  extends: .gcc-x86-64-build
+  extends:
+    - .gcc-x86-64-build
   variables:
     CONTAINER: alpine:3.12
 
 alpine-3.12-gcc-debug:
-  extends: .gcc-x86-64-build-debug
+  extends:
+    - .gcc-x86-64-build-debug
   variables:
     CONTAINER: alpine:3.12
 
 alpine-3.12-clang:
-  extends: .clang-x86-64-build
+  extends:
+    - .clang-x86-64-build
   variables:
     CONTAINER: alpine:3.12
 
 alpine-3.12-clang-debug:
-  extends: .clang-x86-64-build-debug
+  extends:
+    - .clang-x86-64-build-debug
   variables:
     CONTAINER: alpine:3.12
 
 # Arm32 cross-build
 
 debian-unstable-gcc-arm32:
-  extends: .gcc-arm32-cross-build
+  extends:
+    - .gcc-arm32-cross-build
   variables:
     CONTAINER: debian:unstable-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
 
 debian-unstable-gcc-arm32-debug:
-  extends: .gcc-arm32-cross-build-debug
+  extends:
+    - .gcc-arm32-cross-build-debug
   variables:
     CONTAINER: debian:unstable-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
 
 debian-unstable-gcc-arm32-randconfig:
-  extends: .gcc-arm32-cross-build
+  extends:
+    - .gcc-arm32-cross-build
   variables:
     CONTAINER: debian:unstable-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
 debian-unstable-gcc-arm32-debug-randconfig:
-  extends: .gcc-arm32-cross-build-debug
+  extends:
+    - .gcc-arm32-cross-build-debug
   variables:
     CONTAINER: debian:unstable-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
@@ -562,51 +623,60 @@ debian-unstable-gcc-arm32-debug-staticmem:
 # Arm builds
 
 debian-unstable-gcc-arm64:
-  extends: .gcc-arm64-build
+  extends:
+    - .gcc-arm64-build
   variables:
     CONTAINER: debian:unstable-arm64v8
 
 debian-unstable-gcc-debug-arm64:
-  extends: .gcc-arm64-build-debug
+  extends:
+    - .gcc-arm64-build-debug
   variables:
     CONTAINER: debian:unstable-arm64v8
 
 debian-unstable-gcc-arm64-randconfig:
-  extends: .gcc-arm64-build
+  extends:
+    - .gcc-arm64-build
   variables:
     CONTAINER: debian:unstable-arm64v8
     RANDCONFIG: y
 
 debian-unstable-gcc-debug-arm64-randconfig:
-  extends: .gcc-arm64-build-debug
+  extends:
+    - .gcc-arm64-build-debug
   variables:
     CONTAINER: debian:unstable-arm64v8
     RANDCONFIG: y
 
 alpine-3.12-gcc-arm64:
-  extends: .gcc-arm64-build
+  extends:
+    - .gcc-arm64-build
   variables:
     CONTAINER: alpine:3.12-arm64v8
 
 alpine-3.12-gcc-debug-arm64:
-  extends: .gcc-arm64-build-debug
+  extends:
+    - .gcc-arm64-build-debug
   variables:
     CONTAINER: alpine:3.12-arm64v8
 
 alpine-3.12-gcc-arm64-randconfig:
-  extends: .gcc-arm64-build
+  extends:
+    - .gcc-arm64-build
   variables:
     CONTAINER: alpine:3.12-arm64v8
     RANDCONFIG: y
 
 alpine-3.12-gcc-debug-arm64-randconfig:
-  extends: .gcc-arm64-build-debug
+  extends:
+    - .gcc-arm64-build-debug
   variables:
     CONTAINER: alpine:3.12-arm64v8
     RANDCONFIG: y
 
 alpine-3.12-gcc-arm64-staticmem:
-  extends: .gcc-arm64-build
+  extends:
+    - .gcc-arm64-build
   variables:
     CONTAINER: alpine:3.12-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -615,7 +685,8 @@ alpine-3.12-gcc-arm64-staticmem:
       CONFIG_STATIC_MEMORY=y
 
 alpine-3.12-gcc-debug-arm64-staticmem:
-  extends: .gcc-arm64-build-debug
+  extends:
+    - .gcc-arm64-build-debug
   variables:
     CONTAINER: alpine:3.12-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -624,7 +695,8 @@ alpine-3.12-gcc-debug-arm64-staticmem:
       CONFIG_STATIC_MEMORY=y
 
 alpine-3.12-gcc-arm64-boot-cpupools:
-  extends: .gcc-arm64-build
+  extends:
+    - .gcc-arm64-build
   variables:
     CONTAINER: alpine:3.12-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -634,7 +706,8 @@ alpine-3.12-gcc-arm64-boot-cpupools:
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
 alpine-3.12-gcc-debug-arm64-boot-cpupools:
-  extends: .gcc-arm64-build-debug
+  extends:
+    - .gcc-arm64-build-debug
   variables:
     CONTAINER: alpine:3.12-arm64v8
     EXTRA_XEN_CONFIG: |
@@ -642,21 +715,24 @@ alpine-3.12-gcc-debug-arm64-boot-cpupools:
 
 # RISC-V 64 cross-build
 archlinux-current-gcc-riscv64:
-  extends: .gcc-riscv64-cross-build
+  extends:
+    - .gcc-riscv64-cross-build
   variables:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
 
 archlinux-current-gcc-riscv64-debug:
-  extends: .gcc-riscv64-cross-build-debug
+  extends:
+    - .gcc-riscv64-cross-build-debug
   variables:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     HYPERVISOR_ONLY: y
 
 archlinux-current-gcc-riscv64-randconfig:
-  extends: .gcc-riscv64-cross-build
+  extends:
+    - .gcc-riscv64-cross-build
   variables:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
@@ -665,7 +741,8 @@ archlinux-current-gcc-riscv64-randconfig:
       CONFIG_COVERAGE=n
 
 archlinux-current-gcc-riscv64-debug-randconfig:
-  extends: .gcc-riscv64-cross-build-debug
+  extends:
+    - .gcc-riscv64-cross-build-debug
   variables:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
-- 
Anthony PERARD


