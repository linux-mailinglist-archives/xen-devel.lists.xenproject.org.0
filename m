Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15653A05F35
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 15:45:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867451.1278971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXIm-0000xU-Ay; Wed, 08 Jan 2025 14:44:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867451.1278971; Wed, 08 Jan 2025 14:44:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXIm-0000v9-7a; Wed, 08 Jan 2025 14:44:56 +0000
Received: by outflank-mailman (input) for mailman id 867451;
 Wed, 08 Jan 2025 14:44:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2h7L=UA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tVX4w-0005q4-9c
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 14:30:38 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2029173a-cdcd-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 15:30:36 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa689a37dd4so565868366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 06:30:36 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0f015b0fsm2488132166b.156.2025.01.08.06.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 06:30:35 -0800 (PST)
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
X-Inumbo-ID: 2029173a-cdcd-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1736346636; x=1736951436; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kWNGpzhADK4ApVubuzBqlSw3YHI7Srtu2T9UABtAuo=;
        b=X5sesrPYr8uXKthxxtljZ/WIebAQB6PO+BmU4KRBwWgNppigYMNW8h5U+gldsrFIW0
         Zd+nztxaSdjnXbaQGU2Pvob6/4voG6j2MFae8vHp72yWjtWCVFDduB50g63PcNXPCslB
         1Q2SrNoTZbsPJD6KQziC29f2e0sBSS+VjUqO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736346636; x=1736951436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kWNGpzhADK4ApVubuzBqlSw3YHI7Srtu2T9UABtAuo=;
        b=H+DezmTGBT8BXs34kaZYBMY72i3EQzTjjndsiESxQC9jBE4OzBj9VeQxOOB+2nNGP0
         0shAz2tBJT/azrz4Rky/0kk2NXfeOL29ROiqJou1hFNEMTjRp9ApP1miqiKwIFpz94LO
         yjQgceZW0tHbDGUpy4Qdj4I/buZWKIpdoTue9mdWo8D2h8hbZUJXs0wLvw6W6byYclJo
         SQuGjdzez1hqZGWDydNQe6xIPs1W6rzEitILxfhd+/CyyTUhgNUjqbEOQg2lJHFr9WvC
         wQhyb44QLupxQ42t0ZIXhgavgEB5mxcY5Bj5+FqSL4QvhexUU4zO+A98F3DbdDUNvrGa
         +Sqg==
X-Gm-Message-State: AOJu0YxDThdT4iqVb6ol4gIrZ7tyM4kVrWS0CIhf7G3CZgr/4urwu60W
	rbW5onEtTstYDYJDGE3jSkOb5Ke+MD07uI2dwleTu5C83cxv3W0SZCbf5WudApVFX9htaqpKisJ
	P
X-Gm-Gg: ASbGncvvBch5VoE/ijqm2lRgn86fFI+QAXrf/4akQdV01StbzOgkBvFJA3XsM/UCVF0
	ig/TZ+1WGG1R9rzBioryVNE8UpPV0AiO7v3+X1b4AurS39PFZ6P2D3IeOLbuzBcHKvTKuxTMY8A
	GHt3DjKCJPN/MfpvXOVeLNXRtaGB7LBM2OC9KeqaX11wGd2zGx7wGqeCs/5LcTfAF8EhupmQzzk
	rtlUhCm0bO+q1hhT4wWel0eIN2uchyqM4o5AevoJgFHCJHDJvx953i6gs0JLyV7IDg=
X-Google-Smtp-Source: AGHT+IHyzn1e1qV9vmlcMx0QuYKG/GCjUKcB3kN205x8eo9Yyxhtm8T1TbpI1iDBGjGQVCA1AV0T8g==
X-Received: by 2002:a17:907:948d:b0:aac:29a:2817 with SMTP id a640c23a62f3a-ab2ab73bbf5mr277559666b.26.1736346635685;
        Wed, 08 Jan 2025 06:30:35 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 12/18] x86/mm: move FLUSH_ROOT_PGTBL handling before TLB flush
Date: Wed,  8 Jan 2025 15:26:52 +0100
Message-ID: <20250108142659.99490-13-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250108142659.99490-1-roger.pau@citrix.com>
References: <20250108142659.99490-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the handling of FLUSH_ROOT_PGTBL in flush_area_local() ahead of the logic
that does the TLB flushing, in preparation for further changes requiring the
TLB flush to be strictly done after having handled FLUSH_ROOT_PGTBL.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/flushtlb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/flushtlb.c b/xen/arch/x86/flushtlb.c
index 65be0474a8ea..a64c28f854ea 100644
--- a/xen/arch/x86/flushtlb.c
+++ b/xen/arch/x86/flushtlb.c
@@ -191,6 +191,9 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
 {
     unsigned int order = (flags - 1) & FLUSH_ORDER_MASK;
 
+    if ( flags & FLUSH_ROOT_PGTBL )
+        get_cpu_info()->root_pgt_changed = true;
+
     if ( flags & (FLUSH_TLB|FLUSH_TLB_GLOBAL) )
     {
         if ( order == 0 )
@@ -254,9 +257,6 @@ unsigned int flush_area_local(const void *va, unsigned int flags)
         }
     }
 
-    if ( flags & FLUSH_ROOT_PGTBL )
-        get_cpu_info()->root_pgt_changed = true;
-
     return flags;
 }
 
-- 
2.46.0


