Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22A48C781E
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 16:00:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723360.1128170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be6-0006wS-Nc; Thu, 16 May 2024 13:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723360.1128170; Thu, 16 May 2024 13:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7be6-0006us-G4; Thu, 16 May 2024 13:59:46 +0000
Received: by outflank-mailman (input) for mailman id 723360;
 Thu, 16 May 2024 13:59:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9+o=MT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s7be4-0006bS-Hh
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 13:59:44 +0000
Received: from fhigh5-smtp.messagingengine.com
 (fhigh5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89f4f4df-138c-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 15:59:41 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 20B841140102;
 Thu, 16 May 2024 09:59:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 16 May 2024 09:59:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 May 2024 09:59:38 -0400 (EDT)
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
X-Inumbo-ID: 89f4f4df-138c-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1715867980; x=1715954380; bh=v8UvuOInE1
	5TzCQTzCfX1F4m6ztY1tE/KixumMSvRV0=; b=4S2FrE7dCFylYj9l8v4/KoW/kk
	50P+ca1qmgc0bDalyGezoapVGmT9vZzM6DV74E3ZSqbh6pxILDVX9PqCIDFsj+de
	F6AKT0QcrpaOyFHVGoAwzo3T9Qk7Va9p9f2OTmFS6Ah+FGlviP4o6EQZSzZ1XcTv
	W2j1I1O+5coU9ELiZsv+NgV8waOkWmI9rJacgclW9uYgvKo0GFT6WYQZvz0LRIP8
	aN4JQfKV689rIrvm7V7Y5c/zkDpjCTSAOgG0D1XiHGoKoSMV9N94BQIERY9ruGq6
	nwGB4E1OMqgu1GxLLW1KOpsN70b/h25sGUDiKy6WKwnFs6xYuc+x0afO9zlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715867980; x=
	1715954380; bh=v8UvuOInE15TzCQTzCfX1F4m6ztY1tE/KixumMSvRV0=; b=C
	4BvatJCXI7ML75S7WioE4RI79cKW0HLmwuCK2tWmSOwRo2rIV4T/E9Lm+gx2rFO/
	72sLRdnUG5dDKzaNWygJzmdi1h65nPUcoC/93maeIUP1DgG5tbrESixMk/x73Fyh
	RzKs5kq+8k3qqSABqshvCwLONZAH7/jHl/KMf2uVHHI347nxjLrk5AWg1U8f0U7x
	5tgmYJdnrDAd+1v3YFOqCK2/nhg5ut1+KWkh7u4nMXgn53tFoWaCcQOL5vJ4OrLL
	YspxLw88Z44YCS8ret+IGAf/yP/sHNR8UjJ8W7/5+Ehpa7BfXNUFHBY9nn5eL6KJ
	unSsCZjXXfr0nlX1ll+2g==
X-ME-Sender: <xms:SxFGZv-12Q-BY79hkkiTZGJ4WHiKRblljWOnkJV5vCA9SAxZWPq2VA>
    <xme:SxFGZruzP4rLAdYjH0X15K2S_ewEPTvsOM-hX46QsqKscL47nqYdWTZFq-V5rs2Nr
    jy7CiOtnuHl9g>
X-ME-Received: <xmr:SxFGZtDgXer1czBsJm_SmD7AAGdyZTI6WC0aqmbwngvYIN-9Ekz5nwpjiomJExbRBaH1W6P_nbItJ9qCzz3EPcebz6SZLZ9FGlRsToTBax2DcnzUTbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdehuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeel
    fedtfefgfffghfevhfehvdeileehheffueekieetfeffhfetgefggfejudfggeenucffoh
    hmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomh
X-ME-Proxy: <xmx:SxFGZrcElwZq7f0rigzM6n0ZLBqO3N9OFZ9pdsiHZ_EtroNPsQXRnA>
    <xmx:TBFGZkMwgcPwheHON_DVbe9OcWH2BpY1lXSqHBa_8PpudGu9vWft5w>
    <xmx:TBFGZtlaCGiAbPZ9JjWa0THYtbflsXzXoS7tR8mbJYQCwYsSuVjlnw>
    <xmx:TBFGZus11y16llLwd2oamkKVN7ypqlOn9v4VisvToVh_wW4bo6TYlA>
    <xmx:TBFGZprihWeehxwM4OzIEGNIUbTLf88nRKjt5HfDp1qQ7uSGxJ5w4-1J>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 03/12] automation: switch to alpine:3.19
