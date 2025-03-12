Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B00A5DE6D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 14:53:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910343.1317146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWO-0000HZ-2E; Wed, 12 Mar 2025 13:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910343.1317146; Wed, 12 Mar 2025 13:53:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWN-0000CS-SK; Wed, 12 Mar 2025 13:53:19 +0000
Received: by outflank-mailman (input) for mailman id 910343;
 Wed, 12 Mar 2025 13:53:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FzNf=V7=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tsMWL-0006ux-O1
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 13:53:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 596329fd-ff49-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 14:53:17 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 544F3152B;
 Wed, 12 Mar 2025 06:53:27 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97F2C3F5A1;
 Wed, 12 Mar 2025 06:53:15 -0700 (PDT)
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
X-Inumbo-ID: 596329fd-ff49-11ef-9ab9-95dc52dad729
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 07/10] arm/mpu: Implement stubs for ioremap_attr on MPU
Date: Wed, 12 Mar 2025 13:52:55 +0000
Message-Id: <20250312135258.1815706-8-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312135258.1815706-1-luca.fancellu@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement ioremap_attr() stub for MPU system; the
implementation of ioremap() is the same between MMU
and MPU system, and it relies on ioremap_attr(), so
move the definition from mmu/pt.c to arm/mm.c.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/mm.c     | 5 +++++
 xen/arch/arm/mmu/pt.c | 5 -----
 xen/arch/arm/mpu/mm.c | 6 ++++++
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index a56e20ba2bdc..5a52f0c623e5 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -395,6 +395,11 @@ unsigned long get_upper_mfn_bound(void)
     return max_page - 1;
 }
 
+void *ioremap(paddr_t pa, size_t len)
+{
+    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/mmu/pt.c b/xen/arch/arm/mmu/pt.c
index da28d669e796..11cb1c66dac8 100644
--- a/xen/arch/arm/mmu/pt.c
+++ b/xen/arch/arm/mmu/pt.c
@@ -223,11 +223,6 @@ void *ioremap_attr(paddr_t start, size_t len, unsigned int attributes)
     return ptr + offs;
 }
 
-void *ioremap(paddr_t pa, size_t len)
-{
-    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
-}
-
 static int create_xen_table(lpae_t *entry)
 {
     mfn_t mfn;
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 4036dd62eeeb..b196661a2312 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -18,6 +18,12 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
 }
 
+void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
+{
+    BUG_ON("unimplemented");
+    return NULL;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


