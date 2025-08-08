Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F45FB1EF8D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Aug 2025 22:33:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1075169.1437674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTmb-0002ar-If; Fri, 08 Aug 2025 20:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1075169.1437674; Fri, 08 Aug 2025 20:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ukTmb-0002Ym-Fh; Fri, 08 Aug 2025 20:33:45 +0000
Received: by outflank-mailman (input) for mailman id 1075169;
 Fri, 08 Aug 2025 20:33:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dtzj=2U=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ukTcl-0005tW-Vk
 for xen-devel@lists.xenproject.org; Fri, 08 Aug 2025 20:23:35 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f208a38-7495-11f0-a324-13f23c93f187;
 Fri, 08 Aug 2025 22:23:35 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-459d4d7c745so23770325e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Aug 2025 13:23:35 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e075047fsm103989805e9.1.2025.08.08.13.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 13:23:33 -0700 (PDT)
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
X-Inumbo-ID: 8f208a38-7495-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754684614; x=1755289414; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sRLbDL6y30wDJ02d0Gb0iATvGt1mHINfHCOu1y5TSM=;
        b=bt8gt3r2W1Eo5RStFBvyapoJ9ArMzCN6x52FwjJul5sZDHeBbayKbTin9bwk6SUZkg
         LSkWPbvScWcGSbuKoBfUfKSZvO7yp652v2taLz2hTK83R/9aaYnDpXe/MLTLdE7Uaxq5
         KZyeftX5qyDd0ZSKjRz88ZkPayNL/ed2yNpkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754684614; x=1755289414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sRLbDL6y30wDJ02d0Gb0iATvGt1mHINfHCOu1y5TSM=;
        b=JGsBlHZA8+9/wlSmjpA+uI6ytFOAzKsTksFgMkoxyFdsn0r1xrsgrEWt+9WbbBdKmf
         yMkOIdl8PqWqAcrBIdzyw3qmS56FcaH3nQYYQqbB7C5QytvUskcCO4dJAzL0mgO0HErG
         1w3lUpbcJ3rsQJS/EdC6l9VW/UNcdvBhBaFr7wQldbsxvYEXt+PYYu3qBh+dvv4NEI+X
         4Tqg7ss+TIvmV2tZ0oHV48yWzto8xIW3wFzlynONLZqOWsdNLSbDcjmVlsMHByFmP+rk
         bunDkBnEoO0624vJK+yEg8WTR7/kWAO9ebzyGJ+HKPc1kC8cMnC2WcRHZ0dNxAYGDrNa
         pIYQ==
X-Gm-Message-State: AOJu0YxgMfr5fLyj5kAjlBpBVLgZGfOXMf5pP3YFK+62QU8aRAXAkbIk
	osHRjqsS79OxPSTWP9r2Gt38jHkeqHTccMRqKQatbGNt6lDq/nRhI/YYZKPEc7DBpatcWJSJi26
	JDlPpRYs=
X-Gm-Gg: ASbGncsbNioEeXUvavXu51UETMU2wQY65ffRAiGp2kIbsDS+1ezDgqkf9km6DrryuMq
	f+YwC7eJs1YSv8rEeo4Fn1FVR3aJSykt3IdFSWblNQSifeK2bAv3/OS/MzXzxDUw4yEsBldCZmP
	Fg0Ea9CBOYyFH0YpSBLyQhJN3UHGPLCeozlqoKUlMwNgwmNyQycALdcABrZ4HjW6deifN9/QVpz
	KYqHC/c6hTB5XXiomhoaYSyq7p8i2kjeJwmCKBn0Jmn3AiC5LAID3nKVSB2pLtFPFZAMtC34UCW
	fZudfQw0s7wk7SikfvsdbgA4XUBkK/OvutEz4vgeyw5OUpiAIOEcoLo/+OU8+4IULUSZ8TAgg3U
	AClBzGGNZMUT7JuYxHUe8oxDARZl6UMoyDn8X873Jm01izy/xnGSLMG1JtTn8jVBzPVDBvOAi5/
	+k
X-Google-Smtp-Source: AGHT+IG56gRK8s+AKlb+k2Xl44dfQcJRp2GsOb84OirZJroaWvK/7U5/0BXeGwcEJM2vr7exXaccow==
X-Received: by 2002:a05:600c:3542:b0:459:e06b:afbd with SMTP id 5b1f17b1804b1-459f4f14792mr35129715e9.29.1754684614211;
        Fri, 08 Aug 2025 13:23:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 19/22] x86/boot: Use RSTORSSP to establish SSP
