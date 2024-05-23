Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 006BA8CD892
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 18:41:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728757.1133799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sABUJ-0004nV-SW; Thu, 23 May 2024 16:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728757.1133799; Thu, 23 May 2024 16:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sABUJ-0004lA-PT; Thu, 23 May 2024 16:40:19 +0000
Received: by outflank-mailman (input) for mailman id 728757;
 Thu, 23 May 2024 16:40:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TgV8=M2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sABUI-0004l4-Ms
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 16:40:18 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22bd5327-1923-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 18:40:17 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56e48d0a632so16271677a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 09:40:17 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c34fed1sm20017906a12.96.2024.05.23.09.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 09:40:15 -0700 (PDT)
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
X-Inumbo-ID: 22bd5327-1923-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716482416; x=1717087216; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ByR5oC3ZqlfSCZX3QYIiuX/qOz3B9BfZ8Aja4wUjKq4=;
        b=iOTMbRLFSiX/7nmoVrjIYl4gjDvZcOk8LrGBu4eHzilV94Myfn7HeCexBMl3DbyknS
         +lLEp3SOIU2gM4KCtw2rrdYRqGDqoC3LaMQPsnyMvBeOs06c0JiwipWnLDHKNKTMIQRx
         74ORVtsxmXGDfybNIdjr/zltflB+zaPknAowm7P+92D26SStpbCIwOzccPsKHfCI7nsN
         baky0cNQHTin3bNy1tZakwSIisaTfwnShTagfHgMO/S6oDq4YKvKKbOvIHb/IiMR93Os
         z3OSnbSn7rH1EH/LJWzLtvHQPEnP1i6VLVvpGx7iMLZp/poRMouhXaxQ5So+fOLaRxyX
         QSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716482416; x=1717087216;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ByR5oC3ZqlfSCZX3QYIiuX/qOz3B9BfZ8Aja4wUjKq4=;
        b=eitkM8jg8c3OaMLChExYa38BdbHMeAdXAZC7CuhR3EbhAsjfCv/KMnJHyYXV7JfKov
         ddooNVtG6yewx03GgEIPgUBTr3QL2tbOYXiEyYZYmE+oFTd3pjEMd5ae3wl5BjZTc0mC
         0ysEpvFGzOiF63DAgmKN9V9zLCa0dxekgd7v+uoT2ivHAcwf48Am/gaKXJvhsoLqEZkb
         lGT5v4VNdyie/8qXspILkBUHSjRN4ID8V/pyPCEeDOD3303yFppIahgo6e9l+p67RfbV
         BosolURtDod1IRwUVGiWoj+hYFGx7Manac8MpLBrXsLTWyGAAA6iMKFGlhQMM3eFX1HU
         punQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhMWZiEWMNsVHF4/sDjopCyrBisFynKSV2USdBsFQP5FS0nrY13MAbi1+OoQ/9/YX2aGdoWz9TAHj+qA21qXXuzFasdv3zuD4H/1lA6XA=
X-Gm-Message-State: AOJu0YwiUxTVzLneP7EZbFbOEYiBh5kA6MVP5qJDg7OwM2Wu9S4qgXOf
	UMMeSbgdx9KapRVa3QHgtQRdx81dzKmVzhlV1mfGeZh8S4CxgqyS
X-Google-Smtp-Source: AGHT+IEq1SRzfMGIJnUc0Iz+cPnRHCHij+cC8lOh6QoOo8xfEsGjbbvVPocx8HTWoNpDcHPbLbU9uQ==
X-Received: by 2002:a50:d513:0:b0:574:ebf4:f787 with SMTP id 4fb4d7f45d1cf-57832a3b5eemr4728108a12.19.1716482416219;
        Thu, 23 May 2024 09:40:16 -0700 (PDT)
Message-ID: <ea2c01d19160431ed9f6e4e7b6c122ab27aa676b.camel@gmail.com>
Subject: Re: [PATCH v10 02/14] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, Jan
 Beulich <jbeulich@suse.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Date: Thu, 23 May 2024 18:40:14 +0200
