Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 998A291E3EF
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 17:22:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751809.1159883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIqe-0007rA-Du; Mon, 01 Jul 2024 15:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751809.1159883; Mon, 01 Jul 2024 15:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOIqe-0007oH-B7; Mon, 01 Jul 2024 15:21:44 +0000
Received: by outflank-mailman (input) for mailman id 751809;
 Mon, 01 Jul 2024 15:21:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VHQ6=OB=gmail.com=milandjokic1995@srs-se1.protection.inumbo.net>)
 id 1sOIqc-0007KJ-SK
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 15:21:42 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e394008-37bd-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 17:21:42 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-6b4febddfd3so16766926d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jul 2024 08:21:42 -0700 (PDT)
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
X-Inumbo-ID: 9e394008-37bd-11ef-90a5-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719847301; x=1720452101; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3XHp78JCEbA8g/B/rFJ5z9YEOkqtp4W2vM53xBiJrs=;
        b=nE49cO4ADQ41VH6DplvycccDV3t3m0L3N/8yW6+kAAdxhefe4seJrXJh59fnE4m7ka
         QO8NN3FPRBnrbNUBRteyAktR4WDx0j8SbL7Ty0Y6bsImS91hTxIUN6ZqVlYqGoPmNFPZ
         UXY03iR4wa+zT7cuvYp07i2/QUKWNwTrlPrS2r5f7E/25UJTu4ZHUIHF39iiewZcCzY8
         ehPO4Nkc3MCFEOXgQdKRtjON6b5Yqfs9QjrgByiZu2dByPJQcyJeF5lgu8JuL4WYavSJ
         7zhomlouKDDgg1VmDKjhsElqGm/bwwwQM69uq3j37wkVLpBCGaAtARK1TpTIzDZrb02v
         tnoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719847301; x=1720452101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3XHp78JCEbA8g/B/rFJ5z9YEOkqtp4W2vM53xBiJrs=;
        b=j2CJccg4Rabt70iktJlKdGKiZCdPCJn2Cn7GmJdr3w/pgg6KWzKNRFpJ68Nkb4VHHD
         EALZAZKqptcLA4MW8AlZJPnfAjkOAGW6YgfoNQBuAWewPvDppsKQ962aGso9n4fsYzXP
         9obYiS8NaIfGRETtIuPyCBYFSKeu1WSNPWStpwmCbUVyhl1Sf41x6bd61kHgQmhp+U+4
         HYeRoW05j7jv0rL+quH1u5oS77Et0afXi5NFl1OpiCj8J41bg8rzz/ywGNJNYryebOXT
         55BzLkCzyVj2zbQV/FgKWoW5GOG0qEcpiZVPrOTZK8LWy+G4wszca3U7IaYdNl2LNAn6
         13ig==
X-Forwarded-Encrypted: i=1; AJvYcCXmo5RV3k/8aRqCnwLw2bBCf7m1/gi28ELDkalgQ21llaGVKD2RXSKgSSBTNsgnC8auA43CzuGh0thZVV6H4v2QThGIBmcFFFBmkinSCDI=
X-Gm-Message-State: AOJu0YzciQS/k1NXA+iBe3N+jK25EUNx3pJMvr8ueykil8sW1s406OG7
	tKfiohudAw233TvG7rgtAa3cyhl9rft0iZNxDgFQsgDWe0MMrc1ZxmTAt4TisLxR+IQMsODi33E
	AK8hJrpUBtD72RkU3Ks7d3COYz5I=
