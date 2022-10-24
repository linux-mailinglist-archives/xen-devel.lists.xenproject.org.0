Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B38C609F6B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 12:55:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428856.679418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omv73-0005XU-Rj; Mon, 24 Oct 2022 10:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428856.679418; Mon, 24 Oct 2022 10:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omv73-0005UH-Om; Mon, 24 Oct 2022 10:55:21 +0000
Received: by outflank-mailman (input) for mailman id 428856;
 Mon, 24 Oct 2022 10:55:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJqm=2Z=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1omv72-0005UB-KT
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 10:55:20 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58fbc8b3-538a-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 12:55:19 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso3535472pjg.5
 for <xen-devel@lists.xenproject.org>; Mon, 24 Oct 2022 03:55:19 -0700 (PDT)
Received: from leoy-huanghe.lan (211-75-219-199.hinet-ip.hinet.net.
 [211.75.219.199]) by smtp.gmail.com with ESMTPSA id
 z126-20020a623384000000b005289a50e4c2sm19465019pfz.23.2022.10.24.03.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 03:55:16 -0700 (PDT)
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
X-Inumbo-ID: 58fbc8b3-538a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9tFxWka2vb7L98A6SIBW68ywvl40k4w0y0HBJmBswkg=;
        b=qaed09clz4ivQMgc1kbyApa0fLRzlBtBYx414UTUIga5D1wUkeZYH2dEL7oQkS1ltg
         aDv0l36yt7g1dHnhjeGZBnFKus4pqO+ngjMRcJCExH1u+lRN7iAk0ceG7HYOdoOgvQ4A
         OfnyqD29804gKJDfelD3Fp7QBvRZrp8NwKgygBX/CLiNn/Iez50wUtHlPISNqscdzD+y
         ug8sg7qKedfbVymnjqRkjFesYnKwB6M/Rq6GgtJ36va1KlUbo+8xFmy/RaRZgyIkZW4w
         Oeolzq7HCVasZe1FDGRqja1AUU1i4d2vB9TLU/lDCi+zN2LRBSmMbFX/R8SbutxPQvzx
         +pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tFxWka2vb7L98A6SIBW68ywvl40k4w0y0HBJmBswkg=;
        b=G/BdJwDyrQ73EMaxNq/RlC0D/h70WGToESeX4VWXzH6vhPCJa0XvpLb1ZFbuK6nwQ+
         L0tsLIEQHxt49b6+R36LmnLRBUMsmsMpdl3IrlF56BNtseKKqLDXIqi5ANTLT5FOhMZP
         Hi1eKJSKDusiMuxy/mthYq1SlKZfeLofbW3Re2Y/AHg8lF5OSgPa+8ML6XLJnWZpyc1Y
         HU6Te4UCWk78E/uUZRMIBpEK1ZZBzpfQBdxCA+zO92QXuG8AjVPEHq7ocvtTqH1537+Y
         NwYI2Jx3EWzQWU58wTNU87MOC3TigIUIXovZED51YI9v8/ngNeEYZx42Ym+llxhtzr4c
         50sQ==
X-Gm-Message-State: ACrzQf2b+x+xV9Xma7YKRp1U6lChi2da9jDWOnq2PNPJzp+wdu0ZxBuD
	0s+W6W9s4005+hi7Y1FGQh7etQ==
X-Google-Smtp-Source: AMsMyM5y/RLpEUCYqclOQqumUAVE7nJIjDFbz1KDijGIlnOgF1c9/r4uDUlWVJpgQ2jWzcWj8lCaeQ==
X-Received: by 2002:a17:902:a9c6:b0:178:b2d4:f8b2 with SMTP id b6-20020a170902a9c600b00178b2d4f8b2mr32652332plr.79.1666608917243;
        Mon, 24 Oct 2022 03:55:17 -0700 (PDT)
Date: Mon, 24 Oct 2022 18:55:10 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen Develop <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Kasper Ornstein Mecklenburg <Kasper.OrnsteinMecklenburg@arm.com>,
	jgross@suse.com, oleksandr_tyshchenko@epam.com,
	boris.ostrovsky@oracle.com, wei.liu@kernel.org, paul@xen.org
Subject: Re: Issue: Networking performance in Xen VM on Arm64
Message-ID: <Y1ZvDt7/I9JXJh2r@leoy-huanghe.lan>
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop>
 <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop>
 <Y00/SW5Ro+SlhoBU@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210171638080.4587@ubuntu-linux-20-04-desktop>
 <Y1J39UsPlM8htxFx@leoy-huanghe.lan>
 <alpine.DEB.2.22.394.2210211341440.3873@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2210211341440.3873@ubuntu-linux-20-04-desktop>

On Fri, Oct 21, 2022 at 02:14:04PM -0700, Stefano Stabellini wrote:

[...]

