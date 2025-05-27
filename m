Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA6AC5D25
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 00:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998771.1379474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK2nk-0002Bt-8S; Tue, 27 May 2025 22:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998771.1379474; Tue, 27 May 2025 22:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uK2nk-00029I-5m; Tue, 27 May 2025 22:29:40 +0000
Received: by outflank-mailman (input) for mailman id 998771;
 Tue, 27 May 2025 22:29:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrmh=YL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uK2ni-00029C-CX
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 22:29:38 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fceeb35-3b4a-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 00:29:32 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso598802566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 15:29:32 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad89f0890easm20956566b.60.2025.05.27.15.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 15:29:31 -0700 (PDT)
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
X-Inumbo-ID: 0fceeb35-3b4a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748384972; x=1748989772; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3oiHMMn1gOhGUbZjQ+nPA545Sb+2MYIAsishPZ9ofHY=;
        b=neT+ZDog5GTry/drSZSUWQY4j3akrsAcBhtOpH/pRzRQLnrHK0Kw9/O82heihdTMKv
         gJUdbvnz36B2iK2gzxr+Unc9tLedE/w5xmykhw8iJTy4cKpz2AGogKMcW4AeeoT4Oyfh
         K3EjI+x4QOg7POtYtTSxOxTMWJo2u2MZ7HQ40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748384972; x=1748989772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oiHMMn1gOhGUbZjQ+nPA545Sb+2MYIAsishPZ9ofHY=;
        b=BvWotjMreITfBTd29GJdyWbRry8MuLCTUArAdVIoxtD6Tw2izUpB7JDEcuKN3SImlS
         wtbFQzvuPwxNl4b/DJIJiItoZr20n+WVSb8Zr482MAzwPiS1UYFTMEfsAS3/a94qHWPd
         Ekl5lFxKjQIuT9eKQl3sxY8OzYhuqYuKWR6gINHKCaAewGrpgbRxEGggg8kslkD3clDj
         PtP8eLluepLV4d+UoIrmEsSEI1XNEdrzw6S+eKDlh6rL65w8Ch4l48SRGe1FqJsdt7MV
         bgetbgyOLIlNUfD95uWh6bCgC8Mv6iM3D9HdIBO7Jy+MaXJEJfYxBbR7D3MRv9HzG8v9
         8fgQ==
X-Gm-Message-State: AOJu0YyA7JQEZUHnbOfq+20IHik6q8dvKkdkGtYvDrWv+L9s+Pb/9ggC
	d7ziASjPr3YWO1lAttU8PxU0DRob5o1SJfLtWInEBFbqk60v7/VSV7Xswn7Cnmx4VwcMOL481AR
	tbar9
X-Gm-Gg: ASbGncuYat/VviWuI5cttskvJxfikMAyh2AOXu8QsNrq3YLSJwnG24oOoKYhavbakS9
	OeCAAgsi+yrlc+PmC83EKLsZOwONqF8KlQt9DQt2UM/j7YvttzRkY9Unyo0B3FIzn/yO8KIx14v
	cOvfp6rK1H76+CmHUkRbIPgAiseMFx+1oMnzG/xpfAcGfZ+TRS+nAvNCHRv78x157BAO57KeMLj
	VNXfLbUuaCvSNeRNZYLc8sCXsX+B7Je9ESYyjE1kibtwJpuke7qj6SaHdsUnw38lh8hhzbqH484
	cbqim5uV2hD14BGOJM8xjOUY/zXh98BF1GueR0+4oIf7PUeVjXF65A7PN8p+7UxfXgMFKNCiuEI
	upukuSiSmsLfpYK38N4N5zCVdNsLvorD+b1k=
X-Google-Smtp-Source: AGHT+IFeYNMBj5gwWxSZAb2E+zf1Ivvq+P1Oe4aPcpNWSVMNsf5CJA+r/eltnskHMFCHKbuM7FAYhQ==
X-Received: by 2002:a17:907:9715:b0:ad8:8835:f794 with SMTP id a640c23a62f3a-ad88835f7bbmr492246066b.32.1748384972114;
        Tue, 27 May 2025 15:29:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/bitops: Optimise arch_ffs()/etc some more on AMD
