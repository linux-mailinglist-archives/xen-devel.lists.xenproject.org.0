Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70648B53EFC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 01:12:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120998.1465595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSo-0007QM-MH; Thu, 11 Sep 2025 23:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120998.1465595; Thu, 11 Sep 2025 23:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwqSo-0007M9-GX; Thu, 11 Sep 2025 23:12:26 +0000
Received: by outflank-mailman (input) for mailman id 1120998;
 Thu, 11 Sep 2025 23:12:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imb0=3W=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uwqSm-0007EP-T1
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 23:12:24 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5b3377f-8f64-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 01:12:22 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45dd5e24d16so11892585e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 16:12:22 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e03729c76sm40014715e9.6.2025.09.11.16.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 16:12:21 -0700 (PDT)
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
X-Inumbo-ID: c5b3377f-8f64-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757632342; x=1758237142; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA97h+zsPKEYB032/l0iO18TFQorVKP6/aYR2Xp/q4U=;
        b=aIJ1sX+JYgvVaKVjGtoLsd87yJ/57/FKYDqxrLmmXrl+v8BpRSuTxqVK6WLBofh+7V
         oY5O1XkutL1hkbi8+N4uTNc8vSdrIZ1EUXc1FIG+L7oHiIIV/M9ZmE1mAPY+/KZq4W24
         vE9gLOt9M3BLPLprhP0McZ68vOx1H75gFzIdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757632342; x=1758237142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA97h+zsPKEYB032/l0iO18TFQorVKP6/aYR2Xp/q4U=;
        b=ppq1rDv19A2qGgGpndKxjCZqBaddzAGnCl17dniRxQs4RXq15NtUJc5PeSxFfB+C8k
         1Ho351r+uCgGCvb/BBVg/ys8r8+uuv2sGXjcb2tIdkC/7ZtYSlMrz+tPvhModCwx6JXm
         +t2/DJFe6a7TEdCW3VTW2p3MWY7UizrXZj2aN1HbsK7jrXBMc9UMWrPNsWqYEJW1R2am
         PuLBjrTL5bZ2pxy2z4+GfDX5iR8vLa9Z519D+nTpDpKqIf7MY/eBpoziN+KLlt8i6oKe
         dStPmGwcaytMqQ3CHgAMCNtnR/ExNM3fCzeOmRR4bNiGGe5uVIvG0DSiPflrLX/fZT+m
         DYrg==
X-Gm-Message-State: AOJu0Yz9vAoZaFqCAXn2Nul9pYLQpfrm4C0QxJNKzey+/CIR6I4/0UYi
	+6HVd4ZPLZWL1YwbxJrMxHOgG/IegK7qHgHE5hwt79ujrUGPt168LAZQqk0VO7JjybtuLUw+9ky
	4eVS+
X-Gm-Gg: ASbGncuV9s7qzw/5pzMymQV84z5jbNnIg++vFrOXBhH8My00OWQONkE7T16KdXCnRU6
	8yuNwPNRUbZv7oMwBGNvCepuKU9+sTbl0ILfkJeoMKNDXxDAY/H7DaXkjp7jeWYBamE1rpPiWKi
	M8Ed0wAn+b1rMRs7AEx9FfcS5KMYlmtZZNAuJsBc9xs9PM5YnbwagxYlvLT8WcMwvC8lLJ1BEfd
	nxRXyxfZpFXlLc1zVLCWbYJAVJGvk62un7li+AI2GR14+bXuvMrRJvJeVtX7WqipBk98fRubjlR
	8uTA8O2a3uYU2jmrPTNF8LvjJT0gQLmZAOUSQo+Dpc6KXSNKBuHaxNx3y+8QqCKbWPnElOhjn3M
	94MsAXHCKtJYq3WDQLpp8iAUXBESr5Z2T/KJg3wl4SpsoFjq2+fD//M+T4zO1X/P2iuzRRUolBB
	Bs
X-Google-Smtp-Source: AGHT+IGkeZP9ism/K61CjFrZhMUU/Ygfd+tEVAVA1LYM92gkINWhEnDPDJ7BylRoYSjWwM63IWQNZw==
X-Received: by 2002:a05:600c:3b26:b0:45b:7a93:f108 with SMTP id 5b1f17b1804b1-45f211c4c47mr8257535e9.3.1757632341839;
        Thu, 11 Sep 2025 16:12:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
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
Subject: [PATCH v3 2/5] CI: Update ppc64 to use Debian Trixie
Date: Fri, 12 Sep 2025 00:12:13 +0100
Message-Id: <20250911231216.1886818-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
References: <20250911231216.1886818-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Everything works fine with Debian 13.  Provide two new build jobs (for a total
of 6), and update the test jobs.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
 * Update .qemu-ppc64le template too
v2:
 * Update containerize
---
 ...pc64le.dockerfile => 13-ppc64le.dockerfile} |  2 +-
 automation/gitlab-ci/build.yaml                | 18 ++++++++++++++++--
 automation/gitlab-ci/test.yaml                 |  4 ++--
 automation/scripts/containerize                |  1 +
 4 files changed, 20 insertions(+), 5 deletions(-)
 copy automation/build/debian/{12-ppc64le.dockerfile => 13-ppc64le.dockerfile} (93%)

diff --git a/automation/build/debian/12-ppc64le.dockerfile b/automation/build/debian/13-ppc64le.dockerfile
similarity index 93%
copy from automation/build/debian/12-ppc64le.dockerfile
copy to automation/build/debian/13-ppc64le.dockerfile
index da518aab4e10..5b22a4545842 100644
--- a/automation/build/debian/12-ppc64le.dockerfile
+++ b/automation/build/debian/13-ppc64le.dockerfile
@@ -1,5 +1,5 @@
 # syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian:bookworm-slim
+FROM --platform=linux/amd64 debian:trixie-slim
 LABEL maintainer.name="The Xen Project"
 LABEL maintainer.email="xen-devel@lists.xenproject.org"
 
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
index 1de68a0fe450..e8946e15dc3a 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -90,7 +90,7 @@
 .qemu-ppc64le:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:12-ppc64le
+    CONTAINER: debian:13-ppc64le
     LOGFILE: qemu-smoke-ppc64le.log
   artifacts:
     paths:
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


