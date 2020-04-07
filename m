Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8691A0F5B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Apr 2020 16:35:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLpK0-0001Iv-06; Tue, 07 Apr 2020 14:35:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xgsb=5X=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1jLpJy-0001Iq-Ev
 for xen-devel@lists.xen.org; Tue, 07 Apr 2020 14:35:22 +0000
X-Inumbo-ID: 021ed090-78dd-11ea-b4f4-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 021ed090-78dd-11ea-b4f4-bc764e2007e4;
 Tue, 07 Apr 2020 14:35:21 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id r26so2094164wmh.0
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2020 07:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6AkO9je8fw7ePQbnFn4N6Q9r4E8QTnJnaiQDp7fp6hA=;
 b=gKQQtrfH6ylO+pHx4qNk7WcwbZDQdMxviCT5l8BWq/H/auzsF7BzuaHEjvBSYuLGi3
 G+fydbxtqnwRXKLdUasoLDrfIQBrfw0bc/tN+Mhwav8z9hvoTkauP4XG852lym9i+gIO
 rfbnu5dkqw1YMPOUets6Y0V9R0vtjSuhWGepFCHtAEIYTzvup7sOmIwRvNXqfOicRREA
 4oER8TRYjTr3CdoYS36CkzzVJ33AAEMG/T+coYLhCt1xg4Ucautz9whru8K0tvOw3Ia1
 p/IVjn44hs/UyJ+azj7/RUBbnRRXYS3fanBH7oczx2t74x+9g3jTOOiSI2wuRc11SdKl
 GX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6AkO9je8fw7ePQbnFn4N6Q9r4E8QTnJnaiQDp7fp6hA=;
 b=d8rVHSGS6o9RWIwUDGeE2i8JCOU5+GYBc50LcMUAqJu/rRHlG0Mu66dmmk2AhGuou0
 p24T0fdKvvqpoztGnKhX3QSuIdY5E+OdoHjvjOVDjwFESNBr8qzduZhb22LmvGi922Wi
 IKFjrHrbYz6TGDx39cO+yRzfEXYRungvCoIF63M0IAL7DKjeysFqEPudwXTUKtcOjWTT
 9DCMuCm2HwMucda1lTkIcCz0UAQCRfmXYOl23Y9Dl+rvTBDMqL7g2ZN0aTVpJ5tR2exu
 j3fdgvKZ7QM2N20HocjQPHx0RxK4ZPO5yxBDCsYHk9OtpSJi9jjLxwGOYdJBA5QpSb6v
 0H6g==
X-Gm-Message-State: AGi0PuZrQA3gKFyhDnyMr/xKB3bN1krVaparpaW0ShSSsOCypqOBKoF2
 I5pjVD4xuksZUWhD3UcUZv+v+juNmyUbTb+GT74=
X-Google-Smtp-Source: APiQypJz2AIqNdXSnIjgMDjfnid3CO5g20TDr+7LoWlouyrQ5009MtKqlR8J2kp7axBV6WbusQb9KaQVMvTrP6Lqm8I=
X-Received: by 2002:a7b:c842:: with SMTP id c2mr2839038wml.154.1586270120284; 
 Tue, 07 Apr 2020 07:35:20 -0700 (PDT)
MIME-Version: 1.0
References: <CABB6KG-UCdPTa3yM57JB13G=Yebe8chuQKvKkNbtoGRSZ9Ypsw@mail.gmail.com>
 <a8c56ab0-bc51-fa1c-c63f-cb9ada8a1823@citrix.com>
 <CABfawhn_hw=o5j+G9VfqPK6opytqt=q2-cz4GjNgCTA5zBvNrA@mail.gmail.com>
 <6bb7eb58-01c6-00e4-672e-83d5fcb87ea0@citrix.com>
 <CABfawh=6z-pxgrj1M3JbG-9H=iR78rTwt8+MUf_6-Sd5kqyhdA@mail.gmail.com>
 <001701d60cb2$2e1b2050$8a5160f0$@xen.org>
In-Reply-To: <001701d60cb2$2e1b2050$8a5160f0$@xen.org>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 7 Apr 2020 08:34:43 -0600
Message-ID: <CABfawh=ViONrSak4L-nW7LigHvuAsY2-6xoWfzx65tbn0mFo=w@mail.gmail.com>
Subject: Re: Live migration and PV device handling
To: Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anastassios Nanos <anastassios.nanos@sunlight.io>,
 Xen-devel <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 7, 2020 at 1:57 AM Paul Durrant <xadimgnik@gmail.com> wrote:
>
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of T=
amas K Lengyel
> > Sent: 06 April 2020 18:31
> > To: Andrew Cooper <andrew.cooper3@citrix.com>
> > Cc: Xen-devel <xen-devel@lists.xen.org>; Anastassios Nanos <anastassios=
.nanos@sunlight.io>
> > Subject: Re: Live migration and PV device handling
> >
> > On Mon, Apr 6, 2020 at 11:24 AM Andrew Cooper <andrew.cooper3@citrix.co=
m> wrote:
> > >
> > > On 06/04/2020 18:16, Tamas K Lengyel wrote:
> > > > On Fri, Apr 3, 2020 at 6:44 AM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
> > > >> On 03/04/2020 13:32, Anastassios Nanos wrote:
> > > >>> Hi all,
> > > >>>
> > > >>> I am trying to understand how live-migration happens in xen. I am
> > > >>> looking in the HVM guest case and I have dug into the relevant pa=
rts
> > > >>> of the toolstack and the hypervisor regarding memory, vCPU contex=
t
> > > >>> etc.
> > > >>>
> > > >>> In particular, I am interested in how PV device migration happens=
. I
> > > >>> assume that the guest is not aware of any suspend/resume operatio=
ns
> > > >>> being done
> > > >> Sadly, this assumption is not correct.  HVM guests with PV drivers
> > > >> currently have to be aware in exactly the same way as PV guests.
> > > >>
> > > >> Work is in progress to try and address this.  See
> > > >> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3D775=
a02452ddf3a6889690de90b1a94eb29c3c732
> > > >> (sorry - for some reason that doc isn't being rendered properly in
> > > >> https://xenbits.xen.org/docs/ )
> > > > That proposal is very interesting - first time it came across my ra=
dar
> > > > - but I dislike the idea that domain IDs need to be preserved for
> > > > uncooperative migration to work.
> > >
> > > The above restriction is necessary to work with existing guests, whic=
h
> > > is an implementation requirement of the folks driving the work.
> > >
> > > > Ideally I would be able to take
> > > > advantage of the same plumbing to perform forking of VMs with PV
> > > > drivers where preserving the domain id is impossible since its stil=
l
> > > > in use.
> > >
> > > We would of course like to make changes to remove the above restricti=
on
> > > in the longterm.  The problem is that it is not a trivial thing to fi=
x.
> > > Various things were discussed in Chicago, but I don't recall if any o=
f
> > > the plans made their way onto xen-devel.
> >
> > Yea I imagine trying to get this to work with existing PV drivers is
> > not possible in any other way.
>
> No, as the doc says, the domid forms part of the protocol, hence being vi=
sible to the guest, and the guest may sample and use the value when making =
certain hypercalls (only some enforce use of DOMID_SELF). Thus faking it wi=
thout risking a guest crash is going to be difficult.
>
> > But if we can update the PV driver code
> > such that in the longterm it can work without preserving the domain
> > ID, that would be worthwhile.
> >
>
> I think that ship has sailed. It would probably be simpler and cheaper to=
 just get virtio working with Xen.

That would certainly make sense to me. That would reduce the
maintenance overhead considerably if we all converged on a single
standard.

Tamas

