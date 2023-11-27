Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5857FAA8E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 20:46:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642440.1001876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hZ5-0003Lr-HI; Mon, 27 Nov 2023 19:46:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642440.1001876; Mon, 27 Nov 2023 19:46:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hZ5-0003IZ-E3; Mon, 27 Nov 2023 19:46:43 +0000
Received: by outflank-mailman (input) for mailman id 642440;
 Mon, 27 Nov 2023 19:46:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5+WV=HI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r7hZ3-0003G5-OP
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 19:46:41 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af423da1-8d5d-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 20:46:40 +0100 (CET)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2c5071165d5so14844891fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 11:46:40 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a05651232cf00b0050ba6e989d6sm1112673lfg.268.2023.11.27.11.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 11:46:39 -0800 (PST)
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
X-Inumbo-ID: af423da1-8d5d-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701114400; x=1701719200; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WLV0j56qHS6Cdq6x9V70fNSr7RxpLkfJiuN+QTqKbS0=;
        b=VvoOGyYRp6IlwTp2g2Ci/HpXkCKcMmQVTsutjWzQlsQx2X0ezgG1Rveb4fWbSN0i/E
         pvWJBzORtkLUYCP4ratQSj/3+Cc6N7P3GznOnpl5U8+FIA66OErWgyjra7zFyoufBJXW
         rPDBsZ0fwLz1MbI44TSmiZ+N5D5M/FYrv0GUCmq9uTESdR1XK8mziPUad9sSOwIUpfXr
         ZGmW/YZf8uuHEnnyZMNSDLWvurNDOy+vKNKRK0urWOa6nQDSU0KAPR0tisOUY69djP3Q
         IzHA8fqCMFioAkWm14sokkXXXwR16M9LQkXGk31FAbguSNzCfYhuI8vTd3tpTV7phEnO
         UQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701114400; x=1701719200;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WLV0j56qHS6Cdq6x9V70fNSr7RxpLkfJiuN+QTqKbS0=;
        b=pCURG9nllIHzU2CnOGXKHB+Q4HrvHRIAxRuFsHh/br+GRTxzmW4jvNdcuqZw3bdHrW
         pfdkHdLcHOmzk720i+7qhdqzlNISGFjcdMQfhXv42BpUbdlsgV/J9gQn4N/HVuUKizjF
         WpUWIsXxE04E5RmUVcMZ4DklLWjKsxZmkwJg3MA/DhTYrnyeCWDsZexFn7dkCnXJ0rth
         2/C8E8Od9WIUqz/MP9Ir3AvJf/2IEEMSja4RI04XDaJQwt8pw4QaRSzdGIZEF31cv5jl
         QiTiVe7XHEM4WuVyDycJQ2R6+Q8RmMyjkMDB5M9MmSZvv5CSzP79fPmPBiJ4Icla4iVs
         x+mA==
X-Gm-Message-State: AOJu0YwImZE4OWMeb9Sb5tbGvSvja5J66rD8ZU5ChfBvagcWWl8NvKBQ
	x8C+NZ/6Cj4cg69ohWv6s8g=
X-Google-Smtp-Source: AGHT+IEhh64swUWE+/xHD3A590Wx8B61G+Hn/uanMmf7D0xbCcBth/WddiNQKzx0y+M36gxvP8vMZA==
X-Received: by 2002:ac2:5b04:0:b0:509:4599:f2bc with SMTP id v4-20020ac25b04000000b005094599f2bcmr8009727lfn.14.1701114400164;
        Mon, 27 Nov 2023 11:46:40 -0800 (PST)
Message-ID: <0e948dcb22fe553053431083f19f058245016e41.camel@gmail.com>
Subject: Re: [PATCH v4 02/14] xen/asm-generic: introduce generic device.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>, xen-devel@lists.xenproject.org
Date: Mon, 27 Nov 2023 21:46:39 +0200
In-Reply-To: <6aa8c7e5-c13e-43e0-bec4-74827407c985@suse.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
	 <67172a4fbf88833480203fcb1e2c640b6d39a556.1701093907.git.oleksii.kurochko@gmail.com>
	 <6aa8c7e5-c13e-43e0-bec4-74827407c985@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 (3.50.1-1.fc39) 
MIME-Version: 1.0

