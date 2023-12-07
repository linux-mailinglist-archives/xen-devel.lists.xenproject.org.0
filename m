Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6BA8084F8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649723.1014548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBB2H-0004U5-NS; Thu, 07 Dec 2023 09:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649723.1014548; Thu, 07 Dec 2023 09:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBB2H-0004Rp-JP; Thu, 07 Dec 2023 09:51:13 +0000
Received: by outflank-mailman (input) for mailman id 649723;
 Thu, 07 Dec 2023 09:51:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TliB=HS=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rBB2F-00048w-Rv
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:51:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 264f2883-94e6-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 10:51:10 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 91B904EE073A;
 Thu,  7 Dec 2023 10:51:09 +0100 (CET)
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
X-Inumbo-ID: 264f2883-94e6-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 2/3] xen/x86: address violations of MISRA C:2012 Rule 14.4
Date: Thu,  7 Dec 2023 10:48:43 +0100
Message-Id: <d494980216b8f0f870083fcfae7269f45e779780.1701941924.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701941924.git.maria.celeste.cesario@bugseng.com>
References: <cover.1701941924.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
headline states:
"The controlling expression of an if statement and the controlling
expression of an iteration-statement shall have essentially Boolean type".

Add comparisons to avoid using enum constants as controlling expressions
to comply with Rule 14.4.
No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/arch/x86/hpet.c                    | 6 +++---
 xen/arch/x86/msi.c                     | 4 ++--
 xen/arch/x86/x86_emulate/x86_emulate.c | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 7be26c6a9b..d1ddc8ddf6 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -279,7 +279,7 @@ static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
 {
     ch->msi.msg = *msg;
 
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         int rc = iommu_update_ire_from_msi(&ch->msi, msg);
 
@@ -353,7 +353,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
     u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
     irq_desc_t *desc = irq_to_desc(ch->msi.irq);
 
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         ch->msi.hpet_id = hpet_blockid;
         ret = iommu_setup_hpet_msi(&ch->msi);
@@ -372,7 +372,7 @@ static int __init hpet_setup_msi_irq(struct hpet_event_channel *ch)
         ret = __hpet_setup_msi_irq(desc);
     if ( ret < 0 )
     {
-        if ( iommu_intremap )
+        if ( iommu_intremap != iommu_intremap_off )
             iommu_update_ire_from_msi(&ch->msi, NULL);
         return ret;
     }
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 7f8e794254..72dce2e4ab 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -189,7 +189,7 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 {
     entry->msg = *msg;
 
-    if ( iommu_intremap )
+    if ( iommu_intremap != iommu_intremap_off )
     {
         int rc;
 
@@ -555,7 +555,7 @@ int msi_free_irq(struct msi_desc *entry)
             destroy_irq(entry[nr].irq);
 
         /* Free the unused IRTE if intr remap enabled */
-        if ( iommu_intremap )
+        if ( iommu_intremap != iommu_intremap_off )
             iommu_update_ire_from_msi(entry + nr, NULL);
     }
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index cf780da501..00b7365ed3 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -1320,7 +1320,7 @@ x86_emulate(
         ea.bytes = 2;
         goto srcmem_common;
     case SrcMem:
-        if ( state->simd_size )
+        if ( state->simd_size != simd_none )
             break;
         ea.bytes = (d & ByteOp) ? 1 : op_bytes;
     srcmem_common:
@@ -1460,7 +1460,7 @@ x86_emulate(
         /* Becomes a normal DstMem operation from here on. */
     case DstMem:
         generate_exception_if(ea.type == OP_MEM && evex.z, X86_EXC_UD);
-        if ( state->simd_size )
+        if ( state->simd_size != simd_none )
         {
             generate_exception_if(lock_prefix, X86_EXC_UD);
             break;
@@ -8176,7 +8176,7 @@ x86_emulate(
         goto done;
     }
 
-    if ( state->rmw )
+    if ( state->rmw != rmw_NONE )
     {
         ea.val = src.val;
         op_bytes = dst.bytes;
@@ -8205,7 +8205,7 @@ x86_emulate(
 
         dst.type = OP_NONE;
     }
-    else if ( state->simd_size )
+    else if ( state->simd_size != simd_none )
     {
         generate_exception_if(!op_bytes, X86_EXC_UD);
         generate_exception_if((vex.opcx && (d & TwoOp) &&
-- 
2.40.0


