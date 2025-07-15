Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A76B05394
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:46:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043606.1413630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMX-0004QN-1l; Tue, 15 Jul 2025 07:46:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043606.1413630; Tue, 15 Jul 2025 07:46:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubaMW-0004Nt-U1; Tue, 15 Jul 2025 07:46:04 +0000
Received: by outflank-mailman (input) for mailman id 1043606;
 Tue, 15 Jul 2025 07:46:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XoCR=Z4=arm.com=hari.limaye@srs-se1.protection.inumbo.net>)
 id 1ubaMV-0003TX-DE
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:46:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c0fdbda9-614f-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 09:46:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 781EA12FC;
 Tue, 15 Jul 2025 00:45:52 -0700 (PDT)
Received: from PWQ0QT7DJ1.emea.arm.com (PWQ0QT7DJ1.cambridge.arm.com
 [10.1.25.25])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC0763F66E;
 Tue, 15 Jul 2025 00:45:59 -0700 (PDT)
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
X-Inumbo-ID: c0fdbda9-614f-11f0-b894-0df219b8e170
From: Hari Limaye <hari.limaye@arm.com>
To: xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v3 6/6] arm/mpu: Implement remove_early_mappings for MPU systems
Date: Tue, 15 Jul 2025 08:45:28 +0100
Message-ID: <1c3cde21ab1ef1c2d9cadf07472ce2df10d70cf2.1752565274.git.hari.limaye@arm.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <cover.1752565274.git.hari.limaye@arm.com>
References: <cover.1752565274.git.hari.limaye@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

Implement remove_early_mappings for MPU systems.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1:
- Add Ayan's R-b

Changes from v2:
- Remove full stop
- Remove sanity check for `mapped_fdt_paddr == INVALID_PADDR`
---
 xen/arch/arm/mpu/setup.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
index a8cea0d9af..efceb985e3 100644
--- a/xen/arch/arm/mpu/setup.c
+++ b/xen/arch/arm/mpu/setup.c
@@ -106,7 +106,11 @@ void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
 
 void __init remove_early_mappings(void)
 {
-    BUG_ON("unimplemented");
+    int rc = destroy_xen_mappings(round_pgdown(mapped_fdt_base),
+                                  mapped_fdt_limit);
+
+    if ( rc )
+        panic("Unable to unmap the device-tree\n");
 }
 
 /*
-- 
2.34.1


