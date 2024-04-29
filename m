Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE8B8B6117
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 20:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714345.1115540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Vjr-00035D-VM; Mon, 29 Apr 2024 18:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714345.1115540; Mon, 29 Apr 2024 18:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Vjr-0002xz-RC; Mon, 29 Apr 2024 18:28:31 +0000
Received: by outflank-mailman (input) for mailman id 714345;
 Mon, 29 Apr 2024 18:28:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1Vjq-0002ks-Dr
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 18:28:30 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4665ca60-0656-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 20:28:29 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57258c90899so5727413a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 11:28:29 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 h25-20020a0564020e9900b0056bc0c44f02sm13241293eda.96.2024.04.29.11.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 11:28:28 -0700 (PDT)
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
X-Inumbo-ID: 4665ca60-0656-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714415308; x=1715020108; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyIIuM0MTD0m2fODC0sTW6s/htaUI9+d26Ij/6rc7Jc=;
        b=YPjuwI4nXCYgOzBAg+JvIXncGSiwH1bl9AObD1qG7sRZj1SHeTxIJ7fbzRb5pEed9m
         XRYIE5uSaJ7xA4j68jeEdPxZVcacistQurw6I+IxofCp+SDbDW8sDFRoh6UwayMAea/9
         Dp+uTrysI7sVBpfSVVyJcvQeZTQbCpHHGwuYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714415308; x=1715020108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyIIuM0MTD0m2fODC0sTW6s/htaUI9+d26Ij/6rc7Jc=;
        b=UioCzmi5v15vbnD+oG7ZfnP4WQ8gfbOBc4pZRHtOMi53ffMeNvOoMpjUqCpBSFgr3j
         ZyP/qo32J85o2bx+Sy8kPl6O4PJnNhz9rZeE1mpK11DBcegAg8xDHySVOrXHlmUgrvB2
         CSDacisvQO1eQCARAd4qK9N4AIQWaUCBljtjw05wTMykhO4rC5dbaIGG/TBrLa7/Ck9r
         3av0SpXx1XuxvElvQB1aAVhVQAEXY0jwVMivZElRKMqfC84hmEtHWw/6dhfHP6QJ22E1
         82vXejUs2gU1p3LgzIEBsxybJ1DCUJsb46d6OD/bldTYvGT19RrT2qd8gNnQPz93kTFA
         OFBg==
X-Gm-Message-State: AOJu0Yw0TecCjeM99hrzLyqZJ0sl4PfkcPN6gUHfH4NkbMczUwKlMk0u
	dF6ttljMYRwA5sIKRadyr/KcVRf4jn6pzJm55dskHFew91QMe+siqFiAJRHESzN+JkJV1wEl9Z5
	O
X-Google-Smtp-Source: AGHT+IGBH906trFMksi2dFbsLtezstfc77WQj3FYL1DAKBHkBY4+QnPCA0N4pBG/uAeGvfetV+SqAw==
X-Received: by 2002:a50:d7dd:0:b0:572:67de:5fd2 with SMTP id m29-20020a50d7dd000000b0057267de5fd2mr531977edj.0.1714415308473;
        Mon, 29 Apr 2024 11:28:28 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 4/4] x86/cpuid: Fix handling of xsave dynamic leaves
Date: Mon, 29 Apr 2024 19:28:23 +0100
Message-Id: <20240429182823.1130436-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
References: <20240429182823.1130436-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If max leaf is greater than 0xd but xsave not available to the guest, then the
current XSAVE size should not be filled in.  This is a latent bug for now as
the guest max leaf is 0xd, but will become problematic in the future.

The comment concerning XSS state is wrong.  VT-x doesn't manage host/guest
state automatically, but there is provision for "host only" bits to be set, so
the implications are still accurate.

Introduce {xstate,hw}_compressed_size() helpers to mirror the uncompressed
ones.

This in turn higlights a bug in xstate_init().  Defaulting this_cpu(xss) to ~0
requires a forced write to clear it back out.  This in turn highlights that
it's only a safe default on systems with XSAVES.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

The more I think about it, the more I think that cross-checking with hardware
is a bad move.  It's horribly expensive, and for supervisor states in
particular, liable to interfere with functionality.

v2:
 * Cope with blind reads of CPUID.0xD[1] prior to %xcr0 having been set up.
---
 xen/arch/x86/cpuid.c              | 24 ++++--------
 xen/arch/x86/include/asm/xstate.h |  1 +
 xen/arch/x86/xstate.c             | 64 ++++++++++++++++++++++++++++++-
 3 files changed, 72 insertions(+), 17 deletions(-)

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
index a94f4025fce5..b2cf3ae6acee 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -614,6 +614,65 @@ unsigned int xstate_uncompressed_size(uint64_t xcr0)
     return size;
 }
 
+static unsigned int hw_compressed_size(uint64_t xstates)
+{
+    uint64_t curr_xcr0 = get_xcr0(), curr_xss = get_msr_xss();
+    unsigned int size;
+    bool ok;
+
+    ok = set_xcr0(xstates & ~XSTATE_XSAVES_ONLY);
+    ASSERT(ok);
+    set_msr_xss(xstates & XSTATE_XSAVES_ONLY);
+
+    size = cpuid_count_ebx(XSTATE_CPUID, 1);
+
+    ok = set_xcr0(curr_xcr0);
+    ASSERT(ok);
+    set_msr_xss(curr_xss);
+
+    return size;
+}
+
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
+     * For the compressed size, every component matters.  Some are
+     * automatically rounded up to 64 first.
+     */
+    xstates &= ~XSTATE_FP_SSE;
+    for_each_set_bit ( i, &xstates, 63 )
+    {
+        if ( test_bit(i, &xstate_align) )
+            size = ROUNDUP(size, 64);
+
+        size += xstate_sizes[i];
+    }
+
+    /* In debug builds, cross-check our calculation with hardware. */
+    if ( IS_ENABLED(CONFIG_DEBUG) )
+    {
+        unsigned int hwsize;
+
+        xstates |= XSTATE_FP_SSE;
+        hwsize = hw_compressed_size(xstates);
+
+        if ( size != hwsize )
+            printk_once(XENLOG_ERR "%s(%#"PRIx64") size %#x != hwsize %#x\n",
+                        __func__, xstates, size, hwsize);
+        size = hwsize;
+    }
+
+    return size;
+}
+
 static bool valid_xcr0(uint64_t xcr0)
 {
     /* FP must be unconditionally set. */
@@ -681,7 +740,8 @@ void xstate_init(struct cpuinfo_x86 *c)
      * write it.
      */
     this_cpu(xcr0) = 0;
-    this_cpu(xss) = ~0;
+    if ( cpu_has_xsaves )
+        this_cpu(xss) = ~0;
 
     cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
     feature_mask = (((u64)edx << 32) | eax) & XCNTXT_MASK;
@@ -694,6 +754,8 @@ void xstate_init(struct cpuinfo_x86 *c)
     set_in_cr4(X86_CR4_OSXSAVE);
     if ( !set_xcr0(feature_mask) )
         BUG();
+    if ( cpu_has_xsaves )
+        set_msr_xss(0);
 
     if ( bsp )
     {
-- 
2.30.2


