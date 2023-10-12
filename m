Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0373B7C722C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 18:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615916.957487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqyIv-0003uf-OE; Thu, 12 Oct 2023 16:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615916.957487; Thu, 12 Oct 2023 16:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqyIv-0003sA-H9; Thu, 12 Oct 2023 16:12:53 +0000
Received: by outflank-mailman (input) for mailman id 615916;
 Thu, 12 Oct 2023 16:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qqh1=F2=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1qqyIt-00039I-Dk
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 16:12:51 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 307d2589-691a-11ee-98d4-6d05b1d4d9a1;
 Thu, 12 Oct 2023 18:12:50 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9b9a494cc59so174209566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Oct 2023 09:12:50 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
 by smtp.gmail.com with ESMTPSA id
 ci24-20020a170906c35800b009a2235ed496sm11414461ejb.141.2023.10.12.09.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 09:12:49 -0700 (PDT)
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
X-Inumbo-ID: 307d2589-691a-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697127169; x=1697731969; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNuYyWEUkCBUvaAXEq0aoPImcZWnaX/wCmiSUbk6m0g=;
        b=eo5fxUe36dZDhzGMveObrzDeK18Eoy2+TmAeOndTr/74I429kXOAspj+zacEYAxfvm
         6np6W3dAVTa6Ih0g9c2VZYZf/8zER8PdBXXdQF8/YxvJhIpIbzGp9rIkrWeNkL/uhTSO
         NqB+RSkARdbbTwPSv98dqTfVcpgdTaWIOxl22CpINR2E0H9XEGN+RASdDyPFWPFJXzxI
         QkBhZ8B4okjiNXe5ZABceuPPid45PqjYc+D3Nnl0kWpRUnb5/AKhIAugPJNPIIbH3ZWd
         FmTLQvtFxDygHpnafJaqBeMpVKlxBIFt6ZcQi7jnEhtJjd4pEOjWLG4a33EMmyPgy8Gz
         XvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697127169; x=1697731969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNuYyWEUkCBUvaAXEq0aoPImcZWnaX/wCmiSUbk6m0g=;
        b=MgWtAjHDKdphfCPI0qH1j2MG6iOinOsbevhfr7LRHxz7erV7EPpCqQmFFgG637g9fv
         kRakPgxCT74EMT/8nW5lTiQ4NZuKNuiJxpHvNMcHFSSm8rSrG43DO5hD+YwOek2JINJa
         pf/EpbomZjzP9e8cWwjzh4BT45QpOuLFax4QV9cLK33afJhoxobAMM3nBLyrJNOqHrdP
         T+BqhrwukjIAVr01srm3ENNyX327oVmN3wuYLj37+pbvhnmXjalbv+A987CmTSjZjLLR
         24N9FeLQdvfUceNuM5Cvwtt+BzafrPukkCfMNQAuUd4uAHVFd63A1JHeBsqGfdkonnUW
         Hb8w==
X-Gm-Message-State: AOJu0YwQcQDDwpT99dmAsO2s/B18O3RBMwXwR3iehsna4nEpto/ZIOqx
	UxNQkrjQsac9CLzNizyiCQ0=
X-Google-Smtp-Source: AGHT+IGx9PkHoJpnehpt9pu+WFKAxecc4I9gQHgLxLDfU4O7a5NswxaCFNLbcJfvXgFPcLDWLdekjw==
X-Received: by 2002:a17:906:218:b0:9ba:2b14:44f2 with SMTP id 24-20020a170906021800b009ba2b1444f2mr10518666ejd.73.1697127169365;
        Thu, 12 Oct 2023 09:12:49 -0700 (PDT)
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
Subject: [PATCH 3/4] x86/percpu, xen: Correct PER_CPU_VAR usage to include symbol and its addend
Date: Thu, 12 Oct 2023 18:10:38 +0200
Message-ID: <20231012161237.114733-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012161237.114733-1-ubizjak@gmail.com>
References: <20231012161237.114733-1-ubizjak@gmail.com>
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


