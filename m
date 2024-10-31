Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 933E59B7DFC
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 16:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828798.1243821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WrN-0001wd-Tm; Thu, 31 Oct 2024 15:13:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828798.1243821; Thu, 31 Oct 2024 15:13:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WrN-0001v9-R5; Thu, 31 Oct 2024 15:13:17 +0000
Received: by outflank-mailman (input) for mailman id 828798;
 Thu, 31 Oct 2024 15:13:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=khX/=R3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t6WrL-0001v3-QB
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 15:13:15 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5614424-979a-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 16:13:12 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-539f72c8fc1so1703924e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 08:13:12 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bc9c0c1sm228985e87.83.2024.10.31.08.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 08:13:11 -0700 (PDT)
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
X-Inumbo-ID: a5614424-979a-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMjkiLCJoZWxvIjoibWFpbC1sZjEteDEyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE1NjE0NDI0LTk3OWEtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzg3NTkyLjc4NzYyOSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730387592; x=1730992392; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SL9vP7h9ip4kRGIaeQR0/0WvXyehZaWuO9a0+ofZJvU=;
        b=ZU7JSFHPFv3JKXTL7/Jitam6UoCS9R8C78CFl+mS1yUvDkmO/vpMXXV3A3pnknZPXq
         ozgHr6tmkag16F0XwsAOx9fmcs/NL3BmbiuOuxeADjQLovsCjxMZYrUTVy6S6A1ig8yy
         lvsUvKfsbLFCY7Aj49mNygzf9PjppIF3DxIXD1YfsEnMnyLqJwBxnoLE8AwgLK/cwyut
         GhC7U9C6uJcI+LG538yNmFTvmWs7DobKgyDjemdTLs/VKPUpTAHANqVZJS3GoF/5gmdj
         n9uyfhqmp+1eDvoZd2tM4xkv+OQx0IYkW1A3A/5WAv0n4/ZWxMum9hjqcMh90LmHmmt0
         Hnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730387592; x=1730992392;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SL9vP7h9ip4kRGIaeQR0/0WvXyehZaWuO9a0+ofZJvU=;
        b=fSn9ZARjShdmfsVUy11CEtxF6sOHLd+k0+zqKsgEkaoqH2pIRBm0AcEgJl/p3XkDMW
         PrcaV8h/A6YqPJeQxbLNiyGOKI27oeynyqNrr6cjNm4a771GVisQa+C7fAHKcfae24K+
         tNfvC3NpbTraLH4/F1zoDZLvnLUmERzG+PYRrKNvasZ3iaONWmDqzVnyStnzCebqnRP+
         9Xcrra95xp4Csd88oIJyPAORfDdYYooXPloDRnG12qtCvxE6bjsy129sycTs/d3wDVa1
         xcEnwVEwLowj0aedCNEkWelSn2WpbW5SwcoejkdfbsnK+6moVNHmkXzPpJubkVmhrXzy
         AUQA==
X-Forwarded-Encrypted: i=1; AJvYcCVIaK2EkA1FZgqu6SYLjZBk42y3RjhFtls6egy4reb14jpulL2HTlH8beq6/ivZ8a6T/nPKDZeXne8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFf7wuKBG0xzZy5i+h6u4CCqMTbEl2k8jXCfpGjdO17m0F2xWO
	5X1CbqNfgQgdTvJgOyuEViPnvJBH2kN6YLEOpaxnNEUfI3PIwsnU
X-Google-Smtp-Source: AGHT+IEzTxWPe3QeIxSPGRNNx0G5ebem+beK7CJPU+dyq1o5pAI8R5DVUHP1NRd1XtEPkqv/z/VeIA==
X-Received: by 2002:a05:6512:3d89:b0:539:ee0a:4f8f with SMTP id 2adb3069b0e04-53b7ed18669mr4090460e87.44.1730387592019;
        Thu, 31 Oct 2024 08:13:12 -0700 (PDT)
