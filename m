Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EF467E396
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:39:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485491.752764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN4u-0001n6-PA; Fri, 27 Jan 2023 11:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485491.752764; Fri, 27 Jan 2023 11:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLN4u-0001ki-Lm; Fri, 27 Jan 2023 11:39:32 +0000
Received: by outflank-mailman (input) for mailman id 485491;
 Fri, 27 Jan 2023 11:39:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLN4r-0001Uz-5Y
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:39:29 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41f36b44-9e37-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 12:39:28 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so5329050wmq.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 03:39:28 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a05600c420a00b003c6b70a4d69sm3919529wmh.42.2023.01.27.03.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 03:39:27 -0800 (PST)
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
X-Inumbo-ID: 41f36b44-9e37-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uv27LIdYCOpQaEPTODxpqyn21y70RSmO8lj9poeyTD0=;
        b=Vdcw6Z3aVdiU3Sn0P/j/aSOsJ9zToHiDE2D9yOE3xe4E/80BGnJkcnR1iPVVpbFhBR
         XQ5GjH9sixS+9yUDeOJpSMRnNlYIE1tJq3JAGBVOr52DU2ViwVlZzeE65dPa6wiO0/V6
         HragHpODHCvSJfO9+xHA/DqsLlpnvYPshDVYmy3T2XuHURPSCNROp0FHvUuxhPZJGHk8
         4KC172vuszXLlC//m5UjMMPUue53kyYE+mOKmeqN7MCAU9A/ea2/VxApHF1GURxcfIIT
         BMYJ/l+LbO2GM9yGSFVGcKf21cGgC8ZdEKsWqgg/ySBzyCEbe3GqprxrBMZNY1/TQA65
         1tlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uv27LIdYCOpQaEPTODxpqyn21y70RSmO8lj9poeyTD0=;
        b=CfVPS/5Xe8+14XH6vv6N5XnY6AqDVZHBSSA/94sWDEnB1JuhVDyAWtW52mOvDa50gD
         ufKghsZf//XvEZA53vNQZG7SD3iMZswfzG6lLnai7usLsa89IwLP5GGmqsR/o6o2Olb6
         NvMGOliXS8lfFQPFDASUa/o/xS8srObt5Vnvd5KeVGJhhBQS4nMWBg7y9doUTAKRWNue
         cO0oEM1Ja7zYrc/e9otygxvwkXZmJs+1oPZ4QFjyioWOfABqjNsEb0jzw4/l6CG/G19F
         FX5zq9ucqS7V17YYv5zy5sg/CKCHaqsB003JFgfNLeOsOAdJvQs5i1hFyMURoVyNI7Kt
         z1pA==
X-Gm-Message-State: AO0yUKWndmJhhuIL6YMlCJgtYkwAV55OLETjxtgVUOJwkYmyNxF1QPVc
	ErfT8BaPXfnSY+byHzIK71S8vgTfLSw=
X-Google-Smtp-Source: AK7set9HjLKVcPhRNaIz/MVicozKNYe4geIJ1zxFzuF28gioPDQALBXCWh1g5BsZxvff99m08PHbVg==
X-Received: by 2002:a05:600c:3501:b0:3dc:19d1:3c1f with SMTP id h1-20020a05600c350100b003dc19d13c1fmr10629718wmq.30.1674819568009;
        Fri, 27 Jan 2023 03:39:28 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v7 2/2] automation: add RISC-V smoke test
Date: Fri, 27 Jan 2023 13:39:15 +0200
Message-Id: <e2d722a5f3fffc5708c1cc99efad63ab04d25ec3.1674819203.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674819203.git.oleksii.kurochko@gmail.com>
References: <cover.1674819203.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check if there is a message 'Hello from C env' presents
in log file to be sure that stack is set and C part of early printk
is working.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V7:
 - Fix dependecy for qemu-smoke-riscv64-gcc job
---
Changes in V6:
 - Rename container name in test.yaml for .qemu-riscv64.
---
Changes in V5:
  - Nothing changed
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
index afd80adfe1..4dbe1b8af7 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -54,6 +54,19 @@
   tags:
     - x86_64
 
+.qemu-riscv64:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: archlinux:current-riscv64
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
+    - .gcc-riscv64-cross-build
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


