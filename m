Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D389D97EE3F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 17:32:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802159.1212321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssl2N-0000sS-5u; Mon, 23 Sep 2024 15:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802159.1212321; Mon, 23 Sep 2024 15:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssl2N-0000r6-2u; Mon, 23 Sep 2024 15:31:43 +0000
Received: by outflank-mailman (input) for mailman id 802159;
 Mon, 23 Sep 2024 15:31:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qfp8=QV=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ssl2L-0000qF-He
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 15:31:41 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eceb4243-79c0-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 17:31:39 +0200 (CEST)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-710e1a47b40so1084579a34.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 08:31:39 -0700 (PDT)
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
X-Inumbo-ID: eceb4243-79c0-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727105498; x=1727710298; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlghfVfdKp792BuOpdjFjXdp09PLdkB+knlbSLIEVnM=;
        b=LZe4yKJkFjs8OrBPLxGfxjonhhkNl+zulGfnaTHv7i1KIocXw3x3b/gP0iKXc3z7pl
         CI0Y91eEJBZp1hkjsoO39yMnulFxMg4+rGmNY44mgS26WK275qEd4xpqJIAlcDg5YGOH
         P50GGLtwtwWh+ZbvIQreVXndKYatqGBczaonk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727105498; x=1727710298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlghfVfdKp792BuOpdjFjXdp09PLdkB+knlbSLIEVnM=;
        b=V97/+3UIjV+HrX4tX8rHEvfX5YQQVyVdim6uaIsj2wus2n20eJWpjVgS48GU3VWjWi
         frMFDsI4duWUWxB7pwRB4Mw+4jaOaxid7AZdlylhYWu1DQ0lDENX7+maGT0OFyx5atZS
         jOkcEfAmmEhrQndSstp0WtwFkCnbZQ2pL1zgapyOWw1FR0aKb/fvA1EJEhbzTUOyPKz3
         eHo2ngR110m+gklRJJkuKHF+f9g48w7MVHHHmx1Wxo4dLwkwE47sIUmjmS66aNmgh9Wz
         IQyhKOg/sKdxLiWCMhjnYDdSK+ECfhe6vItVXzUmgAlbDRETTGf1Erj6CKJvPZlWiO3N
         Z4pw==
X-Forwarded-Encrypted: i=1; AJvYcCX7IjA/pH3Mz+GG/OHcwYWFb5sItP/zVNdFD9h/fAo7TZ4kdnDcRqI4X3RQMisT4YMUH3nP4bbuJqI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzVY819kSBaMl/ndeETxjtcxd//vjRpqivSq9sCFFYS5GMihb9r
	5iNgi4uM39cetBZIKzOeOL1ffhR87K19Fa7Au+0tE6xxXGs2jVmP0Hsjt3cNxiIh/fIsSLL5Ar8
	NAfcW8oqotEIoKyJxJq3zCyWhXrqC4ZaUaM5l4w==
X-Google-Smtp-Source: AGHT+IGnCMEoIvonte3stu1PnjS0qUS6w7zCDiO17YD5z9VPnAa1HA2CFf8l6aeSfhI6kedzkz0DgBQQBZmt4H81ukY=
X-Received: by 2002:a05:6830:4126:b0:709:4279:8347 with SMTP id
 46e09a7af769-713923cdef9mr7588923a34.8.1727105497977; Mon, 23 Sep 2024
 08:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240919080021.20155-1-frediano.ziglio@cloud.com>
 <20240919080021.20155-2-frediano.ziglio@cloud.com> <47fc5e0d-e249-4e69-b19d-bb2c4edd1abd@suse.com>
In-Reply-To: <47fc5e0d-e249-4e69-b19d-bb2c4edd1abd@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 23 Sep 2024 16:31:26 +0100
Message-ID: <CACHz=ZjFdqWcu7hKDgwiSaQhxQxBFjQDbze3=GY02_TmY89wyA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] x86: Put trampoline in separate .init.trampoline section
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 4:17=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 19.09.2024 10:00, Frediano Ziglio wrote:
> > This change put the trampoline in a separate, not executable section.
> > The trampoline contains a mix of code and data (data which
> > is modified from C code during early start so must be writable).
> > This is in preparation for W^X patch in order to satisfy UEFI CA
> > memory mitigation requirements.
> > At the moment .init.text and .init.data in EFI mode are put together
> > so they will be in the same final section as before this patch.
> > Putting in a separate section (even in final executables) allows
> > to easily disassembly that section. As we need to have a writable
> > section and as we can't have code and data together to satisfy W^X
> > requirement we need to have a data section. However tools like objdump
> > by default do not disassemble data sections. Forcing disassembly of
> > data sections would result in a very large output and possibly crash
> > of tools. Putting in a separate section allows to selectively
> > disassemble that part of code using a command like
> >
> >     objdump -m i386 -j .init.trampoline -d xen-syms
>
> For xen.efi it won't be quite as neat. One of the reason all .init.*
> are folded into a single section there is that the longer section names
> aren't properly represented, because of the linker apparently preferring
> to truncate them instead of using the "long section names" extension. To
> disassemble there one will need to remember to use "-j .init.tr". I'll
> have to check if there's a linker option we fail to enable, but in the
> absence of that we may want to consider to name the output section just
> ".trampoline" there, abbreviating to ".trampol" (i.e. at least a little
> more descriptive).
>

Long names are working for me, probably some issues with older binutils too=
ls.
".trampol" looks fine for me.

> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -882,8 +882,9 @@ cmdline_parse_early:
> >  reloc:
> >          .incbin "reloc.bin"
> >
> > +#include "x86_64.S"
> > +
> > +        .section .init.trampoline, "aw", @progbits
>
> I think the lack of x here requires a comment.
>

Sure.

> Also did I miss any reply by you to Andrew's suggestion to move the
> trampoline to its own translation unit?
>

Yes, I stated the reason code was included in head.S (for some
assembly symbols computation) and spotted the instances of such
computations.
I was expecting some yes/no before changing.

> Jan

Frediano

