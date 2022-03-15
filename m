Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE454D9D03
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 15:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290818.493329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU7sV-0000y1-0X; Tue, 15 Mar 2022 14:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290818.493329; Tue, 15 Mar 2022 14:10:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nU7sU-0000vC-Tg; Tue, 15 Mar 2022 14:10:22 +0000
Received: by outflank-mailman (input) for mailman id 290818;
 Tue, 15 Mar 2022 14:10:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CN+Q=T2=gmail.com=dpsmith.dev@srs-se1.protection.inumbo.net>)
 id 1nU7sS-0000v6-NL
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 14:10:20 +0000
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [2607:f8b0:4864:20::f35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a505d9f7-a469-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 15:10:19 +0100 (CET)
Received: by mail-qv1-xf35.google.com with SMTP id im7so15063569qvb.4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Mar 2022 07:10:19 -0700 (PDT)
Received: from [10.10.1.138] (static-72-81-132-2.bltmmd.fios.verizon.net.
 [72.81.132.2]) by smtp.gmail.com with ESMTPSA id
 v12-20020a05622a130c00b002e1b3ccd9adsm11032306qtk.79.2022.03.15.07.10.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 07:10:17 -0700 (PDT)
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
X-Inumbo-ID: a505d9f7-a469-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Fd21nn7utQUFzxQeohDqeIbJOfE8Y2VfTpbAVYToe/Y=;
        b=hCC4Dz84tLvXl4s6U8hdazZJePjFF2Bp5TZrfNn/RZvTuctV+PfkfGOanm+ZhHGotU
         pFsqZ1QBieppcVs97MfewBcT2DA9ACkZVtLMtmsxB2fQ5bHueN8R6IO7oDik+tOH1RPQ
         0ob6H0lFv3uZjjafaz46KtHhUmAdd4aWTQjdGjoGX2U/RKGf66+zpe3dYEg25KH7GG1U
         Vt3XDiRa/uSUPUmzlCDDTKELAew+Ha4rvQ5fA1TYBHnN9kG1xUr1wgBvsENzAcUEXSDM
         XOczYDo55MEd98ha03r9TrEuTlAbnhm1XpSlYSEwxu/ZUNg3hK35MiDRR4qrkhlfjO2I
         sPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Fd21nn7utQUFzxQeohDqeIbJOfE8Y2VfTpbAVYToe/Y=;
        b=eci77LBSw9ODVrY8OLigMAejPzQScvPj6OpUxiVv0V7XD11TGXIB9Y5iejfSb36lCb
         QAI+XN3z6rtVVOP1EZZWY3wygjFi7eWpuANTARSue641Iq0Eo3rvLz/tAAJTIG0303F0
         sgVUjSl4rsp+dit5rVemhL1EeafUkoi0sZiIEnUzGojhM3mdXtZ3lV0CWqRlkpyiLn8a
         e/x0PyAaaEuQAvXFQzseE/7WXitipwNcZlKrz10gbNKQIRe+pVeK7XtXBaeVhYJtnZSL
         B3aI+ir7Nn6bUr5H1uCFaeY8yG6XJXNyHwC5LVO38UUd1q0Kwn9ou888lQON516bxSJy
         oHdA==
X-Gm-Message-State: AOAM533GDnI9mFq0RrcMlXLfTiWehcSkVU37gW9X6VA1o0wHE+OF1TJ1
	UUM1jxut5BtsCx9B267QZIA=
X-Google-Smtp-Source: ABdhPJw5JfLj5DL/EeJyw9y6tmsMMc6KxbiIcZGH052bb3lQ2q/72N1oPnS9uLL3GptGX+yn7zVdTQ==
X-Received: by 2002:a05:6214:2581:b0:440:b232:1ecc with SMTP id fq1-20020a056214258100b00440b2321eccmr7378182qvb.120.1647353418408;
        Tue, 15 Mar 2022 07:10:18 -0700 (PDT)
Message-ID: <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com>
Date: Tue, 15 Mar 2022 10:10:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-2-sstabellini@kernel.org>
From: "Daniel P. Smith" <dpsmith.dev@gmail.com>
In-Reply-To: <20220128213307.2822078-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/28/22 16:33, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> The xenstore event channel will be allocated for dom0less domains. It is
> necessary to have access to the evtchn_alloc_unbound function to do
> that, so make evtchn_alloc_unbound public.
> 
> Add a skip_xsm parameter to allow disabling the XSM check in
> evtchn_alloc_unbound (xsm_evtchn_unbound wouldn't work for a call
> originated from Xen before running any domains.)
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Wei Liu <wl@xen.org>
> ---
> Changes v3:
> - expose evtchn_alloc_unbound, assing a skip_xsm parameter
> ---
>  xen/common/event_channel.c | 13 ++++++++-----
>  xen/include/xen/event.h    |  3 +++
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index da88ad141a..be57d00a15 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -284,7 +284,7 @@ void evtchn_free(struct domain *d, struct evtchn *chn)
>      xsm_evtchn_close_post(chn);
>  }
>  
> -static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
> +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
>  {
>      struct evtchn *chn;
>      struct domain *d;
> @@ -301,9 +301,12 @@ static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
>          ERROR_EXIT_DOM(port, d);
>      chn = evtchn_from_port(d, port);
>  
> -    rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
> -    if ( rc )
> -        goto out;
> +    if ( !skip_xsm )
> +    {
> +        rc = xsm_evtchn_unbound(XSM_TARGET, d, chn, alloc->remote_dom);
> +        if ( rc )
> +            goto out;
> +    }

Please do not subvert the security framework because it causes an
inconvenience. As Jan recommended, work within the XSM check to allow
your access so that we may ensure it is done safely. If you need any
help making modifications to XSM, please do not hesitate to reach out as
I will gladly help.

>      evtchn_write_lock(chn);
>  
> @@ -1195,7 +1198,7 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          struct evtchn_alloc_unbound alloc_unbound;
>          if ( copy_from_guest(&alloc_unbound, arg, 1) != 0 )
>              return -EFAULT;
> -        rc = evtchn_alloc_unbound(&alloc_unbound);
> +        rc = evtchn_alloc_unbound(&alloc_unbound, false);
>          if ( !rc && __copy_to_guest(arg, &alloc_unbound, 1) )
>              rc = -EFAULT; /* Cleaning up here would be a mess! */
>          break;
> diff --git a/xen/include/xen/event.h b/xen/include/xen/event.h
> index 21c95e14fd..0a2cdedf7d 100644
> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -68,6 +68,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest);
>  /* Free an event channel. */
>  void evtchn_free(struct domain *d, struct evtchn *chn);
>  
> +/* Create a new event channel port */
> +int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm);
> +
>  /* Allocate a specific event channel port. */
>  int evtchn_allocate_port(struct domain *d, unsigned int port);
>  

