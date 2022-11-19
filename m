Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2344763079B
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 01:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445952.701402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owBqD-00045z-P3; Sat, 19 Nov 2022 00:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445952.701402; Sat, 19 Nov 2022 00:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owBqD-00043V-MB; Sat, 19 Nov 2022 00:36:17 +0000
Received: by outflank-mailman (input) for mailman id 445952;
 Sat, 19 Nov 2022 00:36:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OpAN=3T=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1owBqC-00043P-Rz
 for xen-devel@lists.xenproject.org; Sat, 19 Nov 2022 00:36:17 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c5ec814-67a2-11ed-91b6-6bf2151ebd3b;
 Sat, 19 Nov 2022 01:36:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D7781B825DA;
 Sat, 19 Nov 2022 00:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E90B7C433D6;
 Sat, 19 Nov 2022 00:36:09 +0000 (UTC)
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
X-Inumbo-ID: 2c5ec814-67a2-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668818171;
	bh=dwGE39AbfR/PbAZBDDm4IDB9zj109djqC5+9ZbOhbjY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Cu3GwSrnLAsXa2R99AMu5o44DYWPcM+WIczC8Wyn7c9F/jbvXntG4DV+XFZ4Xe5vN
	 LaAnINMSwb4EbnuRVHv6PNPqOgPxEP3TOnTxmLe/MTFWZAZKP0uWb9Iv4Z+dMNTp0O
	 FnGGdbugWv3beTjsqy6buCqGQsNeeCJbqp+3NyACIimyhhwY2kvtEBHaaOMaF+cdac
	 +A0RBtkkRB55hzBiP7+cu6R5qU+bODgoxe0orsEYjdxHAU/D0i8dWgBCrNkPmytNG8
	 15TB+PanZLPl9AYhxSwNkI6NTm8d7HVQGk2q8WavV7lEEGSkYet1YkZFgltKDlqW8U
	 7srwYdXDJdevA==
Date: Fri, 18 Nov 2022 16:36:08 -0800 (PST)
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
In-Reply-To: <Y1umvVrGLktIvJuk@leoy-huanghe.lan>
Message-ID: <alpine.DEB.2.22.394.2211181621160.1049131@ubuntu-linux-20-04-desktop>
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan> <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop> <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan> <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop> <Y00/SW5Ro+SlhoBU@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210171638080.4587@ubuntu-linux-20-04-desktop> <Y1J39UsPlM8htxFx@leoy-huanghe.lan> <alpine.DEB.2.22.394.2210211341440.3873@ubuntu-linux-20-04-desktop> <Y1ZvDt7/I9JXJh2r@leoy-huanghe.lan> <alpine.DEB.2.22.394.2210251655420.1397955@ubuntu-linux-20-04-desktop>
 <Y1umvVrGLktIvJuk@leoy-huanghe.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Leo,

Thank you for the fantastic work with so many good details. Apologies
for the late reply -- I have been traveling and on holiday.


