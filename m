Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99683DDC2
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 16:42:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672091.1045775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLQ-0003Hw-4M; Fri, 26 Jan 2024 15:42:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672091.1045775; Fri, 26 Jan 2024 15:42:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOLQ-0003G7-0P; Fri, 26 Jan 2024 15:42:16 +0000
Received: by outflank-mailman (input) for mailman id 672091;
 Fri, 26 Jan 2024 15:42:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DqdW=JE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rTOLO-0002k9-Ip
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 15:42:14 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79405bba-bc61-11ee-8a43-1f161083a0e0;
 Fri, 26 Jan 2024 16:42:12 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5100c2f7a16so458704e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jan 2024 07:42:12 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 q5-20020ac25105000000b0050e7ec49881sm208351lfb.21.2024.01.26.07.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jan 2024 07:42:11 -0800 (PST)
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
X-Inumbo-ID: 79405bba-bc61-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706283732; x=1706888532; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEZW9bC9IZuUyn5hU4hwwOb0kPnkeC45L5CWqPFzyWM=;
        b=GcZ1e2aRoSGSa2QrUHmXldkfXO2UASRFV74EBCMwoeG/uqiiYCmx8RL5txQ6nLmgnl
         xd/L+nGjCD1euVFH4WDT9QrpEBbkj0kjkavAh0sYSrEaLf6zBIrao1b/c86SbjXcM7AV
         9MENnfMrpRx8vfBZkEYWyNQpUhxrUpFIHIjNtYr+Nx/86YvYdHZhP2Y90/21j+B2029W
         6piJcsDXAmACpUxjvfkjovpjiZmjafTEnb/MksLp88nPFVZJp44yLYU3fgk/FNmID7Hi
         iH4bAQN04DsQ9l1tVMdqxKKUPV/mFhj9N9siPLKrarluSADG/xJzVsDsRwfL4p83SQMK
         h85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706283732; x=1706888532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VEZW9bC9IZuUyn5hU4hwwOb0kPnkeC45L5CWqPFzyWM=;
        b=sG5wG89aPyKbGwt6zRlpDPynEPCjFKWSrz2ThG7/1KWSESwyxCFHYWq2XqyY7xiIeM
         b4AxM5jaldzE6JwZbUwypMKlR0Z09KCchaoNE6mMmmJdt7a0NeWSX5qkDlVgYIaV9YoP
         0aqoGGeMTvn4RJDntk+PdNjWFSqPpTbICSgWhRavWbww3oFCdZWGQLfixDOw4GpHeX04
         FfGgLxRFK3wHLmCwVAm4IqTyYuy5xdNIwntbxEKgjqMx2/UufZkBBI+PQuS5xWVETucE
         dYxucs5dC+fvr6g1ffn/gEujnfDp/LaDCpnl0FMYm4Q4mlD3Q6cEIhU2KXgY/9nZ1ma/
         0+Fg==
X-Gm-Message-State: AOJu0Yyq02gc7DmFdnn/y2oYpukKxhQRtiI4aDX//xmtZOF0BqW6pX+O
	XiQCQB81C/TuAItpgQ5w2dhij/JwwFcI/Qg4NB6mrRb6lPt3iqcEIaguQJMo
X-Google-Smtp-Source: AGHT+IEe9j/Pjph1NsnFlw2LwlbWbgpilGjH7F9SOqvpbcVHNAN5EN/XiY1sJWitLcqPCemnE/5y+g==
X-Received: by 2002:ac2:4985:0:b0:510:194e:4e07 with SMTP id f5-20020ac24985000000b00510194e4e07mr13193lfl.26.1706283732052;
        Fri, 26 Jan 2024 07:42:12 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v7 2/7] automation: introduce fixed randconfig for RISC-V
Date: Fri, 26 Jan 2024 17:42:02 +0200
Message-ID: <6641e6fdd36c4128c6c76badfb778dc195f1e419.1706281994.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706281994.git.oleksii.kurochko@gmail.com>
References: <cover.1706281994.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces the file riscv-fixed-randconfig.yaml,
which includes all configurations that should be disabled for
randconfig builds.

Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
The patch were introduced after discussion in a topic:
 https://lore.kernel.org/xen-devel/cover.1701966261.git.oleksii.kurochko@gmail.com/
---
Changes in V7:
 - Nothing changed. Only rebase
---
Changes in V6:
 - The patch was introduced in this version of patch series.
---
 automation/gitlab-ci/build.yaml                  | 8 ++++----
 automation/gitlab-ci/riscv-fixed-randconfig.yaml | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)
 create mode 100644 automation/gitlab-ci/riscv-fixed-randconfig.yaml

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 32af30cced..38cd93c306 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -516,6 +516,8 @@ alpine-3.18-gcc-debug-arm64-boot-cpupools:
       CONFIG_BOOT_TIME_CPUPOOLS=y
 
 # RISC-V 64 cross-build
+include: 'automation/gitlab-ci/riscv-fixed-randconfig.yaml'
+
 archlinux-current-gcc-riscv64:
   extends: .gcc-riscv64-cross-build
   variables:
@@ -536,8 +538,7 @@ archlinux-current-gcc-riscv64-randconfig:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
+    EXTRA_FIXED_RANDCONFIG: !reference [.riscv-fixed-randconfig, variables, EXTRA_FIXED_RANDCONFIG]
 
 archlinux-current-gcc-riscv64-debug-randconfig:
   extends: .gcc-riscv64-cross-build-debug
@@ -545,8 +546,7 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     CONTAINER: archlinux:current-riscv64
     KBUILD_DEFCONFIG: tiny64_defconfig
     RANDCONFIG: y
-    EXTRA_FIXED_RANDCONFIG:
-      CONFIG_COVERAGE=n
+    EXTRA_FIXED_RANDCONFIG: !reference [.riscv-fixed-randconfig, variables, EXTRA_FIXED_RANDCONFIG]
 
 # Power cross-build
 debian-bullseye-gcc-ppc64le:
diff --git a/automation/gitlab-ci/riscv-fixed-randconfig.yaml b/automation/gitlab-ci/riscv-fixed-randconfig.yaml
new file mode 100644
index 0000000000..f1282b40c9
--- /dev/null
+++ b/automation/gitlab-ci/riscv-fixed-randconfig.yaml
@@ -0,0 +1,7 @@
+.riscv-fixed-randconfig:
+  variables:
+    EXTRA_FIXED_RANDCONFIG:
+      CONFIG_COVERAGE=n
+      CONFIG_EXPERT=y
+      CONFIG_GRANT_TABLE=n
+      CONFIG_MEM_ACCESS=n
-- 
2.43.0


