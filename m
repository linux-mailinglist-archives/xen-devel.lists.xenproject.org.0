Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BnhDL7hV/mmepQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312204FBE9B
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304251.1577347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSl0-0005F5-8A; Fri, 08 May 2026 21:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304251.1577347; Fri, 08 May 2026 21:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSl0-0005C1-4B; Fri, 08 May 2026 21:29:14 +0000
Received: by outflank-mailman (input) for mailman id 1304251;
 Fri, 08 May 2026 21:29:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLSky-0004lM-8S
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 21:29:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSkx-00E1Ak-Lx
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 23:29:11 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe5538-bab6-0a2a0a5309dd-0a2a4507b2e6-32
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:11 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe55a7-229c-0a2a45070019-d155dd36acc1-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:11 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-44e1860558fso1643891f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 14:29:11 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491ca383asm7548608f8f.28.2026.05.08.14.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 14:29:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1778275751; x=1778880551; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOnPZ71Y6QNC+1FR8zvXZiIznnQQDmHT9JY/KOQdFvo=;
        b=X7BqLKEy4gXZAv3KT3EqIDF3wIHyYSK95tl53WVDgMMWPfPY17jOxMsl+ZwwFtytkv
         JjNxa/Jpg4BFzPmfA2B4wqOCMEZoUVNIZQrpORdTHCxFey+hRjAzHYnrxueam/cZpGK9
         ZvANm2BIxV7Rmy18wAYiLSFkgimPOfxrBrDj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275751; x=1778880551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nOnPZ71Y6QNC+1FR8zvXZiIznnQQDmHT9JY/KOQdFvo=;
        b=RdVOCPpmKH2cG7hjrkctJV3A4ZmIu2zQOUujhDOaiAVruviX0GL4BUbfm9yBc4JV6R
         CcSyK/qLVJHnXFW4U3rFhB9RBeighRAOTAGzmRpo3FdrgpnpYUgzYP+yZR/1QUZJqWPr
         hvBL20C7PBjraFjfKUWWrBkWwwNabUFMYxcyW1BRJakv5ObiAO1pLaMg0ByTiURG1+a7
         uFzdkqiTbEYfs2P9OZzjTx8DlDesG1tGDt0PV86LPAgwsWdkwLN4EltYxDyrje3eTBk1
         ScIpWq7k8g89L5Rs6o7zyN1Y+FLGYrmn78u33TjzypKrnrD4RSkdRFsQjy+qI/4Q591L
         fs3Q==
X-Gm-Message-State: AOJu0YyjKTIP8f+jbkReqS2k75KkBMYs4Dh/IQoejZbyvODgc2Mh0MHC
	YWCibyXHh4RTQb8JdBIFND2vqkIl18W7dBMupWLYZLBKbqV0WBAn8eiFGcN2H8QeGTOmnvOoLGu
	is6GAJFw=
X-Gm-Gg: Acq92OHoaps9N/wvCAlEelm4YHzzc4tFTjK1oOMMZVEVw313i7kNfjEJuhm8+oJt/qn
	AowirBr9Rm/jLKnIah/K4xFnt6ueoAdgtIUJFVb7vZeuBCCNX0XGzEnJsh4JVU0LRwT17LW5a0r
	eW+KSpSURtUhFQFcLbNfCIVHjy9+CqKQBtw/7vB4nN0xe4+kQy8BnCOrPMizUlULT8bOniEDlvA
	C9ltmPimuy420PgAbBWc7ICAVlFF2ApByV3wAObHH4CdCbHmZ8RDdb4k3BrfF9TITikuV7FQx6C
	+4oxgk/zGbbYy5vugi+7/XpK7T7tEmeUSefY3gRfMdOZh53YMOAFKMzk3W04DboUWdPLl7kCRBI
	dWEgQAmHfMvM9PCOUFl/rVYjUtj0nTw45l74fUpYEEobsx70lUmoZzviNfXLpHTzPmNhBORkTCC
	r7kA7PtRz+vksHDnG+utJA0QgH1c7vgmEjE0iHt/7r3bpKJ0fU+uZDj6JoEDuNt6EgoBiqTJJK4
	amc
X-Received: by 2002:a05:6000:4027:b0:455:7c9f:a49e with SMTP id ffacd0b85a97d-4557c9fa4c8mr1759641f8f.25.1778275750617;
        Fri, 08 May 2026 14:29:10 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 2/5] CI: Refresh the Debian 12 arm32 cross compile container
Date: Fri,  8 May 2026 22:29:04 +0100
Message-Id: <20260508212907.1643761-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1778275751-23F7EC48-A60DC4E8/10/63158204843
X-purgate-type: spam
X-purgate-size: 8770
X-Rspamd-Queue-Id: 312204FBE9B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,citrix.com:email,citrix.com:mid,citrix.com:dkim,xenproject.org:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Javi Merino <javi.merino@cloud.com>

Rework the container to user heredocs for readability, derive from
bookworm-slim and use apt-get --no-install-recommends to keep the size down.

Convert it to being a non-root container.  Add checkpolicy as FLASK is an
available build option for arm32 under Randconfig testing.

Rename the CI jobs to debian-12-arm32-* to follow the naming scheme of all the
other CI jobs.

