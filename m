Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD9FA091F2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869519.1281024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4i-0003Mc-JR; Fri, 10 Jan 2025 13:29:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869519.1281024; Fri, 10 Jan 2025 13:29:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4i-0003Hn-8T; Fri, 10 Jan 2025 13:29:20 +0000
Received: by outflank-mailman (input) for mailman id 869519;
 Fri, 10 Jan 2025 13:29:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4g-0001QR-Lh
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:18 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4913f05-cf56-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 14:29:18 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5d982de9547so3863734a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:18 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:16 -0800 (PST)
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
X-Inumbo-ID: e4913f05-cf56-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515757; x=1737120557; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBkiVpHM8v5vp8P31Jsr5IhRd2sJbMgPGREzQchfE+0=;
        b=USmORQwaLa7l5xaHIvGC5nila+X+hoOxASxsLKn7L1ZzwocqC5d+8F80QxrpbTp2le
         Zbs6QCyN4RpdTy6fgB42x7rWe02U29rXpvg3pH01/z09ZTQwOWYMVNqv66v9bllHgLst
         5mFTdptrcOmG5jVz3mlq2M6tiZamiAYJbQ42A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515757; x=1737120557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBkiVpHM8v5vp8P31Jsr5IhRd2sJbMgPGREzQchfE+0=;
        b=bjUS2f7QDqSzaVBIwud6AUXRM8+UYvKT7HYjRuf23KCXLfB3pd2usA0h73jtAk0FTg
         W0EstrFc/1FEe4DWqjhSWOFlKgp0EBODzWPp1piKlqIzii0BvRIR2862AJRwcl5ogogD
         u2I2yqhXKY7Eq06TWj9OJyCFDjxQJ1dZAsJZK9WVXrvRcAtQWiMTU2vicUCuWNxJDXY5
         Uaot6SWlgMRz/NBFrWdgvQu/7gdXY39z5HyQroygyPd2h442AwFy9grHxYYC6Uiv8ZFX
         3vRfpbLSANvkIf1gnTWBa8wXS4eMT4jV4ftWEZGWK3Z+C5A5/3AR4Xgl4nnvoDmNiLN8
         34UQ==
X-Gm-Message-State: AOJu0YwtZdliDxWsPBTmRo0jLWZuuzTFv6gEpACffOFCp7Dt5DXStL4z
	wM0yPhzh/mAgZFOQ7SQOCnlzXXgYSR43wvdocKJiXp5qXIxjLRkGqdt+Lkos5m/fmMUKPiM3HER
	dlgP65w==
X-Gm-Gg: ASbGncs8tROJZQpTq/OZ3X4r8xjS1ATha8gtOMMz3PSJ8QJ/JkDu+Zin8aAJlit8MSF
	aNtBDWFZchdupHldistHS7vgKOkRbgrI2sDIEPTLKT4hOjZUej7u578mXUG+KU2dnzlNIx+Q2X9
	w8hunko0lWlOcA4DmIJZfbHXWdJKtuIMoWdty/8EOn4009r7HUHQA/aeNNwgCJyNo3r3uFumqJe
	b+L0YK/d0u/jgy+xRr1ipUs4vlsCMY6O3Gb2eQhRJVm0HWuSqL/b2l7Gb5eL4AmovdTWAte9f9x
	/M4=
X-Google-Smtp-Source: AGHT+IF2kUi1l15Plt8UytnrHFbBfLL+/GMd8KtcoOhar7B79Utam/Ngh0jJKQmV4Jh1Dkwci5S5XA==
X-Received: by 2002:a05:6402:2746:b0:5d9:a85:1a59 with SMTP id 4fb4d7f45d1cf-5d972e4769bmr9812304a12.27.1736515757431;
        Fri, 10 Jan 2025 05:29:17 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 09/12] x86/mpx: Map/unmap xsave area in in read_bndcfgu()
Date: Fri, 10 Jan 2025 13:28:20 +0000
Message-ID: <20250110132823.24348-10-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2->v3:
  * No change

v1->v2:
  * s/ret/bndcfgu
---
 xen/arch/x86/xstate.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 3d249518a1b7..2003ba664594 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -1024,9 +1024,10 @@ int handle_xsetbv(u32 index, u64 new_bv)
 
 uint64_t read_bndcfgu(void)
 {
+    uint64_t bndcfgu = 0;
     unsigned long cr0 = read_cr0();
-    struct xsave_struct *xstate
-        = idle_vcpu[smp_processor_id()]->arch.xsave_area;
+    struct vcpu *v = idle_vcpu[smp_processor_id()];
+    struct xsave_struct *xstate = VCPU_MAP_XSAVE_AREA(v);
     const struct xstate_bndcsr *bndcsr;
 
     ASSERT(cpu_has_mpx);
@@ -1052,7 +1053,12 @@ uint64_t read_bndcfgu(void)
     if ( cr0 & X86_CR0_TS )
         write_cr0(cr0);
 
-    return xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR ? bndcsr->bndcfgu : 0;
+    if ( xstate->xsave_hdr.xstate_bv & X86_XCR0_BNDCSR )
+        bndcfgu = bndcsr->bndcfgu;
+
+    VCPU_UNMAP_XSAVE_AREA(v, xstate);
+
+    return bndcfgu;
 }
 
 void xstate_set_init(uint64_t mask)
-- 
2.47.1


