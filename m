Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C422A4389
	for <lists+xen-devel@lfdr.de>; Tue,  3 Nov 2020 11:57:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18236.43213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZu01-0005DQ-23; Tue, 03 Nov 2020 10:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18236.43213; Tue, 03 Nov 2020 10:57:13 +0000
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
	id 1kZu00-0005Ct-Ug; Tue, 03 Nov 2020 10:57:12 +0000
Received: by outflank-mailman (input) for mailman id 18236;
 Tue, 03 Nov 2020 10:57:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kZu00-0005Ce-AO
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:57:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 0644aa43-9c30-4c86-a07a-069f6d49718c;
 Tue, 03 Nov 2020 10:57:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EA4E8AC8C;
 Tue,  3 Nov 2020 10:57:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xm8A=EJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kZu00-0005Ce-AO
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:57:12 +0000
X-Inumbo-ID: 0644aa43-9c30-4c86-a07a-069f6d49718c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 0644aa43-9c30-4c86-a07a-069f6d49718c;
	Tue, 03 Nov 2020 10:57:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604401031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CJNC9hq2wQG0dp8NuWS9S6pYUYMVclkRS7uxeyQUMfg=;
	b=igrnGwQHe+fGfsjzqv1C1t0njA1Vqdwr9aTe3ohuAqK27dREWRl3WGeVuHLgjhOAgslJuj
	a8sMfztZgTDdJfOuaSFGi+HUuHehDnG+lfXAXVG9PuaATCDaKMt/0LohJBTM1iZvnuiOOM
	1QbGjpByttdN8ZCKi/JGTUjInSFvfPY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EA4E8AC8C;
	Tue,  3 Nov 2020 10:57:10 +0000 (UTC)
Subject: [PATCH 3/5] x86/PV: _PAGE_RW changes may take fast path of
 mod_l[234]_entry()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Message-ID: <11633161-6809-db0c-44e6-e5f383f4ebd2@suse.com>
Date: Tue, 3 Nov 2020 11:57:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <10a01f61-197b-7df4-192d-917fe135df70@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The only time _PAGE_RW matters when validating an L2 or higher entry is
when a linear page table is tried to be installed. Therefore when we
disallow such at build time, we can allow _PAGE_RW changes to take the
fast paths there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2140,6 +2140,18 @@ static void l3t_unlock(struct page_info
     (_PAGE_NX_BIT | _PAGE_AVAIL_HIGH | _PAGE_AVAIL | _PAGE_GLOBAL | \
      _PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_USER)
 
+/*
+ * PDE flags that a guest may change without re-validating the PDE.
+ * All other bits affect translation, caching, or Xen's safety. When guest
+ * created linear page tables aren't allowed, intermediate page tables may
+ * have _PAGE_RW altered without this requiring re-validation.
+ */
+#ifndef CONFIG_PV_LINEAR_PT
+# define FASTPATH_PDE_FLAG_WHITELIST (FASTPATH_FLAG_WHITELIST | _PAGE_RW)
+#else
+# define FASTPATH_PDE_FLAG_WHITELIST FASTPATH_FLAG_WHITELIST
+#endif
+
 /* Update the L1 entry at pl1e to new value nl1e. */
 static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
                         mfn_t gl1mfn, unsigned int cmd,
@@ -2282,7 +2294,7 @@ static int mod_l2_entry(l2_pgentry_t *pl
         nl2e = adjust_guest_l2e(nl2e, d);
 
         /* Fast path for sufficiently-similar mappings. */
-        if ( !l2e_has_changed(ol2e, nl2e, ~FASTPATH_FLAG_WHITELIST) )
+        if ( !l2e_has_changed(ol2e, nl2e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
             if ( UPDATE_ENTRY(l2, pl2e, ol2e, nl2e, mfn, vcpu, preserve_ad) )
                 return 0;
@@ -2344,7 +2356,7 @@ static int mod_l3_entry(l3_pgentry_t *pl
         nl3e = adjust_guest_l3e(nl3e, d);
 
         /* Fast path for sufficiently-similar mappings. */
-        if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_FLAG_WHITELIST) )
+        if ( !l3e_has_changed(ol3e, nl3e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
             rc = UPDATE_ENTRY(l3, pl3e, ol3e, nl3e, mfn, vcpu, preserve_ad);
             return rc ? 0 : -EFAULT;
@@ -2406,7 +2418,7 @@ static int mod_l4_entry(l4_pgentry_t *pl
         nl4e = adjust_guest_l4e(nl4e, d);
 
         /* Fast path for sufficiently-similar mappings. */
-        if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_FLAG_WHITELIST) )
+        if ( !l4e_has_changed(ol4e, nl4e, ~FASTPATH_PDE_FLAG_WHITELIST) )
         {
             rc = UPDATE_ENTRY(l4, pl4e, ol4e, nl4e, mfn, vcpu, preserve_ad);
             return rc ? 0 : -EFAULT;


