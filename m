Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E21A8C6B42
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 19:04:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722560.1126650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7I2C-00061p-54; Wed, 15 May 2024 17:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722560.1126650; Wed, 15 May 2024 17:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7I2C-0005zp-2Q; Wed, 15 May 2024 17:03:20 +0000
Received: by outflank-mailman (input) for mailman id 722560;
 Wed, 15 May 2024 17:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ly6O=MS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7I2A-0005zj-PW
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 17:03:18 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02c3c83f-12dd-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 19:03:11 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e1fa1f1d9bso123908871fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 10:03:11 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d9192sm2609570e87.241.2024.05.15.10.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 10:03:10 -0700 (PDT)
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
X-Inumbo-ID: 02c3c83f-12dd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715792591; x=1716397391; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CudvKSAjP6QR2eUIDcgcD3uTS4NZg1oCeQIxxS4n4eo=;
        b=D4XoW+3wRD3xBOmMmo3TzJk12XucXybVNcAggTx8H5x6CEM8syD4LXb3vHroKXVd5k
         wdebNEIjgwaVTP8AOLSFOZEglgQItRnJK2UGDm0/gBsuLKVole1yEJelpD4peRi7Wt25
         l2S4OXfSjDi2CODVkk+g9vJ4wFTaVJ93W4q4MRLN075Us4XDyWpZW1rtBDxs0QrpI/wt
         9iQc3zaXXC9NXoyd/5/tkH32i1DjQbMucbPUdnTIVgJSv3PgeXsyPF+jgWUXYl/SLsv9
         z2IFquGp0kN4FDOprWaslsENyqZ7KqLAxcEEaLndXN+gzV0LHBNKhLvnPoZHyiTYui0t
         POFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715792591; x=1716397391;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CudvKSAjP6QR2eUIDcgcD3uTS4NZg1oCeQIxxS4n4eo=;
        b=vlsxZ0r5T2SNxukskG5VbrwJD6Any6JrbtSUiKvOOXf2QCZVEAaiqqKpK1URsPiCqq
         jOdt4voamNpcYm/Oln4Annf4kGnkbBbfqUr3L6Di/HoaUeB6zMPedSFCwPzYg1eAixlp
         SLr2frFlwjbWcgJsCHMjxRtYvmokFbhc6vqnjajPSReOvUwLdeeHIHd4ecofTYsHWKbX
         i2UpbMiXdbr0yf3IUOSEz5xU+5CJtV9pSLIZVa+3JchObXs165ZnU7uGd0Vw8zCrF5t4
         IlCShy2soMscrpbkW1PmZKBOGN7TP/OY/mv0UWO2C/7z3QluYG9tIWuPXbofmpc0xFsL
         oc0w==
X-Forwarded-Encrypted: i=1; AJvYcCUCkREbuEjU9PR8qbVrjgp7xC0tamw42lXnB3xk8+hOW/foFyjWETs0MKusvyVdz0td/3V6QjvpoYDE39Mfr5/XPDuPB/0oXhCgepiExp0=
X-Gm-Message-State: AOJu0YwEGB77JSsDQgrx4kE0ilkNObPsgTOV0cuVOmujVu5wUGeULMfy
	fdd63AJp6lAqFqUI7lpBSSlDClyEUBJwNMeJUObTMPeHRHeuiLko
X-Google-Smtp-Source: AGHT+IHMk4b45aUupTs5AUMmsysZNygLlrTy77fZNAttbqJfDEHsSSwb1PHHGZHRUBz41qJw1IvM/w==
X-Received: by 2002:a05:6512:70f:b0:523:af1f:89d9 with SMTP id 2adb3069b0e04-523af1f8aa7mr374443e87.58.1715792590780;
        Wed, 15 May 2024 10:03:10 -0700 (PDT)
