Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DD66A8826
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 18:54:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505297.777998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7k-0008Sc-Tl; Thu, 02 Mar 2023 17:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505297.777998; Thu, 02 Mar 2023 17:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7k-0008Pc-KO; Thu, 02 Mar 2023 17:53:48 +0000
Received: by outflank-mailman (input) for mailman id 505297;
 Thu, 02 Mar 2023 17:53:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPDg=62=citrix.com=prvs=418368d91=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pXn7i-00086v-M1
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 17:53:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a55e85a-b923-11ed-a550-8520e6686977;
 Thu, 02 Mar 2023 18:53:42 +0100 (CET)
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
X-Inumbo-ID: 2a55e85a-b923-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677779622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Gw4QRlvuKAg+gD2hKfl/VjnsdW7wmqK+tl77agSSFfE=;
  b=JCLA4theHIg+fCAY3tiJwhgU4zSU78hgKX84/QZ9/qeikFMu0nXgc4l5
   W/DBw2RvsE6KKbOjGbZ6SsCiwjdrpukgTP3GFk8vnQERt5cGzeI98PvGt
   V815wWU6JgaYB8pLiC39LEoZGhqvfh6L/63i8wRzuuoeU0U/5t7VPj3op
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 101652773
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:mnH6Mq1I0kJeGAJrj/bD5clxkn2cJEfYwER7XKvMYLTBsI5bp2MEy
 zcXCmGBM/bbZzb1eNwiPY+28h9QsZKDz941SFZkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdmP6gQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfE1NU5
 PUGLhIxRzuHm9rn6u34Z8RuiZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiHJ0MwBvC+
 T2dl4j/KgoZa4Gu+CajyHnyvf3Dki/FQawJMITto5aGh3XMnzdOWXX6T2CTqvCjhkmzc9lWM
 UAT92wlqq1a3FewUtD3Uhm8oXiFlh0RQdxdF6s98g7l4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9WopWm1r+nO62noYG5McDFEPHVfJecY3zX9iJMBlAPGUNBBLIeeisHNSBuvg
 B2nridr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eJFcFg
 2eJ42u9AaO/21P7BZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzzxdywPxvY
 c7CLZfE4ZMm5UNPlmfeegvg+eVzmnBWKZ37HvgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 483Cid+8D0GCLeWSnCOoeYuwaUicSBT6Wbe95YGKYZu42NORAkcNhMm6eh6J9c+xvwLz7agE
 7PUchYw9WcTTEbvcW2iAk2Popu1NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:kuiJnKECtHJRKDPnpLqELMeALOsnbusQ8zAXPiBKJCC9E/bo8v
 xG+c5w6faaslkssR0b9+xoW5PwI080l6QU3WB5B97LMDUO0FHCEGgI1/qA/9SPIUzDHu4279
 YbT0B9YueAcGSTW6zBkXWF+9VL+qj5zEix792uq0uE1WtRGtldBwESMHf9LmRGADNoKLAeD5
 Sm6s9Ot1ObCA8qhpTSPAhiYwDbzee77a7bXQ==
X-IronPort-AV: E=Sophos;i="5.98,228,1673931600"; 
   d="scan'208";a="101652773"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 1/7] automation: Automatically rebuild debian:unstable container
Date: Thu, 2 Mar 2023 17:53:26 +0000
Message-ID: <20230302175332.56052-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230302175332.56052-1-anthony.perard@citrix.com>
References: <20230302175332.56052-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Only run this on the staging branch, whenever the dockerfile changes.

Allow to set a suffix when building containers, to be able to test it
before changing the one in production.

Using "rules" instead of "only" as this allow to use variables in the
"changes" rules. Also, "rules" is the preferred keyword as
"only/except" isn't being actively developed in GitLab.

Use $CI_PIPELINE_SOURCE==push to evaluate "rules:changes" only on
push. In most other cases, "rules:changes" evaluate to true so
checking CI_PIPELINE_SOURCE is important.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 .gitlab-ci.yml                       |  2 ++
 automation/build/Makefile            |  4 ++--
 automation/gitlab-ci/containers.yaml | 25 +++++++++++++++++++++++++
 3 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 automation/gitlab-ci/containers.yaml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c8bd7519d5..c5d499b321 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,7 +1,9 @@
 stages:
   - build
   - test
+  - containers
 
 include:
   - 'automation/gitlab-ci/build.yaml'
   - 'automation/gitlab-ci/test.yaml'
+  - 'automation/gitlab-ci/containers.yaml'
diff --git a/automation/build/Makefile b/automation/build/Makefile
index 4df43b0407..5515938878 100644
--- a/automation/build/Makefile
+++ b/automation/build/Makefile
@@ -16,9 +16,9 @@ help:
 include yocto/yocto.inc
 
 %: %.dockerfile ## Builds containers
-	$(DOCKER_CMD) build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
+	$(DOCKER_CMD) build --pull -t $(REGISTRY)/$(@D):$(@F)$(BUILD_CONTAINER_SUFFIX) -f $< $(<D)
 	@if [ ! -z $${PUSH+x} ]; then \
-		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F); \
+		$(DOCKER_CMD) push $(REGISTRY)/$(@D):$(@F)$(BUILD_CONTAINER_SUFFIX); \
 	fi
 
 .PHONY: all clean
diff --git a/automation/gitlab-ci/containers.yaml b/automation/gitlab-ci/containers.yaml
new file mode 100644
index 0000000000..ace93eaccf
--- /dev/null
+++ b/automation/gitlab-ci/containers.yaml
@@ -0,0 +1,25 @@
+.container-build-tmpl:
+  stage: containers
+  image: docker:stable
+  tags:
+    - container-builder
+  rules:
+    - if: $CI_PIPELINE_SOURCE == "push" && $CI_COMMIT_BRANCH == "staging"
+      changes:
+        - automation/build/${BUILD_CONTAINER}.dockerfile
+  services:
+    - docker:dind
+  before_script:
+    - apk add make
+    - docker info
+    - docker login -u $CI_DEPLOY_USER -p $CI_DEPLOY_PASSWORD $CI_REGISTRY
+  script:
+    - make -C automation/build ${BUILD_CONTAINER} PUSH=1 BUILD_CONTAINER_SUFFIX=-test
+  after_script:
+    - docker logout
+
+debian-unstable-container:
+  extends:
+    - .container-build-tmpl
+  variables:
+    BUILD_CONTAINER: debian/unstable
-- 
Anthony PERARD


