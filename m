Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AC682DD39
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 17:16:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667514.1038863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPPdZ-0005Un-T8; Mon, 15 Jan 2024 16:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667514.1038863; Mon, 15 Jan 2024 16:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPPdZ-0005SX-Pt; Mon, 15 Jan 2024 16:16:33 +0000
Received: by outflank-mailman (input) for mailman id 667514;
 Mon, 15 Jan 2024 16:16:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rPPdY-0005SM-Bl
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 16:16:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPPdX-0007Lq-Jm; Mon, 15 Jan 2024 16:16:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPPdX-00052A-E1; Mon, 15 Jan 2024 16:16:31 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=KmDogC24L+w80RLD+9Vn+ifiApG/aD7I6eieaYAx9ZQ=; b=YKa+GdPHjGJ1h5LiHMZgbSlwm/
	0uHmBia2iNWlZmhkThMFv64JuwW6xEOgj+vbZO1RPw1uLDDsdwc7+vYC7aAOjMKaFREX/CDsAHm2Q
	+Zq4KOn5CnC5blq6SoqJlFxLZGoFEt1Fxi/T1hudXFaXLkVrb0aMGaXkm3FatVl2ow74=;
Message-ID: <ca2a64f8-ac0d-4b61-8f48-34478371bcbc@xen.org>
Date: Mon, 15 Jan 2024 16:16:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] xen/arm: add cache coloring support for Xen
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-14-carlo.nonato@minervasys.tech>
 <4553cc26-deb5-42ed-87b9-6cba2a5099eb@xen.org>
 <CAG+AhRXHfGJksqUrPXoHqNze+D654jJV0kVYBZaPLYwccdEz5Q@mail.gmail.com>
 <aa064f8f-d30e-4ac1-9239-daba5a806794@xen.org>
 <CAG+AhRXUPvKGu-y9qbVmhc0_ThCdxFvG=BYwCQMBH=mjo45qHw@mail.gmail.com>
 <985e1a2a-45eb-496c-8043-5f0c3c9f7766@xen.org>
 <CAG+AhRVKbM-n8ieg-CMbRG-4RgUXMSZL=ZER8EAWvGJgpEzUwA@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRVKbM-n8ieg-CMbRG-4RgUXMSZL=ZER8EAWvGJgpEzUwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15/01/2024 15:43, Carlo Nonato wrote:
> Hi Julien,

Hi Carlo,

> On Mon, Jan 15, 2024 at 12:18 PM Julien Grall <julien@xen.org> wrote:
>> On 15/01/2024 10:11, Carlo Nonato wrote:
>>> I understand what you're talking about, and it seems reasonable to get rid of
>>> xen_colored_temp[] and create_llc_coloring_mappings() since in the end they
>>> serve the purpose of mapping the physically colored space that is already
>>> mapped using xen_xenmap[] pagetables.
>>> What I don't understand is then how to copy/relocate Xen since I don't have a
>>> destination virtual space anymore to use in relocate_xen().
>>
>> You will need to link xen_xenmap[] in boot_second[...] as well. With
>> that, you will be able to access the new Xen through the temporary area.
> 
> Wouldn't it result in overwriting the current virtual space mapping?
> boot_second is the live page table and if I link xen_xenmap[] then
> XEN_VIRT_START would point to the new colored space which is still empty at
> this stage...

If you link at XEN_VIRT_START then yes. But you could link at 
BOOT_RELOC_VIRT_START like you already do today.

> 
>> [...]
>>
>>>> Note that this means the init_ttbr cannot be written directly. But you
>>>> can solve this problem by re-mapping the address.
>>>
>>> How to remap a single address?
>>
>> You should be able to use map_domain_page() to map the page where
>> init_ttbr is.
>>
>>> And if moving init_ttbr in the identity-mapped area means that it's no longer
>>> writable, so that I need to remap it, why moving it in that area in the first
>>> place. Again I think I'm missing something.
>>
>> The goal is to have everything used (code, data) before the MMU is
>> turned on residing in a single page. So secondary CPUs can directly jump
>> to the colored Xen without any trouble.
> 
> This is what confuses me. Why having everything on a single page makes
> secondary cpus able to jump directly to colored Xen? (also see below)

