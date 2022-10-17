Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E915600DF7
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 13:43:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424339.671686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okOVC-0002Tz-DJ; Mon, 17 Oct 2022 11:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424339.671686; Mon, 17 Oct 2022 11:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okOVC-0002RN-9u; Mon, 17 Oct 2022 11:41:50 +0000
Received: by outflank-mailman (input) for mailman id 424339;
 Mon, 17 Oct 2022 11:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=stwC=2S=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1okOVA-0002RH-4q
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 11:41:48 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad2c1344-4e10-11ed-8fd0-01056ac49cbb;
 Mon, 17 Oct 2022 13:41:47 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so10690883pjo.4
 for <xen-devel@lists.xenproject.org>; Mon, 17 Oct 2022 04:41:45 -0700 (PDT)
Received: from leoy-yangtze.lan (211-75-219-199.hinet-ip.hinet.net.
 [211.75.219.199]) by smtp.gmail.com with ESMTPSA id
 mn7-20020a17090b188700b00205f013f275sm9513088pjb.22.2022.10.17.04.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Oct 2022 04:41:42 -0700 (PDT)
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
X-Inumbo-ID: ad2c1344-4e10-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EpPLAJ9p4aPiwkX3h5bt/H+fQzqZ+4hUtG4/MmuXR0M=;
        b=eY6snNuG/nvSLWZ2fcNSwF6+NaR5HG/zxAm9DobnnEp9bth8deSE3j/MmkgfnZa1u2
         G9RDMznXT9x2jKOQsflRZn8K9VVlNWJo33qAFaYgeemo4D8I0DoCBQZGCuvzALvTd30y
         +Ak22LaG9377g2GB5/Qsz2M5+o2+3AjZ/3wMfCiD45ZmudzrPMZ5e2f0F2SgIUkJYfEK
         dzel3IGks59W8N/yfk6v19CZOwntjeSxmYCG70bbUMZMLqElCNJ6ctsQXageiIcA+TP2
         atm/ZivdMLaDYilAKEjhJaAWZ3L6e6VtS6j1T8cWP5mDbZ2hDhmnRXu3LWG1lALR7Meh
         uiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EpPLAJ9p4aPiwkX3h5bt/H+fQzqZ+4hUtG4/MmuXR0M=;
        b=BH2bVcMNjZ/uuTB02Y0mK4nyozZ5RWv2f5qAmYKbOi3oFKurq483tJZxnYozHf1b2d
         tjpuRKwe4LSxhUwO7o2pPOJCbYuLI391OGYJ4Xnp86aThIYV3g7CYOghYu9hmHIw7IhS
         OfsnBdR721WwtiPs/HG6apd/1PpKXvHuZTwH7J+HV43lKtTCl2azou93ZPWMXViRcg6K
         R+HWaTfk2fbwN1lTqp4nhe6eYl3nfmeNGimpwyDN+OYpenk+mtnvGRTlTyPOwXZAt/1w
         UCJKfSlt3tCig1dWCflfVNoYPRE5ETor8lDciyhs6IuBboB+8cwKlj4vQtDR4Fc6cekI
         Jn6w==
X-Gm-Message-State: ACrzQf0g/WmvumxHHEBtfbGqh0/oDn4Eh8/sD/49NX3AxR70ze4+Nk/T
	CAqeOgejjv5tI2SMbcCL7Yrq9A==
X-Google-Smtp-Source: AMsMyM6nhSMINRaN8640salY6NUpARC0Tb8BaSqZUCu0+SML804xMHTu7gOpFU852VVyhHbc/FF0+Q==
X-Received: by 2002:a17:90b:4d90:b0:20d:7f17:5983 with SMTP id oj16-20020a17090b4d9000b0020d7f175983mr33351430pjb.197.1666006904121;
        Mon, 17 Oct 2022 04:41:44 -0700 (PDT)
Date: Mon, 17 Oct 2022 19:41:36 +0800
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
Message-ID: <Y00/SW5Ro+SlhoBU@leoy-yangtze.lan>
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop>
 <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop>

Hi Stefano,

Sorry for late response.  Please see below comments.

