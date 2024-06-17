Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA3490B843
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 19:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742542.1149412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKL-0004Yf-VX; Mon, 17 Jun 2024 17:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742542.1149412; Mon, 17 Jun 2024 17:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJGKL-0004UF-Ob; Mon, 17 Jun 2024 17:39:33 +0000
Received: by outflank-mailman (input) for mailman id 742542;
 Mon, 17 Jun 2024 17:39:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gp4O=NT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sJGKJ-00036g-LD
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 17:39:31 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c77ddd1-2cd0-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 19:39:29 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6f176c5c10so549351266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 10:39:29 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56da4496sm532010666b.8.2024.06.17.10.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 10:39:28 -0700 (PDT)
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
X-Inumbo-ID: 8c77ddd1-2cd0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718645968; x=1719250768; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaQNeWXVPJOBqi4Jz3ws3Uw0UDtY4Ak6EMg/xM7DVZo=;
        b=VrFGtfmSSLW8DVJ5vvTBz2Ob+XtmWvZSEd+RK64X477iC0lyGg6e8MOS/E/x1tFjL8
         vBZ+VV4H2fmzcDJ3m0IJJic2VpzyGLF4v87hqB8V6gqv7Ke7bWUm9LfLX6H2QBR9sY9K
         qz0VkGNmcAZox1QtsBWdCcajvFyb5OTTaosdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718645968; x=1719250768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaQNeWXVPJOBqi4Jz3ws3Uw0UDtY4Ak6EMg/xM7DVZo=;
        b=lWTsItn18jIuVvLUXWJdvK8FVMNg+abRB24p3G5pyfdFRMXW5Q06JAnF4bZVZ8EdHH
         UQUf2aNgsjTKorAwnScTsIbLbsxtNugB4aFEjGJJi00LbL7x1Rjd7YWU4imRSug7zDfq
         k2YkXiPhjvJvYEqIQtkuupXHa1lTTkjViCvmGhM7tRowjuCGzIdhfGPDhFSgL142ue1F
         A1HX96teIC9qCk83ylPKj4aaJIDpk54dJO6rd4pOH5Qt9WgkeKnG5fsjfR5CIaOE1XmY
         ZHmMBJTeR8qIo71HnuGMGvYZgoOTXjc1+0TPrSq7DodVVO/nVwEVFhAJZQvXnPaumqio
         OPMQ==
X-Gm-Message-State: AOJu0YyVFnU7tWum9jhfb4wyW9VSasNcuyw+y3nRAY9pLwahK+IRMuHV
	bC8Xn1Knl8SIoluP/2PLel9UzA2SdoaKT8SdJL//QnZpggxlAzyUEQjRYCkYMgl/LIIbwFmWcyW
	KO1U=
X-Google-Smtp-Source: AGHT+IGKrdBfI9Nm+aHZ6UkUA5/JNpbfFSVehqAWMLC2Ni5M753x4xlQAZiw4qCHY7guT4Ih8WAYvg==
X-Received: by 2002:a17:906:2c0d:b0:a64:a091:91f2 with SMTP id a640c23a62f3a-a6f60d40c99mr732397266b.37.1718645968592;
        Mon, 17 Jun 2024 10:39:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v4 6/7] x86/cpuid: Fix handling of XSAVE dynamic leaves
Date: Mon, 17 Jun 2024 18:39:20 +0100
Message-Id: <20240617173921.1755439-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
References: <20240617173921.1755439-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

First, if XSAVE is available in hardware but not visible to the guest, the
dynamic leaves shouldn't be filled in.

Second, the comment concerning XSS state is wrong.  VT-x doesn't manage
host/guest state automatically, but there is provision for "host only" bits to
be set, so the implications are still accurate.

Introduce xstate_compressed_size() to mirror the uncompressed one.  Cross
check it at boot.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

v3:
 * Adjust commit message about !XSAVE guests
 * Rebase over boot time cross check
 * Use raw policy
v4:
 * Drop the TODO comment.  The CPUID path is always liable to pass 0 here.
 * ASSERT() a nonzero c->size like we do in the uncompressed helper.
---
 xen/arch/x86/cpuid.c              | 24 +++++++--------------
 xen/arch/x86/include/asm/xstate.h |  1 +
 xen/arch/x86/xstate.c             | 36 +++++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 7a38e032146a..a822e80c7ea7 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -330,23 +330,15 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
     case XSTATE_CPUID:
         switch ( subleaf )
         {
-        case 1:
-            if ( !p->xstate.xsavec && !p->xstate.xsaves )
-                break;
-
-            /*
-             * TODO: Figure out what to do for XSS state.  VT-x manages host
-             * vs guest MSR_XSS automatically, so as soon as we start
-             * supporting any XSS states, the wrong XSS will be in context.
-             */
-            BUILD_BUG_ON(XSTATE_XSAVES_ONLY != 0);
-            fallthrough;
         case 0:
-            /*
-             * Read CPUID[0xD,0/1].EBX from hardware.  They vary with enabled
-             * XSTATE, and appropriate XCR0|XSS are in context.
-             */
-            res->b = cpuid_count_ebx(leaf, subleaf);
+            if ( p->basic.xsave )
+                res->b = xstate_uncompressed_size(v->arch.xcr0);
+            break;
+
+        case 1:
+            if ( p->xstate.xsavec )
+                res->b = xstate_compressed_size(v->arch.xcr0 |
+                                                v->arch.msrs->xss.raw);
             break;
         }
         break;
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index bfb66dd766b6..da1d89d2f416 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -109,6 +109,7 @@ void xstate_free_save_area(struct vcpu *v);
 int xstate_alloc_save_area(struct vcpu *v);
 void xstate_init(struct cpuinfo_x86 *c);
 unsigned int xstate_uncompressed_size(uint64_t xcr0);
+unsigned int xstate_compressed_size(uint64_t xstates);
 
 static inline uint64_t xgetbv(unsigned int index)
 {
diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 8edc4792a8fd..31bf2dc95f57 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -619,6 +619,36 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
     return size;
 }
 
+unsigned int xstate_compressed_size(uint64_t xstates)
+{
+    unsigned int i, size = XSTATE_AREA_MIN_SIZE;
+
+    if ( xstates == 0 )
+        return 0;
+
+    if ( xstates <= (X86_XCR0_SSE | X86_XCR0_FP) )
+        return size;
+
+    /*
+     * For the compressed size, every non-legacy component matters.  Some
+     * componenets require aligning to 64 first.
+     */
+    xstates &= ~(X86_XCR0_SSE | X86_XCR0_FP);
+    for_each_set_bit ( i, &xstates, 63 )
+    {
+        const struct xstate_component *c = &raw_cpu_policy.xstate.comp[i];
+
+        ASSERT(c->size);
+
+        if ( c->align )
+            size = ROUNDUP(size, 64);
+
+        size += c->size;
+    }
+
+    return size;
+}
+
 struct xcheck_state {
     uint64_t states;
     uint32_t uncomp_size;
@@ -681,6 +711,12 @@ static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
                   s->states, &new, hw_size, s->comp_size);
 
         s->comp_size = hw_size;
+
+        xen_size = xstate_compressed_size(s->states);
+
+        if ( xen_size != hw_size )
+            panic("XSTATE 0x%016"PRIx64", compressed hw size %#x != xen size %#x\n",
+                  s->states, hw_size, xen_size);
     }
     else if ( hw_size ) /* Compressed size reported, but no XSAVEC ? */
     {
-- 
2.39.2


