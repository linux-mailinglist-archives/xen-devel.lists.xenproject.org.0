Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1FF66C25E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:39:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478691.742092 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQeK-0008CX-Oa; Mon, 16 Jan 2023 14:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478691.742092; Mon, 16 Jan 2023 14:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQeK-00085M-FP; Mon, 16 Jan 2023 14:39:48 +0000
Received: by outflank-mailman (input) for mailman id 478691;
 Mon, 16 Jan 2023 14:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQBk=5N=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pHQeI-0007HD-Py
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:39:46 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e641c21-95ab-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 15:39:44 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id r2so27680660wrv.7
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jan 2023 06:39:44 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 m13-20020adfe94d000000b002714b3d2348sm26543406wrn.25.2023.01.16.06.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 06:39:43 -0800 (PST)
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
X-Inumbo-ID: 9e641c21-95ab-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctVbfTUMTOLN4KM620LAPIxTZt2tk9IeJCHpD6YNn4Y=;
        b=au2GRLGAWzB4NTiOMuF6peJns9v9FtsJ7/vNiy2ohSvXtl/YXaQaHxIte82snMoQeT
         q/0DzAUSwsggzsN5BxQIADDMQrbkICIWQnoziFZDZBIPPH7ZHDyXzRThtDnZarSLIfZ6
         3w4xkvX1nQAmi47lGm5re5B72ZP+dz9KwYRaMP/2HfHwHdlx+GcsP3+R2b+tCCQ6zutW
         EfP3e/qS8YXhQJ19wItDmI8U/WAzyHvBkH5cKzls4pKQWVgB1mdxAf7fN2waKLo1z+Le
         ySIoywsxmov7eLs/Wkp1HwlGn0J5SppWvNmIFS37K///E11mTfWAaxryHPXmvhxAr0bu
         7ctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctVbfTUMTOLN4KM620LAPIxTZt2tk9IeJCHpD6YNn4Y=;
        b=gtLiaK2FKlVsMmaP+bRPPiIB64SyyHUk1QfBMn9QfFd+YcGxaF2fPLYPb0pZzWA7Mz
         Qi3X93IateaM1wHvA2PmVxE3eQmwZIZ7Y9gDF9JVVOCQz7CsgHDiTKHQw1SNYGGJWAxC
         xLdFSbyIBmDkZ2Es8T/N7ZNhBXGM7Ji1zpFq800S2fuGuLLLB92DveZQkRwb1Bt2ZwnK
         FWpyKhjwzQJDYEPEslT/cfks//vk0QkNSiCh+1zzpDO1GGAyC5n4NAEGyyfGPWCGLrjr
         hFcem1GVh1ySkMCpVtcKQn1HYOlZXLDCv56z/4LeMmKkei3WRAe8Wg/gED4JHvmDh8ER
         yJNg==
X-Gm-Message-State: AFqh2koNO1GlsmzpaAQIrcL8XgVdXEpN8I+ObEqJbNRAPnE3QKsCxdb+
	gktvLGDKQ3WFCCrXVM16+3pxtlUVbraolA==
X-Google-Smtp-Source: AMrXdXv30T+VZFurwDb3EsXFT8D5iQtuvT08anQ4bGLUGXwDowZg4hrvyQx4T+1SlvSSXi6sWKCO+A==
X-Received: by 2002:a5d:51c2:0:b0:2bd:e007:c54f with SMTP id n2-20020a5d51c2000000b002bde007c54fmr9822705wrv.57.1673879984230;
        Mon, 16 Jan 2023 06:39:44 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v4 4/4] automation: add RISC-V smoke test
Date: Mon, 16 Jan 2023 16:39:32 +0200
Message-Id: <216c21039a5552a329178b4376ff53ba16cf6104.1673877778.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1673877778.git.oleksii.kurochko@gmail.com>
References: <cover.1673877778.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check if there is a message 'Hello from C env' presents
in log file to be sure that stack is set and C part of early printk
is working.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in V4:
    - Nothing changed
---
Changes in V3:
    - Nothing changed
    - All mentioned comments by Stefano in Xen mailing list will be
      fixed as a separate patch out of this patch series.
---
 automation/gitlab-ci/test.yaml           | 20 ++++++++++++++++++++
 automation/scripts/qemu-smoke-riscv64.sh | 20 ++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-riscv64.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index afd80adfe1..64f47a0ab9 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -54,6 +54,19 @@
   tags:
     - x86_64
 
+.qemu-riscv64:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: archlinux:riscv64
+    LOGFILE: qemu-smoke-riscv64.log
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - x86_64
+
 .yocto-test:
   extends: .test-jobs-common
   script:
@@ -234,6 +247,13 @@ qemu-smoke-x86-64-clang-pvh:
   needs:
     - debian-unstable-clang-debug
 
+qemu-smoke-riscv64-gcc:
+  extends: .qemu-riscv64
+  script:
+    - ./automation/scripts/qemu-smoke-riscv64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - riscv64-cross-gcc
+
 # Yocto test jobs
 yocto-qemuarm64:
   extends: .yocto-test-arm64
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
2.39.0


