Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5D1898B72
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 17:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700953.1094833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPHm-0001Kf-VS; Thu, 04 Apr 2024 15:45:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700953.1094833; Thu, 04 Apr 2024 15:45:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsPHm-0001IX-Sq; Thu, 04 Apr 2024 15:45:54 +0000
Received: by outflank-mailman (input) for mailman id 700953;
 Thu, 04 Apr 2024 15:45:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LwOm=LJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rsPHl-0001IR-P2
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 15:45:53 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a060bc8-f29a-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 17:45:51 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56e0e1d162bso1154975a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 08:45:51 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 bx25-20020a0564020b5900b0056db8d09436sm7533188edb.94.2024.04.04.08.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 08:45:49 -0700 (PDT)
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
X-Inumbo-ID: 6a060bc8-f29a-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712245551; x=1712850351; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gLCtPj5tLX8iL9aV1IyZF2BHrV2UqHtUL0IY5OEP8io=;
        b=gLy82EDBdgCfb4Zzbfxny6seyiJSoXDNPNjNuZ25d7PssAokuWnSIzkcvUKka/O8AC
         fAYgnQMVxQWQ4ri4wkF8+zYYTdoQElTDpgxpb0sLAH8E+bzER4wRHN6QbWp9CcsSsyA7
         Yy+b2Q6yRB6lHFMcJ19Wq8zHb+tKpZaxI4FMnxu4V/gZLBUodEo8BWQHVQ5SqCiprZmU
         15Q+w3DQHAFjIeTOgFYonklnCzX2VseM3cNRX/T3TDgorvf5rH4QAHHXSaraTfcw5M/t
         /7Wpmwz1QsQtNVpX2fOSOky6O5tCRk0G3dzJ69izWk50Fn20i3aNiEdNWAyJq8tMz9/H
         d3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712245551; x=1712850351;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gLCtPj5tLX8iL9aV1IyZF2BHrV2UqHtUL0IY5OEP8io=;
        b=q+cRAagZmKPekA+VGdg35m5qziefZrj2+a7WaH6uumDOelVLq0jIzaGcvf+ElbwwcL
         ZDj6/yOJyXAVcKBvQuRdD7CxD7zD2X+80amfNiLo4x/5pcpPWxSBFTHR9Y1Rgmd7dXmn
         /wLumiHpvUN5xIutgktNBt7i/XO1rYjtISmsZ2XPzqcn8IrNRiKK0Fc4RxpF7LPregGj
         q6MrqDPpbmkg2vLbxFYKIPJB/GnGkwzcHwRb3rP4BontoCD4uHFgmn5W9joCMUUWi/7Q
         BzTCEPtreGPCKsQD7334eGTKP5A9OxGwmKGY7qhu8uu8Ftulgfco148bNmyL5Si57KSg
         4TzA==
X-Forwarded-Encrypted: i=1; AJvYcCW216pWYSIXmpm4EJRYl0lfjoXgXxH0LdTAk+lgB06ShHAnGsjJOAKyI+zR+xdFdoVVIkbUHrdOqU3hbyaF0554Zq7a+eYBY/OWKTGlMoc=
X-Gm-Message-State: AOJu0YwLs1O5tQTKaPvHQ7lWTqQpV47JGhWixqCKhPr3KxQSTJ0t4I5m
	TvEgLh2OTfYlr8JGS8lqzhKFy8/oS4ICUqLIbxAAbJfE7o2lNN/L
X-Google-Smtp-Source: AGHT+IF1TkMcCrASWYp/NF4FblSeWXiu4dVx/t0Ig1Qh1OqATj8l/W/OHsMHHrlgcccrqelSpzFP7A==
X-Received: by 2002:a50:9555:0:b0:56b:8d0e:1a08 with SMTP id v21-20020a509555000000b0056b8d0e1a08mr1990317eda.26.1712245550521;
        Thu, 04 Apr 2024 08:45:50 -0700 (PDT)
Message-ID: <5ee906c53e2d4a966fa6be3be50caa19c3c164a2.camel@gmail.com>
Subject: Re: [PATCH v7 04/19] xen: introduce generic non-atomic test_*bit()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
 <ross.lagerwall@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>,  Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Thu, 04 Apr 2024 17:45:49 +0200
In-Reply-To: <aabb1d9a-3910-479e-858d-a11777873ef5@suse.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
	 <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
	 <aabb1d9a-3910-479e-858d-a11777873ef5@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-04-04 at 15:22 +0200, Jan Beulich wrote:
