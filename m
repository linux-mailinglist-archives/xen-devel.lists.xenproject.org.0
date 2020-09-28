Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2427B114
	for <lists+xen-devel@lfdr.de>; Mon, 28 Sep 2020 17:41:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMvGl-0001b0-7A; Mon, 28 Sep 2020 15:40:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qi+E=DF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kMvGk-0001av-36
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2020 15:40:50 +0000
X-Inumbo-ID: 034fb5a9-e157-44f3-b127-26d07995c2bb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 034fb5a9-e157-44f3-b127-26d07995c2bb;
 Mon, 28 Sep 2020 15:40:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601307647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8k00dyy90cnElDeKCGRU7w+1tk+Sb5qx3fO7N/RDIl8=;
 b=D3tAE5mu77WAjU0eRyy3Hza1J/LzfkpYpbSOMXv3jILoqYgC/dhKRqiNClM6ZBWiRvtCld
 3xuQvVZEe3HsMQvcYnABnx+uaI+uWNAKyI5CIjusscFIRFMMH2jFF6BbeYwuTHCk3zFyzG
 6ZxXfyUDrI3FL8jaSFCi2RdjQxG1sJg=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE553ADA8;
 Mon, 28 Sep 2020 15:40:47 +0000 (UTC)
Subject: Re: [PATCH 6/5] x86/ELF: drop unnecessary volatile from asm()-s in
 elf_core_save_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ec4b451e-2b93-8526-ef98-7a2d502e31c2@suse.com>
 <06b8dedb-49d9-eeb6-d56a-c7852486d22e@suse.com>
 <d8d88d50-13a3-b415-2cfa-3064fbf4c5bd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a7d8f8b-72bf-4d3d-e273-588b656ce23a@suse.com>
Date: Mon, 28 Sep 2020 17:40:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d8d88d50-13a3-b415-2cfa-3064fbf4c5bd@citrix.com>
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

On 28.09.2020 17:15, Andrew Cooper wrote:
> On 28/09/2020 16:04, Jan Beulich wrote:
>> There are no hidden side effects here.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: New.
>>
>> --- a/xen/include/asm-x86/x86_64/elf.h
>> +++ b/xen/include/asm-x86/x86_64/elf.h
>> @@ -37,26 +37,26 @@ typedef struct {
>>  static inline void elf_core_save_regs(ELF_Gregset *core_regs, 
>>                                        crash_xen_core_t *xen_core_regs)
>>  {
>> -    asm volatile("movq %%r15,%0" : "=m"(core_regs->r15));
>> -    asm volatile("movq %%r14,%0" : "=m"(core_regs->r14));
>> -    asm volatile("movq %%r13,%0" : "=m"(core_regs->r13));
>> -    asm volatile("movq %%r12,%0" : "=m"(core_regs->r12));
>> -    asm volatile("movq %%rbp,%0" : "=m"(core_regs->rbp));
>> -    asm volatile("movq %%rbx,%0" : "=m"(core_regs->rbx));
>> -    asm volatile("movq %%r11,%0" : "=m"(core_regs->r11));
>> -    asm volatile("movq %%r10,%0" : "=m"(core_regs->r10));
>> -    asm volatile("movq %%r9,%0" : "=m"(core_regs->r9));
>> -    asm volatile("movq %%r8,%0" : "=m"(core_regs->r8));
>> -    asm volatile("movq %%rax,%0" : "=m"(core_regs->rax));
>> -    asm volatile("movq %%rcx,%0" : "=m"(core_regs->rcx));
>> -    asm volatile("movq %%rdx,%0" : "=m"(core_regs->rdx));
>> -    asm volatile("movq %%rsi,%0" : "=m"(core_regs->rsi));
>> -    asm volatile("movq %%rdi,%0" : "=m"(core_regs->rdi));
>> +    asm ( "movq %%r15,%0" : "=m" (core_regs->r15) );
>> +    asm ( "movq %%r14,%0" : "=m" (core_regs->r14) );
>> +    asm ( "movq %%r13,%0" : "=m" (core_regs->r13) );
>> +    asm ( "movq %%r12,%0" : "=m" (core_regs->r12) );
>> +    asm ( "movq %%rbp,%0" : "=m" (core_regs->rbp) );
>> +    asm ( "movq %%rbx,%0" : "=m" (core_regs->rbx) );
>> +    asm ( "movq %%r11,%0" : "=m" (core_regs->r11) );
>> +    asm ( "movq %%r10,%0" : "=m" (core_regs->r10) );
>> +    asm ( "movq %%r9,%0" : "=m" (core_regs->r9) );
>> +    asm ( "movq %%r8,%0" : "=m" (core_regs->r8) );
> 
> Any chance we can align these seeing as they're changing?

I wasn't really sure about this - alignment to cover for the
difference between r8 and r9 vs r10-r15 never comes out nicely,
as the padding should really be in the number part of the
names. I'd prefer to leave it as is, while ...

> What about spaces before %0 ?

... I certainly will add these (as I should have noticed their
lack myself).

> Either way, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