Date: Thu, 16 May 2024 15:58:24 +0200
Message-ID: <a681e1d414c0735128cdde70d6b521d8c96e6e45.1715867907.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Alpine 3.19 is needed for upcoming stubdomain tests, as linux stubdomain
build requires dracut-core package (dracut-install tool specifically)
which isn't available in 3.18. While technically it will be needed only
in the x86_64 builds, switch Alpine version everywhere for uniformity.
Note this bumps kernel version requirement on docker runners -
dracut-install uses faccessat2() syscall which was introduced in Linux
5.8.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 automation/build/alpine/3.18-arm64v8.dockerfile           | 49 +------
 automation/build/alpine/3.18.dockerfile                   | 51 +------
 automation/build/alpine/3.19-arm64v8.dockerfile           | 49 ++++++-
 automation/build/alpine/3.19.dockerfile                   | 51 ++++++-
 automation/gitlab-ci/build.yaml                           | 56 +++----
 automation/gitlab-ci/test.yaml                            | 52 +++---
 automation/scripts/containerize                           |  4 +-
 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile | 65 +--------
 automation/tests-artifacts/alpine/3.18.dockerfile         | 66 +--------
 automation/tests-artifacts/alpine/3.19-arm64v8.dockerfile | 65 ++++++++-
 automation/tests-artifacts/alpine/3.19.dockerfile         | 67 ++++++++-
 11 files changed, 288 insertions(+), 287 deletions(-)
 delete mode 100644 automation/build/alpine/3.18-arm64v8.dockerfile
 delete mode 100644 automation/build/alpine/3.18.dockerfile
 create mode 100644 automation/build/alpine/3.19-arm64v8.dockerfile
 create mode 100644 automation/build/alpine/3.19.dockerfile
 delete mode 100644 automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
 delete mode 100644 automation/tests-artifacts/alpine/3.18.dockerfile
 create mode 100644 automation/tests-artifacts/alpine/3.19-arm64v8.dockerfile
 create mode 100644 automation/tests-artifacts/alpine/3.19.dockerfile

