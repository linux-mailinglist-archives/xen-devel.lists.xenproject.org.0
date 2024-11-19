Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 078E29D27D9
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:14:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840128.1255966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOzB-0000mT-GO; Tue, 19 Nov 2024 14:13:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840128.1255966; Tue, 19 Nov 2024 14:13:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOzB-0000im-2X; Tue, 19 Nov 2024 14:13:45 +0000
Received: by outflank-mailman (input) for mailman id 840128;
 Tue, 19 Nov 2024 14:13:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDt+=SO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tDOz8-0007nQ-Rd
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:13:42 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a1e6284-a680-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:13:40 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5cfadf851e2so4527804a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:13:40 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df4e7bfsm655228166b.42.2024.11.19.06.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:13:39 -0800 (PST)
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
X-Inumbo-ID: 7a1e6284-a680-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjdhMWU2Mjg0LWE2ODAtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI1NjIwLjgxMDAyNSwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732025620; x=1732630420; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uer5hFgR43ABSJ0pS6NmbiLoEW2DGJcmVhOAoFMQvSI=;
        b=ndVbMCmDXLre9XSlOBgDiMX/74K7JHmCu4CMFpsaMlhLpD2urExZAsvk18H/k0ZPCQ
         JRuMgyRQOArILSC2bTgQqInC9qQd/BDwPxgNIEB4PMz7gaBs1tSq3J/I8q7+hDBOo36F
         A9FJbR/k4i1X226ewCGOjAi71852p7xduwMX3Ibm52ZyocLdwnf/bLyfBnJleiFYJnEC
         LAfEaw6W5NBufkVUQSMHk568dmpC4prSdPjbj+EtnVu0MOYXwzk40q+HSK2leqz2GfXL
         sTA6tGJCe2xfetaiHPa/1uroghehoFOOBNcjBaoLmBCLmtBh/M8ZpMm7DuDbviK/BncO
         tf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025620; x=1732630420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uer5hFgR43ABSJ0pS6NmbiLoEW2DGJcmVhOAoFMQvSI=;
        b=bdl9c8Zgi7rUflWeW5LuGkEgnefPONso2TGzN8LBF4ycxl7vcCKL1Owxft4l/+Dqvd
         512BjQ6O6KMepkzES+WLh1jBN3xMIBJBcJlwk8HSdhB9oqtCKjweJotj5NP0TZLNkq0D
         xdKkAQEF9su4SfXlcmytuZhpoaiED501NmNLcTbPK3cr+F6jhuTDYwU6OXHPXpXwQvYz
         hBYyTkgZsnKZpDqb1oGP9SEJsAnB22iKeK99BFXgY7Mi7CyEqCjb+NZgMo+qc4TSFA2A
         mEknlZtvnZg+PQsMpTtTAmVIs1gzu5A94jztRBYK0BfF0F01q1GgFY8PyOt+JfWEATLu
         i3vA==
X-Gm-Message-State: AOJu0YzBgA03Iuieov9WvNAMx4wc0wqkw0SaSRyInV6EVJW9SnJRkQB3
	U1+Ljdbrl2RUDmCQvS/1WvvDpLZyoDoARVdWL/IV5MsWKAipaLWMgYeDoZiI+auGDqQUvKNXS/5
	3
X-Google-Smtp-Source: AGHT+IH+9A7o5Ci7KbPH6cwZ0XuRuZEcmB8xC+Qsc7y118QKANgbRI7cqELzvF0XD8c7z0NIxCbZHQ==
X-Received: by 2002:a05:6402:50cf:b0:5cf:c99d:2db3 with SMTP id 4fb4d7f45d1cf-5cfc99d2e36mr5847632a12.29.1732025620020;
        Tue, 19 Nov 2024 06:13:40 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 08/12] xen/page_alloc: introduce preserved page flags macro
Date: Tue, 19 Nov 2024 15:13:25 +0100
Message-ID: <20241119141329.44221-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PGC_static, PGC_extra and PGC_broken need to be preserved when assigning a
page. Define a new macro that groups those flags and use it instead of or'ing
every time.

To make preserved flags even more meaningful, they are kept also when
switching state in mark_page_free().
Enforce the removal of PGC_extra before freeing domain pages as this is
considered an error and can cause ASSERT violations.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v10:
- fixed commit message
v9:
- add PGC_broken to PGC_preserved
- clear PGC_extra in alloc_domheap_pages() only if MEMF_no_refcount is set
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
 xen/common/page_alloc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 7b911b5ed9..34cd473150 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -160,6 +160,7 @@
 #endif
 
 #define PGC_no_buddy_merge PGC_static
+#define PGC_preserved (PGC_extra | PGC_static | PGC_broken)
 
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
@@ -1427,12 +1428,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
     {
     case PGC_state_inuse:
         BUG_ON(pg->count_info & PGC_broken);
-        pg->count_info = PGC_state_free;
+        pg->count_info = PGC_state_free | (pg->count_info & PGC_preserved);
         break;
 
     case PGC_state_offlining:
-        pg->count_info = (pg->count_info & PGC_broken) |
-                         PGC_state_offlined;
+        pg->count_info = (pg->count_info & PGC_preserved) | PGC_state_offlined;
         pg_offlined = true;
         break;
 
@@ -2366,7 +2366,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
+            ASSERT(!(pg[i].count_info & ~PGC_preserved));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2426,7 +2426,7 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
+            (pg[i].count_info & PGC_preserved) | PGC_allocated | 1;
 
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
@@ -2485,6 +2485,14 @@ struct page_info *alloc_domheap_pages(
         }
         if ( assign_page(pg, order, d, memflags) )
         {
+            if ( memflags & MEMF_no_refcount )
+            {
+                unsigned long i;
+
+                for ( i = 0; i < (1UL << order); i++ )
+                    pg[i].count_info &= ~PGC_extra;
+            }
+
             free_heap_pages(pg, order, memflags & MEMF_no_scrub);
             return NULL;
         }
@@ -2539,6 +2547,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
                 {
                     ASSERT(d->extra_pages);
                     d->extra_pages--;
+                    pg[i].count_info &= ~PGC_extra;
                 }
             }
 
-- 
2.43.0


