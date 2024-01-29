Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AB8840EDC
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673070.1047303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI9-0007su-Mf; Mon, 29 Jan 2024 17:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673070.1047303; Mon, 29 Jan 2024 17:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI9-0007lm-AH; Mon, 29 Jan 2024 17:19:29 +0000
Received: by outflank-mailman (input) for mailman id 673070;
 Mon, 29 Jan 2024 17:19:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI8-0005vb-6o
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:28 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d126f7d-beca-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 18:19:25 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cf59087d50so22202321fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:25 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:24 -0800 (PST)
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
X-Inumbo-ID: 8d126f7d-beca-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548765; x=1707153565; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qm43AlNShlPAFLpjGrbILKxF1nwMflaP0c3YFoLDGIo=;
        b=xyQiKwhTkRsgB/haFtAIKE3lX3+5834bFvV+uG98hOo75SvFykk3HMnpfgag9u/DRg
         aPFv/eWfgVp9QSvK83y+P8nl9/l5dT9ddPfK04MYNNoIxHWDriXcHGVolfmUclnGJd7d
         0/U0zfkGjj5ScR1b1srkq2OgMpnme8PN94gh91OCcLEn665aqOOuVdlkInaipThPwHGF
         xjRFlGh81DqcQiWnAvWgBDpZ2rYYfxt68lyuyrdd6bP0bNCcym92Yw6EwW7KqsHKRxBK
         jew2rcDUdVR/BOpziIFfer1a8nD6Y1pvS+pktOcXMtUaa/xJpsKKB/06O0VaitySnE4m
         5seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548765; x=1707153565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qm43AlNShlPAFLpjGrbILKxF1nwMflaP0c3YFoLDGIo=;
        b=pYZ9c1WadYQI67BdgGOHxD0tQ8R65pr9++QhlX6HYLQEo+ltDUESDzbrS9uxQAcBMY
         vW9tkgwnHov63IY+bd7Y8Pe9o4tULUSA4UjnopAmDdIXGxAimP+mccqeE1J701hnud6p
         eSr1/4NV8KI0fRP6bTs5mVIUML28q+tqXMi5iThIV4B5P/scyfGHtD1wMX8S0VPVWNa+
         S381PJ68KQ3kJCA4rRxmP6XcAZtQOy8TA77x+b+GTY4RiMt7chSfwhiqTi7iKiFnZEP8
         KBqg5grUlYQ6/uzjhfC2oc/byeMPKmCh4e/aVxfqjeIjHhBYVTVk3dlac14CyzhaU6bS
         HbOA==
X-Gm-Message-State: AOJu0YxA37RxjLU7QanWUVUJGMCXTG1OXPWx+ilblZFZytYosHOze03V
	Eryo/dURvxKOcxkQlO5MzbEW+OwvJYTEkb3wcFC1MEuxZHr2EMqYGlxGjSXhleJeZlBt0G1zMbT
	wgM4=
X-Google-Smtp-Source: AGHT+IEMIXCUAhRBg5kbZYAqHRLvcRRw5cqtcSd6LePNjKTjKwemJZQSD3Z1kz79Ll/ztDU8Z+kicw==
X-Received: by 2002:a2e:808b:0:b0:2cf:1c9c:a43b with SMTP id i11-20020a2e808b000000b002cf1c9ca43bmr3709564ljg.18.1706548764946;
        Mon, 29 Jan 2024 09:19:24 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v6 09/15] xen/page_alloc: introduce preserved page flags macro
Date: Mon, 29 Jan 2024 18:18:05 +0100
Message-Id: <20240129171811.21382-10-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PGC_static and PGC_extra are flags that needs to be preserved when assigning
a page. Define a new macro that groups those flags and use it instead of
or'ing every time.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v6:
- preserved_flags renamed to PGC_preserved
- PGC_preserved is used only in assign_pages()
v5:
- new patch
---
 xen/common/page_alloc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2ec17df9b4..7c135e0bb4 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -157,6 +157,8 @@
 #define PGC_static 0
 #endif
 
+#define PGC_preserved (PGC_extra | PGC_static)
+
 #ifndef PGT_TYPE_INFO_INITIALIZER
 #define PGT_TYPE_INFO_INITIALIZER 0
 #endif
@@ -2362,7 +2364,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_static)));
+            ASSERT(!(pg[i].count_info & ~PGC_preserved));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2422,7 +2424,7 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & (PGC_extra | PGC_static)) | PGC_allocated | 1;
+            (pg[i].count_info & PGC_preserved) | PGC_allocated | 1;
 
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
-- 
2.34.1


