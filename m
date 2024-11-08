Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E67F9C1C33
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 12:33:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832464.1247785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9NE5-0006Uj-Rl; Fri, 08 Nov 2024 11:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832464.1247785; Fri, 08 Nov 2024 11:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9NE5-0006T2-OV; Fri, 08 Nov 2024 11:32:29 +0000
Received: by outflank-mailman (input) for mailman id 832464;
 Fri, 08 Nov 2024 11:32:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gwdq=SD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t9NE4-00060f-GA
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 11:32:28 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 208faf58-9dc5-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 12:32:25 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9e71401844so243122866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 03:32:25 -0800 (PST)
Received: from localhost ([213.195.120.105]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0dc4c18sm223026666b.121.2024.11.08.03.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 03:32:24 -0800 (PST)
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
X-Inumbo-ID: 208faf58-9dc5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjIwOGZhZjU4LTlkYzUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDY1NTQ1LjM5NzUwNSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731065544; x=1731670344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6IDMV3cbJu3SgaSqePIjXkH0NqJWYaQKiZv2BBcuvU8=;
        b=IR1DSEDcXjvj+HYW6kXz9yCMmPXDGSUgwuDsbP3hB12ERb7gJUnd+rcXI72zYKch13
         v3j6ieOP0ictKc7dhGsMTPGXnu/es0np1WJIAAEx34Hj8O5ekygkZr6vRHUEF8DJAoYr
         glB0e4Ox8uRr+RaEbfcvGIUVBKrI84by/nywA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731065544; x=1731670344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6IDMV3cbJu3SgaSqePIjXkH0NqJWYaQKiZv2BBcuvU8=;
        b=U3m3zf8LqQGnUk+CfxAJ/L7Ve0SopklTpvKX7q9imeejjfEjma1KNEkeBNdK21Z9CG
         IYkaNutSq+asvHmBH2RxWrXLq4V7CovUoZPW0PVfI5ssyGfH09p3JdISvzYNcQDMgWs1
         Ms8JIsDSmFX6WtzitdJWD2oY36Ru9StZgiv2M4yc6/LXP1u97lKY/mKln7ESD4zbIAp5
         C4K5axckKu8u8v4QaOOuB99OSjX5EZL/+Y3qa03VEGjDZ0i2Y4pxj2JIIs3gqXxehDEq
         DXWaw04OxLve3F/B4KFqlTlE4V/g9B/ScpYxOFhjjhdIs+cZDjH8pGfAB7tbG+z60t0R
         vcpw==
X-Gm-Message-State: AOJu0YwSJtaGHHDguoMOyeA+ClbSOi7cB8nOVwejz23eWDWNMXbiZ8YQ
	MGoJkIexHbTEWsT5OAQALkQIWvRZqS4blqnQKxeiJ20Zao20Q+KDs6dwvASQ9tS5LnQFTXinRbv
	0
X-Google-Smtp-Source: AGHT+IHSdK76R8jeKdJ5/M0JC2X3Ik030Ae/Z3JqhChC/O5JSXgTzr2bxNCOlYsLEgjaaIsic5vWNw==
X-Received: by 2002:a17:906:5f98:b0:a9e:f28c:374a with SMTP id a640c23a62f3a-a9ef28c3ba4mr125502766b.32.1731065544475;
        Fri, 08 Nov 2024 03:32:24 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/4] x86/mm: skip super-page alignment checks for non-present entries
Date: Fri,  8 Nov 2024 12:31:42 +0100
Message-ID: <20241108113144.83637-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241108113144.83637-1-roger.pau@citrix.com>
References: <20241108113144.83637-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

INVALID_MFN is ~0, so by it having all bits as 1s it doesn't fulfill the
super-page address alignment checks for L3 and L2 entries.  Skip the alignment
checks if the new entry is a non-present one.

This fixes a regression introduced by 0b6b51a69f4d, where the switch from 0 to
INVALID_MFN caused all super-pages to be shattered when attempting to remove
mappings by passing INVALID_MFN instead of 0.

Fixes: 0b6b51a69f4d ('xen/mm: Switch map_pages_to_xen to use MFN typesafe')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Detect non-present entries from the flags contents rather than checking the
   mfn parameter.
---
 xen/arch/x86/mm.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 8afb63c855b9..64b8054891da 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5232,9 +5232,17 @@ int map_pages_to_xen(
     }                                          \
 } while (0)
 
-/* Check if a (virt, mfn) tuple is aligned for a given slot level. */
-#define IS_LnE_ALIGNED(v, m, n) \
-    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << (PAGETABLE_ORDER * (n - 1))) - 1)
+/*
+ * Check if a (virt, mfn) tuple is aligned for a given slot level. m must not
+ * be INVALID_MFN, since alignment is only relevant for present entries.
+ */
+#define IS_LnE_ALIGNED(v, m, n) ({                              \
+    mfn_t m_ = m;                                               \
+                                                                \
+    ASSERT(!mfn_eq(m_, INVALID_MFN));                           \
+    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m_),                         \
+               (1UL << (PAGETABLE_ORDER * (n - 1))) - 1);       \
+})
 #define IS_L2E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 2)
 #define IS_L3E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 3)
 
@@ -5255,7 +5263,8 @@ int map_pages_to_xen(
         L3T_LOCK(current_l3page);
         ol3e = *pl3e;
 
-        if ( cpu_has_page1gb && IS_L3E_ALIGNED(virt, mfn) &&
+        if ( cpu_has_page1gb &&
+             (!(flags & _PAGE_PRESENT) || IS_L3E_ALIGNED(virt, mfn)) &&
              nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
         {
@@ -5374,7 +5383,7 @@ int map_pages_to_xen(
         if ( !pl2e )
             goto out;
 
-        if ( IS_L2E_ALIGNED(virt, mfn) &&
+        if ( (!(flags & _PAGE_PRESENT) || IS_L2E_ALIGNED(virt, mfn)) &&
              (nr_mfns >= (1u << PAGETABLE_ORDER)) &&
              !(flags & (_PAGE_PAT|MAP_SMALL_PAGES)) )
         {
@@ -5544,7 +5553,8 @@ int map_pages_to_xen(
  check_l3:
         if ( cpu_has_page1gb &&
              (flags == PAGE_HYPERVISOR) &&
-             ((nr_mfns == 0) || IS_L3E_ALIGNED(virt, mfn)) )
+             ((nr_mfns == 0) || !(flags & _PAGE_PRESENT) ||
+              IS_L3E_ALIGNED(virt, mfn)) )
         {
             unsigned long base_mfn;
             const l2_pgentry_t *l2t;
-- 
2.46.0


