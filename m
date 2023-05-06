Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EFF6F8D68
	for <lists+xen-devel@lfdr.de>; Sat,  6 May 2023 03:14:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530769.826520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv6UP-0006OR-Dx; Sat, 06 May 2023 01:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530769.826520; Sat, 06 May 2023 01:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pv6UP-0006LP-BH; Sat, 06 May 2023 01:13:33 +0000
Received: by outflank-mailman (input) for mailman id 530769;
 Sat, 06 May 2023 01:13:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CN1r=A3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pv6UO-0006LJ-1H
 for xen-devel@lists.xenproject.org; Sat, 06 May 2023 01:13:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35f1d39d-ebab-11ed-b226-6b7b168915f2;
 Sat, 06 May 2023 03:13:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 316E4641D3;
 Sat,  6 May 2023 01:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803CCC433D2;
 Sat,  6 May 2023 01:13:27 +0000 (UTC)
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
X-Inumbo-ID: 35f1d39d-ebab-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683335608;
	bh=kbfyCZ/OIOcwupFcFbstNbToCUDi6rMZBmq26a28eDA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AdAbF1L56MX8vHqQ6MzWKJGRAbRAMP3R1IXMtemOzD2oN9rzpV3BZDxQr7u9YS4Of
	 LZIB5myzBjj/w/uKDLFBKVDBSTxK9TRF5Q0arZk1rPDNQ4Xd7nqfWro5SdxegzDF/f
	 qkGQU0GRkxngpXz3UmTh1pAgjmrC0dZL8QFUw9IRbSQ80c4F89MBiyeFt645FTgT9E
	 5mYfdiIkLhtesYcnxz37VWLPlPMpa4xMkwiWhhyZtdFTp2yHODj6E22PlQq/JN4vrU
	 x6h7+WyyOtXQJZAv521wU6F2lXpPxHuH1N3vrf0iy/p2fq+gumzQMrplu9SrdfYrUQ
	 +yvMevRdK6tvA==
Date: Fri, 5 May 2023 18:13:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mark Syms <mark.syms@citrix.com>
cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony.perard@citrix.com, 
    paul@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/1] Updated: Ensure PV ring is drained on disconenct
In-Reply-To: <20230420102014.647446-1-mark.syms@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2305051759260.974517@ubuntu-linux-20-04-desktop>
References: <20230329105344.3465706-2-mark.syms@citrix.com> <20230420102014.647446-1-mark.syms@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 20 Apr 2023, Mark Syms wrote:
> Updated patch to address intermittent SIGSEGV on domain disconnect/shutdown.
> 
> Mark Syms (1):
>   Ensure the PV ring is drained on disconnect
> 
>  hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> -- 
> 2.40.0
> 
> >From 21724baa15a72534d98aa2653e9ec39e83559319 Mon Sep 17 00:00:00 2001
> From: Mark Syms <mark.syms@citrix.com>
> Date: Thu, 20 Apr 2023 11:08:34 +0100
> Subject: [PATCH 1/1] Ensure the PV ring is drained on disconnect
> 
> Also ensure all pending AIO is complete.

Hi Mark, can you please add more info on the problem you are trying to
solve? Also add any stacktrace if you get any due to this error.


> Signed-off-by: Mark Syms <mark.syms@citrix.com>
> ---
>  hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
> index 734da42ea7..d9da4090bf 100644
> --- a/hw/block/dataplane/xen-block.c
> +++ b/hw/block/dataplane/xen-block.c
> @@ -523,6 +523,10 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
>  
>      dataplane->more_work = 0;
>  
> +    if (dataplane->sring == 0) {
> +        return done_something;

done_something cannot be changed by now, so I would just do

    return false;


> +    }
> +
>      rc = dataplane->rings.common.req_cons;
>      rp = dataplane->rings.common.sring->req_prod;
>      xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
> @@ -666,14 +670,35 @@ void xen_block_dataplane_destroy(XenBlockDataPlane *dataplane)
>  void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
>  {
>      XenDevice *xendev;
> +    XenBlockRequest *request, *next;
>  
>      if (!dataplane) {
>          return;
>      }
>  
> +    /* We're about to drain the ring. We can cancel the scheduling of any
> +     * bottom half now */
> +    qemu_bh_cancel(dataplane->bh);
> +
> +    /* Ensure we have drained the ring */
> +    aio_context_acquire(dataplane->ctx);

Would it make sense to move the 2 loops below under the existing
aio_context_acquire also below?


> +    do {
> +        xen_block_handle_requests(dataplane);
> +    } while (dataplane->more_work);
> +    aio_context_release(dataplane->ctx);
> +
> +    /* Now ensure that all inflight requests are complete */
> +    while (!QLIST_EMPTY(&dataplane->inflight)) {
> +        QLIST_FOREACH_SAFE(request, &dataplane->inflight, list, next) {
> +            blk_aio_flush(request->dataplane->blk, xen_block_complete_aio,
> +                        request);
> +        }
> +    }

especially because I would think that blk_aio_flush needs to be called
with aio_context_acquired ?



>      xendev = dataplane->xendev;
>  
>      aio_context_acquire(dataplane->ctx);
> +

move the new code here


>      if (dataplane->event_channel) {
>          /* Only reason for failure is a NULL channel */
>          xen_device_set_event_channel_context(xendev, dataplane->event_channel,
> @@ -684,12 +709,6 @@ void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
>      blk_set_aio_context(dataplane->blk, qemu_get_aio_context(), &error_abort);
>      aio_context_release(dataplane->ctx);
>  
> -    /*
> -     * Now that the context has been moved onto the main thread, cancel
> -     * further processing.
> -     */
> -    qemu_bh_cancel(dataplane->bh);
> -
>      if (dataplane->event_channel) {
>          Error *local_err = NULL;
>  
> -- 
> 2.40.0
> 

