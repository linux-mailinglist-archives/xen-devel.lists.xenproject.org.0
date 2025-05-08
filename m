Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A41FAAF852
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 12:46:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979276.1365965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCym9-0006tl-EX; Thu, 08 May 2025 10:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979276.1365965; Thu, 08 May 2025 10:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCym9-0006rZ-Al; Thu, 08 May 2025 10:46:49 +0000
Received: by outflank-mailman (input) for mailman id 979276;
 Thu, 08 May 2025 10:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6hWE=XY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uCym7-0005ny-J9
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 10:46:47 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb85bcfe-2bf9-11f0-9ffb-bf95429c2676;
 Thu, 08 May 2025 12:46:44 +0200 (CEST)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-60658e1fedfso417936eaf.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 May 2025 03:46:44 -0700 (PDT)
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
X-Inumbo-ID: bb85bcfe-2bf9-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746701203; x=1747306003; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GsdE/Bq9Qb2SH6Pu+1TyU9AWhTTfQaYciHoKdNdm+w=;
        b=D/54ZGz0dtP1NEZ4zGptEoCUFUPczmdZM2+UeGgOm37sR2iulcA0MobYUUzMFWNabl
         SWNubNz+E/FnaSFOmko0r+yCsCJtLkhgPjyyYx/DvEwwLQx/u9HzlIVtk6h0tUlHx5BS
         PijmJmTyIfZZuAiyzfC0deafaF8w5zBpc7FO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746701203; x=1747306003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GsdE/Bq9Qb2SH6Pu+1TyU9AWhTTfQaYciHoKdNdm+w=;
        b=Cwoss065UMwZwvF8iZxA4D/f1fYVvWEFQCywA7xm/OtaTYrG7Y32zn1SQ3mPyeySZE
         RYe26Iyrt9Nk0mjpsH+TkkLiplOqPAtRlMbMaY2KkQcEYZU4iOzMdvHvf9kBMJnzbGvk
         Qrujct4RhjFtVS0XZp9c1EM7G4pTa6jDnsjWH9QrlqlE+O90SGxvtfEeDOAZCYMC/jrO
         o+V2a5ubBwFufxx1c7wjog08VgbVbYlYnD+JjgsqgNnB+gMzF9P0Za4uxOtkIvbfXZtw
         5D3jNX1dqPjnDWoO9Gat/S3nzj7R7xKVtunIjnROwdDcHZrx1qy3csLG4/RvLNKoliKG
         rjug==
X-Forwarded-Encrypted: i=1; AJvYcCUpOIAG+mo9XSnPsFi4EiqYHr7x3tSl3xGyzXQimj7BDpRksNUCBDcoPLzCSjgU78sPWDnNBvMgp+M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXWJ+wDr4V6AF8LBKp8sbUJsjKaivKEvz1ev+jlCYArd4NIPiN
	HyXTbH9MQlijZMU/+krhY8oCvpIT9y1gEguwpBpdKyh6ezTiyuUS2fwcGGGip+fRsHSv2myTEdd
	8qWwR4r09/5x3D0qwBlQDBNhChmOha7JYPuCSUQ==
X-Gm-Gg: ASbGncvdGyWzJKmjtjfnij10X7QtIQ/kdC353kiBrYn9KmesP7ZB1d4KbTtOvwcB7Ei
	FLNFVfAEiCbBt0iupjxKpFl4PtBREdPoUQUCeAPTm2X5a62guf6+M7gUsDDR4kI/PZK1OTU+i7b
	zxf42XLltLGbsgqEVLM2B6kw==
X-Google-Smtp-Source: AGHT+IG5CojiMPqD+3LVaJqhX4dtC3cXYVTVgeGvgS8NfJTP8fbQ4itZWI/sDWYzXkemwRRsGAr0qvss0d8Qa9KqyBA=
X-Received: by 2002:a05:6820:4c85:b0:606:462:5d1a with SMTP id
 006d021491bc7-60828c9a2ecmr4149264eaf.2.1746701203595; Thu, 08 May 2025
 03:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250507135442.3439237-1-gerald.elder-vass@cloud.com> <94652153-99fe-47d8-84d5-cbf2865ad6e0@citrix.com>
