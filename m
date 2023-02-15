Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB086987A9
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 23:09:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496247.766896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSPy2-0005rO-Fq; Wed, 15 Feb 2023 22:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496247.766896; Wed, 15 Feb 2023 22:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSPy2-0005l0-AO; Wed, 15 Feb 2023 22:09:34 +0000
Received: by outflank-mailman (input) for mailman id 496247;
 Wed, 15 Feb 2023 22:09:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HlLs=6L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pSPy0-0005R2-V6
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 22:09:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b6b6bc9-ad7d-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 23:09:31 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A557261DBC;
 Wed, 15 Feb 2023 22:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60506C433EF;
 Wed, 15 Feb 2023 22:09:28 +0000 (UTC)
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
X-Inumbo-ID: 6b6b6bc9-ad7d-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676498969;
	bh=ui6UKmuaYYAlo1er5w/0SLINIVnsRORvvWH0lIJWCiw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X1s+AnGX233Zw4wwgqjkAbFic0eVhSFVv15ymDRIYLomBmWGCfIxkMAFRHE3zAH4z
	 zkUgmRuNMoqjpO1wT0srojgHNhrBk47L/Itba66LArPtVkmsjDpCW1C1t8I+/iLs3U
	 8+wQ/PJDTG0jYJEbJHW0pSuQ2EDjBC8FYXtIL/F31mNRlyE8a+Z4wWjU2a14mOKw00
	 GinF7BkRL9cmE77WpMoWlJEvE2+ht0ya7eFkq1ZIkPnpSBXWyz3UxF7br8nme1Xt0r
	 pQlq11lWDN/60rDkOr2vpXHrNe2RT4hvbZpDbnIwI6xhg/1DCzoOAVWNYQwVGpUXrG
	 8iH7RAjMcjlGQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2 2/3] automation: add binaries/ to artifacts for Yocto arm32 job
Date: Wed, 15 Feb 2023 14:09:24 -0800
Message-Id: <20230215220925.2313528-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302151407130.2127160@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302151407130.2127160@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Copy the build output of Yocto builds to binaries/ for the arm32 target,
and export binaries/ among the jobs artifacts so that they can be reused
by other jobs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- only copy binaries for the arm32 target
---
 automation/build/yocto/build-yocto.sh | 9 +++++++++
 automation/gitlab-ci/build.yaml       | 1 +
 2 files changed, 10 insertions(+)

diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
index 3601cebc3c..dd7065e5b2 100755
--- a/automation/build/yocto/build-yocto.sh
+++ b/automation/build/yocto/build-yocto.sh
@@ -166,6 +166,13 @@ function project_build() {
         source "${YOCTODIR}/poky/oe-init-build-env" "${destdir}"
 
         bitbake "${build_image}" || exit 1
+        if [ $target = "qemuarm" ]
+        then
+            mkdir -p $OUTPUT
+            cp $BUILDDIR/tmp/deploy/images/qemuarm/zImage $OUTPUT
+            cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-qemuarm $OUTPUT
+            cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-image-minimal-qemuarm.tar.bz2 $OUTPUT
+        fi
     ) || return 1
 }
 
@@ -238,6 +245,8 @@ Options:
 EOF
 }
 
+OUTPUT=`pwd`/binaries
+
 for OPTION in "$@"
 do
     case ${OPTION} in
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index f62cf21f45..d4a2aa9a5b 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -215,6 +215,7 @@
   artifacts:
     paths:
       - 'logs/*'
+      - binaries/
     when: always
   needs: []
 
-- 
2.25.1