On Tue, Oct 11, 2022 at 02:47:00PM -0700, Stefano Stabellini wrote:
> On Tue, 11 Oct 2022, Leo Yan wrote:
> > > > The second question is how to mitigate the long latency when send data
> > > > from DomU.  A possible solution is the Xen network forend driver copies
> > > > skb into mediate (bounce) buffer, just like what does in Xen net
> > > > backend driver with gnttab_batch_copy(), in this way the forend driver
> > > > doesn't need to wait for backend driver response and directly return
> > > > back.
> > > 
> > > About this, I am not super familiar with drivers/net/xen-netfront.c but
> > > I take you are referring to xennet_tx_buf_gc? Is that the function that
> > > is causing xennet_start_xmit to wait?
> > 
> > No.  We can take the whole flow in xen-netfront.c as:
> > 
> >   xennet_start_xmit()
> >              ----------> notify Xen Dom0 to process skb
> >              <---------  Dom0 copies skb and notify back to DomU
> >   xennet_tx_buf_gc()
> >   softirq/NET_TX : __kfree_skb()
> 
> Let me premise again that I am not an expert in PV netfront/netback.
> However, I think the above is only true if DomU and Dom0 are running on
> the same physical CPU. If you use sched=null as I suggested above,
> you'll get domU and dom0 running at the same time on different physical
> CPUs and the workflow doesn't work as described.
> 
> It should be:
> 
> CPU1: xennet_start_xmit()             ||  CPU2: doing something else
> CPU1: notify Xen Dom0 to process skb  ||  CPU2: receive notification
> CPU1: return from xennet_start_xmit() ||  CPU2: Dom0 copies skb
> CPU1: do something else               ||  CPU2: notify back to DomU
> CPU1: receive irq, xennet_tx_buf_gc() ||  CPU2: do something else

Yes, I agree this is ideal case.  I tried to set option "sched=null" but
I can observe the latency in the second step when CPU1 notify Xen Dom0,
Dom0 takes 500us+ to receive the notification.

Please see below detailed log:

DomU log:

4989078512              pub-321   [003]   101.150966: bprint:               xennet_start_xmit: xennet_start_xmit: TSC: 4989078512
4989078573              pub-321   [003]   101.150968: bprint:               xennet_tx_setup_grant: id=24 ref=1816 offset=2 len=1514 TSC: 4989078573
4989078592              pub-321   [003]   101.150969: bprint:               xennet_start_xmit: xennet_notify_tx_irq: TSC: 4989078592

Dom0 log:

4989092169           <idle>-0     [013]   140.121667: bprint:               xenvif_tx_interrupt: xenvif_tx_interrupt: TSC: 4989092169
4989092331           <idle>-0     [013]   140.121673: bprint:               xenvif_tx_build_gops.constprop.0: id=24 ref=1816 offset=2 len=1514 TSC: 4989092331

We can see DomU sends notification with timestamp (raw counter) is
4989078592 and Dom0 receives the interrupt with timestamp 4989092169.
Since Dom0 and DomU use the same time counter and the counter
frequency is 25MHz, so we can get the delta value (in macroseconds):

    (4989092169 - 4989078592) / 25000000 * 1000 * 1000
  = 543us

Which means it takes 543us to let Dom0 to receive the notification.
You could see DomU runs in CPU3 and Dom0 runs on CPU13, there should
not have contention for CPU resources.  Seems to me, it's likely Xen
hypervisor takes long time to deliver the interrupt, note, it's not
take so long time for every skb transferring, sometimes the time for
response a notification is short (about ~10us).

> > > I didn't think that waiting for the backend is actually required. I
> > > mean, in theory xennet_start_xmit could return without calling
> > > xennet_tx_buf_gc, it is just an optimization. But I am not sure about
> > > this.
> > 
> > The function xennet_start_xmit() will not wait and directly return
> > back, but if we review the whole flow we can see the skb is freed until
> > the softirq NET_TX.
> 
> Is it an issue that the skb is not freed until later? Is that affecting
> the latency results? It shouldn't, right?

I did an extra experiment in Xen net forend driver, I enabled the flag
"info->bounce = true" so the forend driver will use bounce buffer to
store data and release the skb immediately to network core layer.

The throughput can be boosted significantly for this: the netperf
result can be improved from 107.73 Mbits/s to 300+ Mbits/s.

> What matters is when dom0 is
> getting those packets on the physical network interface and that happens
> before the skb is freed. I am just trying to figure out if we are
> focusing on the right problem.

Good point.  I agree that releasing skb earlier only can benefit for
throughput, but we still cannot resolve the latency issue if Dom0
takes long time to relay packets to phusical network interface.

> > In this whole flow, it needs DomU and Dom0 to work
> > together (includes two context switches) to process skb.
> 
> There are not necessarily 2 context switches as things should run in
> parallel.
> 
> > Here I mean the optimization is to allow Dom0 and DomU to work in
> > parallel.  It could be something like blow, the key point is DomU
> > doesn't need to wait for Dom0's notification.
> 
> I think it is already the case that domU doesn't need to wait for dom0's
> notification?

Agree.  domU doesn't need to wait for dom0's notification until it uses
out the skb can be allocated by the network core layer.  This is why I
also can tweak core layer's parameters for buffer size (see
/proc/sys/net/core/wmem_default and /proc/sys/net/core/wmem_max).

> It is true that domU is waiting for dom0's notification to
> free the skb but that shouldn't affect latency?

Yeah.  I will focus on the elaberated issue above that Dom0 takes long
time to receive the notification.

Will keep posted if have any new finding.

Thanks,
Leo

