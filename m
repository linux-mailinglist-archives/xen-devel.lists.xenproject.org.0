Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B58FF32EF02
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 16:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93849.177277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICVn-00064j-9A; Fri, 05 Mar 2021 15:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93849.177277; Fri, 05 Mar 2021 15:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lICVn-00064K-5d; Fri, 05 Mar 2021 15:37:07 +0000
Received: by outflank-mailman (input) for mailman id 93849;
 Fri, 05 Mar 2021 15:37:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IQfx=ID=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lICVl-00064D-Oa
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 15:37:05 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42ba76b6-7de6-474b-b1eb-2e2f71fc828b;
 Fri, 05 Mar 2021 15:37:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 353ABACCF;
 Fri,  5 Mar 2021 15:37:04 +0000 (UTC)
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
X-Inumbo-ID: 42ba76b6-7de6-474b-b1eb-2e2f71fc828b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614958624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sH7fHFoNbJW0zjpZjVHFaY+IoMJaYqOtkkdLzA6ish4=;
	b=tzBpJXQ4S23JUuYr3Fgw/8FCEj79Sc+VyLP691NnZcutn0jAbPG9/Px7ZblJJk1sHybuOf
	wt1/6EY8f364BDBK1I+iASy3OVQtgt6voma8ceZrbnRdZ0jBc/ZRmD01+EfkztdPV7ctZo
	xX/hVUAleZuKhWXmIm9D9hK0cHESXA4=
Subject: [PATCH 1/2][4.15?] x86/shadow: suppress "fast fault path"
 optimization when running virtualized
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ian Jackson <iwj@xenproject.org>
References: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
Message-ID: <3bb90ab6-22c9-31d4-88a2-39bd3d81c2d7@suse.com>
Date: Fri, 5 Mar 2021 16:37:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <d0190313-921f-7cbc-4659-9a79f6299fab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

We can't make correctness of our own behavior dependent upon a
hypervisor underneath us correctly telling us the true physical address
with hardware uses. Without knowing this, we can't be certain reserved
bit faults can actually be observed. Therefore, besides evaluating the
number of address bits when deciding whether to use the optimization,
also check whether we're running virtualized ourselves.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -282,10 +282,16 @@ shadow_put_page_from_l1e(shadow_l1e_t sl
  *
  * This is only feasible for PAE and 64bit Xen: 32-bit non-PAE PTEs don't
  * have reserved bits that we can use for this.  And even there it can only
- * be used if the processor doesn't use all 52 address bits.
+ * be used if we can be certain the processor doesn't use all 52 address bits.
  */
 
 #define SH_L1E_MAGIC 0xffffffff00000001ULL
+
+static inline bool sh_have_pte_rsvd_bits(void)
+{
+    return paddr_bits < PADDR_BITS && !cpu_has_hypervisor;
+}
+
 static inline bool sh_l1e_is_magic(shadow_l1e_t sl1e)
 {
     return (sl1e.l1 & SH_L1E_MAGIC) == SH_L1E_MAGIC;
@@ -303,7 +309,7 @@ static inline shadow_l1e_t sh_l1e_gnp(vo
      * On systems with no reserved physical address bits we can't engage the
      * fast fault path.
      */
-    return paddr_bits < PADDR_BITS ? sh_l1e_gnp_raw()
+    return sh_have_pte_rsvd_bits() ? sh_l1e_gnp_raw()
                                    : shadow_l1e_empty();
 }
 
@@ -326,7 +332,7 @@ static inline shadow_l1e_t sh_l1e_mmio(g
 {
     unsigned long gfn_val = MASK_INSR(gfn_x(gfn), SH_L1E_MMIO_GFN_MASK);
 
-    if ( paddr_bits >= PADDR_BITS ||
+    if ( !sh_have_pte_rsvd_bits() ||
          gfn_x(gfn) != MASK_EXTR(gfn_val, SH_L1E_MMIO_GFN_MASK) )
         return shadow_l1e_empty();
 


