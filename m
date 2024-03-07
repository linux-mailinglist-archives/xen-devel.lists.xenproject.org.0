Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500C874EFF
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:28:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689868.1075266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCrE-00018I-CD; Thu, 07 Mar 2024 12:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689868.1075266; Thu, 07 Mar 2024 12:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riCrE-00015s-8x; Thu, 07 Mar 2024 12:28:20 +0000
Received: by outflank-mailman (input) for mailman id 689868;
 Thu, 07 Mar 2024 12:28:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqh0=KN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riCrC-00015m-Gr
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:28:18 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c6769de-dc7e-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 13:28:16 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d3f4fef377so10402521fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 04:28:16 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a2e8557000000b002d2c8c25ca6sm2960924ljj.125.2024.03.07.04.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 04:28:15 -0800 (PST)
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
X-Inumbo-ID: 2c6769de-dc7e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709814496; x=1710419296; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GgwUo71JuL3GonfSKL3S+jfvhcE2fWDoEKNr/owHYcI=;
        b=OXffShxc5S/9vLWNBKiighly/IGE14ogxRbfQVDMw6ORQyR5RhigaUW/3xny3aUhMf
         6iD6qRjjLiqZQQCqvFPoUj/ftG4H4Q8P9f7UOrRnQaVN/MyubirVE301rBqRZJZdnL9a
         cnZhVVAX0GtUQiOc2PByZK1QSxXPmVcdjginmvCCy6t9+hKNWruD4ciXiamJCmBg2RFL
         reB1l42OqB4X5I6XBcSsbMB6Bx4+XK294FEDfIIYerEi12fQK10Jqjhtp16cqmMi4JnQ
         ked90IMoQ2OUNGSOwfMzraoeJKNOnxitmj2/KCiWfdy2EjwOrmK8WHYGYgYoCzjCzcD4
         bxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709814496; x=1710419296;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GgwUo71JuL3GonfSKL3S+jfvhcE2fWDoEKNr/owHYcI=;
        b=fk6lTV8WMxJdW9GnqoxtIccLL6NQxsMdJOOs8SuDW9zCXkgZ2L6FAzbT7WIcqKUHTz
         oQYFVixDqlFc+bZw6+2QyRSZGxwnGzXqNd6hWdYKv76NgfuYhrAHhdNzxFb6nKPZEm8r
         S9paJQ4jzbezaxHl3byTnK/MlyFjaVeaUeWMvjYiMmvMQb+JZoR9iWcorjvj0otg57+H
         ADRrNIHhqVNrg4gb6GW5VLlguk+XrQ26xMkbksl06wXUd3dNIvRSaLwuGdXrrEmEXNbx
         qXIh01Re5lV6L+X3iyZaH5qFf1czLBeYJ4BNFH+JPtSQgNh9oQprdU83/3t5TRjD6n9o
         9++w==
X-Forwarded-Encrypted: i=1; AJvYcCUSy269ZnGZks0GTrvg/jENEtdWqDbUXtuTdX5KtgYwXqUfNr7IPdbmq1GjfD7jBgz7M1Fp7rjDdI94qtbPqzZYBIV30e/FS1G+N/e44QY=
X-Gm-Message-State: AOJu0Yw5zI031Sztf8xhI6OekivXzhlZyvmSxgsBklAwwv3GSF11U2me
	SsX4nOf06Vy6e2xIUf/9rd93Go3mnlPJwXfdd1z+zrf0e2cW9d5Y
X-Google-Smtp-Source: AGHT+IHxQZeDFhI2yNVyIu7+JqeButMno0aQ2yC2yeT48EFWSIPozuF2FxjzeGxNUdg5IpGcKa1VKQ==
X-Received: by 2002:a05:651c:1505:b0:2d2:206a:2f2a with SMTP id e5-20020a05651c150500b002d2206a2f2amr1690385ljf.17.1709814495509;
        Thu, 07 Mar 2024 04:28:15 -0800 (PST)
Message-ID: <3ca486b6476c366d5d3f18297cd07dce38993b19.camel@gmail.com>
Subject: Re: [PATCH v5 11/23] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 07 Mar 2024 13:28:14 +0100
In-Reply-To: <8ef64462-d810-4be1-923f-973de340cda2@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <ce7604de39b3480553eeaeafc11138494016983f.1708962629.git.oleksii.kurochko@gmail.com>
	 <23ff1c20-91f3-4c60-9562-7f1cd57c1043@suse.com>
	 <f6e16589bfbcd94d6f62c34f080cbcd3406eca6f.camel@gmail.com>
	 <dd45b338-7b43-442d-85cd-307b3d228d87@suse.com>
	 <af6e59c7abd930bb356ba399fa890a7a541c2aae.camel@gmail.com>
	 <8ef64462-d810-4be1-923f-973de340cda2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-07 at 12:11 +0100, Jan Beulich wrote:
