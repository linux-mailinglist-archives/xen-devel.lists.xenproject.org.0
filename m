Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAA98B9FB7
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 19:45:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716041.1118124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU8-0002Qf-IN; Thu, 02 May 2024 17:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716041.1118124; Thu, 02 May 2024 17:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2aU8-0002MW-EM; Thu, 02 May 2024 17:44:44 +0000
Received: by outflank-mailman (input) for mailman id 716041;
 Thu, 02 May 2024 17:44:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1TOG=MF=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s2aU7-0000pj-9D
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 17:44:43 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7a1a43f-08ab-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 19:44:41 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51ac5923ef6so1939533e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 10:44:41 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 cf9-20020a056512280900b0051efeb3994asm245518lfb.288.2024.05.02.10.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 10:44:39 -0700 (PDT)
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
X-Inumbo-ID: a7a1a43f-08ab-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714671880; x=1715276680; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+btECkGvGdaMDpadFUE07lhZtvml0qD3bZm2bwgsu5s=;
        b=KloZ3SnP/n8Yzcy/qtJjYPihZjESjPvMDTDL6BF2fSnAwySbO7zvGQOJ0cL7tT69ho
         bfZQKoUkog2ns0alfn1aLhm2Cpj104NDm83TldGC34zwCJfAQcFn9eQa66XhIey8GqfP
         5cYFOzkPjmEkbw5jhQLAxHXoN980H/gnpXssIRjMQt2vjPzbCsMKFHfhQalwsgM2lHPA
         UBpXYML1w9xNm1E3sppTOJztyKCj8+UTXx186A3S9eqAIBqzZa/S16hp8IxQbHTES43l
         6HmKYVsH0n//067t0QEAi/UZL/HojfJUszg2rNjyYbBtX6LOZA7n7Z5UZu8MfL0E4P36
         E+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714671880; x=1715276680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+btECkGvGdaMDpadFUE07lhZtvml0qD3bZm2bwgsu5s=;
        b=K9nXLp0n+QYMSdSeycn4H8TADSxltCvVfwl2XGtqsXiC9K8gtmtT4ZA4QldPDuaubU
         wDnAyPJyGFB+w+NaWEBlbE99VH/H0KO8EIWMxhszzE229OWusI8sZkJmInsnSf1YPJxB
         eQIFfSACCRQ8mA5o4+wczxysMjcEB4fb0xbgy1+r3hgcKBmeSGXOUvDyFo/VlDY6hy5w
         B6KVA1i/lTBz2dCprTnx69NriqtBmbJOmPRcZIEh8FmJTDvygyodhAcNfvurF0W+LS1l
         kDuI0lKYNSjDKyDm2LC77eH0DcSPiH5BnR+fjoE9nd7uk5Da6wJpYtzJ1MIaVLqeesuV
         rioQ==
X-Gm-Message-State: AOJu0YwwmvyEGmH8l9pQUAVrk81xyGVZ7t2lRv4lAvP19o0qHq6yPLjh
	FN0vfht61ZC4OeDAiC3Gu2iMUHzVRvu+MvOAkexYRSacbefDt7FAsjAc0Tbx
X-Google-Smtp-Source: AGHT+IEeaDRkvnyZ84ZEqX2g2gP1bsOAOy3rLwUj3q9QOWJgKyu8kPC1ZQjmXZ0ZCcY6wSReM+ACtA==
X-Received: by 2002:ac2:4572:0:b0:513:c47e:d811 with SMTP id k18-20020ac24572000000b00513c47ed811mr102176lfm.33.1714671880241;
        Thu, 02 May 2024 10:44:40 -0700 (PDT)
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
Subject: [PATCH v3 6/9] xen/arm64: bpi: Add missing code symbol annotations
Date: Wed,  1 May 2024 05:54:45 +0200
Message-Id: <20240501035448.964625-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240501035448.964625-1-edgar.iglesias@gmail.com>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
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
index 4e63825220..b16e4d1e29 100644
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
+GLOBAL(__bp_harden_hyp_vecs_end)
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
+GLOBAL(__mitigate_spectre_bhb_loop_end_\count)
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
+GLOBAL(__smccc_workaround_smc_end_\num)
+END(__smccc_workaround_smc_start_\num)
 .endm
 
-ENTRY(__mitigate_spectre_bhb_clear_insn_start)
+FUNC(__mitigate_spectre_bhb_clear_insn_start)
     clearbhb
     isb
-ENTRY(__mitigate_spectre_bhb_clear_insn_end)
+GLOBAL(__mitigate_spectre_bhb_clear_insn_end)
+END(__mitigate_spectre_bhb_clear_insn_start)
 
 mitigate_spectre_bhb_loop 8
 mitigate_spectre_bhb_loop 24
-- 
2.40.1


