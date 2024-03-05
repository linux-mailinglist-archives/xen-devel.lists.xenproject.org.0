Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D7872257
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 16:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688822.1073482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhWJt-0000c7-F1; Tue, 05 Mar 2024 15:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688822.1073482; Tue, 05 Mar 2024 15:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhWJt-0000Z1-CK; Tue, 05 Mar 2024 15:03:05 +0000
Received: by outflank-mailman (input) for mailman id 688822;
 Tue, 05 Mar 2024 15:03:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4c3Q=KL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rhWJr-0000Yt-7B
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 15:03:03 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76477f51-db01-11ee-afda-a90da7624cb6;
 Tue, 05 Mar 2024 16:03:02 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55a5e7fa471so8068206a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 07:03:02 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 be27-20020a0564021a3b00b0056650031d94sm5894671edb.90.2024.03.05.07.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 07:03:01 -0800 (PST)
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
X-Inumbo-ID: 76477f51-db01-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709650982; x=1710255782; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nN42e+8rYTZ6z97lQyMhRThAmt74Iwq7aMCkyMtt+XY=;
        b=jD3MEcVl0/zK03T0vrI4fftdygq266ICh5doUp5q12hqY9DaWS9g9WRDkk/CMPe/hH
         fRgBu9mvn/3BqMZlU0+b2aaQe1jIL0UV4kAGaJ5XC8Rd51XvMQXoDSIwQgd+9IgV0IIj
         u7JIEWc65Ap977P5A4pOUNpjMjW2bGwfhTVjB4ZD5/Ya/OEljk9KNVWaQ6AsamOcHF99
         rymp8Hwc52R75v7AY7XmokC4vm6AqalLDsAI/rzy0yr+/bBFcQ/cCql+bE/OtAUTtMtu
         AZ/oJwo5PT+TDPAXo9jFbxdqHaaxAxBfpNtDVPsHXkBi0hYdRWRUSktOuVcHJKvMhYOd
         1PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709650982; x=1710255782;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nN42e+8rYTZ6z97lQyMhRThAmt74Iwq7aMCkyMtt+XY=;
        b=ttV/Omi0XE1EhJ8S9LQaHX0t1DXbq7sP9TX4gJvXjPtdDHjtydTFTMhEPe/8nfYt2f
         Kr4Af5wkMXsyn7PEV0N/5TrOb+bWo6v2GfDfwHbMEdXc9YQazHIzEM4TZWZZAZjL/8AR
         w+V/6vHrPKnxp4stiWOnJQVtzDJkdAQuZE3KXhWNWyDcKpzJg8Mmqua/XcnpEE2JeET7
         6M8ysCBksdrfue0eUtKeA4BubP1AV8U6sjosxIDYhAsuO8d3bUEsS10lgGfLhNKfASXc
         nuRNvMmLN6M0OrHWOMTm3HbV1lJhzMPSuhLC6bOe6uBmtSRfwWel68wC/3h43SPAv9z4
         7etg==
X-Forwarded-Encrypted: i=1; AJvYcCXG/y55BxPWVe2EJIXbqELgKAjcbpEpAKlz3xn9sDwFvCkb3Xej3H+G2bhkdhWtcDkYLlNqkXo34i8ZpYQ4cENYT45z9nZ4KLhsQQ04/aA=
X-Gm-Message-State: AOJu0Yx4Q3wM9YbVU18NlJub+C5gBO2avU4ryzrypS3xsCQ2/s6yQM2N
	BGLaUCJK3+T2kxDCl3aU5+hVlzkiuGXR7DIInOiuLmQNveeK7f4t
X-Google-Smtp-Source: AGHT+IFJhYH5dUis8GC0r1af4C1zub4w7lB/q01Jdw7k2FYCU6xwwXZMAHt3LUCcHxQ/YVRuxbA8hQ==
X-Received: by 2002:a05:6402:3584:b0:566:f66d:f3c6 with SMTP id y4-20020a056402358400b00566f66df3c6mr9500529edc.21.1709650981488;
        Tue, 05 Mar 2024 07:03:01 -0800 (PST)
Message-ID: <ccbbc5343486023d5939da7443034d2c8a56c7fe.camel@gmail.com>
Subject: Re: [PATCH] x86+Arm: drop (rename) __virt_to_maddr() /
 __maddr_to_virt()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <volodymyr_babchuk@epam.com>,  Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Date: Tue, 05 Mar 2024 16:02:52 +0100
In-Reply-To: <b837e02d-fd65-458f-a946-ea36a52ddd3e@suse.com>
References: <b837e02d-fd65-458f-a946-ea36a52ddd3e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Changes looks good to me.

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I'll update the RISC-V part correspondingly.

~ Oleksii

