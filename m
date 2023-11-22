Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FBD7F42D4
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 10:52:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638585.995309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jtd-0002Yc-6j; Wed, 22 Nov 2023 09:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638585.995309; Wed, 22 Nov 2023 09:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5jtd-0002Vm-3v; Wed, 22 Nov 2023 09:51:49 +0000
Received: by outflank-mailman (input) for mailman id 638585;
 Wed, 22 Nov 2023 09:51:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vowI=HD=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r5jtb-0002Gw-T8
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 09:51:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bfbc5062-891c-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 10:51:46 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.163.203.136])
 by support.bugseng.com (Postfix) with ESMTPSA id 95A834EE0C91;
 Wed, 22 Nov 2023 10:51:45 +0100 (CET)
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
X-Inumbo-ID: bfbc5062-891c-11ee-98e1-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 1/2] x86/mm: preparation work to uniform modify_xen_mappings* interfaces
Date: Wed, 22 Nov 2023 10:51:28 +0100
Message-Id: <8f318ade9277b316a6f91df3b75a593d662ac586.1700645120.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700645120.git.federico.serafini@bugseng.com>
References: <cover.1700645120.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The objective is to use parameter name "nf" to denote "new flags"
in all the modify_xen_mappings* functions.
Since modify_xen_mappings_lite() is currently using "nf" as identifier
for a local variable, bad things could happen if new uses of such
variable are committed while a renaming patch is waiting for the
approval.
To avoid such danger, as first thing rename the local variable from
"nf" to "flags".

No functional change.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/mm.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 39544bd9f9..42c957c40e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5903,15 +5903,15 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
 void init_or_livepatch modify_xen_mappings_lite(
     unsigned long s, unsigned long e, unsigned int _nf)
 {
-    unsigned long v = s, fm, nf;
+    unsigned long v = s, fm, flags;
 
     /* Set of valid PTE bits which may be altered. */
 #define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
     fm = put_pte_flags(FLAGS_MASK);
-    nf = put_pte_flags(_nf & FLAGS_MASK);
+    flags = put_pte_flags(_nf & FLAGS_MASK);
 #undef FLAGS_MASK
 
-    ASSERT(nf & _PAGE_PRESENT);
+    ASSERT(flags & _PAGE_PRESENT);
     ASSERT(IS_ALIGNED(s, PAGE_SIZE) && s >= XEN_VIRT_START);
     ASSERT(IS_ALIGNED(e, PAGE_SIZE) && e <= XEN_VIRT_END);
 
@@ -5925,7 +5925,7 @@ void init_or_livepatch modify_xen_mappings_lite(
 
         if ( l2e_get_flags(l2e) & _PAGE_PSE )
         {
-            l2e_write_atomic(pl2e, l2e_from_intpte((l2e.l2 & ~fm) | nf));
+            l2e_write_atomic(pl2e, l2e_from_intpte((l2e.l2 & ~fm) | flags));
 
             v += 1UL << L2_PAGETABLE_SHIFT;
             continue;
@@ -5943,7 +5943,8 @@ void init_or_livepatch modify_xen_mappings_lite(
 
                 ASSERT(l1f & _PAGE_PRESENT);
 
-                l1e_write_atomic(pl1e, l1e_from_intpte((l1e.l1 & ~fm) | nf));
+                l1e_write_atomic(pl1e,
+                                 l1e_from_intpte((l1e.l1 & ~fm) | flags));
 
                 v += 1UL << L1_PAGETABLE_SHIFT;
 
-- 
2.34.1


