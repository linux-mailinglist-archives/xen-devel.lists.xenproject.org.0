Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F1E9CF25D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 18:08:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837871.1253791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBznU-00088N-6Y; Fri, 15 Nov 2024 17:07:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837871.1253791; Fri, 15 Nov 2024 17:07:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBznU-00086a-3v; Fri, 15 Nov 2024 17:07:52 +0000
Received: by outflank-mailman (input) for mailman id 837871;
 Fri, 15 Nov 2024 17:07:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4+hr=SK=bounce.vates.tech=bounce-md_30504962.67377fdf.v1-5cbf7a7fed934b029d368e370fa901a3@srs-se1.protection.inumbo.net>)
 id 1tBznS-0007cN-O6
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 17:07:50 +0000
Received: from mail136-26.atl41.mandrillapp.com
 (mail136-26.atl41.mandrillapp.com [198.2.136.26])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21bcbd8b-a374-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 18:07:45 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-26.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4Xqk3h03ZQzJKFHwd
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 17:07:44 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5cbf7a7fed934b029d368e370fa901a3; Fri, 15 Nov 2024 17:07:43 +0000
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
X-Inumbo-ID: 21bcbd8b-a374-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzNi4yNiIsImhlbG8iOiJtYWlsMTM2LTI2LmF0bDQxLm1hbmRyaWxsYXBwLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjIxYmNiZDhiLWEzNzQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjkwNDY1Ljg5NjU2Niwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3Mzc3ZmRmLnYxLTVjYmY3YTdmZWQ5MzRiMDI5ZDM2OGUzNzBmYTkwMWEzQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1731690464; x=1731950964;
	bh=z5g9B4pcUfOV2QfB5jo7SdrQJ3IQc5YdeVG72LGap4o=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Hk4NxCOp/FChU9Ti2r9+jQ5n044Ox07SJMSUf7DxqhNfIwjwHSG7UD+T5SnFVjK5o
	 JqWMm+O1PxSQoXuf43JDbjddzfuHHEp4+NCtd7Wn2MUOgJxB/gVPv3cpQ++RnWXUin
	 KXNaaqUOfFQ8TCzI/6oxOjLJ/UIcycWT85Zjsxhk7YNc/TBEukXkvKwY7uRtLVhW3U
	 eNDZxcVKXPcG3md0TSD6wnbvLVLy3HXEKXvz0DisL7oXnaCxLqmBNy9ohKeX+ZuxFx
	 QiK6zdLcnOGo48CL6oalJDUirhACNAuCJL4URupNjqkLVLjP91DtdVAiUu4Sp7HuMZ
	 hK0yBndnKUXRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1731690464; x=1731950964; i=anthony.perard@vates.tech;
	bh=z5g9B4pcUfOV2QfB5jo7SdrQJ3IQc5YdeVG72LGap4o=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=hDqUtCwTHD1UfZV833jARuyN2m2wIKTiUDdAGUmEnC1Lnhaf80iG3/hTc5CzQbjrz
	 G0bDs2wSDn0YbPM95AQwBLZj0j5JSfQZIAZFG0l90hbR0cSEd9+TkMuAkj9fTTHAaA
	 r24kdRCyTH1qdn9GuBRfznyTYI4SFHgLwc5tAUaPg3D3nG40PJfJym9/UYKclH17Ik
	 3Z000bx5tQqQ3X44BAHN+ouiPWrCIxAnAhyuV84852bPPom4VcEvUcHW0tCvgy/Rjt
	 mUMWTgAJQE/QCGPd13dJmPsp6B453caUzkHzXEc5Zdolp3pFMGG8UYDMXGluTpnoxx
	 t+Z5TRjLYCSqA==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=203/3]=20CI:=20New=20stage=20"containers"=20to=20rebuild=20some=20containers?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1731690462962
To: xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20241115170739.48983-4-anthony.perard@vates.tech>
In-Reply-To: <20241115170739.48983-1-anthony.perard@vates.tech>
References: <20241115170739.48983-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5cbf7a7fed934b029d368e370fa901a3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241115:md
Date: Fri, 15 Nov 2024 17:07:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Rebuild rolling release containers when XEN_CI_REBUILD_CONTAINERS is
set. This is to be use with a scheduled pipeline.

When $XEN_CI_REBUILD_CONTAINERS is set, only build jobs related to the
containers been rebuild will be executed.

Build jobs that are using one of the containers been rebuild should
wait for the container to be rebuild. If it's a normal pipeline, those
dependency are simply ignored.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---
 .gitlab-ci.yml                       |  2 +
 automation/gitlab-ci/build.yaml      | 57 ++++++++++++++++++----------
 automation/gitlab-ci/containers.yaml | 29 ++++++++++++++
 automation/gitlab-ci/test.yaml       | 13 +++++++
 4 files changed, 81 insertions(+), 20 deletions(-)
 create mode 100644 automation/gitlab-ci/containers.yaml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 941e5822e8..dab9171086 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -8,11 +8,13 @@ workflow:
     - when: always
 
 stages:
+  - containers
   - analyze
   - build
   - test
 
 include:
+  - 'automation/gitlab-ci/containers.yaml'
   - 'automation/gitlab-ci/analyze.yaml'
   - 'automation/gitlab-ci/build.yaml'
   - 'automation/gitlab-ci/test.yaml'
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 1ca6764225..e01eec1423 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -3,6 +3,9 @@
   image: ${XEN_REGISTRY}/${CONTAINER}
   script:
     - ./automation/scripts/build 2>&1 | tee build.log
