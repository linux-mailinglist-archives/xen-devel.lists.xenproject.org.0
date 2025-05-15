Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671D1AB8236
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:14:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984997.1370947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUey-0001FQ-UU; Thu, 15 May 2025 09:13:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984997.1370947; Thu, 15 May 2025 09:13:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUey-0001Dy-Re; Thu, 15 May 2025 09:13:48 +0000
Received: by outflank-mailman (input) for mailman id 984997;
 Thu, 15 May 2025 09:13:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjGQ=X7=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uFUew-0001Ds-LB
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:13:46 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e46c1d31-316c-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 11:13:41 +0200 (CEST)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-609e7f3caf3so520356eaf.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:13:41 -0700 (PDT)
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
X-Inumbo-ID: e46c1d31-316c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747300420; x=1747905220; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QC33JsX1S+wWQYg3/7wllIJJHQiR6cDdGbMyi83Riok=;
        b=WZ7fVx11z6RW8WuhjbRj9Hlxik6kHwAZ37sfE3icQ0d96RbBc8fQyjaMsdP6qUwfxy
         8U9ZbOuFDphv0CSfUnZ8c85q2/hP65NLKL+6v8U8p5bjrNl8uYAFcwF1H9eRkj+Hqw2v
         BjSNosT3shps/uIo2/Oqe+bWTNQIqu4PWhYEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300420; x=1747905220;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QC33JsX1S+wWQYg3/7wllIJJHQiR6cDdGbMyi83Riok=;
        b=EqHy7utP6p/9T4Ffh+ZMv5DCTW9Skf+yHwV1Iy+XwHwxjJu57x9Tq3PvsmMG6N5AX1
         mEcDTJ2TyLeEsJFeNUzA9RAt6DBKSVNjbcwPQNImkNIYnjZd12cc0osY3cKZiHTX50Mj
         KwsUipsKrbrZLdXMSjqv4Cf4R5VjLLvq3vEyAss6FWEE7zOiSOlLCckq7+ZX7YPakCe0
         SI2UbUmwdKodH7OrnKl8B81Ojij5Ia2ehnlR6qggCyiWYXHP6HPzmbnasjvIVSRW88Vm
         pmBP3VL/R46jHin2eZTJCm9OjwGRaKI4w6pOvfroHkqMP2oWaFEgZa0c+KdcF5l6FlrV
         T3hA==
X-Forwarded-Encrypted: i=1; AJvYcCVK0KLEUQ7Bhku9SitXMJNzgwnJ+qTTo8kwhNzIRVDmYwIKQwnqEPBT1MNulbViqOV9KunAiGaI1y4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw56ebjXuWXJ1iaGMSwTaTAgJO99IlNs7Q5kGWYP+9JAxR7JXhI
	Isxi8TTLQbUfIGtzl23IQHifLXbGEwVc5xM25Rkbj46GYnvPta4bFPzlNrZJE7eEoXgn1DDx5T6
	jGh1aKigrFx1co4pXqzOhJwb/Crqivgn1luU5
X-Gm-Gg: ASbGncvBchiOAHL/QcXiakl2GVqut7BZOhU7bChbIMtzGdAGX2LOUAllRUxdsII9hRX
	8ONz5DE9366IOmQpGQdNRuszJgC2KAoYiFQybYUJHq/yzbSBP4/fQhQx4wjfXpyse7Eyvsurjfa
	RA1+P5keDcDpfHbhTeaeGe4ZXnIMDQf5Q=
X-Google-Smtp-Source: AGHT+IEPDqaJkWHnd9s0CiA/JU6Wqro0JC3BzQfIR/OyUh8VnYcmZ1nhWjRH5zEIpTxNNcTTFVPNoAiS1OLBNbEC2h0=
X-Received: by 2002:a05:6820:3094:b0:609:dc81:684 with SMTP id
 006d021491bc7-609df23f684mr3400918eaf.4.1747300419940; Thu, 15 May 2025
 02:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
 <20250506143218.1782603-3-ross.lagerwall@citrix.com> <e59ff21f-b597-460a-af82-371dc454b676@suse.com>
