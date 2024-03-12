Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3A7879A6A
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 18:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692003.1078725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk5gq-0007wK-Ri; Tue, 12 Mar 2024 17:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692003.1078725; Tue, 12 Mar 2024 17:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk5gq-0007tn-P5; Tue, 12 Mar 2024 17:13:24 +0000
Received: by outflank-mailman (input) for mailman id 692003;
 Tue, 12 Mar 2024 17:13:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7HW=KS=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1rk5gp-0007tM-0A
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 17:13:23 +0000
Received: from 10.mo561.mail-out.ovh.net (10.mo561.mail-out.ovh.net
 [87.98.165.232]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d35dd5dc-e093-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 18:13:20 +0100 (CET)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.139.154])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4TvKwc2Qk6z1Bj5
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 17:13:20 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-4hrmg (unknown [10.110.96.204])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8D2ED1FDF1;
 Tue, 12 Mar 2024 17:13:19 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.99])
 by ghost-submission-6684bf9d7b-4hrmg with ESMTPSA
 id V/m4HS+N8GXxGQIA/is83g
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 12 Mar 2024 17:13:19 +0000
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
X-Inumbo-ID: d35dd5dc-e093-11ee-a1ee-f123f15fe8a2
Authentication-Results:garm.ovh; auth=pass (GARM-99G003d29cd4e1-61e3-4af7-82ad-29f88b641790,
                    0B6B113C544506A41C6EB031E0F94F2E66B6AEBC) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.61.25
Message-ID: <d853fb40-ca61-457a-b292-9bc675b86181@3mdeb.com>
Date: Tue, 12 Mar 2024 18:13:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 9/9] x86/smp: start APs in parallel during boot
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <77c9199eabf3a30ebcf89356b2dd35abd611a3a9.1699982111.git.krystian.hebel@3mdeb.com>
 <dad39029-d0fc-4aa0-8562-4c7a02ca8039@suse.com>
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <dad39029-d0fc-4aa0-8562-4c7a02ca8039@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10173631559693281648
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdeljecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejuedvffefvdeuvdeffeduuddtjeetgeefffdugfdvkeehtedutefghfdtteejieenucffohhmrghinhepfehmuggvsgdrtghomhenucfkphepuddvjedrtddrtddruddpvddujedrudejuddriedurddvhedpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheeiuddpmhhouggvpehsmhhtphhouhht


