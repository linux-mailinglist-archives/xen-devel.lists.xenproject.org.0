Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pSgnMdKRLGr/SwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D33F67D00D
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=RmYL127n;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1337052.1598731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0H-0002dw-1G; Fri, 12 Jun 2026 23:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337052.1598731; Fri, 12 Jun 2026 23:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0G-0002bd-UY; Fri, 12 Jun 2026 23:09:32 +0000
Received: by outflank-mailman (input) for mailman id 1337052;
 Fri, 12 Jun 2026 23:09:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wYB0F-00029X-NH
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 23:09:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYB0F-00HIs8-3w
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 01:09:31 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c915b-5cb7-0a2a0a5109dd-0a2a4502ddb2-22
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:31 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91aa-af86-0a2a45020019-d155dd2ca954-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:31 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-45ee5cdbd28so1556248f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:09:31 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d28sm10035907f8f.20.2026.06.12.16.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 16:09:29 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1781305770; x=1781910570; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNdU35BttH64TZdXrpZk6Pea4Pf1aJ80D0BD0gDbtew=;
        b=RmYL127n0BEpxndNEtFRg/keMW495qiSX/GwTPGq66Rfx9obRxn4FJ/lD1VFZpog0N
         JVwkUfCiOuy0mco39svRfNppNm+VFNu5piYuVo5HbuZrmKSSZlDM1mqEHn8GBm3whK/k
         d+Lo6cUWhhUoSGheE4nAOEKx0LTPtKeGryAHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781305770; x=1781910570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mNdU35BttH64TZdXrpZk6Pea4Pf1aJ80D0BD0gDbtew=;
        b=IWf+LeiYjBvKvninzhCXSdMUtAmZ2P4c64Ks52dMvVQdmwIWCFxH0Ia2eapK3uHygR
         dSr5esztzg0sgOfB9Bg9v9tM8ueEhom09FiQ7NQ+oEiKIPFZYZeEfBI+KlVcy2DHBfL8
         aSLasfxuLiGO9udYblKYHuFd9jIOZ6Up1wos76xCgsAQ/VRAH3QeEZ36h09G1q0tzSRp
         8QqtqopSmrUiPU+kZOkRTuEqYIjXM0xsbMRA8Sv41g18F95wfnwa3zy04UOTXlLj1CmQ
         PVMyEdl3NCvLTpJhiuOfhhgXSHkZeEjbrirHuwN5TQBI0PTKKR7/5wGC3RqcudjqoPHM
         K+hg==
X-Gm-Message-State: AOJu0YzG9yNPH0Q4Ux7qQtvnatopT7KC0F2R8legAtSxtNfUQfbWtojD
	RMJwRV4zSHEoGIOxGCiCGDQVIuTtxu4ms3GEaxJKcBLlvawLzmwlpDIPPWeDlTcXbL+53QxF/Wy
	KxG77
X-Gm-Gg: Acq92OEvysOQGEczuSeqSMu0dAkw189/C7akp7ig/tdN5oIviYHStPCMslKY7QT27Lr
	yFJs26PoKSjPlWfuJ7sQwkNvDbO3CJB7Kt8e94AUmdb2cJaRKPmuuY97GF5ZSKRpjc3WKsTYiPp
	tBt1n/KJXgVFb8Xyqahw7stjSb1i1qRvkzYMGm/H88nkmxDTImlwelAfFSUmaYBq5Qwgua+P2y1
	aQJrT1NVPvXc6K7EI343wbFMRFBsJDVuQPf26F2R9OFybhmn9k9ltSFx0VErftQNa8gMpTrf4sN
	ufLaspa7rpbm19lvvT3FdeZMV8uy/pFK2Mw/qffHe99KLdL67v7HDAoENg19u5ZYf/RXfFry69J
	wuZBdS9yt9gWvi+sA9W504Lj+MQuNH4YZuUbP8pyShRk4LpCEP3P+glMtemn8nDd+6jp1aiINyb
	XRq3XvUahIeBIz9tZC1XVR5PTBNJPorFtHfT1+U//wMQc/KIhpaMZpqfK+Aj3o5VVZD2iLNwilS
	UrdMpgQAT/YrCY=
