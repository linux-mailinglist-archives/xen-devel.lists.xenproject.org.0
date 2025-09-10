Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E8B52435
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 00:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1118861.1464510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwTDl-0001aj-DP; Wed, 10 Sep 2025 22:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1118861.1464510; Wed, 10 Sep 2025 22:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwTDl-0001Wr-AP; Wed, 10 Sep 2025 22:23:21 +0000
Received: by outflank-mailman (input) for mailman id 1118861;
 Wed, 10 Sep 2025 22:23:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kMwI=3V=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwTDk-0001Ut-9z
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 22:23:20 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c03a574f-8e94-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 00:23:18 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45cb6428c46so1117565e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Sep 2025 15:23:18 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e01ba9601sm2452195e9.23.2025.09.10.15.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 15:23:16 -0700 (PDT)
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
X-Inumbo-ID: c03a574f-8e94-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757542997; x=1758147797; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCzfIeejqWxnyYgYr5WylmGRYjOyeO6wPE1ifH2pzDk=;
        b=cG2WcpxU+mSZ8D1o7i8+XYZQKoYbobmrVjFmICHBrWKLwKuHe0zFU1l6RfBFW9jobR
         JE0MzZxCoxgCjzfrumO55yRJZERHzbD2khO9+yVF/jeVohOzWm/NxetzIDO4MdJIjU+9
         BGSMOw/9x/k49dJX5yZrf1CdmYRFyz8ov21yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757542997; x=1758147797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tCzfIeejqWxnyYgYr5WylmGRYjOyeO6wPE1ifH2pzDk=;
        b=fULvJk+DlWMTF7GhOOput0wXr1y4ALGPYMDiMKxTlBLCsRSq5zbVaH2/+220mZqWxE
         t2CU1t1Zk7vJuwWbKP9HTcqtpDFG3CHtPTUZe54ENGU7IcpH5OGPy6w7NN6tS4rBd9PC
         QH2LCeGPbQgiB59jVIUdBQIEtVslcYiTObDtWmnKuWPl2M/mcSFlvzidxesHfxdX96qt
         jc5I6QNKC0U5Pa6WnSOxSsf4u/S1uBycBB/S6FeKf3hB8HOmFRT/WKs5zTvXu26Zpred
         EdWByurlYirECtflSddSXgYQ76Hwy4+8kxMAFT9R6YxodMKFt1z/NRm5NBAT/SjhLR0h
         YO7A==
X-Gm-Message-State: AOJu0YzhtSXKMhtAvnv2x05lLMt5tuo96oWaFgiyNymkZ4SJpLD68SDD
	6muY7seeC92aptCXarNxHLxvbJp/vNuqDZArSmjekuVD01n6/wfAhSrovUn6fx3WT584Xt8I7F5
	sleHJ
X-Gm-Gg: ASbGncsXy85rWcyFSbRL3wN10HIQfe3HjVilG7GnIAVYxMJQ2rF3vUWhCZulQMxmoOS
	7c/wzZaSkfmyuJ784WH5RwkoR72Ncs+R3cVlpr/WNVKuo5IKiiKE0BYJ6QSuZX2jtlSgWPIlLxG
	k1lXma9QxVIQf3APP5/JZm50FBHvt6J1BkgrZnZERvinr9JkfrGWpdLzMWtgPgxVxaP38yXDTgL
	9jyoLKeuHgYTxId7jhnxeXU1vygiV8SkxUGCthpglmf99F39KqRGZpz2Uacr2k8w3sTR/BxTTOf
	HXrx9SglsNZ6owb5OcYqgE19lVWXSvossYdp02iya9rv+cvs42azHUtflw42/0BDB2vWsvdKVGY
	PElW/uiiuXxQrwQKaRuVdlOX1VS+IwcmwHVzYqZ1/0bQk1sr1tYOnGGZPwHD+mYnHKaWHalIqdi
	mKlXhdT092D78=
