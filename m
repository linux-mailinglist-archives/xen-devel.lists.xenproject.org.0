Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCF687FFE0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 15:48:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695418.1085121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmakG-0005iW-Ad; Tue, 19 Mar 2024 14:47:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695418.1085121; Tue, 19 Mar 2024 14:47:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmakG-0005fJ-7b; Tue, 19 Mar 2024 14:47:16 +0000
Received: by outflank-mailman (input) for mailman id 695418;
 Tue, 19 Mar 2024 14:47:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HsT8=KZ=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rmakE-0005fD-Ch
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 14:47:14 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91e7ce29-e5ff-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 15:47:13 +0100 (CET)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-6e6bee809b8so5192699b3a.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 07:47:13 -0700 (PDT)
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
X-Inumbo-ID: 91e7ce29-e5ff-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710859631; x=1711464431; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jsKJd82DUZkFP7wnygY+3TeSxyW9m/47rfwZdNiYZs=;
        b=KUEMBNn1WjtmiGnRVC3Kx1h4QEmLUXt9F5UwaMyR0jpOT7qa2VE6+XCqbovuDzIkhw
         2iN8gCpa7xyxnTWN8jx6wq+TF8dzd9RRSXPzBTVvzns8qLTXSMYjs526zNF/OZVYA5E/
         PimPsOyUn9Bx/Vp9oJSmn8vwX2HrMUsIKJ6CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710859631; x=1711464431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jsKJd82DUZkFP7wnygY+3TeSxyW9m/47rfwZdNiYZs=;
        b=I9Cqq45i6Ij3VEvMoVCTJGnul6Yw5RSPKEyiIP4AiPXeeUVkegLi0/j1GACvgqhB1E
         J9wgHHm0BqNi1U8magwhZmxy3DNP7wSqdzfMIIfxUKm++DU2YmOG2C/2SjdEiYwAbScN
         Gy2dTgzaYdOWfp/a7G9y0ZZ6zEs9tX9VyIURlPaU2s1rO5sFwwGh7vIGUFMnTaaQCry+
         DB7VYXfRzt5XpJFVIEM0WKCU2YybpbyugqqDIpZNsoj7myN3HrBo+afVzC1GfZTFNfeO
         unjUpTO5WquwxpERd06Wjo8b/sI48jC3pjnCGGAOQy1CPO0pqBUJOIJuvh+Ln4cZBlmI
         9CjA==
X-Forwarded-Encrypted: i=1; AJvYcCVDPheDiLn3bFtsQzVguMwwpv5CzpglO41MzmUne6lTLbr0urEkIM1lStC05whjmteAl7E2GioR0JJgGI/WGaYfI5Y1h98YorUlnJcEGCE=
X-Gm-Message-State: AOJu0YwS3t/kj6zJ7ugynsN2HJd/sKKUI8+xOAOJUJoiSBxzEmvwCtbP
	kBiUraIi0IHSXYaYRz5UcwpDVr5vrXftuUOyk6Vfb/WXaVsKTvl5+TsGbjeio/OYbHhQiBRyYTG
	czfL88izvCtBKIGTotHTIONqieOdZpw9bHguY
X-Google-Smtp-Source: AGHT+IHNRSHxTMVVlcshVQrkMNGe2s0Ed89GE9qM8/pjRO509T6EfpFtjLGxNzQ6EACmIblQYCZZNd6/gdQERW0uhQg=
X-Received: by 2002:a05:6a00:27aa:b0:6e7:f4:3661 with SMTP id
 bd42-20020a056a0027aa00b006e700f43661mr13672189pfb.13.1710859631537; Tue, 19
 Mar 2024 07:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-2-ross.lagerwall@citrix.com> <ZfmQf03uKe5DW0L-@macbook>
