Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E7D2AEE59
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 11:02:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24586.51902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcmwn-0006nh-85; Wed, 11 Nov 2020 10:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24586.51902; Wed, 11 Nov 2020 10:01:49 +0000
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
	id 1kcmwn-0006nI-4T; Wed, 11 Nov 2020 10:01:49 +0000
Received: by outflank-mailman (input) for mailman id 24586;
 Wed, 11 Nov 2020 10:01:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kcmwl-0006nD-EF
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 10:01:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c8eb5f3-ef88-44dc-b668-8c19ca45da39;
 Wed, 11 Nov 2020 10:01:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B3A5FAC23;
 Wed, 11 Nov 2020 10:01:45 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kcmwl-0006nD-EF
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 10:01:47 +0000
X-Inumbo-ID: 0c8eb5f3-ef88-44dc-b668-8c19ca45da39
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0c8eb5f3-ef88-44dc-b668-8c19ca45da39;
	Wed, 11 Nov 2020 10:01:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605088905;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KZhvr+aHJsAIl4S2AH81gc6u7VXj74Lri8KHt68rkDg=;
	b=XJBwr9YOkcmTzxprZy6Ug8GISMnzb+t/rr35/nudQCWCPCqa7sTa1Kpcus/IjmGXrlz+7E
	0PC77OTnsOo0R4R4s8DJvo0V+EBVHrgteESMiN7t2VHbbDIq+lFZnOsVA6piHrVL+U+FCA
	BYMbEVMYx8RdUJH2extVX8lLm3zccKU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B3A5FAC23;
	Wed, 11 Nov 2020 10:01:45 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] tools/libs/ctrl: fix dumping of ballooned guest
Date: Wed, 11 Nov 2020 11:01:43 +0100
Message-Id: <20201111100143.13820-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A guest with memory < maxmem often can't be dumped via xl dump-core
without an error message today:

xc: info: exceeded nr_pages (262144) losing pages

In case the last page of the guest isn't allocated the loop in
xc_domain_dumpcore_via_callback() will always spit out this message,
as the number of already dumped pages is tested before the next page
is checked to be valid.

The guest's p2m_size might be lower than expected, so this should be
tested in order to avoid reading past the end of it.

The guest might use high bits in p2m entries to flag special cases like
foreign mappings. Entries with an MFN larger than the highest MFN of
the host should be skipped.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/ctrl/xc_core.c | 42 +++++++++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/tools/libs/ctrl/xc_core.c b/tools/libs/ctrl/xc_core.c
index e8c6fb96f9..b47ab2f6d8 100644
--- a/tools/libs/ctrl/xc_core.c
+++ b/tools/libs/ctrl/xc_core.c
@@ -439,6 +439,7 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
     unsigned long i;
     unsigned long j;
     unsigned long nr_pages;
+    unsigned long max_mfn;
 
     xc_core_memory_map_t *memory_map = NULL;
     unsigned int nr_memory_map;
@@ -577,6 +578,10 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
                                    &p2m, &dinfo->p2m_size);
         if ( sts != 0 )
             goto out;
+
+        sts = xc_maximum_ram_page(xch, &max_mfn);
+        if ( sts != 0 )
+            goto out;
     }
     else
     {
@@ -818,19 +823,12 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
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
+                if ( i >= dinfo->p2m_size )
+                    break;
+
                 if ( dinfo->guest_width >= sizeof(unsigned long) )
                 {
                     if ( dinfo->guest_width == sizeof(unsigned long) )
@@ -846,6 +844,14 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
                     if ( gmfn == (uint32_t)INVALID_PFN )
                        continue;
                 }
+                if ( gmfn > max_mfn )
+                    continue;
+
+                if ( j >= nr_pages )
+                {
+                    j++;
+                    continue;
+                }
 
                 p2m_array[j].pfn = i;
                 p2m_array[j].gmfn = gmfn;
@@ -855,6 +861,12 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
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
@@ -879,7 +891,15 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
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


