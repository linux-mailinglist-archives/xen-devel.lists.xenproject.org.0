Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D109B6124
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 12:11:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828093.1242912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66bE-0000nu-4w; Wed, 30 Oct 2024 11:10:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828093.1242912; Wed, 30 Oct 2024 11:10:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66bE-0000kk-21; Wed, 30 Oct 2024 11:10:52 +0000
Received: by outflank-mailman (input) for mailman id 828093;
 Wed, 30 Oct 2024 11:10:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXHf=R2=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t66bC-0000ip-CD
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 11:10:50 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c0f2822-96af-11ef-a0c3-8be0dac302b0;
 Wed, 30 Oct 2024 12:10:46 +0100 (CET)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-5eba450531eso402600eaf.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 04:10:46 -0700 (PDT)
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
X-Inumbo-ID: 9c0f2822-96af-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMmIiLCJoZWxvIjoibWFpbC1vbzEteGMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjljMGYyODIyLTk2YWYtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjg2NjQ2LjIzOTEzNSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730286645; x=1730891445; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ej99+fg7TCmiUOQgK81G5nalwlcA0KI6JWULKjI2mcU=;
        b=b+qgfH9Z4WJkrcbMZAZzhEO5D9E8QOUnvvGgWsjXL1LoMPVHf4IrMKCiYrBuN8ixvg
         YNgeNDcC1tEPSZniGu3/hRRQ0shjdvf3fwHTCl1MXkEKzZTnyniifiAutTba1o2oB/YV
         rplN2SLaYOhPcJpPSZu65n0EBqhEwGtNV9GRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286645; x=1730891445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ej99+fg7TCmiUOQgK81G5nalwlcA0KI6JWULKjI2mcU=;
        b=eEt67v64vFUpO8ITELOZby1luHHQ7NfZiRpUhsmjMQyrQ8LehxzDAXUqJzPqtykf63
         3ge5oXhelOz9Ow3xttsV11Y7GzOFzS13/qmNa2c1Bss9N9Z1gaQF0utYPMYMGTdXkyHB
         B5PavCqdQvxpX55zJHstn4MS/A0YJafm9h7lT3t/rmA7us4uH3Gnx13hK6EIm4P848jX
         zIfukpViQCJ2Uvab70cyc33agbRkZgdQdlPOL5ZZoqgE8J8M8JDz+l7MBJ6WLR9+vIj9
         IYyRF+ByMBkBiFHfdEtvFkbCb7gr+/76yxG3Hp1NxvN16iVX38bufSHqBR7nqljK0oAp
         yAOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTS2xs4RHdVAuoHuukfmGw0JcqgvLsxMgpYGIGNwpYPh/893HLvucwohnoKS7Puz0Es37JmkIhCEk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzawc2nbet4fH/1gPJSViLt1OFNrF5r6zIf5fatPa96ShdVtln+
	2Mf+QdRycwUeBcQ5PorpPc4PrVslkWJ6tTIMUmfQsew1vbNw4mwdCgCncaVQEDqTC4UTwT6k3+r
	AahgOkv3quF8GqEXM2CdNkagMknksMCo6HeXfGA==
X-Google-Smtp-Source: AGHT+IHOD5j3KTVxZOixxjNBhLOoqbh33wIKpqmnABhiSNaQzHpmsKNGaGkVdnVPHEO4L4ex1VyYseuCI0+rtyHCdXI=
X-Received: by 2002:a05:6820:1ac9:b0:5dc:99d3:d3bc with SMTP id
 006d021491bc7-5ec54dbb645mr2905645eaf.3.1730286644818; Wed, 30 Oct 2024
 04:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241030104406.2173357-2-frediano.ziglio@cloud.com> <6a7bd508-99af-4602-86aa-f46d718e36c2@suse.com>
In-Reply-To: <6a7bd508-99af-4602-86aa-f46d718e36c2@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 30 Oct 2024 11:10:33 +0000
Message-ID: <CACHz=ZixwA4aW3RAsusb=NjR6funSTXDCyViSJRSqjM5N_114Q@mail.gmail.com>
Subject: Re: [PATCH] x86/mm: Use standard C types for sized integers
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 11:02=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 30.10.2024 11:44, Frediano Ziglio wrote:
> > The header is already using these types.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>

Thanks

> Nevertheless I wonder whether ...
>
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -230,7 +230,7 @@ struct page_info
> >           * Only valid for: a) free pages, and b) pages with zero type =
count
> >           * (except page table pages when the guest is in shadow mode).
> >           */
> > -        u32 tlbflush_timestamp;
> > +        uint32_t tlbflush_timestamp;
> >
> >          /*
> >           * When PGT_partial is true then the first two fields are vali=
d and
> > @@ -284,8 +284,8 @@ struct page_info
> >           *   in use.
> >           */
> >          struct {
> > -            u16 nr_validated_ptes:PAGETABLE_ORDER + 1;
> > -            u16 :16 - PAGETABLE_ORDER - 1 - 1;
> > +            uint16_t nr_validated_ptes:PAGETABLE_ORDER + 1;
> > +            uint16_t :16 - PAGETABLE_ORDER - 1 - 1;
> >              uint16_t partial_flags:1;
>
> ... fixed width types are really needed here; afaict unsigned int ought t=
o do.
>

Not for gcc/clang. Other compilers (like MS one) differs... in our
case this is not a public header and we only support gcc/clang so
unsigned/int would be the same.

> >              int16_t linear_pt_count;
>
> It's only here where the fixed width type is largely needed (or alternati=
vely
>
>             signed int linear_pt_count:16;
>

That would be different. Compilers do not allow to take addresses of bit-fi=
elds.

> ).
>
> Jan

Frediano

