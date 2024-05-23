Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797278CD56B
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728531.1133473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9Ao-0002Jc-8Q; Thu, 23 May 2024 14:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728531.1133473; Thu, 23 May 2024 14:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9Ao-0002Hy-5M; Thu, 23 May 2024 14:12:02 +0000
Received: by outflank-mailman (input) for mailman id 728531;
 Thu, 23 May 2024 14:12:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgV8=M2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sA9Am-0002Hd-8X
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:12:00 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6acb6901-190e-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 16:11:58 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a59b178b75bso841729366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:11:58 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17894d4bsm1931498566b.78.2024.05.23.07.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 07:11:57 -0700 (PDT)
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
X-Inumbo-ID: 6acb6901-190e-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716473518; x=1717078318; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yVXNRusbxlss+tNEO8P//ChEiCeJpTC41lB9HVxMqNs=;
        b=ffD8iK3gle8oDGCEotOYBkTTvpj+Lkwv3tyU5AHyj5kjbBDkwaS21jAX+UPRJ/yF+j
         D168mPrMH8anPM0YfT3bSu3SZc4hVFJvNF/haelOYGrkpeAs4dwHVpCbf5fhzB9KRm1R
         W3WU6y6ZPSKogIuU3yT8z2dazCsUN/pW66zGClXy9hd/tWRi+vMS8KDzCpc5NN5kFsIQ
         SORi6dm+ecpIcC8BGmmRiMEK3z/nCkEwAiiedkjHNwZUGbIUSWNP+/queMl9HYRYImM2
         LKj2y4sCVN3C2Qo/nB+eV8H6eDyssuUxxAeb+bZGqyPewbNH/cEWorXRYvFyG1yXKoxh
         mMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716473518; x=1717078318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVXNRusbxlss+tNEO8P//ChEiCeJpTC41lB9HVxMqNs=;
        b=F4XYu2ZJ26LNUbHatKdNmNUwE/pW/oX9VyuEtsAgH3VR/HJk+gwy4DDPLIH69zpV7P
         n5OgLf/11Lr82GU70bBuXt/saJu9PGmy3HmTb1crPx38cO1wos+mKKJVJVCi/qjpiM9D
         iZV6lw89aXElOrElntFPTYiJ1+Pk/iyMEZ0SyWefjmyY4hd+wVgHZeiUzGGD2upO1UTR
         U6Jg0ogZ/sJpFemdZB7JtS3bzJiV1FFdIR9HEeSjmE8LL93O4xxzRQiJuj1Pjw7Cv1kC
         Oqbf+RVZuhPX0KenigZLdiZREDdRPkqqDvLCOLHWoSL/tlv2Y/0iUTYcHNTyFdpTDqvS
         /g6w==
X-Forwarded-Encrypted: i=1; AJvYcCVHJ2T9f4z57nLBPSQhLY22HeGQinO+Jdp3qaw2pTgU3oykQBTLOkoOittLT9+nM2CkLVo268HJg4/dM4sAm5Qt7bXI6wK5TUXeq8ZM+rM=
X-Gm-Message-State: AOJu0YzsZf3fJxMPW0QJat2UwdKNgv1eWYdY1y1BVMy9QqMh/E8Js4wL
	eH2sQBmrqMQgR0dIeyx3r71IXnt99rcr+HZvInIEOBxm6QQI1eAu
X-Google-Smtp-Source: AGHT+IHit7qXKUDSGMBFMnNQSSQ5qOP+KRrpkTdFUVGpDJI7SOCmjXil9bJCSmXmhCn8EG2Rw2NioQ==
X-Received: by 2002:a17:906:ce36:b0:a58:e3d9:e2d6 with SMTP id a640c23a62f3a-a6228125456mr360154166b.56.1716473517657;
        Thu, 23 May 2024 07:11:57 -0700 (PDT)
Message-ID: <9f02d973c2520d36ee33d01b871378de16ede4d0.camel@gmail.com>
Subject: Re: [PATCH v10 02/14] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Date: Thu, 23 May 2024 16:11:55 +0200
In-Reply-To: <1554d534-7998-4ad4-9218-579b2568b744@xen.org>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
	 <219df9d840a183fc55de02aff011c0972a68587c.1715952103.git.oleksii.kurochko@gmail.com>
	 <1554d534-7998-4ad4-9218-579b2568b744@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-23 at 14:00 +0100, Julien Grall wrote:
> Hi Oleksii,
Hi Julien,

>=20
> On 17/05/2024 14:54, Oleksii Kurochko wrote:
> > diff --git a/xen/arch/arm/arm64/livepatch.c
> > b/xen/arch/arm/arm64/livepatch.c
> > index df2cebedde..4bc8ed9be5 100644
> > --- a/xen/arch/arm/arm64/livepatch.c
> > +++ b/xen/arch/arm/arm64/livepatch.c
> > @@ -10,7 +10,6 @@
> > =C2=A0 #include <xen/mm.h>
> > =C2=A0 #include <xen/vmap.h>
> > =C2=A0=20
> > -#include <asm/bitops.h>
>=20
> It is a bit unclear how this change is related to the patch. Can you=20
> explain in the commit message?
Probably it doesn't need anymore. I will double check and if this
change is not needed, I will just drop it in the next patch version.

