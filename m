Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC49830454
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 12:14:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668395.1040572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3ri-0001Vz-7p; Wed, 17 Jan 2024 11:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668395.1040572; Wed, 17 Jan 2024 11:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ3ri-0001P9-4J; Wed, 17 Jan 2024 11:13:50 +0000
Received: by outflank-mailman (input) for mailman id 668395;
 Wed, 17 Jan 2024 11:13:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sm03=I3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rQ3rg-0001NP-IQ
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 11:13:48 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b39b22a-b529-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 12:13:46 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-555e07761acso13200188a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 03:13:46 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 cx6-20020a170907168600b00a2d5ef80043sm4876717ejd.129.2024.01.17.03.13.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 03:13:45 -0800 (PST)
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
X-Inumbo-ID: 7b39b22a-b529-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705490026; x=1706094826; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6Amlk1eEeQb7XbTJL9ZRY4OoMVIX3ScciVYH4NF5UAE=;
        b=Xa8o1dxusPBdS0e4o6iknX1Nwx3uHmhZVskZQbZB98MFgOIzTJDObBNUwmH0E70Yoo
         j3aQ5e2erJmcIZx+ZbdY0Bhusb+4sNIilKjTV/XFdymjPaNKlLWbrVbZLMm2sWrkDj/5
         liqxQi47AAHzciArIDhYX1dWFAUMx1MedZGfATx1y36Q0qJ5vxWwzl/Wz+isfRoOrlsc
         +npjeBurRFLLhc2VE2GFoRGUU0KbB6EEAk2rR7sDGlgCHevtBaXeXWrqw2DUrLTf9k/Q
         o5DSFayGoqKVnhD2KTBlaxclPprnr9mp0ejgSmSKOCEbOmhLPpxV/K3RqgmhhhNHQm4y
         XrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705490026; x=1706094826;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Amlk1eEeQb7XbTJL9ZRY4OoMVIX3ScciVYH4NF5UAE=;
        b=YkP5TbwJC+Z7yyhO/ETqCwa8C0tB9msHV+cS73+fUhgzHimiVvDam/mtK5Y9IND8JW
         DE/bP1KeR5klVq8KRwS373BcLMr9OsWxD/HWYRyf3CyKP3Cxd4bzKiogY6mFOwSrjzFi
         dltLmzrxkbRMRYnKfIlnvG0JLuBcB5dn7qC2/xwFgThntZN+nNfcEPuwEQof3XiLEUcZ
         ndYGd2hBN4ho1ieIztBqbyObDxZL2b4DBnPvK/VD3jd4lS8P9+T4svuYVbmJ9Ikj83Tw
         iY3egbdpReIX8OCMHLc+kUGVR2BpB9ncQiLOH/TvI8+w8xsxv3YtpYFQGVPq5uLzBCPp
         smDA==
X-Gm-Message-State: AOJu0YzOaB5kTkSUAOK9hJk/0HB+79LdG9yZPHC+vVav0PoyaF9CLA6e
	ToBkJpPlNRqOd5fOPhVMiIA=
X-Google-Smtp-Source: AGHT+IFuGqcyI66FEfotU1fFis5H3unJ4KlbG52F08yDbsODtXsl+n4yox9qwR6z5CAamWpHAeuEAQ==
X-Received: by 2002:a17:906:f18f:b0:a28:b79a:37a0 with SMTP id gs15-20020a170906f18f00b00a28b79a37a0mr3086970ejb.222.1705490025464;
        Wed, 17 Jan 2024 03:13:45 -0800 (PST)
Message-ID: <863b09f03d37e96d737ab6bda4cc8923f75550fd.camel@gmail.com>
Subject: Re: [PATCH v3 10/34] xen/riscv: introduce bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 17 Jan 2024 13:13:44 +0200
In-Reply-To: <88df7ccd-8d14-4b00-900d-04cc87d9f230@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
	 <23f1212a-66a8-47b0-904b-08b2ab54c72b@suse.com>
	 <17d9fe474e244a15aa5955e630d553a62b0080fd.camel@gmail.com>
	 <88df7ccd-8d14-4b00-900d-04cc87d9f230@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Tue, 2024-01-16 at 14:24 +0100, Jan Beulich wrote:
> On 16.01.2024 14:06, Oleksii wrote:
> > On Mon, 2024-01-15 at 17:44 +0100, Jan Beulich wrote:
> > > On 22.12.2023 16:12, Oleksii Kurochko wrote:
> > > > +#define test_and_set_bit=C2=A0=C2=A0 __test_and_set_bit
> > > > +#define test_and_clear_bit __test_and_clear_bit
> > >=20
> > > I realize test-and-change have no present users, despite being
> > > made
> > > available by Arm and x86, but I think they would better be
> > > provided
> > > right away, rather than someone introducing a use then needing to
> > > fiddle with RISC-V (and apparently also PPC) code.
> > Sure, it makes sense. I'll add test-and-change too.
> >=20
> > > I'm also puzzled by this aliasing: Aren't there cheaper non-
> > > atomic
> > > insn forms that could be used for the double-underscore-prefixed
> > > variants?
> > It will be cheaper, but I assume that this API should be safe in
> > the
> > case of SMP where different CPUs can access the same variable or
> > similar cases with simultaneous access to the variable.
>=20
> Of course, that's what test_and_...() are for. __test_and_...() are
> for cases where there's no concurrency, when hence the cheaper forms
> can be used. Thus my asking about the aliasing done above.
Then it makes sense to update __test_and...() to use non-atomic insn.
I'll do that in the next patch version.

