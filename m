Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6380D2D994E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 14:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52262.91345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kooMQ-0007Tv-05; Mon, 14 Dec 2020 13:57:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52262.91345; Mon, 14 Dec 2020 13:57:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kooMP-0007TW-T9; Mon, 14 Dec 2020 13:57:57 +0000
Received: by outflank-mailman (input) for mailman id 52262;
 Mon, 14 Dec 2020 13:57:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MGmN=FS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kooMO-0007TQ-KG
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 13:57:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a34039fc-e278-45f7-807f-2f2d9c2d5d75;
 Mon, 14 Dec 2020 13:57:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67511AC10;
 Mon, 14 Dec 2020 13:57:54 +0000 (UTC)
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
X-Inumbo-ID: a34039fc-e278-45f7-807f-2f2d9c2d5d75
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607954274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=711qclcSFHYF04Ohd+l0igifzO77pqWLewjPtkweRvM=;
	b=SBRKDTPGMAD81xiqa+FTY/jQ591SISgNQ4rTMalDsraVMewoYOIU5RRCsKV02E5GBOcIWK
	Aaz8073+tdbbyvacLaCZb14m6JPzirxBEWJjSYOxaeBuu2L2J4V0GzjvrFLpu4b8GzX0oA
	BbKh0BSjTuWt4AXFgBGc2ppbgsvnLDg=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: guest_get_eff_kern_l1e() may still need to switch
 page tables
Message-ID: <89ae6a3b-bfbf-a701-53f5-4dfc80065924@suse.com>
Date: Mon, 14 Dec 2020 14:57:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

While indeed unnecessary for pv_ro_page_fault(), pv_map_ldt_shadow_page()
may run when guest user mode is active, and hence may need to switch to
the kernel page tables in order to retrieve an LDT page mapping.

Fixes: 9ff970564764 ("x86/mm: drop guest_get_eff_l1e()")
Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Manuel, could you test this again, just to be on the safe side
before we throw it in (at which point we could then also again
add a Tested-by)? Thanks.

--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -11,10 +11,15 @@ int new_guest_cr3(mfn_t mfn);
  */
 static inline l1_pgentry_t guest_get_eff_kern_l1e(unsigned long linear)
 {
+    struct vcpu *curr = current;
+    bool user_mode = !(curr->arch.flags & TF_kernel_mode);
     l1_pgentry_t l1e;
 
-    ASSERT(!paging_mode_translate(current->domain));
-    ASSERT(!paging_mode_external(current->domain));
+    ASSERT(!paging_mode_translate(curr->domain));
+    ASSERT(!paging_mode_external(curr->domain));
+
+    if ( user_mode )
+        toggle_guest_pt(curr);
 
     if ( unlikely(!__addr_ok(linear)) ||
          __copy_from_user(&l1e,
@@ -22,6 +27,9 @@ static inline l1_pgentry_t guest_get_eff
                           sizeof(l1_pgentry_t)) )
         l1e = l1e_empty();
 
+    if ( user_mode )
+        toggle_guest_pt(curr);
+
     return l1e;
 }
 

