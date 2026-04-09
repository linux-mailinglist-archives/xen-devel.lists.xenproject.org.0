Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHJYI5GQ12kaPwgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:42:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0364C3C9C05
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 13:42:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277120.1562390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnll-0002X8-C7; Thu, 09 Apr 2026 11:41:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277120.1562390; Thu, 09 Apr 2026 11:41:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAnll-0002V5-9Y; Thu, 09 Apr 2026 11:41:57 +0000
Received: by outflank-mailman (input) for mailman id 1277120;
 Thu, 09 Apr 2026 11:41:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wAnlk-0002Uz-BA
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 11:41:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAnlj-009MBk-NJ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 13:41:55 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d79081-5cb7-0a2a0a5109dd-0a2a450bedb8-6
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:41:55 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 69d79083-bca8-0a2a450b0019-d155802ee0f7-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 13:41:55 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so11428695e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 04:41:55 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-242-105.as13285.net.
 [78.146.242.105]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cd1b2799sm71467005e9.6.2026.04.09.04.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2026 04:41:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1775734915; x=1776339715; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9KaDm/yMBIrw6CzspjElk4N8efh36OMRuJoJnnqxtrc=;
        b=YEGNt9fgH4RdkQ8uji4Uebdtd+IS5hS4yLGTRNeuQXcqBMoZPosom6lCiXRO5+mniM
         0IMCLmW3kO/whA5FR3rirIJCN9Utu1Ycze2XeaFvlPf1uVXBlXY0OgmS/lDLJ9/BxzsH
         pA2eNaSOyjdapx6CfPRZx0hxOVfIEdIHmB06s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775734915; x=1776339715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KaDm/yMBIrw6CzspjElk4N8efh36OMRuJoJnnqxtrc=;
        b=nImdkvNJq1nIGHOMQn4v5agMcnTw7URgGjzCeKVJyppzJmL5ep6ivOZVFpDD4l6WrD
         bxAr52qqzFBqtsr3UhjWNVTBG0pNcDJZWY6v61ODa2rQXoL+gvdw9LPPhlWtLL+1LXqV
         jmJ3pnFoFcgVEl+sB3lPGeLQnhj8rhFR9BEhWzRDCe5Ll7TdNOfokj7NIqHtjmC7hkfc
         fuCaac9RnLjPdSdHLLAMNV9eHjBelTmBl4ILmyRjCJ1h0mfU6Gki3xidgw7NltYNfICN
         CoIzXe98PSiJPNUx+b0k5EVWrQj/0C/TQv1tq052N3rKyDKI+plVVzocUGrQDsi4+eAi
         MlsA==
X-Gm-Message-State: AOJu0Yz/EQbsSW0VpxGOJeUl1bwQPhAFfOJTYWWOMHwNfSFJJkDMl2CF
	T3OVF7GUxQG3yPHILSiSTDRUh3aIvrhEHtQRcTBP1bkQiGpLjnnH0rYdmjAR9j0FVobVDWvAaxG
	//nV1
X-Gm-Gg: AeBDiesW+i9/a3zFdwrC/apnFLkx+K856aVjf7ETH2NWkg7TEelR3C7NCE79Kzrbfaa
	RQNvlgSvbNNFtM9ZK5Xh4vzTRWjLG9+3mwN3+4AaFOEHR5f1cPY1teTZaJfnVmdmZ/mjCeJ92tX
	jiSr3oQTDs35wSJhetXmDHZxE/nemjiQ0NlCXY4fGYlv9Nxy4Mj9+H92P6Nqy3XRBjNFM7Lfvpk
	DwAQj8VvrZyHjyzENOPMVz8ngAlWW+JQoEtrxTeUJAdeeZvc+8kVauQsrsBJmOF8GNrEo/X0Ka2
	41udaDOpG3k2NT/2QoiWxW9ReDg6jGlag+EpRCbHOib1EnTDXO6bOLtSsK5Vmv3lBdJZZDdlalq
	1wu/KYxchSZLBB5IrAoeWCxplJfKtw1wUmK8R/s+01hBs1GPvjHvavj1snISUC1HcjF3SGgrLOU
	E2jIvk2DzaM21nIiXFXqFjREtH1zMYiltstmb4GOPsFK7TMRZqr8WjW5h8mQIB1oAKHP/4jJAmC
	PQnyIKgdFM7s1g=
X-Received: by 2002:a05:600c:3546:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-488996e8774mr351215065e9.9.1775734913619;
        Thu, 09 Apr 2026 04:41:53 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v2] x86: Avoid using .byte for instructions where safe to do so
