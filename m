Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F38984789
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 16:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802993.1213372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6Pb-0004uY-HQ; Tue, 24 Sep 2024 14:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802993.1213372; Tue, 24 Sep 2024 14:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st6Pb-0004sZ-Ej; Tue, 24 Sep 2024 14:21:07 +0000
Received: by outflank-mailman (input) for mailman id 802993;
 Tue, 24 Sep 2024 14:21:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CoXS=QW=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1st6PZ-0004sT-Hw
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 14:21:05 +0000
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [2607:f8b0:4864:20::c35])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b42dcfd-7a80-11ef-a0ba-8be0dac302b0;
 Tue, 24 Sep 2024 16:21:04 +0200 (CEST)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-5e5b57127e6so728376eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 07:21:04 -0700 (PDT)
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
X-Inumbo-ID: 3b42dcfd-7a80-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727187663; x=1727792463; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwGa/oAsjDyCsHtcRn8yyLmNGMkl95lkAVR3fc/D2KM=;
        b=DJbDfNNe6aumtsNKq1x8NNfFGpINov3wNU9YsTeDYBp/I/HEyxTxMtKeY1h4DPgd28
         h8L4z/j2enxRYp9fUW8Y6OR90+X1HBrC5PaCiRY+EE/xH5t34x7FgB/AP9AzkVwJtZyo
         0T5UwXFxNoWFAQm9MU9Xaa+oeOnnbAlrhLEeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727187663; x=1727792463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwGa/oAsjDyCsHtcRn8yyLmNGMkl95lkAVR3fc/D2KM=;
        b=uJHWngGZYBrqyZs7VHOketBVW9FU236r3Qma5/VkkHldAWcYcLq1HHnLKJYBSRu3rY
         2H2yw3PThhhMN4P1sHeYHQ92BC1lX0wRSp8cUwsmE0CARQ2qA0Qno+Q1Osx/FPEfiIug
         TM6aAUQHVbiYemhsutw+AXsbPAoeZPixIi+lTETDkpdmX4ACI2nTCNnxFNmPgy90YNe+
         YfkbKyAxckFAzO2+I/szZyEpVP55hBACaQfE1gOGCI4klzU8fJzLo1vqCHzUupUOvelq
         k6v4fq25HupymB1/UXPec6yAsgA5yAiYra1f1ydilGNqFoTnpi//+bK9pBLHsAZrfJ96
         OJ2A==
X-Gm-Message-State: AOJu0Yynv3lJWgHOjz8u7zjl82AGy7Brw/TPVUJmbyTWmyVUYlRVtUxa
	4PtPhzr+TuQJev0Zm1/w36Lp+Uc0NhY7/SfvsvZXSbzxYrgA0BjRKFkDIWXiUPEZlE98hs024bX
	oHnpZ5scnOraDOWdaChi8EiqAXDaaSQSupoj0DA==
X-Google-Smtp-Source: AGHT+IFvxWRBLsfCZON+/rK95cRACcU4soyj5JFAU9+dKLe9Zx8K+HqubhUQL1qsucnEx3ZnvqFlInckCtnnCLjvOM8=
X-Received: by 2002:a05:6820:1c85:b0:5e1:eba9:8fe7 with SMTP id
 006d021491bc7-5e58ba7251dmr7484902eaf.3.1727187663316; Tue, 24 Sep 2024
 07:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240924102811.86884-1-frediano.ziglio@cloud.com>
 <20240924102811.86884-5-frediano.ziglio@cloud.com> <8846df10-196f-48e2-8271-c5a57fba925d@citrix.com>
In-Reply-To: <8846df10-196f-48e2-8271-c5a57fba925d@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 24 Sep 2024 15:20:52 +0100
Message-ID: <CACHz=Zgfc4LRG05Q0Mo=Rimk02Z4oYH4eUjga7A9EPj=jk08hw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] x86/boot: Improve MBI2 structure check
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 3:15=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 24/09/2024 11:28 am, Frediano Ziglio wrote:
> > Tag structure should contain at least the tag header.
> > Entire tag structure must be contained inside MBI2 data.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/arch/x86/efi/parse-mbi2.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/efi/parse-mbi2.c b/xen/arch/x86/efi/parse-mbi=
2.c
> > index 6038f35b16..7efda8fab2 100644
> > --- a/xen/arch/x86/efi/parse-mbi2.c
> > +++ b/xen/arch/x86/efi/parse-mbi2.c
> > @@ -22,6 +22,7 @@ efi_parse_mbi2(uint32_t magic, const multiboot2_fixed=
_t *mbi)
> >      EFI_HANDLE ImageHandle =3D NULL;
> >      EFI_SYSTEM_TABLE *SystemTable =3D NULL;
> >      const char *cmdline =3D NULL;
> > +    const void *const mbi_end =3D (const void *)mbi + mbi->total_size;
> >      bool have_bs =3D false;
> >
> >      if ( magic !=3D MULTIBOOT2_BOOTLOADER_MAGIC )
> > @@ -30,7 +31,9 @@ efi_parse_mbi2(uint32_t magic, const multiboot2_fixed=
_t *mbi)
> >      /* Skip Multiboot2 information fixed part. */
> >      tag =3D _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN)=
);
> >
> > -    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size
> > +    for ( ; (const void *)(tag + 1) <=3D mbi_end
> > +            && tag->size >=3D sizeof(*tag)
> > +            && (const void *)tag + tag->size <=3D mbi_end
> >              && tag->type !=3D MULTIBOOT2_TAG_TYPE_END;
> >            tag =3D _p(ROUNDUP((unsigned long)((const void *)tag + tag->=
size),
> >                     MULTIBOOT2_TAG_ALIGN)) )
>
> I'd merge this into the previous patch.  There's no reason to keep it
> separate.
>
> Also a minor style note I forgot, &&'s on the end of the previous line
> please.
>

The reason is that the rationale is different.
The previous patch is converting assembly to C, this is improving.
Merging would make the conversion point void.

Frediano

