Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB8E660104
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 14:14:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472548.732871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYe-0005BR-K3; Fri, 06 Jan 2023 13:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472548.732871; Fri, 06 Jan 2023 13:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDmYe-00057p-Bn; Fri, 06 Jan 2023 13:14:52 +0000
Received: by outflank-mailman (input) for mailman id 472548;
 Fri, 06 Jan 2023 13:14:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QRQJ=5D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDmYc-0003zy-5N
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 13:14:50 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18918d88-8dc4-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 14:14:48 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id bt23so1893102lfb.5
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jan 2023 05:14:48 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 f14-20020a0565123b0e00b004b7033da2d7sm150221lfv.128.2023.01.06.05.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 05:14:47 -0800 (PST)
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
X-Inumbo-ID: 18918d88-8dc4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkuUnAoSkk9s+gFXJpwU6jCUW0aPzs/gF76MvPyHXnI=;
        b=MVGTWNTTVQ4gdBPkwAo6PykkJ/JZNdEmbXh+V9u38VeofVDL6lNjpAk8ebSnjOy2aC
         qdLCnQD+QuMrhICGYxaMiQjun2jKwVFXKP+D+RGUuQ8/NnBlnGiAymNJ+tVOGEdV39T4
         hYUvy4IYESRjdG7JvciMGqn+fDjDRtJTPGZI+ZrdYeRG9gwdj3qMjkacvklP4Hml+O2/
         zbDxQY3UwHMbjR6fq/YTOZSb0EmYs3XrB3pAcrUfObI5XefUYO75+bAAyoBcZcWktlOs
         fQRD2eR4Rjy9b/ghj/nGUgUiiWydaIrR42doT6+DO44J8H2wblCMCupD0rV6CukG3VaH
         HSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkuUnAoSkk9s+gFXJpwU6jCUW0aPzs/gF76MvPyHXnI=;
        b=W8TdNl3tHDppVRxm80uT4J3Ub7KUvhuqmKNlk3k+2wOwyPtAfMtixr61r9b+jjeT1N
         S1uVJ65AjV5LYw6YPLk9UGW4o8JY5LquhjEiOyXPYAKTE3FFBiNUEG1VbgF6jQc8kaSt
         EPkzXZBDXUtvbln0CD6Whj/iclLSgyq8VjfrJURQkzgRwfloDtOMOd3H0VeVb+mQ81mC
         fFrxzdG5yLW0mPGKMjzhFUmDhUKl9IeEJUo6KxjiML15Rd9Fv5eiUKiKfuCyGYddvVtB
         VQ0n8QcgNn5bBNsy6bPmNxYj79FhRUnPRcjvGwR3larjU9hDzacUSoLe+pOWY4BZvwvX
         kbLw==
X-Gm-Message-State: AFqh2krlsZ14pK5xLJzAlW7U5jb7oYk5/ckd9GvnCJ072d5Ec8BZitHl
	parp1EziKAR36dyAB7mWXh1dBoG2of7SucNy
X-Google-Smtp-Source: AMrXdXuUGrBpflnPuMb2DD1qolCCvG4jfT8bJ+rtMFDENSeIxdQCNUSBSPGNfD78+DSR6H0Ar5nG1Q==
X-Received: by 2002:ac2:53ab:0:b0:4cb:145d:c407 with SMTP id j11-20020ac253ab000000b004cb145dc407mr9542521lfh.7.1673010887872;
        Fri, 06 Jan 2023 05:14:47 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v1 8/8] automation: add RISC-V smoke test
Date: Fri,  6 Jan 2023 15:14:29 +0200
Message-Id: <90078a83982b37846e9845c8ffc50c92f3be1f47.1673009740.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673009740.git.oleksii.kurochko@gmail.com>
References: <cover.1673009740.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check if there is a message 'Hello from C env' presents
in log file to be sure that stack is set and C part of early printk
is working.

Also qemu-system-riscv was added to riscv64.dockerfile as it is
required for RISC-V smoke test.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/build/archlinux/riscv64.dockerfile |  3 ++-
 automation/scripts/qemu-smoke-riscv64.sh      | 20 +++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100755 automation/scripts/qemu-smoke-riscv64.sh

diff --git a/automation/build/archlinux/riscv64.dockerfile b/automation/build/archlinux/riscv64.dockerfile
index ff8b2b955d..375c78ecd5 100644
--- a/automation/build/archlinux/riscv64.dockerfile
+++ b/automation/build/archlinux/riscv64.dockerfile
@@ -9,7 +9,8 @@ RUN pacman --noconfirm --needed -Syu \
     inetutils \
     riscv64-linux-gnu-binutils \
     riscv64-linux-gnu-gcc \
-    riscv64-linux-gnu-glibc
+    riscv64-linux-gnu-glibc \
+    qemu-system-riscv
 
 # Add compiler path
 ENV CROSS_COMPILE=riscv64-linux-gnu-
diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
new file mode 100755
index 0000000000..e0f06360bc
--- /dev/null
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -0,0 +1,20 @@
+#!/bin/bash
+
+set -ex
+
+# Run the test
+rm -f smoke.serial
+set +e
+
+timeout -k 1 2 \
+qemu-system-riscv64 \
+    -M virt \
+    -smp 1 \
+    -nographic \
+    -m 2g \
+    -kernel binaries/xen \
+    |& tee smoke.serial
+
+set -e
+(grep -q "Hello from C env" smoke.serial) || exit 1
+exit 0
-- 
2.38.1


