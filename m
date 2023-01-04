Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BA365CE96
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 09:45:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470987.730706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOd-00019z-Ph; Wed, 04 Jan 2023 08:45:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470987.730706; Wed, 04 Jan 2023 08:45:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCzOd-00014l-KX; Wed, 04 Jan 2023 08:45:15 +0000
Received: by outflank-mailman (input) for mailman id 470987;
 Wed, 04 Jan 2023 08:45:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfqB=5B=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pCzOc-0008Pe-2t
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 08:45:14 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aa4181c-8c0c-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 09:45:13 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id u19so80869748ejm.8
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 00:45:13 -0800 (PST)
Received: from uni.router.wind (adsl-57.109.242.233.tellas.gr.
 [109.242.233.57]) by smtp.googlemail.com with ESMTPSA id
 k22-20020a170906129600b007c10fe64c5dsm15016382ejb.86.2023.01.04.00.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 00:45:12 -0800 (PST)
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
X-Inumbo-ID: 1aa4181c-8c0c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOiaAsPMwgLoSMJypKuCfvLjyhJsFw19vxzxT5oap4g=;
        b=Hd2mClmwGN7qPAVe8jLCBJik7TSu6D1hwPwRA6n95halEdoHOO5XHhWX2UHU6b6QaR
         apkNmStPd4cT1h/6oOJnkb/2bFDjpD+nmAOI39BHYt1vVWTBte6I0MJLrQghx1ZGKZYH
         8FLLbt5b7rEL4BF1k6fB2z7zni+yCr+ZaZgceCAglR7HvjajZ3HZOmmxrNPqPZ+LU0GT
         kw1GvxZdBd2btMegnuFM25MGAaBAcT7isq8D5DSD4tIGTtaG+dvJykEO446bArRtgd14
         euK0j83jYn+YYNEsQoEm5ZKu4sTQXH9HcXbxEdSxRbDJlW3zA0jDLyfElaLsk4WC7okw
         cAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOiaAsPMwgLoSMJypKuCfvLjyhJsFw19vxzxT5oap4g=;
        b=qhbXC4niQE0bEJMxKLhBskodGjobmlzejTiuJV4czC7QGykh6ttjaAw8/b+FCf0lkZ
         fu1VHE8/f74MElaSd9napSDwr8UQupq9MS+Fa7U0Jv+uZlMML5yVEbVnv/pJBiWLrMJC
         VPscnb9hylW09GPGEG66ZS9Lhrzz42CnyVlB2YHvlN0a6GFGvJcROeLE6ouaBJx/GAeG
         x3oqFueBtv4gCFFWU65JUZMLt24Qf/EWcOsC5wHvcePcySIqKDEmrQBRFpGtLz0lZeyu
         SkIG519e3guWseIO13uk1D0AYKMjpnUZqCgoDloZXOZEuZot6QpSZJSPnif0OJJH3aqg
         TytQ==
X-Gm-Message-State: AFqh2kr8dDdEDK+mpSxWc960O8835l4OfO9hNzRG25w2SvkBe3wtMXNc
	vQun9RtDy8q3MR0wmA6wy49NnX57HTU=
X-Google-Smtp-Source: AMrXdXs5pE7YUspJLpR94+D/sV7BchYm34JJQ0CbAEWxWKKA/p0spj1+jbTzfVoPYDOubEeR4PhlqA==
X-Received: by 2002:a17:906:39d8:b0:847:410:ecff with SMTP id i24-20020a17090639d800b008470410ecffmr34003836eje.16.1672821912776;
        Wed, 04 Jan 2023 00:45:12 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 5/8] x86/iommu: the code addressing CVE-2011-1898 is VT-d specific
Date: Wed,  4 Jan 2023 10:44:59 +0200
Message-Id: <20230104084502.61734-6-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230104084502.61734-1-burzalodowa@gmail.com>
References: <20230104084502.61734-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable untrusted_msi indicates whether the system is vulnerable to
CVE-2011-1898. This vulnerablity is VT-d specific.
Place the code that addresses the issue under CONFIG_INTEL_IOMMU.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v2:
  - replace CONFIG_INTEL_VTD with CONFIG_INTEL_IOMMU

 xen/arch/x86/include/asm/iommu.h | 2 ++
 xen/arch/x86/pv/hypercall.c      | 2 ++
 xen/arch/x86/x86_64/entry.S      | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index fc0afe35bf..fb5fe4e1bf 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -127,7 +127,9 @@ int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
                            unsigned int flag);
 void iommu_identity_map_teardown(struct domain *d);
 
+#ifdef CONFIG_INTEL_IOMMU
 extern bool untrusted_msi;
+#endif
 
 int pi_update_irte(const struct pi_desc *pi_desc, const struct pirq *pirq,
                    const uint8_t gvec);
diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 2eedfbfae8..9d616a0fc5 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -193,8 +193,10 @@ void pv_ring1_init_hypercall_page(void *p)
 
 void do_entry_int82(struct cpu_user_regs *regs)
 {
+#ifdef CONFIG_INTEL_IOMMU
     if ( unlikely(untrusted_msi) )
         check_for_unexpected_msi((uint8_t)regs->entry_vector);
+#endif
 
     _pv_hypercall(regs, true /* compat */);
 }
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index ae01285181..8f2fb36770 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -406,11 +406,13 @@ ENTRY(int80_direct_trap)
 .Lint80_cr3_okay:
         sti
 
+#ifdef CONFIG_INTEL_IOMMU
         cmpb  $0,untrusted_msi(%rip)
 UNLIKELY_START(ne, msi_check)
         movl  $0x80,%edi
         call  check_for_unexpected_msi
 UNLIKELY_END(msi_check)
+#endif
 
         movq  STACK_CPUINFO_FIELD(current_vcpu)(%rbx), %rbx
 
-- 
2.37.2


