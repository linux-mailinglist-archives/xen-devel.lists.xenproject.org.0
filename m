Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EA52D609D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 16:56:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49498.87551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOJA-0006rm-61; Thu, 10 Dec 2020 15:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49498.87551; Thu, 10 Dec 2020 15:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knOJA-0006rN-2Q; Thu, 10 Dec 2020 15:56:44 +0000
Received: by outflank-mailman (input) for mailman id 49498;
 Thu, 10 Dec 2020 15:56:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wMS7=FO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1knOJ8-0006rG-7b
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 15:56:42 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 97e56119-6fb4-4c32-8946-96529e4560ad;
 Thu, 10 Dec 2020 15:56:41 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y23so5843888wmi.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Dec 2020 07:56:41 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q143sm10724375wme.28.2020.12.10.07.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 07:56:40 -0800 (PST)
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
X-Inumbo-ID: 97e56119-6fb4-4c32-8946-96529e4560ad
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CRecanxbOToTOHGblZx5e7biwudfKmBvFc15XWLYY80=;
        b=e5nQXa3xjaj5tFDBJRfnVl6UyDgPmXBC7TEcg8t7tbob3XQ7E63i4yDB9vUqRBDdSC
         3eM/dUw8/4vFAU6oq/Afc9KvO8pD+1KY+DCFVQB1ZW2ITFRgo+Jy36Dp5lrWcyEB9r0Z
         Fc652aO7H20KMfh13v9fAB4+3Ro5ZHbTC52bLqk++/qQvn36bIzGAGK/QnXK0dOSxxZx
         GfvJLIJBybQJDll5ZiWacJdNvO6a0Yrql2jN90umF3El5WgXzAq3zkit8QkPw18685WM
         OTZw4XuqPPuwkTbikKj8vUGu9BeslAd2KjIny6G95bwPnzCQOOdNOCrlDMycG599tMMl
         r9Sg==
X-Gm-Message-State: AOAM532m/pPO30gMsDQZmAul6u80DWz96sAH+pD3uSUZo7VId+nOpv5V
	oFYdRCO7e7/gq4FfKyW6qCM=
X-Google-Smtp-Source: ABdhPJwfl2y6tpNzmSJ22RXmEs18D6WlT1Gp+0DvFxRI6nVQQQxF1/+JtL/K1EcbwxbR6cN3hUkNpA==
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr9103445wmi.143.1607615800613;
        Thu, 10 Dec 2020 07:56:40 -0800 (PST)
Date: Thu, 10 Dec 2020 15:56:38 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
	famzheng@amazon.com, cardoe@cardoe.com, Bertrand.Marquis@arm.com,
	julien@xen.org, andrew.cooper3@citrix.com
Subject: Re: [PATCH v6 00/25] xl / libxl: named PCI pass-through devices
Message-ID: <20201210155638.mxjx4zmjqmcpk7z3@liuwe-devbox-debian-v2>
References: <160746448732.12203.10647684023172140005@600e7e483b3a>
 <alpine.DEB.2.21.2012081702420.20986@sstabellini-ThinkPad-T480s>
 <20201209161433.d7xpx5zwtikd3fmk@liuwe-devbox-debian-v2>
 <alpine.DEB.2.21.2012091046400.20986@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2012091839430.20986@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2012091839430.20986@sstabellini-ThinkPad-T480s>
User-Agent: NeoMutt/20180716

On Wed, Dec 09, 2020 at 06:41:03PM -0800, Stefano Stabellini wrote:
> On Wed, 9 Dec 2020, Stefano Stabellini wrote:
> > On Wed, 9 Dec 2020, Wei Liu wrote:
> > > On Tue, Dec 08, 2020 at 05:02:50PM -0800, Stefano Stabellini wrote:
> > > > The pipeline failed because the "fedora-gcc-debug" build failed with a
> > > > timeout: 
> > > > 
> > > > ERROR: Job failed: execution took longer than 1h0m0s seconds
> > > > 
> > > > given that all the other jobs passed (including the other Fedora job), I
> > > > take this failed because the gitlab-ci x86 runners were overloaded?
> > > > 
> > > 
> > > The CI system is configured to auto-scale as the number of jobs grows.
> > > The limit is set to 10 (VMs) at the moment.
> > > 
> > > https://gitlab.com/xen-project/xen-gitlab-ci/-/commit/832bfd72ea3a227283bf3df88b418a9aae95a5a4
> > > 
> > > I haven't looked at the log, but the number of build jobs looks rather
> > > larger than when we get started. Maybe the limit of 10 is not good
> > > enough?
> > 
> > Interesting! That's only for the x86 runners, not the ARM runners (we
> > only have 1 ARM64 runner), is that right?
> > 
> > If we could increase the number of VMs for x86 I think that would be
> > helpful because we have very many x86 jobs.
> 
> I don't know what is going on but at the moment there seems to be only
> one x86 build active
> (https://gitlab.com/xen-project/patchew/xen/-/pipelines/227280736).
> Should there be at least 3 of them?

Not sure what you meant here. That pipeline is green.

It may take some time for the CI to scale up if it is "cold". By default
there is only 1 standby runner to reduce cost.

Wei.

