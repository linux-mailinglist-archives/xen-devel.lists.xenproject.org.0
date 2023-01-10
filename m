Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D30664464
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 16:18:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474747.736121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGOE-0006wB-5y; Tue, 10 Jan 2023 15:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474747.736121; Tue, 10 Jan 2023 15:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFGOE-0006qz-11; Tue, 10 Jan 2023 15:18:14 +0000
Received: by outflank-mailman (input) for mailman id 474747;
 Tue, 10 Jan 2023 15:18:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pFGOB-0005G6-E0
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 15:18:11 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe5a9a3b-90f9-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 16:18:10 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id d30so14048152lfv.8
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 07:18:10 -0800 (PST)
Received: from fedora.. ([195.234.76.149]) by smtp.gmail.com with ESMTPSA id
 y19-20020a0565123f1300b00498fc3d4cfdsm2203396lfa.189.2023.01.10.07.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 07:18:09 -0800 (PST)
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
X-Inumbo-ID: fe5a9a3b-90f9-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0syX+Z8ZsLO1K+qpK4hh/FiHzxvRksi171obTN3jJ5s=;
        b=Seey/dkCQRMk/iJocB/HBc0GgJnYzseGgxmfJDzEi5gt6+ob6lcNEkTYzUt+FwXLLG
         qXUCORaM5iafVcoX8VoTRr5loffmCABlS2bqkcTCtW9lt92+CRD8pzuuuDbRMuvo0nqN
         OFuf+ihwuoohMSMxzc7qjx0pZ7ksSdIjysXs3HvSSHe92nm61P0QwvswqVKUUd4i47Zz
         4cTmCmK0ftorLJzQvV2smQgFZfGCyDDBJYE1WLaJB4f9Ps1JnLDSJDbZ99oArjjNwrXO
         gFknI3JZAL8zCz4R5wsa2pkM6VMdxpcQBk3yYqCy2FpsVfUUOKGMzZegd8sSplxS4+it
         pWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0syX+Z8ZsLO1K+qpK4hh/FiHzxvRksi171obTN3jJ5s=;
        b=FZ75vsgLIvgYPXaIxSIiNlWf0Eav7MNooaOKN+ijmY08Mj8xshKi1LHNMiIL2rXRNt
         HVU2HUobHmZVPu0NtnkFcPoaV3dcthIlHawyk2+H0cNlyqE4nMJbox4sJemXF4bNGrGE
         4qVpisfsgZgNRL2HI6eT9fWxH59JV0T/+SWiau30q3nuJWs53TjCXmiB0q9bACs3a8Oa
         GUWJsN9O1bEHN/3+RLfJdagOchrbim0PHrvm1b9h7lZAhSIev6kObrOYDgtMQQ1Y545D
         +aq+GwgV9wrRrls1v/nR2JEz6Dr85YaWSVkyDDydK7/457cK0jeNWc73zZMZh4PMvrQe
         Gj1g==
X-Gm-Message-State: AFqh2kprWF0rW0Y1KmsaygF2UGSxVca1kOZA14SOAMMKVmVwC1wtrRLe
	8hmb8TpbynUEjBSh8TYrZXkZi6jJddwvo2Le
X-Google-Smtp-Source: AMrXdXsFr5BRkDWcCuVCxV1t9ah3Jggix5v9K7BgRPKnGRUnn6vsP+toxhtmFOCv3YC5BZh9d6NRBg==
X-Received: by 2002:a05:6512:400d:b0:4b5:936e:69df with SMTP id br13-20020a056512400d00b004b5936e69dfmr22497064lfb.53.1673363890034;
        Tue, 10 Jan 2023 07:18:10 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 6/6] automation: add RISC-V smoke test
Date: Tue, 10 Jan 2023 17:17:59 +0200
Message-Id: <7a7eeba57589465e34be00f3d031866abe53e466.1673362493.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1673362493.git.oleksii.kurochko@gmail.com>
References: <cover.1673362493.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add check if there is a message 'Hello from C env' presents
in log file to be sure that stack is set and C part of early printk
is working.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in V3:
    - Nothing changed
    - All mentioned comments by Stefano in Xen mailing list will be
      fixed as a separate patch out of this patch series.
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


