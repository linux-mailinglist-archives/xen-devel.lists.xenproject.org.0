Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59BE857ADB
	for <lists+xen-devel@lfdr.de>; Fri, 16 Feb 2024 12:03:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682154.1061244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ravzw-0001VP-6Y; Fri, 16 Feb 2024 11:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682154.1061244; Fri, 16 Feb 2024 11:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ravzw-0001TZ-1q; Fri, 16 Feb 2024 11:03:16 +0000
Received: by outflank-mailman (input) for mailman id 682154;
 Fri, 16 Feb 2024 11:03:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=acXU=JZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1ravzu-0001Sd-N2
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2024 11:03:14 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa0d7ace-ccba-11ee-98f5-efadbce2ee36;
 Fri, 16 Feb 2024 12:03:12 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51299d29e43so140550e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 16 Feb 2024 03:03:12 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f28-20020a19381c000000b0051170288d38sm400327lfa.283.2024.02.16.03.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 03:03:11 -0800 (PST)
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
X-Inumbo-ID: fa0d7ace-ccba-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708081392; x=1708686192; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fLS8S8ekIxJIKVao0IBPUqeI/r1LHe8DxXuJUiEO4iI=;
        b=OcL+W/I7uQg3AMCQATNYwiI4VNY/Q8qqxM2K2zorprWpJbV1lfXHVxFk+C31720NZQ
         mwDkqThMy6+WT3pdr8FPnNgiPUIR6Y8vRlMrmo2gr4Q5QA1gp3/KQDBqh7nVhT5jG6LS
         SnyniRYwHZkSXvecS8NMNk82loI0ReOsqsJjdsg+ZjCuRQoUDiJbI96PC+CzIfjVnYUH
         oiZV3CbXWEKX0j/xrwEfhrVxwngvf4BAhk+bVhl0jNSqOgJotL1Lmfr52nAa2yFoh8wO
         txKQbEaIQhPMQPYSBVzNRw6ho/0YWwAaOt1geKPmau3phVH1xpJpQZo97cu16KfAcBk4
         Q1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708081392; x=1708686192;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fLS8S8ekIxJIKVao0IBPUqeI/r1LHe8DxXuJUiEO4iI=;
        b=RHfRMKcHsdn4TG4lWJoUqxu6r9eDqncacenC+MBhCSrAiPURAx563imnXd/ext/3nl
         U/XytDl4bz7WxxnTrBTZl984EtmMvWDSVygTf8NRJchNgXM6UcoLSGnFSsnFWRNqyi66
         Wy6S/UU958FsL8HwU9gJ4Nk0iEsYDlE/diY9/mUN7A1j9+T3LMqn0O4/DM/bj8neHQi1
         h37pGbzugF0tik05JVkuctGQuMK1/NN4e11/qPgPl0LP9xEH808UUn/2kTsnK8zeHlYB
         SioKfFm9kYc/m433bUJ2NqsnvP6HwRn4jNsQV/YWp3I9I5lNxSIrjm+yV1mNjX4nhOuS
         BoSw==
X-Forwarded-Encrypted: i=1; AJvYcCVc9QkzuBDBy6w4xJuR91NrmHd8AOeIAA0fVP5c93u6emeN7R5ZlAWnUzka/oc9j3oN1E3KmcgjRSG/Zfpp3wY/aKgnYiEZ1dg8dTUbPHI=
X-Gm-Message-State: AOJu0YxsTA9vp9F93gHR3HGlDlPg5SFz8sEUMAfw5xvwlunkKm3C/Akh
	vNLuMpI16NCd6kxSv1e3O7ChaFUt+pfl3JVfWCNuGgm7RUrETQtu
X-Google-Smtp-Source: AGHT+IFIALv/eSMii5RtwMGMIpGeh7ok53EHmrDx2uBdkR1Ie+RkP61fhye7sgjVo/975dvA9cI77g==
X-Received: by 2002:a19:2d43:0:b0:511:7b37:1d26 with SMTP id t3-20020a192d43000000b005117b371d26mr3599033lft.13.1708081391896;
        Fri, 16 Feb 2024 03:03:11 -0800 (PST)
Message-ID: <6339742ea1a26c9808b108a1282e521dcf0fc9d0.camel@gmail.com>
Subject: Re: [PATCH v4 26/30] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 16 Feb 2024 12:03:10 +0100
In-Reply-To: <6f5e7e21-067e-4323-88bc-f9b5975e95c5@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <369fe9e80d11c5e499810a6819fc1c282ce60628.1707146506.git.oleksii.kurochko@gmail.com>
	 <6f5e7e21-067e-4323-88bc-f9b5975e95c5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } free;
> > +=C2=A0=C2=A0=C2=A0 } u;
> > +
> > +=C2=A0=C2=A0=C2=A0 union {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Page is in use, but not =
as a shadow. */
>=20
> I'm also pretty sure I asked before what shadow this comment alludes
> to.
I missed your request about 'shadow' before.

The comment arrived from Arm.

I tried to find out the answer by investigation how 'inuse' is used,
and, unfortunately, I couldn't find an answer what 'shadow' alludes to.

>=20
> > +/*
> > + * Common code requires get_page_type and put_page_type.
> > + * We don't care about typecounts so we just do the minimum to
> > make it
> > + * happy.
> > + */
> > +static inline int get_page_type(struct page_info *page, unsigned
> > long type)
> > +{
> > +=C2=A0=C2=A0=C2=A0 return 1;
> > +}
> > +
> > +static inline void put_page_type(struct page_info *page)
> > +{
> > +}
> > +
> > +static inline void put_page_and_type(struct page_info *page)
> > +{
> > +=C2=A0=C2=A0=C2=A0 put_page_type(page);
> > +=C2=A0=C2=A0=C2=A0 put_page(page);
> > +}
> > +
> > +/*
> > + * RISC-V does not have an M2P, but common code expects a handful
> > of
> > + * M2P-related defines and functions. Provide dummy versions of
> > these.
> > + */
> > +#define INVALID_M2P_ENTRY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (~=
0UL)
> > +#define SHARED_M2P_ENTRY=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (~0UL - 1UL)
> > +#define SHARED_M2P(_e)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((_e) =3D=3D SHARED_M2P_ENTRY)
> > +
> > +#define set_gpfn_from_mfn(mfn, pfn) do { (void)(mfn), (void)(pfn);
> > } while (0)
> > +#define mfn_to_gfn(d, mfn) ((void)(d), _gfn(mfn_x(mfn)))
> > +
> > +#define PDX_GROUP_SHIFT (16 + 5)
>=20
> Where are these magic numbers coming from? None of the other three
> architectures use literal numbers here, thus making clear what
> values are actually meant. If you can't use suitable constants,
> please add a comment.
This numbers are incorrect for RISC-V, it should be 12 + 9 ( PAGE_SHIFT
+ VPN_BITS ).
I did some comparision of how some macros are defined in PPC and missed
to update that.

~ Oleksii