X-Google-Smtp-Source: AGHT+IFCJPXCRJpnYEtnF7N5mzx9Ltq3FuLn/g/X+mL02usXSr/CHVH2YDfbFyG+sdRttPEvFGAo9yBqa6Kq5MalmKU=
X-Received: by 2002:a05:6214:ace:b0:6b0:6400:3b6f with SMTP id
 6a1803df08f44-6b5b7057b19mr78763396d6.8.1719847300841; Mon, 01 Jul 2024
 08:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <87b5e458498bbff2e54ac011a50ff1f9555c3613.1717354932.git.milan.djokic@rt-rk.com>
 <0e10ee9c215269b577321ba44f5d038a5eb299a7.1718193326.git.milan.djokic@rt-rk.com>
 <8112bee8-efdc-4db9-b0d4-58b160b4e923@suse.com> <DU5PR08MB103973ABF5E6F12853F5D24E1CEC12@DU5PR08MB10397.eurprd08.prod.outlook.com>
 <b508c1b8-1bdd-4378-a76d-7056452406d3@suse.com>
In-Reply-To: <b508c1b8-1bdd-4378-a76d-7056452406d3@suse.com>
From: =?UTF-8?B?TWlsYW4gxJBva2nEhw==?= <milandjokic1995@gmail.com>
Date: Mon, 1 Jul 2024 17:21:30 +0200
Message-ID: <CAKp59VGq08+wr3D-wJ_9VEGzv-Z0ThAU7TYqY6fcY-jUOh_bzA@mail.gmail.com>
Subject: Re: [PATCH] xen/riscv: PE/COFF image header for RISC-V target
To: Jan Beulich <jbeulich@suse.com>
Cc: Nikola Jelic <nikola.jelic@rt-rk.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	"milan.djokic" <Milan.Djokic@rt-rk.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 10:55=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 26.06.2024 18:16, Milan Djokic wrote:
> >> +config RISCV_EFI
> >> +     bool "UEFI boot service support"
> >> +     depends on RISCV_64
> >> +     default n
> >
> > Nit: This line can be omitted (and if I'm not mistaken we generally do =
omit
> > such).
> >
> > If we remove the default value, EFI header shall be included into xen i=
mage by default.
>
> Why's this? Or in other words, what are you deriving this from? Not speci=
fying
> a default implicitly means "n", from all I know.
>
My assumption regarding option value when default is not specified was
wrong. You're correct, we'll omit the default line.

>
> > Currently PE/COFF header is directly embedded into
> > head.S for arm/x86
> >
> >> +    char     name[8];                /* name or "/12\0" string tbl of=
fset */
> >
> > Why 12?
> >
> > Either section name is specified in this field or string table offset i=
f section name can't fit into 8 bytes, which is the case here.
>
> Well, yes, I'm certainly aware of that. But the question wasn't about the
> format, it was specifically about the hardcoded value 12. Why not 11 or 1=
3?
>
I've misinterpreted your original question here. I realize now that
this comment ("name or /12/0") is confusing (and incorrect). It was
taken over from linux kernel which on the other hand took this over
from pesign package,  so I assume that pesign had its own string table
layout and thus hardcoded 12 offset for its specific usecase. Since in
general we can have different offsets and even more than one (if e.g.
2 section names exceed 8-byte size) we'll change this comment not to
contain 12 offset hint.

>
> >> + * struct riscv_image_header - riscv xen image header
> >
> > You saying "xen": Is there anything Xen-specific in this struct?
> >
> > Not really related to xen, this is generic riscv PE image header, comme=
nt fixed in new version
> >
> >> +        .long   0                                       /* LoaderFlag=
s */
> >> +        .long   (section_table - .) / 8                 /* NumberOfRv=
aAndSizes */
> >> +        .quad   0                                       /* ExportTabl=
e */
> >> +        .quad   0                                       /* ImportTabl=
e */
> >> +        .quad   0                                       /* ResourceTa=
ble */
> >> +        .quad   0                                       /* ExceptionT=
able */
> >> +        .quad   0                                       /* Certificat=
ionTable */
> >> +        .quad   0                                       /* BaseReloca=
tionTable */
> >
> > Would you mind clarifying on what basis this set of 6 entries was
> > chosen?
> >
> > These fields and their sizes are defined in official PE format, see det=
ails from specification bellow
> >
> > [cid:542690de-3bb0-4708-a447-996a03277578]
>
> Again, I'm aware of the specification. Yet like the 12 above the 6 here
> looks arbitrarily chosen. There are more entries in this table which
> are permitted to be present (and well-defined). There could also be
> fewer of them; any absent entry is implicitly holding the value 0 afaia.
>
We can omit all of them since directories are not used at all in this
case. Even those 6 are set to 0 (which means not used according to
PE). One more case where we wanted to align with linux kernel / xen
arm implementation, but it is redundant in our case

