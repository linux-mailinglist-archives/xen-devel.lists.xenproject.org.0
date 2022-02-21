Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A444BD914
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:22:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275995.472090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5py-0006X9-RY; Mon, 21 Feb 2022 10:22:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275995.472090; Mon, 21 Feb 2022 10:22:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5py-0006O3-83; Mon, 21 Feb 2022 10:22:34 +0000
Received: by outflank-mailman (input) for mailman id 275995;
 Mon, 21 Feb 2022 10:22:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM5pw-00062Y-9Z
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:22:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pw-0002CP-22; Mon, 21 Feb 2022 10:22:32 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pv-00070b-R2; Mon, 21 Feb 2022 10:22:32 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=f5eydWA/xrVr2E4ET4uKtIXdg9zT+/rA87h+Dp/T1XQ=; b=kGZXEvUvAbBP8RABHqRfsx1pWV
	Ri+mN6arLvsf1/9WTidhs68lId5bZsdZ5BKsSTGfV/LtrsypqKt8+0I5eaj3ZgJ4Puhwknk+wugJb
	qEw7W6bp4sIPOni6pCivbopojiCa7mIIg7d8ZQveDVkm9muFF7wEKgBMvy7udwNT/8Jc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 09/19] xen/arm32: mm: Check if the virtual address is shared before updating it
Date: Mon, 21 Feb 2022 10:22:08 +0000
Message-Id: <20220221102218.33785-10-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Only the first 2GB of the virtual address space is shared between all
the page-tables on Arm32.

There is a long outstanding TODO in xen_pt_update() stating that the
function can only work with shared mapping. Nobody has ever called
the function with private mapping, however as we add more callers
there is a risk to mess things up.

Introduce a new define to mark the end of the shared mappings and use
it in xen_pt_update() to verify if the address is correct.

Note that on Arm64, all the mappings are shared. Some compiler may
complain about an always true check, so the new define is not introduced
for arm64 and the code is protected with an #ifdef.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch
---
 xen/arch/arm/include/asm/config.h |  4 ++++
 xen/arch/arm/mm.c                 | 11 +++++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index c7b77912013e..85d4a510ce8a 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -137,6 +137,10 @@
 
 #define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
 #define XENHEAP_VIRT_END       _AT(vaddr_t,0x7fffffff)
+
+/* The first 2GB is always shared between all the page-tables. */
+#define SHARED_VIRT_END        _AT(vaddr_t, 0x7fffffff)
+
 #define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
 #define DOMHEAP_VIRT_END       _AT(vaddr_t,0xffffffff)
 
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 24de8dcb9042..f18f65745595 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1365,11 +1365,18 @@ static int xen_pt_update(unsigned long virt,
      * For arm32, page-tables are different on each CPUs. Yet, they share
      * some common mappings. It is assumed that only common mappings
      * will be modified with this function.
-     *
-     * XXX: Add a check.
      */
     const mfn_t root = virt_to_mfn(THIS_CPU_PGTABLE);
 
+#ifdef SHARED_VIRT_END
+    if ( virt > SHARED_VIRT_END ||
+         (SHARED_VIRT_END - virt) < nr_mfns )
+    {
+        mm_printk("Trying to map outside of the shared area.\n");
+        return -EINVAL;
+    }
+#endif
+
     /*
      * The hardware was configured to forbid mapping both writeable and
      * executable.
-- 
2.32.0


