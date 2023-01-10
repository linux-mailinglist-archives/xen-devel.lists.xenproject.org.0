Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E09663ADB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:22:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474407.735567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9tS-0001Li-AU; Tue, 10 Jan 2023 08:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474407.735567; Tue, 10 Jan 2023 08:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pF9tS-0001JS-7k; Tue, 10 Jan 2023 08:22:02 +0000
Received: by outflank-mailman (input) for mailman id 474407;
 Tue, 10 Jan 2023 08:22:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ek+I=5H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pF9tR-0001JM-5b
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:22:01 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id daac699d-90bf-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 09:22:00 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id v30so16348322edb.9
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jan 2023 00:22:00 -0800 (PST)
Received: from 2a02.2378.1014.d6d9.ip.kyivstar.net
 ([2a02:2378:1014:d6d9:98bb:6889:a785:5d8c])
 by smtp.gmail.com with ESMTPSA id
 en6-20020a056402528600b00499b3d09bd2sm2474641edb.91.2023.01.10.00.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 00:21:59 -0800 (PST)
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
X-Inumbo-ID: daac699d-90bf-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AprDi40x/B80KDuPx8u+X/GyU8Jo6blaRoC7zSOcKw4=;
        b=h5YpWVidwuM0qgPb2qCMupmtLX9SXIs+I2Nf9bvovkS390D6Y3AIQrUWJwonaxQC65
         FOA26Ujm1yE91LWK+m6aU1cNLmm0gvags3JuDk1CTUkOs2heBbFNYpOFqhz3W92FBmPX
         2MHz23+OUQ7rDgDRzw5a6MestAjubiEdatGdgXqNiqvrq1CldkJr8DV9LhjJ2ShIJRGk
         eFgWHtZ5n9OLWbuVlk+0GF+CK7yGhgJ4wDV27M7Ii96PbJWV06J/8nbw4nJU804Ns6OP
         /QBoOu8yNRyEBYsfRoFKzrSPNwLnFhp5J28U0MNg+NXygR1TIK3ULkITzsODQEK0k4Wk
         Kz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AprDi40x/B80KDuPx8u+X/GyU8Jo6blaRoC7zSOcKw4=;
        b=s/i7a5vxAF4QqdH2g9HK4UkqZplVWaQnQmMg2dcolGUbWqhH2LJmEWRUJ70zPrfnJd
         DyeSifx/zGoLp0XEe0wZPaQTi/nNt3054a3EkjroUq35rtJoAxOI3sTNQ/RKzZr5yrf3
         tv828j4jDPatfO12hiShGHPbG7r/5/t6WRKyRBeFc5BlIpJoLEWuMqpRRCqKb5aE+MI+
         9KpElr1IKk/W5Ftz9h3yirbpBgq8C2DlKOeZyo/jh0uU/PVzfSsZYbfYF2JVaKFPd2fg
         bfCnoPw8QPNSptDQ63kY94ZUy1rykIRxq7U3uk8c0228RFmhobEZddViUMOtDIKqTr6q
         5k4Q==
X-Gm-Message-State: AFqh2kpmgl1Om7xTEDCT4ScGkYrMvFQsP9MyfcsaXHv5R3euO3aSx6dh
	ug1Zn0Fb+o9uiWZ45yYgpuw=
X-Google-Smtp-Source: AMrXdXstGyqSI4HjuPwNOAdTiabyj0wqZZms2KkgU/NzSPCAxyYERHCUnD7LRVoAo0o49mb5WUtpWw==
X-Received: by 2002:aa7:db8d:0:b0:45c:835c:3679 with SMTP id u13-20020aa7db8d000000b0045c835c3679mr58769549edt.2.1673338919802;
        Tue, 10 Jan 2023 00:21:59 -0800 (PST)
Message-ID: <eb2c4ad53e596e633f1d59de05db9fa9630f28ac.camel@gmail.com>
Subject: Re: [PATCH v2 4/8] xen/riscv: introduce sbi call to putchar to
 console
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>
Date: Tue, 10 Jan 2023 10:21:57 +0200
In-Reply-To: <7990322c-639b-38d4-ff6c-221988532c33@xen.org>
References: <cover.1673278109.git.oleksii.kurochko@gmail.com>
	 <9b85a963db538e4735a9f99fc9090ad79508cb2c.1673278109.git.oleksii.kurochko@gmail.com>
	 <7990322c-639b-38d4-ff6c-221988532c33@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

Hi,

On Mon, 2023-01-09 at 16:03 +0000, Julien Grall wrote:
> Hi,
>=20
> On 09/01/2023 15:46, Oleksii Kurochko wrote:
> > The patch introduce sbi_putchar() SBI call which is necessary
> > to implement initial early_printk
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V2:
> > =C2=A0=C2=A0=C2=A0=C2=A0 - add an explanatory comment about sbi_console=
_putchar()
> > function.
> > =C2=A0=C2=A0=C2=A0=C2=A0 - order the files alphabetically in Makefile
> > ---
> > =C2=A0 xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 xen/arch/riscv/include/asm/sbi.h | 34 ++++++++++++++++++++++++
> > =C2=A0 xen/arch/riscv/sbi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 44
> > ++++++++++++++++++++++++++++++++
> > =C2=A0 3 files changed, 79 insertions(+)
> > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/sbi.h
> > =C2=A0 create mode 100644 xen/arch/riscv/sbi.c
> >=20
> > diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> > index 5a67a3f493..fd916e1004 100644
> > --- a/xen/arch/riscv/Makefile
> > +++ b/xen/arch/riscv/Makefile
> > @@ -1,4 +1,5 @@
> > =C2=A0 obj-$(CONFIG_RISCV_64) +=3D riscv64/
> > +obj-y +=3D sbi.o
> > =C2=A0 obj-y +=3D setup.o
> > =C2=A0=20
> > =C2=A0 $(TARGET): $(TARGET)-syms
> > diff --git a/xen/arch/riscv/include/asm/sbi.h
> > b/xen/arch/riscv/include/asm/sbi.h
> > new file mode 100644
> > index 0000000000..34b53f8eaf
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/sbi.h
> > @@ -0,0 +1,34 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-or-later) */
> > +/*
> > + * Copyright (c) 2021 Vates SAS.
> > + *
> > + * Taken from xvisor, modified by Bobby Eshleman
> > (bobby.eshleman@gmail.com).
> Hmmm... I missed this one in v1. Is this mostly code from Bobby? If
> so,=20
> please update the commit message accordingly.
>=20
> FAOD, this comment applies for any future code you take from anyone.
> I=20
> will try to remember to mention it but please take pro-active action
> to=20
> check/mention where the code is coming from.
>=20
Sure, I will try to be more attentive next time.

Probably it is out of scope a little bit but could you please share
with me a link or clarify in which cases I have to add Copytrigt(c) or
should I add a new comment with "Modfied by Oleksii ... ", or it is not
necessary at all? Maybe have I to put some other information related to
copyrigts?

Thanks in advance.

> Cheers,
>=20
~Oleksii

