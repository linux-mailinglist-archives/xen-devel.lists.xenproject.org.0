Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 083C92DB151
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54456.94608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD9s-0003YJ-Hu; Tue, 15 Dec 2020 16:26:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54456.94608; Tue, 15 Dec 2020 16:26:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpD9s-0003Xr-Ev; Tue, 15 Dec 2020 16:26:40 +0000
Received: by outflank-mailman (input) for mailman id 54456;
 Tue, 15 Dec 2020 16:26:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vckb=FT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kpD9q-0003XC-T2
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:26:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fa142ba7-ec6b-4d63-a2e9-1e2b44e86113;
 Tue, 15 Dec 2020 16:26:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6B7D2AC7F;
 Tue, 15 Dec 2020 16:26:34 +0000 (UTC)
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
X-Inumbo-ID: fa142ba7-ec6b-4d63-a2e9-1e2b44e86113
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608049594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ib4JzAgO9xvhFCA7cw+kxBNsg4RQNQhk6ehHzj9Ffso=;
	b=I/1sVtEEiTxAGm7vRT+sihiIrnmaklHo65i+OBqrHCA7FlSYO/3SJF4cc3oqJjqivwC5uA
	/KcS3v2VfQnuy0l+OLSiWcEmZJj22hhEpa8JPMurV7G6dO6pxKFB8zeMllj1vghpGfFfhE
	btUTDVOfefspkBUFL85HjfFO/Y8Z+rM=
Subject: [PATCH 3/6] x86/p2m: set_{foreign,mmio}_p2m_entry() are HVM-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Message-ID: <15f41816-4814-bae5-e0bc-89e99d04a142@suse.com>
Date: Tue, 15 Dec 2020 17:26:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Extend a respective #ifdef from inside set_typed_p2m_entry() to around
all three functions. Add ASSERT_UNREACHABLE() to the latter one's safety
check path.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1257,6 +1257,8 @@ int p2m_finish_type_change(struct domain
     return rc;
 }
 
+#ifdef CONFIG_HVM
+
 /*
  * Returns:
  *    0              for success
@@ -1277,7 +1279,10 @@ static int set_typed_p2m_entry(struct do
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
 
     if ( !paging_mode_translate(d) )
+    {
+        ASSERT_UNREACHABLE();
         return -EIO;
+    }
 
     gfn_lock(p2m, gfn, order);
     omfn = p2m->get_entry(p2m, gfn, &ot, &a, 0, &cur_order, NULL);
@@ -1308,7 +1313,6 @@ static int set_typed_p2m_entry(struct do
     if ( rc )
         gdprintk(XENLOG_ERR, "p2m_set_entry: %#lx:%u -> %d (0x%"PRI_mfn")\n",
                  gfn_l, order, rc, mfn_x(mfn));
-#ifdef CONFIG_HVM
     else if ( p2m_is_pod(ot) )
     {
         pod_lock(p2m);
@@ -1316,7 +1320,6 @@ static int set_typed_p2m_entry(struct do
         BUG_ON(p2m->pod.entry_count < 0);
         pod_unlock(p2m);
     }
-#endif
     gfn_unlock(p2m, gfn, order);
 
     return rc;
@@ -1341,6 +1344,8 @@ int set_mmio_p2m_entry(struct domain *d,
                                p2m_get_hostp2m(d)->default_access);
 }
 
+#endif /* CONFIG_HVM */
+
 int set_identity_p2m_entry(struct domain *d, unsigned long gfn_l,
                            p2m_access_t p2ma, unsigned int flag)
 {