> On 03.04.2024 12:19, Oleksii Kurochko wrote:
> > The patch introduces the following generic functions:
> > * test_bit
> > * generic__test_and_set_bit
> > * generic__test_and_clear_bit
> > * generic__test_and_change_bit
> >=20
> > Also, the patch introduces the following generics which are
> > used by the functions mentioned above:
> > * BITOP_BITS_PER_WORD
> > * BITOP_MASK
> > * BITOP_WORD
> > * BITOP_TYPE
> >=20
> > These functions and macros can be useful for architectures
> > that don't have corresponding arch-specific instructions.
> >=20
> > Because of that x86 has the following check in the macros
> > test_bit(),
> > __test_and_set_bit(), __test_and_clear_bit(),
> > __test_and_change_bit():
> > =C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();
> > It was necessary to move the check to generic code and define as 0
> > for other architectures as they do not require this check.
>=20
> Hmm, yes, the checks need to be in the outermost wrapper macros.
> While
> you're abstracting other stuff to arch_*(), wouldn't it make sense to
> also abstract this to e.g. arch_check_bitop_size(), with the
> expansion
> simply being (effectively) empty in the generic fallback case?
Probably it would be better to be consistent and introduce
arch_check_bitop_size().

>=20
> > --- a/xen/include/xen/bitops.h
> > +++ b/xen/include/xen/bitops.h
> > @@ -65,10 +65,164 @@ static inline int generic_flsl(unsigned long
> > x)
> > =C2=A0 * scope
> > =C2=A0 */
> > =C2=A0
> > +#define BITOP_BITS_PER_WORD 32
> > +/* typedef uint32_t bitop_uint_t; */
> > +#define bitop_uint_t uint32_t
>=20
> So no arch overrides permitted anymore at all?
Not really, I agree that it is ugly, but I expected that arch will use
undef to override.

>=20
> > +#define BITOP_MASK(nr)=C2=A0 ((bitop_uint_t)1 << ((nr) %
> > BITOP_BITS_PER_WORD))
> > +
> > +#define BITOP_WORD(nr)=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > +
> > =C2=A0/* --------------------- Please tidy above here -----------------=
-
> > --- */
> > =C2=A0
> > =C2=A0#include <asm/bitops.h>
> > =C2=A0
> > +#ifndef bitop_bad_size
> > +extern void __bitop_bad_size(void);
>=20
> If not switching to arch_check_bitop_size() or alike as suggested
> above,
> why exactly does this need duplicating here and in x86? Can't the
> decl
> simply move ahead of the #include right above? (Sure, this will then
> require that nothing needing any of the functions you move here would
> still include asm/bitops.h; it would need to be xen/bitops.h
> everywhere.)
It could be done in way you suggest, I just wanted to keep changes
minimal ( without going and switching asm/bitops.h -> xen/bitops.h ),
but we can consider such option.

>=20
> > +#define bitop_bad_size(addr) 0
> > +#endif
> > +
> > +/**
> > + * generic__test_and_set_bit - Set a bit and return its old value
> > + * @nr: Bit to set
> > + * @addr: Address to count from
> > + *
> > + * This operation is non-atomic and can be reordered.
> > + * If two examples of this operation race, one can appear to
> > succeed
> > + * but actually fail.=C2=A0 You must protect multiple accesses with a
> > lock.
> > + */
> > +static always_inline __pure bool
> > +generic__test_and_set_bit(unsigned long nr, volatile void *addr)
>=20
> Does __pure actually fit with the use of volatile? The former says
> multiple
> accesses may be folded; the latter says they must not be.
Overlooked that, __pure should be dropped.

>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D ((volatile bitop_uint_=
t *)addr) +
> > BITOP_WORD(nr);
>=20
> Nit: Slightly shorter line possible:
>=20
> =C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile bitop_uint_t *)=
addr +
> BITOP_WORD(nr);
>=20
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t old =3D *p;
> > +
> > +=C2=A0=C2=A0=C2=A0 *p =3D old | mask;
> > +=C2=A0=C2=A0=C2=A0 return (old & mask);
> > +}
> > +
> > +/**
> > + * generic__test_and_clear_bit - Clear a bit and return its old
> > value
> > + * @nr: Bit to clear
> > + * @addr: Address to count from
> > + *
> > + * This operation is non-atomic and can be reordered.
> > + * If two examples of this operation race, one can appear to
> > succeed
> > + * but actually fail.=C2=A0 You must protect multiple accesses with a
> > lock.
> > + */
> > +static always_inline __pure bool
> > +generic__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D ((volatile bitop_uint_=
t *)addr) +
> > BITOP_WORD(nr);
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t old =3D *p;
> > +
> > +=C2=A0=C2=A0=C2=A0 *p =3D old & ~mask;
> > +=C2=A0=C2=A0=C2=A0 return (old & mask);
> > +}
> > +
> > +/* WARNING: non atomic and it can be reordered! */
> > +static always_inline __pure bool
> > +generic__test_and_change_bit(unsigned long nr, volatile void
> > *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D ((volatile bitop_uint_=
t *)addr) +
> > BITOP_WORD(nr);
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t old =3D *p;
> > +
> > +=C2=A0=C2=A0=C2=A0 *p =3D old ^ mask;
> > +=C2=A0=C2=A0=C2=A0 return (old & mask);
> > +}
> > +/**
> > + * generic_test_bit - Determine whether a bit is set
> > + * @nr: bit number to test
> > + * @addr: Address to start counting from
> > + */
> > +static always_inline __pure int generic_test_bit(int nr, const
> > volatile void *addr)
>=20
> Further up you use bool; why int here?
No specific reason, I have to update everything to bool.