X-Google-Smtp-Source: AGHT+IFgVhsIV3sjv5Jkm8zI+KkmH5A4l49zYAjHw9/YXYcTvAF0Aaw5P7ixTUXv+K+i4dJCqKq/1w==
X-Received: by 2002:a05:600c:6305:b0:45d:5c71:76a9 with SMTP id 5b1f17b1804b1-45ddded7652mr171254285e9.24.1757542997319;
        Wed, 10 Sep 2025 15:23:17 -0700 (PDT)
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
Subject: [PATCH v2 1/3] CI: Update ppc64 to use Debian Trixie
Date: Wed, 10 Sep 2025 23:23:11 +0100
Message-Id: <20250910222313.1858941-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250910222313.1858941-1-andrew.cooper3@citrix.com>
References: <20250910222313.1858941-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Everything works fine with Debian 13.  Provide two new build jobs (for a total
of 6), and update the test job.

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
 * Update containerize

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2032972883
---
 automation/build/debian/13-ppc64le.dockerfile | 37 +++++++++++++++++++
 automation/gitlab-ci/build.yaml               | 18 ++++++++-
 automation/gitlab-ci/test.yaml                |  2 +-
 automation/scripts/containerize               |  1 +
 4 files changed, 55 insertions(+), 3 deletions(-)
 create mode 100644 automation/build/debian/13-ppc64le.dockerfile

diff --git a/automation/build/debian/13-ppc64le.dockerfile b/automation/build/debian/13-ppc64le.dockerfile
new file mode 100644
index 000000000000..5b22a4545842
--- /dev/null
+++ b/automation/build/debian/13-ppc64le.dockerfile
@@ -0,0 +1,37 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:trixie-slim
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CROSS_COMPILE=powerpc64le-linux-gnu-
+ENV XEN_TARGET_ARCH=ppc64
+
+RUN <<EOF
+#!/bin/bash
+    set -e
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
+        gcc-powerpc64le-linux-gnu
+        python3-minimal
+
+        # Qemu for test phase
+        qemu-system-ppc
+        expect
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+    rm -rf /var/lib/apt/lists/*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index c0728e58c48b..f8e45f3467c8 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -319,10 +319,10 @@ debian-12-x86_64-clang-debug:
   variables:
     CONTAINER: debian:12-x86_64
 
-debian-12-ppc64le-gcc-debug:
+debian-13-ppc64le-gcc-debug:
   extends: .gcc-ppc64le-cross-build-debug
   variables:
-    CONTAINER: debian:12-ppc64le
+    CONTAINER: debian:13-ppc64le
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
@@ -705,6 +705,20 @@ debian-12-ppc64le-gcc:
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
 
+debian-12-ppc64le-gcc-debug:
+  extends: .gcc-ppc64le-cross-build-debug
+  variables:
+    CONTAINER: debian:12-ppc64le
+    KBUILD_DEFCONFIG: ppc64_defconfig
+    HYPERVISOR_ONLY: y
+
+debian-13-ppc64le-gcc:
+  extends: .gcc-ppc64le-cross-build
+  variables:
+    CONTAINER: debian:13-ppc64le
+    KBUILD_DEFCONFIG: ppc64_defconfig
+    HYPERVISOR_ONLY: y
+
 # RISC-V 64 cross-build
 debian-12-riscv64-gcc:
   extends: .gcc-riscv64-cross-build
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 95b883b32bb6..9acd984d294c 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -712,4 +712,4 @@ qemu-smoke-ppc64le-powernv9-gcc:
   script:
     - ./automation/scripts/qemu-smoke-ppc64le.sh powernv9 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-12-ppc64le-gcc-debug
+    - debian-13-ppc64le-gcc-debug
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 340b6caaab44..65c8804ce5f3 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -31,6 +31,7 @@ case "_${CONTAINER}" in
     _fedora) CONTAINER="${BASE}/fedora:41-x86_64";;
     _bullseye-ppc64le) CONTAINER="${BASE}/debian:11-ppc64le" ;;
     _bookworm-ppc64le) CONTAINER="${BASE}/debian:12-ppc64le" ;;
+    _trixie-ppc64le) CONTAINER="${BASE}/debian:13-ppc64le" ;;
     _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
     _trixie-riscv64) CONTAINER="${BASE}/debian:13-riscv64" ;;
     _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
-- 
2.39.5


