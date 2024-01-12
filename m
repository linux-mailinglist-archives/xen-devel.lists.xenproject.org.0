Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6559182BB45
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jan 2024 07:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666666.1037445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOB1o-0005eX-Pm; Fri, 12 Jan 2024 06:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666666.1037445; Fri, 12 Jan 2024 06:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rOB1o-0005cX-N9; Fri, 12 Jan 2024 06:28:28 +0000
Received: by outflank-mailman (input) for mailman id 666666;
 Fri, 12 Jan 2024 06:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qIBg=IW=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1rOB1n-0005ba-BN
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2024 06:28:27 +0000
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [2607:f8b0:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca6921f7-b113-11ee-98f0-6d05b1d4d9a1;
 Fri, 12 Jan 2024 07:28:26 +0100 (CET)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3bd4e6a7cb0so1057236b6e.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 22:28:26 -0800 (PST)
Received: from localhost ([122.172.81.83]) by smtp.gmail.com with ESMTPSA id
 d13-20020a056a0010cd00b006da04ab75a8sm2403788pfu.1.2024.01.11.22.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 22:28:24 -0800 (PST)
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
X-Inumbo-ID: ca6921f7-b113-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705040905; x=1705645705; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zTdeMtiWZWpHbbW9PpBxT/lyVqLrotNVomhipJy6wZQ=;
        b=PFNxF1Na++cIs1I6RczgDtyMzuy8mcWpupI5G6s06fp6LfQQcgTVM8fqkaVKiqKZ7K
         tjBMWtIgQ+zO4j2/PfQMWGYnAw1zZI7TCQjY0U5Ya1oFcYgu6U8jxG/+6e9JgSrXOMxO
         PM1Ru+3OvNpaVv5KWN0KtCCapopQfOK47btsBVkIvjHDI68wz1+h13BO3r+MoXdhGqy0
         yK7IKlNFQqO3mxF2jRaOjtgEOJ0PEc1ks3jyspYyE8Flnw5TaooU6fKggHFrXaGsH83Q
         53bH19g7sZYOC+pf1mUn3OUZC2dOnU0wHuVIzMFz7Rq3KQRxbW9RP/J/Z2MMj6J3ToGT
         Bmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705040905; x=1705645705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTdeMtiWZWpHbbW9PpBxT/lyVqLrotNVomhipJy6wZQ=;
        b=q3Tyt2o8Tzof7KfkPcI55Lq7WLhIDY/Yo/xZfGGXIq33BR4kq41XXvqyVLNhmRClV4
         tTK3IHnFozhDx2sihgQ54Z+CIjgJ3TxBAHrXzcIBnMsyqv6eDXiAif/QxqN0lLXfewVZ
         0tmE+dDnesScZ9EuloWZ0uZuv/jZKT8tC4rcnKn5iGxwFvkWa+xi07ngQX1H6p12Hakc
         SC6Kc3RSyv0d50MC+Lh/ZJeR9v+yeQlD27J39wJsDw+Bxn7YKtFkx/9XcH1ueauTdwbt
         NfRQUwfGB57UZgk6/6c14c8L0e12M4bUchyHEfJF7HoOOb6TBWrl2NeD5+USSb1+zicb
         CPcg==
X-Gm-Message-State: AOJu0YzTa1kDi/Hsv3iLnUK4tGMQHhAPRDF6W0fgTBUCp7P6tkyZpagv
	nKn2pjyDJAkYkwUSmF5TZ27bta+7fBGFGQ==
X-Google-Smtp-Source: AGHT+IEW5rYFGTmfMZg/wDii9PrNksOY1fnoYEvVRTm9r/XqAoWhq6Tw29Sa82HBCHSuRCmxpNi4FA==
X-Received: by 2002:a05:6808:2208:b0:3bd:5377:79df with SMTP id bd8-20020a056808220800b003bd537779dfmr601197oib.82.1705040904889;
        Thu, 11 Jan 2024 22:28:24 -0800 (PST)
Date: Fri, 12 Jan 2024 11:58:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>,
	Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [VirtIO] Support for various devices in Xen
Message-ID: <20240112062822.n5knlmloh3olxedv@vireshk-i7>
References: <PA4PR04MB95655F653BBFE3A70A8CD0FBF9682@PA4PR04MB9565.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR04MB95655F653BBFE3A70A8CD0FBF9682@PA4PR04MB9565.eurprd04.prod.outlook.com>

+ Few Linaro folks.

Hi Andrei,

On 11-01-24, 15:32, Andrei Cherechesu (OSS) wrote:
> Hello,
> 
> As I've mentioned in previous discussion threads in the xen-devel
> community, we are running Xen 4.17 (uprev to 4.18 in progress) on NXP
> S32G automotive processors (Cortex-A53 cores) and we wanted to know more
> about the support for various VirtIO device types in Xen.
> 
> In the Xen 4.17 release notes, the VirtIO standalone backends mentioned
> as supported and tested are: virtio-disk, virtio-net, virtio-i2c and
> virtio-gpio.

We worked on I2C and GPIO for Linaro's Project Orko [1].

> However, we've only managed to successfully set up and try some
> use-cases with the virtio-disk standalone backend [0] (which Olexandr
> provided) based on the virtio-mmio transport.
> 
> As such, we have a few questions, which we haven't been able to figure
> out from the mailing list discussions and/or code:
>     1. Are there any plans for the virtio-disk repo to have a stable
>     version? Is it going to be long-term hosted and maintained in the
>     xen-troops github repo? Or was it just an one-time PoC implementation
>     and the strategy for future VirtIO devices will be based on a more generic
>     approach (i.e., without need for a specific standalone app)?
> 
>     2. With regards to the other backends, we want to try out and provide PV
>     networking to a DomU based on virtio-net, but we haven't found any available
>     resources for it (e.g., the standalone backend implementation if needed for
>     control plane, configuration examples, presentations, demos, docs). Does it
>     rely on the QEMU virtio-net or vhost implementation? Are there any examples
>     on how to set it up? Any required Xen/Linux Kernel/QEMU versions?
> 
>     3. What other VirtIO device types are there planned to be supported in Xen?
>     I'm supposing libxl will also need changes to accomodate new configuration
>     parameters for each of them. Or is there something I'm missing?
> 
>     4. Also, while we're at it, are there any plans regarding SCMI
>     awareness for Xen (e.g., SCMI Mediator - where the RFC thread from 2022
>     seems discontinued)? Or is the preferred approach for sharing SCMI access
>     to guests through virtio-scmi?
> 
> Thank you very much for the support, once again, and we're also looking
> forward to the progress on the rust-vmm initiative.

We have tested our work mostly with the rust-vmm community. We have
already upstreamed support for Xen's Foreign and Grant mapping in
there. We are maintaining a separate crate [2] inside of rust-vmm, for
all the backends, which can also be tested easily with Xen I suppose
(now that we have support for a generic Virtio-device in there).

> Regards,
> Andrei Cherechesu,
> NXP Semiconductors
> 
> [0] https://github.com/xen-troops/virtio-disk

-- 
viresh

[1] https://linaro.atlassian.net/wiki/spaces/ORKO/overview
[2] https://github.com/rust-vmm/vhost-device

