Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C626A8824
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 18:54:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.505300.778032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7p-00012D-TI; Thu, 02 Mar 2023 17:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 505300.778032; Thu, 02 Mar 2023 17:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXn7p-0000zP-Ph; Thu, 02 Mar 2023 17:53:53 +0000
Received: by outflank-mailman (input) for mailman id 505300;
 Thu, 02 Mar 2023 17:53:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BPDg=62=citrix.com=prvs=418368d91=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pXn7n-00086w-Sd
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 17:53:51 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f827142-b923-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 18:53:50 +0100 (CET)
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
X-Inumbo-ID: 2f827142-b923-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677779630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XlzauBoROJbKlRvdZpAzRjeIVuO3B6bK5CRK30Y6Ti8=;
  b=g085QqguondbqCtI9gYtbNOO5SOw3taDSlzfhSJyFl6K0nczPtUk+o9t
   z4138TXfP634bt/Iydahl5uO6tyJ0hnCJ3TIVFF6YX8EIcb5oHpHo2X9o
   3QExtcxpbwlIDkSfWOxJZn0ErCuxP1gsYjJ+8bw3zbQoLdMB/nh9SZFph
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 98603789
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:8VkI0KPidBSkz+TvrR2+l8FynXyQoLVcMsEvi/4bfWQNrUol0GEAn
 DZLXjzSaP7cNmfzc9wiO4rgpE9Vv5eHyIViGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5gZmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sNORkhj1
 tgnEhBTQjHElsy15JLhTNA506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUo3aG50OwRbJz
 o7A12/7JjJKNeS58iOmwiKMxeX3l3+gCLtHQdVU8dY12QbOlwT/EiY+XlKhrf60okW3Qd5YJ
 gof/S9GhbMp6EWhQ935Xhu5iH2JpBgRX5xXCeJSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRSXKa9ECzHsO3O9HXrZHZTdDVZDcMZcecby/za56gerTbwdPY9PI/yn/P2PRGqx
 Qnf+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJ2+nHYo62xlgnPdD4PuRE/XCetK8dd9jBEjFtq
 VBew6CjAPYy4YZhfcBnaMEEB/mX6vmMK1UwanY/TsB6p1xBF5NOFL28AQ2Sxm8zb67omhezO
 ic/XD+9A7cCVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOgD+zwRV8yfhmZ
 cbznSOQ4ZEyU/kP8dZLb71Fje9DKt4Wngs/uqwXPzz4iOHDNRZ5uJ8OMUeUb/BR0U93iFy9z
 jqrDOPTk083eLSnMkHqHXs7cQhiwY4TWcqn9KS6t4erfmJbJY3WI6SKneh6ItQ7xvU9eyWh1
 ijVZ3K0AWHX3RXvQThmoFg5AF8zdf6TdU4GABE=
IronPort-HdrOrdr: A9a23:c9qUk6Dh2XE5JNnlHem755DYdb4zR+YMi2TDtnoBKiC9F/by/f
 xG885rtyMc9wxhPU3I9ersBEDiexPhHPxOj7X5VI3KNDUO3lHFEGgI1+rfKlPbdBEW/9QtsZ
 tdTw==
X-IronPort-AV: E=Sophos;i="5.98,228,1673931600"; 
   d="scan'208";a="98603789"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [RFC XEN PATCH 5/7] automation: Introduce DO_REBUILD_CONTAINER, to allow to rebuild a container
Date: Thu, 2 Mar 2023 17:53:30 +0000
Message-ID: <20230302175332.56052-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230302175332.56052-1-anthony.perard@citrix.com>
References: <20230302175332.56052-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This allow to start a pipeline manually and set a variable to test the
build of a single container, e.g.
    DO_REBUILD_CONTAINER = ubuntu/xenial

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/gitlab-ci/containers.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/gitlab-ci/containers.yaml b/automation/gitlab-ci/containers.yaml
index a6d61980b1..9074bfe6f1 100644
--- a/automation/gitlab-ci/containers.yaml
+++ b/automation/gitlab-ci/containers.yaml
@@ -7,6 +7,7 @@
     - if: $CI_PIPELINE_SOURCE == "push" && $CI_COMMIT_BRANCH == "staging"
       changes:
         - automation/build/${BUILD_CONTAINER}.dockerfile
+    - if: $DO_REBUILD_CONTAINER == $BUILD_CONTAINER
   services:
     - docker:dind
   before_script:
-- 
Anthony PERARD


