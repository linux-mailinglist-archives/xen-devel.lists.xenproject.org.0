Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14F2366E56
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 16:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114737.218698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDxm-0004wv-P8; Wed, 21 Apr 2021 14:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114737.218698; Wed, 21 Apr 2021 14:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZDxm-0004wW-LT; Wed, 21 Apr 2021 14:36:22 +0000
Received: by outflank-mailman (input) for mailman id 114737;
 Wed, 21 Apr 2021 14:36:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1lZDxk-0004wC-W5
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 14:36:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDxk-0001QR-Km; Wed, 21 Apr 2021 14:36:20 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ua82172827c7b5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1lZDeE-00045m-Cc; Wed, 21 Apr 2021 14:16:10 +0000
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
	s=20200302mail; h=References:In-Reply-To:References:In-Reply-To:Message-Id:
	Date:Subject:Cc:To:From; bh=AC45yiomZKQ6k5JSnBJ7cYzYUAf7Pz4JgaGVf71UzCw=; b=q
	9fcs0VBcq24AbXYCp5y0THWQagtIuCe22ydVxGRjQF5rbCyT+BDPXsR/uVz8Av9WCCIB5O68Lohzk
	zVwRRpP6irkvMaM5tBS0GS0tsik8fX0GZlxO+oEQMrcONIlFbTihiKY6Yl2+hPt8wUJhJMhFFiP8S
	7VQ/72+DpD8kZ34c=;
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Cc: jgrall@amazon.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 12/13] x86: switch to use domheap page for page tables
Date: Wed, 21 Apr 2021 15:15:40 +0100
Message-Id: <8c71fb3f40942030ceb101fba9b1a848686069e3.1619014052.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1619014052.git.hongyxia@amazon.com>
References: <cover.1619014052.git.hongyxia@amazon.com>
In-Reply-To: <cover.1619014052.git.hongyxia@amazon.com>
References: <cover.1619014052.git.hongyxia@amazon.com>

From: Hongyan Xia <hongyxia@amazon.com>

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
Changed in v8:
- const qualify pg in alloc_xen_pagetable_new().
---
 xen/arch/x86/mm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index bf86ba3729aa..604f83c3837e 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4901,10 +4901,10 @@ mfn_t alloc_xen_pagetable_new(void)
 {
     if ( system_state != SYS_STATE_early_boot )
     {
-        void *ptr = alloc_xenheap_page();
+        const struct page_info *pg = alloc_domheap_page(NULL, 0);
 
-        BUG_ON(!hardware_domain && !ptr);
-        return ptr ? virt_to_mfn(ptr) : INVALID_MFN;
+        BUG_ON(!hardware_domain && !pg);
+        return pg ? page_to_mfn(pg) : INVALID_MFN;
     }
 
     return alloc_boot_pages(1, 1);
@@ -4914,7 +4914,7 @@ mfn_t alloc_xen_pagetable_new(void)
 void free_xen_pagetable_new(mfn_t mfn)
 {
     if ( system_state != SYS_STATE_early_boot && !mfn_eq(mfn, INVALID_MFN) )
-        free_xenheap_page(mfn_to_virt(mfn_x(mfn)));
+        free_domheap_page(mfn_to_page(mfn));
 }
 
 void *alloc_mapped_pagetable(mfn_t *pmfn)
-- 
2.23.4


