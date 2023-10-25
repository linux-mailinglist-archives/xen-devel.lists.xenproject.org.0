Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EAC7D6C9F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 15:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622870.970087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvdVs-0002yh-Ur; Wed, 25 Oct 2023 13:01:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622870.970087; Wed, 25 Oct 2023 13:01:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvdVs-0002w9-RE; Wed, 25 Oct 2023 13:01:32 +0000
Received: by outflank-mailman (input) for mailman id 622870;
 Wed, 25 Oct 2023 13:01:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xfp5=GH=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qvdVr-0002w3-IN
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 13:01:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cc92e05-7336-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 15:01:29 +0200 (CEST)
Received: from Dell.home-life.hub (unknown [151.29.134.109])
 by support.bugseng.com (Postfix) with ESMTPSA id 755E74EE073A;
 Wed, 25 Oct 2023 15:01:28 +0200 (CEST)
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
X-Inumbo-ID: 9cc92e05-7336-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v2] x86/iommu_init: address a violation of MISRA C:2012 Rule 8.3
Date: Wed, 25 Oct 2023 15:01:22 +0200
Message-Id: <ba5d1368fce181a6a3a6abc150651e1e5323e489.1698238686.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make function definition and declaration consistent and emphasize that
the formal parameter is deliberately not used.
No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
- improved code format.
---
 xen/drivers/passthrough/amd/iommu_init.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 9c01a49435..9f955743e1 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -692,7 +692,7 @@ static void iommu_check_ppr_log(struct amd_iommu *iommu)
     spin_unlock_irqrestore(&iommu->lock, flags);
 }
 
-static void cf_check do_amd_iommu_irq(void *unused)
+static void cf_check do_amd_iommu_irq(void *data)
 {
     struct amd_iommu *iommu;
 
@@ -702,6 +702,9 @@ static void cf_check do_amd_iommu_irq(void *unused)
         return;
     }
 
+    /* Formal parameter is deliberately unused. */
+    (void)data;
+
     /*
      * No matter from where the interrupt came from, check all the
      * IOMMUs present in the system. This allows for having just one
-- 
2.34.1


