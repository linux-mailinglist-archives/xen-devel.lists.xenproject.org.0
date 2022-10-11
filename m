Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D92115FBD2E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 23:48:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420501.665361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiN5h-0003hD-9w; Tue, 11 Oct 2022 21:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420501.665361; Tue, 11 Oct 2022 21:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiN5h-0003eR-6t; Tue, 11 Oct 2022 21:47:09 +0000
Received: by outflank-mailman (input) for mailman id 420501;
 Tue, 11 Oct 2022 21:47:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qgQ=2M=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oiN5f-0003eL-Gw
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 21:47:07 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e519d4f-49ae-11ed-8fd0-01056ac49cbb;
 Tue, 11 Oct 2022 23:47:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E26AB612E8;
 Tue, 11 Oct 2022 21:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C80C433C1;
 Tue, 11 Oct 2022 21:47:01 +0000 (UTC)
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
X-Inumbo-ID: 3e519d4f-49ae-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665524823;
	bh=CKa4NsoRTuQrE0ZnowDI8sJhAILN0d44//XO98OJQg8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IudgEOlScCuSK5Elpr2t2ZwgjQ6jHbpjekrz2qGoHKzv5LR+uGVa1w3ffhGOC+2l6
	 Fm3SrUIwI75++RzJIlU7W0HBGAWTnsf1JUoRt3bGiI2v6DFTGKVsTmyNIJzyvQ9IYV
	 Bk/bwoQ89/s9b9P1+lMvgb9ZcwO5fMuNiK+GF6d/G3V46V2pS72+WoRzHoGhekW9Ul
	 nODv5n7wPiO3wHyuTY+0bwRgf8H8yTkop3wtDqWQDhonNfg5CxCvT4n+WPS61nK1oi
	 YCSbbcyjq7WOvXmaU+Aa43qU1oG2Ji4zO0zFWN8UO1SK9vNjxw60p3Zg7k+LOvQZ8/
	 m/eLPdkXdj31Q==
Date: Tue, 11 Oct 2022 14:47:00 -0700 (PDT)
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
In-Reply-To: <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan>
Message-ID: <alpine.DEB.2.22.394.2210111434240.3690179@ubuntu-linux-20-04-desktop>
References: <Y0QMQuAUKKSgrAAV@leoy-yangtze.lan> <alpine.DEB.2.22.394.2210101621480.3690179@ubuntu-linux-20-04-desktop> <Y0VbQ3esM8gucmqQ@leoy-yangtze.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Oct 2022, Leo Yan wrote:
> > > The second question is how to mitigate the long latency when send data
> > > from DomU.  A possible solution is the Xen network forend driver copies
> > > skb into mediate (bounce) buffer, just like what does in Xen net
> > > backend driver with gnttab_batch_copy(), in this way the forend driver
> > > doesn't need to wait for backend driver response and directly return
> > > back.
> > 
> > About this, I am not super familiar with drivers/net/xen-netfront.c but
> > I take you are referring to xennet_tx_buf_gc? Is that the function that
> > is causing xennet_start_xmit to wait?
> 
> No.  We can take the whole flow in xen-netfront.c as:
> 
>   xennet_start_xmit()
>              ----------> notify Xen Dom0 to process skb
>              <---------  Dom0 copies skb and notify back to DomU
>   xennet_tx_buf_gc()
>   softirq/NET_TX : __kfree_skb()

Let me premise again that I am not an expert in PV netfront/netback.
However, I think the above is only true if DomU and Dom0 are running on
the same physical CPU. If you use sched=null as I suggested above,
you'll get domU and dom0 running at the same time on different physical
CPUs and the workflow doesn't work as described.

It should be:

CPU1: xennet_start_xmit()             ||  CPU2: doing something else
CPU1: notify Xen Dom0 to process skb  ||  CPU2: receive notification
CPU1: return from xennet_start_xmit() ||  CPU2: Dom0 copies skb
CPU1: do something else               ||  CPU2: notify back to DomU
CPU1: receive irq, xennet_tx_buf_gc() ||  CPU2: do something else


> > I didn't think that waiting for the backend is actually required. I
> > mean, in theory xennet_start_xmit could return without calling
> > xennet_tx_buf_gc, it is just an optimization. But I am not sure about
> > this.
> 
> The function xennet_start_xmit() will not wait and directly return
> back, but if we review the whole flow we can see the skb is freed until
> the softirq NET_TX.

Is it an issue that the skb is not freed until later? Is that affecting
the latency results? It shouldn't, right? What matters is when dom0 is
getting those packets on the physical network interface and that happens
before the skb is freed. I am just trying to figure out if we are
focusing on the right problem.


> In this whole flow, it needs DomU and Dom0 to work
> together (includes two context switches) to process skb.

There are not necessarily 2 context switches as things should run in
parallel.


> Here I mean the optimization is to allow Dom0 and DomU to work in
> parallel.  It could be something like blow, the key point is DomU
> doesn't need to wait for Dom0's notification.

I think it is already the case that domU doesn't need to wait for dom0's
notification? It is true that domU is waiting for dom0's notification to
free the skb but that shouldn't affect latency?


>        DomU                     |             Dom0
>   ------------------------------+-------------------------------
>   xennet_start_xmit()           |
>   copy skb in grant page        |
>   notify Xen Dom0               |
>                                 |  fetch skb from grant page
>   xennet_tx_buf_gc()            |  deliver skb to bridge
>     kfree_skb()                 |

