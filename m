Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F088564A9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 14:42:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681813.1060780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabzd-0008C5-RJ; Thu, 15 Feb 2024 13:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681813.1060780; Thu, 15 Feb 2024 13:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rabzd-00089Q-N9; Thu, 15 Feb 2024 13:41:37 +0000
Received: by outflank-mailman (input) for mailman id 681813;
 Thu, 15 Feb 2024 13:41:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G1Z8=JY=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rabzc-00089K-BN
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 13:41:36 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee70022f-cc07-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 14:41:33 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a3da5bf7f9cso61225266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 05:41:33 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170906088d00b00a3d2f55bc2esm546073eje.161.2024.02.15.05.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 05:41:32 -0800 (PST)
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
X-Inumbo-ID: ee70022f-cc07-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708004493; x=1708609293; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T5SfKdVPXndjEJEfVT6v0PanudGXm19wJIc9RSghH4I=;
        b=CS82GIxtYJzRtOnsfE7euASlDa6YQMFSgl3aW8eGao/PHz+pvENJhZIQl++oqWSXBD
         AFXTWp7xO7wwkZiyUC82WDOGwQ+cdC4BdF0SUtGpDynfW7TgvEOG5C0uZ8DGiwmeTzOz
         bgXbL/VCqcEeEPO9ZPQKkPA7EbPL2dE3V1V4+j0QzVB/hcF/s9CHuRm6oLSlP1qjWiLh
         7PIGGRCYO/b5ybrUThdX0jCp379IRWHuaGdBUxdoyUn3cL7JcZhl4DDgAc1boNn4bH8k
         vKX2j2K25OHqlWEZeLbGdS6gROkSVTQYOjiztJ/OKG6rPYD/yegd8HSLBM3T28ui8EE/
         Y6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708004493; x=1708609293;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T5SfKdVPXndjEJEfVT6v0PanudGXm19wJIc9RSghH4I=;
        b=dTpQbebwKHkV1HHtMpte5S+YBue5iivRSghA60aAhQv9CMmELQm5abPUdTYwq7yiw+
         mv6m0rBvB1hFOIEOU0LKYouDV922g5Kfw5chetyF4k9dizuy0I00mWJM31qpPsS0x5pJ
         vSSN7FAmanFDMqKFJCpsP4EP5eK2U4sQ6+yGTgoxM1frobFXZWrj8YMtE+Svf2iu1m3w
         mZ1zGFdbuNVOTNnXOJljJsAR40DlHBh6byitC9XBOfZKdWvdzpcH4hl51OWkv2paiXgf
         yaGmF1GN+ID9i4Q65xuBU5XBj7PVXpTXgt++O4eA5lWPWRHbTecGgJI55u77TyCRl76/
         IONg==
X-Forwarded-Encrypted: i=1; AJvYcCU23ye6dQl0lnN+n9uXcDlBdXolrBdRLB7XpMf/i+nhSHO+vSW92ps8cHsfg1+Ay9rJmLvaw03NJfURxfUE5WvO5fSxUP1Yb4gQxnKW56o=
X-Gm-Message-State: AOJu0YwbRwx5QEe1J3GGNniruVAJR/5lg9g2iEcR4yZ62yEVA3nDuuKf
	iIWqk8cXgSmUFXXoxgwUFDQgVOwk7PdJxbwQM5nC33j3BVjvaTIe
X-Google-Smtp-Source: AGHT+IHsix9v3lLgCfSz8k3QYchAIfRy3on6asWIKp0wqkHHYXR45obzOeQnN3NfswppfMwqtPa89Q==
X-Received: by 2002:a17:906:855:b0:a3c:d5b2:f53 with SMTP id f21-20020a170906085500b00a3cd5b20f53mr1177819ejd.15.1708004492968;
        Thu, 15 Feb 2024 05:41:32 -0800 (PST)
