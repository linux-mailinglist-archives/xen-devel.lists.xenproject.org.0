Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D54094ED44
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2024 14:43:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.775467.1185676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUNs-0002m3-8e; Mon, 12 Aug 2024 12:42:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 775467.1185676; Mon, 12 Aug 2024 12:42:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sdUNs-0002kS-62; Mon, 12 Aug 2024 12:42:48 +0000
Received: by outflank-mailman (input) for mailman id 775467;
 Mon, 12 Aug 2024 12:42:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JhuI=PL=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sdUNq-0002kM-Me
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2024 12:42:46 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f2222b7-58a8-11ef-bc05-fd08da9f4363;
 Mon, 12 Aug 2024 14:42:45 +0200 (CEST)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5d5c324267aso2565154eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Aug 2024 05:42:45 -0700 (PDT)
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
X-Inumbo-ID: 5f2222b7-58a8-11ef-bc05-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723466564; x=1724071364; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRf+pPvCu+jn0xLuEppOz887jSyZYBS2gnlP85aMlwI=;
        b=CitaaBkDYqe0TyED5ebLVPsdU1AOs3vwCadbDzAweENtB6l5uMdGT3oNV/Z/CeCX3f
         I4TyQ5TOm3iKLFdjg52ROUNBcr3hum4d5SjkGC56phRs9ygl4HHOCHS6FssyaB41/h1H
         zbw9rTn6lRTHrQOtPE0GAdz4BX2rXvSAaNnGs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723466564; x=1724071364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRf+pPvCu+jn0xLuEppOz887jSyZYBS2gnlP85aMlwI=;
        b=EHPADhp3t2muN/qkse6XnM60TzKmAquhDYgSlI4fiuM2VHjYT0G1G7ar1dq5l9qWi0
         8Gg4hqRDlpDrfuYBma83pnAgiJ61l773U9ck+7DCoq/Ic2WkWfq/zj16Zn2cY58JHkyA
         +nK7XFaTaRetFpEgpvi91u4LdapT6lYbCBZaI9k6+OZddRqltehGjaz47jOl8qChs8Lz
         n0cEk/8/H1kLMYcV33+xoFoiXQyNtKnb0vaH4t5db/SLtDxBWc8xfugruXooZJcMteom
         EFcOlirPa3e+LxZjTs577TSlRKvF+YXRju5FBn6Lz560O6pEdhOj0kh+LKuRIKaVPthi
         BbgA==
X-Forwarded-Encrypted: i=1; AJvYcCWe4isEdMxrL2dy4pVYEgq8OU4bSSZq/T2ntSXfK+oPKPqupYdf0Z1YzOitJveopDc9h0zW2JnaEtbsuUAXKcshjeSPrhnysyo0sYsMaAA=
X-Gm-Message-State: AOJu0YwWPisThSSnS0xfDcqsMPiGbzYngJ9KlRIbVPh9EgjwOGfLzOjS
	cP7fNh9YbdFhQsda6GKAGWOtdLKPBVJYKG87R2va5Nv4GE/J8WQz7sYyZWICqQioBYjmUWn/EXY
	j0hFMxexci2prA+tSt+Xr+FPuSoeeBzeCixxemw==
X-Google-Smtp-Source: AGHT+IFkSC0Qd1NEe+qFZ1hFgfPoITDSZRrvnl8rgbOuPP7dakfmcW1VOoPu5uhEa6AxlG7lmGRrhuHliqCP/pykU6A=
X-Received: by 2002:a05:6820:2295:b0:5c4:e8d:58be with SMTP id
 006d021491bc7-5da687f9778mr330429eaf.3.1723466564243; Mon, 12 Aug 2024
 05:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-4-alejandro.vallejo@cloud.com> <cf819b39-6ce8-4446-b7b6-a1b247f45400@suse.com>
 <CACHz=ZgwPunPO771EbX1hKEdmXC1ysBQ7RzYK8K1pakyBS927A@mail.gmail.com>
 <7f0a7c9e-0cac-48ae-b7aa-5c90a1a5f4ca@suse.com> <CACHz=ZgCodGsFdyKe+F4gY3nAnymHLQ0T23CWSqauEhbm=Ubeg@mail.gmail.com>
 <14fc293a-4a0d-4de2-b468-bd0ef8c912b1@suse.com> <CACHz=Zj+LKKvPxTd8SGYthBTPiC6bEPrZg0nt=ehpOJ4JwqoiQ@mail.gmail.com>
 <bdc1083b-f6bd-4e4e-b56d-9e1fc09393e9@suse.com>