> >> +/* Section table */
> >> +section_table:
> >> +        .ascii  ".text\0\0\0"
> >> +        .long   0
> >> +        .long   0
> >> +        .long   0                                       /* SizeOfRawD=
ata */
> >> +        .long   0                                       /* PointerToR=
awData */
> >> +        .long   0                                       /* PointerToR=
elocations */
> >> +        .long   0                                       /* PointerToL=
ineNumbers */
> >> +        .short  0                                       /* NumberOfRe=
locations */
> >> +        .short  0                                       /* NumberOfLi=
neNumbers */
> >> +        .long   IMAGE_SCN_CNT_CODE | \
> >> +                IMAGE_SCN_MEM_READ | \
> >> +                IMAGE_SCN_MEM_EXECUTE                   /* Characteri=
stics */
> >> +
> >> +        .ascii  ".data\0\0\0"
> >> +        .long   _end - xen_start                        /* VirtualSiz=
e */
> >> +        .long   xen_start - efi_head                    /* VirtualAdd=
ress */
> >> +        .long   __init_end_efi - xen_start              /* SizeOfRawD=
ata */
> >> +        .long   xen_start - efi_head                    /* PointerToR=
awData */
> >> +        .long   0                                       /* PointerToR=
elocations */
> >> +        .long   0                                       /* PointerToL=
ineNumbers */
> >> +        .short  0                                       /* NumberOfRe=
locations */
> >> +        .short  0                                       /* NumberOfLi=
neNumbers */
> >> +        .long   IMAGE_SCN_CNT_INITIALIZED_DATA | \
> >> +                IMAGE_SCN_MEM_READ | \
> >> +                IMAGE_SCN_MEM_WRITE                    /* Characteris=
tics */
> >
> > IOW no code and the entire image expressed as data. Interesting.
> > No matter whether that has a reason or is completely arbitrary, I
> > think it, too, wants commenting on.
> >
> > This is correct, currently we have extended image with PE/COFF (EFI) he=
ader which allows xen boot from EFI loader (or U-boot) environment. And the=
se updates are pure data. We are actively working on the implementation of =
Boot/Runtime services which shall be in the code section part and enable fu=
ll UEFI compatible xen application for riscv.
>
> Such a choice, even if transient, needs explaining in the description
> (or maybe even a code comment) then.
We'll clarify this part in code directly

>
> > Why does the blank line disappear? And why is ...
> >
> >>      . =3D ALIGN(POINTER_ALIGN);
> >>      __init_end =3D .;
> >
> > ... __init_end not good enough? (I think I can guess the answer, but
> > then I further think the name of the symbol is misleading. )
> >
> > Init_end_efi is used only when EFI sections are included into image.
>
> Again, my question was different: I asked why a symbol we have already
> isn't good enough, i.e. why another one needs adding.
>
Similar as for data directories fields above, _init_end_efi is also
redundant for RISC-V case, we'll use _init_end directly instead.

> > We have aligned with arm implementation here, you can take a look also =
there.
>
> And yet again, as per above, you need to be able to explain your decision=
s.
> You can't just say "it's done this way elsewhere as well". What if that
> "elsewhere" has an obvious or maybe just subtle bug?
This is perfectly clear. We'll restructure our changes in the next
version in that manner.

BR,
Milan

