Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298E44C7022
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 15:55:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280633.478681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhR5-0004qe-4z; Mon, 28 Feb 2022 14:55:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280633.478681; Mon, 28 Feb 2022 14:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOhR4-0004n6-W9; Mon, 28 Feb 2022 14:55:38 +0000
Received: by outflank-mailman (input) for mailman id 280633;
 Mon, 28 Feb 2022 14:55:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=39Co=TL=citrix.com=prvs=0517876bc=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nOhR2-0003h4-Qn
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 14:55:36 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bea66f8-98a6-11ec-8539-5f4723681683;
 Mon, 28 Feb 2022 15:55:35 +0100 (CET)
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
X-Inumbo-ID: 7bea66f8-98a6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646060135;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JfocDo901DGQCPoxMCxuFGFQw5TmZyrp2AuzOSmqN8U=;
  b=b/5p++co3/Q98WEjZv8I0TSQCY93FRQYBUzRPX7kMGBR1geOa8GeI7Az
   4RwefdTt3xsp8VA6DaAE781yCf62hIulbQjNeeSj6zDG/8L7BhsWq+cBn
   ZgA7R8dTQL8+HB/zY+02NZqLKYoTynQZHLLShBtacmv6G9lWtTtVpNXxc
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65133097
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:razg5qkWn+B5MGhMrRRLZgro5gydJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWTyDbP/bZ2ekeo8jbITg9B5UuJaDxoUwQARupShgEiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EoLd9IR2NYy24DjWVPV4
 LsenuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYWC5zHreUx+IkdAQHNxtvBosaweSZLi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJHNGM0N0yRPHWjPH8TWY48scChhUP4WD54slK4npsF/TDcmVkZPL/Fb4OOJ43iqd9utl2Du
 mvM8mD9AxcbHN+S0zyI9jSrnOCntSjyQo4VGZWz/+Rmh1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGGAlg4RXZxXCeJS1e2W4vOKuUDDXDFCF2MfLox93CMredA0/
 k6gxfPzXWNpiZqIFlan54yy8QrpZydAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJszHlJd3j6
 2vU9XZj3t3/meZOjvzmpg6f31pAs7CUFlZd2+nBYo6yAuqVjqaBbpfg11XU5O0owG2xHgjY5
 yhsdyRzAYkz4XCxeM6lHb9l8FKBva/t3NjgbbhHRcRJG9OFoSPLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUpp2kPmwSo28Cq6MPrKih6SdkifdoUmCgmbKggjQfLUEy/lja
 f93j+72ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeKmeJxI9E+xv8N/goKl
 1nkMnJlJJPErSWvAW23hrpLNdsDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:NcER1qu4hdVc2dYkJCm/DEHW7skDFdV00zEX/kB9WHVpm62j9/
 xG+c5x6faaslsssR0b8+xoW5PgfZqjz/FICOAqVN+ftWLd1FdAQrsN0bff
X-IronPort-AV: E=Sophos;i="5.90,142,1643691600"; 
   d="scan'208";a="65133097"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH 4/4] automation: use "needs" instead of "dependencies" for test jobs
Date: Mon, 28 Feb 2022 14:55:23 +0000
Message-ID: <20220228145523.8954-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228145523.8954-1-anthony.perard@citrix.com>
References: <20220228145523.8954-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Like with "dependencies", the jobs will get artifacts from the jobs
listed in "needs". But the test jobs can run as soon as the build jobs
listed have finished.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 automation/gitlab-ci/test.yaml | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 7cf21b7493..56747fb335 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -21,7 +21,7 @@ build-each-commit-gcc:
     paths:
       - '*.log'
     when: always
-  dependencies: []
+  needs: []
   tags:
     - x86_64
 
@@ -31,7 +31,7 @@ qemu-alpine-arm64-gcc:
     CONTAINER: debian:unstable-arm64v8
   script:
     - ./automation/scripts/qemu-alpine-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
-  dependencies:
+  needs:
     - alpine-3.12-gcc-arm64
     - alpine-3.12-arm64-rootfs-export
     - kernel-5.9.9-arm64-export
@@ -50,7 +50,7 @@ qemu-alpine-x86_64-gcc:
     CONTAINER: debian:stretch
   script:
     - ./automation/scripts/qemu-alpine-x86_64.sh 2>&1 | tee qemu-smoke-x86_64.log
-  dependencies:
+  needs:
     - alpine-3.12-gcc
     - alpine-3.12-rootfs-export
     - kernel-5.10.74-export
@@ -68,7 +68,7 @@ qemu-smoke-arm64-gcc:
     CONTAINER: debian:unstable-arm64v8
   script:
     - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
-  dependencies:
+  needs:
     - debian-unstable-gcc-arm64
     - kernel-5.9.9-arm64-export
     - qemu-system-aarch64-5.2.0-arm64-export
@@ -91,7 +91,7 @@ qemu-smoke-x86-64-gcc:
       - smoke.serial
       - '*.log'
     when: always
-  dependencies:
+  needs:
     - debian-stretch-gcc-debug
   tags:
     - x86_64
@@ -107,7 +107,7 @@ qemu-smoke-x86-64-clang:
       - smoke.serial
       - '*.log'
     when: always
-  dependencies:
+  needs:
     - debian-unstable-clang-debug
   tags:
     - x86_64
@@ -123,7 +123,7 @@ qemu-smoke-x86-64-gcc-pvh:
       - smoke.serial
       - '*.log'
     when: always
-  dependencies:
+  needs:
     - debian-stretch-gcc-debug
   tags:
     - x86_64
@@ -139,7 +139,7 @@ qemu-smoke-x86-64-clang-pvh:
       - smoke.serial
       - '*.log'
     when: always
-  dependencies:
+  needs:
     - debian-unstable-clang-debug
   tags:
     - x86_64
-- 
Anthony PERARD


