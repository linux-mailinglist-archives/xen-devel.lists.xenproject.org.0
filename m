Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7AD8C5C30
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 22:18:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721734.1125394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yar-0004VQ-Lk; Tue, 14 May 2024 20:17:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721734.1125394; Tue, 14 May 2024 20:17:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6yar-0004SQ-IO; Tue, 14 May 2024 20:17:49 +0000
Received: by outflank-mailman (input) for mailman id 721734;
 Tue, 14 May 2024 20:17:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uMtz=MR=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s6yaq-0002pc-2i
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 20:17:48 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07be9db2-122f-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 22:17:47 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-420116a6652so23635155e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 13:17:47 -0700 (PDT)
Received: from gmail.com ([213.0.35.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42013bf1a5dsm100159525e9.30.2024.05.14.13.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 13:17:43 -0700 (PDT)
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
X-Inumbo-ID: 07be9db2-122f-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715717867; x=1716322667; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1717D7j7Li0LpnJckxTcnvPunZIbhAasL7O0x4ESCyw=;
        b=k1QEDIxWIsN/Y5whsuTQFD0jUS/JyoVIouGDI8MpJ++ebF9RW2Puo/OU875R4Kp/bM
         W7pQwqoiKbIDz7Mbf/lzzJ3iRBhKFHDq33FzStFgET3nTNmZWlgJs+OQVub8NsO98FQP
         rXs085R87JgUCJoAS4HsmpK23A5vQl/xVNH7A9s1Trppm1t/ydFsPjPXl+peCFkMHAEf
         PBaQLfO7P3Lh2Wd2XkItUIGwIL1+NGJfbofLCdkA/G1CYTKPUOYn9SNjdYAj8lusIK5j
         /B69xk5FyHQq3SorjZEPf5+yCrP/es9cOEauUjk5AeYFF7n9t7Yzr4MjmocXpRRuNuz7
         pYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715717867; x=1716322667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1717D7j7Li0LpnJckxTcnvPunZIbhAasL7O0x4ESCyw=;
        b=t2VDvpm7Rvv9uEjGhPjJXTkBkExBB6KYU1UDwvMm6HhXcCVxCQEwBVpFMw4A0ntClB
         NRxdrKG9cy0aoH/QGzjuYh1d/ijwNi05U1/Tgvl066YSS9mAlEQP3FvAH3XDmSLgBfwo
         peH//LfCdpWPO4TtYsOBK7Mm2jas+fnf8h730/ahj/jx2DsFGRiyWL4NQd6zgLHDubGU
         JHVd77QcHPRs/AXL8QtP4mux/koqn7Pbqnik/bMsFpsw6JxOGmJiwzowtWok7RL8aWng
         vYEa+uYIRz24i7Sc4JeZohcjlTq9L0c9y1RyFr9MZW2r1n/cHnxxRehxEm+5fy500s88
         y7Kg==
X-Gm-Message-State: AOJu0YzT98Kh84YJk1TS4eN1hCRMl0CXT8aue+UiXFwKfRtqRl6TCSnO
	/B/Nu5w3zhlEMWm88jyhyiApUHVsuNTxCkxIWq3zOG8Ww2GRwtBVLJydoAdWdqQ=
X-Google-Smtp-Source: AGHT+IGRh/W5Wv2GrhvlWrUjkBkCL2R4hNYgf3565GfKmcqojKnIg9g6JVwPHXk2eVzSaWDGoc/4jQ==
X-Received: by 2002:a05:600c:4f92:b0:420:177f:c2a6 with SMTP id 5b1f17b1804b1-420177fc636mr46639105e9.10.1715717866670;
        Tue, 14 May 2024 13:17:46 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	edgar.iglesias@amd.com
Subject: [PATCH v4 6/9] xen/arm64: bpi: Add missing code symbol annotations
Date: Sat,  4 May 2024 13:55:11 +0200
Message-Id: <20240504115514.1063509-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
References: <20240504115514.1063509-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros to annotate code symbols
and add missing annotations.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/arm64/bpi.S | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/arm64/bpi.S b/xen/arch/arm/arm64/bpi.S
index 4e63825220..d6b8defb80 100644
--- a/xen/arch/arm/arm64/bpi.S
+++ b/xen/arch/arm/arm64/bpi.S
@@ -52,14 +52,15 @@
  * micro-architectures in a system.
  */
     .align	11
-ENTRY(__bp_harden_hyp_vecs_start)
+FUNC(__bp_harden_hyp_vecs_start)
     .rept 4
     vectors hyp_traps_vector
     .endr
-ENTRY(__bp_harden_hyp_vecs_end)
+LABEL(__bp_harden_hyp_vecs_end)
+END(__bp_harden_hyp_vecs_start)
 
 .macro mitigate_spectre_bhb_loop count
-ENTRY(__mitigate_spectre_bhb_loop_start_\count)
+FUNC(__mitigate_spectre_bhb_loop_start_\count)
     stp     x0, x1, [sp, #-16]!
     mov     x0, \count
 .Lspectre_bhb_loop\@:
@@ -68,11 +69,12 @@ ENTRY(__mitigate_spectre_bhb_loop_start_\count)
     b.ne    .Lspectre_bhb_loop\@
     sb
     ldp     x0, x1, [sp], #16
-ENTRY(__mitigate_spectre_bhb_loop_end_\count)
+LABEL(__mitigate_spectre_bhb_loop_end_\count)
+END(__mitigate_spectre_bhb_loop_start_\count)
 .endm
 
 .macro smccc_workaround num smcc_id
-ENTRY(__smccc_workaround_smc_start_\num)
+FUNC(__smccc_workaround_smc_start_\num)
     sub     sp, sp, #(8 * 4)
     stp     x0, x1, [sp, #(8 * 2)]
     stp     x2, x3, [sp, #(8 * 0)]
@@ -81,13 +83,15 @@ ENTRY(__smccc_workaround_smc_start_\num)
     ldp     x2, x3, [sp, #(8 * 0)]
     ldp     x0, x1, [sp, #(8 * 2)]
     add     sp, sp, #(8 * 4)
-ENTRY(__smccc_workaround_smc_end_\num)
+LABEL(__smccc_workaround_smc_end_\num)
+END(__smccc_workaround_smc_start_\num)
 .endm
 
-ENTRY(__mitigate_spectre_bhb_clear_insn_start)
+FUNC(__mitigate_spectre_bhb_clear_insn_start)
     clearbhb
     isb
-ENTRY(__mitigate_spectre_bhb_clear_insn_end)
+LABEL(__mitigate_spectre_bhb_clear_insn_end)
+END(__mitigate_spectre_bhb_clear_insn_start)
 
 mitigate_spectre_bhb_loop 8
 mitigate_spectre_bhb_loop 24
-- 
2.40.1