On 8.02.2024 13:37, Jan Beulich wrote:
> On 14.11.2023 18:50, Krystian Hebel wrote:
>> Multiple delays are required when sending IPIs and waiting for
>> responses. During boot, 4 such IPIs were sent per each AP. With this
>> change, only one set of broadcast IPIs is sent. This reduces boot time,
>> especially for platforms with large number of cores.
> Yet APs do their startup work in parallel only for a brief period of
> time, if I'm not mistaken. Othwerwise I can't see why you'd still have
> cpu_up() in __start_xen().
cpu_up() is left because multiple notifiers aren't easy to convert to work
in parallel. In terms of lines of code it looks like a brief period, but all
the delays along the way were taking much more time than the actual
work. As the gain was already more than what I hoped for, I decided
against spending too much time trying to fix the notifiers' code for
minimal profit.
>
>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -1963,6 +1963,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>                   cpu_data[i].stack_base = cpu_alloc_stack(i);
>>           }
>>   
>> +        smp_send_init_sipi_sipi_allbutself();
>> +
>>           for_each_present_cpu ( i )
>>           {
>>               if ( (park_offline_cpus || num_online_cpus() < max_cpus) &&
> So what about constraints on the number of CPUs to use? In such a case
> you shouldn't send the IPI to all of them, at least if they're not
> meant to be parked.
Fair point, such check can be easily added before broadcasting and the
rest of the code should already be able to handle this.
>
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -425,7 +425,7 @@ void start_secondary(unsigned int cpu)
>>   
>>   static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>   {
>> -    unsigned long send_status = 0, accept_status = 0;
>> +    unsigned long send_status = 0, accept_status = 0, sh = 0;
> sh doesn't need to be 64 bits wide, does it?
No, will change.
>
>>       int maxlvt, timeout, i;
>>   
>>       /*
>> @@ -445,6 +445,12 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
>>       if ( tboot_in_measured_env() && !tboot_wake_ap(phys_apicid, start_eip) )
>>           return 0;
>>   
>> +    /*
>> +     * Use destination shorthand for broadcasting IPIs during boot.
>> +     */
> Nit (style): This is a single line comment.
Ack
>
>> +    if ( phys_apicid == BAD_APICID )
>> +        sh = APIC_DEST_ALLBUT;
> I think the latest for this the function parameter wants changing to
> unsigned int (in another prereq patch).
What do you mean, phys_apicid in wakeup_secondary_cpu()? It is passed
as signed int since __cpu_up(), should I change all of those to unsigned?
>
>> @@ -573,21 +578,31 @@ static int do_boot_cpu(int apicid, int cpu)
>>        */
>>       mtrr_save_state();
>>   
>> -    start_eip = bootsym_phys(trampoline_realmode_entry);
>> +    /* Check if AP is already up. */
>> +    if ( cpu_data[cpu].cpu_state != CPU_STATE_INIT )
>> +    {
>> +        /* This grunge runs the startup process for the targeted processor. */
>> +        unsigned long start_eip;
>> +        start_eip = bootsym_phys(trampoline_realmode_entry);
>>   
>> -    /* start_eip needs be page aligned, and below the 1M boundary. */
>> -    if ( start_eip & ~0xff000 )
>> -        panic("AP trampoline %#lx not suitably positioned\n", start_eip);
>> +        /* start_eip needs be page aligned, and below the 1M boundary. */
>> +        if ( start_eip & ~0xff000 )
>> +            panic("AP trampoline %#lx not suitably positioned\n", start_eip);
> Isn't this redundant now with the panic() in
> smp_send_init_sipi_sipi_allbutself(), at least as long as that runs
> unconditionally.
Won't be running unconditionally, but it also wouldn't be redundant in case
of hot-plugging.
>
>> -    /* So we see what's up   */
>> -    if ( opt_cpu_info )
>> -        printk("Booting processor %d/%d eip %lx\n",
>> -               cpu, apicid, start_eip);
>> +        /* So we see what's up   */
>> +        if ( opt_cpu_info )
>> +            printk("AP trampoline at %lx\n", start_eip);
> Why this change in log message? It makes messages for individual CPUs
> indistinguishable. And like above it's redundant with what
> smp_send_init_sipi_sipi_allbutself() logs.
>
>> -    /* This grunge runs the startup process for the targeted processor. */
>> +        /* mark "stuck" area as not stuck */
>> +        bootsym(trampoline_cpu_started) = 0;
>> +        smp_mb();
>>   
>> -    /* Starting actual IPI sequence... */
>> -    boot_error = wakeup_secondary_cpu(apicid, start_eip);
>> +        /* Starting actual IPI sequence... */
>> +        boot_error = wakeup_secondary_cpu(apicid, start_eip);
>> +    }
>> +
>> +    if ( opt_cpu_info )
>> +        printk("Booting processor %d/%d\n", cpu, apicid);
> Oh, here's the other half. Yet for above it still doesn't make sense
> to issue the same message for all CPUs.
I'll undo it. It was important at one point for debugging, but I agree
that it doesn't make sense now.
>
>> @@ -646,10 +661,6 @@ static int do_boot_cpu(int apicid, int cpu)
>>           rc = -EIO;
>>       }
>>   
>> -    /* mark "stuck" area as not stuck */
>> -    bootsym(trampoline_cpu_started) = 0;
>> -    smp_mb();
> While you move this up, it's not clear to me how you would now
> identify individual stuck CPUs. I would have expected that this is
> another global that needs converting up front, to be per-CPU.
In the existing code this is set very early, in 16b code, and the variable
is located within the first page of trampoline. With this change it is
impossible to identify individual stuck CPUs.

I was considering removing this variable altogether. Another option
would be to make this an array with NR_CPUS elements, but this may
get too big. It would be possible to fill this relatively early, after 
CPU ID
is obtained, before paging is enabled, but after loading IDT, GDT and
jumping to protected mode. Those are things that can break due to error
in the code, but it may be better than not having that info at all.

It could also be set from 64b code, that way simple per-CPU data would
work. It is a bit late, but this would probably be easiest and cleanest to
write.

>
>> @@ -1155,6 +1166,23 @@ static struct notifier_block cpu_smpboot_nfb = {
>>       .notifier_call = cpu_smpboot_callback
>>   };
>>   
>> +void smp_send_init_sipi_sipi_allbutself(void)
> __init?
Ack
>
>> +{
>> +    unsigned long start_eip;
>> +    start_eip = bootsym_phys(trampoline_realmode_entry);
> This can be the initializer of the variable, which would then save
> me from complaining about the missing blank line between declaration
> and statement(s). (Actually, as I notice only now - same for code you
> move around in do_boot_cpu().)
Will do. It may still be split due to line length, but at least that will
follow code style.
>
> Jan
Best regards,

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com | @3mdeb_com


