Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E5198EFD9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 14:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809458.1221793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swLPD-0000ex-Ey; Thu, 03 Oct 2024 12:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809458.1221793; Thu, 03 Oct 2024 12:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swLPD-0000cT-BN; Thu, 03 Oct 2024 12:58:07 +0000
Received: by outflank-mailman (input) for mailman id 809458;
 Thu, 03 Oct 2024 12:58:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d1Re=Q7=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swLPB-0000XO-OY
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 12:58:05 +0000
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20d1a021-8187-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 14:58:05 +0200 (CEST)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-3e04b7b3c6dso495079b6e.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 05:58:05 -0700 (PDT)
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
X-Inumbo-ID: 20d1a021-8187-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727960284; x=1728565084; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMTVC0/TxqscVfsnoVmCR7K5y/PJgYPDrQm7qA5bnK4=;
        b=gxWSK5f+VPl+gDoN+8uLpsF/NM9ovgeKqvoFv0IrfaMAQUKZI1CZka1kcax+ZJ3VwQ
         oXlQoqAM4Q99WRx1OwQx+xYONCyBHvB/0zYfzd/J2PfOt6dmPFpBZ1x+73v6q7kkjRTc
         wIdGm6sQl1XcLoWASN/WJrJJEjWdWfJf2WLos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727960284; x=1728565084;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMTVC0/TxqscVfsnoVmCR7K5y/PJgYPDrQm7qA5bnK4=;
        b=ar7YCtchy7KlWgMTwvKknaYPimzl5JIiNXe5h59MlwPgYBnOXqMuFc2dQo6Gh0cD5v
         ISuizRGOfVmm3zKECTdnY4SYGIx/XIXewfVXnEbyPY/5MMTJNlZR2EbaQ0v933hA3PD9
         D1Poq3kORtbktmWWGBZbKLHs2DrktfoiO8aBFSQ3BrRvAHLk7Aade3/9hR2LBv21QCtG
         BHLJ0Vs7VeF3o0c1tgiRsjiHkMP7scIse/i2oM5qmnHoWfaWKb88n5nw7y3w749Q6+h1
         Nk8U6kdlvMVW0EGfD1sO6U2QuDbR717/gy4c9EPkLZICsZdYCPJaPYXFSSVuqme1Xbpn
         IBXw==
X-Forwarded-Encrypted: i=1; AJvYcCU2FctXFPDyPNjY4S/8pz3vbmM1KB4sUksOF4+xqh/tnxKVvS7vke/DJ4RfWJ5tAghmkoO/IUKPZEY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0iWepe0Mh3F8oBMYKF/jw0ka8lV7KFHA4gCoDCfklyFT7zW9t
	g923QMOPBLfHSvPU/p5lHY1qulQDLV6KrwiIppzR/pBI5h/x+y0Q6Jlldi6y5mQP/uZevz8TiJP
	NmLvxGSGMksW5LNflZEAT4ugcpqo+b8GlOChbdQ==
X-Google-Smtp-Source: AGHT+IFNzhv4/yIBxaf6oD45LKXLi76QYX9ytqmB0/mc3n1NbwNcMcq5i12kQy8DHE9z1l5vmR0vO1jmI1yMQtd+DXQ=
X-Received: by 2002:a05:6871:610:b0:25e:b999:d24 with SMTP id
 586e51a60fabf-287883e5c57mr4764089fac.0.1727960283686; Thu, 03 Oct 2024
 05:58:03 -0700 (PDT)
MIME-Version: 1.0
References: <20241001102239.2609631-1-frediano.ziglio@cloud.com>
 <20241001102239.2609631-3-frediano.ziglio@cloud.com> <0d49ee74-9e19-4f77-9c5c-cbd86cac4b0d@suse.com>
In-Reply-To: <0d49ee74-9e19-4f77-9c5c-cbd86cac4b0d@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 3 Oct 2024 13:57:52 +0100
Message-ID: <CACHz=ZjScnDF+0LHxZhL_hmG=_AiFCbuiNLecRn_AFz84OVMMw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] x86/boot: Improve MBI2 structure check
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 5:02=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 01.10.2024 12:22, Frediano Ziglio wrote:
> > --- a/xen/arch/x86/efi/mbi2.c
> > +++ b/xen/arch/x86/efi/mbi2.c
> > @@ -13,6 +13,7 @@ efi_multiboot2_prelude(uint32_t magic, const multiboo=
t2_fixed_t *mbi)
> >      EFI_HANDLE ImageHandle =3D NULL;
> >      EFI_SYSTEM_TABLE *SystemTable =3D NULL;
> >      const char *cmdline =3D NULL;
> > +    const void *const mbi_raw =3D (const void *)mbi;
> >      bool have_bs =3D false;
> >
> >      if ( magic !=3D MULTIBOOT2_BOOTLOADER_MAGIC )
> > @@ -21,7 +22,9 @@ efi_multiboot2_prelude(uint32_t magic, const multiboo=
t2_fixed_t *mbi)
> >      /* Skip Multiboot2 information fixed part. */
> >      tag =3D _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN)=
);
> >
> > -    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size &&
> > +    for ( ; (const void *)(tag + 1) - mbi_raw <=3D mbi->total_size &&
> > +            tag->size >=3D sizeof(*tag) &&
> > +            (const void *)tag + tag->size - mbi_raw <=3D mbi->total_si=
ze &&
> >              tag->type !=3D MULTIBOOT2_TAG_TYPE_END;
> >            tag =3D _p(ROUNDUP((unsigned long)tag + tag->size,
> >                     MULTIBOOT2_TAG_ALIGN)) )
>
> Hmm, looks like what I said on the earlier version still wasn't unambiguo=
us
> enough; I'm sorry. There is still potential for intermediate overflows in
> the calculations. _If_ we care about avoiding overflows, we need to avoid
> all of that. Even more so that Misra may not like this sort of pointer
> calculations. You know tag >=3D mbi_raw, so tag - mbi_raw is always valid=
 to
> calculate. tag->size can further be checked to be less than mbi->total_si=
ze,
> at which point mbi->total_size - tag->size can also be calculated without
> risking {over,under}flow. (Similar then for the earlier (tag + 1) check.)
>
> Jan

Hi,
  personally, I don't care much about checking for overflows here.
It's not that we are in a higher security level, and we need to check
malicious intentions (like when user calls the kernel or a VM calls
the hypervisor), if the loader (which is at the same security level)
is passing garbage we are going to crash.

Saying that with this commit Marek checks are failing, I was thinking
about dropping this commit completely. Yes, in theory better checks
are better, but if we cause regression and boot failures maybe it's
better to allow some wrong data. That's one reason I wanted to keep
this commit separate from the other, which is just translating what
assembly code was doing, not introducing any regression (good or bad)
in behavior. I think it would be worth investigating what Marek
machine is passing in order to make sure we accept whatever wrong data
we are receiving (or understanding why more checks cause the issue).

Frediano

