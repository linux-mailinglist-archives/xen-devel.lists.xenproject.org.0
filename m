Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61717C77C2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 22:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616003.957666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr288-0006bk-IK; Thu, 12 Oct 2023 20:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616003.957666; Thu, 12 Oct 2023 20:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr288-0006Zu-Ex; Thu, 12 Oct 2023 20:18:00 +0000
Received: by outflank-mailman (input) for mailman id 616003;
 Thu, 12 Oct 2023 20:17:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qr286-00065W-0e
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 20:17:58 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ee2337e-693c-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 22:17:57 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9ae75ece209so226064166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 13:17:57 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a1709064ec300b00997d7aa59fasm11692552ejv.14.2023.10.12.13.17.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 13:17:56 -0700 (PDT)
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
X-Inumbo-ID: 6ee2337e-693c-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697141877; x=1697746677; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNuYyWEUkCBUvaAXEq0aoPImcZWnaX/wCmiSUbk6m0g=;
        b=K7+SVIUgeZgWdxjKBU1cI0+jjvUTJWmAlFiFS9dqucq79JTIByojTtQGxBVCwW55+I
         zV4zTFPwybuLhA3lXoqP5HrT2f47iosOBjQ/3dQa3UAsOnLARjRawCfhCL72GUXZnxlI
         qRuV94ta88pVrczD95eppAuLxkGLfpmSt9GBkOLAmAqj+Bz7LUN5CBftwrZ5SPz/aU3Q
         8BT2TnagMbSAko/0NXyXlhwGWGloLtas9/e6N+XUL5jit65110LKK1TH4/7WVq/wp+KN
         Hwz6a8GPOcufEYOuG3Wv/sdLGyQCyy9wmk7+PGRV324xSE0JCfLBOZ3VlAP81MWYoSea
         U15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697141877; x=1697746677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNuYyWEUkCBUvaAXEq0aoPImcZWnaX/wCmiSUbk6m0g=;
        b=aaxjnMiMue9bTq7cf680m/s6Lp3wPhrbqw7uRIc6vVrvq5fSTfud9SnlFWAVznFeC9
         9+v+SedZ8sejMSGIvN+cXyXq04KldyiiY5eU7l9j0zo9IXIQ0TN7qc0xwlq8z0oWG+Z9
         O0LT4SiPPYC7NcI2uFgrKOIhL1Xp6ZchIOCenB8q7tqhXvPUDK6KG1DOST8TuPb2SmvF
         G4WFeactj5oRJqYr/cCewk5MKc4hkX9iMTXDmZaGLBWaeAgo0ZqCDyXX6yntDEg+8DTP
         k1qJ/RxVeMW1cYfcDTRF1/fpd7I5oHlhKOmcWBWF5eMoa3K/H3bpkdOyK6Cts1+WpXRV
         6JBw==
X-Gm-Message-State: AOJu0YwUlIdbybr1NHOhTufwCkid5Ykb0Ae1KHfJMlQ7MIovUhofhekv
	xsMwf4VpWjDNQ8tl3I53PiU=
X-Google-Smtp-Source: AGHT+IGmOK7ZIlt1roxwebKg2U7mq6HSiacaJSzpvBLJtS6/apvSq2Xo3cDatgmKdrTKmuZCNTp1Yw==
X-Received: by 2002:a17:906:3003:b0:9b2:8df4:c692 with SMTP id 3-20020a170906300300b009b28df4c692mr22597068ejz.27.1697141876293;
        Thu, 12 Oct 2023 13:17:56 -0700 (PDT)
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
Subject: [PATCH v2 3/4] x86/percpu, xen: Correct PER_CPU_VAR usage to include symbol and its addend
Date: Thu, 12 Oct 2023 22:12:06 +0200
Message-ID: <20231012201743.292149-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012201743.292149-1-ubizjak@gmail.com>
References: <20231012201743.292149-1-ubizjak@gmail.com>
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


