Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4C6B17486
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 18:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065957.1431335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhViu-0002Ae-5f; Thu, 31 Jul 2025 16:01:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065957.1431335; Thu, 31 Jul 2025 16:01:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhViu-00028g-0O; Thu, 31 Jul 2025 16:01:40 +0000
Received: by outflank-mailman (input) for mailman id 1065957;
 Thu, 31 Jul 2025 16:01:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVg7-0001FB-CN
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:47 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cf6b234-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:45 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-55b797ad392so1255264e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:45 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:43 -0700 (PDT)
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
X-Inumbo-ID: 3cf6b234-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977525; x=1754582325; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nbgAo/EOUFfdJLvmZKiVtMFCYW00seKKM+9UoUaOzw=;
        b=LLsrJZtqlmLun+dyhAOWMHM3D44R6aJGCC0ZaoZzBgk9Wy2mYpQYvRvCj1vD2GS9Uo
         GUSlSEskoKh+3KnbLb8P1TZkFfCppGzPwTsjg0xiTMiwCzsj9iRcO8maWg/kMsQquncg
         ZKavP0s6E1uUiBUUgGe+p9iIv7MevgxZev4yKMY4NeBhp7xQo8EZ8m/axAaaW8EfG0bb
         c3xJxSof8vKsi03AjoeRzxBVhf+7HeMGOJRXbI6pE3vWuDpqQvootwTFvC7EGLlRGs0G
         kOx4WiCkq9XG/LTPbL6Ih/wy5jpa7jjeVKzgojUsXDiB2T9IT0V3pLinO4Wfpk2YTRyl
         EFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977525; x=1754582325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nbgAo/EOUFfdJLvmZKiVtMFCYW00seKKM+9UoUaOzw=;
        b=vhQxT+EcC9F+CrODX81SbDC8XxycJXi/i9AjwUcQ4qDaFytV3XWHRyKHexI5ry6zPA
         UpV2Cc8SioO3wyirJQKtK9bNtCse4GqBjcTGgIHVv6bwYI68QroqIaEomOkq+yrxRalS
         0Nf45XzGldDJGn3jFLlnNRSCUkcoCz7AxgTWdOZCV3nsZQzU//NGblfsqXG+AApfZroi
         dJm6Bu0a9AKl0+P/J2Y8qIDnPtSlojCPinqI2zc6VT2NztXNJDNLy5bcRdgxORuEPnUA
         34ZFQcZu78mOZQYIX5BlAODZHo6JUytGL+nra+gMZ8PqUlKzaRmYk3FZiFqwIE8VKQJa
         UhMg==
X-Gm-Message-State: AOJu0YzShPvdWvyIjy0yQwAxu9a7yuk22G+phmNabWDjakKib3ky2faX
	2n71IOm9UltSeJj2mXG8fWTWzPkYvzFdoIMCxxt17V7izn2htEnNT1UNULdGEA==
X-Gm-Gg: ASbGncuUZng4+RWGpBhfVj7kA+Hvz7YVSV9nYGUmRS/vigMxqsC1t7tp3WrXUywMAFg
	ayr2YwhNJCdkLGaQ+lbEeguCOROBitMPtOYWDyyFA5Asu6jUvRco58/K5hSrKOQV8Bi/xeoRfbQ
	pTJVd8cgeGgVmYCr2U41uWZs3VWzicgLhJoJxoThAbyC4KzzFVg6jPdRKap8Cq3k0KUbOuxNK26
	hNXgxb4785te/6hhuev//rZPzs9I7ueuK2IYQcTXyTAh0b3gaUTSrzHP4c6SaT+IFt4dj3W1ruv
	gfejD+8TDaug3ExBEI394snbgmFltib9ooLLSluftELajZ6zcqjR3znh9c7jndkLUznkhHBMD4z
	vnn6ZdNo8mMDYcsvp1uYbLcC1y4v6JcX1Xi59s+XdqL9FSTkO2yAKegH3MO6ghw==
