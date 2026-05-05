Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id VF1qMVBC+mlJLgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 21:17:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204664D3108
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 21:17:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301050.1575399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKLGc-0000Mf-HG; Tue, 05 May 2026 19:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301050.1575399; Tue, 05 May 2026 19:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKLGc-0000KW-Dz; Tue, 05 May 2026 19:17:14 +0000
Received: by outflank-mailman (input) for mailman id 1301050;
 Tue, 05 May 2026 19:17:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wKLGa-0000Jy-UC
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 19:17:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKLGY-003DOq-Ry
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 21:17:10 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fa4218-5cb7-0a2a0a5109dd-0a2a450cb1c8-20
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 21:17:10 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fa4236-62f1-0a2a450c0019-d155802de8a1-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 21:17:10 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488ff90d6c7so53935625e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:17:10 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81ed6b89sm418085185e9.1.2026.05.05.12.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 12:17:09 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1778008630; x=1778613430; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=siQWjo0zkKVV3Ea+j1v/5KOUec3pF3WyM2cdpzEDjsg=;
        b=I8AZ4G4JVDT3tsZaHFjjbfV0wjdG2wgz+ij8r03p4aTAXbD86DIl2CjQIjJpUETzvy
         uyhKuC0kbqm6COJh2fWIxXtkezrzUiiDALOrxCk8nme4J0Jw1FCtXACDRUDeY75pSKbf
         jOkCOLFYuozIqTkbdYTR3PsGoDqNI7BSuGXLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778008630; x=1778613430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siQWjo0zkKVV3Ea+j1v/5KOUec3pF3WyM2cdpzEDjsg=;
        b=Ztg/a7wa6WixLuR8tLjkDY7RGiEnrVxJBw4Zs8z9XmqeZ+j+4FN60W6rReCyJyDnsd
         yO1yBlromxAByuPdD0x5iAtlbMN6M5y6xcs6iKmYyAc7Hm0grEZFogkDA6BO4QVlowyN
         WjmAwZzQ5HzujQLonQ7a/mxnom8A3hO5OQx1lLgNiExQYP1cH4eiFLJAHnw0F7f4Rtvb
         oeLrHTiiF4KzVzcYFEvMnuDDZ+ZBHkOyb91vHKW6CEpCi3V66h/0ryaOMdJGTqppefS4
         Dp9Yn2s/GCGw6Nkpn4AhJTntqMyhbqqfUnDl52v5gw+d7HGeed6ESiGRybLKn31Ei5Zd
         ueug==
X-Gm-Message-State: AOJu0YzusoRB77Uc16JSnB+qEn67AFWO+VT4uc7Dyikn1TPp+ZlqLzRx
	YCgBU7ncz7Gwbv9ZUUf2y+XC8YRIeBmWuG3/NgGeLOT1s0hzr02WcXocf3gAZMbZ8CrULGWl3a6
	6JTB+zMM=
X-Gm-Gg: AeBDieuzmFDJDlZPUfBuBRgaXgp9X9xaQ+cq3mUbAFdxjLezWOjEMBHb0sGIWeUMHn+
	LvfcCWsaXtjiUdroQ/HBDMv0NniaeQIWwz8sJnRYvMb7DzdC9JWXTZ7CzOwxfGUezoDpNPivKQU
	HsY6DnYzeDXiqtCw8+XaG7XsL7cs9acwpCwoCqAC5a8u3M7WcoDrXrTuIzdU2N1KNrpGOD6BoFl
	cnNIqz3FM14tyXd1kOi3WXWM8CdufgcylhhGH91Hzqe9xZYjG0ozAdpTdVJ0DAWl+bNQ6X6OlV5
	TrtUIzi5xTjN0Wgv1DU4VwvKlfYS1or07h2vDNds6gSNNBlwHZD989x8ZzmaEEZAGucF8KV2wuB
	B/9xjF+dUgeuRbWX0uCbSBkhHbwJ3nApIGGHyjj1uuzdvxT7mdebUY4tW7rgnT0iUX3PI+eorjA
	LWJmlhNMipdfGF6f4DYoLJCW016e31t3kkroFelOfAgs6/GsrqyzpLmML9r7wEdcT/uEDWCgdQv
	SLaXe5ChvYm9go=
X-Received: by 2002:a05:600c:c107:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48e51e0bb23mr7842215e9.3.1778008629597;
        Tue, 05 May 2026 12:17:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2] CI: Refresh the Debian 12 cppcheck container