No functional change.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
---
 .../build/debian/12-arm64v8-arm32.dockerfile  | 32 +++++++++++++++++++
 .../bookworm-arm64v8-arm32-gcc.dockerfile     | 24 --------------
 automation/gitlab-ci/build.yaml               | 24 +++++++-------
 automation/gitlab-ci/test.yaml                | 14 ++++----
 automation/scripts/containerize               |  2 +-
 5 files changed, 52 insertions(+), 44 deletions(-)
 create mode 100644 automation/build/debian/12-arm64v8-arm32.dockerfile
 delete mode 100644 automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile

diff --git a/automation/build/debian/12-arm64v8-arm32.dockerfile b/automation/build/debian/12-arm64v8-arm32.dockerfile
new file mode 100644
index 000000000000..a4d70f1111ed
--- /dev/null
+++ b/automation/build/debian/12-arm64v8-arm32.dockerfile
@@ -0,0 +1,32 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 debian:bookworm-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf-
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
+        flex
+        gcc-arm-linux-gnueabihf
+    )
+
+    apt-get --yes --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile b/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
deleted file mode 100644
index 95b3f0428372..000000000000
--- a/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
+++ /dev/null
@@ -1,24 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/arm64/v8 debian:bookworm
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
-ENV CROSS_COMPILE /usr/bin/arm-linux-gnueabihf-
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        flex \
-        bison \
-        git \
-        gcc-arm-linux-gnueabihf \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index f05895729147..d027f26a6d6b 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -359,52 +359,52 @@ debian-13-riscv64-gcc-debug:
 
 # Arm32 cross-build
 
-debian-bookworm-gcc-arm32:
+debian-12-arm32-gcc:
   extends: .gcc-arm32-cross-build
   <<: *build-test
   variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    CONTAINER: debian:12-arm64v8-arm32
     HYPERVISOR_ONLY: y
 
-debian-bookworm-gcc-arm32-debug:
+debian-12-arm32-gcc-debug:
   extends: .gcc-arm32-cross-build-debug
   <<: *build-test
   variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    CONTAINER: debian:12-arm64v8-arm32
     HYPERVISOR_ONLY: y
 
-debian-bookworm-gcc-arm32-randconfig:
+debian-12-arm32-gcc-randconfig:
   extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    CONTAINER: debian:12-arm64v8-arm32
     HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
-debian-bookworm-gcc-arm32-debug-staticmem:
+debian-12-arm32-gcc-debug-staticmem:
   extends: .gcc-arm32-cross-build-debug
   <<: *build-test
   variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    CONTAINER: debian:12-arm64v8-arm32
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
 
-debian-bookworm-gcc-arm32-debug-earlyprintk:
+debian-12-arm32-gcc-debug-earlyprintk:
   extends: .gcc-arm32-cross-build-debug
   <<: *build-test
   variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    CONTAINER: debian:12-arm64v8-arm32
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
       CONFIG_EARLY_UART_CHOICE_PL011=y
       CONFIG_EARLY_UART_BASE_ADDRESS=0x9000000
 
-debian-bookworm-gcc-arm32-debug-mpu:
+debian-12-arm32-gcc-debug-mpu:
   extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    CONTAINER: debian:12-arm64v8-arm32
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
       CONFIG_XEN_START_ADDRESS=0x0
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 517af1732437..e1d6bb505674 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -600,7 +600,7 @@ qemu-smoke-dom0less-arm32-gcc:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32
+    - debian-12-arm32-gcc
 
 qemu-smoke-dom0less-arm32-gcc-debug:
   extends: .qemu-arm32
@@ -608,7 +608,7 @@ qemu-smoke-dom0less-arm32-gcc-debug:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug
+    - debian-12-arm32-gcc-debug
 
 qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
   extends: .qemu-arm32
@@ -616,7 +616,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug-staticmem
+    - debian-12-arm32-gcc-debug-staticmem
 
 qemu-smoke-dom0less-arm32-gcc-debug-gzip:
   extends: .qemu-arm32
@@ -624,7 +624,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-gzip:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug
+    - debian-12-arm32-gcc-debug
 
 qemu-smoke-dom0less-arm32-gcc-without-dom0:
   extends: .qemu-arm32
@@ -632,7 +632,7 @@ qemu-smoke-dom0less-arm32-gcc-without-dom0:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32
+    - debian-12-arm32-gcc
 
 qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
   extends: .qemu-arm32
@@ -640,7 +640,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug
+    - debian-12-arm32-gcc-debug
 
 qemu-smoke-dom0less-arm32-gcc-debug-earlyprintk:
   extends: .qemu-arm32
@@ -648,7 +648,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-earlyprintk:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh earlyprintk 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug-earlyprintk
+    - debian-12-arm32-gcc-debug-earlyprintk
 
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86-64
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index ad3e2372703f..ef3b97b65578 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -38,7 +38,7 @@ case "_${CONTAINER}" in
     _bookworm|_bookworm-x86_64) CONTAINER="${BASE}/debian:12-x86_64" ;;
     _trixie-x86_64|_) CONTAINER="${BASE}/debian:13-x86_64" ;;
     _bookworm-i386|_bookworm-x86_32) CONTAINER="${BASE}/debian:12-x86_32" ;;
-    _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:bookworm-arm64v8-arm32-gcc" ;;
+    _bookworm-arm64v8-arm32) CONTAINER="${BASE}/debian:12-arm64v8-arm32" ;;
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:12-arm64v8-cppcheck" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
-- 
2.39.5