Date: Tue, 27 May 2025 23:29:30 +0100
Message-Id: <20250527222930.1452674-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

One aspect of the old ffs()/etc infrastructure was the use of TZCNT/LZCNT
without a CPUID check.  Given no obvious justification, I dropped it during
the cleanup.

It turns out there is a good reason, on all but the most recent AMD CPUs.

Reinstate the use of "blind" TZCNT/LZCNT when safe to do so.  This happens to
be preferentially in loops where a repeated saving of 5-6 uops becomes far
more relevant than a one-off scenario.

Leave an explanation of why.

No functional change.

Fixes: 989e5f08d33e ("x86/bitops: Improve arch_ffs() in the general case")
Fixes: 5ed26fc0768d ("xen/bitops: Implement ffsl() in common logic")
Fixes: 54b10ef6c810 ("xen/bitops: Implement fls()/flsl() in common logic")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/bitops.h | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 87eac7782f10..62e6ca26f5b0 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -399,9 +399,16 @@ static always_inline unsigned int arch_ffs(unsigned int x)
          *
          * and the optimiser really can work with the knowledge of x being
          * non-zero without knowing it's exact value, in which case we don't
-         * need to compensate for BSF's corner cases.  Otherwise...
+         * need to compensate for BSF's corner cases.
+         *
+         * That said, we intentionally use TZCNT on capable hardware when the
+         * behaviour for the 0 case doesn't matter.  On AMD CPUs prior to
+         * Zen4, TZCNT is 1-2 uops while BSF is 6-8 with a latency to match.
+         * Intel CPUs don't suffer this discrepancy.
+         *
+         * Otherwise...
          */
-        asm ( "bsf %[val], %[res]"
+        asm ( "rep bsf %[val], %[res]"
               : [res] "=r" (r)
               : [val] "rm" (x) );
     }
@@ -428,7 +435,7 @@ static always_inline unsigned int arch_ffsl(unsigned long x)
 
     /* See arch_ffs() for safety discussions. */
     if ( __builtin_constant_p(x > 0) && x > 0 )
-        asm ( "bsf %[val], %q[res]"
+        asm ( "rep bsf %[val], %q[res]"
               : [res] "=r" (r)
               : [val] "rm" (x) );
     else
@@ -446,7 +453,7 @@ static always_inline unsigned int arch_fls(unsigned int x)
 
     /* See arch_ffs() for safety discussions. */
     if ( __builtin_constant_p(x > 0) && x > 0 )
-        asm ( "bsr %[val], %[res]"
+        asm ( "rep bsr %[val], %[res]"
               : [res] "=r" (r)
               : [val] "rm" (x) );
     else
@@ -464,7 +471,7 @@ static always_inline unsigned int arch_flsl(unsigned long x)
 
     /* See arch_ffs() for safety discussions. */
     if ( __builtin_constant_p(x > 0) && x > 0 )
-        asm ( "bsr %[val], %q[res]"
+        asm ( "rep bsr %[val], %q[res]"
               : [res] "=r" (r)
               : [val] "rm" (x) );
     else

base-commit: d965e2ee07c56c341d8896852550914d87ea5374
prerequisite-patch-id: 8da89000c73c38aab6abfa6622217ea9eff07fbd
prerequisite-patch-id: 74830838bac94ed1e036a8173cf3210a314b35d8
prerequisite-patch-id: 0654835c28df8d40b6c97006d041c4d31447a9a6
prerequisite-patch-id: 2d47d646c6a6e0019918c57753d6c01a752c377f
prerequisite-patch-id: d8f8c4221a2d7039bae6f3d38e93fe90b2091d01
prerequisite-patch-id: e0397c86b545a1d65f2e6b2049c282b926c40c64
prerequisite-patch-id: ea21abe4540ee229f4f8725ce3f701d9ba4bd4a8
-- 
2.39.5


