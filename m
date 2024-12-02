Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DC69E0943
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 18:00:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846771.1261984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9lp-0000XK-9T; Mon, 02 Dec 2024 16:59:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846771.1261984; Mon, 02 Dec 2024 16:59:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9lp-0000Tz-1O; Mon, 02 Dec 2024 16:59:37 +0000
Received: by outflank-mailman (input) for mailman id 846771;
 Mon, 02 Dec 2024 16:59:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no4W=S3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tI9ln-0006x4-9c
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 16:59:35 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdcea3f1-b0ce-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 17:59:33 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-aa543c4db92so666974066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 08:59:33 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e64c4sm526802666b.97.2024.12.02.08.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:59:32 -0800 (PST)
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
X-Inumbo-ID: cdcea3f1-b0ce-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733158773; x=1733763573; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jo1+hlLxBc+2E+3aaQJBdv0vb2kf6V0j/TqdNW1tAOE=;
        b=V/hCI906gyUME2CtsMSrQvcJpfmcETVyGJyIWfdJCJ+Dmym0H4sLHnF3tUIZFPceER
         2GVX5lzZCB/8ugVb6p6YTsWq2tQTjF3Br+4i5XzTbqAanJgYcguTlGIWucwPXXCk6O7F
         lKcjmwA2cCWk6CKcx5vkUBPhfegSZ3uY3zC+7FrL1ZPRAIMQyAYf3y04sWMUcF3OXrCS
         RHMW6y1oAUDBiLTlnU0NmoM8nySXBwMDVaod62TdtfGYLcXyaC8Kz8czeb5D+BccA0Xf
         Z87eMwkquz8ktO4fEYodQm0d6ip5sKNfnDrIjkhCbX0Q9RXsIS22PSkh+NfMvapFJ3r5
         hefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733158773; x=1733763573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jo1+hlLxBc+2E+3aaQJBdv0vb2kf6V0j/TqdNW1tAOE=;
        b=MkhlMgIE5XcyS4l01fnLbpSAwzugFjHML9K3zW4p7br0ihAOxvy0x3ZUZTwgf2lCaL
         SCCWSsGHp82n4Ggbuy+F4Mq5WQO0ltIwWstRnxznKUiMK9ZOfV++ZCbHO6Y1PsIACsBW
         IMj98SfHRmasXmTYx49MiNiVa9N+DKwAoW9ZdlxNX0WYWMKmkRdrNt+OEZ2SYnKWxerb
         3rW7nPIS0YD/qiRrmQZ4XOjcEH/hH71Y2RweZ4NAm+LU3mdNZ+HXY8MIB66kU3WrIGtZ
         f7U192j5yhKBQFW6QpQz/gmCd6nRyVTxo2Tsj54GFriIFYmdkQtitgRFqo/nXGf9gtp5
         Pi5w==
X-Gm-Message-State: AOJu0YxHs1u1CcQVcflK9Jv55ZTbhxDzqRHYKu2+qfFOwownz3yKiHtU
	dZ4EhIh6xgnKb65DiJdpxjtkNfRH9nWpQUxZATO6QoN12hd4juOcYcTmFYLeTe8fD6Aj0+ck4hP
	a
X-Gm-Gg: ASbGnctdbcww/jxqsw2j/Eq4YEiNDH3qRe14jxvZ0t5gZCKbw8Q/J2P3DRHyb/NcOXA
	+i9+hyzduPqoT3V17SDFA3DtS2OfCqy8Jwl5PiJbk9WjJz0xZcEIqrPsdLTdDf7JePF0mZryHdz
	IpXxj/RX7hbJuX7tV5hlWShNvCb9vgNm6yoI78Hx4LLP10mDXAC1ELEjwsYPvIcV3u7gLQHZ7P/
	Fv9yJ4D5uSSR8nAWyrn5YabPQDQJ6gxZgNZaosu8/Eq/8PHKdnwf2VYpVDv4KlYuW1HZTS60iOe
	ajbhl36QYp3LK7iEvzjLnVsj84yECE+xvJxP+EC0JbMIr5byEAPg
X-Google-Smtp-Source: AGHT+IFR0lxo0qW7rgGGz6p/lTSVqQksARCF+uwg/BOh7xiEKCWmRLJ2vEox2DuIuRXNxSvX4lKEFQ==
X-Received: by 2002:a17:906:329a:b0:aa5:1d08:dacf with SMTP id a640c23a62f3a-aa580f01a6amr2077894266b.13.1733158772840;
        Mon, 02 Dec 2024 08:59:32 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v11 08/12] xen/page_alloc: introduce preserved page flags macro
Date: Mon,  2 Dec 2024 17:59:17 +0100
Message-ID: <20241202165921.249585-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PGC_static and PGC_extra need to be preserved when assigning a page.
Define a new macro that groups those flags and use it instead of or'ing
every time.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v11:
- removed PGC_broken from PGC_preserved
- removed PGC preservation from mark_page_free()
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
 xen/common/page_alloc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 55d561e93c..e73b404169 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -161,6 +161,7 @@
 #endif
 
 #define PGC_no_buddy_merge PGC_static
+#define PGC_preserved (PGC_extra | PGC_static)
 
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
@@ -1447,8 +1448,7 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
         break;
 
     case PGC_state_offlining:
-        pg->count_info = (pg->count_info & PGC_broken) |
-                         PGC_state_offlined;
+        pg->count_info = (pg->count_info & PGC_broken) | PGC_state_offlined;
         pg_offlined = true;
         break;
 
@@ -2382,7 +2382,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
+            ASSERT(!(pg[i].count_info & ~PGC_preserved));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2442,7 +2442,7 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
+            (pg[i].count_info & PGC_preserved) | PGC_allocated | 1;
 
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
@@ -2501,6 +2501,14 @@ struct page_info *alloc_domheap_pages(
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
@@ -2555,6 +2563,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
                 {
                     ASSERT(d->extra_pages);
                     d->extra_pages--;
+                    pg[i].count_info &= ~PGC_extra;
                 }
             }
 
-- 
2.43.0