>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 const volatile bitop_uint_t *p =3D addr;
> > +=C2=A0=C2=A0=C2=A0 return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_=
PER_WORD -
> > 1)));
>=20
> And reason not to use BITOP_MASK() here as well (once having switched
> to
> bool return type)?
It seems we can use BITOP_MASK() this implementation was copied from
arch specific code.

>=20
> > +}
> > +
> > +static always_inline __pure bool
> > +__test_and_set_bit(unsigned long nr, volatile void *addr)
> > +{
> > +#ifndef arch__test_and_set_bit
> > +#define arch__test_and_set_bit generic__test_and_set_bit
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0 return arch__test_and_set_bit(nr, addr);
> > +}
> > +#define __test_and_set_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
> > +=C2=A0=C2=A0=C2=A0 __test_and_set_bit(nr, addr);=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> > +})
> > +
> > +static always_inline __pure bool
> > +__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
> > +{
> > +#ifndef arch__test_and_clear_bit
> > +#define arch__test_and_clear_bit generic__test_and_clear_bit
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0 return arch__test_and_clear_bit(nr, addr);
> > +}
> > +#define __test_and_clear_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
> > +=C2=A0=C2=A0=C2=A0 __test_and_clear_bit(nr, addr);=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> > +})
> > +
> > +static always_inline __pure bool
> > +__test_and_change_bit(unsigned long nr, volatile void *addr)
> > +{
> > +#ifndef arch__test_and_change_bit
> > +#define arch__test_and_change_bit generic__test_and_change_bit
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0 return arch__test_and_change_bit(nr, addr);
> > +}
> > +#define __test_and_change_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 __test_and_change_bit(nr, addr);=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > +})
> > +
> > +static always_inline __pure int test_bit(int nr, const volatile
> > void *addr)
>=20
> Further up you use bool; why int here?
>=20
> > +{
> > +#ifndef arch_test_bit
> > +#define arch_test_bit generic_test_bit
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0 return arch_test_bit(nr, addr);
> > +}
> > +#define test_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 test_bit(nr, addr);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> > +})
>=20
> From here onwards, ...
>=20
> > +static always_inline __pure int fls(unsigned int x)
> > +{
> > +=C2=A0=C2=A0=C2=A0 if (__builtin_constant_p(x))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return generic_fls(x);
> > +
> > +#ifndef arch_fls
> > +#define arch_fls generic_fls
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0 return arch_fls(x);
> > +}
> > +
> > +static always_inline __pure int flsl(unsigned long x)
> > +{
> > +=C2=A0=C2=A0=C2=A0 if (__builtin_constant_p(x))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return generic_flsl(x);
> > +
> > +#ifndef arch_flsl
> > +#define arch_flsl generic_flsl
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0 return arch_flsl(x);
> > +}
>=20
> ... does all of this really belong here? Neither title nor
> description have
> any hint towards this.
No, it should be a part of the 	[PATCH v7 05/19] xen/bitops: implement
fls{l}() in common logic. An issue during rebase. I'll update that.

>=20
> > =C2=A0/*
> > =C2=A0 * Find First Set bit.=C2=A0 Bits are labelled from 1.
> > =C2=A0 */
>=20
> This context suggests there's a dependency on an uncommitted patch.
> Nothing
> above says so. I guess you have a remark in the cover letter, yet imo
> that's
> only partly helpful.
Is it really a hard dependency?
The current patch series really depends on ffs{l}() and that was
mentioned in the cover letter ( I'll reword the cover letter to explain
why exactly this dependency is needed ), but this patch isn't really
depends on Andrew's patch series, where ffs{l}() are introduced.

~ Oleksii