Message-ID: <588867d6e054264551e0e27b534955fce9b6d6d5.camel@gmail.com>
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
Date: Wed, 15 May 2024 19:03:09 +0200
In-Reply-To: <5174d73f-677d-4c5c-9d4c-e651a29e4366@suse.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
	 <616e8be09f217a766b96c4f9060f6658636a4338.1714988096.git.oleksii.kurochko@gmail.com>
	 <2ac0ca46-6957-4d31-95cb-3016de7b11b8@suse.com>
	 <76a84e9e239e1338fc6f86d243b74fa239d8091d.camel@gmail.com>
	 <5174d73f-677d-4c5c-9d4c-e651a29e4366@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Wed, 2024-05-15 at 17:41 +0200, Jan Beulich wrote:
> On 15.05.2024 17:29, Oleksii K. wrote:
> > On Wed, 2024-05-15 at 10:52 +0200, Jan Beulich wrote:
> > > On 06.05.2024 12:15, Oleksii Kurochko wrote:
> > > > The following generic functions were introduced:
> > > > * test_bit
> > > > * generic__test_and_set_bit
> > > > * generic__test_and_clear_bit
> > > > * generic__test_and_change_bit
> > > >=20
> > > > Also, the patch introduces the following generics which are
> > > > used by the functions mentioned above:
> > > > * BITOP_BITS_PER_WORD
> > > > * BITOP_MASK
> > > > * BITOP_WORD
> > > > * BITOP_TYPE
> > > >=20
> > > > These functions and macros can be useful for architectures
> > > > that don't have corresponding arch-specific instructions.
> > >=20
> > > Logically this paragraph may better move ahead of the BITOP_*
> > > one.
> > >=20
> > > > Because of that x86 has the following check in the macros
> > > > test_bit(),
> > > > __test_and_set_bit(), __test_and_clear_bit(),
> > > > __test_and_change_bit():
> > > > =C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();
> > > > It was necessary to make bitop bad size check generic too, so
> > > > arch_check_bitop_size() was introduced.
> > >=20
> > > Not anymore, with the most recent adjustments? There's nothing
> > > arch-
> > > specific anymore in the checking.
> > >=20
> > > > @@ -183,7 +180,7 @@ static inline int test_and_set_bit(int nr,
> > > > volatile void *addr)
> > > > =C2=A0 * If two examples of this operation race, one can appear to
> > > > succeed
> > > > =C2=A0 * but actually fail.=C2=A0 You must protect multiple accesse=
s with
> > > > a
> > > > lock.
> > > > =C2=A0 */
> > > > -static inline int __test_and_set_bit(int nr, void *addr)
> > > > +static inline int arch__test_and_set_bit(int nr, volatile void
> > > > *addr)
> > >=20
> > > I think I raised this point before: Why arch__ here, ...
> > >=20
> > > > @@ -232,7 +226,7 @@ static inline int test_and_clear_bit(int
> > > > nr,
> > > > volatile void *addr)
> > > > =C2=A0 * If two examples of this operation race, one can appear to
> > > > succeed
> > > > =C2=A0 * but actually fail.=C2=A0 You must protect multiple accesse=
s with
> > > > a
> > > > lock.
> > > > =C2=A0 */
> > > > -static inline int __test_and_clear_bit(int nr, void *addr)
> > > > +static inline int arch__test_and_clear_bit(int nr, volatile
> > > > void
> > > > *addr)
> > >=20
> > > ... here, ...
> > >=20
> > > > @@ -243,13 +237,10 @@ static inline int
> > > > __test_and_clear_bit(int
> > > > nr, void *addr)
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 return oldbit;
> > > > =C2=A0}
> > > > -#define __test_and_clear_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > -=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > -=C2=A0=C2=A0=C2=A0 __test_and_clear_bit(nr, addr);=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > -})
> > > > +#define arch__test_and_clear_bit arch__test_and_clear_bit
> > > > =C2=A0
> > > > =C2=A0/* WARNING: non atomic and it can be reordered! */
> > > > -static inline int __test_and_change_bit(int nr, void *addr)
> > > > +static inline int arch__test_and_change_bit(int nr, volatile
> > > > void
> > > > *addr)
> > >=20
> > > ... and here, while ...
> > >=20
> > > > @@ -307,8 +295,7 @@ static inline int variable_test_bit(int nr,
> > > > const volatile void *addr)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 return oldbit;
> > > > =C2=A0}
> > > > =C2=A0
> > > > -#define test_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > -=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +#define arch_test_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > >=20
> > > ... just arch_ here? I don't like the double underscore infixes
> > > very
> > > much, but I'm okay with them as long as they're applied
> > > consistently.
> >=20
> > Common code and x86 use __test_and_clear_bit(), and this patch
> > provides
> > a generic version of __test_and_clear_bit(). To emphasize that
> > generic__test_and_clear_bit() is a common implementation of
> > __test_and_clear_bit(), the double underscore was retained. Also,
> > test_and_clear_bit() exists and if one day it will be needed to
> > provide
> > a generic version of it, then it will be needed to have
> > generic__test_and_clear_bit() and generic_test_and_clear_bit()
> >=20
> > A similar logic was chosen for test_bit.
>=20
> Right, but in all of your reply arch_ doesn't appear at all.
I am a little confused here. According to my logic, should it be
arch___test_and_set_bit() and generic___test_and_set_bit()?

