Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9613B2C3813
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 05:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37140.69383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPL-00010q-6z; Wed, 25 Nov 2020 04:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37140.69383; Wed, 25 Nov 2020 04:27:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPL-0000zz-2v; Wed, 25 Nov 2020 04:27:55 +0000
Received: by outflank-mailman (input) for mailman id 37140;
 Wed, 25 Nov 2020 04:27:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPJ-0000sA-Hu
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcb38737-3533-4975-bab7-18c9db4864da;
 Wed, 25 Nov 2020 04:27:52 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1802521D40;
 Wed, 25 Nov 2020 04:27:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPJ-0000sA-Hu
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:53 +0000
X-Inumbo-ID: bcb38737-3533-4975-bab7-18c9db4864da
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bcb38737-3533-4975-bab7-18c9db4864da;
	Wed, 25 Nov 2020 04:27:52 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1802521D40;
	Wed, 25 Nov 2020 04:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278471;
	bh=RQh+Iw+5p9me1VgNkCXV0YqsNm47AcKNEZ7dpALNXQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V7Ue731QX343pJJLJNDaVMEVtBDt1QdCJ20D7/6AV5cPlZntGBIvl2Nu6bspfWnxV
	 HAuYghCJG/QaphnnwDDnCYJcQ3bsoIDZa01HPY6V1J+r9GNT2N+eFD9MRAkB2wiQ9C
	 Vm6QfO8awtWnDiH/gUdUrKdcOabN/0D0Q1YJZcGA=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 09/12] automation: make available the tests artifacts to the pipeline
Date: Tue, 24 Nov 2020 20:27:42 -0800
Message-Id: <20201125042745.31986-9-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

In order to make available the pre-built binaries of the
automation/tests-artifacts containers to the gitlab-ci pipeline we need
to export them as gitlab artifacts.

To do that, we create two "fake" jobs that simply export the require
binaries as artifacts and do nothing else.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/gitlab-ci/build.yaml | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index c48c0f3d66..e5246828f8 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -468,3 +468,29 @@ alpine-3.12-gcc-debug-arm64:
   extends: .gcc-arm64-build-debug
   variables:
     CONTAINER: alpine:3.12-arm64v8
+
+
+# Arm test artifacts
+
+alpine-3.12-arm64-rootfs-export:
+  stage: build
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12-arm64v8
+  script:
+    - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
+  artifacts:
+    paths:
+      - binaries/initrd.tar.gz
+  tags:
+    - arm64
+
+kernel-5.9.9-arm64-export:
+  stage: build
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.9.9-arm64v8
+  script:
+    - mkdir binaries && cp /Image binaries/Image
+  artifacts:
+    paths:
+      - binaries/Image
+  tags:
+    - arm64
+
-- 
2.17.1


