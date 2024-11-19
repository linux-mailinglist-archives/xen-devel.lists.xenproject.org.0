Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A339D22A0
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 10:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839857.1255641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDKmN-0003tv-0V; Tue, 19 Nov 2024 09:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839857.1255641; Tue, 19 Nov 2024 09:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDKmM-0003sC-SE; Tue, 19 Nov 2024 09:44:14 +0000
Received: by outflank-mailman (input) for mailman id 839857;
 Tue, 19 Nov 2024 09:44:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5yv=SO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tDKmM-0003s6-BJ
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 09:44:14 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d386353e-a65a-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 10:44:09 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f367f97so5786613a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 01:44:09 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e08aa47sm627659066b.196.2024.11.19.01.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 01:44:08 -0800 (PST)
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
X-Inumbo-ID: d386353e-a65a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzYiLCJoZWxvIjoibWFpbC1lZDEteDUzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQzODYzNTNlLWE2NWEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDA5NDQ5Ljk3NjI2Nywic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732009449; x=1732614249; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=78JMwFbNvrAHzgEbvZ9xBjCi//I9z1IpKgXwPDkxMos=;
        b=eDfAqckUj/5nqB/d/dQ2upnQlBwWA2by2nob3tDJbR0bALS7hyQObT+GpNxTB+4w4W
         +B2CqvwmnluAsekkT527YKspT+D/L2lgFXe/glPDzpdu6U8X6jJOCD0Fqx0LOik2JW/z
         ier54Lm+O5ucBieW46f5t4UBVeEEEHx/3umhwXajduHdFiTxRw2v5o9dq4zPgaUod6Tw
         9aNGCPYLEdUq8X6fYPILGFpfVwrVYLx2oy+RqxZADYHMEhg3lfrw9PK9riYhE8SIYFLv
         cMKGMub7O6T3qFk3C9aDBteIbXxip1uMM5mX8pNu70D0IG0OSVOobplosidrMbnWce7n
         dqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732009449; x=1732614249;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78JMwFbNvrAHzgEbvZ9xBjCi//I9z1IpKgXwPDkxMos=;
        b=Etp0RVyG7wauN0bEAAaqU/9e+td327GCRURUf/OwTgLoMOue8lwMNAPjE+FkJli4lb
         jvZeEOuOUT917YzfdXa0YemtjYXlPur60y+4/9WMV6/0TfLQqaOZel2+LUIEK+70wg+Y
         8Kq3EpwXJKKShFGp/F8Inaep/44FHi9YVuTssLFLQhAcm5MddqS2OBHNnfSvnaDnutNN
         OjLn/MF0ZrK2HWvpR/P4amORrXcBMdQr/re/bYR0kaXC3cfFfOjoEP3ItPp8LHGDzkCT
         GZ+yi6nIuYkwtFHzkevpJEoV2W1Nne9NYCrhAhwXiFbReRwf7hZuEYpcMb/jX/6vN/EN
         33MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXi+REaokwIPxiaPMNthfwRUkA/+Ge9cLMZepeMcIbC6tIzanPcqUwxcJKB76YUyttuQupwkumtMc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuyI7Tp5YJbJBo83k97RaVRerAaBhGcpz7nWER4C8LlMtCp1HV
	Rd2V5tYo+or326UR6w3lj58SDjQ+tYgV6LKp5lJRL/cDkMK3pGk2buQjxQ==
X-Google-Smtp-Source: AGHT+IHAyJjyf3X2WdomnJ3oz+whLi1oSJW/rJopY7uSxq0rjmQEtTkTuK0ZGtk6V0tGIeuig0Iw5Q==
X-Received: by 2002:a05:6402:3508:b0:5cf:cb0d:1ed with SMTP id 4fb4d7f45d1cf-5cfcb0d02a0mr4866740a12.9.1732009448989;
        Tue, 19 Nov 2024 01:44:08 -0800 (PST)
