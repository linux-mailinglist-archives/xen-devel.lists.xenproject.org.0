Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9C8797B0
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 16:36:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691917.1078504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4AP-0008N8-2D; Tue, 12 Mar 2024 15:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691917.1078504; Tue, 12 Mar 2024 15:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk4AO-0008Ko-Vo; Tue, 12 Mar 2024 15:35:48 +0000
Received: by outflank-mailman (input) for mailman id 691917;
 Tue, 12 Mar 2024 15:35:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t7HW=KS=3mdeb.com=krystian.hebel@srs-se1.protection.inumbo.net>)
 id 1rk4AN-0008Ki-WD
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 15:35:48 +0000
Received: from 9.mo581.mail-out.ovh.net (9.mo581.mail-out.ovh.net
 [46.105.60.248]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32304e37-e086-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 16:35:46 +0100 (CET)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.176.37])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4TvHm23SNgz1DHG
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 15:35:46 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-ksdnp (unknown [10.110.178.147])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id CE31A1FEA4;
 Tue, 12 Mar 2024 15:35:45 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.99])
 by ghost-submission-6684bf9d7b-ksdnp with ESMTPSA
 id pqqIKFF28GUh5AAA91y3uA
 (envelope-from <krystian.hebel@3mdeb.com>); Tue, 12 Mar 2024 15:35:45 +0000
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
X-Inumbo-ID: 32304e37-e086-11ee-afdd-a90da7624cb6
Authentication-Results:garm.ovh; auth=pass (GARM-99G0039d1a54e5-0c14-4bd0-8947-d484040bc86f,
                    0B6B113C544506A41C6EB031E0F94F2E66B6AEBC) smtp.auth=krystian.hebel@3mdeb.com
X-OVh-ClientIp:217.171.61.25
Message-ID: <dcb84a51-b0c3-4668-b344-c60d89968260@3mdeb.com>
Date: Tue, 12 Mar 2024 16:35:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/9] x86/smp: drop x86_cpu_to_apicid, use
 cpu_data[cpu].apicid instead
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <8121d9b472b305be751158aa3af3fed98ff0572e.1699982111.git.krystian.hebel@3mdeb.com>
 <0d776dcc-af14-436a-bf8b-9bfb39b787b8@suse.com>
From: Krystian Hebel <krystian.hebel@3mdeb.com>
In-Reply-To: <0d776dcc-af14-436a-bf8b-9bfb39b787b8@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8525877045417519472
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvledrjeefgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomhepmfhrhihsthhirghnucfjvggsvghluceokhhrhihsthhirghnrdhhvggsvghlseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejuedvffefvdeuvdeffeduuddtjeetgeefffdugfdvkeehtedutefghfdtteejieenucffohhmrghinhepfehmuggvsgdrtghomhenucfkphepuddvjedrtddrtddruddpvddujedrudejuddriedurddvhedpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehkrhihshhtihgrnhdrhhgvsggvlhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht


On 8.02.2024 08:29, Jan Beulich wrote:
> On 14.11.2023 18:50, Krystian Hebel wrote:
>> Both fields held the same data.
> Supposedly the same data only. They come from different origins, and you're
> hiding this quite well by leaving all sites in place where the field is
> written. Both items are also used for entirely separate purposes. So you
> need to
> - explain why both sources of information necessarily provide the same
>    data,
> - especially if there's remaining concern from the above explanation that
>    the two values might end up different in corner cases (running
>    virtualized ourselves comes to mind as a possible example), explain why
>    nevertheless it is fine (risk free) to use the consolidated item for
>    all of the originally separate purposes,
> - either explain or do away with the multiple places setting this single
>    remaining field.
I missed those writes, thanks for pointing this out. I'll have to take
a closer look before deciding what to do with this.
>
>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -61,10 +61,8 @@ unsigned int __read_mostly nr_sockets;
>>   cpumask_t **__read_mostly socket_cpumask;
>>   static cpumask_t *secondary_socket_cpumask;
>>   
>> -struct cpuinfo_x86 cpu_data[NR_CPUS];
>> -
>> -u32 x86_cpu_to_apicid[NR_CPUS] __read_mostly =
>> -	{ [0 ... NR_CPUS-1] = BAD_APICID };
>> +struct cpuinfo_x86 cpu_data[NR_CPUS] =
>> +        { [0 ... NR_CPUS-1] .apicid = BAD_APICID };
> Nit: Stray blank after closing square bracket.
>
> Jan

-- 
Krystian Hebel
Firmware Engineer
https://3mdeb.com | @3mdeb_com


