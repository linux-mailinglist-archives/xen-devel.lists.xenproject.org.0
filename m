Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC7087987F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 17:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691942.1078584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4aV-0000nX-QO; Tue, 12 Mar 2024 16:02:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691942.1078584; Tue, 12 Mar 2024 16:02:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4aV-0000l0-Mv; Tue, 12 Mar 2024 16:02:47 +0000
Received: by outflank-mailman (input) for mailman id 691942;
 Tue, 12 Mar 2024 16:02:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7HW=KS=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1rk4aV-0000kb-49
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 16:02:47 +0000
Received: from 10.mo583.mail-out.ovh.net (10.mo583.mail-out.ovh.net
 [46.105.52.148]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6ad7b69-e089-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 17:02:45 +0100 (CET)
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.139.201])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4TvJM84bKhz1Jpk
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 16:02:44 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-zrj5v (unknown [10.110.168.153])
 by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EBE101FD71;
 Tue, 12 Mar 2024 16:02:43 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
 by ghost-submission-6684bf9d7b-zrj5v with ESMTPSA
 id 8T2QNaN88GV24AAAhIFWDg
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 12 Mar 2024 16:02:43 +0000
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
X-Inumbo-ID: f6ad7b69-e089-11ee-a1ee-f123f15fe8a2
Authentication-Results:garm.ovh; auth=pass (GARM-106R0061ef6d01a-5820-48e0-827f-ca8887385c86,
                    0B6B113C544506A41C6EB031E0F94F2E66B6AEBC) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.61.25
Message-ID: <e131471c-9fe2-4b64-9f6f-81a0ac087874@3mdeb.com>
Date: Tue, 12 Mar 2024 17:02:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/9] x86/smp: call x2apic_ap_setup() earlier
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <7c13554e60cc76516922992b7faf911b91f99a2a.1699982111.git.krystian.hebel@3mdeb.com>
 <a9a44e5d-80cf-404a-abe0-985a11f6d668@suse.com>
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <a9a44e5d-80cf-404a-abe0-985a11f6d668@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8981303558268430704
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdekfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejuedvffefvdeuvdeffeduuddtjeetgeefffdugfdvkeehtedutefghfdtteejieenucffohhmrghinhepfehmuggvsgdrtghomhenucfkphepuddvjedrtddrtddruddpvddujedrudejuddriedurddvhedpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepkhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth


On 7.02.2024 18:02, Jan Beulich wrote:
> On 14.11.2023 18:50, Krystian Hebel wrote:
>> It used to be called from smp_callin(), however BUG_ON() was invoked on
>> multiple occasions before that. It may end up calling machine_restart()
>> which tries to get APIC ID for CPU running this code. If BSP detected
>> that x2APIC is enabled, get_apic_id() will try to use it for all CPUs.
>> Enabling x2APIC on secondary CPUs earlier protects against an endless
>> loop of #GP exceptions caused by attempts to read IA32_X2APIC_APICID
>> MSR while x2APIC is disabled in IA32_APIC_BASE.
>>
>> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
>> ---
>>   xen/arch/x86/smpboot.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
>> index 8ae65ab1769f..a3895dafa267 100644
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -184,7 +184,6 @@ static void smp_callin(void)
>>        * update until we finish. We are free to set up this CPU: first the APIC.
>>        */
>>       Dprintk("CALLIN, before setup_local_APIC().\n");
>> -    x2apic_ap_setup();
>>       setup_local_APIC(false);
>>   
>>       /* Save our processor parameters. */
>> @@ -351,6 +350,14 @@ void start_secondary(void *unused)
>>       get_cpu_info()->xen_cr3 = 0;
>>       get_cpu_info()->pv_cr3 = 0;
>>   
>> +    /*
>> +     * BUG_ON() used in load_system_tables() and later code may end up calling
>> +     * machine_restart() which tries to get APIC ID for CPU running this code.
>> +     * If BSP detected that x2APIC is enabled, get_apic_id() will try to use it
>> +     * for _all_ CPUs. Enable x2APIC on secondary CPUs now so we won't end up
>> +     * with endless #GP loop.
>> +     */
>> +    x2apic_ap_setup();
>>       load_system_tables();
> While I find the argument convincing, I seem to recall that there was a
> firm plan to have load_system_tables() as early as possible. Andrew?
This is where the code failed for me during testing. How about moving
x2apic_ap_setup() into load_system_tables(), just before BUG_ON? Or maybe
move those BUG_ON one level higher, after load_system_tables() returns?
Either way some code will end up in place it doesn't belong, but I'd 
argue that
BUG_ON is only useful if it itself doesn't crash.
>
> Jan

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com | @3mdeb_com