Message-ID: <4799bbbdfb415dd0ed632227dd7911443b2e10ff.camel@gmail.com>
Subject: Re: [PATCH v3] drivers/char: rename arm-uart.c to uart-init.c
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel	 <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Date: Tue, 19 Nov 2024 10:43:53 +0100
In-Reply-To: <804b2455-27f8-4017-a771-9c76d829d164@xen.org>
References: 
	<b2eed7fed17c9e9a3a9414e6d97360a7deeb2acb.1731671392.git.oleksii.kurochko@gmail.com>
	 <804b2455-27f8-4017-a771-9c76d829d164@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

Hi Julien,

On Sat, 2024-11-16 at 10:11 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 15/11/2024 12:48, Oleksii Kurochko wrote:
> > Rename the file containing uart_init() to enable reuse across other
> > architectures that utilize device trees or SPCR tables to locate
> > UART
> > information.
> > After locating UART data, {acpi}_device_init() is called to
> > initialize
> > the UART.
> >=20
> > arm_uart_init() is renamed to uart_init() to be reused by other
> > architectures.
> >=20
> > A new configuration option, CONFIG_UART_INIT, is introduced,
> > currently
> > available only for Arm. Enabling CONFIG_UART_INIT on additional
> > architectures will require additional functionality, such as device
> > tree
> > mapping and unflattening, etc.
> >=20
> > The MAINTAINERS file is updated to alphabetically sort files in the
> > "ARM (W/ VIRTUALIZATION EXTENSIONS) ARCHITECTURE" section following
> > the renaming of arm-uart.c.
> >=20
> > Add `select UART_INIT` for CONFIG_ARM to be sure that randconfig
> > won't
> > disable UART_INIT.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V3:
> > =C2=A0 - Drop blank line in xen/drivers/char/Kconfig.
> > =C2=A0 - Rebase on top of the latest staging.
> > ---
> > Changes in v2:
> > =C2=A0 - Rename arm-uart.c to uart-init.c instead of moving only
> > dt_uart_init() to
> > =C2=A0=C2=A0=C2=A0 separate file.
> > =C2=A0 - Introduce new CONFIG_UART_INIT.
> > =C2=A0 - Rename arm_uart_init() to uart_init().
> > =C2=A0 - Add 'select UART_INIT' for CONFIG_ARM to be sure that
> > randconfig won't
> > =C2=A0=C2=A0=C2=A0 disable UART_INIT.
> > =C2=A0 - Update the commit message.
> > ---
> > =C2=A0 MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 xen/arch/arm/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0 xen/arch/arm/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 xen/drivers/char/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 10 +++
> > =C2=A0 xen/drivers/char/Makefile=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0 xen/drivers/char/arm-uart.c=C2=A0 | 145 ------------------------=
------
> > -----
> > =C2=A0 xen/drivers/char/uart-init.c | 145
> > +++++++++++++++++++++++++++++++++++
> > =C2=A0 xen/include/xen/serial.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2=
 +-
> > =C2=A0 8 files changed, 160 insertions(+), 149 deletions(-)
> > =C2=A0 delete mode 100644 xen/drivers/char/arm-uart.c
> > =C2=A0 create mode 100644 xen/drivers/char/uart-init.c
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 17fc5f9eec..a237080074 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -245,7 +245,6 @@ S:	Supported
> > =C2=A0 L:	xen-devel@lists.xenproject.org
> > =C2=A0 F:	docs/misc/arm/
> > =C2=A0 F:	xen/arch/arm/
> > -F:	xen/drivers/char/arm-uart.c
> > =C2=A0 F:	xen/drivers/char/cadence-uart.c
> > =C2=A0 F:	xen/drivers/char/exynos4210-uart.c
> > =C2=A0 F:	xen/drivers/char/imx-lpuart.c
> > @@ -254,6 +253,7 @@ F:	xen/drivers/char/mvebu-uart.c
> > =C2=A0 F:	xen/drivers/char/omap-uart.c
> > =C2=A0 F:	xen/drivers/char/pl011.c
> > =C2=A0 F:	xen/drivers/char/scif-uart.c
> > +F:	xen/drivers/char/uart-init.c
>=20
> (No action needed)
>=20
> I think that's fine for now. At some point we will need to consider a
> place where this can be maintained by other arch maintainers because=20
> this is not Arm specific anymore. The only place I can think of is
> THE REST.
Based on what we have in THE REST:

   THE REST
   ...
   F:	*
   F:	*/
   ...
