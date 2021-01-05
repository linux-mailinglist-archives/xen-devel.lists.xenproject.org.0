Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D76D2EABDF
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 14:28:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61989.109428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmNZ-0003AP-7U; Tue, 05 Jan 2021 13:28:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61989.109428; Tue, 05 Jan 2021 13:28:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwmNZ-00039z-2u; Tue, 05 Jan 2021 13:28:05 +0000
Received: by outflank-mailman (input) for mailman id 61989;
 Tue, 05 Jan 2021 13:28:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwmNX-00039a-My
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 13:28:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cdb0b2b-bb27-4281-a91a-73622bfb28e5;
 Tue, 05 Jan 2021 13:28:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 37469AD19;
 Tue,  5 Jan 2021 13:28:02 +0000 (UTC)
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
X-Inumbo-ID: 9cdb0b2b-bb27-4281-a91a-73622bfb28e5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609853282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nPT/UfF3wGO4VC1kwhZ5QPl+OnojMyi/3Y71HohCAmE=;
	b=Adi1Q37V40SBHCxSOeWjWsurclojiCsGJisUBQ1hpaL+ukE2fgmPTxkxXD6dcMveQdy9r5
	9h/6fHqUWZVNHZHZrv8BKmB4S+rgGU5+RB0WJzNcnDA6h02mEiFrpDJDpKGLmRXhGXsuuS
	CNtiht2ZRmMMP3IpSj6/RBZ+YkBihE4=
Subject: [PATCH 5/5] x86/mem-sharing: don't pointlessly use get_domain_by_id()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
Message-ID: <3b9757c7-d0cb-9a47-b508-71b2e3b75a68@suse.com>
Date: Tue, 5 Jan 2021 14:28:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3f069a0e-39a9-f5c8-154e-ac41e8b2a1c8@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

For short-lived references rcu_lock_domain_by_id() is the better
(slightly cheaper) alternative.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -537,7 +537,7 @@ static int audit(void)
             p2m_type_t t;
             mfn_t o_mfn;
 
-            d = get_domain_by_id(g->domain);
+            d = rcu_lock_domain_by_id(g->domain);
             if ( d == NULL )
             {
                 gdprintk(XENLOG_ERR,
@@ -562,7 +562,7 @@ static int audit(void)
                          d, g->gfn, mfn_x(mfn), p2m_ram_shared, t);
                 errors++;
             }
-            put_domain(d);
+            rcu_unlock_domain(d);
             nr_gfns++;
         }
         /* The type count has an extra ref because we have locked the page */
@@ -1043,10 +1043,10 @@ static int share_pages(struct domain *sd
         rmap_del(gfn, cpage, 0);
         rmap_add(gfn, spage);
         put_count++;
-        d = get_domain_by_id(gfn->domain);
+        d = rcu_lock_domain_by_id(gfn->domain);
         BUG_ON(!d);
         BUG_ON(set_shared_p2m_entry(d, gfn->gfn, smfn));
-        put_domain(d);
+        rcu_unlock_domain(d);
     }
     ASSERT(list_empty(&cpage->sharing->gfns));
     BUG_ON(!put_count);

