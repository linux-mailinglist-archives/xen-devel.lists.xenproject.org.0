Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FAD7D10D7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 15:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619797.965460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpvY-0007Wr-VF; Fri, 20 Oct 2023 13:52:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619797.965460; Fri, 20 Oct 2023 13:52:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtpvY-0007Ty-SW; Fri, 20 Oct 2023 13:52:36 +0000
Received: by outflank-mailman (input) for mailman id 619797;
 Fri, 20 Oct 2023 13:52:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mE5s=GC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qtpvX-0007Tn-QB
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 13:52:35 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eafeda73-6f4f-11ee-9b0e-b553b5be7939;
 Fri, 20 Oct 2023 15:52:33 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso132318866b.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Oct 2023 06:52:33 -0700 (PDT)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a17090660d400b009a1c05bd672sm1519766ejk.127.2023.10.20.06.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Oct 2023 06:52:31 -0700 (PDT)
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
X-Inumbo-ID: eafeda73-6f4f-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697809952; x=1698414752; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NyC4slBPsVHFA4BVqfJBMjEmAIlbb68sj7NOG4bF0+c=;
        b=JFV12Aw71OB2h8L8vnTbiv0nToLKDCn0Bk4majSy4kxkYzN/q6fcOLnJdiB/zSq2ZT
         /PXf7NTxj8q6oOaIy4KrH2FRA0cV2k9Bs3ryvn0M5R63+ePQKzj3WrtgC7pCwDHykAyH
         7andEU9SIx0Sp3w0S5xxCLD3gVS6BkZEJKlWB/HS4TW2KYbgbhCw9kOyR3ekGICsjD1J
         qrCJKfU8DPTgg+kOYH5r75BYA7ZhQy6aqsvi6mUHaDItX5iTaYeurB0IJUYYcpV+aUnx
         tva+MYW5L3VXXLveNXXzGihZ8G+GZkX5N5IHaDHt0hmOGmVAOJoUgM/JgCx/1vSoKOd3
         9A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697809952; x=1698414752;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NyC4slBPsVHFA4BVqfJBMjEmAIlbb68sj7NOG4bF0+c=;
        b=G7Fi9ErrQUeKmR6fzm647JXI3a6Yo8sB83AahikG51whnF47D/OPpR8KZkTpxLUYBn
         /AdqF13tPsefa2+aNF9sfLg8R1SDNVaE+EV/kEcm2pdVWJTXJWqpTA7qRo88k6C1AhrW
         sYl9du5O/0qcPb4ZrRu27L4kgtftK9NZej2J7Ym26D6SiwMvZ2b/kjEcQeddjggh8QfF
         43QAEO494b/cNI4OSg51VRkO3yv9gp7TTq9As+QAtiX75eLKBiSG0acFFWoma9E439io
         XEZPy2d3JT9+YcCgjB8dobqqs8EEQHp1Rhjr9SsM6RibHmSCkTCeIVh7LB4r3jVKDUNK
         mbNQ==
X-Gm-Message-State: AOJu0Yx/IQ0MEvsrtkJs/1JWDhGEv2qVcO3otHmEqGsdlpXHg6BbgVDG
	zdruKbhzrKG/wnZE5lFWwKk=
X-Google-Smtp-Source: AGHT+IHBw6l4eo5Mj86YHiMGUQuoyg2D40cOz+uApfy3y5uN6ijwBFK1rkEdhssVh9FMrHjCrflyNg==
X-Received: by 2002:a17:906:fe4a:b0:9c3:b3cb:29b2 with SMTP id wz10-20020a170906fe4a00b009c3b3cb29b2mr1483819ejb.42.1697809952363;
        Fri, 20 Oct 2023 06:52:32 -0700 (PDT)
