Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A9CB52436
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 00:23:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118863.1464531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwTDn-00023e-1T; Wed, 10 Sep 2025 22:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118863.1464531; Wed, 10 Sep 2025 22:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwTDm-0001yM-TO; Wed, 10 Sep 2025 22:23:22 +0000
Received: by outflank-mailman (input) for mailman id 1118863;
 Wed, 10 Sep 2025 22:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwTDl-0001Ut-9z
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 22:23:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0c09841-8e94-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 00:23:19 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45df0cde41bso537035e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 15:23:19 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e01ba9601sm2452195e9.23.2025.09.10.15.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 15:23:17 -0700 (PDT)
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
X-Inumbo-ID: c0c09841-8e94-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757542998; x=1758147798; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsvDGYEPLweUsKTm32GOVy1k3irFVmqIwkK2ri34C6c=;
        b=wW0gWllulCT8YSPivyvySTV5bWqbxSVABLm30yf6ILep/y1u0X8EqGgZeWR2wyiF8O
         ATXsnpRnoQrjNSeJJtBO2If22IyIKPH1oqRl2icBo6F8A+xWAPNUysTmM6s4VwOlry/u
         5/crPMTWPacp9+0SeCiqSh8bVQTpC1aXwadRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757542998; x=1758147798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsvDGYEPLweUsKTm32GOVy1k3irFVmqIwkK2ri34C6c=;
        b=h2/CcHOkR+DlNERYar2Icpp747/ugEDIgO8emyaJ+kwsVlYCFfw2E6amEXkSBy1RMX
         mXM5GUN58FMRXhzQKI3o11QxqZ0grPDUr9kXQWGB9abx3+Ull8KZjmtN99BCUIbHOEX0
         Wicr6oa2Nt0VZ28qJ9VHmvvMncFrFmR4qStwXelgD9dacV+HHdg0BJPvw1Q5QDHzHVq/
         5JTsSz8eZ9z1GxcT7/efGk2H+/rwlJiJnqSmazib/9jWHqp4P2rDir6wJr23MAcJV250
         fUEsaz2GcYsC+Yut/NpZrUWb02OPGbbec1tZBGNoKf+hrUlR/IQGPmy+wkgnrBSSNZUK
         6BbA==
X-Gm-Message-State: AOJu0YycBfAHAZm1ni8DpyDR8k6M7NI+XKj7+Aht6illEx8QzL3QKorM
	WXEFVdDpki3NRbUATbEVkkpXOrzYXQYaNkSqmV7ufqpMgv1kMfbiG7L5V9Y9klAvmI9knWQSkEo
	sEq+/
X-Gm-Gg: ASbGncs7slq+5jJ8sfnFPrW2q2tsJzCPw1DRGdgx3Fil7W5XxupfK2RxBOPoji6wofB
	7W9iy1XBpBEEL9F6FEDoqb341AIZFaXUCVRIcumtBADyOB/mTQmuuIAkvK+qyV28OyUGRAC2NAy
	9OKtEI7UHXabjnIB0IcAq/jcHq9Av2vB6ng7+vQfjj7/J1IPqXu1glFOMp+/0Pqp5JLE51QyonK
	uuJj8J5cfMhwkwteEVA2VhRiR9JUhQDTdjOOfTaSF9uzFSgXihAfysHlFCN7HVPHGnud+jfA7x7
	c7kWojxUto123H28PR82EBPetIQFOhHWuioeMq1YF3nRfwP3kKe8+ORehQC6/lQyUobpkUO1eZT
	RTQ0SmcZBoLGyJuYnhTOZW720Ju7v2mJZsjJdVr3rQ2iBSPiFC4MLDAKlWAaJQC4sso0DYgLfHA
	le
X-Google-Smtp-Source: AGHT+IGTlp7M9spv7PmpNnsSzBzGa6seXyBhwBa1Q1awbDimc5tqzQ8CHbWBh7Wy9zPMbG0aLrgwBg==
X-Received: by 2002:a05:600c:8b22:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-45dddec82fdmr190022735e9.17.1757542998184;
        Wed, 10 Sep 2025 15:23:18 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH v2 2/3] CI: Update x86 to use Debian Trixie
Date: Wed, 10 Sep 2025 23:23:12 +0100
Message-Id: <20250910222313.1858941-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250910222313.1858941-1-andrew.cooper3@citrix.com>
References: <20250910222313.1858941-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the exception of the custom IBT job, copy all Debian 12 jobs making
Debian 13 versions, then trim the Debian 12 ranconfig jobs.

Update the test jobs using Debian 12 to use 13.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

v2:
 * Make 13-x86_64 be root-less
 * Update containerize

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2032972883
---
 automation/build/debian/13-x86_32.dockerfile | 51 +++++++++++++
 automation/build/debian/13-x86_64.dockerfile | 76 ++++++++++++++++++++
 automation/gitlab-ci/build.yaml              | 54 ++++++++++----
 automation/gitlab-ci/test.yaml               | 10 +--
 automation/scripts/containerize              |  3 +-
 5 files changed, 176 insertions(+), 18 deletions(-)
 create mode 100644 automation/build/debian/13-x86_32.dockerfile
 create mode 100644 automation/build/debian/13-x86_64.dockerfile

