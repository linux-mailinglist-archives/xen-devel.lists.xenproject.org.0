Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C92E1662A69
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 16:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473754.734569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMm-0003YM-RC; Mon, 09 Jan 2023 15:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473754.734569; Mon, 09 Jan 2023 15:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEuMm-0003Ut-Fq; Mon, 09 Jan 2023 15:47:16 +0000
Received: by outflank-mailman (input) for mailman id 473754;
 Mon, 09 Jan 2023 15:47:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GnCm=5G=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pEuMl-0002mL-C1
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 15:47:15 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e35c2200-9034-11ed-91b6-6bf2151ebd3b;
 Mon, 09 Jan 2023 16:47:14 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id tz12so21150288ejc.9
 for <xen-devel@lists.xenproject.org>; Mon, 09 Jan 2023 07:47:14 -0800 (PST)
Received: from 2a02.2378.102e.bce5.ip.kyivstar.net
 ([2a02:2378:102e:bce5:dfc0:9312:b994:6b21])
 by smtp.gmail.com with ESMTPSA id
 22-20020a170906311600b0082535e2da13sm3851561ejx.6.2023.01.09.07.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 07:47:13 -0800 (PST)
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
X-Inumbo-ID: e35c2200-9034-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4Pz1P177MM0Pgd5YIF5gjJ+E47uWjB6mT+S1Msdqus=;
        b=mvHWZ/Po8AsyALfPQ85VY4fsnq1mIOxUKh2/XXSLd3JqbaJ92Olup/1digm91cv0gC
         dZd2m45lB+qnUO7N3+Gpcrwsi95TSD6CfQv+6Ep4f/qviDGTQatchaK9RnzN856UYvTM
         Xt3Mj9juPPGHHILnnAtGCP8COymH5VVhJ5vR+FaxO23lgxlb0ZhBbDxMpsGg+HQ8x8Jb
         9+eRg3CdQNLj+QUXl5SAPitFz6YudBRxknhEgxm+FQZ1VmDACgnkUpj2St8/xlCyAkNY
         KFyWSRmajDq/RxQ3gGmnBhn4XwCHuPqHZJppN41GxpyEbmKR7LPEYAlt3AAe4shjRGEU
         sTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4Pz1P177MM0Pgd5YIF5gjJ+E47uWjB6mT+S1Msdqus=;
        b=iI1MeWRHQbc1qwod58ewcEhSs6J8rq82oCNWKkw/ENJ2y6Rwoa3JyW31UTcaQxDXDy
         8AMCXrOXbHJUFoIWL0ozGf5enYlSxRHoRbLJN/MJkipxusm6Gp1nW21gZZ5tpcc7kIZd
         +gM8eCzorMTV1/DyV1A7edcfvUXmuR9FxZdOZ/shCOrAWderQUtKz9BE1ftOH92qTjLq
         Kp9TKSP5sciIywWKVhbxjiYP180GSANmdA2Q759+G5I2xnhDsrq1VE0cjkVEPBYaAXzV
         jgZ2TIJKqUSkFtJY03MfksGe9ChQ5rtGdCImvMaiDSn31dh8ByHujq47yF+3jkZvnuhp
         7XBg==
X-Gm-Message-State: AFqh2kp6LlHRyk3/FPa0cdH00+IrQKFw32TaWLSBt7SGCYcecRAA61sf
	/GZjhIEYnFE3mX97rx0lOPmMaie2U9kR6Q==
X-Google-Smtp-Source: AMrXdXuPy+TC91tuEc1UgylA0Yqd8RJGvEiIih4KUnWHYbKwDvuGdEfAw/R1yhKsNCju7XVZMT5xYg==
X-Received: by 2002:a17:907:c007:b0:7ad:f165:70c2 with SMTP id ss7-20020a170907c00700b007adf16570c2mr77178927ejc.27.1673279233938;
        Mon, 09 Jan 2023 07:47:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v2 8/8] automation: add RISC-V smoke test
Date: Mon,  9 Jan 2023 17:46:55 +0200
Message-Id: <494c2fd1e046de20c2fa24be3989cc6adde8fdbe.1673278109.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673278109.git.oleksii.kurochko@gmail.com>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check if there is a message 'Hello from C env' presents
in log file to be sure that stack is set and C part of early printk
is working.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
    - Move changes in the dockerfile to separate patch and  send it to
      mailing list separately:
        [PATCH] automation: add qemu-system-riscv to riscv64.dockerfile
    - Update test.yaml to wire up smoke test
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
2.38.1


