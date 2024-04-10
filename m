Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 821D689EEE7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 11:32:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702959.1098672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUJA-0006ee-84; Wed, 10 Apr 2024 09:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702959.1098672; Wed, 10 Apr 2024 09:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruUJA-0006cL-4s; Wed, 10 Apr 2024 09:31:56 +0000
Received: by outflank-mailman (input) for mailman id 702959;
 Wed, 10 Apr 2024 09:31:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5G6/=LP=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1ruUJ8-0006XG-UW
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2024 09:31:54 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a033a4c-f71d-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 11:31:52 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-516c97ddcd1so7785187e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2024 02:31:52 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a195e11000000b00516cef1f1casm1814111lfb.181.2024.04.10.02.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Apr 2024 02:31:50 -0700 (PDT)
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
X-Inumbo-ID: 2a033a4c-f71d-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712741512; x=1713346312; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtOy8penHihNF/nf/lux7OjWap5QccP5xHkOXb4bAUc=;
        b=YKpJchWQnelTCDvMgH10/9c0/Yadl4GBi0aavAhUD0t0Yg9ETBR+dh9K7PeIL5EMQt
         8/JyoGhtRhrp3v5+N+sy2OgyxX//V9aCiwVd0Im8VnBwQOQisccWHMn3Ahfp32snBs36
         PxtdKihfUTT/BgP9Ht5Dm0VVHFMUUg5ebyy3xOGubj0g4YaZ2k+HYetPJUhJW7n52P4w
         VYKmDT99u8SlsKHlxg9tYFXTK16jVSQGbEXo+66QLP2qs8OMk6NyScY03cYJW8Jb2g/f
         1TElI68jsh9bpp2EYOGN2r2jPVFGLK06AYeZOPCpr9g9eG3zGQfew1xErjfTx7Jdh0ls
         S/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712741512; x=1713346312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtOy8penHihNF/nf/lux7OjWap5QccP5xHkOXb4bAUc=;
        b=fF6vBAFcPEmCvNWLH4eERdSoeRh/ji6zdkow4nTGMf23Z/XuLcoURZRcy9yi6d9ue3
         K0t5v3HAehPfBlNslV895t/dg9NrxPysl1AszAhD7tjzEZSfBUeOsD2h9tZTwtm13UHX
         KAPiizodsRqwMRQScp/dmXwigsAJw9Iz52A4tDtSPHNIMwTyVUV9eom3bbB9QuR5wH3V
         AuJ+yKM3uwMUlNUM8ZBnLrJWP4/IkByAdswE3kkeK0ItT1re+b0VyJEbfksbXYc1yQEl
         Re6TxZXL2iqr+0fb8d1zgKnrIZ6d5xDJGsGMx4aYYqvafueQq7TNnWyCjhS3puSstYRS
         /BeA==
X-Gm-Message-State: AOJu0YxbKpEk54g1zPFs5jES941+aZpTrryKy3Bs9glmSwDvhxa5yZrI
	Iu3nRGuMLXBC8ZAdY3CksOLLXcWTapCSTz/A1HqjtnwlRiOPQXlzKNf5AacUdIAkNw==
X-Google-Smtp-Source: AGHT+IFwq2d/+Hv5j9m4Q4eOl0UbCfR4S9sXmHVSyxusDhW7AUuCpl4BAwN1eE/zziE+plJPIt1AHw==
X-Received: by 2002:a05:6512:31cb:b0:516:9f20:9838 with SMTP id j11-20020a05651231cb00b005169f209838mr1615146lfe.19.1712741511733;
        Wed, 10 Apr 2024 02:31:51 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	julien@xen.org,
	bertrand.marquis@arm.com,
	michal.orzel@amd.com,
	Volodymyr_Babchuk@epam.com,
	jbeulich@suse.com,
	edgar.iglesias@amd.com
Subject: [RFC PATCH v1 1/2] xen/arm64: entry: Use xen/linkage.h to annotate symbols
Date: Wed, 10 Apr 2024 11:19:46 +0200
Message-Id: <20240410091947.1498695-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240410091947.1498695-1-edgar.iglesias@gmail.com>
References: <20240410091947.1498695-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Use the generic xen/linkage.h macros when annotating symbols.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 xen/arch/arm/arm64/entry.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
index f963c923bb..6188dd2416 100644
--- a/xen/arch/arm/arm64/entry.S
+++ b/xen/arch/arm/arm64/entry.S
@@ -480,9 +480,9 @@ guest_fiq_invalid_compat:
 guest_error_compat:
         guest_vector compat=1, iflags=IFLAGS__AI_, trap=guest_serror
 
-ENTRY(return_to_new_vcpu32)
+FUNC(return_to_new_vcpu32)
         exit    hyp=0, compat=1
-ENTRY(return_to_new_vcpu64)
+FUNC(return_to_new_vcpu64)
         exit    hyp=0, compat=0
 
 return_from_trap:
@@ -536,7 +536,7 @@ return_from_trap:
  * it. So the function will unmask SError exception for a small window and
  * then mask it again.
  */
-check_pending_guest_serror:
+FUNC_LOCAL(check_pending_guest_serror)
         /*
          * Save elr_el2 to check whether the pending SError exception takes
          * place while we are doing this sync exception.
@@ -586,7 +586,7 @@ abort_guest_exit_end:
         cset    x19, ne
 
         ret
-ENDPROC(check_pending_guest_serror)
+END(check_pending_guest_serror)
 
 /*
  * Exception vectors.
@@ -597,7 +597,7 @@ ENDPROC(check_pending_guest_serror)
         .endm
 
         .align  11
-ENTRY(hyp_traps_vector)
+FUNC(hyp_traps_vector)
         ventry  hyp_sync_invalid            /* Synchronous EL2t */
         ventry  hyp_irq_invalid             /* IRQ EL2t */
         ventry  hyp_fiq_invalid             /* FIQ EL2t */
@@ -626,7 +626,7 @@ ENTRY(hyp_traps_vector)
  *
  * Returns prev in x0
  */
-ENTRY(__context_switch)
+FUNC(__context_switch)
         add     x8, x0, #VCPU_arch_saved_context
         mov     x9, sp
         stp     x19, x20, [x8], #16         /* store callee-saved registers */
-- 
2.40.1


