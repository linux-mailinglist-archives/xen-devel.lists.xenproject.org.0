Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D3F62D736
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 10:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444830.699945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbO3-0002tp-3y; Thu, 17 Nov 2022 09:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444830.699945; Thu, 17 Nov 2022 09:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbO2-0002pQ-UW; Thu, 17 Nov 2022 09:40:46 +0000
Received: by outflank-mailman (input) for mailman id 444830;
 Thu, 17 Nov 2022 09:40:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sbrt=3R=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1ovbO1-0002Nb-T0
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 09:40:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e7c4693f-665b-11ed-91b6-6bf2151ebd3b;
 Thu, 17 Nov 2022 10:40:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 857B1150C;
 Thu, 17 Nov 2022 01:40:49 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85A663F73B;
 Thu, 17 Nov 2022 01:40:42 -0800 (PST)
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
X-Inumbo-ID: e7c4693f-665b-11ed-91b6-6bf2151ebd3b
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 3/3] automation: Add CI test jobs for Yocto
Date: Thu, 17 Nov 2022 09:39:51 +0000
Message-Id: <b95d4402160ef2bbb457a7a0ad41d1265c5dac69.1668677493.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668677493.git.bertrand.marquis@arm.com>
References: <cover.1668677493.git.bertrand.marquis@arm.com>
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
The .yocto-test-arm64 template is to be used for jobs running on an
arm64 hardware and .yocto-test-x86-64 for x86. Current jobs are using
the arm64 version (x86 templates are here as a provision).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes in v4:
- add .yocto-test for arm64 and x86
- make yocto jobs use arm64 version
Changes in v3:
- patch added
---
 automation/gitlab-ci/test.yaml | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index c7e0078e04f1..6ce2fd63eee6 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -54,6 +54,33 @@
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
@@ -188,3 +215,19 @@ qemu-smoke-x86-64-clang-pvh:
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