In-Reply-To: <e59ff21f-b597-460a-af82-371dc454b676@suse.com>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Thu, 15 May 2025 10:13:28 +0100
X-Gm-Features: AX0GCFvmaX7qmwe5eQBuNmbwKwV364TpxSB-eiuXMmkmdlcIOqRRraXSn4zt0HY
Message-ID: <CAG7k0EqubMzs7uR486w35UnXpAf53+9osp=0kY2g7rOoQi7FBw@mail.gmail.com>
Subject: Re: [PATCH 2/4] crypto: Add RSA support
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 1:38=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 06.05.2025 16:32, Ross Lagerwall wrote:
> > In preparation for adding support for livepatch signing, add support fo=
r
> > RSA crypto.
>
> If this is needed just for live-patch, ...
>
> > --- a/xen/common/Makefile
> > +++ b/xen/common/Makefile
> > @@ -28,6 +28,7 @@ obj-$(CONFIG_LIVEPATCH) +=3D livepatch.o livepatch_el=
f.o
> >  obj-$(CONFIG_LLC_COLORING) +=3D llc-coloring.o
> >  obj-$(CONFIG_VM_EVENT) +=3D mem_access.o
> >  obj-y +=3D memory.o
> > +obj-y +=3D mpi.o
>
> ... why would this be obj-y? Same for rsa.o further down.
>
> > --- /dev/null
> > +++ b/xen/common/mpi.c
> > @@ -0,0 +1,1724 @@
> > +/* mpi-pow.c  -  MPI functions
>
> Nit: This doesn't match the filename.
>
> > + *   Copyright (C) 1994, 1996, 1998, 2000 Free Software Foundation, In=
c.
> > + *
> > + * This file is part of GnuPG.
> > + *
> > + * GnuPG is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * GnuPG is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, write to the Free Software
> > + * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-130=
7, USA
> > + *
> > + * Note: This code is heavily based on the GNU MP Library.
> > + *    Actually it's the same code with only minor changes in the
> > + *    way the data is stored; this is to support the abstraction
> > + *    of an optional secure memory allocation which may be used
> > + *    to avoid revealing of sensitive data due to paging etc.
> > + *    The GNU MP Library itself is published under the LGPL;
> > + *    however I decided to publish this code under the plain GPL.
> > + *
> > + * mpi.c code extracted from linux @ eef0df6a5953, lib/mpi
>
> I fear this line would go unnoticed with future changes, and hence go sta=
le
> rather easily. Menioning the origin in just the commit message ought to b=
e
> sufficient.
>
> Btw - how heavily did you need to adjust the code to pass our Eclair scan=
?
> Depending on that I then might raise the question of converting to proper
> Xen style (it currently isn't even proper Linux style, afaict).

Few changes were needed to the code in this file so I preferred to keep
it in the original style.

Since a lot more adjustments were made to rsa.c, I opted to change that
to the Xen style.

>
> > + */
> > +
> > +#include <xen/mpi.h>
> > +#include <xen/lib.h>
> > +#include <xen/err.h>
> > +#include <xen/xmalloc.h>
> > +#include <xen/string.h>
> > +#include <xen/bitops.h>
> > +#include <xen/bug.h>
>
> Please sort alphabetically. Same for the other new files.
>
> > +#define MAX_EXTERN_MPI_BITS 16384
> > +
> > +/* Define it to a value which is good on most machines.
> > + * tested 4, 16, 32 and 64, where 16 gave the best performance when
> > + * checking a 768 and a 1024 bit ElGamal signature.
> > + * (wk 22.12.97) */
> > +#define KARATSUBA_THRESHOLD 16
> > +
> > +typedef mpi_limb_t *mpi_ptr_t;       /* pointer to a limb */
> > +typedef int mpi_size_t;              /* (must be a signed type) */
> > +
> > +/* Copy N limbs from S to D.  */
> > +#define MPN_COPY(d, s, n) \
> > +     do {                                    \
> > +             mpi_size_t _i;                  \
>
> With this and ...
>
> > +             for (_i =3D 0; _i < (n); _i++)    \
> > +                     (d)[_i] =3D (s)[_i];      \
> > +     } while (0)
> > +
> > +#define MPN_COPY_DECR(d, s, n) \
> > +     do {                                    \
> > +             mpi_size_t _i;                  \
>
> ... this I wonder why ...
>
> > +             for (_i =3D (n)-1; _i >=3D 0; _i--) \
> > +                     (d)[_i] =3D (s)[_i];      \
> > +     } while (0)
> > +
> > +/* Zero N limbs at D */
> > +#define MPN_ZERO(d, n) \
> > +     do {                                    \
> > +             int  _i;                        \
>
> ... this is plain int. There are apparently many similar issue.
>
> >[...]
> > +leave:
>
> Here and elsewhere - labels indented by at least one blank, please.
>
> > --- /dev/null
> > +++ b/xen/crypto/rsa.c
> > @@ -0,0 +1,194 @@
> > +/* rsa.c
> > +
> > +   The RSA publickey algorithm.
> > +
> > +   Copyright (C) 2001 Niels M=C3=B6ller
> > +
> > +   This file is part of GNU Nettle.
> > +
> > +   GNU Nettle is free software: you can redistribute it and/or
> > +   modify it under the terms of either:
> > +
> > +     * the GNU Lesser General Public License as published by the Free
> > +       Software Foundation; either version 3 of the License, or (at yo=
ur
> > +       option) any later version.
> > +
> > +   or
> > +
> > +     * the GNU General Public License as published by the Free
> > +       Software Foundation; either version 2 of the License, or (at yo=
ur
> > +       option) any later version.
> > +
> > +   or both in parallel, as here.
> > +
> > +   GNU Nettle is distributed in the hope that it will be useful,
> > +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> > +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> > +   General Public License for more details.
> > +
> > +   You should have received copies of the GNU General Public License a=
nd
> > +   the GNU Lesser General Public License along with this program.  If
> > +   not, see http://www.gnu.org/licenses/.
> > +*/
> > +
> > +#include <xen/rsa.h>
> > +#include <xen/lib.h>
> > +#include <xen/err.h>
> > +#include <xen/bug.h>
> > +#include <xen/string.h>
> > +
> > +void rsa_public_key_init(struct rsa_public_key *key)
> > +{
> > +    key->n =3D NULL;
> > +    key->e =3D NULL;
> > +    key->size =3D 0;
> > +}
> > +
> > +/*
> > + * Computes the size, in octets, of the modulo. Returns 0 if the
> > + * modulo is too small to be useful, or otherwise appears invalid.
> > + */
> > +static size_t rsa_check_size(MPI n)
> > +{
> > +    /* Round upwards */
> > +    size_t size;
> > +
> > +    /* Even moduli are invalid */
> > +    if ( mpi_test_bit(n, 0) =3D=3D 0 )
> > +        return 0;
> > +
> > +    size =3D (mpi_get_nbits(n) + 7) / 8;
> > +
> > +    if ( size < RSA_MINIMUM_N_OCTETS )
> > +        return 0;
> > +
> > +    return size;
> > +}
> > +
> > +int rsa_public_key_prepare(struct rsa_public_key *key)
> > +{
> > +    if ( !key->n || !key->e || key->size )
> > +        return -EINVAL;
> > +
> > +    key->size =3D rsa_check_size(key->n);
> > +
> > +    return key->size > 0 ? 0 : -EINVAL;
> > +}
> > +
> > +/*
> > + * Formats the PKCS#1 padding, of the form
> > + *
> > + *   0x00 0x01 0xff ... 0xff 0x00 id ...digest...
> > + *
> > + * where the 0xff ... 0xff part consists of at least 8 octets. The
> > + * total size equals the octet size of n.
> > + */
> > +static uint8_t *pkcs1_signature_prefix(unsigned int key_size, uint8_t =
*buffer,
> > +                                       unsigned int id_size, const uin=
t8_t *id,
> > +                                       unsigned int digest_size)
> > +{
> > +    unsigned int j;
> > +
> > +    if ( key_size < 11 + id_size + digest_size )
> > +        return NULL;
> > +
> > +    j =3D key_size - digest_size - id_size;
> > +
> > +    memcpy(buffer + j, id, id_size);
> > +    buffer[0] =3D 0;
> > +    buffer[1] =3D 1;
> > +    buffer[j - 1] =3D 0;
> > +
> > +    ASSERT(j >=3D 11);
> > +    memset(buffer + 2, 0xff, j - 3);
> > +
> > +    return buffer + j + id_size;
> > +}
> > +
> > +/*
> > + * From RFC 3447, Public-Key Cryptography Standards (PKCS) #1: RSA
> > + * Cryptography Specifications Version 2.1.
> > + *
> > + *     id-sha256    OBJECT IDENTIFIER ::=3D
> > + *       {joint-iso-itu-t(2) country(16) us(840) organization(1)
> > + *         gov(101) csor(3) nistalgorithm(4) hashalgs(2) 1}
> > + */
> > +static const uint8_t
> > +sha256_prefix[] =3D
> > +{
> > +  /* 19 octets prefix, 32 octets hash, total 51 */
> > +  0x30,      49, /* SEQUENCE */
> > +    0x30,    13, /* SEQUENCE */
> > +      0x06,   9, /* OBJECT IDENTIFIER */
> > +        0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x01,
> > +      0x05,   0, /* NULL */
> > +    0x04,    32  /* OCTET STRING */
> > +      /* Here comes the raw hash value */
> > +};
> > +
> > +static int pkcs1_rsa_sha256_encode(MPI *m, size_t key_size,
> > +                                   struct sha2_256_state *hash)
> > +{
> > +    uint8_t *ptr;
> > +    uint8_t *buf;
> > +
> > +    buf =3D xmalloc_bytes(key_size);
> > +    if ( !buf )
> > +        return -ENOMEM;
> > +
> > +    ptr =3D pkcs1_signature_prefix(key_size, buf,
> > +                                 sizeof(sha256_prefix), sha256_prefix,
> > +                                 SHA2_256_DIGEST_SIZE);
> > +    if ( !ptr )
> > +    {
> > +        xfree(buf);
> > +        return -EINVAL;
> > +    }
> > +
> > +    sha2_256_final(hash, ptr);
> > +    *m =3D mpi_read_raw_data(buf, key_size);
> > +    xfree(buf);
> > +    return 0;
> > +}
> > +
> > +static int rsa_verify(const struct rsa_public_key *key, MPI m, MPI s)
> > +{
> > +    int ret;
> > +    MPI m1;
> > +
> > +    /* (1) Validate 0 <=3D s < n */
> > +    if ( mpi_cmp_ui(s, 0) < 0 || mpi_cmp(s, key->n) >=3D 0 )
> > +        return -EINVAL;
> > +
> > +    m1 =3D mpi_alloc(key->size / BYTES_PER_MPI_LIMB);
> > +    if ( !m1 )
> > +        return -ENOMEM;
> > +
> > +    /* (2) m =3D s^e mod n */
> > +    ret =3D mpi_powm(m1, s, key->e, key->n);
> > +    if ( ret )
> > +        goto out;
> > +
> > +    ret =3D mpi_cmp (m, m1) ? -EINVAL : 0;
>
> You look to have striven to convert this file to Xen style; there's a str=
ay
> blank here, though.
>
> > --- /dev/null
> > +++ b/xen/include/xen/mpi.h
> > @@ -0,0 +1,63 @@
> > +/* mpi.h  -  Multi Precision Integers
> > + *        Copyright (C) 1994, 1996, 1998, 1999,
> > + *                    2000, 2001 Free Software Foundation, Inc.
> > + *
> > + * This file is part of GNUPG.
> > + *
> > + * GNUPG is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
>
> While this may want to remain, accompany it with an SPDX header? (Same
> elsewhere perhaps.)

Sure.

>
> > + * GNUPG is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program; if not, write to the Free Software
> > + * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-130=
7, USA
> > + *
> > + * Note: This code is heavily based on the GNU MP Library.
> > + *         Actually it's the same code with only minor changes in the
> > + *         way the data is stored; this is to support the abstraction
> > + *         of an optional secure memory allocation which may be used
> > + *         to avoid revealing of sensitive data due to paging etc.
> > + *         The GNU MP Library itself is published under the LGPL;
> > + *         however I decided to publish this code under the plain GPL.
> > + */
> > +
> > +#ifndef MPI_H
> > +#define MPI_H
>
> This imo wants at least a XEN_ prefix. Same in rsa.h.
>
> > +#include <xen/types.h>
> > +
> > +#define BYTES_PER_MPI_LIMB      (BITS_PER_LONG / 8)
> > +#define BITS_PER_MPI_LIMB       BITS_PER_LONG
> > +
> > +typedef unsigned long int mpi_limb_t;
> > +typedef signed long int mpi_limb_signed_t;
> > +
> > +struct mpi {
> > +    int alloced;        /* array size (# of allocated limbs) */
> > +    int nlimbs;         /* number of valid limbs */
> > +    int nbits;          /* the real number of valid bits (info only) *=
/
>
> I understand the goal likely is to not meaningfully change the original, =
but
> none of these look like they can hold negative values, and ...
>
> > +    int sign;           /* indicates a negative number */
>
> ... this one looks like it's a boolean.
>
> > +    unsigned flags;     /* bit 0: array must be allocated in secure me=
mory space */
>
> In Xen we use "unsigned int", not plain "unsigned".

I'd prefer not to change the type from int to something else but I'll
fix the unsigned style issue.

Ross

