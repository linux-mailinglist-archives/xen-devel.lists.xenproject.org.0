Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138E457CADF
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 14:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372695.604604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVZN-0000zc-8b; Thu, 21 Jul 2022 12:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372695.604604; Thu, 21 Jul 2022 12:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVZN-0000wc-4v; Thu, 21 Jul 2022 12:46:21 +0000
Received: by outflank-mailman (input) for mailman id 372695;
 Thu, 21 Jul 2022 12:46:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6kJ=X2=citrix.com=prvs=194f9e755=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oEVZL-0008VW-0h
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 12:46:19 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c77fd5f-08f3-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 14:46:18 +0200 (CEST)
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
X-Inumbo-ID: 1c77fd5f-08f3-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658407577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4IwZ7MQ+unUkmwqNzuLpSWlb6ulXC3M5GmYE0wL7TYY=;
  b=biaWCaxyTr6eIUvQBoT2lAVxOp0MmMNUs68AbsD01G5kMt/DhOJN0o/O
   mHiv/Gm2ltMauWdGVd4knI5LGnqFwvSLt4porYSxcGFxcYnYkSCP8or4G
   yM1M5yT5shYVryHcepU6tdINpAkPWI1nsMkNAdToD8UpojUDvQJhTvkx3
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76321715
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:recdo6oT8GD6U1pZsj3Dueasxp5eBmIeZRIvgKrLsJaIsI4StFCzt
 garIBmCO/3YNzCgfdp/a42/pEMFvpLTm9BlTQNs+C5mQiJG+ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNOg06/gEk35q6q52lB5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqUdq9h2G15V5
 cYADzMcdSK6nfDx8LOSH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIWLIYbTGpwI9qqej
 m3K01nFORNACPug8SK5q3StmuXemAquDer+E5Xnr6U30TV/3Fc7EwYKXFG2pf24jE+WWN9FL
 UEQvC00osAa/0WxQt7wdxaxunKDs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznS4ddEbSKlc3PARbz0
 iu4lTIswIUSpJtev0mkxmwrkw5At7CQEFNlvFyNDz78hu9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 RDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0e5eIFcFm
 GeJ5WtsCGZ7ZRNGl5NfbYOrENgNxqP9D9njXf28RoMQP8gqKFXeono/Pxb4M4XRfK8EyPpXB
 HtmWZz0USZy5VpPl1JauNvxIZd0n3tjlAs/tLjwzgi90Kr2WUN5vYwtaQLWBshkvfzsnekg2
 4wAXyd840kADbaWj+i+2dJ7EG3m2lBgXsis9JMGJ7frz8gPMDhJNsI9CIgJI+RN95m5XM+Rl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:PlS6eqmaNFOadbrrrl679gs9hu/pDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.92,289,1650945600"; 
   d="scan'208";a="76321715"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <andrew.cooper3@citrix.com>, <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH v2 4/4] automation: use "needs" instead of "dependencies" for test jobs
Date: Thu, 21 Jul 2022 13:46:02 +0100
Message-ID: <20220721124602.9910-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220721124602.9910-1-anthony.perard@citrix.com>
References: <20220721124602.9910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Like with "dependencies", the jobs will get artifacts from the jobs
listed in "needs". But the test jobs can run as soon as the build jobs
listed have finished.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - rebased, to include "qemu-smoke-arm32-gcc".

 automation/gitlab-ci/test.yaml | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 53b43801f4..26bdbcc3ea 100644
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
     - qemu-system-aarch64-6.0.0-arm64-export
@@ -86,7 +86,7 @@ qemu-smoke-arm32-gcc:
     CONTAINER: debian:unstable-arm64v8
   script:
     - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
-  dependencies:
+  needs:
     - debian-unstable-gcc-arm32
     - qemu-system-aarch64-6.0.0-arm32-export
   artifacts:
@@ -108,7 +108,7 @@ qemu-smoke-x86-64-gcc:
       - smoke.serial
       - '*.log'
     when: always
-  dependencies:
+  needs:
     - debian-stretch-gcc-debug
   tags:
     - x86_64
@@ -124,7 +124,7 @@ qemu-smoke-x86-64-clang:
       - smoke.serial
       - '*.log'
     when: always
-  dependencies:
+  needs:
     - debian-unstable-clang-debug
   tags:
     - x86_64
@@ -140,7 +140,7 @@ qemu-smoke-x86-64-gcc-pvh:
       - smoke.serial
       - '*.log'
     when: always
-  dependencies:
+  needs:
     - debian-stretch-gcc-debug
   tags:
     - x86_64
@@ -156,7 +156,7 @@ qemu-smoke-x86-64-clang-pvh:
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