> > > # domU side
> > > xen/arch/arm/vgic-v2.c:vgic_v2_to_sgi
> > > xen/arch/arm/vgic.c:vgic_to_sgi
> > > xen/arch/arm/vgic.c:vgic_inject_irq
> > > xen/arch/arm/vgic.c:vcpu_kick
> > > xen/arch/arm/gic-v2.c:gicv2_send_SGI
> > > 
> > > # dom0 side
> > > xen/arch/arm/gic.c:do_sgi
> > > xen/arch/arm/traps.c:leave_hypervisor_to_guest
> > > 
> > > It would be good to understand why sometimes it takes ~10us and some
> > > other times it takes ~540us
> > 
> > Some updates for why it takes several hundreds us for Xen backend driver
> > to respond interrupt.  The short answer is the vcpu running Xen backend
> > driver needs to switch context, even I have set options "sched=null
> > vwfi=native" in Xen command line.
> > 
> > So please see below detailed logs for how the things happen.
> > 
> > Let's take the timestamp 3842008681 as the start point, it's the time
> > for Xen backend driver sending out notification (xennet_notify_tx_irq);
> > at the timestamp 3842008885 the Xen hypervisor injects the interrupt
> > (it's about ~8us duration from the start point).
> > 
> > And then at the timestamp 3842008935 it invokes vcpu_kick() to kick the
> > virtual CPU for running Xen forend driver, you could see
> > VCPU_PROCESSOR is 11 and VCPU_ID is 9 for dom0, the duration is
> > 10.16us from the start point.
> > 
> > The key point is at this point the vcpu's is_running is 0, this is
> > different from the case without long latency which vcpu's is_running
> > is 1.  IIUC, Xen hypervisor needs to take time to restore the vcpu's
> > context, thus we can see the virtual CPU 9 in Dom0 starts to run at
> > the timestamp 3842016505.
> 
> is_running should be always 1 with the NULL scheduler and vwfi=native.
> That is because VMs are never descheduled. Please double-check.
> 
> If you are really running with the NULL scheduler, then I would
> investigate why the vCPU has is_running == 0 because it should not
> happen.

Correct for this: it's my bad that I didn't really enable NULL scheduler
in my code base.  After I enabled NULL scheduler, the latency by context
switching is dismissed.

 8963              pub-338   [002]   217.777652: bprint:               xennet_tx_setup_grant: id=60 ref=1340 offset=2 len=1514 TSC: 7892178799
 8964              pub-338   [002]   217.777662: bprint:               xennet_tx_setup_grant: id=82 ref=1362 offset=2050 len=1006 TSC: 7892179043
 8965     ksoftirqd/12-75    [012]   255.466914: bprint:               xenvif_tx_build_gops.constprop.0: id=60 ref=1340 offset=2 len=1514 TSC: 7892179731
 8966     ksoftirqd/12-75    [012]   255.466915: bprint:               xenvif_tx_build_gops.constprop.0: id=82 ref=1362 offset=2050 len=1006 TSC: 7892179761
 8967              pub-338   [002]   217.778057: bprint:               xennet_tx_setup_grant: id=60 ref=1340 offset=2050 len=1514 TSC: 7892188930
 8968              pub-338   [002]   217.778072: bprint:               xennet_tx_setup_grant: id=53 ref=1333 offset=2 len=1514 TSC: 7892189293
 8969       containerd-2965  [012]   255.467304: bprint:               xenvif_tx_build_gops.constprop.0: id=60 ref=1340 offset=2050 len=1514 TSC: 7892189479
 8970       containerd-2965  [012]   255.467306: bprint:               xenvif_tx_build_gops.constprop.0: id=53 ref=1333 offset=2 len=1514 TSC: 7892189533

So the xennet (Xen net forend driver) and xenvif (net backend driver)
work in parallel.  Please note, I didn't see networking performance
improvement after changed to use NULL scheduler.

Now I will compare the duration for two directions, one direction is
sending data from xennet to xenvif, and another is the reversed
direction.  It's very likely the two directions have significant
difference for sending data with grant tables, you could see in above
log, it takes 20~30us to transmit a data block (we can use the id
number and grant table's ref number to match the data block in xennet
driver and xenvif driver).

> Now regarding the results, I can see the timestamp 3842008681 for
> xennet_notify_tx_irq, 3842008885 for vgic_inject_irq, and 3842008935 for
> vcpu_kick. Where is the corresponding TSC for the domain receiving the
> notification?
> 
> Also for the other case, starting at 3842016505, can you please
> highlight the timestamp for vgic_inject_irq, vcpu_kick, and also the one
> for the domain receiving the notification?
> 
> The most interesting timestamps would be the timestamp for vcpu_kick in
> "notification sending domain" [a], the timestamp for receiving the
> interrupt in the Xen on pCPU for the "notification receiving domain"
> [b], and the timestamp for the "notification receiving domain" getting
> the notification [c].
> 
> If really context switch is the issue, then the interesting latency
> would be between [a] and [b].

Understand.  I agree that I didn't move into more details, the main
reason is Xen dmesg buffer is fragile after adding more logs, e.g.
after I added log in the function gicv3_send_sgi(), Xen will stuck
during the booting phase, and after adding logs in
leave_hypervisor_to_guest() it will introduce huge logs (so I need to
only trace for first 16 CPUs to mitigate log flood).

I think it would be better to enable xentrace for my profiling at my
side.  If I have any further data, will share back.

[...]

> > Another experiment is to append option "dom0_vcpus_pin" in Xen command
> > line, this can allow the virtual CPU pins on physical CPU so can avoid
> > context switching.  With this option, I can see the throughput is
> > improved from 128.26 Mbits/s to 180.3 Mbits/s.  But this result is far
> > from the ideal throughput (800+Mbits/s).
> 
> Actually this should not happen: like before, dom0_vcpus_pin does
> nothing with the NULL scheduler and only changes things for credit. Are
> you really sure you are running the tests with sched=null vwfi=native?

You are right.  After I changed to use NULL scheduler, dom0_vcpus_pin
doesn't improve the performance, sorry for noise and please ignore it.

Thanks,
Leo

