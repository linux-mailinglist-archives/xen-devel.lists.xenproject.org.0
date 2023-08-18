Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A80E6780ACA
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 13:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586072.917288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxNF-0004zE-HP; Fri, 18 Aug 2023 11:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586072.917288; Fri, 18 Aug 2023 11:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWxNF-0004xF-EF; Fri, 18 Aug 2023 11:10:37 +0000
Received: by outflank-mailman (input) for mailman id 586072;
 Fri, 18 Aug 2023 11:10:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JdLL=ED=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWxNE-0004x9-0Z
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 11:10:36 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9bcbf73-3db7-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 13:10:33 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe61ae020bso1073236e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Aug 2023 04:10:33 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 b25-20020ac247f9000000b004fe509970dasm290767lfp.250.2023.08.18.04.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 04:10:32 -0700 (PDT)
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
X-Inumbo-ID: d9bcbf73-3db7-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692357033; x=1692961833;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MKjoDbYoBPsF2YUN+fvRePkfzIjlIXrOBSdeZ3BwJy0=;
        b=eXBSHJhyuUU+hybltNr3vqYno0jX6S/DXLD/5ovaIHiKJYaHvgDC8LUOTf0Dtxif6v
         aserI/wHAiB2/y4BP6Ly541/62AAKKC0lWKVAg6Nxh20G+E8LC+gEaJYXB3JDIBvTNCK
         qHfkggZCGCeO+SY9c8+y8P28YXi1vPrM52geZP9tcG1ZwWBZuw9qKF3tb5nCfyA4MA8n
         v92GUhUbxoJ/9pKG5EWrOJDCqx+LnL2GXgfjCkQJCJaJCbKsGZpsZpqtY7C/nqPBgRJi
         tAXbpXoL4kYTjnDjbpbDIjp6v9VdsUR1xLHbDvF8W9DbMDGiHBghL5QbOtJTPkV1WNjS
         BLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692357033; x=1692961833;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MKjoDbYoBPsF2YUN+fvRePkfzIjlIXrOBSdeZ3BwJy0=;
        b=lVHUVOQbK/rndLxMEDQVY0hBrJuZv3jMSwv91I1xcLmdV6scv78X/R0rU3l2cKhjbX
         gSNa6fGorxGmEgOBwFRWnxmyHlVE/wS2BsLWx2g+dqOHEI9V4YjMZvYVXfcK5TRNCIDf
         j0aK/fpybceh7aw4lQqnjTbFrKepjVK2TefmmBjF6VZfWlRRS9eQG3KHrbm7jVeM1Ruf
         CWnYQ+HXGEWggvYdWlma1e4jNXV9zcDBm9zcRQMNCPgr2P0N/BjsMe0UnWBhVTPXzTyU
         RiS/li6CNOSgmQsJCBW5yRCDOQG2Lp6LWTigqTPLGbkNL3gzs63gFv2lUZJT5lyUHjAH
         F+dQ==
X-Gm-Message-State: AOJu0YxOJ4S9NhHppJkaalyb93/E9t76WBei5Bb9PKTf22COtk1OLsUl
	NSZ54OfIcFeUj/G7Slmxz95syHYtVvaCbw==
X-Google-Smtp-Source: AGHT+IG1PMTeX0w8CwVCbTZOPopyEVsdkl75lfuCoSIzuEIXfD1V1N1hEoUf03cBB4IDrZ2KJLqE2A==
X-Received: by 2002:a05:6512:230a:b0:4fe:8c01:32ac with SMTP id o10-20020a056512230a00b004fe8c0132acmr1939413lfu.41.1692357032592;
        Fri, 18 Aug 2023 04:10:32 -0700 (PDT)
Message-ID: <26416851cc4b42402231ea6c04659feab02b53a7.camel@gmail.com>
Subject: Re: [PATCH v7 0/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>, Connor Davis
 <connojdavis@gmail.com>
Date: Fri, 18 Aug 2023 14:10:31 +0300
In-Reply-To: <cover.1691507564.git.oleksii.kurochko@gmail.com>
References: <cover.1691507564.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hello Alistair and Bobby,

Could you please review this patch series when you have a moment? Your
insights would be greatly appreciated.

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


