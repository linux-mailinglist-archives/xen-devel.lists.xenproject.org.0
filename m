Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A49558675CD
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 13:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685538.1066421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaYf-0007tH-8B; Mon, 26 Feb 2024 12:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685538.1066421; Mon, 26 Feb 2024 12:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reaYf-0007qT-3z; Mon, 26 Feb 2024 12:58:13 +0000
Received: by outflank-mailman (input) for mailman id 685538;
 Mon, 26 Feb 2024 12:58:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reaYe-0007q5-0o
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 12:58:12 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1e9bbc5-d4a6-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 13:58:11 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-512f54fc2dbso1660493e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 04:58:11 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 dw18-20020a0565122c9200b00513006c81e6sm182331lfb.227.2024.02.26.04.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 04:58:09 -0800 (PST)
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
X-Inumbo-ID: b1e9bbc5-d4a6-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708952290; x=1709557090; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ocrjv9MX/0j1ycgtaB2LxdkVc/truj/tAIo/gUlOhzk=;
        b=HlTzpWhMSd7ru6/cTRMt2wZnRW3uY8VEM/8cZUDxent5WKdNM5XAThEgeaCzrWN5se
         M7Os+P5LYtCM6T7HWdxxwyYFUYWXncVKrEo6dhHoILZcRbWk52KNvn5EffJa1RF375yN
         4jZtllIy4ZEZd59drifkT/Zsee2Kbw70G59Q5bbJP0/pNdXo3cJ5IhmXqIX3PCFHnW0s
         XlVoQHNLfA75Ppt8xxBYa3zU5ymhvpJIAhkC9ly8m/wpoOzjz4mPpj05ju5cMuPqYVoN
         iwWj1yVTjNBtBdsqtAwK8DwF7TDA6twyjHOf379I16yd8UjPy5gO4T+0JzUeND/0zEOR
         OuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708952290; x=1709557090;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ocrjv9MX/0j1ycgtaB2LxdkVc/truj/tAIo/gUlOhzk=;
        b=wiayfxm3NaCDiNuOrFBZe0xGO0cZnHLFsMJ52hwEghXdtXHNOzwQ5SA5t8xfZJ7QM2
         fqlOsfVPquJKIN9ZbZaGLtQRyBD/Ae0sflfiFLMqbNZl3tulAeQuI+7qOb1/sbUl+fYm
         DfhE3u0vZIhaPD+hHhMLGrVriTlrhHYLg5ZxBgecz+UZu3dMjBlZ9uU9/66UlpfnZg/g
         FZNexa10wzbJJxm2TovNUqsq5F8/qmK5q+7saxCf5U5fumOgV3wDjifcmsr9UUaF6Aax
         TRCc40lfdzbXcS84F//2eXNzUoVToWIRweGJXsASH2rSrOi5vEXRJ4G568fV9UMnPVea
         gqwQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4vmOqnPJj1FZx6OTFZ091dRgK9vykhOuijGqWJx5wteRe7Nmt+0dRMC46lenEaHoEv4yAKWUs0g4VWfDNm4zemNpk2nCkE0166/k8ZXk=
X-Gm-Message-State: AOJu0Yyg6JyTEjLd2MIi/v7iO/3UcCPCKphGhIWhodDcjW+LzVhPWNrw
	grEtJ+tzlY6HYacx2rdPFf39CVx0eXN9XdKujq9neXVAq40HsKih
X-Google-Smtp-Source: AGHT+IGV/dNISZxrid+ksVXLd70QU18jT9jgSGTlEX46q5o4utWWVPfElJaDau67OLjNPvSBS4zWTw==
X-Received: by 2002:a05:6512:110c:b0:512:f5b8:8912 with SMTP id l12-20020a056512110c00b00512f5b88912mr3721949lfg.16.1708952290141;
        Mon, 26 Feb 2024 04:58:10 -0800 (PST)
