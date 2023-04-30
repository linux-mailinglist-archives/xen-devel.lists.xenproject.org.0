Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5236F2B6D
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 00:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527890.820509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptFkh-0001KI-0T; Sun, 30 Apr 2023 22:42:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527890.820509; Sun, 30 Apr 2023 22:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptFkg-0001Ck-Tb; Sun, 30 Apr 2023 22:42:42 +0000
Received: by outflank-mailman (input) for mailman id 527890;
 Sun, 30 Apr 2023 22:42:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MVg7=AV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ptFkg-00019p-3f
 for xen-devel@lists.xenproject.org; Sun, 30 Apr 2023 22:42:42 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f83c576-e7a8-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 00:42:39 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 229C95C009B;
 Sun, 30 Apr 2023 18:42:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 30 Apr 2023 18:42:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 30 Apr 2023 18:42:37 -0400 (EDT)
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
X-Inumbo-ID: 4f83c576-e7a8-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1682894559; x=1682980959; bh=NJ
	LqfqVgmi3zQgvQJ5K3XZAUDkzQPr1TvscaLzZrSXU=; b=YZ4Q3mc5CnUMF7RF0R
	4WHC7rNFyxOYP9tAHcuOoWlE+1JqLOQMOmzFgpW3koTsXTUVRhEwvCGQxjOVwcm7
	ENpeH/kct620U2hdRlXcrbYR6HXR5f7CG8mbIDsd6T6f7/05eYYcx91HsNlmy/hx
	YmrYQO3oJTBTAf+nJEVkHSLU6JrtrMus0cfYCKFdVl5XJ8mvLJk3tkWaEp9o5R7E
	zsLv4R1dq/OdcIEtN3eDxK/DBaqqKPZwbXBvWlO5rgnAV0WS39EFUJ5hZuRwdtO8
	Kbqfvhrk9Z3LTf00KITQHecEnSvNwWa0xVsvV2FIV6U0ng2GxlpRQKQUbhfhQjcg
	Fd8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682894559; x=1682980959; bh=NJLqfqVgmi3zQgvQJ5K3XZAUDkzQPr1Tvsc
	aLzZrSXU=; b=gi5mbo7vg7vITLcySDxpDghMzIbA6/U9WgbT6aQFeBAgFTvK5pU
	IpfezgtTjXuttKoBw72kDuX11FpU7HtU0Brbe0gCe3RmuDZzxfYg4aiQSyJXqKmK
	jxZ8oWK2ZOh4dfhPlz0IdpImDz4ivCwHuS9m9iqH8s4LVa7QLMW9HMAQgrn60QfZ
	IpPTC+Ah2E1G9jN2mxmuPZPpK+q9N2SQEYNyPPJWHtFTGF/+bkBxYcaSL5t6sryg
	ikckw+Y2j+mk+NIQ+XmIczOZa85mieen9cfBZtN0kSBh0picXGk8N49+o3mA5BVD
	jBg2ZZEUsb+znCwoEFPOxbo9X9TQXcWBbbQ==
X-ME-Sender: <xms:3u5OZOqdK_VXXiEdw35i-P1Aat0tM_zdVzBJKNpwOg80Q9NHoZkCkw>
    <xme:3u5OZMqUIFs-U0Fu1vBpRezFSYNFpLK_BThuFQMZCMbCcQaCVuOX_yJDDwa25UDxV
    rFkDLsAXtRwaA>
X-ME-Received: <xmr:3u5OZDMuJWC6dygdadYvkJqdqBMeVV3wBkTS54FKboPpF2RQuCc9MngTH3uUxTiYfUM1gGNPQ1diGHpN7PfwPPjDnVZzf6JOZy4MPAAcBN8MFCKZ_e10>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvfedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    ueduhefgvdefheehudejheefudevueeghfekhfehleegveduteeuiedugffgffenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:3-5OZN7pPW0uehpfBwjM3Ifs9tlZbJyOHxrk1JlKItioe12dpoO-Ew>
    <xmx:3-5OZN7LZXxZhzTWPNBxEndkiMvA0OHkjtxfc_FBFXW0so8RMtuDfg>
    <xmx:3-5OZNjdD2KxMiU3kVZ-d_xPB1c6g5SYMuqAjiMeTRK-FpsOAD7uiw>
    <xmx:3-5OZPQSqVPhh4qDY7qTjP_V728Nj-rgxKpg3vZYqTMYii5HuwD4eQ>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/2] automation: optimize build jobs order
Date: Mon,  1 May 2023 00:42:23 +0200
Message-Id: <da4e7c1303754d50e03a6bcf97eb2e4b53503c4b.1682894502.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.ff073811df470285fc1011952c6cc28e9e77607e.1682894502.git-series.marmarek@invisiblethingslab.com>
References: <cover.ff073811df470285fc1011952c6cc28e9e77607e.1682894502.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Put jobs that are needed for (any) test earlier, so the tests can start
running in parallel to builds.
This commits splits only x86 build jobs into two sections (one on top
and one on bottom), but keep ARM build jobs in one section, as most of
them have some test connected and the few that do not are not worth
reducing readability of the file.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/gitlab-ci/build.yaml | 462 ++++++++++++++++-----------------
 1 file changed, 233 insertions(+), 229 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 3f44902c44d0..420ffa5acb47 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -314,252 +314,28 @@ kernel-6.1.19-export:
 
 # Jobs below this line
 
