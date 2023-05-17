Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7894C70864E
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 19:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535914.834821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzh05-00062k-4H; Thu, 18 May 2023 17:01:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535914.834821; Thu, 18 May 2023 17:01:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzh05-0005zP-1R; Thu, 18 May 2023 17:01:13 +0000
Received: by outflank-mailman (input) for mailman id 535914;
 Wed, 17 May 2023 12:47:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5JRk=BG=linux.microsoft.com=madvenka@srs-se1.protection.inumbo.net>)
 id 1pzGYw-0007bO-IN
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 12:47:26 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f8f14aac-f4b0-11ed-b229-6b7b168915f2;
 Wed, 17 May 2023 14:47:25 +0200 (CEST)
Received: from [192.168.254.32] (unknown [47.186.50.133])
 by linux.microsoft.com (Postfix) with ESMTPSA id D164820F069A;
 Wed, 17 May 2023 05:47:21 -0700 (PDT)
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
X-Inumbo-ID: f8f14aac-f4b0-11ed-b229-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D164820F069A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1684327643;
	bh=LhIkPpJhPvIClwJ39pJZmrIh6zoXx6jE68xfB8W+VWs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mumhyWRm4PGisYlV+6k79BLPaamhkccyeiIlh7D48PRTzPjbzjxh2vVIF5IMgB/kg
	 ffvKm60yYk2+lOntvrropzUTEW8F4BOwI+8ppjyBg+mNGMVj/ubDGGKoWDypVfUwG4
	 iLdY81ZYifmsEzXVwEDBYtRVqeqDXr8NLjfUncbw=
Message-ID: <e8fcc1b8-6c0f-9556-a110-bd994d3fe3c6@linux.microsoft.com>
Date: Wed, 17 May 2023 07:47:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 3/9] virt: Implement Heki common code
To: Wei Liu <wei.liu@kernel.org>, =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?=
 <mic@digikod.net>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>,
 James Morris <jamorris@linux.microsoft.com>,
 John Andersen <john.s.andersen@intel.com>, Liran Alon
 <liran.alon@oracle.com>, Marian Rotariu <marian.c.rotariu@gmail.com>,
 =?UTF-8?Q?Mihai_Don=c8=9bu?= <mdontu@bitdefender.com>,
 =?UTF-8?B?TmljdciZb3IgQ8OuyJt1?= <nicu.citu@icloud.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Thara Gopinath <tgopinath@microsoft.com>, Will Deacon <will@kernel.org>,
 Zahra Tarkhani <ztarkhani@microsoft.com>,
 =?UTF-8?Q?=c8=98tefan_=c8=98icleru?= <ssicleru@bitdefender.com>,
 dev@lists.cloudhypervisor.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 x86@kernel.org, xen-devel@lists.xenproject.org
References: <20230505152046.6575-1-mic@digikod.net>
 <20230505152046.6575-4-mic@digikod.net>
 <ZFkxhWhjyIzrPkt8@liuwe-devbox-debian-v2>
Content-Language: en-US
From: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
In-Reply-To: <ZFkxhWhjyIzrPkt8@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sorry for the delay. See inline...

On 5/8/23 12:29, Wei Liu wrote:
> On Fri, May 05, 2023 at 05:20:40PM +0200, Mickaël Salaün wrote:
>> From: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
>>
>> Hypervisor Enforced Kernel Integrity (Heki) is a feature that will use
>> the hypervisor to enhance guest virtual machine security.
>>
>> Configuration
>> =============
>>
>> Define the config variables for the feature. This feature depends on
>> support from the architecture as well as the hypervisor.
>>
>> Enabling HEKI
>> =============
>>
>> Define a kernel command line parameter "heki" to turn the feature on or
>> off. By default, Heki is on.
> 
> For such a newfangled feature can we have it off by default? Especially
> when there are unsolved issues around dynamically loaded code.
> 

Yes. We can certainly do that.

>>
> [...]
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index 3604074a878b..5cf5a7a97811 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -297,6 +297,7 @@ config X86
>>  	select FUNCTION_ALIGNMENT_4B
>>  	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>>  	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>> +	select ARCH_SUPPORTS_HEKI		if X86_64
> 
> Why is there a restriction on X86_64?
> 

We want to get the PoC working and reviewed on X64 first. We have tested this only on X64 so far.

>>  
>>  config INSTRUCTION_DECODER
>>  	def_bool y
>> diff --git a/arch/x86/include/asm/sections.h b/arch/x86/include/asm/sections.h
>> index a6e8373a5170..42ef1e33b8a5 100644
>> --- a/arch/x86/include/asm/sections.h
>> +++ b/arch/x86/include/asm/sections.h
> [...]
>>  
>> +#ifdef CONFIG_HEKI
>> +
>> +/*
>> + * Gather all of the statically defined sections so heki_late_init() can
>> + * protect these sections in the host page table.
>> + *
>> + * The sections are defined under "SECTIONS" in vmlinux.lds.S
>> + * Keep this array in sync with SECTIONS.
>> + */
> 
> This seems a bit fragile, because it requires constant attention from
> people who care about this functionality. Can this table be
> automatically generated?
> 

We realize that. But I don't know of a way this can be automatically generated. Also, the permissions for
each section is specific to the use of that section. The developer who introduces a new section is the
one who will know what the permissions should be.

If any one has any ideas of how we can generate this table automatically or even just add a build time check
of some sort, please let us know.

Thanks.

Madhavan

> Thanks,
> Wei.
> 
>> +struct heki_va_range __initdata heki_va_ranges[] = {
>> +	{
>> +		.va_start = _stext,
>> +		.va_end = _etext,
>> +		.attributes = HEKI_ATTR_MEM_NOWRITE | HEKI_ATTR_MEM_EXEC,
>> +	},
>> +	{
>> +		.va_start = __start_rodata,
>> +		.va_end = __end_rodata,
>> +		.attributes = HEKI_ATTR_MEM_NOWRITE,
>> +	},
>> +#ifdef CONFIG_UNWINDER_ORC
>> +	{
>> +		.va_start = __start_orc_unwind_ip,
>> +		.va_end = __stop_orc_unwind_ip,
>> +		.attributes = HEKI_ATTR_MEM_NOWRITE,
>> +	},
>> +	{
>> +		.va_start = __start_orc_unwind,
>> +		.va_end = __stop_orc_unwind,
>> +		.attributes = HEKI_ATTR_MEM_NOWRITE,
>> +	},
>> +	{
>> +		.va_start = orc_lookup,
>> +		.va_end = orc_lookup_end,
>> +		.attributes = HEKI_ATTR_MEM_NOWRITE,
>> +	},
>> +#endif /* CONFIG_UNWINDER_ORC */
>> +};
>> +

