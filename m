Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D61F2D942A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 09:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51959.90911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojCr-0003kd-HU; Mon, 14 Dec 2020 08:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51959.90911; Mon, 14 Dec 2020 08:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kojCr-0003kE-Dk; Mon, 14 Dec 2020 08:27:45 +0000
Received: by outflank-mailman (input) for mailman id 51959;
 Mon, 14 Dec 2020 08:27:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MGmN=FS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kojCq-0003js-3y
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 08:27:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f003da8-f11f-4198-96ca-d6bc9ab4c1dc;
 Mon, 14 Dec 2020 08:27:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E409B2C5;
 Mon, 14 Dec 2020 08:27:38 +0000 (UTC)
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
X-Inumbo-ID: 8f003da8-f11f-4198-96ca-d6bc9ab4c1dc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607934458; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=udJGY57Ul0HuXMWkcLcPHpsVPrbRTIZSixFgD7KUKHE=;
	b=mZOgQUeqw93i9TXXYq7ggqBjB+5Wrkx3YuprLXC9Afe3c+8Hy3E0Oe0yhe6RrN630YoPof
	neTvjkXA6XoWdLm23wefprTavvqo+iSJPLsFtzRCxdyAif/DJQEcZiK0V4F7NMSrR7AY+l
	IDMeAsoE+J2q6kXAoA01kJPOXD+/05c=
Subject: Re: [PATCH] Revert "x86/mm: drop guest_get_eff_l1e()"
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Manuel Bouyer <bouyer@antioche.eu.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201211141615.12489-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <454ec720-b823-c2aa-7de4-84c14db2b96f@suse.com>
Date: Mon, 14 Dec 2020 09:27:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201211141615.12489-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.12.2020 15:16, Andrew Cooper wrote:
> This reverts commit 9ff9705647646aa937b5f5c1426a64c69a62b3bd.
> 
> The change is only correct in the original context of XSA-286, where Xen's use
> of the linear pagetables were dropped.  However, performance problems
> interfered with that plan, and XSA-286 was fixed differently.
> 
> This broke Xen's lazy faulting of the LDT for 64bit PV guests when an access
> was first encountered in user context.  Xen would proceed to read the
> registered LDT virtual address out of the user pagetables, not the kernel
> pagetables.
> 
> Given the nature of the bug, it would have also interfered with the IO
> permisison bitmap functionality of userspace, which similarly needs to read
> data using the kernel pagetables.

This paragraph wants dropping afaict - guest_io_okay() has
explicit calls to toggle_guest_pt(), and hence is unaffected by
the bug here (and there is in particular page tables reading
involved there). Then ...

> Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Tested-by: Manuel Bouyer <bouyer@antioche.eu.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I was wondering however whether we really want a full revert. I've
locally made the change below as an alternative.

Jan

x86/PV: guest_get_eff_kern_l1e() may still need to switch page tables

While indeed unnecessary for pv_ro_page_fault(), pv_map_ldt_shadow_page()
may run when guest user mode is active, and hence may need to switch to
the kernel page tables in order to retrieve an LDT page mapping.

Fixes: 9ff970564764 ("x86/mm: drop guest_get_eff_l1e()")
Reported-by: Manuel Bouyer <bouyer@antioche.eu.org>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is the alternative to fully reverting the offending commit.

I've also been considering to drop the paging-mode-translate ASSERT(),
now that we always have translate == external.

--- a/xen/arch/x86/pv/mm.h
+++ b/xen/arch/x86/pv/mm.h
@@ -11,10 +11,14 @@ int new_guest_cr3(mfn_t mfn);
  */
 static inline l1_pgentry_t guest_get_eff_kern_l1e(unsigned long linear)
 {
+    struct vcpu *curr = current;
     l1_pgentry_t l1e;
 
-    ASSERT(!paging_mode_translate(current->domain));
-    ASSERT(!paging_mode_external(current->domain));
+    ASSERT(!paging_mode_translate(curr->domain));
+    ASSERT(!paging_mode_external(curr->domain));
+
+    if ( !(curr->arch.flags & TF_kernel_mode) )
+        toggle_guest_pt(curr);
 
     if ( unlikely(!__addr_ok(linear)) ||
          __copy_from_user(&l1e,
@@ -22,6 +26,9 @@ static inline l1_pgentry_t guest_get_eff
                           sizeof(l1_pgentry_t)) )
         l1e = l1e_empty();
 
+    if ( !(curr->arch.flags & TF_kernel_mode) )
+        toggle_guest_pt(curr);
+
     return l1e;
 }
 