Date: Thu,  9 Apr 2026 12:41:51 +0100
Message-Id: <20260409114151.179408-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775734915-F61C72A1-54C6BD06/0/0
X-purgate-type: clean
X-purgate-size: 7378
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:dkim,citrix.com:email,citrix.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0364C3C9C05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The new toolchain baseline knows XGETBV, VPXOR and VPOR.

For the other cases using .byte, annotate the toolchain minima.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Teddy Astie <teddy.astie@vates.tech>

v2
 * CLZERO, {WR,RD}PKRU can't be named yet.

Pull out of previous series as it's somewhat unrelated.  The XSAVE cleanup has
other prerequiesites before it can move away from .byte.
---
 xen/arch/x86/arch.mk                   |  4 +++
 xen/arch/x86/include/asm/asm-defns.h   |  1 +
 xen/arch/x86/include/asm/msr.h         |  2 ++
 xen/arch/x86/include/asm/prot-key.h    |  4 +--
 xen/arch/x86/include/asm/xstate.h      |  3 +--
 xen/arch/x86/x86_emulate/0f01.c        |  2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c | 34 ++++++++++++--------------
 7 files changed, 27 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
index 0b42e6312fac..cd0602a79aaf 100644
--- a/xen/arch/x86/arch.mk
+++ b/xen/arch/x86/arch.mk
@@ -17,7 +17,11 @@ CFLAGS-$(CONFIG_CC_IS_GCC) += -malign-data=abi
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 $(call cc-option-add,CFLAGS,CC,-Wnested-externs)
 $(call as-option-add,CFLAGS,CC,".equ \"x\"$(comma)1",-DHAVE_AS_QUOTED_SYM)
+
+# Binutils >= 2.31, Clang >= 7
 $(call as-option-add,CFLAGS,CC,"movdiri %rax$(comma)(%rax)",-DHAVE_AS_MOVDIR)
+
+# Binutils >= 2.33, Clang >= 9
 $(call as-option-add,CFLAGS,CC,"enqcmd (%rax)$(comma)%rax",-DHAVE_AS_ENQCMD)
 
 # Check to see whether the assembler supports the .nop directive.
diff --git a/xen/arch/x86/include/asm/asm-defns.h b/xen/arch/x86/include/asm/asm-defns.h
index 239dc3af096c..dc9b3ce272fd 100644
--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -1,5 +1,6 @@
 #include <asm/page-bits.h>
 
