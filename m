Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFSvLLhV/mlTpQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1677A4FBE9A
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 23:29:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304253.1577361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSl1-0005XR-RL; Fri, 08 May 2026 21:29:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304253.1577361; Fri, 08 May 2026 21:29:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLSl1-0005Re-KH; Fri, 08 May 2026 21:29:15 +0000
Received: by outflank-mailman (input) for mailman id 1304253;
 Fri, 08 May 2026 21:29:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wLSkz-00053I-Dr
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 21:29:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLSky-00E1Ak-R5
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 23:29:12 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe5569-bab6-0a2a0a5309dd-0a2a4509d4ec-46
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:12 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69fe55a8-2497-0a2a45090019-d155dd2cad56-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 23:29:12 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-44da2de25f3so1696091f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 14:29:12 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45491ca383asm7548608f8f.28.2026.05.08.14.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 14:29:11 -0700 (PDT)
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
        d=citrix.com; s=google; t=1778275752; x=1778880552; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCpnw2CHljiDPANNMJcNI0PWk3nH2XqIoYsrjyrERM4=;
        b=IzT4UXvx/KdEUEDSKGP1r6y2YxWkwjJxDDhljP9CxUGb8ptqfgvpQlV7izh41l9J2G
         10CNfTQqlSFTMjPkhh8bMs0CJHKmzcjLzMglvpkWIrLtj/zso2xmDmBl9JWSAto9IT6/
         Rs64gdZJ/958rG0NfpTNCycfrhDk9bJr6JQkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275752; x=1778880552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCpnw2CHljiDPANNMJcNI0PWk3nH2XqIoYsrjyrERM4=;
        b=IW+2GPEONFUwTt5QHpurYyAZpAb4I5QcGh57wH5dKFq4zC50zgFcwvu7O9vicE6p45
         cE5LFogwyYV14i++vtNtES1FbpYfT6myQpJco81TP1E9mmAmTyvIb6lZYFsYWW1gM/5Q
         FyTOcEPpholrg+qCM5GJkvbRD3wAg5KbiOw41kIAmHI7G3tc8hbEcogSnrPBn3bbxs45
         gEJuGM16pE5YmScmA29R8rB/zhltl0eDpWjrxaNO9H+jxCK+EIkb4TzMuydsv6WaPZXZ
         UB8j9GhOyUY6eG2HqAY2sd57a06SFpQ5O1KanO3w5J9YwDEt0MYNyv9LwDsQcCcwgPr0
         lXsA==
X-Gm-Message-State: AOJu0YwoNPUnZWDIpLmuNaA4x4zvC6XTCr/9YDbu3OXNLDNkJ+0D/FZy
	A1V1X3fS4RYviYBm9nlSMDo8P5D5WscqOCgujF2WiTZ9o6KWVWECTXAkZtXKLqk7/RGjqUQ1vr8
	fez0bytY=
X-Gm-Gg: Acq92OGzsZMZkv/NQ3kWueumkexePUqGBRHIJWF6g1VpQc96n9vX4M3sQEYY/6x25ml
	D0yCLXkbQYUFWPfuffcclAPlb8IVZ3ypkGnVN+EuxwAgHnMTFRF2jxgH2GFe+egeNT3bPoQRUbg
	AAxWWeyOyek0b5BPIysBHBerWyE9mdy0lux0WiOmlL7ZiHlrt4jm8EWOezEcpqY0YIKZTwtzA2b
	X44vLoKzsU4chfS632S11i1wgZEePOylbqL0CQ3hH98RBrjcvkB9Dt7B2vrhkBk8E3ViWzZKNzd
	9kw/yZek2+zn38pcpFQ4BnNA1SaQJGbIl0F7VqGmZ2Uwodxl8ifYE4zqXQKc1Bwo6Rvqfw/NDo2
	sy7eIDdJr7jZdLZg13b6IVUbdoeN9qzCB+sGv3nMCHCZIRCnPoAeEYtKQBm0DwQHIRcu5nqod3x
	mGFBnNL3pF3lmua1eH39q33z+Nxyzv1eEoA8s2zspalie60aDUXlRwKdQ/VJ3+BzKku6w75+ujK
	Jts
X-Received: by 2002:a05:6000:4383:b0:43d:7275:c1eb with SMTP id ffacd0b85a97d-454637c804cmr6690324f8f.39.1778275751877;
        Fri, 08 May 2026 14:29:11 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH 4/5] CI: Add a Debian 13 (Trixie) arm64 container
Date: Fri,  8 May 2026 22:29:06 +0100
Message-Id: <20260508212907.1643761-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
References: <20260508212907.1643761-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1778275752-40D67A53-32A4080A/10/63158204843
X-purgate-type: spam
X-purgate-size: 4052
X-Rspamd-Queue-Id: 1677A4FBE9A
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Exactly as per the Bookworm container, but additionally with the ipxe-qemu and
qemu-system-aarch64 packages.  These will be used to remove the export jobs.

Switch qemu-arm{32,64} jobs to use this container.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>

We should probably wire up some build tests too, but it's too late on a Friday
for me to be thinking about that for this posting.
---
 automation/build/debian/13-arm64v8.dockerfile | 71 +++++++++++++++++++
 automation/gitlab-ci/test.yaml                |  4 +-
 automation/scripts/containerize               |  1 +
 3 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 automation/build/debian/13-arm64v8.dockerfile

diff --git a/automation/build/debian/13-arm64v8.dockerfile b/automation/build/debian/13-arm64v8.dockerfile
new file mode 100644
index 000000000000..b9062ee8b443
--- /dev/null
+++ b/automation/build/debian/13-arm64v8.dockerfile
@@ -0,0 +1,71 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 debian:trixie-slim
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
+        flex
+
+        # Tools (general)
+        ca-certificates
+        cpio
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
+        libfdt-dev
+        libjson-c-dev
+        uuid-dev
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
+        # for test phase, qemu-* jobs
+        busybox-static
+        curl
+        device-tree-compiler
+        expect
+        file
+        ipxe-qemu
+        ovmf
+        qemu-system-aarch64
+        u-boot-qemu
+        u-boot-tools
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 982fd86db079..008deef98d1e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -37,7 +37,7 @@
 .qemu-arm64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:12-arm64v8
+    CONTAINER: debian:13-arm64v8
     LOGFILE: qemu-smoke-arm64.log
   artifacts:
     paths:
@@ -50,7 +50,7 @@
 .qemu-arm32:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:12-arm64v8
+    CONTAINER: debian:13-arm64v8
     LOGFILE: qemu-smoke-arm32.log
   artifacts:
     paths:
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index bda06054ebde..8bd2a847aac0 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -41,6 +41,7 @@ case "_${CONTAINER}" in
     _bookworm-arm64v8-arm32) CONTAINER="${BASE}/debian:12-arm64v8-arm32" ;;
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:12-arm64v8" ;;
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:12-arm64v8-cppcheck" ;;
+    _trixie-arm64v8) CONTAINER="${BASE}/debian:13-arm64v8" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
     _opensuse-tumbleweed|_tumbleweed) CONTAINER="${BASE}/opensuse:tumbleweed-x86_64" ;;
     _xenial) CONTAINER="${BASE}/ubuntu:16.04-x86_64" ;;
-- 
2.39.5


