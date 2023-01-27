Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C761B67E2E3
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 12:15:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485450.752694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMhn-0003eC-7S; Fri, 27 Jan 2023 11:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485450.752694; Fri, 27 Jan 2023 11:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLMhn-0003cY-3d; Fri, 27 Jan 2023 11:15:39 +0000
Received: by outflank-mailman (input) for mailman id 485450;
 Fri, 27 Jan 2023 11:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dhsa=5Y=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pLMhl-00037V-4j
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 11:15:37 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb35ad3d-9e33-11ed-b8d1-410ff93cb8f0;
 Fri, 27 Jan 2023 12:15:34 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id t18so4679807wro.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jan 2023 03:15:34 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 b11-20020adfd1cb000000b002bcaa47bf78sm4106257wrd.26.2023.01.27.03.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 03:15:33 -0800 (PST)
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
X-Inumbo-ID: eb35ad3d-9e33-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFP8ING4UzVnUkEuxsmFa3m3vfqvjFoN/0VbfFaV0lo=;
        b=fZupR+cGz2/cY4+KqtP+vPnS3moL+zV4Q+RVcUC4N2VS4yKuRj7EOk9imAy+Kdx78m
         bWgRars7oHHgZZqilRsjMAT4Pw8q4QjVVjv7vlGMLiPe85y0S12jF9CbNTYBcfGw77oq
         1WTP6A2IwSAPAHPSNg888BXt9Zyr5VARyhDE8kDKbje89vCCZuLMi/DfvAIkz0ZSWpX5
         u3aDXXElHCKTtKf95yFVMJ+dpZZci07Yd68Nd8CmZrAp9kd319mu1TBBNH0aFLefsaJ/
         U3228Esdy41GT12P9SAoe3ySa0oTJlMgSf+RyeOgqTdp+KZ2Ml9l+sa6xjOjcz2+ownX
         VoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qFP8ING4UzVnUkEuxsmFa3m3vfqvjFoN/0VbfFaV0lo=;
        b=MgZ7tAT/nK4TPhtW0zEbwKImweK9b4YRjuP9Bi6PSEuIk8n+UqQUfxi5siGsCe/Dmy
         fizFQ7kzhBxz7IcRJM0cKRcZjevubiB8YPP/P0R7DDrd9LpGPz7yEOYFcaZtoNreuqCv
         EsboZb8qkCvfXXtI6xYv3eOXTIO2mOSH8G04MIUYs1mQnuLA4PAQHIg4dqY7MyTBsy5y
         Hfzi0ah4+r3SX+1sEORaemdheOj+mILLt37HQ2tP4vUacp4bUNEvhpaHJkR4pR/nTgWa
         MUwtyRpuLTV127loATd6fGpcFJkFUmHxs8ckgUTPJ/RYvYx/Izf2wv/iRAkCAovCiWbo
         LqlA==
X-Gm-Message-State: AO0yUKW2j2cjlJC9MvvZZ7V0Q0QN5M3XD/LY7ONmFtOZvuZlMh98ADKq
	inM/hPFCSZcgiC3z4ubRG/KJeO7lSRI=
X-Google-Smtp-Source: AK7set8oVYDYFNPryV3eLsRpHPeeu7to+lwgFqoz5xDyRc7WqbECdj0idljGVzfKhAEIOkR1Y4NXog==
X-Received: by 2002:a05:6000:154d:b0:2bf:d0b4:2ccf with SMTP id 13-20020a056000154d00b002bfd0b42ccfmr2946885wry.37.1674818133936;
        Fri, 27 Jan 2023 03:15:33 -0800 (PST)
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
Subject: [PATCH v6 2/2] automation: add RISC-V smoke test
Date: Fri, 27 Jan 2023 13:15:24 +0200
Message-Id: <22314025ad141e44e4cf46c29875af86113e631a.1674816429.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674816429.git.oleksii.kurochko@gmail.com>
References: <cover.1674816429.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check if there is a message 'Hello from C env' presents
in log file to be sure that stack is set and C part of early printk
is working.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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
index afd80adfe1..d3c62e0995 100644
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


