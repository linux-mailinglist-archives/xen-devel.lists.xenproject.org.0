Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7721E23EB20
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 12:03:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3zDL-0007Sb-Uq; Fri, 07 Aug 2020 10:03:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQGK=BR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k3zDJ-0007SW-On
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 10:03:01 +0000
X-Inumbo-ID: dd8b9c34-a845-4da0-8d4b-fb8092e5a0dd
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd8b9c34-a845-4da0-8d4b-fb8092e5a0dd;
 Fri, 07 Aug 2020 10:03:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAF6FAB9F;
 Fri,  7 Aug 2020 10:03:17 +0000 (UTC)
Subject: Re: [PATCH v3 4/7] x86/paravirt: remove 32-bit support from
 PARAVIRT_XXL
To: peterz@infradead.org
References: <20200807083826.16794-1-jgross@suse.com>
 <20200807083826.16794-5-jgross@suse.com>
 <20200807093916.GF2674@hirez.programming.kicks-ass.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3a0712ee-efca-5684-d321-3b789e01fc16@suse.com>
Date: Fri, 7 Aug 2020 12:02:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200807093916.GF2674@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.08.20 11:39, peterz@infradead.org wrote:
> On Fri, Aug 07, 2020 at 10:38:23AM +0200, Juergen Gross wrote:
> 
>> -# else
>> -	const unsigned char	cpu_iret[1];
>> -# endif
>>   };
>>   
>>   static const struct patch_xxl patch_data_xxl = {
>> @@ -42,7 +38,6 @@ static const struct patch_xxl patch_data_xxl = {
>>   	.irq_save_fl		= { 0x9c, 0x58 },	// pushf; pop %[re]ax
>>   	.mmu_read_cr2		= { 0x0f, 0x20, 0xd0 },	// mov %cr2, %[re]ax
>>   	.mmu_read_cr3		= { 0x0f, 0x20, 0xd8 },	// mov %cr3, %[re]ax
>> -# ifdef CONFIG_X86_64
>>   	.mmu_write_cr3		= { 0x0f, 0x22, 0xdf },	// mov %rdi, %cr3
>>   	.irq_restore_fl		= { 0x57, 0x9d },	// push %rdi; popfq
>>   	.cpu_wbinvd		= { 0x0f, 0x09 },	// wbinvd
>> @@ -50,19 +45,11 @@ static const struct patch_xxl patch_data_xxl = {
>>   				    0x48, 0x0f, 0x07 },	// swapgs; sysretq
>>   	.cpu_swapgs		= { 0x0f, 0x01, 0xf8 },	// swapgs
>>   	.mov64			= { 0x48, 0x89, 0xf8 },	// mov %rdi, %rax
>> -# else
>> -	.mmu_write_cr3		= { 0x0f, 0x22, 0xd8 },	// mov %eax, %cr3
>> -	.irq_restore_fl		= { 0x50, 0x9d },	// push %eax; popf
>> -	.cpu_iret		= { 0xcf },		// iret
>> -# endif
> 
> I was looking at x86_64 paravirt the other day and found we actually
> have pv_ops.cpu.iret users there..

On x86_64 we have (without PARAVIRT_XXL):

#define INTERRUPT_RETURN        jmp native_iret

and with PARAVIRT_XXL this is basically a jmp *pv_ops.cpu.iret which
will then be patched to either jmp native_iret or jmp xen_iret.

On x86_32 INTERRUPT_RETURN was just "iret" for the non-paravirt case.
This is the reason for above dropping of the static patch data.

> So we want to change the above to also patch iret on x86_64 or do we
> need to fix x86_64 to not have pv-iret?

We want it to stay how it is. This will let both variants (PARVIRT y/n)
continue to work.


Juergen