> On 07.03.2024 12:01, Oleksii wrote:
> > On Thu, 2024-03-07 at 11:46 +0100, Jan Beulich wrote:
> > > On 07.03.2024 11:35, Oleksii wrote:
> > > > On Wed, 2024-03-06 at 15:56 +0100, Jan Beulich wrote:
> > > > > On 26.02.2024 18:38, Oleksii Kurochko wrote:
> > > > > > The header was taken from Linux kernl 6.4.0-rc1.
> > > > > >=20
> > > > > > Addionally, were updated:
> > > > > > * add emulation of {cmp}xchg for 1/2 byte types using 32-
> > > > > > bit
> > > > > > atomic
> > > > > > =C2=A0 access.
> > > > > > * replace tabs with spaces
> > > > > > * replace __* variale with *__
> > > > > > * introduce generic version of xchg_* and cmpxchg_*.
> > > > > >=20
> > > > > > Implementation of 4- and 8-byte cases were left as it is
> > > > > > done
> > > > > > in
> > > > > > Linux kernel as according to the RISC-V spec:
> > > > > > ```
> > > > > > Table A.5 ( only part of the table was copied here )
> > > > > >=20
> > > > > > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVWMO Mappi=
ng
> > > > > > atomic <op> relaxed=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}
> > > > > > atomic <op> acquire=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.aq
> > > > > > atomic <op> release=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.rl
> > > > > > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 amo<op>.{w|d}.aqrl
> > > > > >=20
> > > > > > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVWMO LR/SC=
 Mapping
> > > > > > atomic <op> relaxed=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}; <op>; sc.=
{w|d}; bnez
> > > > > > loop
> > > > > > atomic <op> acquire=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}.aq; <op>; =
sc.{w|d};
> > > > > > bnez
> > > > > > loop
> > > > > > atomic <op> release=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}; <op>; sc.=
{w|d}.aqrl=E2=88=97
> > > > > > ;
> > > > > > bnez
> > > > > > loop OR
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence=
.tso; loop: lr.{w|d}; <op>;
> > > > > > sc.{w|d}=E2=88=97 ;
> > > > > > bnez loop
> > > > > > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 loop: lr.{w|d}.aq; <op>;
> > > > > > sc.{w|d}.aqrl;
> > > > > > bnez
> > > > > > loop
>=20
> Note the load and store forms mentioned here. How would ...
>=20
> > > > > > The Linux mappings for release operations may seem stronger
> > > > > > than
> > > > > > necessary,
> > > > > > but these mappings are needed to cover some cases in which
> > > > > > Linux
> > > > > > requires
> > > > > > stronger orderings than the more intuitive mappings would
> > > > > > provide.
> > > > > > In particular, as of the time this text is being written,
> > > > > > Linux
> > > > > > is
> > > > > > actively
> > > > > > debating whether to require load-load, load-store, and
> > > > > > store-
> > > > > > store
> > > > > > orderings
> > > > > > between accesses in one critical section and accesses in a
> > > > > > subsequent critical
> > > > > > section in the same hart and protected by the same
> > > > > > synchronization
> > > > > > object.
> > > > > > Not all combinations of FENCE RW,W/FENCE R,RW mappings with
> > > > > > aq/rl
> > > > > > mappings
> > > > > > combine to provide such orderings.
> > > > > > There are a few ways around this problem, including:
> > > > > > 1. Always use FENCE RW,W/FENCE R,RW, and never use aq/rl.
> > > > > > This
> > > > > > suffices
> > > > > > =C2=A0=C2=A0 but is undesirable, as it defeats the purpose of t=
he
> > > > > > aq/rl
> > > > > > modifiers.
> > > > > > 2. Always use aq/rl, and never use FENCE RW,W/FENCE R,RW.
> > > > > > This
> > > > > > does
> > > > > > not
> > > > > > =C2=A0=C2=A0 currently work due to the lack of load and store o=
pcodes
> > > > > > with aq
> > > > > > and rl
> > > > > > =C2=A0=C2=A0 modifiers.
> > > > >=20
> > > > > As before I don't understand this point. Can you give an
> > > > > example
> > > > > of
> > > > > what
> > > > > sort of opcode / instruction is missing?
> > > > If I understand the spec correctly then l{b|h|w|d} and
> > > > s{b|h|w|d}
> > > > instructions don't have aq or rl annotation.
> > >=20
> > > How would load insns other that LR and store insns other than SC
> > > come
> > > into play here?
> >=20
> > This part of the spec. is not only about LR and SC which cover
> > Load-
> > Exclusive and Store-Exclusive cases, but also about non-Exclusive
> > cases
> > for each l{b|h|w|d} and s{b|h|w|d} are used.
>=20
> ... the spec (obviously covering other forms, too) be relevant when
> reasoning whether just suffixes or actual barrier insns need using?
Based on 3 rules which are in the commit message and in the spec.,
there is no difference between what option should be used ( at least, I
wasn't able to find an explanation in that paragraph ), but based on
the tables provided in the same paragraph ( and partially in the commit
message ) if an instruction has .aq or .rl annotation it should be
used.

And speaking about xchg and cmpxcgh case and their implementations, all
instructions have .ar/.rl suffixes, so we'd rather prefer suffixes
instead of barriers.=20

Does it make sense?

~ Oleksii