X-Received: by 2002:a5d:64cd:0:b0:460:395c:7404 with SMTP id ffacd0b85a97d-4606f25dd0dmr6094805f8f.20.1781305770305;
        Fri, 12 Jun 2026 16:09:30 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 4/7] CI: Update the Alpine x86_64 container to 3.24
Date: Sat, 13 Jun 2026 00:09:21 +0100
Message-Id: <20260612230924.3181154-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1781305771-8256B161-373B2C2A/10/63158204843
X-purgate-type: spam
X-purgate-size: 15246
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.32 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,vates.tech,kernel.org,amd.com,cardoe.com,invisiblethingslab.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,vates.tech:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3D33F67D00D

Perform standard syntax cleanup and make it a non-root container.  Switch yajl
for json-c given the deprecation of the former.

Add an x86_64 suffix for naming consistency with everything else.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Requires the test-artefacts change to add alpine-3.24-x86_64-rootfs
---
 automation/build/alpine/3.18.dockerfile       | 52 ---------------
 .../build/alpine/3.24-x86_64.dockerfile       | 65 ++++++++++++++++++
 automation/gitlab-ci/build.yaml               | 16 ++---
 automation/gitlab-ci/test.yaml                | 66 +++++++++----------
 automation/scripts/containerize               |  2 +-
 5 files changed, 107 insertions(+), 94 deletions(-)
 delete mode 100644 automation/build/alpine/3.18.dockerfile
 create mode 100644 automation/build/alpine/3.24-x86_64.dockerfile

diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
deleted file mode 100644
index 263e9e90d888..000000000000
--- a/automation/build/alpine/3.18.dockerfile
+++ /dev/null
@@ -1,52 +0,0 @@
-# syntax=docker/dockerfile:1
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
diff --git a/automation/build/alpine/3.24-x86_64.dockerfile b/automation/build/alpine/3.24-x86_64.dockerfile
new file mode 100644
index 000000000000..f93158e0186d
--- /dev/null
+++ b/automation/build/alpine/3.24-x86_64.dockerfile
@@ -0,0 +1,65 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 alpine:3.24
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+RUN apk --no-cache add bash
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    adduser -D user
+
+    DEPS=(
+        # Xen
+        bison
+        clang
+        flex
+        g++
+        gcc
+        make
+
+        # Tools (general)
+        argp-standalone
+        autoconf
+        git
+        linux-headers
+        patch
+        # libxenguest dombuilder
+        bzip2-dev
+        xz-dev
+        zlib-dev
+        zstd-dev
+        # libacpi
+        iasl
+        # libxl
+        util-linux-dev
+        json-c-dev
+        # RomBIOS
+        dev86
+        # xentop
+        ncurses-dev
+        # Python bindings
+        python3-dev
+        py3-setuptools
+        # Ocaml bindings/oxenstored
+        ocaml
+        ocaml-findlib
+
+        # QEMU
+        glib-dev
+        libattr
+        libcap-ng-dev
+        ninja
+        pixman-dev
+
+        # livepatch-tools deps
+        elfutils-dev
+    )
+
+    apk add --no-cache "${DEPS[@]}"
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 9eda40dc6e57..e295f4d4f25f 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -270,17 +270,17 @@
 
 # Build jobs needed for tests
 
-alpine-3.18-gcc:
+alpine-3.24-x86_64-gcc:
   extends: .gcc-x86-64-build
   <<: *build-test
   variables:
-    CONTAINER: alpine:3.18
+    CONTAINER: alpine:3.24-x86_64
 
-alpine-3.18-gcc-debug:
+alpine-3.24-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   <<: *build-test
   variables:
-    CONTAINER: alpine:3.18
+    CONTAINER: alpine:3.24-x86_64
     BUILD_QEMU_XEN: y
     EXTRA_XEN_CONFIG: |
       CONFIG_EXPERT=y
