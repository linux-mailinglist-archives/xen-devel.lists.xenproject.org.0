Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90E491E350
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 17:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751762.1159813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIar-0000pr-LG; Mon, 01 Jul 2024 15:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751762.1159813; Mon, 01 Jul 2024 15:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIar-0000nn-IV; Mon, 01 Jul 2024 15:05:25 +0000
Received: by outflank-mailman (input) for mailman id 751762;
 Mon, 01 Jul 2024 15:05:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fTSe=OB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sOIap-0000nh-7Z
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 15:05:23 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 566a4482-37bb-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 17:05:22 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7194ce90afso360228066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 08:05:22 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab08d0ccsm347237366b.177.2024.07.01.08.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 08:05:20 -0700 (PDT)
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
X-Inumbo-ID: 566a4482-37bb-11ef-90a5-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719846321; x=1720451121; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uDZCfJL8PUA0fPA8bheB0jCWGv7RkfhMHMjt+3SbwdA=;
        b=SgTKzOAat7sSxhWsFtCVbT++Vx0w8mPF3MRjulD6FnwWbNuOLgJXCTdmcEK5tVrMMW
         wXFs9cwwAnifjLdztmySNRr6Nfu6CZIr02fRz2pDyAmXUerAqCNAMXgITzYDqOsob/ko
         asJ1zmY/kh1BOGV0tUg+L2WmFPdQ+0+NKThPSqEEUpZn302D+d234ENGxVzeOd2/hIe0
         1q0K2L5LTWLinhbru3b9ReRg5BB7SZPGAVpT8/3MYAsbtNDd9izPlh+39NDT0WehrnIn
         LQA1qWq9Umxvpwwp50VfMpwkXM3jrqpaxr3S8Pzt5awjI/9ohUhEleoC2ZKZ1pQJ3XV/
         cdiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719846321; x=1720451121;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uDZCfJL8PUA0fPA8bheB0jCWGv7RkfhMHMjt+3SbwdA=;
        b=o2fApsusqjeOqNM5L8bWNT8rhgpwj4EYcXjJCvWtgbzl7P6SOgGjMswif0HdcTgY/5
         Gix1lJS+zpGBT0vxZ3H5nmNAqJRRny6WFgveDTuNGr3AQT+YAZHugWOp7NN/cl4CIBP+
         DOW/mRmN4fnKrW3UYyehkY76FFtt80n4QVGmdKCuTp7Ckykko5KDlrZE0wsJe1bYrn2/
         1ZGbAACCoBAbKQlbqDbj9PGES3vjCwdxY8Cvl6AUmXBnN6jOh4IbDg1OVly1QN/74YYB
         /qYJG0MCSYGMvgRuGfiUnSgn+2unqhIDD9AD87DpfMqd9BoAYEmABk+sRc4oRCZXqrBE
         YJoA==
X-Gm-Message-State: AOJu0YzXaPl/nLmR+VuO+uzlmEBKNupapMY8vPe1bHFWCrJ8fDEwz1yU
	Rk8m92qmDcY/AsQL0Dm1rrS1kGQ/euiUX67+e6oyc1FctB9sUcFd
X-Google-Smtp-Source: AGHT+IGgyenmxdWZ18csOy+hdpNaXUiWTz+D5x3kMPUpkIdclWgyei12CRvqiJtRb3UctdmRdQjOIw==
X-Received: by 2002:a17:906:c798:b0:a72:5967:b3a with SMTP id a640c23a62f3a-a751441ea13mr309577266b.22.1719846321076;
        Mon, 01 Jul 2024 08:05:21 -0700 (PDT)
Message-ID: <47c0825308c588ab5089ecde81ceaed8334ec01f.camel@gmail.com>
Subject: Re: [PATCH v3 for-4.19 2/3] pirq_cleanup_check() leaks
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
	 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Mon, 01 Jul 2024 17:05:19 +0200
In-Reply-To: <2d5e700c-22a1-47ad-912f-d242c9fe122f@suse.com>
References: <7cb0d24e-2bda-dcda-4874-2c01ba179947@suse.com>
	 <5641f8eb-5736-8ccc-122b-b3b47c1bac28@suse.com> <ZoJu3jcsiCWwOhBl@macbook>
	 <7d51b6b7-affb-46fd-98dc-b54d3842f6c2@suse.com> <ZoKPUotSg4HOlRzJ@macbook>
	 <2d5e700c-22a1-47ad-912f-d242c9fe122f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-01 at 15:21 +0200, Jan Beulich wrote:
