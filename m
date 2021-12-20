Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B9B47B0DE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 17:07:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249854.430270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLC9-0005YU-0D; Mon, 20 Dec 2021 16:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249854.430270; Mon, 20 Dec 2021 16:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzLC8-0005RG-PP; Mon, 20 Dec 2021 16:07:24 +0000
Received: by outflank-mailman (input) for mailman id 249854;
 Mon, 20 Dec 2021 16:07:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEV=RF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mzLC7-00055w-8c
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 16:07:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e89f5515-61ae-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 17:07:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8C06B218F9;
 Mon, 20 Dec 2021 16:07:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 60D7B13DAC;
 Mon, 20 Dec 2021 16:07:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gIdVFjeqwGEUTAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Dec 2021 16:07:19 +0000
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
X-Inumbo-ID: e89f5515-61ae-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1640016439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POjxJaAzzZfNKLwq8GHwwKNxLxPxY05Rtom00f9HoLs=;
	b=DWDOfJA+puFbtAWZuJ7ORNsrBHHByIxVt5Ct3fW6WHOQwjgHh5Mct3pwvJBCgcxZ/gHkFe
	t1m8cf7IjZuS5omEBLcxBOJBVlNi3KG5Wb6mqSwxK+zr6/bD75NROoCs9H5MZ/6/X6Ehwp
	Z+3h7ZW693CQz7mU/TpRqUO+ViHT35c=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 03/10] mini-os: don't assume contiguous RAM when initializing in PVH mode
Date: Mon, 20 Dec 2021 17:07:09 +0100
Message-Id: <20211220160716.4159-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211220160716.4159-1-jgross@suse.com>
References: <20211220160716.4159-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sizing the available memory should respect memory holes, so look at
the memory map when setting the boundary for the memory allocator.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- rename "max" to "start" (Samuel Thibault)
---
 arch/x86/mm.c  |  6 +-----
 e820.c         | 14 ++++++++------
 include/e820.h |  2 +-
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/x86/mm.c b/arch/x86/mm.c
index 8df93da..3bf6170 100644
--- a/arch/x86/mm.c
+++ b/arch/x86/mm.c
@@ -107,7 +107,6 @@ void arch_mm_preinit(void *p)
 {
     long ret;
     domid_t domid = DOMID_SELF;
-    unsigned long max;
 
     pt_base = page_table_base;
     first_free_pfn = PFN_UP(to_phys(&_end));
@@ -117,11 +116,8 @@ void arch_mm_preinit(void *p)
         xprintk("could not get memory size\n");
         do_exit();
     }
-    last_free_pfn = ret;
 
-    max = e820_get_maxpfn();
-    if ( max < last_free_pfn )
-        last_free_pfn = max;
+    last_free_pfn = e820_get_maxpfn(ret);
 }
 #endif
 
diff --git a/e820.c b/e820.c
index 1770158..6d15cdf 100644
--- a/e820.c
+++ b/e820.c
@@ -285,10 +285,10 @@ void arch_print_memmap(void)
 }
 #endif
 
-unsigned long e820_get_maxpfn(void)
+unsigned long e820_get_maxpfn(unsigned long pages)
 {
     int i;
-    unsigned long pfn, max = 0;
+    unsigned long pfns, start = 0;
 
     e820_get_memmap();
 
@@ -296,10 +296,12 @@ unsigned long e820_get_maxpfn(void)
     {
         if ( e820_map[i].type != E820_RAM )
             continue;
-        pfn = (e820_map[i].addr + e820_map[i].size) >> PAGE_SHIFT;
-        if ( pfn > max )
-            max = pfn;
+        pfns = e820_map[i].size >> PAGE_SHIFT;
+        start = e820_map[i].addr >> PAGE_SHIFT;
+        if ( pages <= pfns )
+            return start + pages;
+        pages -= pfns;
     }
 
-    return max;
+    return start + pfns;
 }
diff --git a/include/e820.h b/include/e820.h
index af2129f..6a57f05 100644
--- a/include/e820.h
+++ b/include/e820.h
@@ -49,6 +49,6 @@ struct __packed e820entry {
 extern struct e820entry e820_map[];
 extern unsigned e820_entries;
 
-unsigned long e820_get_maxpfn(void);
+unsigned long e820_get_maxpfn(unsigned long pages);
 
 #endif /*__E820_HEADER*/
-- 
2.26.2


