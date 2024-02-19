Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE7185A5E4
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 15:30:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682912.1062152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4eG-0005Eg-Ky; Mon, 19 Feb 2024 14:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682912.1062152; Mon, 19 Feb 2024 14:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc4eG-0005D6-I5; Mon, 19 Feb 2024 14:29:36 +0000
Received: by outflank-mailman (input) for mailman id 682912;
 Mon, 19 Feb 2024 14:29:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pKiv=J4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rc4eE-0005Cu-U6
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 14:29:34 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c56b851-cf33-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 15:29:32 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a3e8be8a7ddso140204466b.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 06:29:32 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r12-20020a170906704c00b00a3d932d8fa7sm3015143ejj.183.2024.02.19.06.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 06:29:31 -0800 (PST)
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
X-Inumbo-ID: 4c56b851-cf33-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708352972; x=1708957772; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eQCxeGeYb7l53I7iiUj0zXl0o166/IhDB/hbS2xv7h0=;
        b=QZNN6Pd8zR0NgtsNHeCuSnWCKrLvmAQdnngA/Wxi3KX+K1nAXYbC8cVdU1al1PLtO5
         OJe9QTSAwjNbd0NuKJ2IUiWodrPqH65TQzeAZvjWsaxBLkynf3srTw4/m4hCAJkPT8Wn
         wHeRfTD8wV5Le4J19X+e4HpX1jjJA+kBZiARXoV9TJNashp3OyTqbbjHRJxxYwwpJaRF
         CEKKKOmXKiza7zwxlRqcImTH1Hjzl9cI6AXYi+pqSKbODWuYXuhEA0XBWP3Q6XtfuHFa
         35zxbd0R7w3389bzTXsA3JOn2oJPBb9J4xTCxZNjFRm24rfeb8j74vsj1IvIy4siqxoK
         zw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708352972; x=1708957772;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQCxeGeYb7l53I7iiUj0zXl0o166/IhDB/hbS2xv7h0=;
        b=F2tHQo15dEBPrrmHf8Njqa+h+9V98MxnxlprmPpj2qdTlFbjzNoBk63IHKppJLJl/V
         3WnoBckku2TAAui3LOUnR/EFhGdnFUzEX4ZyUoqcjGH4EJFFzlDKRB8fyA6oh+RpMXoB
         apK5m2QodDLSMwBpXykDSAJtKBd9eELWWsEdmQa6CKjOOUzd++EJnQtfSbt2mtG8ISps
         NhmHxfBuJyNPB51zPipP/RDf2gi0UE+SanRLRIOTAROnybMFtmAF7xzITtlyUJssMrdq
         JL7I/LnDetUv6jmXhM7FT1oLDq37s38O5IhUZhsXKX45qPKWQcp+cfyUQgpgeRwNWsRq
         RFTw==
X-Forwarded-Encrypted: i=1; AJvYcCUNbrqX6x0jvY1TeFZjCzECidZREer+Jfuw+dxeqU9o9K1Z0NpXcAkhZxBX3xlUf8zm5ZMoVCyBb99tfZtOjj6oxLu7pbWZL9o0esvLt2E=
X-Gm-Message-State: AOJu0YxwfgzgYGwjMpNTpHih9FXsDGLCADxiXbEed0hljLlHWkOC/WsZ
	+qcmh9qjp2kMc0n+QaR/cLl/e118X1WKdpMIC+JxjB/JMFpR1c/1
X-Google-Smtp-Source: AGHT+IHnd8rqsx06qnbxRJlnN+meMq7aQYrrVwuwNJ3hjnkelnM7bX+eMsvawRbW5odL03sJHTUrmw==
X-Received: by 2002:a17:906:e246:b0:a3e:69eb:45dc with SMTP id gq6-20020a170906e24600b00a3e69eb45dcmr2685436ejb.21.1708352971797;
        Mon, 19 Feb 2024 06:29:31 -0800 (PST)
Message-ID: <1c53b52ee39161a8f59209d28af69fe997479dbc.camel@gmail.com>
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 19 Feb 2024 15:29:30 +0100
In-Reply-To: <554a43e8-7d8d-45c4-936d-36f02c207531@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
	 <9e50ef30-8dc6-4380-aa65-724e5a376c10@suse.com>
	 <28844fdfcf5eea515497fb7b5fd8ea6fb1c5ebaa.camel@gmail.com>
	 <554a43e8-7d8d-45c4-936d-36f02c207531@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-19 at 12:22 +0100, Jan Beulich wrote:
