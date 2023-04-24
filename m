Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC906ECF82
	for <lists+xen-devel@lfdr.de>; Mon, 24 Apr 2023 15:47:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525382.816538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwWt-0000Ui-Go; Mon, 24 Apr 2023 13:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525382.816538; Mon, 24 Apr 2023 13:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pqwWt-0000SG-Dz; Mon, 24 Apr 2023 13:46:55 +0000
Received: by outflank-mailman (input) for mailman id 525382;
 Mon, 24 Apr 2023 13:46:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wIvg=AP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pqwWr-0000SA-O1
 for xen-devel@lists.xenproject.org; Mon, 24 Apr 2023 13:46:53 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 776a1393-e2a6-11ed-8611-37d641c3527e;
 Mon, 24 Apr 2023 15:46:51 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4efd6e26585so2621371e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Apr 2023 06:46:51 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a2e8857000000b002a8c271de33sm1706787ljj.67.2023.04.24.06.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 06:46:50 -0700 (PDT)
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
X-Inumbo-ID: 776a1393-e2a6-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682344011; x=1684936011;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zw7JhD9MrUztxBz+XFIdPN/kxbYQ7BPTvgxVKGXcAJ8=;
        b=lEiCljbged+uwXIqHPV17OjBo9dyXTs4Gb+xP15degp19QXVbyfpl91TOBgONRr4KW
         ddqy0AmzuKeKOwVQwbVUUFGWpfMRIwH2eLQgT3bLTLczV3qKHXYxez4dYibil4QhDmWq
         bAkiRB36Pf8N3F3CgVA8XjQaN98GFGfKnuhJOAN0/GmNmrRu6WYLHqV8JORNUJneh9n+
         D4KM0JF+3b7AmH8eajYH5BJK4V/5mswJekzqepihT4hTayws/eYFYnkc8+243uM5X66M
         lnsggXnRdbfk3zOU/FjLIS+KpdNsrgK+h6R4BqTALybKgdsOtYqPK/IwJMKbu1Oy6MaP
         +l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682344011; x=1684936011;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zw7JhD9MrUztxBz+XFIdPN/kxbYQ7BPTvgxVKGXcAJ8=;
        b=JQjPNrZ8I52Lm4gGt2Z+wdEBSB84pxq6Ot59+V193OCQkiYDXycmPAKzrGPsGwrK+d
         +N2HHf7vxCGBANxLuHBzCfqYXwpmwvmjmuEAMw3FsrcoHk69g5zaARkpcxv79A0fVR7B
         9qJrKW60lacuT5UC3E5xVqKeyrmHsT/6Gde/xF9ilER48J7qscHZ63Jsjxa44RmQHniH
         mopWh7L32AOoL4pOGqCajdECB/88gjLbu0Y9n6/F+GbqYJPrNaYbazeVOIf504hc7CG5
         94HMgYNdqgZnt1wUxdiph9sHl1KmcbcAZCFltD1d+EFjJdInxrEAkh+SUlUQD8Ssnbf7
         8aQg==
X-Gm-Message-State: AAQBX9eO2iCa+5PIRigPk/CN5Q9g4k+0rtAG+dYSUG4EuGnezo0Q3fL/
	KxptQtu1qZTJ/HtewKnI5+w=
X-Google-Smtp-Source: AKy350bh1Meaiw/7GNfJRix28petkvsUKzTQhNZ01rO/4UwGBJZL5kM25zeYsgVqZr7nyfhVdGASEQ==
X-Received: by 2002:ac2:42c4:0:b0:4ec:a0e8:9efc with SMTP id n4-20020ac242c4000000b004eca0e89efcmr3304684lfl.29.1682344010593;
        Mon, 24 Apr 2023 06:46:50 -0700 (PDT)
Message-ID: <00b9ff7d3108c446b5e3bf81348bf4deaa010c1b.camel@gmail.com>
Subject: Re: [PATCH v5 1/4] xen/riscv: add VM space layout
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Mon, 24 Apr 2023 16:46:49 +0300
In-Reply-To: <9a897eb7-f6c7-9e28-4f6b-4c4c43f7a4f1@suse.com>
References: <cover.1681918194.git.oleksii.kurochko@gmail.com>
	 <f1b5ee8652a20b2043965a4de5c2c64f662724bb.1681918194.git.oleksii.kurochko@gmail.com>
	 <34f032df-cbfc-7a97-9a1f-2fa1ce574281@suse.com>
	 <f2978c2ddc1872025f4d939187775c21fd90f074.camel@gmail.com>
	 <9a897eb7-f6c7-9e28-4f6b-4c4c43f7a4f1@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0 (3.48.0-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-04-24 at 11:25 +0200, Jan Beulich wrote:
> On 21.04.2023 16:41, Oleksii wrote:
> > On Thu, 2023-04-20 at 14:58 +0200, Jan Beulich wrote:
> > > On 19.04.2023 17:42, Oleksii Kurochko wrote:
> > > > + *
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > =3D=3D=3D=3D
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > + *=C2=A0=C2=A0=C2=A0 Start addr=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 En=
d addr=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 Size=C2=A0 | VM ar=
ea
> > > > description
> > > > + *
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > =3D=3D=3D=3D
> > > > =3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > + * FFFFFFFFC0000000 |=C2=A0 FFFFFFFFC0200000 |=C2=A0 2 MB=C2=A0 | =
Xen
> > > > + * FFFFFFFFC0200000 |=C2=A0 FFFFFFFFC0600000 |=C2=A0 4 MB=C2=A0 | =
FDT
> > > > + * FFFFFFFFC0600000 |=C2=A0 FFFFFFFFC0800000 |=C2=A0 2 MB=C2=A0 | =
Fixmap
> > >=20
> > > These are all L2 slot 511 aiui, which may be worth mentioning
> > > especially since
> > > the top bits don't match the top bits further down in the table
> > > (because of the
> > > aliasing).
> >=20
> > Than I'll add one more column where I'll put slot number
> >=20
> > >=20
> > > > + *=C2=A0=C2=A0=C2=A0=C2=A0 .................. unused .............=
.....
> > >=20
> > > This is covering slot 510, which again may be worth mentioning.
> > >=20
> > > > + * 0000003200000000 |=C2=A0 0000007f40000000 | 331 GB | Direct
> > > > map(L2
> > > > slot: 200-509)
> > > > + * 0000003100000000 |=C2=A0 0000003140000000 |=C2=A0 1 GB=C2=A0 |
> > > > Frametable(L2
> > > > slot: 196-197)
> > >=20
> > > 1Gb is, if I'm not mistaken, a single L2 slot.
> > Yeah, it can be misunderstood. I meant [196, 197), so 197 isn't
> > included. I'll update the table.
> >=20
> > >=20
> > > Also assuming a 32-byte struct page_info (I don't think you'll
> > > get
> > > away with
> > > less than that, when even Arm32 requires this much), there's a
> > > mismatch
> > > between direct map and frame table size: With 4k pages, the
> > > scaling
> > > factor
> > > would be 128 if I'm not mistaken. So perhaps you really mean 3Gb
> > > here
> > > to
> > > cover for (slightly more than) the 331Gb of memory you mean to be
> > > able to
> > > map?
> > For RV64 page_info size will be 56-byte and 32-byte for RV32 but
> > you
> > are right it should 3 Gb in that case what will be enough ( taking
> > into
> > account both available sizes of page_info structure ).
>=20
> Since you say "both": I don't expect you will want to use 3Gb for
> RV32
> there? The table is, at least for now, for RV64 / Sv39 only anyway.
>=20
You are right. There is no any sense to use 3gb for RV32.

~ Oleksii

