Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F05FA8BC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 01:51:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419393.664154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi2Xw-0004P2-Fs; Mon, 10 Oct 2022 23:50:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419393.664154; Mon, 10 Oct 2022 23:50:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oi2Xw-0004NS-Cv; Mon, 10 Oct 2022 23:50:56 +0000
Received: by outflank-mailman (input) for mailman id 419393;
 Mon, 10 Oct 2022 23:50:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1zPM=2L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oi2Xu-0004NJ-QN
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 23:50:54 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f6b1baf-48f6-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 01:50:53 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74A6BB81100;
 Mon, 10 Oct 2022 23:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577DEC433C1;
 Mon, 10 Oct 2022 23:50:48 +0000 (UTC)
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
X-Inumbo-ID: 5f6b1baf-48f6-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665445850;
	bh=ql01mw8O2lPAPWEa8qMQjpv4fx+WlR5ssKGLIryOI/g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JdaXsEGVg8zBNZIPoLrFnFUnksvuslpVkkuWLOC94XtYhwsVQKidu+zOyk/68eZDT
	 EWcsqrPZwu4nYeKTPNdi6qqwELv7P1eIfbqQ9eNWtSSNu/LDyOK2gO1xsq8OKWv+p/
	 zrBlR67FoMgzDLmKWzfkOPGguvyQFDYcN7dRAw2SkhXsbFiFVGlPbgvJN9CfJYrzrT
	 /yFcPxgJU2o4lpe2zijYtuMoPokel13H62YOpkACsTLjBUakGNr2f1VJeW/uY4vk3v
	 JT6pKXxvJpsnD/jUUupaHAaTKaJwzMw3WCxbqr+E1xnAXj466Gij3DMA3esCwOStJ1
	 JfiOAWPjmSnsQ==
Date: Mon, 10 Oct 2022 16:50:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Leo Yan <leo.yan@linaro.org>
cc: Xen Develop <xen-devel@lists.xenproject.org>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Mathieu Poirier <mathieu.poirier@linaro.org>, 
    Kasper Ornstein Mecklenburg <Kasper.OrnsteinMecklenburg@arm.com>, 
    jgross@suse.com, oleksandr_tyshchenko@epam.com, boris.ostrovsky@oracle.com, 
    wei.liu@kernel.org, paul@xen.org
Subject: Re: Issue: Networking performance in Xen VM on Arm64
In-Reply-To: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan>
Message-ID: <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop>
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+Xen/Linux maintainers


