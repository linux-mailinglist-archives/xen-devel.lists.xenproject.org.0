Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD0B2EB593
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 23:59:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62218.110069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwvHz-00037I-1Y; Tue, 05 Jan 2021 22:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62218.110069; Tue, 05 Jan 2021 22:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwvHy-00036X-Sf; Tue, 05 Jan 2021 22:58:54 +0000
Received: by outflank-mailman (input) for mailman id 62218;
 Tue, 05 Jan 2021 22:58:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kwvHx-00030R-CD
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 22:58:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 314513df-bb53-472b-acfb-883f77fa6ebe;
 Tue, 05 Jan 2021 22:58:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 38345230FA;
 Tue,  5 Jan 2021 22:58:47 +0000 (UTC)
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
X-Inumbo-ID: 314513df-bb53-472b-acfb-883f77fa6ebe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609887527;
	bh=4/ZOhJJoO9bRXaJSQwwhoEyBdlkDxu6In1n3JrReNrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QjA3FucPSSMdpsEKnOtC/5N2O4Rc1RqXXPvaSfm3zApKm1ZwynP85am24J6LbLZ7a
	 ZvaLwdJ5ydutqiy2lBfBFmgND5hefxmUUUtqx6iUaLqcXDjZeIGNEaBecBGsJwQd9h
	 lDPir6fAznywebagV2gK1tfyysR+TRg65xL07FOnB/3yu/01Z5TT+mYwZI8SD0P3cp
	 fQVJ4Le+si7kpn9CwAjHPkDG2EBvxBpMOSOMt5FBig5b1BUOc+JRNLRtAL4Mg7EwfL
	 bYm9FLt6xE3sgbgS3RA+yHPuyHvOY5lxT8HEsdRtkTvlNb/NDSxg4SADzKtnymlJ8i
	 qrzvsoX0FMdkw==
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 2/3] automation: add a job to import qemu-system-aarch64 into the pipeline
Date: Tue,  5 Jan 2021 14:58:44 -0800
Message-Id: <20210105225845.30346-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2101051452480.4307@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2101051452480.4307@sstabellini-ThinkPad-T480s>

In order to use the pre-built test-artifacts/qemu-system-aarch64 binary
for our tests, first we need to import it into the pipeline. Let's do
that the same way we did it for the kernel and Alpine Linux filesystem:
by creating a special job for it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 automation/gitlab-ci/build.yaml | 11 +++++++++++
 automation/gitlab-ci/test.yaml  |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index e5246828f8..db68dd0b69 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -494,3 +494,14 @@ kernel-5.9.9-arm64-export:
   tags:
     - arm64
 
+qemu-system-aarch64-5.2.0-arm64-export:
+  stage: build
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:5.2.0-arm64v8
+  script:
+    - mkdir binaries && cp /qemu-system-aarch64 binaries/qemu-system-aarch64
+  artifacts:
+    paths:
+      - binaries/qemu-system-aarch64
+  tags:
+    - arm64
+
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 9448651187..91a10febbf 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -33,6 +33,7 @@ qemu-alpine-arm64-gcc:
     - alpine-3.12-gcc-arm64
     - alpine-3.12-arm64-rootfs-export
     - kernel-5.9.9-arm64-export
+    - qemu-system-aarch64-5.2.0-arm64-export
   artifacts:
     paths:
       - smoke.serial
@@ -56,6 +57,7 @@ qemu-smoke-arm64-gcc:
   dependencies:
     - debian-unstable-gcc-arm64
     - kernel-5.9.9-arm64-export
+    - qemu-system-aarch64-5.2.0-arm64-export
   artifacts:
     paths:
       - smoke.serial
-- 
2.17.1


