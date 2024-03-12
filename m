Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B33879920
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 17:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691962.1078634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk59F-0008H0-DL; Tue, 12 Mar 2024 16:38:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691962.1078634; Tue, 12 Mar 2024 16:38:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk59F-0008EX-A5; Tue, 12 Mar 2024 16:38:41 +0000
Received: by outflank-mailman (input) for mailman id 691962;
 Tue, 12 Mar 2024 16:38:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7HW=KS=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1rk59D-0008DI-UR
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 16:38:39 +0000
Received: from 19.mo584.mail-out.ovh.net (19.mo584.mail-out.ovh.net
 [87.98.179.66]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9c0b63c-e08e-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 17:38:37 +0100 (CET)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.25.249])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4TvK8Y1pfgz15cX
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 16:38:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-wbs9r (unknown [10.108.42.86])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 79AF91FEA8;
 Tue, 12 Mar 2024 16:38:36 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
 by ghost-submission-6684bf9d7b-wbs9r with ESMTPSA
 id dxkYGQyF8GX4ogIALcx4mA
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 12 Mar 2024 16:38:36 +0000
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
X-Inumbo-ID: f9c0b63c-e08e-11ee-a1ee-f123f15fe8a2
Authentication-Results:garm.ovh; auth=pass (GARM-110S0040affcde0-4687-4333-9f01-cb83c8e8805c,
                    0B6B113C544506A41C6EB031E0F94F2E66B6AEBC) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.61.25
Message-ID: <848c6735-c700-4feb-bc0c-259d00147564@3mdeb.com>
Date: Tue, 12 Mar 2024 17:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 8/9] x86/smp: make cpu_state per-CPU
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <52083114d4cbbc75f021e8c61763ad0e166cf05b.1699982111.git.krystian.hebel@3mdeb.com>
 <c1e23e38-aaac-44c5-a1af-999f71909110@suse.com>
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <c1e23e38-aaac-44c5-a1af-999f71909110@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9587319183475124569
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdeltdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejuedvffefvdeuvdeffeduuddtjeetgeefffdugfdvkeehtedutefghfdtteejieenucffohhmrghinhepfehmuggvsgdrtghomhenucfkphepuddvjedrtddrtddruddpvddujedrudejuddriedurddvhedpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepkhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeegpdhmohguvgepshhmthhpohhuth


On 8.02.2024 13:13, Jan Beulich wrote:
> On 14.11.2023 18:50, Krystian Hebel wrote:
>> This will be used for parallel AP bring-up.
>>
>> CPU_STATE_INIT changed direction.
> Nit: I think you mean "changes" as you describe what the patch does, not
> what has happened before. But ...
>
>> It was previously set by BSP and never
>> consumed by AP. Now it signals that AP got through assembly part of
>> initialization and waits for BSP to call notifiers that set up data
>> structures required for further initialization.
> ... all of this is, afaict, independent of what the title says the
> purpose of this patch is. Since the correctness of the state change
> adjustments doesn't look straightforward to prove, please split the
> mechanical change from the change to the actual logic.
Ack
>
>> --- a/xen/arch/x86/include/asm/cpufeature.h
>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>> @@ -38,6 +38,7 @@ struct cpuinfo_x86 {
>>       unsigned int cpu_core_id;          /* core ID of each logical CPU */
>>       unsigned int compute_unit_id;      /* AMD compute unit ID of each logical CPU */
>>       void *stack_base;
>> +    unsigned int cpu_state;
>>       unsigned short x86_clflush_size;
>>   } __cacheline_aligned;
> Is there any reason this cannot be ordinary per-CPU data?
Probably not, will move it away.
>
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -65,15 +65,18 @@ struct cpuinfo_x86 cpu_data[NR_CPUS] =
>>           { [0 ... NR_CPUS-1] .apicid = BAD_APICID };
>>   
>>   static int cpu_error;
>> -static enum cpu_state {
>> +enum cpu_state {
>>       CPU_STATE_DYING,    /* slave -> master: I am dying */
>>       CPU_STATE_DEAD,     /* slave -> master: I am completely dead */
>> -    CPU_STATE_INIT,     /* master -> slave: Early bringup phase 1 */
>> -    CPU_STATE_CALLOUT,  /* master -> slave: Early bringup phase 2 */
>> +    CPU_STATE_INIT,     /* slave -> master: Early bringup phase 1 completed */
>> +    CPU_STATE_CALLOUT,  /* master -> slave: Start early bringup phase 2 */
> It's not really clear to me whether the adding of "Start" on the 2nd line
> really adds value.
Ack
>
>>       CPU_STATE_CALLIN,   /* slave -> master: Completed phase 2 */
>>       CPU_STATE_ONLINE    /* master -> slave: Go fully online now. */
>> -} cpu_state;
>> -#define set_cpu_state(state) do { smp_mb(); cpu_state = (state); } while (0)
>> +};
>> +#define set_cpu_state(cpu, state) do { \
>> +    smp_mb(); \
>> +    cpu_data[cpu].cpu_state = (state); \
>> +} while (0)
> While you merely re-arrange it, I'd still like to ask: Does this really
> need to be smp_mb(), not just smp_wmb()?
Probably not, but I didn't want to change it, assuming there was a reason
that it used smp_wmb() in the first place.
>
>> @@ -320,6 +317,10 @@ void start_secondary(unsigned int cpu)
>>   
>>       /* Critical region without IDT or TSS.  Any fault is deadly! */
>>   
>> +    /* Wait until data set up by CPU_UP_PREPARE notifiers is ready. */
>> +    while ( cpu_data[cpu].cpu_state != CPU_STATE_CALLOUT )
>> +        cpu_relax();
> I'm afraid I don't understand the comment (and hence whether this loop
> is actually needed here): __cpu_up() is called only after those
> notifiers completed.
Yes, but broadcasted INIT-SIPI-SIPI sequence added in next patch will be
sent before that call is made, and consequently APs potentially can get
to this point before that data is set up.
>
>> @@ -1161,6 +1171,12 @@ void __init smp_prepare_cpus(void)
>>       cpu_data[0].stack_base = (void *)
>>                ((unsigned long)stack_start & ~(STACK_SIZE - 1));
>>   
>> +    /* Set state as CALLOUT so APs won't change it in initialize_cpu_data() */
>> +    boot_cpu_data.cpu_state = CPU_STATE_CALLOUT;
> This is actually one of the reasons I don't like you putting the item
> as a new field in struct cpuinfo_x86. Otherwise imo initialize_cpu_data()
> ought to gain a respective assertion.
I'll move it out.
>
> Jan
Best regards,

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com | @3mdeb_com


