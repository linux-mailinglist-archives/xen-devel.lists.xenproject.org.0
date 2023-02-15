Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFBE6972F8
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 01:59:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495668.766072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS67q-0003cG-27; Wed, 15 Feb 2023 00:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495668.766072; Wed, 15 Feb 2023 00:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pS67p-0003Zd-UX; Wed, 15 Feb 2023 00:58:21 +0000
Received: by outflank-mailman (input) for mailman id 495668;
 Wed, 15 Feb 2023 00:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HlLs=6L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pS67o-0003JV-JE
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 00:58:20 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d54c7813-accb-11ed-933c-83870f6b2ba8;
 Wed, 15 Feb 2023 01:58:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4177161985;
 Wed, 15 Feb 2023 00:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08509C4339C;
 Wed, 15 Feb 2023 00:58:15 +0000 (UTC)
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
X-Inumbo-ID: d54c7813-accb-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676422696;
	bh=B355pQ+xrgYs8p+di9bwo3QyG2cTAAdJVFDOYi9P610=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fEYTbW2msi7HLS15+v5NA8xSBQitLINtwfHrMbs82msPrP0fcU91QF8YzrOdwY2JT
	 bDe1PH5f8nfHpzb1N4oYQX8E/f319qUoFPmOhaSY7XloQ3Gd7BdTjQ5+VhohCJCrAa
	 jw0UzCfTMs2Kg0GV3jXATEPoMsCnyn/wEiEf3LtxZnr+6r/h2GfB8xY5QNUeVF/mjW
	 4t/HJ+IUIvoeTHSwzGA0asvi90/7sj7WjqipZNOT/M0Ic+lPm1i5YaangdvcozpI9v
	 dLeUz5PmWxu+EPHkfNX+opsgl3kgr7FtxXsoDyvgPqrCpmZZbEx2LydYMY7rLAoeX7
	 WjgcWNiRpcj1A==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH 2/3] automation: add binaries/ to artifacts for Yocto jobs
Date: Tue, 14 Feb 2023 16:58:10 -0800
Message-Id: <20230215005811.2126759-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302141642520.2025117@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302141642520.2025117@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Copy the build output of Yocto builds to binaries/ and export binaries/
among the jobs artifacts so that they can be reused by other jobs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/build/yocto/build-yocto.sh | 6 ++++++
 automation/gitlab-ci/build.yaml       | 1 +
 2 files changed, 7 insertions(+)

diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
index 3601cebc3c..d0fcaacf06 100755
--- a/automation/build/yocto/build-yocto.sh
+++ b/automation/build/yocto/build-yocto.sh
@@ -166,6 +166,10 @@ function project_build() {
         source "${YOCTODIR}/poky/oe-init-build-env" "${destdir}"
 
         bitbake "${build_image}" || exit 1
+        mkdir -p $OUTPUT
+        cp $BUILDDIR/tmp/deploy/images/qemuarm/zImage $OUTPUT
+        cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-qemuarm $OUTPUT
+        cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-image-minimal-qemuarm.tar.bz2 $OUTPUT
     ) || return 1
 }
 
@@ -238,6 +242,8 @@ Options:
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


