Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B0B89992A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 11:15:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701162.1095373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfer-0008GK-LM; Fri, 05 Apr 2024 09:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701162.1095373; Fri, 05 Apr 2024 09:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfer-0008EM-Hy; Fri, 05 Apr 2024 09:14:49 +0000
Received: by outflank-mailman (input) for mailman id 701162;
 Fri, 05 Apr 2024 09:14:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUTm=LK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rsfep-0007WZ-U1
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 09:14:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2303e5d-f32c-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 11:14:46 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 2F3344EE0744;
 Fri,  5 Apr 2024 11:14:45 +0200 (CEST)
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
X-Inumbo-ID: f2303e5d-f32c-11ee-a1ef-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 3/9] x86/irq: tidy switch statement and address MISRA violation
Date: Fri,  5 Apr 2024 11:14:31 +0200
Message-Id: <d1bdd54b6751a047626b0271fff882484f98ea1a.1712305581.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712305581.git.nicola.vetrini@bugseng.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unneded blank lines between switch clauses.

Refactor the clauses so that a MISRA C Rule 16.2 violation is resolved
(A switch label shall only be used when the most closely-enclosing
compound statement is the body of a switch statement).
Note that the switch clause ending with the pseudo keyword "fallthrough"
is an allowed exception to Rule 16.3.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
The initialization of irq is due to gcc thinking that irq may be used
uninitizalied in the test after MAP_PIRQ_TYPE_MULTI_MSI
---
 xen/arch/x86/irq.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 0487f734a5d2..16c023f077da 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2882,7 +2882,7 @@ int allocate_and_map_gsi_pirq(struct domain *d, int index, int *pirq_p)
 int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
                               int type, struct msi_info *msi)
 {
-    int irq, pirq, ret;
+    int irq = -1, pirq, ret;
 
     ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
 
@@ -2892,12 +2892,10 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
         if ( !msi->table_base )
             msi->entry_nr = 1;
         irq = index;
-        if ( irq == -1 )
-        {
+        fallthrough;
     case MAP_PIRQ_TYPE_MULTI_MSI:
+        if( type == MAP_PIRQ_TYPE_MULTI_MSI || irq == -1 )
             irq = create_irq(NUMA_NO_NODE, true);
-        }
-
         if ( irq < nr_irqs_gsi || irq >= nr_irqs )
         {
             dprintk(XENLOG_G_ERR, "dom%d: can't create irq for msi!\n",
@@ -2905,7 +2903,6 @@ int allocate_and_map_msi_pirq(struct domain *d, int index, int *pirq_p,
             return -EINVAL;
         }
         break;
-
     default:
         dprintk(XENLOG_G_ERR, "dom%d: wrong pirq type %x\n",
                 d->domain_id, type);
-- 
2.34.1


