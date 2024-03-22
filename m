Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C96886C64
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 13:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696862.1088047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rneNm-0003d1-VH; Fri, 22 Mar 2024 12:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696862.1088047; Fri, 22 Mar 2024 12:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rneNm-0003bI-SV; Fri, 22 Mar 2024 12:52:26 +0000
Received: by outflank-mailman (input) for mailman id 696862;
 Fri, 22 Mar 2024 12:52:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L8LS=K4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rneNl-0003bC-Cm
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 12:52:25 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 071fdad1-e84b-11ee-afe0-a90da7624cb6;
 Fri, 22 Mar 2024 13:52:23 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d68cf90ec4so34933151fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 05:52:23 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a2eb6cc000000b002d51e0b73aesm325287ljo.25.2024.03.22.05.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 05:52:22 -0700 (PDT)
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
X-Inumbo-ID: 071fdad1-e84b-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711111943; x=1711716743; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2AjX52arJOb3qX7Zkuo3O90zxeaE8rnXkhEP3gEk3SA=;
        b=SytTFkaVjI46NlfIiGz5UtrHDPUVvmrlOQ088X021GoxaySI9lHuiOH2MSMsgk7rcC
         4mBOmSwN8+ZLpNxvd+ltCxda9eey+PAb/0cm0XV4RxoyzIh253ZhuqSJQPCu6bh1rmuY
         bWX7tQrgXriC2MQgN7FaVSxCHSKm7KWG9DOTYVnDUwYdfjLgZckgjot8gg/WI8ppe9lT
         UcFHhsbsjtcZcfnYp33ivE/yAGDMKvvY+oUiNjySjqyyvGu1JASfPBlwnbth6l4jpI4G
         wXefLQzF8kWxZzJzL1R6FuK1X/2JGIz5EnthjFZQS2WmEpsoxw3fkslCMmQxHXQY+/tk
         D4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711111943; x=1711716743;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AjX52arJOb3qX7Zkuo3O90zxeaE8rnXkhEP3gEk3SA=;
        b=QhjZisGugfk0fMQdiDjwtCgae1iTqKVxfXYqRxvp7cCv0D4C6QpTAnYJc23106f57S
         6DWlGuyyKNlF1HKJRG1jPf8ykYcKh+X8/UvrZuCX7b8RodMvYmW0dEdp3gWWIpB0/Ht4
         MqSemw8HmvH1TnccOMzWtwGlkMPg9ndeahaN6zW/cWAk47Rc9eoPFZRp7A09VKjbvOhj
         heHwna2CUYvii9JpJ9am6u0Fuj/2UkIIGJ8y4Jv7yGoWAmmoilw3cMbsE7scnitplXx5
         zoLcvApELGnOA4PGxpmXrgvt6kK2hAPzjfd9Hub7X1Wfo08buNZyV9OjZ5OZe8YAIrfS
         J1Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXtHhFieRLHbHnUlg/DcBFEbgYmfmFcSYGwKB3JAX56sdNsy4VODrzk+WibLwFnpETrBebJlhgGzoXl/8jwBZ2SI7JGQb6iHBk/ux0tDTE=
X-Gm-Message-State: AOJu0YyWDcxcwr63x4ZRqTofYhMMh4Miyonj8rQL6N2Yu1MZa6pKhgR2
	27z4MDNHUC2euC8GgNOXt4Y4lkUQIctXnXHV46jMre3F63GqtGSk
X-Google-Smtp-Source: AGHT+IFR/e/zL9q1swEqQsfD0Vwspax/xfSJIUfC6vLnBVzgkS8LeV4UYjCsfyCegIVZ2YGTpL7XIg==
X-Received: by 2002:a05:651c:1043:b0:2d4:2ef1:ed83 with SMTP id x3-20020a05651c104300b002d42ef1ed83mr1573346ljm.9.1711111942776;
        Fri, 22 Mar 2024 05:52:22 -0700 (PDT)
