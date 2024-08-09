Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FE494D243
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 16:36:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774805.1185222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scQhl-00013t-8Q; Fri, 09 Aug 2024 14:34:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774805.1185222; Fri, 09 Aug 2024 14:34:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scQhl-00011l-5O; Fri, 09 Aug 2024 14:34:57 +0000
Received: by outflank-mailman (input) for mailman id 774805;
 Fri, 09 Aug 2024 14:34:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmNo=PI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1scQhj-00011f-Mw
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 14:34:55 +0000
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [2607:f8b0:4864:20::c36])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a3ace1f-565c-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 16:34:53 +0200 (CEST)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-5c6661bca43so1291684eaf.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 07:34:53 -0700 (PDT)
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
X-Inumbo-ID: 8a3ace1f-565c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723214092; x=1723818892; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzpK0xgMKwkpzfCOIQ+958spoM/lZq4IA6DXOycC8wE=;
        b=fa+4+bJtUnCMqk/tUtiKIquIAwXO1nXXoSOaN7fF2YtrYwiGVnb6k0qFkqgssdzPmc
         Ug6QvGGu98F8zFmE0Y9tqcT2hXwkJ2HSL/Hqb8vMnUEzcelvGfW7dJPqfiphHy6xLMe1
         0jnkA0Wy0SUEUOyLVhFcnMbjEzr29CWFKaByI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723214092; x=1723818892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzpK0xgMKwkpzfCOIQ+958spoM/lZq4IA6DXOycC8wE=;
        b=JPd+l5bUPS7H6k6cvAKMmI/bBhWkGHxsoJu5JE5sjk1gmRootQ00aP9PZM9jqrrfzI
         1Dph6zX7w5rHuNK6g1UEJYS/yxbvF/6qexStidTSohC9FsFl+ofPzk/IS3iIL25cPaWF
         qXKnp69GEf83EGTuX/9pErx47NUqHuK/XuhcRuTwjukPbncL1CFRppH8FTHVEbmp5AZC
         61PU6/C01LvPG+ts8WL84kHaWi0O+ughoCJCbumkOMHkPSeskC4d7na4KEbt5l4WZmJ9
         QRNUfTf4nvmWn/zgiTS83hciWWNqezgHRrPzqj1AggyrXAJGMW6ZMOBYMPi68ZeuwwUy
         8zkw==
X-Forwarded-Encrypted: i=1; AJvYcCW/VUTAI8KX+yxMnj8eEopLO/iXA6sUyMlRo8wOYRx0K33BIWTWWgAqbz9is6Tek/VTJJreMk7F2VqXJY+pZqVAcanbrcOgCp4rfLFxPR8=
X-Gm-Message-State: AOJu0YyRqelN5Z3CDJSsHrkja9ugz9emz2qr8Qlgq0NjbeW5cupb02Sj
	eOG+/rWKj5SIpPubHpVUQhkGG19lhhhDWvlV4XQmZ0fONpgFMMycX9BV3gnB229Cc7j4r//s8Nf
	L2zcE7sREzMUm+CidUNUeZEfQ7DwuB+XrE4Q1/g==
X-Google-Smtp-Source: AGHT+IHFMeeWzBYSYzsRzV4lob2pHzz9MapgCIl9rIlSW3F0fzjNOeBV2UBJZ7wENQ8BVtmXgAKfoH0DI/ZRAcyK9To=
X-Received: by 2002:a05:6820:1624:b0:5d8:2f32:1844 with SMTP id
 006d021491bc7-5d871b74d5amr2258531eaf.6.1723214092224; Fri, 09 Aug 2024
 07:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-4-alejandro.vallejo@cloud.com> <cf819b39-6ce8-4446-b7b6-a1b247f45400@suse.com>
 <CACHz=ZgwPunPO771EbX1hKEdmXC1ysBQ7RzYK8K1pakyBS927A@mail.gmail.com>
 <7f0a7c9e-0cac-48ae-b7aa-5c90a1a5f4ca@suse.com> <CACHz=ZgCodGsFdyKe+F4gY3nAnymHLQ0T23CWSqauEhbm=Ubeg@mail.gmail.com>
 <14fc293a-4a0d-4de2-b468-bd0ef8c912b1@suse.com>
