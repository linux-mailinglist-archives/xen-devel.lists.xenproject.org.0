Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1838795D5
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 15:15:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691877.1078384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk2th-0007DW-RP; Tue, 12 Mar 2024 14:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691877.1078384; Tue, 12 Mar 2024 14:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk2th-0007AO-OU; Tue, 12 Mar 2024 14:14:29 +0000
Received: by outflank-mailman (input) for mailman id 691877;
 Tue, 12 Mar 2024 14:14:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7HW=KS=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1rk2tg-0007AI-4N
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 14:14:28 +0000
Received: from 3.mo584.mail-out.ovh.net (3.mo584.mail-out.ovh.net
 [46.105.57.129]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d554492f-e07a-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 15:14:26 +0100 (CET)
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.140.55])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4TvFyB1b28z19YL
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 14:14:26 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zcqb6 (unknown [10.110.96.141])
 by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 670921FE8D;
 Tue, 12 Mar 2024 14:14:25 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.107])
 by ghost-submission-6684bf9d7b-zcqb6 with ESMTPSA
 id iGI1EEFj8GUrzwAABa7qdA
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 12 Mar 2024 14:14:25 +0000
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
X-Inumbo-ID: d554492f-e07a-11ee-afdd-a90da7624cb6
Authentication-Results:garm.ovh; auth=pass (GARM-107S001d43bc115-4bd6-465f-8f6d-b9d6973bfb82,
                    0B6B113C544506A41C6EB031E0F94F2E66B6AEBC) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.61.25
Message-ID: <387275c4-6a56-4400-97c6-a8cc1409547d@3mdeb.com>
Date: Tue, 12 Mar 2024 15:14:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/9] x86/boot: choose AP stack based on APIC ID
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <0e7dd957b6f26fa7b752bdce1ef6ebe97c825903.1699982111.git.krystian.hebel@3mdeb.com>
 <07660850-5b7a-4811-997e-8237e575f429@xen.org>
Content-Language: en-US
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <07660850-5b7a-4811-997e-8237e575f429@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7151997687513327984
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdeivdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeigeeifeeffeefhffffeehuedvheethfeuvdetffdtheefffeigfelleeuhfduvdenucffohhmrghinhepthhrrghmphholhhinhgvrdhssgdpgiekiegpieegrdhssgdpfehmuggvsgdrtghomhenucfkphepuddvjedrtddrtddruddpvddujedrudejuddriedurddvhedpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepkhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth

Hi,

