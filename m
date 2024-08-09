Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DCA94D197
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2024 15:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774782.1185201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scQ1P-00024U-Sf; Fri, 09 Aug 2024 13:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774782.1185201; Fri, 09 Aug 2024 13:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1scQ1P-00022F-Q1; Fri, 09 Aug 2024 13:51:11 +0000
Received: by outflank-mailman (input) for mailman id 774782;
 Fri, 09 Aug 2024 13:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmNo=PI=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1scQ1N-000229-S7
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2024 13:51:09 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a8ae2a2-5656-11ef-8776-851b0ebba9a2;
 Fri, 09 Aug 2024 15:51:03 +0200 (CEST)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5d5d077c60aso1088581eaf.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2024 06:51:03 -0700 (PDT)
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
X-Inumbo-ID: 6a8ae2a2-5656-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1723211462; x=1723816262; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j//DRd5ukK5XEt7F98pN8iEWJl+NH/GMZJIug/daUro=;
        b=OHfoV9lxxJi1xb8/LjplSKuGXL627Vnv6+eCrZSwVmt7XVTl0H3u0NAzru56YppjjJ
         4/MrvjV0lpNPJ8uf2aAbZomDtrPqWvT8cQl8H1yLGvGx6hMBf8pB9Yriyx3OTW2XHAyE
         jc7SBi2OjjKdIIV8om/r3T06PqQmbyhskMWJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723211462; x=1723816262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j//DRd5ukK5XEt7F98pN8iEWJl+NH/GMZJIug/daUro=;
        b=iLoLZbQH0ipu2K10abASmvG0yE0UYHLYBZaI5qqCDnsCtd5LpvgZ2Eb/uDmBUL9Njl
         Ybuhr7srY+VDeKqsuaUqrPSkXhWUkqv+SXmlo8DJFq2sp0EAb+FIrIffnmeJlFZaXzTk
         O5fDMZWV3Cf1PJZ37HbCs49qWmGTAPLk697C3c4+q1cZywpMiWhJLq/bYCKc4AHfTnOk
         AWZbM+BucaT+t+PVFoBXju5u+oWhXJWarQdvbfX3/Qxh6PZxCzH4AkqY8FyuY7X+C3lx
         cnjUoLuG8Ylvvs5SyDSTCGp88KhDqIrHXuWkDr0sS9EVMLGMX/wd11/CzkaF45ai8NWo
         MJ2w==
X-Forwarded-Encrypted: i=1; AJvYcCVN0eGk+jYe2Ly1B1MX2QuKFDs1uFhb0T19mZPqq7V7cnP8lGS+pVCH7MnaXZvxkR5tl08qtMUnM4oqUinuQlw9QK9U+bT9IglXdGE7Zeg=
X-Gm-Message-State: AOJu0YygQERzZe/90HTXD+8KO1xVmJKdjW0OU+qYf6/on/3hgpHcAxtH
	k3uasBK/QayDIm/F7zUcOsB3kLO8H3Xgtp2N3o1u8GmdeXC6O+waEBOZjwjWdCQ2B7AuDOe2fri
	jQzevU3M/J1V2CFRBQ9tg4nKHlcGSzrvObSDINA==
X-Google-Smtp-Source: AGHT+IEtqt5BhLC4LoEfKMkFw/9ncIwMtIfcfgF1YrgXPpXZGhAVWdvDDcv1dwhLOvMg701EVDv77Fya2z7wb677op4=
X-Received: by 2002:a05:6820:50c:b0:5c9:d9db:6a51 with SMTP id
 006d021491bc7-5d867695bd8mr2125282eaf.0.1723211461973; Fri, 09 Aug 2024
 06:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-4-alejandro.vallejo@cloud.com> <cf819b39-6ce8-4446-b7b6-a1b247f45400@suse.com>
 <CACHz=ZgwPunPO771EbX1hKEdmXC1ysBQ7RzYK8K1pakyBS927A@mail.gmail.com> <7f0a7c9e-0cac-48ae-b7aa-5c90a1a5f4ca@suse.com>
In-Reply-To: <7f0a7c9e-0cac-48ae-b7aa-5c90a1a5f4ca@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 9 Aug 2024 14:50:51 +0100
Message-ID: <CACHz=ZgCodGsFdyKe+F4gY3nAnymHLQ0T23CWSqauEhbm=Ubeg@mail.gmail.com>
Subject: Re: [PATCH 3/5] x86: Set xen_phys_start and trampoline_xen_phys_start earlier
To: Jan Beulich <jbeulich@suse.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 9, 2024 at 1:59=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 09.08.2024 14:48, Frediano Ziglio wrote:
> > On Thu, Aug 8, 2024 at 9:25=E2=80=AFAM Jan Beulich <jbeulich@suse.com> =
wrote:
> >> On 07.08.2024 15:48, Alejandro Vallejo wrote:
> >>> No reason to wait, if Xen image is loaded by EFI (not multiboot
> >>> EFI path) these are set in efi_arch_load_addr_check, but
> >>> not in the multiboot EFI code path.
> >>> This change makes the 2 code paths more similar and allows
> >>> the usage of these variables if needed.
> >>
> >> I'm afraid I'm struggling with any "similarity" argument here. Imo it
> >> would be better what, if anything, needs (is going to need) either or
> >> both of these set earlier. Which isn't to say it's wrong to do early
> >> what can be done early, just that ...
> >>
> >
> > About similarity is that some part of EFI code expect xen_phys_start
> > to be initialized so this change make sure that if in the future these
> > paths are called even for this case they won't break.
> >
> >>> --- a/xen/arch/x86/boot/head.S
> >>> +++ b/xen/arch/x86/boot/head.S
> >>> @@ -259,6 +259,11 @@ __efi64_mb2_start:
> >>>          jmp     x86_32_switch
> >>>
> >>>  .Lefi_multiboot2_proto:
> >>> +        /* Save Xen image load base address for later use. */
> >>> +        lea     __image_base__(%rip),%rsi
> >>> +        movq    %rsi, xen_phys_start(%rip)
> >>> +        movl    %esi, trampoline_xen_phys_start(%rip)
> >>
> >> ... this path is EFI only if I'm not mistaken, while ...
> >>
> >>> @@ -605,10 +610,6 @@ trampoline_setup:
> >>>           * Called on legacy BIOS and EFI platforms.
> >>>           */
> >>>
> >>> -        /* Save Xen image load base address for later use. */
> >>> -        mov     %esi, sym_esi(xen_phys_start)
> >>> -        mov     %esi, sym_esi(trampoline_xen_phys_start)
> >>
> >> ... the comment in context is pretty clear about this code also being
> >> used in the non-EFI case. It is, however, the case that %esi is 0 in
> >> that case. Yet surely you want to mention this in the description, to
> >> clarify the correctness of the change.
> >
> > Restored this code.
>
> Was my analysis wrong then and it's actually needed for some specific
> case?
>

Not clear to what exactly you are referring.
That later part of code (which was removed) is still needed in case of no-E=
FI.

> Jan

Frediano