@@ -513,15 +513,15 @@ debian-12-arm64-gcc-cppcheck:
 
 # Build jobs not needed for tests
 
-alpine-3.18-clang:
+alpine-3.24-x86_64-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: alpine:3.18
+    CONTAINER: alpine:3.24-x86_64
 
-alpine-3.18-clang-debug:
+alpine-3.24-x86_64-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: alpine:3.18
+    CONTAINER: alpine:3.24-x86_64
 
 archlinux-x86_64-gcc:
   extends: .gcc-x86-64-build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 70bb4bbb3b45..b651efef1593 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -26,7 +26,7 @@
     job: $LINUX_JOB_X86_64
     ref: $ARTIFACTS_BRANCH
   - project: $ARTIFACTS_REPO
-    job: alpine-3.18-x86_64-rootfs
+    job: alpine-3.24-x86_64-rootfs
     ref: $ARTIFACTS_BRANCH
   - project: $ARTIFACTS_REPO
     job: microcode-x86
@@ -236,19 +236,19 @@ xilinx-smoke-dom0-x86_64-gcc-debug:
     - ./automation/scripts/xilinx-smoke-dom0-x86_64.sh ping 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 xilinx-smoke-dom0-x86_64-gcc-debug-argo:
   extends: .xilinx-x86_64
   script:
     - ./automation/scripts/xilinx-smoke-dom0-x86_64.sh argo 2>&1 | tee ${LOGFILE}
   needs:
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
     - project: xen-project/hardware/test-artifacts
       job: linux-6.6.56-x86_64
       ref: master
     - project: xen-project/hardware/test-artifacts
-      job: alpine-3.18-x86_64-rootfs
+      job: alpine-3.24-x86_64-rootfs
       ref: master
     - project: xen-project/hardware/test-artifacts
       job: microcode-x86
@@ -260,7 +260,7 @@ adl-smoke-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 adl-smoke-x86-64-dom0pvh-gcc-debug:
   extends: .adl-x86-64
@@ -268,7 +268,7 @@ adl-smoke-x86-64-dom0pvh-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 adl-smoke-x86-64-dom0pvh-hvm-gcc-debug:
   extends: .adl-x86-64
@@ -276,7 +276,7 @@ adl-smoke-x86-64-dom0pvh-hvm-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 adl-suspend-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -284,7 +284,7 @@ adl-suspend-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 adl-pci-pv-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -292,7 +292,7 @@ adl-pci-pv-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 adl-pci-hvm-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -300,7 +300,7 @@ adl-pci-hvm-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 adl-pvshim-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -308,7 +308,7 @@ adl-pvshim-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 adl-tools-tests-pv-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -319,7 +319,7 @@ adl-tools-tests-pv-x86-64-gcc-debug:
       junit: tests-junit.xml
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 adl-tools-tests-pvh-x86-64-gcc-debug:
   extends: .adl-x86-64
@@ -330,7 +330,7 @@ adl-tools-tests-pvh-x86-64-gcc-debug:
       junit: tests-junit.xml
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 kbl-smoke-x86-64-gcc-debug:
   extends: .kbl-x86-64
@@ -338,7 +338,7 @@ kbl-smoke-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 kbl-smoke-x86-64-dom0pvh-gcc-debug:
   extends: .kbl-x86-64
@@ -346,7 +346,7 @@ kbl-smoke-x86-64-dom0pvh-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 kbl-smoke-x86-64-dom0pvh-hvm-gcc-debug:
   extends: .kbl-x86-64
@@ -354,7 +354,7 @@ kbl-smoke-x86-64-dom0pvh-hvm-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 kbl-suspend-x86-64-gcc-debug:
   extends: .kbl-x86-64
@@ -362,7 +362,7 @@ kbl-suspend-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 kbl-pci-pv-x86-64-gcc-debug:
   extends: .kbl-x86-64
@@ -370,7 +370,7 @@ kbl-pci-pv-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pci-pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 kbl-pci-hvm-x86-64-gcc-debug:
   extends: .kbl-x86-64