Message-ID: <ae6b419eac6eaefd65aab36b69e8926032983110.camel@gmail.com>
Subject: Re: [PATCH v7 0/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 JulienGrall <julien@xen.org>
Date: Fri, 20 Oct 2023 16:52:30 +0300
In-Reply-To: <059882ea-3e42-f74d-83e6-2f809d0993cb@suse.com>
References: <cover.1691507564.git.oleksii.kurochko@gmail.com>
	 <059882ea-3e42-f74d-83e6-2f809d0993cb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-10-19 at 12:32 +0200, Jan Beulich wrote:
> On 08.08.2023 17:14, Oleksii Kurochko wrote:
> > The patch series introduces things necessary to implement identity
> > mapping:
> > =C2=A0 1. Make identity mapping for the entire Xen.
> > =C2=A0 2. Enable MMU.
> > =C2=A0 3. Jump to the virtual address world
> > =C2=A0 4. Remove identity mapping.
> >=20
> > Also current patch series introduces the calculation of physical
> > offset before
> > MMU is enabled as access to physical offset will be calculated
> > wrong after
> > MMU will be enabled because access to phys_off variable is PC-
> > relative and
> > in the case when linker address !=3D load address, it will cause MMU
> > fault.
> >=20
> > The reason for this patch series can be found here:
> > https://lore.kernel.org/xen-devel/4e336121-fc0c-b007-bf7b-430352563d55@=
citrix.com/
> >=20
> > ---
> > Changes in V7:
> > =C2=A0- use srli instruction to be consistent with slli instruction in
> > turn_on_mmu()
> > ---
> > Changes in V6:
> > =C2=A0 - Update calc_phys_offset() after rebase.
> > =C2=A0 - Refactor turn_on_mmu() and a way how an argument of
> > turn_on_mmu() is
> > =C2=A0=C2=A0=C2=A0 calculated.
> > ---
> > Changes in V5:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update the algo of id=
entity mapping removing.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- introduce IDENT_AREA_=
SIZE.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- introduce turn_on_mmu=
() function to enable and switch
> > from 1:1 mapping.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- fix typo in PGTBL_INI=
TIAL_COUNT define.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update the comment ab=
ove PGTBL_INITIAL_COUNT.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update prototype of c=
alc_phys_offset(). now it returns
> > phys_offset.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- declare phys_offset a=
s static.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- save returned value o=
f calc_phys_offset to register s2.
> > ---
> > Changes in V4:
> > =C2=A0 - drop patch=C2=A0=C2=A0[PATCH v3 1/3] xen/riscv: add SPDX tag t=
o config.h
> > as it was
> > =C2=A0=C2=A0=C2=A0 merged to staging
> > =C2=A0 - remove definition of ARRAY_SIZE and ROUNDUP as <xen/macors.h>
> > was introduced where these macros are located now.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update definition of =
PGTBL_INITIAL_COUNT
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update the commit mes=
sage for patch 'xen/riscv: introduce
> > identity mapping'
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- update the comments i=
n head.S
> > =C2=A0 - update the algo of identity mapping removing=20
> > ---
> > Changes in V3:
> > =C2=A0- Update the patch series message.
> > =C2=A0- The following patches were merged to staging so droped from the
> > patch series:
> > =C2=A0=C2=A0 * xen/riscv: add .sbss section to .bss
> > =C2=A0=C2=A0 * xen/riscv: introduce reset_stack() function
> > =C2=A0=C2=A0 * xen/riscv: move extern of cpu0_boot_stack to header
> > =C2=A0=C2=A0 * xen/riscv: add SPDX tags
> > =C2=A0- move save/restore of a0/a1 registers from patch 4 to patch 2 (
> > numbers are
> > =C2=A0=C2=A0 from the previous patch series version )
> > =C2=A0- add SPDX tag in config.h
> > =C2=A0- update definition of PGTBL_INITIAL_COUNT taking into account
> > identity mapping.
> > =C2=A0- refactor remove_identity_mapping() function.
> > =C2=A0- add explanatory comments in xen.lds.S and mm.c.
> > ---
> > Changes in V2:
> > =C2=A0- update the patch series message.
> > =C2=A0- drop patches from the previous version of the patch series:
> > =C2=A0=C2=A0 * xen/riscv: add __ASSEMBLY__ guards". ( merged )
> > =C2=A0=C2=A0 * xen/riscv: make sure that identity mapping isn't bigger =
then
> > page size
> > =C2=A0=C2=A0=C2=A0=C2=A0 ( entire Xen is 1:1 mapped so there is no need=
 for the checks
> > from the patch )
> > =C2=A0- add .sbss.* and put it befor .bss* .
> > =C2=A0- move out reset_stack() to .text section.
> > =C2=A0- add '__ro_after_init' for phys_offset variable.
> > =C2=A0- add '__init' for calc_phys_offset().
> > =C2=A0- declaring variable phys_off as non static as it will be used in
> > head.S.
> > =C2=A0- update definition of PGTBL_INITIAL_COUNT and the comment above.
> > =C2=A0- code style fixes.
> > =C2=A0- remove id_addrs array becase entire Xen is mapped.
> > =C2=A0- reverse condition for cycle inside remove_identity_mapping().
> > =C2=A0- fix page table walk in remove_identity_mapping().
> > =C2=A0- save hart_id and dtb_addr before call MMU related C functions
> > =C2=A0- use phys_offset variable instead of doing calcultations to get
> > phys offset
> > =C2=A0=C2=A0 in head.S file. ( it can be easily done as entire Xen is 1=
:1
> > mapped now )
> > =C2=A0- declare enable_muu() as __init.
> > =C2=A0- Update SPDX tags.
> > =C2=A0- Add Review-By/Suggested-By for some patches.
> > =C2=A0- code style fixes.
> >=20
> > Oleksii Kurochko (2):
> > =C2=A0 xen/riscv: introduce function for physical offset calculation
> > =C2=A0 xen/riscv: introduce identity mapping
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
Thanks for Ack.

Should be the patch series re-send with Ack after the end of code
freeze?

~ Oleksii

