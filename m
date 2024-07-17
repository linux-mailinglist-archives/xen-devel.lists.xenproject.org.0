Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDEE93403A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 18:14:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760075.1169796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU7IP-0007iv-RM; Wed, 17 Jul 2024 16:14:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760075.1169796; Wed, 17 Jul 2024 16:14:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU7IP-0007gP-No; Wed, 17 Jul 2024 16:14:25 +0000
Received: by outflank-mailman (input) for mailman id 760075;
 Wed, 17 Jul 2024 16:14:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rux=OR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sU7IO-0007cd-BF
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 16:14:24 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0c20ec2-4457-11ef-8776-851b0ebba9a2;
 Wed, 17 Jul 2024 18:14:22 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5a156557029so72866a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 09:14:22 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59ff76e9851sm2064067a12.46.2024.07.17.09.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 09:14:19 -0700 (PDT)
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
X-Inumbo-ID: a0c20ec2-4457-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721232861; x=1721837661; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Hs4wrdJtk3VapaPKuUdheZRErHwrsf5hCAxRfp1mf8=;
        b=Lq7Rm/vx7l3PADnhtuZ4Ii4edFz0JO5DoDLVNiY30x1Dcgg9hfIuoHV+NnOjTlkCFI
         Kc4fYYul2JjqVCloBh/W9jSJQ3XuPsT0FFHl6B1BOnaWJLR85fL8v30OLbT39Yc66jSH
         Q76pBOe/yOGwjoOFLAsHltJXN9otALGhFUohA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721232861; x=1721837661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Hs4wrdJtk3VapaPKuUdheZRErHwrsf5hCAxRfp1mf8=;
        b=UtNZayiL7Lv1J2SFBjxKtnldR1i9i4jYnb9IjvVRnWN6ZEwWPUVPkfJPbamtk0MK/O
         orrDcQdOlcz321M/gUhfVrJQdpO3vog9+roog6499OoAouRaMcMuSm/Z/r7RR9arjk5q
         UK3USfCbVJC7mwsUBBc6BiNZD8miIl5V64NMve59kio7o9R2dNFjT4YX3hFuXMYJo0pU
         LdaK58RS17PLqAWPhp8il11P+f40DsblnkiWcNo8PlGOMJ8B0OBnZSZd98uY/wNYNghj
         4ZsrEej21Zzk4C94hGiEaVGrtFXx0FLvcSBKxg/TDjZb9ocjPN3l4TRHea5lUaKHtM5Q
         dJbQ==
X-Gm-Message-State: AOJu0YxODtR/2qvjqHPcoovk2UECgfQfhlmMAlmcdY78WpBQ4/sjyFpv
	43BDSHhMQ09mo5kH/5jiYsvZ2m9PyPq5Fku6jxLubD6V4l53TatXqx5Jq6AMzToRkWkU6Kkqu+P
	s
X-Google-Smtp-Source: AGHT+IE2A+aNCiABEOLDj6cm/ACujRFbXC9ad5IBBn1C1Q8iC5+GOl71h4QF9IdCDJYgfyBjlsI8TQ==
X-Received: by 2002:a05:6402:2547:b0:58e:3501:5c25 with SMTP id 4fb4d7f45d1cf-5a05b9db216mr1759950a12.13.1721232861013;
        Wed, 17 Jul 2024 09:14:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/mm: Drop duplicate l1_disallow_mask() calls
Date: Wed, 17 Jul 2024 17:14:13 +0100
Message-Id: <20240717161415.3586195-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717161415.3586195-1-andrew.cooper3@citrix.com>
References: <20240717161415.3586195-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Even in release builds, gdprintk() evalues its parameters for side effects,
and l1_disallow_mask() is full of them.

Calculate the disallow mask once and reuse the variable.  This improves code
generation in release builds:

  add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-207 (-207)
  Function                                     old     new   delta
  mod_l1_entry                                1947    1860     -87
  get_page_from_l1e                           1391    1271    -120

Also, render the bad flags message with a 0x prefix.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/mm.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 648d6dd475ba..0ecea0f707b2 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -842,7 +842,7 @@ get_page_from_l1e(
 {
     unsigned long mfn = l1e_get_pfn(l1e);
     struct page_info *page = mfn_to_page(_mfn(mfn));
-    uint32_t l1f = l1e_get_flags(l1e);
+    uint32_t l1f = l1e_get_flags(l1e), disallow;
     struct vcpu *curr = current;
     struct domain *real_pg_owner;
     bool write, valid;
@@ -853,10 +853,10 @@ get_page_from_l1e(
         return 0;
     }
 
-    if ( unlikely(l1f & l1_disallow_mask(l1e_owner)) )
+    disallow = l1_disallow_mask(l1e_owner);
+    if ( unlikely(l1f & disallow) )
     {
-        gdprintk(XENLOG_WARNING, "Bad L1 flags %x\n",
-                 l1f & l1_disallow_mask(l1e_owner));
+        gdprintk(XENLOG_WARNING, "Bad L1 flags %#x\n", l1f & disallow);
         return -EINVAL;
     }
 
@@ -2155,11 +2155,12 @@ static int mod_l1_entry(l1_pgentry_t *pl1e, l1_pgentry_t nl1e,
     if ( l1e_get_flags(nl1e) & _PAGE_PRESENT )
     {
         struct page_info *page = NULL;
+        uint32_t disallow = l1_disallow_mask(pt_dom);
 
-        if ( unlikely(l1e_get_flags(nl1e) & l1_disallow_mask(pt_dom)) )
+        if ( unlikely(l1e_get_flags(nl1e) & disallow) )
         {
-            gdprintk(XENLOG_WARNING, "Bad L1 flags %x\n",
-                    l1e_get_flags(nl1e) & l1_disallow_mask(pt_dom));
+            gdprintk(XENLOG_WARNING, "Bad L1 flags %#x\n",
+                     l1e_get_flags(nl1e) & disallow);
             return -EINVAL;
         }
 
-- 
2.39.2