diff --git a/automation/build/alpine/3.18-arm64v8.dockerfile b/automation/build/alpine/3.18-arm64v8.dockerfile
deleted file mode 100644
index 91e90220240f..000000000000
--- a/automation/build/alpine/3.18-arm64v8.dockerfile
+++ /dev/null
@@ -1,49 +0,0 @@
-FROM --platform=linux/arm64/v8 alpine:3.18
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apk --no-cache add \
-  \
-  # xen build deps
-  argp-standalone \
-  autoconf \
-  bash \
-  bison \
-  curl \
-  dev86 \
-  dtc-dev \
-  flex \
-  gcc \
-  git \
-  iasl \
-  libaio-dev \
-  libfdt \
-  linux-headers \
-  make \
-  musl-dev  \
-  ncurses-dev \
-  ocaml \
-  ocaml-findlib \
-  patch  \
-  python3-dev \
-  py3-setuptools \
-  texinfo \
-  util-linux-dev \
-  xz-dev \
-  yajl-dev \
-  zlib-dev \
-  \
-  # qemu build deps
-  glib-dev \
-  libattr \
-  libcap-ng-dev \
-  pixman-dev \
-  # qubes test deps
-  openssh-client \
-  fakeroot \
diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
deleted file mode 100644
index 8d5dac05b01f..000000000000
--- a/automation/build/alpine/3.18.dockerfile
+++ /dev/null
@@ -1,51 +0,0 @@
-FROM --platform=linux/amd64 alpine:3.18
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apk --no-cache add \
-  \
-  # xen build deps
-  argp-standalone \
-  autoconf \
-  bash \
-  bison \
-  clang \
-  curl \
-  dev86 \
-  flex \
-  g++ \
-  gcc \
-  git \
-  grep \
-  iasl \
-  libaio-dev \
-  libc6-compat \
-  linux-headers \
-  make \
-  musl-dev  \
-  ncurses-dev \
-  ocaml \
-  ocaml-findlib \
-  patch  \
-  python3-dev \
-  py3-setuptools \
-  texinfo \
-  util-linux-dev \
-  xz-dev \
-  yajl-dev \
-  zlib-dev \
-  \
-  # qemu build deps
-  glib-dev \
-  libattr \
-  libcap-ng-dev \
-  ninja \
-  pixman-dev \
-  # livepatch-tools deps
-  elfutils-dev \
diff --git a/automation/build/alpine/3.19-arm64v8.dockerfile b/automation/build/alpine/3.19-arm64v8.dockerfile
new file mode 100644
index 000000000000..158cf465a9ff
--- /dev/null
+++ b/automation/build/alpine/3.19-arm64v8.dockerfile
@@ -0,0 +1,49 @@
+FROM --platform=linux/arm64/v8 alpine:3.19
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apk --no-cache add \
+  \
+  # xen build deps
+  argp-standalone \
+  autoconf \
+  bash \
+  bison \
+  curl \
+  dev86 \
+  dtc-dev \
+  flex \
+  gcc \
+  git \
+  iasl \
+  libaio-dev \
+  libfdt \
+  linux-headers \
+  make \
+  musl-dev  \
+  ncurses-dev \
+  ocaml \
+  ocaml-findlib \
+  patch  \
+  python3-dev \
+  py3-setuptools \
+  texinfo \
+  util-linux-dev \
+  xz-dev \
+  yajl-dev \
+  zlib-dev \
+  \
+  # qemu build deps
+  glib-dev \
+  libattr \
+  libcap-ng-dev \
+  pixman-dev \
+  # qubes test deps
+  openssh-client \
+  fakeroot \
diff --git a/automation/build/alpine/3.19.dockerfile b/automation/build/alpine/3.19.dockerfile
new file mode 100644
index 000000000000..0be6d7c85fe7
--- /dev/null
+++ b/automation/build/alpine/3.19.dockerfile
@@ -0,0 +1,51 @@
+FROM --platform=linux/amd64 alpine:3.19
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apk --no-cache add \
+  \
+  # xen build deps
+  argp-standalone \
+  autoconf \
+  bash \
+  bison \
+  clang \
+  curl \
+  dev86 \
+  flex \
+  g++ \
+  gcc \
+  git \
+  grep \
+  iasl \
+  libaio-dev \
+  libc6-compat \
+  linux-headers \
+  make \
+  musl-dev  \
+  ncurses-dev \
+  ocaml \
+  ocaml-findlib \
+  patch  \
+  python3-dev \
+  py3-setuptools \
+  texinfo \
+  util-linux-dev \
+  xz-dev \
+  yajl-dev \
+  zlib-dev \
+  \
+  # qemu build deps
+  glib-dev \
+  libattr \
+  libcap-ng-dev \
+  ninja \
+  pixman-dev \
+  # livepatch-tools deps
+  elfutils-dev \
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 69665ec5b11f..b186289bbd82 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -258,9 +258,9 @@
 
 # Arm test artifacts
 
-alpine-3.18-arm64-rootfs-export:
+alpine-3.19-arm64-rootfs-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18-arm64v8
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.19-arm64v8
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
   artifacts:
@@ -318,9 +318,9 @@ qemu-system-ppc64-8.1.0-ppc64-export:
 
 # x86_64 test artifacts
 
-alpine-3.18-rootfs-export:
+alpine-3.19-rootfs-export:
   extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.18
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.19
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
   artifacts:
@@ -344,15 +344,15 @@ kernel-6.1.19-export:
 
 # Build jobs needed for tests
 
-alpine-3.18-gcc:
+alpine-3.19-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: alpine:3.18
+    CONTAINER: alpine:3.19
 
-alpine-3.18-gcc-debug:
+alpine-3.19-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: alpine:3.18
+    CONTAINER: alpine:3.19
 
 debian-stretch-gcc-debug:
   extends: .gcc-x86-64-build-debug
@@ -435,57 +435,57 @@ debian-bookworm-gcc-debug-arm64-randconfig:
     CONTAINER: debian:bookworm-arm64v8
     RANDCONFIG: y
 
-alpine-3.18-gcc-arm64:
+alpine-3.19-gcc-arm64:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.19-arm64v8
 
