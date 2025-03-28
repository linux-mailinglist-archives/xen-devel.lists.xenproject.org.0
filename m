Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F35A7461D
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 10:14:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930368.1333060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5mp-0002wo-5K; Fri, 28 Mar 2025 09:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930368.1333060; Fri, 28 Mar 2025 09:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5mo-0002pz-UH; Fri, 28 Mar 2025 09:13:58 +0000
Received: by outflank-mailman (input) for mailman id 930368;
 Fri, 28 Mar 2025 09:13:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HHkx=WP=li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1ty5mn-0001o1-55
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 09:13:57 +0000
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [2a02:8070:a484:e780::f9cd])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6f2a26d-0bb4-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 10:13:52 +0100 (CET)
Received: from agordeev by li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com
 with local (Exim 4.98.1)
 (envelope-from <agordeev@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>)
 id 1ty5mY-00000001t9f-1ee8; Fri, 28 Mar 2025 10:13:42 +0100
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
X-Inumbo-ID: f6f2a26d-0bb4-11f0-9ffa-bf95429c2676
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Juergen Gross <jgross@suse.com>,
	Jeremy Fitzhardinge <jeremy@goop.org>
Subject: [PATCH 1/4] kasan: Avoid sleepable page allocation from atomic context
Date: Fri, 28 Mar 2025 10:13:39 +0100
Message-ID: <abb5783484bf9fbeeff0d866b9a619306f415c37.1743079720.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1743079720.git.agordeev@linux.ibm.com>
References: <cover.1743079720.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Alexander Gordeev <agordeev@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>

apply_to_page_range() enters lazy MMU mode and then invokes
kasan_populate_vmalloc_pte() callback on each page table walk
iteration. The lazy MMU mode may only be entered only under
protection of the page table lock. However, the callback can
go into sleep when trying to allocate a single page.

Change __get_free_page() allocation mode from GFP_KERNEL to
GFP_ATOMIC to avoid scheduling out while in atomic context.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 mm/kasan/shadow.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index 88d1c9dcb507..edfa77959474 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -301,7 +301,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	if (likely(!pte_none(ptep_get(ptep))))
 		return 0;
 
-	page = __get_free_page(GFP_KERNEL);
+	page = __get_free_page(GFP_ATOMIC);
 	if (!page)
 		return -ENOMEM;
 
-- 
2.45.2


