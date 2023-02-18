Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0969B698
	for <lists+xen-devel@lfdr.de>; Sat, 18 Feb 2023 01:08:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.497384.768372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTAlh-0004ka-Ij; Sat, 18 Feb 2023 00:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 497384.768372; Sat, 18 Feb 2023 00:07:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pTAlh-0004hu-F8; Sat, 18 Feb 2023 00:07:57 +0000
Received: by outflank-mailman (input) for mailman id 497384;
 Sat, 18 Feb 2023 00:07:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEmr=6O=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pTAlf-00049k-Qe
 for xen-devel@lists.xenproject.org; Sat, 18 Feb 2023 00:07:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 498b7b5f-af20-11ed-93b5-47a8fe42b414;
 Sat, 18 Feb 2023 01:07:53 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5395D6209D;
 Sat, 18 Feb 2023 00:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1560DC4339C;
 Sat, 18 Feb 2023 00:07:50 +0000 (UTC)
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
X-Inumbo-ID: 498b7b5f-af20-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676678871;
	bh=ReIRkrUsD0aUe+sTs/xO/eCMbv89yibMdXJjNiWEuAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RQAS7xGmEushY27lNqqHLEenfNcDuYaKE+/0N40gzg7jRPHhPRb9MtotVPHL3bu/D
	 px9xCTX686rQk/SkR0+UWcTL6a12fxpTvOiejKVQGS1DydYxEbUdf/mubzDnlK3dKH
	 FZ39joQ6KWFt3Zns8SrXTmRO3kQ+fVvaSc4aN9Sl38culfDEVbPmEFHfS17ZNRASgt
	 CTHlF6hYob4UIEmF8u7x2OZjE1x7Cc056A034k1D5NcwxeQoGDY34p4/8eBi0AHv7K
	 lH2TvmDcHEdnII1FyPmu/AJ2a1DOKVxIyAV1c9eIsV03057wsILS30RrtxnawIkpMw
	 YASyorI4o+/GA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v3 2/3] automation: add binaries/ to artifacts for Yocto arm32 job
Date: Fri, 17 Feb 2023 16:07:46 -0800
Message-Id: <20230218000747.2965719-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2302171606480.2127160@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2302171606480.2127160@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

Copy the build output of Yocto builds to binaries/ for the arm32 target,
and export binaries/ among the jobs artifacts so that they can be reused
by other jobs.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- add --copy-output so that whether the binaries get copied or not is
user selectable
- rename OUTPUT to OUTPUTDIR and move it up in the file
---
 automation/build/yocto/build-yocto.sh | 16 ++++++++++++++++
 automation/gitlab-ci/build.yaml       |  4 +++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/automation/build/yocto/build-yocto.sh b/automation/build/yocto/build-yocto.sh
index 3601cebc3c..93ce81ce82 100755
--- a/automation/build/yocto/build-yocto.sh
+++ b/automation/build/yocto/build-yocto.sh
@@ -18,6 +18,7 @@ CACHEDIR="$HOME/yocto-cache"
 LOGDIR="$HOME/logs"
 XENDIR="$HOME/xen"
 BUILDDIR="$HOME/build"
+OUTPUTDIR=`pwd`/binaries
 
 # what yocto bsp we support
 TARGET_SUPPORTED="qemuarm qemuarm64 qemux86-64"
@@ -31,6 +32,7 @@ do_build="y"
 do_run="y"
 do_localsrc="n"
 do_dump="n"
+do_copy="n"
 build_result=0
 
 # layers to include in the project
@@ -166,6 +168,16 @@ function project_build() {
         source "${YOCTODIR}/poky/oe-init-build-env" "${destdir}"
 
         bitbake "${build_image}" || exit 1
+        if [ $do_copy = "y" ]
+        then
+            if [ $target = "qemuarm" ]
+            then
+                mkdir -p $OUTPUTDIR
+                cp $BUILDDIR/tmp/deploy/images/qemuarm/zImage $OUTPUTDIR
+                cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-qemuarm $OUTPUTDIR
+                cp $BUILDDIR/tmp/deploy/images/qemuarm/xen-image-minimal-qemuarm.tar.bz2 $OUTPUTDIR
+            fi
+        fi
     ) || return 1
 }
 
@@ -235,6 +247,7 @@ Options:
                    Default: ${CACHEDIR}
   --layer-dir=DIR  directory containing the checkout of yocto layers
                    Default: ${YOCTODIR}
+  --copy-output    Copy output binaries to binaries/
 EOF
 }
 
@@ -290,6 +303,9 @@ do
         --layer-dir=*)
             YOCTODIR="${OPTION#*=}"
             ;;
+        --copy-output)
+            do_copy="y"
+            ;;
         --*)
             echo "Invalid option ${OPTION}"
             help
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index b6ae1c663b..d731642785 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -208,13 +208,14 @@
     - /^coverity-tested\/.*/
     - /^stable-.*/
   script:
-    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD}
+    - ./automation/build/yocto/build-yocto.sh -v --log-dir=./logs --xen-dir=`pwd` ${YOCTO_BOARD} ${YOCTO_OUTPUT}
   variables:
     YOCTO_VERSION: kirkstone
     CONTAINER: yocto:${YOCTO_VERSION}-${YOCTO_BOARD}-${YOCTO_HOST}
   artifacts:
     paths:
       - 'logs/*'
+      - binaries/
     when: always
   needs: []
 
@@ -744,6 +745,7 @@ yocto-qemuarm:
   extends: .yocto-test-arm64
   variables:
     YOCTO_BOARD: qemuarm
+    YOCTO_OUTPUT: --copy-output
 
 yocto-qemux86-64:
   extends: .yocto-test-arm64
-- 
2.25.1


