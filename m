Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6214293726
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 10:52:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8981.24167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUnN3-000484-Gq; Tue, 20 Oct 2020 08:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8981.24167; Tue, 20 Oct 2020 08:51:53 +0000
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
	id 1kUnN3-00047i-DV; Tue, 20 Oct 2020 08:51:53 +0000
Received: by outflank-mailman (input) for mailman id 8981;
 Tue, 20 Oct 2020 08:51:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KWTV=D3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kUnN2-00047d-AQ
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 08:51:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60b49909-be9c-4136-8178-d67340ccc431;
 Tue, 20 Oct 2020 08:51:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D73AAF44;
 Tue, 20 Oct 2020 08:51:50 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KWTV=D3=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kUnN2-00047d-AQ
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 08:51:52 +0000
X-Inumbo-ID: 60b49909-be9c-4136-8178-d67340ccc431
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 60b49909-be9c-4136-8178-d67340ccc431;
	Tue, 20 Oct 2020 08:51:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603183910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=arOgXeiLTKU2wh0YCFEyIQpNOe0gMByJ4Vpip6u4gUs=;
	b=L6ns0KGI+kutmE2u3/upVcEkNBgS5qKkk/wTYpjsXQf0ks8A9ZP4ysy9Mev6klPJ/EyZu2
	qWSrh4hIr+voFf7iC1c53YoXAm44SkWDbsQjQY0ty54UdehohZ9QNSAsbthCfyXEYQ6MRp
	gLOP65mdJW1GXL5i7oV+Iiz1DJtJfNw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0D73AAF44;
	Tue, 20 Oct 2020 08:51:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] tools/libs/ctrl: fix dumping of ballooned guest
Date: Tue, 20 Oct 2020 10:51:43 +0200
Message-Id: <20201020085143.21303-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A guest with memory < maxmem can't be dumped via xl dump-core without
an error message today:

xc: info: exceeded nr_pages (262144) losing pages

In case the last page of the guest isn't allocated the loop in
xc_domain_dumpcore_via_callback() will always spit out this message,
as the number of already dumped pages is tested before the next page
is checked to be valid.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
Unfortunately this patch isn't a complete fix, while I believe it is
needed. There is still a mismatch of exactly 1 page. I have no idea
where this could come from.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/ctrl/xc_core.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/tools/libs/ctrl/xc_core.c b/tools/libs/ctrl/xc_core.c
index e8c6fb96f9..d83e3726b6 100644
--- a/tools/libs/ctrl/xc_core.c
+++ b/tools/libs/ctrl/xc_core.c
@@ -818,16 +818,6 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
         {
             uint64_t gmfn;
             void *vaddr;
-            
-            if ( j >= nr_pages )
-            {
-                /*
-                 * When live dump-mode (-L option) is specified,
-                 * guest domain may increase memory.
-                 */
-                IPRINTF("exceeded nr_pages (%ld) losing pages", nr_pages);
-                goto copy_done;
-            }
 
             if ( !auto_translated_physmap )
             {
@@ -847,6 +837,12 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
                        continue;
                 }
 
+                if ( j >= nr_pages )
+                {
+                    j++;
+                    continue;
+                }
+
                 p2m_array[j].pfn = i;
                 p2m_array[j].gmfn = gmfn;
             }
@@ -855,6 +851,12 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
                 if ( !xc_core_arch_gpfn_may_present(&arch_ctxt, i) )
                     continue;
 
+                if ( j >= nr_pages )
+                {
+                    j++;
+                    continue;
+                }
+
                 gmfn = i;
                 pfn_array[j] = i;
             }
@@ -879,7 +881,15 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
         }
     }
 
-copy_done:
+    if ( j > nr_pages )
+    {
+        /*
+         * When live dump-mode (-L option) is specified,
+         * guest domain may increase memory.
+         */
+        IPRINTF("exceeded nr_pages (%ld) losing %ld pages", nr_pages, j - nr_pages);
+    }
+
     sts = dump_rtn(xch, args, dump_mem_start, dump_mem - dump_mem_start);
     if ( sts != 0 )
         goto out;
-- 
2.26.2


