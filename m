Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D6D567925
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 23:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361535.591095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8pgg-0003sz-BP; Tue, 05 Jul 2022 21:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361535.591095; Tue, 05 Jul 2022 21:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8pgg-0003qa-8O; Tue, 05 Jul 2022 21:02:26 +0000
Received: by outflank-mailman (input) for mailman id 361535;
 Tue, 05 Jul 2022 21:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TLZa=XK=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1o8pge-0003b1-IA
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 21:02:24 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c427c8de-fca5-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 23:02:23 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id cl1so19261074wrb.4
 for <xen-devel@lists.xenproject.org>; Tue, 05 Jul 2022 14:02:23 -0700 (PDT)
Received: from uni.. (adsl-146.37.6.170.tellas.gr. [37.6.170.146])
 by smtp.googlemail.com with ESMTPSA id
 l26-20020a1ced1a000000b003a03ae64f57sm2897401wmh.8.2022.07.05.14.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 14:02:22 -0700 (PDT)
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
X-Inumbo-ID: c427c8de-fca5-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AQT9Zg3S1V+SLzJ9mIrWY3ddQbg0abcQqmYDqdswck8=;
        b=AFccQjNrQmfDG4VaWaef4xE8J6saJ7xJQU2+GqZgfhh3f4xKHvoOcergdPc8v6EZHB
         W8PpgIETewLVrLtE8R9SgobXUK/+twapNT7rfOAAy8o4KG1q9tilbcZ0O5lpDnjfffkm
         wpGNB4Co6W2b6dHDkhfv8qn6WvH6EmfRxh01kBX/nvQyCXNt2jwTye2XekvYS48NH1Gj
         XsVm+ZjelZR5VC4Cuxmm5CsT/9OLLqJRlX6jvF5n/TPuyRiQ3Wt878V/IACErpUdPda+
         uQB4YXgo5oRIcn1dJoWBZOcOM0Amy/UkcShxImHmtnp49oxqJXh85b0T43VICgbLUSMs
         +wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AQT9Zg3S1V+SLzJ9mIrWY3ddQbg0abcQqmYDqdswck8=;
        b=gttK81RYvI/aXKZNBVphCbKabgnQRFPxCCoLzGrfCyekcIjqDRFTjrGVNt6YYD77rf
         tPrkBXKjfrSQsXAwsAgNiHIE2eMnSyjwpVN4iY20gp2jC6DOHpxnMTl6SpWODVCiA3Jr
         MMe+ri8a6PbYCOgflZaTJJfUrtaq7qwsfp42/Eg9DBLHyEfOVCiFwK+cOChPyA1srq4K
         E3webX8slzDOBNzY7q4ZoC4VcPOETU8IyVES6G2N9/p82hegJO2blUYWITTssZQ6j+Gu
         i4cH7p5fpY+tSuCRzSmp00QGB5XtyVCHFOjaAsZfOLUFIA2nFxc5emPb0hKK4GAOsz8r
         QF2Q==
X-Gm-Message-State: AJIora9sev63NwgQqd8MyW/UfIBU5AsfOFTMHhCYHhGVvpx4AKU3Ef4M
	/zZWq7uwrP82ySSVS8MzULnDCo4Ibe8=
X-Google-Smtp-Source: AGRyM1uPOb9BIMjvnqYCviSjSCmTkegKo3dPghVnCPYleuQuvV702Na9iW7j4NSzdmepl3cQRLxReQ==
X-Received: by 2002:a5d:64c3:0:b0:21d:720c:4ade with SMTP id f3-20020a5d64c3000000b0021d720c4ademr5695443wri.570.1657054942891;
        Tue, 05 Jul 2022 14:02:22 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/4] xen/arm: traps: Fix MISRA C 2012 Rule 8.4 violations
Date: Wed,  6 Jul 2022 00:02:15 +0300
Message-Id: <20220705210218.483854-2-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705210218.483854-1-burzalodowa@gmail.com>
References: <20220705210218.483854-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the function prototypes of the functions below in <asm/processor.h> header
file so that they are visible before the function definitions in traps.c.
enter_hypervisor_from_guest_preirq()
enter_hypervisor_from_guest()
do_trap_hyp_sync()
do_trap_guest_sync()
do_trap_irq()
do_trap_fiq()
leave_hypervisor_to_guest()

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/arm/include/asm/processor.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index c021160412..74cc07028f 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -576,10 +576,24 @@ void vcpu_regs_hyp_to_user(const struct vcpu *vcpu,
 void vcpu_regs_user_to_hyp(struct vcpu *vcpu,
                            const struct vcpu_guest_core_regs *regs);
 
+void enter_hypervisor_from_guest_preirq(void);
+
+void enter_hypervisor_from_guest(void);
+
+void do_trap_hyp_sync(struct cpu_user_regs *regs);
+
+void do_trap_guest_sync(struct cpu_user_regs *regs);
+
 void do_trap_hyp_serror(struct cpu_user_regs *regs);
 
 void do_trap_guest_serror(struct cpu_user_regs *regs);
 
+void do_trap_irq(struct cpu_user_regs *regs);
+
+void do_trap_fiq(struct cpu_user_regs *regs);
+
+void leave_hypervisor_to_guest(void);
+
 register_t get_default_hcr_flags(void);
 
 /*
-- 
2.34.1


