Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F61F68D70A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 13:42:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491069.760023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNIY-0000r1-2k; Tue, 07 Feb 2023 12:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491069.760023; Tue, 07 Feb 2023 12:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNIX-0000ox-Vx; Tue, 07 Feb 2023 12:42:09 +0000
Received: by outflank-mailman (input) for mailman id 491069;
 Tue, 07 Feb 2023 12:42:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPNIW-0000om-OQ
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 12:42:08 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4073d75-a6e4-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 13:42:06 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id h16so13391659wrz.12
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 04:42:06 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056000114300b002c3f9404c45sm19632wrx.7.2023.02.07.04.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 04:42:05 -0800 (PST)
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
X-Inumbo-ID: d4073d75-a6e4-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+hH6wb1ILPFhWUIsB/OxGXEs5Kwqur8kDwatlBPrCk=;
        b=bPheiZnEhiQ1peBLgDKE1aPxYbZYirgBqnhur2Zkb0RnWjshA5wNwe0OumdN50yKOo
         PDR5r7JOGCQiKG7m/yrkKDRm+z2X6raWrneJHiljUEqu3bRpUNvx9kEtbaLYHdCECEvi
         pEG+mri63PtEVeIde7uXjsgJhRzL8ZA15g03kzFQ1WsvWAVLY/9bBO5xgS+tRpvz3r89
         zK9a0tF7oQUtFXfKKskjm9BBqxQTccOr8sxzWPuacdx9fOziLLxKAvsd3y8nOpEOZvzp
         x03hYtnME61Fy1QmPoD9ImVCzTx6+G00I9Zc08uHAy/kLcRnLQX/CNTPHGhDCQ2BizLF
         irHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+hH6wb1ILPFhWUIsB/OxGXEs5Kwqur8kDwatlBPrCk=;
        b=vCqwcZCl1zX66yunuYvTdJgoIu1EdFNr69wHxE21KKcgxHTOIn0uLA3wgH4KrdmK1Q
         e+5U3OrIYbRk7l3gKlJiisFsxl+UsTen3FKlq3Xu/EHda3exYvTRyL6a+SxkAxFIgMef
         5vViUBAOjvD5brKwpJoE4MYScYPScMeZyNbx8wTGPIAVEM1c9SgjVAzj3l1IQ7klGr1U
         DuyLig0HdRW9zjS1nzwDA+4w4TnMFi/fnC8vsYFgrXJa4XohDCEgwb+r+7W3SYSqSEw6
         9ACvWrlwTTWfnbaQjiUg9JoupjW2PfccI39nkGU/K5dBJVvoigJ7Bmhoa+V3suKo7BYI
         WYFQ==
X-Gm-Message-State: AO0yUKXNWwZD4xXJ/pWrFROg01HQTK+bQ1OWrLG4L1KDPu4R43gN47Rd
	PeThl6KoMbrw5BntoSCKkCGmvzgDUic=
X-Google-Smtp-Source: AK7set/akf552p7QtPIKA+1v4oAevc72tE5v1TZ3UtKYfvcXZJwMZnyWufHvjepVkFncB3w6Jn6RTg==
X-Received: by 2002:adf:ef84:0:b0:2bf:bac7:30d4 with SMTP id d4-20020adfef84000000b002bfbac730d4mr2717681wro.53.1675773725317;
        Tue, 07 Feb 2023 04:42:05 -0800 (PST)
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
Subject: [PATCH v9 2/2] automation: add RISC-V smoke test
Date: Tue,  7 Feb 2023 14:41:53 +0200
Message-Id: <2ff69540fffe67880bb13a468295c593d0db8604.1675772422.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675772422.git.oleksii.kurochko@gmail.com>
References: <cover.1675772422.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check if there is a message 'Hello from C env' presents
in log file to be sure that stack is set and C part of early printk
is working.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V9:
 - Nothing changed
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


