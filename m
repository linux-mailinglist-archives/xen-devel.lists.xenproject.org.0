Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 485438013D4
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 21:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645682.1007929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99ge-0000w9-Fg; Fri, 01 Dec 2023 20:00:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645682.1007929; Fri, 01 Dec 2023 20:00:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r99ge-0000ta-Cv; Fri, 01 Dec 2023 20:00:32 +0000
Received: by outflank-mailman (input) for mailman id 645682;
 Fri, 01 Dec 2023 20:00:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dz9Y=HM=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r99gd-0000tE-CU
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 20:00:31 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45029f93-9084-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 21:00:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 16670828559D;
 Fri,  1 Dec 2023 14:00:26 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id orQGaEzlCg7C; Fri,  1 Dec 2023 14:00:25 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 342CE8285518;
 Fri,  1 Dec 2023 14:00:25 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id UU5BR_wMoA70; Fri,  1 Dec 2023 14:00:25 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C497C82855D4;
 Fri,  1 Dec 2023 14:00:24 -0600 (CST)
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
X-Inumbo-ID: 45029f93-9084-11ee-98e5-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 342CE8285518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701460825; bh=PTGVv84Ek2dEZO/cpvmXSIJIyqcsMRVxyQ3qXqyT7ic=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=bfilnBFByEhZYmTm4CqDPzWnMM5MDg48x8IOLpMtCJKaBlkm+ebw6hWG8dLYpWYZZ
	 3rofNsro/wjmS+a4J1/vbtrtQmAPjvG9Yky1mxV/BuXcjWnbmbfr03LxW+wiNF0PI3
	 rY+NIasNFsXCzqWLwtUjsaM1oaYPUupltgeN3+KY=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 2/3] xen/ppc: mm-radix: Replace debug printing code with printk
Date: Fri,  1 Dec 2023 13:59:55 -0600
Message-Id: <44a52aa7b124fb53609e99815d4044ca9459d8a4.1701384928.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1701384928.git.sanastasio@raptorengineering.com>
References: <cover.1701384928.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Now that we have common code building, there's no need to keep the old
itoa64+debug print function in mm-radix.c

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/mm-radix.c | 58 +++++++++--------------------------------
 1 file changed, 12 insertions(+), 46 deletions(-)

diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index daa411a6fa..de181cf6f1 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -15,6 +15,12 @@
 
 void enable_mmu(void);
 
+#ifdef NDEBUG
+#define radix_dprintk(...)
+#else
+#define radix_dprintk(msg, ...) printk(XENLOG_DEBUG msg, ## __VA_ARGS__)
+#endif
+
 #define INITIAL_LVL1_PD_COUNT      1
 #define INITIAL_LVL2_LVL3_PD_COUNT 2
 #define INITIAL_LVL4_PT_COUNT      256
@@ -80,45 +86,6 @@ static __init struct lvl4_pt *lvl4_pt_pool_alloc(void)
     return &initial_lvl4_pt_pool[initial_lvl4_pt_pool_used++];
 }
 
-#ifndef NDEBUG
-/* TODO: Remove once we get common/ building */
-static char *__init itoa64_hex(uint64_t val, char *out_buf, size_t buf_len)
-{
-    uint64_t cur;
-    size_t i = buf_len - 1;
-
-    /* Null terminate buffer */
-    out_buf[i] = '\0';
-
-    /* Add digits in reverse */
-    cur = val;
-    while ( cur && i > 0 )
-    {
-        out_buf[--i] = "0123456789ABCDEF"[cur % 16];
-        cur /= 16;
-    }
-
-    /* Pad to 16 digits */
-    while ( i > 0 )
-        out_buf[--i] = '0';
-
-    return out_buf + i;
-}
-#endif
-
-static void __init radix_dprint(uint64_t addr, const char *msg)
-{
-#ifndef NDEBUG
-    char buf[sizeof("DEADBEEFCAFEBABA")];
-    char *addr_s = itoa64_hex(addr, buf, sizeof(buf));
-
-    early_printk("(0x");
-    early_printk(addr_s);
-    early_printk(") ");
-    early_printk(msg);
-#endif
-}
-
 static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
                                          vaddr_t map_start,
                                          vaddr_t map_end,
@@ -186,27 +153,26 @@ static void __init setup_initial_mapping(struct lvl1_pd *lvl1,
             unsigned long paddr = (page_addr - map_start) + phys_base;
             unsigned long flags;
 
-            radix_dprint(paddr, "being mapped to ");
-            radix_dprint(page_addr, "!\n");
+            radix_dprintk("%016lx being mapped to %016lx\n", paddr, page_addr);
             if ( is_kernel_text(page_addr) || is_kernel_inittext(page_addr) )
             {
-                radix_dprint(page_addr, "being marked as TEXT (RX)\n");
+                radix_dprintk("%016lx being marked as TEXT (RX)\n", page_addr);
                 flags = PTE_XEN_RX;
             }
             else if ( is_kernel_rodata(page_addr) )
             {
-                radix_dprint(page_addr, "being marked as RODATA (RO)\n");
+                radix_dprintk("%016lx being marked as RODATA (RO)\n", page_addr);
                 flags = PTE_XEN_RO;
             }
             else
             {
-                radix_dprint(page_addr, "being marked as DEFAULT (RW)\n");
+                radix_dprintk("%016lx being marked as DEFAULT (RW)\n", page_addr);
                 flags = PTE_XEN_RW;
             }
 
             *pte = paddr_to_pte(paddr, flags);
-            radix_dprint(paddr_to_pte(paddr, flags).pte,
-                             "is result of PTE map!\n");
+            radix_dprintk("%016lx is the result of PTE map\n",
+                paddr_to_pte(paddr, flags).pte);
         }
         else
         {
-- 
2.30.2


