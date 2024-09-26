Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C11986FA2
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 11:10:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805061.1216074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkUX-0005xH-Jh; Thu, 26 Sep 2024 09:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805061.1216074; Thu, 26 Sep 2024 09:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stkUX-0005ut-Go; Thu, 26 Sep 2024 09:08:53 +0000
Received: by outflank-mailman (input) for mailman id 805061;
 Thu, 26 Sep 2024 09:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stkUV-0005uj-SQ
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 09:08:51 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1e3bb47-7be6-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 11:08:51 +0200 (CEST)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5e1c65eb68aso421677eaf.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 02:08:50 -0700 (PDT)
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
X-Inumbo-ID: f1e3bb47-7be6-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727341729; x=1727946529; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Le9fdhd3g0ArgJT91xsu+49foDOCmVvUu7lduUS8IO8=;
        b=B9oql0LFyG9DxhhR8POXipYbGkcHbVUTD18NPO1P6+XTATxsfiH2lT1ixFRpcAoR1H
         FQjBcUWdy0URVudnLIXSyFVKG5J4MdwleN6yLtAG+zsWZI4VGLN7s7s/+3x9xx1roQQX
         I7mEVqsaeHf0qXg2TJTheCN2x2NfuL4UcM0Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727341729; x=1727946529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le9fdhd3g0ArgJT91xsu+49foDOCmVvUu7lduUS8IO8=;
        b=o8FzgIsxhLVcnY5SbDNiZ64H0eQ5fMpCue81elo8TT4+qixsikrBOwOKPIpWaSegVy
         NLsiDRLvwmR4m55th3DEBkkz3z/3igE67AAKCLLopBTbXsAYfysrein+dTCs2DBrnKJo
         OJbg3GJTyHI6aOdtLxYoir0y8hMlF6+kzFiMevb+sGejMv7qJFbjIE/EA+6tiyuqVzRE
         ThVrUTDvAbSa5W+M0qfXUCSEihL/CtLVGwh7mvAXpQ9trz2ylcYabvlpto/Nd0zwbDQ4
         hh8x+6mu2HlCewtYecdGYykK5xbZXBRmHJ1OwoIB9T18USnH+dua8BhadcKClbLLWis0
         0JSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHprtmEF+3s9IscA+L7PEdVHpDT3Q8IQcLnle8v6l3jYuqiQ+pAzWt7HxCl8wCwamJ+KzJwNsRZzs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzqQec0Ppo0csqtAYxbiIztaAjD202bnCueo+3xwIi2mFIUHY5A
	oWyHmDkLH5QD1AzfJMDA88Kzm8Rza1RhOmVCgKiuWXMvNV4aG0oPI/tC7aKF3RrvcvVHpzBlnLi
	mksxalamXjAkS3EmeuS8S5Qozs0f6Px1AWYjqtg==
X-Google-Smtp-Source: AGHT+IGMfoaBm5dhmWR5DTIv4vbpRm7E60rnFDNNa8dEPSQnthsaX+UpR98AYuLWqAOAhSDuwQw65pOGhT2/guGmpjo=
X-Received: by 2002:a05:6820:50a:b0:5e3:b691:5ee4 with SMTP id
 006d021491bc7-5e5c6a6f733mr3686177eaf.3.1727341729692; Thu, 26 Sep 2024
 02:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240925060101.259244-1-frediano.ziglio@cloud.com>
 <20240925060101.259244-4-frediano.ziglio@cloud.com> <70416976-c18a-425d-95f0-ab218e101113@citrix.com>
 <2f14ad10-e863-4d7f-aab9-fbdc97154b1f@suse.com>
In-Reply-To: <2f14ad10-e863-4d7f-aab9-fbdc97154b1f@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 26 Sep 2024 10:08:38 +0100
Message-ID: <CACHz=ZgDff1BLhhrgFsZ8xZyhFCsGEhwq7R2kGGMzp9v9K-5=Q@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 7:58=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 25.09.2024 22:20, Andrew Cooper wrote:
> > On 25/09/2024 7:01 am, Frediano Ziglio wrote:
> >> +const char * asmlinkage __init
> >> +efi_multiboot2_prelude(uint32_t magic, const multiboot2_fixed_t *mbi)
> >> +{
> >> +    const multiboot2_tag_t *tag;
> >> +    EFI_HANDLE ImageHandle =3D NULL;
> >> +    EFI_SYSTEM_TABLE *SystemTable =3D NULL;
> >> +    const char *cmdline =3D NULL;
> >> +    bool have_bs =3D false;
> >> +
> >> +    if ( magic !=3D MULTIBOOT2_BOOTLOADER_MAGIC )
> >> +        return "ERR: Not a Multiboot2 bootloader!";
> >> +
> >> +    /* Skip Multiboot2 information fixed part. */
> >> +    tag =3D _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN=
));
> >> +
> >> +    for ( ; (const void *)tag - (const void *)mbi < mbi->total_size
> >> +            && tag->type !=3D MULTIBOOT2_TAG_TYPE_END;
> >
> > && on previous line.
> >
> > But, this can move into the switch statement and reduce the for()
> > expression somewhat.
>
> While it can in principle, it would require further adjustments to the
> loop body, which I'm uncertain would be desirable. I notice Frediano
> also didn't make any change in v5 for this particular comment. Frediano:
> As indicated before, sending a new version without addressing all
> comments isn't nice. If you don't agree with a comment and hence don't
> make a change requested, you will want to "address" the comment verbally.
>
> Jan

I was going to reply, then I forgot. Yes, I'm trying to reply and
address all comments. In this specific instance, for some reason while
I was addressing the others, I forgot this.

Frediano

