Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B92F27AD7C
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:06:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMrvT-0004o7-P2; Mon, 28 Sep 2020 12:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMrvR-0004ni-Hn
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:06:37 +0000
X-Inumbo-ID: d92448d5-000e-455a-bae2-1c7c36843a38
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d92448d5-000e-455a-bae2-1c7c36843a38;
 Mon, 28 Sep 2020 12:06:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601294796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39RXtyp1xnMTiCSoxMegNOqZkefB1zrQPUzVnA3Y13o=;
 b=acGqAoPGlJrm4R5Bn8G2ty+vgAuzeYh+2GxtGp7zLzsklH+v+/lbTNBjVOeiz2VEZKFP05
 yt1aCUij2tKSs0/0MY3zY3ev1yop5K4iVUYWS08FjxCSlOGL3BXGJrB/j5ahaorDhrhosA
 v5t6y5f4ghntnOdxvMecTJ7CqpAyhSY=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A680AD11;
 Mon, 28 Sep 2020 12:06:36 +0000 (UTC)
Subject: [PATCH 3/5] x86/ELF: don't store function pointer in
 elf_core_save_regs()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
Message-ID: <8abe7016-1cd7-246e-24ef-92d92ff27ad3@suse.com>
Date: Mon, 28 Sep 2020 14:06:35 +0200
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

This keeps at least gcc 10 from generating a separate function instance
in common/kexec.o alongside the inlining of the function in its sole
caller. I also think putting the address of the actual code storing the
registers is a better indication to consumers than that of an otherwise
unreferenced function.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/x86_64/elf.h
+++ b/xen/include/asm-x86/x86_64/elf.h
@@ -54,7 +54,7 @@ static inline void elf_core_save_regs(EL
     asm volatile("movq %%rsi,%0" : "=m"(core_regs->rsi));
     asm volatile("movq %%rdi,%0" : "=m"(core_regs->rdi));
     /* orig_rax not filled in for now */
-    core_regs->rip = (unsigned long)elf_core_save_regs;
+    asm volatile("call 0f; 0: popq %0" : "=m" (core_regs->rip));
     core_regs->cs = read_sreg(cs);
     asm volatile("pushfq; popq %0" :"=m"(core_regs->rflags));
     asm volatile("movq %%rsp,%0" : "=m"(core_regs->rsp));


