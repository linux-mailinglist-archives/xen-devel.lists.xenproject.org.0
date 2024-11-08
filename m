Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 093C89C1C36
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 12:33:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832463.1247774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9NE4-0006BT-M2; Fri, 08 Nov 2024 11:32:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832463.1247774; Fri, 08 Nov 2024 11:32:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9NE4-00062t-HT; Fri, 08 Nov 2024 11:32:28 +0000
Received: by outflank-mailman (input) for mailman id 832463;
 Fri, 08 Nov 2024 11:32:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gwdq=SD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t9NE2-00060g-Uw
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 11:32:26 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fd71f02-9dc5-11ef-a0c6-8be0dac302b0;
 Fri, 08 Nov 2024 12:32:24 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5c9c28c1ecbso2548788a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 03:32:24 -0800 (PST)
Received: from localhost ([213.195.120.105]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4bfa1sm222698766b.74.2024.11.08.03.32.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 03:32:23 -0800 (PST)
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
X-Inumbo-ID: 1fd71f02-9dc5-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzEiLCJoZWxvIjoibWFpbC1lZDEteDUzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFmZDcxZjAyLTlkYzUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMDY1NTQ0LjQxNDI2OCwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731065543; x=1731670343; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHfkhGUnT0xwCTLoRSPpeRbYmiIBgZ+v2c3CutALv3Q=;
        b=UGTfdHE+y6FJAYVUvdPy3bo0pnT7YQKiXvMCF/ptT3A9bl6cIxqmYI7o9oF5dfrPuz
         akhkwWqLUI4B7ThsevRCB/2u/aaSchE4vTdP069Lw4jXulbbW9X7e50bJtkx+a/cMW8P
         Dyf0i4WL+KjOoZaBVd0istTnSghe8VYd1eY98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065543; x=1731670343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHfkhGUnT0xwCTLoRSPpeRbYmiIBgZ+v2c3CutALv3Q=;
        b=m09SLWVKgye77AmfzFt9KgJQCegwCbewLUkoQjEb9H29SvjrT5alSeKo+4J1pPpE7F
         YmPgCthqZGoxeqxSL3VAqzNp9BB7elca06kPoLLBuMuCAch1GcIT4CYA0AXLkCs443vL
         CINI+nQ6+XiZ+TnJIuPybeZT5fpJV4b92bTz6+EhapBhqFVF9CQSIm+0U/2mULj0o3vQ
         Lgiemx7kA9QNwSPCgNBK9QCKBk91Lv0IuNbIV9jYPdUw3wO7zhXBsfY7jrvjfkgypUJh
         mkOrcKqWD6wXrIX0z4MPzxS0aKJRm1LC0QoSGG6cNXG+YW7fTA4Sre0qXhdy1me/BPuK
         FwWQ==
X-Gm-Message-State: AOJu0YxLShpIEdOf4Ko1i1zzX4ReKZ1Luv5uDohCzlpLSqNCas7Hn2hc
	rVdXeUBdLHgEJLqV0sb4xVVzNCZvpNHJxudOlFBLGgYrAtPFPetxKOJYz/owO5AKeAcIV9DgRms
	A
X-Google-Smtp-Source: AGHT+IHnGJLyrRZSvRtHSPlxNz38lSDP7tcz1Xe4EjKzGuTjisPpZiSaE51Jm9bXOiyEGBdeNYKQTQ==
X-Received: by 2002:a17:907:3e9e:b0:a9a:8674:1739 with SMTP id a640c23a62f3a-a9ef0008cf0mr189975466b.53.1731065543284;
        Fri, 08 Nov 2024 03:32:23 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/4] x86/mm: introduce helpers to detect super page alignment
Date: Fri,  8 Nov 2024 12:31:41 +0100
Message-ID: <20241108113144.83637-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241108113144.83637-1-roger.pau@citrix.com>
References: <20241108113144.83637-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the code that detects whether the physical and linear address of a
mapping request are suitable to be used in an L3 or L2 slot.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Make the macros local to map_pages_to_xen().
 - Some adjustments to macro logic.
---
 xen/arch/x86/mm.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index d537a799bced..8afb63c855b9 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5232,6 +5232,12 @@ int map_pages_to_xen(
     }                                          \
 } while (0)
 
+/* Check if a (virt, mfn) tuple is aligned for a given slot level. */
+#define IS_LnE_ALIGNED(v, m, n) \
+    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << (PAGETABLE_ORDER * (n - 1))) - 1)
+#define IS_L2E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 2)
+#define IS_L3E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 3)
+
     L3T_INIT(current_l3page);
 
     while ( nr_mfns != 0 )
@@ -5249,9 +5255,7 @@ int map_pages_to_xen(
         L3T_LOCK(current_l3page);
         ol3e = *pl3e;
 
-        if ( cpu_has_page1gb &&
-             !(((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
-               ((1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1)) &&
+        if ( cpu_has_page1gb && IS_L3E_ALIGNED(virt, mfn) &&
              nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
         {
@@ -5370,8 +5374,7 @@ int map_pages_to_xen(
         if ( !pl2e )
             goto out;
 
-        if ( ((((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
-               ((1u << PAGETABLE_ORDER) - 1)) == 0) &&
+        if ( IS_L2E_ALIGNED(virt, mfn) &&
              (nr_mfns >= (1u << PAGETABLE_ORDER)) &&
              !(flags & (_PAGE_PAT|MAP_SMALL_PAGES)) )
         {
@@ -5541,9 +5544,7 @@ int map_pages_to_xen(
  check_l3:
         if ( cpu_has_page1gb &&
              (flags == PAGE_HYPERVISOR) &&
-             ((nr_mfns == 0) ||
-              !(((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
-                ((1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1))) )
+             ((nr_mfns == 0) || IS_L3E_ALIGNED(virt, mfn)) )
         {
             unsigned long base_mfn;
             const l2_pgentry_t *l2t;
@@ -5587,6 +5588,9 @@ int map_pages_to_xen(
         }
     }
 
+#undef IS_L3E_ALIGNED
+#undef IS_L2E_ALIGNED
+#undef IS_LnE_ALIGNED
 #undef flush_flags
 
     rc = 0;
-- 
2.46.0


