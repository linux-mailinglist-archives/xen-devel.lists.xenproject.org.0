Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 725D77CAB5F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 16:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617655.960458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOWH-0002yx-ED; Mon, 16 Oct 2023 14:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617655.960458; Mon, 16 Oct 2023 14:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsOWH-0002w7-Ab; Mon, 16 Oct 2023 14:24:33 +0000
Received: by outflank-mailman (input) for mailman id 617655;
 Mon, 16 Oct 2023 14:24:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fs62=F6=linaro.org=alexey.klimov@srs-se1.protection.inumbo.net>)
 id 1qsOWF-0002w1-Bv
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 14:24:31 +0000
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [2607:f8b0:4864:20::e2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b70c3e1f-6c2f-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 16:24:29 +0200 (CEST)
Received: by mail-vs1-xe2b.google.com with SMTP id
 ada2fe7eead31-457c134a702so1295092137.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Oct 2023 07:24:29 -0700 (PDT)
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
X-Inumbo-ID: b70c3e1f-6c2f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697466268; x=1698071068; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oD491WOQgWegw/l7BXpsbCTQYlfGGf4P/3kLemTggW8=;
        b=ock922/6gOwm9LdQyTuhrsKUJOLt9ASONif3DpBSjUwXWJecr5ENxtbbpLzap29vzn
         8O+lpePBAWX+edh8zO6s0eyPL00zd/sKrRO3QTNWTj3C8Lgo+INK4PK+tGyLfMqQWY+N
         Np2ZCmJsBbnMgZNbSEY2YROxNNnS7TKkI4CrmXBVJBk0FPsnHzDAQRSqXKAIzrowBjRV
         +ZMlDOeVFOY0+0iVEL5r3OkAfEpUeVhkPkD87N23uBT2jvdzwCj1a8CNhPo6/+mVy1mI
         jZM60Y6WUMJMF7hqBOjKhxUfZt/+e5hSoFEXHkEpi5j3LlRZ0ocCnoYzOvjPJmvFypCo
         TkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697466268; x=1698071068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oD491WOQgWegw/l7BXpsbCTQYlfGGf4P/3kLemTggW8=;
        b=tx1qnRDSaH9CCV4wMxBMn1ZKZ+GhpgqkXu/sUVaD01dyNN4rpaCmBztpO00cUe1/CC
         Y0B2kr8U3QxgX69Nb+ZB2+AIryMUtyzcIzbMk7hGpvCqk5QOmkyQEo/IKMe5nTwsZRJU
         54ko32/WkDC+G+8dQNHYHIWwF+n8uEa52KuHCqy21AAyP8Vr1+fHd0qWvxauo3AIzgRe
         MpU8MapVlfTNjVBQIT91yB0rZx2OiZgCT/72BqhlZoS46zGsSv6UWU/8H5OZddHAa1Kl
         06escZJhRJkpYJslFeEBOMUXkJGcsS6+SjdR1CZbBhk/YdSdqlJ9mjM/6a0EaH+wFqfD
         lIpw==
X-Gm-Message-State: AOJu0Yx36kwJK/RguTM5QN2rVCYD+Y72we1GnysUUHPKczY3OZnssSJa
	hwjsTvAXnyQKG11s4PSHE+W93t7rzIJ4ElbKkRE4MQ==
X-Google-Smtp-Source: AGHT+IG1bAn72PQ9H/hpooSIf2ltFW9+GdY3ObW5mkf6pju2WuWxMr1xT4w1/+V2vNCjChX4DiOzzMENlqjVW0PKI+c=
X-Received: by 2002:a67:eb98:0:b0:452:99e0:54e3 with SMTP id
 e24-20020a67eb98000000b0045299e054e3mr26661156vso.2.1697466267401; Mon, 16
 Oct 2023 07:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20231013122658.1270506-1-leo.yan@linaro.org> <20231013122658.1270506-3-leo.yan@linaro.org>
 <169101f8-0475-45b1-b2c2-60dadd88d3f0@amd.com> <5a5e960b-e6fd-4617-b33a-10cf07f5bb52@xen.org>
 <8BCB97B4-CBDD-43D9-B0F8-7F637B8BE559@arm.com> <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
In-Reply-To: <4B2BD200-5D3E-49D5-BF13-65B769AD4B90@arm.com>
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 16 Oct 2023 15:24:16 +0100
Message-ID: <CANgGJDqHu0CB=zzZqda18giLYDkL3My+gT592GLO-b9HsF2A4g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] xen/arm: Enlarge identity map space to 10TB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, 
	Michal Orzel <michal.orzel@amd.com>, "leo.yan@linaro.org" <leo.yan@linaro.org>, 
	Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Rahul Singh <Rahul.Singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Oct 2023 at 15:13, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>
