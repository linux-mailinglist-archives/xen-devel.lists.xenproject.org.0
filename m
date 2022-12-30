Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2D46593DB
	for <lists+xen-devel@lfdr.de>; Fri, 30 Dec 2022 01:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.469764.729192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QM-0003BW-5I; Fri, 30 Dec 2022 00:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 469764.729192; Fri, 30 Dec 2022 00:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pB3QL-0002z3-TE; Fri, 30 Dec 2022 00:39:01 +0000
Received: by outflank-mailman (input) for mailman id 469764;
 Fri, 30 Dec 2022 00:39:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3dJX=44=citrix.com=prvs=35664f79d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pB3QK-0002sj-7N
 for xen-devel@lists.xenproject.org; Fri, 30 Dec 2022 00:39:00 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56aa338d-87da-11ed-8fd4-01056ac49cbb;
 Fri, 30 Dec 2022 01:38:56 +0100 (CET)
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
X-Inumbo-ID: 56aa338d-87da-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672360736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/JrA1G1Iz+UOsLcqQHfI+gI6VWbapffSwB8uk3ns4wY=;
  b=IfaRiEz9dF/5dtTtpHtLlQR/mrDf4oT3dXXpFMDhdd1JpEdr8zritt5Z
   KWQpts5e2jCnZgjiA4cYrd5yktRvaadhV2cf/OAGejG/K884qVJ/LFwEZ
   b2GccBCeILUnqaIpghiNFHXuLj4e7uBQhfOksKu7qZWoddXonRxTbEdPU
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 89488867
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:btm2CK+fsJfu4HD5LxeiDrUDTX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 TZJWGvVPfrZNmr1KtpzPdvi9EgHuJaAmtFjTldv/Cs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnP6oa5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklu2
 PI7IR1WaCucvPzqxZiZFuJLmcMseZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZUEwhbI9
 jyZl4j/KggWaeSj7wvYyW6ThOLsniamVt0yPbLto5aGh3XMnzdOWXX6T2CTpPiyike6HdVFO
 UEQ0iMroe4580nDZt75Uh6joX/CvQMGXNFQEOoS5wSEy66S6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTi7IyQSIEcJbDUISgZD6N7myKkolQ7GRNtnFK+zj/X2FCv2z
 jTMqzIx74j/luZSif/9pwqexWvx+N6ZFWbZ+zk7QEqFww1abaP+Ybe30kaH6NxicI2+UV6O6
 S1sd9el0MgCCpSElSqoSeoLHa206/vtDAAwkWKDDLF6qW3zpifLkZR4pWgneRw3appslSrBO
 he7hO9H2HNE0JJGh4dTapn5NcklxLOI+T/NBqGNNYomjnScmWa6EMBSiay4hTuFfKsEy/tX1
 XKnnSGEUx4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgTUNbtpvP3V+lSOm
 zq6Cydt40wFONASnwGNqdJDRbz0BSNT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7FYc1Buvr6Qp
 BmVAxYIoGcTcFWbcW1mnFg/MuKwNXu+xFpnVRER0aGAgSl+PNj+tPdEH3b1FJF+nNFeITdPZ
 6FtU6297j5nE1wrJxx1gUHBkbFf
IronPort-HdrOrdr: A9a23:B7UAIqs8whK6NebbrNsU00Y+7skDZ9V00zEX/kB9WHVpm62j+v
 xG+c5xvyMc5wxhO03I5urwWpVoLUmzyXcX2+Us1NWZPDUO0VHARL2KhrGM/9SPIUzDH+dmpM
 JdT5Q=
X-IronPort-AV: E=Sophos;i="5.96,285,1665460800"; 
   d="scan'208";a="89488867"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 4/6] CI: Express HYPERVISOR_ONLY in build.yml
Date: Fri, 30 Dec 2022 00:38:46 +0000
Message-ID: <20221230003848.3241-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221230003848.3241-1-andrew.cooper3@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Whether to build only Xen, or everything, is a property of container,
toolchain and/or testcase.  It is not a property of XEN_TARGET_ARCH.

Capitalise HYPERVISOR_ONLY and have it set by the debian-unstable-gcc-arm32-*
testcases at the point that arm32 get matched with a container that can only
build Xen.

For simplicity, retain the RANDCONFIG -> HYPERVISOR_ONLY implication.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 automation/gitlab-ci/build.yaml |  2 ++
 automation/scripts/build        | 11 ++++-------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 93d9ff69a9f2..e6a9357de3ef 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -516,11 +516,13 @@ debian-unstable-gcc-arm32:
   extends: .gcc-arm32-cross-build
   variables:
     CONTAINER: debian:unstable-arm32-gcc
+    HYPERVISOR_ONLY: y
 
 debian-unstable-gcc-arm32-debug:
   extends: .gcc-arm32-cross-build-debug
   variables:
     CONTAINER: debian:unstable-arm32-gcc
+    HYPERVISOR_ONLY: y
 
 debian-unstable-gcc-arm32-randconfig:
   extends: .gcc-arm32-cross-build
diff --git a/automation/scripts/build b/automation/scripts/build
index f2301d08789d..4c6d1f3b70bc 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -19,7 +19,9 @@ if [[ "${RANDCONFIG}" == "y" ]]; then
     fi
 
     make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
-    hypervisor_only="y"
+
+    # RANDCONFIG implies HYPERVISOR_ONLY
+    HYPERVISOR_ONLY="y"
 else
     echo "CONFIG_DEBUG=${debug}" > xen/.config
 
@@ -34,15 +36,10 @@ fi
 # to exit early -- bash is invoked with -e.
 cp xen/.config xen-config
 
-# arm32 only cross-compiles the hypervisor
-if [[ "${XEN_TARGET_ARCH}" = "arm32" ]]; then
-    hypervisor_only="y"
-fi
-
 # Directory for the artefacts to be dumped into
 mkdir binaries
 
-if [[ "${hypervisor_only}" == "y" ]]; then
+if [[ "${HYPERVISOR_ONLY}" == "y" ]]; then
     # Xen-only build
     make -j$(nproc) xen
 
-- 
2.11.0


