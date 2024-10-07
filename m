Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CCA992990
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 12:57:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.811921.1224614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxlQ4-0002Ap-MD; Mon, 07 Oct 2024 10:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 811921.1224614; Mon, 07 Oct 2024 10:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxlQ4-00029B-JB; Mon, 07 Oct 2024 10:56:52 +0000
Received: by outflank-mailman (input) for mailman id 811921;
 Mon, 07 Oct 2024 10:56:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aWQm=RD=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sxlQ2-000293-Vn
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 10:56:51 +0000
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [2607:f8b0:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9fe005f-849a-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 12:56:49 +0200 (CEST)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-71547c00de3so2208006a34.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 03:56:49 -0700 (PDT)
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
X-Inumbo-ID: d9fe005f-849a-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728298608; x=1728903408; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0T78XKq+HRxXQOqIXXjmBCiLh1IZoWrjBdx1HfgWpEc=;
        b=dwRw0NutDZ2cKpIJUOgf3PXdZnr99fBh1y0PkSv4Se3Name/wdZBctQG459AtdV5k5
         iP1GLePqvPWJ4xcVN2KAyvGkpQ3l2GU4+wwvgfdIZzpDg3p0nsK7cROMeRBeG5jq7J2G
         p1h0d6g2eIeXZWQqsLryYAWXa5FRX6Z42eltk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728298608; x=1728903408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0T78XKq+HRxXQOqIXXjmBCiLh1IZoWrjBdx1HfgWpEc=;
        b=RFcIbclDBtt5TXw80FXjBhZNY5Kn/UNqiwDIpEyxEZUWFP0SEgakSjl10D6DaMtatF
         rV9iz6/qz15aBHpQ5IAtT9PiPfuDNle8+QaKfrM8FAu3ZyCcU3gePpAk6rNq89LCo3dj
         eF8RR2IEnxkaoi6fvIyr2LxgzIM7V5Dfb7qqvxPepWlmavDoVWLWeeS7dzkGsClMITAb
         NrlrZ1F5BptktiUmUvhvst8lvvWj/fkXEKN002Iwd8794hSqvBxXrhxjAfE1NoC19kax
         ix1vKYgi1t12ZZtT/LunK1vC1Hy32eucoyCWobgHtxBHQMR7stLwjlo4mZbE6xdsXAw4
         JzKg==
X-Gm-Message-State: AOJu0YxEKe8SQfCFNVv7ADRmKGWGXrh2B3YwbxiBgRC+B+1ZxLL+4DgY
	Rt38p80DtvW95zh/DThZ0aTjB09nksI65p5Uqjq/ezJ+bBcaK9v0FqW1KF9Kcrtz4rIob5BN7aC
	tsj9iJL3GMcRUoyHk9lCHFPwY4+IzOfG223Mn9A==
X-Google-Smtp-Source: AGHT+IEeEjwFvSn0l2wxSlAl2D9YTFozdTG1nWwF59KskADYra4My/GR6ACYzN68Zx395cjF0IuthgTOuFzDY0SzQ5U=
X-Received: by 2002:a05:6870:b69e:b0:270:1fc6:18 with SMTP id
 586e51a60fabf-287c1d38cbfmr7915573fac.3.1728298608316; Mon, 07 Oct 2024
 03:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20241005080233.1248850-1-frediano.ziglio@cloud.com>
 <20241005080233.1248850-4-frediano.ziglio@cloud.com> <10890c99-f1ed-4e59-a86b-f79cb6065aa9@citrix.com>
 <CACHz=Zj=Bf9cXML1XcHYpC3wXi0A-wvYvy3DTSAVn4xtmOii6w@mail.gmail.com>
In-Reply-To: <CACHz=Zj=Bf9cXML1XcHYpC3wXi0A-wvYvy3DTSAVn4xtmOii6w@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 7 Oct 2024 11:56:37 +0100
Message-ID: <CACHz=ZigY-vWGK3vpBUVqBO5KGmKD+CZCAavyW+-FV1qZ=3Z9Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86/boot: Use boot_vid_info and trampoline_phys
 variables directly from C code
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 11:06=E2=80=AFAM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> On Sat, Oct 5, 2024 at 2:43=E2=80=AFPM Andrew Cooper <andrew.cooper3@citr=
ix.com> wrote:
> >
> > On 05/10/2024 9:02 am, Frediano Ziglio wrote:
> > > diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> > > index ade2c5c43d..dcda91cfda 100644
> > > --- a/xen/arch/x86/boot/head.S
> > > +++ b/xen/arch/x86/boot/head.S
> > > @@ -510,22 +510,10 @@ trampoline_setup:
> > >          mov     %esi, sym_esi(xen_phys_start)
> > >          mov     %esi, sym_esi(trampoline_xen_phys_start)
> > >
> > > -        /* Get bottom-most low-memory stack address. */
> > > -        mov     sym_esi(trampoline_phys), %ecx
> > > -        add     $TRAMPOLINE_SPACE,%ecx
> > > -
> > > -#ifdef CONFIG_VIDEO
> > > -        lea     sym_esi(boot_vid_info), %edx
> > > -#else
> > > -        xor     %edx, %edx
> > > -#endif
> > > -
> > >          /* Save Multiboot / PVH info struct (after relocation) for l=
ater use. */
> > > -        push    %edx                /* Boot video info to be filled =
from MB2. */
> > >          mov     %ebx, %edx          /* Multiboot / PVH information a=
ddress. */
> > > -        /*      reloc(magic/eax, info/edx, trampoline/ecx, video/stk=
) using fastcall. */
> > > +        /*      reloc(magic/eax, info/edx) using fastcall. */
> > >          call    reloc
> > > -        add     $4, %esp
> > >
> >
> > Please split this patch in two.  Just for testing sanity sake if nothin=
g
> > else.
> >
>
> Sorry, it's not clear how it should be split. What are the 2 parts ?
>

Never mind, understood, one variable per commit.

Frediano

