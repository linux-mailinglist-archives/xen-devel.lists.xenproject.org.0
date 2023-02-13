Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F40694958
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 15:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494611.764789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHU-0002n4-4d; Mon, 13 Feb 2023 14:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494611.764789; Mon, 13 Feb 2023 14:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaHT-0002jX-Te; Mon, 13 Feb 2023 14:58:11 +0000
Received: by outflank-mailman (input) for mailman id 494611;
 Mon, 13 Feb 2023 14:58:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sHlb=6J=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pRaHS-0001Ha-3d
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 14:58:10 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3c4ce85-abae-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 15:58:08 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id fj20so13307858edb.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Feb 2023 06:58:08 -0800 (PST)
Received: from uni.router.wind (adsl-89.109.242.225.tellas.gr.
 [109.242.225.89]) by smtp.googlemail.com with ESMTPSA id
 v1-20020a50a441000000b004aab66d34c7sm6787617edb.7.2023.02.13.06.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 06:58:07 -0800 (PST)
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
X-Inumbo-ID: d3c4ce85-abae-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ysij/ro07c0+TJWrYCtfS1joxXIrIyAx6s1ZIXpyeE=;
        b=FTblwDg1zWMM5BWbt/RyBbkeX6ZNWCNhXCIr31OBqIsdO403hTub6k4ryOSHp4apJ9
         1Q1n8OeNkZxFyfI+A16rDQROCTh673T/AnBLay8tifziYwmZwNaXghuxzzb7tkUpGw+L
         2f09xIlOSdLF5jmY681wVvoFdPPJOERENu1jYpwWphmsv+RL77liwbRpiaHwMJsxYBzD
         t3HCxHiLCwm1sceFOFNgbxQfndZZLoLfGecFd15iGrG59zHot3MXi4mVUN3BGDKoCT8P
         plOkEACe8phLE3lyGbIM9nAEEhxWfL1SqmrHmKl3NjLVk4UcTi1P7QvJczp944GDoJO0
         FSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ysij/ro07c0+TJWrYCtfS1joxXIrIyAx6s1ZIXpyeE=;
        b=hAfNhwTPcdv7J2i56jIEDQMzXX96vffVLw+aYLaVOIDVJRPrZ+VVeP2Oub0LDqFd1E
         75YvzOw7SRMYjbdyfepwunQZMh/2+3RrujvkZe3f5Z2nV48VKqqQ0SqIeI5QERV6i/vo
         69GIv6PGkaulF0CNfnJTPR8sn8rBzuRyr416x+ojY2mrmI1y1z0mE9EZ3yt+9UsUTSrL
         27YoWvm1zqhzle8g0zwVsyrf9e+udQSkWWizIOBQ7z7RsZb/gyeqpzg0rh4paxC0B/8A
         RIFMK5k7zflLguW2QjyB87m+UYShG9JGh5WJkaiC6kr4qJv75w+gYdCBhB4LrJ0a8kBX
         LDmg==
X-Gm-Message-State: AO0yUKWNQ10Mmt8eXTiTAjXw1OB0MgLzLsU6OTZcxv7M9jVN7oe8QveE
	SE5+RWmFfPdH2FyLt7RLUn3J+yKkJck=
X-Google-Smtp-Source: AK7set+GkQzuNUROaeZkqPhJFMYN6bRqV/h4LSzc3WsL+gk+OfUAqC1YutzN7Qknx+IQLfp3UmAd+w==
X-Received: by 2002:a50:a681:0:b0:4ac:c123:cd8f with SMTP id e1-20020a50a681000000b004acc123cd8fmr5228426edc.11.1676300287974;
        Mon, 13 Feb 2023 06:58:07 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 06/10] x86/domain: guard svm specific functions with AMD_SVM
Date: Mon, 13 Feb 2023 16:57:47 +0200
Message-Id: <20230213145751.1047236-7-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230213145751.1047236-1-burzalodowa@gmail.com>
References: <20230213145751.1047236-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions svm_load_segs() and svm_load_segs_prefetch() are AMD-V specific
so guard their calls in common code with AMD_SVM.

Since AMD_SVM depends on HVM, it can be used alone.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/domain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index db3ebf062d..576a410f4f 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1628,7 +1628,7 @@ static void load_segments(struct vcpu *n)
         if ( !(n->arch.flags & TF_kernel_mode) )
             SWAP(gsb, gss);
 
-#ifdef CONFIG_HVM
+#ifdef CONFIG_AMD_SVM
         if ( cpu_has_svm && (uregs->fs | uregs->gs) <= 3 )
             fs_gs_done = svm_load_segs(n->arch.pv.ldt_ents, LDT_VIRT_START(n),
                                        n->arch.pv.fs_base, gsb, gss);
@@ -1951,7 +1951,7 @@ static void __context_switch(void)
 
     write_ptbase(n);
 
-#if defined(CONFIG_PV) && defined(CONFIG_HVM)
+#if defined(CONFIG_PV) && defined(CONFIG_AMD_SVM)
     /* Prefetch the VMCB if we expect to use it later in the context switch */
     if ( cpu_has_svm && is_pv_64bit_domain(nd) && !is_idle_domain(nd) )
         svm_load_segs_prefetch();
-- 
2.37.2


