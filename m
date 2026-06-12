Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QYV2GtWRLGoFTAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 142A467D021
	for <lists+xen-devel@lfdr.de>; Sat, 13 Jun 2026 01:10:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=citrix.com header.s=google header.b=t5PFUODQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=reject) header.from=citrix.com
Received: from list by lists.xenproject.org with outflank-mailman.1337053.1598740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0I-0002tX-Dr; Fri, 12 Jun 2026 23:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1337053.1598740; Fri, 12 Jun 2026 23:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wYB0I-0002qb-B3; Fri, 12 Jun 2026 23:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1337053;
 Fri, 12 Jun 2026 23:09:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wYB0G-0002Rh-Dp
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 23:09:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wYB0F-00HQFu-R8
 for xen-devel@lists.xenproject.org; Sat, 13 Jun 2026 01:09:31 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91aa-bab6-0a2a0a5309dd-0a2a450cdf7e-2
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:31 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a2c91ab-62f1-0a2a450c0019-d1558029c58b-3
 for <xen-devel@lists.xenproject.org>; Sat, 13 Jun 2026 01:09:31 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490ae94a89eso12816255e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 16:09:31 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0d28sm10035907f8f.20.2026.06.12.16.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 16:09:30 -0700 (PDT)
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
        d=citrix.com; s=google; t=1781305771; x=1781910571; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kcf/WI93RAFHfmUF0my5rnSxM7s1K4C7gOFPv+zFjeM=;
        b=t5PFUODQ9910psNrkjzf0LLsLSa/X3p+v1S2Uw4bx9i2zSafY7R9LYgoJE/4eNYVz1
         pYSVAqVs6nr/r0r2/7YVRlQGs+Md9pE/VIKPhEwViF2JWDYkAA7VdvZIdN5wSpreZpnk
         L0Xe0g7nO5yKdZPyfTuhF0o0jrUDofTjIOytM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781305771; x=1781910571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kcf/WI93RAFHfmUF0my5rnSxM7s1K4C7gOFPv+zFjeM=;
        b=aXlCoOljVLgTUm8Z43kVD7gqj9X1yCF7ky6CplFafRLROl646ho6fLHJFe0LlaXlNi
         xzH7P4V9ZNgJuulDFdfwqccOFQShrTOhOAFPyb50pv5tTjLYUU30a0PcaxkZKVNXdX+Q
         fzn78sf5iOD3DjuNxb6xPK0z6enFzTQAqQKEm11i96TO8Cs4PeJKVz8f6k0SvpQld0fM
         VyDgeYkGT6oFucIjYjf5iWCVCdwcDVW4XIOYyi9AqNOzWNRJmy4+LyInUc7D6eRQ86U2
         ZfHu1IGtCmYf3SiRaaJfZxWElsdXfAcZHmLCWQtj3nBmtNFugahHrsGrmpl84ImSfEdX
         AY+Q==
X-Gm-Message-State: AOJu0YxO1Nk4vRLvvQfgnA6HM8/uQ5Mm2R5utfrttk/QP2uDHZ+OOxxm
	RjSPT3inAUexrIuI6lhNKmrKMap1DAPD1RVks9LRa+ct8Ot/rTXueOSU9I5OcNpx0Zk82lrvsKV
	KjCAW
X-Gm-Gg: Acq92OG22lo1hXSDbj/NZVPT1oDPVmQL6oe3H+AOwsUQS3vEEclAM7EJRK3RNOFtFE0
	X/jg2uggDPxbJ2Lb7b8n9Eg7imGfLcRt3k8uchSFnwwo7o6WIQjHxbQwUzi3CiGCIIj583EK872
	QjWupJo0VRzBadx4MXg2q6zyQWyyV0ADhBmbJgOKk0j2EM/qv++47hzxErGL5Jen0e9sfIaLtGV
	fposQ5ki3NcT8NIFc1rBLojhy/mjN5lntIMZExrmLEKJ0cBJLLfkirrSWufQ3mn/suOrTq7HGNG
	/KjnFXbXJwHJlvbPFOb6VpdnsQTYypDzbx7qV4ox/X3tap1ogySztOxxIyCp3uYnmO3cNzNp02s
	9WmHOuy/XqK1qPsfiNFFEngzPKH793Efii/JgEAat8p8Nm6cgQ4Lob0HZ5q5a2NYM4HcdptPavq
	goLaMhA9lQ1s/kZG5PabSoXJLClpd6dDCBAj6RySM4s3Pu2Sy3JHuQLJuwrq0trkAfsXgHpLWip
	crK
