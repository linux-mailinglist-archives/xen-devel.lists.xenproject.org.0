Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588848A861D
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 16:38:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707560.1105608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Qa-0006L6-Kj; Wed, 17 Apr 2024 14:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707560.1105608; Wed, 17 Apr 2024 14:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx6Qa-0006IP-Gu; Wed, 17 Apr 2024 14:38:24 +0000
Received: by outflank-mailman (input) for mailman id 707560;
 Wed, 17 Apr 2024 14:38:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VNGY=LW=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1rx6QZ-0005ks-D5
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 14:38:23 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23772597-fcc8-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 16:38:22 +0200 (CEST)
Delivered-To: dpsmith@apertussolutions.com
Received: by mx.zohomail.com with SMTPS id 1713364649144455.33632451475705;
 Wed, 17 Apr 2024 07:37:29 -0700 (PDT)
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
X-Inumbo-ID: 23772597-fcc8-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; t=1713364651; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IwtaPnAloT2CK6ja2AAR64zZFYaYa90zbVT8TjhYMoWU/vCEUFIDMuP5vSVeRebI8HpnNNSIbzVv80CGfb5i7GwrfRQAiwHx+F99F7hyHgEq77kEMQZkUUpQ+uwA62CQmdAUHEBa5mdy01CgPkAW8EF15M0tlr8twHN0Fd/FCQM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1713364651; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yrmeW+pze3W1tZ6Z4iQBLrbBIu7qXPzLrkvg21VCRCg=; 
	b=fzYSrpqtg4xWvw2Wfc/L7wnKtpYhcnwuw8DND+2qDrwgVBLm3Bf8tyMozMPJt5QAzVUGGdqS0evkxO0zuHMd7YUHmEqEKr92Dbz2rRrqjyIH0OwLJ7vkEHskMe5XwIaMmZ/6u3ZET5VkR+uQEADk1hGDTD5pLkNRg/AVXfNUYF0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1713364651;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=yrmeW+pze3W1tZ6Z4iQBLrbBIu7qXPzLrkvg21VCRCg=;
	b=Rto767t2r9TNNb0rHoQDnPiw3Z6rUAyftwBrvaJSZ0pYqKUpqa+CflxhyJjO/SUy
	aLemBahc3x3OQDB+qdkNoP0GnB6p9u6jlUR25I001zp68y7KUXkmhDw2UCLRq2E6pQo
	T0yXdfqtg03lpZ5bOANsQFe0bueYwjGUpB+UZE+k=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 3/6] gzip: remove custom memory allocator
Date: Wed, 17 Apr 2024 10:37:13 -0400
Message-Id: <20240417143716.27189-4-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240417143716.27189-1-dpsmith@apertussolutions.com>
References: <20240417143716.27189-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

All the other decompression routines use xmalloc_bytes(), thus there is no
reason for gzip to be handling its own allocation of memory. In fact, there is
a bug somewhere in the allocator as decompression started to break when adding
additional allocations. Instead of troubleshooting the allocator, replace it
with xmalloc_bytes().

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/common/gzip/gunzip.c  | 17 ++------------
 xen/common/gzip/inflate.c | 47 ---------------------------------------
 2 files changed, 2 insertions(+), 62 deletions(-)

diff --git a/xen/common/gzip/gunzip.c b/xen/common/gzip/gunzip.c
index 1bcb007395ba..1b448d6e3655 100644
--- a/xen/common/gzip/gunzip.c
+++ b/xen/common/gzip/gunzip.c
@@ -4,12 +4,7 @@
 #include <xen/lib.h>
 #include <xen/mm.h>
 
-#define HEAPORDER 3
-
 static unsigned char *__initdata window;
-#define memptr long
-static memptr __initdata free_mem_ptr;
-static memptr __initdata free_mem_end_ptr;
 
 #define WSIZE           0x80000000U
 
@@ -24,6 +19,8 @@ static unsigned int __initdata outcnt;
 
 #define OF(args)        args
 
+#define malloc(a)       xmalloc_bytes(a)
+#define free(a)         xfree(a)
 #define memzero(s, n)   memset((s), 0, (n))
 
 typedef unsigned char   uch;
@@ -108,14 +105,6 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
         return 1;
 
     window = (unsigned char *)output;
-
-    free_mem_ptr = (unsigned long)alloc_xenheap_pages(HEAPORDER, 0);
-    if ( !free_mem_ptr )
-        return -ENOMEM;
-
-    free_mem_end_ptr = free_mem_ptr + (PAGE_SIZE << HEAPORDER);
-    init_allocator();
-
     inbuf = (unsigned char *)image;
     insize = image_len;
     inptr = 0;
@@ -132,8 +121,6 @@ __init int perform_gunzip(char *output, char *image, unsigned long image_len)
         rc = 0;
     }
 
-    free_xenheap_pages((void *)free_mem_ptr, HEAPORDER);
-
     return rc;
 }
 
diff --git a/xen/common/gzip/inflate.c b/xen/common/gzip/inflate.c
index 73ccfc2bdc6c..512d9bf0ee2e 100644
--- a/xen/common/gzip/inflate.c
+++ b/xen/common/gzip/inflate.c
@@ -228,53 +228,6 @@ static const ush mask_bits[] = {
 #define NEEDBITS(n) {while(k<(n)){b|=((ulg)NEXTBYTE())<<k;k+=8;}}
 #define DUMPBITS(n) {b>>=(n);k-=(n);}
 
-#ifndef NO_INFLATE_MALLOC
-/*
- * A trivial malloc implementation, adapted from
- *  malloc by Hannu Savolainen 1993 and Matthias Urlichs 1994
- */
-
-static unsigned long __initdata malloc_ptr;
-static int __initdata malloc_count;
-
-static void __init init_allocator(void)
-{
-    malloc_ptr = free_mem_ptr;
-    malloc_count = 0;
-}
-
-static void *__init malloc(int size)
-{
-    void *p;
-
-    if (size < 0)
-        error("Malloc error");
-    if (!malloc_ptr)
-        malloc_ptr = free_mem_ptr;
-
-    malloc_ptr = (malloc_ptr + 3) & ~3;     /* Align */
-
-    p = (void *)malloc_ptr;
-    malloc_ptr += size;
-
-    if (free_mem_end_ptr && malloc_ptr >= free_mem_end_ptr)
-        error("Out of memory");
-
-    malloc_count++;
-    return p;
-}
-
-static void __init free(void *where)
-{
-    malloc_count--;
-    if (!malloc_count)
-        malloc_ptr = free_mem_ptr;
-}
-#else
-#define malloc(a) kmalloc(a, GFP_KERNEL)
-#define free(a) kfree(a)
-#endif
-
 /*
  * Huffman code decoding is performed using a multi-level table lookup.
  * The fastest way to decode is to simply build a lookup table whose
-- 
2.30.2


