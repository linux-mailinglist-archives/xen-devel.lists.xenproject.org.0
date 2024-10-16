Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17F79A0314
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2024 09:51:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.819586.1232972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0yoA-00029b-K4; Wed, 16 Oct 2024 07:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 819586.1232972; Wed, 16 Oct 2024 07:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0yoA-00027S-HK; Wed, 16 Oct 2024 07:51:02 +0000
Received: by outflank-mailman (input) for mailman id 819586;
 Wed, 16 Oct 2024 07:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8GJ6=RM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t0yo9-00027M-8O
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2024 07:51:01 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 625dd384-8b93-11ef-a0be-8be0dac302b0;
 Wed, 16 Oct 2024 09:50:59 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2fb5638dd57so26502911fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Oct 2024 00:50:59 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb5d13590csm3387601fa.61.2024.10.16.00.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 00:50:58 -0700 (PDT)
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
X-Inumbo-ID: 625dd384-8b93-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729065059; x=1729669859; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZdCwZ/3jnCT4ThJpxk+8AY1ZT0xqsI3RnPbCPcCaE6c=;
        b=k05P+7LJP3+8pXyBVddAqHfqHA9Sgn7wC6pgtgUL3Vj3lFf/4qlZg9QJ5rCQOmROKi
         pVkWRbz3hz55caSUSBeAMuNNqxMbggfDGN14Mly8bir1pR3tI6VX1oDO6X2tURs6cmWl
         /+JAHuAlVToAWVdoABX/TeDbJ+S854+zANz7voxjwv4Hc8KLu3aPFvjli2rlo1IlDodv
         2peSZRnp+iHkMii0QXTkmkAYgLAdFqKqd+pzCdhVdiOJfvN/LprLmZR59COQtwAhOLsP
         4dJFGW1++nKDqw7bkDaGJpTP2rSgXUDUCHHdZonyQHqyyi4pDCc52Dj7haAgqNcQbOxN
         X4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729065059; x=1729669859;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZdCwZ/3jnCT4ThJpxk+8AY1ZT0xqsI3RnPbCPcCaE6c=;
        b=U2/ZvHj3S0X7260Guu0cGJ8d5WNEzZAgFh+8JCZWPW5ppUIsV/bKkijyer4O6jBnyz
         i4echExFVr/r/+b31rGrfKoGbch9WV0xgWpzas52gR+rNyXQM6U+wTrw03CYL30h0n6r
         I9K3QZQ2zX1WxtMknBx7MG5V6L84WzprUO9OYRIpHZ3lTeblY4gQaNPqjJfkzXXtdJVH
         XNuyOSt125B3PKhwm4VOUKi+O17VjuRJYkRxR2Zx3K5nCEExacEZfRQ141kgty38f0jY
         D2OdQkWljBF0hN4Pf04hGe4JD5uNyuilNEUeF3HuzTmAQZXA/unB8NYy0jFIyssU28tW
         atHA==
X-Forwarded-Encrypted: i=1; AJvYcCXi44ZRmNlyHQLE4luHy/lL36oi1RPk1cBDUYTB3X2Gz34Xx4Kv1/lnquy5WdbJl72/yn7nGGJW1Fw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPnzxdTMmoJt5oRVRBerAYdJcmVDLkPRSu88Xf+15W1dDtDK+l
	QsT0pLC09ajn5r4xlVrGWnKepfqE3iyFRjSCVb3a7uSXTFYYmX9S
X-Google-Smtp-Source: AGHT+IEl9sMTVjT1feGB/qAI1sptaWjyRNrI8nUwkrY/u4vClGzqlNNKMq69qUoXSMn1uO84jD7q5g==
X-Received: by 2002:a2e:6102:0:b0:2f7:4ccd:8918 with SMTP id 38308e7fff4ca-2fb61bd1513mr16305711fa.43.1729065058949;
        Wed, 16 Oct 2024 00:50:58 -0700 (PDT)
Message-ID: <56f7ee95390a36202dafe9e0ba64531549b4c4eb.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] xen/riscv: initialize bootinfo from dtb
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 16 Oct 2024 09:50:57 +0200
In-Reply-To: <9ff389f6-874b-4bb1-8685-d1e0e2281c59@suse.com>
References: <cover.1728481578.git.oleksii.kurochko@gmail.com>
	 <70c98147d7f977649ca3eb1a82cd76aeb0df1b14.1728481578.git.oleksii.kurochko@gmail.com>
	 <7e3399d7-f41c-4696-919b-dc7f57168bf9@suse.com>
	 <fce8372ee3bac4a0a3c6de58d7c7757df6e6d0a3.camel@gmail.com>
	 <9ff389f6-874b-4bb1-8685-d1e0e2281c59@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-10-15 at 14:32 +0200, Jan Beulich wrote:
> On 15.10.2024 11:11, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-10-15 at 08:33 +0200, Jan Beulich wrote:
> > > On 10.10.2024 17:30, Oleksii Kurochko wrote:
> > > > --- a/xen/arch/riscv/setup.c
> > > > +++ b/xen/arch/riscv/setup.c
> > > > @@ -50,6 +50,8 @@ void __init noreturn start_xen(unsigned long
> > > > bootcpu_id,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 _end - _start, false) )
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Failed to a=
dd BOOTMOD_XEN\n");
> > > > =C2=A0
> > > > +=C2=A0=C2=A0=C2=A0 BUG_ON(!boot_fdt_info(device_tree_flattened, dt=
b_addr));
> > >=20
> > > We generally aim at avoiding side effects in BUG_ON() (or
> > > ASSERT()).
> > > With
> > >=20
> > > =C2=A0=C2=A0=C2=A0 if (!boot_fdt_info(device_tree_flattened, dtb_addr=
))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG();
> > >=20
> > > Acked-by: Jan Beulich <jbeulich@suse.com>
> > >=20
> > > I can make the adjustment while committing, if desired.
> > It would be great if these changes could be made during the commit.
>=20
> I've committed it with the adjustment,=C2=A0
Thanks!

> yet once again I wondered: Why not
> panic()?
It could be panic() here; there's no specific reason. I agree that
using BUG() here isn't logically correct, as technically, a size of
zero for the FDT isn't a bug but rather indicates that someone provided
an incorrect FDT to Xen.

I will use panic() in the future for such cases.

It=E2=80=99s not always clear what should be used and where. Perhaps it wou=
ld
be helpful to add some explanation somewhere.

~ Oleksii


