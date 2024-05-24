Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6A08CE1FC
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 10:07:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729159.1134275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAPwS-00072v-DW; Fri, 24 May 2024 08:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729159.1134275; Fri, 24 May 2024 08:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAPwS-0006zj-Ac; Fri, 24 May 2024 08:06:20 +0000
Received: by outflank-mailman (input) for mailman id 729159;
 Fri, 24 May 2024 08:06:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqrK=M3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sAPwR-0006zd-Ew
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 08:06:19 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fb3fdc9-19a4-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 10:06:18 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-529646df247so474447e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 01:06:17 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52970c35d35sm122440e87.201.2024.05.24.01.06.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 01:06:16 -0700 (PDT)
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
X-Inumbo-ID: 7fb3fdc9-19a4-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716537977; x=1717142777; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gc46/0Bs/DeTMnCrfIbH5Ji2KJ7kjqNYrVz/R4sgfDk=;
        b=lnoKQaamHcdI1YVEa4CvFGPTQ+MnR/wCbutND2kDs0UGDtYHqY9LPdLHI2ZRTNjaX8
         rINZkN8Rt+1k8/mymmT3UrAHO4s2D3W6BLk/aDFEeUCJHnD0LDVsXduy07Q+9TDGG3P5
         j8ir9jy7E6UQOZ6k8sELdZO7Ugt971L37NMPT/9LzYoLTA4y5YJ6hKXqg/YbdQpoSekW
         /af9jhEq4zKusnl6hAee0PObwm2g4oDC8CP+cEXOOBDlD4hbh2bfIP/p+0Ypaw9uRuae
         QDSMQ03JDbIs8ExBOvnywQ5mcVnGTtmLcvb6I0Q4UjWHr42Dpq0O6ksbKHRQtD59LiYb
         mPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716537977; x=1717142777;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gc46/0Bs/DeTMnCrfIbH5Ji2KJ7kjqNYrVz/R4sgfDk=;
        b=nzzCvJ/P5LTN0BlStkYazHfBGFG3d0m2GiXqhHmzt8acxgV99f4W7+FG1s3V393RvH
         ipLs8DgN+FLdw7InRYYj5HYqR6zLc2Xgod9FUJ+Yv9GiZsQ5h5NEZ8nscaRAG+ChGO+E
         9WsmVI3PHEZgal8sN+WJEd0YRS60WZsJCo++9Ke9dBLEY6jeHST6UeB75T0IimacHH7N
         IER3pYtGDHiQeILypDgPL+OdlPIdB9Mo1wjbXF0bGA0Lt9eIYAhmiH9Ii6SLB+1QYuhw
         n/U4StWzzg7QZt6XlCKamI4SRS0toGXUuBVYcUZkHnFwVM4q7OVS3skF9mWM8t/XWUmi
         IDvA==
X-Forwarded-Encrypted: i=1; AJvYcCWbU7xLmmP7W357dS1+4y2oHJQA3E0CHQ/2s8JQY0JSQVkdrqAHYAr2MQpnnXBeOBeKSUeE0wnRGJIQo5KtGGRRzkQCQ7deDBHsnThxB/k=
X-Gm-Message-State: AOJu0YxDk9IzcnBtjI5FtpcsZGyeyvdp0Hmh6WBFKCUrodMUkxkFVrzp
	vacBKrI9TC1FGv7j6ft99nx8iX4HVYF+bwpFZ4y0HqfsP20GdTOx
X-Google-Smtp-Source: AGHT+IFIK6JglEIYWeON8ju/EUU7VQpPhAb7zmgKHL94c7SqnB5JQT5yOsRhGXmuLB4XL7vWNaRxMg==
X-Received: by 2002:a05:6512:239f:b0:516:c763:b4f5 with SMTP id 2adb3069b0e04-52964109a9cmr1146567e87.3.1716537977101;
        Fri, 24 May 2024 01:06:17 -0700 (PDT)
