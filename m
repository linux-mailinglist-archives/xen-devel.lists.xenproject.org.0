Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 672719B7D00
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 15:35:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828780.1243801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WGf-0001tw-34; Thu, 31 Oct 2024 14:35:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828780.1243801; Thu, 31 Oct 2024 14:35:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6WGf-0001s0-01; Thu, 31 Oct 2024 14:35:21 +0000
Received: by outflank-mailman (input) for mailman id 828780;
 Thu, 31 Oct 2024 14:35:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=khX/=R3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1t6WGd-0001rs-Gj
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 14:35:19 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58d4fa58-9795-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 15:35:16 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso138647766b.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 07:35:16 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e564ccfdbsm74637866b.84.2024.10.31.07.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 07:35:15 -0700 (PDT)
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
X-Inumbo-ID: 58d4fa58-9795-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjU4ZDRmYTU4LTk3OTUtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzg1MzE2Ljk3NTI4MSwic2VuZGVyIjoib2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730385316; x=1730990116; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V6K+7/QPGO05w0Caa6O6+HpxX9BzAWkCiNdrUF60S4I=;
        b=c5xaQ2V3ryBhh1OnqVO6gR7oVYL8Zv3zT+6a34i+TsyPXXkP9N8uMmjfj8qMKvRYyQ
         Zp8/Dl56PiLVXaI/GffUc0ER9J+M8bmtet25ob5bdSZLIFXCCEJ9MDloRybz8qKpp/ja
         qC5x6U5SzIOllmlWKmp9j8HqXylfhIOaktacobw6WW1R++DcGtIFo0MAyX+sCtLrZ3Fr
         ffHsthzZuJNL/Sh37vjuQCwpnScywcEFhjLAUO2PFMtcIC5lfZuOwi/SDnEn5Fx1Ga4F
         ybzJzFA5DDJ/6U6gzPo6m7vAB4cJR0vO5lYvQ7Eqh/9mLped1IjFeRKH210QJMZ2ggOA
         VFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730385316; x=1730990116;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6K+7/QPGO05w0Caa6O6+HpxX9BzAWkCiNdrUF60S4I=;
        b=Va2aj3F+s6kvco5nGWAXxUaXlnyhKJ7fhIA+oFyHdv/XWMVCZSYq0Epfw4cMaGTo+P
         wPK73QNoGOPaJQdwC7mMZmeSZG0d4J9oBeDzeF2s+bihCy5qaSBvc+koINaWT6DmuQo8
         RyQNtRl+/wOjGoekJR2roClORqFukXyzXV0yBTW5uigTYn02KqStMEkvsAoBSpVyWW60
         VwaQLVPsnivTtQGROEqSGOA7TuiWQ7IMdSlCfcydhCBIqkwiuJsSGDB0FOSjwDerFX3R
         zN346vVterPT+p/AThbQsncZQhrRQhdOkpqF6q+4MgR4aNoLbAOj9AaGXvpuM76ScleH
         8OwA==
X-Forwarded-Encrypted: i=1; AJvYcCXkrpm/3wwDSLXq7BadwJTu5Ow0l4WwmbIRGpE6YvnnYIBEoGOMoWzil23Ajh9wLl7e6nvTDVmJ9o8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzrxh39PpSMQd1o4kG3sg09yeHmBz7oP3D2CFPkGG3EEMQa9Ioq
	XaMMYqKPgUTv13bfiUeyjQeRFOZivU8V2Lz8UqCKrMzGR3k5qo3S
X-Google-Smtp-Source: AGHT+IFLf2N3pZDFy1haUgm2evSakhySBHYo/D3BEMcu32whWXi4+IPp7XpoTtOj5xYDVKaDmTC9GA==
X-Received: by 2002:a17:907:cca3:b0:a9e:4b88:e02a with SMTP id a640c23a62f3a-a9e4b88e15bmr343302666b.0.1730385316015;
        Thu, 31 Oct 2024 07:35:16 -0700 (PDT)
Message-ID: <dd07060c2d19d7af92c0531a2d560d47b39fff0f.camel@gmail.com>
Subject: Re: [PATCH v2] xen/common: Move gic_preinit() to common code
From: oleksii.kurochko@gmail.com
To: Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Thu, 31 Oct 2024 15:35:14 +0100
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
>=20
> @Olku, can you please s/ic/intc/ ? It's much more common abbreviation
> for interrupt controller.
> You can do e.g. grep -Rw "ic" vs grep -Rw "intc" in Linux
> Documentation/devicetree/bindings/interrupt-controller.
Sure, intc sounds good to me.

Thanks.

~ Oleksii