On 26.01.2024 19:30, Julien Grall wrote:
> Hi,
>
> I am not too familiary with the x86 boot code. But I will give a try 
> to review :).
>
> On 14/11/2023 17:49, Krystian Hebel wrote:
>> This is made as first step of making parallel AP bring-up possible. It
>> should be enough for pre-C code.
>>
>> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
>> ---
>>   xen/arch/x86/boot/trampoline.S | 20 ++++++++++++++++++++
>>   xen/arch/x86/boot/x86_64.S     | 28 +++++++++++++++++++++++++++-
>>   xen/arch/x86/setup.c           |  7 +++++++
>>   3 files changed, 54 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/boot/trampoline.S 
>> b/xen/arch/x86/boot/trampoline.S
>> index b8ab0ffdcbb0..ec254125016d 100644
>> --- a/xen/arch/x86/boot/trampoline.S
>> +++ b/xen/arch/x86/boot/trampoline.S
>> @@ -72,6 +72,26 @@ trampoline_protmode_entry:
>>           mov     $X86_CR4_PAE,%ecx
>>           mov     %ecx,%cr4
>>   +        /*
>> +         * Get APIC ID while we're in non-paged mode. Start by 
>> checking if
>> +         * x2APIC is enabled.
>> +         */
>> +        mov     $MSR_APIC_BASE, %ecx
>> +        rdmsr
>> +        and     $APIC_BASE_EXTD, %eax
>> +        jnz     .Lx2apic
>> +
>> +        /* Not x2APIC, read from MMIO */
>> +        mov     0xfee00020, %esp
>> +        shr     $24, %esp
>> +        jmp     1f
>> +
>> +.Lx2apic:
>> +        mov     $(MSR_X2APIC_FIRST + (0x20 >> 4)), %ecx
>> +        rdmsr
>> +        mov     %eax, %esp
>> +1:
>> +
>>           /* Load pagetable base register. */
>>           mov     $sym_offs(idle_pg_table),%eax
>>           add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
>> diff --git a/xen/arch/x86/boot/x86_64.S b/xen/arch/x86/boot/x86_64.S
>> index 04bb62ae8680..b85b47b5c1a0 100644
>> --- a/xen/arch/x86/boot/x86_64.S
>> +++ b/xen/arch/x86/boot/x86_64.S
>> @@ -15,7 +15,33 @@ ENTRY(__high_start)
>>           mov     $XEN_MINIMAL_CR4,%rcx
>>           mov     %rcx,%cr4
>>   -        mov     stack_start(%rip),%rsp
>> +        test    %ebx,%ebx
>> +        cmovz   stack_start(%rip), %rsp
>> +        jz      .L_stack_set
>> +
>> +        /* APs only: get stack base from APIC ID saved in %esp. */
>> +        mov     $-1, %rax
>> +        lea     x86_cpu_to_apicid(%rip), %rcx
> I would consider to move this patch after #2 and #3, so the logic is 
> not modified again. This would help the review.
I agree, maybe even after #4 after that patch is modified according to 
other comments.
>
>> +1:
>> +        add     $1, %rax
>> +        cmp     $NR_CPUS, %eax
>> +        jb      2f
> I think we can get rid of this jump by reworking the loop so %eax is 
> tested as the end of the loop. But this is boot code, so it is 
> possibly not worth it. I will leave the x86 maintainers commenting.
Not sure if I understood "end of the loop" correctly, but if I did, it 
would result in out-of-bounds read. Anyway, this is changed by further 
patches which I still have to reorder, I'll check if final form can be 
improved.
>
>> +        hlt
>> +2:
>> +        cmp     %esp, (%rcx, %rax, 4)
>> +        jne     1b
>> +
>> +        /* %eax is now Xen CPU index. */
>> +        lea     stack_base(%rip), %rcx
>> +        mov     (%rcx, %rax, 8), %rsp
>> +
>> +        test    %rsp,%rsp
>> +        jnz     1f
>> +        hlt
>> +1:
> NIT: Can you use 3? This makes the code easier to read and less prone 
> to error (you have two very close 1).
Ack
>
>> +        add     $(STACK_SIZE - CPUINFO_sizeof), %rsp
>> +
>> +.L_stack_set:
>>             /* Reset EFLAGS (subsumes CLI and CLD). */
>>           pushq   $0
>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>> index a3d3f797bb1e..1285969901e0 100644
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1951,6 +1951,7 @@ void __init noreturn __start_xen(unsigned long 
>> mbi_p)
>>        */
>>       if ( !pv_shim )
>>       {
>> +        /* Separate loop to make parallel AP bringup possible. */
>
> The loop split seems to be unrelated to this patch. Actually, I was 
> expecting that only the assembly code would be modified.
Fair point, I originally left it here so the code can be bisected if 
needed, but code changed significantly since then. In current form it 
should be safe to do this in the last commit.
>
>>           for_each_present_cpu ( i )
>>           {
>>               /* Set up cpu_to_node[]. */
>> @@ -1958,6 +1959,12 @@ void __init noreturn __start_xen(unsigned long 
>> mbi_p)
>>               /* Set up node_to_cpumask based on cpu_to_node[]. */
>>               numa_add_cpu(i);
>>   +            if ( stack_base[i] == NULL )
>> +                stack_base[i] = cpu_alloc_stack(i);
>
> I don't quite understand this change at least in the context of this 
> patch. AFAICT the stack will be currently allocated in 
> cpu_smpboot_callback() which is called while the CPU is prepared. So 
> you should not need this allocation right now.
>
> Looking at the rest of the series, it seems you allocate the stack 
> earlier so you start the CPU bring-up earlier. But they will still be 
> held in assembly code until cpu_up() is called.
>
> So effectively, part of the C part of the CPUs bring-up is still 
> serialized. Did I understand the logic correctly?
>
> If so, I would suggest to clarify it in the series because this wasn't 
> obvious to me (I was expecting start_secondary() would also run in 
> parallell).

start_secondary() is started in parallel, CPUs are not held in assembly. 
Calling C (almost) always requires stack, and most of this series comes 
to making stack available for all APs at once, just so APs can loop 
early in start_secondary().

You are correct, most of C part is serialized. I tried to make it 
parallel as well but quickly gave up. Some of the notifiers callbacks 
are resistant against any attempts at parallelization, and this set of 
patches already gave satisfactory improvements in boot time (and was 
enough to go through peculiar SMP bring-up used by Intel TXT dynamic 
launch, which is the reason why I had to do it in the first place).

>
> Regarding the change in setup.c, I think it would make more sense in 
> patch #9.
>
> Cheers,
>
Best regards,

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com | @3mdeb_com


