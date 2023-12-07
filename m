Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CC880898F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 14:53:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649878.1014978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEp6-00048Q-2r; Thu, 07 Dec 2023 13:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649878.1014978; Thu, 07 Dec 2023 13:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBEp5-00043y-V7; Thu, 07 Dec 2023 13:53:51 +0000
Received: by outflank-mailman (input) for mailman id 649878;
 Thu, 07 Dec 2023 13:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cCsk=HS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1rBEp4-0002bv-AD
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 13:53:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 0bbdcb4f-9508-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 14:53:48 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0187412FC;
 Thu,  7 Dec 2023 05:54:34 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5A40A3F6C4;
 Thu,  7 Dec 2023 05:53:45 -0800 (PST)
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
X-Inumbo-ID: 0bbdcb4f-9508-11ee-9b0f-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH 5/5] automation: Add the arm64 FVP build and Dom0 smoke test jobs
Date: Thu,  7 Dec 2023 21:53:18 +0800
Message-Id: <20231207135318.1912846-6-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231207135318.1912846-1-Henry.Wang@arm.com>
References: <20231207135318.1912846-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a job in the build stage to export the TF-A, U-Boot and the
device tree for the FVP platform from the test artifact container.

Add a FVP smoke test job in the test stage to do the same test as
the `qemu-smoke-dom0-arm64-gcc` job.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
Although it does not affect the functionality, I am still quite
confused about why the logs displayed by GitLab UI, for
example [1], is much less than the actual output (saved in the
artifacts, see [2]). Had a discussion with Michal on Matrix
and we agree that the log in gitlab UI is usually capped.

[1] https://gitlab.com/xen-project/people/henryw/xen/-/jobs/5700569676
[2] https://gitlab.com/xen-project/people/henryw/xen/-/jobs/5700569676/artifacts/file/smoke.serial
---
 automation/gitlab-ci/build.yaml | 17 +++++++++++++++++
 automation/gitlab-ci/test.yaml  | 22 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 32af30cced..89d2f01302 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -344,6 +344,23 @@ kernel-6.1.19-export:
   tags:
     - x86_64
 
+armfvp-uboot-tfa-2023.10-2.9.0-arm64-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/armfvp-uboot-tfa:2023.10-2.9.0-arm64v8
+  script:
+    - |
+       mkdir binaries && \
+       cp /bl1.bin binaries/bl1.bin && \
+       cp /fip.bin binaries/fip.bin && \
+       cp /fvp-base-gicv3-psci-1t.dtb binaries/fvp-base-gicv3-psci-1t.dtb
+  artifacts:
+    paths:
+      - binaries/bl1.bin
+      - binaries/fip.bin
+      - binaries/fvp-base-gicv3-psci-1t.dtb
+  tags:
+    - arm64
+
 # Jobs below this line
 
 # Build jobs needed for tests
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 6aabdb9d15..47e00d0a0b 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -96,6 +96,19 @@
   tags:
     - xilinx
 
+.fvp-arm64:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: debian:bookworm-arm64v8-fvp
+    LOGFILE: fvp-smoke-arm64.log
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+
 .adl-x86-64:
   extends: .test-jobs-common
   variables:
@@ -459,3 +472,12 @@ qemu-smoke-ppc64le-powernv9-gcc:
   needs:
     - qemu-system-ppc64-8.1.0-ppc64-export
     - debian-bullseye-gcc-ppc64le-debug
+
+fvp-smoke-dom0-arm64-gcc-debug:
+  extends: .fvp-arm64
+  script:
+    - ./automation/scripts/fvp-base-smoke-dom0-arm64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - armfvp-uboot-tfa-2023.10-2.9.0-arm64-export
+    - alpine-3.18-gcc-debug-arm64
-- 
2.25.1


