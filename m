Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AAE4C8B4A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 13:12:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281298.479588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1M3-0000Ql-51; Tue, 01 Mar 2022 12:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281298.479588; Tue, 01 Mar 2022 12:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1M2-0000Og-UN; Tue, 01 Mar 2022 12:11:46 +0000
Received: by outflank-mailman (input) for mailman id 281298;
 Tue, 01 Mar 2022 12:11:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWoc=TM=citrix.com=prvs=05201426e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nP1M0-0008Ic-S6
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 12:11:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c23443fd-9958-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 13:11:43 +0100 (CET)
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
X-Inumbo-ID: c23443fd-9958-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646136703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cqtCddEDOMO9N2RINgp4gRg+BSZg2vJGBvVef7c4kfs=;
  b=fNkZWA8hX3vSDkdwh/BlOQpW2wKTSQyt1fQxzXDyatog/f8/OLp2B5VY
   A+9RzzYLWRAEI4pLsCQnnOHtlFOtZqYcfmYH/JSQcM9xsOC7e0JkQH+Pk
   65Q47jxU8o+q1YEaUFRxb7rG+iQ/VKvujtIByE1VZPfl1K18jQ01kQNxt
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65205233
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:wkIlAqnuMJDzGyxqp31RZiHo5gydJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOWGuDbP+JZDb0Kdwjb46z/BtU7ZSHndBjSwRkqng1EiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DiW1rV4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYbg10Dq7VxfYhVBgASC8uOu5i9oP/Li3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNGA3MU6bOHWjPH9JBJ8kmbewmkXlTDtWjECetPQ14XbqmVkZPL/Fb4OOJ43iqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntSjyQo4VGZWz/+Rmh1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGGAlg4RXZxXCeJS1e2W4vOKuUDDXDFCF2MfLox93CMredA0/
 niDwuPqHGF9jLqUESmTprDXiT2OASdAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJszHlJd3j6
 2vU9XZj3t3/meZOjvzmpg6f31pAs7CUFlZd2+nBYo6yAuqVjqaBbpfg11XU5O0owG2xHgjY5
 yhsdyRzAYkz4XCxeM6lHb1l8FKBva/t3NjgbbhHRcFJG9OFoSPLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp2k/C/Toq5D6mNP7Kih6Sdkifdp0mCgmbKggjQfLUEy/lja
 f93j+72ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeKmeJxI9E+xv8N/goKl
 1nkMnJlJJPErSWvAW23hrpLMtsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:crhbyazxyZGY8tnSuOGhKrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65205233"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 2/3] automation: automatically build debian:stable container
Date: Tue, 1 Mar 2022 12:11:32 +0000
Message-ID: <20220301121133.19271-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301121133.19271-1-anthony.perard@citrix.com>
References: <20220301121133.19271-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Only run this on the staging branch, whenever the dockerfile changes.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 .gitlab-ci.yml                       |  2 ++
 automation/gitlab-ci/containers.yaml | 22 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 automation/gitlab-ci/containers.yaml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c8bd7519d5..f934d3eff8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,9 @@
 stages:
+  - containers
   - build
   - test
 
 include:
+  - 'automation/gitlab-ci/containers.yaml'
   - 'automation/gitlab-ci/build.yaml'
   - 'automation/gitlab-ci/test.yaml'
diff --git a/automation/gitlab-ci/containers.yaml b/automation/gitlab-ci/containers.yaml
new file mode 100644
index 0000000000..2daf257f11
--- /dev/null
+++ b/automation/gitlab-ci/containers.yaml
@@ -0,0 +1,22 @@
+debian-stable-container:
+  stage: containers
+  image: docker:stable
+  variables:
+    BUILD_CONTAINER: debian/stable
+  tags:
+    - container-builder
+  only:
+    refs:
+      - staging
+    changes:
+      - automation/build/${BUILD_CONTAINER}.dockerfile
+  services:
+    - docker:dind
+  before_script:
+    - apk add make
+    - docker info
+    - docker login -u $CI_DEPLOY_USER -p $CI_DEPLOY_PASSWORD $CI_REGISTRY
+  script:
+    - make -C automation/build ${BUILD_CONTAINER} PUSH=1
+  after_script:
+    - docker logout
-- 
Anthony PERARD


