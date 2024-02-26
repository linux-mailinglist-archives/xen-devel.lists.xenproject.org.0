Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E728678C2
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 15:38:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685580.1066521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rec78-000419-OD; Mon, 26 Feb 2024 14:37:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685580.1066521; Mon, 26 Feb 2024 14:37:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rec78-0003yj-KN; Mon, 26 Feb 2024 14:37:54 +0000
Received: by outflank-mailman (input) for mailman id 685580;
 Mon, 26 Feb 2024 14:37:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rec77-0003yd-5F
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 14:37:53 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e0f6f67-d4b4-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 15:37:50 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-512a65cd2c7so4385621e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 06:37:50 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a056512202a00b00512ef0a8f3asm863037lfs.15.2024.02.26.06.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 06:37:49 -0800 (PST)
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
X-Inumbo-ID: 9e0f6f67-d4b4-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708958270; x=1709563070; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u1E0M73nbUP55/W60+PLeXgQRkWaZatj6ybuxc5UDrU=;
        b=QU7W078A52yWqTZZL5+9xlwnyzTdnIqNbhIDDm70sdChgrZbrPr1sElyXpg7KZv2ys
         Ce/MmiQp3MjcaoG8be88KqerDV5UOZGoQWap/apqBriIbOOJZO67y6yJt4JcJe8/lqXW
         4oWRH7gZ4D+i6noLj8AdlyfpHtMnjM7NUK5kC9wbnW7DS/wgtktBnxXAE90wkbpIk20W
         ShEWHViDLB+YvYw5OAoJx6aHBSDsVRNDzCCnAx64YTxmQw66skG05Monse2gX54JX5xa
         X7HfjJwrAA6towSJSWlK/IGoPQ2MlF6U9NLIz5OqTB9GoBN+fjmjNnT8dVPxCS3ChhuC
         5qjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708958270; x=1709563070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1E0M73nbUP55/W60+PLeXgQRkWaZatj6ybuxc5UDrU=;
        b=tsJys11oNodzBTgXyd+mpRMI4FoLSVSObDPo3XZUUpOg3fURsTWYS2ws/bsBxhLhCb
         SiZjUC/zcx8az24CQP++8IIF5LSkpVjSyx7+RJEJLC3+/eoGd6DaOSlUWY6/YX1kKpXB
         nZpeOQsJBMJjnw11iec6IdYB4lueUfVHmhjkN6zSz2y9EKj+U6stQNpCl7XRpmSivZkD
         z2xVUu/wZJbYw9EFKwjCaNkKPAVjB5RD/I+d13w1eKoA++PBIvyF3/9z2GdFF8oQAXPG
         FJ5KHK6P79lcu0XqZQG5oMF41TgWOA0C/xbZbYLnIQzFUd6RIxbPMbbb1SUUpfOnckyw
         v0EA==
X-Forwarded-Encrypted: i=1; AJvYcCUxM99/ujsgljoN26KIfLX9RSGsx8UgaGR0Rsxr3+OyR8LCp5ICPtKQct/xudgS12BNdoeG6Q4oi9odyqbYPL5jXaXCBKg3rsyikAg4ST8=
X-Gm-Message-State: AOJu0YzFdWA4+fcL+z5I/MfM7Lfi6slRz6VuiSitXabl9Hi0GN7aNHpx
	gVRc4pYGXIdG+qOsfpR9cHQf3nqHpE9TqscEUizBtg3dWWAA353I
X-Google-Smtp-Source: AGHT+IE0UOWJHNWn31KZ5iNnGSs+imdgvkHHDe+z5pd7bpRPXc4H+4LPs3eUeh7aPtGA7xzMK34Ddw==
X-Received: by 2002:a05:6512:2820:b0:512:b915:606a with SMTP id cf32-20020a056512282000b00512b915606amr5652410lfb.12.1708958269773;
        Mon, 26 Feb 2024 06:37:49 -0800 (PST)
