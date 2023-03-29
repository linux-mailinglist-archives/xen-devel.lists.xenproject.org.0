Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A506CD8BE
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 13:48:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516220.800001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUHN-0001ok-F8; Wed, 29 Mar 2023 11:47:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516220.800001; Wed, 29 Mar 2023 11:47:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phUHN-0001lk-Bq; Wed, 29 Mar 2023 11:47:49 +0000
Received: by outflank-mailman (input) for mailman id 516220;
 Wed, 29 Mar 2023 11:47:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UO3W=7V=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1phUHL-0001ld-I1
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 11:47:47 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 855ddcc1-ce27-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 13:47:45 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id q16so19732569lfe.10
 for <xen-devel@lists.xenproject.org>; Wed, 29 Mar 2023 04:47:45 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac255a6000000b004b5634f9b9dsm5412019lfg.115.2023.03.29.04.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 04:47:45 -0700 (PDT)
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
X-Inumbo-ID: 855ddcc1-ce27-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680090465;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xdsZayu9Q1jPOdBOcQzSF2oKk5pWISHh+s6DyQ3WvME=;
        b=hVkx2Se+5bg18ylvrgiAAQ4CF+0kSysmC5UPihUNckWmhzPQOattvHH2X0wMjlxroh
         yNr25jTmsE46KcworRqivv1A3Z+J+2PRLquaNv6AhHCRTvyKAThsOCvLyS7PSJh5DTLg
         U9B7rf3YQMPY9H4Vd636rD9UWH1uiYpqk37wVSPQOlcmcGrzZzYSjcANK8CiDeSJ+u0+
         qShoVtrNcdoLzv9Ob1qeHFP3O2HuBsMid7IVZy4wQlsLBHyNKeCd6uY3wjlG+wneFPYT
         36o5+a7a0ym8UYI+AvYW8kRZm+AORPZm4eBcfdxNp9YfRvPy1+k4n4fasQnWZuVVQ9/V
         P/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680090465;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xdsZayu9Q1jPOdBOcQzSF2oKk5pWISHh+s6DyQ3WvME=;
        b=tuBU7URTILwQFzSLpKS4rq77K4Cy5QvIYt2epvUkYQP3V55jCj9hhQpDtI+k1ECtPZ
         KRhpJUk/glsER46lMn5kpZUtQbCpxoZH+QzIfqFG2SAv74CNcp1XFNeLNjIzhtLPi2cu
         JhxJqxHoj19x4jDl0by6SxorL3MON587yWRjpRWjYw76RobIwiri11Pt5gMml+gHVpBW
         IJlZ8xisw9gWBGU1s/E5x7nUN90nD6rs7oeMwG5WZ7RyB7VPreaoMi9mFQRgIxJgQINi
         V+twp2eLZ/7fNM31Fqo1sAXmNEJ5QqEwjnMmLYPeGK0tUBPsf07azGyYbBPNLSSrytJi
         T0Vg==
X-Gm-Message-State: AAQBX9c5kjUGE1dV3oVQnchgti5+0Nf224t0ztLxkbiZzJVOubODkulX
	24IDH6KZGSkWHz4FTUQQeDM=
X-Google-Smtp-Source: AKy350Y1ok5GKE/83Xr9NDHxHISOz5cgwNTBTNNMZ1pQXkESWeXRQIyOYRP0b3vvGj2wHQcucbInHA==
X-Received: by 2002:ac2:442a:0:b0:4ea:ea03:ec8f with SMTP id w10-20020ac2442a000000b004eaea03ec8fmr660369lfl.9.1680090465166;
        Wed, 29 Mar 2023 04:47:45 -0700 (PDT)
Message-ID: <66b64c69fdc1404d9ade4be97c4a184715e4c967.camel@gmail.com>
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Wed, 29 Mar 2023 14:47:44 +0300
In-Reply-To: <fa074729-ccf7-cf2a-b8df-6c77ae3117f1@xen.org>
References: <cover.1679934166.git.oleksii.kurochko@gmail.com>
	 <93da6ba381604748e2c71e2ebd35e80798ec4bb2.1679934166.git.oleksii.kurochko@gmail.com>
	 <0a16b79e-8292-6947-24d4-dd027113943f@suse.com>
	 <fa074729-ccf7-cf2a-b8df-6c77ae3117f1@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Tue, 2023-03-28 at 16:44 +0100, Julien Grall wrote:
> Hi,
>=20
> On 28/03/2023 16:34, Jan Beulich wrote:
> > On 27.03.2023 19:17, Oleksii Kurochko wrote:
> > > --- a/xen/arch/riscv/include/asm/config.h
> > > +++ b/xen/arch/riscv/include/asm/config.h
> > > @@ -39,12 +39,25 @@
> > > =C2=A0=C2=A0=C2=A0 name:
> > > =C2=A0 #endif
> > > =C2=A0=20
> > > -#define XEN_VIRT_START=C2=A0 _AT(UL, 0x80200000)
> > > +#define ADDRESS_SPACE_END (_AC(-1, UL))
> > > +#define SZ_1G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x40000000
> >=20
> > No need for this - please use GB(1) (see xen/config.h) in its
> > stead.
> >=20
> > > +#ifdef CONFIG_RISCV_64
> > > +#define XEN_VIRT_START=C2=A0=C2=A0=C2=A0 (ADDRESS_SPACE_END - SZ_1G =
+ 1)
> >=20
> > I first thought the " + 1" would be rendering the address
> > misaligned.
> > May I suggest (ADDRESS_SPACE_END + 1 - SZ_1G) to help avoiding this
> > impression?
>=20
> I will jump on this to say that I am finding quite difficult to
> review=20
> code using define/variable that contains "end" in their name because
> it=20
> is never clear whether this is inclusive or exclusive.
>=20
> In this case, it is inclusive, but within the same patch I can see=20
> map_end which is exclusive.
>=20
> For this case, my suggestion would be to remove ADDRESS_SPACE_END and
> just hardcode the value where you want to put Xen. For others, you
> could=20
> use (start, size) to describe a region.
Thanks for the suggestion. I'll take it into account.
>=20
> Also, are you sure that all the CPU will be able to support more full
> 64-bit VA space?
I am not sure but based on Linux it looks like it is true. ( at least,
they use the same definitions for RV64 ).

I am curious how that can be checked.

~ Oleksii

