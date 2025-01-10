Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E22EEA091F1
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869521.1281034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4j-0003hu-Rl; Fri, 10 Jan 2025 13:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869521.1281034; Fri, 10 Jan 2025 13:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4j-0003dN-Iw; Fri, 10 Jan 2025 13:29:21 +0000
Received: by outflank-mailman (input) for mailman id 869521;
 Fri, 10 Jan 2025 13:29:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4i-0001QR-CU
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:20 +0000
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [2a00:1450:4864:20::542])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e58aad29-cf56-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 14:29:19 +0100 (CET)
Received: by mail-ed1-x542.google.com with SMTP id
 4fb4d7f45d1cf-5d414b8af7bso3534644a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:19 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:18 -0800 (PST)
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
X-Inumbo-ID: e58aad29-cf56-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515759; x=1737120559; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2RsoCzP1jEEvrkQ7ie+7psyxTtmQ+XSlhDRoNh8Ta4=;
        b=GXLxss7JQtIMQ5qxRdi32eG7uMDxBFRlL20VpnyOPep68jhkhOG0Y5jorcTKoRnaW2
         Ho6aREBD+KaGTQuAE+Qzf6uBbYVguACNXEOV0Qn+aMX2zaaIQsg6k1ftBeM7/RB2hWSa
         udW3OIHQXiKAwQh3dOPwL4yzUgpRdFzpD97Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515759; x=1737120559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2RsoCzP1jEEvrkQ7ie+7psyxTtmQ+XSlhDRoNh8Ta4=;
        b=MeZ8Oku6qLy93J8cMN3br67vLbasrUScHjHOmDnmsboK0VBXAfFykrGMrC1HFGztmm
         hf64XCsDjoaHNYmE69Ub7VYR0Sgnp7rFwvry0KW8oAAG3ix5tziBm0XQAjnLPUkSQ2EN
         oBxAqD6CDavR8rrW5CCP1sByaWAm3yMPaPZFg2SJ3XZxwEI3FmK0mUbU8e/CnhBUaZ6r
         ctzCkMD7hF+ioL3vErXCpNfDFDN1iS+aeDXdjYbhbC7+tm07FcB6336y+54tJG7rpuQt
         LynyHdztZY3F4bKaM2rvB08XToVlY4DmZ4/bLNb1+3RWbPNkVI7tICsth5Uqe52IYy8Q
         k8bw==
X-Gm-Message-State: AOJu0YwTJa3Fp6QIvBvpGbNguUNP0FJgi1lFDRVZAbxerobips9Y74Ds
	H6kDYH5d5nRHgLf+K0ubUurxREvw7140QdhutRPwiMCWqRNpuJNtF1c9nHnSTQfgdate8O1LbHA
	ATQ734uYa
X-Gm-Gg: ASbGncuJMLzX+Og7uTAeAoRMhLoBSL2vxvFxz3e7oGJRdJ96VHOKFd0OTvdCX9MoiFZ
	pDKMajGtBT1XP29h/QjSV9gD/38bbLzaC/wImPCzR0iTWLT5pGqsvqWrj4S0AisWc/had/mLtov
	wfZ62EbLyADHOvotrLIvW203E8/EPlQfoLyklIbQ/c8rRdVSClzcravwmqow1w2Pu18jgwaKpWL
	x+fOOgzMrBTUGG/6/zWWA4IYyW1LkHrgLeE7kvoqVVGrhpbIry+hrmE5j0DtF4qhjky/HkuuHAk
	7jY=
X-Google-Smtp-Source: AGHT+IF15swdBXE1MFaI32h7Atni7TCGXHlE4Tor2dd8F/fqqD6BOl5NrTMZmikGKgmrRfGNYInbLg==
X-Received: by 2002:a05:6402:448e:b0:5d0:c67e:e263 with SMTP id 4fb4d7f45d1cf-5d972e08663mr9043770a12.8.1736515759088;
        Fri, 10 Jan 2025 05:29:19 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 10/12] x86/fpu: Pass explicit xsave areas to fpu_(f)xsave()
Date: Fri, 10 Jan 2025 13:28:21 +0000
Message-ID: <20250110132823.24348-11-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2->v3:
  * const-ified v in fpu_fxsave() (missing in v2)

v1->v2:
  * const-ified v
---
 xen/arch/x86/i387.c               | 16 ++++++++++------
 xen/arch/x86/include/asm/xstate.h |  2 +-
 xen/arch/x86/xstate.c             |  3 +--
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 5429531ddd5f..11d06f921269 100644
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
+static inline void fpu_fxsave(const struct vcpu *v, fpusse_t *fpu_ctxt)
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
index ab81a4c8527e..87f05dbca6f4 100644
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
index 2003ba664594..24053b394200 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -302,9 +302,8 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
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
2.47.1


