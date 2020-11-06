Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABB52A92E0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 10:37:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20555.46551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kayBf-0001O8-Qc; Fri, 06 Nov 2020 09:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20555.46551; Fri, 06 Nov 2020 09:37:39 +0000
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
	id 1kayBf-0001Ni-NZ; Fri, 06 Nov 2020 09:37:39 +0000
Received: by outflank-mailman (input) for mailman id 20555;
 Fri, 06 Nov 2020 09:37:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kayBd-0001NW-FJ
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:37:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f65050a-58fa-413f-86d4-db1c8e387c1c;
 Fri, 06 Nov 2020 09:37:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 021C1AB8F;
 Fri,  6 Nov 2020 09:37:36 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kayBd-0001NW-FJ
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 09:37:37 +0000
X-Inumbo-ID: 7f65050a-58fa-413f-86d4-db1c8e387c1c
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7f65050a-58fa-413f-86d4-db1c8e387c1c;
	Fri, 06 Nov 2020 09:37:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604655456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Uv1162pg+vDf/sXxEE8AWt03fZAO5xoSiLQGvgoxcW8=;
	b=e+aBHt4xb0KALE3ZJ8GWRgvj8SifBmznTKK5bGPcbEsSCcX3i8tetmJLH8F1XCiH9vxYZX
	YfPLtbWIs+pQMEnxNcH72O+9ej8ZT7DqL1NrhpCCVln5Qf3oxpRrWfLKahZmyRtLlYYQpA
	NFCw3bSMVOF510ducdTz8jxZLf8aQYE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 021C1AB8F;
	Fri,  6 Nov 2020 09:37:36 +0000 (UTC)
Subject: [PATCH v2 6/9] x86/p2m: avoid unnecessary calls of
 write_p2m_entry_pre() hook
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Message-ID: <3386a823-5560-9cf3-5711-219d5bd0e54e@suse.com>
Date: Fri, 6 Nov 2020 10:37:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <4b63025f-164c-2e93-3d54-7a7f145ad046@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

When shattering a large page, we first construct the new page table page
and only then hook it up. The "pre" hook in this case does nothing, for
the page starting out all blank. Avoid 512 calls into shadow code in
this case by passing in INVALID_GFN, indicating the page being updated
is (not yet) associated with any GFN. (The alternative to this change
would be to actually pass in a correct GFN, which can't be all the same
on every loop iteration.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/mm/p2m-pt.c
+++ b/xen/arch/x86/mm/p2m-pt.c
@@ -134,7 +134,7 @@ static int write_p2m_entry(struct p2m_do
 
         paging_lock(d);
 
-        if ( p2m->write_p2m_entry_pre )
+        if ( p2m->write_p2m_entry_pre && gfn != gfn_x(INVALID_GFN) )
             p2m->write_p2m_entry_pre(d, gfn, p, new, level);
 
         oflags = l1e_get_flags(*p);
@@ -290,7 +290,8 @@ p2m_next_level(struct p2m_domain *p2m, v
         {
             new_entry = l1e_from_pfn(pfn | (i << ((level - 1) * PAGETABLE_ORDER)),
                                      flags);
-            rc = write_p2m_entry(p2m, gfn, l1_entry + i, new_entry, level);
+            rc = write_p2m_entry(p2m, gfn_x(INVALID_GFN), l1_entry + i,
+                                 new_entry, level);
             if ( rc )
             {
                 unmap_domain_page(l1_entry);