diff --git a/automation/build/debian/13-x86_32.dockerfile b/automation/build/debian/13-x86_32.dockerfile
new file mode 100644
index 000000000000..2bd11af5a0c3
--- /dev/null
+++ b/automation/build/debian/13-x86_32.dockerfile
@@ -0,0 +1,51 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/i386 debian:trixie-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    apt-get update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        clang
+        flex
+
+        # Tools (general)
+        ca-certificates
+        git-core
+        pkg-config
+        wget
+        # libacpi
+        acpica-tools
+        # libxl
+        uuid-dev
+        libyajl-dev
+        # xentop
+        libncurses5-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Ocaml bindings/oxenstored
+        ocaml-nox
+        ocaml-findlib
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER user
+WORKDIR /build
+ENTRYPOINT ["linux32"]
diff --git a/automation/build/debian/13-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
new file mode 100644
index 000000000000..20e9d2f3f52d
--- /dev/null
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -0,0 +1,76 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:trixie-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    apt-get update
+
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        clang
+        flex
+
+        # Tools (general)
+        ca-certificates
+        git-core
+        pkg-config
+        wget
+        # libxenguest dombuilder
+        libbz2-dev
+        liblzma-dev
+        liblzo2-dev
+        libzstd-dev
+        zlib1g-dev
+        # libacpi
+        acpica-tools
+        # libxl
+        uuid-dev
+        libnl-3-dev
+        libyajl-dev
+        # RomBIOS
+        bcc
+        bin86
+        # xentop
+        libncurses5-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Golang bindings
+        golang-go
+        # Ocaml bindings/oxenstored
+        ocaml-nox
+        ocaml-findlib
+
+        # for test phase, qemu-smoke-* jobs
+        expect
+        qemu-system-x86
+
+        # for build-each-commit-gcc
+        ccache
+
+        # for qemu-alpine-x86_64-gcc
+        busybox-static
+        cpio
+
+        # For *-efi jobs
+        ovmf
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index f8e45f3467c8..4cb52fe59715 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -309,15 +309,15 @@ alpine-3.18-gcc-debug:
       CONFIG_UCODE_SCAN_DEFAULT=y
       CONFIG_XHCI=y
 
-debian-12-x86_64-gcc-debug:
+debian-13-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: debian:12-x86_64
+    CONTAINER: debian:13-x86_64
 
-debian-12-x86_64-clang-debug:
+debian-13-x86_64-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: debian:12-x86_64
+    CONTAINER: debian:13-x86_64
 
 debian-13-ppc64le-gcc-debug:
   extends: .gcc-ppc64le-cross-build-debug
@@ -545,24 +545,20 @@ debian-12-x86_64-clang:
   variables:
     CONTAINER: debian:12-x86_64
 
-debian-12-x86_64-clang-randconfig:
-  extends: .clang-x86-64-build
+debian-12-x86_64-clang-debug:
+  extends: .clang-x86-64-build-debug
   variables:
     CONTAINER: debian:12-x86_64
-    RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG: |
-      CONFIG_COVERAGE=n # Disable coverage otherwise build times out.
 
 debian-12-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
     CONTAINER: debian:12-x86_64
 
-debian-12-x86_64-gcc-randconfig:
-  extends: .gcc-x86-64-build
+debian-12-x86_64-gcc-debug:
+  extends: .gcc-x86-64-build-debug
   variables:
     CONTAINER: debian:12-x86_64
-    RANDCONFIG: y
 
 debian-12-x86_32-clang-debug:
   extends: .clang-x86-32-build-debug
@@ -574,6 +570,40 @@ debian-12-x86_32-gcc-debug:
   variables:
     CONTAINER: debian:12-x86_32
 
+debian-13-x86_64-clang:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+
+debian-13-x86_64-clang-randconfig:
+  extends: .clang-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+    RANDCONFIG: y
+    EXTRA_FIXED_RANDCONFIG: |
+      CONFIG_COVERAGE=n # Disable coverage otherwise build times out.
+
+debian-13-x86_64-gcc:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+
+debian-13-x86_64-gcc-randconfig:
+  extends: .gcc-x86-64-build
+  variables:
+    CONTAINER: debian:13-x86_64
+    RANDCONFIG: y
+
+debian-13-x86_32-clang-debug:
+  extends: .clang-x86-32-build-debug
+  variables:
+    CONTAINER: debian:13-x86_32
+
+debian-13-x86_32-gcc-debug:
+  extends: .gcc-x86-32-build-debug
+  variables:
+    CONTAINER: debian:13-x86_32
+
 fedora-41-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 9acd984d294c..96e952235737 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -661,35 +661,35 @@ qemu-smoke-x86-64-gcc:
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-gcc-debug
+    - debian-13-x86_64-gcc-debug
 
 qemu-smoke-x86-64-clang:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 pv64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-clang-debug
+    - debian-13-x86_64-clang-debug
 
 qemu-smoke-x86-64-gcc-pvh:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-gcc-debug
+    - debian-13-x86_64-gcc-debug
 
 qemu-smoke-x86-64-clang-pvh:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 hvm64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-clang-debug
+    - debian-13-x86_64-clang-debug
 
 qemu-smoke-x86-64-gcc-efi:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64-efi pv64 example 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-x86_64-gcc-debug
+    - debian-13-x86_64-gcc-debug
 
 qemu-xtf-argo-x86_64-gcc-debug:
   extends: .qemu-smoke-x86-64
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 65c8804ce5f3..743567cb772a 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -35,7 +35,8 @@ case "_${CONTAINER}" in
     _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
     _trixie-riscv64) CONTAINER="${BASE}/debian:13-riscv64" ;;
     _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
-    _bookworm|_bookworm-x86_64|_) CONTAINER="${BASE}/debian:12-x86_64" ;;
+    _bookworm|_bookworm-x86_64) CONTAINER="${BASE}/debian:12-x86_64" ;;
+    _trixie-x86_64|_) CONTAINER="${BASE}/debian:13-x86_64" ;;
     _bookworm-i386|_bookworm-x86_32) CONTAINER="${BASE}/debian:12-x86_32" ;;
     _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:bookworm-arm64v8-arm32-gcc" ;;
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
-- 
2.39.5


