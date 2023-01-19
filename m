Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AE7673B4F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 15:08:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481134.745874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZt-0004I0-Km; Thu, 19 Jan 2023 14:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481134.745874; Thu, 19 Jan 2023 14:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIVZt-0004BO-GI; Thu, 19 Jan 2023 14:07:41 +0000
Received: by outflank-mailman (input) for mailman id 481134;
 Thu, 19 Jan 2023 14:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qz+V=5Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIVZs-0002xN-01
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 14:07:40 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a16bad09-9802-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 15:07:38 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so3680726wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 06:07:38 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 m27-20020a05600c3b1b00b003db012d49b7sm7710178wms.2.2023.01.19.06.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 06:07:37 -0800 (PST)
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
X-Inumbo-ID: a16bad09-9802-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgsH/CzG/dU21eVLxWuw+pTYHwBhlSsBbVXpHvXre8w=;
        b=GG8lkNuDJ7IxD/6TF5mKdV3iyZ6bOAtHF4yjOOg5H44I6mKGQ6itZNWInZe4nILewy
         pLQIUAV0nznuHRLIupof4W9e81l50QnzJlWOUbGtSqlGX1F86TS0IMrfhB849i6VjdYI
         Bs/Prj8aBnYpsVIrZuCoX5h0ex7xbiQC9cUf4eYCTjkiLTitfjjkfpMOuP5+B6B9NFGu
         HG06zMMMH1246nYKAW7PFSoSUkuqnaPpBaaC2Qb/0/aYmMU/VHF578sYaJqZ28ybEgK1
         5vWMwsDnlH9wfh7hctSq73eq/H+tvvFEdK4raFfkTkHITC8xdSsII5LrWmXQZUvYrYcU
         J5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgsH/CzG/dU21eVLxWuw+pTYHwBhlSsBbVXpHvXre8w=;
        b=LUJ2zM+B9/ws+lH+82cDpsfV8vV7wuSzBCEs4IuXvwgE6s0MAq4KmHDsht82omsLiT
         FafgGPuLPNM367gGu+4X5B0KEy620UoaUzb7eIDcvxlLxfGj0RQFPKGm1W07k6tkKEMN
         XFh42Ql0qTeFYTNGf6NPf6EgEsn1nIDTazYzZ7Bh906XadDGPuxBi3K2M/XGo+MIPfb7
         xgGcd1tENZHW6h8t0Z7o31uAIfhhCRNpkD0c/2C9nIIz/bXNO9RDn9mTY6akWUevqr/Z
         aKj/mCDQmEnR61edjAi7aL9x+wq7hnk+5rDVZxBy8TjrSbnUSPRU7ckWfMpU2+2Ta35Z
         z5Ug==
X-Gm-Message-State: AFqh2ko9gvSv2ZLuaiGndav9WwW+RiGEvEgEN9FRectKXXRisrghTJ5r
	yslt046vTZQ7/U8A2GqKeWM8NLAA26rh7Q==
X-Google-Smtp-Source: AMrXdXu4wpk3TxRlzYdGxqTT7WSP1h04pgt7CCuwHlR6P4mC5Mye9uRcbBcbSLiVBz7lKXsxgvXLPw==
X-Received: by 2002:a7b:c4d0:0:b0:3d1:f6b3:2ce3 with SMTP id g16-20020a7bc4d0000000b003d1f6b32ce3mr10842359wmk.35.1674137257840;
        Thu, 19 Jan 2023 06:07:37 -0800 (PST)
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
Subject: [PATCH v5 5/5] automation: add RISC-V smoke test
Date: Thu, 19 Jan 2023 16:07:22 +0200
Message-Id: <30727cdc63dfaad22f0781d35205646da130e4fa.1674131459.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674131459.git.oleksii.kurochko@gmail.com>
References: <cover.1674131459.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check if there is a message 'Hello from C env' presents
in log file to be sure that stack is set and C part of early printk
is working.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
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