Doesn't it mean that if we drop "F:	xen/drivers/char/uart-init.c"
then
by default any changes for uart-init.c file will be sent to maintainers
mentioned in M: lines of THE REST for review?
Thereby it seems to me we can just drop the change I did above and drop
"xen/drivers/char/arm-uart.c" from "ARM (W/ VIRTUALISATION EXTENSIONS)
ARCHITECTURE".

>=20
> > =C2=A0 F:	xen/drivers/passthrough/arm/
> > =C2=A0 F:	xen/include/public/arch-arm/
> > =C2=A0 F:	xen/include/public/arch-arm.h
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index 15b2e4a227..e068497361 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -17,6 +17,7 @@ config ARM
> > =C2=A0=C2=A0	select HAS_PASSTHROUGH
> > =C2=A0=C2=A0	select HAS_UBSAN
> > =C2=A0=C2=A0	select IOMMU_FORCE_PT_SHARE
> > +	select UART_INIT
> > =C2=A0=20
> > =C2=A0 config ARCH_DEFCONFIG
> > =C2=A0=C2=A0	string
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index 71ebaa77ca..2e27af4560 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -361,7 +361,7 @@ void asmlinkage __init start_xen(unsigned long
> > fdt_paddr)
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gic_preinit();
> > =C2=A0=20
> > -=C2=A0=C2=A0=C2=A0 arm_uart_init();
> > +=C2=A0=C2=A0=C2=A0 uart_init();
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 console_init_preirq();
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 console_init_ring();
> > =C2=A0=20
> > diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> > index e175d07c02..49a06a7859 100644
> > --- a/xen/drivers/char/Kconfig
> > +++ b/xen/drivers/char/Kconfig
> > @@ -93,6 +93,16 @@ config SERIAL_TX_BUFSIZE
> > =C2=A0=20
> > =C2=A0=C2=A0	=C2=A0 Default value is 32768 (32KiB).
> > =C2=A0=20
> > +config UART_INIT
>=20
> NIT Naming: I would consider to add GENERIC in the same. This makes=20
> clearer why x86 doesn't select because they would have their own=20
> implementation.
Agree, perhaps GENERIC_UART_INIT would be better. I'll add GENERIC in
the next patch version.

>=20
> > +	bool "UART initialization for DT and ACPI"
>=20
> Why do we provide a prompt for UART_INIT? This is not something I
> would=20
> expect the user to be able to disable.
Agree, not to much sense in provding a promt for UART_INIT. I'll drop
it.

>=20
> > +	depends on ARM
> > +	default y
> > +	help
> > +	=C2=A0 Provides a generic method for locating UART device tree
> > node when
> > +	=C2=A0 device tree is used, or for finding UART information in
> > SPCR
> > +	=C2=A0 table when using ACPI. Once UART information is located,
> > +	=C2=A0 {acpi}_device_init() is called for UART-specific
> > initialization.
>=20
> The last sentence contains too much implementation details. Kconfig
> is=20
> meant for admin to know what they need to select. I think it should
> be=20
> dropped. That said, if you don't provide any problem, then this
> Kconfig=20
> would just be:
>=20
> config UART_INIT
>=20
> And this is selected by arch.
I don't mind to do in this way. I have only one question shouldn't we
have, at least, bool inside config UART_INIT?
   config UART_INIT
       bool
  =20
And then as you told in Arm's Kconfig "select UART_INIT" inside
CONFIG_ARM?


Thanks.

~ Oleksii

