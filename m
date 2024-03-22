Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B0F886A61
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 11:32:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696758.1087945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rncCM-0001kM-WF; Fri, 22 Mar 2024 10:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696758.1087945; Fri, 22 Mar 2024 10:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rncCM-0001iC-TE; Fri, 22 Mar 2024 10:32:30 +0000
Received: by outflank-mailman (input) for mailman id 696758;
 Fri, 22 Mar 2024 10:32:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L8LS=K4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rncCM-0001i6-7V
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 10:32:30 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ba99201-e837-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 11:32:29 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-513e10a4083so2205721e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 03:32:29 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 dx6-20020a0565122c0600b005159707b939sm295923lfb.44.2024.03.22.03.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 03:32:27 -0700 (PDT)
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
X-Inumbo-ID: 7ba99201-e837-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711103548; x=1711708348; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=a9u7Q9QiS3vgg2KxcO4qw6TQI1IAv/H/ixv3P8r+ISc=;
        b=A/1N7OH3cJzjNrAWLrK2VAUvgsw2F/5u1vNMPhnPS7IKCZKwlPwWKEWHnwJgsmRBpd
         hEEmmsNJzvlTfR2a9UlbAz/40xmCAirD0M3W1WPdwhk26ij1P2pIgXb1/3m82FOW/5mR
         RMtPqIk/fu7J1RdMnK1MwlAlStFEjkUaa8r1UpIvRmtrVJwed2DyTImnplY6suDRRTu/
         Nf37yTb2+c104qp7CyXpM1AjK9sybaGSSZWFH9UQ7CGvb+1kcMpQkgnINjX3nU8a6TEs
         t9A7++2WijHJojjDpF+Y0h9UMLrSvKNUTpMPy9Maql2+ZkbaGANvKS1TDvT+7Kszr0VG
         wGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711103548; x=1711708348;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9u7Q9QiS3vgg2KxcO4qw6TQI1IAv/H/ixv3P8r+ISc=;
        b=oqgX1MkrP1KvwCn/qXSVeR7vlxt62HIYPv/ypHSnnCKJzjiQ7iureVoIgwjdg5raEZ
         LEeC7Qy8snOp2JATV1pMELJn+zduAt2qZRIczedAn/8P4uiZ//eGE5X8RC2Ek/NKzEED
         KO4/D8cziRmgJqLs9+J5Ts6JlkVy4EiYG0DbsUE3tC2v9eQuvKVoELbG6zxYLoW6ewKu
         iSUe2X1DxN8WEz5NHWUJxj2MR7t/g49wba7TKJXuiG5J2K08P1pNrYq/m/D/J+I5jeOU
         IdCVBfET47sbJG0jhOpijUephf3Hdst/1FWZ5rBRNDylCN3fO1SdKo7jkbperAqvPgAz
         qymg==
X-Forwarded-Encrypted: i=1; AJvYcCVFuWk958/AGscGzfGF1UQlWg2BjgnkH3A2/E+q4SVFlqDkHLYO/kvA7KBt9ocZGppC7X/8V6O+v7dVGnDde+FdujrhE1P3n6xJi67RrPw=
X-Gm-Message-State: AOJu0YxKyWVTbcgU+przxGLAYqpBVvkby+4WqNeSfm5poZlwj/b860Hb
	Ee8dzICbmrVg7J/ePSkp6am1YopSbdgv0li/5/FP/L3VzZv7K7u/
X-Google-Smtp-Source: AGHT+IFA7cbMuM/T25fkygNUP4s7WTFyMDH46Nedh12v7PYmENn6H2bWV8A+emF5+8P5sNfNE4zMmw==
X-Received: by 2002:a19:5e19:0:b0:513:5e6b:a191 with SMTP id s25-20020a195e19000000b005135e6ba191mr1334564lfb.50.1711103548226;
        Fri, 22 Mar 2024 03:32:28 -0700 (PDT)
Message-ID: <ce522fd6be6169296789efd35ed8af18967f2958.camel@gmail.com>
Subject: Re: [PATCH v6 08/20] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 22 Mar 2024 11:32:27 +0100
In-Reply-To: <6f73368c-ea73-4d86-a6a1-8f9784c4b01f@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <bf65ce1ff5f683cc6b638fa7de0c54d5e0aead33.1710517542.git.oleksii.kurochko@gmail.com>
	 <6f73368c-ea73-4d86-a6a1-8f9784c4b01f@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-21 at 13:07 +0100, Jan Beulich wrote:
> On 15.03.2024 19:06, Oleksii Kurochko wrote:
> > The header was taken from Linux kernl 6.4.0-rc1.
> >=20
> > Addionally, were updated:
> > * add emulation of {cmp}xchg for 1/2 byte types using 32-bit atomic
> > =C2=A0 access.
> > * replace tabs with spaces
> > * replace __* variale with *__
> > * introduce generic version of xchg_* and cmpxchg_*.
> > * drop {cmp}xchg{release,relaxed,acquire} as Xen doesn't use them
>=20
> With this, ...
>=20
> > * drop barries and use instruction suffixices instead ( .aq, .rl,
> > .aqrl )
> >=20
> > Implementation of 4- and 8-byte cases were updated according to the
> > spec:
> > ```
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ....
> > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVWMO A=
MO Mapping
> > atomic <op> relaxed=C2=A0=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}
> > atomic <op> acquire=C2=A0=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.aq
> > atomic <op> release=C2=A0=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.rl
> > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 amo<op>.{w|d}.aqrl
> > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVWMO L=
R/SC Mapping
> > atomic <op> relaxed=C2=A0=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}; <op>; sc.{w=
|d}; bnez loop
> > atomic <op> acquire=C2=A0=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}.aq; <op>; sc=
.{w|d}; bnez
> > loop
> > atomic <op> release=C2=A0=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}; <op>; sc.{w=
|d}.aqrl=E2=88=97 ; bnez
> > loop OR
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence=
.tso; loop: lr.{w|d}; <op>; sc.{w|d}=E2=88=97
> > ; bnez loop
> > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl;
> > bnez loop
> >=20
> > Table A.5: Mappings from Linux memory primitives to RISC-V
> > primitives
> >=20
> > ```
>=20
> ... I consider quoting this table in full, without any further
> remarks, as
> confusing: Three of the lines each are inapplicable now, aiui.
I'll shorten the table then.

