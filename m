Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95E257CAE3
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jul 2022 14:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372696.604615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVZQ-0001Kg-J7; Thu, 21 Jul 2022 12:46:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372696.604615; Thu, 21 Jul 2022 12:46:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEVZQ-0001H9-FV; Thu, 21 Jul 2022 12:46:24 +0000
Received: by outflank-mailman (input) for mailman id 372696;
 Thu, 21 Jul 2022 12:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K6kJ=X2=citrix.com=prvs=194f9e755=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oEVZP-0008VW-7Q
 for xen-devel@lists.xenproject.org; Thu, 21 Jul 2022 12:46:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e9c5236-08f3-11ed-924f-1f966e50362f;
 Thu, 21 Jul 2022 14:46:22 +0200 (CEST)
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
X-Inumbo-ID: 1e9c5236-08f3-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1658407582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PACc2mwSrwpX0iuSlqxknvAQt2F9ujkfuZBNPaxIerE=;
  b=huVn7XgRwTafIEv93M6de2MGVoH7uadTfVT7QeseqQpItZXKhUCqgwol
   Lx6aUzZWl88jIvyeBZoXAki0k2GJsfGyAXuDTHn6lvzot0/KKinRnkjMd
   TAaKSXPygg+20hZvP0qaGa5bv5mcQQrkRYcsUHGLObPKiMDH6DIbQChIv
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78888230
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Jas/oKjzg6noFSZte7rfmUnVX161ZhAKZh0ujC45NGQN5FlHY01je
 htvDTyAaayNYjGkfNkjbt/jpExXsMXUzd9kTlY4qy5hFykb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6j+fQLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtH8CA6W0
 T/Ii5S31GSNhnglaAr414rZ8Ek15Kuo4WtC1rADTasjUGH2xiF94K03fcldH1OgKqFIE+izQ
 fr0zb3R1gs1KD90V7tJOp6iGqE7aua60Tqm0xK6aID76vR2nQQg075TCRYpQRw/ZwNlPTxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJQWXAP6I0DuKhPRL/tS4E4ePMoE/Op8L2J08
 6IpCWE9V1Ocq6Xp6efuIgVsrpxLwMjDOYoevjdrzC3DDOZgSpfGK0nIzYYGhnFq3JkIRKuAI
 ZpCAdZsRE2ojxlnM1ELCJU4jaGwi2P2aTFwo1OJv6snpWPUyWSd1ZCyYIqFKobRHa25mG6qp
 TrKr3nrDSoiaveHxSWc1UucgsT2yHaTtIU6S+Tjq68CbEeo7ncIFBQcWF+/oP+4ok2zQdRSL
 woT4CVGhaM77kCsQ/H2Vge0p3PCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDht8ztLSxitvuSU331y1uPhWrsY25PdzZEPHJaC1teizX+nG0tphOIUtBvG4C2tNurKBCh8
 wnJswR52JxG2KbnyJ6HEUD7byOE/8aUHlRsvFSLBwpJ/SsiOtf7OtXABUzzqK8Zcd3HFgTpU
 G0swZD20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKRBaJ9slcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIceOcQrLVHcrXs2DaJ144wKuBF3+ZzTx
 L/BKZr8ZZrkIf8PIMWKqxc1juZwm3FWKZL7TpHn1RW3uYejiIquYe5caDOmM7FmhJ5oVS2Pr
 L6zwePWlEgEOAA/CwGLmbMuwacidiNjX8+p+p0OHgNBSyI/cFwc5zbq6etJU+RYc259zY8kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:Fd66paFz6OfHLd9QpLqE0MeALOsnbusQ8zAXP0AYc3Jom6uj5q
 aTdZUgpGfJYVkqOE3I9ertBEDEewK4yXcX2/h3AV7BZniEhILAFugLhuGO/9SjIVybygc079
 YYT0EUMrzN5DZB4voSmDPIceod/A==
X-IronPort-AV: E=Sophos;i="5.92,289,1650945600"; 
   d="scan'208";a="78888230"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <wl@xen.org>, <andrew.cooper3@citrix.com>, <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>, Doug Goldstein
	<cardoe@cardoe.com>
Subject: [XEN PATCH v2 3/4] automation: only run test artifact jobs when needed
Date: Thu, 21 Jul 2022 13:46:01 +0100
Message-ID: <20220721124602.9910-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220721124602.9910-1-anthony.perard@citrix.com>
References: <20220721124602.9910-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Share the same "except" as the one used for tests.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - rebased, to include "qemu-system-aarch64-6.0.0-arm32-export".

 automation/gitlab-ci/build.yaml | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 5eb7312754..23b306e7d0 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -567,10 +567,16 @@ alpine-3.12-gcc-debug-arm64:
     CONTAINER: alpine:3.12-arm64v8
 
 
+## Test artifacts common
+
+.test-jobs-artifact-common:
+  stage: build
+  except: !reference [.test-jobs-common, except]
+
 # Arm test artifacts
 
 alpine-3.12-arm64-rootfs-export:
-  stage: build
+  extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12-arm64v8
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
@@ -581,7 +587,7 @@ alpine-3.12-arm64-rootfs-export:
     - arm64
 
 kernel-5.9.9-arm64-export:
-  stage: build
+  extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.9.9-arm64v8
   script:
     - mkdir binaries && cp /Image binaries/Image
@@ -592,7 +598,7 @@ kernel-5.9.9-arm64-export:
     - arm64
 
 qemu-system-aarch64-6.0.0-arm64-export:
-  stage: build
+  extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
   script:
     - mkdir binaries && cp /qemu-system-aarch64 binaries/qemu-system-aarch64
@@ -603,7 +609,7 @@ qemu-system-aarch64-6.0.0-arm64-export:
     - arm64
 
 qemu-system-aarch64-6.0.0-arm32-export:
-  stage: build
+  extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-aarch64:6.0.0-arm64v8
   script:
     - mkdir binaries && cp /qemu-system-arm binaries/qemu-system-arm
@@ -616,7 +622,7 @@ qemu-system-aarch64-6.0.0-arm32-export:
 # x86_64 test artifacts
 
 alpine-3.12-rootfs-export:
-  stage: build
+  extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/alpine:3.12
   script:
     - mkdir binaries && cp /initrd.tar.gz binaries/initrd.tar.gz
@@ -627,7 +633,7 @@ alpine-3.12-rootfs-export:
     - x86_64
 
 kernel-5.10.74-export:
-  stage: build
+  extends: .test-jobs-artifact-common
   image: registry.gitlab.com/xen-project/xen/tests-artifacts/kernel:5.10.74
   script:
     - mkdir binaries && cp /bzImage binaries/bzImage
-- 
Anthony PERARD


