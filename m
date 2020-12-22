Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D63C2E0CDA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 16:44:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57962.101666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjpD-0006fd-Eo; Tue, 22 Dec 2020 15:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57962.101666; Tue, 22 Dec 2020 15:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krjpD-0006ed-9l; Tue, 22 Dec 2020 15:43:47 +0000
Received: by outflank-mailman (input) for mailman id 57962;
 Tue, 22 Dec 2020 15:43:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krjpB-0006cH-8H
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 15:43:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krjpA-0001pv-Q2; Tue, 22 Dec 2020 15:43:44 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krjpA-0002Vd-Gp; Tue, 22 Dec 2020 15:43:44 +0000
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
	 bh=kSPSsNxqjRsah0K2F/khe3S48PU9Vn+ea2ql+1qJVow=; b=u7zwD9TpUghLdk5/4t796dN7R
	OOEKsJTI9epORlTXPMuVoXxnmmbIjmRfUdkldFMZAy9GA+ZhknOA4hcvMVw4n4cUV2qqawv7dMhOd
	Of74k7GR4v8G7Rb07S7LfRq8ISeZ5tbsc5hBO8WlTOoK7umNxl8HSn0bLLoh193yGWF7c=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.15 3/4] [RFC] xen/iommu: x86: Clear the root page-table before freeing the page-tables
Date: Tue, 22 Dec 2020 15:43:37 +0000
Message-Id: <20201222154338.9459-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222154338.9459-1-julien@xen.org>
References: <20201222154338.9459-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The new per-domain IOMMU page-table allocator will now free the
page-tables when domain's resources are relinquished. However, the root
page-table (i.e. hd->arch.pg_maddr) will not be cleared.

Xen may access the IOMMU page-tables afterwards at least in the case of
PV domain:

(XEN) Xen call trace:
(XEN)    [<ffff82d04025b4b2>] R iommu.c#addr_to_dma_page_maddr+0x12e/0x1d8
(XEN)    [<ffff82d04025b695>] F iommu.c#intel_iommu_unmap_page+0x5d/0xf8
(XEN)    [<ffff82d0402695f3>] F iommu_unmap+0x9c/0x129
(XEN)    [<ffff82d0402696a6>] F iommu_legacy_unmap+0x26/0x63
(XEN)    [<ffff82d04033c5c7>] F mm.c#cleanup_page_mappings+0x139/0x144
(XEN)    [<ffff82d04033c61d>] F put_page+0x4b/0xb3
(XEN)    [<ffff82d04033c87f>] F put_page_from_l1e+0x136/0x13b
(XEN)    [<ffff82d04033cada>] F devalidate_page+0x256/0x8dc
(XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
(XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
(XEN)    [<ffff82d04033d8d6>] F mm.c#put_page_from_l2e+0x8a/0xcf
(XEN)    [<ffff82d04033cc27>] F devalidate_page+0x3a3/0x8dc
(XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
(XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
(XEN)    [<ffff82d04033d807>] F mm.c#put_page_from_l3e+0x8a/0xcf
(XEN)    [<ffff82d04033cdf0>] F devalidate_page+0x56c/0x8dc
(XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
(XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
(XEN)    [<ffff82d04033d6c7>] F mm.c#put_page_from_l4e+0x69/0x6d
(XEN)    [<ffff82d04033cf24>] F devalidate_page+0x6a0/0x8dc
(XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
(XEN)    [<ffff82d04033d92e>] F put_page_type_preemptible+0x13/0x15
(XEN)    [<ffff82d04032598a>] F domain.c#relinquish_memory+0x1ff/0x4e9
(XEN)    [<ffff82d0403295f2>] F domain_relinquish_resources+0x2b6/0x36a
(XEN)    [<ffff82d040205cdf>] F domain_kill+0xb8/0x141
(XEN)    [<ffff82d040236cac>] F do_domctl+0xb6f/0x18e5
(XEN)    [<ffff82d04031d098>] F pv_hypercall+0x2f0/0x55f
(XEN)    [<ffff82d04039b432>] F lstar_enter+0x112/0x120

This will result to a use after-free and possibly an host crash or
memory corruption.

Freeing the page-tables further down in domain_relinquish_resources()
would not work because pages may not be released until later if another
domain hold a reference on them.

Once all the PCI devices have been de-assigned, it is actually pointless
to access modify the IOMMU page-tables. So we can simply clear the root
page-table address.

Fixes: 3eef6d07d722 ("x86/iommu: convert VT-d code to use new page table allocator")
Signed-off-by: Julien Grall <jgrall@amazon.com>

---

This is an RFC because it would break AMD IOMMU driver. One option would
be to move the call to the teardown callback earlier on. Any opinions?
---
 xen/drivers/passthrough/x86/iommu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 779dbb5b98ba..99a23177b3d2 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -267,6 +267,16 @@ int iommu_free_pgtables(struct domain *d)
     struct page_info *pg;
     unsigned int done = 0;
 
+    /*
+     * Pages will be moved to the free list in a bit. So we want to
+     * clear the root page-table to avoid any potential use after-free.
+     *
+     * XXX: This only code works for Intel vT-D.
+     */
+    spin_lock(&hd->arch.mapping_lock);
+    hd->arch.vtd.pgd_maddr = 0;
+    spin_unlock(&hd->arch.mapping_lock);
+
     spin_lock(&hd->arch.pgtables.lock);
     while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
     {
-- 
2.17.1