>=20
> > =C2=A0 #include <asm/byteorder.h>
> > =C2=A0 #include <asm/insn.h>
> > =C2=A0 #include <asm/livepatch.h>
> > diff --git a/xen/arch/arm/include/asm/bitops.h
> > b/xen/arch/arm/include/asm/bitops.h
> > index 5104334e48..8e16335e76 100644
> > --- a/xen/arch/arm/include/asm/bitops.h
> > +++ b/xen/arch/arm/include/asm/bitops.h
> > @@ -22,9 +22,6 @@
> > =C2=A0 #define __set_bit(n,p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(n,p)
> > =C2=A0 #define __clear_bit(n,p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 clear_bit(n,p)
> > =C2=A0=20
> > -#define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=A0=C2=A0 32
> > -#define BITOP_MASK(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (1UL << ((nr) %
> > BITOP_BITS_PER_WORD))
> > -#define BITOP_WORD(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > =C2=A0 #define BITS_PER_BYTE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 8
>=20
> OOI, any reason BITS_PER_BYTE has not been moved as well? I don't
> expect=20
> the value to change across arch.
I can move it to generic one header too in the next patch version.

>=20
> [...]
>=20
> > diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
> > index f14ad0d33a..6eeeff0117 100644
> > --- a/xen/include/xen/bitops.h
> > +++ b/xen/include/xen/bitops.h
> > @@ -65,10 +65,141 @@ static inline int generic_flsl(unsigned long
> > x)
> > =C2=A0=C2=A0 * scope
> > =C2=A0=C2=A0 */
> > =C2=A0=20
> > +#define BITOP_BITS_PER_WORD 32
> > +typedef uint32_t bitop_uint_t;
> > +
> > +#define BITOP_MASK(nr)=C2=A0 ((bitop_uint_t)1 << ((nr) %
> > BITOP_BITS_PER_WORD))
> > +
> > +#define BITOP_WORD(nr)=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > +
> > +extern void __bitop_bad_size(void);
> > +
> > +#define bitop_bad_size(addr) (sizeof(*(addr)) <
> > sizeof(bitop_uint_t))
> > +
> > =C2=A0 /* --------------------- Please tidy above here ----------------=
-
> > ---- */
> > =C2=A0=20
> > =C2=A0 #include <asm/bitops.h>
> > =C2=A0=20
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
>=20
> Sorry for only mentioning this on v10. I think this comment should be
> duplicated (or moved to) on top of test_bit() because this is what=20
> everyone will use. This will avoid the developper to follow the
> function=20
> calls and only notice the x86 version which says "This function is=20
> atomic and may not be reordered." and would be wrong for all the
> other arch.
It makes sense to add this comment on top of test_bit(), but I am
curious if it is needed to mention that for x86 arch_test_bit() "is
atomic and may not be reordered":

 * This operation is non-atomic and can be reordered. ( Exception: for
* x86 arch_test_bit() is atomic and may not be reordered )
 * If two examples of this operation race, one can appear to succeed
 * but actually fail.  You must protect multiple accesses with a lock.
 */

>=20
> > +static always_inline bool
> > +generic__test_and_set_bit(int nr, volatile void *addr)
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
>=20
> Same applies here and ...
>=20
> > +static always_inline bool
> > +generic__test_and_clear_bit(int nr, volatile void *addr)
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
>=20
> ... here.
>=20
> > +static always_inline bool
> > +generic__test_and_change_bit(int nr, volatile void *addr)
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
> > +=C2=A0=C2=A0=C2=A0 const volatile bitop_uint_t *p =3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cons=
t volatile bitop_uint_t *)addr +
> > BITOP_WORD(nr);
> > +
> > +=C2=A0=C2=A0=C2=A0 return (*p & mask);
> > +}
> > +
> > +static always_inline bool
> > +__test_and_set_bit(int nr, volatile void *addr)
> > +{
> > +#ifndef arch__test_and_set_bit
> > +#define arch__test_and_set_bit generic__test_and_set_bit
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0 return arch__test_and_set_bit(nr, addr);
> > +}
>=20
> NIT: It is a bit too late to change this one. But I have to admit, I=20
> don't understand the purpose of the static inline when you could have
> simply call...
>=20
> > +#define __test_and_set_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > +=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
> > +=C2=A0=C2=A0=C2=A0 __test_and_set_bit(nr, addr);=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 \
>=20
> ... __arch__test_and_set_bit here.
I just wanted to be in sync with other non-atomic test*_bit()
operations and Andrew's patch series ( xen/bitops: Reduce the mess,
starting with ffs() ).

>=20
>=20
> The only two reasons I am not providing an ack is the:
> =C2=A0 * Explanation for the removal of asm/bitops.h in livepatch.c
> =C2=A0 * The placement of the comments
Thanks for review. I'll update the patch and sent new version of the
patch series.

~ Oleksii

>=20
> There are not too important for me.
>=20
> Cheers,
>=20


