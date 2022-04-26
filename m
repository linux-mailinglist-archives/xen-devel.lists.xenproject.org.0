Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B98510983
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 22:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314148.532099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njRSG-0003gW-ER; Tue, 26 Apr 2022 20:06:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314148.532099; Tue, 26 Apr 2022 20:06:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njRSG-0003eS-B8; Tue, 26 Apr 2022 20:06:36 +0000
Received: by outflank-mailman (input) for mailman id 314148;
 Tue, 26 Apr 2022 20:06:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njRSE-0003eK-Ho
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 20:06:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njRSE-0004SG-6T; Tue, 26 Apr 2022 20:06:34 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njRSD-0008Ly-U1; Tue, 26 Apr 2022 20:06:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=cXpV0bZL990t71BRKzeJL0a98IyOZGTem4wwEkwMQyU=; b=Zc96Rk
	RpPopW2ikP6HSuiiipn5dNz0twcJDARU0CqVcjHNof3SLC48dhoGsh4SQhzajyKzzbYwJgZ9Rku0C
	o4ag5v+r2bZlMzof6NmhAxTIooJ2679btH3Bl+GVQF+D0GhOu29VDj1Zk5R1DyaTa8BUddjC6ieIN
	l1J/XVfVJ64=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	David Vrabel <dvrabel@amazon.co.uk>
Subject: [PATCH] xen/arm: alternative: Don't call vmap() within stop_machine_run()
Date: Tue, 26 Apr 2022 21:06:29 +0100
Message-Id: <20220426200629.58921-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Commit 88a037e2cfe1 "page_alloc: assert IRQs are enabled in heap
alloc/free" extended the checks in the buddy allocator to catch
any use of the helpers from context with interrupts disabled.

Unfortunately, the rule is not followed in the alternative code and
this will result to crash at boot with debug enabled:

(XEN) Xen call trace:
(XEN)    [<0022a510>] alloc_xenheap_pages+0x120/0x150 (PC)
(XEN)    [<00000000>] 00000000 (LR)
(XEN)    [<002736ac>] arch/arm/mm.c#xen_pt_update+0x144/0x6e4
(XEN)    [<002740d4>] map_pages_to_xen+0x10/0x20
(XEN)    [<00236864>] __vmap+0x400/0x4a4
(XEN)    [<0026aee8>] arch/arm/alternative.c#__apply_alternatives_multi_stop+0x144/0x1ec
(XEN)    [<0022fe40>] stop_machine_run+0x23c/0x300
(XEN)    [<002c40c4>] apply_alternatives_all+0x34/0x5c
(XEN)    [<002ce3e8>] start_xen+0xcb8/0x1024
(XEN)    [<00200068>] arch/arm/arm32/head.o#primary_switched+0xc/0x1c

The interrupts will be disabled by the state machine in stop_machine_run(),
hence why the ASSERT is hit.

For now the patch extending the checks has been reverted, but it would
be good to re-introduce it (allocation with interrupts disabled is not
desirable).

So move the re-mapping of Xen to the caller of stop_machine_run().

Signed-off-by: Julien Grall <jgrall@amazon.com>
Cc: David Vrabel <dvrabel@amazon.co.uk>

---

I managed to successfully boot Xen with this patch and dropping the
revert.
---
 xen/arch/arm/alternative.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index 237c4e564209..f03cd943c636 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -170,7 +170,7 @@ static int __apply_alternatives(const struct alt_region *region,
  * We might be patching the stop_machine state machine, so implement a
  * really simple polling protocol here.
  */
-static int __apply_alternatives_multi_stop(void *unused)
+static int __apply_alternatives_multi_stop(void *xenmap)
 {
     static int patched = 0;
 
@@ -185,22 +185,9 @@ static int __apply_alternatives_multi_stop(void *unused)
     {
         int ret;
         struct alt_region region;
-        mfn_t xen_mfn = virt_to_mfn(_start);
-        paddr_t xen_size = _end - _start;
-        unsigned int xen_order = get_order_from_bytes(xen_size);
-        void *xenmap;
 
         BUG_ON(patched);
 
-        /*
-         * The text and inittext section are read-only. So re-map Xen to
-         * be able to patch the code.
-         */
-        xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
-                        VMAP_DEFAULT);
-        /* Re-mapping Xen is not expected to fail during boot. */
-        BUG_ON(!xenmap);
-
         region.begin = __alt_instructions;
         region.end = __alt_instructions_end;
 
@@ -208,8 +195,6 @@ static int __apply_alternatives_multi_stop(void *unused)
         /* The patching is not expected to fail during boot. */
         BUG_ON(ret != 0);
 
-        vunmap(xenmap);
-
         /* Barriers provided by the cache flushing */
         write_atomic(&patched, 1);
     }
@@ -224,14 +209,29 @@ static int __apply_alternatives_multi_stop(void *unused)
 void __init apply_alternatives_all(void)
 {
     int ret;
+    mfn_t xen_mfn = virt_to_mfn(_start);
+    paddr_t xen_size = _end - _start;
+    unsigned int xen_order = get_order_from_bytes(xen_size);
+    void *xenmap;
 
     ASSERT(system_state != SYS_STATE_active);
 
+    /*
+     * The text and inittext section are read-only. So re-map Xen to
+     * be able to patch the code.
+     */
+    xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
+                    VMAP_DEFAULT);
+    /* Re-mapping Xen is not expected to fail during boot. */
+    BUG_ON(!xenmap);
+
 	/* better not try code patching on a live SMP system */
-    ret = stop_machine_run(__apply_alternatives_multi_stop, NULL, NR_CPUS);
+    ret = stop_machine_run(__apply_alternatives_multi_stop, xenmap, NR_CPUS);
 
     /* stop_machine_run should never fail at this stage of the boot */
     BUG_ON(ret);
+
+    vunmap(xenmap);
 }
 
 int apply_alternatives(const struct alt_instr *start, const struct alt_instr *end)
-- 
2.32.0