Date: Fri,  8 Aug 2025 21:23:11 +0100
Message-Id: <20250808202314.1045968-20-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Under FRED, SETSSBSY is unavailable, and we want to be setting up FRED prior
to setting up shadow stacks.  As we still need Supervisor Tokens in IDT mode,
we need mode-specific logic to establish SSP.

In FRED mode, write a Restore Token, RSTORSSP it, and discard the resulting
Previous-SSP token.

No change outside of FRED mode.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/boot/x86_64.S | 23 +++++++++++++++++++++--
 xen/arch/x86/setup.c       | 27 ++++++++++++++++++++++++---
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
index ebb91d5e3f60..138501f52158 100644
--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -53,17 +53,21 @@ ENTRY(__high_start)
         mov     %rcx, STACK_CPUINFO_FIELD(cr4)(%r15)
         mov     %rcx, %cr4
 
-        /* WARNING! call/ret now fatal (iff SHSTK) until SETSSBSY loads SSP */
+        /* WARNING! CALL/RET now fatal (iff SHSTK) until SETSSBSY/RSTORSSP loads SSP */
 
 #if defined(CONFIG_XEN_SHSTK)
         test    $CET_SHSTK_EN, %al
         jz      .L_ap_cet_done
 
-        /* Derive the supervisor token address from %rsp. */
+        /* Derive the token address from %rsp. */
         mov     %rsp, %rdx
         and     $~(STACK_SIZE - 1), %rdx
         or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %rdx
 
+        /* Establishing SSP depends on whether we're using FRED or IDT mode. */
+        bt      $32 /* ilog2(X86_CR4_FRED) */, %rcx
+        jc      .L_fred_shstk
+
         /*
          * Write a new Supervisor Token.  It doesn't matter the first time a
          * CPU boots, but for S3 resume or CPU hot re-add, this clears the
@@ -71,6 +75,21 @@ ENTRY(__high_start)
          */
         wrssq   %rdx, (%rdx)
         setssbsy
+        jmp     .L_ap_cet_done
+
+.L_fred_shstk:
+
+        /*
+         * Write a Restore Token, value: &token + 8 + * 64BIT (bit 0) at the
+         * base of the shstk (which isn't in use yet).
+         */
+        lea     9(%rdx), %rdi
+        wrssq   %rdi, (%rdx)
+        rstorssp (%rdx)
+
+        /* Discard the Previous-SSP Token from the shstk. */
+        mov     $2, %edx
+        incsspd %edx
 
 #endif /* CONFIG_XEN_SHSTK */
 .L_ap_cet_done:
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 6fb42c5a5f95..c5dd2051dffe 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -53,6 +53,7 @@
 #include <asm/prot-key.h>
 #include <asm/pv/domain.h>
 #include <asm/setup.h>
+#include <asm/shstk.h>
 #include <asm/smp.h>
 #include <asm/spec_ctrl.h>
 #include <asm/stubs.h>
@@ -912,10 +913,30 @@ static void __init noreturn reinit_bsp_stack(void)
 
     if ( cpu_has_xen_shstk )
     {
-        wrmsrl(MSR_PL0_SSP,
-               (unsigned long)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8);
         wrmsrl(MSR_S_CET, xen_msr_s_cet_value());
-        asm volatile ("setssbsy" ::: "memory");
+
+        /*
+         * IDT and FRED differ by a Supervisor Token on the shadow stack, and
+         * therefore by the value in MSR_PL0_SSP.
+         *
+         * In IDT mode, we use SETSSBSY to mark the Supervisor Token as busy.
+         * In FRED mode, there is no token, so we need a transient Restore
+         * Token to establish SSP.
+         */
+        if ( opt_fred )
+        {
+            unsigned long *token =
+                (void *)stack + (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8;
+
+            wrss((unsigned long)token + 9, token);
+            asm volatile ( "rstorssp %0" : "+m" (*token) );
+            /*
+             * We need to discard the resulting Previous-SSP Token, but
+             * reset_stack_and_jump() will do that for us.
+             */
+        }
+        else
+            asm volatile ( "setssbsy" ::: "memory" );
     }
 
     reset_stack_and_jump(init_done);
-- 
2.39.5