In-Reply-To: <bdc1083b-f6bd-4e4e-b56d-9e1fc09393e9@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 12 Aug 2024 13:42:33 +0100
Message-ID: <CACHz=Zj-ZFT=xXcVQS9opVLFvcSGFAGtCWHev+MXQHLwzCPdrQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] x86: Set xen_phys_start and trampoline_xen_phys_start earlier
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 9:41=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 09.08.2024 16:34, Frediano Ziglio wrote:
> > On Fri, Aug 9, 2024 at 3:02=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 09.08.2024 15:50, Frediano Ziglio wrote:
> >>> On Fri, Aug 9, 2024 at 1:59=E2=80=AFPM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>>
> >>>> On 09.08.2024 14:48, Frediano Ziglio wrote:
> >>>>> On Thu, Aug 8, 2024 at 9:25=E2=80=AFAM Jan Beulich <jbeulich@suse.c=
om> wrote:
> >>>>>> On 07.08.2024 15:48, Alejandro Vallejo wrote:
> >>>>>>> No reason to wait, if Xen image is loaded by EFI (not multiboot
> >>>>>>> EFI path) these are set in efi_arch_load_addr_check, but
> >>>>>>> not in the multiboot EFI code path.
> >>>>>>> This change makes the 2 code paths more similar and allows
> >>>>>>> the usage of these variables if needed.
> >>>>>>
> >>>>>> I'm afraid I'm struggling with any "similarity" argument here. Imo=
 it
> >>>>>> would be better what, if anything, needs (is going to need) either=
 or
> >>>>>> both of these set earlier. Which isn't to say it's wrong to do ear=
ly
> >>>>>> what can be done early, just that ...
> >>>>>>
> >>>>>
> >>>>> About similarity is that some part of EFI code expect xen_phys_star=
t
> >>>>> to be initialized so this change make sure that if in the future th=
ese
> >>>>> paths are called even for this case they won't break.
> >>>>>
> >>>>>>> --- a/xen/arch/x86/boot/head.S
> >>>>>>> +++ b/xen/arch/x86/boot/head.S
> >>>>>>> @@ -259,6 +259,11 @@ __efi64_mb2_start:
> >>>>>>>          jmp     x86_32_switch
> >>>>>>>
> >>>>>>>  .Lefi_multiboot2_proto:
> >>>>>>> +        /* Save Xen image load base address for later use. */
> >>>>>>> +        lea     __image_base__(%rip),%rsi
> >>>>>>> +        movq    %rsi, xen_phys_start(%rip)
> >>>>>>> +        movl    %esi, trampoline_xen_phys_start(%rip)
> >>>>>>
> >>>>>> ... this path is EFI only if I'm not mistaken, while ...
> >>>>>>
> >>>>>>> @@ -605,10 +610,6 @@ trampoline_setup:
> >>>>>>>           * Called on legacy BIOS and EFI platforms.
> >>>>>>>           */
> >>>>>>>
> >>>>>>> -        /* Save Xen image load base address for later use. */
> >>>>>>> -        mov     %esi, sym_esi(xen_phys_start)
> >>>>>>> -        mov     %esi, sym_esi(trampoline_xen_phys_start)
> >>>>>>
> >>>>>> ... the comment in context is pretty clear about this code also be=
ing
> >>>>>> used in the non-EFI case. It is, however, the case that %esi is 0 =
in
> >>>>>> that case. Yet surely you want to mention this in the description,=
 to
> >>>>>> clarify the correctness of the change.
> >>>>>
> >>>>> Restored this code.
> >>>>
> >>>> Was my analysis wrong then and it's actually needed for some specifi=
c
> >>>> case?
> >>>
> >>> Not clear to what exactly you are referring.
> >>> That later part of code (which was removed) is still needed in case o=
f no-EFI.
> >>
> >> Is it? Under what conditions would %esi be non-zero? As indicated by m=
y earlier
> >> reply, I think it would never be. In which case the two stores are poi=
ntless.
> >
> > I really don't follow, %esi at that point should be the address where
> > the executable is loader, which should not be zero.
>
> In the PVH entry point it'll be, but else? Note this code in setup.c:
>
>         /* Is the region suitable for relocating Xen? */
>         if ( !xen_phys_start && e <=3D limit )
>
> That relocating of Xen wouldn't happen if we stored a non-zero value in
> the default (xen.gz with grub1/2) case. Also take a look at Xen before
> the EFI/MB2 path was added. xen_phys_start wasn't even written from
> head.S at that time. And if it's for the PVH entry point alone, that
> code then would want moving into the CONFIG_PVH_GUEST section (if at all
> possible). Or, if the reason for the change really is "just in case",
> another option of course is to leave these two insn in the one central
> place they are at right now.
>

Hi,
  as I said I added back the lines in the original place too (I didn't
still send that update, I want to finish other changes you suggested).
The reason I added these lines is the usage in efi-boot.h, it has
nothing to do with PVH. Yes, at the moment that part of the code is
executed only on direct EFI program so it's not impacting these paths
but better safe than sorry.

> Jan

Frediano

