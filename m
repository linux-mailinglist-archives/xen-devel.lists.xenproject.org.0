Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797C39AFEEB
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 11:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825712.1240073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4GyD-0007u9-6K; Fri, 25 Oct 2024 09:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825712.1240073; Fri, 25 Oct 2024 09:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4GyC-0007q3-VP; Fri, 25 Oct 2024 09:51:00 +0000
Received: by outflank-mailman (input) for mailman id 825712;
 Fri, 25 Oct 2024 09:50:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3YV=RV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t4GyB-0006YL-Eb
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 09:50:59 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a25e8879-92b6-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 11:50:57 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c9709c9b0cso2486869a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 02:50:57 -0700 (PDT)
Received: from carlo-ubuntu.home
 (dynamic-adsl-94-34-131-227.clienti.tiscali.it. [94.34.131.227])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629e17dsm446938a12.34.2024.10.25.02.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:50:55 -0700 (PDT)
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
X-Inumbo-ID: a25e8879-92b6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1729849857; x=1730454657; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlOKRb79JOR8Iox1AMMS2Z+x3IHOPW+Lic0/pCOh5GY=;
        b=atH/LTHlQY7V30MGxu5y7uVPsh0mQ2Oj9nEgLqXqDMwTVzysU4+pDDkVZOmlf0hyP+
         eFmgb0Lyssi23qPgsu/sA4fjQBQHlOeGWwzO2E8eHbmn49mUNRKYy09noYstUqeCYz1w
         Gjo7kNt/PMnPu0uit9ono6rVfVxGyFA1IjWuwRK/EbJgr7WVlM8AI8aO/z9Ap5ogDdND
         7ncS+XqOyf6B2/++As7p7wl6ZwEBNfTLm3otSEY9juSIbWR82Uzjsbpol4nlM8RKqK4U
         88E6+saf4p4J+Nz5bZenI8kkq91XQYNvESyw5E+PEZQhBngQ1mOqDDflN2W48jggBUUe
         v/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849857; x=1730454657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlOKRb79JOR8Iox1AMMS2Z+x3IHOPW+Lic0/pCOh5GY=;
        b=NcJZ82KzK28uPsOc+HKD7bzFfliows0npp7ftFmI2uMNQCaKRg9can1yFWl2QcFOU3
         42Y6nZSIXi8XASCq77j0Abc9jitOzEYduwybgul9LyTiSGiwtHhQzSwcqz+U1MqSlkgQ
         cjrM5v5NuJFopVJvq5JBRcbPxiWUiMv9wX4jnKeXFLAZItl5QZrJSK9tZJMabx8OXjLL
         Gk1cSZeXkqgjTGPjNufp+GR8RJ8jbXjnPX7xcYxlAav0nPTCbyFk5lLqsiYqdiV3LJGJ
         XJ6zvjPW/gOxru6qnBPjJFSB5Wmxg+dx0hRcKXnmje59qM0A0jDWSzc3LlozOJY9+aW9
         uVwg==
X-Gm-Message-State: AOJu0YyNq+usEdasAmP2RcTBBTKg8biKvWO1sSkHl6I37LVDg3Qgss7A
	WkQL/j7d8inoSkH1qrfysR6WPHyCqFFaaFH1Z7vERoJ++GcQuyZBW5e8WLRqpvR9nVLSkKxjd+x
	1q+s=
X-Google-Smtp-Source: AGHT+IEjqy/lb5M+WgV6jHA4Q8noP62nrv1a7Mfyl0L/WVNWjwfPd7CThK7DV+GuDPNtkHq6pm4Kpg==
X-Received: by 2002:a05:6402:34cc:b0:5cb:6c39:2306 with SMTP id 4fb4d7f45d1cf-5cb8ac3494cmr6440132a12.4.1729849856976;
        Fri, 25 Oct 2024 02:50:56 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 08/13] xen/page_alloc: introduce preserved page flags macro
Date: Fri, 25 Oct 2024 11:50:09 +0200
Message-ID: <20241025095014.42376-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
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


