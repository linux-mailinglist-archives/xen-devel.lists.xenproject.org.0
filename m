Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEA7797330
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 17:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597460.931697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeGXe-0007ns-1P; Thu, 07 Sep 2023 15:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597460.931697; Thu, 07 Sep 2023 15:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeGXd-0007ly-Ug; Thu, 07 Sep 2023 15:03:33 +0000
Received: by outflank-mailman (input) for mailman id 597460;
 Thu, 07 Sep 2023 15:03:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tY2=EX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qeGXc-0007ls-VB
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 15:03:32 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b52febb6-4d8f-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 17:03:31 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso18225831fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Sep 2023 08:03:31 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x19-20020a05651c105300b002b9b55fefe0sm3879658ljm.131.2023.09.07.08.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 08:03:29 -0700 (PDT)
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
X-Inumbo-ID: b52febb6-4d8f-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694099010; x=1694703810; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XLtI9Rlf4ItgEYKGf7SkFDtMh8PUunpWlsS4ryoRTws=;
        b=Bt1IgzoCk4I8Uhuw64A9AhzaKFEC+UctyDKe38Mb8g0ewNdZp+oyTELd+J6nvdWxJy
         ggtV27NexJNuVJ9DBsS3l3B2qOmtWqvZE+FRFevmGfT0mgh+4kFdG4SDzBOKndAgaZ7M
         654FslEE5ytz2nht5vCUr/nVeyB1awBAEqqnSjufzW6ErA3DL0tCOLJF9I3F542Pf/3J
         kzroShVLt+q4xkxR9FjNKDAPtwZ1CQZzmLqc+DCdPAfqHDxC/Lf4jNQqb7spID1uuuCz
         V5ZA4SjN7S4fYS3mNOj79o5x9wuDmhuNyb8Y64rvwtnjhSr2pooG7rS9wjJ0BuuSRHbb
         Y8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694099010; x=1694703810;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLtI9Rlf4ItgEYKGf7SkFDtMh8PUunpWlsS4ryoRTws=;
        b=SHNc/tKhUh2U/TSmLCX9T5D+eSCa+RWVc0WoR6VvBRSsgwFW/+JZdJEcceAo/S62Kv
         f8d85SDeBArSCwlLpDnz3YOb/DlZ7DG5U/lcw+Qf1Sv4pfPyXeYt9wGOs9m31YXwo+Sk
         krRP4Fymo1nqzKP9Jdpga1bP2ucrguwBoq7UWvrSK0vTqgiZk+CrCrIee82ui6vxROUK
         g8yt7M4TLG+kifUSM9yZyz2JJ821e+xhxj+T4F0j0Ph6w9xTaqts6oy3DDQuFWfCCQeK
         O4MkCTBfjEJSFB7t0MDx3j8+CTDKeGzEo7JIX84cZwOGe+JBIf/MR/gcEziB7Ztk/iOV
         24+Q==
X-Gm-Message-State: AOJu0Ywlvz8BPdl7WjgOdtE4G4meNi1tzA7nsJcMq2VLYsXd4MBmFKeH
	2mn023dVDZB1xNzVaw0nHGbn20Ffs7Q=
X-Google-Smtp-Source: AGHT+IFaIHJc8dpTkDRwDakfX9J8A4W/UrV5YBAxjxn0OYwNzP292Eh9NzHDRrM8+j/8lrxml4aSUA==
X-Received: by 2002:a2e:9bd9:0:b0:2b6:bb21:8d74 with SMTP id w25-20020a2e9bd9000000b002b6bb218d74mr5242554ljj.1.1694099010072;
        Thu, 07 Sep 2023 08:03:30 -0700 (PDT)