Message-ID: <a5e4c87720ca781ef113d7ee575a97656350a114.camel@gmail.com>
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 26 Feb 2024 15:37:48 +0100
In-Reply-To: <4f59127c-6a98-4672-9202-4d48817a1931@suse.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
	 <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
	 <9e50ef30-8dc6-4380-aa65-724e5a376c10@suse.com>
	 <28844fdfcf5eea515497fb7b5fd8ea6fb1c5ebaa.camel@gmail.com>
	 <554a43e8-7d8d-45c4-936d-36f02c207531@suse.com>
	 <1c53b52ee39161a8f59209d28af69fe997479dbc.camel@gmail.com>
	 <3b38fe82-ee0f-4666-93e1-bd78fe69c534@suse.com>
	 <5d2d35fe014094c991363e42c3e2ad9ca2af3938.camel@gmail.com>
	 <44fd5092-7838-4d28-804b-bbfebfd44886@suse.com>
	 <56ae27d003b8763af34864ae56433691685c3661.camel@gmail.com>
	 <7cab68d1-9bdf-4ea1-b49a-cce1e4af4692@suse.com>
	 <4215fb9eb5be5898b3cc9c2977e55ac0e7270b4d.camel@gmail.com>
	 <4f59127c-6a98-4672-9202-4d48817a1931@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-26 at 15:20 +0100, Jan Beulich wrote:
> On 26.02.2024 13:58, Oleksii wrote:
> > On Mon, 2024-02-26 at 12:28 +0100, Jan Beulich wrote:
> > > On 26.02.2024 12:18, Oleksii wrote:
> > > > On Mon, 2024-02-26 at 10:45 +0100, Jan Beulich wrote:
> > > > > On 23.02.2024 13:23, Oleksii wrote:
> > > > > > >=20
> > > > > > > > > > As 1- and 2-byte cases are emulated I decided that
> > > > > > > > > > is
> > > > > > > > > > not
> > > > > > > > > > to
> > > > > > > > > > provide
> > > > > > > > > > sfx argument for emulation macros as it will not
> > > > > > > > > > have
> > > > > > > > > > to
> > > > > > > > > > much
> > > > > > > > > > affect on
> > > > > > > > > > emulated types and just consume more performance on
> > > > > > > > > > acquire
> > > > > > > > > > and
> > > > > > > > > > release
> > > > > > > > > > version of sc/ld instructions.
> > > > > > > > >=20
> > > > > > > > > Question is whether the common case (4- and 8-byte
> > > > > > > > > accesses)
> > > > > > > > > shouldn't
> > > > > > > > > be valued higher, with 1- and 2-byte emulation being
> > > > > > > > > there
> > > > > > > > > just
> > > > > > > > > to
> > > > > > > > > allow things to not break altogether.
> > > > > > > > If I understand you correctly, it would make sense to
> > > > > > > > add
> > > > > > > > the
> > > > > > > > 'sfx'
> > > > > > > > argument for the 1/2-byte access case, ensuring that
> > > > > > > > all
> > > > > > > > options
> > > > > > > > are
> > > > > > > > available for 1/2-byte access case as well.
> > > > > > >=20
> > > > > > > That's one of the possibilities. As said, I'm not overly
> > > > > > > worried
> > > > > > > about
> > > > > > > the emulated cases. For the initial implementation I'd
> > > > > > > recommend
> > > > > > > going
> > > > > > > with what is easiest there, yielding the best possible
> > > > > > > result
> > > > > > > for
> > > > > > > the
> > > > > > > 4- and 8-byte cases. If later it turns out repeated
> > > > > > > acquire/release
> > > > > > > accesses are a problem in the emulation loop, things can
> > > > > > > be
> > > > > > > changed
> > > > > > > to explicit barriers, without touching the 4- and 8-byte
> > > > > > > cases.
> > > > > > I am confused then a little bit if emulated case is not an
> > > > > > issue.
> > > > > >=20
> > > > > > For 4- and 8-byte cases for xchg .aqrl is used, for relaxed
> > > > > > and
> > > > > > aqcuire
> > > > > > version of xchg barries are used.
> > > > > >=20
> > > > > > The similar is done for cmpxchg.
> > > > > >=20
> > > > > > If something will be needed to change in emulation loop it
> > > > > > won't
> > > > > > require to change 4- and 8-byte cases.
> > > > >=20
> > > > > I'm afraid I don't understand your reply.
> > > > IIUC, emulated cases it is implemented correctly in terms of
> > > > usage
> > > > barriers. And it also OK not to use sfx for lr/sc instructions
> > > > and
> > > > use
> > > > only barriers.
> > > >=20
> > > > For 4- and 8-byte cases are used sfx + barrier depending on the
> > > > specific case ( relaxed, acquire, release, generic xchg/cmpxchg
> > > > ).
> > > > What also looks to me correct. But you suggested to provide the
> > > > best
> > > > possible result for 4- and 8-byte cases.=C2=A0
> > > >=20
> > > > So I don't understand what the best possible result is as the
> > > > current
> > > > one usage of __{cmp}xchg_generic for each specific case=C2=A0 (
> > > > relaxed,
> > > > acquire, release, generic xchg/cmpxchg ) looks correct to me:
> > > > xchg -> (..., ".aqrl", "", "") just suffix .aqrl suffix without
> > > > barriers.
> > > > xchg_release -> (..., "", RISCV_RELEASE_BARRIER, "" ) use only
> > > > release
> > > > barrier
> > > > xchg_acquire -> (..., "", "", RISCV_ACQUIRE_BARRIER ), only
> > > > acquire
> > > > barrier
> > > > xchg_relaxed ->=C2=A0 (..., "", "", "") - no barries, no sfx
> > >=20
> > > So first: While explicit barriers are technically okay, I don't
> > > follow why
> > > you insist on using them when you can achieve the same by
> > > suitably
> > > tagging
> > > the actual insn doing the exchange. Then second: It's somewhat
> > > hard
> > > for me
> > > to see the final effect on the emulation paths without you
> > > actually
> > > having
> > > done the switch. Maybe no special handling is necessary there
> > > anymore
> > > then. And as said, it may actually be acceptable for the
> > > emulation
> > > paths
> > > to "only" be correct, but not be ideal in terms of performance.
> > > After
> > > all,
> > > if you use the normal 4-byte primitive in there, more (non-
> > > explicit)
> > > barriers than needed would occur if the involved loop has to take
> > > more
> > > than one iteration. Which could (but imo doesn't need to be)
> > > avoided
> > > by
> > > using a more relaxed 4-byte primitive there and an explicit
> > > barrier
> > > outside of the loop.
> >=20
> > According to the spec:
> > Table A.5 ( part of the table only I copied here )
> >=20
> > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 R=
VWMO Mapping
> > atomic <op> relaxed=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 amo<op>.{w|d}
> > atomic <op> acquire=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 amo<op>.{w|d}.aq
> > atomic <op> release=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 amo<op>.{w|d}.rl
> > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.aqrl
> >=20
> > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 R=
VWMO LR/SC Mapping
> > atomic <op> relaxed=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loop: lr.{w|d};=
 <op>; sc.{w|d}; bnez loop
> > atomic <op> acquire=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}.=
aq; <op>; sc.{w|d}; bnez
> > loop
> > atomic <op> release=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loop: lr.{w|d};=
 <op>; sc.{w|d}.aqrl=E2=88=97 ;
