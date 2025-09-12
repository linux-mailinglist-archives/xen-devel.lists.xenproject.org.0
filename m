Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC6B4B55212
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 16:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122093.1466040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50z-0005wB-A1; Fri, 12 Sep 2025 14:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122093.1466040; Fri, 12 Sep 2025 14:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50z-0005qr-1H; Fri, 12 Sep 2025 14:44:41 +0000
Received: by outflank-mailman (input) for mailman id 1122093;
 Fri, 12 Sep 2025 14:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux50x-0004JT-43
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 14:44:39 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0217de34-8fe7-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 16:44:38 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3e76766a172so679631f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 07:44:38 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015784c3sm72070045e9.10.2025.09.12.07.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 07:44:37 -0700 (PDT)
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
X-Inumbo-ID: 0217de34-8fe7-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757688278; x=1758293078; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Fa1/s/Dy+cCaT7ztlJbT+Ce4uvv+WkjLn5aHmuIYYY=;
        b=hRdj06IgGlpYshAXMEJm4k+gqOjvypN1yQqao7oJxeTemST445uAZRJguP2Ue/VdNw
         vhHwl8LH4nbk8n5W4Br93ODle4JOh1mlsgg+w9Vbjn9mFnQ1uB3X/T7kblH8FjnQvS0G
         E1C/ccq1RRlGsj8suQMoF0SmuGB8zXEUlVY8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688278; x=1758293078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Fa1/s/Dy+cCaT7ztlJbT+Ce4uvv+WkjLn5aHmuIYYY=;
        b=rzb5QwxGD507d7YT+X39SE8dVxOWSP50EQ5w7x+5x8NWY3yHy5vdFE/Cm7JXuGNn+A
         ZXER+Ew7HVqiNG7I92L8DVZ7EG2IF97x8Tu4Xfrrn7Wl1cfSqleb2CFprRp7xBr4IPoG
         WAMnDqzYox1KuPnPzyolLkKKCz1W2sAFMK+2Ce9adfKHmtKr+37NRbLX3+Z46j+FUx0S
         txQdtHhkV25Y9WULmLLVSOErrWTIQx8BXtrxFr9g16OzROylo8P5aWZqX+Bsx1TlIAtE
         H7jfrkDR71Xmn9gNT4iy0UYBykHF9C9NCIbczjOysCKIHPge6TxsidDzswqSYivcfmRG
         xeaw==
X-Gm-Message-State: AOJu0YzB7ubfZaohMi0JGS0aWdSgNkz/vTB3hG6zRQ1uliqrL6W1AAC/
	tjTDYyi3R9QMo2zOn8klVeBRkM/prjbCNGFrzuQeeXa0z4FZrrRqX4poVZqULlPZlF0TnzHbjAg
	qUIKG
X-Gm-Gg: ASbGncsGyz/hD5chJoFSeCatm4iq9brUkU+mP0FeFiuHKch+1fCyOm3DClxGgRa1t1X
	Q4Tn9fO2A64AtA2FaJMoJy7DoYu8Xljjl+4FGS4yt940lLMYShV0+IpPITJGi+7A9M8988TtH9f
	OrEsoGsc4f+FyVAZ1d52gwJTAapI28/0BI9VSmlFAnMLA8+E6ESBUFNAoHa/a3XwzvpgAdZjr8Z
	JoJk+r1YvLoHSzVR3zBZ17fCQ9XG/Ml22CNhe3hOjzwMhT7e783MUOpxCO6Yi1OuqVo2XvtUPO+
	rpORySiFxxE2G1RQA1N6Jh4ugPxSLVOfWn7xQEluAuLXVgtWNo+qQeNoGXtdb8l7NPRJuejoZt9
	PH5WtgJkeYab1Z1nYQk1xZgTFKyc29JMJdeKoz48/DLgxK0y6B3wDOcAAx9+t07izmd+rXyZqm6
	P1
X-Google-Smtp-Source: AGHT+IFtxjvc/nwlNgff2Wk70EZffbLeEHdBX9p4nUZmKLib84yJUpcgSHaEkkPdbPVwfWrdywmapw==
X-Received: by 2002:a05:6000:4023:b0:3e2:4a3e:d3ee with SMTP id ffacd0b85a97d-3e765a14133mr2670234f8f.58.1757688277654;
        Fri, 12 Sep 2025 07:44:37 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Denis Mukhin <dmukhin@ford.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Victor Lira <victorm.lira@amd.com>
Subject: [PATCH v4 7/8] CI: Update x86 to use Debian Trixie
Date: Fri, 12 Sep 2025 15:44:26 +0100
Message-Id: <20250912144427.1905141-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the exception of the custom IBT job, copy all Debian 12 jobs making
Debian 13 versions, then trim the Debian 12 ranconfig jobs.

Update the test jobs using Debian 12 to use 13.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Victor Lira <victorm.lira@amd.com>

v3:
 * Update .qemu-x86-64 too.
 * Rebase over cleanup to 12-x86_64
v2:
 * Make 13-x86_64 be root-less
 * Update containerize
---
 ...x86_32.dockerfile => 13-x86_32.dockerfile} |  2 +-
 ...x86_64.dockerfile => 13-x86_64.dockerfile} |  2 +-
 automation/gitlab-ci/build.yaml               | 54 ++++++++++++++-----
 automation/gitlab-ci/test.yaml                | 12 ++---
 automation/scripts/containerize               |  3 +-
 5 files changed, 52 insertions(+), 21 deletions(-)
 copy automation/build/debian/{12-x86_32.dockerfile => 13-x86_32.dockerfile} (95%)
 copy automation/build/debian/{12-x86_64.dockerfile => 13-x86_64.dockerfile} (96%)

diff --git a/automation/build/debian/12-x86_32.dockerfile b/automation/build/debian/13-x86_32.dockerfile
similarity index 95%
copy from automation/build/debian/12-x86_32.dockerfile
copy to automation/build/debian/13-x86_32.dockerfile
index 447152d7e5e4..464b4fc55e38 100644
--- a/automation/build/debian/12-x86_32.dockerfile
+++ b/automation/build/debian/13-x86_32.dockerfile
@@ -1,5 +1,5 @@
 # syntax=docker/dockerfile:1
-FROM --platform=linux/i386 debian:bookworm
+FROM --platform=linux/i386 debian:trixie-slim
 LABEL maintainer.name="The Xen Project"
 LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/13-x86_64.dockerfile
similarity index 96%
copy from automation/build/debian/12-x86_64.dockerfile
copy to automation/build/debian/13-x86_64.dockerfile
index 4e533ee879fd..2c6c9d4a5098 100644
--- a/automation/build/debian/12-x86_64.dockerfile
+++ b/automation/build/debian/13-x86_64.dockerfile
@@ -1,5 +1,5 @@
 # syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian:bookworm
+FROM --platform=linux/amd64 debian:trixie-slim
 LABEL maintainer.name="The Xen Project"
 LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
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
index e8946e15dc3a..8d8f62c8d04d 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -59,7 +59,7 @@
 .qemu-x86-64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:12-x86_64
+    CONTAINER: debian:13-x86_64
     LOGFILE: qemu-smoke-x86-64.log
   artifacts:
     paths:
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


