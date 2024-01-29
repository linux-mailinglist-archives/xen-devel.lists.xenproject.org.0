Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA40840EE7
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673069.1047295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI9-0007ld-5x; Mon, 29 Jan 2024 17:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673069.1047295; Mon, 29 Jan 2024 17:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI8-0007gN-RI; Mon, 29 Jan 2024 17:19:28 +0000
Received: by outflank-mailman (input) for mailman id 673069;
 Mon, 29 Jan 2024 17:19:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI7-0005vb-6Y
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:27 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8cb469f9-beca-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 18:19:25 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55a90a0a1a1so2547905a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:24 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:23 -0800 (PST)
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
X-Inumbo-ID: 8cb469f9-beca-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548764; x=1707153564; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9RFmP+aBqqH4SIR3Jn1WqEGTeAcNYfa+alt6ENH+Bw=;
        b=p0CPUrxvQY5EiTPuTGURNV/dgMauzAM/e1OJKWjfBlKcDHI5bkn2b2QNus8BVPIc2m
         so0rtl8QgwDRMAda8Jm2hnx8GZXlpzXbg2U48OR40mlrEX1kFTIQH2HaE9ZHGkNcFMBh
         rQOG4X4SlXImG0g7DpN+OWyfhNxxqy5YDsRz/otA3vXD7wZ8P48+ElOOJfcTgXm8WxTw
         Cu/kmXUSg6F2jKOwPNFCJ2d3l5TDGYZfsBJNc9ilD1YUc81AxDexa7oUNrXg3N2XfcDc
         jIeprkldfJogYG4tKYcHBmjCGP/hZvHtS5D3ljzgVTtx/kJstFdDDfhfRD0uEltEa8BF
         MZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548764; x=1707153564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9RFmP+aBqqH4SIR3Jn1WqEGTeAcNYfa+alt6ENH+Bw=;
        b=V3YmO++8wF8RfeYX0N2R1xDNyinCFTGqf23A3CFSY3vw3DTfPA+DD6CCILqb/fx9R/
         RE8WadWQlzTg7L8WzEriTRxPXX9uYsJ9GD7DXls1SKZrzYeaiSFz3eJj+yHIm/WPCrD/
         ZE8+qU0hVzLHztffDHMPF9JquTkuE5zEU7PrO5BBUD8m8hBvI228YkZDUiCBzNesPAW2
         f2Cbn9We8kGeK+OiXOC+10HNMCEpj/V6dxTgihB6u1maAeB/COGPOfove+yrAIctbb9s
         fW3pFzy4s70mGuhWCIi0a9ui2eTneCz5TmLujPas1YF1Rj9RN+xPvOKq8fbqIq8V64Ts
         Yn0Q==
X-Gm-Message-State: AOJu0YzSBdELRzDBFzULawDhgMSR4swDtixoVs9u339OzWiCuD2S5NJ0
	ogH7tAQiSbK46I9X4n/gjvo+Epy0gCbD1x+hpEXF1GkCQ+1XIAz4TGrwCP+LVi9dIx8NE5ZMQNd
	QY1o=
X-Google-Smtp-Source: AGHT+IHKjEqoRTvmqUd5xzklE7o7VNS35XUcP7U5jcbyKHDOgRixQG2hSX8IN+N4vxxGKn3ZYTeWUQ==
X-Received: by 2002:a05:6402:1b10:b0:55d:1eae:1e9f with SMTP id by16-20020a0564021b1000b0055d1eae1e9fmr4327297edb.15.1706548763994;
        Mon, 29 Jan 2024 09:19:23 -0800 (PST)
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
Subject: [PATCH v6 08/15] xen/page_alloc: introduce init_free_page_fields() helper
Date: Mon, 29 Jan 2024 18:18:04 +0100
Message-Id: <20240129171811.21382-9-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new helper to initialize fields that have different uses for
free pages.

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
---
v6:
- Carlo Nonato as the only signed-off-by
v5:
- new patch
---
 xen/common/page_alloc.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2f4f2859c4..2ec17df9b4 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -925,6 +925,13 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
     }
 }
 
+/* Initialise fields which have other uses for free pages. */
+static void init_free_page_fields(struct page_info *pg)
+{
+    pg->u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
+    page_set_owner(pg, NULL);
+}
+
 /* Allocate 2^@order contiguous pages. */
 static struct page_info *alloc_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi,
@@ -1033,10 +1040,7 @@ static struct page_info *alloc_heap_pages(
             accumulate_tlbflush(&need_tlbflush, &pg[i],
                                 &tlbflush_timestamp);
 
-        /* Initialise fields which have other uses for free pages. */
-        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
-        page_set_owner(&pg[i], NULL);
-
+        init_free_page_fields(&pg[i]);
     }
 
     spin_unlock(&heap_lock);
@@ -2799,9 +2803,7 @@ static bool prepare_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
          * to PGC_state_inuse.
          */
         pg[i].count_info = PGC_static | PGC_state_inuse;
-        /* Initialise fields which have other uses for free pages. */
-        pg[i].u.inuse.type_info = PGT_TYPE_INFO_INITIALIZER;
-        page_set_owner(&pg[i], NULL);
+        init_free_page_fields(&pg[i]);
     }
 
     spin_unlock(&heap_lock);
-- 
2.34.1


