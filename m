Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB892E0D8F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Dec 2020 17:50:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58002.101749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krkrA-0004iP-Mp; Tue, 22 Dec 2020 16:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58002.101749; Tue, 22 Dec 2020 16:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krkrA-0004i0-Jq; Tue, 22 Dec 2020 16:49:52 +0000
Received: by outflank-mailman (input) for mailman id 58002;
 Tue, 22 Dec 2020 16:49:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krkr9-0004hv-Dt
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 16:49:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 386c7b3d-15ff-4649-85be-522e3c86be0d;
 Tue, 22 Dec 2020 16:49:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C0E7AD0B;
 Tue, 22 Dec 2020 16:49:49 +0000 (UTC)
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
X-Inumbo-ID: 386c7b3d-15ff-4649-85be-522e3c86be0d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608655789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lrwHDbRBOm2TtPSNfHDaSsuqEFoecmGNV0uASlmEEUM=;
	b=ZCGeNmL6bjsI3MAzZOQCLOsnCtODk2VGdeO1dxKOsSc42PQ0XMZjiK/n7plfUYXrz4pIH2
	JW59NEqN8kF1oz+QCJ98YPJLJYo4pl/BDIf6yLdHc0iLglUpI15tDyurbK12yKVN98Ktyi
	R6u+HhgfZW4B/k4bi51ZrJgksFUsOxE=
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] lib/sort: adjust types
Message-ID: <37d6facf-3fb8-2171-4143-e5e0269fb637@suse.com>
Date: Tue, 22 Dec 2020 17:49:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

First and foremost do away with the use of plain int for sizes or size-
derived values. Use size_t, despite this requiring some adjustment to
the logic. Also replace u32 by uint32_t.

While not directly related also drop a leftover #ifdef from x86's
swap_ex - this was needed only back when 32-bit Xen was still a thing.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -37,8 +37,7 @@ static int init_or_livepatch cmp_ex(cons
 	return 0;
 }
 
-#ifndef swap_ex
-static void init_or_livepatch swap_ex(void *a, void *b, int size)
+static void init_or_livepatch swap_ex(void *a, void *b, size_t size)
 {
 	struct exception_table_entry *l = a, *r = b, tmp;
 	long delta = b - a;
@@ -49,7 +48,6 @@ static void init_or_livepatch swap_ex(vo
 	r->addr = tmp.addr - delta;
 	r->cont = tmp.cont - delta;
 }
-#endif
 
 void init_or_livepatch sort_exception_table(struct exception_table_entry *start,
                                  const struct exception_table_entry *stop)
--- a/xen/include/xen/sort.h
+++ b/xen/include/xen/sort.h
@@ -5,6 +5,6 @@
 
 void sort(void *base, size_t num, size_t size,
           int (*cmp)(const void *, const void *),
-          void (*swap)(void *, void *, int));
+          void (*swap)(void *, void *, size_t));
 
 #endif /* __XEN_SORT_H__ */
--- a/xen/lib/sort.c
+++ b/xen/lib/sort.c
@@ -6,14 +6,15 @@
 
 #include <xen/types.h>
 
-static void u32_swap(void *a, void *b, int size)
+static void u32_swap(void *a, void *b, size_t size)
 {
-    u32 t = *(u32 *)a;
-    *(u32 *)a = *(u32 *)b;
-    *(u32 *)b = t;
+    uint32_t t = *(uint32_t *)a;
+
+    *(uint32_t *)a = *(uint32_t *)b;
+    *(uint32_t *)b = t;
 }
 
-static void generic_swap(void *a, void *b, int size)
+static void generic_swap(void *a, void *b, size_t size)
 {
     char t;
 
@@ -43,18 +44,18 @@ static void generic_swap(void *a, void *
 
 void sort(void *base, size_t num, size_t size,
           int (*cmp)(const void *, const void *),
-          void (*swap)(void *, void *, int size))
+          void (*swap)(void *, void *, size_t size))
 {
     /* pre-scale counters for performance */
-    int i = (num / 2 - 1) * size, n = num * size, c, r;
+    size_t i = (num / 2) * size, n = num * size, c, r;
 
     if ( !swap )
         swap = (size == 4 ? u32_swap : generic_swap);
 
     /* heapify */
-    for ( ; i >= 0; i -= size )
+    while ( i > 0 )
     {
-        for ( r = i; r * 2 + size < n; r  = c )
+        for ( r = i -= size; r * 2 + size < n; r  = c )
         {
             c = r * 2 + size;
             if ( (c < n - size) && (cmp(base + c, base + c + size) < 0) )
@@ -66,8 +67,9 @@ void sort(void *base, size_t num, size_t
     }
 
     /* sort */
-    for ( i = n - size; i >= 0; i -= size )
+    for ( i = n; i > 0; )
     {
+        i -= size;
         swap(base, base + i, size);
         for ( r = 0; r * 2 + size < i; r = c )
         {