> > bnez=20
> > loop OR
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 fence.tso; loop: lr.{w|d}; <op>;
> > sc.{w|d}=E2=88=97 ;
> > bnez loop
> > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl;
> > bnez
> > loop
>=20
> In your consideration what to implement you will want to limit
> things to constructs we actually use. I can't find any use of the
> relaxed, acquire, or release forms of atomics as mentioned above.
>=20
> > The Linux mappings for release operations may seem stronger than
> > necessary, but these mappings
> > are needed to cover some cases in which Linux requires stronger
> > orderings than the more intuitive
> > mappings would provide. In particular, as of the time this text is
> > being written, Linux is actively
> > debating whether to require load-load, load-store, and store-store
> > orderings between accesses in one
> > critical section and accesses in a subsequent critical section in
> > the
> > same hart and protected by the
> > same synchronization object. Not all combinations of FENCE
> > RW,W/FENCE
> > R,RW mappings
> > with aq/rl mappings combine to provide such orderings. There are a
> > few
> > ways around this problem,
> > including:
> > 1. Always use FENCE RW,W/FENCE R,RW, and never use aq/rl. This
> > suffices
> > but is undesir-
> > able, as it defeats the purpose of the aq/rl modifiers.
> > 2. Always use aq/rl, and never use FENCE RW,W/FENCE R,RW. This does
> > not
> > currently work
> > due to the lack of load and store opcodes with aq and rl modifiers.
>=20
> I don't understand this point: Which specific load and/or store forms
> are missing? According to my reading of the A extension spec all
> combination of aq/rl exist with both lr and sc.
I think this is not about lr and sc instructions.
It is about l{b|h|w|d} and s{b|h|w|d}, which should be used with fence
in case of acquire and seq_cst.

