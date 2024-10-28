Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB839B3553
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 16:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826694.1241125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0T-0002el-IJ; Mon, 28 Oct 2024 15:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826694.1241125; Mon, 28 Oct 2024 15:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5S0T-0002Yu-7W; Mon, 28 Oct 2024 15:50:13 +0000
Received: by outflank-mailman (input) for mailman id 826694;
 Mon, 28 Oct 2024 15:50:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7IZ5=RY=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5S0R-000874-Gh
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 15:50:11 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 504a4b77-9544-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 16:50:11 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a99e3b3a411so884982166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 08:50:11 -0700 (PDT)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b3a0834a6sm387674066b.191.2024.10.28.08.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 08:50:09 -0700 (PDT)
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
X-Inumbo-ID: 504a4b77-9544-11ef-a0c2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730130610; x=1730735410; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNA4CkiYLhWj5GrlTVNs4LHtyrIqkd6cYmJb5XAmLwY=;
        b=bRW7UQpLL5dW7iovCtabjxKn8dtNie9TzyWueM+mL47ZagHnWnQcrruC9krFVi3Ij6
         S5Y2Wy2vLZmjoM1/joecst3tXfvvVb1o2hl6Z0CMQaAjgSAoAaYBVTVoffut7mKvtKab
         VA62XIwN6uW+V8Uy9OetwrWFpGcgNBhbKrAqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730130610; x=1730735410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jNA4CkiYLhWj5GrlTVNs4LHtyrIqkd6cYmJb5XAmLwY=;
        b=r4sSCwoIxNwu2a6Inix3IHzSNI/cqbS8WsJw9saYnGiD0OcjVmSuYJJHEUEhsh3Mff
         tIgFGCtkcgIM2Q3LfXXxLMNnUawu+Is+gS7x8tOFfq+heIEAhKACHG/JWSdWG01RiIx7
         OCTc3JU+tjC2IMxVB1dmt8nXVZRcEJUzefO+Y74XHOc/VaqcWOLRx4pweRc+aAOsXTeK
         Eg+OUHVT/+w5j2GYUBYsrOn6iLaZgBHHjszxB2T8sPWjdzjiE/kfaAGiIWObzJu/6gUg
         rNQTNjbthzRDRKmeW43olt1/HHKisxOUPaDlAU+IVI0Xbx2xtuqa1kf678LpssCBQ90u
         A3MQ==
X-Gm-Message-State: AOJu0Ywa4j4kenT+1pvnRbOKOijSGLQbI1swH1W5qxnAh7XXGJF2RGgt
	RSqknPPvClyvh8LZKVQw/zFBYfjkbS6R0wgHtHqjOtxH/vQy7OWPAvyJVRBZa43gE4VbJ5lTnkc
	L
X-Google-Smtp-Source: AGHT+IFurN0UhPHZ+j0cvRqeJ5wZHyxfY+2OmUVsvN5Qor4ojhql7E6XWaaLOyUGpDr2fxUAzaiO0A==
X-Received: by 2002:a17:907:9815:b0:a9a:a666:4c7 with SMTP id a640c23a62f3a-a9e22ac6eecmr4045866b.24.1730130610198;
        Mon, 28 Oct 2024 08:50:10 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 12/14] x86/fpu: Pass explicit xsave areas to fpu_(f)xsave()
Date: Mon, 28 Oct 2024 15:49:30 +0000
Message-ID: <20241028154932.6797-13-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/i387.c               | 16 ++++++++++------
 xen/arch/x86/include/asm/xstate.h |  2 +-
 xen/arch/x86/xstate.c             |  3 +--
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index a571bcb23c91..5950fbcf272e 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -130,7 +130,7 @@ static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
 }
 
 /* Save x87 extended state */
-static inline void fpu_xsave(struct vcpu *v)
+static inline void fpu_xsave(struct vcpu *v, struct xsave_struct *xsave_area)
 {
     bool ok;
     uint64_t mask = vcpu_xsave_mask(v);
@@ -143,15 +143,14 @@ static inline void fpu_xsave(struct vcpu *v)
      */
     ok = set_xcr0(v->arch.xcr0_accum | XSTATE_FP_SSE);
     ASSERT(ok);
-    xsave(v, mask);
+    xsave(v, xsave_area, mask);
     ok = set_xcr0(v->arch.xcr0 ?: XSTATE_FP_SSE);
     ASSERT(ok);
 }
 
 /* Save x87 FPU, MMX, SSE and SSE2 state */
-static inline void fpu_fxsave(struct vcpu *v)
+static inline void fpu_fxsave(struct vcpu *v, fpusse_t *fpu_ctxt)
 {
-    fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
     unsigned int fip_width = v->domain->arch.x87_fip_width;
 
     if ( fip_width != 4 )
@@ -266,6 +265,8 @@ void vcpu_restore_fpu_lazy(struct vcpu *v)
  */
 static bool _vcpu_save_fpu(struct vcpu *v)
 {
+    struct xsave_struct *xsave_area;
+
     if ( !v->fpu_dirtied && !v->arch.nonlazy_xstate_used )
         return false;
 
@@ -274,11 +275,14 @@ static bool _vcpu_save_fpu(struct vcpu *v)
     /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
     clts();
 
+    xsave_area = vcpu_map_xsave_area(v);
+
     if ( cpu_has_xsave )
-        fpu_xsave(v);
+        fpu_xsave(v, xsave_area);
     else
-        fpu_fxsave(v);
+        fpu_fxsave(v, &xsave_area->fpu_sse);
 
+    vcpu_unmap_xsave_area(v, xsave_area);
     v->fpu_dirtied = 0;
 
     return true;
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 36260459667c..104fe0d44173 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -97,7 +97,7 @@ uint64_t get_xcr0(void);
 void set_msr_xss(u64 xss);
 uint64_t get_msr_xss(void);
 uint64_t read_bndcfgu(void);
-void xsave(struct vcpu *v, uint64_t mask);
+void xsave(struct vcpu *v, struct xsave_struct *ptr, uint64_t mask);
 void xrstor(struct vcpu *v, uint64_t mask);
 void xstate_set_init(uint64_t mask);
 bool xsave_enabled(const struct vcpu *v);
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index a9a7ee2cd1e6..518388e6e272 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -300,9 +300,8 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
     vcpu_unmap_xsave_area(v, xstate);
 }
 
-void xsave(struct vcpu *v, uint64_t mask)
+void xsave(struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
 {
-    struct xsave_struct *ptr = v->arch.xsave_area;
     uint32_t hmask = mask >> 32;
     uint32_t lmask = mask;
     unsigned int fip_width = v->domain->arch.x87_fip_width;
-- 
2.47.0


