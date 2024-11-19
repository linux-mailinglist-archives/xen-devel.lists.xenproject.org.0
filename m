Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 449649D2331
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 11:16:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839868.1255660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLGh-0002VQ-GG; Tue, 19 Nov 2024 10:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839868.1255660; Tue, 19 Nov 2024 10:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDLGh-0002U9-Cg; Tue, 19 Nov 2024 10:15:35 +0000
Received: by outflank-mailman (input) for mailman id 839868;
 Tue, 19 Nov 2024 10:15:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0dmh=SO=bounce.vates.tech=bounce-md_30504962.673c653f.v1-40ce3e99be984ec999e1dd0e97b54b82@srs-se1.protection.inumbo.net>)
 id 1tDLGf-0002Fw-KB
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 10:15:33 +0000
Received: from mail180-8.suw31.mandrillapp.com
 (mail180-8.suw31.mandrillapp.com [198.2.180.8])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 333c608c-a65f-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 11:15:29 +0100 (CET)
Received: from pmta11.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail180-8.suw31.mandrillapp.com (Mailchimp) with ESMTP id 4Xt0k76LnDz3sNN6m
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 10:15:27 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 40ce3e99be984ec999e1dd0e97b54b82; Tue, 19 Nov 2024 10:15:27 +0000
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
X-Inumbo-ID: 333c608c-a65f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjE4MC44IiwiaGVsbyI6Im1haWwxODAtOC5zdXczMS5tYW5kcmlsbGFwcC5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjMzM2M2MDhjLWE2NWYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDExMzI5LjQyNjg5MSwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3M2M2NTNmLnYxLTQwY2UzZTk5YmU5ODRlYzk5OWUxZGQwZTk3YjU0YjgyQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1732011327; x=1732271827;
	bh=HR2hDnjhAgEJ8WW/gV410/qk4KVU8YB7FIJYf9zTtIk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=brGrOgC/vqHmJpXRfLqoxwPJrOKupIJBPT+9ZdyJn3zahw8cEcPb7itKRfueKXIMP
	 UcXEMwm4E/y9FJ8Z6P5JRCWGMCbD/tK31v6Eq6aiojlnDxUMtLA9PA7OadcQutWC3k
	 7XuUPzMrNyjfYjnWiXhbLIEOsLqPexsi/oTL3pi5TU4dlYhef7EHKgAmgWDrM5BMXk
	 h6oQff9D0gRfetHY+Ndwt09kmwcs/jZ9ZudPqEAO65r5f0AvY7ADPvwh31gV/qNLJi
	 1sEVjUFRg+0lkKy1Mqrh5mZMVX4EQ3wVf3OYFPQ891gIjfV6EAEovhapeQaK1Yzk30
	 qg4qmFf046Lew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1732011327; x=1732271827; i=anthony.perard@vates.tech;
	bh=HR2hDnjhAgEJ8WW/gV410/qk4KVU8YB7FIJYf9zTtIk=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=t15bFwARbjiUg99xAfxhFT8Zp6jDT0iLJ4wHNxMSGv3N/2ANO1G7qcQntg3yKU1zR
	 0IOIzNbWfEwFv7xSoj8AuJ4xhHAAQJwvYH7T9Zc7nPFDBPHqGcwcf5q+Z3JXQOpKYQ
	 ktl+NXSByRWhNj4Ddhust+cId/01K4kdsBWnD/t7pfDxhOKIfpi4G70lUv9VegUj1h
	 jzEK77x8UzRG4xwSGZgT1ZNBCmgjLCwuEpU5lRRBxpDVW3WwRxyBLfNV3/ioDohi2t
	 sK6uJQMRc/E/bNQ06SGdg5iaGqFnyiZ9uH1z8Oj+tdoq5Vy6jeKTHZGodx57UbX2WW
	 lTZ324UNho5SQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v2=202/3]=20CI:=20Define=20XEN=5FREGISTRY=20variable?=
X-Mailer: git-send-email 2.39.5
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1732011326911
To: xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Stefano Stabellini" <sstabellini@kernel.org>, "Doug Goldstein" <cardoe@cardoe.com>
Message-Id: <20241119101449.49747-3-anthony.perard@vates.tech>
In-Reply-To: <20241119101449.49747-1-anthony.perard@vates.tech>
References: <20241119101449.49747-1-anthony.perard@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.40ce3e99be984ec999e1dd0e97b54b82?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241119:md
Date: Tue, 19 Nov 2024 10:15:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This allow to change the registry used for container in a single
place, and could be controlled via other mean.

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 .gitlab-ci.yml                  | 3 +++
 automation/gitlab-ci/build.yaml | 4 ++--
 automation/gitlab-ci/test.yaml  | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ef4484e09a..941e5822e8 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,3 +1,6 @@
+variables:
+  XEN_REGISTRY: registry.gitlab.com/xen-project/xen
+
 workflow:
   rules:
     - if: $CI_COMMIT_BRANCH =~ /^(master|smoke|^coverity-tested\/.*|stable-.*)$/
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index ce39b0ee21..1ca6764225 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -1,6 +1,6 @@
 .build-tmpl: &build
   stage: build
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  image: ${XEN_REGISTRY}/${CONTAINER}
   script:
     - ./automation/scripts/build 2>&1 | tee build.log
   artifacts:
@@ -208,7 +208,7 @@
 
 .yocto-test:
   stage: build
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  image: ${XEN_REGISTRY}/${CONTAINER}
   script:
     - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
   variables:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ab5c8be0cd..1822e3ea5f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -1,6 +1,6 @@
 .test-jobs-common:
   stage: test
-  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  image: ${XEN_REGISTRY}/${CONTAINER}
 
 .arm64-test-needs: &arm64-test-needs
   - alpine-3.18-arm64-rootfs-export
-- 


Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

