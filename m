Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B373273161
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 20:02:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKQ8w-0003L2-H8; Mon, 21 Sep 2020 18:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wcPU=C6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKQ8v-0003Kh-4J
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 18:02:25 +0000
X-Inumbo-ID: 93cad2df-20a6-4767-ab87-053150edfa14
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93cad2df-20a6-4767-ab87-053150edfa14;
 Mon, 21 Sep 2020 18:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=33YMzmUbMY7znlTscUrVDIV5v+7zwKEarD370yVOPcw=; b=h+IcmBbvaNkXB9xBBoZRedXf6
 k2XXdOwnFbHQV/J49RTpKC9mCw5L6bAiaGFYIzLefJ/mCGhuPjqxz3KwwpGMAdejqqAa4xyItp0Kn
 46VNWhvyeOH6FIdvajpKzcyQwdSBDcZvMZI6ZKwjqbNaGmMp4DOEFZxgeuKq5hOEX+6f4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQ8s-000871-Ff; Mon, 21 Sep 2020 18:02:22 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQ8s-0003uk-6L; Mon, 21 Sep 2020 18:02:22 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v4 1/4] xen: XENMEM_exchange should only be used/compiled for
 arch supporting PV guest
Date: Mon, 21 Sep 2020 19:02:11 +0100
Message-Id: <20200921180214.4842-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921180214.4842-1-julien@xen.org>
References: <20200921180214.4842-1-julien@xen.org>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

XENMEM_exchange can only be used by PV guest but the check is well
hidden in steal_page(). This is because paging_model_external() will
return false only for PV domain.

To make clearer this is PV only, add a check at the beginning of the
implementation. Take the opportunity to compile out the code if
CONFIG_PV is not set.

This change will also help a follow-up patch where the gmfn_mfn() will
be completely removed on arch not supporting the M2P.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Jan suggested to #ifdef anything after the check to is_pv_domain().
However, it means to have two block of #ifdef as we can't mix
declaration and code.

I am actually thinking to move the implementation outside of mm.c in
possibly arch/x86 or a pv specific directory under common. Any opinion?

    Changes in v4:
        - Patch added
---
 xen/common/memory.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/memory.c b/xen/common/memory.c
index 714077c1e597..9300104943b0 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -504,6 +504,7 @@ static bool propagate_node(unsigned int xmf, unsigned int *memflags)
 
 static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
 {
+#ifdef CONFIG_PV
     struct xen_memory_exchange exch;
     PAGE_LIST_HEAD(in_chunk_list);
     PAGE_LIST_HEAD(out_chunk_list);
@@ -516,6 +517,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
     struct domain *d;
     struct page_info *page;
 
+    if ( !is_pv_domain(d) )
+        return -EOPNOTSUPP;
+
     if ( copy_from_guest(&exch, arg, 1) )
         return -EFAULT;
 
@@ -797,6 +801,9 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
     if ( __copy_field_to_guest(arg, &exch, nr_exchanged) )
         rc = -EFAULT;
     return rc;
+#else /* !CONFIG_PV */
+    return -EOPNOTSUPP;
+#endif
 }
 
 int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
-- 
2.17.1


