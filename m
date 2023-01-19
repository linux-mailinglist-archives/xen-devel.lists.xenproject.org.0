Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CE06738EB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 13:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480998.745678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUIT-0002tx-N3; Thu, 19 Jan 2023 12:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480998.745678; Thu, 19 Jan 2023 12:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIUIT-0002rC-Jw; Thu, 19 Jan 2023 12:45:37 +0000
Received: by outflank-mailman (input) for mailman id 480998;
 Thu, 19 Jan 2023 12:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qz+V=5Q=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIUIR-0001sI-OD
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 12:45:35 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29c293aa-97f7-11ed-b8d1-410ff93cb8f0;
 Thu, 19 Jan 2023 13:45:33 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id r9so1748894wrw.4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jan 2023 04:45:33 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a5d684f000000b002bddac15b3dsm17909808wrw.33.2023.01.19.04.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 04:45:32 -0800 (PST)
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
X-Inumbo-ID: 29c293aa-97f7-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctVbfTUMTOLN4KM620LAPIxTZt2tk9IeJCHpD6YNn4Y=;
        b=pLK7VCRtqg/YseT3XaGEaSd7V37XOED6G3j6l+wW7vWyiDLkyvioV/xfqmk5uAp6cA
         QtpQRqgP7KfjXJs9nChZYXMlwfppCWGyXZ12XH0qrIErdnO9VnKstu4Jjn+rr+bJfNjk
         4lcLt2Q0neWVD3Rac8PZYA2DgcTHdBXgfqzGzYWF2qASo1MKAWMpho+fC0/fGlKFIabp
         JZnSn+I8EtPAE54s/iVOi3l/zb7psWvT1AlQ/YgS95RUEebn5SB/QmVavINva0rlU/+N
         AJYCIAwK/skoSjE/coi1RMJJOFXRgZ/g0TC59vnwNhvqJZoU04CJtPbiu9Z/mndzZNZZ
         y+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctVbfTUMTOLN4KM620LAPIxTZt2tk9IeJCHpD6YNn4Y=;
        b=wAUsKE1pIf1ncucjuavcySZf7z87cZMillEx383MkyKM0j5erKaY5hWb8S7Tao/PLa
         7HDEaMRIxPIpWiKyhpehejYRpjdiq3xY6qhikqMpGlEaZ+uwcCtifxv3pwU/PaTFJsMi
         1tt2ujhLKuNeKMMo0ADuylGccy4qtKhEdzL+DY26rftCa82dOUKzA+vdsXluXxuxkvEJ
         TTGhy5m1ShBNiGw1knf3rf0oVCWLLCVUo/dP/yW33RuAU2n5TCdZ5F86BHCb9Sxs6ySo
         BLVYy6CA6stLRdSDp+bBYNFa6GNBHD0sQk6Cj6xt3sAngQj9g09+yips9mTPDEx2wiVv
         WB/w==
X-Gm-Message-State: AFqh2krKV7gy3H4kvTpwohpNgj+e6SKrAaIToPGjNXYykROKrsRtbaIf
	a+JBg//bVIzVMzYY0wZEkNl0hjIVL/Bopg==
X-Google-Smtp-Source: AMrXdXvzUUqNE5ShYhe+N5yA48TiQ/D85X6AVjWaq6Iz6juKhqEOQZ9p/pdhj44RgBtZo9rDG8/eHA==
X-Received: by 2002:a05:6000:3c2:b0:2bd:d45c:3929 with SMTP id b2-20020a05600003c200b002bdd45c3929mr10774555wrg.54.1674132333238;
        Thu, 19 Jan 2023 04:45:33 -0800 (PST)
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
Date: Thu, 19 Jan 2023 14:45:17 +0200
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


