Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0243FAC1D52
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 08:54:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995192.1377711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMIN-0002El-QW; Fri, 23 May 2025 06:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995192.1377711; Fri, 23 May 2025 06:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIMIN-0002CJ-NK; Fri, 23 May 2025 06:54:19 +0000
Received: by outflank-mailman (input) for mailman id 995192;
 Fri, 23 May 2025 06:54:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ff/g=YH=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1uIMIN-0002CD-4a
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 06:54:19 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id be710152-37a2-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 08:54:17 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DEB31764;
 Thu, 22 May 2025 23:54:02 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C57C3F673;
 Thu, 22 May 2025 23:54:15 -0700 (PDT)
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
X-Inumbo-ID: be710152-37a2-11f0-b892-0df219b8e170
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 1/6] docs/arm: Document Xen booting protocol on Armv8-R
Date: Fri, 23 May 2025 07:54:01 +0100
Message-Id: <20250523065406.3795420-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523065406.3795420-1-luca.fancellu@arm.com>
References: <20250523065406.3795420-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the requirement needed to boot Xen on Armv8-R platforms.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v6 changes:
 - Add Julien's Ack-by, add " Cache state shall follow [1], [2] for MPU."
v5 changes:
 - restructured and removed some EL3 reference that might not
   be there on Armv8-R aarch64
 - add R-by Ayan and Michal
v4 changes:
 - New patch
---
 docs/misc/arm/booting.txt | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index 21ae74837dcc..e9b511cae4a8 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -56,12 +56,17 @@ image header to determine the load address, entry point, etc.
 Firmware/bootloader requirements
 --------------------------------
 
-Xen relies on some settings the firmware has to configure in EL3 before starting Xen.
+Xen relies on some settings the firmware has to configure before starting Xen.
 
-* Xen must be entered in NS EL2 mode
+* Xen must be entered in:
+  * Non-Secure EL2 mode for Armv8-A Arm64 and Arm32, Armv8-R Arm32.
+  * Secure EL2 mode for Armv8-R Arm64.
 
-* The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
+* When EL3 is supported, the bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must
+  be set to 1.
 
+* Xen must be entered with MMU/MPU off and data cache disabled (SCTLR_EL2.M bit
+  and SCTLR_EL2.C set to 0). Cache state shall follow [1], [2] for MPU.
 
 [1] linux/Documentation/arm/booting.rst
 Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm/booting.rst
-- 
2.34.1


