Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4D632501D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 14:04:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89719.169254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGIm-00079Y-QH; Thu, 25 Feb 2021 13:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89719.169254; Thu, 25 Feb 2021 13:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFGIm-000799-NA; Thu, 25 Feb 2021 13:03:32 +0000
Received: by outflank-mailman (input) for mailman id 89719;
 Thu, 25 Feb 2021 13:03:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFGIk-000794-OR
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 13:03:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d318e31e-6c6f-4bdb-81ba-c165889cae62;
 Thu, 25 Feb 2021 13:03:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 28FABAF6C;
 Thu, 25 Feb 2021 13:03:29 +0000 (UTC)
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
X-Inumbo-ID: d318e31e-6c6f-4bdb-81ba-c165889cae62
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614258209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sVWb/AlweGBWskdDVYu6DsRg5Q6IZCg3eCyZ3Hr3SoI=;
	b=TVBT02b8c19GtkNVBAUtkkg4ytytwyz2ntHdX0+eKT51Bmmu8SqRqQRtlTYrvhy7VnK10o
	zkXh7bZLtaCmdPQhRiFRqcSQxgRMJgb/1WYGwqu+GzaSaEWA8ItlGbCIuo3XZGBNF0hn6/
	k0m9l5enzTk8QWwM7Xjl2WFY09GQ7JU=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH][4.15] x86/shadow: suppress "fast fault path" optimization
 without reserved bits
Message-ID: <aefe5617-9f10-23a4-ee27-6ea66b62cdbe@suse.com>
Date: Thu, 25 Feb 2021 14:03:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When none of the physical address bits in PTEs are reserved, we can't
create any 4k (leaf) PTEs which would trigger reserved bit faults. Hence
the present SHOPT_FAST_FAULT_PATH machinery needs to be suppressed in
this case, which is most easily achieved by never creating any magic
entries.

To compensate a little, eliminate sh_write_p2m_entry_post()'s impact on
such hardware.

While at it, also avoid using an MMIO magic entry when that would
truncate the incoming GFN.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wonder if subsequently we couldn't arrange for SMEP/SMAP faults to be
utilized instead, on capable hardware (which might well be all having
such large a physical address width).

I further wonder whether SH_L1E_MMIO_GFN_MASK couldn't / shouldn't be
widened. I don't see a reason why it would need confining to the low
32 bits of the PTE - using the full space up to bit 50 ought to be fine
(i.e. just one address bit left set in the magic mask), and we wouldn't
even need that many to encode a 40-bit GFN (i.e. the extra guarding
added here wouldn't then be needed in the first place).

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -499,7 +499,8 @@ _sh_propagate(struct vcpu *v,
     {
         /* Guest l1e maps emulated MMIO space */
         *sp = sh_l1e_mmio(target_gfn, gflags);
-        d->arch.paging.shadow.has_fast_mmio_entries = true;
+        if ( sh_l1e_is_magic(*sp) )
+            d->arch.paging.shadow.has_fast_mmio_entries = true;
         goto done;
     }
 
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -281,7 +281,8 @@ shadow_put_page_from_l1e(shadow_l1e_t sl
  * pagetables.
  *
  * This is only feasible for PAE and 64bit Xen: 32-bit non-PAE PTEs don't
- * have reserved bits that we can use for this.
+ * have reserved bits that we can use for this.  And even there it can only
+ * be used if the processor doesn't use all 52 address bits.
  */
 
 #define SH_L1E_MAGIC 0xffffffff00000001ULL
@@ -291,14 +292,24 @@ static inline bool sh_l1e_is_magic(shado
 }
 
 /* Guest not present: a single magic value */
-static inline shadow_l1e_t sh_l1e_gnp(void)
+static inline shadow_l1e_t sh_l1e_gnp_raw(void)
 {
     return (shadow_l1e_t){ -1ULL };
 }
 
+static inline shadow_l1e_t sh_l1e_gnp(void)
+{
+    /*
+     * On systems with no reserved physical address bits we can't engage the
+     * fast fault path.
+     */
+    return paddr_bits < PADDR_BITS ? sh_l1e_gnp_raw()
+                                   : shadow_l1e_empty();
+}
+
 static inline bool sh_l1e_is_gnp(shadow_l1e_t sl1e)
 {
-    return sl1e.l1 == sh_l1e_gnp().l1;
+    return sl1e.l1 == sh_l1e_gnp_raw().l1;
 }
 
 /*
@@ -313,9 +324,14 @@ static inline bool sh_l1e_is_gnp(shadow_
 
 static inline shadow_l1e_t sh_l1e_mmio(gfn_t gfn, u32 gflags)
 {
-    return (shadow_l1e_t) { (SH_L1E_MMIO_MAGIC
-                             | MASK_INSR(gfn_x(gfn), SH_L1E_MMIO_GFN_MASK)
-                             | (gflags & (_PAGE_USER|_PAGE_RW))) };
+    unsigned long gfn_val = MASK_INSR(gfn_x(gfn), SH_L1E_MMIO_GFN_MASK);
+
+    if ( paddr_bits >= PADDR_BITS ||
+         gfn_x(gfn) != MASK_EXTR(gfn_val, SH_L1E_MMIO_GFN_MASK) )
+        return shadow_l1e_empty();
+
+    return (shadow_l1e_t) { (SH_L1E_MMIO_MAGIC | gfn_val |
+                             (gflags & (_PAGE_USER | _PAGE_RW))) };
 }
 
 static inline bool sh_l1e_is_mmio(shadow_l1e_t sl1e)