> On 15.02.2024 14:41, Oleksii wrote:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3Dr" (ret), "+A" (*=
ptr) \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "r" (new) \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory" ); \
> > > > +})
> > > > +
> > > > +#define emulate_xchg_1_2(ptr, new, ret, release_barrier,
> > > > acquire_barrier) \
> > > > +({ \
> > > > +=C2=A0=C2=A0=C2=A0 uint32_t *ptr_32b_aligned =3D (uint32_t
> > > > *)ALIGN_DOWN((unsigned
> > > > long)ptr, 4); \
> > >=20
> > > You now appear to assume that this macro is only used with inputs
> > > not
> > > crossing word boundaries. That's okay as long as suitably
> > > guaranteed
> > > at the use sites, but imo wants saying in a comment.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 uint8_t mask_l =3D ((unsigned long)(ptr) & (0x8=
 -
> > > > sizeof(*ptr)))
> > > > * BITS_PER_BYTE; \
> > >=20
> > > Why 0x8 (i.e. spanning 64 bits), not 4 (matching the uint32_t use
> > > above)?
> > The idea to read 8 bytes was to deal with crossing word boundary.
> > So if
> > our address is 0x3 and we have to xchg() 2 bytes, what will cross 4
> > byte boundary. Instead we align add 0x3, so it will become 0x0 and
> > then
> > just always work with 8 bytes.
>=20
> Then what if my 2-byte access crosses a dword boundary? A cache line
> one? A page one?
Everything looks okay to me, except in the case of a page boundary.

In the scenario of a dword boundary:

0 1 2 3 4 5 6 7 8 9 ...
X X X X X X X 1 1 X

Assuming a variable starts at address 7, 4-byte alignment will be
enforced, and 8 bytes will be processed starting from address 4.

Concerning a cache line, it should still work, with potential
performance issues arising only if a part of the variable is cached
while another part is not.

Regarding page crossing, I acknowledge that it could be problematic if
the variable is entirely located at the end of a page, as there is no
guarantee that the next page exists. In this case, it would be
preferable to consistently read 4 bytes with 4-byte alignment:

X 4094 4095 4096?
X  1    1    ?

However, if the variable spans two pages, proper page mapping should be
ensured.

It appears sensible to reconsider the macros and implement 4-byte
alignment and 4-byte access, but then this is not clear how better to
deal with first case ( dword boundary ). Panic ? or use the macros
twice for address 4, and address 8?

>=20
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long new_ =3D (unsigned long)(new) << =
mask_l; \
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long ret_; \
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long rc; \
> > >=20
> > > Similarly, why unsigned long here?
> > sizeof(unsigned long) is 8 bytes and it was chosen as we are
> > working
> > with lc/sc.d which are working with 8 bytes.
> >=20
> > >=20
> > > I also wonder about the mix of underscore suffixed (or not)
> > > variable
> > > names here.
> > If the question about ret_, then the same as before size of ret
> > argument of the macros will be 1 or 2, but {lc/sc}.d expected to
> > work
> > with 8 bytes.
>=20
> Then what's the uint32_t * about?
Agree, then it should be also unsigned long.
> >=20

> > > > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) new__ =3D (new); \
> > > > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) ret__; \
> > > > +=C2=A0=C2=A0=C2=A0 switch (size) \
> > > > +=C2=A0=C2=A0=C2=A0 { \
> > > > +=C2=A0=C2=A0=C2=A0 case 1: \
> > > > +=C2=A0=C2=A0=C2=A0 case 2: \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 emulate_xchg_1_2(ptr__,=
 new__, ret__, release_barrier,
> > > > acquire_barrier); \
> > >=20
> > > ... this would become
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret__ =3D emulate_xchg_1_2=
(ptr__, new__, release_barrier,
> > > acquire_barrier); \
> > >=20
> > > But, unlike assumed above, there's no enforcement here that a 2-
> > > byte
> > > quantity won't cross a word, double-word, cache line, or even
> > > page
> > > boundary. That might be okay if then the code would simply crash
> > > (like
> > > the AMO insns emitted further down would), but aiui silent
> > > misbehavior
> > > would result.
> > As I mentioned above with 4-byte alignment and then reading and
> > working
> > with 8-byte then crossing a word or double-word boundary shouldn't
> > be
> > an issue.
> >=20
> > I am not sure that I know how to check that we are crossing cache
> > line
> > boundary.
> >=20
> > Regarding page boundary, if the next page is mapped then all should
> > work fine, otherwise it will be an exception.
>=20
> Are you sure lr.d / sc.d are happy to access across such a boundary,
> when both pages are mapped?
If they are mapped, my expectation that lr.d and sc.d should be happy.

>=20
> To me it seems pretty clear that for atomic accesses you want to
> demand natural alignment, i.e. 2-byte alignment for 2-byte accesses.
> This way you can be sure no potentially problematic boundaries will
> be crossed.
It makes sense, but I am not sure that I can guarantee that a user of
macros will always have 2-byte alignment (except during a panic) in the
future.

Even now, I am uncertain that everyone will be willing to add
__alignment(...) to struct vcpu->is_urgent
(xen/include/xen/sched.h:218) and other possible cases to accommodate
RISC-V requirements.

>=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
> > > > +=C2=A0=C2=A0=C2=A0 case 4: \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __amoswap_generic(ptr__=
, new__, ret__,\
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ".w" sfx,=C2=A0 release_barrier,
> > > > acquire_barrier); \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
> > > > +=C2=A0=C2=A0=C2=A0 case 8: \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __amoswap_generic(ptr__=
, new__, ret__,\
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ".d" sfx,=C2=A0 release_barrier,
> > > > acquire_barrier); \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break; \
> > > > +=C2=A0=C2=A0=C2=A0 default: \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 STATIC_ASSERT_UNREACHAB=
LE(); \
> > > > +=C2=A0=C2=A0=C2=A0 } \
> > > > +=C2=A0=C2=A0=C2=A0 ret__; \
> > > > +})
> > > > +
> > > > +#define xchg_relaxed(ptr, x) \
> > > > +({ \
> > > > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) x_ =3D (x); \
> > > > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__xchg_generic(ptr, x_,
> > > > sizeof(*(ptr)),
> > > > "", "", ""); \
> > > > +})
> > > > +
> > > > +#define xchg_acquire(ptr, x) \
> > > > +({ \
> > > > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) x_ =3D (x); \
> > > > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__xchg_generic(ptr, x_,
> > > > sizeof(*(ptr)), \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "", "",
> > > > RISCV_ACQUIRE_BARRIER); \
> > > > +})
> > > > +
> > > > +#define xchg_release(ptr, x) \
> > > > +({ \
> > > > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) x_ =3D (x); \
> > > > +=C2=A0=C2=A0=C2=A0 (__typeof__(*(ptr)))__xchg_generic(ptr, x_,
> > > > sizeof(*(ptr)),\
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 "",
> > > > RISCV_RELEASE_BARRIER,
> > > > ""); \
> > > > +})
> > > > +
> > > > +#define xchg(ptr,x) \
> > > > +({ \
> > > > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) ret__; \
> > > > +=C2=A0=C2=A0=C2=A0 ret__ =3D (__typeof__(*(ptr))) \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 __xchg_generic(ptr, (unsigned long)(x),
> > > > sizeof(*(ptr)), \
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ".aqrl", "", ""); \
> > >=20
> > > The .aqrl doesn't look to affect the (emulated) 1- and 2-byte
> > > cases.
> > >=20
> > > Further, amoswap also exists in release-only and acquire-only
> > > forms.
> > > Why do you prefer explicit barrier insns over those? (Looks to
> > > similarly apply to the emulation path as well as to the cmpxchg
> > > machinery then, as both lr and sc also come in all four possible
> > > acquire/release forms. Perhaps for the emulation path using
> > > explicit barriers is better, in case the acquire/release forms of
> > > lr/sc - being used inside the loop - might perform worse.)
> > As 1- and 2-byte cases are emulated I decided that is not to
> > provide
> > sfx argument for emulation macros as it will not have to much
> > affect on
> > emulated types and just consume more performance on acquire and
> > release
> > version of sc/ld instructions.
>=20
> Question is whether the common case (4- and 8-byte accesses)
> shouldn't
> be valued higher, with 1- and 2-byte emulation being there just to
> allow things to not break altogether.
If I understand you correctly, it would make sense to add the 'sfx'
argument for the 1/2-byte access case, ensuring that all options are
available for 1/2-byte access case as well.


~ Oleksii


