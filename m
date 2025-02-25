Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B503BA45047
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 23:35:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896032.1304708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3W0-0001V9-DX; Tue, 25 Feb 2025 22:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896032.1304708; Tue, 25 Feb 2025 22:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tn3W0-0001Sn-Am; Tue, 25 Feb 2025 22:35:00 +0000
Received: by outflank-mailman (input) for mailman id 896032;
 Tue, 25 Feb 2025 22:34:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tn3Vy-0001Sf-Ru
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 22:34:58 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd53266e-f3c8-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 23:34:56 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so1535315e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 14:34:56 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd866f0asm3652035f8f.12.2025.02.25.14.34.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 14:34:53 -0800 (PST)
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
X-Inumbo-ID: bd53266e-f3c8-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740522896; x=1741127696; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CaLymGaYlTHZX0+FvvFlRpLYefZ9HIWI9hua5chUgaw=;
        b=QRetJf+oKTNjXvLE3DmMDwpRJsSrcFT9LH9mKyoIzNEhS5MZxIfLp0kBQfUWMEvjm1
         btXcyclUWScKR/Jq9SFR1aKOgLRoDzaBgy95ZikRHFe55dYcSBJ6pMOxAPT96sQrTcKl
         Mkd7OLYxz1YakZj2CzR+YfNn6eRXZZmA+0CWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740522896; x=1741127696;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CaLymGaYlTHZX0+FvvFlRpLYefZ9HIWI9hua5chUgaw=;
        b=LAg+UAkCAju30hmu4A4pwoHlO/hzXlgJh4KneFkiSKDYgjA+GRunVlDdu5Xr4sDcuN
         Wohtmo046asz8YjMYTsaQrrl8VpupRegAAm2JHdbIkF3EO2cLh4psfjbL1l3Grci8y8d
         xPD1FLYwXEsiC0oYjbidRsIxDcaesQJFznr9hNBIfxYaMZ0mDfUt25Mo9jtAzNXUq/Pn
         0O27SDGa/oDWEJsHVglGMWuolGrUFVz0h6mYVq4K7Z/LaDpNvEa+EtefSG+GLBCqXxlw
         obVuhJtsr1mGJRL3yQiDETPrx/8a0QCSbwry0E1e3amM6D50zlaeLymaD8YH1tUtenoZ
         qhGg==
X-Gm-Message-State: AOJu0YwKiyKFzbYqP73njrm8Z7QI6K4rFLPEsUiwWIk/Q8hoZ5X/Ij3T
	tzro7jakKzsLhDNOtma3jaENsSqqsNp17AU+99ff7/z1T1CkNEsYdCjGVznTrhoKszv0iOlDQFo
	P
X-Gm-Gg: ASbGncv5p5VXNgCblcknzGip/hduPeeOEmUNoTliGPaWCqbmilVcmcIsy5zH8TKBcJQ
	yDN6Rrzz8TgXpSaBjAvBcEIH2zX2WAu7CP+aJE3ehFjjf/2yPF1H7VKbJE5p/BW7m5b/fhbESoE
	6b24BwsxhPnfhTrZ9xPGZv6qbYpV903U5J4ZDic4ZSop3GT8Jtj6hPI9tfknpRlDdNxGPh4oEce
	hhN2EDb1NldcqG/VAFWWeS3vhS8XK0ltHVph2wcxa+dEPMqiWA2JACVGAiHAlbsQ7/8qQ2Th7W4
	DE0ljFRmvtBuMkUbt52vhEQKLf9TfLNRJZMEzsONX0KLUiTrWQZcqXfdHs6RVCHR288XX+P6Wtz
	rlkPiKw==
X-Google-Smtp-Source: AGHT+IHFetw6xKYk9G6S+OPrUgOf2reR+1ud0C2T7ka0kPJSXn9WmrCk8KD+pQ6LliJ/Z/hMAyJzcA==
X-Received: by 2002:a05:6000:1ac7:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-38f6f51db2cmr16227582f8f.25.1740522894436;
        Tue, 25 Feb 2025 14:34:54 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/traps: Move guest_{rd,wr}msr_xen() into msr.c
Date: Tue, 25 Feb 2025 22:32:50 +0000
Message-Id: <20250225223250.1185105-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They are out of place in traps.c, and only have a single caller each.  Make
them static inside msr.c.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/processor.h |  3 --
 xen/arch/x86/msr.c                   | 73 ++++++++++++++++++++++++++++
 xen/arch/x86/traps.c                 | 73 ----------------------------
 3 files changed, 73 insertions(+), 76 deletions(-)

diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 4f176bc575ef..6bc88b031761 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -472,9 +472,6 @@ struct stubs {
 DECLARE_PER_CPU(struct stubs, stubs);
 unsigned long alloc_stub_page(unsigned int cpu, unsigned long *mfn);
 
-int guest_rdmsr_xen(const struct vcpu *v, uint32_t idx, uint64_t *val);
-int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uint64_t val);
-
 static inline uint8_t get_cpu_family(uint32_t raw, uint8_t *model,
                                      uint8_t *stepping)
 {
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 2244571939ee..a12503608c16 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -18,6 +18,7 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/viridian.h>
 #include <asm/msr.h>
+#include <asm/p2m.h>
 #include <asm/pv/domain.h>
 #include <asm/setup.h>
 #include <asm/xstate.h>
@@ -40,6 +41,78 @@ int init_vcpu_msr_policy(struct vcpu *v)
     return 0;
 }
 