Message-ID: <00fde5befebeedcddd2e3d04cc9b00fddc00fc3b.camel@gmail.com>
Subject: Re: [PATCH v6 08/20] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 22 Mar 2024 13:52:21 +0100
In-Reply-To: <a240f07f-a6f9-447e-b607-c3769e1f7af8@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <bf65ce1ff5f683cc6b638fa7de0c54d5e0aead33.1710517542.git.oleksii.kurochko@gmail.com>
	 <6f73368c-ea73-4d86-a6a1-8f9784c4b01f@suse.com>
	 <ce522fd6be6169296789efd35ed8af18967f2958.camel@gmail.com>
	 <a240f07f-a6f9-447e-b607-c3769e1f7af8@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Fri, 2024-03-22 at 11:42 +0100, Jan Beulich wrote:
> On 22.03.2024 11:32, Oleksii wrote:
> > On Thu, 2024-03-21 at 13:07 +0100, Jan Beulich wrote:
> > > On 15.03.2024 19:06, Oleksii Kurochko wrote:
> > > > The header was taken from Linux kernl 6.4.0-rc1.
> > > >=20
> > > > Addionally, were updated:
> > > > * add emulation of {cmp}xchg for 1/2 byte types using 32-bit
> > > > atomic
> > > > =C2=A0 access.
> > > > * replace tabs with spaces
> > > > * replace __* variale with *__
> > > > * introduce generic version of xchg_* and cmpxchg_*.
> > > > * drop {cmp}xchg{release,relaxed,acquire} as Xen doesn't use
> > > > them
> > >=20
> > > With this, ...
> > >=20
> > > > * drop barries and use instruction suffixices instead ( .aq,
> > > > .rl,
> > > > .aqrl )
> > > >=20
> > > > Implementation of 4- and 8-byte cases were updated according to
> > > > the
> > > > spec:
> > > > ```
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ....
> > > > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVW=
MO AMO Mapping
> > > > atomic <op> relaxed=C2=A0=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}
> > > > atomic <op> acquire=C2=A0=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.aq
> > > > atomic <op> release=C2=A0=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.rl
> > > > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.aqrl
> > > > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVW=
MO LR/SC Mapping
> > > > atomic <op> relaxed=C2=A0=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}; <op>; s=
c.{w|d}; bnez
> > > > loop
> > > > atomic <op> acquire=C2=A0=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}.aq; <op>=
; sc.{w|d}; bnez
> > > > loop
> > > > atomic <op> release=C2=A0=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}; <op>; s=
c.{w|d}.aqrl=E2=88=97 ;
> > > > bnez
> > > > loop OR
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fe=
nce.tso; loop: lr.{w|d}; <op>;
> > > > sc.{w|d}=E2=88=97
> > > > ; bnez loop
> > > > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl;
> > > > bnez loop
> > > >=20
> > > > Table A.5: Mappings from Linux memory primitives to RISC-V
> > > > primitives
> > > >=20
> > > > ```
> > >=20
> > > ... I consider quoting this table in full, without any further
> > > remarks, as
> > > confusing: Three of the lines each are inapplicable now, aiui.
> > I'll shorten the table then.
> >=20
> > >=20
> > > Further what are the two * telling us? Quite likely they aren't
> > > there
> > > just
> > > accidentally.
> > >=20
> > > Finally, why sc.{w|d}.aqrl when in principle one would expect
> > > just
> > > sc.{w|d}.rl?
> > Because according to the last line of table A.5:
> > =C2=A0=C2=A0=C2=A0 atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl;
> > Here it is used sc.{w|d}.aqrl form, so I decided to stick to the
> > what
> > is mentioned in the table.
>=20
> I understand it's mentioned that way in the table. But it being that
> way
> is not explained anywhere. Hence my "Why?"
>=20
> > > > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) old__ =3D (__typeof__(*(ptr)=
))(old); \
> > > > +=C2=A0=C2=A0=C2=A0 __typeof__(*(ptr)) new__ =3D (__typeof__(*(ptr)=
))(new); \
> > >=20
> > > The casts aren't very nice to have here; I take they're needed
> > > for
> > > cmpxchg_ptr() to compile?
> > Not really, I have not faced an compilation issue.
> > The reason why it was added is that lr instruction places the sign-
> > extended value in destination register, but if not to do cast value
> > for
> > old and new were generated without sign extension, so, for example:
> > =C2=A0=C2=A0 u32=3D 0xbbbbbbbb;
> > =C2=A0=C2=A0 cmpxchg(&u32, 0xbbbbbbbb, 0xCCCCCCCC), u32);
> > Will fail because after:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr" lr_sfx " %0, %2\n"=20
> > in %0 we will have 0xFFFFFFFFBBBBBBBB, but in %3 we will have
> > 0xBBBBBBBB, so
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bne=C2=A0 %0, %z3, 1f\n"
> > %0 and %3 are always inequal in case when the most significat bit
> > of
> > value read from %2 has 1.
>=20
> I'm afraid I don't follow: It's the type conversion you're after, but
> that would happen also with the casts omitted.
Yes, agree it would happen also with the casts omitted, and it was pure
luck that the compiler that with casts the compiler used an immediate
with the most significant bit =3D 1:
ffffffffc00397f0:       bbbbc7b7                lui     a5,0xbbbbc
ffffffffc00397f4:       bbb78793                add     a5,a5,-1093 #
ffffffffbbbbbbbb <start-0x4444445>
ffffffffc00397f8:       fef42623                sw      a5,-20(s0)
ffffffffc00397fc:       ccccd737                lui     a4,0xccccd
ffffffffc0039800:       ccc7071b                addw    a4,a4,-820 #
ffffffffcccccccc <__bss_end+0xcc7ff44>
ffffffffc0039804:       56fd                    li      a3,-1
ffffffffc0039806:       9281                    srl     a3,a3,0x20
ffffffffc0039808:       fec40513                add     a0,s0,-20
ffffffffc003980c:       140525af                lr.w.aq a1,(a0)
ffffffffc0039810:       00f59563                bne   =20
a1,a5,ffffffffc003981a <start_xen+0x4e>
ffffffffc0039814:       1ee5262f                sc.w.aqrl     =20
a2,a4,(a0)

