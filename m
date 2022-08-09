Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE86D58D33F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 07:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382708.617766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtk-0000qG-L5; Tue, 09 Aug 2022 05:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382708.617766; Tue, 09 Aug 2022 05:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtk-0000nb-Ha; Tue, 09 Aug 2022 05:35:24 +0000
Received: by outflank-mailman (input) for mailman id 382708;
 Tue, 09 Aug 2022 05:35:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6IoV=YN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oLHtj-0000ds-7l
 for xen-devel@lists.xen.org; Tue, 09 Aug 2022 05:35:23 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f622828-17a5-11ed-bd2e-47488cf2e6aa;
 Tue, 09 Aug 2022 07:35:22 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so11157209pjf.5
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 22:35:22 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 y2-20020aa793c2000000b0052d27ccea39sm10002509pff.19.2022.08.08.22.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 22:35:20 -0700 (PDT)
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
X-Inumbo-ID: 0f622828-17a5-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=sxsdoFrwkTGSzFfDcFGJYqH8jWwXyV+j/itYZYHO1nE=;
        b=VmBR9tX/7F9hlrCyuovy7dlFdZ/FQZXNgyFRDkz4ChyXa2m0+0dnEJYgZyptaZy5Iw
         NSIwcXSSOZeLkfpBkQLAO2mtCT5LXmqlWm7K6igMTJucC0IqHHQv/bX6x4f+wLIMrOlR
         3GdblxCk9mnR4YSiGTS2gsiwv3YxL8XJp1BiSLGZAzyQyIZjkXeWftaQecjIhYTTQkoT
         HlTsWCvplUv4JyWjSPvEdD0RnrEFXwDZQhRxXCyQfzbQ4ZXpKdUPRRCKcrItWZaZ53og
         uAV62rBgYDFnbmEE9s8LNtrwyyI/jsK5vubQLapMV0G+YKxb+ax7UGIeFsYPPoDQCNW0
         n+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=sxsdoFrwkTGSzFfDcFGJYqH8jWwXyV+j/itYZYHO1nE=;
        b=IDVS7aMFnfLAj6TrZ78fZ2A5flANswrY5Vi9fbH4ToA0KntEfuuU+CZhgiu2UoZ5cL
         e7WWmucwHXsSweaCKswGzLfXZQsBrgaTOrU+DLAi6/B5x+DqYGdNs2m8W6Y85kc5IrT2
         eyq4k8wUdiYvjkmvowMKALF7lsKulfiJmmFX5yLuzYptlwiTDMBKIvvU2wNosFv9AwP9
         Ti7L9kqXDwnKIHJbwqhyvhZhBgIeJ4H3VkwO2A8yT9K0ejUHaGH7u7Ym/rJVKNFwyfAM
         iuOGMkuAXV49+R+SzkjZvlq5DvYQj6vJJ+OEmX0joqKicppoSXc0tvh81P7vvNlVKw07
         PknQ==
X-Gm-Message-State: ACgBeo09jz/W4cbGY4muKrboTdNCX8Ify8aBhZbfSmAROrbD2rHPN6C3
	rRd/WpF+yiuaVxIVum0l73p8WA==
X-Google-Smtp-Source: AA6agR7GFFB5zlYYFATETkU6XTUusnM2wOXA0ekOT6Wyk9cwetCDljUZhGbmmO0aUZ2C/BeLz0dWaw==
X-Received: by 2002:a17:902:e848:b0:16f:8f:9027 with SMTP id t8-20020a170902e84800b0016f008f9027mr22128862plg.66.1660023320869;
        Mon, 08 Aug 2022 22:35:20 -0700 (PDT)
Date: Tue, 9 Aug 2022 11:05:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr <olekstysh@gmail.com>
Cc: xen-devel@lists.xen.org, Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>, Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V3 3/6] libxl: arm: Create alloc_virtio_mmio_params()
Message-ID: <20220809053518.v4tk6kue23aqmtwa@vireshk-i7>
References: <cover.1659596139.git.viresh.kumar@linaro.org>
 <ae3e61fe687cb2d9dac17622da2ec81c4064db39.1659596139.git.viresh.kumar@linaro.org>
 <82a9d50c-58ef-1842-be7f-33a05d861f15@gmail.com>
 <20220809042905.stgxxaofmtmwwkp4@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220809042905.stgxxaofmtmwwkp4@vireshk-i7>

On 09-08-22, 09:59, Viresh Kumar wrote:
> There is only one use of virtio_enabled after this patch, i.e. do
> check for vpl011. Maybe we can drop the variable and use
> virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST ?

Nevermind, after modifying code I decided to keep the variable
instead.

-- 
viresh

