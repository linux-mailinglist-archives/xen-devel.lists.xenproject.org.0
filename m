Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 670AF745B95
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 13:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558073.871879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGI49-0005VG-9x; Mon, 03 Jul 2023 11:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558073.871879; Mon, 03 Jul 2023 11:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGI49-0005TV-6S; Mon, 03 Jul 2023 11:50:01 +0000
Received: by outflank-mailman (input) for mailman id 558073;
 Mon, 03 Jul 2023 11:49:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FG1R=CV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qGI47-0005TP-Hd
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 11:49:59 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb79e598-1997-11ee-8611-37d641c3527e;
 Mon, 03 Jul 2023 13:49:57 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b6994a8ce3so63601671fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jul 2023 04:49:57 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a2e7a0a000000b002b6d87ee4a4sm2001316ljc.38.2023.07.03.04.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 04:49:55 -0700 (PDT)
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
X-Inumbo-ID: bb79e598-1997-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688384996; x=1690976996;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ho534hFMM5oGf4sAHPgs8xtfIsDaUKrevbKZ0uWK43g=;
        b=UEe15vAcFKBoEhSxZkZN65TRYW2dI2IQ6imQ4nXqLMCmJ+++B1mWk0VpkiH+TiI1nI
         u/sn+iVTJAy/oUXCutlZhIH+CeIYQYoEE+jef4CUElJ1cP02PwouNO8F2TVT1S5SealS
         eq+eWRA0S2myzH2w1UdjSrKnxoXeTR7aSLvI/FvTo6LMTkD2NbOUOx8FLLBiF+NMOAP3
         NOzkx9Mxtqwvbviv9Pc7lkJ/yOxV1Ve13VAILJeKQjBnYD7Im2I5Il3QygSIv8elj6PP
         HEO6IP/KVsKUaByq4oBo6Ir5deEsyta6oDZRL0I6djxgiYvQXaFG4scmZiaCjtkSFSSf
         7Dlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688384996; x=1690976996;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ho534hFMM5oGf4sAHPgs8xtfIsDaUKrevbKZ0uWK43g=;
        b=FE7Cbh2LR2pmocBEKLR/xRBXoN7DJvY1rW7s+LYy046mkKFQr//C8vj4pvgMvK2AbI
         diEkMDsxe1vlSb4gpP4kzugxm2dDh5t6AEueHVLf1IReXzkvl59A5k/6shRgaNLv49kR
         0435xnA2rkE6LRXnsVc407TDIJ2tcghhwsY6LtRRHIIdPxVZhFnJ4WZOb/f/9w749uWM
         W8iZcTgwSxJMgwTUqa4yoIxVWocbFAk1NIVobqpj8aAA5yGzjyUcUU6Du65YlN0cj+Ab
         MjQNyMCW7oH+WHhVAOcjvbEPu4ntnz4ONDNSdWpGGxgFYdO0/UR+hLzTVOYCO5gL+j+z
         dIpA==
X-Gm-Message-State: ABy/qLbJq2Co4Jvq/0b7MDmUZZDqRAcAztU43H+unAjCTQO86mjJ0zjL
	B0vOL/jgz1HeAy6BXM9oclfF7bkW5xUHLw==
X-Google-Smtp-Source: APBJJlGm+Ls1vUP8SW9A3kvABZ7pCJi93/IHyZKlPrRodZvYdWTkfLT5emxAeboF/gjBZiyye6ooSw==
X-Received: by 2002:a2e:b60d:0:b0:2b6:c4f3:de with SMTP id r13-20020a2eb60d000000b002b6c4f300demr6549845ljn.24.1688384996085;
        Mon, 03 Jul 2023 04:49:56 -0700 (PDT)
Message-ID: <422f0fbfdb444feb2c1f190ee6e45f7a44c7b4f3.camel@gmail.com>
Subject: Re: [PATCH v2 0/6] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Connor Davis <connojdavis@gmail.com>
Date: Mon, 03 Jul 2023 14:49:55 +0300
In-Reply-To: <cover.1687178053.git.oleksii.kurochko@gmail.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0


Hello Bobby and Alistair,

Some patches of the current patch series were merged, but some still
require your Ack-by/Reviewed-by.

