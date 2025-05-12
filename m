Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CCFAB3727
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 14:38:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981396.1367789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uESQ1-0000B1-OF; Mon, 12 May 2025 12:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981396.1367789; Mon, 12 May 2025 12:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uESQ1-00008L-LV; Mon, 12 May 2025 12:38:05 +0000
Received: by outflank-mailman (input) for mailman id 981396;
 Mon, 12 May 2025 12:38:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uESQ0-00008F-MI
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 12:38:04 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0ff1ec7-2f2d-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 14:38:01 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-ad228552355so480275166b.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 05:38:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2192c8b8asm610752066b.5.2025.05.12.05.38.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 05:38:00 -0700 (PDT)
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
X-Inumbo-ID: f0ff1ec7-2f2d-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747053481; x=1747658281; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aT0D4ojX2bvbICT+PYBWDsRqSpt4TYYKT0tGZvIX83U=;
        b=YvAsEXDloB1L1v0mmsftKlIRFonSvRinndBQf9EvTRUMsUqAs+I7IMVMhIkI7OKrOU
         rcZXCQnDTdKw8LE88BlNjcEgFpgW15hSapJfAHiqUIj+GfprKBqwlC+YN0qLe7QdoI/d
         BAFzlz5vNZNfYb0zp+T/uWIgnzsfcbb7/Mp5J+MAZfnanc3ZPpAmw1H1DBzQRX4J1CkG
         DKzsC3P9cpiObYyAISdt677WtCzDRszQa0dWqnMNyD4x6k17Z5AkzEckB6irQgXbbtrJ
         I5RF9Y7yYF4+zAHk4TYEAraZlNOAWUkj+yqCuMQWJWwJ2fEyYfp4lVph2lyMkjYijmkK
         /nmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747053481; x=1747658281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aT0D4ojX2bvbICT+PYBWDsRqSpt4TYYKT0tGZvIX83U=;
        b=KQtN0YyD/cNccd5OdZOtMXa5C1nZ24WVF/nX5GvVZqBM+QGwv+zZHJcDBB3NP/X2xz
         C2DebXtipC8AD+JgXaBGT+3KriHpC3enh2mjUrFEp9suF9UIZkYsG4NcCPztkTqLN/KA
         GLmZ0WXkh/coZCCJbhZ7Z+vizeloIQKOANcKzVkD9hvnEvtrfMOw4XoaPEcA+uU4qsgG
         lN/Sl/Sfk/iWCL+NudUeI1vO1Vt728btjVpfOrO5SmfFK2wuTRUECMONRr7iF8wxgHCf
         e7DmHPK2k7OFlli4RXEJDMIbz7zCvLk+t4kYg54zetxJM3htw9kK/VO2xfgaTZVniLT0
         axlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI1Tmxj9vf9rNESjbz8sl5Q8Mi0csiu6HEMtT588shmwyIvlfYFPJ9RG0SJNz+sCN16fJGO/rDlPo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiQX736z8Z9eCdtWV7fM7Z7FpIOyrBzZvepRdQOJmDBOJRmRBa
	TecRlnBQbPHO9YMjCNa6PpWTwywSTjvWbQZowQsJAciU6otnKHln7iaWFxy0ag==
X-Gm-Gg: ASbGncuD7zsG+PTM95pf2YivZCQNhlpo+PsfAQ9ISTpeE4FxdqmwIYvedLWyh27xijy
	pYh2ecWGDqnZwGR77m7Sa8KjkZQ61ycGsfbcDcoS+zK3eJ2h3x4hBesU4ektr+TKPEtGkZR4XO5
	bahDlKRG+kC/OthPpwXl51k2ugBiv1z0Av45d+i24ig1C5CVcGWJWPIagS36XVYHtfV+0bBJsV0
	BaTOaRo2x6/vroafQLj1aVJT5V2HhFzv/Mhwi/epj9QerhnfZOqzIOW6l+baaGeh+G+I/zatka6
	i+6iBvC0AA6lWZlAbobCK3PVHbQFD4l8/Z9rXsn5tXPpfQhlNS+I1h6f3kJSQSonxRLZNGCPj4U
	xG5siVcxh6KIehXAle7TJ4l8S9Mtg8K6xhMI4
X-Google-Smtp-Source: AGHT+IHw6diZo6qF2AlRwMb35VVgohXIo8GCL44ILkPZIqS0+CBgoOpBMfnoWJ/gzLn9e5RgN/to6w==
X-Received: by 2002:a17:906:4796:b0:ace:5461:81dd with SMTP id a640c23a62f3a-ad218e4c509mr1228577066b.3.1747053481324;
        Mon, 12 May 2025 05:38:01 -0700 (PDT)