On Mon, 10 Oct 2022, Leo Yan wrote:
> Hi there,
> 
> I tested the networking performance on my Arm64 platform in Xen
> virtual machine, below I will try to give out summary for testing
> result and share some analysis, at the end I want to check a bit
> from the community and get suggestion before I can proceed.
> 
> First of all, if you want to know more details for the profiling, you
> could access the slides:
> https://docs.google.com/presentation/d/1iTQRx8-UYnm19eU6CnVUSaAodKZ0JuRiHYaXBomfu3E/edit?usp=sharing
> 
> ## Testing summary
> 
> The TL;DR is that I used two tools: netperf and ddsperf to test the
> networking latency and throughput for Xen Dom0 and DomU, the below
> result shows the performance for sending data from a Xen domain (Dom0
> or DomU) to my x86 PC respectively, and performance is poor when
> transmit data from Xen DomU (Note, I used the default networking
> bridge configuration when launch Xen VM).
> 
>   Throughput result:
> 
>     Profile     netperf (Mbits/sec)    ddsperf (Mbits/sec)
>     Xen-Dom0    939.41                 > 620
>     Xen-DomU    107.73                 4~12
> 
>   Latency result:
> 
>     Profile     ddsperf's max ping/pong latency (us)
>     Xen-Dom0    200 ~ 1400
>     Xen-DomU    > 60,000
> 
> ## Analysis
> 
> The critical thing for the performance is low level network driver if
> it uses synchronous or asynchronous mode for skb transferring.
> 
> When we transfer data from my x86 machine to Xen DomU, the data flow is:
> 
>   bridge -> xenif (Xen network backend driver)               => Dom0
> 	      `> xennet driver (Xen net forend driver)       => DomU
> 
> In this flow, Xen network backend driver (in Dom0) copies skb into the
> mediate buffer (gnttab_batch_copy()) and notify Xen VM by sending rx
> irq, the key point is the backend driver doesn't wait for Xen VM to
> process the skb and directly return to user space, therefore, Xen Dom0
> and DomU work in asynchronous mode in this case (Dom0 doesn't need to
> wait for DomU), the duration for handling a skb is 30+ us.
> 
> Conversely, if transmit data from Xen DomU, the flow is:
> 
>            DomU                    |               Dom0
>   ---------------------------------+------------------------------------
>   xennet driver receives skb       |
>     `> send tx interrupt to Dom0   |
>                                    |  xenif respond tx interrupt
> 	                           |  Copy skb into mediate buffer
>                                    |  Notify DomU (send tx irq)
>   xennet driver handle tx irq      |
>   free skb                         |
> 
> So we can see when DomU sends out packets, it needs to wait for Dom0 to
> process the packets, until Dom0 notifies DomU that packet has been
> processed the net forend driver in DomU releases skb.
> 
> This means it's a long way to process skbs: Xen DomU and Dom0 work
> in synchronous mode, the forend driver in DomU sends out skb and
> notifies Dom0, Dom0 handles skb and notifies back to DomU, finally DomU
> knows the skb has been processed and releases it.  The duration between
> sendind and releasing a skb is about 180+ us.

180us is not great but above you wrote > 60,000 us. In what ways the two
measurements differ?


> ## Questions
> 
> Given Xen network driver has been merged in Linux kernel 2.6 (back in
> 2007), it's very unlikely I am the first person to observe this issue.
> 
> I think this is a common issue and not specific to Arm64 arch, the
> reason is the long latency is mainly caused by Xen networking driver
> and I did't see the Xen context switching on Arm64 is abnormal (I saw
> it takes ~10us for context switching between Xen domains).
 
Context switching between domains shouldn't come into the picture. For a
latency measurement like that I would make sure to:

- use the null scheduler, sched=null
- use vwfi=native

This way, we can be sure both domains are running and there are no
context switches. It should lead to the best latency measurements. Also
this is the configuration we use by default at Xilinx.


> Could anyone confirm if this is a known issue?

This is not something that was discussed recently as far as I know.


> The second question is how to mitigate the long latency when send data
> from DomU.  A possible solution is the Xen network forend driver copies
> skb into mediate (bounce) buffer, just like what does in Xen net
> backend driver with gnttab_batch_copy(), in this way the forend driver
> doesn't need to wait for backend driver response and directly return
> back.

About this, I am not super familiar with drivers/net/xen-netfront.c but
I take you are referring to xennet_tx_buf_gc? Is that the function that
is causing xennet_start_xmit to wait?

I didn't think that waiting for the backend is actually required. I
mean, in theory xennet_start_xmit could return without calling
xennet_tx_buf_gc, it is just an optimization. But I am not sure about
this.


> But here I am not clear for the mechanism for Xen grant table,
> especially if the Xen grant table is only writtable from Dom0, then it
> would be hard for us to optimize the forend driver in DomU by directly
> copying skb into the grant table.  Any thoughts for this?

The grant table is a mechanism for the frontend to "grant" access to a
specific page to the backend. It is used for dynamic memory sharing
between frontend and backend:

- frontend grants a page
- frontend copies grant reference to shared ring
- backend receives request and map granted page
- backend process request
- backend complete request and unmap granted page, send notification
- frontend un-grant the page

This is the regular process. In addition, for performance reason, it is
also possible to request Xen to copy a grant to the backend. This is
less common, but it is used by PV network, specifically by
gnttab_batch_copy. It is an alternative to mapping which is expected to
be faster for networking.

