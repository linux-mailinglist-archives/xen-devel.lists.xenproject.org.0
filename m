Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252A869F3CE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 13:00:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499398.770534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnZ-0000mA-EA; Wed, 22 Feb 2023 12:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499398.770534; Wed, 22 Feb 2023 12:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUnnZ-0000kX-9z; Wed, 22 Feb 2023 12:00:37 +0000
Received: by outflank-mailman (input) for mailman id 499398;
 Wed, 22 Feb 2023 12:00:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Q6c=6S=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pUnnY-0000Rg-1U
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 12:00:36 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81d0e24f-b2a8-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 13:00:32 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id b12so29314066edd.4
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 04:00:32 -0800 (PST)
Received: from uni.router.wind (adsl-161.109.242.137.tellas.gr.
 [109.242.137.161]) by smtp.googlemail.com with ESMTPSA id
 br4-20020a170906d14400b008de729c8a03sm2133171ejb.38.2023.02.22.04.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 04:00:31 -0800 (PST)
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
X-Inumbo-ID: 81d0e24f-b2a8-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3N3piCiGWBTq0LmBNA8fpZwNDzK/IZkQT7MxXOAi4Ls=;
        b=cYDsEaf7/te6v2zDN6IZBxWjfuyyDdqGG4sQ9zaJas4CNh5Gk6qUBaT6M6QNPDSuI4
         2dC9qQD0Jzyt3PJRXmItZj7lwxskarHK+cSJvsj7mAZCSuI25DENgApLwztENg62pTAs
         PQ0xjWoEvJUXLpsR2u6uz5NmfLkRy5B8RYyMkEqMgj922RI0q9mREW+ANql2Apy1ZVak
         NbYkXVLuak60fJiNYclhEvD3f+mGOmpR+g+8M3tN6bPsM1qnfUAJ2Pioutsj7MhhjLY1
         05c+9aq+D0cWC3jUCWnOT0GdLUztO3tjlJGhw0FunEcfDgF69bXaQoOqmLuqgfySTGCN
         8b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3N3piCiGWBTq0LmBNA8fpZwNDzK/IZkQT7MxXOAi4Ls=;
        b=blARJ6eisRSgHtxjxOgwnaPsoI0YXCHHJAkyNQjlcc7YFhLD1dvcji38908lyqyF7m
         fBr0LCIsrSGAWGLfZzeDVdJYlrjYdnDNj0WBhml+SMF890mPcpu2KVe6AoncY4jfbTv7
         Kcx3wIgVjKyVPG3di/iVt08PtnS8TnhTbZRTB0IH5Xll6yJwAPghXUqUgsszDOaPaIMn
         EC09qMowOLxb0y80Ghti4pqb+42a3Lale6aVaFxth3ZNiPbcO7WZTBWn21Pg+6mn+Ar0
         p+r7Wo0UX4kz2fT/VNoie1fbp/DrK/OpnTGm9rl99d0YYULRF1ZEEzhs2mJ7lA/ZFdU2
         TUGQ==
X-Gm-Message-State: AO0yUKXOoC9jaLtIofOsPUy1MJuNaDuebTvsGWZO6GR7PmQFIiESqpiL
	Njw/F0i8WKn7PWyBKUPmGYIyD5VIA1k=
X-Google-Smtp-Source: AK7set+b72Vu/wbcA1IfmKn1TWGG7/7r4g7qVI595O8rmfN6pyzv8OpoHyY52kM6bA3bcvxK5auL2w==
X-Received: by 2002:a17:906:805a:b0:873:1b57:b27f with SMTP id x26-20020a170906805a00b008731b57b27fmr14555060ejw.61.1677067231533;
        Wed, 22 Feb 2023 04:00:31 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 1/9] x86/svm: remove unused forward declaration of struct vcpu from svm.h
Date: Wed, 22 Feb 2023 14:00:15 +0200
Message-Id: <20230222120023.3004624-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230222120023.3004624-1-burzalodowa@gmail.com>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove forward declaration of struct vcpu, that is a leftover since
the removal of svm_update_guest_cr()'s declaration from svm.h.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
Fixes: b158e72abe30 ("x86/hvm: CFI hardening for hvm_funcs")
---

Changes in v2:
  - leave the forward declaration of struct cpu_user_regs in place,
    suggested by Andrew
  - add a fixes tag based on Andrew's comment
  - update commit message

 xen/arch/x86/include/asm/hvm/svm/svm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 65e35a4f59..fa39d4d76a 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -46,7 +46,6 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
 }
 
 struct cpu_user_regs;
-struct vcpu;
 
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
-- 
2.37.2


