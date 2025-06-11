Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA8AD529E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 12:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011516.1389970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJ1v-0004gd-Uq; Wed, 11 Jun 2025 10:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011516.1389970; Wed, 11 Jun 2025 10:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPJ1v-0004d0-RG; Wed, 11 Jun 2025 10:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1011516;
 Wed, 11 Jun 2025 10:50:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/a1C=Y2=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uPJ1t-0004Fr-Vt
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 10:50:02 +0000
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [2607:f8b0:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d282d6ef-46b1-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 12:50:01 +0200 (CEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-72c47631b4cso4355974a34.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 03:50:01 -0700 (PDT)
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
X-Inumbo-ID: d282d6ef-46b1-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1749639000; x=1750243800; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GG6aW3XDuEMUCKryLo/fh3k2eKKUNrqXRIEfIyGJ6II=;
        b=gDn0GzJW7NoRLOpep9bGyNV4SXRHC6+F0FHQTFl+Uj15Br3OeujR7AcJbPqI7Cc8Dg
         mVxkegPJUmUKc/+wBlfQQERMUDyYVxS1z1do41DcuP+uVlnfFIz19j01zOCGeuk8PT8i
         SCHchn+9TL+5FGvXhxTRC/6Kt73HnhJ64qkAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749639000; x=1750243800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GG6aW3XDuEMUCKryLo/fh3k2eKKUNrqXRIEfIyGJ6II=;
        b=lQLd+blIyE4yaXQ2Nt2eKobEtffzJEuuvUbCGfG+6FlxJoIyinSsxdhUaRR3TzDWK5
         mmrUEib8o5ocxJ9fbyM7dwcCj0ivMha4qrD0orH1vFKvBqJ44QZABdique4hh4+de3W3
         YMcF+uGtpHTNYHL+OI0l2L9RsLCRmfaiDQgPXCZsRRN4JtoWq6OIUMCrZ1lKAuZQARli
         OvWvylWDuOwCPOo6L19pvcTy/4G5kO01TsFfl+rD/VA2KrL35jXWT9lT8l7eNqSsfC0t
         pOvAiNAFLLj+7ziJjF6qyyDW2rERclxmMckEeLmYCgwKaIrC2pMsjm1dRrcBRaipFEeY
         XlWw==
X-Forwarded-Encrypted: i=1; AJvYcCWb+MlKwwYDLHkU/JOb3KuFJrfGVIhUJwll9sl4bRPb3e0msVd8kvnBYF/vljw6iE09dnGEat8lkSA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWeQ6FZfCB5QEcU02gWQ9O7dAa7ePz2pyLSn6e7qKLWSRhUkz+
	OwhytKgOiDn2XBTSINM7RNffszvMPr8l2IuO1WR9qdAZ87spFeOZIZ+iQPMroYfkF8rb1ybC0qD
	uDhI/LvAPxWvJ/idknBO3jN29t18ySM3IZo2Yldly0g==
X-Gm-Gg: ASbGnctMjVVg+YZal3HdMEnpZzyTZgtPx3kvjHELRaVvCZ4V8iUrQj4+pbAzP0k6VvS
	NdeMzaSmbCAF+hLg0sSpgD18/nW395Moj5+flOnASsbjAn7XD6kvPA0TdgHofDaEEO9qD5Jbw0d
	DVg9xR/cMBVhVP2ZU+IVecbNToKk6rin/luOSV82rDWBA=
X-Google-Smtp-Source: AGHT+IFhWKNulhpb9zOz9n2F0dBdP5Ohpf3TBWv2HIvwUMGzYzjAFvPRNXTZ1J17WszAAVMERRPbLNWJq6gfKXXxEdM=
X-Received: by 2002:a05:6871:9d02:b0:2cc:3523:9cd5 with SMTP id
 586e51a60fabf-2ea96d45dbfmr1566648fac.17.1749638999561; Wed, 11 Jun 2025
 03:49:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250610101228.24460-1-freddy77@gmail.com> <02162717-25de-4ffb-a9c4-bf6d580c43bc@suse.com>
In-Reply-To: <02162717-25de-4ffb-a9c4-bf6d580c43bc@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 11 Jun 2025 11:49:48 +0100
X-Gm-Features: AX0GCFsWvTYgV-U5XmRdUnFrTzTbnb3Er66SILaFcBxBFv0Zwlq0OdAB8i0wmUk
Message-ID: <CACHz=Zg5NDFOd5rinj-72TC82SiaQZbKErmLudLZVCE5kcvQbg@mail.gmail.com>
Subject: Re: [PATCH] xen: Strip xen.efi by default
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <freddy77@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 10:35=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 10.06.2025 12:12, Frediano Ziglio wrote:
> > For xen.gz file we strip all symbols and have an additional
> > xen-syms file version with all symbols.
> > Make xen.efi more coherent stripping all symbols too.
>
> And the other difference (compressed vs not) still remains.
>
> > xen.efi.elf can be used for debugging.
>
> Hmm, that's the result of ...
>
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -238,6 +238,7 @@ endif
> >               > $@.map
> >  ifeq ($(CONFIG_DEBUG_INFO),y)
> >       $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) =
-O elf64-x86-64 $@ $@.elf
> > +     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(STRIP) $@
> >  endif
> >       rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> >  ifeq ($(CONFIG_XEN_IBT),y)
>
> ... objcopy. Having looked at the involved code in that utility, I mistru=
st its
> output from such a conversion to really be an exact representation of the=
 input.

From https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommit;f=3Dxen/arch/x8=
6/Makefile;h=3Df514bab30ef8d4ade77a27c926e283c9bbbf9ffd,

    Today it is not possible to analyse crash dumps of a system in
    hypervisor mode when it had been booted via EFI, as the crash utility
    doesn't understand the file format of xen.efi.

    This can easily be solved by creating an ELF file from xen.efi via
    objcopy. Using that file as name list for crash enables the user to
    analyse the dump in hypervisor mode. Note that crash isn't happy with
    a file containing no text and data, so using --only-keep-debug is not
    an option.

Isn't that true anymore?

> IOW I'd much rather use the original file. As a possible compromise, coul=
d we
> perhaps merely strip debug info, but retain the symbol table, matching th=
e
> prior default for $(efi-strip-opt)?

Not clear the compromise you are intending here, the debug file has
all information available, why do you need an intermediate one? We
strip everything for ELF, why not be coherent?

>
> Jan
>

Frediano

