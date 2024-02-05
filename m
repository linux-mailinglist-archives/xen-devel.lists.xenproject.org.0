Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27012849ADC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 13:49:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676010.1051747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyPX-00023O-IZ; Mon, 05 Feb 2024 12:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676010.1051747; Mon, 05 Feb 2024 12:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWyPX-00020V-Dt; Mon, 05 Feb 2024 12:49:19 +0000
Received: by outflank-mailman (input) for mailman id 676010;
 Mon, 05 Feb 2024 12:49:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rWyPV-00020P-CS
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 12:49:17 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f79eae0f-c424-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 13:49:14 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a2f79e79f0cso589791166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 04:49:14 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 lj8-20020a170907188800b00a37409166fasm3154725ejc.132.2024.02.05.04.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 04:49:13 -0800 (PST)
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
X-Inumbo-ID: f79eae0f-c424-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707137354; x=1707742154; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9tU6iOL9zEo+jHOFaAz1pgjQhaSWOvDWsIx7kDUWXzU=;
        b=Ux1BV8WsHiolyafynxGmUZoI8df+L9+JLoVfRLX5XTggGxFXNk/v1VM+C5FeKZf90X
         M1JNVFyf2B5UBzT2WmLkXafM/bHD2mmZZXBp1AO4k5E4RabQ7x6VtDFHnnPs9ACNmXAA
         u/oH30ygZ84qVd8MPwtHzSJIIdLZAol71en3caB93bXnTC4dAqzFjFkNkiKVa5Gcq2YZ
         gIJZxa2tLFMFOBtsA1UBc6zsAfLat128vVZIXoJisamMdnCTGJNx3NgGdDVXlDZ0tmQi
         ISIGsu1dNG8v574Dc5coLTGvEoF88McjnCMnaFwPpqRDsS5WaA05Td3aPlVUwyu1XX8w
         59JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137354; x=1707742154;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9tU6iOL9zEo+jHOFaAz1pgjQhaSWOvDWsIx7kDUWXzU=;
        b=cGX5I0yG/WWbTjTB/mWQ/rPkzwQb79PeyThcwvrrc08rmsmH/fnhbPFb5i0YEu/lr7
         a0cze1z3HJ4CPED5eAY1SwjAcX8t/0o5qxWwjVXlmYrygWIjxIoubJSBPMOVn668G+dP
         zUFzaK6UwZ4N2y/MoI6Vks8EKLRiJm2FIPMvXCMI/rtzB6lFAJ9mOuu/HokuDy+S4h+j
         BejkWWdXotAtarX/jZHyxDcTNZT3fG8dJ/xxfK2IVrF2smCorldxBNb6gbAx9jQXwJUR
         zTNpXfrmgMqWCzD+jaTU1JABiM3uVysTeLnkFMBionxOMWImaQor+Diy4vLuxGR/RLnN
         HMeQ==
X-Gm-Message-State: AOJu0Yw8I3sOWVkKnWmUhah+ZZOJH/Itj1adwP+sni0bxZnO7SXSDN96
	uZ6ILXk3qYuPJ8cny4w68lOpOKXipurgID8S+9YIO41IQEAIif1b
X-Google-Smtp-Source: AGHT+IGdz3cQFDGFDCnsBVPDgwxcgxV5p1pSQUy9X+5c5TJBrAZOCwZxwkuiAMv/u2h8HHXd8odlcw==
X-Received: by 2002:a17:907:7784:b0:a37:b1df:30ad with SMTP id ky4-20020a170907778400b00a37b1df30admr1828897ejc.46.1707137354080;
        Mon, 05 Feb 2024 04:49:14 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXP7zPhXyqaLXwRudUBhdm2w2FXV04zyYu4Idv1lFmot2guLY7n2ct6aWciGOwEY36n/bFzWD4t9+1tSjYGOxPPjwGvFdSwt1dnfAUwCWYlB3nYqZkWVty8Tq6AN1KD+Abaflb5TmQ8c7ngvYCP9RLD8f24vtW7X2HiYHhPz5p6a3+WgAcPLbbmLP3ASJ4gw+m8Tkdtw2Nn6l8V9cFRcMELw8tIVnchogJEc/aPvDF1S4FscrOcS0Fe5oY7QIguo2jE06FxGh9M+orBsCJZBBfhEyDf8NgJxPLzOtjYTYQrbT3InHfqd8U=
