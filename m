Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 341634C8B4D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 13:12:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281299.479595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1M3-0000WZ-Fc; Tue, 01 Mar 2022 12:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281299.479595; Tue, 01 Mar 2022 12:11:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1M3-0000Qy-80; Tue, 01 Mar 2022 12:11:47 +0000
Received: by outflank-mailman (input) for mailman id 281299;
 Tue, 01 Mar 2022 12:11:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWoc=TM=citrix.com=prvs=05201426e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nP1M2-0008Ic-1O
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 12:11:46 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c2e86dc5-9958-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 13:11:45 +0100 (CET)
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
X-Inumbo-ID: c2e86dc5-9958-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646136705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fvTSRerL3DdcqoyCmQ0+MA1pOOEfGWViyWiS5fU/zLA=;
  b=DDPj4bNJOrtGiDYZ/b7sCSjeBTxOpm2IJGRZgcgmF4mBytOxIM7Cob3a
   8mb3punCkri7i9dFvYetSJyWmQgjL0OKFYaf6tN1/fEaGlEImuaPfTkR/
   0mPnnwe3JUBkVd0cWsdD8uPzIBfFS144PujVHM43kss3ZkGMZ9CyKdlP1
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65205238
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hiHVhq1UC5XQPIzHrfbD5c9xkn2cJEfYwER7XKvMYLTBsI5bp2YEx
 2AfUGjUbvyIZWrxLd1xOd+//EkHuJCGnddiGVZspC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw2IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0UrLC+eTsOJ5btwuY6fRZWGTFAJZNZreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiDP
 ZJEM2E/BPjGSydpYQgQNaI8oLqhiHbycx0BpkKzvaVitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEjebVkST2cIkbDrG/+7hhh1j77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVQBmQsHOC+BkGVLJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeHCUG2
 G+1uMrSJGZtl5OaR3iNyK+qsmbnUcQKFlMqaSgBRAoDxtDspoAvkx7CJupe/L6JYs7dQm+pn
 W3TxMQqr/BK1JNQif3nlbzSq2/0/vD0ohgJChI7t45Pxidwf8abaoOh8jA3Bt4Qfd/CHjFtU
 JXp8vVyDdzi77nQzERho81XRdlFAspp1hWG2TaD+LF7qlyQF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPd7vU5txk/S5TI20PhwxUjaoSsIqHONg1HszDXN8Iki3yBR8+U3BE
 c3znTmQ4YYyVv08kWveqxY12r433CEurV4/trigpylLJYG2PSbPIZ9caQPmRrlgsMus/VWEm
 /4CZpDi40gOD4XDjtz/rNd7waYidiNgW/gbaqV/K4a+H+aRMDp5Wq+JnOh4INQNcmY8vr6gw
 0xRk3RwkDLX7UAr4y3QApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:HKz9f6k4paRf1XdCTpxvL7Q1lEbpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.90,146,1643691600"; 
   d="scan'208";a="65205238"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 3/3] automation: check for generated files
Date: Tue, 1 Mar 2022 12:11:33 +0000
Message-ID: <20220301121133.19271-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301121133.19271-1-anthony.perard@citrix.com>
References: <20220301121133.19271-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Try to find out whether genereted files that are commited needs to be
regenerated.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/gitlab-ci/test.yaml           | 10 +++++
 automation/scripts/check-generated-files | 55 ++++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100755 automation/scripts/check-generated-files

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 56747fb335..a4b08c26ca 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -25,6 +25,16 @@ build-each-commit-gcc:
   tags:
     - x86_64
 
+build-check-generated-files-tools:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: debian:stable
+  script:
+    - automation/scripts/check-generated-files
+  needs: []
+  tags:
+    - x86_64
+
 qemu-alpine-arm64-gcc:
   extends: .test-jobs-common
   variables:
diff --git a/automation/scripts/check-generated-files b/automation/scripts/check-generated-files
new file mode 100755
index 0000000000..054ea3e025
--- /dev/null
+++ b/automation/scripts/check-generated-files
@@ -0,0 +1,55 @@
+#!/bin/bash
+
+# Check that generated files that are commited are actually up to date
+
+check_git_status() {
+    output="$(git status --porcelain --untracked-files=no)"
+    if [ -n "$output" ]; then
+        echo
+        echo "Files potentially needs to be regenerated:"
+        echo "$output"
+        return 1
+    fi
+}
+
+set -e
+set -x
+
+# Try to have recently changed files more recent than generated files if those haven't been regenerated.
+if [[ "$CI_COMMIT_BEFORE_SHA" && "$CI_COMMIT_BEFORE_SHA" != 0000000000000000000000000000000000000000 ]]; then
+    git switch --detach $CI_COMMIT_BEFORE_SHA
+    git switch --detach -
+fi
+
+# Lists of files that generate other commited files:
+touch tools/libs/light/*.idl
+
+
+# Regen autoconf files
+./autogen.sh
+
+# build up our configure options
+cfgargs=()
+
+# Disable non-tools subsystems
+cfgargs+=("--disable-xen")
+cfgargs+=("--disable-stubdom")
+cfgargs+=("--disable-docs")
+
+
+# Disable external trees
+cfgargs+=("--with-system-seabios=/bin/false")
+cfgargs+=("--with-system-qemu=/bin/false")
+cfgargs+=("--with-system-ipxe=/usr/lib/ipxe/ipxe.pxe")
+cfgargs+=("--disable-ovmf")
+cfgargs+=("--disable-pvshim")
+cfgargs+=("--disable-qemu-traditional")
+
+
+./configure --quiet "${cfgargs[@]}"
+make -s -j$(nproc) build-tools
+
+if ! check_git_status; then
+    git diff
+    exit 1
+fi
-- 
Anthony PERARD


