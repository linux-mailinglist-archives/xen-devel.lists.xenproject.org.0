Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D5CC474E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 17:56:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188148.1509433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL1-0007p5-Lo; Tue, 16 Dec 2025 16:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188148.1509433; Tue, 16 Dec 2025 16:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVYL1-0007kg-FZ; Tue, 16 Dec 2025 16:55:51 +0000
Received: by outflank-mailman (input) for mailman id 1188148;
 Tue, 16 Dec 2025 16:55:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcum=6W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVYL0-0006gk-Bw
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 16:55:50 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 124cb083-daa0-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 17:55:48 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so1045376166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 08:55:48 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8003cb349csm63169766b.68.2025.12.16.08.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Dec 2025 08:55:47 -0800 (PST)
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
X-Inumbo-ID: 124cb083-daa0-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765904148; x=1766508948; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JowCfsqLdt/Rx8FFIaYoN49RWDNYULO18OUKG+xlMH4=;
        b=fkO95oYqwwSA5kO8r46MWHD/nompavnYn2JRibNcGHwz/B7xsPluTAMr+2J4/NMRTN
         vkdzNra9hwUdYFfuNUEdZn9mop9CJUdlb5VGfv1X2AXVLe09WvqloBn6lAu9SB4YylNR
         hZYv9mv0IY/j/o/eoz3iAxAEpWGHgG7XIn3z03gsJ2IWtAThJByherRcY1c7xnAOpv7y
         MxV4N6s8CV8Z0iPmZQVX5ruG2RESLpIZxpmFu7dyk9XNfJ9q/biKF00c2+5/3TDdfLhX
         ER6xeaZXhWlrL/dWOyAiEN77wXNq2J9V9hBcq4RVepBKnf8QHFiWy775f5Lk8UUBxFCB
         6wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765904148; x=1766508948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JowCfsqLdt/Rx8FFIaYoN49RWDNYULO18OUKG+xlMH4=;
        b=tzIl6rVnizvMUuBTEyBdlRM3+ixLasw0W5/S2Ur8BE2XqCtWtd3Ur7jznbsNdcigFT
         ZsVF30R5u0neB4ptWWmBo1B0aY9tMhxfdMaQ04BU31W6C5QMuULZ48vlmwZLqU5l0XT2
         Ok+wGjU7T1c1v+z5Z8cW/VF46CMIUCxlk3w2W+TI6OxlSaPs3iLPtNd0jT9Lvl/oREDK
         63u7tt/MnRZUbWc0RMKpEU4opOj8f7Vn52Xbl5XkEGPCljs99wvYg+GRw0+CDKpnok6Z
         f/bQyvY+EJtXJC8PpcOqCUQl9upDFfeRctcfeOwPo7lVVERhnU1nf7ateBdNJ+Le2xXR
         AhaQ==
X-Gm-Message-State: AOJu0YyPKG933RzXy5KmaSXqTc7IgjcoVfF4GbtuMdbdnWVaLoeMvT9B
	5LvpNDLP+7qk4KF3Y4cn9RB3DTCDXtP79mK0F4ZqSnSvO1x8ve3Ig7y+UWB9Rg==
X-Gm-Gg: AY/fxX6SoC2Vsey9UIT6cBe6LRJ9W7Hk0C+VkVbasMKNdwgwS2RSq+DCp/q28ImA05n
	oyL9N4v/ztGFkQBcEBxnK77hHYh7E+poglBn8OcjwDNa6GId+j5/ds4VBvkcRo9ijxUMU7vK22C
	bv3y/CJW4uCxN7YU1osenyckynxpMFkrsiGLhI92kFpduZ/JrfAbkKTGWQzzTrnJ+3Z4CCG4Gcz
	Wm7zjqavDoHSDuBGPebzalHmX/eQmCp9OGgg4Hurmyryre+8EgWIMQ5su2KZER3vAAacXhrhdfo
	b5HM/T+sh4tK58rq7DsU+2hQ/r/jpyNblYBQi/h6VkE8bGf8y8CLo8yN92uDVPrpSJnf/2OzaNJ
	O0miVq6H8i0KDSLvK7r68155PjBfEVz3tgC9Hc2S5AK6nhVtOG0Nb6DEupmgFxAqHlirjFfk5F2
	OrWVqtEX5QZslV8IUR79Fz271wHuTbpau2MaR5J8BnCfyMFsmXUR2rNas=
X-Google-Smtp-Source: AGHT+IEeGZACCoO5crI4AOAIbm1N7ty51R8njHcMOX75sZpHVqTIyUxA228CNUz6fuaK8XWnKXTRlg==
X-Received: by 2002:a17:907:d19:b0:b73:870f:fa32 with SMTP id a640c23a62f3a-b7d23a27c29mr1769421066b.43.1765904147681;
        Tue, 16 Dec 2025 08:55:47 -0800 (PST)
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
Subject: [PATCH v7 06/19] xen/riscv: introduce pte_{set,get}_mfn()
Date: Tue, 16 Dec 2025 17:55:16 +0100
Message-ID: <323cea33c80cc4b09eb14fc89a9966815a78bf54.1765879052.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765879052.git.oleksii.kurochko@gmail.com>
References: <cover.1765879052.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce helpers pte_{set,get}_mfn() to simplify setting and getting
of mfn.

Also, introduce PTE_PPN_MASK and add BUILD_BUG_ON() to be sure that
PTE_PPN_MASK remains the same for all MMU modes except Sv32.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V4-V7:
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
index 7fde99f916..1fc5998a0b 100644
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
2.52.0


