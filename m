Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAAF2347B5
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 16:26:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1VzD-00046v-69; Fri, 31 Jul 2020 14:26:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S/xS=BK=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k1VzB-00045J-PE
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 14:26:13 +0000
X-Inumbo-ID: c63e343d-d339-11ea-abc3-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c63e343d-d339-11ea-abc3-12813bfff9fa;
 Fri, 31 Jul 2020 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ELqKaNJTQk3GSaeAGwge8h9gTL67LFvh82JALfJSP0=; b=bMipD4w6/T3x8nE1XEd3g37i7P
 x3fT0nfXiTGnbgsZOkLavc7KNBcEbHJrr4n3T5aiU/H6ltMXfoo5hLqjiCe5WS1eBHat5B6Uu1NKA
 ye9Kq7Kb6SmmC70x1dhXS8tq64LvBDx+42ir3a3jQWkopBYcNKzJLHfuqxG5skJY/gqE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1Vz6-0003Zz-E8; Fri, 31 Jul 2020 14:26:08 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1Vz6-0005vI-6D; Fri, 31 Jul 2020 14:26:08 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 1/2] x86/hvm: set 'ipat' in EPT for special pages
Date: Fri, 31 Jul 2020 15:26:03 +0100
Message-Id: <20200731142604.30149-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200731142604.30149-1-paul@xen.org>
References: <20200731142604.30149-1-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

All non-MMIO ranges (i.e those not mapping real device MMIO regions) that
map valid MFNs are normally marked MTRR_TYPE_WRBACK and 'ipat' is set. Hence
when PV drivers running in a guest populate the BAR space of the Xen Platform
PCI Device with pages such as the Shared Info page or Grant Table pages,
accesses to these pages will be cachable.

However, should IOMMU mappings be enabled be enabled for the guest then these
accesses become uncachable. This has a substantial negative effect on I/O
throughput of PV devices. Arguably PV drivers should bot be using BAR space to
host the Shared Info and Grant Table pages but it is currently commonplace for
them to do this and so this problem needs mitigation. Hence this patch makes
sure the 'ipat' bit is set for any special page regardless of where in GFN
space it is mapped.

NOTE: Clearly this mitigation only applies to Intel EPT. It is not obvious
      that there is any similar mitigation possible for AMD NPT. Downstreams
      such as Citrix XenServer have been carrying a patch similar to this for
      several releases though.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>

v3:
 - dropping Jan's R-b
 - cope with order > 0
---
 xen/arch/x86/hvm/mtrr.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 511c3be1c8..26721f6ee7 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -836,6 +836,17 @@ int epte_get_entry_emt(struct domain *d, unsigned long gfn, mfn_t mfn,
         return MTRR_TYPE_WRBACK;
     }
 
+    for ( i = 0; i < (1ul << order); i++ )
+    {
+        if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
+        {
+            if ( order )
+                return -1;
+            *ipat = 1;
+            return MTRR_TYPE_WRBACK;
+        }
+    }
+
     gmtrr_mtype = hvm_get_mem_pinned_cacheattr(d, _gfn(gfn), order);
     if ( gmtrr_mtype >= 0 )
     {
-- 
2.20.1


