Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4C263F2C9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 15:26:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450781.708257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kVm-0002e7-TN; Thu, 01 Dec 2022 14:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450781.708257; Thu, 01 Dec 2022 14:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0kVm-0002Yd-Pd; Thu, 01 Dec 2022 14:26:02 +0000
Received: by outflank-mailman (input) for mailman id 450781;
 Thu, 01 Dec 2022 14:26:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ecKG=37=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1p0kVl-0001kY-0Y
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 14:26:01 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 13d470d9-7184-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 15:26:00 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4719C13D5;
 Thu,  1 Dec 2022 06:26:06 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3CA63F73D;
 Thu,  1 Dec 2022 06:25:58 -0800 (PST)
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
X-Inumbo-ID: 13d470d9-7184-11ed-8fd2-01056ac49cbb
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v6 3/3] automation: Add CI test jobs for Yocto
Date: Thu,  1 Dec 2022 14:25:32 +0000
Message-Id: <9a50c9bfad26f6828ab0f6325721286b2af15581.1669904508.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669904508.git.bertrand.marquis@arm.com>
References: <cover.1669904508.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michal Orzel <michal.orzel@amd.com>

Populate test jobs for Yocto based tests using the provided containers.
Due to the size restrictions, it is currently not possible to split the
build and run tasks, therefore everything is done in a single step.

Test jobs for the supported Yocto targets are generic to avoid the
necessity to add new ones after each Yocto release. The only thing
required to be changed after updating the containers is the variable
YOCTO_VERSION stored in a .yocto-test template.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v6:
- add comment explaining why the unused x86 yocto entry is there
Changes in v5:
- none
Changes in v4:
- add .yocto-test for arm64 and x86
- make yocto jobs use arm64 version
Changes in v3:
- patch added
---
 automation/gitlab-ci/test.yaml | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index c7e0078e04f1..2d57f4feb74a 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -54,6 +54,35 @@
   tags:
     - x86_64
 
+.yocto-test:
+  extends: .test-jobs-common
+  script:
+    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD}
+  variables:
+    YOCTO_VERSION: kirkstone
+    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}-${YOCTO_HOST}
+  artifacts:
+    paths:
+      - 'logs/*'
+    when: always
+  needs: []
+
+.yocto-test-arm64:
+  extends: .yocto-test
+  variables:
+    YOCTO_HOST: arm64v8
+  tags:
+    - arm64
+
+# This is not used by any test job as we only run Yocto on arm based machines.
+# Keep it here so that someone having x86 hardware can easily add jobs.
+.yocto-test-x86-64:
+  extends: .yocto-test
+  variables:
+    YOCTO_HOST: amd64
+  tags:
+    - x86_64
+
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
@@ -188,3 +217,19 @@ qemu-smoke-x86-64-clang-pvh:
     - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
   needs:
     - debian-unstable-clang-debug
+
+# Yocto test jobs
+yocto-qemuarm64:
+  extends: .yocto-test-arm64
+  variables:
+    YOCTO_BOARD: qemuarm64
+
+yocto-qemuarm:
+  extends: .yocto-test-arm64
+  variables:
+    YOCTO_BOARD: qemuarm
+
+yocto-qemux86-64:
+  extends: .yocto-test-arm64
+  variables:
+    YOCTO_BOARD: qemux86-64
-- 
2.25.1


