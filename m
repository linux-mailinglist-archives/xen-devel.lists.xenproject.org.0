Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D42969315F7
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 15:42:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758914.1168450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLyA-0004oy-HP; Mon, 15 Jul 2024 13:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758914.1168450; Mon, 15 Jul 2024 13:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTLyA-0004nE-DY; Mon, 15 Jul 2024 13:42:22 +0000
Received: by outflank-mailman (input) for mailman id 758914;
 Mon, 15 Jul 2024 13:42:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/7M=OP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sTLy8-0004n8-Tn
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 13:42:20 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e009897-42b0-11ef-8776-851b0ebba9a2;
 Mon, 15 Jul 2024 15:42:18 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-57cf8880f95so5378077a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 06:42:18 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b26996c70sm3376325a12.68.2024.07.15.06.42.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 06:42:14 -0700 (PDT)
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
X-Inumbo-ID: 0e009897-42b0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721050938; x=1721655738; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hvu9mLWWxvc6Q3fa2ObHFskc9erssTd2AkYqtupTqmc=;
        b=QdwrrucyQ1kwH0K3n12rr2xEAeWIoRsF3TqY9NwvI53fTfJJ2i/qQ2mTzfWVumNjfn
         gGQS7XA4uUORJU9px17ag4LmZg6VdQWbJRVVIbLHnzoHICNVICNw0l/zOM35h5IVj+Lq
         UePQk1t9yUMsn+2wFpUVL7DAcMjIbbxfM9ybPrQ7nyJhynEa5gMXfz/GhHCfCsKtmbnB
         jBEmU7sMwIQOXwTfjfxbmZG/D+/VFDJv/Lrxiyc7XpmHxFj/+Xr2cFO8wlANsQyZRe4t
         NPeY8EZp2KaVafaZwbXT8QgFTvadfmS/3MbJm3W9gx2ZfUkc4+qieA5rSVnnHh3F3ryc
         q2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721050938; x=1721655738;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hvu9mLWWxvc6Q3fa2ObHFskc9erssTd2AkYqtupTqmc=;
        b=hcmTKqB9NU5kL1Q63imhayApyO4pvodhSXyXje6Zo1pu5fsZ/Y43WR+0wF08dMPvD1
         A/H7B8jRLYWCLhE2Oot7bntzGqWCeCvqnY1AxCZmFrIZkiX0voG5nlYCqe8WcC2KXXcd
         r/oNVRfrRplrdftbWYSY/TYILqdu6JUYVhXQluMUg8s9Mm2gu0IGo4sO4RXYvvBdaGlc
         mTcuPHTlvGKlv4opmVWt9qYcBHinLiCcuxlR84wiozR7sgIw70Pj1Hx0yc7UxuefyVd1
         qvWzP3TyjWD3D1dL55YywOPpCMxutjBlkUB4yMW3/onK7AH26Yz/U5gSqta+Pmq4WJXa
         31xQ==
X-Forwarded-Encrypted: i=1; AJvYcCW52mVk55UGaA3v9v3ctdXc8QCS3qp9lc2yZzJzP26uXLzeKH/LAoN4v3NH9IB2JwX893hdY52qohWrdAJ6ftFRPQapQFVgO4E6XkK21sM=
X-Gm-Message-State: AOJu0YzqiBjd0YUsjL8vFeH5iqm/vWyH2dKsd/UHneXYE9xXOs6j+BF5
	itiHi6MWNIPg8fsKXnHBphgR8K+o0OXlAsD05QCRmQQOIWh2Tp99
X-Google-Smtp-Source: AGHT+IE+AbqkrPKQxJBm3/RrENR1A/aju2hBHVYo7UDCdyVQSokBEHY7EyCHY6lQQk+79A/G6Lwefg==
X-Received: by 2002:aa7:c548:0:b0:57a:33a5:9b71 with SMTP id 4fb4d7f45d1cf-594bc7c9d69mr11408878a12.33.1721050935035;
        Mon, 15 Jul 2024 06:42:15 -0700 (PDT)
Message-ID: <278883e1998dd91c2f788464ca933bdbf05370f4.camel@gmail.com>
Subject: Re: [PATCH v6 1/8] xen/device-tree: Move Arm's setup.c bootinfo
 functions to common
From: Oleksii <oleksii.kurochko@gmail.com>
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>,  "Daniel P. Smith"
 <dpsmith@apertussolutions.com>
Date: Mon, 15 Jul 2024 15:42:13 +0200
In-Reply-To: <98144517-5abe-4a82-81b4-6a459826fb2f@amd.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <cb2348393294b8910d794d9d11fff28ff0e6996b.1720799926.git.oleksii.kurochko@gmail.com>
	 <98144517-5abe-4a82-81b4-6a459826fb2f@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

Hi Michal,