Message-ID: <211e7d7fb7d52d0bc7dbb12d5619a39f98d5b21c.camel@gmail.com>
Subject: Re: [PATCH v3 31/34] xen/riscv: add minimal stuff to mm.h to build
 full Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 05 Feb 2024 13:49:12 +0100
In-Reply-To: <44a9a92c-ac4c-43d0-bc1e-685818e4331d@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <4411f6af38586074b347cd6005f19f9c670faa74.1703255175.git.oleksii.kurochko@gmail.com>
	 <d347c4d9-e93b-4937-8e33-e5fbbdcd6bfb@suse.com>
	 <f3858360fba14a2c5b794bdd0400cd7ab8e66f73.camel@gmail.com>
	 <44a9a92c-ac4c-43d0-bc1e-685818e4331d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-05 at 08:46 +0100, Jan Beulich wrote:
> On 02.02.2024 18:30, Oleksii wrote:
> > On Tue, 2024-01-23 at 14:03 +0100, Jan Beulich wrote:
> > > On 22.12.2023 16:13, Oleksii Kurochko wrote:
> > > > +/* Convert between Xen-heap virtual addresses and machine
> > > > frame
> > > > numbers. */
> > > > +#define __virt_to_mfn(va) (virt_to_maddr(va) >> PAGE_SHIFT)
> > > > +#define __mfn_to_virt(mfn) maddr_to_virt((paddr_t)(mfn) <<
> > > > PAGE_SHIFT)
> > >=20
> > > These would imo better use maddr_to_mfn() and mfn_to_maddr(),
> > > rather
> > > than
> > > kind of open-coding them. The former could also use PFN_DOWN() as
> > > an
> > > alternative.
> > We can't to as __virt_to_mfn() when is used it is usually wrapped
> > by
> > _mfn() which expect to have unsigned long as an argument.
>=20
> #define __virt_to_mfn(va)=C2=A0 mfn_x(maddr_to_mfn(virt_to_maddr(va))
> #define __mfn_to_virt(mfn) maddr_to_virt(mfn_to_maddr(_mfn(mfn)))
>=20
> ?
I had an issue with the compilation when I tried to define them in
similar way.

I'll double check again.

>=20
> > > > +/* Convert between Xen-heap virtual addresses and page-info
> > > > structures. */
> > > > +static inline struct page_info *virt_to_page(const void *v)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 BUG();
> > > > +=C2=A0=C2=A0=C2=A0 return NULL;
> > > > +}
> > > > +
> > > > +/*
> > > > + * We define non-underscored wrappers for above conversion
> > > > functions.
> > > > + * These are overriden in various source files while
> > > > underscored
> > > > version
> > > > + * remain intact.
> > > > + */
> > > > +#define virt_to_mfn(va)=C2=A0=C2=A0=C2=A0=C2=A0 __virt_to_mfn(va)
> > > > +#define mfn_to_virt(mfn)=C2=A0=C2=A0=C2=A0 __mfn_to_virt(mfn)
> > >=20
> > > Is this really still needed? Would be pretty nice if in a new
> > > port we
> > > could get to start cleanly right away (i.e. by not needing per-
> > > file
> > > overrides, but using type-safe expansions here right away).
> > We still need __virt_to_mfn and __mfn_to_virt as common code use
> > them:
> > =C2=A0* xen/common/xenoprof.c:24:#define virt_to_mfn(va)
> > mfn(__virt_to_mfn(va))
>=20
> Are you meaning to enable this code on RISC-V.
Yes, that is what I meant.

~ Oleksii

>=20
> > =C2=A0* xen/include/xen/domain_page.h:59:#define
> > domain_page_map_to_mfn(ptr)
> > _mfn(__virt_to_mfn((unsigned long)(ptr)))
>=20
> Hmm, yes, we should finally get this sorted. But yeah, not something
> I want
> to ask you to do.
>=20
> Jan



