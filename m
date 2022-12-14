Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD76564C3B9
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 07:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461741.719887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5L4q-0004QB-Lo; Wed, 14 Dec 2022 06:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461741.719887; Wed, 14 Dec 2022 06:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5L4q-0004Mk-IH; Wed, 14 Dec 2022 06:17:12 +0000
Received: by outflank-mailman (input) for mailman id 461741;
 Wed, 14 Dec 2022 06:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cERt=4M=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1p5L4p-0004Me-Dl
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 06:17:11 +0000
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0c2d7ff-7b76-11ed-91b6-6bf2151ebd3b;
 Wed, 14 Dec 2022 07:17:10 +0100 (CET)
Received: by mail-pf1-f177.google.com with SMTP id 65so3750380pfx.9
 for <xen-devel@lists.xenproject.org>; Tue, 13 Dec 2022 22:17:10 -0800 (PST)
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
X-Inumbo-ID: f0c2d7ff-7b76-11ed-91b6-6bf2151ebd3b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmekMIg/QvmFbkK7YRAJt5X/gXQonQdIXfHvmwtBKxc=;
        b=Xs1w+wXJKvkTmvDqaftknZ0oem1O3411XxXd7HBXKRBlajU9+mzbmrrF16i0oImV8J
         ETBKaP+gZQSQJD9zHzYZhng9hkc34EWZWdyP+NFWjGcroyqU8l226F1EcfPZ8hUC4VXx
         ydboNiFwC+D5hsuIvgFvI8V82DHJypFzvajxynF86E7piEI1HJaXrResLtKfhcsD1hFg
         h3t9+bL7fROPkVxRjg4SDn3m4HapxibadfXfVMbPxNkxY1TGG3cHVt5cOMQHeR8wG2Ol
         +5DwvvJNs3ov+YFwlVpK3RJui2fb2e61JVwTucXzHpNcPdF6M2qpDN+P0C1X3rxpb1tK
         T/Wg==
X-Gm-Message-State: ANoB5plFBTVoTvgmypOZ0qMsQliUdlyHR8fIO07qmtDwX2KOOwAunRSB
	HoPRpa6U2kA4u0Z7eXyPWPrqmDtf9so2/1G4M2JufuHm
X-Google-Smtp-Source: AA0mqf4hr5cR/nVCKfnyndvULLbPsWYp/Gimbqju9MiImnULjZaLr1fcAGDQeAx5fVI0MqP0vU0DYOL6y8SHicJpusI=
X-Received: by 2002:a63:5f56:0:b0:478:a85f:f7ba with SMTP id
 t83-20020a635f56000000b00478a85ff7bamr19550433pgb.180.1670998628611; Tue, 13
 Dec 2022 22:17:08 -0800 (PST)
MIME-Version: 1.0
References: <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
 <Yc3/ytwCHFtR1BLi@Air-de-Roger> <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
 <YdQgf2+E467kuTxK@Air-de-Roger> <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
 <YdWsPWqALWBRGtqW@Air-de-Roger> <CAKhsbWbvjEcA220TTHGB3PPbfLmdS_MuK5Mn3Xvrr+JL=dHK7w@mail.gmail.com>
 <YdxIbLYRYh4hvVGj@Air-de-Roger> <CAKhsbWYHhveuwTjaiSGKCqf41nSHZKdt7W_y0qp-x09Pce22SA@mail.gmail.com>
 <735adbe4-238b-bb7b-ba91-eb53759223aa@onlineschubla.de> <Y2OwzjfUnCFf2EDU@Air-de-Roger>
In-Reply-To: <Y2OwzjfUnCFf2EDU@Air-de-Roger>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Wed, 14 Dec 2022 14:16:56 +0800
Message-ID: <CAKhsbWZM3y7D=vQzng3GndQOzhx5RcDHWFVXdJZhCt-qz5CtwQ@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Paul Leiber <paul@onlineschubla.de>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 3, 2022 at 8:37 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
> > > > Roger.
> > > Hi Roger, any news for the upstream fix? I haven't heard any news sin=
ce...
> > > The reason I came back to this thread is that I totally forgot about
> > > this issue and upgraded to FreeNAS 13 only to rediscover this issue
> > > once again :-(
> > >
> > > Any chance the patch can apply on FreeBSD 13.1-RELEASE-p1 kernel?
> > >
> > > Thanks,
> > > G.R.
> > >
> >
> > Hi,
> >
> > I want to confirm that the patch in an official release would make quit=
e some people very happy. E.g. among OPNsense users, there are some who
> > suffer from the network issue [1]. FWIW, I compiled a kernel including =
Roger's patch, and it seems to be working without trouble in my OPNsense Do=
mU.
>
> Hello to both,
>
> Sorry, I completely dropped the ball on that patch, didn't even
> remember I had it pending :(.
>
> Will do a build test with it and commit later today, I don't think I
> will get any feedback, and it seems to improve the situation for your
> use-cases.

Hi Roger,
Just another query of the latest status. It'll be great if you can
share a link to the upstream commit.
I'm thinking of asking for a back-port of your fix to the FreeNAS
community, assuming it will take a long time to roll out otherwise.

Thanks,
G.R.

>
> Thanks, Roger.

