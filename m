Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1B27D0056
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 19:15:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619540.964783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtWc7-0004P3-3u; Thu, 19 Oct 2023 17:15:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619540.964783; Thu, 19 Oct 2023 17:15:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtWc7-0004NO-0r; Thu, 19 Oct 2023 17:15:15 +0000
Received: by outflank-mailman (input) for mailman id 619540;
 Thu, 19 Oct 2023 17:15:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bypV=GB=citrix.com=prvs=649365d7d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qtWc4-0004NI-V9
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 17:15:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cbb3e46-6ea3-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 19:15:10 +0200 (CEST)
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
X-Inumbo-ID: 0cbb3e46-6ea3-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1697735710;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rmbtg4VTUyTGdO3MRQHKlPX6zE1mEMJt6imj33FjLKo=;
  b=TsBXjnpFbQqU5FPyR2DQTRaUsR+wti/uKSvLaoyZ/XV295n90pFrqYy5
   MsZiNWMVB/zMG2hwkvpSTFqowYEqqp8TY7AcARj36R3LIBnOW2D8k+cQT
   biVDGgPjVT91nDdlKFtiDPZXxi+WFkdF5ncIZFoJmLAB0TLTi9UmAnORc
   I=;
X-CSE-ConnectionGUID: rDc7S6lhTguwiUA6YPjaCg==
X-CSE-MsgGUID: s7hnxXQGQwqood7BdlFAcQ==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 124689196
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:4ZO4yqoFjB9TrwvUL/LldQY4aZFeBmIrZRIvgKrLsJaIsI4StFCzt
 garIBnVbv7eYTamfNhxad/ipkwB6J+AytZiTQBkpX1mQSMa95uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GhwUmAWP6gR5waGzihNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXACohZU+42ea2/L2mVehRr5oSFMviF4xK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSaxFIUPrSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 ziaoTSoW0BEXDCZ4SHa8nS8ttbgpDziX4UeS5e08tBDi2TGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Uh8x2EwKfQ5wefB0AHQyRHZdhgs9U5LRQv1
 1SJltevAiZ9vbm9QHeRsLyTqFuaMiEPIWgPTSQNVwcC7p/op4RbpjLCSMxyVpG8iNLdECv1h
 TuNqUADa6471JBRkf/hpBae3mPq+cChohMJChv/RE6usTgnYI6ZaJG36GXys8d4Lo+yQQzU1
 JQboPRy/NziHLnUyn3SGrhRRuv5jxqWGGeC2wMzQfHN4xzoqyb6It4KiN1rDB0xWvvobwMFd
 6M6Vel53JhWJHKsauddbou6C6zGJoC7Toy7CJg4gjdUC6WdlTNrHwk0PyZ8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlglDyNGMyilUn+ieL2iJuppVAtaQPmUwzExPnc/FW9H
 yh3bKNmNCmzoMWhO3KKoOb/3HgBLGQhBICelvG7gtWre1I8cEl4Uqe56ep4J+RYc1F9y76gE
 oeVARQDljISRBTvdG23V5yUQO+1B8cm9ythZX1E0JTB8yFLXLtDJZw3L/MfFYTLPsQ6pRKoZ
 5Hpo/m9P8k=
IronPort-HdrOrdr: A9a23:DAqJiK7+H5smgYpFtAPXwPPXdLJyesId70hD6qkRc20tTiX8ra
 uTdZsgpHjJYVoqKRIdcKm7WJVoIkmsk6Kdg7N9AV7KZmCP0ldASrsSj7cKqAeQfxEWmNQtsJ
 uIRJITNDQgNzlHZZeT2meF+4hJ+ra6zJw=
X-Talos-CUID: =?us-ascii?q?9a23=3AUuSuGWjtvj3eI68EqfbSvfSbCDJuaFHWk0yOJ0+?=
 =?us-ascii?q?EBnt2SYC8F26o+qpPnJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A9G3o1w40nQhkxb8MgOfjrUMVxoxzvKSoGHA0vqw?=
 =?us-ascii?q?Zos6DOXNaNzOzpT+OF9o=3D?=
X-IronPort-AV: E=Sophos;i="6.03,237,1694750400"; 
   d="scan'208";a="124689196"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18] CI: (More) Always pull base image when building a container
Date: Thu, 19 Oct 2023 18:14:52 +0100
Message-ID: <20231019171452.1704276-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Repeat c/s 26ecc08b98fc ("automation: Always pull base image when building a
container") for the other makefile we've got building containers.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Henry Wang <Henry.Wang@arm.com>

For 4.18.  This is CI infrastructure, not part of the regular build.
---
 automation/tests-artifacts/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/tests-artifacts/Makefile b/automation/tests-artifacts/Makefile
index 8ca71b78adbd..d055cd696bed 100644
--- a/automation/tests-artifacts/Makefile
+++ b/automation/tests-artifacts/Makefile
@@ -10,7 +10,7 @@ help:
 	@echo "To push container builds, set the env var PUSH"
 
 %: %.dockerfile ## Builds containers
-	docker build -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
+	docker build --pull -t $(REGISTRY)/$(@D):$(@F) -f $< $(<D)
 	@if [ ! -z $${PUSH+x} ]; then \
 		docker push $(REGISTRY)/$(@D):$(@F); \
 	fi

base-commit: 698b0f5031c6083401234a9b9415175cc5855a0a
prerequisite-patch-id: 94c86c1b3eb7aeda8eeef91241cdc8fa2691e2bc
prerequisite-patch-id: 728853399bfbaf972317a0d35ecd695f65026844
prerequisite-patch-id: 5a145a4decd44ace43a37b0315773e0abc6d54c6
prerequisite-patch-id: 24fad994d25558a45bbd3ead38120c154a974e9a
prerequisite-patch-id: a2a69b5382a293809a03633fd0513c371f9cf668
-- 
2.30.2


