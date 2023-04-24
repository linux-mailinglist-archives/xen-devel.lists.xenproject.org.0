Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0466ECA60
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 12:33:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525281.816385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqtV1-0006Ty-0b; Mon, 24 Apr 2023 10:32:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525281.816385; Mon, 24 Apr 2023 10:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqtV0-0006Ro-U1; Mon, 24 Apr 2023 10:32:46 +0000
Received: by outflank-mailman (input) for mailman id 525281;
 Mon, 24 Apr 2023 10:32:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=riw3=AP=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pqtUz-0006Ri-9y
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 10:32:45 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58a39b88-e28b-11ed-b223-6b7b168915f2;
 Mon, 24 Apr 2023 12:32:43 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so27748705e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Apr 2023 03:32:43 -0700 (PDT)
Received: from [192.168.22.129] (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b003ee74c25f12sm15346187wmq.35.2023.04.24.03.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 03:32:42 -0700 (PDT)
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
X-Inumbo-ID: 58a39b88-e28b-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682332363; x=1684924363;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HekhlNECns07R44Z9K5TIYVtdNSMvGMR7D7aXuLTW4w=;
        b=KqZvlooGqzPbFnYyoDT9FR0u1PhaTgbn10imLe1nJE+SRYop93wiiDtVO/ojxVwXND
         wYjg/iNbNfOxJobCSTYOX+yOxRdzaYbFnTQvB5hk9qI/MxAle4JMicOwxCgOjABOX0K1
         tzn/rTk6Row7ti33PB193CSA1cFJajtI4NXNYCLmX1Dq1BXyYNWQRxeOQhtr0fNAI230
         lB6HU89tg4MuAM0LxgLshhaLgF5xWVdfIkBebwjg1cJ1tkhNvZ9+MzgD36LcXmOzer3m
         A3/KCRvhNJNALRLc/vZnP/4LbU2lalgM8BSjIPMws/AF+35MLA3GerCfppzA5nN2mYEU
         nqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682332363; x=1684924363;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HekhlNECns07R44Z9K5TIYVtdNSMvGMR7D7aXuLTW4w=;
        b=cupQE2qB+e1Yh/utCj+Okb6K+phY6rK4U3azYcAA/lj+dqtI+IdaPFlzKbcmW25b0/
         Xq70Io4cXwX26yWWJK+30BT72Y1GsxEFUS/5TQ1UOAKRJzbRQKq0mmJSGqhirtM2QMCr
         whOzCRNlvbXZg7v1dpDLfdw216t5eZ5WzIxaszuJmSCIVXBBS05kfWuQKpX9dmQFAdga
         WGbTlenyeyUIJWT0WbACYRDArEoWZbJbNIgqkb489SMHtumBK/4230iOiT0fHMmZVIDl
         zCEvDPPAyktkAQ5ZXigDikdKRRn87BXgbKIqUiGbh1wMLcUZ6x+l0wR/tvZs9kXIE1qi
         eohA==
X-Gm-Message-State: AAQBX9eC5mKQnaq9h6mxeB9SrIuqxQpxkKKgxuYcZXqRakkwxnzNY8SL
	ViLIuiL1xEJ8RF1/LTfSrBE=
X-Google-Smtp-Source: AKy350aHtxscROpY+5mNq4W2uKR9Is2yVrdGfKhbjlxYoDFPfS5Ov6f3mTC72TrqfIGT+sUwMQsshQ==
X-Received: by 2002:a7b:cb8a:0:b0:3ee:1acd:b039 with SMTP id m10-20020a7bcb8a000000b003ee1acdb039mr7454121wmi.34.1682332362824;
        Mon, 24 Apr 2023 03:32:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <54a37172-cad5-3b27-36fc-3b7768e39df8@xen.org>
Date: Mon, 24 Apr 2023 11:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Reply-To: paul@xen.org
Subject: Re: [PATCH v2 RESEND] xen: Fix SEGV on domain disconnect
Content-Language: en-US
To: mark.syms@citrix.com, qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230420110205.688689-1-mark.syms@citrix.com>
Organization: Xen Project
In-Reply-To: <20230420110205.688689-1-mark.syms@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/04/2023 12:02, mark.syms@citrix.com wrote:
> From: Mark Syms <mark.syms@citrix.com>
> 
> Ensure the PV ring is drained on disconnect. Also ensure all pending
> AIO is complete, otherwise AIO tries to complete into a mapping of the
> ring which has been torn down.
> 
> Signed-off-by: Mark Syms <mark.syms@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Anthony Perard <anthony.perard@citrix.com>
> CC: Paul Durrant <paul@xen.org>
> CC: xen-devel@lists.xenproject.org
> 
> v2:
>   * Ensure all inflight requests are completed before teardown
>   * RESEND to fix formatting
> ---
>   hw/block/dataplane/xen-block.c | 31 +++++++++++++++++++++++++------
>   1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/block/dataplane/xen-block.c b/hw/block/dataplane/xen-block.c
> index 734da42ea7..d9da4090bf 100644
> --- a/hw/block/dataplane/xen-block.c
> +++ b/hw/block/dataplane/xen-block.c
> @@ -523,6 +523,10 @@ static bool xen_block_handle_requests(XenBlockDataPlane *dataplane)
>   
>       dataplane->more_work = 0;
>   
> +    if (dataplane->sring == 0) {
> +        return done_something;
> +    }
> +

I think you could just return false here... Nothing is ever going to be 
done if there's no ring :-)

>       rc = dataplane->rings.common.req_cons;
>       rp = dataplane->rings.common.sring->req_prod;
>       xen_rmb(); /* Ensure we see queued requests up to 'rp'. */
> @@ -666,14 +670,35 @@ void xen_block_dataplane_destroy(XenBlockDataPlane *dataplane >   void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
>   {
>       XenDevice *xendev;
> +    XenBlockRequest *request, *next;
>   
>       if (!dataplane) {
>           return;
>       }
>   
> +    /* We're about to drain the ring. We can cancel the scheduling of any
> +     * bottom half now */
> +    qemu_bh_cancel(dataplane->bh);
> +
> +    /* Ensure we have drained the ring */
> +    aio_context_acquire(dataplane->ctx);
> +    do {
> +        xen_block_handle_requests(dataplane);
> +    } while (dataplane->more_work);
> +    aio_context_release(dataplane->ctx);
> +

I don't think we want to be taking new requests, do we?

> +    /* Now ensure that all inflight requests are complete */
> +    while (!QLIST_EMPTY(&dataplane->inflight)) {
> +        QLIST_FOREACH_SAFE(request, &dataplane->inflight, list, next) {
> +            blk_aio_flush(request->dataplane->blk, xen_block_complete_aio,
> +                        request);
> +        }
> +    }
> +

I think this could possibly be simplified by doing the drain after the 
call to blk_set_aio_context(), as long as we set dataplane->ctx to 
qemu_get_aio_context(). Alos, as long as more_work is not set then it 
should still be safe to cancel the bh before the drain AFAICT.

   Paul

>       xendev = dataplane->xendev;
>   
>       aio_context_acquire(dataplane->ctx);
> +
>       if (dataplane->event_channel) {
>           /* Only reason for failure is a NULL channel */
>           xen_device_set_event_channel_context(xendev, dataplane->event_channel,
> @@ -684,12 +709,6 @@ void xen_block_dataplane_stop(XenBlockDataPlane *dataplane)
>       blk_set_aio_context(dataplane->blk, qemu_get_aio_context(), &error_abort);
>       aio_context_release(dataplane->ctx);
>   
> -    /*
> -     * Now that the context has been moved onto the main thread, cancel
> -     * further processing.
> -     */
> -    qemu_bh_cancel(dataplane->bh);
> -
>       if (dataplane->event_channel) {
>           Error *local_err = NULL;
>   


