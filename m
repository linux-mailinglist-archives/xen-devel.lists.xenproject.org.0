Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799CC60D844
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 01:58:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430276.681777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onToP-0000Ws-OS; Tue, 25 Oct 2022 23:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430276.681777; Tue, 25 Oct 2022 23:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onToP-0000T7-Kp; Tue, 25 Oct 2022 23:58:25 +0000
Received: by outflank-mailman (input) for mailman id 430276;
 Tue, 25 Oct 2022 23:58:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qfDD=22=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1onToO-0000Pc-0N
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 23:58:24 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7f104c5-54c0-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 01:58:22 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4E6E8B81FC3;
 Tue, 25 Oct 2022 23:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78030C433D6;
 Tue, 25 Oct 2022 23:58:18 +0000 (UTC)
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
X-Inumbo-ID: e7f104c5-54c0-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666742300;
	bh=MAEadm31jCSBRTzJcOHvB8vUgAooeOcKwmNO3sWKV+o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t4cByd73JFgTkgnlXjvf0NCDOUCkMZXC/AtZat8Jt7nwImkkBBk6J3vQ4PRIzAe/Q
	 Z9lLoGricFrsNmMEik9YsVFIPVe9TuFOr7fOMGIKPH5AS93cIYAyBY8ta2IOH9Yn8Y
	 g2rsvUloZpF2VVb+dndZ/KWf0onzUOe1XT/m3Wc6znxIZ3TWrpxVqRvH46Fw8X14Yl
	 OiOLEOR2zHS33f0O9rrOOIjl7o109+d3/78JD1QLW09JQAKiij6A2KLTb/9xYBQeeo
	 XE39fJ+MdHZRUxidLF/goFo05B2v29Lg4m4kHJd0/Gtkj0+dmP8hk19ZCWGnUGJ91W
	 FRT5CQUDNn1UQ==
Date: Tue, 25 Oct 2022 16:58:16 -0700 (PDT)
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
In-Reply-To: <Y1ZvDt7/I9JXJh2r@leoy-huanghe.lan>
Message-ID: <alpine.DEB.2.22.394.2210251655420.1397955@ubuntu-linux-20-04-desktop>
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan> <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop> <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan> <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop> <Y00/SW5Ro+SlhoBU@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210171638080.4587@ubuntu-linux-20-04-desktop> <Y1J39UsPlM8htxFx@leoy-huanghe.lan> <alpine.DEB.2.22.394.2210211341440.3873@ubuntu-linux-20-04-desktop> <Y1ZvDt7/I9JXJh2r@leoy-huanghe.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Oct 2022, Leo Yan wrote:
> > If you are really running with the NULL scheduler, then I would
> > investigate why the vCPU has is_running == 0 because it should not
> > happen.
> 
> Correct for this: it's my bad that I didn't really enable NULL scheduler
> in my code base.  After I enabled NULL scheduler, the latency by context
> switching is dismissed.
> 
>  8963              pub-338   [002]   217.777652: bprint:               xennet_tx_setup_grant: id=60 ref=1340 offset=2 len=1514 TSC: 7892178799
>  8964              pub-338   [002]   217.777662: bprint:               xennet_tx_setup_grant: id=82 ref=1362 offset=2050 len=1006 TSC: 7892179043
>  8965     ksoftirqd/12-75    [012]   255.466914: bprint:               xenvif_tx_build_gops.constprop.0: id=60 ref=1340 offset=2 len=1514 TSC: 7892179731
>  8966     ksoftirqd/12-75    [012]   255.466915: bprint:               xenvif_tx_build_gops.constprop.0: id=82 ref=1362 offset=2050 len=1006 TSC: 7892179761
>  8967              pub-338   [002]   217.778057: bprint:               xennet_tx_setup_grant: id=60 ref=1340 offset=2050 len=1514 TSC: 7892188930
>  8968              pub-338   [002]   217.778072: bprint:               xennet_tx_setup_grant: id=53 ref=1333 offset=2 len=1514 TSC: 7892189293
>  8969       containerd-2965  [012]   255.467304: bprint:               xenvif_tx_build_gops.constprop.0: id=60 ref=1340 offset=2050 len=1514 TSC: 7892189479
>  8970       containerd-2965  [012]   255.467306: bprint:               xenvif_tx_build_gops.constprop.0: id=53 ref=1333 offset=2 len=1514 TSC: 7892189533

I am having difficulty following the messages. Are the two points [a]
and [b] as described in the previous email shown here?


> So the xennet (Xen net forend driver) and xenvif (net backend driver)
> work in parallel.  Please note, I didn't see networking performance
> improvement after changed to use NULL scheduler.
> 
> Now I will compare the duration for two directions, one direction is
> sending data from xennet to xenvif, and another is the reversed
> direction.  It's very likely the two directions have significant
> difference for sending data with grant tables, you could see in above
> log, it takes 20~30us to transmit a data block (we can use the id
> number and grant table's ref number to match the data block in xennet
> driver and xenvif driver).
> 
> > Now regarding the results, I can see the timestamp 3842008681 for
> > xennet_notify_tx_irq, 3842008885 for vgic_inject_irq, and 3842008935 for
> > vcpu_kick. Where is the corresponding TSC for the domain receiving the
> > notification?
> > 
> > Also for the other case, starting at 3842016505, can you please
> > highlight the timestamp for vgic_inject_irq, vcpu_kick, and also the one
> > for the domain receiving the notification?
> > 
> > The most interesting timestamps would be the timestamp for vcpu_kick in
> > "notification sending domain" [a], the timestamp for receiving the
> > interrupt in the Xen on pCPU for the "notification receiving domain"
> > [b], and the timestamp for the "notification receiving domain" getting
> > the notification [c].
> > 
> > If really context switch is the issue, then the interesting latency
> > would be between [a] and [b].
> 
> Understand.  I agree that I didn't move into more details, the main
> reason is Xen dmesg buffer is fragile after adding more logs, e.g.
> after I added log in the function gicv3_send_sgi(), Xen will stuck
> during the booting phase, and after adding logs in
> leave_hypervisor_to_guest() it will introduce huge logs (so I need to
> only trace for first 16 CPUs to mitigate log flood).
> 
> I think it would be better to enable xentrace for my profiling at my
> side.  If I have any further data, will share back.

Looking forward to it. Without more details it is impossible to identify
the source of the problem and fix it.