X-Received: by 2002:a05:600c:47d3:b0:490:d354:bcf4 with SMTP id 5b1f17b1804b1-492200e2409mr9061075e9.27.1781305771094;
        Fri, 12 Jun 2026 16:09:31 -0700 (PDT)
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
Subject: [PATCH 5/7] CI: Update the Alpine arm64 container to 3.24
Date: Sat, 13 Jun 2026 00:09:22 +0100
Message-Id: <20260612230924.3181154-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
References: <20260612230924.3181154-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1781305771-E0F62CF5-3A5A4768/10/63158204843
X-purgate-type: spam
X-purgate-size: 11574
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:email,amd.com:email];
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
X-Rspamd-Queue-Id: 142A467D021

Perform standard syntax cleanup and make it a non-root container.  Switch yajl
for json-c given the deprecation of the former.  Drop dev86 which is an
x86-only dependency, and QEMU dependencies as we don't build QEMU in this
environment any more.

When updating the job names, also rename some for consistency so the arm64
fragment comes before the compiler.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Requires the test-artefacts change to add alpine-3.24-arm64-rootfs
---
 .../build/alpine/3.18-arm64v8.dockerfile      | 51 ------------------
 .../build/alpine/3.24-arm64v8.dockerfile      | 53 +++++++++++++++++++
 automation/gitlab-ci/build.yaml               | 32 +++++------
 automation/gitlab-ci/test.yaml                | 30 +++++------
 4 files changed, 84 insertions(+), 82 deletions(-)
 delete mode 100644 automation/build/alpine/3.18-arm64v8.dockerfile
 create mode 100644 automation/build/alpine/3.24-arm64v8.dockerfile

diff --git a/automation/build/alpine/3.18-arm64v8.dockerfile b/automation/build/alpine/3.18-arm64v8.dockerfile
deleted file mode 100644
index b8482d5bf43f..000000000000
--- a/automation/build/alpine/3.18-arm64v8.dockerfile
+++ /dev/null
@@ -1,51 +0,0 @@
-# syntax=docker/dockerfile:1
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
-  expect \
diff --git a/automation/build/alpine/3.24-arm64v8.dockerfile b/automation/build/alpine/3.24-arm64v8.dockerfile
new file mode 100644
index 000000000000..5b28d874efae
--- /dev/null
+++ b/automation/build/alpine/3.24-arm64v8.dockerfile
@@ -0,0 +1,53 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 alpine:3.24
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
+        dtc-dev
+        json-c-dev
+        util-linux-dev
+        # xentop
+        ncurses-dev
+        # Python bindings
+        python3-dev
+        py3-setuptools
+        # Ocaml bindings/oxenstored
+        ocaml
+        ocaml-findlib
+    )
+
+    apk add --no-cache "${DEPS[@]}"
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index e295f4d4f25f..fa054a82800b 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -401,68 +401,68 @@ debian-13-arm64-gcc-debug:
   variables:
     CONTAINER: debian:13-arm64v8
 
-alpine-3.18-gcc-arm64:
+alpine-3.24-arm64-gcc:
   extends: .gcc-arm64-build
   <<: *build-test
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.24-arm64v8
 
-alpine-3.18-gcc-debug-arm64:
+alpine-3.24-arm64-gcc-debug:
   extends: .gcc-arm64-build-debug
   <<: *build-test
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.24-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
 
-alpine-3.18-gcc-arm64-randconfig:
+alpine-3.24-arm64-gcc-randconfig:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.24-arm64v8
     RANDCONFIG: y
 
-alpine-3.18-gcc-debug-arm64-staticmem:
+alpine-3.24-arm64-gcc-debug-staticmem:
   extends: .gcc-arm64-build-debug
   <<: *build-test
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.24-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
 
-alpine-3.18-gcc-debug-arm64-static-shared-mem:
+alpine-3.24-arm64-gcc-debug-static-shared-mem:
   extends: .gcc-arm64-build-debug
   <<: *build-test
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.24-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
       CONFIG_STATIC_SHM=y
 
-alpine-3.18-gcc-debug-arm64-boot-cpupools:
+alpine-3.24-arm64-gcc-debug-boot-cpupools:
   extends: .gcc-arm64-build-debug
   <<: *build-test
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.24-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
-alpine-3.18-gcc-debug-arm64-earlyprintk:
+alpine-3.24-arm64-gcc-debug-earlyprintk:
   extends: .gcc-arm64-build-debug
   <<: *build-test
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.24-arm64v8
     EXTRA_XEN_CONFIG: |
       CONFIG_EARLY_UART_CHOICE_PL011=y
       CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
 
-alpine-3.18-gcc-debug-arm64-mpu:
+alpine-3.24-arm64-gcc-debug-mpu:
   extends: .gcc-arm64-build-debug
   variables:
