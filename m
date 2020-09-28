Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA6B27AD7A
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:06:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMrur-0004hv-FS; Mon, 28 Sep 2020 12:06:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMruq-0004hZ-2g
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:06:00 +0000
X-Inumbo-ID: eb873d6d-bbf2-4f59-835f-4085c5d4113e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eb873d6d-bbf2-4f59-835f-4085c5d4113e;
 Mon, 28 Sep 2020 12:05:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601294758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u5ow4pZ7eeUG6oXiFYbm6DR8f6xhKFmqDHIo8zuzbmU=;
 b=POcM85f/FhzTVbM6qJ9WOrssFznTm54J/9eMbj27D109GwdsEgPV9aEcV0kldG4gKh37z7
 sUdEoVV9ylU67s85HgjZUkRZcmw6D2Y8lauDBZrhypLPG9y4UD19JO4Fh9cd2NNX1Pc/+t
 JKCEMppNfqEa1YxcaclT1I7ncMqbIt8=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97CB9AD11;
 Mon, 28 Sep 2020 12:05:58 +0000 (UTC)
Subject: [PATCH 2/5] x86/ELF: don't open-code read_sreg()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
Message-ID: <e15d4ed7-4a42-33ac-79ed-171851548a1b@suse.com>
Date: Mon, 28 Sep 2020 14:05:58 +0200
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

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/x86_64/elf.h
+++ b/xen/include/asm-x86/x86_64/elf.h
@@ -1,6 +1,8 @@
 #ifndef __X86_64_ELF_H__
 #define __X86_64_ELF_H__
 
+#include <asm/regs.h>
+
 typedef struct {
     unsigned long r15;
     unsigned long r14;
@@ -53,16 +55,16 @@ static inline void elf_core_save_regs(EL
     asm volatile("movq %%rdi,%0" : "=m"(core_regs->rdi));
     /* orig_rax not filled in for now */
     core_regs->rip = (unsigned long)elf_core_save_regs;
-    asm volatile("movl %%cs, %%eax;" :"=a"(core_regs->cs));
+    core_regs->cs = read_sreg(cs);
     asm volatile("pushfq; popq %0" :"=m"(core_regs->rflags));
     asm volatile("movq %%rsp,%0" : "=m"(core_regs->rsp));
     asm volatile("movl %%ss, %%eax;" :"=a"(core_regs->ss));
     /* thread_fs not filled in for now */
     /* thread_gs not filled in for now */
-    asm volatile("movl %%ds, %%eax;" :"=a"(core_regs->ds));
-    asm volatile("movl %%es, %%eax;" :"=a"(core_regs->es));
-    asm volatile("movl %%fs, %%eax;" :"=a"(core_regs->fs));
-    asm volatile("movl %%gs, %%eax;" :"=a"(core_regs->gs));
+    core_regs->ds = read_sreg(ds);
+    core_regs->es = read_sreg(es);
+    core_regs->fs = read_sreg(fs);
+    core_regs->gs = read_sreg(gs);
 
     asm volatile("mov %%cr0, %0" : "=r" (tmp) : );
     xen_core_regs->cr0 = tmp;

