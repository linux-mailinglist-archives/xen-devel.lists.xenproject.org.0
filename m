Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E11631D67F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 09:21:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86154.161420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI5c-0002mL-77; Wed, 17 Feb 2021 08:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86154.161420; Wed, 17 Feb 2021 08:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCI5c-0002lr-3O; Wed, 17 Feb 2021 08:21:40 +0000
Received: by outflank-mailman (input) for mailman id 86154;
 Wed, 17 Feb 2021 08:21:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCI5a-0002le-Vw
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 08:21:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2974b1bc-d770-4709-90fe-f662433d92f3;
 Wed, 17 Feb 2021 08:21:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E21FB926;
 Wed, 17 Feb 2021 08:21:37 +0000 (UTC)
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
X-Inumbo-ID: 2974b1bc-d770-4709-90fe-f662433d92f3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613550097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7+4q+ReB9EfmNerxV8ac8BV2+CtbLgs3ung/R2kapNU=;
	b=k7iTE3VpfSst3expp3Wj8nbpoeGkALM+7WFo8YAO7VueCMHke1xnA/jbuLnXQfd5sAMQTE
	VXD6YarR22lw7kIZEnqcim9pKclepIlB33ZdGye2w47jeRMMyXeNR/LuviR8eKaGGtFMeX
	VJefGqYJ5OenTl04gnAQrZrHrhnyfA0=
Subject: [PATCH v2 5/8] x86/gdbsx: convert "user" to "guest" accesses
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Message-ID: <d1a1b9eb-33b4-4d07-9465-189699f88323@suse.com>
Date: Wed, 17 Feb 2021 09:21:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Using copy_{from,to}_user(), this code was assuming to be called only by
PV guests. Use copy_{from,to}_guest() instead, transforming the incoming
structure field into a guest handle (the field should really have been
one in the first place). Also do not transform the debuggee address into
a pointer.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base (bug fix side effect was taken care of already).

--- a/xen/arch/x86/debug.c
+++ b/xen/arch/x86/debug.c
@@ -108,12 +108,11 @@ dbg_pv_va2mfn(dbgva_t vaddr, struct doma
 }
 
 /* Returns: number of bytes remaining to be copied */
-static unsigned int dbg_rw_guest_mem(struct domain *dp, void * __user gaddr,
-                                     void * __user buf, unsigned int len,
-                                     bool toaddr, uint64_t pgd3)
+static unsigned int dbg_rw_guest_mem(struct domain *dp, unsigned long addr,
+                                     XEN_GUEST_HANDLE_PARAM(void) buf,
+                                     unsigned int len, bool toaddr,
+                                     uint64_t pgd3)
 {
-    unsigned long addr = (unsigned long)gaddr;
-
     while ( len > 0 )
     {
         char *va;
@@ -134,20 +133,18 @@ static unsigned int dbg_rw_guest_mem(str
 
         if ( toaddr )
         {
-            copy_from_user(va, buf, pagecnt);    /* va = buf */
+            copy_from_guest(va, buf, pagecnt);
             paging_mark_dirty(dp, mfn);
         }
         else
-        {
-            copy_to_user(buf, va, pagecnt);    /* buf = va */
-        }
+            copy_to_guest(buf, va, pagecnt);
 
         unmap_domain_page(va);
         if ( !gfn_eq(gfn, INVALID_GFN) )
             put_gfn(dp, gfn_x(gfn));
 
         addr += pagecnt;
-        buf += pagecnt;
+        guest_handle_add_offset(buf, pagecnt);
         len -= pagecnt;
     }
 
@@ -161,7 +158,7 @@ static unsigned int dbg_rw_guest_mem(str
  * pgd3: value of init_mm.pgd[3] in guest. see above.
  * Returns: number of bytes remaining to be copied.
  */
-unsigned int dbg_rw_mem(void * __user addr, void * __user buf,
+unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
                         unsigned int len, domid_t domid, bool toaddr,
                         uint64_t pgd3)
 {
@@ -170,7 +167,7 @@ unsigned int dbg_rw_mem(void * __user ad
     if ( d )
     {
         if ( !d->is_dying )
-            len = dbg_rw_guest_mem(d, addr, buf, len, toaddr, pgd3);
+            len = dbg_rw_guest_mem(d, gva, buf, len, toaddr, pgd3);
         rcu_unlock_domain(d);
     }
 
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -40,10 +40,8 @@
 #ifdef CONFIG_GDBSX
 static int gdbsx_guest_mem_io(domid_t domid, struct xen_domctl_gdbsx_memio *iop)
 {
-    void * __user gva = (void *)iop->gva, * __user uva = (void *)iop->uva;
-
-    iop->remain = dbg_rw_mem(gva, uva, iop->len, domid,
-                             !!iop->gwr, iop->pgd3val);
+    iop->remain = dbg_rw_mem(iop->gva, guest_handle_from_ptr(iop->uva, void),
+                             iop->len, domid, iop->gwr, iop->pgd3val);
 
     return iop->remain ? -EFAULT : 0;
 }
--- a/xen/include/asm-x86/debugger.h
+++ b/xen/include/asm-x86/debugger.h
@@ -93,9 +93,9 @@ static inline bool debugger_trap_entry(
 #endif
 
 #ifdef CONFIG_GDBSX
-unsigned int dbg_rw_mem(void * __user addr, void * __user buf,
+unsigned int dbg_rw_mem(unsigned long gva, XEN_GUEST_HANDLE_PARAM(void) buf,
                         unsigned int len, domid_t domid, bool toaddr,
-                        uint64_t pgd3);
+                        unsigned long pgd3);
 #endif
 
 #endif /* __X86_DEBUGGER_H__ */