I will update the code with the mask mentioned below to be sure that a5
has always correct value.

~ Oleksii

>=20
> > But now I realized that it would be better just to use a mask and
> > not
> > be dependent from compiler code generation, so it would be better
> > to in
> > the following way ( of course, the macros should be updated
> > accordingly
> > to remarks you give me ):
> > =C2=A0=C2=A0 #define __generic_cmpxchg(ptr, old, new, ret, lr_sfx,
> > sc_sfx)	\
> > =C2=A0=C2=A0=C2=A0 ({ \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 register unsigned int rc; \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long mask =3D GENMASK(((s=
izeof(*(ptr))) *
> > BITS_PER_BYTE)
> > =C2=A0=C2=A0 - 1, 0); \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 asm volatile( \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr" lr=
_sfx " %0, %2\n" \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=
=A0 and=C2=A0 %0, %0, %z[mask]\n" \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=
=A0 bne=C2=A0 %0, %z3, 1f\n" \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=
=A0 sc" sc_sfx " %1, %z4, %2\n" \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=
=A0 bnez %1, 0b\n" \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\n" \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "=3D&r" =
(ret), "=3D&r" (rc), "+A" (*ptr) \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "rJ" (ol=
d), "rJ" (new), [mask] "rJ" (mask)=C2=A0 \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : "memory"=
); \
> > =C2=A0=C2=A0=C2=A0 })
>=20
> It'll be up to you whether to switch to such an alternative.
>=20
> Jan