In-Reply-To: <a535a3fc-5b90-454f-8d3f-202de631bc49@xen.org>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
	 <219df9d840a183fc55de02aff011c0972a68587c.1715952103.git.oleksii.kurochko@gmail.com>
	 <1554d534-7998-4ad4-9218-579b2568b744@xen.org>
	 <9f02d973c2520d36ee33d01b871378de16ede4d0.camel@gmail.com>
	 <a535a3fc-5b90-454f-8d3f-202de631bc49@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-23 at 15:33 +0100, Julien Grall wrote:
>=20
>=20
> On 23/05/2024 15:11, Oleksii K. wrote:
> > On Thu, 2024-05-23 at 14:00 +0100, Julien Grall wrote:
> > > Hi Oleksii,
> > Hi Julien,
> >=20
> > >=20
> > > On 17/05/2024 14:54, Oleksii Kurochko wrote:
> > > > diff --git a/xen/arch/arm/arm64/livepatch.c
> > > > b/xen/arch/arm/arm64/livepatch.c
> > > > index df2cebedde..4bc8ed9be5 100644
> > > > --- a/xen/arch/arm/arm64/livepatch.c
> > > > +++ b/xen/arch/arm/arm64/livepatch.c
> > > > @@ -10,7 +10,6 @@
> > > > =C2=A0=C2=A0 #include <xen/mm.h>
> > > > =C2=A0=C2=A0 #include <xen/vmap.h>
> > > > =C2=A0=C2=A0=20
> > > > -#include <asm/bitops.h>
> > >=20
> > > It is a bit unclear how this change is related to the patch. Can
> > > you
> > > explain in the commit message?
> > Probably it doesn't need anymore. I will double check and if this
> > change is not needed, I will just drop it in the next patch
> > version.
> >=20
> > >=20
> > > > =C2=A0=C2=A0 #include <asm/byteorder.h>
> > > > =C2=A0=C2=A0 #include <asm/insn.h>
> > > > =C2=A0=C2=A0 #include <asm/livepatch.h>
> > > > diff --git a/xen/arch/arm/include/asm/bitops.h
> > > > b/xen/arch/arm/include/asm/bitops.h
> > > > index 5104334e48..8e16335e76 100644
> > > > --- a/xen/arch/arm/include/asm/bitops.h
> > > > +++ b/xen/arch/arm/include/asm/bitops.h
> > > > @@ -22,9 +22,6 @@
> > > > =C2=A0=C2=A0 #define __set_bit(n,p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(n,p)
> > > > =C2=A0=C2=A0 #define __clear_bit(n,p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 clear_bit(n,p)
> > > > =C2=A0=C2=A0=20
> > > > -#define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=A0=C2=A0 32
> > > > -#define BITOP_MASK(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (1UL << ((nr) %
> > > > BITOP_BITS_PER_WORD))
> > > > -#define BITOP_WORD(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > > > =C2=A0=C2=A0 #define BITS_PER_BYTE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 8
> > >=20
> > > OOI, any reason BITS_PER_BYTE has not been moved as well? I don't
> > > expect
> > > the value to change across arch.
> > I can move it to generic one header too in the next patch version.
> >=20
> > >=20
> > > [...]
> > >=20
> > > > diff --git a/xen/include/xen/bitops.h
> > > > b/xen/include/xen/bitops.h
> > > > index f14ad0d33a..6eeeff0117 100644
> > > > --- a/xen/include/xen/bitops.h
> > > > +++ b/xen/include/xen/bitops.h
> > > > @@ -65,10 +65,141 @@ static inline int generic_flsl(unsigned
> > > > long
> > > > x)
> > > > =C2=A0=C2=A0=C2=A0 * scope
> > > > =C2=A0=C2=A0=C2=A0 */
> > > > =C2=A0=C2=A0=20
> > > > +#define BITOP_BITS_PER_WORD 32
> > > > +typedef uint32_t bitop_uint_t;
> > > > +
> > > > +#define BITOP_MASK(nr)=C2=A0 ((bitop_uint_t)1 << ((nr) %
> > > > BITOP_BITS_PER_WORD))
> > > > +
> > > > +#define BITOP_WORD(nr)=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > > > +
> > > > +extern void __bitop_bad_size(void);
> > > > +
> > > > +#define bitop_bad_size(addr) (sizeof(*(addr)) <
> > > > sizeof(bitop_uint_t))
> > > > +
> > > > =C2=A0=C2=A0 /* --------------------- Please tidy above here ------=
------
> > > > -----
> > > > ---- */
> > > > =C2=A0=C2=A0=20
> > > > =C2=A0=C2=A0 #include <asm/bitops.h>
> > > > =C2=A0=C2=A0=20
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
> > >=20
> > > Sorry for only mentioning this on v10. I think this comment
> > > should be
> > > duplicated (or moved to) on top of test_bit() because this is
> > > what
> > > everyone will use. This will avoid the developper to follow the
> > > function
> > > calls and only notice the x86 version which says "This function
> > > is
> > > atomic and may not be reordered." and would be wrong for all the
> > > other arch.
> > It makes sense to add this comment on top of test_bit(), but I am
> > curious if it is needed to mention that for x86 arch_test_bit() "is
> > atomic and may not be reordered":
>=20
> I would say no because any developper modifying common code can't=20
> relying it.
>=20
> >=20
> > =C2=A0 * This operation is non-atomic and can be reordered. ( Exception=
:
> > for
> > * x86 arch_test_bit() is atomic and may not be reordered )
> > =C2=A0 * If two examples of this operation race, one can appear to
> > succeed
> > =C2=A0 * but actually fail.=C2=A0 You must protect multiple accesses wi=
th a
> > lock.
> > =C2=A0 */
> >=20
> > >=20
> > > > +static always_inline bool
> > > > +generic__test_and_set_bit(int nr, volatile void *addr)
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
> > >=20
> > > Same applies here and ...
> > >=20
> > > > +static always_inline bool
> > > > +generic__test_and_clear_bit(int nr, volatile void *addr)
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
> > >=20
> > > ... here.
> > >=20
> > > > +static always_inline bool
> > > > +generic__test_and_change_bit(int nr, volatile void *addr)
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
> > > > +=C2=A0=C2=A0=C2=A0 const volatile bitop_uint_t *p =3D
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (c=
onst volatile bitop_uint_t *)addr +
> > > > BITOP_WORD(nr);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return (*p & mask);
> > > > +}
> > > > +
> > > > +static always_inline bool
> > > > +__test_and_set_bit(int nr, volatile void *addr)
> > > > +{
> > > > +#ifndef arch__test_and_set_bit
> > > > +#define arch__test_and_set_bit generic__test_and_set_bit
> > > > +#endif
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return arch__test_and_set_bit(nr, addr);
> > > > +}
> > >=20
> > > NIT: It is a bit too late to change this one. But I have to
> > > admit, I
> > > don't understand the purpose of the static inline when you could
> > > have
> > > simply call...
> > >=20
> > > > +#define __test_and_set_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > +=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();=
 \
> > > > +=C2=A0=C2=A0=C2=A0 __test_and_set_bit(nr, addr);=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 \
> > >=20
> > > ... __arch__test_and_set_bit here.
> > I just wanted to be in sync with other non-atomic test*_bit()
> > operations and Andrew's patch series ( xen/bitops: Reduce the mess,
> > starting with ffs() ).
>=20
> I looked at Andrew series and I can't seem to find an example where
> he=20
> uses both the macro + static inline. He seems only use a static
> inline.
> Do you have any pointer?
>=20
> But by any chance are you referring to the pattern on x86? If so, I=20
> would really like to understand what's the benefits of introducing a
> a=20
> one-liner static inline which is "shadowed" by a macro...
Yes, I was referring to the x86 pattern.

I tried to find the reason in the commit but couldn't:
https://lists.xenproject.org/archives/html/xen-changelog/2008-03/msg00097.h=
tml

For some reason, I also couldn't find the mailing list thread for this.

Perhaps Jan could help here, based on the commit message he might have
a suggestion.

~ Oleksii

