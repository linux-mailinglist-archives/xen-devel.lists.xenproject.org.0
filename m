Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772399931A9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 17:43:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812204.1224934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpt2-0006Xh-Dx; Mon, 07 Oct 2024 15:43:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812204.1224934; Mon, 07 Oct 2024 15:43:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxpt2-0006Uy-Af; Mon, 07 Oct 2024 15:43:04 +0000
Received: by outflank-mailman (input) for mailman id 812204;
 Mon, 07 Oct 2024 15:43:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRLk=RD=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1sxpt1-0006L5-81
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 15:43:03 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5b962ee-84c2-11ef-99a2-01e77a169b0f;
 Mon, 07 Oct 2024 17:43:01 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2fabfc06de3so49658791fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 08:43:01 -0700 (PDT)
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
X-Inumbo-ID: d5b962ee-84c2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728315781; x=1728920581; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cpMX1eumT+9vHxAImP8gJlIeH1i2TPrcR6wzeFPuFJM=;
        b=LCd5Q6cyEN44PGMcdNTw5hGKPYHHJEs+9kg200cnGjyK6bAC/rHG9lZudsCmB1UW2w
         7q6D4XRFsM2ga8yfuYvpgDI7sNWcKxCZY0m8DP1VhY0TitiBSCfdrgIQHGjqlOiMlG/z
         /V26gHKjjESiqFnKxQbb05uRCI8s0BVnyGQb4ec8ZQ/TlAM9IJRKDr4YCnjFSaaOf73R
         +Eu7uihVz1WH6x72ww/XOZDHxzS7wjjgBNRWJ1odrjDm53XkR47y/QFY697tx98IDAvk
         MSrXyG9TGEZkMGFIYj+Ii+NqDcRcjz0fTCG0kg8/dqA9bjpxRJzchOI1T8AMb1QLjkkW
         ZqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728315781; x=1728920581;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpMX1eumT+9vHxAImP8gJlIeH1i2TPrcR6wzeFPuFJM=;
        b=SJAcFnRhNjlpPuQ1Cr8jNB14DomUAcpHYRQ8QcVcZk+XLRIj+7bk5Gf/13jpf5pDNi
         Wf5ge2yJuQALISY9HhTZj9FuILn4ElVJNppVmdVQ4BXkGp0Pd8jdNSpiVd74i8nvtTSz
         3Av8jfP6E7brwgw0/IaZUH0oVHwgCA4kMWs2mSZqg0usy/UpahABtkATn60V+KtokZi3
         MvJAiIF+4vXOmKW6S9bMt2bSu+OB3B8Ag10WbOktKoE1k9+bq4ruh/Yw2n+K/CWJmlCL
         8fYx/K2mfuTGWMkbi8AOGDUufqwnTWRcMNhDo3D7guu+QRktevkAO/RyCV1M9+YmTgAl
         2XAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg5TSOZwb+rhYNKQ1/urYKaEeDl35u9tDcqy7LWi+nHLEa9xFYKp94ie1Fd/zfPFHU5d1FleWmjTI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwNERBeEXAU4x0heD7kPCodSaxsbaOk8FCjdBAUbTklxo8NR41u
	tugcrF3WUjVoCtaHy8JZlFp3PiG+a58Dzr6+iIIb71l3AYUAVydnBjVCbSg/hiFIXQwpAAOtrC5
	/ODIgJ9W5ZhUTsGlriDW+UHUCxsRkiPzGvZHhSg==
X-Google-Smtp-Source: AGHT+IETk110tVG61E3F4FABrVSMPupalOBdEBJHK8o1Bqxb8M7h2LJ4plW2qf4888jIdIKNQ+CkKsjEM2CDkn/sJBA=
X-Received: by 2002:a2e:4e02:0:b0:2f5:2e2:eadf with SMTP id
 38308e7fff4ca-2faf3c1c87fmr45497171fa.10.1728315780966; Mon, 07 Oct 2024
 08:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241003185655.1480819-1-edgar.iglesias@gmail.com> <20241003185655.1480819-3-edgar.iglesias@gmail.com>
In-Reply-To: <20241003185655.1480819-3-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Oct 2024 16:42:49 +0100
Message-ID: <CAFEAcA9SgThjVW=VY_ZeKZh0bAe+rbTReK00DAQEXgMwD8cNqQ@mail.gmail.com>
Subject: Re: [PULL v2 2/5] hw/xen: Expose handle_bufioreq in xen_register_ioreq
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-devel@nongnu.org, sstabellini@kernel.org, anthony@xenproject.org, 
	paul@xen.org, edgar.iglesias@amd.com, xen-devel@lists.xenproject.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Oct 2024 at 19:57, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
>
> Expose handle_bufioreq in xen_register_ioreq().
> This is to allow machines to enable or disable buffered ioreqs.
>
> No functional change since all callers still set it to
> HVM_IOREQSRV_BUFIOREQ_ATOMIC.
>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Hi; Coverity has noticed a problem (CID 1563383) with this change:

> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index 3a9d6f981b..7d2b72853b 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -667,6 +667,8 @@ static int xen_map_ioreq_server(XenIOState *state)
>      xen_pfn_t ioreq_pfn;
>      xen_pfn_t bufioreq_pfn;
>      evtchn_port_t bufioreq_evtchn;

In this function bufioreq_evtchn is declared uninitialized...

