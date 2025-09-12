Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6126CB55211
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 16:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122086.1465970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50u-0004MT-F1; Fri, 12 Sep 2025 14:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122086.1465970; Fri, 12 Sep 2025 14:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux50u-0004Jo-B6; Fri, 12 Sep 2025 14:44:36 +0000
Received: by outflank-mailman (input) for mailman id 1122086;
 Fri, 12 Sep 2025 14:44:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yT3b=3X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ux50s-0004JT-DP
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 14:44:34 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff35efda-8fe6-11f0-9d13-b5c5bf9af7f9;
 Fri, 12 Sep 2025 16:44:33 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45dde353b47so13054995e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Sep 2025 07:44:33 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e015784c3sm72070045e9.10.2025.09.12.07.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 07:44:32 -0700 (PDT)
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
X-Inumbo-ID: ff35efda-8fe6-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1757688273; x=1758293073; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APcVKYSQhSwM06it+vKiPyIO4PXTJ2pXYHSmoq6z1Z4=;
        b=WcOzBGYpCBbyh9zvvP2fPoyM2kU8/RkCvv1zPmsH+pw//NYsKOyEHO/ncL7dyWtozm
         ldW4Kv3SqnZvhAwWCfNmyaD6gxVnqxruiJHJETSaWREMLM0DS7VjES4HidD5E71I7Orm
         cc15+dpqhLI2DqbcNbd+cTq1PkSVqFhv65Ibg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757688273; x=1758293073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APcVKYSQhSwM06it+vKiPyIO4PXTJ2pXYHSmoq6z1Z4=;
        b=Nqf1YaP2LWM5+I0DNVZC+TVM+QKimFK7nqOh9/KNw4nuqpTTNUJaXw7Hs/GJsdY9LA
         NX7V+O8dA77adiMR8S5VAXEUu99/TWoEcOrHRQFHRx78wdCC5WYoCTRngADH5+/fG5A1
         /UMmqc03IiYZ7uPWbdTqONMA31YYKklRGfwm+vzI3anQZFTeex9uCvQqmOKPCkqAvwfk
         vlAQpDCvmVgPdH4fGycp7NT6OqAAreImgt3KIl4o0BVKDxp42HJe6cxylhVjqtSnIte2
         kstbdUofXl6BhIw3vqF+U+HRgPOBrkgw2IKN9H5fEFqJWfF8D2IWBgLe24ebvVOxkDo9
         o5Rg==
X-Gm-Message-State: AOJu0Yw3DVtiWcjWNP0JhN1iGn1n9kCBWb7+n/p0LXVXgioVZHrRK/2i
	7qPWeEaIBCnEGlA/9gUGcgZz1pL1F9RnwL72Ht8We52+b9FB8HPQD0n2iztsExQdMzd0QaUtoE4
	IdizQ
X-Gm-Gg: ASbGncuVBYu54+85rES834fJAPQ/+7D7KFnN35vWMS31jJ3YdEVafFqu+hnoiVe/rys
	hk1euhIZcIwXaonubgzfj+ydsswk//V8USkNoPnLagIA2KINIcMZwV/0PM1kEEL72sQx6bECeI2
	FfyJCRjG9dhhmXicibM304wWnT4XoNvWbWiPMsnM59GTP87ikgn+crGU9Ba1a0tG1Xt98asewl/
	SUBGst1ctClu9kDciqYJwqNqWg65Wpk7UpvkkJ1J+kaDDTJ3gFKfx5utaqODrlhCY8GcM43aHPU
	6dSciE7JXhGC2EoIgjCoxyLKCI/x3rQgKxFrtVi2cp3qy2qBXqqHMTrkIJgZlF6ZaWD+sn3IjYP
	wDr8syCC1ns7MFDZfpWf/BgTnxcuEPlJIs4IvI7DnAzGQi+jqZU/SNg4E4+c29LHoVgXVi4Fv9t
	94XBkn12UAgJA=
X-Google-Smtp-Source: AGHT+IGZBt1h6TFy7LIIVJ7FT8oS8K4tdPDztlvTu0Fs4WVRlCLgiLY2+eZMa4Hrqd0u+tB27AadfQ==
X-Received: by 2002:a05:600c:d5:b0:45d:d609:117f with SMTP id 5b1f17b1804b1-45f211cab8bmr30593865e9.8.1757688272858;
        Fri, 12 Sep 2025 07:44:32 -0700 (PDT)
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
Subject: [PATCH v4 2/8] CI: Update ppc64 to use Debian Trixie
Date: Fri, 12 Sep 2025 15:44:21 +0100
Message-Id: <20250912144427.1905141-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
References: <20250912144427.1905141-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Everything works fine with Debian 13.  Provide two new build jobs (for a total
of 6), and update the test jobs.

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


