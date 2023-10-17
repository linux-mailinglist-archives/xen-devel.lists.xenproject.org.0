Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B88E7CC8CC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 18:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618301.961776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsmvt-0006Vk-89; Tue, 17 Oct 2023 16:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618301.961776; Tue, 17 Oct 2023 16:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsmvt-0006Tb-35; Tue, 17 Oct 2023 16:28:37 +0000
Received: by outflank-mailman (input) for mailman id 618301;
 Tue, 17 Oct 2023 16:28:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QyJ2=F7=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qsmvs-0006TK-1E
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 16:28:36 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37eb42db-6d0a-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 18:28:35 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53ed4688b9fso3797044a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Oct 2023 09:28:35 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 b42-20020a509f2d000000b0053e43492ef1sm1515759edf.65.2023.10.17.09.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 09:28:34 -0700 (PDT)
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
X-Inumbo-ID: 37eb42db-6d0a-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697560114; x=1698164914; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACjTlp17z+YNibGqC8x+geAURHF1Kan1uHKDOj47eKE=;
        b=LOe3E3emijm5Bb4IbJ+jGKf89tb/xlrLP8yXAc7ayImM94tSZFVQMo9i7jDx83VEyD
         HIHEDedOKh3Re6qF6seOvODiWFAV763nbnqs7v/p/J+7NX6YPeeIYx9Cf1qEB5yjQTyq
         rhhJpcoT2NjbZrsMuD6Xkg5CJG0eNfyIb1SyleRxuokCX8rtNLDKXl6EddTAxLO/DEJi
         hM1mFe6bbc0vXC00jBrz9mRIKvgyhJp2mB0jrNPWGyaJ4nBGFPm08xqlhTyLjdsV0SJP
         cdOnwMcHg7Zu3ir+607UCb/ultaOLItmgoOanwWNKck8eKQ1+nIovAW2/W6IhH1nWTGn
         u51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697560114; x=1698164914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACjTlp17z+YNibGqC8x+geAURHF1Kan1uHKDOj47eKE=;
        b=C/r4vTlSTp4AjfGKkPJsMsCCV4dMzc+K6FURg3Bf9eRy1nj6UeEsJDh7UztZilkUgW
         fMzO0SVbNTmCwXNOuV3X+rm6307e6a2A4RQZB7jPjUV0JxHqGT9z0LhZAFOxIEeFyqC1
         UBb4bCMcpAfOTJF4hLiDE5rutYbQIzmtRudG6bkveV+biJlkM+VChxnr5gn+n9OwADzh
         rLuH7QufuXgJXgXunyRIvN6WvD1a6dZ2nCsNM23hA6CmDaw058cgFZ+a76X+ILlYtEvL
         hWLv4U0xWG4+L747FnIxPmGsEB5Ce2Vd9hk/xdEP/9GsCN/uK2XqEGHMv9HDvpyKD0BK
         3adQ==
X-Gm-Message-State: AOJu0YxVW5pUs/MOToOParCcBnJR8Z8Rn0qld4n7ndVlw6MyloC9D7tF
	uvbQF733tewZCDeTiSTfY7I=
X-Google-Smtp-Source: AGHT+IHDOoG54XbWT0w4HYKSIqNwfcnUP1l4hxV6R0suamSju/kc2UdPTin8Cao44o+9eCfjSpu0mg==
X-Received: by 2002:a05:6402:350b:b0:53e:2c49:8041 with SMTP id b11-20020a056402350b00b0053e2c498041mr2333292edd.8.1697560114667;
        Tue, 17 Oct 2023 09:28:34 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH -tip v3 2/3] x86/percpu, xen: Correct PER_CPU_VAR usage to include symbol and its addend
Date: Tue, 17 Oct 2023 18:27:33 +0200
Message-ID: <20231017162811.200569-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017162811.200569-1-ubizjak@gmail.com>
References: <20231017162811.200569-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PER_CPU_VAR macro should be applied to a symbol and its addend.
Inconsistent usage is currently harmless, but needs to be corrected
before %rip-relative addressing is introduced to PER_CPU_VAR macro.

No functional changes intended.

Cc: Juergen Gross <jgross@suse.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/xen/xen-asm.S | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/xen/xen-asm.S b/arch/x86/xen/xen-asm.S
index 9e5e68008785..448958ddbaf8 100644
--- a/arch/x86/xen/xen-asm.S
+++ b/arch/x86/xen/xen-asm.S
@@ -28,7 +28,7 @@
  * non-zero.
  */
 SYM_FUNC_START(xen_irq_disable_direct)
-	movb $1, PER_CPU_VAR(xen_vcpu_info) + XEN_vcpu_info_mask
+	movb $1, PER_CPU_VAR(xen_vcpu_info + XEN_vcpu_info_mask)
 	RET
 SYM_FUNC_END(xen_irq_disable_direct)
 
@@ -69,7 +69,7 @@ SYM_FUNC_END(check_events)
 SYM_FUNC_START(xen_irq_enable_direct)
 	FRAME_BEGIN
 	/* Unmask events */
-	movb $0, PER_CPU_VAR(xen_vcpu_info) + XEN_vcpu_info_mask
+	movb $0, PER_CPU_VAR(xen_vcpu_info + XEN_vcpu_info_mask)
 
 	/*
 	 * Preempt here doesn't matter because that will deal with any
@@ -78,7 +78,7 @@ SYM_FUNC_START(xen_irq_enable_direct)
 	 */
 
 	/* Test for pending */
-	testb $0xff, PER_CPU_VAR(xen_vcpu_info) + XEN_vcpu_info_pending
+	testb $0xff, PER_CPU_VAR(xen_vcpu_info + XEN_vcpu_info_pending)
 	jz 1f
 
 	call check_events
@@ -97,7 +97,7 @@ SYM_FUNC_END(xen_irq_enable_direct)
  * x86 use opposite senses (mask vs enable).
  */
 SYM_FUNC_START(xen_save_fl_direct)
-	testb $0xff, PER_CPU_VAR(xen_vcpu_info) + XEN_vcpu_info_mask
+	testb $0xff, PER_CPU_VAR(xen_vcpu_info + XEN_vcpu_info_mask)
 	setz %ah
 	addb %ah, %ah
 	RET
@@ -113,7 +113,7 @@ SYM_FUNC_END(xen_read_cr2);
 
 SYM_FUNC_START(xen_read_cr2_direct)
 	FRAME_BEGIN
-	_ASM_MOV PER_CPU_VAR(xen_vcpu_info) + XEN_vcpu_info_arch_cr2, %_ASM_AX
+	_ASM_MOV PER_CPU_VAR(xen_vcpu_info + XEN_vcpu_info_arch_cr2), %_ASM_AX
 	FRAME_END
 	RET
 SYM_FUNC_END(xen_read_cr2_direct);
-- 
2.41.0


