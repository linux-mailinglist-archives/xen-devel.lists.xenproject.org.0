Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC53AD5D22
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:23:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011966.1390479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPA5-0002gc-Vd; Wed, 11 Jun 2025 17:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011966.1390479; Wed, 11 Jun 2025 17:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPA5-0002dV-Si; Wed, 11 Jun 2025 17:22:53 +0000
Received: by outflank-mailman (input) for mailman id 1011966;
 Wed, 11 Jun 2025 17:22:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJt8=Y2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uPPA4-0002dK-MD
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:22:52 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3e4c28a-46e8-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:22:51 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a4fea34e07so93172f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 10:22:51 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a53229e0dcsm16348173f8f.15.2025.06.11.10.22.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 10:22:50 -0700 (PDT)
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
X-Inumbo-ID: b3e4c28a-46e8-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749662570; x=1750267370; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2T4dUlmbhOvNtyULSsUmaVMdY6R2usDVIaG9wqrny14=;
        b=l6j3fGuBCBsXd86kiZ4rqCkCIlFbHighdDAdVJ4uA9NYgGcaC38n5W3boZrFoaQ17X
         y7gzUuXSTlHmjhl2qzD3f9CCZsYis0LKwuGYfaqFkdOsh1yArBQ9yw25pBwQlp7rp2I2
         GMw1lmdmZtICfUFtg7tzR6q2CYjg+Z/fGsrIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749662570; x=1750267370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2T4dUlmbhOvNtyULSsUmaVMdY6R2usDVIaG9wqrny14=;
        b=ZqWyMizS7URjUFqUVcsIuuE0TnXX6u13UKkfmaWS2CXgrq+KfPtzyd1q6c2TODqnVq
         t4jQJURtvYd1r+RBItDTo2iIK+lEGmofocfIGuuPJiK0dWYTkkOheFISeS4XVDYCFlFf
         vE5MEQsgfuS/6FLN5XdOwCwWSWEfl/9SEQzp8aIjFVbkR+qPMv5YbP/Je3AowpA41Fyo
         aJu/5xMPLFEmn0ZmlJ3yxk9/M8k3bnsRMSpl80OSjOlXOiUYX39eU7HBGfv2CppUzknH
         9fL01raRSaxpo1mc3Lk8TK89PD1ITR1CNlYNouetcNntj4tANuUIlGvEur1FcnCBj2Ls
         ZTOw==
X-Gm-Message-State: AOJu0YyvgiFsF5oMo5gkFqEYXM9+V/du/6DJrvLpgri3D/R2a2qSGzEd
	VVxCtiUdd4yHH9V+0lX87jlx9mjqd1XzkD9rnaQqcQ3wrEv30lLNF1Lh0TqsCYDwZDwTcuWd+Dq
	Fvwjy
X-Gm-Gg: ASbGncs62viAvLFgGEa+KPUv9N5RQBU6JkKObrKCSCRbu3uKu7524E2XtXJLQKi6Yu4
	UDXpkzmd+g3kJkCaSHlF6LQrmsgD1U+BszeTGQBIzyyfA26neBiAR337qGZ+KwGflzgz4T8LqCU
	pk4r0hLtA0Ng6EHlR+dZjRozCxSjFOP8PNVmNzyHcRgac9w7xRNN1PlfFzFLprrJwxYf6bBUyLc
	wuIKaZMSmXkhuXlIDjOhus8MfNmZX0LB/KtZ9ZKJokl/+3LgDtTN8dDKhlCohjadYzUamkCTkjf
	Ps9/wOgPD9SjOr3dejTnDenISfMbVq0DrMOVAPClLUCzf+fUTRqqmsABExPGdQS/iK4VBQIcTOC
	EMDl1voJgWZVC3dbxy3DW3Hig92ePkSPX4XY=
X-Google-Smtp-Source: AGHT+IHXlb+f8mvAbVqXjkk+FJrV+4iDXJ2XDjnLmfwZ968nmhBctbQRAM+VY3AZTZ9kxht+7rKilA==
X-Received: by 2002:a05:6000:288e:b0:3a4:dfc2:2a3e with SMTP id ffacd0b85a97d-3a5586f192bmr4021318f8f.39.1749662570563;
        Wed, 11 Jun 2025 10:22:50 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/8] x86/pdx: simplify calculation of domain struct allocation boundary
Date: Wed, 11 Jun 2025 19:16:29 +0200
Message-ID: <20250611171636.5674-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611171636.5674-1-roger.pau@citrix.com>
References: <20250611171636.5674-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When not using CONFIG_BIGMEM there are some restrictions in the address
width for allocations of the domain structure, as it's PDX truncated to
32bits it's stashed into page_info structure for domain allocated pages.

The current logic to calculate this limit is based on the internals of the
PDX compression used, which is not strictly required.  Instead simplify the
logic to rely on the existing PDX to PFN conversion helpers used elsewhere.

This has the added benefit of allowing alternative PDX compression
algorithms to be implemented without requiring to change the calculation of
the domain structure allocation boundary.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/domain.c | 35 ++++++-----------------------------
 1 file changed, 6 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 7536b6c8717e..2f438ce367cf 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -461,30 +461,6 @@ void domain_cpu_policy_changed(struct domain *d)
     }
 }
 
-#if !defined(CONFIG_BIGMEM) && defined(CONFIG_PDX_COMPRESSION)
-/*
- * The hole may be at or above the 44-bit boundary, so we need to determine
- * the total bit count until reaching 32 significant (not squashed out) bits
- * in PFN representations.
- * Note that the way "bits" gets initialized/updated/bounds-checked guarantees
- * that the function will never return zero, and hence will never be called
- * more than once (which is important due to it being deliberately placed in
- * .init.text).
- */
-static unsigned int __init noinline _domain_struct_bits(void)
-{
-    unsigned int bits = 32 + PAGE_SHIFT;
-    unsigned int sig = hweight32(~pfn_hole_mask);
-    unsigned int mask = pfn_hole_mask >> 32;
-
-    for ( ; bits < BITS_PER_LONG && sig < 32; ++bits, mask >>= 1 )
-        if ( !(mask & 1) )
-            ++sig;
-
-    return bits;
-}
-#endif
-
 struct domain *alloc_domain_struct(void)
 {
     struct domain *d;
@@ -498,14 +474,15 @@ struct domain *alloc_domain_struct(void)
      * On systems with CONFIG_BIGMEM there's no packing, and so there's no
      * such restriction.
      */
-#if defined(CONFIG_BIGMEM) || !defined(CONFIG_PDX_COMPRESSION)
-    const unsigned int bits = IS_ENABLED(CONFIG_BIGMEM) ? 0 :
-                                                          32 + PAGE_SHIFT;
+#if defined(CONFIG_BIGMEM)
+    const unsigned int bits = 0;
 #else
-    static unsigned int __read_mostly bits;
+    static unsigned int __ro_after_init bits;
 
     if ( unlikely(!bits) )
-         bits = _domain_struct_bits();
+         bits = flsl(pfn_to_paddr(pdx_to_pfn(
+             1UL << (sizeof(((struct page_info *)NULL)->v.inuse._domain) * 8))))
+             - 1;
 #endif
 
     BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
-- 
2.49.0


