Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E19DF87CBC1
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 11:59:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693755.1082275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hw-0002OG-Dj; Fri, 15 Mar 2024 10:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693755.1082275; Fri, 15 Mar 2024 10:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hw-0002Gu-54; Fri, 15 Mar 2024 10:59:48 +0000
Received: by outflank-mailman (input) for mailman id 693755;
 Fri, 15 Mar 2024 10:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5Ht-0000aQ-Vm
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:45 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21f5cafa-e2bb-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 11:59:45 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d220e39907so27823621fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:45 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:43 -0700 (PDT)
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
X-Inumbo-ID: 21f5cafa-e2bb-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500384; x=1711105184; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3nbEfmEpx8CguNEN8gEFkVE6z/NmIxHeRdycAh23yc=;
        b=ZtMcNOCFFwJ8HlksF+89ZN0t0QLikziO/Cmo4BcX/hJJCOrR9e+EMos2SIbGIZYWzL
         aT6/Skj4FYr/UvXprdnr//Iqifle1firf3XP/sj5mUcRqLxzXOuswSKVSDZDMfEGbTR3
         RbpGHFs/DN4rJw/z88/rOHvq6tTcKgd7hsrfa9XoYr2Ejot93ZcdDjKafEGIPlxyw7ry
         nUUb4M/NXgPNaZ6FNgWfS2XJtrk4Nbhkx+KirM9WoTK312FIgeBq/WcuhsprXuVxJfu6
         fLE2GBOgcdpYpkDY4hgo8Zw3yU8V218yOw5dDB8/Ixyjrp23Fmsn14T8rXndocbz0+JO
         ELUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500384; x=1711105184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3nbEfmEpx8CguNEN8gEFkVE6z/NmIxHeRdycAh23yc=;
        b=GaNq+dZTyx3EmLFv2G2fPWlrzONh5pEndjKJ6ky/543ihOD4k6ANcy0mtb02pv0QDq
         KynF/Yf/40s7GMwhsXsoHT+1iXSh8fUXn9xVmzaDa40CBpRkZva4ok4By/dky8E5o3pT
         1mcW4yoYA7UHQeMEo3qbb0133aJtkXdPQ79hT6RCZfVQ6Jp+b2fGwhg2WgG540SNhsYr
         V2R2lftexieoW0MoINWeqxlatRvmBgTxrS5q1OqJ2FH8bnHHqzbx+4rvNYUZTumHGUcv
         +5t9nZitlY+gEfAXWT30cCeMwXDfcgQwAw1JBY2t2HauTCZEft0bqPedCmshAkBzNTOh
         sOzg==
X-Gm-Message-State: AOJu0Ywo/kpA0GknYPXrxva+JVInNQfYEWI5dNEoGu6nkLEoxQMpS0dj
	DXIPqsw4y279+KpMFNRsADEGg3qB8dLaqB60Rw4RkIPtp+UNAGQbW7bThMXittsNnaXjq7Fdjdf
	w+O0=
X-Google-Smtp-Source: AGHT+IGvjMI4CSCy4Kj7MlnFpSDPyGLnerqnAE6xHvfjJ/mwehU28p8DGGTKt7kXixv/CY7kxpohUw==
X-Received: by 2002:a05:651c:10c9:b0:2d2:2ce1:1196 with SMTP id l9-20020a05651c10c900b002d22ce11196mr2946605ljn.53.1710500384097;
        Fri, 15 Mar 2024 03:59:44 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 08/14] xen/page_alloc: introduce preserved page flags macro
Date: Fri, 15 Mar 2024 11:58:56 +0100
Message-Id: <20240315105902.160047-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PGC_static and PGC_extra needs to be preserved when assigning a page.
Define a new macro that groups those flags and use it instead of or'ing
every time.

To make preserved flags even more meaningful, they are kept also when
switching state in mark_page_free().

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v7:
- PGC_preserved used also in mark_page_free()
v6:
- preserved_flags renamed to PGC_preserved
- PGC_preserved is used only in assign_pages()
v5:
- new patch
---
 xen/common/page_alloc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index c38edb9a58..6a98d9013f 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -158,6 +158,8 @@
 #define PGC_static 0
 #endif
 
+#define PGC_preserved (PGC_extra | PGC_static)
+
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
@@ -1424,11 +1426,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
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
@@ -2363,7 +2365,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
+            ASSERT(!(pg[i].count_info & ~PGC_preserved));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2423,7 +2425,7 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
+            (pg[i].count_info & PGC_preserved) | PGC_allocated | 1;
 
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
-- 
2.34.1