-archlinux-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: archlinux:current
+# Build jobs needed for tests
 
-archlinux-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: archlinux:current
-
-centos-7-gcc:
+alpine-3.12-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: centos:7
+    CONTAINER: alpine:3.12
 
-centos-7-gcc-debug:
+alpine-3.12-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: centos:7
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
-debian-stretch-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: debian:stretch
+    CONTAINER: alpine:3.12
 
 debian-stretch-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
     CONTAINER: debian:stretch
 
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
 debian-unstable-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
     CONTAINER: debian:unstable
 
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
-
-alpine-3.12-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: alpine:3.12
-
-alpine-3.12-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: alpine:3.12
-
-alpine-3.12-clang:
-  extends: .clang-x86-64-build
-  variables:
-    CONTAINER: alpine:3.12
-
-alpine-3.12-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: alpine:3.12
-
 # Arm32 cross-build
 
 debian-unstable-gcc-arm32:
@@ -781,3 +557,231 @@ debian-unstable-gcc-arm64-cppcheck:
     CONTAINER: debian:unstable-cppcheck
     CPPCHECK: y
     HYPERVISOR_ONLY: y
+
+# Build jobs not needed for tests
+
+alpine-3.12-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: alpine:3.12
+
+alpine-3.12-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: alpine:3.12
+
+archlinux-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: archlinux:current
+
+archlinux-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: archlinux:current
+
+centos-7-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: centos:7
+
+centos-7-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: centos:7
+
+debian-stretch-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:stretch
+
+debian-stretch-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: debian:stretch
+
+debian-stretch-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: debian:stretch
+
+debian-stretch-32-clang-debug:
+  extends: .clang-x86-32-build-debug
+  variables:
+    CONTAINER: debian:stretch-i386
+
+debian-stretch-32-gcc-debug:
+  extends: .gcc-x86-32-build-debug
+  variables:
+    CONTAINER: debian:stretch-i386
+
+debian-buster-gcc-ibt:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:buster-gcc-ibt
+    RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG: |
+      CONFIG_XEN_IBT=y
+
+debian-unstable-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: debian:unstable
+
+debian-unstable-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:unstable
+
+debian-unstable-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: debian:unstable
+
+debian-unstable-gcc-randconfig:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:unstable
+    RANDCONFIG: y
+
+debian-unstable-gcc-debug-randconfig:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: debian:unstable
+    RANDCONFIG: y
+
+debian-unstable-32-clang-debug:
+  extends: .clang-x86-32-build-debug
+  variables:
+    CONTAINER: debian:unstable-i386
+
+debian-unstable-32-gcc-debug:
+  extends: .gcc-x86-32-build-debug
+  variables:
+    CONTAINER: debian:unstable-i386
+
+fedora-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: fedora:29
+
+fedora-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: fedora:29
+
+# Ubuntu Trusty's Clang is 3.4 while Xen requires 3.5
+
+ubuntu-trusty-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: ubuntu:trusty
+
+ubuntu-trusty-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:trusty
+
+ubuntu-xenial-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: ubuntu:xenial
+
+ubuntu-xenial-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:xenial
+
+ubuntu-xenial-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: ubuntu:xenial
+
+ubuntu-xenial-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:xenial
+
+ubuntu-bionic-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: ubuntu:bionic
+
+ubuntu-bionic-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:bionic
+
+ubuntu-bionic-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: ubuntu:bionic
+
+ubuntu-bionic-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:bionic
+
+ubuntu-focal-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: ubuntu:focal
+
+ubuntu-focal-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:focal
+
+ubuntu-focal-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: ubuntu:focal
+
+ubuntu-focal-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: ubuntu:focal
+
+opensuse-leap-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: suse:opensuse-leap
+
+opensuse-leap-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: suse:opensuse-leap
+
+opensuse-leap-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: suse:opensuse-leap
+
+opensuse-leap-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: suse:opensuse-leap
+
+opensuse-tumbleweed-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: suse:opensuse-tumbleweed
+  allow_failure: true
+
+opensuse-tumbleweed-clang-debug:
+  extends: .clang-x86-64-build-debug
+  variables:
+    CONTAINER: suse:opensuse-tumbleweed
+  allow_failure: true
+
+opensuse-tumbleweed-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: suse:opensuse-tumbleweed
+  allow_failure: true
+
+opensuse-tumbleweed-gcc-debug:
+  extends: .gcc-x86-64-build-debug
+  variables:
+    CONTAINER: suse:opensuse-tumbleweed
+  allow_failure: true
-- 
git-series 0.9.1

