Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27891299163
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 16:48:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12391.32261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX4iq-0001JL-4m; Mon, 26 Oct 2020 15:47:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12391.32261; Mon, 26 Oct 2020 15:47:48 +0000
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
	id 1kX4iq-0001J0-1i; Mon, 26 Oct 2020 15:47:48 +0000
Received: by outflank-mailman (input) for mailman id 12391;
 Mon, 26 Oct 2020 15:47:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kX4in-0001Iv-Uv
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 15:47:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7dbbc6a3-e7b4-4705-8724-5ce441cfc786;
 Mon, 26 Oct 2020 15:47:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45B4BACAA;
 Mon, 26 Oct 2020 15:47:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=8IcS=EB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kX4in-0001Iv-Uv
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 15:47:45 +0000
X-Inumbo-ID: 7dbbc6a3-e7b4-4705-8724-5ce441cfc786
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7dbbc6a3-e7b4-4705-8724-5ce441cfc786;
	Mon, 26 Oct 2020 15:47:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603727264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Uh+v4GctdV0LWTJJQA59Ypv4Eglj9jnoaPqzqi+vSj8=;
	b=JOiGwSNmHbMveCsobWJwSRAqtNrallSIqluUWR0uzNYILIfPxALmOkx3vGkr147XccW/6g
	x9Aqim03e5WvPHqHu3RNTJlA6iQWAl/UkTA65rh/C6hnPXJo6mpsAKrnfdHQfzTXPk3ZGy
	t3yyOmvPj3h5JR/HsTklxttGmnXHzf8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 45B4BACAA;
	Mon, 26 Oct 2020 15:47:44 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: don't open-code l<N>e_to_mfn()
Message-ID: <2c72239a-46e9-4822-fa4b-5a0155c5c5e5@suse.com>
Date: Mon, 26 Oct 2020 16:47:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -779,9 +779,9 @@ pod_retry_l3:
         }
         if ( flags & _PAGE_PSE )
         {
-            mfn = _mfn(l3e_get_pfn(*l3e) +
-                       l2_table_offset(addr) * L1_PAGETABLE_ENTRIES +
-                       l1_table_offset(addr));
+            mfn = mfn_add(l3e_get_mfn(*l3e),
+                          l2_table_offset(addr) * L1_PAGETABLE_ENTRIES +
+                          l1_table_offset(addr));
             *t = p2m_recalc_type(recalc || _needs_recalc(flags),
                                  p2m_flags_to_type(flags), p2m, gfn);
             unmap_domain_page(l3e);
@@ -820,7 +820,7 @@ pod_retry_l2:
     }
     if ( flags & _PAGE_PSE )
     {
-        mfn = _mfn(l2e_get_pfn(*l2e) + l1_table_offset(addr));
+        mfn = mfn_add(l2e_get_mfn(*l2e), l1_table_offset(addr));
         *t = p2m_recalc_type(recalc || _needs_recalc(flags),
                              p2m_flags_to_type(flags), p2m, gfn);
         unmap_domain_page(l2e);
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -291,7 +291,7 @@ void copy_page_sse2(void *, const void *
 #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
 #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
 #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
-#define vmap_to_mfn(va)     _mfn(l1e_get_pfn(*virt_to_xen_l1e((unsigned long)(va))))
+#define vmap_to_mfn(va)     l1e_get_mfn(*virt_to_xen_l1e((unsigned long)(va)))
 #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
 #endif /* !defined(__ASSEMBLY__) */