In-Reply-To: <94652153-99fe-47d8-84d5-cbf2865ad6e0@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 8 May 2025 11:46:32 +0100
X-Gm-Features: ATxdqUFiSRuNSL6F40f6ViwbMKTWTLLcwzB3iXhIwG1lEVVVv2jXGRQtcBAXRbw
Message-ID: <CACHz=ZibS8UjMSaXmQQNEb4yoCsyGVi9=NkhiJeiHcd30TeRdQ@mail.gmail.com>
Subject: Re: [XEN PATCH v3] sbat: Add SBAT section to the Xen EFI binary
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>, xen-devel@lists.xenproject.org, 
	dpsmith@apertussolutions.com, marmarek@invisiblethingslab.com, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 9:52=E2=80=AFAM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 07/05/2025 2:54 pm, Gerald Elder-Vass wrote:
> > diff --git a/xen/arch/x86/efi/Makefile b/xen/arch/x86/efi/Makefile
> > index 24dfecfad184..75aa35870a9a 100644
> > --- a/xen/arch/x86/efi/Makefile
> > +++ b/xen/arch/x86/efi/Makefile
> > @@ -6,11 +6,17 @@ cmd_objcopy_o_ihex =3D $(OBJCOPY) -I ihex -O binary $=
< $@
> >  $(obj)/%.o: $(src)/%.ihex FORCE
> >       $(call if_changed,objcopy_o_ihex)
> >
> > +$(obj)/sbat.o: OBJCOPYFLAGS :=3D -I binary -O elf64-x86-64 --rename-se=
ction .data=3D.sbat,readonly,data,contents
> > +$(obj)/sbat.o: $(src)/sbat.sbat FORCE
> > +     $(call if_changed,objcopy)
> > +
>
> Doing a build locally with this, I've found two issues.  One is:
>
> > ld: warning: arch/x86/efi/sbat.o: missing .note.GNU-stack section impli=
es executable stack
> > ld: NOTE: This behaviour is deprecated and will be removed in a future =
version of the linker
> > ld: warning: arch/x86/efi/built_in.o: requires executable stack (becaus=
e the .note.GNU-stack section is executable)
> > ld: warning: arch/x86/built_in.o: requires executable stack (because th=
e .note.GNU-stack section is executable)
> > ld: warning: prelink.o: requires executable stack (because the .note.GN=
U-stack section is executable)
> > ld: warning: prelink.o: requires executable stack (because the .note.GN=
U-stack section is executable)
> > ld: warning: prelink.o: requires executable stack (because the .note.GN=
U-stack section is executable)
>
> which isn't a terribly good look on a "higher security" feature.  The
> easiest way to fix this is:
>
> $(obj)/sbat.o: OBJCOPYFLAGS :=3D -I binary -O elf64-x86-64 \
>         --rename-section .data=3D.sbat,readonly,data,contents \
>         --add-section .note.GNU-stack=3D/dev/null
>
> to add the required section.
>
>
>
> >  $(obj)/boot.init.o: $(obj)/buildid.o
> >
> >  $(call cc-option-add,cflags-stack-boundary,CC,-mpreferred-stack-bounda=
ry=3D4)
> >  $(addprefix $(obj)/,$(EFIOBJ-y)): CFLAGS_stack_boundary :=3D $(cflags-=
stack-boundary)
> >
> > +EFIOBJ-y +=3D sbat.o
>
> Also,
>
> > ld: warning: orphan section `.sbat' from `prelink.o' being placed in se=
ction `.sbat'
>
> This is because sbat.o is getting linked into the non-EFI build of Xen to=
o.
>
> I'm less sure how to go about fixing this.  There's no nice way I can
> see of of getting sbat.o only in the EFI build.  The other option is to
> discard it for the ELF build.
>

I don't see the point of having this section in the ELF file, it's
used only when in PE by secure boot.
It should not be hard to add it to the disard list. Specifically in
xen/include/xen/xen.lds.h file look at DISCARD_SECTIONS and
DISCARD_EFI_SECTIONS definitions (I think just add .sbat to the
DISCARD_EFI_SECTIONS list if EFI is not defined).

Frediano

