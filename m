Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 567772E815A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Dec 2020 18:11:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.60589.106332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kv1TN-0006vR-ID; Thu, 31 Dec 2020 17:10:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 60589.106332; Thu, 31 Dec 2020 17:10:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kv1TN-0006v2-Es; Thu, 31 Dec 2020 17:10:49 +0000
Received: by outflank-mailman (input) for mailman id 60589;
 Thu, 31 Dec 2020 17:10:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pjRP=GD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kv1TL-0006ux-Hz
 for xen-devel@lists.xenproject.org; Thu, 31 Dec 2020 17:10:47 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d2de5a5-3251-4924-a231-1831b0c02e29;
 Thu, 31 Dec 2020 17:10:46 +0000 (UTC)
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
X-Inumbo-ID: 1d2de5a5-3251-4924-a231-1831b0c02e29
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1609434646;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NxwI/z0UNJxAx6ac/8QROsOGpOgOIjR2m928kxeN3v8=;
  b=JtcTPD3pEHowAguYbJFxCxhHH0tL9wwrULHij9HVdIx9zH8KfC/gkadj
   L97Dfwj/3qJpIeiKsHyj10+iol1nMRfZHEDvwfBy9oWko891ELYWMsRKM
   NeG8Ag5meIsajxjMOfxvTUQ2H1Tqj69LaYH7noLn6+mcEipJln0C2dk5B
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 6P6FuERh7nPjVoQ1Yv0U73E7l7jt8DzwO8aLfj6bTnUjXNaBuO+k46eqAFRQWFvNq457nVrE7h
 qBpTLHKu+8xUvQipuQL/SqAD4iDl7TCz4DgmGC1/M39LW18B67D8Db3AhgIaXgc8U5ZL0/YSA+
 4uEYt7i+SMJKdMz5DRfmuKqxImbucGRsLQSyCirBWdfE6WItaC1vA0Lei8jhhdLD/nbqc7ILXx
 LbcwYOnrejaeHJaRa0+AgC5ouoHDWpOhUAkPoEp3kTMS8cmKLw94aKHOrFh/XgHcogvuHDPmY4
 ziY=
X-SBRS: 5.2
X-MesageID: 35481531
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,464,1599537600"; 
   d="scan'208";a="35481531"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>
Subject: [PATCH] x86/p2m: Fix paging_gva_to_gfn() for nested virt
Date: Thu, 31 Dec 2020 17:10:21 +0000
Message-ID: <20201231171021.10361-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

nestedhap_walk_L1_p2m() takes guest physical addresses, not frame numbers.
This means the l2 input is off-by-PAGE_SHIFT, as is the l1 value eventually
returned to the caller.

Delete the misleading comment as well.

Fixes: bab2bd8e222de ("xen/nested_p2m: Don't walk EPT tables with a regular PT walker")
Reported-by: Tamas K Lengyel <tamas@tklengyel.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/mm/p2m.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 487959b121..89a2b55c66 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1784,6 +1784,7 @@ unsigned long paging_gva_to_gfn(struct vcpu *v,
     if ( is_hvm_vcpu(v) && paging_mode_hap(v->domain) && nestedhvm_is_n2(v) )
     {
         unsigned long l2_gfn, l1_gfn;
+        paddr_t l1_gpa;
         struct p2m_domain *p2m;
         const struct paging_mode *mode;
         uint8_t l1_p2ma;
@@ -1798,8 +1799,8 @@ unsigned long paging_gva_to_gfn(struct vcpu *v,
         if ( l2_gfn == gfn_x(INVALID_GFN) )
             return gfn_x(INVALID_GFN);
 
-        /* translate l2 guest gfn into l1 guest gfn */
-        rv = nestedhap_walk_L1_p2m(v, l2_gfn, &l1_gfn, &l1_page_order, &l1_p2ma,
+        rv = nestedhap_walk_L1_p2m(v, pfn_to_paddr(l2_gfn), &l1_gpa,
+                                   &l1_page_order, &l1_p2ma,
                                    1,
                                    !!(*pfec & PFEC_write_access),
                                    !!(*pfec & PFEC_insn_fetch));
@@ -1807,6 +1808,8 @@ unsigned long paging_gva_to_gfn(struct vcpu *v,
         if ( rv != NESTEDHVM_PAGEFAULT_DONE )
             return gfn_x(INVALID_GFN);
 
+        l1_gfn = paddr_to_pfn(l1_gpa);
+
         /*
          * Sanity check that l1_gfn can be used properly as a 4K mapping, even
          * if it mapped by a nested superpage.
-- 
2.11.0


