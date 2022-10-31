Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE5261389B
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 15:01:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432889.685613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVM7-0005Pt-6J; Mon, 31 Oct 2022 14:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432889.685613; Mon, 31 Oct 2022 14:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opVM7-0005LU-2f; Mon, 31 Oct 2022 14:01:35 +0000
Received: by outflank-mailman (input) for mailman id 432889;
 Mon, 31 Oct 2022 14:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X+oh=3A=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1opVM4-0004Ib-Oq
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 14:01:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 83ff3c8c-5924-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 15:01:28 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DDE911FB;
 Mon, 31 Oct 2022 07:01:37 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A3373F5A1;
 Mon, 31 Oct 2022 07:01:30 -0700 (PDT)
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
X-Inumbo-ID: 83ff3c8c-5924-11ed-8fd0-01056ac49cbb
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 4/4] automation: Add CI test jobs for Yocto
Date: Mon, 31 Oct 2022 14:00:56 +0000
Message-Id: <00335fd0abaee077c09a33ec6c3ae93ddce30f5b.1667224593.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667224593.git.bertrand.marquis@arm.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
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
Changes in v3:
- patch added
---
 automation/gitlab-ci/test.yaml | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index fc0884b12082..44febcf97262 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -52,6 +52,18 @@
   tags:
     - x86_64
 
+.yocto-test:
+  extends: .test-jobs-common
+  script:
+    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD}
+  variables:
+    YOCTO_VERSION: kirkstone
+    CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}
+  artifacts:
+    paths:
+      - 'logs/*'
+    when: always
+
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
@@ -186,3 +198,25 @@ qemu-smoke-x86-64-clang-pvh:
     - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
   needs:
     - debian-unstable-clang-debug
+
+# Yocto test jobs
+yocto-qemuarm64:
+  extends: .yocto-test
+  variables:
+    YOCTO_BOARD: qemuarm64
+  tags:
+    - arm64
+
+yocto-qemuarm:
+  extends: .yocto-test
+  variables:
+    YOCTO_BOARD: qemuarm
+  tags:
+    - arm32
+
+yocto-qemux86-64:
+  extends: .yocto-test
+  variables:
+    YOCTO_BOARD: qemux86-64
+  tags:
+    - x86_64
-- 
2.25.1


