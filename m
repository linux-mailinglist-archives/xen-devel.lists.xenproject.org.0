Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F87A36A921
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117308.223192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8K-0001mF-Nl; Sun, 25 Apr 2021 20:13:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117308.223192; Sun, 25 Apr 2021 20:13:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8K-0001ji-CX; Sun, 25 Apr 2021 20:13:36 +0000
Received: by outflank-mailman (input) for mailman id 117308;
 Sun, 25 Apr 2021 20:13:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lal8J-0001i6-0m
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:13:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8I-0000p4-Ou; Sun, 25 Apr 2021 20:13:34 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal8I-0005m7-GR; Sun, 25 Apr 2021 20:13:34 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=NkFXrdGqH4EPmzou9mWkeqYkQCSaITClqSn4Be5r/zI=; b=F12nHvd4PDHg3Ann1gEV5mT4c
	Uyt5mKxNT0Cx4WZY9me+oL5J3D/WXAT5LwiE0CtuebDNHBPCDkY/xwx5/hvekdxLkyxdp96WPtOYW
	ShK7euMpoS4UkgoRNayfziVBZWzNdioOmRY1Zq5PGedJHx43r8QbptSw+5TBrdshL7AiM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFCv2 08/15] xen/arm32: mm: Check if the virtual address is shared before updating it
Date: Sun, 25 Apr 2021 21:13:11 +0100
Message-Id: <20210425201318.15447-9-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

Only the first 2GB of the virtual address space is shared between all
the page-tables on Arm32.

There is a long outstanding TODO in xen_pt_update() stating that the
function is can only work with shared mapping. Nobody has ever called
the function with private mapping, however as we add more callers
there is a risk to mess things up.

Introduce a new define to mark the ened of the shared mappings and use
it in xen_pt_update() to verify if the address is correct.

Note that on Arm64, all the mappings are shared. Some compiler may
complain about an always true check, so the new define is not introduced
for arm64 and the code is protected with an #ifdef.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch
---
 xen/arch/arm/mm.c            | 11 +++++++++--
 xen/include/asm-arm/config.h |  4 ++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 8fac24d80086..5c17cafff847 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1275,11 +1275,18 @@ static int xen_pt_update(unsigned long virt,
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
diff --git a/xen/include/asm-arm/config.h b/xen/include/asm-arm/config.h
index c7b77912013e..85d4a510ce8a 100644
--- a/xen/include/asm-arm/config.h
+++ b/xen/include/asm-arm/config.h
@@ -137,6 +137,10 @@
 
 #define XENHEAP_VIRT_START     _AT(vaddr_t,0x40000000)
 #define XENHEAP_VIRT_END       _AT(vaddr_t,0x7fffffff)
+
+/* The first 2GB is always shared between all the page-tables. */
+#define SHARED_VIRT_END        _AT(vaddr_t, 0x7fffffff)
+
 #define DOMHEAP_VIRT_START     _AT(vaddr_t,0x80000000)
 #define DOMHEAP_VIRT_END       _AT(vaddr_t,0xffffffff)
 
-- 
2.17.1


