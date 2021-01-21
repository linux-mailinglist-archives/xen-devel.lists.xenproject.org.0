Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7A92FDE40
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 02:00:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71838.128976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2OKE-0000GC-Fw; Thu, 21 Jan 2021 00:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71838.128976; Thu, 21 Jan 2021 00:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2OKE-0000Fp-Cd; Thu, 21 Jan 2021 00:59:50 +0000
Received: by outflank-mailman (input) for mailman id 71838;
 Thu, 21 Jan 2021 00:59:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mrjv=GY=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l2OKC-0000Fk-N9
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 00:59:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 770715d0-4e7b-46db-9833-9a7d4062c521;
 Thu, 21 Jan 2021 00:59:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8D7923437;
 Thu, 21 Jan 2021 00:59:46 +0000 (UTC)
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
X-Inumbo-ID: 770715d0-4e7b-46db-9833-9a7d4062c521
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611190787;
	bh=kknEBLd3PZ+kMM9O7WU1HoxiU4QVp5AYByh52woIuAs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cA8wHPTwas7EuCmHW4MQaXVgacjs+tPjFWG9mHgH0EEtJNizQ6IAitOER6EDcJRhI
	 1bvgZjJ4B3ZYcJ/wGB5ZlDz46DGdOxaa5QF77J4DTcJjnfWq7qU3kh9dHRu8Jsd2LB
	 67FhCWShYGpfS0VHS1pstX5p8nvLUk3A4ftRU97GOw+1pE00YuFXQdPYTQD+eLXrip
	 zHzbUdvv6cFb1zP6CECg+xOGZ8OVrIpt+I2KHlrMadxYpfsZultxzy9x7gDTRAmt4w
	 wD/5hPFdPLH/pRsiumWRyY8C/DXXEAZEBzaLZDr/S4ImZVgXW9+wD/TfGDF2hm4Uhk
	 Q4TYQiFo6a1qQ==
Date: Wed, 20 Jan 2021 16:59:46 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Julien Grall <jgrall@amazon.com>, Dario Faggioli <dario.faggioli@suse.com>, 
    "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>, 
    "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