X-Google-Smtp-Source: AGHT+IEfPnxxstawg0t0+hxbihwE+m/Yi+Rgy3vIvrVw8z8BawDEexyvy7KHMbrundlf7tSR0wwAxQ==
X-Received: by 2002:a05:6512:3ba8:b0:55b:8205:b1f2 with SMTP id 2adb3069b0e04-55b8205b426mr2435374e87.47.1753977524538;
        Thu, 31 Jul 2025 08:58:44 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 10/20] xen/riscv: introduce page_{get,set}_xenheap_gfn()
Date: Thu, 31 Jul 2025 17:58:09 +0200
Message-ID: <5aa3beb7fc0b7fc7f4d6d07ae25f37d44fc38858.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce page_set_xenheap_gfn() to encode the GFN associated with a Xen heap
page directly into the type_info field of struct page_info.

Introduce page_get_xenheap_gfn() to retrieve the GFN from a Xen heap page.

Reserve the upper 10 bits of type_info for the usage counter and frame type;
use the remaining lower bits to store the grant table frame GFN.
This is sufficient for all supported RISC-V MMU modes: Sv32 uses 22-bit GFNs,
while Sv39, Sv47, and Sv57 use up to 44-bit GFNs.

Define PGT_gfn_mask and PGT_gfn_width to ensure a consistent bit layout
across all RISC-V MMU modes, avoiding the need for mode-specific ifdefs.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Update the comment above defintions of PGT_gfn_width, PGT_gfn_mask.
 - Add page_get_xenheap_gfn().
 - Make commit message clearer.
---
Changes in v2:
 - This changes were part of "xen/riscv: implement p2m mapping functionality".
   No additional changes were done.
---
 xen/arch/riscv/include/asm/mm.h | 43 ++++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index dd8cdc9782..7950d132c1 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -12,6 +12,7 @@
 #include <xen/sections.h>
 #include <xen/types.h>
 
+#include <asm/cmpxchg.h>
 #include <asm/page.h>
 #include <asm/page-bits.h>
 
@@ -247,9 +248,17 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
 #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
 
-/* Count of uses of this frame as its current type. */
-#define PGT_count_width   PG_shift(2)
-#define PGT_count_mask    ((1UL << PGT_count_width) - 1)
+ /* 9-bit count of uses of this frame as its current type. */
+#define PGT_count_mask    PG_mask(0x3FF, 10)
+
+/*
+ * Stored in bits [22:0] (Sv32) or [44:0] (Sv39,48,57) GFN if page is
+ * xenheap page.
+ */
+#define PGT_gfn_width     PG_shift(10)
+#define PGT_gfn_mask      (BIT(PGT_gfn_width, UL) - 1)
+
+#define PGT_INVALID_XENHEAP_GFN   _gfn(PGT_gfn_mask)
 
 /*
  * Page needs to be scrubbed. Since this bit can only be set on a page that is
@@ -301,6 +310,34 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 
 #define PFN_ORDER(pg) ((pg)->v.free.order)
 
+/*
+ * All accesses to the GFN portion of type_info field should always be
+ * protected by the P2M lock. In case when it is not feasible to satisfy
+ * that requirement (risk of deadlock, lock inversion, etc) it is important
+ * to make sure that all non-protected updates to this field are atomic.
+ */
+static inline gfn_t page_get_xenheap_gfn(const struct page_info *p)
+{
+    gfn_t gfn = _gfn(ACCESS_ONCE(p->u.inuse.type_info) & PGT_gfn_mask);
+
+    ASSERT(is_xen_heap_page(p));
+
+    return gfn_eq(gfn, PGT_INVALID_XENHEAP_GFN) ? INVALID_GFN : gfn;
+}
+
+static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
+{
+    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
+    unsigned long x, nx, y = p->u.inuse.type_info;
+
+    ASSERT(is_xen_heap_page(p));
+
+    do {
+        x = y;
+        nx = (x & ~PGT_gfn_mask) | gfn_x(gfn_);
+    } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
+}
+
 extern unsigned char cpu0_boot_stack[];
 
 void setup_initial_pagetables(void);
-- 
2.50.1


