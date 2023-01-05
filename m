Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D6B65F10E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 17:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472072.732187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDT2R-0001ms-1O; Thu, 05 Jan 2023 16:24:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472072.732187; Thu, 05 Jan 2023 16:24:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDT2Q-0001l2-Tu; Thu, 05 Jan 2023 16:24:18 +0000
Received: by outflank-mailman (input) for mailman id 472072;
 Thu, 05 Jan 2023 16:24:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aZA+=5C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pDT2P-0001kw-Ml
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 16:24:17 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65e22e20-8d15-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 17:24:16 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id bn6so29248242ljb.13
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jan 2023 08:24:16 -0800 (PST)
Received: from [192.168.0.145] ([195.234.76.149])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a05651c131500b0027ff16ee6b9sm1010127lja.8.2023.01.05.08.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:24:15 -0800 (PST)
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
X-Inumbo-ID: 65e22e20-8d15-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hh6raYC8+4X6HbqN1scrKnswGRbcSCRlzyoPUATYkiQ=;
        b=JxR1FSzr+zAv/aJQSWZfHNwfhtqy3BDEW+N4+snt13MYz0y9DHpP1P9P60PjcVe6cx
         KyAEGoKKa3AXdclQrtQL5BDxwIN8IPfYJPORe5vr6x8P8LQfA7Gmk/CBYpjarHb27G6H
         L2ESsZK88KNHUCmSiLWTjNcSe5nNNCVzBVE55Kh+VHUJcxiK+9FzdkD6JJu2GgM/nL95
         6zQa5ZDSxnMWCmHY8hSG0vIdGsf37+OcoWisHrijns1iS9UPJpYgJPW8ECjXviMhhCL9
         B2Gvjj306wJMEhPhN+ksBNYYOXwPIxXfBE5oMp0BU+AVIzC3iGHzzPpitjc6k61K771L
         pizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hh6raYC8+4X6HbqN1scrKnswGRbcSCRlzyoPUATYkiQ=;
        b=4JkEL/Wy7vokr+RXdLEWOiqynbCPk5H+oSARI6au4shF5mf9fTjFXj2hLhFhvv9w0i
         HJ2/KPmqGxpX2mIzqPZNcMVd72cPxRT1bpOHOS2UtIqc9pCBkdUGqGrste11OdZijKKm
         g4QmhjJ1sbLP93QrsKELH98bmOKlkChXlq4/MUk3EcU6E3h4x4pY6t8AjoqK87IqCQ6Y
         8Cs1mH/4rJa7sHGIlrJfo06pjPda44RrTRYoYS5+vnwfJUqGJMbV90Jbf+HA2XZgqgnV
         hT9SFYCm769q0nqsjOIH3/Qkmu1mR0uT1ROMPv8nV+q+I+4K2uURTDonRksv92HvgLou
         blgw==
X-Gm-Message-State: AFqh2kpJIjS2NG757xNcioSMETWlAhXtWGtP07PtUOsrv5WKjHcRtDgp
	LhmYb+dST6ql9W/Efb7YxUg=
X-Google-Smtp-Source: AMrXdXvi2omhnfUo0JZk87iT+w5i+GcD8PntMwGT3VUk03/GCBWvj0UWx+NPLl+zhCHOz51rQIUJIA==
X-Received: by 2002:a2e:9e57:0:b0:281:789:7ee5 with SMTP id g23-20020a2e9e57000000b0028107897ee5mr1199738ljk.6.1672935855707;
        Thu, 05 Jan 2023 08:24:15 -0800 (PST)
Message-ID: <8ab7b45a75cdfa332954c8a112cf9b54b4d35c62.camel@gmail.com>
Subject: Re: [PATCH v4 1/2] arch/riscv: initial RISC-V support to build/run
 minimal Xen
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Cc: Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Julien
 Grall <julien@xen.org>, Anthony Perard <anthony.perard@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Gianluca Guida
 <gianluca@rivosinc.com>,  "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Date: Thu, 05 Jan 2023 18:24:14 +0200