Message-ID: <4b407c9c1ac8b3e0c1952782c7c2fe72781732d2.camel@gmail.com>
Subject: Re: [PATCH v7 0/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org, Bob Eshleman <bobbyeshleman@gmail.com>, 
	Alistair Francis <alistair.francis@wdc.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Connor Davis <connojdavis@gmail.com>
Date: Thu, 07 Sep 2023 18:03:28 +0300
In-Reply-To: <cover.1691507564.git.oleksii.kurochko@gmail.com>
References: <cover.1691507564.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hello Bobby and Alistair,

Could you kindly take a moment to examine this series of patches?
Your input would be highly valued.

Thanks in advance.

~ Oleksii

On Tue, 2023-08-08 at 18:14 +0300, Oleksii Kurochko wrote:
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
> The reason for this patch series can be found here:
> https://lore.kernel.org/xen-devel/4e336121-fc0c-b007-bf7b-430352563d55@ci=
trix.com/
>=20
> ---
> Changes in V7:
> =C2=A0- use srli instruction to be consistent with slli instruction in
> turn_on_mmu()
> ---
> Changes in V6:
> =C2=A0 - Update calc_phys_offset() after rebase.
> =C2=A0 - Refactor turn_on_mmu() and a way how an argument of turn_on_mmu(=
)
> is
> =C2=A0=C2=A0=C2=A0 calculated.
> ---
> Changes in V5:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update the algo of iden=
tity mapping removing.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- introduce IDENT_AREA_SI=
ZE.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- introduce turn_on_mmu()=
 function to enable and switch from
> 1:1 mapping.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- fix typo in PGTBL_INITI=
AL_COUNT define.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update the comment abov=
e PGTBL_INITIAL_COUNT.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update prototype of cal=
c_phys_offset(). now it returns
> phys_offset.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- declare phys_offset as =
static.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- save returned value of =
calc_phys_offset to register s2.
> ---
> Changes in V4:
> =C2=A0 - drop patch=C2=A0=C2=A0[PATCH v3 1/3] xen/riscv: add SPDX tag to =
config.h as
> it was
> =C2=A0=C2=A0=C2=A0 merged to staging
> =C2=A0 - remove definition of ARRAY_SIZE and ROUNDUP as <xen/macors.h> wa=
s
> introduced where these macros are located now.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update definition of PG=
TBL_INITIAL_COUNT
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update the commit messa=
ge for patch 'xen/riscv: introduce
> identity mapping'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update the comments in =
head.S
> =C2=A0 - update the algo of identity mapping removing=20
> ---
> Changes in V3:
> =C2=A0- Update the patch series message.
> =C2=A0- The following patches were merged to staging so droped from the
> patch series:
> =C2=A0=C2=A0 * xen/riscv: add .sbss section to .bss
> =C2=A0=C2=A0 * xen/riscv: introduce reset_stack() function
> =C2=A0=C2=A0 * xen/riscv: move extern of cpu0_boot_stack to header
> =C2=A0=C2=A0 * xen/riscv: add SPDX tags
> =C2=A0- move save/restore of a0/a1 registers from patch 4 to patch 2 (
> numbers are
> =C2=A0=C2=A0 from the previous patch series version )
> =C2=A0- add SPDX tag in config.h
> =C2=A0- update definition of PGTBL_INITIAL_COUNT taking into account
> identity mapping.
> =C2=A0- refactor remove_identity_mapping() function.
> =C2=A0- add explanatory comments in xen.lds.S and mm.c.
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
> Oleksii Kurochko (2):
> =C2=A0 xen/riscv: introduce function for physical offset calculation
> =C2=A0 xen/riscv: introduce identity mapping
>=20
> =C2=A0xen/arch/riscv/include/asm/acpi.h=C2=A0=C2=A0 |=C2=A0=C2=A0 6 ++
> =C2=A0xen/arch/riscv/include/asm/config.h |=C2=A0=C2=A0 2 +
> =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 7 +-
> =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 109 +++++++++++++++++---=
------
> --
> =C2=A0xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 44 +++++++++++
> =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +---
> =C2=A0xen/arch/riscv/xen.lds.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +++
> =C2=A07 files changed, 136 insertions(+), 57 deletions(-)
> =C2=A0create mode 100644 xen/arch/riscv/include/asm/acpi.h
>=20


