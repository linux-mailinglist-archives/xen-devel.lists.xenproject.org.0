Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C7064EADC
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 12:49:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464434.722889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69DB-0005Rz-PK; Fri, 16 Dec 2022 11:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464434.722889; Fri, 16 Dec 2022 11:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69DB-0005MW-CH; Fri, 16 Dec 2022 11:49:09 +0000
Received: by outflank-mailman (input) for mailman id 464434;
 Fri, 16 Dec 2022 11:49:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69D9-0004u8-Fl
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 11:49:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D9-0002Er-E8; Fri, 16 Dec 2022 11:49:07 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69D9-0004sN-6k; Fri, 16 Dec 2022 11:49:07 +0000
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
	bh=vmtNA9XdH0srZ9asaGnjFiuLx3yBtd0BVtqXIukQgjM=; b=SUa3z5qrtpvwTyqxU4268rECt/
	19/D/bc/kCdXMUWX4leTRpnP8ZIRVdrg+c0wyUEWzO4e01rpd3ocb58eTi0CIcxumiM/fF0YWiub2
	bRuT7xnU51KnTe1WDHfThSfMNJSBM/D9tJmjWmL+WcPOSEKJq2t4N1gUDMIuuMFD2oA0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Wei Liu <wei.liu2@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Wei Wang <wawei@amazon.de>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH 07/22] x86/pv: domheap pages should be mapped while relocating initrd
Date: Fri, 16 Dec 2022 11:48:38 +0000
Message-Id: <20221216114853.8227-8-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216114853.8227-1-julien@xen.org>
References: <20221216114853.8227-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Liu <wei.liu2@citrix.com>

Xen shouldn't use domheap page as if they were xenheap pages. Map and
unmap pages accordingly.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Wei Wang <wawei@amazon.de>
Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    Changes since Hongyan's version:
        * Add missing newline after the variable declaration
---
 xen/arch/x86/pv/dom0_build.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index a62f0fa2ef29..c837b2d96f89 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -611,18 +611,32 @@ int __init dom0_construct_pv(struct domain *d,
         if ( d->arch.physaddr_bitsize &&
              ((mfn + count - 1) >> (d->arch.physaddr_bitsize - PAGE_SHIFT)) )
         {
+            unsigned long nr_pages;
+            unsigned long len = initrd_len;
+
             order = get_order_from_pages(count);
             page = alloc_domheap_pages(d, order, MEMF_no_scrub);
             if ( !page )
                 panic("Not enough RAM for domain 0 initrd\n");
+
+            nr_pages = 1UL << order;
             for ( count = -count; order--; )
                 if ( count & (1UL << order) )
                 {
                     free_domheap_pages(page, order);
                     page += 1UL << order;
+                    nr_pages -= 1UL << order;
                 }
-            memcpy(page_to_virt(page), mfn_to_virt(initrd->mod_start),
-                   initrd_len);
+
+            for ( i = 0; i < nr_pages; i++, len -= PAGE_SIZE )
+            {
+                void *p = __map_domain_page(page + i);
+
+                memcpy(p, mfn_to_virt(initrd_mfn + i),
+                       min(len, (unsigned long)PAGE_SIZE));
+                unmap_domain_page(p);
+            }
+
             mpt_alloc = (paddr_t)initrd->mod_start << PAGE_SHIFT;
             init_domheap_pages(mpt_alloc,
                                mpt_alloc + PAGE_ALIGN(initrd_len));
-- 
2.38.1


