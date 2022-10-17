Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D30A601DE1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 01:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424651.672239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okZs6-00037J-Il; Mon, 17 Oct 2022 23:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424651.672239; Mon, 17 Oct 2022 23:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okZs6-00034u-G7; Mon, 17 Oct 2022 23:50:14 +0000
Received: by outflank-mailman (input) for mailman id 424651;
 Mon, 17 Oct 2022 23:50:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vX9e=2S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1okZs5-00034o-3Q
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 23:50:13 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f8dd325-4e76-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 01:50:11 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC6196121C;
 Mon, 17 Oct 2022 23:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DA9C433D6;
 Mon, 17 Oct 2022 23:50:07 +0000 (UTC)
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
X-Inumbo-ID: 6f8dd325-4e76-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666050609;
	bh=XwfLY3p0u0+pgPsKAtWmTrdmX+myDEgJR7HDl0Wg+ds=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Bf8nEPlNMoPFztCDZMMqESltcSILaXMSupIzld78WWf2qVXERHdRl6dmQkNIOQzhh
	 TOgB2qeLzFTFoojWOi5Resay+4ifiVFyOU9smGLCblG9iNrGKooooJFtwBkKkn9aVM
	 ag5JTIOCJiJDc9xl7/2fSfBuB4zMFHaH4a4SrQzYN3imnGDzhiY68QbsA2K3t+XOps
	 m5tUGU1OshemHRYxsWFI5/dQAhRxYEHBf9ULqdVLDq9ya/1ZrN8ri1+6T/Dv2sPE1G
	 qz9PuMYcASyQluqdH6Kbkw5A2EozMgjN3gS9ULZXMZCFthNI6fCD/vWcCoWV5da8ua
	 zagxQVCK+8Q9Q==
Date: Mon, 17 Oct 2022 16:50:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Leo Yan <leo.yan@linaro.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Xen Develop <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Mathieu Poirier <mathieu.poirier@linaro.org>, 
    Kasper Ornstein Mecklenburg <Kasper.OrnsteinMecklenburg@arm.com>, 
    jgross@suse.com, oleksandr_tyshchenko@epam.com, boris.ostrovsky@oracle.com, 
    wei.liu@kernel.org, paul@xen.org
Subject: Re: Issue: Networking performance in Xen VM on Arm64
In-Reply-To: <Y00/SW5Ro+SlhoBU@leoy-yangtze.lan>
Message-ID: <alpine.DEB.2.22.394.2210171638080.4587@ubuntu-linux-20-04-desktop>
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan> <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop> <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan> <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop>
 <Y00/SW5Ro+SlhoBU@leoy-yangtze.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Oct 2022, Leo Yan wrote:
> Hi Stefano,
> 
> Sorry for late response.  Please see below comments.
> 
> On Tue, Oct 11, 2022 at 02:47:00PM -0700, Stefano Stabellini wrote:
> > On Tue, 11 Oct 2022, Leo Yan wrote:
> > > > > The second question is how to mitigate the long latency when send data
> > > > > from DomU.  A possible solution is the Xen network forend driver copies
> > > > > skb into mediate (bounce) buffer, just like what does in Xen net
> > > > > backend driver with gnttab_batch_copy(), in this way the forend driver
> > > > > doesn't need to wait for backend driver response and directly return
> > > > > back.
> > > > 
> > > > About this, I am not super familiar with drivers/net/xen-netfront.c but
> > > > I take you are referring to xennet_tx_buf_gc? Is that the function that
> > > > is causing xennet_start_xmit to wait?
> > > 
> > > No.  We can take the whole flow in xen-netfront.c as:
> > > 
> > >   xennet_start_xmit()
> > >              ----------> notify Xen Dom0 to process skb
> > >              <---------  Dom0 copies skb and notify back to DomU
> > >   xennet_tx_buf_gc()
> > >   softirq/NET_TX : __kfree_skb()
> > 
> > Let me premise again that I am not an expert in PV netfront/netback.
> > However, I think the above is only true if DomU and Dom0 are running on
> > the same physical CPU. If you use sched=null as I suggested above,
> > you'll get domU and dom0 running at the same time on different physical
> > CPUs and the workflow doesn't work as described.
> > 
> > It should be:
> > 
> > CPU1: xennet_start_xmit()             ||  CPU2: doing something else
> > CPU1: notify Xen Dom0 to process skb  ||  CPU2: receive notification
> > CPU1: return from xennet_start_xmit() ||  CPU2: Dom0 copies skb
> > CPU1: do something else               ||  CPU2: notify back to DomU
> > CPU1: receive irq, xennet_tx_buf_gc() ||  CPU2: do something else
> 
> Yes, I agree this is ideal case.  I tried to set option "sched=null" but
> I can observe the latency in the second step when CPU1 notify Xen Dom0,
> Dom0 takes 500us+ to receive the notification.
> 
> Please see below detailed log:
> 
> DomU log:
> 
> 4989078512              pub-321   [003]   101.150966: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 4989078512
> 4989078573              pub-321   [003]   101.150968: bprint:               xennet_tx_setup_grant: id=24 ref=1816 offset=2 len=1514 TSC: 4989078573
> 4989078592              pub-321   [003]   101.150969: bprint:               xennet_start_xmit: xennet_notify_tx_irq: TSC: 4989078592
> 
> Dom0 log:
> 
> 4989092169           <idle>-0     [013]   140.121667: bprint:               xenvif_tx_interrupt: xenvif_tx_interrupt: TSC: 4989092169
> 4989092331           <idle>-0     [013]   140.121673: bprint:               xenvif_tx_build_gops.constprop.0: id=24 ref=1816 offset=2 len=1514 TSC: 4989092331
> 
> We can see DomU sends notification with timestamp (raw counter) is
> 4989078592 and Dom0 receives the interrupt with timestamp 4989092169.
> Since Dom0 and DomU use the same time counter and the counter
> frequency is 25MHz, so we can get the delta value (in macroseconds):
> 
>     (4989092169 - 4989078592) / 25000000 * 1000 * 1000
>   = 543us
> 
> Which means it takes 543us to let Dom0 to receive the notification.
> You could see DomU runs in CPU3 and Dom0 runs on CPU13, there should
> not have contention for CPU resources.  Seems to me, it's likely Xen
> hypervisor takes long time to deliver the interrupt, note, it's not
> take so long time for every skb transferring, sometimes the time for
> response a notification is short (about ~10us).

