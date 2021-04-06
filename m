Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BCB35505A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 11:52:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105745.202255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTiNh-0005dz-FM; Tue, 06 Apr 2021 09:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105745.202255; Tue, 06 Apr 2021 09:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTiNh-0005dZ-Bh; Tue, 06 Apr 2021 09:52:21 +0000
Received: by outflank-mailman (input) for mailman id 105745;
 Tue, 06 Apr 2021 09:52:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vt1H=JD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lTiNg-0005dJ-12
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 09:52:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e6ae3ea-f623-42b8-8477-93b2dc0387b8;
 Tue, 06 Apr 2021 09:52:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D190B12A;
 Tue,  6 Apr 2021 09:52:18 +0000 (UTC)
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
X-Inumbo-ID: 6e6ae3ea-f623-42b8-8477-93b2dc0387b8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617702738; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NDzO4YMW0UmO2XNf+QEIEAJwv6NwHHygQyBCqYoj37Q=;
	b=Olx1hCPB1eNN62PkjcMr1C5XEy96HgbJQ28VInhfx78+WvyxCSFmkIubjDM0qVLJmdHgcK
	NKV610l8ViRGDv2zSqUq2w73tcPsA564nESyL+g/dCSzgawyF0tb9Gjko8oosG9AHPLUZ0
	BDxi2nNwsXdOvIsGiI8bxGciuwa+Dm0=
Subject: Re: [PATCH 5/5] x86: don't build unused entry code when !PV32
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
 <YGXSU9lGZpidz9wb@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <47137b21-c146-89d1-1996-28d64575ddc4@suse.com>
Date: Tue, 6 Apr 2021 11:52:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YGXSU9lGZpidz9wb@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.04.2021 16:01, Roger Pau Monné wrote:
> On Wed, Nov 25, 2020 at 09:51:33AM +0100, Jan Beulich wrote:
>> Except for the initial part of cstar_enter compat/entry.S is all dead
>> code in this case. Further, along the lines of the PV conditionals we
>> already have in entry.S, make code PV32-conditional there too (to a
>> fair part because this code actually references compat/entry.S).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> TBD: I'm on the fence of whether (in a separate patch) to also make
>>      conditional struct pv_domain's is_32bit field.
>>
>> --- a/xen/arch/x86/x86_64/asm-offsets.c
>> +++ b/xen/arch/x86/x86_64/asm-offsets.c
>> @@ -9,7 +9,7 @@
>>  #include <xen/perfc.h>
>>  #endif
>>  #include <xen/sched.h>
>> -#ifdef CONFIG_PV
>> +#ifdef CONFIG_PV32
>>  #include <compat/xen.h>
>>  #endif
>>  #include <asm/hardirq.h>
>> @@ -102,19 +102,21 @@ void __dummy__(void)
>>      BLANK();
>>  #endif
>>  
>> -#ifdef CONFIG_PV
>> +#ifdef CONFIG_PV32
>>      OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
>>      BLANK();
>>  
>> -    OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
>> -    OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
>> -    BLANK();
>> -
>>      OFFSET(COMPAT_VCPUINFO_upcall_pending, struct compat_vcpu_info, evtchn_upcall_pending);
>>      OFFSET(COMPAT_VCPUINFO_upcall_mask, struct compat_vcpu_info, evtchn_upcall_mask);
>>      BLANK();
>>  #endif
>>  
>> +#ifdef CONFIG_PV
>> +    OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
>> +    OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
>> +    BLANK();
>> +#endif
>> +
>>      OFFSET(CPUINFO_guest_cpu_user_regs, struct cpu_info, guest_cpu_user_regs);
>>      OFFSET(CPUINFO_verw_sel, struct cpu_info, verw_sel);
>>      OFFSET(CPUINFO_current_vcpu, struct cpu_info, current_vcpu);
>> --- a/xen/arch/x86/x86_64/compat/entry.S
>> +++ b/xen/arch/x86/x86_64/compat/entry.S
>> @@ -29,8 +29,6 @@ ENTRY(entry_int82)
>>          mov   %rsp, %rdi
>>          call  do_entry_int82
>>  
>> -#endif /* CONFIG_PV32 */
>> -
>>  /* %rbx: struct vcpu */
>>  ENTRY(compat_test_all_events)
>>          ASSERT_NOT_IN_ATOMIC
>> @@ -197,6 +195,8 @@ ENTRY(cr4_pv32_restore)
>>          xor   %eax, %eax
>>          ret
>>  
>> +#endif /* CONFIG_PV32 */
>> +
>>          .section .text.entry, "ax", @progbits
>>  
>>  /* See lstar_enter for entry register state. */
>> @@ -230,6 +230,13 @@ ENTRY(cstar_enter)
>>          sti
>>  
>>          movq  STACK_CPUINFO_FIELD(current_vcpu)(%rbx), %rbx
>> +
>> +#ifndef CONFIG_PV32
>> +
>> +        jmp   switch_to_kernel
>> +
>> +#else
>> +
>>          movq  VCPU_domain(%rbx),%rcx
>>          cmpb  $0,DOMAIN_is_32bit_pv(%rcx)
>>          je    switch_to_kernel
>> @@ -393,3 +400,5 @@ compat_crash_page_fault:
>>          jmp   .Lft14
>>  .previous
>>          _ASM_EXTABLE(.Lft14, .Lfx14)
>> +
>> +#endif /* CONFIG_PV32 */
> 
> Seeing this chunk, would it make sense to move the cstar_enter part
> relevant to !is_32bit_pv into the common entry.S and leave the rest
> here as compat_cstar_enter or some such?
> 
> AFAICT we only need a tiny part of the compat stuff when !CONFIG_PV32,
> so I think we could make the hole compat/entry.S depend on
> CONFIG_PV32.

While it grows the patch, doing things this way looks to work out
nicely. v2 in the works (making in fact compat/ as a whole build
only when PV32, as it's really only the one object file that gets
built there) ...

Jan

