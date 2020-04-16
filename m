Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 053161ACB62
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 17:47:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP6j9-0006E3-L9; Thu, 16 Apr 2020 15:46:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jP6j7-0006Dk-L7
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 15:46:53 +0000
X-Inumbo-ID: 7e1ba772-7ff9-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7e1ba772-7ff9-11ea-b58d-bc764e2007e4;
 Thu, 16 Apr 2020 15:46:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 82129AC79;
 Thu, 16 Apr 2020 15:46:51 +0000 (UTC)
Subject: [PATCH 4/6] x86/mem-paging: add minimal lock order enforcement to
 p2m_mem_paging_prep()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
Message-ID: <e0609729-0a07-6f67-f278-3809ec92dd83@suse.com>
Date: Thu, 16 Apr 2020 17:46:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

While full checking is impossible (as the lock is being acquired/
released down the call tree), perform at least a lock level check.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1813,6 +1813,7 @@ int p2m_mem_paging_prep(struct domain *d
             goto out;
         /* Get a free page */
         ret = -ENOMEM;
+        page_alloc_mm_pre_lock(d);
         page = alloc_domheap_page(d, 0);
         if ( unlikely(page == NULL) )
             goto out;