-alpine-3.18-gcc-debug-arm64:
+alpine-3.19-gcc-debug-arm64:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.19-arm64v8
 
-alpine-3.18-gcc-arm64-randconfig:
+alpine-3.19-gcc-arm64-randconfig:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.19-arm64v8
     RANDCONFIG: y
 
-alpine-3.18-gcc-debug-arm64-randconfig:
+alpine-3.19-gcc-debug-arm64-randconfig:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.19-arm64v8
     RANDCONFIG: y
 
-alpine-3.18-gcc-debug-arm64-staticmem:
+alpine-3.19-gcc-debug-arm64-staticmem:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.19-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
 
-alpine-3.18-gcc-debug-arm64-static-shared-mem:
+alpine-3.19-gcc-debug-arm64-static-shared-mem:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.19-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
       CONFIG_STATIC_SHM=y
 
-alpine-3.18-gcc-debug-arm64-boot-cpupools:
+alpine-3.19-gcc-debug-arm64-boot-cpupools:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.19-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
-alpine-3.18-gcc-debug-arm64-earlyprintk:
+alpine-3.19-gcc-debug-arm64-earlyprintk:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.19-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_EARLY_UART_CHOICE_PL011=y
       CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
@@ -588,15 +588,15 @@ debian-bookworm-gcc-arm64-cppcheck:
 
 # Build jobs not needed for tests
 
-alpine-3.18-clang:
+alpine-3.19-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: alpine:3.18
+    CONTAINER: alpine:3.19
 
-alpine-3.18-clang-debug:
+alpine-3.19-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: alpine:3.18
+    CONTAINER: alpine:3.19
 
 archlinux-gcc:
   extends: .gcc-x86-64-build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ad249fa0a5d9..f62d426a8d34 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -3,7 +3,7 @@
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
 
 .arm64-test-needs: &arm64-test-needs
-  - alpine-3.18-arm64-rootfs-export
+  - alpine-3.19-arm64-rootfs-export
   - kernel-5.19-arm64-export
   - qemu-system-aarch64-6.0.0-arm64-export
 
@@ -11,7 +11,7 @@
   - qemu-system-aarch64-6.0.0-arm32-export
 
 .x86-64-test-needs: &x86-64-test-needs
-  - alpine-3.18-rootfs-export
+  - alpine-3.19-rootfs-export
   - kernel-6.1.19-export
 
 .qemu-arm64:
@@ -100,7 +100,7 @@
   extends: .test-jobs-common
   variables:
     # the test controller runs on RPi4
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.19-arm64v8
     LOGFILE: smoke-test.log
     PCIDEV: "03:00.0"
     PCIDEV_INTR: "MSI-X"
@@ -149,7 +149,7 @@ xilinx-smoke-dom0less-arm64-gcc:
     - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
+    - alpine-3.19-gcc-arm64
 
 xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
   extends: .xilinx-arm64
@@ -157,7 +157,7 @@ xilinx-smoke-dom0less-arm64-gcc-gem-passthrough:
     - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh gem-passthrough 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
+    - alpine-3.19-gcc-arm64
 
 adl-smoke-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -165,7 +165,7 @@ adl-smoke-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.19-gcc-debug
 
 adl-smoke-x86-64-dom0pvh-gcc-debug:
   extends: .adl-x86-64
@@ -173,7 +173,7 @@ adl-smoke-x86-64-dom0pvh-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.19-gcc-debug
 
 adl-suspend-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -181,7 +181,7 @@ adl-suspend-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.19-gcc-debug
 
 adl-pci-pv-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -189,7 +189,7 @@ adl-pci-pv-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.19-gcc-debug
 
 adl-pci-hvm-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -197,7 +197,7 @@ adl-pci-hvm-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.19-gcc-debug
 
 zen3p-smoke-x86-64-gcc-debug:
   extends: .zen3p-x86-64
@@ -205,7 +205,7 @@ zen3p-smoke-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.19-gcc-debug
 
 zen3p-smoke-x86-64-dom0pvh-gcc-debug:
   extends: .zen3p-x86-64
@@ -213,7 +213,7 @@ zen3p-smoke-x86-64-dom0pvh-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.19-gcc-debug
 
 zen3p-pci-hvm-x86-64-gcc-debug:
   extends: .zen3p-x86-64