>
>
> > On 16 Oct 2023, at 15:00, Bertrand Marquis <Bertrand.Marquis@arm.com> w=
rote:
> >
> > Hi
> >
> > +Luca and Rahul
> >
> >> On 16 Oct 2023, at 15:54, Julien Grall <julien@xen.org> wrote:
> >>
> >>
> >>
> >> On 16/10/2023 09:44, Michal Orzel wrote:
> >>> Hi,
> >>
> >> Hi,
> >>
> >>> On 13/10/2023 14:26, Leo Yan wrote:
> >>>>
> >>>>
> >>>> On ADLink AVA platform (Ampere Altra SoC with 32 Arm Neoverse N1 cor=
es),
> >>>> the physical memory regions are:
> >>>>
> >>>>  DRAM memory regions:
> >>>>    Node[0] Region[0]: 0x000080000000 - 0x0000ffffffff
> >>>>    Node[0] Region[1]: 0x080000000000 - 0x08007fffffff
> >>>>    Node[0] Region[2]: 0x080100000000 - 0x0807ffffffff
> >>>>
> >>>> The UEFI loads Xen hypervisor and DTB into the high memory, the kern=
el
> >>>> and ramdisk images are loaded into the low memory space:
> >>>>
> >>>>  (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
> >>>>  (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
> >>>>  (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
> >>>>  (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel
> >>>>
> >>>> In this case, the Xen binary is loaded above 8TB, which exceeds the
> >>>> maximum supported identity map space of 2TB in Xen. Consequently, th=
e
> >>>> system fails to boot.
> >>>>
> >>>> This patch enlarges identity map space to 10TB, allowing module load=
ing
> >>>> within the range of [0x0 .. 0x000009ff_ffff_ffff].
> >>>>
> >>>> Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enab=
le/disable")
> >>> I don't think a fixes tag applies here given that 2TB was just a numb=
er we believed is enough
> >>> and all of this is platform dependent.
> >>> This can be dropped on commit if committer agrees
> >> Xen may have booted on that platform before hand. So this would be con=
sidered a regression and therefore a tag would be warrant.
> >>
> >> AFAICT, the commit is only present on the upcoming 4.18. So the questi=
on is whether Xen 4.17 booted out-of-the-box on ADLink? If the answer is ye=
s, then we need to add a Fixes tag. But the correct one would be
> >>
> >
> > @Rahul or Luca: could you give an answer here ?
> > I know you used Xen on an AVA platform but was it booting out of the bo=
x ?
>
> I can=E2=80=99t say for Xen 4.17, but our nightly job has run successfull=
y on AVA for the commit 730406ab81094115d9fb5ca00ba8d53cec1279b3
> (docs/misra: add deviations.rst to document additional deviations.)
>
> We are not applying any patch for it to run on AVA.

Most likely it is because your UEFI/BIOS firmware is 2.x, for instance
2.04.100.07.
This fix if for AVA machine with older UEFI firmware 1.07.300.03.

Best regards,
Alexey