In-Reply-To: <14fc293a-4a0d-4de2-b468-bd0ef8c912b1@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 9 Aug 2024 15:34:41 +0100
Message-ID: <CACHz=Zj+LKKvPxTd8SGYthBTPiC6bEPrZg0nt=ehpOJ4JwqoiQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] x86: Set xen_phys_start and trampoline_xen_phys_start earlier
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 3:02=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 09.08.2024 15:50, Frediano Ziglio wrote:
> > On Fri, Aug 9, 2024 at 1:59=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> >>
> >> On 09.08.2024 14:48, Frediano Ziglio wrote:
> >>> On Thu, Aug 8, 2024 at 9:25=E2=80=AFAM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>> On 07.08.2024 15:48, Alejandro Vallejo wrote:
> >>>>> No reason to wait, if Xen image is loaded by EFI (not multiboot
> >>>>> EFI path) these are set in efi_arch_load_addr_check, but
> >>>>> not in the multiboot EFI code path.
> >>>>> This change makes the 2 code paths more similar and allows
> >>>>> the usage of these variables if needed.
> >>>>
> >>>> I'm afraid I'm struggling with any "similarity" argument here. Imo i=
t
> >>>> would be better what, if anything, needs (is going to need) either o=
r
> >>>> both of these set earlier. Which isn't to say it's wrong to do early
> >>>> what can be done early, just that ...
> >>>>
> >>>
> >>> About similarity is that some part of EFI code expect xen_phys_start
> >>> to be initialized so this change make sure that if in the future thes=
e
> >>> paths are called even for this case they won't break.
> >>>
> >>>>> --- a/xen/arch/x86/boot/head.S
> >>>>> +++ b/xen/arch/x86/boot/head.S
> >>>>> @@ -259,6 +259,11 @@ __efi64_mb2_start:
> >>>>>          jmp     x86_32_switch
> >>>>>
> >>>>>  .Lefi_multiboot2_proto:
> >>>>> +        /* Save Xen image load base address for later use. */
> >>>>> +        lea     __image_base__(%rip),%rsi
> >>>>> +        movq    %rsi, xen_phys_start(%rip)
> >>>>> +        movl    %esi, trampoline_xen_phys_start(%rip)
> >>>>
> >>>> ... this path is EFI only if I'm not mistaken, while ...
> >>>>
> >>>>> @@ -605,10 +610,6 @@ trampoline_setup:
> >>>>>           * Called on legacy BIOS and EFI platforms.
> >>>>>           */
> >>>>>
> >>>>> -        /* Save Xen image load base address for later use. */
> >>>>> -        mov     %esi, sym_esi(xen_phys_start)
> >>>>> -        mov     %esi, sym_esi(trampoline_xen_phys_start)
> >>>>
> >>>> ... the comment in context is pretty clear about this code also bein=
g
> >>>> used in the non-EFI case. It is, however, the case that %esi is 0 in
> >>>> that case. Yet surely you want to mention this in the description, t=
o
> >>>> clarify the correctness of the change.
> >>>
> >>> Restored this code.
> >>
> >> Was my analysis wrong then and it's actually needed for some specific
> >> case?
> >
> > Not clear to what exactly you are referring.
> > That later part of code (which was removed) is still needed in case of =
no-EFI.
>
> Is it? Under what conditions would %esi be non-zero? As indicated by my e=
arlier
> reply, I think it would never be. In which case the two stores are pointl=
ess.
>

I really don't follow, %esi at that point should be the address where
the executable is loader, which should not be zero.

> Jan

Frediano

