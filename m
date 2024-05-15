Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C92A8C69B9
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 17:29:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722503.1126530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GZU-0005K3-2p; Wed, 15 May 2024 15:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722503.1126530; Wed, 15 May 2024 15:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7GZT-0005Gs-Vx; Wed, 15 May 2024 15:29:35 +0000
Received: by outflank-mailman (input) for mailman id 722503;
 Wed, 15 May 2024 15:29:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ly6O=MS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7GZS-0005FX-Rc
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 15:29:34 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id edb054f3-12cf-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 17:29:32 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-51ff65b1e14so7777988e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 08:29:32 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52399dcb951sm245275e87.268.2024.05.15.08.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 08:29:31 -0700 (PDT)
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
X-Inumbo-ID: edb054f3-12cf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715786972; x=1716391772; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LLYV9Be1Dq+oNQmVMaP7Vc1g1afNBBpOJb9dBHJL8kY=;
        b=C3t8wYMR9vSEY7rKcDu9/tQJ+FztkFyxZiPgx7m2BKK5qa5KftA3rsc9Is8F4S9I35
         irnwT6I5kyeO/k2xhHt4e3ZGcb1y/jzHy9dgo/zqsuH7Nj5jiDuwmr6lrxynfiseVtvz
         xlzjfi2JpB2Wwyc0OZ1VrTm3IKFbUik8YM6sKVLFcJL3IdKUFTZP676ZGs3kdGQ8lPbb
         L5qLP0AiOzVNSjDmnGukc4arwEh+TInRxIqI2q7Ofa/ju9mt2qsKXO0pRrueg2Ij4I5Q
         8+kmHs+RZexi7v1BT6AlNgmnE3La/EFBKi10Gq86v9TdVum+30Et51BFHdvboTO7595q
         Rkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715786972; x=1716391772;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LLYV9Be1Dq+oNQmVMaP7Vc1g1afNBBpOJb9dBHJL8kY=;
        b=XZx450ZSH8hN70QfV4dTL2pl4AmtgcWcXImcUct64jZXNnVscyXnfjp8WivKQ+9VH3
         vj3p7eDwKJVfiJbIpd8IJjB5RqyiTGBu1RwBgUMY+ON/dekXANqamw5bS90Uh/9911zE
         52kmbqwIA4lXQzCLEbi5o3ushSzi0QpgXDrwFm4AzGsm3lRaD3CZNvLy6rysB7fs5fiW
         kmhUiTXgO32sXshx1/imj3G6ZiHQHLggfSAyuOfGDJoI3ov7U2WZKmmcg0v2wjdpsY2d
         HZvbWOJePq1DDNTTUec0ZGJAASxS35UZ3CfY180ob8RxQ+s1xrCnnyFjARmU2hfAD4Ns
         P1xg==
X-Forwarded-Encrypted: i=1; AJvYcCVOcSpCjFqFPNKF5GK+Iwtcn0gnLKhOZWXQ4/VnzETOLiflL7D2+nUobd1eb2SewKvs78EFpz5/0EQgyU4SKcavvLklEn9ZEgsPtu4XEqM=
X-Gm-Message-State: AOJu0YxEVJnEjT5EYwwTaNkWDydPhx4qt+A7hKBQGjRNAanbE0IQHurY
	mXgJbTZ2YMAZflIaSltpqPTeXn3X53yocdmehv3o6yRZuev93bKU
X-Google-Smtp-Source: AGHT+IFGaEcfXsayyUIGxtXeQkgmUtylapRpFir45HMr69F5BFFS80+s46v3s+vHu4GNEAjtaL85Aw==
X-Received: by 2002:a05:6512:3d19:b0:51a:b110:3214 with SMTP id 2adb3069b0e04-5221007029cmr12595614e87.49.1715786972064;
        Wed, 15 May 2024 08:29:32 -0700 (PDT)
Message-ID: <76a84e9e239e1338fc6f86d243b74fa239d8091d.camel@gmail.com>
Subject: Re: [PATCH v9 02/15] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,  Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Date: Wed, 15 May 2024 17:29:30 +0200
In-Reply-To: <2ac0ca46-6957-4d31-95cb-3016de7b11b8@suse.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
	 <616e8be09f217a766b96c4f9060f6658636a4338.1714988096.git.oleksii.kurochko@gmail.com>
	 <2ac0ca46-6957-4d31-95cb-3016de7b11b8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-15 at 10:52 +0200, Jan Beulich wrote:
