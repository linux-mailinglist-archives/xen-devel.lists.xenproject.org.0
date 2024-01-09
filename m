Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F7F828774
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 14:54:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664629.1034704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNCY4-0003g5-Jb; Tue, 09 Jan 2024 13:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664629.1034704; Tue, 09 Jan 2024 13:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNCY4-0003d0-G4; Tue, 09 Jan 2024 13:53:44 +0000
Received: by outflank-mailman (input) for mailman id 664629;
 Tue, 09 Jan 2024 13:53:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OpKn=IT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rNCY2-0003ct-GL
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 13:53:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e9a8417-aef6-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 14:53:40 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a277339dcf4so323798266b.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 05:53:40 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 hg7-20020a170906f34700b00a28a66028bcsm1071568ejb.91.2024.01.09.05.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 05:53:39 -0800 (PST)
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
X-Inumbo-ID: 7e9a8417-aef6-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1704808420; x=1705413220; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K+GqDfLNHcBH1YdF2mm3IM7g6zY7517CQfnDoIDysb0=;
        b=jLp1TnblW57GzwkD3dftvXN4R7KXhgw6i+K50d5JZwub5jDzbJgAw0xGtXhmd2lyLW
         gIX8TVJAzWFc4nb+JzuXWYzcFAQ9Zz6yn3LagXSQQnqr4FEcdl8vUAoEaFakE5XGjPVl
         jZdDOaVxptVzQ9+0cxNtkpdjajCPbm+ddWCSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704808420; x=1705413220;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+GqDfLNHcBH1YdF2mm3IM7g6zY7517CQfnDoIDysb0=;
        b=m+nS5cAZjbshu+gD26e5G4N3PtM+4HUoMviNYjY6StGJKyJjl8H+yPp3A0c0JtJMQs
         WpQKWNX8NR6NPFO3thgNWvHcvI4ADzG8aVjqkfX8Y37zr2WryUN0tt1kaAEm7xCjo8qW
         yoNGC8tmeGRtU9e6/0sPcvZZ1UtO1OATzaBi6khu6nIJrUiCtf5wsj5vyQefgL60jnUt
         qRQLc9J/j4QQlvWESlnygpHGxHa8I6fSU4SVaonWjHrwnn9DSH+03kvJ00xGijjx2RLT
         mwO57/BA9gDq4/tcOuSMkks4cxg995xQQScAD0J8+1rBIG9U1QRTYT/Yc1ANFoYGUYYC
         lDuA==
X-Gm-Message-State: AOJu0Yylu/vsAQyZ5E8euhxnQ+LxFGBH/Qx85PtCXk5BWT3w2gHP0Wky
	tCvHRn/Ao++yT2yqrW5vbHood4aWduoYMA==
X-Google-Smtp-Source: AGHT+IFg4dJqQYmjG1BGMgGVuP2nBX48fxvb8oBEcUMerm+iT5zKk+/Yi1Jznd1qh1AVJ17A0GParw==
X-Received: by 2002:a17:907:6d17:b0:a12:78b5:3d81 with SMTP id sa23-20020a1709076d1700b00a1278b53d81mr696755ejc.1.1704808420046;
        Tue, 09 Jan 2024 05:53:40 -0800 (PST)
Date: Tue, 9 Jan 2024 14:53:38 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Niklas Hallqvist <niklas@appli.se>
Cc: "G.R." <firemeteor@users.sourceforge.net>,
	Paul Leiber <paul@onlineschubla.de>, xen-devel@lists.xenproject.org
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <ZZ1P4lSL_jPztGJ3@macbook>
References: <YdQgf2+E467kuTxK@Air-de-Roger>
 <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
 <YdWsPWqALWBRGtqW@Air-de-Roger>
 <CAKhsbWbvjEcA220TTHGB3PPbfLmdS_MuK5Mn3Xvrr+JL=dHK7w@mail.gmail.com>
 <YdxIbLYRYh4hvVGj@Air-de-Roger>
 <CAKhsbWYHhveuwTjaiSGKCqf41nSHZKdt7W_y0qp-x09Pce22SA@mail.gmail.com>
 <735adbe4-238b-bb7b-ba91-eb53759223aa@onlineschubla.de>
 <Y2OwzjfUnCFf2EDU@Air-de-Roger>
 <CAKhsbWZM3y7D=vQzng3GndQOzhx5RcDHWFVXdJZhCt-qz5CtwQ@mail.gmail.com>
 <DCF59D19-59C2-43E9-9F25-7F64FFF691F7@appli.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DCF59D19-59C2-43E9-9F25-7F64FFF691F7@appli.se>

