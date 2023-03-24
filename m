Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6646C8681
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 21:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514403.796580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfngm-0000fe-29; Fri, 24 Mar 2023 20:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514403.796580; Fri, 24 Mar 2023 20:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfngl-0000dn-VJ; Fri, 24 Mar 2023 20:07:03 +0000
Received: by outflank-mailman (input) for mailman id 514403;
 Fri, 24 Mar 2023 20:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfngk-0000dh-RP
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 20:07:02 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ec6d8ba-ca7f-11ed-85db-49a42c6b2330;
 Fri, 24 Mar 2023 21:07:00 +0100 (CET)
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
X-Inumbo-ID: 6ec6d8ba-ca7f-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679688420;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uUNdOr0iq5uq2KSc6DtNwrAIhxFGe0jPBBuBvAvxQ2k=;
  b=TzRXSsEQ2fwW5omBJkE/oddLVN1CHG0CVjymopUTE/vjFf66Xg+BQO44
   uRlGL3jeCUdenSJ1QEusoABwaS2NM7yhR2Cn8OmX9eCKEueWyeIwbWMAz
   OgbGWcYqvEFSug6MhJUeWJXpBK9xPIBrhrMhYCRmMmlbOhoIs70dEg4ap
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102273567
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:oXklR6klGuaVnK50UZIoxF7o5gyeJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKCmGDPazZY2WkL9olPYji/UxV7JGHyIQySQZrqH03QSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aSaVA8w5ARkPqgQ5gOGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 c1EBWAzcg3Eu+G7yraEVu1JhdkSNvC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQth/A/
 DiZpDmnXXn2MvSixCqH/FOegNTdkATcX7gZN+24y+VT1Qj7Kms7V0RNCArTTeOColWlR9tVJ
 kgQ+ywvhas/7kqmSp/6RRLQiHuFtR4VX5xXCf837CmEz6aS6AGcbkAPRyRNb9EOv8YsSTsnk
 FSOmrvBFTFp9bGYV3+Z3rOVti+pfzgYK3cYYi0JRhdD5MPsyLzflTqWEIwlSvTsyISoR3epm
 WviQDUCa6s7vJImh5un4Bf7gD+moqfVSis2+zTNZzfwhu9mX7JJd7BE+HCCs6kRctjEFALZ1
 JQXs5PAtb5TVPlhgATIGbxQR+/xup5pJRWG2TZS848dGyNBEpJJVaRZ+3lAKUhgKa7okhe5M
 RaI6Wu9CHK+VUZGjJObgKrrUazGNYC6SbzYugn8N7KimKRZeg6d5z1JbkWNxW3rm0VEufhhZ
 sbFIZ30VCdBUPkPIN+KqwA1j9cWKt0WnzuPFfgXMTz+uVZhWJJlYehcawbfBgzIxKiFvB/U4
 75iCid+8D0GCLeWSnCOoeYuwaUicSBT6Wbe95YGKYZu42NORAkcNhMm6ex/INM/z/wMzI8lP
 BiVAydl9bY2vlWfQS3iV5ypQOqHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:zMOWcazvdlHt657PXv1lKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208";a="102273567"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH] CI: Remove llvm-8 from the Debian Stretch container
Date: Fri, 24 Mar 2023 20:06:54 +0000
Message-ID: <20230324200654.3245297-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

For similar reasons to c/s a6b1e2b80fe20.  While this container is still
build-able, all the other problems with explicitly-versioned compilers remain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>

This will require backporting to older trees, but there's already a list it
can be added too.
---
 automation/build/debian/stretch-llvm-8.list |  3 ---
 automation/build/debian/stretch.dockerfile  | 12 ---------
 automation/gitlab-ci/build.yaml             | 27 ---------------------
 3 files changed, 42 deletions(-)
 delete mode 100644 automation/build/debian/stretch-llvm-8.list

diff --git a/automation/build/debian/stretch-llvm-8.list b/automation/build/debian/stretch-llvm-8.list
deleted file mode 100644
index 590001ca81e8..000000000000
--- a/automation/build/debian/stretch-llvm-8.list
+++ /dev/null
@@ -1,3 +0,0 @@
-# Strech LLVM 8 repos
-deb https://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
-deb-src https://apt.llvm.org/stretch/ llvm-toolchain-stretch-8 main
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index 2c086b197cba..1af6c691f8f4 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -54,15 +54,3 @@ RUN apt-get update && \
         apt-get autoremove -y && \
         apt-get clean && \
         rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-
-RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
-COPY stretch-llvm-8.list /etc/apt/sources.list.d/
-
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        clang-8 \
-        lld-8 \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 820cc0af83bd..3547aa419097 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -28,13 +28,6 @@
     CXX: clang++
     clang: y
 
-.clang-8-tmpl:
-  variables: &clang-8
-    CC: clang-8
-    CXX: clang++-8
-    LD: ld.lld-8
-    clang: y
-
 .x86-64-build-tmpl:
   <<: *build
   variables:
@@ -99,16 +92,6 @@
   variables:
     <<: *clang
 
-.clang-8-x86-64-build:
-  extends: .x86-64-build
-  variables:
-    <<: *clang-8
-
-.clang-8-x86-64-build-debug:
-  extends: .x86-64-build-debug
-  variables:
-    <<: *clang-8
-
 .clang-x86-32-build:
   extends: .x86-32-build
   variables:
@@ -285,16 +268,6 @@ debian-stretch-clang-debug:
   variables:
     CONTAINER: debian:stretch
 
-debian-stretch-clang-8:
-  extends: .clang-8-x86-64-build
-  variables:
-    CONTAINER: debian:stretch
-
-debian-stretch-clang-8-debug:
-  extends: .clang-8-x86-64-build-debug
-  variables:
-    CONTAINER: debian:stretch
-
 debian-stretch-gcc:
   extends: .gcc-x86-64-build
   variables:
-- 
2.30.2


