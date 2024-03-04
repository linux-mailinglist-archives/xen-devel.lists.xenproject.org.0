Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B27E186FD41
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 10:23:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688228.1072189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4XT-0003Ct-Jo; Mon, 04 Mar 2024 09:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688228.1072189; Mon, 04 Mar 2024 09:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh4XT-00035g-GS; Mon, 04 Mar 2024 09:23:15 +0000
Received: by outflank-mailman (input) for mailman id 688228;
 Mon, 04 Mar 2024 09:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o7cd=KK=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rh4XR-0002pl-CR
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 09:23:13 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d177b03e-da08-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 10:23:10 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a44d084bfe1so214999166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 01:23:11 -0800 (PST)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 tj10-20020a170907c24a00b00a444526962asm4485529ejc.128.2024.03.04.01.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 01:23:09 -0800 (PST)
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
X-Inumbo-ID: d177b03e-da08-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1709544190; x=1710148990; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8576Vz0UPo+rS38MVUiaswDJj20EFHOADQjBzvq4J4=;
        b=CPUwA8qQ93q1gT7CmMkdRFM4uQiNAY8URrf7QA8i0/6TYzLESo0DmPGaLIaEVKr8pc
         yousL2+uV866bx9YNR7kxzOQ95QpalI0gKu434mGS3RI6O6fiMYkt12Tzh7ovKkAN9jW
         M0lDPybxKeA43jyBZChsJaF6KiKacPiO4XlDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544190; x=1710148990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8576Vz0UPo+rS38MVUiaswDJj20EFHOADQjBzvq4J4=;
        b=lvYm2TPhIOnHHfWS+7U/2avHgwxB9NekWSlHHqPh3xCDlGjht3zU5tqdB6zLVYXO8e
         krQyieaWebfeOPxoZwh08DpiMiMqTOm1EuGsA4Fr6aWqGOI19r904as0806+hQ3opxch
         iOzaY10nKg0y/PCVDoGQHJUISJm4J4A6a4eZ090eQRzLKqXMzXNrd/WXc5s1Bad7H3p/
         snBeF14Dp5r5fzgD6xTf3Z8WI5Bm8U/LI14POpe5RKVbxCZCKWgebL9dtEB2uVCHOk+v
         shkfKxQG2M+M95ewcf4rysUKcaDuRsLn099vXAOnaNc0CsS7Fk9mjXS4bLtfqJjSHtqn
         4c3A==
X-Gm-Message-State: AOJu0YwCpZmaPPznIcW3gVDRNNNd4PzqEXUx1a4CzsNFvMHSXw/1L2N1
	RIQ7bq2IynLriNp5kHdcnZLxzu1UR29rXF7F6m2O4uj28iSP2aIjL8NanounCpshZyKZvB2E5rf
	5hZQ=
X-Google-Smtp-Source: AGHT+IE42eCZ6CjhAvzdETjVqdy8/jVPKO6w3yWfhfb1zLFXH9r02iHSEC9lZXhHAto+j08lEc2Dhg==
X-Received: by 2002:a17:906:685:b0:a44:fe70:1b82 with SMTP id u5-20020a170906068500b00a44fe701b82mr2645062ejb.8.1709544190552;
        Mon, 04 Mar 2024 01:23:10 -0800 (PST)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>,
	Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] x86: introduce xstate_zero
Date: Mon,  4 Mar 2024 09:13:06 +0000
Message-ID: <20240304091307.2295344-3-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240304091307.2295344-1-fouad.hilly@cloud.com>
References: <20240304091307.2295344-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wei Liu <wei.liu2@citrix.com>

Factor out xrstor__ and introduce xstate_zero, which zeros all the
state components specified in the mask.

Signed-off-by: Wei Liu <wei.liu2@citrix.com>
Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/xstate.h |  1 +
 xen/arch/x86/xstate.c             | 39 +++++++++++++++++++++++++------
 2 files changed, 33 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index c08c267884f0..bd767d9cd714 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -94,6 +94,7 @@ uint64_t get_msr_xss(void);
 uint64_t read_bndcfgu(void);
 void xsave(struct vcpu *v, uint64_t mask);
 void xrstor(struct vcpu *v, uint64_t mask);