Good find. I think this is worth investigating further. Do you have
vwfi=native in your Xen command line as well?

After that, I would add printk also in Xen with the timestamp. The event
channel notification code path is the following:

# domU side
xen/arch/arm/vgic-v2.c:vgic_v2_to_sgi
xen/arch/arm/vgic.c:vgic_to_sgi
xen/arch/arm/vgic.c:vgic_inject_irq
xen/arch/arm/vgic.c:vcpu_kick
xen/arch/arm/gic-v2.c:gicv2_send_SGI

# dom0 side
xen/arch/arm/gic.c:do_sgi
xen/arch/arm/traps.c:leave_hypervisor_to_guest

It would be good to understand why sometimes it takes ~10us and some
other times it takes ~540us


> > > > I didn't think that waiting for the backend is actually required. I
> > > > mean, in theory xennet_start_xmit could return without calling
> > > > xennet_tx_buf_gc, it is just an optimization. But I am not sure about
> > > > this.
> > > 
> > > The function xennet_start_xmit() will not wait and directly return
> > > back, but if we review the whole flow we can see the skb is freed until
> > > the softirq NET_TX.
> > 
> > Is it an issue that the skb is not freed until later? Is that affecting
> > the latency results? It shouldn't, right?
> 
> I did an extra experiment in Xen net forend driver, I enabled the flag
> "info->bounce = true" so the forend driver will use bounce buffer to
> store data and release the skb immediately to network core layer.
> 
> The throughput can be boosted significantly for this: the netperf
> result can be improved from 107.73 Mbits/s to 300+ Mbits/s.
> 
> > What matters is when dom0 is
> > getting those packets on the physical network interface and that happens
> > before the skb is freed. I am just trying to figure out if we are
> > focusing on the right problem.
> 
> Good point.  I agree that releasing skb earlier only can benefit for
> throughput, but we still cannot resolve the latency issue if Dom0
> takes long time to relay packets to phusical network interface.
> 
> > > In this whole flow, it needs DomU and Dom0 to work
> > > together (includes two context switches) to process skb.
> > 
> > There are not necessarily 2 context switches as things should run in
> > parallel.
> > 
> > > Here I mean the optimization is to allow Dom0 and DomU to work in
> > > parallel.  It could be something like blow, the key point is DomU
> > > doesn't need to wait for Dom0's notification.
> > 
> > I think it is already the case that domU doesn't need to wait for dom0's
> > notification?
> 
> Agree.  domU doesn't need to wait for dom0's notification until it uses
> out the skb can be allocated by the network core layer.  This is why I
> also can tweak core layer's parameters for buffer size (see
> /proc/sys/net/core/wmem_default and /proc/sys/net/core/wmem_max).
> 
> > It is true that domU is waiting for dom0's notification to
> > free the skb but that shouldn't affect latency?
> 
> Yeah.  I will focus on the elaberated issue above that Dom0 takes long
> time to receive the notification.
> 
> Will keep posted if have any new finding.

Thanks, this is very interesting