Message-ID: <28844fdfcf5eea515497fb7b5fd8ea6fb1c5ebaa.camel@gmail.com>
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 15 Feb 2024 14:41:31 +0100
In-Reply-To: <9e50ef30-8dc6-4380-aa65-724e5a376c10@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
	 <9e50ef30-8dc6-4380-aa65-724e5a376c10@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (ret), "+A" (*ptr)=
 \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (new) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" ); \
> > +})
> > +
> > +#define emulate_xchg_1_2(ptr, new, ret, release_barrier,
> > acquire_barrier) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 uint32_t *ptr_32b_aligned =3D (uint32_t *)ALIGN_DOW=
N((unsigned
> > long)ptr, 4); \
>=20
> You now appear to assume that this macro is only used with inputs not
> crossing word boundaries. That's okay as long as suitably guaranteed
> at the use sites, but imo wants saying in a comment.
>=20
> > +=C2=A0=C2=A0=C2=A0 uint8_t mask_l =3D ((unsigned long)(ptr) & (0x8 - s=
izeof(*ptr)))
> > * BITS_PER_BYTE; \
>=20
> Why 0x8 (i.e. spanning 64 bits), not 4 (matching the uint32_t use
> above)?
The idea to read 8 bytes was to deal with crossing word boundary. So if
our address is 0x3 and we have to xchg() 2 bytes, what will cross 4
byte boundary. Instead we align add 0x3, so it will become 0x0 and then
just always work with 8 bytes.

>=20
> > +=C2=A0=C2=A0=C2=A0 unsigned long new_ =3D (unsigned long)(new) << mask=
_l; \
> > +=C2=A0=C2=A0=C2=A0 unsigned long ret_; \
> > +=C2=A0=C2=A0=C2=A0 unsigned long rc; \
>=20
> Similarly, why unsigned long here?
sizeof(unsigned long) is 8 bytes and it was chosen as we are working
with lc/sc.d which are working with 8 bytes.

>=20
> I also wonder about the mix of underscore suffixed (or not) variable
> names here.
If the question about ret_, then the same as before size of ret
argument of the macros will be 1 or 2, but {lc/sc}.d expected to work
with 8 bytes.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release_barrier \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr.d %0, %2\n" \
>=20
> Even here it's an 8-byte access. Even if - didn't check - the insn
> was
> okay to use with just a 4-byte aligned pointer, wouldn't it make
> sense
> then to 8-byte align it, and be consistent throughout this macro wrt
> the base unit acted upon? Alternatively, why not use lr.w here, thus
> reducing possible collisions between multiple CPUs accessing the same
> cache line?
According to the docs:
LR and SC operate on naturally-aligned 64-bit (RV64 only) or 32-bit
words in memory. Misaligned
addresses will generate misaligned address exceptions.

My intention was to deal with 4-byte crossing boundary. so if ptr is 4-
byte aligned then by reading 8-bytes we shouldn't care about boundary
crossing, if I am not missing something.

But your opinion about reduction of collisions makes sense also...

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 and=C2=A0 %1,=
 %0, %z4\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 or=C2=A0=C2=
=A0 %1, %1, %z3\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 sc.d %1, %1, =
%2\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bnez %1, 0b\n=
" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acquire_barrier \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3D&r" (ret_), "=3D&r" (=
rc), "+A" (*ptr_32b_aligned) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "rJ" (new_), "rJ" (~mask)=
 \
