Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21F677D85
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 15:04:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482886.748657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxQb-0001z8-Ez; Mon, 23 Jan 2023 14:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482886.748657; Mon, 23 Jan 2023 14:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJxQb-0001wf-9l; Mon, 23 Jan 2023 14:04:05 +0000
Received: by outflank-mailman (input) for mailman id 482886;
 Mon, 23 Jan 2023 14:04:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rv8W=5U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pJxQZ-0001wU-Lz
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 14:04:03 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca4ceee5-9b26-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 15:04:02 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id n7so10914778wrx.5
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 06:04:02 -0800 (PST)
Received: from [192.168.100.7] (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr.
 [90.112.199.53]) by smtp.gmail.com with ESMTPSA id
 w8-20020adf8bc8000000b002bdc39849d1sm30752416wra.44.2023.01.23.06.04.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 06:04:01 -0800 (PST)
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
X-Inumbo-ID: ca4ceee5-9b26-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v1qJTOnEO3dERuMHOqUksY6UoYGbFJ+ZFqrnd6rK+JA=;
        b=HzrPK2sWXu5/jsyJeeCv4NvqD0Ca+60BamYW9ZmIGL9JjhwSGPU3zX6PwDlajeSyVz
         dqCKB+sbVq4jw7Qjb+S30x+AffJFJjd7A2rgoFjVk4khWYG4VYQXbsuOwHTyRnwdFXQ8
         +bd0yVGAy3LWqolUzqOwoMdptBySSz3EW9iObHiBLjUkPg0t63DDmVO3ECj/g8vlmoGs
         QkfaPBaCjdi+5/G9VIBIqlqWZLnWIi2s8ujxjr2mqs/mLEIM9FM3z38ubjWI/LQQs0U3
         NEprNEYTospKvJ5EWKjRovDK/W0Ppa/0z5CdIaQQKJOaFJ+rF+z0kCzvaiF+ClB5ZgvK
         m2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1qJTOnEO3dERuMHOqUksY6UoYGbFJ+ZFqrnd6rK+JA=;
        b=mCCdYddy8N59Q6gDFAozrY8O8wKiz4+m4PWKGeiTtuwbChiwaqbGK/+2dA+22Ke+cx
         wn6djqn49Ot8EiLud2VHWUiy0Z48w6847N1OOwwGJNeCOSvduXCEvYsJZODUgnTEbXwa
         G8DTJEIeHCBB2kPF7tC2/zGRPhDW9oJtRIZkmK8EqkqeXI3ug8FxbVfj0DnLeJjHsQtP
         wD3SX5LcqwjWPLTpL5Xkn1r9KLbhwuO/IDMnp2uDga6WiV819B7scY030/DOemsCS8CX
         fhQ2QPzm2gW59hs1LqeeMjQ77oHl1ITwxAlF4KfqLIqG8ywy0sr7noxlq5FfWIFicc/v
         ZrVg==
X-Gm-Message-State: AFqh2kr2UGh8ivFYEvo6wa25yVInshvAzvWiuQc72mQLnUyO43ShUrSn
	Pu/4ZCYrtOsflrX5/22QWak=
X-Google-Smtp-Source: AMrXdXskm652+NX+ELqnZ6TSEMjaMTVhVtVKIxSGUXxfW2/21xaIXQiOXsElX8Qw1AZmR+DA++bpcQ==
X-Received: by 2002:a5d:5150:0:b0:242:3353:26ed with SMTP id u16-20020a5d5150000000b00242335326edmr21663152wrt.62.1674482641488;
        Mon, 23 Jan 2023 06:04:01 -0800 (PST)
Message-ID: <941146ccaf2d4b38ffd05d4d6163fadf46ebb829.camel@gmail.com>
Subject: Re: [PATCH v1 03/14] xen/riscv: add <asm/riscv_encoding.h header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Mon, 23 Jan 2023 16:04:00 +0200
In-Reply-To: <469c9ef3-767a-358c-5e70-a1e0d9b1a4ca@suse.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
	 <fe153cbeffd4ba4e158271ccd2449628f4973481.1674226563.git.oleksii.kurochko@gmail.com>
	 <469c9ef3-767a-358c-5e70-a1e0d9b1a4ca@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Mon, 2023-01-23 at 14:52 +0100, Jan Beulich wrote:
> On 20.01.2023 15:59, Oleksii Kurochko wrote:
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> I was about to commit this, but ...
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/riscv_encoding.h
> > @@ -0,0 +1,945 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> > +/*
> > + * Copyright (c) 2019 Western Digital Corporation or its
> > affiliates.
> > + *
> > + * Authors:
> > + *=C2=A0=C2=A0 Anup Patel <anup.patel@wdc.com>
>=20
> ... this raises a patch authorship question: Are you missing her/his
> S-o-b: and/or From:?=20
>=20
It is not clear who should be in S-o-b and/or From. So let me explain
situation:

Anup Patel <anup.patel@wdc.com> is a person who introduced
riscv_encoding.h in OpenSBI.

A person who introduced the header to Xen isn't clear as I see 3 people
who did it:
- Bobby Eshleman <bobbyeshleman@gmail.com>
- Alistair Francis <alistair.francis@wdc.com>
- One more person whoose last name, unfortunately, I can't find
And in all cases I saw that an author is different.

> > + * The source has been largely adapted from OpenSBI:
> > + * include/sbi/riscv_encodnig.h
>=20
> Nit: Typo.
>=20
> > + *=20
>=20
> Nit: trailing blank.
>=20
> There also look to be hard tabs in the file. This is fine if the file
> is being imported (almost) verbatim from elsewhere, but then the
> origin
> wants stating in an Origin: tag (see docs/process/sending-
> patches.pandoc).
>=20
> > [...]
> > +#define IMM_I(insn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0((s32)=
(insn) >> 20)
> > +#define IMM_S(insn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(((s32=
)(insn) >> 25 << 5) |
> > \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 (s32)(((insn) >> 7) &
> > 0x1f))
>=20
> Please can you avoid introducing new instances of s<N> or u<N>? See
> ./CODING_STYLE.
>=20
Thanks. I will update the header.
> Jan


