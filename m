Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A6C9BCF78
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:34:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830268.1245315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KdF-0005nl-UY; Tue, 05 Nov 2024 14:34:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830268.1245315; Tue, 05 Nov 2024 14:34:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8KdF-0005kb-NO; Tue, 05 Nov 2024 14:34:09 +0000
Received: by outflank-mailman (input) for mailman id 830268;
 Tue, 05 Nov 2024 14:34:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSsw=SA=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8KdD-0002K5-OX
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:34:07 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0275fcd4-9b83-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 15:34:05 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5ceccffadfdso3553120a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:34:05 -0800 (PST)
Received: from localhost.localdomain ([217.156.233.154])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a99ff2sm1395047a12.4.2024.11.05.06.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:34:04 -0800 (PST)
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
X-Inumbo-ID: 0275fcd4-9b83-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmMiLCJoZWxvIjoibWFpbC1lZDEteDUyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAyNzVmY2Q0LTliODMtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE3MjQ1Ljc1ODA5NCwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817245; x=1731422045; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6B5omt1SedDQO6IJZRH4ErAkBbwq92KD+awlMKQ0bxI=;
        b=i4FMGxGpZc1jBhlMRVOTT5mcac4CED05EJi3mHEGYHY1m3+b+bfXSYHRBR6rMxlNgr
         5ePLpd9NCU9CjN8mweZjiTfx3y2/FGXbO2F7pjp7fTlOuL9d8hBCpsWd7bff1rlHVp1p
         GfSJHcX4eV9iX3ou/oo6fZLCkVJxVcKu/c0zU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817245; x=1731422045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6B5omt1SedDQO6IJZRH4ErAkBbwq92KD+awlMKQ0bxI=;
        b=CYr+D4hHVMLbp61AJXknGHtfqWLPkKEtesLpHxC6PNyzYVTpNayGFQJGFyISHfyHga
         6NJUUem+b/XqX55tOK9XoPWrVSB4FmLbqOi/tnyZG1Edgnns4eIclcxFCgXTQ6LWRFaO
         0sOCFGl9qvrfDdnhiqSNX6KPQ9Lyg+ml4vL9vaT+TDlE8EcskjV7QVd1dKMRF7gEgs5B
         Kq2mkOBhNUViqEi/p/3tOHlusJKpw9B0Q7DWB8/4zNhXUeIVDtDT+DdU+E1keb+wiSZn
         8zQa0X0T49Nxkq+4sM1G3zO30smcz9CFwC1O9+bjxEPdgzwZUt5MsqbT2cFH8hWIhycD
         QoCw==
X-Gm-Message-State: AOJu0Yxo9ZMybraO0V0ti8z+nurZp3HKm3+2BangoeLXUwyUQM03XH85
	3lHViGmRASmIp78iMeQ4VwQWMm7GqmCXV2ee/Wh7RXUa1Zbq2p2x61KTr/nLcmppVOB97Rxh/mp
	D
X-Google-Smtp-Source: AGHT+IFJA6M0XBv7FRFRoMs3JuKuoqXi/nf+aCqDEMKXEkJJ1sPRGW37quCEyuWC30mb250kMwCXmw==
X-Received: by 2002:a05:6402:210d:b0:5c9:74e3:acbb with SMTP id 4fb4d7f45d1cf-5cea9678020mr15569290a12.10.1730817244742;
        Tue, 05 Nov 2024 06:34:04 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 13/13] x86/xstate: Make xstate_all() and vcpu_xsave_mask() take explicit xstate
Date: Tue,  5 Nov 2024 14:33:10 +0000
Message-ID: <20241105143310.28301-14-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
References: <20241105143310.28301-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 xen/arch/x86/i387.c               | 9 +++++----
 xen/arch/x86/include/asm/xstate.h | 5 +++--
 xen/arch/x86/xstate.c             | 2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/i387.c b/xen/arch/x86/i387.c
index c794367a3cc7..36a6c8918162 100644
--- a/xen/arch/x86/i387.c
+++ b/xen/arch/x86/i387.c
@@ -107,7 +107,8 @@ static inline void fpu_fxrstor(struct vcpu *v, const fpusse_t *fpu_ctxt)
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
index d2ef4c0b25f0..e3e9c18239ed 100644
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
index b5e8d90ef600..26e460adfd79 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -1003,7 +1003,7 @@ int handle_xsetbv(u32 index, u64 new_bv)
             asm ( "stmxcsr %0" : "=m" (xsave_area->fpu_sse.mxcsr) );
             VCPU_UNMAP_XSAVE_AREA(curr, xsave_area);
         }
-        else if ( xstate_all(curr) )
+        else if ( xstate_all(curr, xsave_area) )
         {
             /* See the comment in i387.c:vcpu_restore_fpu_eager(). */
             mask |= XSTATE_LAZY;
-- 
2.47.0