On Mon, 2024-07-15 at 12:15 +0200, Michal Orzel wrote:
> Hi Oleksii,
>=20
> In general, the patch looks ok (apart from Jan comments). Just a
> couple of remarks.
>=20
> On 12/07/2024 18:22, Oleksii Kurochko wrote:
> >=20
> >=20
> > From: Shawn Anastasio <sanastasio@raptorengineering.com>
> >=20
> > Arm's setup.c contains a collection of functions for parsing memory
> > map
> > and other boot information from a device tree. Since these routines
> > are
> > generally useful on any architecture that supports device tree
> > booting,
> > move them into xen/common/device-tree.
> >=20
> > Suggested-by: Julien Grall <julien@xen.org>
> > Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > Changes in V6:
> > =C2=A0- update the version of the patch to v6, to show that it is based
> > =C2=A0=C2=A0 on the work done by Shawn in the patch v4.
> > ---
> > Changes in V5:
> > =C2=A0- add xen/include/xen/bootfdt.h to MAINTAINERS file.
> > =C2=A0- drop message "Early device tree parsing and".
> > =C2=A0- After rebase on top of the current staging the following change=
s
> > were done:
> > =C2=A0=C2=A0 - init bootinfo variable in <common/device-tree/bootinfo.c=
> with
> > BOOTINFO_INIT;
> > =C2=A0=C2=A0 - update the code of dt_unreserved_regions():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_STATIC_SHM related changes =
and getting of
> > reserved_mem
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bootinfo_get_shmem() ??
> > =C2=A0=C2=A0 - update the code of meminfo_overlap_check():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add check ( INVALID_PADDR =3D=3D b=
ank_start ) to if case.
> > =C2=A0=C2=A0 - update the code of check_reserved_regions_overlap():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CONFIG_STATIC_SHM related changes.
> > =C2=A0=C2=A0 - struct bootinfo was updated ( CONFIG_STATIC_SHM changes =
)
> > =C2=A0=C2=A0 - add shared_meminfo ( because of CONFIG_STATIC_SHM )
> > =C2=A0=C2=A0 - struct struct membanks was update with __struct group so
> > <xen/kernel> is
> > =C2=A0=C2=A0=C2=A0=C2=A0 neeeded to be included in bootfdt.h
> > =C2=A0=C2=A0 - move BOOTINFO_ACPI_INIT, BOOTINFO_SHMEM_INIT, BOOTINFO_I=
NIT to
> > generic bootfdt.h
> > =C2=A0=C2=A0 - bootinfo_get_reserved_mem(), bootinfo_get_mem(),
> > bootinfo_get_acpi(),
> > =C2=A0=C2=A0=C2=A0=C2=A0 bootinfo_get_shmem() and bootinfo_get_shmem_ex=
tra() were moved
> > to xen/bootfdt.h
> > =C2=A0- s/arm32/CONFIG_SEPARATE_XENHEAP/
> > =C2=A0- add inclusion of <xen/macros.h> because there are function in
> > <xen/bootfdt.h> which
> > =C2=A0=C2=A0 are using container_of().
> > =C2=A0---
> > Changes in v4:
> > =C2=A0 - create new xen/include/bootinfo.h rather than relying on arch'=
s
> > =C2=A0=C2=A0=C2=A0 asm/setup.h to provide required definitions for boot=
info.c
> > =C2=A0 - build bootinfo.c as .init.o
> > =C2=A0 - clean up and sort bootinfo.c's #includes
> > =C2=A0 - use CONFIG_SEPARATE_XENHEAP rather than CONFIG_ARM_32 to guard
> > =C2=A0=C2=A0=C2=A0 xenheap-specific behavior of populate_boot_allocator
> > =C2=A0 - (MAINTAINERS) include all of common/device-tree rather than
> > just
> > =C2=A0=C2=A0=C2=A0 bootinfo.c
> > ---
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0xen/arch/arm/include/asm/setup.h=C2=A0 | 187 +-----------
> > =C2=A0xen/arch/arm/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 432 --------------------------
> > --
> > =C2=A0xen/common/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0xen/common/device-tree/Makefile=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0xen/common/device-tree/bootinfo.c | 459
> > ++++++++++++++++++++++++++++++
> > =C2=A0xen/include/xen/bootfdt.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 196 +++++++++++++
> > =C2=A07 files changed, 660 insertions(+), 618 deletions(-)
> > =C2=A0create mode 100644 xen/common/device-tree/Makefile
> > =C2=A0create mode 100644 xen/common/device-tree/bootinfo.c
> > =C2=A0create mode 100644 xen/include/xen/bootfdt.h
> >=20
>=20
> [...]
>=20
> > diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> > new file mode 100644
> > index 0000000000..7cd45b3d4b
> > --- /dev/null
> > +++ b/xen/include/xen/bootfdt.h
> > @@ -0,0 +1,196 @@
> > +#ifndef __XEN_BOOTFDT_H__
> AFAIR, to avoid violating MISRA rule 21.1, we should avoid
> introducing new macros with double underscore.
I will update that in the next patch version.

>=20
> > +#define __XEN_BOOTFDT_H__
> > +
> > +#include <xen/types.h>
> > +#include <xen/kernel.h>
> > +#include <xen/macros.h>
> > +
> > +#define MIN_FDT_ALIGN 8
> > +#define MAX_FDT_SIZE SZ_2M
> 2M blob limit is Arm64 specific. What will be the limit on RISCV?
> Shouldn't it be moved to some arch specific file?
Agree, good point.

I should drop that definition here and make it arch specific. I have to
update my patch series where I am introducing BOOTFDT_MAX_SIZE ( or
something similar ) in riscv/config.h.

Thanks.

~ Oleksii