-    CONTAINER: alpine:3.18-arm64v8
+    CONTAINER: alpine:3.24-arm64v8
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
       CONFIG_XEN_START_ADDRESS=0x0
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index b651efef1593..2a7a0e513e72 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -10,7 +10,7 @@
     job: $LINUX_JOB_ARM64
     ref: $ARTIFACTS_BRANCH
   - project: $ARTIFACTS_REPO
-    job: alpine-3.18-arm64-rootfs
+    job: alpine-3.24-arm64-rootfs
     ref: $ARTIFACTS_BRANCH
 
 .arm32-test-needs: &arm32-test-needs
@@ -220,7 +220,7 @@ xilinx-smoke-dom0less-arm64-gcc-debug:
     - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64
+    - alpine-3.24-arm64-gcc-debug
 
 xilinx-smoke-dom0less-arm64-gcc-debug-gem-passthrough:
   extends: .xilinx-arm64
@@ -228,7 +228,7 @@ xilinx-smoke-dom0less-arm64-gcc-debug-gem-passthrough:
     - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh gem-passthrough 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64
+    - alpine-3.24-arm64-gcc-debug
 
 xilinx-smoke-dom0-x86_64-gcc-debug:
   extends: .xilinx-x86_64
@@ -494,7 +494,7 @@ qemu-smoke-dom0-arm64-gcc:
     - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
+    - alpine-3.24-arm64-gcc
 
 qemu-smoke-dom0-arm64-gcc-debug:
   extends: .qemu-arm64
@@ -502,7 +502,7 @@ qemu-smoke-dom0-arm64-gcc-debug:
     - ./automation/scripts/qemu-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64
+    - alpine-3.24-arm64-gcc-debug
 
 qemu-smoke-dom0less-arm64-gcc:
   extends: .qemu-arm64
@@ -510,7 +510,7 @@ qemu-smoke-dom0less-arm64-gcc:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
+    - alpine-3.24-arm64-gcc
 
 qemu-smoke-dom0less-arm64-gcc-debug:
   extends: .qemu-arm64
@@ -518,7 +518,7 @@ qemu-smoke-dom0less-arm64-gcc-debug:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64
+    - alpine-3.24-arm64-gcc-debug
 
 qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
   extends: .qemu-arm64
@@ -526,7 +526,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-gicv3:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh gicv3 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64
+    - alpine-3.24-arm64-gcc-debug
 
 qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
   extends: .qemu-arm64
@@ -534,7 +534,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticmem:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64-staticmem
+    - alpine-3.24-arm64-gcc-debug-staticmem
 
 qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
  extends: .qemu-arm64
@@ -542,7 +542,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-staticheap:
    - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-heap 2>&1 | tee ${LOGFILE}
  needs:
    - *arm64-test-needs
-   - alpine-3.18-gcc-debug-arm64
+   - alpine-3.24-arm64-gcc-debug
 
 qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
   extends: .qemu-arm64
@@ -550,7 +550,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-static-shared-mem:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh static-shared-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64-static-shared-mem
+    - alpine-3.24-arm64-gcc-debug-static-shared-mem
 
 qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
   extends: .qemu-arm64
@@ -558,7 +558,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-boot-cpupools:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh boot-cpupools 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64-boot-cpupools
+    - alpine-3.24-arm64-gcc-debug-boot-cpupools
 
 qemu-smoke-dom0less-arm64-gcc-debug-earlyprintk:
   extends: .qemu-arm64
@@ -566,7 +566,7 @@ qemu-smoke-dom0less-arm64-gcc-debug-earlyprintk:
     - ./automation/scripts/qemu-smoke-dom0less-arm64.sh earlyprintk 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64-earlyprintk
+    - alpine-3.24-arm64-gcc-debug-earlyprintk
 
 qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
   extends: .qemu-arm64
@@ -574,7 +574,7 @@ qemu-xtf-dom0less-arm64-gcc-hyp-xen-version:
     - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-arm64
+    - alpine-3.24-arm64-gcc
 
 qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
   extends: .qemu-arm64
@@ -582,7 +582,7 @@ qemu-xtf-dom0less-arm64-gcc-debug-hyp-xen-version:
     - ./automation/scripts/qemu-xtf.sh arm64 mmu64le hyp-xen-version 2>&1 | tee ${LOGFILE}
   needs:
     - *arm64-test-needs
-    - alpine-3.18-gcc-debug-arm64
+    - alpine-3.24-arm64-gcc-debug
 
 qemu-smoke-dom0-arm32-gcc:
   extends: .qemu-arm32
-- 
2.39.5


