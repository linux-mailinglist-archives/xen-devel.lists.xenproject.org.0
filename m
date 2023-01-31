Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F11682B4E
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 12:18:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487533.755189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMoeM-0007jL-Cm; Tue, 31 Jan 2023 11:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487533.755189; Tue, 31 Jan 2023 11:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMoeM-0007eo-8A; Tue, 31 Jan 2023 11:18:06 +0000
Received: by outflank-mailman (input) for mailman id 487533;
 Tue, 31 Jan 2023 11:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0fq0=54=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pMoeK-0007cS-Fy
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 11:18:04 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed27a3eb-a158-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 12:18:03 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id p26so29346203ejx.13
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jan 2023 03:18:02 -0800 (PST)
Received: from pc-879.home (83.29.147.144.ipv4.supernova.orange.pl.
 [83.29.147.144]) by smtp.gmail.com with ESMTPSA id
 ov9-20020a170906fc0900b0087bdae9a1ebsm6712058ejb.94.2023.01.31.03.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 03:18:01 -0800 (PST)
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
X-Inumbo-ID: ed27a3eb-a158-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfQOzmI0ND5xgeMj5qf0FcEgmhRpEir/hocEHXP8Mt0=;
        b=EgKt5niaErUnbLb2f5cbcqiFhXkxAiZ2cz6UQ9fy0T03umMKUitexfvDGpQQ2+Od2R
         9WuW6sMRAOl4gyW2P7LjdIYl5l4KM5i8+nxh8bevmTgWnu6bBDrU6pBXnYfbOiLLGeo0
         c+rc4mx1EKihzVpaoBwotEdwhb1eWH7b10dWZIBr/gjCaPq63maEgKfnO8HABpLn+VEf
         7Vr5utbNvN/avCRrM8bL4LiI9Kck5xR+3ZXvAVlwXjzFrLY7Lxnmoxpku5TcCCv9cFmx
         BvSYHen3IbmDbhC+xexm1hsExG//UBfk536PBMxjREg4Q5h7zyLHTGbih3Yx8dMA5nOC
         8sUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfQOzmI0ND5xgeMj5qf0FcEgmhRpEir/hocEHXP8Mt0=;
        b=T+MyDzAIcEo4T73BIJ+qmYJtKCptuHuOVEbvafYWEVHMfhH+a8EskDhjasWzf6b43z
         HUl3b2iJpEDsh/+GQw6JL/aFwS1xKFEMWFFl8sX10mZp5L3TpO59mWFmVfFwVGM+Q0nS
         IwmzrptHRZKwKa/dQyIPVNfMXdXUa1uhzxgsGbQVz14rwbOeouG4xTi4MF1JUbWxxg3s
         caCDBY/M3a1Lxii+3tMZMcsde7cuA2KkPl6KvPvOPv8YHYqAvGLYHChqmizCtY8d4qbC
         li334xLy0NJu0zOXIyq3Z01Jm8nvOSx8msJfW3Q/pqH0Jja/oAAgjlna1iNWADSAtlBp
         HGDg==
X-Gm-Message-State: AO0yUKXBV0+OCzuQmptlmhNCx0/MGd1dG4pam00YhA8T+tQ4CGpjEj58
	lqfdVsVqgqtcLjYbd3I2JHzhumacnbc=
X-Google-Smtp-Source: AK7set8o8MRDq1CxDIX+Nyn8bi9Gl0kzET374ToTSKGGTCT1h+X/i98ET16sXDhVWHtlipfLUpDMDQ==
X-Received: by 2002:a17:906:f143:b0:882:1b70:8967 with SMTP id gw3-20020a170906f14300b008821b708967mr11083308ejb.35.1675163882054;
        Tue, 31 Jan 2023 03:18:02 -0800 (PST)
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
Subject: [PATCH v8 2/2] automation: update RISC-V smoke test
Date: Tue, 31 Jan 2023 13:17:55 +0200
Message-Id: <2ff69540fffe67880bb13a468295c593d0db8604.1675163330.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675163330.git.oleksii.kurochko@gmail.com>
References: <cover.1675163330.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check if there is a message 'Hello from C env' presents
in log file to be sure that stack is set and C part of early printk
is working.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V8:
 - Set "needs: archlinux-current-gcc-riscv64-debug" in test.yaml
   for RISCV job as CONFIG_EARLY_PRINTK is available only when
   CONFIG_DEBUG is available.
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
index afd80adfe1..ce543ef5c0 100644
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
+    - archlinux-current-gcc-riscv64-debug
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


