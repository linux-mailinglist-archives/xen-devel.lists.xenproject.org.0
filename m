Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD4D8B9F07
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715952.1117988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zil-0007rJ-1Y; Thu, 02 May 2024 16:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715952.1117988; Thu, 02 May 2024 16:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zik-0007hp-PH; Thu, 02 May 2024 16:55:46 +0000
Received: by outflank-mailman (input) for mailman id 715952;
 Thu, 02 May 2024 16:55:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Nh=MF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s2Zij-0006Lf-8G
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:55:45 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1013486-08a4-11ef-909b-e314d9c70b13;
 Thu, 02 May 2024 18:55:44 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a51addddbd4so947878966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:55:44 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 mq30-20020a170907831e00b00a5987fbfb83sm29103ejc.152.2024.05.02.09.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 09:55:43 -0700 (PDT)
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
X-Inumbo-ID: d1013486-08a4-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1714668944; x=1715273744; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzaTNPxmLK/IqCNOK/3y/1wQIjSUY/Zy4G4Lp5Bcs1Q=;
        b=sgDBb+zj8XWJ3PJG/IdcqIhmZwejruC7M8BY0Q/Ric7F5upCVlZBicUv1Gzjv0XWUF
         hHGYY0AEXym6WALeb62wA+jjB+jR/l0PafNaqpwEswZPs6/yEt7IfdcH0nLCt92BFTqZ
         /4zaItUxlTdta6gq4j0NcMKPvqV8dtRkyNs/qr3XC6HJoenViLo6lHaZA5AVtr+7Ov1c
         CilMIG6mXKK/fsepZ4F0ULULDvfn2fnUkiEtFHQuoMaar3g3UjDH8fIvQv3mq+ENdxCA
         0Vcyvthw+u/M0wTsKPXFZbVK6E5U4eGzigSj8BqP/5ZACF3hJ1MeN9G6siS33m0YXp/S
         ttrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714668944; x=1715273744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzaTNPxmLK/IqCNOK/3y/1wQIjSUY/Zy4G4Lp5Bcs1Q=;
        b=lL0yma5FdFVGiMsv73YeyxGNTAGRuQAT1hokl0il9QalF8c6A1Hr+2NuKak0AH69nm
         EMqD4TmbUKiEhCq3Yc/UEj2rNp5wKCZv6OPw8+XWfpb7VgEzNDAtttur0Lq2y0kiX3f8
         M2PqyXUNuEP3hYQgQjpO4M0u6yMED3BggmHChsCPbJtJZVqLv0W5QEPbuMB4YmXp1VyF
         JGL9b+6G2w85MVZ+zhWkkWXtjcXDipb5Jt06DKMtAZb1MTsqRAEwjdm+flKPAPzXpsKi
         uD29fQwduafemHj83m5nwMcNFkCqdrIjs/bWjzdmw2gEJ7OHb0laJhzALCzl2PRgpiKy
         KRxg==
X-Gm-Message-State: AOJu0Yz4mIlR3o7FBDw9lOJNNOdAuhDIq8rj5e1OOWTmmdvostmEM/gz
	7yuLpEvNVQMvauKZ8SpPv3bAdP5SzJC7NlJLoFFxnVaSCnXt3pLE+5rne5IUEuHD4elbvUG0pen
	U
X-Google-Smtp-Source: AGHT+IH8hfIaaSrExuqTbxGoNRBRtFoen/HYOr7HDoVeH46zsllKhxPxkt9DdQj/sz+Sb4NSSHJlqA==
X-Received: by 2002:a17:906:7fd2:b0:a51:8145:6877 with SMTP id r18-20020a1709067fd200b00a5181456877mr65635ejs.37.1714668944045;
        Thu, 02 May 2024 09:55:44 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 08/13] xen/page_alloc: introduce preserved page flags macro
Date: Thu,  2 May 2024 18:55:28 +0200
Message-Id: <20240502165533.319988-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PGC_static and PGC_extra needs to be preserved when assigning a page.
Define a new macro that groups those flags and use it instead of or'ing
every time.

To make preserved flags even more meaningful, they are kept also when
switching state in mark_page_free().
Enforce the removal of PGC_extra before freeing new pages as this is
considered an error and can cause ASSERT violations.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v8:
- fixed PGC_extra ASSERT fail in alloc_domheap_pages() by removing PGC_extra
  before freeing
v7:
- PGC_preserved used also in mark_page_free()
v6:
- preserved_flags renamed to PGC_preserved
- PGC_preserved is used only in assign_pages()
v5:
- new patch
---
 xen/common/page_alloc.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index d2032a79b0..e71b571a3b 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -159,6 +159,7 @@
 #endif
 
 #define PGC_no_buddy_merge PGC_static
+#define PGC_preserved (PGC_extra | PGC_static)
 
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
@@ -1426,11 +1427,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
     {
     case PGC_state_inuse:
         BUG_ON(pg->count_info & PGC_broken);
-        pg->count_info = PGC_state_free;
+        pg->count_info = PGC_state_free | (pg->count_info & PGC_preserved);
         break;
 
     case PGC_state_offlining:
-        pg->count_info = (pg->count_info & PGC_broken) |
+        pg->count_info = (pg->count_info & (PGC_broken | PGC_preserved)) |
                          PGC_state_offlined;
         pg_offlined = true;
         break;
@@ -2365,7 +2366,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
+            ASSERT(!(pg[i].count_info & ~PGC_preserved));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2425,7 +2426,7 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
+            (pg[i].count_info & PGC_preserved) | PGC_allocated | 1;
 
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
@@ -2484,6 +2485,11 @@ struct page_info *alloc_domheap_pages(
         }
         if ( assign_page(pg, order, d, memflags) )
         {
+            unsigned long i;
+
+            for ( i = 0; i < (1UL << order); i++ )
+                pg[i].count_info &= ~PGC_extra;
+
             free_heap_pages(pg, order, memflags & MEMF_no_scrub);
             return NULL;
         }
@@ -2538,6 +2544,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
                 {
                     ASSERT(d->extra_pages);
                     d->extra_pages--;
+                    pg[i].count_info &= ~PGC_extra;
                 }
             }
 
-- 
2.34.1


