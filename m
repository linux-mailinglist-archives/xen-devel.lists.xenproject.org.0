Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B268A14393
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2025 21:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.873765.1284743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYWh2-0002Qb-0U; Thu, 16 Jan 2025 20:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 873765.1284743; Thu, 16 Jan 2025 20:42:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tYWh1-0002Np-TX; Thu, 16 Jan 2025 20:42:19 +0000
Received: by outflank-mailman (input) for mailman id 873765;
 Thu, 16 Jan 2025 20:42:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mFzr=UI=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1tYWh0-0002Nj-Fq
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2025 20:42:18 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f925972-d44a-11ef-a0e2-8be0dac302b0;
 Thu, 16 Jan 2025 21:42:17 +0100 (CET)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-6d900c27af7so14979986d6.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jan 2025 12:42:17 -0800 (PST)
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
X-Inumbo-ID: 5f925972-d44a-11ef-a0e2-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737060136; x=1737664936; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJQkn8xBOrqxhMrTvXO5m4xHY+rpEt1QvLDpaLCQ2xA=;
        b=YaMLUcviPxqcYaT7Dr/2MTujR06Wvg6zaU01V7is+4mAujWUrhEZkXB+J8QZHscNqB
         uhAH2bCXDfyRRMd52TkammOXg1cPLWF370iSqQU4VO64bNhokGhQYO8qdayjDV+GG+1k
         O5YU9xuAYTvB05HVoWFckEHAuOC8QNyRHS2fiS4Bfefey7h0TXmKVzuJS7dpMzU/x5ts
         IZtTfke/Upb8J/xSTxdLae566ywl2v327+eLswM1dJsWOHGokG7KWy68Z3mWfLv6OmnE
         waGGAH6eFyLg7smK53Sa/k50WcwddGLFmvOqfVa8wu4/1gTQgwJiE9D+LDrZoE0xjj1W
         mWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737060136; x=1737664936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJQkn8xBOrqxhMrTvXO5m4xHY+rpEt1QvLDpaLCQ2xA=;
        b=lGrResSIQ9bLVHw9nukwZlfIqp02aGuukMEjN5TeIZMZiiPEInNcmMLCpP2+o+BHcR
         c+58v1FV4O7TaVh8CN0N5RxIfc8bv5lHOa52JmH3B0+dQMiamPbpgBexjmivYyJJleUt
         OACusKLpuHNyF338CnsQqgNArduQ9SnpQrN2lTrdFBxSl1+jiFl8oEeauVlOl8EeSxZI
         QREpDtYTarT+ZlCYdmK0E3wsd9O9fLQzdlCBrw/aEaFP/JA5xBZuyxYVfKyt5QiZZcpy
         KxTHJZKnvH9XNnOe+fg5xE4kqW5U5B+1gHKNRi9padqvcJNRZZANDv5nWrA3gHx0kHKS
         xJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCV3T5UScYw3BASOgWlNqrVGlftVAMoWqDKyg4QE6hVoj/PyDiiWl8eh/fjRarZsP6rwylNcDViCqb4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwlW0R2diaF3HP5YI0TMx+N6wz7wjTjrVqlP4+wQFE8/2xGPCp5
	RoD+HHsMfXb+Og0RQrFtmUNq+7klyPG6ugnRBGMokfHRZ60ancKajODkKadYpMOGSuiCCEBd9eX
	2qTTWjuch+TRfbBRzALtdoCWRD1s=
X-Gm-Gg: ASbGncuyk9fb4SbtyZzIJuhAZDJ0tctkTw31f7FsTs+el2QGICLuw8S29Yo1z+lBq4a
	JhwakiNw1e2mOmYmA8XBcdS/sShA1+cB9Wk8VRg==
X-Google-Smtp-Source: AGHT+IHACpWQarwyHqgVFej12h3sZ9v5XSkC82TZvdnRS6/tjJiM7t0IXYSpLP19pAQaJiQBCnassDGmy7JGKAd6wj8=
X-Received: by 2002:a05:6214:240b:b0:6df:97a3:5e76 with SMTP id
 6a1803df08f44-6e1b21d13e5mr4146116d6.27.1737060136243; Thu, 16 Jan 2025
 12:42:16 -0800 (PST)
MIME-Version: 1.0
References: <e4a649a7fdfc8fcf5f48a0bc4e76e5d546078083.1736868605.git.Slavisa.Petrovic@rt-rk.com>
 <alpine.DEB.2.22.394.2501141554170.2684657@ubuntu-linux-20-04-desktop>
 <2f1432e6-0d27-48fd-b034-475284f14233@gmail.com> <CAKp59VEOiXo+OKwPNiomtXNCsfDURCXaDktooi5JSoTSdhc90w@mail.gmail.com>
 <alpine.DEB.2.22.394.2501151313590.2684657@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2501151313590.2684657@ubuntu-linux-20-04-desktop>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Thu, 16 Jan 2025 21:42:05 +0100
