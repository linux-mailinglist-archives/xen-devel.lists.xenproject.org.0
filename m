Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB4568D732
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 13:49:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491104.760088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNPj-00049p-6q; Tue, 07 Feb 2023 12:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491104.760088; Tue, 07 Feb 2023 12:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPNPj-00048J-43; Tue, 07 Feb 2023 12:49:35 +0000
Received: by outflank-mailman (input) for mailman id 491104;
 Tue, 07 Feb 2023 12:49:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BG9e=6D=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pPNPh-00046W-Ip
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 12:49:33 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3771746-a6e5-11ed-93b5-47a8fe42b414;
 Tue, 07 Feb 2023 13:49:14 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id m14so13402669wrg.13
 for <xen-devel@lists.xenproject.org>; Tue, 07 Feb 2023 04:49:14 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.109.85.nat.umts.dynamic.t-mobile.pl. [46.204.109.85])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d59aa000000b002be5401ef5fsm11468388wrr.39.2023.02.07.04.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 04:49:13 -0800 (PST)
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
X-Inumbo-ID: d3771746-a6e5-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MP+WeNW2jc2Ok92hlipZzRTFVcDRlzwQA/TTq4v+O/I=;
        b=ijge2m1L8mXGIjmudIc0kU36fafmyR/aA+gnU75YYhci+1GJAh2iHTGPrsfB9PCgQR
         qA0oY29GZS/BkzZrhDfh1iPudMganyHhPN56pW1cm9SFN4g+ThZEcdLKf9R3rnQ66lCp
         8/dFSjHslmPOB6k1i+RdkVDcNjgg7ds4dKSA1eWyespJtmO4mRSCeDlI2uB9zb16WR9F
         yyAcbiqWih2kTKVSJTAevIzRC1xTyQi2gmwqnPV4mUeW5dKkBr4KoVLyyOlMP96F3ZRj
         sdShClQl/CPXEGeLfFxD1leWexz6Du2OWR9NA8ZiwKOvMOyenAYjeZh9TUzysaoWkiq5
         7Q+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MP+WeNW2jc2Ok92hlipZzRTFVcDRlzwQA/TTq4v+O/I=;
        b=lBq47cpoHFZSEW1JZxxZ8jbLLdxyMJRtf2fd+blOIQq2uum3SeSVgmxF4twd934tzi
         ZrhW8uu8L3+94O338FFg8GYXEZgayw/nz+rwZQ2cKyNEEpClznw9IVYu/ISXnxUoR1Mj
         oryHHzm8Hyr48AvqHSSvPDL/CtOta1TJYf/8tcW/hkQpNf5BhiwDQT8jYeWGRubbj1c5
         c2+qtpDaH1RiqF01nAT3ootz+3hXR2uGDjAPSx1H0vk07g7uha7Z3Hoj5gY5q03RM2zE
         /fSlBDYxGr4RccPwU915wFCQ5NpDHi/ocXBrmrcmEMn979HCgXd+CGqtSCxOHOpSmQb/
         gIrA==
X-Gm-Message-State: AO0yUKWWlLk0QddQnE37/txi00zkdPszbnZIRB6RTsYMn3WSJEFWYJ1t
	2N9Fo/1cnxM30Cd8fNU0kgzPGE1LzZo=
X-Google-Smtp-Source: AK7set+kc0WyAA33aAL78wgvE70Jl4mTk0DiCw/XKoqzJFSDdDbHgAgdleQvK2l+g3dGOc4T6IKK6w==
X-Received: by 2002:adf:f5cd:0:b0:2c3:eff9:292e with SMTP id k13-20020adff5cd000000b002c3eff9292emr2757817wrp.22.1675774153845;
        Tue, 07 Feb 2023 04:49:13 -0800 (PST)
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
Subject: [PATCH v10 2/2] automation: add RISC-V smoke test
Date: Tue,  7 Feb 2023 14:49:06 +0200
Message-Id: <50fb97738c628108c2304856cc9755a83860fde9.1675773832.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1675773832.git.oleksii.kurochko@gmail.com>
References: <cover.1675773832.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check if there is a message 'Hello from C env' presents
in log file to be sure that stack is set and C part of early printk
is working.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V10:
 - Nothing changed
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