@@ -378,7 +378,7 @@ kbl-pci-hvm-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 kbl-pvshim-x86-64-gcc-debug:
   extends: .kbl-x86-64
@@ -386,7 +386,7 @@ kbl-pvshim-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 kbl-tools-tests-pv-x86-64-gcc-debug:
   extends: .kbl-x86-64
@@ -397,7 +397,7 @@ kbl-tools-tests-pv-x86-64-gcc-debug:
       junit: tests-junit.xml
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 kbl-tools-tests-pvh-x86-64-gcc-debug:
   extends: .kbl-x86-64
@@ -408,7 +408,7 @@ kbl-tools-tests-pvh-x86-64-gcc-debug:
       junit: tests-junit.xml
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 zen2-smoke-x86-64-gcc-debug:
   extends: .zen2-x86-64
@@ -416,7 +416,7 @@ zen2-smoke-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 zen2-suspend-x86-64-gcc-debug:
   extends: .zen2-x86-64
@@ -424,7 +424,7 @@ zen2-suspend-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh s3 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 zen3p-smoke-x86-64-gcc-debug:
   extends: .zen3p-x86-64
@@ -432,7 +432,7 @@ zen3p-smoke-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pv 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 zen3p-smoke-x86-64-dom0pvh-gcc-debug:
   extends: .zen3p-x86-64
@@ -440,7 +440,7 @@ zen3p-smoke-x86-64-dom0pvh-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 zen3p-smoke-x86-64-dom0pvh-hvm-gcc-debug:
   extends: .zen3p-x86-64
@@ -448,7 +448,7 @@ zen3p-smoke-x86-64-dom0pvh-hvm-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh dom0pvh-hvm 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 zen3p-pci-hvm-x86-64-gcc-debug:
   extends: .zen3p-x86-64
@@ -456,7 +456,7 @@ zen3p-pci-hvm-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pci-hvm 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 zen3p-pvshim-x86-64-gcc-debug:
   extends: .zen3p-x86-64
@@ -464,7 +464,7 @@ zen3p-pvshim-x86-64-gcc-debug:
     - ./automation/scripts/qubes-x86-64.sh pvshim 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 zen3p-tools-tests-pv-x86-64-gcc-debug:
   extends: .zen3p-x86-64
@@ -475,7 +475,7 @@ zen3p-tools-tests-pv-x86-64-gcc-debug:
       junit: tests-junit.xml
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 zen3p-tools-tests-pvh-x86-64-gcc-debug:
   extends: .zen3p-x86-64
@@ -486,7 +486,7 @@ zen3p-tools-tests-pvh-x86-64-gcc-debug:
       junit: tests-junit.xml
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
@@ -654,7 +654,7 @@ qemu-alpine-x86_64-gcc:
     - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *x86-64-test-needs
-    - alpine-3.18-gcc
+    - alpine-3.24-x86_64-gcc
 
 qemu-smoke-x86-64-gcc:
   extends: .qemu-smoke-x86-64
@@ -698,7 +698,7 @@ qemu-xtf-argo-x86_64-gcc-debug:
   script:
     - ./automation/scripts/qemu-xtf.sh x86-64 pv64 argo 2>&1 | tee ${LOGFILE}
   needs:
-    - alpine-3.18-gcc-debug
+    - alpine-3.24-x86_64-gcc-debug
 
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index aea842e1ff2d..e9b2f6122ff1 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -24,7 +24,7 @@ die() {
 #
 BASE="registry.gitlab.com/xen-project/xen"
 case "_${CONTAINER}" in
-    _alpine) CONTAINER="${BASE}/alpine:3.18" ;;
+    _alpine) CONTAINER="${BASE}/alpine:3.24-x86_64" ;;
     _alpine-arm64v8) CONTAINER="${BASE}/alpine:3.18-arm64v8" ;;
     _archlinux|_arch) CONTAINER="${BASE}/archlinux:current-x86_64" ;;
     _fedora) CONTAINER="${BASE}/fedora:43-x86_64";;
-- 
2.39.5


