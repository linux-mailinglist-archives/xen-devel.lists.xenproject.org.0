Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19070AD380B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 15:05:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010789.1389052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfp-0006lV-Pd; Tue, 10 Jun 2025 13:05:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010789.1389052; Tue, 10 Jun 2025 13:05:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOyfp-0006g1-GR; Tue, 10 Jun 2025 13:05:53 +0000
Received: by outflank-mailman (input) for mailman id 1010789;
 Tue, 10 Jun 2025 13:05:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YRmu=YZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uOyfm-0004Sm-TA
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 13:05:50 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a127a942-45fb-11f0-b894-0df219b8e170;
 Tue, 10 Jun 2025 15:05:49 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ad88eb71eb5so745252066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 06:05:49 -0700 (PDT)
Received: from fedora.. (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade32c42770sm626465466b.41.2025.06.10.06.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:05:47 -0700 (PDT)
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
X-Inumbo-ID: a127a942-45fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749560748; x=1750165548; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgDItj/Bt+Pokzd4VeTK3tNuj4yPdCLljiPQUCHOaVk=;
        b=DZXqmF8yw+n8vHvFRijSCXknuC2VvQWVn++eiYu+oj42DewjK3jojqcLnew3D7qfBy
         N+eFPQaWKku3yl6QZMo8IgCtkla/RE2FAnkItjzdig4qO0e8RTMQGf96VBX2rpWDIlrM
         hw+r5Ma/9i6lH7ObwK0DqWtxNS4T0Z0ig6RNQYz+VuZ9ffbjJAHSGBNqM9AXORb3+eQs
         zBOydzOYx+t1Di7aqZpbdTimYPdA/FDX6+Ddu8NvPCmPpvwfLZgmkmRnylZXutVONx97
         cp72BM3vgfj6fMnDLe8LloFDJvhtAi6X+s01krFzfvqCguyDgExIgAT/lG/r8bjzEIF8
         kyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560748; x=1750165548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgDItj/Bt+Pokzd4VeTK3tNuj4yPdCLljiPQUCHOaVk=;
        b=hfbAlK9P231waWe8rwFqcnhfktbr6HaaXpYWHbHwdpwYdvb1b3xV4jC9fbr5W1yptu
         UqcPylvYZZ0FUGWcJ3MVUie9Q6wMM/8eiV1++Y88usVC051LP/cPnD1L8uRA8xUpGXaD
         hG+c9mV5WYn2LlU7N5oya9qdV38K05uQbWrGo7UpANEwrYZZ0aUKIA2Qdf+PTCYYhiIl
         LZYm/1Rhmyz5j19zGQ8Mc1n+GW2szkYmMN3a3JEkKpwZ7/UHBMiRtdCll698AwWlJ/3a
         mo43KETx082Q/CeylibeYz0bja5a0RcO4q7FQ4DYgz+cINP+xu8LPl/n3uvBKFAeAA2f
         7Jwg==
X-Gm-Message-State: AOJu0YxxboOUVlI3CIKVsOdp09dzzcQ95VkKWt969YQcqWoXj6CvjJsP
	XxjHQk6RHGfkUmxozJyMfpTLqTEmw4Jca8OjaF8QaYnoyITWivojmaBphoZFnw==
X-Gm-Gg: ASbGnctXZZ9KBuYjpTcRNuQFSLV8xsGtD3PVtQOeQjp0/mESXvgJYgMwdvLj+iL61UH
	hH86FJ70QBum7WUQRg9ci2NRRGeAoTEun2OBg8m+Xt9dCt9xj5kpwgEoifLb/mlQX6eE1RmeZbu
	58U1HauCbp4zh2vcmwlZk+uRckH1JNnZee5B6InotJHis7G6ha8oOGMaGHV1riljRsVpURR68aq
	d/EOhFrb0iGS88+6J5vyRvaqOUfZt7rC9jJnSFG8jrVGAoh3FWjf6kGyd4eKo26ZUE0B61ZcANx
	Pz6Ed8FrhV1e19oGF5+vud/nq6ijkgl3vRwdPZvfk/exeyO3m2k/ITYwK6n3GxygFTlbqaTxg+R
	pmKIwH/HfjU7M5upbjrHLjxhvYGcJ
X-Google-Smtp-Source: AGHT+IHyp9el8zq0YS8Dtc+4LmQcBKrv1C8HmiuR5ZqVVMf5an/ANNzub+p9XkEnawpv2328xnzCVw==
X-Received: by 2002:a17:907:6d12:b0:ad8:a684:a1f7 with SMTP id a640c23a62f3a-ade7acdf570mr245655766b.30.1749560748353;
        Tue, 10 Jun 2025 06:05:48 -0700 (PDT)
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
Subject: [PATCH v2 07/17] xen/riscv: introduce pte_{set,get}_mfn()
Date: Tue, 10 Jun 2025 15:05:22 +0200
Message-ID: <5e2f0cea49ac1e0669be15811b1426bf4b4d2fec.1749555949.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749555949.git.oleksii.kurochko@gmail.com>
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce helpers pte_{set,get}_mfn() to simplify setting and getting
of mfn.

Also, introduce PTE_PPN_MASK and add BUILD_BUG_ON() to be sure that
PTE_PPN_MASK remains the same for all MMU modes except Sv32.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index 4cb0179648..1b8b145663 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -114,6 +114,30 @@ typedef struct {
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
 static inline pte_t paddr_to_pte(paddr_t paddr,
                                  unsigned int permissions)
 {
-- 
2.49.0


