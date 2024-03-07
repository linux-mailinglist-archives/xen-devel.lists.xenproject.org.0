Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CB0874CD7
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 12:02:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689763.1075030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBVH-0005Ly-EY; Thu, 07 Mar 2024 11:01:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689763.1075030; Thu, 07 Mar 2024 11:01:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riBVH-0005Jx-BT; Thu, 07 Mar 2024 11:01:35 +0000
Received: by outflank-mailman (input) for mailman id 689763;
 Thu, 07 Mar 2024 11:01:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aqh0=KN=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1riBVG-0005Jr-8r
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 11:01:34 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0def3188-dc72-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 12:01:31 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-513173e8191so917773e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 03:01:31 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 q7-20020ac246e7000000b005131d018bb1sm3005813lfo.94.2024.03.07.03.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Mar 2024 03:01:30 -0800 (PST)
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
X-Inumbo-ID: 0def3188-dc72-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709809291; x=1710414091; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9qexdayklPi60il4bLQIUY4ne8AaWgndZYd8dPz8eAo=;
        b=fYtVW4AKC6pjNGCJyOAW1Z6C28daX5DKQeN2vsrUsingeXVKyfFAPTmze9yvNc1Xzp
         wnJTB7jgrs/3/kPHRZV30/neVDmJSf4/jXV2iJIX2fZLHzYW5uqyscYYDuUSk7S5EgT5
         a5YAWlu/Wrh6cZ86w/JUAepHORjGtcSKOPNo8LlGcu7yhcJyheIpTZk3mdcOnrNTGqOG
         MUxchpJ8CP0irYgsSGZOaXD8ClRrAoc9cO5A8sp1RNHki9JNFf1JMhDj248JRbwSWc8A
         /MvdacsGG+NCAXI/zsF/lZ6p4/8oeJ2c1oHUW/ECr1LAcFkM1wQdjWcfhlQEzaAsxHGE
         HM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709809291; x=1710414091;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qexdayklPi60il4bLQIUY4ne8AaWgndZYd8dPz8eAo=;
        b=Aamhr46JGUd77dQnPPFiaSklK3F1mgkoceGTWEBpmC4xPhnD2JhTwOW/7pU21OfFQr
         JRROIYYkmXnjKzN4jBFqeyA9QIQr2G/JMwjbCQj0q5oVJBuY4Gyj21mj8vJBYQEFSLzN
         c2/boEFNuAkWgQxHTw+eEPgdmPgFJoMLqFY0HPJnroXbxCQFCDHSOSojdo17OhEQxF1m
         BqI3WHIte5kMxgLdNN7ySGQMuT9mbZZCe+vpBQZTNpfIMQQixXovxt+AUtBfVBc8cp3W
         4xJ1Z6oOlB2EErzjFEk+swXNzO+3lgwqguCJS2nPmdOwn/tQ7iKqlG6EGU103jYs20pR
         75yw==
X-Forwarded-Encrypted: i=1; AJvYcCWaZDVZqeU6g2dBOzmaxQXbACL1nn6cattqN8LvjgBYSaSYbcO12UdBeShwNKJ3OmTFiCoR2PGBihwi/E/VuSjX79wAkd1E3UTtavcvN5Y=
X-Gm-Message-State: AOJu0YwPrgod5YaNJqdPvJ/ZlaSoFqkyyPIzjWEEktN4OC7eAQunJ0dC
	sM4B5GPhCwGdN8TmDugjLZewaNlQz0LfzXNWjJ9gi/XcQpkifnY3
X-Google-Smtp-Source: AGHT+IECBO1ilNKUUgC/aHEZgOxLDkp6mssV7hLhZ2FUq00Hsr8/OwyfBrVTjFlcTGHN++7sB/maZg==
X-Received: by 2002:ac2:491e:0:b0:513:1ff9:2bb4 with SMTP id n30-20020ac2491e000000b005131ff92bb4mr1085070lfi.30.1709809290478;
        Thu, 07 Mar 2024 03:01:30 -0800 (PST)