X-Gm-Features: AbW1kvZkiUy496iMlyaJzvfye_IOgV9RfBQMyk7ZAcKoXtvYI4DmcGkMijbvCWw
Message-ID: <CAKp59VG=MV2=gCFqsC16EpP9oGa=eDBFJbwn-vS5q8oKyM_ZJQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add initial Xen guest support for RISC-Vgh
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>, linux-riscv@lists.infradead.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	jgross@suse.com, oleksandr_tyshchenko@epam.com, Slavisa.Petrovic@rt-rk.com, 
	Milan.Djokic@rt-rk.com, rafael.j.wysocki@intel.com, sunilvl@ventanamicro.com, 
	takakura@valinux.co.jp, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 10:14=E2=80=AFPM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 15 Jan 2025, Milan =C4=90oki=C4=87 wrote:
> > Hello Stefano, Oleksii
> >
> > On Wed, Jan 15, 2025 at 5:30=E2=80=AFPM Oleksii Kurochko
> > <oleksii.kurochko@gmail.com> wrote:
> > >
> > > Hi Stefano,
> > >
> > > On 1/15/25 1:01 AM, Stefano Stabellini wrote:
> > >
> > > +Oleksii
> > >
> > > On Tue, 14 Jan 2025, Milan Djokic wrote:
> > >
> > > From: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> > >
> > > This patch introduces initial support for running RISC-V as a Xen gue=
st.
> > > It provides the necessary infrastructure and stubs for Xen-specific
> > > operations. Key changes include:
> > >
> > > - Modifications to the RISC-V kernel to integrate Xen-specific hyperc=
alls
> > >   and interfaces, with function implementations stubbed for future wo=
rk.
> > > - Introduction of Xen-specific headers for RISC-V, including event
> > >   handling, hypervisor interaction, and page management. Functions ar=
e
> > >   defined but not yet implemented.
> > > - Stub implementations for memory management, grant tables, and conte=
xt
> > >   switching in the Xen environment, allowing further development and
> > >   integration.
> > >
> > > Signed-off-by: Milan Djokic <Milan.Djokic@rt-rk.com>
> > > Signed-off-by: Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>
> > >
> > > Hi Milan, Slavisa,
> > >
> > > Thank you very much for your contribution! Which Xen tree are you usi=
ng
> > > for development?
> > >
> > > They are using [1] and have separate branches on top of latest. So we=
 are in
> > > sync. Also, if you are interested we have created a task/epics for th=
is feature in
> > > [1] so you could also check there some details:
> > > 1. https://gitlab.com/groups/xen-project/people/olkur/-/epics/5
> > > 2. https://gitlab.com/xen-project/people/olkur/xen/-/issues/12
> > >
> > >  I am asking because RISC-V support in Xen is still in
> > > the process of being upstreamed, and [1] is the tree that consolidate=
s
> > > all patches currently on the to-be-upstreamed list.
> > >
> > > While the specific Xen tree you are using is not particularly importa=
nt
> > > at this stage, and using [1] is not a requirement, I am asking becaus=
e
> > > it is essential to align on the hypervisor ABI, especially regarding =
any
> > > details that have not yet been upstreamed. Specifically, is there
> > > anything in this patch series that relies on features not yet upstrea=
m
> > > in Xen?
> > >
> > > There are few features but some things which are Rt-Tk's branch in [1=
] could go
> > > without waiting for these features to be upstreamed.
> > >
> > > Thanks.
> > >
> > > ~ Oleksii
> > >
> > > [1] https://gitlab.com/xen-project/people/olkur/xen/-/tree/latest?ref=
_type=3Dheads
> >
> > As Oleksii already explained, we are working in sync with his latest
> > branch where most of the risc port is done.
>
> Perfect, I was hoping you'd say that! :-)
> It is great to have you on board.
>
>
> > I would just add that this patch introduces kernel risc-v hypercall
> > support on which only our branch on xen tree depends on. Therefore, it
> > won't disrupt any functionality with current upstream Xen, it will
> > just introduce kernel functionality which is not used from Xen side
> > until our branch is merged upstream.
>
> Ideally, we should upstream the Xen side of an interface first to Xen,
> then add support for the interface to Linux. Let me make a concrete
> example. Let's say that you upstream hypercall support to Linux first,
> using SBI_ECALL defined as 0xE. Then, during the upstreaming process,
> the Xen community decides to change SBI_ECALL to 0XEA1 to make it the
> same as ARM. You'd have to change the Linux code again to fix it. To
> avoid this, it is best to wait upstreaming the Linux side, until the Xen
> side is Acked.
>
Sure, I got your point. This is actually one of the things we were not
sure about (whether we should upstream Linux or Xen side first).
Anyways it's good that we got review comments. We'll fix this patch
according to suggestions and send it back when Xen side is upstream.

> This was just an example, and Andrew is right that the SBI
> Implementation ID for Xen is reserved to 0x7, see the SBI specification.
Yes, we were not aware of it, thanks.

BR,
Milan

