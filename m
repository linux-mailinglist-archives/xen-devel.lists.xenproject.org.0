Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C975AB21
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 11:41:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566502.885394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQAA-0001Di-Dl; Thu, 20 Jul 2023 09:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566502.885394; Thu, 20 Jul 2023 09:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMQAA-0001Ba-9w; Thu, 20 Jul 2023 09:41:34 +0000
Received: by outflank-mailman (input) for mailman id 566502;
 Thu, 20 Jul 2023 09:41:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1A6n=DG=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1qMQA9-0001BU-ED
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 09:41:33 +0000
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ae118f8-26e1-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 11:41:31 +0200 (CEST)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-557790487feso381997a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 02:41:31 -0700 (PDT)
Received: from localhost ([122.172.87.195]) by smtp.gmail.com with ESMTPSA id
 13-20020a17090a030d00b0025bbe90d3cbsm701388pje.44.2023.07.20.02.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 02:41:29 -0700 (PDT)
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
X-Inumbo-ID: 9ae118f8-26e1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689846089; x=1690450889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+SuzeACTIOA12bslV6UjXteYfQ39xaXxVv1ezDBpkXs=;
        b=DtmmaKnwLz9laGXKWOpGzlZU52NZ8/CNqMm+SIu37ldYik4X1ML5zRZ5K57SWsCd6w
         eXWrqNraWTwl+xaOzPPByQuOjjCIPmp9jQwdjyMaykAKQM8Eyc5KV6SuKZSrHTlcs22E
         6E2g3pc+8QWxhm2zedmaLBx2dyCGGXjXyMTFogar7kv4LzGah70LpzKRFcUpkiCko5e9
         fKfuPhur4Le3xmze3cZhiEPqRamq9jUDssAF3+u7zaECDoDS38Jov5iEsH74RrtLkDW1
         7qPSqgE1XR7812WkIp/U0om45dOz6btF7RyuCjdPebFuDfnO/+CpKHLHpJcUH03sMP2f
         LXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689846089; x=1690450889;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SuzeACTIOA12bslV6UjXteYfQ39xaXxVv1ezDBpkXs=;
        b=gaVjLYj7geuiPELzZgDiC6h0NPqFXiO48kuhsjZIoaBrkFKspWMKw85HwZSS5yEG8z
         WslKYReIA+kyrQsj/T3Zxmwq/ZG8EWQvaK4Zbquju0XQNEQ9uF/Qps015mzgVY/3mRLw
         oBIYsNtk10v6acLMZtQizmhVjAU9gPx8DUY4bcH7Dh38iqS7jX1Cipd0K5Yovvp4eTuC
         JQMEiezs4O2/wNaXot7zXv7FrJ2lphwrXUR9XAveXWAy9Tt5NRyTpQa7YZ+IKmJR4aVr
         P5GBcjVtVDLlQ7Agl5/kQ8VBZE85s6DtWRHcUG7hbNE/OyxnD09GOuy97TLtQ/jsXGdR
         HrJw==
X-Gm-Message-State: ABy/qLYmZu7eZaLc5f20RxWqA191M/SfB9PL46dQnNf4JQA/yB5W4YD1
	zyYoX0e7nqoRQag1gkVI4z/GWg==
X-Google-Smtp-Source: APBJJlGuE6xqtIRVcarBtL+5N0XK4nCPMj9Vzs4ke5eqWsBK4A0UgqVzdS4XRwcj71761mb9CNXOxQ==
X-Received: by 2002:a17:90b:4a51:b0:263:2495:c27f with SMTP id lb17-20020a17090b4a5100b002632495c27fmr1541541pjb.15.1689846089653;
        Thu, 20 Jul 2023 02:41:29 -0700 (PDT)
Date: Thu, 20 Jul 2023 15:11:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"stratos-dev@op-lists.linaro.org" <stratos-dev@op-lists.linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] xen: privcmd: Add support for irqfd
Message-ID: <20230720094127.zsqpvryj36cbekik@vireshk-i7>
References: <d4e0233524b8c7c48614b09cae4d23f2cdf10988.1689150266.git.viresh.kumar@linaro.org>
 <a5521a9d-72c6-4e03-0fbb-8a37418c32f2@suse.com>
 <97e63191-e2ba-34f6-ca6c-99b9e9841587@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97e63191-e2ba-34f6-ca6c-99b9e9841587@epam.com>

On 13-07-23, 14:40, Oleksandr Tyshchenko wrote:
> Viresh, great work!

Thanks Oleksandr.

> Do you perhaps have corresponding users-space (virtio backend) example 
> adopted for that feature (I would like to take a look at it if possible)?

This is taken care by the xen-vhost-frontend Rust crate in our case
(which was initially designed based on virtio-disk but has deviated a
lot from it now). Here is the commit of interest. The backends remain
unmodified though.

https://github.com/vireshk/xen-vhost-frontend/commit/d79c419f14c1f54240b3147c342894998c274364

And I have updated the commit with CONFIG_ARM64 thingy..

-- 
viresh