>=20
> > 3. Strengthen the mappings of release operations such that they
> > would
> > enforce sufficient order-
> > ings in the presence of either type of acquire mapping. This is the
> > currently-recommended
> > solution, and the one shown in Table A.5.
> >=20
> >=20
> > Based on this it is enough in our case use only suffixed
> > istructions
> > (amo<op>.{w|d}{.aq, .rl, .aqrl, .aqrl }, lr.{w|d}.{.aq, .aqrl }.
> >=20
> >=20
> > But as far as I understand in Linux atomics were strengthen with
> > fences:
> > =C2=A0=C2=A0=C2=A0 Atomics present the same issue with locking: release=
 and
> > acquire
> > =C2=A0=C2=A0=C2=A0 variants need to be strengthened to meet the constra=
ints
> > defined
> > =C2=A0=C2=A0=C2=A0 by the Linux-kernel memory consistency model [1].
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 Atomics present a further issue: implementations of =
atomics
> > such
> > =C2=A0=C2=A0=C2=A0 as atomic_cmpxchg() and atomic_add_unless() rely on =
LR/SC
> > pairs,
> > =C2=A0=C2=A0=C2=A0 which do not give full-ordering with .aqrl; for exam=
ple,
> > current
> > =C2=A0=C2=A0=C2=A0 implementations allow the "lr-sc-aqrl-pair-vs-full-b=
arrier"
> > test
> > =C2=A0=C2=A0=C2=A0 below to end up with the state indicated in the "exi=
sts"
> > clause.
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 In order to "synchronize" LKMM and RISC-V's implemen=
tation,
> > this
> > =C2=A0=C2=A0=C2=A0 commit strengthens the implementations of the atomic=
s
> > operations
> > =C2=A0=C2=A0=C2=A0 by replacing .rl and .aq with the use of ("lightweig=
th")
> > fences,
> > =C2=A0=C2=A0=C2=A0 and by replacing .aqrl LR/SC pairs in sequences such=
 as:
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lr.w.aq=
rl=C2=A0 %0, %addr
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 bne=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %0, %old, 1f
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 sc.w.aqrl=C2=A0 %1, %new, %addr
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 bnez=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %1, 0b
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 with sequences of the form:
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lr.w=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %0, %addr
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 bne=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %0, %old, 1f
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 sc.w.rl=C2=A0=C2=A0=C2=A0 %1, %new, %addr=C2=A0=C2=A0 /* SC-relea=
se=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 bnez=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %1, 0b
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fence=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rw, rw=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* "full" fence */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 following Daniel's suggestion.
>=20
> I'm likely missing something, yet as it looks it does help that the
> code fragment above appears to be ...
>=20
> > =C2=A0=C2=A0=C2=A0 These modifications were validated with simulation o=
f the RISC-
> > V
> > =C2=A0=C2=A0=C2=A0 with sequences of the form:
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lr.w=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %0, %addr
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 bne=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %0, %old, 1f
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ...
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 sc.w.rl=C2=A0=C2=A0=C2=A0 %1, %new, %addr=C2=A0=C2=A0 /* SC-relea=
se=C2=A0=C2=A0 */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 bnez=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %1, 0b
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 fence=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rw, rw=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* "full" fence */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1:
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 following Daniel's suggestion.
>=20
> ... entirely the same as this one. Yet there's presumably a reason
> for quoting it twice?
I think it was done by accident

~ Oleksii
>=20
> > =C2=A0=C2=A0=C2=A0 These modifications were validated with simulation o=
f the RISC-
> > V
> > =C2=A0=C2=A0=C2=A0 memory consistency model.
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 C lr-sc-aqrl-pair-vs-full-barrier
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 {}
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 P0(int *x, int *y, atomic_t *u)
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int =
r0;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int =
r1;
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRIT=
E_ONCE(*x, 1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r0 =
=3D atomic_cmpxchg(u, 0, 1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r1 =
=3D READ_ONCE(*y);
> > =C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 P1(int *x, int *y, atomic_t *v)
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int =
r0;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int =
r1;
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WRIT=
E_ONCE(*y, 1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r0 =
=3D atomic_cmpxchg(v, 0, 1);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r1 =
=3D READ_ONCE(*x);
> > =C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 exists (u=3D1 /\ v=3D1 /\ 0:r1=3D0 /\ 1:r1=3D0)
> > =C2=A0=C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0 [1] https://marc.info/?l=3Dlinux-kernel&m=3D15193020=
1102853&w=3D2
> > =C2=A0=C2=A0=C2=A0=C2=A0=20
> > https://groups.google.com/a/groups.riscv.org/forum/#!topic/isa-dev/hKyw=
NHBkAXM
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://marc.info/?l=3Dlinux=
-kernel&m=3D151633436614259&w=3D2
> >=20
> >=20
> > Thereby Linux kernel implementation seems to me more safe and it is
> > a
> > reason why I want/wanted to be aligned with it.
>=20
> Which may end up being okay. I hope you realize though that there's a
> lot more explanation needed in the respective commits then compared
> to
> what you've had so far. As a minimum, absolutely anything remotely
> unexpected needs to be explained.
>=20
> Jan


