Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E3327AD7E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 14:07:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMrw4-0004wx-CR; Mon, 28 Sep 2020 12:07:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMrw3-0004vD-3n
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 12:07:15 +0000
X-Inumbo-ID: 08b581de-3285-44a4-b7eb-d7b24e750507
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 08b581de-3285-44a4-b7eb-d7b24e750507;
 Mon, 28 Sep 2020 12:07:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601294832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4inM3R0NfCzA5Q58fpfmc4RRtX/Qa9D0qpUJsy1JraU=;
 b=JZYqowXrB+/1bP58YnmbPgDzZKdC1G90QITO9Sy2z4LV4D2L9pHxrXfryEMnV3E2Ar/mdE
 mL6mQcLB6JbnlRErJ3OuRg90TEPmjM7EdmbaYHpKqpMmaWrkyUwKk2PXCL7A5AJ9/Pbp1k
 p++c1Oyx0FVsRcz9chaBM+tffb8lDOQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CD92BACD5;
 Mon, 28 Sep 2020 12:07:12 +0000 (UTC)
Subject: [PATCH 5/5] x86/ELF: eliminate pointless local variable from
 elf_core_save_regs()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
Message-ID: <47b0c4cf-df3b-ee07-f639-14ab6680f90f@suse.com>
Date: Mon, 28 Sep 2020 14:07:12 +0200
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

We can just as well specify the CRn structure fields directly in the
asm()s, just like done for all other ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/asm-x86/x86_64/elf.h
+++ b/xen/include/asm-x86/x86_64/elf.h
@@ -37,8 +37,6 @@ typedef struct {
 static inline void elf_core_save_regs(ELF_Gregset *core_regs, 
                                       crash_xen_core_t *xen_core_regs)
 {
-    unsigned long tmp;
-
     asm volatile("movq %%r15,%0" : "=m"(core_regs->r15));
     asm volatile("movq %%r14,%0" : "=m"(core_regs->r14));
     asm volatile("movq %%r13,%0" : "=m"(core_regs->r13));
@@ -67,17 +65,10 @@ static inline void elf_core_save_regs(EL
     core_regs->fs = read_sreg(fs);
     core_regs->gs = read_sreg(gs);
 
-    asm volatile("mov %%cr0, %0" : "=r" (tmp) : );
-    xen_core_regs->cr0 = tmp;
-
-    asm volatile("mov %%cr2, %0" : "=r" (tmp) : );
-    xen_core_regs->cr2 = tmp;
-
-    asm volatile("mov %%cr3, %0" : "=r" (tmp) : );
-    xen_core_regs->cr3 = tmp;
-
-    asm volatile("mov %%cr4, %0" : "=r" (tmp) : );
-    xen_core_regs->cr4 = tmp;
+    asm volatile("mov %%cr0, %0" : "=r" (xen_core_regs->cr0));
+    asm volatile("mov %%cr2, %0" : "=r" (xen_core_regs->cr2));
+    asm volatile("mov %%cr3, %0" : "=r" (xen_core_regs->cr3));
+    asm volatile("mov %%cr4, %0" : "=r" (xen_core_regs->cr4));
 }
 
 #endif /* __X86_64_ELF_H__ */


