Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A467A7C491F
	for <lists+xen-devel@lfdr.de>; Wed, 11 Oct 2023 07:15:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615053.956491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqRXt-0002g8-Cq; Wed, 11 Oct 2023 05:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615053.956491; Wed, 11 Oct 2023 05:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqRXt-0002e1-9a; Wed, 11 Oct 2023 05:14:09 +0000
Received: by outflank-mailman (input) for mailman id 615053;
 Tue, 10 Oct 2023 13:22:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oemd=FY=linaro.org=bill.mills@srs-se1.protection.inumbo.net>)
 id 1qqCgr-00073B-QB
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 13:22:25 +0000
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c3c562d-6770-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 15:22:24 +0200 (CEST)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3ae55c2e12bso4102941b6e.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Oct 2023 06:22:24 -0700 (PDT)
Received: from [192.168.2.7] (pool-108-31-156-225.washdc.fios.verizon.net.
 [108.31.156.225]) by smtp.gmail.com with ESMTPSA id
 r5-20020ac85205000000b004181aa90b46sm4492961qtn.89.2023.10.10.06.22.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 06:22:22 -0700 (PDT)
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
X-Inumbo-ID: 0c3c562d-6770-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696944143; x=1697548943; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kFYaphee/OWYJ27akU61ySL2pcyi+L0fBa4hg4/3zoY=;
        b=c1igc+MBwY+ZeIgdnNdAKPPgcxB4GRg5Xk8bMFV1TzEMGbJgE+IXH5SGAhd3ItQikx
         nNYT5oGRTVaysCErHXSmElZF3H1YiQ8Rz/cdWA/7DqsW60Ph+7ZN43dex1eNL83xPx42
         9R5leJ9qGAtbI/my71JfRAN+dFs4RzaPBXgQf2oCUJqTkb4wwLZCLGYw+LAf213oAzVZ
         Yn+6hMMvebCTWI53r00BtP+N5yT/EKvWIJv/f+fy416ojvRCVu5MQMAwwpkHvE1SsOfo
         8QIPMbiF6S7/znYSkZYtv//IwNFgh7jMRRDokfcGUsD9+VfdKECe0T2bSsrL2GUdOvdd
         YmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696944143; x=1697548943;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kFYaphee/OWYJ27akU61ySL2pcyi+L0fBa4hg4/3zoY=;
        b=GcQUOt8AWISUBmMRn/+9ykZifIwULerOrRx7CP/0iPLlxYHzu+38j3GrPDz7qMk0hB
         OwTn4Xf0Wk7eGipv4vnWathXuR5P86f3BYF6j0O1q5b7kPSX/PsmqVzFRVUKfdd4q4k+
         fCQR8E3at7zdEftWgQv/YQOwHNan1E5oepY1mOpARSN2RhOsCCrf85jacEOLE/+DRHLL
         soAqYL8upWeiM4fVFBFM695yPx81XgjIMbWJY7rioqTtUNgGpQYkgljtO+Lu/0HoyKR9
         aTAPdFV9y3OnLTrKQVmlw3KSBlP6fZHGcfrwq+1adr88KIDHpZ7cuqZypvR3R2EZLdN3
         5qxg==
X-Gm-Message-State: AOJu0YxwYfgYq2SERGoqiBGyDWbc1Gjx6Js9tNhJJLIrCFia9+1Wvw+X
	Xn/RtfskwFwnV1wwWq0WiwInnQ==
X-Google-Smtp-Source: AGHT+IGt5DfbIAyyFbvDL1031BwHE+134NWp0GPw9ZXRVvuTrzv7JENSrRl2NlkoylidPQmariFEOw==
X-Received: by 2002:aca:1c18:0:b0:3ae:5c89:dcc2 with SMTP id c24-20020aca1c18000000b003ae5c89dcc2mr19889308oic.34.1696944142863;
        Tue, 10 Oct 2023 06:22:22 -0700 (PDT)
Message-ID: <920a671c-1927-4086-950f-db8e3293a989@linaro.org>
Date: Tue, 10 Oct 2023 09:22:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Stratos-dev] [PATCH V3 2/2] xen: privcmd: Add support for
 ioeventfd
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: stratos-dev@op-lists.linaro.org,
 Erik Schilling <erik.schilling@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
References: <cover.1696850733.git.viresh.kumar@linaro.org>
 <957de2a53dde99a653b47af9c95bc17692870294.1696850733.git.viresh.kumar@linaro.org>
From: Bill Mills <bill.mills@linaro.org>
In-Reply-To: <957de2a53dde99a653b47af9c95bc17692870294.1696850733.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Viresh,

On 10/9/23 7:29 AM, Viresh Kumar via Stratos-dev wrote:
> Virtio guests send VIRTIO_MMIO_QUEUE_NOTIFY notification when they need
> to notify the backend of an update to the status of the virtqueue. The
> backend or another entity, polls the MMIO address for updates to know
> when the notification is sent.
> 
> It works well if the backend does this polling by itself. But as we move
> towards generic backend implementations, we end up implementing this in
> a separate user-space program.
> 
> Generally, the Virtio backends are implemented to work with the Eventfd
> based mechanism. In order to make such backends work with Xen, another
> software layer needs to do the polling and send an event via eventfd to
> the backend once the notification from guest is received. This results
> in an extra context switch.
> 
> This is not a new problem in Linux though. It is present with other
> hypervisors like KVM, etc. as well. The generic solution implemented in
> the kernel for them is to provide an IOCTL call to pass the address to
> poll and eventfd, which lets the kernel take care of polling and raise
> an event on the eventfd, instead of handling this in user space (which
> involves an extra context switch).
> 
> This patch adds similar support for xen.
> 
> Inspired by existing implementations for KVM, etc..
> 
> This also copies ioreq.h header file (only struct ioreq and related
> macros) from Xen's source tree (Top commit 5d84f07fe6bf ("xen/pci: drop
> remaining uses of bool_t")).
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>   drivers/xen/Kconfig               |   8 +-
>   drivers/xen/privcmd.c             | 405 +++++++++++++++++++++++++++++-
>   include/uapi/xen/privcmd.h        |  18 ++
>   include/xen/interface/hvm/ioreq.h |  51 ++++
>   4 files changed, 476 insertions(+), 6 deletions(-)
>   create mode 100644 include/xen/interface/hvm/ioreq.h
> 
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index d43153fec18e..d5989871dd5d 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -269,12 +269,12 @@ config XEN_PRIVCMD
>   	  disaggregated Xen setups this driver might be needed for other
>   	  domains, too.
>   
> -config XEN_PRIVCMD_IRQFD
> -	bool "Xen irqfd support"
> +config XEN_PRIVCMD_EVENTFD
> +	bool "Xen Ioeventfd and irqfd support"

You certainly know about kernel policies better than I but why the 
CONGIG_ name change?

With this change all downstream distros need to find this and re-enable 
it if they want to keep a working Xen system.

I presume the kernel can still work in the old way and not use your new 
mode correct?

I would certainly change the description but I wonder about keeping the 
CONFIG_ name the same.

No issue if I am obviously wrong and this is done all the time.

Thanks,
Bill

