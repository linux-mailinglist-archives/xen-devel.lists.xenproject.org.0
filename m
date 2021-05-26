Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E701A391CBD
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 18:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132624.247313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llw8A-000591-GV; Wed, 26 May 2021 16:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132624.247313; Wed, 26 May 2021 16:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llw8A-000567-Cc; Wed, 26 May 2021 16:11:38 +0000
Received: by outflank-mailman (input) for mailman id 132624;
 Wed, 26 May 2021 16:11:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1llw88-000561-Ra
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 16:11:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llw87-0004fU-6J; Wed, 26 May 2021 16:11:35 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1llw86-0003AK-T2; Wed, 26 May 2021 16:11:35 +0000
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
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=yrQbQMaqTvUXp0yu7HpETMtIwdzmnlOinZ/SB1SX3yg=; b=ioFK1A6SBdCuJWICOD5twMwhhV
	X4lO53Nvhdb3lw4MXFVRySyx484FDltxvE1TakZPLAgE35lz9h6EQpuqN1BCFKYOjeC3fMZ9PPCrp
	2oaKnK3OsxXgVe1TCdcB+ZHgayP295zbTBX2zVFFOKsQkjbtmQMFaDs71VGysWg1UQEw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/page_alloc: Remove dead code in alloc_domheap_pages()
Date: Wed, 26 May 2021 17:11:29 +0100
Message-Id: <20210526161129.28572-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Since commit 1aac966e24e9 "xen: support RAM at addresses 0 and 4096",
bits_to_zone() will never return 0 and it is expected that we have
minimum 2 zones.

Therefore the check in alloc_domheap_pages() is unnecessary and can
be removed. However, for sanity, it is replaced with an ASSERT().

Also take the opportunity to switch from min_t() to min() as
bits_to_zone() cannot return a negative value. The macro is tweaked
to make it clearer.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Remove BUILD_BUG_ON()
        - Switch from min_t() to min()
---
 xen/common/page_alloc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ace6333c18ea..958ba0cd9256 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -441,7 +441,7 @@ mfn_t __init alloc_boot_pages(unsigned long nr_pfns, unsigned long pfn_align)
 #define MEMZONE_XEN 0
 #define NR_ZONES    (PADDR_BITS - PAGE_SHIFT + 1)
 
-#define bits_to_zone(b) (((b) < (PAGE_SHIFT + 1)) ? 1 : ((b) - PAGE_SHIFT))
+#define bits_to_zone(b) (((b) < (PAGE_SHIFT + 1)) ? 1U : ((b) - PAGE_SHIFT))
 #define page_to_zone(pg) (is_xen_heap_page(pg) ? MEMZONE_XEN :  \
                           (flsl(mfn_x(page_to_mfn(pg))) ? : 1))
 
@@ -2336,8 +2336,9 @@ struct page_info *alloc_domheap_pages(
 
     bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
                                       bits ? : (BITS_PER_LONG+PAGE_SHIFT));
-    if ( (zone_hi = min_t(unsigned int, bits_to_zone(bits), zone_hi)) == 0 )
-        return NULL;
+
+    zone_hi = min(bits_to_zone(bits), zone_hi);
+    ASSERT(zone_hi != 0);
 
     if ( memflags & MEMF_no_owner )
         memflags |= MEMF_no_refcount;
-- 
2.17.1


