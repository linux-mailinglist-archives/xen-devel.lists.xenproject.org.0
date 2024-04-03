Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA81A896BFC
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:20:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700394.1093464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjD-0007nl-4k; Wed, 03 Apr 2024 10:20:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700394.1093464; Wed, 03 Apr 2024 10:20:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjD-0007iR-0m; Wed, 03 Apr 2024 10:20:23 +0000
Received: by outflank-mailman (input) for mailman id 700394;
 Wed, 03 Apr 2024 10:20:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjB-0007Ob-1I
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:21 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c52a6276-f1a3-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:20:18 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-513d717269fso7354648e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:18 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:16 -0700 (PDT)
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
X-Inumbo-ID: c52a6276-f1a3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139618; x=1712744418; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+q1lzVVayfJQfryGUoGKVQmKUoZ09Tze7sgRd9CVypw=;
        b=RfjbFOD3h8qcQh2LXEkjD6CkMxGnsRtF8w8Dz9w6XgDGmFr3EQ3Y+oHxFiN6mFBVwL
         u8yVaDoaE6f9ZRKjOAfFJzA1ZNm6ordnSRqr8lEq4JdmXLRbsHK5vZZMAFw0B+w/r5Fo
         Dcn6s+oZCzM2YkRGezAHfzZ9nD7NmCtVDO0cNrfYfD+PtAeVifo2A/oMikg6x0xTuRzi
         ukvgE31nOomJ6kE6bEYwGvwRVn7gSlIebH7mo7De5B3geUeylalzABj0xYwm8ZRmdgGj
         n5YjZnxWOF8sNaDpE/gLxDx3Y0RMqmL3/yrGLJycXjXiAb/J05rGID1M0jQD0YITpkjo
         xHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139618; x=1712744418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+q1lzVVayfJQfryGUoGKVQmKUoZ09Tze7sgRd9CVypw=;
        b=qD3jT5eBPfojqNdLwQiQxxynQoXj2sC3n3gyP3TngaKSzFBGbmeUrTyvlyN1s0TXdn
         5dBQBkoqGLoKf2jLzkCKICUvbV4zPybNXHiAKi+Igizx3oPL5QfA+6FtJ5IBoAsjcqZy
         rY4RfAciZQFhvWbcyWllkcNxOaJDemqmQBrkOo+xFKz4xWMZq7ii9F+Ja1mEEtq+obEG
         e7y/0rW3BzsBvp3H5tMPyIwir5wjqoO3AOgrfiSiGY7akM0unY6df6vZ82PMOa4cK0ul
         Wv0XB1gFIe0A//0PV8QYuYxdTk/+cYCMkEVHu7uE59eNqw5oUhJe4up71JsRqjh6dvbA
         POsg==
X-Gm-Message-State: AOJu0Yzz+/8+AcWtEwCItTpatpXX20Y7Tm0KoRooArDibszo9w4sB96H
	5I+nTFt+e2N02cPEHbpRAIWVvXnuTUiZ8jC0jU1rtTceC2kVKudoeVU9EIeZ
X-Google-Smtp-Source: AGHT+IENkPD+aoYc4Lx3IomE4ZxDGyfeG9JVCynYmKOErkp5iEBTi4pP1Z6aRzD2x8c0P6wK+o6w1w==
X-Received: by 2002:a05:6512:3b0f:b0:516:ae65:73d4 with SMTP id f15-20020a0565123b0f00b00516ae6573d4mr6391538lfv.56.1712139617829;
        Wed, 03 Apr 2024 03:20:17 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 02/19] xen/riscv: disable unnecessary configs
Date: Wed,  3 Apr 2024 12:19:55 +0200
Message-ID: <c2ba247adce76c69ecd6400d791db36495b85b75.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch disables unnecessary configs for two cases:
1. By utilizing EXTRA_FIXED_RANDCONFIG for randconfig builds (GitLab CI jobs).
2. By using tiny64_defconfig for non-randconfig builds.

Only configs which lead to compilation issues were disabled.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V7:
 - Disable only configs which cause compilation issues.
 - Update the commit message.
---
Changes in V6:
 - Nothing changed. Only rebase.
---
Changes in V5:
 - Rebase and drop duplicated configs in EXTRA_FIXED_RANDCONFIG list
 - Update the commit message
---
Changes in V4:
 - Nothing changed. Only rebase
---
Changes in V3:
 - Remove EXTRA_FIXED_RANDCONFIG for non-randconfig jobs.
   For non-randconfig jobs, it is sufficient to disable configs by using the defconfig.
 - Remove double blank lines in build.yaml file before archlinux-current-gcc-riscv64-debug
---
Changes in V2:
 - update the commit message.
 - remove xen/arch/riscv/Kconfig changes.
---
 automation/gitlab-ci/build.yaml         |  5 +++++
 xen/arch/riscv/configs/tiny64_defconfig | 11 +++++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index aac29ee13a..43faeaed9c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -519,6 +519,11 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
       CONFIG_EXPERT=y
       CONFIG_GRANT_TABLE=n
       CONFIG_MEM_ACCESS=n
+      CONFIG_HYPFS=n
+      CONFIG_ARGO=n
+      CONFIG_PERF_COUNTERS=n
+      CONFIG_LIVEPATCH=n
+      CONFIG_XSM=n
 
 archlinux-current-gcc-riscv64:
   extends: .gcc-riscv64-cross-build
diff --git a/xen/arch/riscv/configs/tiny64_defconfig b/xen/arch/riscv/configs/tiny64_defconfig
index 09defe236b..24a807a5f9 100644
--- a/xen/arch/riscv/configs/tiny64_defconfig
+++ b/xen/arch/riscv/configs/tiny64_defconfig
@@ -1,12 +1,11 @@
-# CONFIG_SCHED_CREDIT is not set
-# CONFIG_SCHED_RTDS is not set
-# CONFIG_SCHED_NULL is not set
-# CONFIG_SCHED_ARINC653 is not set
-# CONFIG_TRACEBUFFER is not set
 # CONFIG_HYPFS is not set
 # CONFIG_GRANT_TABLE is not set
-# CONFIG_SPECULATIVE_HARDEN_ARRAY is not set
 # CONFIG_MEM_ACCESS is not set
+# CONFIG_ARGO is not set
+# CONFIG_PERF_COUNTERS is not set
+# CONFIG_COVERAGE is not set
+# CONFIG_LIVEPATCH is not set
+# CONFIG_XSM is not set
 
 CONFIG_RISCV_64=y
 CONFIG_DEBUG=y
-- 
2.43.0