In-Reply-To: <439a5b7624dbf4d4ff6acbb9b3a6f15b777ba0fc.camel@gmail.com>
References: <cover.1672912316.git.oleksii.kurochko@gmail.com>
	 <ef6dbb71b27c75fe0dffb72d65ab457d27430475.1672912316.git.oleksii.kurochko@gmail.com>
	 <591d6624-2bd2-93f0-f5d6-760043230756@suse.com>
	 <01888162-49fb-a280-a088-5e81edff3919@citrix.com>
	 <439a5b7624dbf4d4ff6acbb9b3a6f15b777ba0fc.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 (3.46.1-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-01-05 at 18:10 +0200, Oleksii wrote:
> On Thu, 2023-01-05 at 15:48 +0000, Andrew Cooper wrote:
> > On 05/01/2023 1:40 pm, Jan Beulich wrote:
> > > On 05.01.2023 13:01, Oleksii Kurochko wrote:
> > > > To run in debug mode should be done the following instructions:
> > > > =C2=A0$ qemu-system-riscv64 -M virt -smp 1 -nographic -m 2g \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -kernel xen/xen -s -S
> > > > =C2=A0# In separate terminal:
> > > > =C2=A0$ riscv64-buildroot-linux-gnu-gdb
> > > > =C2=A0$ target remote :1234
> > > > =C2=A0$ add-symbol-file <xen_src>/xen/xen-syms 0x80200000
> > > > =C2=A0$ hb *0x80200000
> > > > =C2=A0$ c # it should stop at instruction j 0x80200000 <start>
> > > This suggests to me that Xen is meant to run at VA 0x80200000,
> > > whereas ...
> > >=20
> > > > --- a/xen/arch/riscv/include/asm/config.h
> > > > +++ b/xen/arch/riscv/include/asm/config.h
> > > > @@ -1,6 +1,9 @@
> > > > =C2=A0#ifndef __RISCV_CONFIG_H__
> > > > =C2=A0#define __RISCV_CONFIG_H__
> > > > =C2=A0
> > > > +#include <xen/const.h>
> > > > +#include <xen/page-size.h>
> > > > +
> > > > =C2=A0#if defined(CONFIG_RISCV_64)
> > > > =C2=A0# define LONG_BYTEORDER 3
> > > > =C2=A0# define ELFSIZE 64
> > > > @@ -28,7 +31,7 @@
> > > > =C2=A0
> > > > =C2=A0/* Linkage for RISCV */
> > > > =C2=A0#ifdef __ASSEMBLY__
> > > > -#define ALIGN .align 2
> > > > +#define ALIGN .align 4
> > > > =C2=A0
> > > > =C2=A0#define ENTRY(name)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > =C2=A0=C2=A0 .globl name;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > @@ -36,6 +39,10 @@
> > > > =C2=A0=C2=A0 name:
> > > > =C2=A0#endif
> > > > =C2=A0
> > > > +#define XEN_VIRT_START=C2=A0 _AT(UL, 0x00200000)
> > > ... here you specify a much lower address (and to be honest even
> > > 0x80200000
> > > looks pretty low to me for 64-bit, and perhaps even for 32-bit).
> > > Could you
> > > clarify what the plans here are? Maybe this is merely a temporary
> > > thing,
> > > but not called out as such?
> >=20
> > It's stale from v1 which had:
> >=20
> > #define XEN_VIRT_START=C2=A0 0x80200000
Let's switch XEN_VIRT_START to 0x0000000080200000 while we don't have
any MMU support as 0x80200000 is an address where OpenSBI will load
binary (in our case Xen).
> >=20
> >=20
> > But honestly, I don't think the qemu details in the commit message
> > are
> > useful.=C2=A0 This series is just about making "make build" work.
> >=20
> > The next series (being worked on, but not posted yet) is only a few
> > patches and gets a full Gitlab CI smoke test, at which point the
> > smoke
> > test shell script is the reference for how to invoke qemu.
> >=20
> >=20
> > I'm happy to R-by this series and drop that part of the commit
> > message
> > on commit.
> >=20
> I'm happy with that. Thanks.
> > ~Andrew
>=20
~ Oleksii


