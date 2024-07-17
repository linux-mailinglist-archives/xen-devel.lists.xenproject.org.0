Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E7693403B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 18:14:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760077.1169817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU7IR-0008DH-Ab; Wed, 17 Jul 2024 16:14:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760077.1169817; Wed, 17 Jul 2024 16:14:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU7IR-00089a-7e; Wed, 17 Jul 2024 16:14:27 +0000
Received: by outflank-mailman (input) for mailman id 760077;
 Wed, 17 Jul 2024 16:14:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rux=OR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sU7IQ-0007cd-0E
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 16:14:26 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1e8a456-4457-11ef-8776-851b0ebba9a2;
 Wed, 17 Jul 2024 18:14:24 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0468so84852331fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 09:14:24 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59ff76e9851sm2064067a12.46.2024.07.17.09.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 09:14:21 -0700 (PDT)
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
X-Inumbo-ID: a1e8a456-4457-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721232863; x=1721837663; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvzhdU6x9AsIJRrQYGcjNo5sQW70nyGBUDqt4jxaSlQ=;
        b=S5kF/WWsNgVRZ1C2hE24FkRVgJvieZCAXesAFhfQlVzzoxDq2YNYSVhNd2LC1N8dGu
         bxNgu4zDltBkA3xJUhFj+If8bT0AhHKI8qNxYL8zzb74NId1xxhHnVXcloEQ1ywdESkV
         qfcBSTom9qhP7vdxlX3rWHiRJsk60fQZigH6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721232863; x=1721837663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvzhdU6x9AsIJRrQYGcjNo5sQW70nyGBUDqt4jxaSlQ=;
        b=eljI4YbjDh8oJ0te7drSCSX6IUeYeM5j4xN47RCENfn52l7W13jhHSg0XSX3V7DkTp
         3pympO2WaVZO2TYLKnFrKgkupaT/3Z3dXzEOMlZqFMmzp1fTRJIIrTQcIl1zz31nOWWF
         cAuVEFNeW48B7zrnPf1J3p3jt/00rSKGcs7ArA37evjPUwTTj3nr6mgoG/j8b++yMGg7
         4aoRucL75l/zubh7wogxyjJmTIPwyRKZlQjS1ahTe9YbQnIrQ4sj75d6XfEgRET2FryI
         M6MUvp7w3rrxF9DRrY17SxD3H8P8IjkPFdj77jJNgv51Fc71QyDkr4p2sZrKAPdEVbQV
         lXZg==
X-Gm-Message-State: AOJu0Yyom7rqP1xnmaSNrPrdOEwG/dEdjG6tOoLO5kuUx0aZQE43GTCp
	ip/87bPZUEKkvcKDgAFP54ntaCfOa5jReBTe3bdNvl7DjMkH9klYTGbhdqZ/rIUnW3cAVddnt6o
	d
X-Google-Smtp-Source: AGHT+IGXLIIUiAI+gC9eBhq5fKEVyrJPtP68hJKmzAAuUzWzrV7GD8Gn/EXQtq6KFUp88QiJlBPmEw==
X-Received: by 2002:a2e:be90:0:b0:2ec:3dd4:75f4 with SMTP id 38308e7fff4ca-2eefd141eb7mr21114391fa.38.1721232863174;
        Wed, 17 Jul 2024 09:14:23 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH RFC 3/3] x86/mm: Simplify/correct l1_disallow_mask()
Date: Wed, 17 Jul 2024 17:14:15 +0100
Message-Id: <20240717161415.3586195-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717161415.3586195-1-andrew.cooper3@citrix.com>
References: <20240717161415.3586195-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

l1_disallow_mask() yields L1_DISALLOW_MASK with PAGE_CACHE_ATTRS conditionally
permitted.  First, rewrite it as a plain function.

Next, correct some dubious behaviours.

The use of is_pv_domain() is tautological; l1_disallow_mask() is only used in
the PV pagetable code, and it return true for system domains as well.

The use of has_arch_pdevs() is wonky; by making the use of cache attributes
dependent on the instantanious property of whether any devices is assigned,
means that a guest could have created a legal PTE which will fail validation
at a later point when the device has been removed.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

RFC.  I've not tested this, and I doubt it will work to start with owing to
the removal of the dom_io special case which IIRC dom0 uses to map arbitrary
MMIO.

Furthermore, the rangeset_is_empty() calls have the same problem that
has_arch_pdevs() has; they're not invariants on the domain.  Also, VMs
wanting/needing encrypted memory need fully working cacheability irrespective
of device assignment.

I expect the way we actually want to fix this is to have a CDF flag for
allowing reduced cahcebility, and for this expression to simplify to just:

    if ( d->options & XEN_DOMCTL_CDF_any_cacheability )
        disallow &= ~PAGE_CACHE_ATTRS;

which is simpler still.

For the current form, bloat-o-meter reports:

  add/remove: 1/0 grow/shrink: 1/2 up/down: 75/-280 (-205)
  Function                                     old     new   delta
  l1_disallow_mask                               -      74     +74
  mod_l1_entry.cold                             55      56      +1
  get_page_from_l1e                           1271    1167    -104
  mod_l1_entry                                1860    1684    -176

which is an even bigger improvement than simply not duplicating the logic.
---
 xen/arch/x86/mm.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 95795567f2a5..31937319c057 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -162,13 +162,17 @@ static uint32_t __ro_after_init base_disallow_mask;
 
 #define L4_DISALLOW_MASK (base_disallow_mask)
 
-#define l1_disallow_mask(d)                                     \
-    (((d) != dom_io) &&                                         \
-     (rangeset_is_empty((d)->iomem_caps) &&                     \
-      rangeset_is_empty((d)->arch.ioport_caps) &&               \
-      !has_arch_pdevs(d) &&                                     \
-      is_pv_domain(d)) ?                                        \
-     L1_DISALLOW_MASK : (L1_DISALLOW_MASK & ~PAGE_CACHE_ATTRS))
+static uint32_t l1_disallow_mask(const struct domain *d)
+{
+    uint32_t disallow = L1_DISALLOW_MASK;
+
+    if ( (d->options & XEN_DOMCTL_CDF_iommu) ||
+         !rangeset_is_empty(d->iomem_caps) ||
+         !rangeset_is_empty(d->arch.ioport_caps) )
+        disallow &= ~PAGE_CACHE_ATTRS;
+
+    return disallow;
+}
 
 static s8 __read_mostly opt_mmio_relax;
 
-- 
2.39.2


