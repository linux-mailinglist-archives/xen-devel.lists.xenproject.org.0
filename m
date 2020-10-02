Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FACE281241
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 14:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2015.6000 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOK58-0001Fs-5T; Fri, 02 Oct 2020 12:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2015.6000; Fri, 02 Oct 2020 12:22:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOK58-0001FL-1E; Fri, 02 Oct 2020 12:22:38 +0000
Received: by outflank-mailman (input) for mailman id 2015;
 Fri, 02 Oct 2020 12:22:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wm18=DJ=casper.srs.infradead.org=batv+27a5ecbc8e1e54150000+6249+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kOK56-00017n-AK
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:22:36 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bda441c-bf52-4162-be6f-03adaa8d9a51;
 Fri, 02 Oct 2020 12:22:25 +0000 (UTC)
Received: from [2001:4bb8:180:7b62:f738:1861:1acc:15c8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOK4h-0003Kw-HE; Fri, 02 Oct 2020 12:22:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Wm18=DJ=casper.srs.infradead.org=batv+27a5ecbc8e1e54150000+6249+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kOK56-00017n-AK
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:22:36 +0000
X-Inumbo-ID: 7bda441c-bf52-4162-be6f-03adaa8d9a51
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7bda441c-bf52-4162-be6f-03adaa8d9a51;
	Fri, 02 Oct 2020 12:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/d6+Dk3KKsbjd+NK9IaRJO1MZ62p/5JmeyWovJ8r20c=; b=CwHiRIYoh86oLfT/E7Hp6PlAXn
	orneAaYjAGFE5y7mA+d1X4uG3djweEapj8WoFYECeAJwsEW7kqTUhv/7X6Cxi4VXQqnhsZK6xA4iG
	z0i0gVSNX4dhHQRq1mS97BxZRRMmWtUjIsKZl3cHjILQLLgcM+qyqasKpJ8OkRF+TMmebC6MB2b4q
	aSpnR/qzjMeFBmuZQ3BxBaHDmIP4RRFFvbNmwYunJ5/JDM1a7UjbmMd6OlyGEDVf1vpMpQJrsymWx
	aPexCjXV64HyyK3H2T4hCNQ3yO9v52ScOVGEBxP4zFAnbZbGyzlMIdkPbA8QzzziWEjPWem3uhkF+
	iFNoe1Ug==;
Received: from [2001:4bb8:180:7b62:f738:1861:1acc:15c8] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOK4h-0003Kw-HE; Fri, 02 Oct 2020 12:22:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Matthew Auld <matthew.auld@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Minchan Kim <minchan@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Nitin Gupta <ngupta@vflare.org>,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: [PATCH 04/11] mm: allow a NULL fn callback in apply_to_page_range
Date: Fri,  2 Oct 2020 14:21:57 +0200
Message-Id: <20201002122204.1534411-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201002122204.1534411-1-hch@lst.de>
References: <20201002122204.1534411-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Besides calling the callback on each page, apply_to_page_range also has
the effect of pre-faulting all PTEs for the range.  To support callers
that only need the pre-faulting, make the callback optional.

Based on a patch from Minchan Kim <minchan@kernel.org>.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/memory.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index fcfc4ca36eba80..dcf2bb69fbf847 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2420,13 +2420,15 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 
 	arch_enter_lazy_mmu_mode();
 
-	do {
-		if (create || !pte_none(*pte)) {
-			err = fn(pte++, addr, data);
-			if (err)
-				break;
-		}
-	} while (addr += PAGE_SIZE, addr != end);
+	if (fn) {
+		do {
+			if (create || !pte_none(*pte)) {
+				err = fn(pte++, addr, data);
+				if (err)
+					break;
+			}
+		} while (addr += PAGE_SIZE, addr != end);
+	}
 	*mask |= PGTBL_PTE_MODIFIED;
 
 	arch_leave_lazy_mmu_mode();
-- 
2.28.0


