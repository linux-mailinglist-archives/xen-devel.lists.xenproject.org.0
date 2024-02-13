Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38212852BD9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 10:02:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679807.1057502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZofy-0006pJ-D7; Tue, 13 Feb 2024 09:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679807.1057502; Tue, 13 Feb 2024 09:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZofy-0006mj-9u; Tue, 13 Feb 2024 09:02:02 +0000
Received: by outflank-mailman (input) for mailman id 679807;
 Tue, 13 Feb 2024 09:02:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iJZn=JW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rZofw-0006mZ-Gp
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 09:02:00 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8af675a1-ca4e-11ee-98f5-efadbce2ee36;
 Tue, 13 Feb 2024 10:01:58 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so3409517f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Feb 2024 01:01:58 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 t24-20020adfa2d8000000b0033b86b38611sm3673211wra.10.2024.02.13.01.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 01:01:57 -0800 (PST)
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
X-Inumbo-ID: 8af675a1-ca4e-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707814918; x=1708419718; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=feKTui5WrC3pt5o+89E72lmj+xsEAgwKtWT8NHN4qDc=;
        b=DfpNI9wiV3SNKE+gqRVIjlgIzNXSbEvzXhjaldezvymVmgELzpuNVh5cv/wfr11xbL
         NrSPI9rDB2I+TDhDNivg+3cE/AwHoTsV1bnkPgBJmj1Jz+XcGO0EwUjfxgp8HcYcL4BZ
         /vdzjnzX1pJB1MfuTSwtFnKF34UXFTVcaEQ7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707814918; x=1708419718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=feKTui5WrC3pt5o+89E72lmj+xsEAgwKtWT8NHN4qDc=;
        b=EHmgZ0XZ3RGCJ7eAbDqG7o7dTP/viXmwsXfG52BR+FX7Ri2POOW6+0GOAPt6Hjq6Mn
         a4CmvL9wday1UQuTzxOdjeurHgAQv8NDGQ4OBZsFSutpsqybLjue6V/yTzXY7NqtXiS7
         LEN1FtC45bFnu09eclIGTxv86oyiV+QgDGhp3rh0sOFade4YnUz/++1O6xwAsb/MKoPD
         Rg+y16fRONveVi2mMjF/BersLgTrabLrswvttldY5JD1F1L+3B548LMa02cKUKj2NyIq
         7CH7gWO6lq2dSrx0j/3oF31OKxqxTtSLBnRRohLL5GiJu5mLl5R49oAW8mFieu/lXRME
         jUSA==
X-Forwarded-Encrypted: i=1; AJvYcCXzbRBf3BMtOODrvB9rSTWwklOTyTSNWzZfnOIdpCTHnRmcG0MG/yz8CvJrYehiw8/jPmWfbojORE4/YYRZKxyIXRkAUtc5RDP+yyVbzY4=
X-Gm-Message-State: AOJu0YwX2BpHozTletIyVDzXkr8rV6215ZoXGlqiBqi3qpiO4SficnZ1
	aAAajrBVoql8wZzlvQGu96NSRN2RP2QWnTfko3ZgNvrtxHHD8x8Nhlf8BN0i210=
X-Google-Smtp-Source: AGHT+IGYTpcKocUJWvd762xsqzOhlx6dFzHcSshIQEl/AgbS4YsEyP0xWoyCW2c70I+C559clI1hsw==
X-Received: by 2002:adf:f805:0:b0:33b:87a0:3af with SMTP id s5-20020adff805000000b0033b87a003afmr3258678wrp.67.1707814917823;
        Tue, 13 Feb 2024 01:01:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXVShLoI1tAGaUPMm+bvlLMkUiMlM9Q+xa9MgzvqBByO0OJP8h2lJt+vd63o87NfJ0jkYvq3XvFZtQnbYK8bqiFsaJouUHuhsNYDtLneWQhsMOA9riw+KhikJnyznqlHFSOS/IEwUpFHJiCe74IzFCyFfFbOsvlZFleKWvNXTskB16/xRour18MO/nFKGg9jPc8NLBUTBQhnBOxnd49qphEn8H6e5QPsLfa3HKfFGVrDxJk3e3pcGYU1HnNVLaQaGN15nwXCIFrebD7TkqVgkIO++Onl5uFveliUO7dkGlbq6f3kPGOjDs1je3og68jo798jxwYm40uh6X7hQyAcsX+QGXCSQd7fwII6iI8pva5u61ELpJjVTWi7vsDj/qmpp813ljqUQ6VAUGdDLfZtYnKbg==