> On 06.05.2024 12:15, Oleksii Kurochko wrote:
> > The following generic functions were introduced:
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
>=20
> Logically this paragraph may better move ahead of the BITOP_* one.
>=20
> > Because of that x86 has the following check in the macros
> > test_bit(),
> > __test_and_set_bit(), __test_and_clear_bit(),
> > __test_and_change_bit():
> > =C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();
> > It was necessary to make bitop bad size check generic too, so
> > arch_check_bitop_size() was introduced.
>=20
> Not anymore, with the most recent adjustments? There's nothing arch-
> specific anymore in the checking.
>=20
> > @@ -183,7 +180,7 @@ static inline int test_and_set_bit(int nr,
> > volatile void *addr)
> > =C2=A0 * If two examples of this operation race, one can appear to
> > succeed
> > =C2=A0 * but actually fail.=C2=A0 You must protect multiple accesses wi=
th a
> > lock.
> > =C2=A0 */
> > -static inline int __test_and_set_bit(int nr, void *addr)
> > +static inline int arch__test_and_set_bit(int nr, volatile void
> > *addr)
>=20
> I think I raised this point before: Why arch__ here, ...
>=20
> > @@ -232,7 +226,7 @@ static inline int test_and_clear_bit(int nr,
> > volatile void *addr)
> > =C2=A0 * If two examples of this operation race, one can appear to
> > succeed
> > =C2=A0 * but actually fail.=C2=A0 You must protect multiple accesses wi=
th a
> > lock.
> > =C2=A0 */
> > -static inline int __test_and_clear_bit(int nr, void *addr)
> > +static inline int arch__test_and_clear_bit(int nr, volatile void
> > *addr)
>=20
> ... here, ...
>=20
> > @@ -243,13 +237,10 @@ static inline int __test_and_clear_bit(int
> > nr, void *addr)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 return oldbit;
> > =C2=A0}
> > -#define __test_and_clear_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > -=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > -=C2=A0=C2=A0=C2=A0 __test_and_clear_bit(nr, addr);=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > -})
> > +#define arch__test_and_clear_bit arch__test_and_clear_bit
> > =C2=A0
> > =C2=A0/* WARNING: non atomic and it can be reordered! */
> > -static inline int __test_and_change_bit(int nr, void *addr)
> > +static inline int arch__test_and_change_bit(int nr, volatile void
> > *addr)
>=20
> ... and here, while ...
>=20
> > @@ -307,8 +295,7 @@ static inline int variable_test_bit(int nr,
> > const volatile void *addr)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return oldbit;
> > =C2=A0}
> > =C2=A0
> > -#define test_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > -=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > +#define arch_test_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
>=20
> ... just arch_ here? I don't like the double underscore infixes very
> much, but I'm okay with them as long as they're applied consistently.

Common code and x86 use __test_and_clear_bit(), and this patch provides
a generic version of __test_and_clear_bit(). To emphasize that
generic__test_and_clear_bit() is a common implementation of
__test_and_clear_bit(), the double underscore was retained. Also,
test_and_clear_bit() exists and if one day it will be needed to provide
a generic version of it, then it will be needed to have
generic__test_and_clear_bit() and generic_test_and_clear_bit()

A similar logic was chosen for test_bit.


>=20
> > --- a/xen/include/xen/bitops.h
> > +++ b/xen/include/xen/bitops.h
> > @@ -65,10 +65,144 @@ static inline int generic_flsl(unsigned long
> > x)
> > =C2=A0 * scope
> > =C2=A0 */
> > =C2=A0
> > +#define BITOP_MASK(nr)=C2=A0 ((bitop_uint_t)1 << ((nr) %
> > BITOP_BITS_PER_WORD))
> > +
> > +#define BITOP_WORD(nr)=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > +
> > +extern void __bitop_bad_size(void);
> > +
> > =C2=A0/* --------------------- Please tidy above here -----------------=
-
> > --- */
> > =C2=A0
> > =C2=A0#include <asm/bitops.h>
> > =C2=A0
> > +#ifndef arch_check_bitop_size
> > +
> > +#define bitop_bad_size(addr) sizeof(*(addr)) <
> > sizeof(bitop_uint_t)
>=20
> Nit: Missing parentheses around the whole expression.
>=20
> > +#define arch_check_bitop_size(addr) \
> > +=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();
>=20
> Apart from the arch_ prefix that now wants dropping, this macro (if
> we
> want one in the first place)=C2=A0
What do you mean by 'want' here? I thought it is pretty necessary from
safety point of view to have this check.
Except arch_ prefix does it make sense to drop "#ifndef
arch_check_bitop_size" around this macros?

> also wants writing in a way such that it
> can be used as a normal expression, without double semicolons or
> other
> anomalies (potentially) resulting at use sites. E.g.
>=20
> #define check_bitop_size(addr) do { \
> =C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) )=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __bitop_bad_size();=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> } while ( 0 )
>=20
> > +#endif /* arch_check_bitop_size */
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
> > +static always_inline bool
> > +generic__test_and_set_bit(unsigned long nr, volatile void *addr)
>=20
> The original per-arch functions all use "int" for their first
> parameter.
> Here you use unsigned long, without any mention in the description of
> the
> potential behavioral change. Which is even worse given that then x86
> ends
> up inconsistent with Arm and PPC in this regard, by ...
>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile bitop_uint_t=
 *)addr +