If you are asking why there is no generic implementation for
test_and_clear_bit() without the double underscores, the reason is that
Arm, PPC, and x86 don't use generic code and rely on specific
instructions for this operation. Therefore, I didn't see much sense in
providing a generic version of test_and_clear_bit(), at least, for now.


>  Yet the
> question was: Why then not arch__test_bit(), to match the other arch
> helpers?
Because no one uses __test_bit(). Everywhere is used test_bit().

>=20
> > > > --- a/xen/include/xen/bitops.h
> > > > +++ b/xen/include/xen/bitops.h
> > > > @@ -65,10 +65,144 @@ static inline int generic_flsl(unsigned
> > > > long
> > > > x)
> > > > =C2=A0 * scope
> > > > =C2=A0 */
> > > > =C2=A0
> > > > +#define BITOP_MASK(nr)=C2=A0 ((bitop_uint_t)1 << ((nr) %
> > > > BITOP_BITS_PER_WORD))
> > > > +
> > > > +#define BITOP_WORD(nr)=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > > > +
> > > > +extern void __bitop_bad_size(void);
> > > > +
> > > > =C2=A0/* --------------------- Please tidy above here -------------=
-
> > > > ----
> > > > --- */
> > > > =C2=A0
> > > > =C2=A0#include <asm/bitops.h>
> > > > =C2=A0
> > > > +#ifndef arch_check_bitop_size
> > > > +
> > > > +#define bitop_bad_size(addr) sizeof(*(addr)) <
> > > > sizeof(bitop_uint_t)
> > >=20
> > > Nit: Missing parentheses around the whole expression.
> > >=20
> > > > +#define arch_check_bitop_size(addr) \
> > > > +=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();
> > >=20
> > > Apart from the arch_ prefix that now wants dropping, this macro
> > > (if
> > > we
> > > want one in the first place)=C2=A0
> > What do you mean by 'want' here? I thought it is pretty necessary
> > from
> > safety point of view to have this check.
>=20
> I don't question the check. What I was questioning is the need for a
> macro to wrap that, seeing how x86 did without. I'm not outright
> objecting to such a macro, though.
We can follow x86 approach as we there's no any more intention to allow
arch overrides.

