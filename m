Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD560171E
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 21:13:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424561.672096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okVY0-0002vI-8t; Mon, 17 Oct 2022 19:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424561.672096; Mon, 17 Oct 2022 19:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okVY0-0002tN-5r; Mon, 17 Oct 2022 19:13:12 +0000
Received: by outflank-mailman (input) for mailman id 424561;
 Mon, 17 Oct 2022 19:13:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/1i=2S=citrix.com=prvs=2822150b0=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1okVXy-0002HE-Qw
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 19:13:10 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc0341f8-4e4f-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 21:13:09 +0200 (CEST)
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
X-Inumbo-ID: bc0341f8-4e4f-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666033989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=zg8npnhOVrxpSfiRTibSjk6fhmpTfF4qsEdQGzlDU0g=;
  b=bw48FFOOVtoT6llrXOBKc300kDCiTK0ZA4d7mKBbt7u1kKoRRyTmNQrV
   O08vt2K5QLU3+5BfmCyk5oajc8E91EVBZbaX9WI1xOLfm88VQRmjKu0oM
   Rmu1/dNjKnlDvibA74G9XSPOx4U1BRyEMKfWVKD1hmZ9JqJBbN/Zdk4lO
   A=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 82918898
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:58o5TKuhagTXl6UGUPTi3QI+9efnVLNeMUV32f8akzHdYApBsoF/q
 tZmKW3VPPjbN2ajL9wgPI+/pk4EvZ/VnIdlGlNtrH0yE3lB+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPakU5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklO8
 tAyGjoLTyrYjsmk2e2dUvhRvZs8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGM0Yn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZUPzx/I9
 jOWl4j/Ki84JYGlmR/Yy261pMLRkxKlc6IbRaLto5aGh3XMnzdOWXX6T2CTn/69jUKvXsNFH
 GYd8CEusKsa+VSiS5/2WBjQiF6JuAQNHeVZFeIS4RuIjKHT5m6xDGUeUiRIbtBgscYsXCErz
 XeAhdavDjtq2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZs14DKe/g9nxGDfx6
 zOHti4zg/MUl8Fj/6em+VHKhRq8q56PSRQ6jjg7RUr8sFk/PtT8IdX1tx6Ltp6sMbp1UHGBu
 1QuqcKYzdpVBLqfjXOrWPQwJ+62sqPt3CLnvXZjGJwo9jKI8nGlfJxN7DwWGHqFIvroaheyP
 haN5Fo5CIt7eSLzMPQpO97Z59ECl/CIKDjzahzDgjOiiLBVfRTPwixhbFX4M4vFwBl1yvFX1
 Xt2nK+R4Zcm5UZPlmbeqwQ1i+VDKsUCKYT7HMmT8vhf+eDCDEN5sJ9cWLd0Usg37bmfvCLe+
 MtFOs2Bxn13CbOgP3iLrNNNcQxXcRDX4KwaTOQOLIa+zvdOQjl9W5c9P5t7E2Cao0ilvriRp
 SzsMqOp4FH+mWfGOW23V5yXU5u2BcwXhStiZUQEZA/4s0XPlK7ytc/zgbNsJuJ5nAGipNYpJ
 8Q4lzKoWKwSE2uYpmVMN/EQbuVKLXyWuO5HBAL9CBBXQnKqb1ahFgPMFuc3yBQzMw==
IronPort-HdrOrdr: A9a23:rb2NaK/REOfo9q74cWZuk+DQI+orL9Y04lQ7vn2YSXRuE/Bw9v
 re+sjzuiWE6wr5NEtOpTniAtjmfZq/z+8W3WB5B97LN2OK1FdARLsSibcKqAeBJ8SRzIBgPN
 9bAs1DNOE=
X-IronPort-AV: E=Sophos;i="5.95,192,1661832000"; 
   d="scan'208";a="82918898"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in arch_domain_create()
Date: Mon, 17 Oct 2022 20:12:37 +0100
Message-ID: <20221017191237.11079-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20221017191237.11079-1-andrew.cooper3@citrix.com>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Henry Wang <Henry.Wang@arm.com>

The XSA-409 fixes discovered that the GICv2 path tries to create P2M mappings
in the domain_create() path.  This fails, as the P2M pool is empty before a
XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION hypercall.

As a stopgap, automatically give domains 16 pages of P2M memory.  This is
large enough to allow the GICv2 case to work, but small enough to not
introduce a continuation worry.

A consequence is that, for later error paths domain_create(), we end up in
p2m_final_teardown() with a nonzero P2M pool.  Such a domain has no vCPUs, and
has never been scheduled, so free the memory directly.

Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M pool")
Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Henry Wang <Henry.Wang@arm.com>
---
 xen/arch/arm/p2m.c | 43 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 6826f6315080..76a0e31c6c8c 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1736,8 +1736,36 @@ void p2m_final_teardown(struct domain *d)
     if ( !p2m->domain )
         return;
 
-    ASSERT(page_list_empty(&p2m->pages));
-    ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
+    /*
+     * On the domain_create() error path only, we can end up here with a
+     * non-zero P2M pool.
+     *
+     * At present, this is a maximum of 16 pages, spread between p2m->pages
+     * and the free list.  The domain has never been scheduled (it has no
+     * vcpus), so there is TLB maintenance to perform; just free everything.
+     */
+    if ( !page_list_empty(&p2m->pages) ||
+         !page_list_empty(&d->arch.paging.p2m_freelist) )
+    {
+        struct page_info *pg;
+
+        /*
+         * There's no sensible "in the domain_create() error path" predicate,
+         * so simply sanity check that we don't have unexpected work to do.
+         */
+        ASSERT(d->arch.paging.p2m_total_pages <= 16);
+
+        spin_lock(&d->arch.paging.lock);
+
+        while ( (pg = page_list_remove_head(&p2m->pages)) )
+            free_domheap_page(pg);
+        while ( (pg = page_list_remove_head(&d->arch.paging.p2m_freelist)) )
+            free_domheap_page(pg);
+
+        d->arch.paging.p2m_total_pages = 0;
+
+        spin_unlock(&d->arch.paging.lock);
+    }
 
     if ( p2m->root )
         free_domheap_pages(p2m->root, P2M_ROOT_ORDER);
@@ -1803,6 +1831,17 @@ int p2m_init(struct domain *d)
     if ( rc )
         return rc;
 
+    /*
+     * Hardware using GICv2 wants to create an 8KB MMIO mapping during
+     * domain_create(), which requires some P2M pagetables.  Allocate 16 page
+     * which is good enough for now.
+     */
+    spin_lock(&d->arch.paging.lock);
+    rc = p2m_set_allocation(d, 16, NULL);
+    spin_unlock(&d->arch.paging.lock);
+    if ( rc )
+        return rc;
+
     return 0;
 }
 
-- 
2.11.0


