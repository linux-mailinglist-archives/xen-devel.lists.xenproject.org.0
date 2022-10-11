Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986405FB1F0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 14:03:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419673.664494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDyh-0008QH-Md; Tue, 11 Oct 2022 12:03:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419673.664494; Tue, 11 Oct 2022 12:03:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiDyh-0008OS-Jx; Tue, 11 Oct 2022 12:03:19 +0000
Received: by outflank-mailman (input) for mailman id 419673;
 Tue, 11 Oct 2022 12:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dF7p=2M=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1oiDyg-0008O3-Bo
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 12:03:18 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0262672-495c-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 14:03:16 +0200 (CEST)
Received: by mail-pj1-x1030.google.com with SMTP id 70so12277038pjo.4
 for <xen-devel@lists.xenproject.org>; Tue, 11 Oct 2022 05:03:16 -0700 (PDT)
Received: from leoy-yangtze.lan (211-75-219-202.hinet-ip.hinet.net.
 [211.75.219.202]) by smtp.gmail.com with ESMTPSA id
 e14-20020a17090301ce00b001782f94f8ebsm8555135plh.3.2022.10.11.05.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 05:03:14 -0700 (PDT)
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
X-Inumbo-ID: b0262672-495c-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw7xUTA3OfRm+ktROCFDpggksMcvBm0LHXupBoTitsY=;
        b=poMvKA3x6D9ff95kRZ8DZsl5ank2XOKrIHHVLKunbMpuGI1s+KrEVhkrlUBU/spP4Z
         xvoTJ84DLxi9uB2Dc2oQagO6lbLh97G6wCheyipMYakBW8edpa3qpkltpC8V3zV1S+m+
         0ekmvjIR38mHHzdQgLs6VROY7MVi9/ttnozqIjZa3E5sBB47cpv0i7KlVF428VPgdixg
         lfTAmvjYZDuPwAkoeCWSRasBq7R/4LCvB9fSkuFGsTWDjNACy0FvAXNpsVqNHOlGVPsI
         StDfPDnfZrsftcD8YDJKTgI36lxqMmZ303r0vZ3veLN4Fw4MAnKcYYtYNSvD1UGuMBK2
         geVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fw7xUTA3OfRm+ktROCFDpggksMcvBm0LHXupBoTitsY=;
        b=YEtswKg2xM+pIGtT1EOTOk+WwwPx9w1jJXGhGf0vnJyav6+Mac3/xq3oauTjMqfp9+
         wRTI4VNM7oxqT47XURZ4fCSfgVSGnlDh8rO1nV7Uz+W8mskUmuPTCu3qRlw4wbyvGZGB
         0lUoSaKWfHU6xcqkvzDCP/zkIgHGbfqUIzguzIjr9eIfcZHJoO/NyY5BdNwJsPqWSMyX
         yMVYjTRuh6DhAeVfrZBfdu03voBx9hBvPcw1SJCgWZ4ts9gCZ0LLTTwpvN9eIimqf5qU
         E6wwxXy5RZiVunGaHIlpKDCBJjWO/kVXELADN+7BW5bZg9HGtJFliqJ0wnMceSpIGeVF
         ELTA==
X-Gm-Message-State: ACrzQf33f5XGb9YEh2n0+PFvdARcsN+2V74q+nzRaG0Mwnu7/+bkbFh1
	l49Rmt65oBYDJSS5XoBUOSi28Q==
X-Google-Smtp-Source: AMsMyM6GO05Kc0vW+atcj6gu+28B8erR9r00BWvogZ8fs6Dqi1qW34KoEfcqD3l80eANs4ShanDTvw==
X-Received: by 2002:a17:902:d4d2:b0:178:491b:40d with SMTP id o18-20020a170902d4d200b00178491b040dmr24592958plg.79.1665489795167;
        Tue, 11 Oct 2022 05:03:15 -0700 (PDT)
Date: Tue, 11 Oct 2022 20:03:06 +0800
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
Message-ID: <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan>
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan>
 <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop>

Hi Stefano,

On Mon, Oct 10, 2022 at 04:50:46PM -0700, Stefano Stabellini wrote:
> +Xen/Linux maintainers

Thanks for reviewing.

[...]

> >   Throughput result:
> > 
> >     Profile     netperf (Mbits/sec)    ddsperf (Mbits/sec)
> >     Xen-Dom0    939.41                 > 620
> >     Xen-DomU    107.73                 4~12
> > 
> >   Latency result:
> > 
> >     Profile     ddsperf's max ping/pong latency (us)
> >     Xen-Dom0    200 ~ 1400
> >     Xen-DomU    > 60,000
> > 
> > ## Analysis
> > 
> > The critical thing for the performance is low level network driver if
> > it uses synchronous or asynchronous mode for skb transferring.
> > 
> > When we transfer data from my x86 machine to Xen DomU, the data flow is:
> > 
> >   bridge -> xenif (Xen network backend driver)               => Dom0
> > 	      `> xennet driver (Xen net forend driver)       => DomU
> > 
> > In this flow, Xen network backend driver (in Dom0) copies skb into the
> > mediate buffer (gnttab_batch_copy()) and notify Xen VM by sending rx
> > irq, the key point is the backend driver doesn't wait for Xen VM to
> > process the skb and directly return to user space, therefore, Xen Dom0
> > and DomU work in asynchronous mode in this case (Dom0 doesn't need to
> > wait for DomU), the duration for handling a skb is 30+ us.
> > 
> > Conversely, if transmit data from Xen DomU, the flow is:
> > 
> >            DomU                    |               Dom0
> >   ---------------------------------+------------------------------------
> >   xennet driver receives skb       |
> >     `> send tx interrupt to Dom0   |
> >                                    |  xenif respond tx interrupt
> > 	                           |  Copy skb into mediate buffer
> >                                    |  Notify DomU (send tx irq)
> >   xennet driver handle tx irq      |
> >   free skb                         |
> > 
> > So we can see when DomU sends out packets, it needs to wait for Dom0 to
> > process the packets, until Dom0 notifies DomU that packet has been
> > processed the net forend driver in DomU releases skb.
> > 
> > This means it's a long way to process skbs: Xen DomU and Dom0 work
> > in synchronous mode, the forend driver in DomU sends out skb and
> > notifies Dom0, Dom0 handles skb and notifies back to DomU, finally DomU
> > knows the skb has been processed and releases it.  The duration between
> > sendind and releasing a skb is about 180+ us.
> 
> 180us is not great but above you wrote > 60,000 us. In what ways the two
> measurements differ?