On Tue, Jan 09, 2024 at 12:13:04PM +0100, Niklas Hallqvist wrote:
> > On 14 Dec 2022, at 07:16, G.R. <firemeteor@users.sourceforge.net> wrote:
> > 
> > On Thu, Nov 3, 2022 at 8:37 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >>>>> Roger.
> >>>> Hi Roger, any news for the upstream fix? I haven't heard any news since...
> >>>> The reason I came back to this thread is that I totally forgot about
> >>>> this issue and upgraded to FreeNAS 13 only to rediscover this issue
> >>>> once again :-(
> >>>> 
> >>>> Any chance the patch can apply on FreeBSD 13.1-RELEASE-p1 kernel?
> >>>> 
> >>>> Thanks,
> >>>> G.R.
> >>>> 
> >>> 
> >>> Hi,
> >>> 
> >>> I want to confirm that the patch in an official release would make quite some people very happy. E.g. among OPNsense users, there are some who
> >>> suffer from the network issue [1]. FWIW, I compiled a kernel including Roger's patch, and it seems to be working without trouble in my OPNsense DomU.
> >> 
> >> Hello to both,
> >> 
> >> Sorry, I completely dropped the ball on that patch, didn't even
> >> remember I had it pending :(.
> >> 
> >> Will do a build test with it and commit later today, I don't think I
> >> will get any feedback, and it seems to improve the situation for your
> >> use-cases.
> > 
> > Hi Roger,
> > Just another query of the latest status. It'll be great if you can
> > share a link to the upstream commit.
> > I'm thinking of asking for a back-port of your fix to the FreeNAS
> > community, assuming it will take a long time to roll out otherwise.
> > 
> > Thanks,
> > G.R.
> > 
> >> 
> >> Thanks, Roger.
> > 
> > 
> 
> Hi everyone!
> 
> So did anything ever happen on this?  I find myself in the same situation with TrueNAS core 13, and can’t see any signs of changes in the FreeBSD 13 branches.

Hello,

I don't think the change is suitable to backport, it's IMO too
intrusive and risky.  It was committed late 2022, and it's in 14.0:

commit dabb3db7a817f003af3f89c965ba369c67fc4910
Author: Roger Pau Monné <royger@FreeBSD.org>
Date:   Thu Nov 3 13:29:22 2022 +0100

    xen/netfront: deal with mbuf data crossing a page boundary

    There's been a report recently of mbufs with data that crosses a page
    boundary. It seems those mbufs are generated by the iSCSI target
    system:

    https://lists.xenproject.org/archives/html/xen-devel/2021-12/msg01581.html

    In order to handle those mbufs correctly on netfront use the bus_dma
    interface and explicitly request that segments must not cross a page
    boundary. No other requirements are necessary, so it's expected that
    bus_dma won't need to bounce the data and hence it shouldn't
    introduce a too big performance penalty.

    Using bus_dma requires some changes to netfront, mainly in order to
    accommodate for the fact that now ring slots no longer have a 1:1
    match with mbufs, as a single mbuf can use two ring slots if the data
    buffer crosses a page boundary. Store the first packet of the mbuf
    chain in every ring slot that's used, and use a mbuf tag in order to
    store the bus_dma related structures and a refcount to keep track of
    the pending slots before the mbuf chain can be freed.

    Reported by: G.R.
    Tested by: G.R.
    MFC: 1 week
    Differential revision: https://reviews.freebsd.org/D33876

TrueNAS/OOPNsense might consider picking it up themselves.

Thanks, Roger.