Message-ID: <5f4b8ed66e38475470cb80f04c470e12b6cb2a2e.camel@gmail.com>
Subject: Re: [PATCH v2] xen/common: Move gic_preinit() to common code
From: oleksii.kurochko@gmail.com
To: Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2024 16:13:10 +0100
In-Reply-To: <c400bd0f-1360-45ea-bd29-bf7883debd93@amd.com>
References: 
	<e906b538aba684ab108cc70e8c60ed35ddfad74e.1730292286.git.oleksii.kurochko@gmail.com>
	 <6461a47f-759a-4138-970c-4e5f68b07bae@suse.com>
	 <c400bd0f-1360-45ea-bd29-bf7883debd93@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.1 (3.54.1-1.fc41app1) 
MIME-Version: 1.0

On Thu, 2024-10-31 at 11:29 +0100, Michal Orzel wrote:
>=20
>=20
> On 31/10/2024 10:34, Jan Beulich wrote:
> >=20
> >=20
> > On 30.10.2024 14:14, Oleksii Kurochko wrote:
> > > Introduce ic_preinit() in the common codebase, as it is not
> > > architecture-specific and can be reused by both PPC and RISC-V.
> > > This function identifies the node with the interrupt-controller
> > > property
> > > in the device tree and calls device_init() to handle
> > > architecture-specific
> > > initialization of the interrupt controller.
> > >=20
> > > Additionally, rename gic_acpi_preinit() to ic_acpi_preinit() as
> > > it is used
> > > by ic_preinit(), while keeping it defined in architecture-
> > > specific as this
> > > part is architecture-specific. In case if CONFIG_ACPI=3Dn a stub
> > > for
> > > ic_acpi_preinit() is provided. To declaration/defintion of
> > > ic_acpi_preint()
> > > is added `inline` to deal with the compilation issue:
> > > =C2=A0 error: 'ic_acpi_preinit' defined but not used [-Werror=3Dunuse=
d-
> > > function]
> > >=20
> > > Make minor adjustments compared to the original ARM
> > > implementation of
> > > gic_dt_preinit():
> > > =C2=A0- Remove the local rc variable in gic_dt_preinit() since it is
> > > only used once.
> > > =C2=A0- Change the prefix from gic to ic to clarify that the function
> > > is not
> > > =C2=A0=C2=A0 specific to ARM=E2=80=99s GIC, making it suitable for ot=
her
> > > architectures as well.
> > >=20
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > ---
> > > Changes in v2:
> > > =C2=A0- Revert changes connected to moving of gic_acpi_preinit() to
> > > common code as
> > > =C2=A0=C2=A0 it isn't really architecture indepent part.
> > > =C2=A0- Update the commit message.
> > > =C2=A0- Move stub of ic_acpi_preinit() to <asm-generic/device.h> for
> > > the case when
> > > =C2=A0=C2=A0 CONFIG_ACPI=3Dn.
> > > ---
> > > =C2=A0xen/arch/arm/gic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 45 +-------------------------
> > > -----
> > > =C2=A0xen/arch/arm/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > =C2=A0xen/common/device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 46
> > > ++++++++++++++++++++++++++++++++
> > > =C2=A0xen/include/asm-generic/device.h | 10 +++++++
> > > =C2=A04 files changed, 59 insertions(+), 45 deletions(-)
> >=20
> > Looks largely okay to me now, with a question and a nit at the
> > bottom. The
> > question is mainly to Arm folks, where the code is coming from, and
> > DT
> > maintainers: Is a file named device.c really an appropriate "home"
> > for
> > IC-related code? If IC is a common thing in the DT world, would
> > such code
> > maybe better live under common/device-tree/?
> I think we will have more interrupt related dt stuff common, so it
> would make sense to create
> device-tree/irq.c or intc.c.
What about the part of the code in common/device.c:
   void __init ic_preinit(void)
   {
       if ( acpi_disabled )
           ic_dt_preinit();
       else
           ic_acpi_preinit();
   }
  =20
Should it be also moved to device-tree/intc.c even ic_acpi_preinit() is
used?

~ Oleksii


