Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F44392E04
	for <lists+xen-devel@lfdr.de>; Thu, 27 May 2021 14:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.133101.248186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFBL-0004Mf-6i; Thu, 27 May 2021 12:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 133101.248186; Thu, 27 May 2021 12:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lmFBL-0004Kq-2Z; Thu, 27 May 2021 12:32:11 +0000
Received: by outflank-mailman (input) for mailman id 133101;
 Thu, 27 May 2021 12:32:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HjtO=KW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lmFBK-0004Ka-9F
 for xen-devel@lists.xenproject.org; Thu, 27 May 2021 12:32:10 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52219094-a289-4d72-8109-0927f6bf7cb5;
 Thu, 27 May 2021 12:32:09 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C6801FD2E;
 Thu, 27 May 2021 12:32:08 +0000 (UTC)
Received: from director2.suse.de (director2.suse-dmz.suse.de [192.168.254.72])
 by imap.suse.de (Postfix) with ESMTPSA id 4FDF911A98;
 Thu, 27 May 2021 12:32:08 +0000 (UTC)
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
X-Inumbo-ID: 52219094-a289-4d72-8109-0927f6bf7cb5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622118728; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DqA5J7pXICS+Sn1QhqjKtNkkQJN6ELi2AF/cQu5/0QU=;
	b=F+U4y9zJy9LtFGcmwvmfuiJyCOs9OMaGG9NNoJOAP/eVamVH4GC9ohTVPXDVaPxKbuU4nD
	F4RlAGdhLjOo1YBWLKhrlxUPHuhKokFRpH9VuOsd6VWo0E2BmyJBEj3l9Tjz3JggZd9Mlk
	Hcm9yh4ILFLbotmGxP/uPJwB+bIQL+w=
Subject: [PATCH v2 05/12] x86: introduce "hot" and "cold" page clearing
 functions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Message-ID: <33d79032-d598-2a7c-f361-6d765fd6a54b@suse.com>
Date: Thu, 27 May 2021 14:32:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The present clear_page_sse2() is useful in case a page isn't going to
get touched again soon, or if we want to limit churn on the caches.
Amend it by alternatively using CLZERO, which has been found to be quite
a bit faster on Zen2 hardware at least. Note that to use CLZERO, we need
to know the cache line size, and hence a feature dependency on CLFLUSH
gets introduced.

For cases where latency is the most important aspect, or when it is
expected that sufficiently large parts of a page will get accessed again
soon after the clearing, introduce a "hot" alternative. Again use
alternatives patching to select between a "legacy" and an ERMS variant.

Don't switch any callers just yet - this will be the subject of
subsequent changes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.
---
Note: Ankur indicates that for ~L3-size or larger regions MOVNT/CLZERO
      is better even latency-wise.

--- a/xen/arch/x86/clear_page.S
+++ b/xen/arch/x86/clear_page.S
@@ -1,8 +1,9 @@
         .file __FILE__
 
-#include <asm/page.h>
+#include <asm/asm_defns.h>
+#include <xen/page-size.h>
 
-ENTRY(clear_page_sse2)
+        .macro clear_page_sse2
         mov     $PAGE_SIZE/32, %ecx
         xor     %eax,%eax
 
@@ -16,3 +17,45 @@ ENTRY(clear_page_sse2)
 
         sfence
         ret
