Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8611D7C886A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 17:16:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616656.958814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJtm-00088M-8k; Fri, 13 Oct 2023 15:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616656.958814; Fri, 13 Oct 2023 15:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrJtm-00085N-5K; Fri, 13 Oct 2023 15:16:22 +0000
Received: by outflank-mailman (input) for mailman id 616656;
 Fri, 13 Oct 2023 15:16:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=36VQ=F3=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qrJtk-00084y-1j
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 15:16:20 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7509b59d-69db-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 17:16:17 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c50ec238aeso2250181fa.0
 for <xen-devel@lists.xenproject.org>; Fri, 13 Oct 2023 08:16:17 -0700 (PDT)
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
X-Inumbo-ID: 7509b59d-69db-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1697210177; x=1697814977; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjgHocVG2VLG8jjlLiA86XtRg3vIMvwgoUhrGW7Ocq0=;
        b=OGlTUQzZ1EfQpLYWhM0PyqEtgwsc85PLRAI4xu1pMa9x+Ajx/x6p8omX8kHMikPOEx
         2PCNxEkuDMZJ45HhbUbpMy36HPWp4essU0GsY7v6x2g2OaZ8dYMAwMKf4TGgvgw1h1O1
         7XrrFX/ARFv6yHNv6LQXbTXUZ40WVkheW6lX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697210177; x=1697814977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjgHocVG2VLG8jjlLiA86XtRg3vIMvwgoUhrGW7Ocq0=;
        b=PpBv7gfKm3evrGANLjHLsAAVpmohGZcP3FPKtxxtCSKKJI1PLHIuUktaeZOlE9dVEk
         ov9e29+db02tVFY/ySd64gzu9rZoPPU/1waY/1vQiu47rSAq/7MdLkXC1zqlwdj2zwCg
         vzVSm/M7CHhpwKIruFDvoXtbZtkX9cBg2xvg15h8lEkW07gTMtsvoxbvwhitc4lRDY2L
         eihjtunJ78ZMhEFunUe5SdhC8zg/Qd/LXtLleoOQP3w/7u0vWiIXCszVKDDNxRzFD5aN
         YIdUmigeffqFlEpSMgW30I5Dl2JuTzIl1pXiVoZWOVk+r80DpFXv9X0mAK273LAJuCUK
         /woA==
X-Gm-Message-State: AOJu0Yza/PC8jQL1E+Tiok0Z6lrg4TT8yurZdHfNjvd7+arBqA9VmuJV
	phdGTXE3n1Ve4UilMMft8xZHidyc6u3xNeeBslkobg==
X-Google-Smtp-Source: AGHT+IFG60R97vNpnEMDndRql6UdS2/547n24QJBM7U2ykiolHvrsk+RCjGk3uA4Ux/NvOPpbc4Kql7nYFSlBrRbtSY=
X-Received: by 2002:a2e:a40f:0:b0:2bf:fab9:db28 with SMTP id
 p15-20020a2ea40f000000b002bffab9db28mr22914529ljn.6.1697210177237; Fri, 13
 Oct 2023 08:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2309271603590.1403502@ubuntu-linux-20-04-desktop>
 <a31ce6cb-6234-5e7f-5cd4-ed190f029811@citrix.com> <alpine.DEB.2.22.394.2309271658500.1403502@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZbeUFrfAUJShooJFJ+d89f4xdXfJJ9HoJKRh4UStkTFQ@mail.gmail.com>
 <alpine.DEB.2.22.394.2310121535580.3431292@ubuntu-linux-20-04-desktop>
 <CA+zSX=Y5dMVFM6dVNgBRHxKc0C1e5WGgweQ0FaXXCfAFGH1aPA@mail.gmail.com>
 <a93839b8-932a-4634-9549-081df950afb2@xen.org> <5390a035-f0e8-498c-b059-b9eca3a5c6ac@suse.com>
 <e76d5b41-5057-4ebe-affd-ae1a158071a1@xen.org> <d75c138f-df88-4e7e-9084-533aafdcd982@suse.com>
In-Reply-To: <d75c138f-df88-4e7e-9084-533aafdcd982@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 13 Oct 2023 16:16:05 +0100
Message-ID: <CA+zSX=bLbYhL7KRKpqfwoO=CRtEkT1bKMLo0Fu5nna0w_==NRA@mail.gmail.com>
Subject: Re: Xen 4.18 release: Reminder about code freeze
To: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Henry Wang <Henry.Wang@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@citrix.com>, 
	"community.manager@xenproject.org" <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 13, 2023 at 4:04=E2=80=AFPM Juergen Gross <jgross@suse.com> wro=
te:
> >>> Technically, dom0 has exactly the same problem as dom0less domains it=
 boots
> >>> before Xenstored is running and therefore it may need to know when it=
 is
> >>> ready to receive commands.
> >>
> >> Umm, no, not really.
> >>
> >> The main difference between dom0 and a dom0less domU is, that xenstore=
d
> >> introduces dom0 by itself via a call of dom0_init(), while the dom0les=
s
> >> domUs get introduced by Xen tools in case a dom0 is coming up later. A=
nd
> >> that XS_INTRODUCE will clobber any ring page contents, while a call of
> >> dom0_init() won't do that.
> >>
> >> Dom0 (especially the kernel) is fine to start filling the ring page wi=
th
> >> requests even before xenstored is running. It just shouldn't expect to
> >> receive any responses right away.
> > I am not sure what you mean by fine. You will see hang notifications if
> > Xenstored is not started in time. Isn't why we decided to go with a dif=
ferent
> > way for dom0less?
>
> The main difference is that dom0 tells xenstored the connection parameter=
s for
> itself, so dom0 _knows_ that the ring page is setup correctly when xensto=
red
> starts looking at it (it is dom0 which needs to do the ring page init).
>
> A dom0less domU doesn't have that negotiation with xenstored, as xenstore=
d just
> uses the pre-defined grant for looking at the ring page. For the domU the=
re is
> no way to tell that xenstored has initialized the ring page (it is not th=
e domU
> to do the initialization, as the XS_INTRODUCE might be sent before the do=
mU
> even starts running), other than the "connected" indicator in the page it=
self.

Any thoughts on my patch?  From your description, it sounds like maybe
it should be in the right direction, although it's currently missing
memory barriers.

 -George