+  rules:
+    - if: $XEN_CI_REBUILD_CONTAINERS && $XEN_CI_RUN_AFTER_CONTAINER_BUILD
+    - if: $XEN_CI_REBUILD_CONTAINERS == null
   artifacts:
     paths:
       - binaries/
@@ -255,6 +258,8 @@
 .test-jobs-artifact-common:
   stage: build
   needs: []
+  rules:
+    - if: $XEN_CI_REBUILD_CONTAINERS == null
 
 # Arm test artifacts
 
@@ -516,17 +521,24 @@ alpine-3.18-clang-debug:
   variables:
     CONTAINER: alpine:3.18
 
-archlinux-gcc:
-  extends: .gcc-x86-64-build
+.container-archlinux-current:
   variables:
     CONTAINER: archlinux:current
+    XEN_CI_RUN_AFTER_CONTAINER_BUILD: true
+  needs:
+    - job: container-archlinux-current
+      optional: true
   allow_failure: true
 
+archlinux-gcc:
+  extends:
+    - .gcc-x86-64-build
+    - .container-archlinux-current
+
 archlinux-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: archlinux:current
-  allow_failure: true
+  extends:
+    - .gcc-x86-64-build-debug
+    - .container-archlinux-current
 
 centos-7-gcc:
   extends: .gcc-x86-64-build
@@ -657,29 +669,34 @@ opensuse-leap-15.6-gcc-debug:
   variables:
     CONTAINER: opensuse:leap-15.6-x86_64
 
-opensuse-tumbleweed-clang:
-  extends: .clang-x86-64-build
+.container-opensuse-tumbleweed-x86_64:
   variables:
     CONTAINER: opensuse:tumbleweed-x86_64
+    XEN_CI_RUN_AFTER_CONTAINER_BUILD: true
+  needs:
+    - job: container-opensuse-tumbleweed-x86_64
+      optional: true
   allow_failure: true
 
+opensuse-tumbleweed-clang:
+  extends:
+    - .clang-x86-64-build
+    - .container-opensuse-tumbleweed-x86_64
+
 opensuse-tumbleweed-clang-debug:
-  extends: .clang-x86-64-build-debug
-  variables:
-    CONTAINER: opensuse:tumbleweed-x86_64
-  allow_failure: true
+  extends:
+    - .clang-x86-64-build-debug
+    - .container-opensuse-tumbleweed-x86_64
 
 opensuse-tumbleweed-gcc:
-  extends: .gcc-x86-64-build
-  variables:
-    CONTAINER: opensuse:tumbleweed-x86_64
-  allow_failure: true
+  extends:
+    - .gcc-x86-64-build
+    - .container-opensuse-tumbleweed-x86_64
 
 opensuse-tumbleweed-gcc-debug:
-  extends: .gcc-x86-64-build-debug
-  variables:
-    CONTAINER: opensuse:tumbleweed-x86_64
-  allow_failure: true
+  extends:
+    - .gcc-x86-64-build-debug
+    - .container-opensuse-tumbleweed-x86_64
 
 # PowerPC builds (x86 cross)
 debian-11-ppc64le-gcc:
diff --git a/automation/gitlab-ci/containers.yaml b/automation/gitlab-ci/containers.yaml
new file mode 100644
index 0000000000..25e8bdc34b
--- /dev/null
+++ b/automation/gitlab-ci/containers.yaml
@@ -0,0 +1,29 @@
+.container-build-tmpl:
+  stage: containers
+  image: docker:stable
+  tags:
+    - container-builder
+  rules:
+    - if: $XEN_CI_REBUILD_CONTAINERS
+  services:
+    - docker:dind
+  before_script:
+    - apk add make
+    - docker info
+    - docker login -u $CI_DEPLOY_USER -p $CI_DEPLOY_PASSWORD $CI_REGISTRY
+  script:
+    - make -C automation/build PUSH=1 REGISTRY=${XEN_REGISTRY} ${CONTAINER/:/\/}
+  after_script:
+    - docker logout
+
+container-archlinux-current:
+  extends:
+    - .container-build-tmpl
+  variables:
+    CONTAINER: "archlinux:current"
+
+container-opensuse-tumbleweed-x86_64:
+  extends:
+    - .container-build-tmpl
+  variables:
+    CONTAINER: "opensuse:tumbleweed-x86_64"
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1822e3ea5f..e4d4f1f3c9 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -1,6 +1,16 @@
+.test-rules:
+  # Only add rules which prevent jobs from been added to the pipeline. They
+  # should all have "when: never".
+  pre_rules:
+    - if: $XEN_CI_REBUILD_CONTAINERS
+      when: never
+
 .test-jobs-common:
   stage: test
   image: ${XEN_REGISTRY}/${CONTAINER}
+  rules:
+    - !reference [.test-rules, pre_rules]
+    - when: always
 
 .arm64-test-needs: &arm64-test-needs
   - alpine-3.18-arm64-rootfs-export
@@ -99,6 +109,7 @@
       - '*.dtb'
     when: always
   rules:
+    - !reference [.test-rules, pre_rules]
     - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - xilinx
@@ -117,6 +128,7 @@
       - '*.log'
     when: always
   rules:
+    - !reference [.test-rules, pre_rules]
     - if: $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - xilinx
@@ -136,6 +148,7 @@
       - '*.log'
     when: always
   rules:
+    - !reference [.test-rules, pre_rules]
     - if: $QUBES_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
   tags:
     - qubes-hw2
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