On Fri, 28 Oct 2022, Leo Yan wrote:
> Hi Stefano,
> 
> On Tue, Oct 25, 2022 at 04:58:16PM -0700, Stefano Stabellini wrote:
> > On Mon, 24 Oct 2022, Leo Yan wrote:
> > > > If you are really running with the NULL scheduler, then I would
> > > > investigate why the vCPU has is_running == 0 because it should not
> > > > happen.
> > > 
> > > Correct for this: it's my bad that I didn't really enable NULL scheduler
> > > in my code base.  After I enabled NULL scheduler, the latency by context
> > > switching is dismissed.
> > > 
> > >  8963              pub-338   [002]   217.777652: bprint:               xennet_tx_setup_grant: id=60 ref=1340 offset=2 len=1514 TSC: 7892178799
> > >  8964              pub-338   [002]   217.777662: bprint:               xennet_tx_setup_grant: id=82 ref=1362 offset=2050 len=1006 TSC: 7892179043
> > >  8965     ksoftirqd/12-75    [012]   255.466914: bprint:               xenvif_tx_build_gops.constprop.0: id=60 ref=1340 offset=2 len=1514 TSC: 7892179731
> > >  8966     ksoftirqd/12-75    [012]   255.466915: bprint:               xenvif_tx_build_gops.constprop.0: id=82 ref=1362 offset=2050 len=1006 TSC: 7892179761
> > >  8967              pub-338   [002]   217.778057: bprint:               xennet_tx_setup_grant: id=60 ref=1340 offset=2050 len=1514 TSC: 7892188930
> > >  8968              pub-338   [002]   217.778072: bprint:               xennet_tx_setup_grant: id=53 ref=1333 offset=2 len=1514 TSC: 7892189293
> > >  8969       containerd-2965  [012]   255.467304: bprint:               xenvif_tx_build_gops.constprop.0: id=60 ref=1340 offset=2050 len=1514 TSC: 7892189479
> > >  8970       containerd-2965  [012]   255.467306: bprint:               xenvif_tx_build_gops.constprop.0: id=53 ref=1333 offset=2 len=1514 TSC: 7892189533
> > 
> > I am having difficulty following the messages. Are the two points [a]
> > and [b] as described in the previous email shown here?
> 
> No, the [b] point is about the trace point in Xen hypvervisor.  
> 
> For easier review I combined the trace log from Xen dom0 and dom0
> Linux kernels, in above log, the function xennet_tx_setup_grant() is
> traced from domU Linux kernel and the function
> xenvif_tx_build_gops.constprop.0 from dom0 Linux kernel and I sorted
> the logs with TSC (Arm arch timer physical counter).
> 
> Sorry for confusion and I didn't explain clearly.
> 
> > > So the xennet (Xen net forend driver) and xenvif (net backend driver)
> > > work in parallel.  Please note, I didn't see networking performance
> > > improvement after changed to use NULL scheduler.
> > > 
> > > Now I will compare the duration for two directions, one direction is
> > > sending data from xennet to xenvif, and another is the reversed
> > > direction.  It's very likely the two directions have significant
> > > difference for sending data with grant tables, you could see in above
> > > log, it takes 20~30us to transmit a data block (we can use the id
> > > number and grant table's ref number to match the data block in xennet
> > > driver and xenvif driver).
> > > 
> > > > Now regarding the results, I can see the timestamp 3842008681 for
> > > > xennet_notify_tx_irq, 3842008885 for vgic_inject_irq, and 3842008935 for
> > > > vcpu_kick. Where is the corresponding TSC for the domain receiving the
> > > > notification?
> > > > 
> > > > Also for the other case, starting at 3842016505, can you please
> > > > highlight the timestamp for vgic_inject_irq, vcpu_kick, and also the one
> > > > for the domain receiving the notification?
> > > > 
> > > > The most interesting timestamps would be the timestamp for vcpu_kick in
> > > > "notification sending domain" [a], the timestamp for receiving the
> > > > interrupt in the Xen on pCPU for the "notification receiving domain"
> > > > [b], and the timestamp for the "notification receiving domain" getting
> > > > the notification [c].
> > > > 
> > > > If really context switch is the issue, then the interesting latency
> > > > would be between [a] and [b].
> > > 
> > > Understand.  I agree that I didn't move into more details, the main
> > > reason is Xen dmesg buffer is fragile after adding more logs, e.g.
> > > after I added log in the function gicv3_send_sgi(), Xen will stuck
> > > during the booting phase, and after adding logs in
> > > leave_hypervisor_to_guest() it will introduce huge logs (so I need to
> > > only trace for first 16 CPUs to mitigate log flood).
> > > 
> > > I think it would be better to enable xentrace for my profiling at my
> > > side.  If I have any further data, will share back.
> > 
> > Looking forward to it. Without more details it is impossible to identify
> > the source of the problem and fix it.
> 
> The application passes data to Linux kernel and low level driver needs
> to transfer skbs between Xen network frontend and backend drivers via
> Xen shared ring buffer / grant table.  So let's step back to review
> the duration in the network drivers for sending and receiving skbs.
> 
> I measured intervals for sending skbs, one direction is for sending skb
> from dom0 to domU and another direction is from domU to dom0. For easier
> review, I plotted the intervals in diagrams [1][2] for these two
> directions respectively.
> 
> In a diagram it has three metrics:
> 
> - Packet sending interval: measures the interval from the sender.
> 
>   For the direction from dom0 to domu, this metric measures the
>   interval for sending skbs in the Xen backend driver in dom0.
> 
>   For the direction from domU to dom0, this metric measures the
>   interval for sending skbs in the Xen frontend driver in domU.
> 
> - Packet receiving interval: measures the interval for the receiver.
> 
>   For the direction from dom0 to domu, this metric measures the
>   interval for receiving skbs in the Xen frontend driver in domU.
> 
>   For the direction from domU to dom0, this metric measures the
>   interval for receiving skbs in the Xen backend driver in dom0.
> 
> - Packet response interval: measures the interval between sender and
>   receiver.
> 
>   This interval measures the duration between a skb is sending out
>   from the sender and until it's fetched from grant table by the
>   receiver.
> 
> >From these three metrics we can know the latency is caused by three
> actors: sender, receiver, Xen hypervisor.
> 
> In two diagrams we can see the packet response interval (yellow line)
> is about 10~20us.  The response interval for domu -> dom0 (~10us) is
> even better than the interval for dom0 -> domu (15~20us), which means
> the response time is not the curplit for the poor performance when
> sending data from domu to dom0.

