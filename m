Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303AD89D870
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 13:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702251.1097225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru9vQ-0005oC-4W; Tue, 09 Apr 2024 11:46:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702251.1097225; Tue, 09 Apr 2024 11:46:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru9vP-0005le-UG; Tue, 09 Apr 2024 11:46:03 +0000
Received: by outflank-mailman (input) for mailman id 702251;
 Tue, 09 Apr 2024 11:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0lRi=LO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1ru9vO-0004JL-5F
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 11:46:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bd164c23-f666-11ee-b907-491648fe20b8;
 Tue, 09 Apr 2024 13:46:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 852921655;
 Tue,  9 Apr 2024 04:46:31 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 717293F766;
 Tue,  9 Apr 2024 04:46:00 -0700 (PDT)
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
X-Inumbo-ID: bd164c23-f666-11ee-b907-491648fe20b8
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 07/13] xen/arm: Avoid code duplication in check_reserved_regions_overlap
Date: Tue,  9 Apr 2024 12:45:37 +0100
Message-Id: <20240409114543.3332150-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409114543.3332150-1-luca.fancellu@arm.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function check_reserved_regions_overlap is calling
'meminfo_overlap_check' on the same type of structure, this code
can be written in a way to avoid code duplication, so rework the
function to do that.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2:
 - no changes
v1:
 - new patch
---
---
 xen/arch/arm/setup.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 02bd27eb0c69..cc719d508d63 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -340,25 +340,27 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
 bool __init check_reserved_regions_overlap(paddr_t region_start,
                                            paddr_t region_size)
 {
+    const struct membanks *mem_banks[] = {
+        bootinfo_get_reserved_mem(),
+#ifdef CONFIG_ACPI
+        bootinfo_get_acpi(),
+#endif
+    };
+    unsigned int i;
+
     /*
-     * Check if input region is overlapping with bootinfo_get_reserved_mem()
-     * banks
+     * Check if input region is overlapping with reserved memory banks or
+     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled)
      */
-    if ( meminfo_overlap_check(bootinfo_get_reserved_mem(),
-                               region_start, region_size) )
-        return true;
+    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
+        if ( meminfo_overlap_check(mem_banks[i], region_start, region_size) )
+            return true;
 
     /* Check if input region is overlapping with bootmodules */
     if ( bootmodules_overlap_check(&bootinfo.modules,
                                    region_start, region_size) )
         return true;
 
-#ifdef CONFIG_ACPI
-    /* Check if input region is overlapping with ACPI EfiACPIReclaimMemory */
-    if ( meminfo_overlap_check(bootinfo_get_acpi(), region_start, region_size) )
-        return true;
-#endif
-
     return false;
 }
 
-- 
2.34.1


