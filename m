Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5507B9BB92E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 16:41:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830093.1245013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7zCO-000489-PL; Mon, 04 Nov 2024 15:41:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830093.1245013; Mon, 04 Nov 2024 15:41:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7zCO-00045n-Kx; Mon, 04 Nov 2024 15:41:00 +0000
Received: by outflank-mailman (input) for mailman id 830093;
 Mon, 04 Nov 2024 15:40:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g8Ql=R7=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t7zCM-00045O-78
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 15:40:58 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c4087e8-9ac3-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 16:40:52 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so2424338a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Nov 2024 07:40:52 -0800 (PST)
Received: from jmerino-thinkstation ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cebfd0e052sm3197425a12.58.2024.11.04.07.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 07:40:51 -0800 (PST)
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
X-Inumbo-ID: 2c4087e8-9ac3-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJjNDA4N2U4LTlhYzMtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzM0ODUyLjU0NDY5LCJzZW5kZXIiOiJqYXZpLm1lcmlub0BjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730734852; x=1731339652; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XIwiXCMpyKXrd6a4FFS1/3vcVVahj5MBaEMbmmDVRWU=;
        b=WX1LiTUxHmrdCQT/6jbkXh1eHSY56qu1y9mSvjCmj0mtUzmqCU/JqAKwnv6xe2e8FN
         rVpODlBEzjY/eYmZSM6X7X2n1q6kHZySLxmiXZGbwwJYQa9z12IIQYRnaNd5WQkcwfHb
         NuO8nmpL9063POtmLiYuaXFcD/ydkNaLgDuMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730734852; x=1731339652;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIwiXCMpyKXrd6a4FFS1/3vcVVahj5MBaEMbmmDVRWU=;
        b=ozB7dfCPtedl7AwzVBwLFKm2tHw2W9HYGxVMdZZKokAK2PFveWQ/2JpFqtu290naWD
         My/7xKQvnmPoaqi6ePydr31V45n9F/8vBjnJ+4aIqbj9cLtp8isg6Rnzsr0kjpMAMD8X
         bFl3O3tSIqwLSGZtTatDtscUV3GNao/o0qGO1cq4wZ0MefK/bngnuE9hOteggUbYYd4q
         91RG8u7zUYOwIfCVCxiEfogRwHaEY/I6rHosnJ81+eJnPrbaNHyhmE/fvHGlXrV509wU
         TDk4iCkKbS8Sm9z7QSZ5BKClzDhX6JMDlRz0SfdkrL0QiDXaNNs9F8A8jkgzNMcVclYW
         6fJg==
X-Gm-Message-State: AOJu0Yz4zBZyi0XZF+xxq70CtPOBcYqi1sNAnJIpNE+OoA4vOdz9C5da
	pCWUQhpc2xyHHq2kkcgfoU6CCvGO9TuRiQiR11wVV27sYPYN00qLLvvrxhKcJ/s=
X-Google-Smtp-Source: AGHT+IH6ll8ukRhJe/Pk2bv6eUQhJGSMwX2y5B+0w2MgAi1BUp8L/LXrTc9q//6oSANp5QBikMzzhw==
X-Received: by 2002:a05:6402:d09:b0:5c8:8d5e:19b0 with SMTP id 4fb4d7f45d1cf-5cbbfa74da6mr22818129a12.30.1730734851718;
        Mon, 04 Nov 2024 07:40:51 -0800 (PST)
Date: Mon, 4 Nov 2024 15:40:49 +0000
From: Javi Merino <javi.merino@cloud.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 1/6] CI: Refresh the Debian 12 x86_64 container
Message-ID: <2mwzs4e6x2ugoyapikfcoxnif6ffsumnewb44d2amtkknanz3j@5xtmufpalvx2>
References: <cover.1729760501.git.javi.merino@cloud.com>
 <288fcc10dbcbdab1c33ebfb95bedf2366ba64122.1729760501.git.javi.merino@cloud.com>
 <f8452748-067d-48d3-8ed3-3adc98566aa3@citrix.com>
 <opwqn4ewu3pvrmhoikglwzfzu7pwkiht7en4vtnmc755nxphvr@ilgcrk3bo2sa>
 <9cbbfe4c-ca22-42e4-94fc-873e177aa291@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9cbbfe4c-ca22-42e4-94fc-873e177aa291@citrix.com>

On Fri, Oct 25, 2024 at 03:46:35PM +0100, Andrew Cooper wrote:
> On 24/10/2024 4:10 pm, Javi Merino wrote:
> > On Thu, Oct 24, 2024 at 03:04:10PM +0100, Andrew Cooper wrote:
> >> On 24/10/2024 11:04 am, Javi Merino wrote:
> >>> +
> >>> +    apt-get update
> >> apt-get -y
> > apt-get update refreshes the package lists.  -y doesn't do anything
> > here.  It is needed for "apt-get install" below but not for
> > apt-get update.  It would be needed for "apt-get upgrade", but
> > we don't.
> 
> Hmm ok.  We might want to adjust the others to match then.

Ok, I will send a patch for the others.

> >>> +        expect
> >> Expect is only for the test phase, so should move later.
> > I put it here because ./configure checks for it.
> 
> It does?
> 
> That's not necessary/expected.

Ok, I'll move it. 

> >> Any decompressor which we don't find a suitable devel package gets the
> >> hypervisor form instead.
> >>
> >>> +        # To build the documentation
> >>> +        pandoc
> >> I know we had pandoc before, but I'd like to drop it.
> >>
> >> I'm intending to turn off docs generally, and do them separately in a
> >> single job that has *all* the docs build dependencies, not a misc subset
> >> that the build system happens not to complain at.
> > I had the "build the docs as its own job" in my TODO list and was
> > going to drop pandoc from this dockerfile then.  I can remove pandoc
> > in this commit if you prefer.
> 
> Dropping packages from existing containers is complicated, because the
> container (name) is shared with prior branches.  You have to wait until
> the oldest version of Xen which still uses the package leaves testing
> (== leaves security support, == 3y), or we've backported changes to all
> branches to drop the dependency.
> 
> The rename here gives us leeway because this change won't clobber any
> older branches in Xen, but I don't want to set the precedent.

Ok, this is another one to fix for the future.  Having dependencies in
the dockerfile in this branch because it is used in another branch is
a recipe for disaster.  CI for a branch should be defined on that
branch.

I'll drop pandoc.

> >> I'm on the fence about the Qemu build things.  It's off by default now,
> >> but the container never previously had meson/ninja so it wouldn't have
> >> built either.  Perhaps leave them out until someone complains.
> > I thought I had removed them.  Is there anything else that needs to
> > go?
> 
> These containers are both for CI and human use, so "what happens in CI"
> isn't the only consideration.
> 
> But, given that Qemu didn't build in the old container anyway, I'm not
> overly fussed about keeping it working in the new container.
> 
> So yes, please keep the deps removed.  We can always add them back in later.

Ok.

Cheers,
Javi

