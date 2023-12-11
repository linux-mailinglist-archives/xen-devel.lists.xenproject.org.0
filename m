Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A238480CEBD
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 15:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652277.1018044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChgY-0007wG-A2; Mon, 11 Dec 2023 14:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652277.1018044; Mon, 11 Dec 2023 14:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rChgY-0007uH-6T; Mon, 11 Dec 2023 14:55:06 +0000
Received: by outflank-mailman (input) for mailman id 652277;
 Mon, 11 Dec 2023 14:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVij=HW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rChgX-0007Ua-2t
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 14:55:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43dfeb48-9835-11ee-9b0f-b553b5be7939;
 Mon, 11 Dec 2023 15:55:03 +0100 (CET)
Received: from Dell.bugseng.com.homenet.telecomitalia.it
 (host-80-116-181-249.retail.telecomitalia.it [80.116.181.249])
 by support.bugseng.com (Postfix) with ESMTPSA id D82494EE073E;
 Mon, 11 Dec 2023 15:55:02 +0100 (CET)
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
X-Inumbo-ID: 43dfeb48-9835-11ee-9b0f-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Rahul Singh <rahul.singh@arm.com>
Subject: [XEN PATCH] xen/arm: smmu: move phys_addr_t definition to linux-compat.h
Date: Mon, 11 Dec 2023 15:54:56 +0100
Message-Id: <e525cd0a2770743e052819b2e14f7df50f801a23.1702303903.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both smmu and smmu-v3 (ported from Linux) define the typedef name
"phys_addr_t": move the type definition to the common header
linux-compat.h to address violations of MISRA C:2012 Rule 5.6
("A typedef name shall be a unique identifier").
No functional change.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/passthrough/arm/smmu-v3.h | 1 -
 xen/drivers/passthrough/arm/smmu.c    | 1 -
 xen/include/xen/linux-compat.h        | 1 +
 3 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
index 05f6b1fb7e..f09048812c 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -377,7 +377,6 @@
 
 /* Linux compatibility functions. */
 typedef paddr_t		dma_addr_t;
-typedef paddr_t		phys_addr_t;
 typedef unsigned int		gfp_t;
 
 /* Alias to Xen lock functions */
diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 11fc1d22ef..32e2ff279b 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -199,7 +199,6 @@ static inline int pci_for_each_dma_alias(struct pci_dev *pdev,
 
 /* Xen: misc */
 #define PHYS_MASK_SHIFT		PADDR_BITS
-typedef paddr_t phys_addr_t;
 
 #define VA_BITS		0	/* Only used for configuring stage-1 input size */
 
diff --git a/xen/include/xen/linux-compat.h b/xen/include/xen/linux-compat.h
index 8d06bb6dc9..987ac7d8db 100644
--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -16,5 +16,6 @@ typedef uint8_t __u8;
 typedef int16_t __s16;
 typedef int32_t __s32;
 typedef int64_t __s64;
+typedef paddr_t phys_addr_t;
 
 #endif /* __XEN_LINUX_COMPAT_H__ */
-- 
2.34.1


