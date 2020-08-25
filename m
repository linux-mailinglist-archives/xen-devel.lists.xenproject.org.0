Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5246251896
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 14:31:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAY6c-0000q1-45; Tue, 25 Aug 2020 12:31:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAY6b-0000pw-Dn
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 12:31:13 +0000
X-Inumbo-ID: 1a0bc2d2-a64b-4f71-a707-6dcd72f934cf
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a0bc2d2-a64b-4f71-a707-6dcd72f934cf;
 Tue, 25 Aug 2020 12:31:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B633AD77;
 Tue, 25 Aug 2020 12:31:42 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] make better use of mfn local variable in free_heap_pages()
Message-ID: <e129d355-f0ba-eb1c-9755-f6f38b9212e4@suse.com>
Date: Tue, 25 Aug 2020 14:31:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Besides the one use that there is in the function (of the value
calculated at function entry), there are two more places where the
redundant page-to-address conversion can be avoided.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1380,7 +1380,7 @@ static void free_heap_pages(
 {
     unsigned long mask;
     mfn_t mfn = page_to_mfn(pg);
-    unsigned int i, node = phys_to_nid(page_to_maddr(pg)), tainted = 0;
+    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), tainted = 0;
     unsigned int zone = page_to_zone(pg);
 
     ASSERT(order <= MAX_ORDER);
@@ -1417,7 +1417,7 @@ static void free_heap_pages(
         default:
             printk(XENLOG_ERR
                    "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
-                   i, mfn_x(page_to_mfn(pg + i)),
+                   i, mfn_x(mfn) + i,
                    pg[i].count_info, pg[i].v.free.order,
                    pg[i].u.free.val, pg[i].tlbflush_timestamp);
             BUG();

