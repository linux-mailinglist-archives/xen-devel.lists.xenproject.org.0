Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FDF7C99EF
	for <lists+xen-devel@lfdr.de>; Sun, 15 Oct 2023 18:12:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617168.959577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qs3hc-00045Q-0B; Sun, 15 Oct 2023 16:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617168.959577; Sun, 15 Oct 2023 16:10:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qs3hb-000435-T9; Sun, 15 Oct 2023 16:10:51 +0000
Received: by outflank-mailman (input) for mailman id 617168;
 Sun, 15 Oct 2023 16:10:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YdO5=F5=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qs3ha-0003oD-DL
 for xen-devel@lists.xenproject.org; Sun, 15 Oct 2023 16:10:50 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66f2b84f-6b75-11ee-9b0e-b553b5be7939;
 Sun, 15 Oct 2023 18:10:47 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99de884ad25so599942066b.3
 for <xen-devel@lists.xenproject.org>; Sun, 15 Oct 2023 09:10:47 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 rh14-20020a17090720ee00b009b947f81c4asm2421863ejb.155.2023.10.15.09.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Oct 2023 09:10:46 -0700 (PDT)
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
X-Inumbo-ID: 66f2b84f-6b75-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697386247; x=1697991047; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNuYyWEUkCBUvaAXEq0aoPImcZWnaX/wCmiSUbk6m0g=;
        b=JmPvSp6aQYmr67/tJAb/tLmUkXcJaemHA9/DdbGVsHaiy48C8uijUdcJ6YLhCc25rG
         IbvCqI60w2lTwUTSuuDX5fxZ3GkUEGvaxvVx9VUjEBOes+gp6Iy5IPiw3al1dx2Yf1fy
         eK6biv54xNQkEqIXmbTx5E8fbEJ3qQ+xKaXFJum+3PZxgQkkLC4uFeS8jW+Sa2JWGMhd
         KFsvfx+c/roqx0inyhW+w7HL3x2QFpOJPMO9ZcSRysILcDUoI+srdPwB8ADllQuV2Wav
         GzoTqk3T9RGJaYQayx7BwAAiVl+kwyRXjg5mLVf1+OSMIOTdlXSHvAycsHWkCeVYUmkJ
         HW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697386247; x=1697991047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNuYyWEUkCBUvaAXEq0aoPImcZWnaX/wCmiSUbk6m0g=;
        b=LdSBviKFdowY+VIzHYxgnjtkQe1/0IYqFktaP0NKrpmqu1Y+rb0PGTazxsHqYlPkZn
         GQmji7Zce86N5mtHzSYZbcO7lYJ1IsbIe7lL8TKfhW4gviy0itBSPRKiYAziP7WmpUwG
         1OcbVp58qsLm7ng5FcEa1VfRPX7N0WjyaNmWPULT6nM9EZ4EO8LVTTB9nQR6aX/lc1dn
         pKSWY8KmutKQ1CXS2at7KCcTpOUnaUqJIWZU02P4Ht3XTa0rPczTCLpHm8hILVfk7GAT
         uy6fHQrAqCxFT7WX8NZgcZGqkVxv58JjfrZVAvqoHGHlf+5x7sHTgdEkeqN4epdWS1ug
         1meg==
X-Gm-Message-State: AOJu0Yx2Di3oDHVV4VZyfE0FhhSuOc2vQdpVEjfgcocf6uiEO8JGjcbv
	INBS6Nhq4LeiV9gcus+v+6Wz1Y0UGil6hw==
X-Google-Smtp-Source: AGHT+IHzwRGoTsq2ot/pkjlspwnV7I6UAUsPnchXAv4bHUoDdbyDL6cBAAa+K2qzJnSDEzRDgK0gbw==
X-Received: by 2002:a17:907:9450:b0:9bd:e3ae:ef57 with SMTP id dl16-20020a170907945000b009bde3aeef57mr5115780ejc.60.1697386247417;
        Sun, 15 Oct 2023 09:10:47 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH RESEND 2/2] x86/percpu, xen: Correct PER_CPU_VAR usage to include symbol and its addend
Date: Sun, 15 Oct 2023 18:08:56 +0200
Message-ID: <20231015161036.39689-2-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231015161036.39689-1-ubizjak@gmail.com>
References: <20231015161036.39689-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PER_CPU_VAR macro should be applied to a symbol and its addend.
Inconsisten usage is currently harmless, but needs to be corrected
before %rip-relative addressing is introduced to PER_CPU_VAR macro.

No functional changes intended.

Cc: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
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