Message-ID: <4215fb9eb5be5898b3cc9c2977e55ac0e7270b4d.camel@gmail.com>
Subject: Re: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Mon, 26 Feb 2024 13:58:09 +0100
In-Reply-To: <7cab68d1-9bdf-4ea1-b49a-cce1e4af4692@suse.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-02-26 at 12:28 +0100, Jan Beulich wrote:
> On 26.02.2024 12:18, Oleksii wrote:
> > On Mon, 2024-02-26 at 10:45 +0100, Jan Beulich wrote:
> > > On 23.02.2024 13:23, Oleksii wrote:
> > > > >=20
> > > > > > > > As 1- and 2-byte cases are emulated I decided that is
> > > > > > > > not
> > > > > > > > to
> > > > > > > > provide
> > > > > > > > sfx argument for emulation macros as it will not have
> > > > > > > > to
> > > > > > > > much
> > > > > > > > affect on
> > > > > > > > emulated types and just consume more performance on
> > > > > > > > acquire
> > > > > > > > and
> > > > > > > > release
> > > > > > > > version of sc/ld instructions.
> > > > > > >=20
> > > > > > > Question is whether the common case (4- and 8-byte
> > > > > > > accesses)
> > > > > > > shouldn't
> > > > > > > be valued higher, with 1- and 2-byte emulation being
> > > > > > > there
> > > > > > > just
> > > > > > > to
> > > > > > > allow things to not break altogether.
> > > > > > If I understand you correctly, it would make sense to add
> > > > > > the
> > > > > > 'sfx'
> > > > > > argument for the 1/2-byte access case, ensuring that all
> > > > > > options
> > > > > > are
> > > > > > available for 1/2-byte access case as well.
> > > > >=20
> > > > > That's one of the possibilities. As said, I'm not overly
> > > > > worried
> > > > > about
> > > > > the emulated cases. For the initial implementation I'd
> > > > > recommend
> > > > > going
> > > > > with what is easiest there, yielding the best possible result
> > > > > for
> > > > > the
> > > > > 4- and 8-byte cases. If later it turns out repeated
> > > > > acquire/release
> > > > > accesses are a problem in the emulation loop, things can be
> > > > > changed
> > > > > to explicit barriers, without touching the 4- and 8-byte
> > > > > cases.
> > > > I am confused then a little bit if emulated case is not an
> > > > issue.
> > > >=20
> > > > For 4- and 8-byte cases for xchg .aqrl is used, for relaxed and
> > > > aqcuire
> > > > version of xchg barries are used.
> > > >=20
> > > > The similar is done for cmpxchg.
> > > >=20
> > > > If something will be needed to change in emulation loop it
> > > > won't
> > > > require to change 4- and 8-byte cases.
> > >=20
> > > I'm afraid I don't understand your reply.
> > IIUC, emulated cases it is implemented correctly in terms of usage
> > barriers. And it also OK not to use sfx for lr/sc instructions and
> > use
> > only barriers.
> >=20
> > For 4- and 8-byte cases are used sfx + barrier depending on the
> > specific case ( relaxed, acquire, release, generic xchg/cmpxchg ).
> > What also looks to me correct. But you suggested to provide the
> > best
> > possible result for 4- and 8-byte cases.=C2=A0
> >=20
> > So I don't understand what the best possible result is as the
> > current
> > one usage of __{cmp}xchg_generic for each specific case=C2=A0 ( relaxed=
,
> > acquire, release, generic xchg/cmpxchg ) looks correct to me:
> > xchg -> (..., ".aqrl", "", "") just suffix .aqrl suffix without
> > barriers.
> > xchg_release -> (..., "", RISCV_RELEASE_BARRIER, "" ) use only
> > release
> > barrier
> > xchg_acquire -> (..., "", "", RISCV_ACQUIRE_BARRIER ), only acquire
> > barrier
> > xchg_relaxed ->=C2=A0 (..., "", "", "") - no barries, no sfx
>=20
> So first: While explicit barriers are technically okay, I don't
> follow why
> you insist on using them when you can achieve the same by suitably
> tagging
> the actual insn doing the exchange. Then second: It's somewhat hard
> for me
> to see the final effect on the emulation paths without you actually
> having
> done the switch. Maybe no special handling is necessary there anymore
> then. And as said, it may actually be acceptable for the emulation
> paths
> to "only" be correct, but not be ideal in terms of performance. After
> all,
> if you use the normal 4-byte primitive in there, more (non-explicit)
> barriers than needed would occur if the involved loop has to take
> more
> than one iteration. Which could (but imo doesn't need to be) avoided
> by
> using a more relaxed 4-byte primitive there and an explicit barrier
> outside of the loop.

According to the spec:
Table A.5 ( part of the table only I copied here )

Linux Construct          RVWMO Mapping
atomic <op> relaxed           amo<op>.{w|d}
atomic <op> acquire           amo<op>.{w|d}.aq
atomic <op> release           amo<op>.{w|d}.rl
atomic <op>                   amo<op>.{w|d}.aqrl

Linux Construct          RVWMO LR/SC Mapping
atomic <op> relaxed       loop: lr.{w|d}; <op>; sc.{w|d}; bnez loop
atomic <op> acquire       loop: lr.{w|d}.aq; <op>; sc.{w|d}; bnez loop
atomic <op> release       loop: lr.{w|d}; <op>; sc.{w|d}.aqrl=E2=88=97 ; bn=
ez=20
loop OR
                          fence.tso; loop: lr.{w|d}; <op>; sc.{w|d}=E2=88=
=97 ;
bnez loop
atomic <op>               loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl; bnez
loop

The Linux mappings for release operations may seem stronger than
necessary, but these mappings
are needed to cover some cases in which Linux requires stronger
orderings than the more intuitive
mappings would provide. In particular, as of the time this text is
being written, Linux is actively
debating whether to require load-load, load-store, and store-store
orderings between accesses in one
critical section and accesses in a subsequent critical section in the
same hart and protected by the
same synchronization object. Not all combinations of FENCE RW,W/FENCE
R,RW mappings
with aq/rl mappings combine to provide such orderings. There are a few
ways around this problem,
including:
1. Always use FENCE RW,W/FENCE R,RW, and never use aq/rl. This suffices
but is undesir-
able, as it defeats the purpose of the aq/rl modifiers.
2. Always use aq/rl, and never use FENCE RW,W/FENCE R,RW. This does not
currently work
due to the lack of load and store opcodes with aq and rl modifiers.
3. Strengthen the mappings of release operations such that they would
enforce sufficient order-
ings in the presence of either type of acquire mapping. This is the
currently-recommended
solution, and the one shown in Table A.5.


Based on this it is enough in our case use only suffixed istructions
(amo<op>.{w|d}{.aq, .rl, .aqrl, .aqrl }, lr.{w|d}.{.aq, .aqrl }.


But as far as I understand in Linux atomics were strengthen with
fences:
    Atomics present the same issue with locking: release and acquire
    variants need to be strengthened to meet the constraints defined
    by the Linux-kernel memory consistency model [1].
   =20
    Atomics present a further issue: implementations of atomics such
    as atomic_cmpxchg() and atomic_add_unless() rely on LR/SC pairs,
    which do not give full-ordering with .aqrl; for example, current
    implementations allow the "lr-sc-aqrl-pair-vs-full-barrier" test
    below to end up with the state indicated in the "exists" clause.
   =20
    In order to "synchronize" LKMM and RISC-V's implementation, this
    commit strengthens the implementations of the atomics operations
    by replacing .rl and .aq with the use of ("lightweigth") fences,
    and by replacing .aqrl LR/SC pairs in sequences such as:
   =20
      0:      lr.w.aqrl  %0, %addr
              bne        %0, %old, 1f
              ...
              sc.w.aqrl  %1, %new, %addr
              bnez       %1, 0b
      1:
   =20
    with sequences of the form:
   =20
      0:      lr.w       %0, %addr
              bne        %0, %old, 1f
              ...
              sc.w.rl    %1, %new, %addr   /* SC-release   */
              bnez       %1, 0b
              fence      rw, rw            /* "full" fence */
      1:
   =20
    following Daniel's suggestion.
   =20
    These modifications were validated with simulation of the RISC-V
    with sequences of the form:
   =20
      0:      lr.w       %0, %addr
              bne        %0, %old, 1f
              ...
              sc.w.rl    %1, %new, %addr   /* SC-release   */
              bnez       %1, 0b
              fence      rw, rw            /* "full" fence */
      1:
   =20
    following Daniel's suggestion.
   =20
    These modifications were validated with simulation of the RISC-V
    memory consistency model.
   =20
    C lr-sc-aqrl-pair-vs-full-barrier
   =20
    {}
   =20
    P0(int *x, int *y, atomic_t *u)
    {
            int r0;
            int r1;
   =20
            WRITE_ONCE(*x, 1);
            r0 =3D atomic_cmpxchg(u, 0, 1);
            r1 =3D READ_ONCE(*y);
    }
   =20
    P1(int *x, int *y, atomic_t *v)
    {
            int r0;
            int r1;
   =20
            WRITE_ONCE(*y, 1);
            r0 =3D atomic_cmpxchg(v, 0, 1);
            r1 =3D READ_ONCE(*x);
    }
   =20
    exists (u=3D1 /\ v=3D1 /\ 0:r1=3D0 /\ 1:r1=3D0)
   =20
    [1] https://marc.info/?l=3Dlinux-kernel&m=3D151930201102853&w=3D2
    =20
https://groups.google.com/a/groups.riscv.org/forum/#!topic/isa-dev/hKywNHBk=
AXM
        https://marc.info/?l=3Dlinux-kernel&m=3D151633436614259&w=3D2


Thereby Linux kernel implementation seems to me more safe and it is a
reason why I want/wanted to be aligned with it.

~ Oleksii