On Tue, 2024-03-05 at 09:33 +0100, Jan Beulich wrote:
> There's no use of them anymore except in the definitions of the non-
> underscore-prefixed aliases. Rename the inline functions, adjust the
> virt_to_maddr() #define-e, and purge the (x86-only) maddr_to_virt()
> one,
> thus eliminating a bogus cast which would have allowed the passing of
> a
> pointer type variable into maddr_to_virt() to go silently.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -256,12 +256,12 @@ static inline void __iomem *ioremap_wc(p
> =C2=A0/* Page-align address and convert to frame number format */
> =C2=A0#define paddr_to_pfn_aligned(paddr)=C2=A0=C2=A0=C2=A0
> paddr_to_pfn(PAGE_ALIGN(paddr))
> =C2=A0
> -static inline paddr_t __virt_to_maddr(vaddr_t va)
> +static inline paddr_t virt_to_maddr(vaddr_t va)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 uint64_t par =3D va_to_par(va);
> =C2=A0=C2=A0=C2=A0=C2=A0 return (par & PADDR_MASK & PAGE_MASK) | (va & ~P=
AGE_MASK);
> =C2=A0}
> -#define virt_to_maddr(va)=C2=A0=C2=A0 __virt_to_maddr((vaddr_t)(va))
> +#define virt_to_maddr(va) virt_to_maddr((vaddr_t)(va))
> =C2=A0
> =C2=A0#ifdef CONFIG_ARM_32
> =C2=A0/**
> --- a/xen/arch/x86/hvm/nestedhvm.c
> +++ b/xen/arch/x86/hvm/nestedhvm.c
> @@ -125,7 +125,7 @@ static int __init cf_check nestedhvm_set
> =C2=A0=C2=A0=C2=A0=C2=A0 /* shadow_io_bitmaps can't be declared static be=
cause
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 they must fulfill hw require=
ments (page aligned section)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 and doing so triggers the AS=
SERT(va >=3D XEN_VIRT_START)
> -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 in __virt_to_maddr()
> +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0 in virt_to_maddr()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * So as a compromise pre-allocate them whe=
n xen boots.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This function must be called from within=
 start_xen() when
> --- a/xen/arch/x86/include/asm/page.h
> +++ b/xen/arch/x86/include/asm/page.h
> @@ -269,8 +269,6 @@ void scrub_page_cold(void *);
> =C2=A0#define mfn_valid(mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __mfn_valid(mf=
n_x(mfn))
> =C2=A0#define virt_to_mfn(va)=C2=A0=C2=A0=C2=A0=C2=A0 __virt_to_mfn(va)
> =C2=A0#define mfn_to_virt(mfn)=C2=A0=C2=A0=C2=A0 __mfn_to_virt(mfn)
> -#define virt_to_maddr(va)=C2=A0=C2=A0 __virt_to_maddr((unsigned long)(va=
))
> -#define maddr_to_virt(ma)=C2=A0=C2=A0 __maddr_to_virt((unsigned long)(ma=
))
> =C2=A0#define maddr_to_page(ma)=C2=A0=C2=A0 __maddr_to_page(ma)
> =C2=A0#define page_to_maddr(pg)=C2=A0=C2=A0 __page_to_maddr(pg)
> =C2=A0#define virt_to_page(va)=C2=A0=C2=A0=C2=A0 __virt_to_page(va)
> --- a/xen/arch/x86/include/asm/x86_64/page.h
> +++ b/xen/arch/x86/include/asm/x86_64/page.h
> @@ -34,7 +34,7 @@ static inline unsigned long canonicalise
> =C2=A0#define pdx_to_virt(pdx) ((void *)(DIRECTMAP_VIRT_START + \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((unsigned =
long)(pdx) <<
> PAGE_SHIFT)))
> =C2=A0
> -static inline unsigned long __virt_to_maddr(unsigned long va)
> +static inline unsigned long virt_to_maddr(unsigned long va)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(va < DIRECTMAP_VIRT_END);
> =C2=A0=C2=A0=C2=A0=C2=A0 if ( va >=3D DIRECTMAP_VIRT_START )
> @@ -47,8 +47,9 @@ static inline unsigned long __virt_to_ma
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 return xen_phys_start + va - XEN_VIRT_START;
> =C2=A0}
> +#define virt_to_maddr(va) virt_to_maddr((unsigned long)(va))
> =C2=A0
> -static inline void *__maddr_to_virt(unsigned long ma)
> +static inline void *maddr_to_virt(unsigned long ma)
> =C2=A0{
> =C2=A0=C2=A0=C2=A0=C2=A0 /* Offset in the direct map, accounting for pdx =
compression */
> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long va_offset =3D maddr_to_directmapof=
f(ma);


