Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39509953CA
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 17:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813274.1226140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCTm-0000Te-Vu; Tue, 08 Oct 2024 15:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813274.1226140; Tue, 08 Oct 2024 15:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCTm-0000R7-Rn; Tue, 08 Oct 2024 15:50:30 +0000
Received: by outflank-mailman (input) for mailman id 813274;
 Tue, 08 Oct 2024 15:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LJPt=RE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1syCTl-0000R1-8j
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 15:50:29 +0000
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [2a00:1450:4864:20::644])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09dded77-858d-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 17:50:27 +0200 (CEST)
Received: by mail-ej1-x644.google.com with SMTP id
 a640c23a62f3a-a8d43657255so913395266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 08:50:27 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9941a697cesm439360466b.173.2024.10.08.08.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 08:50:26 -0700 (PDT)
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
X-Inumbo-ID: 09dded77-858d-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728402626; x=1729007426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=viNKaWigGzOlrQZAhgePu9LuWwDMpqKJnRmkndvxJ6Q=;
        b=Vn1cNj7aVY3INk9lkpv7SEW066JBAlv3Qx+JGWIIk6HvEy9EqWo8po8pBkiFHUBey9
         C1r/nR2MggRFgvSoH5p7RC0N6HAQeThzDCmPGng6oIu7RK53Lxq0S/xgSdWbwMKDbKms
         dwLY0+NFq7RynRnWzI+v6JnPVAPPb2dUckZ/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728402626; x=1729007426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=viNKaWigGzOlrQZAhgePu9LuWwDMpqKJnRmkndvxJ6Q=;
        b=gjdbrdN/fIRo/+7ljsCLNkD2W3HsoPVM9j3qJjJU4eV4mHyBGO8Vy08OyBv8erfe4m
         awRjotbKWgEtYv9NISIaLIbJl3SIVqkc0MJHhCpmE1wF9P4iYVmX6hy0KdkWUaXOajxE
         J67/25LlvUl5RFSlXvKaKVwmm8N9uh14NVzqaySNDOruajrKp5nZpsqFpiqzBOUdaJ9M
         T8M1gvDZABwsk82/DYe7MgR5Ry7nhDIfOc6lBiaYTpwbwKH+pIWsvRqDqI1xKB/PWXx1
         emBCeMvMwlofBF7AmkNLlhzvGMr7L5dP/btAYouEN5baVKwfNqzus9WI14pC9d+D/1bJ
         uUtQ==
X-Gm-Message-State: AOJu0YwrGAY9Y012P/uYeJWcw7jmH3KPa3YUFZ5f5/4cbbnqQAadK0/2
	Pp/AfSFC5rOiZVM890EHkOHMTMGAndno+uVPJq/+9SDdUytMpVtcOgiSL8ngqK8nukVSQ8KbdiN
	NqVoDEA==
X-Google-Smtp-Source: AGHT+IH+lXR01E88RrT+NAwWpClfh+d2YRrLosSvb5y0RXINfQz3+JCTGUh4RRmZ23HTONqSwxPvqQ==
X-Received: by 2002:a17:907:36cc:b0:a93:ae71:994c with SMTP id a640c23a62f3a-a991c0516aamr1604140366b.57.1728402626503;
        Tue, 08 Oct 2024 08:50:26 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] CI: Stop building QEMU in general
Date: Tue,  8 Oct 2024 16:50:23 +0100
Message-Id: <20241008155023.2571517-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We spend an awful lot of CI time building QEMU, even though most changes don't
touch the subset of tools/libs/ used by QEMU.  Some numbers taken at a time
when CI was otherwise quiet:

                       With     Without
  Alpine:              13m38s   6m04s
  Debian 12:           10m05s   8m10s
  OpenSUSE Tumbleweed: 11m40s   7m54s
  Ubuntu 24.04:        14m56s   8m06s

which is a >50% improvement in wallclock time in some cases.

The only build we have that needs QEMU is alpine-3.18-gcc-debug.  This is the
build deployed and used by the QubesOS ADL-* and Zen3p-* jobs.

Xilinx-x86_64 deploys it too, but is PVH-only and doesn't use QEMU.

QEMU is also built by CirrusCI for FreeBSD (fully Clang/LLVM toolchain).

This should help quite a lot with Gitlab CI capacity.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

I did consider putting in a build of QEMU on arm64 for good measure, but I
can't find any build job which currently does; none of the arm64 containers
have ninja by the looks of things.

Run with this patch in place:
  https://gitlab.com/xen-project/people/sstabellini/xen/-/pipelines/1486822209
---
 automation/gitlab-ci/build.yaml       |  1 +
 automation/scripts/build              |  7 ++-----
 automation/scripts/qemu-deps-check.py | 19 -------------------
 3 files changed, 3 insertions(+), 24 deletions(-)
 delete mode 100755 automation/scripts/qemu-deps-check.py

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index c668736bdc2f..c83e0bdbe119 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -339,6 +339,7 @@ alpine-3.18-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
     CONTAINER: alpine:3.18
+    QEMU: y
 
 debian-bookworm-gcc-debug:
   extends: .gcc-x86-64-build-debug
diff --git a/automation/scripts/build b/automation/scripts/build
index 34416297a4b7..926cf5b46d17 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -91,11 +91,8 @@ else
         cfgargs+=("--with-extra-qemuu-configure-args=\"--disable-werror\"")
     fi
 
-    # Qemu requires Python 3.8 or later, and ninja
-    # and Clang 10 or later
-    if ! type python3 || ! python3 automation/scripts/qemu-deps-check.py \
-            || [[ "$cc_is_clang" == y && "$cc_ver" -lt 0x0a0000 ]] \
-            || ! type ninja; then
+    # QEMU is only for those who ask
+    if [[ "$QEMU" != "y" ]]; then
         cfgargs+=("--with-system-qemu=/bin/false")
     fi
 
diff --git a/automation/scripts/qemu-deps-check.py b/automation/scripts/qemu-deps-check.py
deleted file mode 100755
index f6188afb3e2a..000000000000
--- a/automation/scripts/qemu-deps-check.py
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/usr/bin/env python3
-# -*- coding: utf-8 -*-
-import sys
-
-if sys.version_info < (3, 8):
-    print("Python %d.%d.%d too old" %
-          (sys.version_info.major,
-           sys.version_info.minor,
-           sys.version_info.micro))
-    exit(1)
-
-try:
-    import tomllib
-except ImportError:
-    try:
-        import tomli
-    except ImportError:
-        print("No tomli")
-        exit(1)
-- 
2.39.5


