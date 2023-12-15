Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0E7814047
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 03:52:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654841.1022308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJl-0004XX-6M; Fri, 15 Dec 2023 02:52:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654841.1022308; Fri, 15 Dec 2023 02:52:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJk-0004Ld-UA; Fri, 15 Dec 2023 02:52:48 +0000
Received: by outflank-mailman (input) for mailman id 654841;
 Fri, 15 Dec 2023 02:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onWf=H2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rDyJi-0003SX-Fr
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 02:52:46 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05535a5c-9af5-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 03:52:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E120F82869E4;
 Thu, 14 Dec 2023 20:52:43 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id gRVHeYDAcCqB; Thu, 14 Dec 2023 20:52:43 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F32ED8285AE9;
 Thu, 14 Dec 2023 20:52:42 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id VVV1gIaDpdrw; Thu, 14 Dec 2023 20:52:42 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 9FEE482867CC;
 Thu, 14 Dec 2023 20:52:42 -0600 (CST)
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
X-Inumbo-ID: 05535a5c-9af5-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F32ED8285AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1702608763; bh=PTGVv84Ek2dEZO/cpvmXSIJIyqcsMRVxyQ3qXqyT7ic=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=V0JrNFGfk5JrqXkpR+jqEi4H74pr+w7xYdb92PDe3Urjo6d9f0+T35wmhoE7PEdoy
	 QTo2NeHHFS2lnU6VSkyQraMkSmMuEzqeDzftVTA9CM1F/E2HYl+fW1xU4J1L+elrod
	 hEIhmXDgVs5bGs1jltTtnGREmEl51LPpNZEbCuyM=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 6/7] xen/ppc: mm-radix: Replace debug printing code with printk
Date: Thu, 14 Dec 2023 20:44:01 -0600
Message-Id: <a45e841068ef66cc8c1d836a2452910fd3effd50.1702607884.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1702607884.git.sanastasio@raptorengineering.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
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


