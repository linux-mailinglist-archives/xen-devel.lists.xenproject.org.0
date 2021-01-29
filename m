Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48093086D1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 09:09:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77752.141011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Opt-0004xu-0V; Fri, 29 Jan 2021 08:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77752.141011; Fri, 29 Jan 2021 08:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Ops-0004xV-TZ; Fri, 29 Jan 2021 08:08:56 +0000
Received: by outflank-mailman (input) for mailman id 77752;
 Fri, 29 Jan 2021 08:08:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiRV=HA=codiax.se=anders.tornqvist@srs-us1.protection.inumbo.net>)
 id 1l5Opq-0004nH-Eg
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 08:08:55 +0000
Received: from mailrelay2-3.pub.mailoutpod1-cph3.one.com (unknown
 [46.30.212.11]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb4b61f4-bde0-4c1c-b9fa-60ba7ee39d01;
 Fri, 29 Jan 2021 08:08:51 +0000 (UTC)
Received: from [192.168.101.129] (h87-96-135-119.cust.a3fiber.se
 [87.96.135.119])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 37a648e6-6209-11eb-b55b-d0431ea8a290;
 Fri, 29 Jan 2021 08:08:49 +0000 (UTC)
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
X-Inumbo-ID: eb4b61f4-bde0-4c1c-b9fa-60ba7ee39d01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codiax.se; s=20191106;
	h=content-transfer-encoding:content-type:in-reply-to:mime-version:date:
	 message-id:from:references:to:subject:from;
	bh=uyZlAECUDHdtpxrn2ASMwrpCBkQaFI8akyZ2sIVrSg4=;
	b=Ut6Gq4itLFIlbVjJ5Gu/iaXB51Zpps4rO8ka3+ddMjalKDdAenL3yM30zcoTqQ+WKxtH9yf8fN02T
	 kR/Tfq1tEr+Rd/mphHQ30Fvs9TR6Wo5IVFnyybouf1ut+CIIOV9ufzwaOmN3jptbfVpylLvov1Y0We
	 W67kv2w3WPRYSHLcBtcckL96xUtJ4+2xEq6py49mQJEs+SupF/iwDWgrgiWpdXkndBTjBOQd1l8tF5
	 pNtvBmUp+ONd6ICgifEh4ogBH4FjqJI1Q+kqbTpHJV0nd4tmz0tLpTPHan3JNo/gpMeb0Xbs1yUU/8
	 jmfIA+4cMjSFbVdYpRK/ZZmB1uYJoRg==
X-HalOne-Cookie: d73722d7c0985d99c8bd62e16c96cb641c56f56c
X-HalOne-ID: 37a648e6-6209-11eb-b55b-d0431ea8a290
Subject: Re: Null scheduler and vwfi native problem
To: Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
From: =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Message-ID: <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
Date: Fri, 29 Jan 2021 09:08:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB

On 1/26/21 11:31 PM, Dario Faggioli wrote:
> On Tue, 2021-01-26 at 18:03 +0100, Anders Törnqvist wrote:
>> On 1/25/21 5:11 PM, Dario Faggioli wrote:
>>> On Fri, 2021-01-22 at 14:26 +0000, Julien Grall wrote:
>>>> Hi Anders,
>>>>
>>>> On 22/01/2021 08:06, Anders Törnqvist wrote:
>>>>> On 1/22/21 12:35 AM, Dario Faggioli wrote:
>>>>>> On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
>>>>> - booting with "sched=null vwfi=native" but not doing the IRQ
>>>>> passthrough that you mentioned above
>>>>> "xl destroy" gives
>>>>> (XEN) End of domain_destroy function
>>>>>
>>>>> Then a "xl create" says nothing but the domain has not started
>>>>> correct.
>>>>> "xl list" look like this for the domain:
>>>>> mydomu                                   2   512     1 ------
>>>>> 0.0
>>>> This is odd. I would have expected ``xl create`` to fail if
>>>> something
>>>> went wrong with the domain creation.
>>>>
>>> So, Anders, would it be possible to issue a:
>>>
>>> # xl debug-keys r
>>> # xl dmesg
>>>
>>> And send it to us ?
>>>
>>> Ideally, you'd do it:
>>>    - with Julien's patch (the one he sent the other day, and that
>>> you
>>>      have already given a try to) applied
>>>    - while you are in the state above, i.e., after having tried to
>>>      destroy a domain and failing
>>>    - and maybe again after having tried to start a new domain
>> Here are some logs.
>>
> Great, thanks a lot!
>
>> The system is booted as before with the patch and the domu config
>> does
>> not have the IRQs.
>>
> Ok.
>
>> # xl list
>> Name                                        ID   Mem VCPUs State
>> Time(s)
>> Domain-0                                     0  3000     5 r-----
>> 820.1
>> mydomu                                       1   511     1 r-----
>> 157.0
>>
>> # xl debug-keys r
>> (XEN) sched_smt_power_savings: disabled
>> (XEN) NOW=191793008000
>> (XEN) Online Cpus: 0-5
>> (XEN) Cpupool 0:
>> (XEN) Cpus: 0-5
>> (XEN) Scheduler: null Scheduler (null)
>> (XEN)     cpus_free =
>> (XEN) Domain info:
>> (XEN)     Domain: 0
>> (XEN)       1: [0.0] pcpu=0
>> (XEN)       2: [0.1] pcpu=1
>> (XEN)       3: [0.2] pcpu=2
>> (XEN)       4: [0.3] pcpu=3
>> (XEN)       5: [0.4] pcpu=4
>> (XEN)     Domain: 1
>> (XEN)       6: [1.0] pcpu=5
>> (XEN) Waitqueue:
>>
> So far, so good. All vCPUs are running on their assigned pCPU, and
> there is no vCPU wanting to run but not having a vCPU where to do so.
>
>> (XEN) Command line: console=dtuart dtuart=/serial@5a060000
>> dom0_mem=3000M dom0_max_vcpus=5 hmp-unsafe=true dom0_vcpus_pin
>> sched=null vwfi=native
>>
> Oh, just as a side note (and most likely unrelated to the problem we're
> discussing), you should be able to get rid of dom0_vcpus_pin.
>
> The NULL scheduler will do something similar to what that option itself
> does anyway. And with the benefit that, if you want, you can actually
> change to what pCPUs the dom0's vCPU are pinned. While, if you use
> dom0_vcpus_pin, you can't.
>
> So it using it has only downsides (and that's true in general, if you
> ask me, but particularly so if using NULL).
Thanks for the feedback.
I removed dom0_vcpus_pin. And, as you said, it seems to be unrelated to 
the problem we're discussing. The system still behaves the same.

