Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4A663286A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Nov 2022 16:42:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446730.702495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox8ve-0002yb-6F; Mon, 21 Nov 2022 15:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446730.702495; Mon, 21 Nov 2022 15:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ox8ve-0002v9-2k; Mon, 21 Nov 2022 15:41:50 +0000
Received: by outflank-mailman (input) for mailman id 446730;
 Mon, 21 Nov 2022 15:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+Qx=3V=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ox8vc-0002v3-0Q
 for xen-devel@lists.xenproject.org; Mon, 21 Nov 2022 15:41:48 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01d6f580-69b3-11ed-91b6-6bf2151ebd3b;
 Mon, 21 Nov 2022 16:41:47 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id me22so12870157ejb.8
 for <xen-devel@lists.xenproject.org>; Mon, 21 Nov 2022 07:41:47 -0800 (PST)
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
X-Inumbo-ID: 01d6f580-69b3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCMlnWg+myOhhKN0SxZMVCH4mYM2c7IIKgrkO+HeaWk=;
        b=Y2RO/yW642IDIaLYTAISydu25+lH0EHbLtHCbKmBKzdnSwR4XVBHiICXHVrhgghG8f
         qzDASEcxyUzmk5Az0j2opwEyoq+DlHwLteDgK1bUfPBVgMSxXn4RfCTuSaZ+0g67ZzS6
         7PC8oehAF2iilexEtWcuzzPq194e5+ZsSkStZnZwm0M8jP8p6EEstIbEcO8wND7uY+9Z
         KQLWrNK0wMSON02oH+DSHWAWUVQuPYVDYr/E5OIZ/ugRbDxYxsEg4PkrAMgjYGAZq8Xn
         uXHkfai7YE97+XY6rOJusPdqRdvo2H+eIq/y7P2MBDncBo4Xr02NdvLuzE2Yd+Uf2zLc
         Dr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCMlnWg+myOhhKN0SxZMVCH4mYM2c7IIKgrkO+HeaWk=;
        b=jR8BEtuLRb1DXuhdvBivB1NfT2OpBFXNHM6gjvkSrnBJU5CYV2hopwtiguY7je5RVp
         a1aKBsvonp9hCkQlJKG0hhVl/VHcYsFQBSFhVkxcujUtYjLT0dJW3zHSVOXZtb7y8oPS
         dFYF0RBlovLfC/o91rMEtnyzU/I8BPX7tQDZ1kGxaFMJ3ovnPJ4nTDtQ4DsiOQKHg5mS
         EQ+OXxfrTdq/DalvoYgdAzctv+NLyewbXT7WbrkQP/1tgkXK597DntIPXwrTYT+an9l6
         k8KTvfcqBuMfdDRcJ/HNmAEeIaMkpytWZ6mklSnH+QARFZBUkd3+UdDUqfGOJvoc3WQe
         aRAg==
X-Gm-Message-State: ANoB5pn1uKhiWVAHpsXOGjnkSlhLHkF2Ujcuto1xX0EduWkLswsZKaeZ
	l2cUIBzLx/v9cVIXcjbqOfz88WR433glTdPP39k=
X-Google-Smtp-Source: AA0mqf5uOHOc2RxD/WaWaZ1u85j1VVhGSa0IldqxagvBVMqoRS1IH+b3Ral1oqQSSUWehCElDYUPp1lqEbwMbm6ODRU=
X-Received: by 2002:a17:906:448d:b0:7ae:37aa:6bf with SMTP id
 y13-20020a170906448d00b007ae37aa06bfmr15892382ejo.481.1669045306558; Mon, 21
 Nov 2022 07:41:46 -0800 (PST)
MIME-Version: 1.0
References: <20221118154931.1928298-1-marmarek@invisiblethingslab.com>
 <CAKf6xpuCxftyQ+PKN_ffJ0onsSxcT8kVSwkM7Z10pfjqf0XFgA@mail.gmail.com>
 <Y3f9O0S8kVXZ+py+@mail-itl> <CAKf6xpvUcR=rta6SD7mw_pvgQJTxKjN5VHpC6x-zCAiaJ=pKfg@mail.gmail.com>
 <Y3kFYeml1CPL318u@mail-itl>
In-Reply-To: <Y3kFYeml1CPL318u@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 21 Nov 2022 10:41:34 -0500
Message-ID: <CAKf6xpts-u_JUtTGnzhxmRHZYVFnVMksTERZWS8EC+7BGsoViw@mail.gmail.com>
Subject: Re: [PATCH v3] xen-pciback: Consider INTx disabled when MSI/MSI-X is enabled
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jan Beulich <jbeulich@suse.com>, 
	"moderated list:XEN HYPERVISOR INTERFACE" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2022 at 11:33 AM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Sat, Nov 19, 2022 at 09:36:54AM -0500, Jason Andryuk wrote:
> > Hi, Marek,
> >
> > On Fri, Nov 18, 2022 at 4:46 PM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > On Fri, Nov 18, 2022 at 03:46:47PM -0500, Jason Andryuk wrote:
> > > > I was trying to test your xen-pciback v3 patch, and I am having
> > > > assignment fail consistently now.  It is actually failing to
> > > > quarantine to domIO in the first place, which matches the failure f=
rom
> > > > the other day (when I more carefully read through the logs).  It no=
w
> > > > consistently fails to quarantine on every boot unlike the other day
> > > > where it happened once.
> > >
> > > Does this include the very first assignment too, or only after domain
> > > reboot? If the latter, maybe some cleanup missed clearing MASKALL?
> >
> > It's the quarantine during dom0 boot that fails.  Later assignment
> > during VM boot fails.  I tried warm reboots and cold boots and it
> > happened both times.
> >
> > I also modified my initrd to halt in there and checked the config
> > space.  MASKALL wasn't set at that time.  I need to double check -
> > MASKALL may have been unset after dom0 booted in that case.
> >
> > I'll test more to figure when and how MASKALL is getting set.

I'm testing with a laptop without a battery.  It seems MASKALL remains
set when rebooting or when left plugged in.

From unplugged, a cold boot doesn't have MASKALL set and the network vm boo=
ts.

After that, rebooting the laptop leaves MASKALL set on the NIC when
the laptop reboots.   NIC assignment fails.

Shutdown and later boot while left plugged in keeps MASKALL set.  NIC
assignment fails.  I have only tested this scenario for short periods
of time, so I don't know if it would eventually clear after a longer
time.

Regards,
Jason

