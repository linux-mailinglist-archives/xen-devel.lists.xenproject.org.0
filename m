Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF687682BD0
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 12:49:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487580.755254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMp8r-0006h5-5w; Tue, 31 Jan 2023 11:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487580.755254; Tue, 31 Jan 2023 11:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMp8r-0006eq-2j; Tue, 31 Jan 2023 11:49:37 +0000
Received: by outflank-mailman (input) for mailman id 487580;
 Tue, 31 Jan 2023 11:49:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+DaM=54=gmail.com=alistair23@srs-se1.protection.inumbo.net>)
 id 1pMp8p-0006ek-Dc
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 11:49:35 +0000
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com
 [2607:f8b0:4864:20::e36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53583c01-a15d-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 12:49:33 +0100 (CET)
Received: by mail-vs1-xe36.google.com with SMTP id a24so13658195vsl.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jan 2023 03:49:33 -0800 (PST)
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
X-Inumbo-ID: 53583c01-a15d-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76fBGWc5LJRCSdEAxjHz2pXIwr0W3yh0xSvvo/l/+Zs=;
        b=b3lyt7dHGOeAhWN5ELVMnyAvZfFtyDcs2rcLWbBPLeG3fGqQ+JXOc+/eLXWL6y6aoQ
         uKzAOYIX0Un+2H1VJIJ9mSFrPShwnF3XAoRCL+KpDjNmAaXcoXFGdNPe79iv3lME+AEt
         h9Ubzmyz4eq89JCwW1DcSS5JpBuqhNzzjuzODFl2hRfP8KjQ5ne7oubbSkaV2VuuzgTA
         xImBJOdUmnMCLL1zg2SsEFD3AngXCd8TKF0e8mqy6LVFxfCqIzrRDbDKodft++cHtVD4
         AgKiXg5A/f1Zgu7r7xIQ5I/psY5A/kxufiHZUk1T0CWB3xOHihQZ1zi3qGqJjppd+dUm
         g59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76fBGWc5LJRCSdEAxjHz2pXIwr0W3yh0xSvvo/l/+Zs=;
        b=bVfO+NCTOSKiCzyW0KyKsTdzAbji2A7nGmyPCbu5c/u6PPV6OUlkUloYODaqXkYfNk
         4/TWVZhOYKARlG7L79Ch6B0orfOlGfgc6izVTWZi9dlYlG2GhC6+kRk2FBpCHqeWs0Ay
         kiYjLWLd0lx4OZ9xrG7fkAwqVotW5EIpaN9edtlnfUSrHL3Em8DBw5kRlIxSKIVCFcbt
         2gqswFdwxRxAsUXgfk9ukRFWsET++hA7vps+fPUmJr3jOVsvjqmbJYIRWF8xyio7SkaL
         oSnE8FEY8aQsMHQImpf3r/dlHArDz7jAyTI2fx7GBkAfqf6tLLycyo+xuzlkVhwqtrk3
         orHw==
X-Gm-Message-State: AO0yUKVHrdtlboImxQRd107kuJNXswU9F6+7fytYcRW0lKSNCe/zCeal
	C79n8FOTcevDQ1lkzDWj1hsVvSEQRmeJhdMlQ5w=
X-Google-Smtp-Source: AK7set+4J1JJDyOhUWTBkUQ+yFINmj91UHAL+mWR1PwgnyAPbwX9KzADnbLaAxDQJpvDvcVOIfoR3veqoDwQrUmjfMY=
X-Received: by 2002:a67:e101:0:b0:3f0:89e1:7c80 with SMTP id
 d1-20020a67e101000000b003f089e17c80mr1537104vsl.72.1675165771875; Tue, 31 Jan
 2023 03:49:31 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <3617dc882193166580ae7e5d122447e924cab524.1674226563.git.oleksii.kurochko@gmail.com>
 <d5d9a305-3501-cbc4-1c8a-1a62bd08d588@citrix.com> <d3e2c18e443439d18f8ece31c9419e30a19be8c5.camel@gmail.com>
In-Reply-To: <d3e2c18e443439d18f8ece31c9419e30a19be8c5.camel@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 31 Jan 2023 21:49:05 +1000
Message-ID: <CAKmqyKOecoz91e-4-KZUdgT5HNhuwuN83tpFR+HmwkUPb2r3ew@mail.gmail.com>
Subject: Re: [PATCH v1 01/14] xen/riscv: add _zicsr to CFLAGS
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 8:43 PM Oleksii <oleksii.kurochko@gmail.com> wrote:
>
> On Fri, 2023-01-20 at 15:29 +0000, Andrew Cooper wrote:
> > On 20/01/2023 2:59 pm, Oleksii Kurochko wrote:
> > > Work with some registers requires csr command which is part of
> > > Zicsr.
> > >
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > ---
> > >  xen/arch/riscv/arch.mk | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/xen/arch/riscv/arch.mk b/xen/arch/riscv/arch.mk
> > > index 012dc677c3..95b41d9f3e 100644
> > > --- a/xen/arch/riscv/arch.mk
> > > +++ b/xen/arch/riscv/arch.mk
> > > @@ -10,7 +10,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       :=3D
> > > $(riscv-march-y)c
> > >  # into the upper half _or_ the lower half of the address space.
> > >  # -mcmodel=3Dmedlow would force Xen into the lower half.
> > >
> > > -CFLAGS +=3D -march=3D$(riscv-march-y) -mstrict-align -mcmodel=3Dmeda=
ny
> > > +CFLAGS +=3D -march=3D$(riscv-march-y)_zicsr -mstrict-align -
> > > mcmodel=3Dmedany
> >
> > Should we just go straight for G, rather than bumping it along every
> > time we make a tweak?
> >
> I didn't go straight for G as it represents the =E2=80=9CIMAFDZicsr Zifen=
cei=E2=80=9D
> base and extensions thereby it will be needed to add support for FPU
> (at least it requires {save,restore}_fp_state) but I am not sure that
> we need it in general.

That seems fair enough. I don't see a reason to restrict ourselves if
we aren't using something. Although we probably will hit a requirement
on G at some point anyway.

Alistair

>
> Another one reason is that Linux kernel introduces _zicsr extenstion
> separately (but I am not sure that it can be considered as a serious
> argument):
> https://elixir.bootlin.com/linux/latest/source/arch/riscv/Makefile#L58
> https://lore.kernel.org/all/20221024113000.891820486@linuxfoundation.org/
>
> > ~Andrew
> ~Oleksii
>
>

