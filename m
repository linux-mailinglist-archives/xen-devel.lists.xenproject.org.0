Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4EE5170CE
	for <lists+xen-devel@lfdr.de>; Mon,  2 May 2022 15:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.318885.538854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWKS-00016Y-4I; Mon, 02 May 2022 13:43:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 318885.538854; Mon, 02 May 2022 13:43:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlWKS-00013M-1H; Mon, 02 May 2022 13:43:08 +0000
Received: by outflank-mailman (input) for mailman id 318885;
 Mon, 02 May 2022 13:43:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ohg0=VK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1nlWKR-00013G-0S
 for xen-devel@lists.xenproject.org; Mon, 02 May 2022 13:43:07 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cbae447b-ca1d-11ec-a405-831a346695d4;
 Mon, 02 May 2022 15:43:06 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id p12so25354866lfs.5
 for <xen-devel@lists.xenproject.org>; Mon, 02 May 2022 06:43:06 -0700 (PDT)
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
X-Inumbo-ID: cbae447b-ca1d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1w0rsc5UcgM9aQ0WNcQ2pVdP625Ey+eZbK2+xDUD+so=;
        b=fDKhLXQDqFQ6xzMIw+Ao4mn6CeNvt/ejr+rl374eLHfSkOvlHiXcSJIR8wG/76TUTC
         InmtWsObvrBRo+Szrfcvp+QmDgSvUl5AxmVh/Wlr24pACtnsiqQgpDVaGWEFv/N2tJmm
         K+vxO1PXKxiN3XHRuJH6NsoSUiB6K54K8ixUelxktOaKNv4LyyspyvXSdNKpJ6WCW86d
         O4QGHTHgOc3pIgMdbR3sj/rvM8OgnEnjnJfwAyIb/Ijp2qdIJkAxm+MmV/ZjOCDdpfru
         siYzwPlx5kyiehN2zUORTOr1jM/YS0mleiC1PbWMVucL9jVrj4YuN4VJkY1QcgT7M/dd
         Qy9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1w0rsc5UcgM9aQ0WNcQ2pVdP625Ey+eZbK2+xDUD+so=;
        b=VXhkBQZs83zShxkfGa2tqNOsA41kk2tGeTZ4iNsTwlHXtTh3bbC1t7TgfZqRWychzQ
         FqaWX5qBfMgnW7oiIMzY2UdzpRVomGZYu2A8uFMoKhd73m9YLYfrU2C4d9gRGlC99zTY
         hCbWi2rq0IjnMVw0fO1Su90mxm7uz5o5T0njfKv6rbuWJe5FVkCOFLbPL2vb1ghWoYSU
         Oj8yBs/DAavW1K5BbcEt12QlomdsDxam6BhHlX/8ql/3oN1JaxggUw/QAztQsH+LyWq1
         FKVt1Yvwx7qBiJxD05YDaRbprQxsfCAznvsiIY0f/WFsz5WLmjAdoBA0RAanxJYBtOdI
         8PgQ==
X-Gm-Message-State: AOAM53197XEwQxUwieTSnFoX/336hs/Cy+wQTVGRl4uWMya02wlXbwA1
	wGvKxoBMbQOWyphj2Vno772g8M82Q58igLKGQlo=
X-Google-Smtp-Source: ABdhPJxP/kSSgXQisj6BsRqGiXDGbQxxWoPRhLMRrl9rbsulRSkkaBSUC7J601FoBOHrAUZSfRjfJNCu2YGk7cOIQ8M=
X-Received: by 2002:a05:6512:11cc:b0:44a:5770:7425 with SMTP id
 h12-20020a05651211cc00b0044a57707425mr8458291lfr.406.1651498985737; Mon, 02
 May 2022 06:43:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220502133027.920-1-dpsmith@apertussolutions.com> <20220502133027.920-2-dpsmith@apertussolutions.com>
In-Reply-To: <20220502133027.920-2-dpsmith@apertussolutions.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 2 May 2022 09:42:54 -0400
Message-ID: <CAKf6xptU7VxGzaHe=jVc0O2fbZfQi1Rmf0hDsJzOB-9k7=4W-Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] xsm: create idle domain privileged and demote
 after setup
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>, 
	Scott Davis <scott.davis@starlab.io>, christopher.clark@starlab.io, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, 
	Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Type: text/plain; charset="UTF-8"

On Mon, May 2, 2022 at 9:31 AM Daniel P. Smith
<dpsmith@apertussolutions.com> wrote:
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed4..b9057222d6 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1048,6 +1048,10 @@ void __init start_xen(unsigned long boot_phys_offset,
>      /* Hide UART from DOM0 if we're using it */
>      serial_endboot();
>
> +    if ( (rc = xsm_set_system_active()) != 0 )
> +        panic("xsm(err=%d): "
> +              "unable to set hypervisor to SYSTEM_ACTIVE privilege\n", err);

You want to print rc in this message.

Regards,
Jason

