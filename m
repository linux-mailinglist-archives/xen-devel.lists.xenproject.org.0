Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7491A8118D5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 17:12:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654094.1020773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDRqV-0000FR-VS; Wed, 13 Dec 2023 16:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654094.1020773; Wed, 13 Dec 2023 16:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDRqV-0000DA-ST; Wed, 13 Dec 2023 16:12:27 +0000
Received: by outflank-mailman (input) for mailman id 654094;
 Wed, 13 Dec 2023 16:12:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mCut=HY=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rDRqU-00009X-1O
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 16:12:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6738794a-99d2-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 17:12:25 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 63DCC4EE0737;
 Wed, 13 Dec 2023 17:12:24 +0100 (CET)
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
X-Inumbo-ID: 6738794a-99d2-11ee-98e9-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH v2 2/2] xen/x86_emulate: address violations of MISRA C:2012 Rule 14.4
Date: Wed, 13 Dec 2023 17:10:51 +0100
Message-Id: <da78956b9dcb09ef78cc31debb58ad781b33dbe9.1702310368.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702310368.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702310368.git.maria.celeste.cesario@bugseng.com>
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
Changes in v2:
- move changes on hpet.c and msi.c to x86/IOMMU patch.
- rename prefix from xen/x86 to xen/x86_emulate.
---
 xen/arch/x86/x86_emulate/x86_emulate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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


