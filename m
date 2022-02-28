Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCAC4C7025
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 15:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280632.478664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhR2-0004Mx-Pd; Mon, 28 Feb 2022 14:55:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280632.478664; Mon, 28 Feb 2022 14:55:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhR2-0004F2-LR; Mon, 28 Feb 2022 14:55:36 +0000
Received: by outflank-mailman (input) for mailman id 280632;
 Mon, 28 Feb 2022 14:55:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=39Co=TL=citrix.com=prvs=0517876bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nOhR1-0003h4-3P
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 14:55:35 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ad1fcd8-98a6-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 15:55:33 +0100 (CET)
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
X-Inumbo-ID: 7ad1fcd8-98a6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646060133;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IsL8G7dlJmiTydy3og1CtH8rtaWEJrFXlKgFdR/ewSU=;
  b=Ks65IDY2hTkw5xW0UzljrXbJE76S3RLMCP9DjAIG5t/y28rt7Au4vBW+
   tO7E16fafil5GHoOtTS02y6zU58IoNm37w9g/qSR4lHAGIhaBP+WMFD+d
   UM9aZvarbPtVDKKEb3pMlh0OuFxekXb3ZTGLkV3Pdj96DA8yz6h9epy7s
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65542982
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:S3VgZaC7Qrq1FhVW/zXjw5YqxClBgxIJ4kV8jS/XYbTApDIh3mRWx
 zYXXz/UOq2MNDfxeY90bNnk9EtT6pPdndRnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Rj0tYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhA+
 epr6sO6ZjsXHY/uqLUsAzoJEwBhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4TQKqEN
 ppDAdZpRE3CPTJOMwZINLsvlf/0jWWlKSN8tmvA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt+Xu2iujCtSjyQo4VGfuz8fsCqE2ewCkfBQMbUXO/oOKlkQiuVtRHM
 UsW9yEy668o+ySDUd3VTxC+5nmesXYht8F4SrNgrlvXk+yNvljfVjNsoiN9hMIOhf4JY2N13
 HC1ofDLJww+ge22GHK86eLBxd+tAhQ9IWgHbC4CaAIK5dj/vY0+5i7yosZf/L2d1YOsR2ypq
 9yehG1n3uhI05ZXv0mu1Q2f21qRSo71ohnZD+k9dkas9UtHaYGsfOREAnCLvK8bfO51orRs1
 UXoevRyDshTV/lhdwTXGY3h+Y1FAd7fbVUwZnY1QvEcG8yFoSLLQGypyGgWyL1VGsgFYyT1R
 0TYpBlc4pReVFPzM/MqMtLuUp12k/CwfTgAahwyRoATCnSWXFXalByCmGbKhzy9+KTSuftX1
 WinnTaEUi9BVPUPIMueTOYBy747rh3SNkuILa0XOy+PiOLEDFbMEO9tGALXMogRsfPVyC2Io
 o03H5bblH1ivBjWP3C/HXg7dgtRcxDWxPne9qRqSwJ0ClE+STF5VqSImutJlk4Mt/09q9okN
 0qVAidwoGcTT1WdQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:8vQ6g66BwB1ZfegOxgPXwKvXdLJyesId70hD6qkRc3xom6mj/P
 xG88536faZslwssRIb+OxoRpPufZq0z/cc3WB7B9uftWfd1leVEA==
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65542982"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 3/4] automation: only run test artifact jobs when needed
Date: Mon, 28 Feb 2022 14:55:22 +0000
Message-ID: <20220228145523.8954-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228145523.8954-1-anthony.perard@citrix.com>
References: <20220228145523.8954-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Share the same "except" as the one used for tests.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/gitlab-ci/build.yaml | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 26dcfb1c25..cbbe0b8346 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -567,10 +567,16 @@ alpine-3.12-gcc-debug-arm64:
     CONTAINER: alpine:3.12-arm64v8
 
 
+## Test artifacts common
+
+.test-jobs-artifact-common:
+  stage: build
+  except: !reference [.test-jobs-common, except]
+
 # Arm test artifacts
 
 alpine-3.12-arm64-rootfs-export:
-  stage: build
+  extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12-arm64v8
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
@@ -581,7 +587,7 @@ alpine-3.12-arm64-rootfs-export:
     - arm64
 
 kernel-5.9.9-arm64-export:
-  stage: build
+  extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.9.9-arm64v8
   script:
     - mkdir binaries && cp /Image binaries/Image
@@ -592,7 +598,7 @@ kernel-5.9.9-arm64-export:
     - arm64
 
 qemu-system-aarch64-5.2.0-arm64-export:
-  stage: build
+  extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:5.2.0-arm64v8
   script:
     - mkdir binaries && cp /qemu-system-aarch64 binaries/qemu-system-aarch64
@@ -606,7 +612,7 @@ qemu-system-aarch64-5.2.0-arm64-export:
 # x86_64 test artifacts
 
 alpine-3.12-rootfs-export:
-  stage: build
+  extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
@@ -617,7 +623,7 @@ alpine-3.12-rootfs-export:
     - x86_64
 
 kernel-5.10.74-export:
-  stage: build
+  extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.10.74
   script:
     - mkdir binaries && cp /bzImage binaries/bzImage
-- 
Anthony PERARD


