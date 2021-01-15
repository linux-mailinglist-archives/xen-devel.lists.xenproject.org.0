Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AAB2F8944
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 00:17:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68850.123384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YL5-0006TO-Ox; Fri, 15 Jan 2021 23:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68850.123384; Fri, 15 Jan 2021 23:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YL5-0006Sx-KT; Fri, 15 Jan 2021 23:17:07 +0000
Received: by outflank-mailman (input) for mailman id 68850;
 Fri, 15 Jan 2021 23:17:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yB8v=GS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l0YL4-0006Ss-3H
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 23:17:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2bd52785-6264-47f7-88b9-2fa910ec678d;
 Fri, 15 Jan 2021 23:17:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AEAE23382;
 Fri, 15 Jan 2021 23:17:04 +0000 (UTC)
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
X-Inumbo-ID: 2bd52785-6264-47f7-88b9-2fa910ec678d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610752624;
	bh=r5RAKA58kGGgpu3OFt0acB1WnPhY6zTz/BgLJ8A/Ga0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BNL7g+KJAtAsNf8hzMpJutl5MGPPrHvGZPo/MyAVbz/9Il21maC0BsYoBFJPK/CjI
	 H4O2ZVrRXDiKeEX7ASQCpXbv2CPKOLUnLOFIYrneqaPDdeiEzGnrEcK6rUcROMFWcC
	 kKVy/b5TLaoAO9F5+9kY+y7bxXPSyKrQxx+351lUAABKvP4QBE31i9xnPGthZU47tM
	 jp3Uq/jSA5HEb84BnH/OY6uatqnFvL/6Nlauv/1z6CTXCFTVCIsZS4YBprB3x6jaby
	 d6PqXUw6tiLxSfRwczw0vVEmOUejmBY4vbC5KkpSd6Bsl5O3T4UL1Vr4gCA8y2SlxP
	 48NI0J+VrG3CQ==
Date: Fri, 15 Jan 2021 15:17:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, Dario Faggioli <dario.faggioli@suse.com>, 
    "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: IRQ latency measurements in hypervisor
In-Reply-To: <878s8u43vx.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.2101151511010.31265@sstabellini-ThinkPad-T480s>
References: <87pn294szv.fsf@epam.com> <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s> <878s8u43vx.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 15 Jan 2021, Volodymyr Babchuk wrote:
> >> ARMv8 platform. Namely Renesas Rcar H3 SoC on Salvator board.
> >> 
> >> To accurately determine latency, I employed one of timer counter units
> >> (TMUs) available on the SoC. This is 32-bit timer with auto-reload,
> >> that can generate interrupt on underflow. I fed it with 33.275MHz
> >> clock, which gave me resolution of about 30ns. I programmed the timer
> >> to generate interrupt every 10ms. My ISR then read the current timer
> >> value and determined how much time passed since last underrun. This
> >> gave me time interval between IRQ generation and ISR invocation.
> >> Those values were collected and every 10 seconds statistics was
> >> calculated. There is an example of output from my Linux driver:
> >
> > It looks like a solid approach to collect results, similar to the one we
> > used for the cache coloring work. Just make sure to collect very many
> > results.
> >
> > A few of questions: did you use a single physical CPU? Are you using
> > RTDS and schedule 2 vCPU on 1 pCPU? Is dom0 idle or busy? I take the
> > results were measured in domU?
> Yes, I used single pCPU, which ran 1-2 vCPUs depending on setup. At
> first, this was only Dom0 with 1 vCPU, but in most cases it was Dom0 +
> Zephyr DomU each with 1 vCPU.
> 
> I quickly determined that 1 vCPU per 1 pCPU case meets my
> requirements. On other hand, our real cases will always have more vCPUs
> than pCPUs, so I was interested in 2 vCPUs - 1 pCPU case.
> 
> >
> >> [   83.873162] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
> >> [   94.136632] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
> >> [  104.400098] rt_eval_tmu e6fc0000.tmu: Mean: 50 (1500 ns) stddev: 129 (3870 ns)
> >> [  114.663828] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
> >> [  124.927296] rt_eval_tmu e6fc0000.tmu: Mean: 56 (1680 ns) stddev: 183 (5490 ns)
> >> 
> >> This is the baremetal Linux. And there is Dom0:
> >> 
> >> [  237.431003] rt_eval_tmu e6fc0000.tmu: Mean: 306 (9180 ns) stddev: 25 (750 ns)
> >> [  247.694506] rt_eval_tmu e6fc0000.tmu: Mean: 302 (9060 ns) stddev: 17 (510 ns)
> >> 
> >> Driver outputs both the raw timer value (eg. 4) and the same value
> >> scaled to nanoseconds (eg. 1320 ns). As you can see baremetal setup is
> >> much faster. But experiments showed that Linux does not provide
> >> consistent values, even when running in baremetal mode. You can see
> >> sporadic spikes in "std dev" values.
> >
> > So baremetal IRQ latency is 1320-1680ns and Linux IRQ latency is
> > 9060-9180ns. I am not surprised that Linux results are inconsistent but
> > I have a couple of observations:
> >
> > - 9us is high for Linux
> > If the system is idle, the latency should be lower, around 2-3us. I
> > imagine you are actually running some sort of interference from dom0? Or
> > using RTDS and descheduling vCPUs?
> 
> 9us was in idle state. Interestingly enough, I got latency if 3us while
> Dom0 was doing some CPU-intensive tasks. So, under load latency is lower
> than in idle state. I didn't investigated this, so I can't tell you what
> causes this behavior.