Subject: Re: IRQ latency measurements in hypervisor
In-Reply-To: <871ref2jxp.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.2101201654430.14528@sstabellini-ThinkPad-T480s>
References: <87pn294szv.fsf@epam.com> <alpine.DEB.2.21.2101141515230.31265@sstabellini-ThinkPad-T480s> <878s8u43vx.fsf@epam.com> <alpine.DEB.2.21.2101151511010.31265@sstabellini-ThinkPad-T480s> <871ref2jxp.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 21 Jan 2021, Volodymyr Babchuk wrote:
> > On Fri, 15 Jan 2021, Volodymyr Babchuk wrote:
> [...]
> >> >> [   83.873162] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
> >> >> [   94.136632] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
> >> >> [  104.400098] rt_eval_tmu e6fc0000.tmu: Mean: 50 (1500 ns) stddev: 129 (3870 ns)
> >> >> [  114.663828] rt_eval_tmu e6fc0000.tmu: Mean: 44 (1320 ns) stddev: 8 (240 ns)
> >> >> [  124.927296] rt_eval_tmu e6fc0000.tmu: Mean: 56 (1680 ns) stddev: 183 (5490 ns)
> >> >> 
> >> >> This is the baremetal Linux. And there is Dom0:
> >> >> 
> >> >> [  237.431003] rt_eval_tmu e6fc0000.tmu: Mean: 306 (9180 ns) stddev: 25 (750 ns)
> >> >> [  247.694506] rt_eval_tmu e6fc0000.tmu: Mean: 302 (9060 ns) stddev: 17 (510 ns)
> >> >> 
> >> >> Driver outputs both the raw timer value (eg. 4) and the same value
> >> >> scaled to nanoseconds (eg. 1320 ns). As you can see baremetal setup is
> >> >> much faster. But experiments showed that Linux does not provide
> >> >> consistent values, even when running in baremetal mode. You can see
> >> >> sporadic spikes in "std dev" values.
> >> >
> >> > So baremetal IRQ latency is 1320-1680ns and Linux IRQ latency is
> >> > 9060-9180ns. I am not surprised that Linux results are inconsistent but
> >> > I have a couple of observations:
> >> >
> >> > - 9us is high for Linux
> >> > If the system is idle, the latency should be lower, around 2-3us. I
> >> > imagine you are actually running some sort of interference from dom0? Or
> >> > using RTDS and descheduling vCPUs?
> >> 
> >> 9us was in idle state. Interestingly enough, I got latency if 3us while
> >> Dom0 was doing some CPU-intensive tasks. So, under load latency is lower
> >> than in idle state. I didn't investigated this, so I can't tell you what
> >> causes this behavior.
> >
> > Did you use vwfi=native? You should definitely be able to see ~3us
> > without interference and with 1vCPU <-> 1pCPU
> 
> With vwfi=native things in Dom0 got better, but it is still not 3us:
> 
> [   41.563904] rt_eval_tmu e6fc0000.tmu: Mean: 173 (5190 ns) stddev: 15 (450 ns) min: 125 (3750 ns) max: 276102 (8283060 ns)
> [   51.820403] rt_eval_tmu e6fc0000.tmu: Mean: 172 (5160 ns) stddev: 8 (240 ns) min: 125 (3750 ns) max: 276102 (8283060 ns)
> [   62.076898] rt_eval_tmu e6fc0000.tmu: Mean: 172 (5160 ns) stddev: 9 (270 ns) min: 125 (3750 ns) max: 276102 (8283060 ns)
> [   72.333377] rt_eval_tmu e6fc0000.tmu: Mean: 171 (5130 ns) stddev: 9 (270 ns) min: 125 (3750 ns) max: 276102 (8283060 ns)
> [   82.589852] rt_eval_tmu e6fc0000.tmu: Mean: 172 (5160 ns) stddev: 10 (300 ns) min: 125 (3750 ns) max: 276102 (8283060 ns)
> 
> And DomU (as Julien suggested) is extremely unhappy:
> 
> Mean: 282 (8460 ns) stddev: 412 (12360 ns) above thr: 4% [109 (3270 ns) - 2245 (67350 ns)] global [108 (3240 ns) 74261 (2227830 ns)]
> Mean: 958 (28740 ns) stddev: 860 (25800 ns) above thr: 50% [120 (3600 ns) - 2253 (67590 ns)] global [108 (3240 ns) 74261 (2227830 ns)]
> Mean: 713 (21390 ns) stddev: 533 (15990 ns) above thr: 37% [114 (3420 ns) - 2186 (65580 ns)] global [108 (3240 ns) 74261 (2227830 ns)]

I should have clarified "without oversubscription". In other words, with
every vcpu running on a different pcpu. I realize this is not the
scenario you care about, but it was mostly to calculate the best latency
overhead we can achieve on your hardware platform as reference.