> +    unsigned long num_frames = 1;
> +    unsigned long frame = 1;
>      int rc;
>
>      /*
> @@ -675,59 +677,78 @@ static int xen_map_ioreq_server(XenIOState *state)
>       */
>      QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_bufioreq != 0);
>      QEMU_BUILD_BUG_ON(XENMEM_resource_ioreq_server_frame_ioreq(0) != 1);
> +
> +    if (state->has_bufioreq) {
> +        frame = 0;
> +        num_frames = 2;
> +    }
>      state->fres = xenforeignmemory_map_resource(xen_fmem, xen_domid,
>                                           XENMEM_resource_ioreq_server,
> -                                         state->ioservid, 0, 2,
> +                                         state->ioservid,
> +                                         frame, num_frames,
>                                           &addr,
>                                           PROT_READ | PROT_WRITE, 0);
>      if (state->fres != NULL) {
>          trace_xen_map_resource_ioreq(state->ioservid, addr);
> -        state->buffered_io_page = addr;
> -        state->shared_page = addr + XC_PAGE_SIZE;
> +        state->shared_page = addr;
> +        if (state->has_bufioreq) {
> +            state->buffered_io_page = addr;
> +            state->shared_page = addr + XC_PAGE_SIZE;
> +        }
>      } else if (errno != EOPNOTSUPP) {
>          error_report("failed to map ioreq server resources: error %d handle=%p",
>                       errno, xen_xc);
>          return -1;
>      }
>
> -    rc = xen_get_ioreq_server_info(xen_domid, state->ioservid,
> -                                   (state->shared_page == NULL) ?
> -                                   &ioreq_pfn : NULL,
> -                                   (state->buffered_io_page == NULL) ?
> -                                   &bufioreq_pfn : NULL,
> -                                   &bufioreq_evtchn);

...which was OK prior to this change, because (ignoring the
early-exit case) we would always pass through this function
call, which initializes bufioreq_evtchn...

> -    if (rc < 0) {
> -        error_report("failed to get ioreq server info: error %d handle=%p",
> -                     errno, xen_xc);
> -        return rc;
> -    }
> +    /*
> +     * If we fail to map the shared page with xenforeignmemory_map_resource()
> +     * or if we're using buffered ioreqs, we need xen_get_ioreq_server_info()
> +     * to provide the the addresses to map the shared page and/or to get the
> +     * event-channel port for buffered ioreqs.
> +     */
> +    if (state->shared_page == NULL || state->has_bufioreq) {
> +        rc = xen_get_ioreq_server_info(xen_domid, state->ioservid,
> +                                       (state->shared_page == NULL) ?
> +                                       &ioreq_pfn : NULL,
> +                                       (state->has_bufioreq &&
> +                                        state->buffered_io_page == NULL) ?
> +                                       &bufioreq_pfn : NULL,
> +                                       &bufioreq_evtchn);

...but now the initialization has moved inside an if() so it only
happens under certain conditions...

> +        if (rc < 0) {
> +            error_report("failed to get ioreq server info: error %d handle=%p",
> +                         errno, xen_xc);
> +            return rc;
> +        }
>
> -    if (state->shared_page == NULL) {
> -        trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
> +        if (state->shared_page == NULL) {
> +            trace_xen_map_ioreq_server_shared_page(ioreq_pfn);
>
> -        state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
> -                                                  PROT_READ | PROT_WRITE,
> -                                                  1, &ioreq_pfn, NULL);
> +            state->shared_page = xenforeignmemory_map(xen_fmem, xen_domid,
> +                                                      PROT_READ | PROT_WRITE,
> +                                                      1, &ioreq_pfn, NULL);
> +        }
>          if (state->shared_page == NULL) {
>              error_report("map shared IO page returned error %d handle=%p",
>                           errno, xen_xc);
>          }
> -    }
>
> -    if (state->buffered_io_page == NULL) {
> -        trace_xen_map_ioreq_server_buffered_io_page(bufioreq_pfn);
> +        if (state->has_bufioreq && state->buffered_io_page == NULL) {
> +            trace_xen_map_ioreq_server_buffered_io_page(bufioreq_pfn);
>
> -        state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
> -                                                       PROT_READ | PROT_WRITE,
> -                                                       1, &bufioreq_pfn,
> -                                                       NULL);
> -        if (state->buffered_io_page == NULL) {
> -            error_report("map buffered IO page returned error %d", errno);
> -            return -1;
> +            state->buffered_io_page = xenforeignmemory_map(xen_fmem, xen_domid,
> +                                                        PROT_READ | PROT_WRITE,
> +                                                        1, &bufioreq_pfn,
> +                                                        NULL);
> +            if (state->buffered_io_page == NULL) {
> +                error_report("map buffered IO page returned error %d", errno);
> +                return -1;
> +            }
>          }
>      }
>
> -    if (state->shared_page == NULL || state->buffered_io_page == NULL) {
> +    if (state->shared_page == NULL ||
> +        (state->has_bufioreq && state->buffered_io_page == NULL)) {
>          return -1;
>      }

...and the tail end of the function has not been modified, so
(not visible in this diff context) when we do:

    trace_xen_map_ioreq_server_buffered_io_evtchn(bufioreq_evtchn);

    state->bufioreq_remote_port = bufioreq_evtchn;

    return 0;

we may be using it uninitialized (in the trace statement
and when assigning it to state->bufioreq_remote_port).

Could you have a look at this and send a fix, please?

thanks
-- PMM