+static int guest_rdmsr_xen(const struct vcpu *v, uint32_t idx, uint64_t *val)
+{
+    const struct domain *d = v->domain;
+    /* Optionally shift out of the way of Viridian architectural MSRs. */
+    uint32_t base = is_viridian_domain(d) ? 0x40000200 : 0x40000000;
+
+    switch ( idx - base )
+    {
+    case 0: /* Write hypercall page MSR.  Read as zero. */
+        *val = 0;
+        return X86EMUL_OKAY;
+    }
+
+    return X86EMUL_EXCEPTION;
+}
+
+static int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uint64_t val)
+{
+    struct domain *d = v->domain;
+    /* Optionally shift out of the way of Viridian architectural MSRs. */
+    uint32_t base = is_viridian_domain(d) ? 0x40000200 : 0x40000000;
+
+    switch ( idx - base )
+    {
+    case 0: /* Write hypercall page */
+    {
+        void *hypercall_page;
+        unsigned long gmfn = val >> PAGE_SHIFT;
+        unsigned int page_index = val & (PAGE_SIZE - 1);
+        struct page_info *page;
+        p2m_type_t t;
+
+        if ( page_index > 0 )
+        {
+            gdprintk(XENLOG_WARNING,
+                     "wrmsr hypercall page index %#x unsupported\n",
+                     page_index);
+            return X86EMUL_EXCEPTION;
+        }
+
+        page = get_page_from_gfn(d, gmfn, &t, P2M_ALLOC);
+
+        if ( !page || !get_page_type(page, PGT_writable_page) )
+        {
+            if ( page )
+                put_page(page);
+
+            if ( p2m_is_paging(t) )
+            {
+                p2m_mem_paging_populate(d, _gfn(gmfn));
+                return X86EMUL_RETRY;
+            }
+
+            gdprintk(XENLOG_WARNING,
+                     "Bad GMFN %lx (MFN %#"PRI_mfn") to MSR %08x\n",
+                     gmfn, mfn_x(page ? page_to_mfn(page) : INVALID_MFN), base);
+            return X86EMUL_EXCEPTION;
+        }
+
+        hypercall_page = __map_domain_page(page);
+        init_hypercall_page(d, hypercall_page);
+        unmap_domain_page(hypercall_page);
+
+        put_page_and_type(page);
+        return X86EMUL_OKAY;
+    }
+
+    default:
+        return X86EMUL_EXCEPTION;
+    }
+}
+
 int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 {
     const struct vcpu *curr = current;
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 91af814badf7..be2bc59f0347 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -64,7 +64,6 @@
 #include <asm/mc146818rtc.h>
 #include <asm/hpet.h>
 #include <asm/vpmu.h>
-#include <public/hvm/params.h>
 #include <asm/cpuid.h>
 #include <xsm/xsm.h>
 #include <asm/irq-vectors.h>
@@ -979,78 +978,6 @@ void asmlinkage do_trap(struct cpu_user_regs *regs)
     fatal_trap(regs, false);
 }
 
-int guest_rdmsr_xen(const struct vcpu *v, uint32_t idx, uint64_t *val)
-{
-    const struct domain *d = v->domain;
-    /* Optionally shift out of the way of Viridian architectural MSRs. */
-    uint32_t base = is_viridian_domain(d) ? 0x40000200 : 0x40000000;
-
-    switch ( idx - base )
-    {
-    case 0: /* Write hypercall page MSR.  Read as zero. */
-        *val = 0;
-        return X86EMUL_OKAY;
-    }
-
-    return X86EMUL_EXCEPTION;
-}
-
-int guest_wrmsr_xen(struct vcpu *v, uint32_t idx, uint64_t val)
-{
-    struct domain *d = v->domain;
-    /* Optionally shift out of the way of Viridian architectural MSRs. */
-    uint32_t base = is_viridian_domain(d) ? 0x40000200 : 0x40000000;
-
-    switch ( idx - base )
-    {
-    case 0: /* Write hypercall page */
-    {
-        void *hypercall_page;
-        unsigned long gmfn = val >> PAGE_SHIFT;
-        unsigned int page_index = val & (PAGE_SIZE - 1);
-        struct page_info *page;
-        p2m_type_t t;
-
-        if ( page_index > 0 )
-        {
-            gdprintk(XENLOG_WARNING,
-                     "wrmsr hypercall page index %#x unsupported\n",
-                     page_index);
-            return X86EMUL_EXCEPTION;
-        }
-
-        page = get_page_from_gfn(d, gmfn, &t, P2M_ALLOC);
-
-        if ( !page || !get_page_type(page, PGT_writable_page) )
-        {
-            if ( page )
-                put_page(page);
-
-            if ( p2m_is_paging(t) )
-            {
-                p2m_mem_paging_populate(d, _gfn(gmfn));
-                return X86EMUL_RETRY;
-            }
-
-            gdprintk(XENLOG_WARNING,
-                     "Bad GMFN %lx (MFN %#"PRI_mfn") to MSR %08x\n",
-                     gmfn, mfn_x(page ? page_to_mfn(page) : INVALID_MFN), base);
-            return X86EMUL_EXCEPTION;
-        }
-
-        hypercall_page = __map_domain_page(page);
-        init_hypercall_page(d, hypercall_page);
-        unmap_domain_page(hypercall_page);
-
-        put_page_and_type(page);
-        return X86EMUL_OKAY;
-    }
-
-    default:
-        return X86EMUL_EXCEPTION;
-    }
-}
-
 void asmlinkage do_invalid_op(struct cpu_user_regs *regs)
 {
     u8 bug_insn[2];
-- 
2.39.5


