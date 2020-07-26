Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4EBB22E281
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jul 2020 22:27:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jznDQ-0002lX-Vc; Sun, 26 Jul 2020 20:25:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kb6m=BF=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1jznDP-0002lS-Sq
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2020 20:25:47 +0000
X-Inumbo-ID: 2f8e0b70-cf7e-11ea-8a5d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2f8e0b70-cf7e-11ea-8a5d-bc764e2007e4;
 Sun, 26 Jul 2020 20:25:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8ACAA31B;
 Sun, 26 Jul 2020 13:25:45 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC8313F66E;
 Sun, 26 Jul 2020 13:25:44 -0700 (PDT)
Subject: Re: dom0 LInux 5.8-rc5 kernel failing to initialize cooling maps for
 Allwinner H6 SoC
To: Alejandro <alejandro.gonzalez.correo@gmail.com>,
 Julien Grall <julien@xen.org>
References: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
 <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
 <CA+wirGpFvLBzYRBaq8yspJj8j9-yoLwN88bt079qM5yqPTwtcA@mail.gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <02b630bd-22e0-afde-6784-be068d0948ae@arm.com>
Date: Sun, 26 Jul 2020 21:24:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+wirGpFvLBzYRBaq8yspJj8j9-yoLwN88bt079qM5yqPTwtcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/07/2020 12:20, Alejandro wrote:

Hi,

