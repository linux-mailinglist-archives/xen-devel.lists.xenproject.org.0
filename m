Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740719BCF81
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830267.1245308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KdE-0005Vt-Gs; Tue, 05 Nov 2024 14:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830267.1245308; Tue, 05 Nov 2024 14:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KdE-0005PX-9a; Tue, 05 Nov 2024 14:34:08 +0000
Received: by outflank-mailman (input) for mailman id 830267;
 Tue, 05 Nov 2024 14:34:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8KdB-0002K5-OQ
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:34:05 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00d4b073-9b83-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 15:34:03 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5ceb03aaddeso5938205a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:34:03 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.34.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:34:00 -0800 (PST)
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
X-Inumbo-ID: 00d4b073-9b83-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmQiLCJoZWxvIjoibWFpbC1lZDEteDUyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAwZDRiMDczLTliODMtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE3MjQzLjEzMzc5NCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817242; x=1731422042; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jc35G27Gr3VkDuTcKUwBetak3Ic6rCOhMXfwTHHpMdE=;
        b=dru1R5uas4DaJ2XypHDq0s6GgXyJkFEeLn5R0TDByDrodiM39u/T1ymHXQChZ9sVlU
         rSNY1bLvorCJZqrRFVCP7mSCyIA8Lqvhu205uvSSphmrZ6HUuyG3WMTndWTfQwmZ9XkO
         7y2v+jGG+Vvp0yAxt5a7WpwnrN382rSC/ka/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817242; x=1731422042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jc35G27Gr3VkDuTcKUwBetak3Ic6rCOhMXfwTHHpMdE=;
        b=uryXotXrtvYfvCWbJYJOykz/E1Ou5YM0yWQhZ+zF6jr9wK6du3fK5F3S9/EAeYJtLA
         y5JJuBgyfZggoKXJupSkt+/07GYl96668WJkz0z267L2DgLpw/cuzUfprlZrwv0hCFNR
         r0mFXXS17Bwh7ntwT8yQXOpC3xmfy5fTARmmW9+nm6Ll3keNFFnEFQpWR+pENveLwoKf
         G1Ejncr6erofnRfp9jmKof3R7iW6/Udo+i+bnkIMB1brQ8BZ6AJvNn8/4iQmVwgPn5Jq
         euZUz6IJx2Tu4Q/oV3Epuy/EVnpGphEL7uKCg4/yVAkqg8rbzhbiMlWvXGqMI8hqauyT
         P1tA==
X-Gm-Message-State: AOJu0Yw3JsBUU6HlR+Mau4ddThXpf9UYKgxE38jQu+xoSAO46gyiMqMv
	2c29BQQzOfJFkOBWqawRm4Pp0SEV35NyLjMP5HCichIJ5/GH0tYJs7hhw6zj6RxueHDGhnhq8MX
	2
X-Google-Smtp-Source: AGHT+IH7kiUbK3mBgFNVwAoXuK6Xah394QabsKMkZvp2o5saOpNY3n0VT2XUZP6qGa/L1Iq16mEZgQ==
X-Received: by 2002:a05:6402:2751:b0:5ce:cfed:6c4f with SMTP id 4fb4d7f45d1cf-5cecfed6cdbmr8807224a12.23.1730817242071;
        Tue, 05 Nov 2024 06:34:02 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 11/13] x86/fpu: Pass explicit xsave areas to fpu_(f)xsave()
Date: Tue,  5 Nov 2024 14:33:08 +0000
Message-ID: <20241105143310.28301-12-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * const-ified v
---
 xen/arch/x86/i387.c               | 16 ++++++++++------
 xen/arch/x86/include/asm/xstate.h |  2 +-
 xen/arch/x86/xstate.c             |  3 +--
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index a6ae323fa95f..73c52ce2f577 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -129,7 +129,7 @@ static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
 }
 
 /* Save x87 extended state */
-static inline void fpu_xsave(struct vcpu *v)
+static inline void fpu_xsave(const struct vcpu *v, struct xsave_struct *xsave_area)
 {
     bool ok;
     uint64_t mask = vcpu_xsave_mask(v);
@@ -141,15 +141,14 @@ static inline void fpu_xsave(struct vcpu *v)
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
@@ -264,6 +263,8 @@ void vcpu_restore_fpu_lazy(struct vcpu *v)
  */
 static bool _vcpu_save_fpu(struct vcpu *v)
 {
+    struct xsave_struct *xsave_area;
+
     if ( !v->fpu_dirtied && !v->arch.nonlazy_xstate_used )
         return false;
 
@@ -272,11 +273,14 @@ static bool _vcpu_save_fpu(struct vcpu *v)
     /* This can happen, if a paravirtualised guest OS has set its CR0.TS. */
     clts();
 
+    xsave_area = VCPU_MAP_XSAVE_AREA(v);
+
     if ( cpu_has_xsave )
-        fpu_xsave(v);
+        fpu_xsave(v, xsave_area);
     else
-        fpu_fxsave(v);
+        fpu_fxsave(v, &xsave_area->fpu_sse);
 
+    VCPU_UNMAP_XSAVE_AREA(v, xsave_area);
     v->fpu_dirtied = 0;
 
     return true;
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 6b0daff0aeec..bd286123c735 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -97,7 +97,7 @@ uint64_t get_xcr0(void);
 void set_msr_xss(u64 xss);
 uint64_t get_msr_xss(void);
 uint64_t read_bndcfgu(void);
-void xsave(struct vcpu *v, uint64_t mask);
+void xsave(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask);
 void xrstor(struct vcpu *v, uint64_t mask);
 void xstate_set_init(uint64_t mask);
 bool xsave_enabled(const struct vcpu *v);
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 9ecbef760277..f3e41f742c3c 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -300,9 +300,8 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
     VCPU_UNMAP_XSAVE_AREA(v, xstate);
 }
 
-void xsave(struct vcpu *v, uint64_t mask)
+void xsave(const struct vcpu *v, struct xsave_struct *ptr, uint64_t mask)
 {
-    struct xsave_struct *ptr = v->arch.xsave_area;
     uint32_t hmask = mask >> 32;
     uint32_t lmask = mask;
     unsigned int fip_width = v->domain->arch.x87_fip_width;
-- 
2.47.0


