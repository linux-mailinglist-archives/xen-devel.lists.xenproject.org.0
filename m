Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC765B17477
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065874.1431268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVg5-0003N9-RW; Thu, 31 Jul 2025 15:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065874.1431268; Thu, 31 Jul 2025 15:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVg5-0003Hm-B4; Thu, 31 Jul 2025 15:58:45 +0000
Received: by outflank-mailman (input) for mailman id 1065874;
 Thu, 31 Jul 2025 15:58:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Jdx=2M=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uhVg2-0001FB-M6
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:42 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a6ede05-6e27-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 17:58:41 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-55b81b58eb7so1089760e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:41 -0700 (PDT)
Received: from fedora (user-109-243-64-38.play-internet.pl. [109.243.64.38])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b88c9931bsm278746e87.101.2025.07.31.08.58.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 08:58:39 -0700 (PDT)
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
X-Inumbo-ID: 3a6ede05-6e27-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753977520; x=1754582320; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7ABKQNzNNhVtyIOsZzusvptv27vOsEVorOK0u4RX9Y=;
        b=lC6IvenN/MykcX/nn6mTFrY9NDOw9x+h7i514hyX9ZuP0JWfJmq0xb+e8Nbb8bQ5bT
         tC0g2qtCQPvyG5wzB2QyJdJsJZsAOKbVWdmeeP/IOswxuVJpr2/oiIICB6qj2H+OUHHQ
         oGFpqMc+xZQ0FQUvNWAM8IXpPrClY0N3xHkBH2x02S8y4BBUkqGY3e9MpECbzJzbdF0m
         kBn6cImyhvFHdSzv446yPRte9UFTZ36n9bI/numWm+m4+c/ImGFdhA7+eRThALu82CD5
         uKQPjf4L3xT2kLx32jhxNDE9F5AMCIctcFrhDbUrolYl3RaqS4itpTSIRx4o58DOrpwc
         BYmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977520; x=1754582320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7ABKQNzNNhVtyIOsZzusvptv27vOsEVorOK0u4RX9Y=;
        b=vhyoNxmexCEpbGWl3fZy5TL02JTOzqf7obRgpl3zHEbK0fNDwNWflUYrfC6IZ24I4C
         i3DRAeAD3fNLk8YM5AUTMgUA+UAHIqOc2otDUt9ktoYEI5nCTMqfssLZRbt7rtbgHpfh
         IOdRUUPT9TpMq2uwvHNTrgjfju4FJ6m1kssEgbvjG54KYYouMhtkmsskOIfI2qcmui7F
         5w81JMyBbwfunEC5v/PI8plZNEiND8xwsQA6dp6g6GgoHe/fpRKMSeIO24UzV3p5F0Mb
         x0eCG+8lp4WXLVdWdoj+qqzsAPUnuSrTZuqBgFVSdiP936LQDIg23WpBmxnEN9Nl7Y53
         kxgA==
X-Gm-Message-State: AOJu0YxZZyiV80+mLIYEncfU3dgB5rgmhadKE584AugZJoSbFU1O6OGy
	UWvNsPPjSRBhMe3EcBr0L1OZvm1R1WyO1PAaRT+ThV9TsSsDYL6H82zKz0gaeA==
X-Gm-Gg: ASbGncvmFdTJMZM2x439mVImBaBWGgbfm14tk2qHs6OkJGqbQsul2CE8atpCyZXTcqV
	Ohy0E3UZNKhPd0kIhNxib+PBz4tHDPcm3xVaLMctxiDZmzHStFW7AOOjeIBzpZCBm4g+oU9UkqS
	g30t1uoBz/JUCxv940nWWVH52jwZ4mV8AfJF3pEwucrEVqh2x+iu2gvjF29ilv1cOITJY/D5BkA
	O9zMCTIMmKJwHVTzOyCRbx5D+w6+sG0LoMbFP+r9YG/5h7YB3TVJImqimWpNkUDdqx8Vs1M4yCz
	+k7tnE5K7Xjn7dBRaphOv7t308vD3oFEbhhb1gWzPRHLVN42jN+BbwVQsyWhIEDRtYurxfnlyvd
	wwio/ugSOlgWQEYg99zcx410oMtz1oJtvr2jAtESwX00sPGiyskaM4z/NqVSUH5u9nHNK0tV1
X-Google-Smtp-Source: AGHT+IFZ9/P5txhHOZcIdYQLMQy0yd9U4fQ1grk2NEjMr6QyX768RyqZ0vB1YRo0Kb7qktheL/olvw==
X-Received: by 2002:a05:6512:304f:b0:550:d4f3:8491 with SMTP id 2adb3069b0e04-55b7c08e2c0mr2408270e87.41.1753977520212;
        Thu, 31 Jul 2025 08:58:40 -0700 (PDT)
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
Subject: [PATCH v3 07/20] xen/riscv: introduce pte_{set,get}_mfn()
Date: Thu, 31 Jul 2025 17:58:06 +0200
Message-ID: <bd436fe7956b779ff5f471e897d7f3f576bf1754.1753973161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753973161.git.oleksii.kurochko@gmail.com>
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce helpers pte_{set,get}_mfn() to simplify setting and getting
of mfn.

Also, introduce PTE_PPN_MASK and add BUILD_BUG_ON() to be sure that
PTE_PPN_MASK remains the same for all MMU modes except Sv32.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
2.50.1


