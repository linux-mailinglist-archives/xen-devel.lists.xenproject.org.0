Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F19C918D9
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 11:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174638.1499585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOvGH-0007Fb-Vy; Fri, 28 Nov 2025 09:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174638.1499585; Fri, 28 Nov 2025 09:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOvGH-0007DE-T2; Fri, 28 Nov 2025 09:59:33 +0000
Received: by outflank-mailman (input) for mailman id 1174638;
 Fri, 28 Nov 2025 09:59:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kA0B=6E=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vOvGF-0007D4-VF
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 09:59:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e6413994-cc40-11f0-9d18-b5c5bf9af7f9;
 Fri, 28 Nov 2025 10:59:16 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52BB51A25;
 Fri, 28 Nov 2025 01:59:08 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC04E3F73B;
 Fri, 28 Nov 2025 01:59:13 -0800 (PST)
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
X-Inumbo-ID: e6413994-cc40-11f0-9d18-b5c5bf9af7f9
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Luca Fancellu <luca.fancellu@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Hari Limaye <hari.limaye@arm.com>
Subject: [PATCH 1/6] arm/mpu: Implement copy_from_paddr for MPU systems
Date: Fri, 28 Nov 2025 09:58:54 +0000
Message-ID: <20251128095859.11264-2-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128095859.11264-1-harry.ramsey@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

Implement the function copy_from_paddr variant for MPU systems, using
the map_pages_to_xen/destroy_xen_mappings to temporarily map the memory
range to be copied.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 xen/arch/arm/mpu/setup.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
index 163573b932..ec264f54f2 100644
--- a/xen/arch/arm/mpu/setup.c
+++ b/xen/arch/arm/mpu/setup.c
@@ -91,7 +91,19 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
  */
 void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
 {
-    BUG_ON("unimplemented");
+    paddr_t start_pg = round_pgdown(paddr);
+    paddr_t end_pg   = round_pgup(paddr + len);
+    unsigned long nr_mfns = (end_pg - start_pg) >> PAGE_SHIFT;
+    mfn_t mfn = maddr_to_mfn(start_pg);
+
+    if ( map_pages_to_xen(start_pg, mfn, nr_mfns, PAGE_HYPERVISOR_WC) )
+        panic("Unable to map range for copy_from_paddr\n");
+
+    memcpy(dst, maddr_to_virt(paddr), len);
+    clean_dcache_va_range(dst, len);
+
+    if ( destroy_xen_mappings(start_pg, end_pg) )
+        panic("Unable to unmap range for copy_from_paddr\n");
 }
 
 void __init remove_early_mappings(void)
-- 
2.43.0


