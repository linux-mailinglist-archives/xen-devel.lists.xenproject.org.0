Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AD02345F0
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jul 2020 14:39:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1UK2-0007US-Ft; Fri, 31 Jul 2020 12:39:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S/xS=BK=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k1UK1-0007SZ-2z
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:39:37 +0000
X-Inumbo-ID: e20d8a00-d32a-11ea-abab-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e20d8a00-d32a-11ea-abab-12813bfff9fa;
 Fri, 31 Jul 2020 12:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=33WYKKwbqm7tyWR7ZQeAbyiugZFV+VQYG8o2+fd9T2E=; b=AT7z8AETk7fkVZqKS7UO+hsCJU
 fzOgU5vqC5I6LkYpnZZnMSBHqHXb1wseDoos04sKdndp/JBUMB/D02qz9ZCZIsjMBJBaBog5LvWzE
 dnkSGk/CJrGcfCUyrrtd3iUoaHhbTfS9G3C5eL3zKBx7Ni37p05obmM0coNgCHuJGNS8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1UJv-0001AE-Ey; Fri, 31 Jul 2020 12:39:31 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k1UJv-0007EP-7I; Fri, 31 Jul 2020 12:39:31 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 2/2] x86/hvm: simplify 'mmio_direct' check in
 epte_get_entry_emt()
Date: Fri, 31 Jul 2020 13:39:26 +0100
Message-Id: <20200731123926.28970-3-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200731123926.28970-1-paul@xen.org>
References: <20200731123926.28970-1-paul@xen.org>
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

Re-factor the code to take advantage of the fact that the APIC access page is
a 'special' page.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/mtrr.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 3ad813ed15..0992f05e8f 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -814,29 +814,22 @@ int epte_get_entry_emt(struct domain *d, unsigned long gfn, mfn_t mfn,
         return -1;
     }
 
-    if ( direct_mmio )
-    {
-        if ( (mfn_x(mfn) ^ mfn_x(d->arch.hvm.vmx.apic_access_mfn)) >> order )
-            return MTRR_TYPE_UNCACHABLE;
-        if ( order )
-            return -1;
-        *ipat = 1;
-        return MTRR_TYPE_WRBACK;
-    }
-
     if ( !mfn_valid(mfn) )
     {
         *ipat = 1;
         return MTRR_TYPE_UNCACHABLE;
     }
 
-    if ( (!is_iommu_enabled(d) && !cache_flush_permitted(d)) ||
+    if ( (!direct_mmio && !is_iommu_enabled(d) && !cache_flush_permitted(d)) ||
          is_special_page(mfn_to_page(mfn)) )
     {
         *ipat = 1;
         return MTRR_TYPE_WRBACK;
     }
 
+    if ( direct_mmio )
+        return MTRR_TYPE_UNCACHABLE;
+
     gmtrr_mtype = hvm_get_mem_pinned_cacheattr(d, _gfn(gfn), order);
     if ( gmtrr_mtype >= 0 )
     {
-- 
2.20.1