> >> >> So my next step was to use proper RT OS to do the measurements. I
> >> >> chose Zephyr. My PR that adds Xen support to Zephyr can be found at
> >> >> [1]. Support for RCAR Gen3 is not upstreamed, but is present on my
> >> >> GitHub([2]). At [3] you can find the source code for application that
> >> >> does the latency measurements. It behaves exactly as my linux driver,
> >> >> but provides a bit more information:
> >> >> 
> >> >>  *** Booting Zephyr OS build zephyr-v2.4.0-2750-g0f2c858a39fc  ***
> >> >> RT Eval app
> >> >> 
> >> >> Counter freq is 33280000 Hz. Period is 30 ns
> >> >> Set alarm in 0 sec (332800 ticks)
> >> >> Mean: 600 (18000 ns) stddev: 3737 (112110 ns) above thr: 0% [265 (7950 ns) - 66955 (2008650 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
> >> >> Mean: 388 (11640 ns) stddev: 2059 (61770 ns) above thr: 0% [266 (7980 ns) - 58830 (1764900 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
> >> >> Mean: 358 (10740 ns) stddev: 1796 (53880 ns) above thr: 0% [265 (7950 ns) - 57780 (1733400 ns)] global [265 (7950 ns) 66955 (2008650 ns)]
> >> 
> >> This is Zephyr running as DomU.
> >> 
> >> >> ...
> >> >> 
> >> >> So there you can see: mean time, standard deviation, % of interrupts
> >> >> that was processed above 30us threshold, minimum and maximum latency
> >> >> values for the current 10s run, global minimum and maximum.
> >> >> 
> >> >> Zephyr running as baremetal showed very stable results (this is an
> >> >> older build, so no extended statistics there):
> >> >> 
> >> >> ## Starting application at 0x480803C0 ...
> >> >>  *** Booting Zephyr OS build zephyr-v2.4.0-1137-g5803ee1e8183  ***
> >> >> RT Eval app
> >> >> 
> >> >> Counter freq is 33280000 Hz. Period is 30 ns
> >> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> >> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> >> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> >> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> >> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> >> >> Mean: 31 (930 ns) stddev: 0 (0 ns)
> >> 
> >> And this is Zephyr is running as baremetal.
> >> 
> >> >> ...
> >> >> 
> >> >> As Zephyr provided stable readouts with no jitter, I used it to do all
> >> >> subsequent measurements.
> >> >
> >> > I am a bit confused here. Looking at the numbers above the stddev is
> >> > 112110 ns in the first instance. That is pretty high. Am I looking at
> >> > the wrong numbers?
> >> 
> >> I added some clarification above. As for 112110ns in the very first instance
> >> - I always ignored the first instance, assuming that things need to
> >> settle after domain being created.
> >> 
> >> But your comment is actually correct: what exacelt should "settle"?
> >> Domain is already created. All should run smoothly. So, this is worth
> >> investigating.
> >
> > It is fair to ignore the first 2 measurements.
> >
> > However, the numbers above have high stddev even at the 3rd measurement:
> > 53us is high and above the target 30us. I take you didn't apply yet the 
> > alloc_heap_pages and the serial workarounds?
> 
> Yes, this is the very first try. Without workarounds and proper
> scheduler configuration.
> 
> With all fixes it is much better:
> 
> Mean: 307 (9210 ns) stddev: 4 (120 ns) above thr: 0% [265 (7950 ns) - 376 (11280 ns)] global [265 (7950 ns) 376 (11280 ns)]
> Mean: 306 (9180 ns) stddev: 3 (90 ns) above thr: 0% [263 (7890 ns) - 360 (10800 ns)] global [263 (7890 ns) 376 (11280 ns)]
> Mean: 306 (9180 ns) stddev: 3 (90 ns) above thr: 0% [298 (8940 ns) - 373 (11190 ns)] global [263 (7890 ns) 376 (11280 ns)]
> Mean: 307 (9210 ns) stddev: 17 (510 ns) above thr: 0% [265 (7950 ns) - 856 (25680 ns)] global [263 (7890 ns) 1251 (37530 ns)]
> Mean: 304 (9120 ns) stddev: 7 (210 ns) above thr: 0% [286 (8580 ns) - 486 (14580 ns)] global [263 (7890 ns) 1251 (37530 ns)]
> Mean: 307 (9210 ns) stddev: 47 (1410 ns) above thr: 0% [260 (7800 ns) - 1299 (38970 ns)] global [260 (7800 ns) 1299 (38970 ns)]
> Mean: 291 (8730 ns) stddev: 41 (1230 ns) above thr: 0% [250 (7500 ns) - 1324 (39720 ns)] global [250 (7500 ns) 1324 (39720 ns)]

OK, this is much better as a baseline