Date: Tue,  5 May 2026 20:17:08 +0100
Message-Id: <20260505191708.1432070-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1778008630-6CF62CF5-CDC01EEC/10/63158204843
X-purgate-type: spam
X-purgate-size: 7755
X-Rspamd-Queue-Id: 204664D3108
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[citrix.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

From: Javi Merino <javi.merino@cloud.com>

Rework the container to derive from bookworm-slim, and to build and run
cppcheck as a normal user.  User heredocs for readability and use apt-get
--no-install-recommends to keep the size down.

Changed the libpcre3-dev dependency to libpcre3, as the -dev package
is only needed for building, not for running.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>

v2:
 * Switch to bookworm-slim
 * Perform a SHA check on downloaded content

I've deployed this container already.  The new size is 233.47 MiB, as opposed
to 307.40 MiB before (as given by Gitlab).

  https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2502273068
---
 .../debian/12-arm64v8-cppcheck.dockerfile     | 86 +++++++++++++++++++
 .../build/debian/bookworm-cppcheck.dockerfile | 54 ------------
 automation/gitlab-ci/build.yaml               | 12 +--
 automation/scripts/containerize               |  2 +-
 4 files changed, 93 insertions(+), 61 deletions(-)
 create mode 100644 automation/build/debian/12-arm64v8-cppcheck.dockerfile
 delete mode 100644 automation/build/debian/bookworm-cppcheck.dockerfile

diff --git a/automation/build/debian/12-arm64v8-cppcheck.dockerfile b/automation/build/debian/12-arm64v8-cppcheck.dockerfile
new file mode 100644
index 000000000000..50d2614453de
--- /dev/null
+++ b/automation/build/debian/12-arm64v8-cppcheck.dockerfile
@@ -0,0 +1,86 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 debian:bookworm-slim AS builder
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CPPCHECK_VERSION=2.7
+
+# dependencies for cppcheck build
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --home /build --create-home user
+
+    apt-get update
+
+    DEPS=(
+        build-essential
+        ca-certificates
+        curl
+        libpcre3-dev
+        python-is-python3
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+WORKDIR /build
+USER user
+
+# cppcheck release build (see cppcheck readme.md)
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".tar.gz
+    echo "5fd20549bb2fabf9a8026f772779d8cc6a5782c8f17500408529f7747afbc526  ${CPPCHECK_VERSION}.tar.gz" | sha256sum -c -
+
+    tar oxf "$CPPCHECK_VERSION".tar.gz
+    cd cppcheck-"$CPPCHECK_VERSION"
+
+    MAKE_OPTS=(
+        MATCHCOMPILER=yes
+        DESTDIR=/build/out
+        FILESDIR="/usr/share/cppcheck"
+        HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
+    )
+    make install -j$(nproc) "${MAKE_OPTS[@]}"
+EOF
+
+FROM --platform=linux/arm64/v8 debian:bookworm-slim
+COPY --from=builder /build/out/usr/bin/cppcheck /usr/bin/cppcheck
+COPY --from=builder /build/out/usr/share/cppcheck /usr/share/cppcheck
+
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+# dependencies for cppcheck analysis including Xen-only build/cross-build
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    apt-get update
+
+    DEPS=(
+        bison
+        build-essential
+        python-is-python3
+        libpcre3
+        flex
+        gcc-arm-linux-gnueabihf
+        gcc-x86-64-linux-gnu
+    )
+
+    apt-get --yes --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/debian/bookworm-cppcheck.dockerfile b/automation/build/debian/bookworm-cppcheck.dockerfile
deleted file mode 100644
index fe4cd4a1aaab..000000000000
--- a/automation/build/debian/bookworm-cppcheck.dockerfile
+++ /dev/null
@@ -1,54 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/arm64/v8 debian:bookworm AS builder
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV CPPCHECK_VERSION=2.7
-ENV USER root
-
-# dependencies for cppcheck build
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        curl \
-        build-essential \
-        python-is-python3 \
-        libpcre3-dev
-
-RUN mkdir /build
-WORKDIR /build
-
-# cppcheck release build (see cppcheck readme.md)
-RUN curl -fsSLO https://github.com/danmar/cppcheck/archive/"$CPPCHECK_VERSION".tar.gz && \
-    tar xvzf "$CPPCHECK_VERSION".tar.gz && \
-    cd cppcheck-"$CPPCHECK_VERSION" && \
-    make install -j$(nproc) \
-        MATCHCOMPILER=yes \
-        FILESDIR=/usr/share/cppcheck \
-        HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function"
-
-FROM --platform=linux/arm64/v8 debian:bookworm
-COPY --from=builder /usr/bin/cppcheck /usr/bin/cppcheck
-COPY --from=builder /usr/share/cppcheck /usr/share/cppcheck
-
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# dependencies for cppcheck analysis including Xen-only build/cross-build
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        python-is-python3 \
-        libpcre3-dev \
-        flex \
-        bison \
-        gcc-arm-linux-gnueabihf \
-        gcc-x86-64-linux-gnu \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index eff96beaa5c3..8fb68004a00d 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -510,26 +510,26 @@ yocto-qemux86-64:
 
 # Cppcheck analysis jobs
 
-debian-bookworm-gcc-cppcheck:
+debian-12-x86_64-gcc-cppcheck:
   extends: .gcc-x86-64-cross-build
   variables:
-    CONTAINER: debian:bookworm-cppcheck
+    CONTAINER: debian:12-arm64v8-cppcheck
     CROSS_COMPILE: /usr/bin/x86_64-linux-gnu-
     CPPCHECK: y
     HYPERVISOR_ONLY: y
 
-debian-bookworm-gcc-arm32-cppcheck:
+debian-12-arm32-gcc-cppcheck:
   extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:bookworm-cppcheck
+    CONTAINER: debian:12-arm64v8-cppcheck
     CROSS_COMPILE: /usr/bin/arm-linux-gnueabihf-
     CPPCHECK: y
     HYPERVISOR_ONLY: y
 
-debian-bookworm-gcc-arm64-cppcheck:
+debian-12-arm64-gcc-cppcheck:
   extends: .gcc-arm64-build
   variables:
-    CONTAINER: debian:bookworm-cppcheck
+    CONTAINER: debian:12-arm64v8-cppcheck
     CPPCHECK: y
     HYPERVISOR_ONLY: y
 
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 743567cb772a..ad3e2372703f 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -40,7 +40,7 @@ case "_${CONTAINER}" in
     _bookworm-i386|_bookworm-x86_32) CONTAINER="${BASE}/debian:12-x86_32" ;;
     _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:bookworm-arm64v8-arm32-gcc" ;;
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
-    _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
+    _bookworm-cppcheck) CONTAINER="${BASE}/debian:12-arm64v8-cppcheck" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
     _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:16.04-x86_64" ;;
-- 
2.39.5


