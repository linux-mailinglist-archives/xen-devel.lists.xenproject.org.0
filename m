Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF3121890E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 15:31:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtA9n-0008Tm-3G; Wed, 08 Jul 2020 13:30:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sx7s=AT=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1jtA9l-0008Th-TF
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 13:30:37 +0000
X-Inumbo-ID: 355f1322-c11f-11ea-bb8b-bc764e2007e4
Received: from mail-io1-xd36.google.com (unknown [2607:f8b0:4864:20::d36])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 355f1322-c11f-11ea-bb8b-bc764e2007e4;
 Wed, 08 Jul 2020 13:30:37 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id q8so46970721iow.7
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2020 06:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1qooX1rDuH5ISVhDXxteHHMQjGTfb4o9k5ecOHl4zFE=;
 b=ZMXH1PRlMtMlNvTzH2+g584oOYSzwektF8zD0v3vYgal2ybjsDL1+T7tQ8XH0xioyd
 NbMV90qsjd4BLjJeasRjRP4apfvwdx2/E58Os+sG4LsguVvEBJOi2EgYd0hhdD/KKFq0
 5howubC8KnFkivmJRHHUjdryXgAfmR+/dnNtOSXZKQfiGnz3cRAvsul+Xrp9/btarFGP
 dyC767EAnOCYCBtqxXPw2SjhGKvQIytyjt8QRuvhQB4tLqkKdvSgw6WhrbOoBf664Rn5
 WTq5IzNI9bm3/XECa8fMkhauYBWMfaQE2xPZUfMyoiA2xCI2qoxC/CwsmcYP4qo9OjoA
 2kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1qooX1rDuH5ISVhDXxteHHMQjGTfb4o9k5ecOHl4zFE=;
 b=WJ577WWztevn7DWLYC06EO5VY1ajN2PavIQa2DkicQMuvdGcGc4slz+lbuoFLcpYmo
 BxRzih/sCZ41uRB6SLp/n8LTzWn1xOC06mEmKUa5nXmMC9rUMU3rh+1ws71wL+IlcAvS
 IIWw7f4oRLC0TOe8awrc4qevSBXL6+WK3CCbeRIm1jEn6MADtLzXJg5awzOnIVLeqbzO
 nw4suZM4i2WpcGT7yJVpd8715pKGaakShy4lo3LF3iC7Ikke1FVt9mzsWcKf5Xs9uRfg
 GONg77xMqbKfcLOVf5vzfNfycifj86OZUw+uWYxCnO9klGQQk/pbW0WkuDx8W9TvH/BU
 An7A==
X-Gm-Message-State: AOAM533s6jSCtQ2fontsGxLHt9dEtiACRazwk6zBsEc/Xts9XFC0GvQj
 oGVzl7xu9FItmgTT0smZp4MtlNXQRgK8wc7MHBc=
X-Google-Smtp-Source: ABdhPJw2bFr/j9pXgEUhk/KNCENpWt1tVaZINsxgi9B0uU2285XUZUK6MIhg5/1C7yF4hi0YcfFQJ8Wz42IC1lys7hQ=
X-Received: by 2002:a6b:8dd1:: with SMTP id
 p200mr37059144iod.118.1594215036696; 
 Wed, 08 Jul 2020 06:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmqyKPFMGtDLzc2RiEZR6KCcbPL6wumm+V5SNdxNf7fAowcBQ@mail.gmail.com>
 <20200708131150.GD7191@Air-de-Roger>
 <CAKmqyKOhW=YJ-WW28v-Ddt5yDDfVfCJKwijfsXo0oWAcvfrg2w@mail.gmail.com>
 <6CE81465-9F87-486F-A3CC-08857C9C4332@citrix.com>
In-Reply-To: <6CE81465-9F87-486F-A3CC-08857C9C4332@citrix.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 8 Jul 2020 06:20:47 -0700
Message-ID: <CAKmqyKP5j7tQLZ8ka=CoN93X87a1LQhnMTxSeYfFo0jviMzP-w@mail.gmail.com>
Subject: Re: Xen and RISC-V Design Session
To: George Dunlap <George.Dunlap@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 8, 2020 at 6:21 AM George Dunlap <George.Dunlap@citrix.com> wro=
te:
>
>
>
> > On Jul 8, 2020, at 2:11 PM, Alistair Francis <alistair23@gmail.com> wro=
te:
> >
> > On Wed, Jul 8, 2020 at 6:11 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.c=
om> wrote:
> >>
> >> Adding George in case he can help with the session placement.
> >>
> >> On Wed, Jul 08, 2020 at 05:55:06AM -0700, Alistair Francis wrote:
> >>> Hey,
> >>>
> >>> I'm not sure if there is a better way to suggest a design session but
> >>> can we have a Xen on RISC-V discussion tomorrow at the Xen Design
> >>> Summit?
> >>
> >> I think that would be interesting!
> >>
> >>> Preferably in a later slot as the early slots are very early for me.
> >>
> >> You have to register it at: https://design-sessions.xenproject.org/
> >
> > Thanks!
> >
> > I don't have a verification code unfortunately. Is it possible to get o=
ne?
>
> VirtualPanda2020

Thanks! Just submitted the proposal.

It would be really great to have Bobby attend (on CC) as he has been
working on it. I'm not sure what timezone he is in though.

Alistair

>
> Cheers,
>  -George

