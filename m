Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 026B2714DCA
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 18:05:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540661.842562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3fLT-0000OT-6j; Mon, 29 May 2023 16:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540661.842562; Mon, 29 May 2023 16:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3fLT-0000M0-3v; Mon, 29 May 2023 16:03:43 +0000
Received: by outflank-mailman (input) for mailman id 540661;
 Mon, 29 May 2023 16:03:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zYLD=BS=digikod.net=mic@srs-se1.protection.inumbo.net>)
 id 1q3fLR-0000Lu-5e
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 16:03:41 +0000
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch
 [2001:1600:3:17::bc09])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e2aa35c-fe3a-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 18:03:36 +0200 (CEST)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [10.4.36.107])
 by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4QVL131MNPzMqYfG;
 Mon, 29 May 2023 18:03:35 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4QVL0w4znNz3vb2; Mon, 29 May 2023 18:03:28 +0200 (CEST)
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
X-Inumbo-ID: 5e2aa35c-fe3a-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=digikod.net;
	s=20191114; t=1685376215;
	bh=n6vDyeLcnXuJ2e1Kx1oy6dfLDQBfFmEzNL/ERVZDqQU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kQUNssi6VBi8KE2R5ANm9fpqaLV9V+BO/pl/pZOb+r07FAQvClXzKkx8C9t2Hytji
	 /4n7ba89FjY/Zfl8t2rhFg1o9pE4iawj/J1DIhc82vGXeZvlW/Z9zID2JwoJwYww3/
	 p8LCe3PI5P3tfO/+Mau3UxTlSDY6CLpnXs/pesiA=
Message-ID: <90ca1173-4ec1-099f-5744-3d6dc29d919d@digikod.net>
Date: Mon, 29 May 2023 18:03:28 +0200
MIME-Version: 1.0
User-Agent:
Subject: Re: [PATCH v1 3/9] virt: Implement Heki common code
Content-Language: en-US
To: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>,
 Wei Liu <wei.liu@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Kees Cook <keescook@chromium.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>,
 Alexander Graf <graf@amazon.com>, Forrest Yuan Yu <yuanyu@google.com>,
 James Morris <jamorris@linux.microsoft.com>,
 John Andersen <john.s.andersen@intel.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>,
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
 <e8fcc1b8-6c0f-9556-a110-bd994d3fe3c6@linux.microsoft.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
In-Reply-To: <e8fcc1b8-6c0f-9556-a110-bd994d3fe3c6@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha


On 17/05/2023 14:47, Madhavan T. Venkataraman wrote:
> Sorry for the delay. See inline...
> 
> On 5/8/23 12:29, Wei Liu wrote:
>> On Fri, May 05, 2023 at 05:20:40PM +0200, Mickaël Salaün wrote:
>>> From: Madhavan T. Venkataraman <madvenka@linux.microsoft.com>
>>>
>>> Hypervisor Enforced Kernel Integrity (Heki) is a feature that will use
>>> the hypervisor to enhance guest virtual machine security.
>>>
>>> Configuration
>>> =============
>>>
>>> Define the config variables for the feature. This feature depends on
>>> support from the architecture as well as the hypervisor.
>>>
>>> Enabling HEKI
>>> =============
>>>
>>> Define a kernel command line parameter "heki" to turn the feature on or
>>> off. By default, Heki is on.
>>
>> For such a newfangled feature can we have it off by default? Especially
>> when there are unsolved issues around dynamically loaded code.
>>
> 
> Yes. We can certainly do that.

By default the Kconfig option should definitely be off. We also need to 
change the Kconfig option to only be set if kernel module, JIT, kprobes 
and other dynamic text change feature are disabled at build time  (see 
discussion with Sean).

With this new Kconfig option for the static case, I think the boot 
option should be on by default because otherwise it would not really be 
possible to switch back to on later without taking the risk to silently 
breaking users' machines. However, we should rename this option to 
something like "heki_static" to be in line with the new Kconfig option.

The goal of Heki is to improve and complement kernel self-protection 
mechanisms (which don't have boot time options), and to make it 
available to everyone, see 
https://kernsec.org/wiki/index.php/Kernel_Self_Protection_Project/Recommended_Settings
In practice, it would then be kind of useless to be required to set a 
boot option to enable Heki (rather than to disable it).


> 
>>>
>> [...]
>>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>>> index 3604074a878b..5cf5a7a97811 100644
>>> --- a/arch/x86/Kconfig
>>> +++ b/arch/x86/Kconfig
>>> @@ -297,6 +297,7 @@ config X86
>>>   	select FUNCTION_ALIGNMENT_4B
>>>   	imply IMA_SECURE_AND_OR_TRUSTED_BOOT    if EFI
>>>   	select HAVE_DYNAMIC_FTRACE_NO_PATCHABLE
>>> +	select ARCH_SUPPORTS_HEKI		if X86_64
>>
>> Why is there a restriction on X86_64?
>>
> 
> We want to get the PoC working and reviewed on X64 first. We have tested this only on X64 so far.

X86_64 includes Intel CPUs, which can support EPT and MBEC, which are a 
requirement for Heki. ARM might have similar features but we're focused 
on x86 for now.

As a side note, I only have access to an Intel machine, which means that 
I cannot work on AMD support. However, I'll be pleased to implement such 
support if I get access to a machine with a recent AMD CPU.


> 
>>>   
>>>   config INSTRUCTION_DECODER
>>>   	def_bool y
>>> diff --git a/arch/x86/include/asm/sections.h b/arch/x86/include/asm/sections.h
>>> index a6e8373a5170..42ef1e33b8a5 100644
>>> --- a/arch/x86/include/asm/sections.h
>>> +++ b/arch/x86/include/asm/sections.h
>> [...]
>>>   
>>> +#ifdef CONFIG_HEKI
>>> +
>>> +/*
>>> + * Gather all of the statically defined sections so heki_late_init() can
>>> + * protect these sections in the host page table.
>>> + *
>>> + * The sections are defined under "SECTIONS" in vmlinux.lds.S
>>> + * Keep this array in sync with SECTIONS.
>>> + */
>>
>> This seems a bit fragile, because it requires constant attention from
>> people who care about this functionality. Can this table be
>> automatically generated?
>>
> 
> We realize that. But I don't know of a way this can be automatically generated. Also, the permissions for
> each section is specific to the use of that section. The developer who introduces a new section is the
> one who will know what the permissions should be.
> 
> If any one has any ideas of how we can generate this table automatically or even just add a build time check
> of some sort, please let us know.

One clean solution might be to parse the vmlinux.lds.S file, extract 
section and their permission, and fill that into an automatically 
generated header file.

Another way to do it would be to extract sections and associated 
permissions with objdump, but that could be an issue because of longer 
build time.

A better solution would be to extract such sections and associated 
permissions at boot time. I guess the kernel already has such helpers 
used in early boot.

