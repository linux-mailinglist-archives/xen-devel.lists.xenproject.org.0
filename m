Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4F09C8D73
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 15:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836525.1252426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbIZ-0007TU-6X; Thu, 14 Nov 2024 14:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836525.1252426; Thu, 14 Nov 2024 14:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbIZ-0007NU-0P; Thu, 14 Nov 2024 14:58:19 +0000
Received: by outflank-mailman (input) for mailman id 836525;
 Thu, 14 Nov 2024 14:58:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QegD=SJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBbIX-0007K7-3l
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 14:58:17 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfa8dea0-a298-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 15:58:14 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5cf872ecce7so259578a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 06:58:14 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e08128csm70554166b.175.2024.11.14.06.58.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 06:58:12 -0800 (PST)
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
X-Inumbo-ID: dfa8dea0-a298-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmMiLCJoZWxvIjoibWFpbC1lZDEteDUyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImRmYThkZWEwLWEyOTgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTk2Mjk0LjQ1MjI3MSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731596293; x=1732201093; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfQMcfiQzj+ufcVDBKz5TVkZtEEiPvugKRbHnXB/lrQ=;
        b=FzGlNjucZDjpw0AijRclFEIT7DSg7BRDzJ/BochpDLQVK7W08SNHm+9rmOnfbGqssm
         hg0og/CvK9ew/TevL/mVK/ffmttwP4Sp3bhbpwo3FR8/1KiHNLg+YxQiRjlhlzhV7VBd
         dQEKE28UM4lzkxMuF6EQVZuIGlZwNuEj9yCnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731596293; x=1732201093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfQMcfiQzj+ufcVDBKz5TVkZtEEiPvugKRbHnXB/lrQ=;
        b=cksGIP6DfYYo49iOtnYd6afpzUoIR7IyIApaaJsHyw46B/a0rwdEZNDyR1EFEeXbze
         uEhNluAsNUK88eDZ7ELI1PPyQsU/kiknlgMDuJ+ezpv8w078egGQj9dAw/j+QiPrOx1P
         ZGkW/En8Yp0qbpZ/7/GyStxCJT6Xu1ttk1el32w5jD85LTVt0vi8+MSdsBoWVFn/y2jf
         vg3DEC9NAEskLq4Mlb0piv7gzjmjE/4v4aoqkXOWs1tIXcatv9ysVUX1WofkQ3xxFm5x
         u4IRsLUwhGLf6GYlAoUvOhlzSDRtvChq0eAxjklluidxWEU/WBjlMBVQ30gIrsHN4WD9
         SyPg==
X-Gm-Message-State: AOJu0YzzMIX2xD3waLRIoQVo6wc0olT/PdbrKnqzHloqd8EP7kb+YNqw
	v5kNzh8UnZ/ovRXN7/wDS3eNsrMRvQdUeXC0ZvJZKrYTtTaUkPSeN2xbiw8ySbM/LbXV2qTKomy
	1
X-Google-Smtp-Source: AGHT+IE0ZQ6RvAcMJ6lX5tXnowlkxGMbF/MoZJdwPsvl+DQl93dO5jjfxqCZnfnU6zmcnaQjskVLqg==
X-Received: by 2002:a17:907:72c8:b0:a9a:1739:91e9 with SMTP id a640c23a62f3a-a9eefeebe72mr2495033866b.24.1731596293067;
        Thu, 14 Nov 2024 06:58:13 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 1/4] x86/mm: introduce helpers to detect super page alignment
Date: Thu, 14 Nov 2024 15:57:12 +0100
Message-ID: <20241114145715.59777-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241114145715.59777-1-roger.pau@citrix.com>
References: <20241114145715.59777-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the code that detects whether the physical and linear address of a
mapping request are suitable to be used in an L3 or L2 slot.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v2:
 - Fix parenthesization of macro parameter.
 - Add another usage of IS_L2E_ALIGNED().

Changes since v1:
 - Make the macros local to map_pages_to_xen().
 - Some adjustments to macro logic.
---
 xen/arch/x86/mm.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 11933321a3d5..ebb50a7836ac 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5493,6 +5493,13 @@ int map_pages_to_xen(
     }                                          \
 } while (0)
 
+/* Check if a (virt, mfn) tuple is aligned for a given slot level. */
+#define IS_LnE_ALIGNED(v, m, n)                                 \
+    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m),                          \
+               (1UL << (PAGETABLE_ORDER * ((n) - 1))) - 1)
+#define IS_L2E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 2)
+#define IS_L3E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 3)
+
     L3T_INIT(current_l3page);
 
     while ( nr_mfns != 0 )
@@ -5510,9 +5517,7 @@ int map_pages_to_xen(
         L3T_LOCK(current_l3page);
         ol3e = *pl3e;
 
-        if ( cpu_has_page1gb &&
-             !(((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
-               ((1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1)) &&
+        if ( cpu_has_page1gb && IS_L3E_ALIGNED(virt, mfn) &&
              nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
         {
@@ -5631,8 +5636,7 @@ int map_pages_to_xen(
         if ( !pl2e )
             goto out;
 
-        if ( ((((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
-               ((1u << PAGETABLE_ORDER) - 1)) == 0) &&
+        if ( IS_L2E_ALIGNED(virt, mfn) &&
              (nr_mfns >= (1u << PAGETABLE_ORDER)) &&
              !(flags & (_PAGE_PAT|MAP_SMALL_PAGES)) )
         {
@@ -5749,9 +5753,7 @@ int map_pages_to_xen(
             nr_mfns -= 1UL;
 
             if ( (flags == PAGE_HYPERVISOR) &&
-                 ((nr_mfns == 0) ||
-                  ((((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
-                    ((1u << PAGETABLE_ORDER) - 1)) == 0)) )
+                 ((nr_mfns == 0) || IS_L2E_ALIGNED(virt, mfn)) )
             {
                 unsigned long base_mfn;
                 const l1_pgentry_t *l1t;
@@ -5802,9 +5804,7 @@ int map_pages_to_xen(
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
@@ -5848,6 +5848,9 @@ int map_pages_to_xen(
         }
     }
 
+#undef IS_L3E_ALIGNED
+#undef IS_L2E_ALIGNED
+#undef IS_LnE_ALIGNED
 #undef flush_flags
 
     rc = 0;
-- 
2.46.0