Message-ID: <120edca82851167832573f3b4876040dedb43b1c.camel@gmail.com>
Subject: Re: [PATCH v10 02/14] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>,  xen-devel@lists.xenproject.org
Date: Fri, 24 May 2024 10:06:15 +0200
In-Reply-To: <2d87e13f-7731-49ed-9628-b3d2b23ebdd4@suse.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
	 <219df9d840a183fc55de02aff011c0972a68587c.1715952103.git.oleksii.kurochko@gmail.com>
	 <1554d534-7998-4ad4-9218-579b2568b744@xen.org>
	 <9f02d973c2520d36ee33d01b871378de16ede4d0.camel@gmail.com>
	 <a535a3fc-5b90-454f-8d3f-202de631bc49@xen.org>
	 <ea2c01d19160431ed9f6e4e7b6c122ab27aa676b.camel@gmail.com>
	 <ed0fec75-2b8c-4003-94ca-edbbb06e185f@suse.com>
	 <c0c8f4665b3cdc80394577d59a6676fa3f41d414.camel@gmail.com>
	 <2d87e13f-7731-49ed-9628-b3d2b23ebdd4@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Fri, 2024-05-24 at 09:35 +0200, Jan Beulich wrote:
> On 24.05.2024 09:25, Oleksii K. wrote:
> > On Fri, 2024-05-24 at 08:48 +0200, Jan Beulich wrote:
> > > On 23.05.2024 18:40, Oleksii K. wrote:
> > > > On Thu, 2024-05-23 at 15:33 +0100, Julien Grall wrote:
> > > > > On 23/05/2024 15:11, Oleksii K. wrote:
> > > > > > On Thu, 2024-05-23 at 14:00 +0100, Julien Grall wrote:
> > > > > > > On 17/05/2024 14:54, Oleksii Kurochko wrote:
> > > > > > > > diff --git a/xen/arch/arm/arm64/livepatch.c
> > > > > > > > b/xen/arch/arm/arm64/livepatch.c
> > > > > > > > index df2cebedde..4bc8ed9be5 100644
> > > > > > > > --- a/xen/arch/arm/arm64/livepatch.c
> > > > > > > > +++ b/xen/arch/arm/arm64/livepatch.c
> > > > > > > > @@ -10,7 +10,6 @@
> > > > > > > > =C2=A0=C2=A0 #include <xen/mm.h>
> > > > > > > > =C2=A0=C2=A0 #include <xen/vmap.h>
> > > > > > > > =C2=A0=C2=A0=20
> > > > > > > > -#include <asm/bitops.h>
> > > > > > >=20
> > > > > > > It is a bit unclear how this change is related to the
> > > > > > > patch.
> > > > > > > Can
> > > > > > > you
> > > > > > > explain in the commit message?
> > > > > > Probably it doesn't need anymore. I will double check and
> > > > > > if
> > > > > > this
> > > > > > change is not needed, I will just drop it in the next patch
> > > > > > version.
> > > > > >=20
> > > > > > >=20
> > > > > > > > =C2=A0=C2=A0 #include <asm/byteorder.h>
> > > > > > > > =C2=A0=C2=A0 #include <asm/insn.h>
> > > > > > > > =C2=A0=C2=A0 #include <asm/livepatch.h>
> > > > > > > > diff --git a/xen/arch/arm/include/asm/bitops.h
> > > > > > > > b/xen/arch/arm/include/asm/bitops.h
> > > > > > > > index 5104334e48..8e16335e76 100644
> > > > > > > > --- a/xen/arch/arm/include/asm/bitops.h
> > > > > > > > +++ b/xen/arch/arm/include/asm/bitops.h
> > > > > > > > @@ -22,9 +22,6 @@
> > > > > > > > =C2=A0=C2=A0 #define __set_bit(n,p)=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set_bit(n,p)
> > > > > > > > =C2=A0=C2=A0 #define __clear_bit(n,p)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear_bit(n,p)
> > > > > > > > =C2=A0=C2=A0=20
> > > > > > > > -#define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=A0=C2=A0 32
> > > > > > > > -#define BITOP_MASK(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (1UL << ((nr) %
> > > > > > > > BITOP_BITS_PER_WORD))
> > > > > > > > -#define BITOP_WORD(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ((nr) /
> > > > > > > > BITOP_BITS_PER_WORD)
> > > > > > > > =C2=A0=C2=A0 #define BITS_PER_BYTE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8
> > > > > > >=20
> > > > > > > OOI, any reason BITS_PER_BYTE has not been moved as well?
> > > > > > > I
> > > > > > > don't
> > > > > > > expect
> > > > > > > the value to change across arch.
> > > > > > I can move it to generic one header too in the next patch
> > > > > > version.
> > > > > >=20
> > > > > > >=20
> > > > > > > [...]
> > > > > > >=20
> > > > > > > > diff --git a/xen/include/xen/bitops.h
> > > > > > > > b/xen/include/xen/bitops.h
> > > > > > > > index f14ad0d33a..6eeeff0117 100644
> > > > > > > > --- a/xen/include/xen/bitops.h
> > > > > > > > +++ b/xen/include/xen/bitops.h
> > > > > > > > @@ -65,10 +65,141 @@ static inline int
> > > > > > > > generic_flsl(unsigned
> > > > > > > > long
> > > > > > > > x)
> > > > > > > > =C2=A0=C2=A0=C2=A0 * scope
> > > > > > > > =C2=A0=C2=A0=C2=A0 */
> > > > > > > > =C2=A0=C2=A0=20
> > > > > > > > +#define BITOP_BITS_PER_WORD 32
> > > > > > > > +typedef uint32_t bitop_uint_t;
> > > > > > > > +
> > > > > > > > +#define BITOP_MASK(nr)=C2=A0 ((bitop_uint_t)1 << ((nr) %
> > > > > > > > BITOP_BITS_PER_WORD))
> > > > > > > > +
> > > > > > > > +#define BITOP_WORD(nr)=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > > > > > > > +
> > > > > > > > +extern void __bitop_bad_size(void);
> > > > > > > > +
> > > > > > > > +#define bitop_bad_size(addr) (sizeof(*(addr)) <
> > > > > > > > sizeof(bitop_uint_t))
> > > > > > > > +
> > > > > > > > =C2=A0=C2=A0 /* --------------------- Please tidy above her=
e ----
> > > > > > > > ----
> > > > > > > > ----
> > > > > > > > -----
> > > > > > > > ---- */
> > > > > > > > =C2=A0=C2=A0=20
> > > > > > > > =C2=A0=C2=A0 #include <asm/bitops.h>
> > > > > > > > =C2=A0=C2=A0=20
> > > > > > > > +/**
> > > > > > > > + * generic__test_and_set_bit - Set a bit and return
> > > > > > > > its
> > > > > > > > old
> > > > > > > > value
> > > > > > > > + * @nr: Bit to set
> > > > > > > > + * @addr: Address to count from
> > > > > > > > + *
> > > > > > > > + * This operation is non-atomic and can be reordered.
> > > > > > > > + * If two examples of this operation race, one can
> > > > > > > > appear
> > > > > > > > to
> > > > > > > > succeed
> > > > > > > > + * but actually fail.=C2=A0 You must protect multiple
> > > > > > > > accesses
> > > > > > > > with
> > > > > > > > a
> > > > > > > > lock.
> > > > > > > > + */
> > > > > > >=20
> > > > > > > Sorry for only mentioning this on v10. I think this
> > > > > > > comment
> > > > > > > should be
> > > > > > > duplicated (or moved to) on top of test_bit() because
> > > > > > > this is
> > > > > > > what
> > > > > > > everyone will use. This will avoid the developper to
> > > > > > > follow
> > > > > > > the
> > > > > > > function
> > > > > > > calls and only notice the x86 version which says "This
> > > > > > > function
> > > > > > > is
> > > > > > > atomic and may not be reordered." and would be wrong for
> > > > > > > all
> > > > > > > the
> > > > > > > other arch.
> > > > > > It makes sense to add this comment on top of test_bit(),
> > > > > > but I
> > > > > > am
> > > > > > curious if it is needed to mention that for x86
> > > > > > arch_test_bit()
> > > > > > "is
> > > > > > atomic and may not be reordered":
> > > > >=20
> > > > > I would say no because any developper modifying common code
> > > > > can't
> > > > > relying it.
> > > > >=20
> > > > > >=20
> > > > > > =C2=A0 * This operation is non-atomic and can be reordered. (
> > > > > > Exception:
> > > > > > for
> > > > > > * x86 arch_test_bit() is atomic and may not be reordered )
> > > > > > =C2=A0 * If two examples of this operation race, one can appear
> > > > > > to
> > > > > > succeed
> > > > > > =C2=A0 * but actually fail.=C2=A0 You must protect multiple acc=
esses
> > > > > > with
> > > > > > a
> > > > > > lock.
> > > > > > =C2=A0 */
> > > > > >=20
> > > > > > >=20
> > > > > > > > +static always_inline bool
> > > > > > > > +generic__test_and_set_bit(int nr, volatile void *addr)
> > > > > > > > +{
> > > > > > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > > > > > > > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile =
bitop_uint_t
> > > > > > > > *)addr +
> > > > > > > > BITOP_WORD(nr);
> > > > > > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t old =3D *p;
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0 *p =3D old | mask;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 return (old & mask);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +/**
> > > > > > > > + * generic__test_and_clear_bit - Clear a bit and
> > > > > > > > return
> > > > > > > > its
> > > > > > > > old
> > > > > > > > value
> > > > > > > > + * @nr: Bit to clear
> > > > > > > > + * @addr: Address to count from
> > > > > > > > + *
> > > > > > > > + * This operation is non-atomic and can be reordered.
> > > > > > > > + * If two examples of this operation race, one can
> > > > > > > > appear
> > > > > > > > to
> > > > > > > > succeed
> > > > > > > > + * but actually fail.=C2=A0 You must protect multiple
> > > > > > > > accesses
> > > > > > > > with
> > > > > > > > a
> > > > > > > > lock.
> > > > > > > > + */
> > > > > > >=20
> > > > > > > Same applies here and ...
> > > > > > >=20
> > > > > > > > +static always_inline bool
> > > > > > > > +generic__test_and_clear_bit(int nr, volatile void
> > > > > > > > *addr)
> > > > > > > > +{
> > > > > > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > > > > > > > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile =
bitop_uint_t
> > > > > > > > *)addr +
> > > > > > > > BITOP_WORD(nr);
> > > > > > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t old =3D *p;
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0 *p =3D old & ~mask;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 return (old & mask);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +/* WARNING: non atomic and it can be reordered! */
> > > > > > >=20
> > > > > > > ... here.
> > > > > > >=20
> > > > > > > > +static always_inline bool
> > > > > > > > +generic__test_and_change_bit(int nr, volatile void
> > > > > > > > *addr)
> > > > > > > > +{
> > > > > > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > > > > > > > +=C2=A0=C2=A0=C2=A0 volatile bitop_uint_t *p =3D (volatile =
bitop_uint_t
> > > > > > > > *)addr +
> > > > > > > > BITOP_WORD(nr);
> > > > > > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t old =3D *p;
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0 *p =3D old ^ mask;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 return (old & mask);
> > > > > > > > +}
> > > > > > > > +/**
> > > > > > > > + * generic_test_bit - Determine whether a bit is set
> > > > > > > > + * @nr: bit number to test
> > > > > > > > + * @addr: Address to start counting from
> > > > > > > > + */
> > > > > > > > +static always_inline bool generic_test_bit(int nr,
> > > > > > > > const
> > > > > > > > volatile
> > > > > > > > void *addr)
> > > > > > > > +{
> > > > > > > > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > > > > > > > +=C2=A0=C2=A0=C2=A0 const volatile bitop_uint_t *p =3D
> > > > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (const volatile bitop_uint_t
> > > > > > > > *)addr +
> > > > > > > > BITOP_WORD(nr);
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0 return (*p & mask);
> > > > > > > > +}
> > > > > > > > +
> > > > > > > > +static always_inline bool
> > > > > > > > +__test_and_set_bit(int nr, volatile void *addr)
> > > > > > > > +{
> > > > > > > > +#ifndef arch__test_and_set_bit
> > > > > > > > +#define arch__test_and_set_bit
> > > > > > > > generic__test_and_set_bit
> > > > > > > > +#endif
> > > > > > > > +
> > > > > > > > +=C2=A0=C2=A0=C2=A0 return arch__test_and_set_bit(nr, addr)=
;
> > > > > > > > +}
> > > > > > >=20
> > > > > > > NIT: It is a bit too late to change this one. But I have
> > > > > > > to
> > > > > > > admit, I
> > > > > > > don't understand the purpose of the static inline when
> > > > > > > you
> > > > > > > could
> > > > > > > have
> > > > > > > simply call...
> > > > > > >=20
> > > > > > > > +#define __test_and_set_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > > > +=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad=
_size(); \
> > > > > > > > +=C2=A0=C2=A0=C2=A0 __test_and_set_bit(nr, addr);=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > >=20
> > > > > > > ... __arch__test_and_set_bit here.
> > > > > > I just wanted to be in sync with other non-atomic
> > > > > > test*_bit()
> > > > > > operations and Andrew's patch series ( xen/bitops: Reduce
> > > > > > the
> > > > > > mess,
> > > > > > starting with ffs() ).
> > > > >=20
> > > > > I looked at Andrew series and I can't seem to find an example
> > > > > where
> > > > > he=20
> > > > > uses both the macro + static inline. He seems only use a
> > > > > static
> > > > > inline.
> > > > > Do you have any pointer?
> > > > >=20
> > > > > But by any chance are you referring to the pattern on x86? If
> > > > > so,
> > > > > I=20
> > > > > would really like to understand what's the benefits of
> > > > > introducing a
> > > > > a=20
> > > > > one-liner static inline which is "shadowed" by a macro...
> > > > Yes, I was referring to the x86 pattern.
> > > >=20
> > > > I tried to find the reason in the commit but couldn't:
> > > > https://lists.xenproject.org/archives/html/xen-changelog/2008-03/ms=
g00097.html
> > > >=20
> > > > For some reason, I also couldn't find the mailing list thread
> > > > for
> > > > this.
> > > >=20
> > > > Perhaps Jan could help here, based on the commit message he
> > > > might
> > > > have
> > > > a suggestion.
> > >=20
> > > There's a lot of apparently unrelated context left, so I'm trying
> > > to
> > > guess
> > > on what the actual question is, from the old change you're
> > > pointing
> > > at: With
> > >=20
> > > #define __test_and_set_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > =C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
> > > =C2=A0=C2=A0 __test_and_set_bit(nr, addr);=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 \
> > >=20
> > > why do we have that wrapping macro? If that's indeed the
> > > question,
> > > then may
> > > I suggest you consider what would happen to the sizeof() in
> > > bitop_bad_size()
> > > if the invocation was moved to the inline function, taking
> > > pointer-
> > > to-void?
> > >=20
> > > However, I can't relate that old change to the question I think
> > > Julien
> > > raised (invoking __test_and_set_bit() vs
> > > arch__test_and_set_bit()),
> > > so
> > > perhaps I'm missing something.
> > If I understand the question correctly then the question is why do
> > we
> > need static inline function. Can't we just do the following:
> >=20
> > #ifndef arch_test_bit
> > #define arch_test_bit generic_test_bit
> > #endif
> >=20
> > #define test_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size();=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> > =C2=A0=C2=A0=C2=A0 arch_test_bit(nr, addr);=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > })
>=20
> I think we can. But then how did that old commit come into play?
In the old commit, this approach was introduced where we have a 'static
inline function' called within a macro, but I only now realized that it
was done solely because of the check "if (bitop_bad_size(addr))
__bitop_bad_size();".

As far as I understand, Julien doesn't insist on dropping the 'static
inline function' and using arch_test_bit() directly in the test_bit()
macro, so I prefer to use the option implemented in this patch.
However, if anyone has objections to this approach and thinks it would
be better to drop the 'static inline functions' and call arch_*()
directly in a macro, I am okay with reworking it today and sending a
new patch version where this changes will be taking into account.

Anyway, I will send a new version of this patch today as Julien asked
me to add comments on top of the functions generic_test_bit() and
generic__test_and_change_bit(). Additionally, "#define BITS_PER_BYTE 8"
will be moved to xen/bitops.h as it seems to be always the same for
every architecture.

~ Oleksii