+        .endm
+
+        .macro clear_page_clzero
+        mov     %rdi, %rax
+        mov     $PAGE_SIZE/64, %ecx
+        .globl clear_page_clzero_post_count
+clear_page_clzero_post_count:
+
+0:      clzero
+        sub     $-64, %rax
+        .globl clear_page_clzero_post_neg_size
+clear_page_clzero_post_neg_size:
+        sub     $1, %ecx
+        jnz     0b
+
+        sfence
+        ret
+        .endm
+
+ENTRY(clear_page_cold)
+        ALTERNATIVE clear_page_sse2, clear_page_clzero, X86_FEATURE_CLZERO
+        .type clear_page_cold, @function
+        .size clear_page_cold, . - clear_page_cold
+
+        .macro clear_page_stosb
+        mov     $PAGE_SIZE, %ecx
+        xor     %eax,%eax
+        rep stosb
+        ret
+        .endm
+
+        .macro clear_page_stosq
+        mov     $PAGE_SIZE/8, %ecx
+        xor     %eax, %eax
+        rep stosq
+        ret
+        .endm
+
+ENTRY(clear_page_hot)
+        ALTERNATIVE clear_page_stosq, clear_page_stosb, X86_FEATURE_ERMS
+        .type clear_page_hot, @function
+        .size clear_page_hot, . - clear_page_hot
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -56,6 +56,9 @@ static unsigned int forced_caps[NCAPINTS
 
 DEFINE_PER_CPU(bool, full_gdt_loaded);
 
+extern uint32_t clear_page_clzero_post_count[];
+extern int8_t clear_page_clzero_post_neg_size[];
+
 void __init setup_clear_cpu_cap(unsigned int cap)
 {
 	const uint32_t *dfs;
@@ -331,8 +334,38 @@ void __init early_cpu_init(void)
 
 	edx &= ~cleared_caps[cpufeat_word(X86_FEATURE_FPU)];
 	ecx &= ~cleared_caps[cpufeat_word(X86_FEATURE_SSE3)];
-	if (edx & cpufeat_mask(X86_FEATURE_CLFLUSH))
-		c->x86_cache_alignment = ((ebx >> 8) & 0xff) * 8;
+	if (edx & cpufeat_mask(X86_FEATURE_CLFLUSH)) {
+		unsigned int size = ((ebx >> 8) & 0xff) * 8;
+
+		c->x86_cache_alignment = size;
+
+		/*
+		 * Patch in parameters of clear_page_cold()'s CLZERO
+		 * alternative. Note that for now we cap this at 128 bytes.
+		 * Larger cache line sizes would still be dealt with
+		 * correctly, but would cause redundant work done.
+		 */
+		if (size > 128)
+			size = 128;
+		if (size && !(size & (size - 1))) {
+			/*
+			 * Need to play some games to keep the compiler from
+			 * recognizing the negative array index as being out
+			 * of bounds. The labels in assembler code really are
+			 * _after_ the locations to be patched, so the
+			 * negative index is intentional.
+			 */
+			uint32_t *pcount = clear_page_clzero_post_count;
+			int8_t *neg_size = clear_page_clzero_post_neg_size;
+
+			OPTIMIZER_HIDE_VAR(pcount);
+			OPTIMIZER_HIDE_VAR(neg_size);
+			pcount[-1] = PAGE_SIZE / size;
+			neg_size[-1] = -size;
+		}
+		else
+			setup_clear_cpu_cap(X86_FEATURE_CLZERO);
+	}
 	/* Leaf 0x1 capabilities filled in early for Xen. */
 	c->x86_capability[cpufeat_word(X86_FEATURE_FPU)] = edx;
 	c->x86_capability[cpufeat_word(X86_FEATURE_SSE3)] = ecx;
--- a/xen/include/asm-x86/asm-defns.h
+++ b/xen/include/asm-x86/asm-defns.h
@@ -20,6 +20,10 @@
     .byte 0x0f, 0x01, 0xdd
 .endm
 
+.macro clzero
+    .byte 0x0f, 0x01, 0xfc
+.endm
+
 .macro INDIRECT_BRANCH insn:req arg:req
 /*
  * Create an indirect branch.  insn is one of call/jmp, arg is a single
--- a/xen/include/asm-x86/page.h
+++ b/xen/include/asm-x86/page.h
@@ -232,10 +232,11 @@ typedef struct { u64 pfn; } pagetable_t;
 #define pagetable_from_paddr(p) pagetable_from_pfn((p)>>PAGE_SHIFT)
 #define pagetable_null()        pagetable_from_pfn(0)
 
-void clear_page_sse2(void *);
+void clear_page_hot(void *);
+void clear_page_cold(void *);
 void copy_page_sse2(void *, const void *);
 
-#define clear_page(_p)      clear_page_sse2(_p)
+#define clear_page(_p)      clear_page_cold(_p)
 #define copy_page(_t, _f)   copy_page_sse2(_t, _f)
 
 /* Convert between Xen-heap virtual addresses and machine addresses. */
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -182,6 +182,10 @@ def crunch_numbers(state):
         # the first place.
         APIC: [X2APIC, TSC_DEADLINE, EXTAPIC],
 
+        # The CLZERO insn requires a means to determine the cache line size,
+        # which is tied to the CLFLUSH insn.
+        CLFLUSH: [CLZERO],
+
         # AMD built MMXExtentions and 3DNow as extentions to MMX.
         MMX: [MMXEXT, _3DNOW],
 


