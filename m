Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D2C293DCE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 15:53:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9636.25300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUs4V-0007XW-Lf; Tue, 20 Oct 2020 13:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9636.25300; Tue, 20 Oct 2020 13:53:03 +0000
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
	id 1kUs4V-0007X7-IM; Tue, 20 Oct 2020 13:53:03 +0000
Received: by outflank-mailman (input) for mailman id 9636;
 Tue, 20 Oct 2020 13:53:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUs4U-0007X2-Oy
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:53:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6eaa1f2-b3da-41c5-b272-ccffa42e1654;
 Tue, 20 Oct 2020 13:53:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C6C9BB2A1;
 Tue, 20 Oct 2020 13:53:00 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=oMcx=D3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUs4U-0007X2-Oy
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 13:53:02 +0000
X-Inumbo-ID: c6eaa1f2-b3da-41c5-b272-ccffa42e1654
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c6eaa1f2-b3da-41c5-b272-ccffa42e1654;
	Tue, 20 Oct 2020 13:53:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603201980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qw9DdLlTTRCZ41LkBf5W6P/I4UyBKlxJ/5Koa8Aym5M=;
	b=uD9eaGvggrXjd/5iMNhKtudPbBweYTK0gPxxaRBPCvGy2CItogPjgsU+H0cmg3u8Cc0m07
	fwQADUANEXGICwgJ1pE7TLBs2o6hnhiYsHXHmmJ4nrYd8ajasCaw/JW/HdCVvZ99AQ3m7Z
	BstQu+kh/GBTP8KHEmjAhsObnFApJbw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C6C9BB2A1;
	Tue, 20 Oct 2020 13:53:00 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Paul Durrant <paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] IOMMU: avoid double flushing in shared page table case
Message-ID: <e54f4fbb-92e2-9785-8648-596c615213a2@suse.com>
Date: Tue, 20 Oct 2020 15:52:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While the flush coalescing optimization has been helping the non-shared
case, it has actually lead to double flushes in the shared case (which
ought to be the more common one nowadays at least): Once from
*_set_entry() and a second time up the call tree from wherever the
overriding flag gets played with. In alignment with XSA-346 suppress
flushing in this case.

Similarly avoid excessive setting of IOMMU_FLUSHF_added on the batched
flushes: "idx" hasn't been added a new mapping for.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: The Arm part really is just for completeness (and hence could also
     be dropped) - the affected mapping spaces aren't currently
     supported there.

--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -1045,7 +1045,7 @@ static int __p2m_set_entry(struct p2m_do
         p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, sgfn);
     }
 
-    if ( is_iommu_enabled(p2m->domain) &&
+    if ( is_iommu_enabled(p2m->domain) && !this_cpu(iommu_dont_flush_iotlb) &&
          (lpae_is_valid(orig_pte) || lpae_is_valid(*entry)) )
     {
         unsigned int flush_flags = 0;
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -842,7 +842,7 @@ out:
     if ( rc == 0 && p2m_is_hostp2m(p2m) &&
          need_modify_vtd_table )
     {
-        if ( iommu_use_hap_pt(d) )
+        if ( iommu_use_hap_pt(d) && !this_cpu(iommu_dont_flush_iotlb) )
             rc = iommu_iotlb_flush(d, _dfn(gfn), 1ul << order,
                                    (iommu_flags ? IOMMU_FLUSHF_added : 0) |
                                    (vtd_pte_present ? IOMMU_FLUSHF_modified
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -870,7 +870,7 @@ int xenmem_add_to_physmap(struct domain
         this_cpu(iommu_dont_flush_iotlb) = 0;
 
         ret = iommu_iotlb_flush(d, _dfn(xatp->idx - done), done,
-                                IOMMU_FLUSHF_added | IOMMU_FLUSHF_modified);
+                                IOMMU_FLUSHF_modified);
         if ( unlikely(ret) && rc >= 0 )
             rc = ret;
 

