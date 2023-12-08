Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E2D809FED
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 10:51:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650509.1016115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXVf-0007VS-7o; Fri, 08 Dec 2023 09:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650509.1016115; Fri, 08 Dec 2023 09:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBXVf-0007T8-2s; Fri, 08 Dec 2023 09:51:03 +0000
Received: by outflank-mailman (input) for mailman id 650509;
 Fri, 08 Dec 2023 09:51:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=atw2=HT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rBXVd-00079x-UT
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 09:51:01 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ac60b7f-95af-11ee-9b0f-b553b5be7939;
 Fri, 08 Dec 2023 10:51:00 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-54ba86ae133so1732913a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 01:51:00 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 u30-20020a50951e000000b0054ca7afdf35sm668721eda.86.2023.12.08.01.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 01:50:59 -0800 (PST)
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
X-Inumbo-ID: 4ac60b7f-95af-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702029060; x=1702633860; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qPkA9yP+EAExI7xc/q1nkjx9/raQgeMN8wrqj5tYVU0=;
        b=eVKe3XAWIctbq2sha77htYvWOgKrmdSYoF9hXTDuWxpR85E50X5VUH1KOJUdQEgbZJ
         NDPuOarC53Yp7YHhgvVPQoTwZn0z9gaTjnqMudzBM9syEqo30UTkhgbKt2+W5QtBFnQM
         PCGo8XT8WKPdkbJi0ZyH+nslBELmI1dJcJIPhFSMUmdrNqrpq4e/kPEHYPwVaSbk6ZUZ
         3W/aYsPxh94u1ieaf1/oi6N3Zgc/sE33IDXEhVIY5wYx6e4zWzY5EiCgY0oKE2J4Qm+X
         SCCG1G5QR15ayYywId+Iri0Enx4UZz1+GbW2D3doiCPgj51BHYUoVbXnc9qp7CPDoklc
         Oo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702029060; x=1702633860;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qPkA9yP+EAExI7xc/q1nkjx9/raQgeMN8wrqj5tYVU0=;
        b=Waa0lsFVgN8TSuJ2Tn0eaavUqqcyPzobMpGIrKVmFddFq5CRg3OB97VqZJeu2AANyg
         jy7WcqcmTlMMQHtyC7GbONVOWv+NnwnGfTVist7AbFuQPBea6ezML5UkpB7NrLpFALtf
         hyXKDDW5fhXqYYzszOiX+lbiPHeKrYhdWtE6Arwps606/sFl0JyeGK0vUpAS2Lk6ZB6O
         xnSfxsDq596k1e9hFllnvgb7oFAOSp8QcPZ0k5s23yxH4q0HKWYXOawtAsnM2suNGzo8
         E2JUHAfM34Q2oopCSdf/p9p45fsb4dNaE5mWy/ItVYndEyStmiaKq1+PeAPPVe5o1Ykf
         M7kA==
X-Gm-Message-State: AOJu0YzYkmZa+gSl/QUw/W8Ddghypz8eXx8Soiqpnp1FNE7DDNda1f/a
	Gh6LO4zOjyg7Up/djv7umbc=
X-Google-Smtp-Source: AGHT+IGXmZ8WMx1Hza5cJ+8eKgHaXAVk3SIcUEvVbF9f3T9kJTo4G5ELAVimQv18ipR0lEq/yiw1TA==
X-Received: by 2002:a05:6402:8cc:b0:54b:922:1f4f with SMTP id d12-20020a05640208cc00b0054b09221f4fmr2439777edz.28.1702029059505;
        Fri, 08 Dec 2023 01:50:59 -0800 (PST)
Message-ID: <6708ee9eaa8a818001942ea16a38e06338cf9720.camel@gmail.com>
Subject: Re: [PATCH v2 14/39] xen/riscv: introduce bitops.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Fri, 08 Dec 2023 11:50:58 +0200
In-Reply-To: <fff80a7f-75f7-4e91-be1a-bc7fd683b94d@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <a9c69e17fe073551e7007242d00b74b6333ce98d.1700761381.git.oleksii.kurochko@gmail.com>
	 <fff80a7f-75f7-4e91-be1a-bc7fd683b94d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-07 at 16:37 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> So this looks to have been taken from Linux, which could do with
> saying
> (including which version or most recent commit). It may e.g. justify
> you
> using tab indentation here, albeit ...
Thanks. I'll update the commit message.

>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/bitops.h
> > @@ -0,0 +1,288 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/* Copyright (C) 2012 Regents of the University of California */
> > +
> > +#ifndef _ASM_RISCV_BITOPS_H
> > +#define _ASM_RISCV_BITOPS_H
> > +
> > +#include <asm/system.h>
> > +
> > +#define BITOP_BITS_PER_WORD=C2=A0=C2=A0=C2=A0=C2=A0 32
> > +#define BITOP_MASK(nr)	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (1UL=
 << ((nr) %
> > BITOP_BITS_PER_WORD))
> > +#define BITOP_WORD(nr)	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((nr=
) / BITOP_BITS_PER_WORD)
> > +#define BITS_PER_BYTE	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8
> > +
> > +#define __set_bit(n,p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 set_bit(n,p)
> > +#define __clear_bit(n,p)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cle=
ar_bit(n,p)
>=20
> ... then please consistently. Other style related remarks made on the
> system.h patch apply here as well (unless again there's a goal of
> keeping the diff to the Linux original small; yet then I guess the
> delta to the Linux file is already pretty large).
>=20
> > +/* Based on linux/include/asm-generic/bitops/find.h */
> > +
> > +#ifndef find_next_bit
> > +/**
> > + * find_next_bit - find the next set bit in a memory region
> > + * @addr: The address to base the search on
> > + * @offset: The bitnumber to start searching at
> > + * @size: The bitmap size in bits
> > + */
> > +extern unsigned long find_next_bit(const unsigned long *addr,
> > unsigned long
> > +		size, unsigned long offset);
> > +#endif
> > +
> > +#ifndef find_next_zero_bit
> > +/**
> > + * find_next_zero_bit - find the next cleared bit in a memory
> > region
> > + * @addr: The address to base the search on
> > + * @offset: The bitnumber to start searching at
> > + * @size: The bitmap size in bits
> > + */
> > +extern unsigned long find_next_zero_bit(const unsigned long *addr,
> > unsigned
> > +		long size, unsigned long offset);
> > +#endif
> > +
> > +/**
> > + * find_first_bit - find the first set bit in a memory region
> > + * @addr: The address to start the search at
> > + * @size: The maximum size to search
> > + *
> > + * Returns the bit number of the first set bit.
> > + */
> > +extern unsigned long find_first_bit(const unsigned long *addr,
> > +				=C2=A0=C2=A0=C2=A0 unsigned long size);
> > +
> > +/**
> > + * find_first_zero_bit - find the first cleared bit in a memory
> > region
> > + * @addr: The address to start the search at
> > + * @size: The maximum size to search
> > + *
> > + * Returns the bit number of the first cleared bit.
> > + */
> > +extern unsigned long find_first_zero_bit(const unsigned long
> > *addr,
> > +					 unsigned long size);
>=20
> Looking over the titles of the rest of the series, I can't spot where
> these are going to be implemented. The again maybe you indeed can get
> away without those, at least initially.
It's introduced in:
	[PATCH v2 21/39] xen/riscv: introduce bit operations
I think we have to merge this patch with patch 21.
>=20
> > +#define ffs(x) ({ unsigned int __t =3D (x); fls(__t & -__t); })
>=20
> This wants to use ISOLATE_LSB() now.
>=20
~ Oleksii