>=20
> I think that as soon as there are more than 2 or maybe 3 operands,
> legibility is vastly improved by using named asm() operands.
Just to clarify you mean that it would be better to use instead of %0
use names?

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory"); \
>=20
> Nit: Missing blank before closing parenthesis.
>=20
> > +=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 ret =3D (__typeof__(*(ptr)))((ret_ & mask) >> mask_=
l); \
> > +})
>=20
> Why does "ret" need to be a macro argument? If you had only the
> expression here, not the the assigment, ...
>=20
> > +#define __xchg_generic(ptr, new, size, sfx, release_barrier,
> > acquire_barrier) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(ptr) ptr__ =3D (ptr); \
>=20
> Is this local variable really needed? Can't you use "ptr" directly
> in the three macro invocations?
>=20
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) new__ =3D (new); \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) ret__; \
> > +=C2=A0=C2=A0=C2=A0 switch (size) \
> > +=C2=A0=C2=A0=C2=A0 { \
> > +=C2=A0=C2=A0=C2=A0 case 1: \
> > +=C2=A0=C2=A0=C2=A0 case 2: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 emulate_xchg_1_2(ptr__, new=
__, ret__, release_barrier,
> > acquire_barrier); \
>=20
> ... this would become
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret__ =3D emulate_xchg_1_2(ptr=
__, new__, release_barrier,
> acquire_barrier); \
>=20
> But, unlike assumed above, there's no enforcement here that a 2-byte
> quantity won't cross a word, double-word, cache line, or even page
> boundary. That might be okay if then the code would simply crash
> (like
> the AMO insns emitted further down would), but aiui silent
> misbehavior
> would result.
As I mentioned above with 4-byte alignment and then reading and working
with 8-byte then crossing a word or double-word boundary shouldn't be
an issue.

I am not sure that I know how to check that we are crossing cache line
boundary.

Regarding page boundary, if the next page is mapped then all should
work fine, otherwise it will be an exception.

>=20
> Also nit: The switch() higher up is (still/again) missing blanks.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
> > +=C2=A0=C2=A0=C2=A0 case 4: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __amoswap_generic(ptr__, ne=
w__, ret__,\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ".w" sfx,=C2=A0 release_barrier,
> > acquire_barrier); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
> > +=C2=A0=C2=A0=C2=A0 case 8: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __amoswap_generic(ptr__, ne=
w__, ret__,\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ".d" sfx,=C2=A0 release_barrier,
> > acquire_barrier); \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
> > +=C2=A0=C2=A0=C2=A0 default: \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 STATIC_ASSERT_UNREACHABLE()=
; \
> > +=C2=A0=C2=A0=C2=A0 } \
> > +=C2=A0=C2=A0=C2=A0 ret__; \
> > +})
> > +
> > +#define xchg_relaxed(ptr, x) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) x_ =3D (x); \
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(=
*(ptr)),
> > "", "", ""); \
> > +})
> > +
> > +#define xchg_acquire(ptr, x) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) x_ =3D (x); \
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(=
*(ptr)), \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "", "",
> > RISCV_ACQUIRE_BARRIER); \
> > +})
> > +
> > +#define xchg_release(ptr, x) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) x_ =3D (x); \
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(=
*(ptr)),\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "", RISCV_RELEASE_BARRIER,
> > ""); \
> > +})
> > +
> > +#define xchg(ptr,x) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) ret__; \
> > +=C2=A0=C2=A0=C2=A0 ret__ =3D (__typeof__(*(ptr))) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __x=
chg_generic(ptr, (unsigned long)(x),
> > sizeof(*(ptr)), \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ".aqrl", "", ""); \
>=20
> The .aqrl doesn't look to affect the (emulated) 1- and 2-byte cases.
>=20
> Further, amoswap also exists in release-only and acquire-only forms.
> Why do you prefer explicit barrier insns over those? (Looks to
> similarly apply to the emulation path as well as to the cmpxchg
> machinery then, as both lr and sc also come in all four possible
> acquire/release forms. Perhaps for the emulation path using
> explicit barriers is better, in case the acquire/release forms of
> lr/sc - being used inside the loop - might perform worse.)
As 1- and 2-byte cases are emulated I decided that is not to provide
sfx argument for emulation macros as it will not have to much affect on
emulated types and just consume more performance on acquire and release
version of sc/ld instructions.


> >=20
>=20
> No RISCV_..._BARRIER for use here and ...
>=20
> > +=C2=A0=C2=A0=C2=A0 ret__; \
> > +})
> > +
> > +#define __cmpxchg(ptr, o, n, s) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) ret__; \
> > +=C2=A0=C2=A0=C2=A0 ret__ =3D (__typeof__(*(ptr))) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __c=
mpxchg_generic(ptr, (unsigned long)(o), (unsigned
> > long)(n), \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s, ".rl", "", " fence rw, rw\n"); \
>=20
> ... here? And anyway, wouldn't it make sense to have
>=20
> #define cmpxchg(ptr, o, n) __cmpxchg(ptr, o, n, sizeof(*(ptr))
>=20
> to limit redundancy?
>=20
> Plus wouldn't
>=20
> #define __cmpxchg(ptr, o, n, s) \
> =C2=A0=C2=A0=C2=A0 ((__typeof__(*(ptr))) \
> =C2=A0=C2=A0=C2=A0=C2=A0 __cmpxchg_generic(ptr, (unsigned long)(o), (unsi=
gned long)(n), \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s, ".rl", "", =
" fence rw, rw\n"))
>=20
> be shorter and thus easier to follow as well? As I notice only now,
> this would apparently apply further up as well.
I understand your point about "#define cmpxchg(ptr, o, n) __cmpxchg(",
but I can't undestand how the definition of __cmxchng should be done
shorter. Could you please clarify that?

~ Oleksii