I agree with you.


> The purple line and blue line for sending and receiving intervals are
> correlated, this means the drivers in two sides (dom0 and domU) work in
> parallel.
> 
> A big difference is we can see the sending interval (purple line) in the
> diagram xmit_interval_dom0_to_domu.png usually keeps at ~1us, but the
> sending interval in the diagram xmit_interval_domu_to_dom0.png is
> about 10us.

I also find it curious that the receiving interval is almost 0 in the
"dom0 to domU" direction and instead it is about 10us in the "domU to
dom0" direction. Why would it take more time to receive skbs in one
direction compared to the other?

Are the "receiving interval" and the "sending interval" measuring the
same delay just from the receiver side and from the sender side?

 
> If map to the code, I think the function xennet_start_xmit() in Xen
> frontend driver is critical for the sending interval in domU.  I can
> see several things cost time when sending a packet:
> 
> - Xen frontend driver needs to setup grant table for every skb, it
>   invokes the function xennet_tx_setup_grant() and
>   gnttab_grant_foreign_access_ref() to prepare grant table;
> 
> - Xen frontend driver sends notification by calling
>   notify_remote_via_irq().  It will trap to Xen hypervisor to send the
>   interrupt, this takes several macro seonds for this step.
> 
> - Xen frontend driver calls xennet_tx_buf_gc(), the interval for this
>   function is vary, it will take ~30us in the case for reclaiming grant
>   table.
> 
> Any thoughts for this?

For the sake of latency, it is better to avoid sources of uncertainty
(even at the cost of bandwidth). From what you wrote above and from the
other email it would seem that xennet_tx_buf_gc() can cause significant
delays.

One idea is only to parse the responses (RING_COPY_RESPONSE) in
xennet_tx_buf_gc() and delay the calls to gnttab_end_foreign_access_ref
for later. In other words:

1) xennet_tx_buf_gc: read responses, grants to be removed "for later"
2) independently when idle (maybe from a kthread or independent tasklet)
   look for grants to be removed and remove them 

Basically it is a lazy grant removal scheme where once receiving skbs,
the related grants are not immediately freed, but later lazily.