When the dom0_vcpus_pin is removed. xl vcpu-list looks like this:

Name                                ID  VCPU   CPU State Time(s) 
Affinity (Hard / Soft)
Domain-0                             0     0    0   r--      29.4 all / all
Domain-0                             0     1    1   r--      28.7 all / all
Domain-0                             0     2    2   r--      28.7 all / all
Domain-0                             0     3    3   r--      28.6 all / all
Domain-0                             0     4    4   r--      28.6 all / all
mydomu                              1     0    5   r--      21.6 5 / all

 From this listing (with "all" as hard affinity for dom0) one might read 
it like dom0 is not pinned with hard affinity to any specific pCPUs at 
all but mudomu is pinned to pCPU 5.
Will the dom0_max_vcpus=5 in this case guarantee that dom0 only will run 
on pCPU 0-4 so that mydomu always will have pCPU 5 for itself only?

What if I would like mydomu to be th only domain that uses pCPU 2?

>
>> # xl destroy mydomu
>> (XEN) End of domain_destroy function
>>
>> # xl list
>> Name                                        ID   Mem VCPUs State
>> Time(s)
>> Domain-0                                     0  3000     5 r-----
>> 1057.9
>>
>> # xl debug-keys r
>> (XEN) sched_smt_power_savings: disabled
>> (XEN) NOW=223871439875
>> (XEN) Online Cpus: 0-5
>> (XEN) Cpupool 0:
>> (XEN) Cpus: 0-5
>> (XEN) Scheduler: null Scheduler (null)
>> (XEN)     cpus_free =
>> (XEN) Domain info:
>> (XEN)     Domain: 0
>> (XEN)       1: [0.0] pcpu=0
>> (XEN)       2: [0.1] pcpu=1
>> (XEN)       3: [0.2] pcpu=2
>> (XEN)       4: [0.3] pcpu=3
>> (XEN)       5: [0.4] pcpu=4
>> (XEN)     Domain: 1
>> (XEN)       6: [1.0] pcpu=5
>>
> Right. And from the fact that: 1) we only see the "End of
> domain_destroy function" line in the logs, and 2) we see that the vCPU
> is still listed here, we have our confirmation (like there wase the
> need for it :-/) that domain destruction is done only partially.
Yes it looks like that.
>
>> # xl create mydomu.cfg
>> Parsing config from mydomu.cfg
>> (XEN) Power on resource 215
>>
>> # xl list
>> Name                                        ID   Mem VCPUs State
>> Time(s)
>> Domain-0                                     0  3000     5 r-----
>> 1152.1
>> mydomu                                       2   512     1 ------
>>         0.0
>>
>> # xl debug-keys r
>> (XEN) sched_smt_power_savings: disabled
>> (XEN) NOW=241210530250
>> (XEN) Online Cpus: 0-5
>> (XEN) Cpupool 0:
>> (XEN) Cpus: 0-5
>> (XEN) Scheduler: null Scheduler (null)
>> (XEN)     cpus_free =
>> (XEN) Domain info:
>> (XEN)     Domain: 0
>> (XEN)       1: [0.0] pcpu=0
>> (XEN)       2: [0.1] pcpu=1
>> (XEN)       3: [0.2] pcpu=2
>> (XEN)       4: [0.3] pcpu=3
>> (XEN)       5: [0.4] pcpu=4
>> (XEN)     Domain: 1
>> (XEN)       6: [1.0] pcpu=5
>> (XEN)     Domain: 2
>> (XEN)       7: [2.0] pcpu=-1
>> (XEN) Waitqueue: d2v0
>>
> Yep, so, as we were suspecting, domain 1 was not destroyed properly.
> Specifically, we did not get to the point where the vCPU is deallocated
> and the pCPU to which such vCPU has been assigned to by the NULL
> scheduler is released.
>
> This means that the new vCPU (i.e., d2v0) has, from the point of view
> of the NULL scheduler, no pCPU where to run. And it's therefore parked
> in the waitqueue.
>
> There should be a warning about that, which I don't see... but perhaps
> I'm just misremembering.
>
> Anyway, cool, this makes things even more clear.
>
> Thanks again for letting us see these logs.

Thanks for the attention to this :-)

Any ideas for how to solve it?