Thanks for explanation.

>=20
> > > > +#if BITS_PER_LONG =3D=3D 64
> > > > +=C2=A0=C2=A0=C2=A0 if ((word & 0xffffffff) =3D=3D 0) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num +=3D 32;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 word >>=3D 32;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > >=20
> > > You're ending up with neither Xen nor Linux style this way. May I
> > > suggest to settle on either?
> >=20
> > Will it fine to rework header from Linux to Xen style? Does it make
> > sense?
> > I think this file can be reworked to Xen style as I don't expect
> > that
> > it will be changed since it will be merged.
>=20
> You may keep Linux style or fully switch to Xen style - which one is
> largely up to you. All I'm asking is to avoid introducing further
> mixed-style source files.
I'll be consistent in code style.

>=20
> > > > --- /dev/null
> > > > +++ b/xen/include/asm-generic/bitops/bitops-bits.h
> > > > @@ -0,0 +1,10 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +#ifndef _ASM_GENERIC_BITOPS_BITS_H_
> > > > +#define _ASM_GENERIC_BITOPS_BITS_H_
> > > > +
> > > > +#define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=A0=C2=A0 32
> > > > +#define BITOP_MASK(nr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (1UL << ((nr) %
> > > > BITOP_BITS_PER_WORD))
> > >=20
> > > Why 1UL and not just 1U, when bits per word is 32?
> > There is no specific reason, should 1U. ( I originally used
> > BITOPS_BITS_PER_LONG ) and with introduction of asm-generic bitops
> > decided to follow what other archs provide.
> >=20
> > Regarding to the second part of the question, I don't understand it
> > fully. Considering BITOP_BIT_PER_WORD definition for other archs (
> > ARM
> > and PPC ) it is expected that word is 32 bits.
>=20
> The 2nd part was explaining why I'm asking. It wasn't another
> question.
>=20
> > > > --- /dev/null
> > > > +++ b/xen/include/asm-generic/bitops/test-bit.h
> > > > @@ -0,0 +1,16 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +#ifndef _ASM_GENERIC_BITOPS_TESTBIT_H_
> > > > +#define _ASM_GENERIC_BITOPS_TESTBIT_H_
> > > > +
> > > > +/**
> > > > + * test_bit - Determine whether a bit is set
> > > > + * @nr: bit number to test
> > > > + * @addr: Address to start counting from
> > > > + */
> > > > +static inline int test_bit(int nr, const volatile void *addr)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 const volatile unsigned int *p =3D addr;
> > >=20
> > > With BITOP_BITS_PER_WORD I think you really mean uint32_t here.
> > Isn't it the same: 'unsigned int' and 'uint32_t'?
>=20
> No, or else there wouldn't have been a need to introduce uint<N>_t
> (and
> others) in C99. It just so happens that right now all architectures
> Xen
> can be built for have sizeof(int) =3D=3D 4 and CHAR_BITS =3D=3D 8. In an
> arch-
> specific header I would see this as less of an issue, but in a
> generic
> header we'd better avoid encoding wrong assumptions. The one
> assumption
> we generally make is that sizeof(int) >=3D 4 and CHAR_BITS >=3D 8 (albeit
> I
> bet really in various places we assume CHAR_BITS =3D=3D 8).
In this case we have to switch to uint<N>_t.
Thanks for the explanation. I'll update this part of code in the next
patch version.

>=20
> > > Also you want to make sure asm-generic/bitops/bitops-bits.h is
> > > really in use here, or else an arch overriding / not using that
> > > header may end up screwed.
> > I am not really understand what do you mean. Could you please
> > explain a
> > little bit more.
>=20
> Whichever type you use here, it needs to be in sync with
> BITOP_BITS_PER_WORD. Hence you want to include the _local_ bitops-
> bits.h
> here, such that in case of an inconsistent override by an arch the
> compiler would complain about the two differring #define-s. (IOW an
> arch overriding BITOP_BITS_PER_WORD cannot re-use this header as-is.)
>=20
> The same may, btw, be true for others of the new headers you add -
> the
> same #include would therefore be needed there as well.
Now it clear to me.


It seems like BITOP_BITS_PER_WORD, BITOP_MASK, BITOP_WORD, and
BITS_PER_BYTE are defined in {arm, ppc, riscv}/include/asm/bitops.h.
I expected that any architecture planning to use asm-
generic/bitops/bitops-bits.h would include it at the beginning of
<arch>/include/asm/bitops.h, similar to what is done for RISC-V:
   #ifndef _ASM_RISCV_BITOPS_H
   #define _ASM_RISCV_BITOPS_H
  =20
   #include <asm/system.h>
  =20
   #include <asm-generic/bitops/bitops-bits.h>
   ...

But in this case, to allow architecture overrides macros, it is
necessary to update asm-generic/bitops/bitops-bits.h:
    #ifndef BITOP_BITS_PER_WORD
    #define BITOP_BITS_PER_WORD     32
    #endif
   ...
Therefore,  if an architecture needs to override something, it will add
#define ... before #include <asm-generic/bitops/bitops-bits.h>.

Does it make sense?

~ Oleksii



