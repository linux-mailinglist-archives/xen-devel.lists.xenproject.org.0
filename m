Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED01997219
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 18:44:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814983.1228699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZnO-0000tM-SN; Wed, 09 Oct 2024 16:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814983.1228699; Wed, 09 Oct 2024 16:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syZnO-0000qm-Ox; Wed, 09 Oct 2024 16:44:18 +0000
Received: by outflank-mailman (input) for mailman id 814983;
 Wed, 09 Oct 2024 16:44:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hyzk=RF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1syZnN-0000qg-8z
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 16:44:17 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b8237158-865d-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 18:44:15 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a99543ab209so474447566b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 09:44:15 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5bb208sm678618966b.22.2024.10.09.09.44.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 09:44:14 -0700 (PDT)
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
X-Inumbo-ID: b8237158-865d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728492254; x=1729097054; darn=lists.xenproject.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF1mC6dUpqyV3/AMkbwuD/AWt/Qi6RwHYUDrGCUj7OQ=;
        b=fHKyKuxrbSGFltpnjJDq/Pe9kfrgLWXRuYmcWY0nuBqXE27pWeQi5AWewTGBP7TeIk
         kwIEGsxyIAVQFcxaCmxNuWiwUcLsOqFZVXJWQaDpJte7UwqJ4wXqLd+kI8LKMsctq/kN
         pixz+HGzCvZa4m9Sq4jUbba5HoR9y11XkAtVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728492254; x=1729097054;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kF1mC6dUpqyV3/AMkbwuD/AWt/Qi6RwHYUDrGCUj7OQ=;
        b=JdfUpy7VRaUcYyQq4wENwMPzu1sLRAHrAZ4vbh6EfdUm4Klu2mZ5v8pobp5b/gSzjb
         4Yb7ESKfkcJDa/bCNfozCGk9W42mbUXIcnV4ecDYjhXvr6K2q+dlo55L35oEFy1aQMXp
         /TKycfAkH+kTfQMPoqCAUhVc31nAfDXrWqBSMZPo+jTAe8SrByE64YDLqBUdBmMX/UMj
         v7NV1ePrHT4evJadrEVySkG9mBBSXuOkpCOpbF0RkzUH8Vhpi+BdOaTJitFulDaBnfEx
         p9lDb5ODGiqb/2efrgpGO4qbbXEJ3CTJUE9RoYMXwrNDhY3Wnab+MBYSsMiDEYvpj9Zn
         tzrg==
X-Forwarded-Encrypted: i=1; AJvYcCURQeK3Np9ES0Qa0gxWdq4eDyPBdjexTAQPadJ5oAzZNH5q5RVZ0r8g9FKn8AP+3nbrmIEp43KMoBk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyT/ebiehXj0vs37aeBC8bZCTRsazkeJQnDfXBpg6yvLw8ij+27
	ITSYkrX4cGuVC74zoLnQzlQEsIXCnRMaO8X6AlD4UtbSnPculxFRAynYqsza6r8=
X-Google-Smtp-Source: AGHT+IEiR3IOXx4r+RoG0Jva4MIY2Bbnp7/3w5pPel+6QUFdppbbHRCEmvtx9vPj1drvHFNsfHCW5g==
X-Received: by 2002:a17:907:940a:b0:a99:7492:c735 with SMTP id a640c23a62f3a-a998d18c14fmr232471566b.17.1728492254482;
        Wed, 09 Oct 2024 09:44:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Oct 2024 17:44:13 +0100
Message-Id: <D4RFD776JP2U.373W6D66DFGC6@cloud.com>
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Xen-devel"
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 04/11] xen/x86: Add supporting code for uploading
 LAPIC contexts during domain create
X-Mailer: aerc 0.18.2
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-5-alejandro.vallejo@cloud.com>
 <acb85f02-351d-4ca2-9fd2-276276ed1c8e@suse.com>
In-Reply-To: <acb85f02-351d-4ca2-9fd2-276276ed1c8e@suse.com>

On Wed Oct 9, 2024 at 2:28 PM BST, Jan Beulich wrote:
> On 01.10.2024 14:38, Alejandro Vallejo wrote:
> > If toolstack were to upload LAPIC contexts as part of domain creation i=
t
>
> If it were to - yes. But it doesn't, an peeking ahead in the series I als=
o
> couldn't spot this changing. Hence I don#t think I see why this change
> would be needed, and why ...

Patch 10 does. It's the means by which (in a rather roundabout way)
toolstack overrides vlapic->hw.x2apic_id.

>
> > would encounter a problem were the architectural state does not reflect
> > the APIC ID in the hidden state. This patch ensures updates to the
> > hidden state trigger an update in the architectural registers so the
> > APIC ID in both is consistent.
> >=20
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> >  xen/arch/x86/hvm/vlapic.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >=20
> > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > index 02570f9dd63a..a8183c3023da 100644
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -1640,7 +1640,27 @@ static int cf_check lapic_load_hidden(struct dom=
ain *d, hvm_domain_context_t *h)
> > =20
> >      s->loaded.hw =3D 1;
> >      if ( s->loaded.regs )
> > +    {
> > +        /*
> > +         * We already processed architectural regs in lapic_load_regs(=
), so
> > +         * this must be a migration. Fix up inconsistencies from any o=
lder Xen.
> > +         */
> >          lapic_load_fixup(s);
> > +    }
> > +    else
> > +    {
> > +        /*
> > +         * We haven't seen architectural regs so this could be a migra=
tion or a
> > +         * plain domain create. In the domain create case it's fine to=
 modify
> > +         * the architectural state to align it to the APIC ID that was=
 just
> > +         * uploaded and in the migrate case it doesn't matter because =
the
> > +         * architectural state will be replaced by the LAPIC_REGS ctx =
later on.
> > +         */
>
> ... a comment would need to mention a case that never really happens, thu=
s
> only risking to cause confusion.
>
> Jan

I assume the "never really happens" is about the same as the previous
paragraph? If so, the same answer applies.

About the lack of ordering in the migrate stream the code already makes no
assumptions as to which HVM context blob might appear first in the vLAPIC a=
rea.

I'm not sure why, but I assumed it may be different on older Xen.

>
> > +        if ( vlapic_x2apic_mode(s) )
> > +            set_x2apic_id(s);
> > +        else
> > +            vlapic_set_reg(s, APIC_ID, SET_xAPIC_ID(s->hw.x2apic_id));
> > +    }
> > =20
> >      hvm_update_vlapic_mode(v);
> > =20

Cheers,
Alejandro

