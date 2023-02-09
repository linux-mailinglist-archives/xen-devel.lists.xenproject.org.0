Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6051690014
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 06:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492149.761581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPzt4-0001Gt-Sa; Thu, 09 Feb 2023 05:54:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492149.761581; Thu, 09 Feb 2023 05:54:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPzt4-0001E5-Pq; Thu, 09 Feb 2023 05:54:26 +0000
Received: by outflank-mailman (input) for mailman id 492149;
 Thu, 09 Feb 2023 05:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/p/S=6F=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1pPzt2-0001Dz-HL
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 05:54:24 +0000
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30090f59-a83e-11ed-93b5-47a8fe42b414;
 Thu, 09 Feb 2023 06:54:18 +0100 (CET)
Received: by mail-pj1-x102e.google.com with SMTP id
 d13-20020a17090ad3cd00b0023127b2d602so1291383pjw.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Feb 2023 21:54:17 -0800 (PST)
Received: from localhost ([122.172.83.155]) by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a1fce00b002311a83e333sm2098575pjz.44.2023.02.08.21.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 21:54:15 -0800 (PST)
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
X-Inumbo-ID: 30090f59-a83e-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d7TFb8XDrlHhSX4AMlpcSukotYRX1ULZv1KvAGm5TWI=;
        b=wRIIZNlQneBoIPNhNzoc57T3PqGEEQEUfpX+9cE1ZWqU+eSvJw0CIQharyyZqErB9c
         EVI+6yST//AK5p0L5LZwYcVfOcqYvlE+T9dzUMCCsgtlN5AnvCS3z2vjHntaM7qHWwNL
         tJGQcv5eET76kZu1L6VyK/pboWxwb2hkQQSOG0LITR66wxXoswGHkl6A7bykoKDlaq7X
         dhhvGC7kpJKKZIPMbmgK3o4ciYTbg0WAbOHvGQTC/wBdSDiUCt52+YDvRBvdQrdlp+77
         xzZ9PGqGM7V6r+Nj3kW8853JFosDSvMywHvpo5xLUdjQebfi1PfUqKry2HyZGTq5VQ3q
         ABTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7TFb8XDrlHhSX4AMlpcSukotYRX1ULZv1KvAGm5TWI=;
        b=jjGLv4YG4Elu9O4m+K5lbHVqYIv2xpxjbdrfcY6I+qIYG5STKO7Xms9Yjjnrp0Z+VN
         OUIC6i1BkIk9vfvs0cGPog49mNWdkpvSJYQWKb0LN6NWAvNCDmJKjwbbw4V5V9TWn3LA
         THZI7+Gcq9gSAUge0/kRGw+3yr2YObxa5z2LAApEjSAYsMY0vvIhhawSPxSvKcY5lgrb
         ZgoQUzhfbY6BImdh+dN1pazM6psp1eWLkjpBS2HaKDPUKNU/4DKuDCR5+FzCnpBxoV6J
         GHgFQ3vMDinASNUTYJkMCA2RGLhaF2Noh993x6zsZ2CQZxRjw7ugupWZqOZDtCa/28+e
         ZuzA==
X-Gm-Message-State: AO0yUKVJGkrtGJYp0sYFfsItcJn2xURL5mz5oF1e4qnovHu9xL7V+klv
	mong7njfAxpzxCSy9jnM4K9E+Q==
X-Google-Smtp-Source: AK7set9gpKfCzCj2Ll21QW8zIUO4z1bmq1VMSVFsF72HERDXfuh9ya2AaWtEKox4BHH+HKVEuiZr8g==
X-Received: by 2002:a17:90b:1b07:b0:230:8956:79f1 with SMTP id nu7-20020a17090b1b0700b00230895679f1mr12011918pjb.36.1675922056018;
        Wed, 08 Feb 2023 21:54:16 -0800 (PST)
Date: Thu, 9 Feb 2023 11:24:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/grant-dma-iommu: Implement a dummy probe_device()
 callback
Message-ID: <20230209055413.k2jbmqvqg636jrgw@vireshk-i7>
References: <20230208153649.3604857-1-olekstysh@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208153649.3604857-1-olekstysh@gmail.com>

On 08-02-23, 17:36, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Update stub IOMMU driver (which main purpose is to reuse generic
> IOMMU device-tree bindings by Xen grant DMA-mapping layer on Arm)
> according to the recent changes done in the following
> commit 57365a04c921 ("iommu: Move bus setup to IOMMU device registration").
> 
> With probe_device() callback being called during IOMMU device registration,
> the uninitialized callback just leads to the "kernel NULL pointer
> dereference" issue during boot. Fix that by adding a dummy callback.
> 
> Looks like the release_device() callback is not mandatory to be
> implemented as IOMMU framework makes sure that callback is initialized
> before dereferencing.
> 
> Reported-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  drivers/xen/grant-dma-iommu.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