Message-ID: <e59ff21f-b597-460a-af82-371dc454b676@suse.com>
Date: Mon, 12 May 2025 14:38:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] crypto: Add RSA support
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
 <20250506143218.1782603-3-ross.lagerwall@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250506143218.1782603-3-ross.lagerwall@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.05.2025 16:32, Ross Lagerwall wrote:
> In preparation for adding support for livepatch signing, add support for
> RSA crypto.

If this is needed just for live-patch, ...

> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o livepatch_elf.o
>  obj-$(CONFIG_LLC_COLORING) += llc-coloring.o
>  obj-$(CONFIG_VM_EVENT) += mem_access.o
>  obj-y += memory.o
> +obj-y += mpi.o

... why would this be obj-y? Same for rsa.o further down.

> --- /dev/null
> +++ b/xen/common/mpi.c
> @@ -0,0 +1,1724 @@
> +/* mpi-pow.c  -  MPI functions

Nit: This doesn't match the filename.

> + *	Copyright (C) 1994, 1996, 1998, 2000 Free Software Foundation, Inc.
> + *
> + * This file is part of GnuPG.
> + *
> + * GnuPG is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * GnuPG is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
> + *
> + * Note: This code is heavily based on the GNU MP Library.
> + *	 Actually it's the same code with only minor changes in the
> + *	 way the data is stored; this is to support the abstraction
> + *	 of an optional secure memory allocation which may be used
> + *	 to avoid revealing of sensitive data due to paging etc.
> + *	 The GNU MP Library itself is published under the LGPL;
> + *	 however I decided to publish this code under the plain GPL.
> + *
> + * mpi.c code extracted from linux @ eef0df6a5953, lib/mpi

I fear this line would go unnoticed with future changes, and hence go stale
rather easily. Menioning the origin in just the commit message ought to be
sufficient.

Btw - how heavily did you need to adjust the code to pass our Eclair scan?
Depending on that I then might raise the question of converting to proper
Xen style (it currently isn't even proper Linux style, afaict).

> + */
> +
> +#include <xen/mpi.h>
> +#include <xen/lib.h>
> +#include <xen/err.h>
> +#include <xen/xmalloc.h>
> +#include <xen/string.h>
> +#include <xen/bitops.h>
> +#include <xen/bug.h>

Please sort alphabetically. Same for the other new files.