@@ -221,7 +221,7 @@ zen3p-pci-hvm-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.19-gcc-debug
 
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
@@ -229,7 +229,7 @@ qemu-smoke-dom0-arm64-gcc:
     - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
+    - alpine-3.19-gcc-arm64
 
 qemu-smoke-dom0-arm64-gcc-debug:
   extends: .qemu-arm64
@@ -237,7 +237,7 @@ qemu-smoke-dom0-arm64-gcc-debug:
     - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64
+    - alpine-3.19-gcc-debug-arm64
 
 qemu-smoke-dom0less-arm64-gcc:
   extends: .qemu-arm64
@@ -245,7 +245,7 @@ qemu-smoke-dom0less-arm64-gcc:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
+    - alpine-3.19-gcc-arm64
 
 qemu-smoke-dom0less-arm64-gcc-debug:
   extends: .qemu-arm64
@@ -253,7 +253,7 @@ qemu-smoke-dom0less-arm64-gcc-debug:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64
+    - alpine-3.19-gcc-debug-arm64
 
 qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
   extends: .qemu-arm64
@@ -261,7 +261,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh gicv3 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64
+    - alpine-3.19-gcc-debug-arm64
 
 qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
   extends: .qemu-arm64
@@ -269,7 +269,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64-staticmem
+    - alpine-3.19-gcc-debug-arm64-staticmem
 
 qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
  extends: .qemu-arm64
@@ -277,7 +277,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
  needs:
    - *arm64-test-needs
-   - alpine-3.18-gcc-debug-arm64
+   - alpine-3.19-gcc-debug-arm64
 
 qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
   extends: .qemu-arm64
@@ -285,7 +285,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64-static-shared-mem
+    - alpine-3.19-gcc-debug-arm64-static-shared-mem
 
 qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
   extends: .qemu-arm64
@@ -293,7 +293,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64-boot-cpupools
+    - alpine-3.19-gcc-debug-arm64-boot-cpupools
 
 qemu-smoke-dom0less-arm64-gcc-debug-earlyprintk:
   extends: .qemu-arm64
@@ -301,14 +301,14 @@ qemu-smoke-dom0less-arm64-gcc-debug-earlyprintk:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh earlyprintk 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64-earlyprintk
+    - alpine-3.19-gcc-debug-arm64-earlyprintk
 
 qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
   extends: .qemu-arm64
   script:
     - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
   needs:
-    - alpine-3.18-gcc-arm64
+    - alpine-3.19-gcc-arm64
     - qemu-system-aarch64-6.0.0-arm64-export
 
 qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
@@ -316,7 +316,7 @@ qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
   script:
     - ./automation/scripts/qemu-xtf-dom0less-arm64.sh hyp-xen-version 2>&1 | tee ${LOGFILE}
   needs:
-    - alpine-3.18-gcc-debug-arm64
+    - alpine-3.19-gcc-debug-arm64
     - qemu-system-aarch64-6.0.0-arm64-export
 
 qemu-smoke-dom0-arm32-gcc:
@@ -389,7 +389,7 @@ qemu-alpine-x86_64-gcc:
     - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc
+    - alpine-3.19-gcc
 
 qemu-smoke-x86-64-gcc:
   extends: .qemu-x86-64
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index acdef1b54813..ae82e727b0b6 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -24,8 +24,8 @@ die() {
 #
 BASE="registry.gitlab.com/xen-project/xen"
 case "_${CONTAINER}" in
-    _alpine) CONTAINER="${BASE}/alpine:3.18" ;;
-    _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.18-arm64v8" ;;
+    _alpine) CONTAINER="${BASE}/alpine:3.19" ;;
+    _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.19-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current" ;;
     _riscv64) CONTAINER="${BASE}/archlinux:current-riscv64" ;;
     _centos7) CONTAINER="${BASE}/centos:7" ;;
