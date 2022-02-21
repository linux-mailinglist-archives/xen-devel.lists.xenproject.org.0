Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B579D4BD911
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275992.472057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pv-0005Z1-1E; Mon, 21 Feb 2022 10:22:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275992.472057; Mon, 21 Feb 2022 10:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pu-0005UD-JV; Mon, 21 Feb 2022 10:22:30 +0000
Received: by outflank-mailman (input) for mailman id 275992;
 Mon, 21 Feb 2022 10:22:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM5pt-0005K5-3e
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:22:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5ps-0002Bb-VA; Mon, 21 Feb 2022 10:22:28 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5ps-00070b-Nq; Mon, 21 Feb 2022 10:22:28 +0000
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
	bh=0n6etsYqo9bTpW5hKB66bUfArotdLsp5P4nlJNvCktk=; b=hpgsGAWjKmB3nCSgB72nz6fMpj
	r5/GlFDET7YiB2drOVybCDihBpbWM3SlDyrUqXpruffX2XpjwkPE6cv4hWqvOVQCUIxsTt7LGN+38
	362aFG77G5lHwua6lUDhpNwJ3AxG30RyARIlXYyQuB4XK18ZGjEAJ6805oSnkYXwQdY8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 06/19] xen/arm: mm: Avoid flushing the TLBs when mapping are inserted
Date: Mon, 21 Feb 2022 10:22:05 +0000
Message-Id: <20220221102218.33785-7-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Currently, the function xen_pt_update() will flush the TLBs even when
the mappings are inserted. This is a bit wasteful because we don't
allow mapping replacement. Even if we were, the flush would need to
happen earlier because mapping replacement should use Break-Before-Make
when updating the entry.

A single call to xen_pt_update() can perform a single action. IOW, it
is not possible to, for instance, mix inserting and removing mappings.
Therefore, we can use `flags` to determine what action is performed.

This change will be particularly help to limit the impact of switching
boot time mapping to use xen_pt_update().

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch
---
 xen/arch/arm/mm.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index fd16c1541ce2..7b4b9de8693e 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1104,7 +1104,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
         /* We should be here with a valid MFN. */
         ASSERT(!mfn_eq(mfn, INVALID_MFN));
 
-        /* We don't allow replacing any valid entry. */
+        /*
+         * We don't allow replacing any valid entry.
+         *
+         * Note that the function xen_pt_update() relies on this
+         * assumption and will skip the TLB flush. The function will need
+         * to be updated if the check is relaxed.
+         */
         if ( lpae_is_valid(entry) )
         {
             if ( lpae_is_mapping(entry, level) )
@@ -1417,11 +1423,16 @@ static int xen_pt_update(unsigned long virt,
     }
 
     /*
-     * Flush the TLBs even in case of failure because we may have
+     * The TLBs flush can be safely skipped when a mapping is inserted
+     * as we don't allow mapping replacement (see xen_pt_check_entry()).
+     *
+     * For all the other cases, the TLBs will be flushed unconditionally
+     * even if the mapping has failed. This is because we may have
      * partially modified the PT. This will prevent any unexpected
      * behavior afterwards.
      */
-    flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
+    if ( !(flags & _PAGE_PRESENT) || mfn_eq(mfn, INVALID_MFN) )
+        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
 
     spin_unlock(&xen_pt_lock);
 
-- 
2.32.0


