Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5817C807AE
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:34:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170569.1495678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVlt-00030H-0D; Mon, 24 Nov 2025 12:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170569.1495678; Mon, 24 Nov 2025 12:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVls-0002pX-Mw; Mon, 24 Nov 2025 12:34:20 +0000
Received: by outflank-mailman (input) for mailman id 1170569;
 Mon, 24 Nov 2025 12:34:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sr25=6A=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vNVlq-0001Xp-Da
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:34:18 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e427738e-c931-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 13:34:16 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b73545723ebso791732666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:34:16 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654cf0435sm1285238866b.4.2025.11.24.04.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 04:34:15 -0800 (PST)
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
X-Inumbo-ID: e427738e-c931-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987656; x=1764592456; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+d1ytZOJh9/tcscZ8MYovcBsMlr579WYydcNPF/Az0=;
        b=NOGVTemWKHco2TjW1+e54Py6SGtnHxAstwMo3rTneCL8CKXR7hRJCgq50nlsJWNdxI
         p0U1s59H3MMUy/y7Wvu+AMh5Qoj9uh+dA3NNGzGbtyoy26HaZQAo76ProXuxnEPzaZnI
         XQ6pY9eiXTPKUQILT4lN84FmMHjw6q1mtrxBRWbJs8nlOdYxy5AznL3Youpm2n5wffZO
         bJHgK8KwhOSW8g5AfWF6DzILKDITBNQbhhMYVA0QzITnQ1WseZbB4PA6idEtE3Nnxem7
         hjAeD3vrMiQFgTxwBwY790jcAVnSGesxxi97UH2kRMc4xIGD6ddQJRoNUIxYD6hgD0Wp
         P2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987656; x=1764592456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U+d1ytZOJh9/tcscZ8MYovcBsMlr579WYydcNPF/Az0=;
        b=ChBBm7S4xXNLypMFqdwio4nNpqDjIj0eMuPU7SRfkZIZa/L72D31J08yHNafXw9jl5
         Kadey294vp0KiLNUL3hyGdGK+gYFOd/oMQgAJP487w2Psz2dFifEFmCm1es3o0AoxomY
         4kKrDaX3dJrqqfruPurjZPrFwwNM3727v45TcrmZCiudA9vSMAtAb6FNDxspmOJGo0QI
         7+DQvpcAj2uCYm1o/nAQaeZxn8LiOvQ1fPaAlu4QO3qBUEe5ARW/0/zq9/RH2TMXLjYv
         b90OkKsxtCdovRtXncA+2X4afBBi+hXVJgmw7PsudqFHGfts2JHatNJjWLiIxiyy1igO
         ackQ==
X-Gm-Message-State: AOJu0YxP7rLWlTQ5bhwhEyNF0+kA7DIqLu/SDWmBYUXJfEvEsdQmP/4i
	6B1VbP7WOn0o3Yu8XIuYTiDN43WqfEX2hPN0jYStkNtP3PAeyQb8bb5FQj6tM9iy
X-Gm-Gg: ASbGncsGeEruAmT6Wxg2/hT772uuyfTsk8irStxeNa4jz11GOyWqFmoi7Hm0lCumC+O
	r2PTarqLmMxHuPUCNUyDLw5M0Tw5PPg+h6Fef01B+HtY79/tQEy+G9h6vO/hLBl8cs9MTUCSTsy
	VgZFsBmVCfhiOqSTLUspsakXZxJSvS++GHaSfjTXkYX7tL35cGTzf4r22/4hl9PjWHfSRAwGd+v
	CPYb4RFiKgqekCXvMXtEkO6jGrl3OF5+43HVcxJgL5x4JV9J7/A7kUQ87pVzkhx2l+JFr4xhttM
	BtKCl2KPMItcB5BpiZNX3fWTzPlgNbBUiJEUjDoTXUd4uLc94MSBA7lIiiCXU7OieXJAHXqh0aI
	g3okJl5vEE3ydAocsGNFEp/6AJcirLXKlMbzNP8/k2w972BAuRbJ59GsBneXEdWALS4/uzRhDhZ
	eGWcI7ZOI8+ebPVtSltV5eV15dMIncknDONjJs/j1i2R2IFmrAqZ2y8gw=
X-Google-Smtp-Source: AGHT+IHw8Ux1vWZxcPxsTCUryaZljT1b24ZcxiZgWO0bXp6/QDJ/WOlUCsV8lfEZGFvGTQNnu3PrHw==
X-Received: by 2002:a17:906:c156:b0:b73:7280:782a with SMTP id a640c23a62f3a-b7671a47ad2mr1214625866b.36.1763987655951;
        Mon, 24 Nov 2025 04:34:15 -0800 (PST)
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
Subject: [PATCH v6 07/19] xen/riscv: introduce pte_{set,get}_mfn()
Date: Mon, 24 Nov 2025 13:33:40 +0100
Message-ID: <adbd565dffdaa4f871c7c49e3cc38992e89c929d.1763986955.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <cover.1763986955.git.oleksii.kurochko@gmail.com>
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce helpers pte_{set,get}_mfn() to simplify setting and getting
of mfn.

Also, introduce PTE_PPN_MASK and add BUILD_BUG_ON() to be sure that
PTE_PPN_MASK remains the same for all MMU modes except Sv32.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4-V6:
 - Nothing changed. Only Rebase.
---
Changes in V3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V2:
 - Patch "[PATCH v1 4/6] xen/riscv: define pt_t and pt_walk_t structures" was
   renamed to xen/riscv: introduce pte_{set,get}_mfn() as after dropping of
   bitfields for PTE structure, this patch introduce only pte_{set,get}_mfn().
 - As pt_t and pt_walk_t were dropped, update implementation of
   pte_{set,get}_mfn() to use bit operations and shifts instead of bitfields.
 - Introduce PTE_PPN_MASK to be able to use MASK_INSR for setting/getting PPN.
 - Add BUILD_BUG_ON(RV_STAGE1_MODE > SATP_MODE_SV57) to be sure that when
   new MMU mode will be added, someone checks that PPN is still bits 53:10.
---
 xen/arch/riscv/include/asm/page.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index ddcc4da0a3..66cb192316 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -112,6 +112,30 @@ typedef struct {
 #endif
 } pte_t;
 
+#if RV_STAGE1_MODE != SATP_MODE_SV32
+#define PTE_PPN_MASK _UL(0x3FFFFFFFFFFC00)
+#else
+#define PTE_PPN_MASK _U(0xFFFFFC00)
+#endif
+
+static inline void pte_set_mfn(pte_t *p, mfn_t mfn)
+{
+    /*
+     * At the moment spec provides Sv32 - Sv57.
+     * If one day new MMU mode will be added it will be needed
+     * to check that PPN mask still continue to cover bits 53:10.
+     */
+    BUILD_BUG_ON(RV_STAGE1_MODE > SATP_MODE_SV57);
+
+    p->pte &= ~PTE_PPN_MASK;
+    p->pte |= MASK_INSR(mfn_x(mfn), PTE_PPN_MASK);
+}
+
+static inline mfn_t pte_get_mfn(pte_t p)
+{
+    return _mfn(MASK_EXTR(p.pte, PTE_PPN_MASK));
+}
+
 static inline bool pte_is_valid(pte_t p)
 {
     return p.pte & PTE_VALID;
-- 
2.51.1