> El vie., 24 jul. 2020 a las 12:45, Julien Grall (<julien@xen.org>) escribió:
>>> I'm trying Xen 4.13.1 in a Allwinner H6 SoC (more precisely a Pine H64
>>> model B, with a ARM Cortex-A53 CPU).
>>> I managed to get a dom0 Linux 5.8-rc5 kernel running fine, unpatched,
>>> and I'm using the upstream device tree for
>>> my board. However, the dom0 kernel has trouble when reading some DT
>>> nodes that are related to the CPUs, and
>>> it can't initialize the thermal subsystem properly, which is a kind of
>>> showstopper for me, because I'm concerned
>>> that letting the CPU run at the maximum frequency without watching out
>>> its temperature may cause overheating.
>>
>> I understand this concern, I am aware of some efforts to get CPUFreq
>> working on Xen but I am not sure if there is anything available yet. I
>> have CCed a couple of more person that may be able to help here.
> 
> Thank you for the CCs. I hope they can bring on some insight about this :)
> 
>>> The relevant kernel messages are:
>>>
>>> [  +0.001959] sun50i-cpufreq-nvmem: probe of sun50i-cpufreq-nvmem
>>> failed with error -2
>>> ...
>>> [  +0.003053] hw perfevents: failed to parse interrupt-affinity[0] for pmu
>>> [  +0.000043] hw perfevents: /pmu: failed to register PMU devices!
>>> [  +0.000037] armv8-pmu: probe of pmu failed with error -22
>>
>> I am not sure the PMU failure is related to the thermal failure below.
> 
> I'm not sure either, but after comparing the kernel messages for a
> boot with and without Xen, those were the differences (excluding, of
> course, the messages that inform that the Xen hypervisor console is
> being used and such). For the sake of completeness, I decided to
> mention it anyway.
> 
>>> [  +0.000163] OF: /thermal-zones/cpu-thermal/cooling-maps/map0: could
>>> not find phandle
>>> [  +0.000063] thermal_sys: failed to build thermal zone cpu-thermal: -22
>> Would it be possible to paste the device-tree node for
>> /thermal-zones/cpu-thermal/cooling-maps? I suspect the issue is because
>> we recreated /cpus from scratch.
>>
>> I don't know much about how the thermal subsystem works, but I suspect
>> this will not be enough to get it working properly on Xen. For a
>> workaround, you would need to create a dom0 with the same numbers of
>> vCPU as the numbers of pCPUs. They would also need to be pinned.
>>
>> I will leave the others to fill in more details.
> 
> I think I should mention that I've tried to hackily fix things by
> removing the make_cpus_node call on handle_node
> (https://github.com/xen-project/xen/blob/master/xen/arch/arm/domain_build.c#L1585),
> after removing the /cpus node from the skip_matches array. This way,
> the original /cpus node was passed through, without being recreated by
> Xen. Of course, I made sure that dom0 used the same number of vCPUs as
> pCPUs, because otherwise things would probably blow up, which luckily
> that was not a compromise for me. The end result was that the
> aforementioned kernel error messages were gone, and the thermal
> subsystem worked fine again. However, this time the cpufreq-dt probe
> failed, with what I think was an ENODEV error. This left the CPU
> locked at the boot frequency of less than 1 GHz, compared to the
> maximum 1.8 GHz frequency that the SoC supports, which has bad
> implications for performance.

So this was actually my first thought: The firmware (U-Boot SPL) sets up
some basic CPU frequency (888 MHz for H6 [1]), which is known to never
overheat the chip, even under full load. So any concern from your side
about the board or SoC overheating could be dismissed, with the current
mainline code, at least. However you lose the full speed, by quite a
margin on the H6 (on the A64 it's only 816 vs 1200(ish) MHz).
However, without the clock entries in the CPU node, the frequency would
never be changed by Dom0 anyway (nor by Xen, which doesn't even know how
to do this).
So from a practical point of view: unless you hack Xen to pass on more
cpu node properties, you are stuck at 888 MHz anyway, and don't need to
worry about overheating.

Now if you would pass on the CPU clock frequency control to Dom0, you
run into more issues: the Linux governors would probably try to setup
both frequency and voltage based on load, BUT this would be Dom0's bogus
perception of the actual system load. Even with pinned Dom0 vCPUs, a
busy system might spend most of its CPU time in DomU VCPUs, which
probably makes it look mostly idle in Dom0. Using a fixed governor
(performance) would avoid this, at the cost of running full speed all of
the time, probably needlessly.

So fixing the CPU clocking issue is more complex and requires more
ground work in Xen first, probably involving some enlightenend Dom0
drivers as well. I didn't follow latest developments in this area, nor
do I remember x86's answer to this, but it's not something easy, I would
presume.

Alejandro: can you try to measure the actual CPU frequency in Dom0?
Maybe some easy benchmark? "mhz" from lmbench does a great job in
telling you the actual frequency, just by clever measurement. But any
other CPU bound benchmark would do, if you compare bare metal Linux vs.
Dom0.
Also, does cpufreq come up in Dom0 at all? Can you select governors and
frequencies?

Cheers,
Andre.

> Therefore, as it seems that passing more properties (like
> #cooling-cells) is enough to get temperatures working, I suspect that
> fixing the thermal issue is relatively easy, at least for my SoC. But
> maybe I have just been lucky and that's not supposed to work anyway;
> I'm not sure.
> 
>>>
>>> I've searched for issues, code or commits that may be related for this
>>> issue. The most relevant things I found are:
>>>
>>> - A patch that blacklists the A53 PMU:
>>> https://patchwork.kernel.org/patch/10899881/
>>> - The handle_node function in xen/arch/arm/domain_build.c:
>>> https://github.com/xen-project/xen/blob/master/xen/arch/arm/domain_build.c#L1427
>>
>> I remember this discussion. The problem was that the PMU is using
>> per-CPU interrupts. Xen is not yet able to handle PPIs as they often
>> requires more context to be saved/restored (in this case the PMU context).
>>
>> There was a proposal to look if a device is using PPIs and just remove
>> them from the Device-Tree. Unfortunately, I haven't seen any official
>> submission for this patch.
>>
>> Did you have to apply the patch to boot up? If not, then the error above
>> shouldn't be a concern. However, if you need PMU support for the using
>> thermal devices then it is going to require some work.
> 
> No, I didn't apply any patch to Xen whatsoever. It worked fine out of
> the box. As I mentioned above, with a more complete /cpus node
> declaration, the thermal subsystem works. I guess the PMU worked fine
> too, but I didn't test it in any way, so maybe it is just barely able
> to probe successfully somehow.
> 
>>> I've thought about removing "/cpus" from the skip_matches array in the
>>> handle_node function, but I'm not sure
>>> that would be a good fix.
>>
>> The node "/cpus" and its sub-node are recreated by Xen for Dom0. This is
>> because Dom0 may have a different numbers of vCPUs and it doesn't seen
>> the pCPUs.
>>
>> If you don't skip "/cpus" from the host DT then you would end up with
>> two "/cpus" path in your dom0 DT. Mostly likely, Linux will not be happy
>> with it.
> 
> Indeed, that is consistent with my observations of how the source code
> works. Thanks for the confirmation :)
> 
>> I vaguely remember some discussions on how to deal with CPUFreq in Xen.
>> IIRC we agreed that Dom0 should be part of the equation because it
>> already contains all the drivers. However, I can't remember if we agreed
>> how the dom0 would be made aware of the pCPUs.
> 
> That makes sense. Supporting every existing thermal and cpufreq method
> in every ARM SoC seems like a lot of unneeded duplication of work,
> provided that Linux already has pretty good support for that. But, if
> that's the case, I guess we should not mark the "dom0-kernel" cpufreq
> boot parameter as deprecated in the documentation, at least for the
> ARM platform: http://xenbits.xen.org/docs/unstable/misc/xen-command-line.html#cpufreq
> 