Because the code running with the MMU off can access easily access 
everything.

> 
>>>>>
>>>>> 3) To access the identity mapping area I would need some accessor that takes
>>>>> an address and returns it + phys_offset, or is there a better way to do it?
>>>>
>>>> I am not sure I understand what you mean. Can you clarify?
>>>
>>> In my idea, I would use the identity mapping to access the "old" variables,
>>> where "old" means non physically colored. init_ttbr is an example. When
>>> Xen it's copied on the new physical space, init_ttbr is copied with it and
>>> if the boot cpu modifies this variable, it's actually touching the colored
>>> one and not the old one. This means that secondary CPUs that still haven't
>>> jumped to the new space, won't be able to see the new value and will never
>>> go online.
>>> So to access this "old" init_ttbr variable I need it's identity address,
>>> which is its current virtual address + some physical offset. I was asking
>>> you if this is the right approach to use the identity mapping.
>>
>> Secondary CPUs would directly start on the colored Xen. So they will be
>> able to access the "new" init_ttbr & co.
> 
> How can this be true? I mean, in call_psci_cpu_on() I can start those CPUs in
> the colored space, but they still use the boot_* pagetables

Are you looking at the 64-bit or 32-bit code? For 64-bit, staging is not 
using boot_* pagetable anymore for secondary CPUs. Instead, they 
directly jump to the runtime page-tables.

> and there I can't
> easily link the new colored space, or, at least, I'm not succeding in doing
> that. What I tried at the moment is to link xen_xenmap in boot_second after
> switch_ttbr because of the problem I described above. But then secondary
> CPUs never go online...

It would be helpful if you share some code.

> 
>> [...]
>>
>>>> ... as I wrote ealier your current approach seems to have a flaw. As you
>>>> overwrite xen_bootmodule->{start, size}. setup_mm() will end up to add
>>>> the old Xen region to the boot allocator. This is before any secondary
>>>> CPUs are booted up.
>>>>
>>>> IOW, the allocator may provide some memory from the old Xen and nothing
>>>> good will happen from that.
>>>>
>>>> The only way to solve it is to add another module. So the memory is
>>>> skipped by setup_mm(). However see below.
>>>>
>>>>>
>>>>> Yes that should be memory that in the end would not be needed so it must
>>>>> return to the boot-allocator (if that's what you mean). But how to do
>>>>> that?
>>>>
>>>> You can't really discard the old temporary Xen. This may work today
>>>> because we don't support CPU hotplug or suspend/resume. But there was
>>>> some series on the ML to enable it and I don't see any reason why
>>>> someone would not want to use the features with cache coloring.
>>>>
>>>> So the old temporary Xen would have to be kept around forever. This is
>>>> up to 8MB of memory wasted.
>>>>
>>>> The right approach is to have the secondary CPU boot code (including the
>>>> variables it is using) fitting in the same page (or possibly multiple so
>>>> long this is small and physically contiguous). With that it doesn't
>>>> matter where is the trampoline, it could stay at the old place, but we
>>>> would only waste a few pages rather than up 8MB as it is today.
>>>
>>> So what are you suggesting is to create a new section in the linker script
>>> for the trampoline code and data,
>>
>> We already have a section for that in place (see .idmap.*) which happens
>> to be at the beginning of Xen. Right now, the section is in text. Which
>> is why it is read-only executable.
>>
>>> then in setup_mm() we would skip this
>>> memory?
>>
>> We should not need this. Secondary boot CPUs should boot direclty on the
>> colored Xen.
>>
>>> Am I following you correctly? Sorry those topics are a little out
>>> of my preparation as you probably already guessed.
>>
>> No worries. I am happy to go in as much details as necessary. I can also
>> attempt to write a patch if that helps. (unless someone else in the Arm
>> maintainers want to give a try).
> 
> Yes this would help. Thanks.

I will try to have a look this evening. If I can't, it may have to wait 
a couple of weeks unless someone has time before hand.

Cheers,

-- 
Julien Grall