>=20
> > Except arch_ prefix does it make sense to drop "#ifndef
> > arch_check_bitop_size" around this macros?
>=20
> Of course, as with arch_ dropped from the name there's no intention
> to
> allow arch overrides.
>=20
> > > > +/**
> > > > + * generic__test_and_set_bit - Set a bit and return its old
> > > > value
> > > > + * @nr: Bit to set
> > > > + * @addr: Address to count from
> > > > + *
> > > > + * This operation is non-atomic and can be reordered.
> > > > + * If two examples of this operation race, one can appear to
> > > > succeed
> > > > + * but actually fail.=C2=A0 You must protect multiple accesses wit=
h
> > > > a
> > > > lock.
> > > > + */
> > > > +static always_inline bool
> > > > +generic__test_and_set_bit(unsigned long nr, volatile void
> > > > *addr)
> > >=20
> > > The original per-arch functions all use "int" for their first
> > > parameter.
> > > Here you use unsigned long, without any mention in the
> > > description of
> > > the
> > > potential behavioral change. Which is even worse given that then
> > > x86
> > > ends
> > > up inconsistent with Arm and PPC in this regard, by ...
> > >=20
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > > > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile bitop_ui=
nt_t *)addr +
> > > > BITOP_WORD(nr);
> > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t old =3D *p;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 *p =3D old | mask;
> > > > +=C2=A0=C2=A0=C2=A0 return (old & mask);
> > > > +}
> > > > +
> > > > +/**
> > > > + * generic__test_and_clear_bit - Clear a bit and return its
> > > > old
> > > > value
> > > > + * @nr: Bit to clear
> > > > + * @addr: Address to count from
> > > > + *
> > > > + * This operation is non-atomic and can be reordered.
> > > > + * If two examples of this operation race, one can appear to
> > > > succeed
> > > > + * but actually fail.=C2=A0 You must protect multiple accesses wit=
h
> > > > a
> > > > lock.
> > > > + */
> > > > +static always_inline bool
> > > > +generic__test_and_clear_bit(bitop_uint_t nr, volatile void
> > > > *addr)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > > > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile bitop_ui=
nt_t *)addr +
> > > > BITOP_WORD(nr);
> > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t old =3D *p;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 *p =3D old & ~mask;
> > > > +=C2=A0=C2=A0=C2=A0 return (old & mask);
> > > > +}
> > > > +
> > > > +/* WARNING: non atomic and it can be reordered! */
> > > > +static always_inline bool
> > > > +generic__test_and_change_bit(unsigned long nr, volatile void
> > > > *addr)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > > > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile bitop_ui=
nt_t *)addr +
> > > > BITOP_WORD(nr);
> > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t old =3D *p;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 *p =3D old ^ mask;
> > > > +=C2=A0=C2=A0=C2=A0 return (old & mask);
> > > > +}
> > > > +/**
> > > > + * generic_test_bit - Determine whether a bit is set
> > > > + * @nr: bit number to test
> > > > + * @addr: Address to start counting from
> > > > + */
> > > > +static always_inline bool generic_test_bit(int nr, const
> > > > volatile
> > > > void *addr)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > > > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile bitop_ui=
nt_t *)addr +
> > > > BITOP_WORD(nr);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return (*p & mask);
> > > > +}
> > > > +
> > > > +static always_inline bool
> > > > +__test_and_set_bit(unsigned long nr, volatile void *addr)
> > > > +{
> > > > +#ifndef arch__test_and_set_bit
> > > > +#define arch__test_and_set_bit generic__test_and_set_bit
> > > > +#endif
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return arch__test_and_set_bit(nr, addr);
> > >=20
> > > ... silently truncating and sign-converting nr here.
> > Missed that fact. AFAIU there is no specific reason for bit number
> > to
> > be 'int' for this function, so it makes sense to update x86's
> > prototype
> > of arch__test_and_set_bit() to:
> > =C2=A0=C2=A0 static inline int arch__test_and_set_bit(unsigned long nr,
> > volatile
> > =C2=A0=C2=A0 void *addr).
> > =C2=A0=C2=A0=20
> > But probably I can't use 'unsigned long' here too, as it should a
> > compilation error around 'btsl' instruction.
> >=20
> > So it can be or 'unsinged int' or 'int'.
> > >=20
> > > As to generic_test_bit() - please don't cast away const-ness
> > > there.
> > >=20
> > > > +}
> > > > +#define __test_and_set_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 arch_check_bitop_size(addr);=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 __test_and_set_bit(nr, addr);=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > > > +})
> > > > +
> > > > +static always_inline bool
> > > > +__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
> > >=20
> > > Oddly enough here at least you use bitop_uint_t, but that's still
> > > ...
> > >=20
> > > > +{
> > > > +#ifndef arch__test_and_clear_bit
> > > > +#define arch__test_and_clear_bit generic__test_and_clear_bit
> > > > +#endif
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return arch__test_and_clear_bit(nr, addr);
> > >=20
> > > ... meaning a signedness conversion on x86 then. And beware: You
> > > can't
> > > simply change x86'es code to use bitop_uint_t. The underlying
> > > insns
> > > used
> > > interpret the bit position as a signed number, i.e. permitting
> > > accesses
> > > below the incoming pointer (whether it really makes sense to be
> > > that
> > > way
> > > is a separate question). I'm afraid I have no good suggestion how
> > > to
> > > deal
> > > with that: Any approach I can think of is either detrimental to
> > > the
> > > generic implementation or would have unwanted effects on the x86
> > > one.
> > > Others, anyone?
> > Is the signedness conversion here a big problem? I suppose no one
> > will
> > pass a negative number to nr.
> >=20
> > It seems to me that it would be better to use 'int' everywhere and
> > not
> > use bitop_uint_t for 'nr' since it is just a bit position. 'Int'
> > provides enough range for possible bit number.
>=20
> Indeed, and that's then hopefully less of a risk as to introducing
> hard
> to spot issues. Provided Arm and PPC are okay with that type then as
> well.
Then I will update prototypes of generic functions correspondingly.

>=20
> > > > --- a/xen/include/xen/types.h
> > > > +++ b/xen/include/xen/types.h
> > > > @@ -64,6 +64,12 @@ typedef __u64 __be64;
> > > > =C2=A0
> > > > =C2=A0typedef unsigned int __attribute__((__mode__(__pointer__)))
> > > > uintptr_t;
> > > > =C2=A0
> > > > +#ifndef BITOP_TYPE
> > > > +#define BITOP_BITS_PER_WORD 32
> > > > +
> > > > +typedef uint32_t bitop_uint_t;
> > > > +#endif
> > >=20
> > > I think you mentioned to me before why this needs to live here,
> > > not
> > > in
> > > xen/bitops.h. Yet I don't recall the reason, and the description
> > > (hint,
> > > hint) doesn't say anything either.
> > If I remember correctly ( after this phrase I think I have to
> > update
> > the description ) the reason was that if I put that to
> > xen/bitops.h:
> >=20
> > =C2=A0=C2=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0 #include <asm/bitops.h>
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 #ifndef BITOP_TYPE
> > =C2=A0=C2=A0=C2=A0 #define BITOP_BITS_PER_WORD 32
> > =C2=A0=C2=A0=C2=A0 /* typedef uint32_t bitop_uint_t; */
> > =C2=A0=C2=A0=C2=A0 #endif
> > =C2=A0=C2=A0=C2=A0 ...
> >=20
> > Then we will have an issue that we can't use the generic definition
> > of=20
> > BITOP_BITS_PER_WORD and bitop_uint_t in asm/bitops.h as it is
> > defined
> > after inclusion of <asm/bitops.h>.
> >=20
> > But if to put it to <xen/types.h> then such problem won't occur.
> >=20
> > If it still makes sense, then I'll update the description in the
> > next
> > patch version.
>=20
> I see. But we don't need to allow for arch overrides here anymore, so
> in
> xen/bitops.h couldn't we as well have
>=20
> #define BITOP_BITS_PER_WORD 32
> typedef uint32_t bitop_uint_t;
>=20
> ... (if necessary)
>=20
> #include <asm/bitops.h>
>=20
> ?
Good point. If there is not need to allow for arch overrides then we
can use suggested above approach. Thanks.

~ Oleksii