+/* binutils >= 2.26 or Clang >= 3.8 */
 .macro clzero
     .byte 0x0f, 0x01, 0xfc
 .endm
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 941a7612f4ba..1377d156f4e1 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -63,6 +63,8 @@ static inline void wrmsrns(uint32_t msr, uint64_t val)
     /*
      * WRMSR is 2 bytes.  WRMSRNS is 3 bytes.  Pad WRMSR with a redundant CS
      * prefix to avoid a trailing NOP.
+     *
+     * Binutils >= 2.40, Clang >= 16
      */
     alternative_input(".byte 0x2e; wrmsr",
                       ".byte 0x0f,0x01,0xc6", X86_FEATURE_WRMSRNS,
diff --git a/xen/arch/x86/include/asm/prot-key.h b/xen/arch/x86/include/asm/prot-key.h
index 8fb15b5c32e9..e8550e0c9203 100644
--- a/xen/arch/x86/include/asm/prot-key.h
+++ b/xen/arch/x86/include/asm/prot-key.h
@@ -19,7 +19,7 @@ static inline uint32_t rdpkru(void)
 {
     uint32_t pkru;
 
-    asm volatile ( ".byte 0x0f,0x01,0xee"
+    asm volatile ( ".byte 0x0f,0x01,0xee" /* binutils >= 2.26 or Clang >= 3.8 */
                    : "=a" (pkru) : "c" (0) : "dx" );
 
     return pkru;
@@ -27,7 +27,7 @@ static inline uint32_t rdpkru(void)
 
 static inline void wrpkru(uint32_t pkru)
 {
-    asm volatile ( ".byte 0x0f,0x01,0xef"
+    asm volatile ( ".byte 0x0f,0x01,0xef" /* binutils >= 2.26 or Clang >= 3.8 */
                    :: "a" (pkru), "d" (0), "c" (0) );
 }
 
diff --git a/xen/arch/x86/include/asm/xstate.h b/xen/arch/x86/include/asm/xstate.h
index c96d75e38b25..0519379edb57 100644
--- a/xen/arch/x86/include/asm/xstate.h
+++ b/xen/arch/x86/include/asm/xstate.h
@@ -118,8 +118,7 @@ static inline uint64_t xgetbv(unsigned int index)
     uint32_t lo, hi;
 
     ASSERT(index); /* get_xcr0() should be used instead. */
-    asm volatile ( ".byte 0x0f,0x01,0xd0" /* xgetbv */
-                   : "=a" (lo), "=d" (hi) : "c" (index) );
+    asm volatile ( "xgetbv" : "=a" (lo), "=d" (hi) : "c" (index) );
 
     return lo | ((uint64_t)hi << 32);
 }
diff --git a/xen/arch/x86/x86_emulate/0f01.c b/xen/arch/x86/x86_emulate/0f01.c
index 4d36c7d289a5..87d338f0c74a 100644
--- a/xen/arch/x86/x86_emulate/0f01.c
+++ b/xen/arch/x86/x86_emulate/0f01.c
@@ -122,7 +122,7 @@ int x86emul_0f01(struct x86_emulate_state *s,
         {
         case vex_none: /* serialize */
             host_and_vcpu_must_have(serialize);
-            asm volatile ( ".byte 0x0f, 0x01, 0xe8" );
+            asm volatile ( ".byte 0x0f, 0x01, 0xe8" ); /* Binutils >= 2.34, Clang >= 11 */
             break;
         case vex_f2: /* xsusldtrk */
             vcpu_must_have(tsxldtrk);
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index 11d145e17723..e58735ee9590 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -4748,27 +4748,25 @@ x86_emulate(
                  */
                 if ( vex.l )
                 {
-                    /* vpxor %xmmN, %xmmN, %xmmN */
-                    asm volatile ( ".byte 0xc5,0xf9,0xef,0xc0" );
-                    asm volatile ( ".byte 0xc5,0xf1,0xef,0xc9" );
-                    asm volatile ( ".byte 0xc5,0xe9,0xef,0xd2" );
-                    asm volatile ( ".byte 0xc5,0xe1,0xef,0xdb" );
-                    asm volatile ( ".byte 0xc5,0xd9,0xef,0xe4" );
-                    asm volatile ( ".byte 0xc5,0xd1,0xef,0xed" );
-                    asm volatile ( ".byte 0xc5,0xc9,0xef,0xf6" );
-                    asm volatile ( ".byte 0xc5,0xc1,0xef,0xff" );
+                    asm volatile ( "vpxor %xmm0, %xmm0, %xmm0" );
+                    asm volatile ( "vpxor %xmm1, %xmm1, %xmm1" );
+                    asm volatile ( "vpxor %xmm2, %xmm2, %xmm2" );
+                    asm volatile ( "vpxor %xmm3, %xmm3, %xmm3" );
+                    asm volatile ( "vpxor %xmm4, %xmm4, %xmm4" );
+                    asm volatile ( "vpxor %xmm5, %xmm5, %xmm5" );
+                    asm volatile ( "vpxor %xmm6, %xmm6, %xmm6" );
+                    asm volatile ( "vpxor %xmm7, %xmm7, %xmm7" );
                 }
                 else
                 {
-                    /* vpor %xmmN, %xmmN, %xmmN */
-                    asm volatile ( ".byte 0xc5,0xf9,0xeb,0xc0" );
-                    asm volatile ( ".byte 0xc5,0xf1,0xeb,0xc9" );
-                    asm volatile ( ".byte 0xc5,0xe9,0xeb,0xd2" );
-                    asm volatile ( ".byte 0xc5,0xe1,0xeb,0xdb" );
-                    asm volatile ( ".byte 0xc5,0xd9,0xeb,0xe4" );
-                    asm volatile ( ".byte 0xc5,0xd1,0xeb,0xed" );
-                    asm volatile ( ".byte 0xc5,0xc9,0xeb,0xf6" );
-                    asm volatile ( ".byte 0xc5,0xc1,0xeb,0xff" );
+                    asm volatile ( "vpor %xmm0, %xmm0, %xmm0" );
+                    asm volatile ( "vpor %xmm1, %xmm1, %xmm1" );
+                    asm volatile ( "vpor %xmm2, %xmm2, %xmm2" );
+                    asm volatile ( "vpor %xmm3, %xmm3, %xmm3" );
+                    asm volatile ( "vpor %xmm4, %xmm4, %xmm4" );
+                    asm volatile ( "vpor %xmm5, %xmm5, %xmm5" );
+                    asm volatile ( "vpor %xmm6, %xmm6, %xmm6" );
+                    asm volatile ( "vpor %xmm7, %xmm7, %xmm7" );
                 }
 
                 ASSERT(!state->simd_size);
-- 
2.39.5