108us is measured by using ftrace events 'net_dev_queue' and
'kfree_skb'.

60,000us is the measured maximum latency via ddsperf ping & pong [1],
the latency is not only caused by low level driver and hypervisor, it
also contains the latency caused by the test program itself.

AFAIK, ddsperf monitors traffic from userspace and throttle data
transferring when it detects tx rate is low, I think this is one main
reason for the huge latency (60ms+) from ddsperf.

[1] https://cyclonedds.io/docs/cyclonedds/latest/getting_started.html#measuring-latency

> > ## Questions
> > 
> > Given Xen network driver has been merged in Linux kernel 2.6 (back in
> > 2007), it's very unlikely I am the first person to observe this issue.
> > 
> > I think this is a common issue and not specific to Arm64 arch, the
> > reason is the long latency is mainly caused by Xen networking driver
> > and I did't see the Xen context switching on Arm64 is abnormal (I saw
> > it takes ~10us for context switching between Xen domains).
>  
> Context switching between domains shouldn't come into the picture. For a
> latency measurement like that I would make sure to:
> 
> - use the null scheduler, sched=null
> - use vwfi=native
> 
> This way, we can be sure both domains are running and there are no
> context switches. It should lead to the best latency measurements. Also
> this is the configuration we use by default at Xilinx.

Okay, will try these two options at my side and share back the testing
result.

> > Could anyone confirm if this is a known issue?
> 
> This is not something that was discussed recently as far as I know.

It is a bit worried me if I am the first one to report this issue.

Either it's because this is a specific issue for Arm64 since Xen is
much less deployed on Arm64 than x86 platforms; or I must miss something
for causing the poor network performance.

> > The second question is how to mitigate the long latency when send data
> > from DomU.  A possible solution is the Xen network forend driver copies
> > skb into mediate (bounce) buffer, just like what does in Xen net
> > backend driver with gnttab_batch_copy(), in this way the forend driver
> > doesn't need to wait for backend driver response and directly return
> > back.
> 
> About this, I am not super familiar with drivers/net/xen-netfront.c but
> I take you are referring to xennet_tx_buf_gc? Is that the function that
> is causing xennet_start_xmit to wait?

No.  We can take the whole flow in xen-netfront.c as:

  xennet_start_xmit()
             ----------> notify Xen Dom0 to process skb
             <---------  Dom0 copies skb and notify back to DomU
  xennet_tx_buf_gc()
  softirq/NET_TX : __kfree_skb()

> I didn't think that waiting for the backend is actually required. I
> mean, in theory xennet_start_xmit could return without calling
> xennet_tx_buf_gc, it is just an optimization. But I am not sure about
> this.

The function xennet_start_xmit() will not wait and directly return
back, but if we review the whole flow we can see the skb is freed until
the softirq NET_TX.  In this whole flow, it needs DomU and Dom0 to work
together (includes two context switches) to process skb.

Here I mean the optimization is to allow Dom0 and DomU to work in
parallel.  It could be something like blow, the key point is DomU
doesn't need to wait for Dom0's notification.

       DomU                     |             Dom0
  ------------------------------+-------------------------------
  xennet_start_xmit()           |
  copy skb in grant page        |
  notify Xen Dom0               |
                                |  fetch skb from grant page
  xennet_tx_buf_gc()            |  deliver skb to bridge
    kfree_skb()                 |

> > But here I am not clear for the mechanism for Xen grant table,
> > especially if the Xen grant table is only writtable from Dom0, then it
> > would be hard for us to optimize the forend driver in DomU by directly
> > copying skb into the grant table.  Any thoughts for this?
> 
> The grant table is a mechanism for the frontend to "grant" access to a
> specific page to the backend. It is used for dynamic memory sharing
> between frontend and backend:
> 
> - frontend grants a page
> - frontend copies grant reference to shared ring
> - backend receives request and map granted page
> - backend process request
> - backend complete request and unmap granted page, send notification
> - frontend un-grant the page
> 
> This is the regular process. In addition, for performance reason, it is
> also possible to request Xen to copy a grant to the backend. This is
> less common, but it is used by PV network, specifically by
> gnttab_batch_copy. It is an alternative to mapping which is expected to
> be faster for networking.

Thanks a lot for the shared info.

I saw both net frontend and backend drivers use gnttab_batch_copy(); I
need a bit more time to understand ring and grant table and how these
two parts co-work together.

Thanks,
Leo

