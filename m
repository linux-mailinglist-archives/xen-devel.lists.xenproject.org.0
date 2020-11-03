Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918782A4379
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:56:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18230.43190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtzb-00051l-Bb; Tue, 03 Nov 2020 10:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18230.43190; Tue, 03 Nov 2020 10:56:47 +0000
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
	id 1kZtzb-00051D-7I; Tue, 03 Nov 2020 10:56:47 +0000
Received: by outflank-mailman (input) for mailman id 18230;
 Tue, 03 Nov 2020 10:56:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZtzZ-00050b-Gh
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:56:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 04892558-b76c-4dd4-a760-6c6e647d37d9;
 Tue, 03 Nov 2020 10:56:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F5F7ACA3;
 Tue,  3 Nov 2020 10:56:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZtzZ-00050b-Gh
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:56:45 +0000
X-Inumbo-ID: 04892558-b76c-4dd4-a760-6c6e647d37d9
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 04892558-b76c-4dd4-a760-6c6e647d37d9;
	Tue, 03 Nov 2020 10:56:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604401004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Plv1raHJm4EtIIaRg6S3XXueuXOBPrKTjHui585CBRI=;
	b=aKGd7R8Mwz5j5hUMKw5siQ7Bt3cP0zwUWFZCFb4TLPXIwSjYYXpUVj11WWl9SPk/r0ic0I
	mav5ccvs5TAnmx9rMR3MRRVrstEWwn7ciognEowcPg6FqBVfcbHPRr5JaYDq4Kk05GV9J/
	GTpYnaT1OBqGb1WTHnd35PHZEF1l/XM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2F5F7ACA3;
	Tue,  3 Nov 2020 10:56:44 +0000 (UTC)
Subject: [PATCH 2/5] x86/PV: fold redundant calls to adjust_guest_l<N>e()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Message-ID: <0199d771-a138-702a-2514-9139d0881175@suse.com>
Date: Tue, 3 Nov 2020 11:56:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

At least from an abstract perspective it is quite odd for us to compare
adjusted old and unadjusted new page table entries when determining
whether the fast path can be used. This is largely benign because
FASTPATH_FLAG_WHITELIST covers most of the flags which the adjustments
may set, and the flags getting set don't affect the outcome of
get_page_from_l<N>e(). There's one exception: 32-bit L3 entries get
_PAGE_RW set, but get_page_from_l3e() doesn't allow linear page tables
to be created at this level for such guests. Apart from this _PAGE_RW
is unused by get_page_from_l<N>e() (for N > 1), and hence forcing the
bit on early has no functional effect.

The main reason for the change, however, is that adjust_guest_l<N>e()
aren't exactly cheap - both in terms of pure code size and because each
one has at least one evaluate_nospec() by way of containing
is_pv_32bit_domain() conditionals.

Call the functions once ahead of the fast path checks, instead of twice
after.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2199,10 +2199,11 @@ static int mod_l1_entry(l1_pgentry_t *pl
             nl1e = l1e_from_page(page, l1e_get_flags(nl1e));
         }
 
+        nl1e = adjust_guest_l1e(nl1e, pt_dom);
+
         /* Fast path for sufficiently-similar mappings. */
         if ( !l1e_has_changed(ol1e, nl1e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            nl1e = adjust_guest_l1e(nl1e, pt_dom);
             rc = UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
                               preserve_ad);
             if ( page )
@@ -2227,7 +2228,6 @@ static int mod_l1_entry(l1_pgentry_t *pl
         if ( page )
             put_page(page);
 
-        nl1e = adjust_guest_l1e(nl1e, pt_dom);
         if ( unlikely(!UPDATE_ENTRY(l1, pl1e, ol1e, nl1e, gl1mfn, pt_vcpu,
                                     preserve_ad)) )
         {
@@ -2279,10 +2279,11 @@ static int mod_l2_entry(l2_pgentry_t *pl
             return -EINVAL;
         }
 
+        nl2e = adjust_guest_l2e(nl2e, d);
+
         /* Fast path for sufficiently-similar mappings. */
         if ( !l2e_has_changed(ol2e, nl2e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            nl2e = adjust_guest_l2e(nl2e, d);
             if ( UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, preserve_ad) )
                 return 0;
             return -EBUSY;
@@ -2291,7 +2292,6 @@ static int mod_l2_entry(l2_pgentry_t *pl
         if ( unlikely((rc = get_page_from_l2e(nl2e, mfn, d, 0)) < 0) )
             return rc;
 
-        nl2e = adjust_guest_l2e(nl2e, d);
         if ( unlikely(!UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu,
                                     preserve_ad)) )
         {
@@ -2341,10 +2341,11 @@ static int mod_l3_entry(l3_pgentry_t *pl
             return -EINVAL;
         }
 
+        nl3e = adjust_guest_l3e(nl3e, d);
+
         /* Fast path for sufficiently-similar mappings. */
         if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            nl3e = adjust_guest_l3e(nl3e, d);
             rc = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, preserve_ad);
             return rc ? 0 : -EFAULT;
         }
@@ -2354,7 +2355,6 @@ static int mod_l3_entry(l3_pgentry_t *pl
             return rc;
         rc = 0;
 
-        nl3e = adjust_guest_l3e(nl3e, d);
         if ( unlikely(!UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu,
                                     preserve_ad)) )
         {
@@ -2403,10 +2403,11 @@ static int mod_l4_entry(l4_pgentry_t *pl
             return -EINVAL;
         }
 
+        nl4e = adjust_guest_l4e(nl4e, d);
+
         /* Fast path for sufficiently-similar mappings. */
         if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_FLAG_WHITELIST) )
         {
-            nl4e = adjust_guest_l4e(nl4e, d);
             rc = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, preserve_ad);
             return rc ? 0 : -EFAULT;
         }
@@ -2416,7 +2417,6 @@ static int mod_l4_entry(l4_pgentry_t *pl
             return rc;
         rc = 0;
 
-        nl4e = adjust_guest_l4e(nl4e, d);
         if ( unlikely(!UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu,
                                     preserve_ad)) )
         {


