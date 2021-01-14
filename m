Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCD02F63B9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 16:08:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67112.119520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Ek-0006Ct-2a; Thu, 14 Jan 2021 15:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67112.119520; Thu, 14 Jan 2021 15:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l04Ej-0006CX-Ue; Thu, 14 Jan 2021 15:08:33 +0000
Received: by outflank-mailman (input) for mailman id 67112;
 Thu, 14 Jan 2021 15:08:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l04Ei-0006CI-D6
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 15:08:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f57a0e7c-3742-4032-b794-79436b53e1d5;
 Thu, 14 Jan 2021 15:08:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8F137B937;
 Thu, 14 Jan 2021 15:08:30 +0000 (UTC)
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
X-Inumbo-ID: f57a0e7c-3742-4032-b794-79436b53e1d5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610636910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1s8DfzRnhCSsOYL5X+GZvFi3Ceamwj5BP+sH8v3wNIY=;
	b=vAU4FsnnnNH2cgdW/9AcFN393L558CECeVT8D1gr/ccltd83AOGNsHczh82WGjQjTwGHtL
	HW043HkK5eEvDSC2wbCOmlDwo9jylBK+L/wpnihyHV7y92be4ZVYe1sEJzJ4D3/BDM7RJR
	1fZeqzLoQhERAuI/uhcfMubOa4GbD2E=
Subject: [PATCH 11/17] x86/shadow: polish shadow_write_entries()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Message-ID: <57495f9e-4a03-0317-6985-d32a694194ef@suse.com>
Date: Thu, 14 Jan 2021 16:08:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

First of all, avoid the initial dummy write: Try to write the actual
new value instead, and start the loop from 1 if this was successful.
Further, drop safe_write_entry() and use write_atomic() instead. This
eliminates the need for the BUILD_BUG_ON() there at the same time.

Then
- use const and unsigned,
- drop a redundant NULL check,
- don't open-code PAGE_OFFSET() and IS_ALIGNED(),
- adjust comment style.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/shadow/multi.c
+++ b/xen/arch/x86/mm/shadow/multi.c
@@ -746,50 +746,50 @@ l1e_propagate_from_guest(struct vcpu *v,
  * functions which ever write (non-zero) data onto a shadow page.
  */
 
-static inline void safe_write_entry(void *dst, void *src)
-/* Copy one PTE safely when processors might be running on the
- * destination pagetable.   This does *not* give safety against
- * concurrent writes (that's what the paging lock is for), just
- * stops the hardware picking up partially written entries. */
-{
-    volatile unsigned long *d = dst;
-    unsigned long *s = src;
-    ASSERT(!((unsigned long) d & (sizeof (shadow_l1e_t) - 1)));
-    /* In 64-bit, sizeof(pte) == sizeof(ulong) == 1 word,
-     * which will be an atomic write, since the entry is aligned. */
-    BUILD_BUG_ON(sizeof (shadow_l1e_t) != sizeof (unsigned long));
-    *d = *s;
-}
-
-
 static inline void
-shadow_write_entries(void *d, void *s, int entries, mfn_t mfn)
-/* This function does the actual writes to shadow pages.
+shadow_write_entries(void *d, const void *s, unsigned int entries, mfn_t mfn)
+/*
+ * This function does the actual writes to shadow pages.
  * It must not be called directly, since it doesn't do the bookkeeping
- * that shadow_set_l*e() functions do. */
+ * that shadow_set_l*e() functions do.
+ *
+ * Copy PTEs safely when processors might be running on the
+ * destination pagetable.  This does *not* give safety against
+ * concurrent writes (that's what the paging lock is for), just
+ * stops the hardware picking up partially written entries.
+ */
 {
     shadow_l1e_t *dst = d;
-    shadow_l1e_t *src = s;
+    const shadow_l1e_t *src = s;
     void *map = NULL;
-    int i;
+    unsigned int i = 0;
 
-    /* Because we mirror access rights at all levels in the shadow, an
+    /*
+     * Because we mirror access rights at all levels in the shadow, an
      * l2 (or higher) entry with the RW bit cleared will leave us with
      * no write access through the linear map.
      * We detect that by writing to the shadow with put_unsafe() and
-     * using map_domain_page() to get a writeable mapping if we need to. */
-    if ( put_unsafe(*dst, dst) )
+     * using map_domain_page() to get a writeable mapping if we need to.
+     */
+    if ( put_unsafe(*src, dst) )
     {
         perfc_incr(shadow_linear_map_failed);
         map = map_domain_page(mfn);
-        dst = map + ((unsigned long)dst & (PAGE_SIZE - 1));
+        dst = map + PAGE_OFFSET(dst);
+    }
+    else
+    {
+        ++src;
+        ++dst;
+        i = 1;
     }
 
+    ASSERT(IS_ALIGNED((unsigned long)dst, sizeof(*dst)));
 
-    for ( i = 0; i < entries; i++ )
-        safe_write_entry(dst++, src++);
+    for ( ; i < entries; i++ )
+        write_atomic(&dst++->l1, src++->l1);
 
-    if ( map != NULL ) unmap_domain_page(map);
+    unmap_domain_page(map);
 }
 
 /* type is only used to distinguish grant map pages from ordinary RAM