+void xstate_zero(uint64_t mask);
 void xstate_set_init(uint64_t mask);
 bool xsave_enabled(const struct vcpu *v);
 int __must_check validate_xstate(const struct domain *d,
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index cf94761d0542..92a65bd8d52c 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -368,11 +368,12 @@ void xsave(struct vcpu *v, uint64_t mask)
         ptr->fpu_sse.x[FPU_WORD_SIZE_OFFSET] = fip_width;
 }
 
-void xrstor(struct vcpu *v, uint64_t mask)
+/* True -> no error, false -> failed */
+static bool xrstor__(struct xsave_struct *ptr, uint64_t xcr0_accum,
+                     uint64_t mask)
 {
     uint32_t hmask = mask >> 32;
     uint32_t lmask = mask;
-    struct xsave_struct *ptr = v->arch.xsave_area;
     unsigned int faults, prev_faults;
 
     /*
@@ -412,7 +413,7 @@ void xrstor(struct vcpu *v, uint64_t mask)
                          [ptr] "D" (ptr) )
 
 #define XRSTOR(pfx) \
-        if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY ) \
+        if ( xcr0_accum & XSTATE_XSAVES_ONLY ) \
         { \
             if ( unlikely(!(ptr->xsave_hdr.xcomp_bv & \
                             XSTATE_COMPACTION_ENABLED)) ) \
@@ -461,7 +462,7 @@ void xrstor(struct vcpu *v, uint64_t mask)
                   ((mask & X86_XCR0_YMM) &&
                    !(ptr->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED))) )
                 ptr->fpu_sse.mxcsr &= mxcsr_mask;
-            if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY )
+            if ( xcr0_accum & XSTATE_XSAVES_ONLY )
             {
                 ptr->xsave_hdr.xcomp_bv &= this_cpu(xcr0) | this_cpu(xss);
                 ptr->xsave_hdr.xstate_bv &= ptr->xsave_hdr.xcomp_bv;
@@ -478,14 +479,35 @@ void xrstor(struct vcpu *v, uint64_t mask)
         case 2: /* Stage 2: Reset all state. */
             ptr->fpu_sse.mxcsr = MXCSR_DEFAULT;
             ptr->xsave_hdr.xstate_bv = 0;
-            ptr->xsave_hdr.xcomp_bv = v->arch.xcr0_accum & XSTATE_XSAVES_ONLY
+            ptr->xsave_hdr.xcomp_bv = xcr0_accum & XSTATE_XSAVES_ONLY
                                       ? XSTATE_COMPACTION_ENABLED : 0;
             continue;
         }
 
-        domain_crash(current->domain);
-        return;
+        return false;
     }
+
+    return true;
+}
+
+void xrstor(struct vcpu *v, uint64_t mask)
+{
+    if ( !xrstor__(v->arch.xsave_area, v->arch.xcr0_accum, mask) )
+        domain_crash(current->domain);
+}
+
+void xstate_zero(uint64_t mask)
+{
+    bool ok;
+    struct xsave_struct tmp;
+
+    tmp.fpu_sse.mxcsr = MXCSR_DEFAULT;
+    tmp.xsave_hdr.xstate_bv = 0;
+    tmp.xsave_hdr.xcomp_bv = 0;
+    memset(tmp.xsave_hdr.reserved, 0, sizeof(tmp.xsave_hdr.reserved));
+
+    ok = xrstor__(&tmp, mask, mask);
+    ASSERT(ok);
 }
 
 bool xsave_enabled(const struct vcpu *v)
@@ -731,6 +753,9 @@ int handle_xsetbv(u32 index, u64 new_bv)
     if ( (new_bv & ~xcr0_max) || !valid_xcr0(new_bv) )
         return -EINVAL;
 
+    /* Zero state components before writing new XCR0 */
+    xstate_zero(get_xcr0());
+
     /* By this point, new_bv really should be accepted by hardware. */
     if ( unlikely(!set_xcr0(new_bv)) )
     {
-- 
2.42.0


