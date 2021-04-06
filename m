Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AA8355C26
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 21:23:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106269.203265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTrHp-0004Fw-8X; Tue, 06 Apr 2021 19:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106269.203265; Tue, 06 Apr 2021 19:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTrHp-0004FX-5a; Tue, 06 Apr 2021 19:22:53 +0000
Received: by outflank-mailman (input) for mailman id 106269;
 Tue, 06 Apr 2021 19:22:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTrHm-0004FS-SV
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 19:22:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTrHl-0005d3-P7; Tue, 06 Apr 2021 19:22:49 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTrHl-0000zd-9m; Tue, 06 Apr 2021 19:22:49 +0000
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
	bh=PrkuCfGhHLJrZ4S+yOEu6s9dgnK1NNTZT78cqa6PGl8=; b=YvMSibRja/Vs2ECLsL57FpEjVl
	dJUh3M+WZZx8cSxrzl376E8sX3VXWiKPaFR4X8pYdvK0O0B1n4Irhef2cuBFaeIp+xpqM7i5ONEMj
	5NZ0j0/k0U6R1mzLtJ2ObHG3/iMz8DHsup96H8Nq1HwIDjzU2cNvNbKP/OIXq4VoD2oA=;
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
Subject: [PATCH] xen/page_alloc: Remove dead code in alloc_domheap_pages()
Date: Tue,  6 Apr 2021 20:22:46 +0100
Message-Id: <20210406192246.15657-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Since commit 1aac966e24e9 "xen: support RAM at addresses 0 and 4096",
bits_to_zone() will never return 0 and it is expected that we have
minimum 2 zones.

Therefore the check in alloc_domheap_pages() is unnecessary and can
be removed. However, for sanity, it is replaced with an ASSERT().

Also take the opportunity to check atbuild time that NR_ZONES is minimum
2.

This bug was discovered and resolved using Coverity Static Analysis
Security Testing (SAST) by Synopsys, Inc.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/common/page_alloc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 1744e6faa5c4..68e47d963842 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -457,6 +457,12 @@ static long total_avail_pages;
 static DEFINE_SPINLOCK(heap_lock);
 static long outstanding_claims; /* total outstanding claims by all domains */
 
+static void __init __maybe_unused build_assertions(void)
+{
+    /* Zone 0 is reserved for Xen, so we at least need two zones to function.*/
+    BUILD_BUG_ON(NR_ZONES < 2);
+}
+
 unsigned long domain_adjust_tot_pages(struct domain *d, long pages)
 {
     long dom_before, dom_after, dom_claimed, sys_before, sys_after;
@@ -2340,8 +2346,9 @@ struct page_info *alloc_domheap_pages(
 
     bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
                                       bits ? : (BITS_PER_LONG+PAGE_SHIFT));
-    if ( (zone_hi = min_t(unsigned int, bits_to_zone(bits), zone_hi)) == 0 )
-        return NULL;
+
+    zone_hi = min_t(unsigned int, bits_to_zone(bits), zone_hi);
+    ASSERT(zone_hi != 0);
 
     if ( memflags & MEMF_no_owner )
         memflags |= MEMF_no_refcount;
-- 
2.17.1