> > BITOP_WORD(nr);
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
> > +static always_inline bool
> > +generic__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile bitop_uint_t=
 *)addr +
> > BITOP_WORD(nr);
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t old =3D *p;
> > +
> > +=C2=A0=C2=A0=C2=A0 *p =3D old & ~mask;
> > +=C2=A0=C2=A0=C2=A0 return (old & mask);
> > +}
> > +
> > +/* WARNING: non atomic and it can be reordered! */
> > +static always_inline bool
> > +generic__test_and_change_bit(unsigned long nr, volatile void
> > *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile bitop_uint_t=
 *)addr +
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
> > +static always_inline bool generic_test_bit(int nr, const volatile
> > void *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile bitop_uint_t=
 *)addr +
> > BITOP_WORD(nr);
> > +
> > +=C2=A0=C2=A0=C2=A0 return (*p & mask);
> > +}
> > +
> > +static always_inline bool
> > +__test_and_set_bit(unsigned long nr, volatile void *addr)
> > +{
> > +#ifndef arch__test_and_set_bit
> > +#define arch__test_and_set_bit generic__test_and_set_bit
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0 return arch__test_and_set_bit(nr, addr);
>=20
> ... silently truncating and sign-converting nr here.
Missed that fact. AFAIU there is no specific reason for bit number to
be 'int' for this function, so it makes sense to update x86's prototype
of arch__test_and_set_bit() to:
   static inline int arch__test_and_set_bit(unsigned long nr, volatile
   void *addr).
  =20
But probably I can't use 'unsigned long' here too, as it should a
compilation error around 'btsl' instruction.

So it can be or 'unsinged int' or 'int'.
>=20
> As to generic_test_bit() - please don't cast away const-ness there.
>=20
> > +}
> > +#define __test_and_set_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 arch_check_bitop_size(addr);=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 __test_and_set_bit(nr, addr);=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
> > +})
> > +
> > +static always_inline bool
> > +__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
>=20
> Oddly enough here at least you use bitop_uint_t, but that's still ...
>=20
> > +{
> > +#ifndef arch__test_and_clear_bit
> > +#define arch__test_and_clear_bit generic__test_and_clear_bit
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0 return arch__test_and_clear_bit(nr, addr);
>=20
> ... meaning a signedness conversion on x86 then. And beware: You
> can't
> simply change x86'es code to use bitop_uint_t. The underlying insns
> used
> interpret the bit position as a signed number, i.e. permitting
> accesses
> below the incoming pointer (whether it really makes sense to be that
> way
> is a separate question). I'm afraid I have no good suggestion how to
> deal
> with that: Any approach I can think of is either detrimental to the
> generic implementation or would have unwanted effects on the x86 one.
> Others, anyone?
Is the signedness conversion here a big problem? I suppose no one will
pass a negative number to nr.

It seems to me that it would be better to use 'int' everywhere and not
use bitop_uint_t for 'nr' since it is just a bit position. 'Int'
provides enough range for possible bit number.

>=20
> > --- a/xen/include/xen/types.h
> > +++ b/xen/include/xen/types.h
> > @@ -64,6 +64,12 @@ typedef __u64 __be64;
> > =C2=A0
> > =C2=A0typedef unsigned int __attribute__((__mode__(__pointer__)))
> > uintptr_t;
> > =C2=A0
> > +#ifndef BITOP_TYPE
> > +#define BITOP_BITS_PER_WORD 32
> > +
> > +typedef uint32_t bitop_uint_t;
> > +#endif
>=20
> I think you mentioned to me before why this needs to live here, not
> in
> xen/bitops.h. Yet I don't recall the reason, and the description
> (hint,
> hint) doesn't say anything either.
If I remember correctly ( after this phrase I think I have to update
the description ) the reason was that if I put that to xen/bitops.h:

    ...
    #include <asm/bitops.h>
   =20
    #ifndef BITOP_TYPE
    #define BITOP_BITS_PER_WORD 32
    /* typedef uint32_t bitop_uint_t; */
    #endif
    ...

Then we will have an issue that we can't use the generic definition of=20
BITOP_BITS_PER_WORD and bitop_uint_t in asm/bitops.h as it is defined
after inclusion of <asm/bitops.h>.

But if to put it to <xen/types.h> then such problem won't occur.

If it still makes sense, then I'll update the description in the next
patch version.

~ Oleksii

>=20
> Jan


