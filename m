Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 586F5A091F3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 14:29:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869526.1281045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4n-0004LZ-9e; Fri, 10 Jan 2025 13:29:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869526.1281045; Fri, 10 Jan 2025 13:29:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWF4m-0004I0-UW; Fri, 10 Jan 2025 13:29:24 +0000
Received: by outflank-mailman (input) for mailman id 869526;
 Fri, 10 Jan 2025 13:29:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmVM=UC=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tWF4l-0001QR-5I
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 13:29:23 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e723c13e-cf56-11ef-a0df-8be0dac302b0;
 Fri, 10 Jan 2025 14:29:22 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d7e3f1fc01so4018560a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jan 2025 05:29:22 -0800 (PST)
Received: from localhost.localdomain ([66.81.170.107])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d9900c98d6sm1589297a12.35.2025.01.10.05.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:29:21 -0800 (PST)
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
X-Inumbo-ID: e723c13e-cf56-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1736515762; x=1737120562; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGYGQF82WrUmaE3ckte9a2eG993H0v3sPPUj77Kpcmw=;
        b=Cr83ioQvAcp9FvPphkT8iLQsf2VpYo10ZezFRZ9EPAHxub3qbLyUoi1uxGy72TTRvp
         to9aDP776+EKGZn6WzPCxNkn4FBg/EpFFeCr8199osQZBFPoIeXyticOMBtnZFlh3Qzb
         f/2ci0586FJ7pPcmy4+bz+iRP8C8yn45wnwjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736515762; x=1737120562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGYGQF82WrUmaE3ckte9a2eG993H0v3sPPUj77Kpcmw=;
        b=I4EJYEBukDpM4TAOTZlL3sdR01BVTK5ZvMTgD5VKEvm3aTwHFhkkp9oP+otEs3o1Kl
         t5u3ZdXWkI+VBrtOUxjjLNc88kzqsEZM1zXyGLTjKSV6tz7Hf8QdJvCBGJYF/VK1Dv2r
         fmhUn80kC/1PxMtJOgnMno5VqUJ6iZ9oGBLQjEwm0CSwotIMoOT6nszsddsd6ZiQAel6
         lSv/sbkGNBQYjgbs00d7X7Cm7sJhzDW52k8IxFL7UWNL7S7Mmw4d5kobP55QXAuNWVZh
         hVCv+rQFzA0vmNAt7k3dx0qMAck8OkpmXV4y9JdWWzdWHAadjT+ydkV9gZSn9XDKdV1I
         4xdg==
X-Gm-Message-State: AOJu0YzfBkjExomFQVAElE1J2aJQ7cOdn60Zpyco7E9eQXVNwbNbkHdf
	DOr1bbJhrL/gxJMsC2KHjcI4sJKeQnumGFUaXg0rnC1Xj31UkauZjEv9pvNmaCQmklsFyDPyCHn
	lcsOsTA==
X-Gm-Gg: ASbGncsN5s72xdY77DUsQW+uE6sAURCK8zm6qrQNGq67qAfxdOpPjtCecRTNpV7ARyd
	5iW+KzbuxOTep/2w7LAOA2TGgZdMJu5IirLiZM+sQO5QouKgzGCKSyfxZzYt0hKJBhu+L4+le5C
	b1+HA6qBUXWxVWErfS2ZF7dqh6Jo0rYdchoVBihewFvRSe/hJrBU+hHi3PNVA1//KRxPGEzowv9
	NiDekHw3Pm9zmTgGjoJSEVxuFPmDiqpyNXl4OqLRhXn8E0qRYT2ZlT4UCcWRtkpAIofW4sM8qNa
	xG4=
X-Google-Smtp-Source: AGHT+IHm6oaJ8YwWbN8mvMBsk0Ry+E2PKI9C0KwkXDe5NuUIwFuRQ4O/29eudYZew7AzQZ2WhbARTA==
X-Received: by 2002:a17:907:c815:b0:ab2:c78f:e4ae with SMTP id a640c23a62f3a-ab2c78fe63dmr536582966b.20.1736515761703;
        Fri, 10 Jan 2025 05:29:21 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 12/12] x86/xstate: Make xstate_all() and vcpu_xsave_mask() take explicit xstate
Date: Fri, 10 Jan 2025 13:28:23 +0000
Message-ID: <20250110132823.24348-13-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
v2->v3:
  * Added A-by
---
 xen/arch/x86/i387.c               | 9 +++++----
 xen/arch/x86/include/asm/xstate.h | 5 +++--
 xen/arch/x86/xstate.c             | 2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index 943ae668606f..8120a6a4afc0 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -107,7 +107,8 @@ static inline void fpu_fxrstor(const fpusse_t *fpu_ctxt)
 /*      FPU Save Functions     */
 /*******************************/
 
-static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
+static inline uint64_t vcpu_xsave_mask(const struct vcpu *v,
+                                       const struct xsave_struct *xsave_area)
 {
     if ( v->fpu_dirtied )
         return v->arch.nonlazy_xstate_used ? XSTATE_ALL : XSTATE_LAZY;
@@ -124,14 +125,14 @@ static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
      * XSTATE_FP_SSE), vcpu_xsave_mask will return XSTATE_ALL. Otherwise
      * return XSTATE_NONLAZY.
      */
-    return xstate_all(v) ? XSTATE_ALL : XSTATE_NONLAZY;
+    return xstate_all(v, xsave_area) ? XSTATE_ALL : XSTATE_NONLAZY;
 }
 
 /* Save x87 extended state */
 static inline void fpu_xsave(const struct vcpu *v, struct xsave_struct *xsave_area)
 {
     bool ok;
-    uint64_t mask = vcpu_xsave_mask(v);
+    uint64_t mask = vcpu_xsave_mask(v, xsave_area);
 
     ASSERT(mask);
     /*
@@ -211,7 +212,7 @@ void vcpu_restore_fpu_nonlazy(struct vcpu *v, bool need_stts)
      * saving state belonging to another vCPU.
      */
     xsave_area = VCPU_MAP_XSAVE_AREA(v);
-    if ( v->arch.fully_eager_fpu || xstate_all(v) )
+    if ( v->arch.fully_eager_fpu || xstate_all(v, xsave_area) )
     {
         if ( cpu_has_xsave )
             fpu_xrstor(v, xsave_area, XSTATE_ALL);
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index 7d160d2b54be..a1b188537c15 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -132,14 +132,15 @@ xsave_area_compressed(const struct xsave_struct *xsave_area)
     return xsave_area->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED;
 }
 
-static inline bool xstate_all(const struct vcpu *v)
+static inline bool xstate_all(const struct vcpu *v,
+                              const struct xsave_struct *xsave_area)
 {
     /*
      * XSTATE_FP_SSE may be excluded, because the offsets of XSTATE_FP_SSE
      * (in the legacy region of xsave area) are fixed, so saving
      * XSTATE_FP_SSE will not cause overwriting problem with XSAVES/XSAVEC.
      */
-    return xsave_area_compressed(v->arch.xsave_area) &&
+    return xsave_area_compressed(xsave_area) &&
            (v->arch.xcr0_accum & XSTATE_LAZY & ~XSTATE_FP_SSE);
 }
 
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 3d4fb7664c5f..b204147815c3 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -1005,7 +1005,7 @@ int handle_xsetbv(u32 index, u64 new_bv)
             asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
             VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
         }
-        else if ( xstate_all(curr) )
+        else if ( xstate_all(curr, xsave_area) )
         {
             /* See the comment in i387.c:vcpu_restore_fpu_eager(). */
             mask |= XSTATE_LAZY;
-- 
2.47.1