On Mon, 2023-11-27 at 15:31 +0100, Jan Beulich wrote:
> On 27.11.2023 15:13, Oleksii Kurochko wrote:
> > Arm, PPC and RISC-V use the same device.h thereby device.h
> > was moved to asm-generic. Arm's device.h was taken as a base with
> > the following changes:
> > =C2=A0- #ifdef PCI related things.
> > =C2=A0- #ifdef ACPI related things.
> > =C2=A0- Rename #ifdef guards.
> > =C2=A0- Add SPDX tag.
> > =C2=A0- #ifdef CONFIG_HAS_DEVICE_TREE related things.
> > =C2=A0- #ifdef-ing iommu related things with CONFIG_HAS_PASSTHROUGH.
> >=20
> > Also Arm and PPC are switched to asm-generic version of device.h
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V4:
> > =C2=A0- Updated the commit message
> > =C2=A0- Switched Arm and PPC to asm-generic version of device.h
> > =C2=A0- Replaced HAS_PCI with CONFIG_HAS_PCI
> > =C2=A0- ifdef-ing iommu filed of dev_archdata struct with
> > CONFIG_HAS_PASSTHROUGH
> > =C2=A0- ifdef-ing iommu_fwspec of device struct with
> > CONFIG_HAS_PASSTHROUGH
> > =C2=A0- ifdef-ing DT related things with CONFIG_HAS_DEVICE_TREE
> > =C2=A0- Updated the commit message ( remove a note with question about
> > =C2=A0=C2=A0 if device.h should be in asm-generic or not )
> > =C2=A0- Replaced DEVICE_IC with DEVICE_INTERRUPT_CONTROLLER
> > =C2=A0- Rationalized usage of CONFIG_HAS_* in device.h
> > =C2=A0- Fixed indents for ACPI_DEVICE_START and ACPI_DEVICE_END
> > ---
> > Changes in V3:
> > =C2=A0- ifdef device tree related things.
> > =C2=A0- update the commit message
> > ---
> > Changes in V2:
> > 	- take ( as common ) device.h from Arm as PPC and RISC-V
> > use it as a base.
> > 	- #ifdef PCI related things.
> > 	- #ifdef ACPI related things.
> > 	- rename DEVICE_GIC to DEVIC_IC.
> > 	- rename #ifdef guards.
> > 	- switch Arm and PPC to generic device.h
> > 	- add SPDX tag
> > 	- update the commit message
> >=20
> > ---
> > =C2=A0xen/arch/arm/device.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 15 ++-
> > =C2=A0xen/arch/arm/domain_build.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 2 +-
> > =C2=A0xen/arch/arm/gic-v2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0xen/arch/arm/gic-v3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +-
> > =C2=A0xen/arch/arm/gic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-
> > =C2=A0xen/arch/arm/include/asm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0xen/arch/ppc/include/asm/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0xen/arch/ppc/include/asm/device.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 53 --------
> > =C2=A0xen/arch/ppc/include/asm/irq.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +
> > =C2=A0.../asm =3D> include/asm-generic}/device.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 125 +++++++++++---
> > ----
> > =C2=A0xen/include/headers++.chk.new=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
0
> > =C2=A011 files changed, 106 insertions(+), 109 deletions(-)
> > =C2=A0delete mode 100644 xen/arch/ppc/include/asm/device.h
> > =C2=A0rename xen/{arch/arm/include/asm =3D> include/asm-generic}/device=
.h
> > (79%)
> > =C2=A0create mode 100644 xen/include/headers++.chk.new
>=20
> Stray new file, presumably because of a missing entry in .gitignore?
Yeah, I don't have such entry in .gitignore.
I will remove this file in next version of the patch.

>=20
> Overall I think there are too many changes done all in one go here.
> But it's mostly Arm which is affected, so I'll leave judging about
> that
> to the Arm maintainers.
>=20
> > --- a/xen/arch/ppc/include/asm/irq.h
> > +++ b/xen/arch/ppc/include/asm/irq.h
> > @@ -3,7 +3,9 @@
> > =C2=A0#define __ASM_PPC_IRQ_H__
> > =C2=A0
> > =C2=A0#include <xen/lib.h>
> > +#ifdef CONFIG_HAS_DEVICE_TREE
> > =C2=A0#include <xen/device_tree.h>
> > +#endif
> > =C2=A0#include <public/device_tree_defs.h>
>=20
> Why would this #ifdef not cover the public header as well? (Otherwise
> I'd
> be inclined to ask that the conditional be moved inside that header.)
In that header is defined only consts without additional header
inclusion. At that moment it looked to me pretty save to ifdef only
xen/device_tree.h but you are right we can move incluion of the public
header inside #ifdef OR just remove as xen/device_tree.h already
includes it.

~ Oleksii

