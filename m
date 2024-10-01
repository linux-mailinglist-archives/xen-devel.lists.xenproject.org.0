Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D198B74E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 10:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807817.1219480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYSC-0004BG-39; Tue, 01 Oct 2024 08:41:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807817.1219480; Tue, 01 Oct 2024 08:41:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYSC-00048l-0A; Tue, 01 Oct 2024 08:41:56 +0000
Received: by outflank-mailman (input) for mailman id 807817;
 Tue, 01 Oct 2024 08:41:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i7H1=Q5=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1svYSA-00048f-Dh
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 08:41:54 +0000
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [2607:f8b0:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01db6d60-7fd1-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 10:41:53 +0200 (CEST)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-710d5d9aac1so2121968a34.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 01:41:53 -0700 (PDT)
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
X-Inumbo-ID: 01db6d60-7fd1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727772112; x=1728376912; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ooJkGzXfRVbKeOOteEuZ0xqFg0WE6wVrHlIQ3sOznq4=;
        b=jkCrfoRAJOLLGHPdLcvC7w2+xkEnGlN6AguxZCcuIgWEz674hfDT5syP6eL9ooqKbk
         rLASd3lgbR0J7V7NTrT51Irt/Vq65aBPda0duudt63Aj8SY0HdyhXdkAwD8yrq/uFcjz
         xB0SxPuoPSh+x/9XdV1KVohINQ2ABD5szUlPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727772112; x=1728376912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ooJkGzXfRVbKeOOteEuZ0xqFg0WE6wVrHlIQ3sOznq4=;
        b=mwjgoLFPJnFFQEEITJn5dikdLNyLb5FY5p4PL4epevz+1eEul3xdmK4yR9CLqz8pMw
         TpI0VcQb8O2ZozoG39237DuP8o+e9FBRAIorSyddrd7kLjO4qvwiIir/zeDwe5PhER8j
         /rBMhScFKBoifMNTp1e7WSh0M1vXYsH2RfzBtfaqN6q7LdDchh+YCGClp1fvK6fFCJki
         9mCfmE0AgMKa0+6dRGTVz6nrljzYheOmcR4pN4iSxOUp16tTjeKByxOvgkrpY2PzuFFJ
         nDdFXt+iUHvtQvr9Vx13qjrWJBtdRAQXGjr/wn/sfBdDxZoA0FTxDae/nJfdfTCfp3cF
         /kFg==
X-Forwarded-Encrypted: i=1; AJvYcCWdWQ01Z/HYEDrZfSeWZlTYPtCh6Akc+s0Da9C4oXXhO3xIoCWlpBB+RntvXaOSUj5nthX/k+NAAJ0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOiYP8lbcfcVvHVUz2UDS1sZpt3ypYoQUeBCBmvfyx8rroh8R8
	dGlWnL2IFQx+qk2Wqdarm/v5YFvEd2AseJE1KBTIvSk0/xi82jHWc6wHBjsRoT6vWJYBJciqoLy
	0VB80NUQMT6WzcpfGROHZX1i52fBeRMUeoOfwjg==
X-Google-Smtp-Source: AGHT+IE8pjum6ICxqJO3TXiRL/kIdvAgvpx7hd1TO0Q1JEwHHYbNMB+3064mlxw4LZKswt7I1Kx6hCu4VKKV7Xlks6A=
X-Received: by 2002:a05:6870:f695:b0:277:e7bc:69fd with SMTP id
 586e51a60fabf-28710a70e50mr7704699fac.13.1727772112177; Tue, 01 Oct 2024
 01:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240926092109.475271-1-frediano.ziglio@cloud.com>
 <20240926092109.475271-4-frediano.ziglio@cloud.com> <b68528a0-0e0b-4b8c-bd9d-b7d845905711@suse.com>
In-Reply-To: <b68528a0-0e0b-4b8c-bd9d-b7d845905711@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 1 Oct 2024 09:41:41 +0100
Message-ID: <CACHz=ZjwTJRwaSXf5GB5WPByxHy0unjZw0ysUNWFEkpm3VAwKg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] x86/boot: Improve MBI2 structure check
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 4:55=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 26.09.2024 11:21, Frediano Ziglio wrote:
> > --- a/xen/arch/x86/efi/parse-mbi2.c
> > +++ b/xen/arch/x86/efi/parse-mbi2.c
> > @@ -13,6 +13,7 @@ efi_multiboot2_prelude(uint32_t magic, const multiboo=
t2_fixed_t *mbi)
> >      EFI_HANDLE ImageHandle =3D NULL;
> >      EFI_SYSTEM_TABLE *SystemTable =3D NULL;
> >      const char *cmdline =3D NULL;
> > +    const void *const mbi_end =3D (const void *)mbi + mbi->total_size;
> >      bool have_bs =3D false;
> >
> >      if ( magic !=3D MULTIBOOT2_BOOTLOADER_MAGIC )
> > @@ -21,7 +22,9 @@ efi_multiboot2_prelude(uint32_t magic, const multiboo=
t2_fixed_t *mbi)
> >      /* Skip Multiboot2 information fixed part. */
> >      tag =3D _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN)=
);
> >
> > -    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size &&
> > +    for ( ; (const void *)(tag + 1) <=3D mbi_end &&
>
> It may be possible to argue away overflow concerns here. I'm not so sure =
though
> for the case ...
>

Do you mean tag + 1 ?
For the same reason, computing tag above could have an overflow.
If the caller pass invalid data range, we will have overflows in either cas=
e.

> > +            tag->size >=3D sizeof(*tag) &&
> > +            (const void *)tag + tag->size <=3D mbi_end &&
>
> ... here. The earlier logic subtracting pointers wasn't susceptible to su=
ch.
>
> Jan

Can you suggest a change ?

Frediano

