Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF2B9CDD01
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 11:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837073.1253006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtuf-0001GI-6J; Fri, 15 Nov 2024 10:50:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837073.1253006; Fri, 15 Nov 2024 10:50:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBtuf-0001E5-12; Fri, 15 Nov 2024 10:50:53 +0000
Received: by outflank-mailman (input) for mailman id 837073;
 Fri, 15 Nov 2024 10:50:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3ntz=SK=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tBtud-0000kJ-R0
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 10:50:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 79161f42-a33f-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 11:50:48 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB8C21A00;
 Fri, 15 Nov 2024 02:51:17 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EED023F6A8;
 Fri, 15 Nov 2024 02:50:46 -0800 (PST)
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
X-Inumbo-ID: 79161f42-a33f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIxNy4xNDAuMTEwLjE3MiIsImhlbG8iOiJmb3NzLmFybS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6Ijc5MTYxZjQyLWEzM2YtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjY3ODQ4LjU2ODY4NCwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/5] arm/setup: Move MMU specific extern declarations to mmu/mm.h
Date: Fri, 15 Nov 2024 10:50:33 +0000
Message-Id: <20241115105036.218418-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115105036.218418-1-luca.fancellu@arm.com>
References: <20241115105036.218418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move some extern declarations related to MMU structures and define
from asm/setup.h to asm/mm.h, in order to increase encapsulation and
allow the MPU part to build, since it has no clue about them.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/mmu/mm.h | 11 +++++++++++
 xen/arch/arm/include/asm/setup.h  | 11 -----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index c5e03a66bf9e..69b72d671012 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -12,6 +12,17 @@ extern vaddr_t directmap_virt_start;
 extern unsigned long directmap_base_pdx;
 #endif
 
+extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];
+
+#ifdef CONFIG_ARM_64
+extern lpae_t boot_first[XEN_PT_LPAE_ENTRIES];
+extern lpae_t boot_first_id[XEN_PT_LPAE_ENTRIES];
+#endif
+extern lpae_t boot_second[XEN_PT_LPAE_ENTRIES];
+extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
+extern lpae_t boot_third[XEN_PT_LPAE_ENTRIES * XEN_NR_ENTRIES(2)];
+extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];
+
 #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
 
 /*
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 64c227d171fc..3f5c6cf9a08b 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -65,17 +65,6 @@ int map_irq_to_domain(struct domain *d, unsigned int irq,
 int map_range_to_domain(const struct dt_device_node *dev,
                         uint64_t addr, uint64_t len, void *data);
 
-extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];
-
-#ifdef CONFIG_ARM_64
-extern lpae_t boot_first[XEN_PT_LPAE_ENTRIES];
-extern lpae_t boot_first_id[XEN_PT_LPAE_ENTRIES];
-#endif
-extern lpae_t boot_second[XEN_PT_LPAE_ENTRIES];
-extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
-extern lpae_t boot_third[XEN_PT_LPAE_ENTRIES * XEN_NR_ENTRIES(2)];
-extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];
-
 /* Find where Xen will be residing at runtime and return a PT entry */
 lpae_t pte_of_xenaddr(vaddr_t va);
 
-- 
2.34.1


