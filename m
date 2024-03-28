Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BED8902A0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:06:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698944.1091210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprKO-0006yU-BG; Thu, 28 Mar 2024 15:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698944.1091210; Thu, 28 Mar 2024 15:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprKO-0006wp-7V; Thu, 28 Mar 2024 15:06:04 +0000
Received: by outflank-mailman (input) for mailman id 698944;
 Thu, 28 Mar 2024 15:06:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jyVg=LC=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1rprKM-0006wj-Ss
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:06:02 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afc8b6ea-ed14-11ee-a1ef-f123f15fe8a2;
 Thu, 28 Mar 2024 16:06:00 +0100 (CET)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1e21d1e8307so3614555ad.2
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:06:00 -0700 (PDT)
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
X-Inumbo-ID: afc8b6ea-ed14-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711638359; x=1712243159; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7REdIHOe+En6wvFNrerIGdNSVbHu6MdMdVBnIGdNlA=;
        b=qXLjWHuHvKWlFz7Lmj+ARpcpGFihcEnpSZFnM/2cJIdI3a9d1tGfb7dhWN92B6Lxp5
         kfkOaXH7sW98xHOMflmlMIDCjujdMB61Qi0E5TmJNVGSX7xERlFyO+j1p7A+Fo/1Tqi9
         GA3nST42etjESH5jPEdeVozaXUFQF2zqvc5hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711638359; x=1712243159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7REdIHOe+En6wvFNrerIGdNSVbHu6MdMdVBnIGdNlA=;
        b=IZRH7Liy57uFMOYS69IHZtDpcxJCc+yhyjeJ/rCVyanh14DFtu0bPK+8hCFoQOedMA
         nTg8Vlj+iHORUV9SQTnDJTvaQdwVJmbv/AiC4N33PyHbnn6rQKzAWuegkuz5yg4rc7Tg
         uWP6UZBFWpwrqsLfwx4cM4na/FSm6oggllPxcsgPjj13ZlgsuZ5poRhpBo7byj3wPUxm
         Yzpi2oSw8iePK0blxCkXpiDjqoMKdjAFAzRo3WiPjXo0zvpWejNF7ua2RlMiJpdIGxkL
         PRHG04TuYhErc/1pvcfE6nc3hlTqlBo5zUdrNnjO0XV6u2JVINzq465QlyxPnVxRK4r/
         9YSA==
X-Forwarded-Encrypted: i=1; AJvYcCU3stpngLV+S3XFYvJNAFg+rsNzaRcVusRXRcaFtiLvJbmaqLq6pxL7VxD6g0fugT2ZYuHvJYxuLLXuUXHxes5CFKckVpymBX9bsks8YRA=
X-Gm-Message-State: AOJu0YyT+pAfNbsHjHjiT6PRhF31hvCLiu/usk1iu5IrTqdr6g9f49Md
	08SMNp4vFp6cLDHGNMW0RDE6ImWR7p8sx2Scvl5ng+wOg1FqAkcA3DnQAcnxE9/DliuT+HBqQSK
	zxdmCtVtVLk9NxPlc49lXM8uHSUq3dHQr09ca
X-Google-Smtp-Source: AGHT+IGvI9UkOFFAsRmdvHTRKgZ0gtGVBFyuXu3T+Ew6jFYGp3QeudPmLyCv/+WaK33QtG8mGzefV5AK21bmWCq221c=
X-Received: by 2002:a17:903:11d1:b0:1e0:f51b:12e2 with SMTP id
 q17-20020a17090311d100b001e0f51b12e2mr3556311plh.2.1711638359254; Thu, 28 Mar
 2024 08:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-3-ross.lagerwall@citrix.com> <Zflj1gEwdeAU45US@macbook>
In-Reply-To: <Zflj1gEwdeAU45US@macbook>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 28 Mar 2024 15:05:47 +0000
Message-ID: <CAG7k0Eq8WFSysMLsg-=FA1GtSR82afXEfHP+cv6gZ_NGn8LrAg@mail.gmail.com>
Subject: Re: [PATCH 2/7] multiboot2: Allow 64-bit entry tags
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Daniel Kiper <daniel.kiper@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 10:07=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@ci=
trix.com> wrote:
>
> On Wed, Mar 13, 2024 at 03:07:43PM +0000, Ross Lagerwall wrote:
> > Binaries may be built with entry points above 4G. While bootloaders may
> > relocate them below 4G, it should be possible for the binary to specify
> > those entry points. Therefore, extend the multiboot2 protocol such that
> > 64 bit addresses are allowed for entry points. The extension is done in
> > a backwards-compatible way.
> >
> > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > ---
> >  doc/multiboot.texi | 32 +++++++++++++++++++-------------
> >  doc/multiboot2.h   |  6 +++++-
> >  2 files changed, 24 insertions(+), 14 deletions(-)
> >
> > diff --git a/doc/multiboot.texi b/doc/multiboot.texi
> > index d12719c744eb..049afab53c1f 100644
> > --- a/doc/multiboot.texi
> > +++ b/doc/multiboot.texi
> > @@ -522,12 +522,12 @@ header.
> >
> >  @example
> >  @group
> > -        +-------------------+
> > -u16     | type =3D 3          |
> > -u16     | flags             |
> > -u32     | size              |
> > -u32     | entry_addr        |
> > -        +-------------------+
> > +          +-------------------+
> > +u16       | type =3D 3          |
> > +u16       | flags             |
> > +u32       | size              |
> > +u32 / u64 | entry_addr        |
> > +          +-------------------+
>
> I might be confused, but this entry point is used in 32bit protected
> mode, and hence a 64bit value is simply impossible to use according to
> the protocol in "3.3 I386 machine state".
>
> Unless that section is expanded to describe other protocols that use
> the entry address in a way where 64bits could be meaningful it seems
> pointless to expand the field.

I changed this because the same binary is being used for both BIOS boot
and UEFI boot, therefore it may have a base address above 4 GiB.
Despite that, it is expected that GRUB would relocate the binary below
4 GiB so BIOS boot would still work.

However, on reflection this is kind of nasty. I've managed to build Xen
in such a way that this is no longer needed so I can drop this change
from the next version of this series.

Ross