> On 01.07.2024 13:13, Roger Pau Monn=C3=A9 wrote:
> > On Mon, Jul 01, 2024 at 11:47:34AM +0200, Jan Beulich wrote:
> > > On 01.07.2024 10:55, Roger Pau Monn=C3=A9 wrote:
> > > > On Thu, Jul 27, 2023 at 09:38:29AM +0200, Jan Beulich wrote:
> > > > > Its original introduction had two issues: For one the
> > > > > "common" part of
> > > > > the checks (carried out in the macro) was inverted.
> > > >=20
> > > > Is the current logic in evtchn_close() really malfunctioning?
> > >=20
> > > First: I'm getting the impression that this entire comment
> > > doesn't relate
> > > to the part of the description above, but to the 2nd paragraph
> > > further
> > > down. Otherwise I'm afraid I may not properly understand your
> > > question,
> > > and hence my response below may not make any sense at all.
> > >=20
> > > > pirq->evtchn =3D 0;
> > > > pirq_cleanup_check(pirq, d1); <- cleanup for PV domains
> > > > if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1, pirq->pirq) >
> > > > 0 )
> > > > =C2=A0=C2=A0=C2=A0 unmap_domain_pirq_emuirq(d1, pirq->pirq); <- cle=
anup for
> > > > HVM domains
> > > >=20
> > > > It would seem to me the pirq_cleanup_check() call just after
> > > > setting
> > > > evtchn =3D 0 was done to account for PV domains, while the second
> > > > (hidden) pirq_cleanup_check() call in
> > > > unmap_domain_pirq_emuirq() would
> > > > do the cleanup for HVM domains.
> > > >=20
> > > > Maybe there's something that I'm missing, I have to admit the
> > > > PIRQ
> > > > logic is awfully complicated, even more when we mix the HVM
> > > > PIRQ
> > > > stuff.
> > >=20
> > > If you look at pirq_cleanup_check() you'll notice that it takes
> > > care
> > > of one HVM case as well (the not emuirq one, i.e. particularly
> > > PVH,
> > > but note also how physdev_hvm_map_pirq() calls
> > > map_domain_emuirq_pirq()
> > > only conditionally). Plus the crucial aspect of the 2nd paragraph
> > > of
> > > the description is that past calling pirq_cleanup_check() it is
> > > not
> > > really valid anymore to (blindly) de-reference the struct pirq
> > > pointer
> > > we hold in hands. The is_hvm_domain() qualification wasn't
> > > enough,
> > > since - as said - it's only one of the possibilities that would
> > > allow
> > > the pirq to remain legal to use past the call, when having taken
> > > the
> > > function's
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( pirq->arch.hvm.emuirq=
 !=3D IRQ_UNBOUND )
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn;
> > >=20
> > > path. A 2nd would be taking the
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !pt_pirq_cleanup_chec=
k(&pirq->arch.hvm.dpci) )
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn;
> > >=20
> > > path (i.e. a still in use pass-through IRQ), but the 3rd would
> > > still
> > > end in the struct pirq being purged even for HVM.
> >=20
> > Right, I was missing that if pirq is properly freed then further
> > usages of it after the pirq_cleanup_check() would be use after
> > free.
> >=20
> > > > > And then after
> > > > > removal from the radix tree the structure wasn't scheduled
> > > > > for freeing.
> > > > > (All structures still left in the radix tree would be freed
> > > > > upon domain
> > > > > destruction, though.)
> > > >=20
> > > > So if my understanding is correct, we didn't have a leak due to
> > > > the
> > > > missing free_pirq_struct() because the inverted check in
> > > > pirq_cleanup_check() macro prevented the removal from the radix
> > > > tree,
> > > > and so stale entries would be left there and freed at domain
> > > > destruction?
> > >=20
> > > That's the understanding I had come to, yes. What I wasn't
> > > entirely
> > > sure about (see the 2nd post-commit-message remark) is why the
> > > entry
> > > being left in the radix tree never caused any problems.
> > > Presumably
> > > that's a result of pirq_get_info() first checking whether an
> > > entry is
> > > already there, allocating a new one only for previously empty
> > > slots.
> >=20
> > Yes, I came to the same conclusion, that not freeing wasn't an
> > issue
> > as Xen would re-use the old entry.=C2=A0 Hopefully it's clean enough to
> > not
> > cause issues when re-using.
> >=20
> > > > > --- a/xen/common/event_channel.c
> > > > > +++ b/xen/common/event_channel.c
> > > > > @@ -711,9 +711,10 @@ int evtchn_close(struct domain *d1, int
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if ( !is_hvm_domain(d1) )
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pirq_guest_unbind(d1, pirq);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 pirq->evtchn =3D 0;
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pirq_cleanup_check(pirq, d1);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if ( is_hvm_domain(d1) && domain_pirq_to_irq(d1,
> > > > > pirq->pirq) > 0 )
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 unmap_domain_pirq_emuirq(d1, pirq->pirq);
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if ( !is_hvm_domain(d1) ||
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 domain_pirq_to_irq(d1, pirq->pirq) <=3D 0=
 ||
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unmap_domain_pirq_emuirq(d1, pirq->pirq) =
<
> > > > > 0 )
> > > >=20
> > > > pirq_cleanup_check() already calls pirq_cleanup_check()
> > > > itself.=C2=A0 Could
> > > > you please add a comment to note that
> > > > unmap_domain_pirq_emuirq()
> > > > succeeding implies the call to pirq_cleanup_check() has already
> > > > been
> > > > done?
> > > >=20
> > > > Otherwise the logic here looks unbalanced by skipping the
> > > > pirq_cleanup_check() when unmap_domain_pirq_emuirq() succeeds.
> > >=20
> > > Sure, added:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /*
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * The successful path of
> > > unmap_domain_pirq_emuirq() will have
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 * called pirq_cleanup_check() already.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >=20
> > With that added:
> >=20
> > Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Thanks Roger.
>=20
> Oleksii - would you please consider giving this long-standing bug fix
> a
> release ack?
Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

~ Oleksii