diff --git a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
deleted file mode 100644
index 0e5ae7f2b4d8..000000000000
--- a/automation/tests-artifacts/alpine/3.18-arm64v8.dockerfile
+++ /dev/null
@@ -1,65 +0,0 @@
-FROM --platform=linux/arm64/v8 alpine:3.18
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-RUN \
-  # apk
-  apk update && \
-  \
-  # xen runtime deps
-  apk add musl && \
-  apk add openrc && \
-  apk add busybox && \
-  apk add sudo && \
-  apk add dbus && \
-  apk add bash && \
-  apk add python3 && \
-  apk add zlib && \
-  apk add ncurses && \
-  apk add yajl && \
-  apk add libaio && \
-  apk add xz && \
-  apk add util-linux && \
-  apk add argp-standalone && \
-  apk add libfdt && \
-  apk add glib && \
-  apk add pixman && \
-  apk add curl && \
-  apk add udev && \
-  \
-  # Xen
-  cd / && \
-  # Minimal ramdisk environment in case of cpio output
-  rc-update add udev && \
-  rc-update add udev-trigger && \
-  rc-update add udev-settle && \
-  rc-update add networking sysinit && \
-  rc-update add loopback sysinit && \
-  rc-update add bootmisc boot && \
-  rc-update add devfs sysinit && \
-  rc-update add dmesg sysinit && \
-  rc-update add hostname boot && \
-  rc-update add hwclock boot && \
-  rc-update add hwdrivers sysinit && \
-  rc-update add killprocs shutdown && \
-  rc-update add modloop sysinit && \
-  rc-update add modules boot && \
-  rc-update add mount-ro shutdown && \
-  rc-update add savecache shutdown && \
-  rc-update add sysctl boot && \
-  rc-update add local default && \
-  cp -a /sbin/init /init && \
-  echo "ttyS0" >> /etc/securetty && \
-  echo "hvc0" >> /etc/securetty && \
-  echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab && \
-  echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab && \
-  passwd -d "root" root && \
-  \
-  # Create rootfs
-  cd / && \
-  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var
diff --git a/automation/tests-artifacts/alpine/3.18.dockerfile b/automation/tests-artifacts/alpine/3.18.dockerfile
deleted file mode 100644
index 9cde6c9ad4da..000000000000
--- a/automation/tests-artifacts/alpine/3.18.dockerfile
+++ /dev/null
@@ -1,66 +0,0 @@
-FROM --platform=linux/amd64 alpine:3.18
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-RUN \
-  # apk
-  apk update && \
-  \
-  # xen runtime deps
-  apk add musl && \
-  apk add libgcc && \
-  apk add openrc && \
-  apk add busybox && \
-  apk add sudo && \
-  apk add dbus && \
-  apk add bash && \
-  apk add python3 && \
-  apk add zlib && \
-  apk add ncurses && \
-  apk add yajl && \
-  apk add libaio && \
-  apk add xz && \
-  apk add util-linux && \
-  apk add argp-standalone && \
-  apk add libfdt && \
-  apk add glib && \
-  apk add pixman && \
-  apk add curl && \
-  apk add udev && \
-  apk add pciutils && \
-  apk add libelf && \
-  \
-  # Xen
-  cd / && \
-  # Minimal ramdisk environment in case of cpio output
-  rc-update add udev && \
-  rc-update add udev-trigger && \
-  rc-update add udev-settle && \
-  rc-update add loopback sysinit && \
-  rc-update add bootmisc boot && \
-  rc-update add devfs sysinit && \
-  rc-update add dmesg sysinit && \
-  rc-update add hostname boot && \
-  rc-update add hwclock boot && \
-  rc-update add hwdrivers sysinit && \
-  rc-update add modules boot && \
-  rc-update add killprocs shutdown && \
-  rc-update add mount-ro shutdown && \
-  rc-update add savecache shutdown && \
-  rc-update add local default && \
-  cp -a /sbin/init /init && \
-  echo "ttyS0" >> /etc/securetty && \
-  echo "hvc0" >> /etc/securetty && \
-  echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab && \
-  echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab && \
-  echo > /etc/modules && \
-  passwd -d "root" root && \
-  \
-  # Create rootfs
-  cd / && \
-  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var
diff --git a/automation/tests-artifacts/alpine/3.19-arm64v8.dockerfile b/automation/tests-artifacts/alpine/3.19-arm64v8.dockerfile
new file mode 100644
index 000000000000..68a5831bca72
--- /dev/null
+++ b/automation/tests-artifacts/alpine/3.19-arm64v8.dockerfile
@@ -0,0 +1,65 @@
+FROM --platform=linux/arm64/v8 alpine:3.19
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+RUN \
+  # apk
+  apk update && \
+  \
+  # xen runtime deps
+  apk add musl && \
+  apk add openrc && \
+  apk add busybox && \
+  apk add sudo && \
+  apk add dbus && \
+  apk add bash && \
+  apk add python3 && \
+  apk add zlib && \
+  apk add ncurses && \
+  apk add yajl && \
+  apk add libaio && \
+  apk add xz && \
+  apk add util-linux && \
+  apk add argp-standalone && \
+  apk add libfdt && \
+  apk add glib && \
+  apk add pixman && \
+  apk add curl && \
+  apk add udev && \
+  \
+  # Xen
+  cd / && \
+  # Minimal ramdisk environment in case of cpio output
+  rc-update add udev && \
+  rc-update add udev-trigger && \
+  rc-update add udev-settle && \
+  rc-update add networking sysinit && \
+  rc-update add loopback sysinit && \
+  rc-update add bootmisc boot && \
+  rc-update add devfs sysinit && \
+  rc-update add dmesg sysinit && \
+  rc-update add hostname boot && \
+  rc-update add hwclock boot && \
+  rc-update add hwdrivers sysinit && \
+  rc-update add killprocs shutdown && \
+  rc-update add modloop sysinit && \
+  rc-update add modules boot && \
+  rc-update add mount-ro shutdown && \
+  rc-update add savecache shutdown && \
+  rc-update add sysctl boot && \
+  rc-update add local default && \
+  cp -a /sbin/init /init && \
+  echo "ttyS0" >> /etc/securetty && \
+  echo "hvc0" >> /etc/securetty && \
+  echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab && \
+  echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab && \
+  passwd -d "root" root && \
+  \
+  # Create rootfs
+  cd / && \
+  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var
diff --git a/automation/tests-artifacts/alpine/3.19.dockerfile b/automation/tests-artifacts/alpine/3.19.dockerfile
new file mode 100644
index 000000000000..6d665daedfa4
--- /dev/null
+++ b/automation/tests-artifacts/alpine/3.19.dockerfile
@@ -0,0 +1,67 @@
+FROM --platform=linux/amd64 alpine:3.19
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+RUN \
+  # apk
+  apk update && \
+  \
+  # xen runtime deps
+  apk add musl && \
+  apk add libgcc && \
+  apk add openrc && \
+  apk add busybox && \
+  apk add sudo && \
+  apk add dbus && \
+  apk add bash && \
+  apk add python3 && \
+  apk add zlib && \
+  apk add ncurses && \
+  apk add yajl && \
+  apk add libaio && \
+  apk add xz && \
+  apk add util-linux && \
+  apk add argp-standalone && \
+  apk add libfdt && \
+  apk add glib && \
+  apk add pixman && \
+  apk add curl && \
+  apk add udev && \
+  apk add pciutils && \
+  apk add libelf && \
+  apk add libdw && \
+  \
+  # Xen
+  cd / && \
+  # Minimal ramdisk environment in case of cpio output
+  rc-update add udev && \
+  rc-update add udev-trigger && \
+  rc-update add udev-settle && \
+  rc-update add loopback sysinit && \
+  rc-update add bootmisc boot && \
+  rc-update add devfs sysinit && \
+  rc-update add dmesg sysinit && \
+  rc-update add hostname boot && \
+  rc-update add hwclock boot && \
+  rc-update add hwdrivers sysinit && \
+  rc-update add modules boot && \
+  rc-update add killprocs shutdown && \
+  rc-update add mount-ro shutdown && \
+  rc-update add savecache shutdown && \
+  rc-update add local default && \
+  cp -a /sbin/init /init && \
+  echo "ttyS0" >> /etc/securetty && \
+  echo "hvc0" >> /etc/securetty && \
+  echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab && \
+  echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab && \
+  echo > /etc/modules && \
+  passwd -d "root" root && \
+  \
+  # Create rootfs
+  cd / && \
+  tar cvzf /initrd.tar.gz bin dev etc home init lib mnt opt root sbin usr var
-- 
git-series 0.9.1