>=20
> Further what are the two * telling us? Quite likely they aren't there
> just
> accidentally.
>=20
> Finally, why sc.{w|d}.aqrl when in principle one would expect just
> sc.{w|d}.rl?
Because according to the last line of table A.5:
    atomic <op>             loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl;
Here it is used sc.{w|d}.aqrl form, so I decided to stick to the what
is mentioned in the table.

>=20
> > +})
> > +
> > +static always_inline unsigned long __xchg(volatile void *ptr,
> > unsigned long new, int size)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned long ret;
> > +
> > +=C2=A0=C2=A0=C2=A0 switch ( size )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0 case 1:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D emulate_xchg_1_2((v=
olatile uint8_t *)ptr, new,
> > ".aq", ".aqrl");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +=C2=A0=C2=A0=C2=A0 case 2:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D emulate_xchg_1_2((v=
olatile uint16_t *)ptr, new,
> > ".aq", ".aqrl");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +=C2=A0=C2=A0=C2=A0 case 4:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __amoswap_generic((volatile=
 uint32_t *)ptr, new, ret,
> > ".w.aqrl");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +#ifndef CONFIG_32BIT
>=20
> There's no 32BIT Kconfig symbol; all we have is a 64BIT one.
I meant here CONFIG_RISCV_32.

>=20
> > +=C2=A0=C2=A0=C2=A0 case 8:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __amoswap_generic((volatile=
 uint64_t *)ptr, new, ret,
> > ".d.aqrl");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> > +#endif
> > +=C2=A0=C2=A0=C2=A0 default:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 STATIC_ASSERT_UNREACHABLE()=
;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 return ret;
> > +}
> > +
> > +#define xchg(ptr, x) \
> > +({ \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) n_ =3D (x); \
> > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr))) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __xchg((ptr), (unsigned lon=
g)(n_), sizeof(*(ptr))); \
>=20
> Nit: While excess parentheses "only" harm readability, they would
> nevertheless better be omitted (here: the first argument passed).
>=20
> > +})
> > +
> > +#define __generic_cmpxchg(ptr, old, new, ret, lr_sfx, sc_sfx)	\
> > + ({ \
> > +=C2=A0=C2=A0=C2=A0 register unsigned int rc; \
>=20
> Nit: We don't normally use "register", unless accompanied by asm()
> tying
> a variable to a specific one.
>=20
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) old__ =3D (__typeof__(*(ptr)))(o=
ld); \
> > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) new__ =3D (__typeof__(*(ptr)))(n=
ew); \
>=20
> The casts aren't very nice to have here; I take they're needed for
> cmpxchg_ptr() to compile?
Not really, I have not faced an compilation issue.
The reason why it was added is that lr instruction places the sign-
extended value in destination register, but if not to do cast value for
old and new were generated without sign extension, so, for example:
   u32=3D 0xbbbbbbbb;
   cmpxchg(&u32, 0xbbbbbbbb, 0xCCCCCCCC), u32);
Will fail because after:
       "0: lr" lr_sfx " %0, %2\n"=20
in %0 we will have 0xFFFFFFFFBBBBBBBB, but in %3 we will have
0xBBBBBBBB, so
       bne  %0, %z3, 1f\n"
%0 and %3 are always inequal in case when the most significat bit of
value read from %2 has 1.

But now I realized that it would be better just to use a mask and not
be dependent from compiler code generation, so it would be better to in
the following way ( of course, the macros should be updated accordingly
to remarks you give me ):
   #define __generic_cmpxchg(ptr, old, new, ret, lr_sfx, sc_sfx)	\
    ({ \
       register unsigned int rc; \
       unsigned long mask =3D GENMASK(((sizeof(*(ptr))) * BITS_PER_BYTE)
   - 1, 0); \
       asm volatile( \
           "0: lr" lr_sfx " %0, %2\n" \
           "   and  %0, %0, %z[mask]\n" \
           "   bne  %0, %z3, 1f\n" \
           "   sc" sc_sfx " %1, %z4, %2\n" \
           "   bnez %1, 0b\n" \
           "1:\n" \
           : "=3D&r" (ret), "=3D&r" (rc), "+A" (*ptr) \
           : "rJ" (old), "rJ" (new), [mask] "rJ" (mask)  \
           : "memory"); \
    })
  =20
>=20
> > +=C2=A0=C2=A0=C2=A0 asm volatile( \
>=20
> Nit: Missing blank once again. Would be really nice if you could go
> through and sort this uniformly for the series.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr" lr_sfx " %0, %2\n" =
\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bne=C2=A0 %0,=
 %z3, 1f\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 sc" sc_sfx " =
%1, %z4, %2\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bnez %1, 0b\n=
" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\n" \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3D&r" (ret), "=3D&r" (r=
c), "+A" (*ptr) \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "rJ" (old__), "rJ" (new__=
) \
>=20
> Please could I talk you into using named operands here, too?
Sure, I will add them.

~ Oleksii


