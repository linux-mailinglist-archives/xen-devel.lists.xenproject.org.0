Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 426FF8CD11D
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 13:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728370.1133320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RO-0007ng-5p; Thu, 23 May 2024 11:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728370.1133320; Thu, 23 May 2024 11:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA6RO-0007kz-00; Thu, 23 May 2024 11:16:58 +0000
Received: by outflank-mailman (input) for mailman id 728370;
 Thu, 23 May 2024 11:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSi9=M2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sA6RN-0006Hv-0K
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 11:16:57 +0000
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [2607:f8b0:4864:20::736])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f62566fc-18f5-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 13:16:55 +0200 (CEST)
Received: by mail-qk1-x736.google.com with SMTP id
 af79cd13be357-792c3741c71so77887785a.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 04:16:55 -0700 (PDT)
Received: from andrew-laptop.citrite.net ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f179cebsm142194236d6.3.2024.05.23.04.16.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 04:16:51 -0700 (PDT)
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
X-Inumbo-ID: f62566fc-18f5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716463013; x=1717067813; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=us4603FaoecAqWNVKzEdaqnc883Hrl4rvqqHc2XtrfI=;
        b=bUd6IOtRE2wCKKwEStO+5AvFKg4I6nqhz8gwBIi5iW6t+OnMuUkNl0BWwllM45DlWW
         GyyglXfBfcSCdHJIJg3Zm/TgvZM8hy6IAUziNPEiF+4/sIpuOVIjp57rdkEf1Jg67Uf3
         T94PxcTZHr3j5zzoWw8EIpvhCe0WATJvdlIxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716463013; x=1717067813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=us4603FaoecAqWNVKzEdaqnc883Hrl4rvqqHc2XtrfI=;
        b=eeB1tvtlrnKRsuuZ8hHYc3naJy75IIYXjc+cPUoTxD63fqqfpQ07d62QCcOPlAbP5H
         jqkQShHhvwjBufbG+vd4wjisOjBdws+ICSbrfeGsUqDQpu94/fT8mfevErU8AUBh2i1u
         hKLgYr1ppBoewaQx/lWG9Wl5aHLVRx+I98NEczdM2u9w5R/qk2+RBBv52Jb99qZojJIw
         pumt6ziU1FBSWmR1lhoCShqg0p3FnjZtv44U5UUb9XhILj9OXTbJwS83bbaevIKKWUEi
         pwbKyh49b9N6V0KflC3zWD3MqZ+/6xk55bd+NfSF9JQjlanCy1/xZ2Xac5QAJvLOYBTv
         UvKw==
X-Gm-Message-State: AOJu0YwV43xrH0WsspzvjMptag/SZ05cZ1fYKbQaGrdm8A6OB8WhAiXm
	QRzJI4I/Q2xEUvxpIabZMtcDVEzV9zUioiCBwvXoNc4gSG341y8sNSpHG81+gxWga9l0ACWDsAS
	Q+1o=
X-Google-Smtp-Source: AGHT+IFMd6G/LG3bqX6YqX/t3Cg+uvutJKi9sTJLns27rXhQaiIj1RFtnwEcd6kpIryKMzcdy+XPRw==
X-Received: by 2002:a05:6214:2b8e:b0:6ab:932d:c24f with SMTP id 6a1803df08f44-6ab932dc50bmr12661656d6.52.1716463013119;
        Thu, 23 May 2024 04:16:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 6/7] x86/cpuid: Fix handling of XSAVE dynamic leaves
Date: Thu, 23 May 2024 12:16:26 +0100
Message-Id: <20240523111627.28896-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523111627.28896-1-andrew.cooper3@citrix.com>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
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
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v3:
 * Adjust commit message about !XSAVE guests
 * Rebase over boot time cross check
 * Use raw policy
---
 xen/arch/x86/cpuid.c              | 24 ++++++++--------------
 xen/arch/x86/include/asm/xstate.h |  1 +
 xen/arch/x86/xstate.c             | 34 +++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 16 deletions(-)

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
index 1b3153600d9c..7b7f2dcaf651 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -621,6 +621,34 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
     return size;
 }
 
+unsigned int xstate_compressed_size(uint64_t xstates)
+{
+    unsigned int i, size = XSTATE_AREA_MIN_SIZE;
+
+    if ( xstates == 0 ) /* TODO: clean up paths passing 0 in here. */
+        return 0;
+
+    if ( xstates <= (X86_XCR0_SSE | X86_XCR0_FP) )
+        return size;
+
+    /*
+     * For the compressed size, every component matters.  Some componenets are
+     * rounded up to 64 first.
+     */
+    xstates &= ~(X86_XCR0_SSE | X86_XCR0_FP);
+    for_each_set_bit ( i, &xstates, 63 )
+    {
+        const struct xstate_component *c = &raw_cpu_policy.xstate.comp[i];
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
@@ -683,6 +711,12 @@ static void __init check_new_xstate(struct xcheck_state *s, uint64_t new)
                   s->states, &new, hw_size, s->comp_size);
 
         s->comp_size = hw_size;
+
+        xen_size = xstate_compressed_size(s->states);
+
+        if ( xen_size != hw_size )
+            panic("XSTATE 0x%016"PRIx64", compressed hw size %#x != xen size %#x\n",
+                  s->states, hw_size, xen_size);
     }
     else
         BUG_ON(hw_size); /* Compressed size reported, but no XSAVEC ? */
-- 
2.30.2


