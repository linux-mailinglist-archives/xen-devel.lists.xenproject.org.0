Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCEE230882
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 13:19:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0NdC-0004Ve-EZ; Tue, 28 Jul 2020 11:18:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FtAL=BH=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1k0NdB-0004VZ-9w
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 11:18:49 +0000
X-Inumbo-ID: 1af5f8de-d0c4-11ea-8b27-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 1af5f8de-d0c4-11ea-8b27-bc764e2007e4;
 Tue, 28 Jul 2020 11:18:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D6D51FB;
 Tue, 28 Jul 2020 04:18:47 -0700 (PDT)
Received: from [192.168.2.22] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49F283F66E;
 Tue, 28 Jul 2020 04:18:46 -0700 (PDT)
Subject: Re: dom0 LInux 5.8-rc5 kernel failing to initialize cooling maps for
 Allwinner H6 SoC
To: Alejandro <alejandro.gonzalez.correo@gmail.com>
References: <CA+wirGqXMoRkS-aJmfFLipUv8SdY5LKV1aMrF0yKRJQaMvzs6Q@mail.gmail.com>
 <1c5cee83-295e-cc02-d018-b53ddc6e3590@xen.org>
 <CA+wirGpFvLBzYRBaq8yspJj8j9-yoLwN88bt079qM5yqPTwtcA@mail.gmail.com>
 <02b630bd-22e0-afde-6784-be068d0948ae@arm.com>
 <CA+wirGoG+im2mwb2ye6j4MpcVtfQ-prhhmVgdBTosus7hjeu=w@mail.gmail.com>
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <e091c32f-d121-d549-a2fa-f906d28ff8f1@arm.com>
Date: Tue, 28 Jul 2020 12:17:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+wirGoG+im2mwb2ye6j4MpcVtfQ-prhhmVgdBTosus7hjeu=w@mail.gmail.com>
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
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/07/2020 11:39, Alejandro wrote:
> Hello,
> 
> El dom., 26 jul. 2020 a las 22:25, André Przywara
> (<andre.przywara@arm.com>) escribió:
>> So this was actually my first thought: The firmware (U-Boot SPL) sets up
>> some basic CPU frequency (888 MHz for H6 [1]), which is known to never
>> overheat the chip, even under full load. So any concern from your side
>> about the board or SoC overheating could be dismissed, with the current
>> mainline code, at least. However you lose the full speed, by quite a
>> margin on the H6 (on the A64 it's only 816 vs 1200(ish) MHz).
>> However, without the clock entries in the CPU node, the frequency would
>> never be changed by Dom0 anyway (nor by Xen, which doesn't even know how
>> to do this).
>> So from a practical point of view: unless you hack Xen to pass on more
>> cpu node properties, you are stuck at 888 MHz anyway, and don't need to
>> worry about overheating.
> Thank you. Knowing that at least it won't overheat is a relief. But
> the performance definitely suffers from the current situation, and
> quite a bit. I'm thinking about using KVM instead: even if it does
> less paravirtualization of guests,

What is this statement based on? I think on ARM this never really
applied, and in general whether you do virtio or xen front-end/back-end
does not really matter. IMHO any reasoning about performance just based
on software architecture is mostly flawed (because it's complex and
reality might have missed some memos ;-) So just measure your particular
use case, then you know.

> I'm sure that the ability to use
> the maximum frequency of the CPU would offset the additional overhead,
> and in general offer better performance. But with KVM I lose the
> ability to have individual domU's dedicated to some device driver,
> which is a nice thing to have from a security standpoint.

I understand the theoretical merits, but a) does this really work on
your board and b) is this really more secure? What do you want to
protect against?

>> Now if you would pass on the CPU clock frequency control to Dom0, you
>> run into more issues: the Linux governors would probably try to setup
>> both frequency and voltage based on load, BUT this would be Dom0's bogus
>> perception of the actual system load. Even with pinned Dom0 vCPUs, a
>> busy system might spend most of its CPU time in DomU VCPUs, which
>> probably makes it look mostly idle in Dom0. Using a fixed governor
>> (performance) would avoid this, at the cost of running full speed all of
>> the time, probably needlessly.
>>
>> So fixing the CPU clocking issue is more complex and requires more
>> ground work in Xen first, probably involving some enlightenend Dom0
>> drivers as well. I didn't follow latest developments in this area, nor
>> do I remember x86's answer to this, but it's not something easy, I would
>> presume.
> I understand, thanks :). I know that recent Intel CPUs (from Sandy
> Bridge onwards) use P-states to manage frequencies, and even have a
> mode of operation that lets the CPU select the P-states by itself. On
> older processors, Xen can probably rely on ACPI data to do the
> frequency scaling. But the most similar "standard thing" that my board
> has, a AR100 coprocessor that with the (work in progress) Crust
> firmware can be used with SCMI, doesn't even seem to support the use
> case of changing CPU frequency... and SCMI is the most promising
> approach for adding DVFS support in Xen for ARM, according to this
> previous work: https://www.slideshare.net/xen_com_mgr/xpdds18-cpufreq-in-xen-on-arm-oleksandr-tyshchenko-epam-systems

So architecturally you could run all cores at full speed, always, and
tell Crust to clock down / decrease voltage once a thermal condition
triggers. That's not power-saving, but at least should be relatively safe.
On Allwinner platforms this isn't really bullet-proof, though, since the
THS device is non-secure, so anyone with access to the MMIO region could
turn it off. Or Dom0 could just turn the THS clock off - which it
actually does, because it's not used.
In the end it's a much bigger discussion about doing those things in
firmware or in the OS. For those traditionally embedded platforms like
Allwinner there is a huge fraction that does not trust firmware,
unfortunately, so moving responsibility to firmware is not very popular
upstream (been there, done that).

>> Alejandro: can you try to measure the actual CPU frequency in Dom0?
>> Maybe some easy benchmark? "mhz" from lmbench does a great job in
>> telling you the actual frequency, just by clever measurement. But any
>> other CPU bound benchmark would do, if you compare bare metal Linux vs.
>> Dom0.
> I have measured the CPU frequency in Dom0 using lmbench several times
> and it seems to be stuck at 888 MHz, the frequency set by U-Boot.
> Overall, the system feels more sluggish than when using bare Linux,
> too. It doesn't matter if I apply the "hacky fix" I mentioned before
> or not.>
>> Also, does cpufreq come up in Dom0 at all? Can you select governors and
>> frequencies?
> It doesn't come up, and no sysfs entries are created for cpufreq. With
> the "fix", the kernel prints an error message complaining that it
> couldn't probe cpufreq-dt, but it still doesn't come up, and sysfs
> entries for cpufreq aren't created either.

I see, many thanks for doing this, as this seems to confirm my assumptions.

If you have good cooling in place, or always one hand on the power plug,
you could change U-Boot to bump up the CPU frequency (make menuconfig,
search for CONFIG_SYS_CLK_FREQ). Then you could at least see if your
observed performance issues are related to the core frequency. You might
need to adjust the CPU voltage, too.

Cheers,
Andre