Did you use vwfi=native? You should definitely be able to see ~3us
without interference and with 1vCPU <-> 1pCPU


> > - the stddev of 3870ns is high for baremetal
> > In the baremetal case the stddev should be minimal if the system is
> > idle.
> 
> This is what I expected too. But nevertheless there was spikes. I didn't
> investigated this as well, so I can only speculate there. My rootfs is
> on NFS, so maybe network driver caused this spikes.

Yeah, maybe it would be best to reduce the sources of possible spikes
and get rid of NFS.


> >
> >
> >> So my next step was to use proper RT OS to do the measurements. I
> >> chose Zephyr. My PR that adds Xen support to Zephyr can be found at
> >> [1]. Support for RCAR Gen3 is not upstreamed, but is present on my
> >> GitHub([2]). At [3] you can find the source code for application that
> >> does the latency measurements. It behaves exactly as my linux driver,
> >> but provides a bit more information:
> >> 
> >>  *** Booting Zephyr OS build zephyr-v2.4.0-2750-g0f2c858a39fc  ***
> >> RT Eval app
> >> 
> >> Counter freq is 33280000 Hz. Period is 30 ns
> >> Set alarm in 0 sec (332800 ticks)
> >> Mean: 600 (18000 ns) stddev: 3737 (112110 ns) above thr: 0% [265 (7950 ns) - 66955 (2008650 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
> >> Mean: 388 (11640 ns) stddev: 2059 (61770 ns) above thr: 0% [266 (7980 ns) - 58830 (1764900 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
> >> Mean: 358 (10740 ns) stddev: 1796 (53880 ns) above thr: 0% [265 (7950 ns) - 57780 (1733400 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
> 
> This is Zephyr running as DomU.
> 
> >> ...
> >> 
> >> So there you can see: mean time, standard deviation, % of interrupts
> >> that was processed above 30us threshold, minimum and maximum latency
> >> values for the current 10s run, global minimum and maximum.
> >> 
> >> Zephyr running as baremetal showed very stable results (this is an
> >> older build, so no extended statistics there):
> >> 
> >> ## Starting application at 0x480803C0 ...
> >>  *** Booting Zephyr OS build zephyr-v2.4.0-1137-g5803ee1e8183  ***
> >> RT Eval app
> >> 
> >> Counter freq is 33280000 Hz. Period is 30 ns
> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> 
> And this is Zephyr is running as baremetal.
> 
> >> ...
> >> 
> >> As Zephyr provided stable readouts with no jitter, I used it to do all
> >> subsequent measurements.
> >
> > I am a bit confused here. Looking at the numbers above the stddev is
> > 112110 ns in the first instance. That is pretty high. Am I looking at
> > the wrong numbers?
> 
> I added some clarification above. As for 112110ns in the very first instance
> - I always ignored the first instance, assuming that things need to
> settle after domain being created.
> 
> But your comment is actually correct: what exacelt should "settle"?
> Domain is already created. All should run smoothly. So, this is worth
> investigating.

It is fair to ignore the first 2 measurements.

However, the numbers above have high stddev even at the 3rd measurement:
53us is high and above the target 30us. I take you didn't apply yet the 
alloc_heap_pages and the serial workarounds?


> >> IMPORTANT! All subsequent tests was conducted with only 1 CPU core
> >> enabled. My goal was to ensure that system can timely react to an
> >> external interrupt even under load.
> >
> > All right. FYI I have no frame of reference for 2 vCPUs on 1 pCPUs, all
> > my tests were done with 1vCPU <-> 1pCPU and the null scheduler.
> 
> As I said, I had no issues with 1vCPU <-> 1pCPU setup, so I quickly
> moved to cases which had issues.
> 
> >> Test results and latency sources
> >> 
> >> As you can see, baremetal OS provides latency of ~0.9us without any
> >> deviations. The same code running as DomU on idle system shows mean
> >> latency of 12us and deviation of about 10us. Range of latencies in a
> >> 10s batch can vary from 8us to 25us. This fits into required 30us
> >> threshold, so no big issue there.
> >> 
> >> But this worsens under certain conditions.
> >> 
> >> 1. Serial console. RCAR serial driver (scif) works in synchronous
> >>    mode, so any heavy serial console output leads to higher
> >>    latency. Tests shows mean latency of 1000us and deviation of 1332
> >>    us. 54% of interrupts are handled outside of 30us period. Real
> >>    values may be even higher, because in some cases timer would do
> >>    full cycle and instead of say 11ms ISR would read 11 % 10 = 1ms
> >>    latency. I tried to enable asynchronous mode for the serial
> >>    console. This made things better, but it lead to gaps in output, so
> >>    I just turned the serial console off completely.
> >
> > That's very interesting. I wonder if other serial drivers would cause
> > similar issues, e.g. PL011.
> 
> They should. This behavior is programmed in serial.c. Driver can enable
> async mode calling serial_async_transmit(). As I can see, only ns16550
> driver does this.
> 
> Maybe you didn't saw problems there because you had more pCPU enabled
> and Xen used some other pCPU to do UART operations.

Good to know. A workaround would be to let Dom0/DomU have direct access
to the UART, not giving any UART to Xen at all.


> >> 2. RTDS scheduler. With console disabled, things like "hexdump -v
> >>    /dev/zero" didn't affected the latency so badly, but anyways,
> >>    sometimes I got ~600us spikes. This is not a surprise, because of
> >>    default RTDS configuration. I changed period for DomU from default
> >>    10ms to 100us and things got better: with Dom0 burning CPU I am
> >>    rarely getting max latency of about ~30us with mean latency of ~9us
> >>    and deviation of ~0.5us. On other hand, when I tried to set period
> >>    to 30us, max latency rose up to ~60us.
> >
> > This is very interestingi too. Did you get any spikes with the period
> > set to 100us? It would be fantastic if there were none.
> 
> As far as I can remember, there wasn't any. At least in my setup. And
> with workaround for alloc_heap_pages() issue. Of course, I didn't
> covered all the possible use cases. But in settled state, when all
> domains are created and they are just doing owns tasks there was no
> spikes.

That's very good to hear