Could you please look at the following patches:
1. [PATCH v2 3/6] xen/riscv: introduce function for physical offset
calculation
2. [PATCH v2 4/6] xen/riscv: introduce identity mapping

Thank you so much for your attention and participation.

~ Oleksii

On Mon, 2023-06-19 at 16:34 +0300, Oleksii Kurochko wrote:
> The patch series introduces things necessary to implement identity
> mapping:
> =C2=A0 1. Make identity mapping for the entire Xen.
> =C2=A0 2. Enable MMU.
> =C2=A0 3. Jump to the virtual address world
> =C2=A0 4. Remove identity mapping.
>=20
> Also current patch series introduces the calculation of physical
> offset before
> MMU is enabled as access to physical offset will be calculated wrong
> after
> MMU will be enabled because access to phys_off variable is PC-
> relative and
> in the case when linker address !=3D load address, it will cause MMU
> fault.
>=20
> One more thing that was done is:
> =C2=A0 * Added SPDX tags.
> =C2=A0 * move extern of cpu0_boot_stack to a header.
>=20
> The reason for this patch series can be found here:
> https://lore.kernel.org/xen-devel/4e336121-fc0c-b007-bf7b-430352563d55@ci=
trix.com/
>=20
> ---
> Changes in V2:
> =C2=A0- update the patch series message.
> =C2=A0- drop patches from the previous version of the patch series:
> =C2=A0=C2=A0 * xen/riscv: add __ASSEMBLY__ guards". ( merged )
> =C2=A0=C2=A0 * xen/riscv: make sure that identity mapping isn't bigger th=
en
> page size
> =C2=A0=C2=A0=C2=A0=C2=A0 ( entire Xen is 1:1 mapped so there is no need f=
or the checks
> from the patch )
> =C2=A0- add .sbss.* and put it befor .bss* .
> =C2=A0- move out reset_stack() to .text section.
> =C2=A0- add '__ro_after_init' for phys_offset variable.
> =C2=A0- add '__init' for calc_phys_offset().
> =C2=A0- declaring variable phys_off as non static as it will be used in
> head.S.
> =C2=A0- update definition of PGTBL_INITIAL_COUNT and the comment above.
> =C2=A0- code style fixes.
> =C2=A0- remove id_addrs array becase entire Xen is mapped.
> =C2=A0- reverse condition for cycle inside remove_identity_mapping().
> =C2=A0- fix page table walk in remove_identity_mapping().
> =C2=A0- save hart_id and dtb_addr before call MMU related C functions
> =C2=A0- use phys_offset variable instead of doing calcultations to get
> phys offset
> =C2=A0=C2=A0 in head.S file. ( it can be easily done as entire Xen is 1:1
> mapped now )
> =C2=A0- declare enable_muu() as __init.
> =C2=A0- Update SPDX tags.
> =C2=A0- Add Review-By/Suggested-By for some patches.
> =C2=A0- code style fixes.
>=20
> Oleksii Kurochko (6):
> =C2=A0 xen/riscv: add .sbss section to .bss
> =C2=A0 xen/riscv: introduce reset_stack() function
> =C2=A0 xen/riscv: introduce function for physical offset calculation
> =C2=A0 xen/riscv: introduce identity mapping
> =C2=A0 xen/riscv: add SPDX tags
> =C2=A0 xen/riscv: move extern of cpu0_boot_stack to header
>=20
> =C2=A0xen/arch/riscv/include/asm/config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0xen/arch/riscv/include/asm/current.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 2 +
> =C2=A0xen/arch/riscv/include/asm/early_printk.h |=C2=A0=C2=A0 2 +
> =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0xen/arch/riscv/include/asm/page-bits.h=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 2 +
> =C2=A0xen/arch/riscv/include/asm/page.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0xen/arch/riscv/include/asm/traps.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0xen/arch/riscv/include/asm/types.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 104 +++++++++++++-------
> --
> =C2=A0xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 46 +++++++++-
> =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 16 +---
> =C2=A0xen/arch/riscv/xen.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
2 +-
> =C2=A012 files changed, 136 insertions(+), 55 deletions(-)
>=20


