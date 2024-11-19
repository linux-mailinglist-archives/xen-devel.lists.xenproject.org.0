Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E9E9D2332
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 11:16:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839869.1255669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLGi-0002k3-Op; Tue, 19 Nov 2024 10:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839869.1255669; Tue, 19 Nov 2024 10:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLGi-0002iZ-Lo; Tue, 19 Nov 2024 10:15:36 +0000
Received: by outflank-mailman (input) for mailman id 839869;
 Tue, 19 Nov 2024 10:15:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lJrM=SO=bounce.vates.tech=bounce-md_30504962.673c6540.v1-777426e5b10b465a963a688c0ea251a7@srs-se1.protection.inumbo.net>)
 id 1tDLGh-0002Fv-B4
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 10:15:35 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35a34943-a65f-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 11:15:33 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4Xt0k81qHjz3sNZlL
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 10:15:28 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 777426e5b10b465a963a688c0ea251a7; Tue, 19 Nov 2024 10:15:28 +0000
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
X-Inumbo-ID: 35a34943-a65f-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjM1YTM0OTQzLWE2NWYtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDExMzMzLjM3ODM3NSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2M2NTQwLnYxLTc3NzQyNmU1YjEwYjQ2NWE5NjNhNjg4YzBlYTI1MWE3QGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732011328; x=1732271828;
	bh=CTj79Aidpkj+HeXz2gHR27Q6nRmA1BnigZ0Th5dpiY0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sZy4lXE5Oa2D6fmKcBLD40opJwb4IexA/aY8//MqDa5ZccqtrNuceBtVM8A+82lsN
	 h9cmPUZEqNDZYPIWY8iGnjj89UcPkz/gu+FFiRbZmaBWRqYaRwTP+LR0pwWMnWMzFF
	 gDa6Yjg2wCsGufec71EYAhxjSU335iLlkqCTLSiNC4KwM6/gXMqhd/jjhxFdjBWB8v
	 uKOu93Xd5uxeISnLaXq8CYOeoqrf9AfJh6gjvwF6l5vbxR7CAwKNsYBSCxjNtWgQip
	 X5rX4V+U9oQZm0w5CZUF6p5Xm0lYY7nUEbxS1DGGk81+vqv3UO2Z/HlVrqZWJb+C5y
	 zsPpVK4ne0aMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732011328; x=1732271828; i=anthony.perard@vates.tech;
	bh=CTj79Aidpkj+HeXz2gHR27Q6nRmA1BnigZ0Th5dpiY0=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=euz67s3ZbyWB3xrOo73vbxLffaggiB9bULruAz4hT4dIE8cCdk+hxi7IfygdC0hpF
	 UJAgsAf9kyfF9wgZCxNW6zxe3yu3s3P2iF4uxle0l7Hjr2/X/g4Oy7JHFiRz9Lb9WW
	 wwpefZE/+69gJFgsB4XNFMxYI+XvvuVzQX4V3rLoz+uHDE/ETcADw/HaL39hT9SqmW
	 U4Syvc1MhWgSCvGG11pxYCltGhLYku83mJh2EBSdMZj8wx/HY5MBI6cQL0ERxNpAHz
	 2KfWrWiBVltsiPHVf7ULRkk/aBLd14lGxUW4nf72v0WXZ97AzsYWe7OCuLnmoyA2ro
	 1NEmUz/ARiafg==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=203/3]=20CI:=20New=20stage=20"containers"=20to=20rebuild=20some=20containers?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732011327208
To: xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <20241119101449.49747-4-anthony.perard@vates.tech>
In-Reply-To: <20241119101449.49747-1-anthony.perard@vates.tech>
References: <20241119101449.49747-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.777426e5b10b465a963a688c0ea251a7?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241119:md
Date: Tue, 19 Nov 2024 10:15:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Rebuild rolling release containers when XEN_CI_REBUILD_CONTAINERS is
set. This is to be use with a scheduled pipeline.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    v2:
    - remove the logic to test containers once rebuilt.
    - only include the config with jobs for the "containers" stage wen
      XEN_CI_REBUILD_CONTAINERS is set.

 .gitlab-ci.yml                       | 16 ++++++++++++---
 automation/gitlab-ci/containers.yaml | 29 ++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 3 deletions(-)
 create mode 100644 automation/gitlab-ci/containers.yaml

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 941e5822e8..5a9b8b7228 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -8,11 +8,21 @@ workflow:
     - when: always
 
 stages:
+  - containers
   - analyze
   - build
   - test
 
 include:
-  - 'automation/gitlab-ci/analyze.yaml'
-  - 'automation/gitlab-ci/build.yaml'
-  - 'automation/gitlab-ci/test.yaml'
+  - local: 'automation/gitlab-ci/containers.yaml'
+    rules:
+      - if: $XEN_CI_REBUILD_CONTAINERS
+  - local: 'automation/gitlab-ci/analyze.yaml'
+    rules:
+      - if: $XEN_CI_REBUILD_CONTAINERS == null
+  - local: 'automation/gitlab-ci/build.yaml'
+    rules:
+      - if: $XEN_CI_REBUILD_CONTAINERS == null
+  - local: 'automation/gitlab-ci/test.yaml'
+    rules:
+      - if: $XEN_CI_REBUILD_CONTAINERS == null
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
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

