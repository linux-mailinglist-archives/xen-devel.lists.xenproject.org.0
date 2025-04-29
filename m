Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD186AA1047
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 17:21:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972774.1361102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9mln-0002a0-Pr; Tue, 29 Apr 2025 15:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972774.1361102; Tue, 29 Apr 2025 15:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9mln-0002Vt-Hw; Tue, 29 Apr 2025 15:21:15 +0000
Received: by outflank-mailman (input) for mailman id 972774;
 Tue, 29 Apr 2025 15:21:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mkRs=XP=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1u9mll-0002Ky-RN
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 15:21:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 92c143b9-250d-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 17:21:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ABD81516;
 Tue, 29 Apr 2025 08:21:00 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E2133F673;
 Tue, 29 Apr 2025 08:21:06 -0700 (PDT)
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
X-Inumbo-ID: 92c143b9-250d-11f0-9ffb-bf95429c2676
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on Armv8-R
Date: Tue, 29 Apr 2025 16:20:51 +0100
Message-Id: <20250429152057.2380536-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429152057.2380536-1-luca.fancellu@arm.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the requirement needed to boot Xen on Armv8-R platforms.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v4 changes:
 - New patch
---
 docs/misc/arm/booting.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index 21ae74837dcc..719af74f1e69 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -62,6 +62,14 @@ Xen relies on some settings the firmware has to configure in EL3 before starting
 
 * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
 
+When Xen runs on Armv8-R, the highest exception level is EL2 and the only
+available state is secure (S) on Arm64 and non secure (NS) on Arm32, hence the
+above requirements need to be adjusted to this case:
+
+* Xen must be entered in S EL2 mode on Arm64 and in NS EL2 mode on Arm32.
+
+* Xen must be entered with MPU off and data cache disabled (SCTLR_EL2.M bit and
+  SCTLR_EL2.C set to 0).
 
 [1] linux/Documentation/arm/booting.rst
 Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm/booting.rst
-- 
2.34.1


