Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D74E82EBE7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 10:45:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667687.1039195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPfzm-0003Tb-Ac; Tue, 16 Jan 2024 09:44:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667687.1039195; Tue, 16 Jan 2024 09:44:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPfzm-0003S2-6Z; Tue, 16 Jan 2024 09:44:34 +0000
Received: by outflank-mailman (input) for mailman id 667687;
 Tue, 16 Jan 2024 09:44:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gvQ1=I2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rPfzk-0003Rw-E7
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 09:44:32 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d87bebfa-b453-11ee-9b0f-b553b5be7939;
 Tue, 16 Jan 2024 10:44:30 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ccae380df2so105092071fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2024 01:44:30 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a2e848a000000b002cdc1beb671sm617239ljh.12.2024.01.16.01.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 01:44:29 -0800 (PST)
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
X-Inumbo-ID: d87bebfa-b453-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705398270; x=1706003070; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PQ+OewsF4vdys6UbPikUgYDURvKri31Dv3fEP0hd5eM=;
        b=ShxewF/UFXH0cNqyFkZiwLT9lM410coVZT/tgsg1uB81AH1sNRNOea6j15IxTSZi+y
         7pGtThA/pmHF7hWZU6TFbHlAcd5DMcaQGIiPoVXP2loGUDKSPbC4YMLHCy7diwaM48NM
         d+iA0EasS2ojR2sCCMfhXLGjlxwTPkTKILcSpR+rm2jaiHlk49pTQlPrRDgnlbL/T+NS
         L3jKdAJSInHwi/bNInNohLix8P3XEbXPfxJkj2yAopL2ublnmlGgk/kY1/vWmet+M2ix
         MzmjaSTYDqYzU/cauLdcvYlnNd68yuF7SXlom6BCNwb0LGKVv8do+pQpH6ITAXUPDAB6
         zhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705398270; x=1706003070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQ+OewsF4vdys6UbPikUgYDURvKri31Dv3fEP0hd5eM=;
        b=ThZDyB4usluDs6CTHCp3wztGYKDTO/amGhWNXkV72HEoLVHJM+rTARCLlYhCMVEyvE
         BYvTbtfiVaQaQfSwyT+HrwsgfFALKBUXfwJROrZxnes4TXzlqm+KDodhDq/xA4HySQND
         ec3EB+9r/z/h1ayTYWd+SOVCCA+MN0RaxLPsnsTBe29DET7LrUKWmw8Eftb1upr+seo6
         HiosYJQPOvUvUmw/YSRwmKK6d1PgI15xlDwqWmLNQJzYxJq1oaV9lwpiVNU+z0hL/KX6
         3Grg4TWtPr9s4YgQqswX6AQcn1e2BZkW6+MIEvz/GXMxAScPJcX/W6BXA7WZmIHeLn0z
         XTuA==
X-Gm-Message-State: AOJu0Yxom8nnDv4sfI8q/oHGtd2tbMqC+SENIPIp527a7oTVAo/jFdRL
	o5yGmL04zPaMqpS0LAABE0I=
X-Google-Smtp-Source: AGHT+IH3Ydk5CX9J74BkEy4Hbb9g/SvzynxW1pcA4oOCYoPzaD8Mkg4wmVmlCbCE/HCEGe9bNN412Q==
X-Received: by 2002:a05:651c:204:b0:2cd:48d9:4d96 with SMTP id y4-20020a05651c020400b002cd48d94d96mr3038866ljn.49.1705398269514;
        Tue, 16 Jan 2024 01:44:29 -0800 (PST)
Message-ID: <5bf15f83be5a1cf38bff58d996e74a6de6b044b5.camel@gmail.com>
Subject: Re: [PATCH v3 21/34] xen/riscv: introduce p2m.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Alistair Francis
 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org, Julien Grall
 <julien@xen.org>
Date: Tue, 16 Jan 2024 11:44:27 +0200
In-Reply-To: <c1abf4ca-d69a-4a17-b23c-18f06b8fddda@suse.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <c3b1f24aea1ba01505697717b240c8d036abfee1.1703255175.git.oleksii.kurochko@gmail.com>
	 <abeafa19-7867-46b2-bc0e-b39eaa0f5036@xen.org>
	 <abef4701c3f2292e672679f1a18c826d699e1af2.camel@gmail.com>
	 <c1abf4ca-d69a-4a17-b23c-18f06b8fddda@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Mon, 2024-01-15 at 12:01 +0100, Jan Beulich wrote:
> On 15.01.2024 11:35, Oleksii wrote:
> > Hi Julien,
> >=20
> > On Fri, 2024-01-12 at 10:39 +0000, Julien Grall wrote:
> > > Hi Oleksii,
> > >=20
> > > On 22/12/2023 15:13, Oleksii Kurochko wrote:
> > > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > > > ---
> > > > Changes in V3:
> > > > =C2=A0 - add SPDX
> > > > =C2=A0 - drop unneeded for now p2m types.
> > > > =C2=A0 - return false in all functions implemented with BUG()
> > > > inside.
> > > > =C2=A0 - update the commit message
> > > > ---
> > > > Changes in V2:
> > > > =C2=A0 - Nothing changed. Only rebase.
> > > > ---
> > > > =C2=A0 xen/arch/ppc/include/asm/p2m.h=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +=
-
> > > > =C2=A0 xen/arch/riscv/include/asm/p2m.h | 102
> > > > +++++++++++++++++++++++++++++++
> > > > =C2=A0 2 files changed, 103 insertions(+), 2 deletions(-)
> > > > =C2=A0 create mode 100644 xen/arch/riscv/include/asm/p2m.h
> > > >=20
> > > > diff --git a/xen/arch/ppc/include/asm/p2m.h
> > > > b/xen/arch/ppc/include/asm/p2m.h
> > > > index 25ba054668..3bc05b7c05 100644
> > > > --- a/xen/arch/ppc/include/asm/p2m.h
> > > > +++ b/xen/arch/ppc/include/asm/p2m.h
> > > > @@ -50,8 +50,7 @@ static inline void memory_type_changed(struct
> > > > domain *d)
> > > > =C2=A0 static inline int
> > > > guest_physmap_mark_populate_on_demand(struct
> > > > domain *d, unsigned long gfn,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > > > unsigned
> > > > int order)
> > > > =C2=A0 {
> > > > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > > -=C2=A0=C2=A0=C2=A0 return 1;
> > > > +=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> > > > =C2=A0 }
> > > > =C2=A0=20
> > > > =C2=A0 static inline int guest_physmap_add_entry(struct domain *d,
> > > > diff --git a/xen/arch/riscv/include/asm/p2m.h
> > > > b/xen/arch/riscv/include/asm/p2m.h
> > > > new file mode 100644
> > > > index 0000000000..d270ef6635
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/include/asm/p2m.h
> > > > @@ -0,0 +1,102 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > +#ifndef __ASM_RISCV_P2M_H__
> > > > +#define __ASM_RISCV_P2M_H__
> > > > +
> > > > +#include <asm/page-bits.h>
> > > > +
> > > > +#define paddr_bits PADDR_BITS
> > > > +
> > > > +/*
> > > > + * List of possible type for each page in the p2m entry.
> > > > + * The number of available bit per page in the pte for this
> > > > purpose is 4 bits.
> > > > + * So it's possible to only have 16 fields. If we run out of
> > > > value
> > > > in the
> > > > + * future, it's possible to use higher value for pseudo-type
> > > > and
> > > > don't store
> > > > + * them in the p2m entry.
> > > > + */
> > >=20
> > > This looks like a verbatim copy from Arm. Did you actually check
> > > RISC-V=20
> > > has 4 bits available in the PTE to store this value?
> > Thanks for noticing that, in RISC-V it is available only 2 bits (
> > bits
> > 8 and 9), so I'll update the comment:
> > 53=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10 9=C2=A0=C2=A0=C2=A0 8 7 6 5 4 3 =
2 1 0
> > =C2=A0Physical Page Number=C2=A0=C2=A0=C2=A0=C2=A0 RSV=C2=A0 D A G U X =
W R V
>=20
> It's RSW (Reserved for Supervisor softWare use), not RSV, which is
> pretty
> important in this context.
Yes, you are right it is RSW. Thanks for the correction.

>=20
> > It seems that I missed something in the Arm code/architecture.As
> > far as I recall, in Arm, bits 5-8 are ignored by the MMU, and they
> > are expected
> > to be used by the hypervisor for its purpose.
> > However, in the code, I notice that these bits are utilized for
> > storing
> > a reference counter.
>=20
> Why "however"? Hardware still is going to ignore these bits.
Sure, these bits are ignored by hardware. What I meant is that,
according to the code, these bits are used for storing a reference
counter, not p2m_type_t. I guess I am missing something...

~ Oleksii

