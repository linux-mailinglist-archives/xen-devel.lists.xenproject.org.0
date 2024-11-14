Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786CF9C8D75
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2024 15:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.836526.1252432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbIZ-0007Xx-Dx; Thu, 14 Nov 2024 14:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 836526.1252432; Thu, 14 Nov 2024 14:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBbIZ-0007T6-8y; Thu, 14 Nov 2024 14:58:19 +0000
Received: by outflank-mailman (input) for mailman id 836526;
 Thu, 14 Nov 2024 14:58:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QegD=SJ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tBbIX-0007K7-P5
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2024 14:58:17 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e034466f-a298-11ef-a0c7-8be0dac302b0;
 Thu, 14 Nov 2024 15:58:15 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a9f1c590ecdso114203266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Nov 2024 06:58:15 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e043b84sm70827666b.137.2024.11.14.06.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 06:58:13 -0800 (PST)
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
X-Inumbo-ID: e034466f-a298-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmYiLCJoZWxvIjoibWFpbC1lajEteDYyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImUwMzQ0NjZmLWEyOTgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNTk2Mjk1LjM2Mzg3LCJzZW5kZXIiOiJyb2dlci5wYXVAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731596294; x=1732201094; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0to/rSIeQG19u7kDm67YYj3X5UuL0xhfI5HLy/Vz4M=;
        b=TMuMJdOdC24ZHi+Zeo0nuMzuMGbJ+69aD1o8CQJm5a2J0IcGUjO4piZC8vR5d2VYAN
         Tc5HT1XWBTSGzey876OnJenpp493/yNnR9hqoswQfFPkUsRlVxwE6oXCcREpE8trIPH0
         JQ22f0oTT5sVPFORlAp7/EVxN8d8ZG9XtJsZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731596294; x=1732201094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0to/rSIeQG19u7kDm67YYj3X5UuL0xhfI5HLy/Vz4M=;
        b=U9+ThsGfCBM89s0a50q720IQf7B4aPmkLRk/paLEC/WG++vAFBGowb+t79XbK8CZVp
         PPM+ym/msWM2u2jOiTJ7VHXnPRAbResGVFvamxVBoWtAQ6O4K/umVNCCebojHn01MOSg
         blte40vi2KS/wW0yLBnLzh19y+HfVWIBGoPGfaUg//XTIjjU7e87wEyqPxCr6xXQHWzi
         C++vZtH/VLAgeo2l2UmpcyrxzKKq2uPR0yyr4t9CkkqrZfwyCoE3LZR9wAQhkuKZ0uU3
         MDRO2kN3K7fdFzHYRL6ttEwguc/b/9v7nW2OpCSefFKCVx5O9KRwVpmx0xlIi7fHmCEW
         Dn9g==
X-Gm-Message-State: AOJu0Yw+r3v6AcRCLVY7pVX21fL8/bPiLjhDLMeDeDnc7st2I3QhLtML
	/k5m4fHXWkN9WW5uaTzGtXTspUK9F3AAsSFsrZBGQY4VflO1f7+lRt+89xlbRk1Fw55BQNARf3c
	3
X-Google-Smtp-Source: AGHT+IGKKQHAG7a56T4kdnuzwe2XbLvwv4+S+QVF2rSjaUcvZ4lKxDXe7Zjdq7m8cVYXZqj3UQW8Jw==
X-Received: by 2002:a17:907:3e99:b0:a9a:e6:a031 with SMTP id a640c23a62f3a-aa1f813e6edmr719623766b.59.1731596294423;
        Thu, 14 Nov 2024 06:58:14 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 2/4] x86/mm: skip super-page alignment checks for non-present entries
Date: Thu, 14 Nov 2024 15:57:13 +0100
Message-ID: <20241114145715.59777-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241114145715.59777-1-roger.pau@citrix.com>
References: <20241114145715.59777-1-roger.pau@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changees since v2:
 - Remove unneeded page present check.

Changes since v1:
 - Detect non-present entries from the flags contents rather than checking the
   mfn parameter.
---
 xen/arch/x86/mm.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index ebb50a7836ac..b9a2234b53e1 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -5493,10 +5493,17 @@ int map_pages_to_xen(
     }                                          \
 } while (0)
 
-/* Check if a (virt, mfn) tuple is aligned for a given slot level. */
-#define IS_LnE_ALIGNED(v, m, n)                                 \
-    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m),                          \
-               (1UL << (PAGETABLE_ORDER * ((n) - 1))) - 1)
+/*
+ * Check if a (virt, mfn) tuple is aligned for a given slot level. m must not
+ * be INVALID_MFN, since alignment is only relevant for present entries.
+ */
+#define IS_LnE_ALIGNED(v, m, n) ({                              \
+    mfn_t m_ = m;                                               \
+                                                                \
+    ASSERT(!mfn_eq(m_, INVALID_MFN));                           \
+    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m_),                         \
+               (1UL << (PAGETABLE_ORDER * ((n) - 1))) - 1);     \
+})
 #define IS_L2E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 2)
 #define IS_L3E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 3)
 
@@ -5517,7 +5524,8 @@ int map_pages_to_xen(
         L3T_LOCK(current_l3page);
         ol3e = *pl3e;
 
-        if ( cpu_has_page1gb && IS_L3E_ALIGNED(virt, mfn) &&
+        if ( cpu_has_page1gb &&
+             (!(flags & _PAGE_PRESENT) || IS_L3E_ALIGNED(virt, mfn)) &&
              nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
              !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
         {
@@ -5636,7 +5644,7 @@ int map_pages_to_xen(
         if ( !pl2e )
             goto out;
 
-        if ( IS_L2E_ALIGNED(virt, mfn) &&
+        if ( (!(flags & _PAGE_PRESENT) || IS_L2E_ALIGNED(virt, mfn)) &&
              (nr_mfns >= (1u << PAGETABLE_ORDER)) &&
              !(flags & (_PAGE_PAT|MAP_SMALL_PAGES)) )
         {
-- 
2.46.0