Message-ID: <af6e59c7abd930bb356ba399fa890a7a541c2aae.camel@gmail.com>
Subject: Re: [PATCH v5 11/23] xen/riscv: introduce cmpxchg.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Thu, 07 Mar 2024 12:01:29 +0100
In-Reply-To: <dd45b338-7b43-442d-85cd-307b3d228d87@suse.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
	 <ce7604de39b3480553eeaeafc11138494016983f.1708962629.git.oleksii.kurochko@gmail.com>
	 <23ff1c20-91f3-4c60-9562-7f1cd57c1043@suse.com>
	 <f6e16589bfbcd94d6f62c34f080cbcd3406eca6f.camel@gmail.com>
	 <dd45b338-7b43-442d-85cd-307b3d228d87@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2024-03-07 at 11:46 +0100, Jan Beulich wrote:
> On 07.03.2024 11:35, Oleksii wrote:
> > On Wed, 2024-03-06 at 15:56 +0100, Jan Beulich wrote:
> > > On 26.02.2024 18:38, Oleksii Kurochko wrote:
> > > > The header was taken from Linux kernl 6.4.0-rc1.
> > > >=20
> > > > Addionally, were updated:
> > > > * add emulation of {cmp}xchg for 1/2 byte types using 32-bit
> > > > atomic
> > > > =C2=A0 access.
> > > > * replace tabs with spaces
> > > > * replace __* variale with *__
> > > > * introduce generic version of xchg_* and cmpxchg_*.
> > > >=20
> > > > Implementation of 4- and 8-byte cases were left as it is done
> > > > in
> > > > Linux kernel as according to the RISC-V spec:
> > > > ```
> > > > Table A.5 ( only part of the table was copied here )
> > > >=20
> > > > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVWMO Mapping
> > > > atomic <op> relaxed=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}
> > > > atomic <op> acquire=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.aq
> > > > atomic <op> release=C2=A0=C2=A0=C2=A0 amo<op>.{w|d}.rl
> > > > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 amo<op>.{w|d}.aqrl
> > > >=20
> > > > Linux Construct=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RVWMO LR/SC Map=
ping
> > > > atomic <op> relaxed=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}; <op>; sc.{w|d=
}; bnez
> > > > loop
> > > > atomic <op> acquire=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}.aq; <op>; sc.{=
w|d}; bnez
> > > > loop
> > > > atomic <op> release=C2=A0=C2=A0=C2=A0 loop: lr.{w|d}; <op>; sc.{w|d=
}.aqrl=E2=88=97 ;
> > > > bnez
> > > > loop OR
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence.ts=
o; loop: lr.{w|d}; <op>;
> > > > sc.{w|d}=E2=88=97 ;
> > > > bnez loop
> > > > atomic <op>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl;
> > > > bnez
> > > > loop
> > > >=20
> > > > The Linux mappings for release operations may seem stronger
> > > > than
> > > > necessary,
> > > > but these mappings are needed to cover some cases in which
> > > > Linux
> > > > requires
> > > > stronger orderings than the more intuitive mappings would
> > > > provide.
> > > > In particular, as of the time this text is being written, Linux
> > > > is
> > > > actively
> > > > debating whether to require load-load, load-store, and store-
> > > > store
> > > > orderings
> > > > between accesses in one critical section and accesses in a
> > > > subsequent critical
> > > > section in the same hart and protected by the same
> > > > synchronization
> > > > object.
> > > > Not all combinations of FENCE RW,W/FENCE R,RW mappings with
> > > > aq/rl
> > > > mappings
> > > > combine to provide such orderings.
> > > > There are a few ways around this problem, including:
> > > > 1. Always use FENCE RW,W/FENCE R,RW, and never use aq/rl. This
> > > > suffices
> > > > =C2=A0=C2=A0 but is undesirable, as it defeats the purpose of the a=
q/rl
> > > > modifiers.
> > > > 2. Always use aq/rl, and never use FENCE RW,W/FENCE R,RW. This
> > > > does
> > > > not
> > > > =C2=A0=C2=A0 currently work due to the lack of load and store opcod=
es
> > > > with aq
> > > > and rl
> > > > =C2=A0=C2=A0 modifiers.
> > >=20
> > > As before I don't understand this point. Can you give an example
> > > of
> > > what
> > > sort of opcode / instruction is missing?
> > If I understand the spec correctly then l{b|h|w|d} and s{b|h|w|d}
> > instructions don't have aq or rl annotation.
>=20
> How would load insns other that LR and store insns other than SC come
> into play here?

This part of the spec. is not only about LR and SC which cover Load-
Exclusive and Store-Exclusive cases, but also about non-Exclusive cases
for each l{b|h|w|d} and s{b|h|w|d} are used.

~ Oleksii


