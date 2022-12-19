Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE0F65079B
	for <lists+xen-devel@lfdr.de>; Mon, 19 Dec 2022 07:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465760.724589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kH-0004GL-Bn; Mon, 19 Dec 2022 06:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465760.724589; Mon, 19 Dec 2022 06:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p79kH-0004CW-5u; Mon, 19 Dec 2022 06:35:29 +0000
Received: by outflank-mailman (input) for mailman id 465760;
 Mon, 19 Dec 2022 06:35:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+4Hg=4R=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1p79kG-000383-5w
 for xen-devel@lists.xenproject.org; Mon, 19 Dec 2022 06:35:28 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 533b17df-7f67-11ed-8fd4-01056ac49cbb;
 Mon, 19 Dec 2022 07:35:27 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id tz12so19094138ejc.9
 for <xen-devel@lists.xenproject.org>; Sun, 18 Dec 2022 22:35:27 -0800 (PST)
Received: from uni.router.wind (adsl-211.109.242.226.tellas.gr.
 [109.242.226.211]) by smtp.googlemail.com with ESMTPSA id
 q14-20020a17090676ce00b008302732f569sm77062ejn.78.2022.12.18.22.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Dec 2022 22:35:26 -0800 (PST)
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
X-Inumbo-ID: 533b17df-7f67-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7GANqKS3y9roRizIFR0E30IuGDIVnJH0Nb9jg1Y7lU=;
        b=aWj21hAh9rHIirDqXtfU/rS6HxFwLAQ3LUkiadoo1ZVHcK3qndjp1Khb6gn/OquW7i
         8nShyPFT7j6tb2Czd/aK4p8+H76N23FVCJE2m7e+veS2DotGlFIIn347Vjc6r2HEV/Vc
         6BVF73k7aLRqoM6RVqn6W2Pdl08bS8bgV+GOk0nTvqk/px3YJo+4gFY6yR9S4h0IxEQ7
         ZbskFnNgFjKtB9uKdE0TQC26KnrnaYxa7hf/9BAwrqYYWQ7ep2Beu+Pab/N3tAt8wjX2
         2PeoPgnGiBTEJfmTqqad4xHDMQknydA5SyYAq0k69QkmzbYIE83+G9sdTs82CSAvJhkc
         vpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7GANqKS3y9roRizIFR0E30IuGDIVnJH0Nb9jg1Y7lU=;
        b=yFcaKceauTC3TrhxVAXbTEj4x6px46TogkpjTyLZyppDVOHIAJ+uAFv3dTk1jsyHK5
         o8WtZFYL10c9W9eWeA9TBN10UYQCWSF/4l/WJwRVgWpF0FQNqCBPaVx1vLSFv5e3Wkyb
         3WM4Baj2z43bpXC/MVxHK+8liGwU8ECoS2wuHIUk2KF8++pb1z9HOgx95G7xFcd1tfQN
         ZVo4xAGk83nxOpEVBQ6JT1rea8NsnCP3cvx4FUMfxri67p19Yiy3fZMuK3zxOsv6/JMR
         3f1XAymSwKA25nJGRIigeIzbh6ryy97Rr4Rjmy6X7nfTGLXpNXmzTQoX9xLy0fv6YKte
         ptig==
X-Gm-Message-State: ANoB5pkFaR6tNirdKqzUaqA3rJnYjz0GGGFNBLw0Npi2buWd1OhjSU6k
	46BMTDjSYgAkGU5OgcrSDG7C/5onqXE=
X-Google-Smtp-Source: AA0mqf5zB+h+LxU7GhtH4zxnbUiL5C3o+j5jM7oadw8rgP0B7te/JGT9Zy5x7olW3q/b5ZsI4eGBCQ==
X-Received: by 2002:a17:906:7751:b0:7ae:df97:c020 with SMTP id o17-20020a170906775100b007aedf97c020mr33346918ejn.13.1671431726888;
        Sun, 18 Dec 2022 22:35:26 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC 5/7] x86/iommu: the code addressing CVE-2011-1898 is VT-d specific
Date: Mon, 19 Dec 2022 08:34:54 +0200
Message-Id: <20221219063456.2017996-6-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221219063456.2017996-1-burzalodowa@gmail.com>
References: <20221219063456.2017996-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable untrusted_msi indicates whether the system is vulnerable to
CVE-2011-1898. This vulnerablity is VT-d specific.
Place the code that addresses the issue under CONFIG_INTEL_VTD.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 xen/arch/x86/include/asm/iommu.h | 2 ++
 xen/arch/x86/pv/hypercall.c      | 2 ++
 xen/arch/x86/x86_64/entry.S      | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index fc0afe35bf..41bd1b9e05 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -127,7 +127,9 @@ int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
                            unsigned int flag);
 void iommu_identity_map_teardown(struct domain *d);
 
+#ifdef CONFIG_INTEL_VTD
 extern bool untrusted_msi;
+#endif
 
 int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
                    const uint8_t gvec);
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 2eedfbfae8..0e1b03904c 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -193,8 +193,10 @@ void pv_ring1_init_hypercall_page(void *p)
 
 void do_entry_int82(struct cpu_user_regs *regs)
 {
+#ifdef CONFIG_INTEL_VTD
     if ( unlikely(untrusted_msi) )
         check_for_unexpected_msi((uint8_t)regs->entry_vector);
+#endif
 
     _pv_hypercall(regs, true /* compat */);
 }
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index ae01285181..2e06c0a6c1 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -406,11 +406,13 @@ ENTRY(int80_direct_trap)
 .Lint80_cr3_okay:
         sti
 
+#ifdef CONFIG_INTEL_VTD
         cmpb  $0,untrusted_msi(%rip)
 UNLIKELY_START(ne, msi_check)
         movl  $0x80,%edi
         call  check_for_unexpected_msi
 UNLIKELY_END(msi_check)
+#endif
 
         movq  STACK_CPUINFO_FIELD(current_vcpu)(%rbx), %rbx
 
-- 
2.37.2