Date: Tue, 13 Feb 2024 10:01:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	xen-devel@lists.xenproject.org,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Paul Durrant <paul@xen.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Subject: Re: [PATCH v13 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Message-ID: <ZcswBFHtINB1XMAS@macbook>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
 <Zcsp15Aqve11Icjb@macbook>
 <ec5d0c39-1559-4f10-9574-98cfa0542993@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec5d0c39-1559-4f10-9574-98cfa0542993@suse.com>

On Tue, Feb 13, 2024 at 09:44:58AM +0100, Jan Beulich wrote:
> On 13.02.2024 09:35, Roger Pau Monné wrote:
> > On Fri, Feb 02, 2024 at 04:33:05PM -0500, Stewart Hildebrand wrote:
> >> --- a/xen/include/xen/sched.h
> >> +++ b/xen/include/xen/sched.h
> >> @@ -462,7 +462,8 @@ struct domain
> >>  #ifdef CONFIG_HAS_PCI
> >>      struct list_head pdev_list;
> >>      /*
> >> -     * pci_lock protects access to pdev_list.
> >> +     * pci_lock protects access to pdev_list. pci_lock also protects pdev->vpci
> >> +     * structure from being removed.
> >>       *
> >>       * Any user *reading* from pdev_list, or from devices stored in pdev_list,
> >>       * should hold either pcidevs_lock() or pci_lock in read mode. Optionally,
> >> @@ -628,6 +629,18 @@ struct domain
> >>      unsigned int cdf;
> >>  };
> >>  
> >> +/*
> >> + * Check for use in ASSERTs to ensure that:
> >> + *   1. we can *read* d->pdev_list
> >> + *   2. pdevs (belonging to this domain) do not go away
> >> + *   3. pdevs (belonging to this domain) do not get assigned to other domains
> > 
> > I think you can just state that this check ensures there will be no
> > changes to the entries in d->pdev_list, but not the contents of each
> > entry.  No changes to d->pdev_list already ensures not devices can be
> > deassigned or removed from the system, and obviously makes the list
> > safe to iterate against.
> > 
> > I would also drop the explicitly mention this is intended for ASSERT
> > usage: there's nothing specific in the code that prevents it from
> > being used in other places (albeit I think that's unlikely).
> 
> But pcidevs_locked(), resolving to spin_is_locked(), isn't reliable. The
> assertion usage is best-effort only, without a guarantee that all wrong
> uses would be caught.

Do we want to protect this with !NDEBUG guards then?

> >> + * This check is not suitable for protecting other state or critical regions.
> >> + */
> >> +#define pdev_list_is_read_locked(d) ({                           \
> > 
> > I would be tempted to drop at least the '_read_' part from the name,
> > the name is getting a bit too long for my taste.
> 
> While I agree with the long-ish aspect, I'm afraid the "read" part is
> crucial. As a result I see no room for shortening.

OK, if you think that's crucial then I'm not going to argue.

> >> +        struct domain *d_ = (d);                                 \
> > 
> > Why do you need this local domain variable?  Can't you use the d
> > parameter directly?
> 
> It would be evaluated then somewhere between 0 and 2 times.

It's ASSERT code only, so I don't see that as an issue.  Otherwise d_
needs to be made const.

Thanks, Roger.

