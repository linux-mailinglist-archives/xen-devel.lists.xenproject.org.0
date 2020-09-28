Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0D927B080
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 17:04:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMuhC-0006IL-0S; Mon, 28 Sep 2020 15:04:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMuhA-0006IG-KD
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 15:04:04 +0000
X-Inumbo-ID: 2be7f9bb-072e-4934-aeb1-b4485ee51b00
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2be7f9bb-072e-4934-aeb1-b4485ee51b00;
 Mon, 28 Sep 2020 15:04:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601305442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUo4DUEk3bsvbscc/27FSQKRTGz6kKuP6MnEqbPBVSI=;
 b=Dz4BabKn37pIFiEGERmEx1T392tp3G4K4XGgCPTojbJwnk0POH78ppYEGAnJScisIRHKlO
 VXbYfRXin87IZZWWmH0RB3IzBwfpQxKU6UiRVTfzjC4v7ZEJaiqYWB3C92LOOuHYCaSCk+
 oXnczY43OuA9aazmwSc7HSYMCuKEekg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB14CAD3C;
 Mon, 28 Sep 2020 15:04:02 +0000 (UTC)
Subject: [PATCH 6/5] x86/ELF: drop unnecessary volatile from asm()-s in
 elf_core_save_regs()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
Message-ID: <06b8dedb-49d9-eeb6-d56a-c7852486d22e@suse.com>
Date: Mon, 28 Sep 2020 17:04:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

There are no hidden side effects here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/include/asm-x86/x86_64/elf.h
+++ b/xen/include/asm-x86/x86_64/elf.h
@@ -37,26 +37,26 @@ typedef struct {
 static inline void elf_core_save_regs(ELF_Gregset *core_regs, 
                                       crash_xen_core_t *xen_core_regs)
 {
-    asm volatile("movq %%r15,%0" : "=m"(core_regs->r15));
-    asm volatile("movq %%r14,%0" : "=m"(core_regs->r14));
-    asm volatile("movq %%r13,%0" : "=m"(core_regs->r13));
-    asm volatile("movq %%r12,%0" : "=m"(core_regs->r12));
-    asm volatile("movq %%rbp,%0" : "=m"(core_regs->rbp));
-    asm volatile("movq %%rbx,%0" : "=m"(core_regs->rbx));
-    asm volatile("movq %%r11,%0" : "=m"(core_regs->r11));
-    asm volatile("movq %%r10,%0" : "=m"(core_regs->r10));
-    asm volatile("movq %%r9,%0" : "=m"(core_regs->r9));
-    asm volatile("movq %%r8,%0" : "=m"(core_regs->r8));
-    asm volatile("movq %%rax,%0" : "=m"(core_regs->rax));
-    asm volatile("movq %%rcx,%0" : "=m"(core_regs->rcx));
-    asm volatile("movq %%rdx,%0" : "=m"(core_regs->rdx));
-    asm volatile("movq %%rsi,%0" : "=m"(core_regs->rsi));
-    asm volatile("movq %%rdi,%0" : "=m"(core_regs->rdi));
+    asm ( "movq %%r15,%0" : "=m" (core_regs->r15) );
+    asm ( "movq %%r14,%0" : "=m" (core_regs->r14) );
+    asm ( "movq %%r13,%0" : "=m" (core_regs->r13) );
+    asm ( "movq %%r12,%0" : "=m" (core_regs->r12) );
+    asm ( "movq %%rbp,%0" : "=m" (core_regs->rbp) );
+    asm ( "movq %%rbx,%0" : "=m" (core_regs->rbx) );
+    asm ( "movq %%r11,%0" : "=m" (core_regs->r11) );
+    asm ( "movq %%r10,%0" : "=m" (core_regs->r10) );
+    asm ( "movq %%r9,%0" : "=m" (core_regs->r9) );
+    asm ( "movq %%r8,%0" : "=m" (core_regs->r8) );
+    asm ( "movq %%rax,%0" : "=m" (core_regs->rax) );
+    asm ( "movq %%rcx,%0" : "=m" (core_regs->rcx) );
+    asm ( "movq %%rdx,%0" : "=m" (core_regs->rdx) );
+    asm ( "movq %%rsi,%0" : "=m" (core_regs->rsi) );
+    asm ( "movq %%rdi,%0" : "=m" (core_regs->rdi) );
     /* orig_rax not filled in for now */
     asm ( "call 0f; 0: popq %0" : "=m" (core_regs->rip) );
     core_regs->cs = read_sreg(cs);
-    asm volatile("pushfq; popq %0" :"=m"(core_regs->rflags));
-    asm volatile("movq %%rsp,%0" : "=m"(core_regs->rsp));
+    asm ( "pushfq; popq %0" : "=m" (core_regs->rflags) );
+    asm ( "movq %%rsp,%0" : "=m" (core_regs->rsp) );
     core_regs->ss = read_sreg(ss);
     rdmsrl(MSR_FS_BASE, core_regs->thread_fs);
     rdmsrl(MSR_GS_BASE, core_regs->thread_gs);