> +#define MAX_EXTERN_MPI_BITS 16384
> +
> +/* Define it to a value which is good on most machines.
> + * tested 4, 16, 32 and 64, where 16 gave the best performance when
> + * checking a 768 and a 1024 bit ElGamal signature.
> + * (wk 22.12.97) */
> +#define KARATSUBA_THRESHOLD 16
> +
> +typedef mpi_limb_t *mpi_ptr_t;	/* pointer to a limb */
> +typedef int mpi_size_t;		/* (must be a signed type) */
> +
> +/* Copy N limbs from S to D.  */
> +#define MPN_COPY(d, s, n) \
> +	do {					\
> +		mpi_size_t _i;			\

With this and ...

> +		for (_i = 0; _i < (n); _i++)	\
> +			(d)[_i] = (s)[_i];	\
> +	} while (0)
> +
> +#define MPN_COPY_DECR(d, s, n) \
> +	do {					\
> +		mpi_size_t _i;			\

... this I wonder why ...

> +		for (_i = (n)-1; _i >= 0; _i--) \
> +			(d)[_i] = (s)[_i];	\
> +	} while (0)
> +
> +/* Zero N limbs at D */
> +#define MPN_ZERO(d, n) \
> +	do {					\
> +		int  _i;			\

... this is plain int. There are apparently many similar issue.

>[...]
> +leave:

Here and elsewhere - labels indented by at least one blank, please.

> --- /dev/null
> +++ b/xen/crypto/rsa.c
> @@ -0,0 +1,194 @@
> +/* rsa.c
> +
> +   The RSA publickey algorithm.
> +
> +   Copyright (C) 2001 Niels Möller
> +
> +   This file is part of GNU Nettle.
> +
> +   GNU Nettle is free software: you can redistribute it and/or
> +   modify it under the terms of either:
> +
> +     * the GNU Lesser General Public License as published by the Free
> +       Software Foundation; either version 3 of the License, or (at your
> +       option) any later version.
> +
> +   or
> +
> +     * the GNU General Public License as published by the Free
> +       Software Foundation; either version 2 of the License, or (at your
> +       option) any later version.
> +
> +   or both in parallel, as here.
> +
> +   GNU Nettle is distributed in the hope that it will be useful,
> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +   General Public License for more details.
> +
> +   You should have received copies of the GNU General Public License and
> +   the GNU Lesser General Public License along with this program.  If
> +   not, see http://www.gnu.org/licenses/.
> +*/
> +
> +#include <xen/rsa.h>
> +#include <xen/lib.h>
> +#include <xen/err.h>
> +#include <xen/bug.h>
> +#include <xen/string.h>
> +
> +void rsa_public_key_init(struct rsa_public_key *key)
> +{
> +    key->n = NULL;
> +    key->e = NULL;
> +    key->size = 0;
> +}
> +
> +/*
> + * Computes the size, in octets, of the modulo. Returns 0 if the
> + * modulo is too small to be useful, or otherwise appears invalid.
> + */
> +static size_t rsa_check_size(MPI n)
> +{
> +    /* Round upwards */
> +    size_t size;
> +
> +    /* Even moduli are invalid */
> +    if ( mpi_test_bit(n, 0) == 0 )
> +        return 0;
> +
> +    size = (mpi_get_nbits(n) + 7) / 8;
> +
> +    if ( size < RSA_MINIMUM_N_OCTETS )
> +        return 0;
> +
> +    return size;
> +}
> +
> +int rsa_public_key_prepare(struct rsa_public_key *key)
> +{
> +    if ( !key->n || !key->e || key->size )
> +        return -EINVAL;
> +
> +    key->size = rsa_check_size(key->n);
> +
> +    return key->size > 0 ? 0 : -EINVAL;
> +}
> +
> +/*
> + * Formats the PKCS#1 padding, of the form
> + *
> + *   0x00 0x01 0xff ... 0xff 0x00 id ...digest...
> + *
> + * where the 0xff ... 0xff part consists of at least 8 octets. The
> + * total size equals the octet size of n.
> + */
> +static uint8_t *pkcs1_signature_prefix(unsigned int key_size, uint8_t *buffer,
> +                                       unsigned int id_size, const uint8_t *id,
> +                                       unsigned int digest_size)
> +{
> +    unsigned int j;
> +
> +    if ( key_size < 11 + id_size + digest_size )
> +        return NULL;
> +
> +    j = key_size - digest_size - id_size;
> +
> +    memcpy(buffer + j, id, id_size);
> +    buffer[0] = 0;
> +    buffer[1] = 1;
> +    buffer[j - 1] = 0;
> +
> +    ASSERT(j >= 11);
> +    memset(buffer + 2, 0xff, j - 3);
> +
> +    return buffer + j + id_size;
> +}
> +
> +/*
> + * From RFC 3447, Public-Key Cryptography Standards (PKCS) #1: RSA
> + * Cryptography Specifications Version 2.1.
> + *
> + *     id-sha256    OBJECT IDENTIFIER ::=
> + *       {joint-iso-itu-t(2) country(16) us(840) organization(1)
> + *         gov(101) csor(3) nistalgorithm(4) hashalgs(2) 1}
> + */
> +static const uint8_t
> +sha256_prefix[] =
> +{
> +  /* 19 octets prefix, 32 octets hash, total 51 */
> +  0x30,      49, /* SEQUENCE */
> +    0x30,    13, /* SEQUENCE */
> +      0x06,   9, /* OBJECT IDENTIFIER */
> +        0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x01,
> +      0x05,   0, /* NULL */
> +    0x04,    32  /* OCTET STRING */
> +      /* Here comes the raw hash value */
> +};
> +
> +static int pkcs1_rsa_sha256_encode(MPI *m, size_t key_size,
> +                                   struct sha2_256_state *hash)
> +{
> +    uint8_t *ptr;
> +    uint8_t *buf;
> +
> +    buf = xmalloc_bytes(key_size);
> +    if ( !buf )
> +        return -ENOMEM;
> +
> +    ptr = pkcs1_signature_prefix(key_size, buf,
> +                                 sizeof(sha256_prefix), sha256_prefix,
> +                                 SHA2_256_DIGEST_SIZE);
> +    if ( !ptr )
> +    {
> +        xfree(buf);
> +        return -EINVAL;
> +    }
> +
> +    sha2_256_final(hash, ptr);
> +    *m = mpi_read_raw_data(buf, key_size);
> +    xfree(buf);
> +    return 0;
> +}
> +
> +static int rsa_verify(const struct rsa_public_key *key, MPI m, MPI s)
> +{
> +    int ret;
> +    MPI m1;
> +
> +    /* (1) Validate 0 <= s < n */
> +    if ( mpi_cmp_ui(s, 0) < 0 || mpi_cmp(s, key->n) >= 0 )
> +        return -EINVAL;
> +
> +    m1 = mpi_alloc(key->size / BYTES_PER_MPI_LIMB);
> +    if ( !m1 )
> +        return -ENOMEM;
> +
> +    /* (2) m = s^e mod n */
> +    ret = mpi_powm(m1, s, key->e, key->n);
> +    if ( ret )
> +        goto out;
> +
> +    ret = mpi_cmp (m, m1) ? -EINVAL : 0;

You look to have striven to convert this file to Xen style; there's a stray
blank here, though.

> --- /dev/null
> +++ b/xen/include/xen/mpi.h
> @@ -0,0 +1,63 @@
> +/* mpi.h  -  Multi Precision Integers
> + *        Copyright (C) 1994, 1996, 1998, 1999,
> + *                    2000, 2001 Free Software Foundation, Inc.
> + *
> + * This file is part of GNUPG.
> + *
> + * GNUPG is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.

While this may want to remain, accompany it with an SPDX header? (Same
elsewhere perhaps.)

> + * GNUPG is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA
> + *
> + * Note: This code is heavily based on the GNU MP Library.
> + *         Actually it's the same code with only minor changes in the
> + *         way the data is stored; this is to support the abstraction
> + *         of an optional secure memory allocation which may be used
> + *         to avoid revealing of sensitive data due to paging etc.
> + *         The GNU MP Library itself is published under the LGPL;
> + *         however I decided to publish this code under the plain GPL.
> + */
> +
> +#ifndef MPI_H
> +#define MPI_H

This imo wants at least a XEN_ prefix. Same in rsa.h.

> +#include <xen/types.h>
> +
> +#define BYTES_PER_MPI_LIMB      (BITS_PER_LONG / 8)
> +#define BITS_PER_MPI_LIMB       BITS_PER_LONG
> +
> +typedef unsigned long int mpi_limb_t;
> +typedef signed long int mpi_limb_signed_t;
> +
> +struct mpi {
> +    int alloced;        /* array size (# of allocated limbs) */
> +    int nlimbs;         /* number of valid limbs */
> +    int nbits;          /* the real number of valid bits (info only) */

I understand the goal likely is to not meaningfully change the original, but
none of these look like they can hold negative values, and ...

> +    int sign;           /* indicates a negative number */

... this one looks like it's a boolean.

> +    unsigned flags;     /* bit 0: array must be allocated in secure memory space */

In Xen we use "unsigned int", not plain "unsigned".

> +    /* bit 1: not used */
> +    /* bit 2: the limb is a pointer to some m_alloced data */

I think these comments would better be padded to align with the earlier one.
The individual bits likely also want corresponding #define-s.

> --- /dev/null
> +++ b/xen/include/xen/rsa.h
> @@ -0,0 +1,72 @@
> +/* rsa.h
> +
> +   The RSA publickey algorithm.
> +
> +   Copyright (C) 2001, 2002 Niels Möller
> +
> +   This file is part of GNU Nettle.
> +
> +   GNU Nettle is free software: you can redistribute it and/or
> +   modify it under the terms of either:
> +
> +     * the GNU Lesser General Public License as published by the Free
> +       Software Foundation; either version 3 of the License, or (at your
> +       option) any later version.
> +
> +   or
> +
> +     * the GNU General Public License as published by the Free
> +       Software Foundation; either version 2 of the License, or (at your
> +       option) any later version.
> +
> +   or both in parallel, as here.
> +
> +   GNU Nettle is distributed in the hope that it will be useful,
> +   but WITHOUT ANY WARRANTY; without even the implied warranty of
> +   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> +   General Public License for more details.
> +
> +   You should have received copies of the GNU General Public License and
> +   the GNU Lesser General Public License along with this program.  If
> +   not, see http://www.gnu.org/licenses/.
> +*/
> + 
> +#ifndef RSA_H
> +#define RSA_H
> +
> +#include <xen/mpi.h>
> +#include <xen/sha2.h>

This isn't needed here, is it? All you need is ...

> +#include <xen/types.h>
> +
> +/*
> + * This limit is somewhat arbitrary. Technically, the smallest modulo
> + * which makes sense at all is 15 = 3*5, phi(15) = 8, size 4 bits. But
> + * for ridiculously small keys, not all odd e are possible (e.g., for
> + * 5 bits, the only possible modulo is 3*7 = 21, phi(21) = 12, and e =
> + * 3 don't work). The smallest size that makes sense with pkcs#1, and
> + * which allows RSA encryption of one byte messages, is 12 octets, 89
> + * bits.
> + */
> +#define RSA_MINIMUM_N_OCTETS 12
> +#define RSA_MINIMUM_N_BITS (8 * RSA_MINIMUM_N_OCTETS - 7)
> +
> +struct rsa_public_key
> +{
> +    /*
> +     * Size of the modulo, in octets. This is also the size of all
> +     * signatures that are created or verified with this key.
> +     */
> +    size_t size;
> +    MPI n; /* Modulo */
> +    MPI e; /* Public exponent */
> +};
> +
> +void rsa_public_key_init(struct rsa_public_key *key);
> +
> +int rsa_public_key_prepare(struct rsa_public_key *key);
> +
> +int rsa_sha256_verify(const struct rsa_public_key *key,
> +                      struct sha2_256_state *hash,

... a forward decl of this type.

Jan

