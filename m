Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D28DE5765A0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368356.599599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOin-0002na-DR; Fri, 15 Jul 2022 17:03:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368356.599599; Fri, 15 Jul 2022 17:03:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOin-0002kh-9g; Fri, 15 Jul 2022 17:03:21 +0000
Received: by outflank-mailman (input) for mailman id 368356;
 Fri, 15 Jul 2022 17:03:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCOil-0002V9-8x
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:03:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOil-0001Ep-04; Fri, 15 Jul 2022 17:03:19 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOik-0007gg-OO; Fri, 15 Jul 2022 17:03:18 +0000
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
	bh=8L8GaWN4JsHGX2p2Nk+ZEuevrv2pgtM1BqqTvQho3HU=; b=oIFyXXGVlvAjFNf6w0dtHA7myt
	IoggkwA7PiN1xkHSZzMzs3+FqFapQYFRpXAWCZJAcuPAZq1W5AYHrL10A8GVPu109C3ahP4jQNG+T
	Asse8pCVipotB0F+W2EWTyipZwHXPtf/IesJ4GKoNDHebe6sGEpqUpyNxU/H7deNrEYk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/3] xen: page_alloc: Don't open-code IS_ALIGNED()
Date: Fri, 15 Jul 2022 18:03:10 +0100
Message-Id: <20220715170312.13931-2-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220715170312.13931-1-julien@xen.org>
References: <20220715170312.13931-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

init_heap_pages() is using an open-code version of IS_ALIGNED(). Replace
it to improve the readability of the code.

No functional change intended.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Changes in v2:
    - Patch added
---
 xen/common/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index fe0e15429af3..078c2990041d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1823,7 +1823,7 @@ static void init_heap_pages(
             unsigned long s = mfn_x(page_to_mfn(pg + i));
             unsigned long e = mfn_x(mfn_add(page_to_mfn(pg + nr_pages - 1), 1));
             bool use_tail = (nid == phys_to_nid(pfn_to_paddr(e - 1))) &&
-                            !(s & ((1UL << MAX_ORDER) - 1)) &&
+                            IS_ALIGNED(s, 1UL << MAX_ORDER) &&
                             (find_first_set_bit(e) <= find_first_set_bit(s));
             unsigned long n;
 
-- 
2.32.0