In-Reply-To: <ZfmQf03uKe5DW0L-@macbook>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Tue, 19 Mar 2024 14:46:59 +0000
Message-ID: <CAG7k0EopCdrQGLVYXDejorMTe9rhjJNXxaqj21N326fhBtgVFw@mail.gmail.com>
Subject: Re: [PATCH 1/7] multiboot2: Add load type header and support for the
 PE binary type
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 1:18=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com> wrote:
>
> On Wed, Mar 13, 2024 at 03:07:42PM +0000, Ross Lagerwall wrote:
> > Currently, multiboot2-compatible bootloaders can load ELF binaries and
> > a.out binaries. The presence of the address header tag determines
> > how the bootloader tries to interpret the binary (a.out if the address
> > tag is present else ELF).
> >
> > Add a new load type header tag that explicitly states the type of the
> > binary. Bootloaders should use the binary type specified in the load
> > type tag. If the load type tag is not present, the bootloader should
> > fall back to the previous heuristics.
> >
> > In addition to the existing address and ELF load types, specify a new
> > optional PE binary load type. This new type is a useful addition since
> > PE binaries can be signed and verified (i.e. used with Secure Boot).
> >
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > ---
> >  doc/multiboot.texi | 39 ++++++++++++++++++++++++++++++++++-----
> >  doc/multiboot2.h   | 13 +++++++++++++
> >  2 files changed, 47 insertions(+), 5 deletions(-)
> >
> > diff --git a/doc/multiboot.texi b/doc/multiboot.texi
> > index df8a0d056e76..d12719c744eb 100644
> > --- a/doc/multiboot.texi
> > +++ b/doc/multiboot.texi
> > @@ -511,11 +511,12 @@ assumes that no bss segment is present.
> >
> >  Note: This information does not need to be provided if the kernel imag=
e
> >  is in @sc{elf} format, but it must be provided if the image is in a.ou=
t
> > -format or in some other format. When the address tag is present it mus=
t
> > -be used in order to load the image, regardless of whether an @sc{elf}
> > -header is also present. Compliant boot loaders must be able to load
> > -images that are either in @sc{elf} format or contain the address tag
> > -embedded in the Multiboot2 header.
> > +format or in some other format. If the load type tag is not specified
> > +and the address tag is present it must be used in order to load the
> > +image, regardless of whether an @sc{elf} header is also present.
> > +Compliant boot loaders must be able to load images that are either in
> > +@sc{elf} format or contain the address tag embedded in the Multiboot2
> > +header.
> >
> >  @subsection The entry address tag of Multiboot2 header
> >
> > @@ -732,6 +733,34 @@ and @samp{2} means load image at highest possible =
address but not
> >  higher than max_addr.
> >  @end table
> >
> > +@node Load type tag
> > +@subsection Load type tag
> > +
> > +@example
> > +@group
> > +        +-------------------+
> > +u16     | type =3D 11         |
> > +u16     | flags             |
> > +u32     | size =3D 12         |
> > +u32     | load_type         |
> > +        +-------------------+
> > +@end group
> > +@end example
> > +
> > +This tag indicates the type of the payload and how the boot loader
> > +should load it.
> > +
> > +The meaning of each field is as follows:
> > +
> > +@table @code
> > +@item load_type
> > +Recognized load types are @samp{0} for address (i.e. load a.out using
> > +the address tag), @samp{1} for ELF, and @samp{2} for PE. Compliant
> > +bootloaders should implement support for a.out and ELF as a minimum.  =
If
> > +this tag is not specified, the boot loader should attempt to load the
> > +payload using the information specified in the address tag if present,
> > +else it should load the payload as an ELF binary.  @end table
>
> I wonder if it would be simpler to use the following order instead:
>
> 1. Address tag
> 2. Load type tag
> 3. ELF header
>
> It's pointless to add a Loader type tag with load_type =3D=3D 0, as that'=
s
> already mandated by the Address tag.  IOW: signaling the use of the
> Address tag here is kind of pointless, if the fields in the Address
> tag are set, that's the only signaling required for the data in the
> Address tag to be used.
>
> Or are we attempting to support images that set Address tag and Load
> type tag !=3D 0 in order to use the Address tag when the loader doesn't
> recognize the Load type tag, and otherwise use a different format?

No, that wasn't my intention. My intention for the load type tag was
to have one tag that unambiguously describes the payload format and if
that is missing, fall back to the previous logic for compatibility.
It avoids more complicated heuristics if different payload types are
added in the future.

>
> Would it be sensible for multiboot2 to use PE in preference to ELF if
> present on the image?  (without requiring any signaling).  I would
> think this could be troublesome if kernels are so far expecting the
> ELF header to be used with multiboot2, even if they also expose a PE
> header.
>

AFAIK an ELF image can't also be a valid PE/COFF image since they have
different magic numbers at the start of the image. Perhaps it would
be simpler to avoid introducing the load type tag and just load the
payload based on the magic number?

Ross

