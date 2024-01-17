Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB18F83025C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 10:32:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668310.1040397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2HG-0003ks-KT; Wed, 17 Jan 2024 09:32:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668310.1040397; Wed, 17 Jan 2024 09:32:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQ2HG-0003j9-H1; Wed, 17 Jan 2024 09:32:06 +0000
Received: by outflank-mailman (input) for mailman id 668310;
 Wed, 17 Jan 2024 09:32:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sm03=I3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rQ2HF-0003j3-F1
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 09:32:05 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4617bf7d-b51b-11ee-98f2-6d05b1d4d9a1;
 Wed, 17 Jan 2024 10:32:04 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a27733ae1dfso1242648366b.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jan 2024 01:32:04 -0800 (PST)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k6-20020a170906128600b00a2b0b0fc80esm7513507ejb.193.2024.01.17.01.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 01:32:03 -0800 (PST)
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
X-Inumbo-ID: 4617bf7d-b51b-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705483924; x=1706088724; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/5DcSU7Y1vSJUQo+6aPVW3U6Viw4nzWrVTue6XGKaMw=;
        b=HrfrByMito2MUQS/fNvoxnQZ+oCgRfIV1e0OM8USpj6Pu6COCqq56b/GLOrUFV+n4U
         pF57eEo6JmeHcUyFF1iZ3vR77oRZro/xSCqUriotA19PlUgpBR2/dyVRIYUA1YLmaYAY
         fVJ40ad/jU36CJ1ASgjzQDEI0Ism7rGO2eu18vsYeyUrZn3LqZmNwhJl4AswQuzdbkSc
         bKzsKtHvDBHgzxcAgqGpWsp/zzXmh8QRutJDYqwuQgg9CbdFtpv7PQeR/MqJ3jGc8l+j
         fBLyRlQ2eHTgBLH2sfSdnwd5jA3n3gyVsnb3p5fCm0+hgWqiKip4eHPUX+Ln+khDqx/S
         zldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705483924; x=1706088724;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/5DcSU7Y1vSJUQo+6aPVW3U6Viw4nzWrVTue6XGKaMw=;
        b=lqnl9yzuU4GuiqCjPWl97L/8AP0jb6opqRIdbWpBDakpjqvmrojpSBW99L5RHxippq
         VHYzWMCEyRz/9mOixMa9ZLZj5yOxspq6kzplxbFt2qjr+qlikc0nXbQNrfHfj+UwVs1S
         blT21/gH+Tag+hibU2zZeOsLddyH/oWDgiXb3p9Bn4ccDBKvHy9XGWDzIsOCYn8xIguy
         vxLK+gsoVxeASQDY2+jZTKLcMuxJZkrD9VKJLq6Kn7/iVLXScAj6sbdWFmfhvCMGhdXK
         mefxNmN/p0cNMPaGTpxpIWAq7ZG8RD6ki4CW3Rf3QuCN8234FwK35vJcSucnxyloFlJH
         1odA==
X-Gm-Message-State: AOJu0Ywnm4awrb+UXHDOZbGC0fTziO33f2qOnShkBa1hLSPFBkg/PsbI
	15WryGciP6lnkp0VW/xwcdI=
X-Google-Smtp-Source: AGHT+IEXyT/7E61wbpgooW/TT+2j3nrNATAsgbEzvNZNuvKUVOBZK4d/7Q2uE4+tTSCSH0DDaQunvA==
X-Received: by 2002:a17:907:31c6:b0:a29:1419:f522 with SMTP id xf6-20020a17090731c600b00a291419f522mr2827794ejb.72.1705483923533;
        Wed, 17 Jan 2024 01:32:03 -0800 (PST)
Message-ID: <3e11cf09b1a9b98e3bd4a82e7f0bd2bcde2ed67d.camel@gmail.com>
Subject: Re: [PATCH v3 21/34] xen/riscv: introduce p2m.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Shawn Anastasio <sanastasio@raptorengineering.com>, Alistair Francis
	 <alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
	Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 17 Jan 2024 11:32:02 +0200
In-Reply-To: <402ece4f-a3bf-4eab-ac4c-ae36490ae114@xen.org>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
	 <c3b1f24aea1ba01505697717b240c8d036abfee1.1703255175.git.oleksii.kurochko@gmail.com>
	 <abeafa19-7867-46b2-bc0e-b39eaa0f5036@xen.org>
	 <abef4701c3f2292e672679f1a18c826d699e1af2.camel@gmail.com>
	 <c1abf4ca-d69a-4a17-b23c-18f06b8fddda@suse.com>
	 <5bf15f83be5a1cf38bff58d996e74a6de6b044b5.camel@gmail.com>
	 <402ece4f-a3bf-4eab-ac4c-ae36490ae114@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

Hi Julien,

On Tue, 2024-01-16 at 17:12 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 16/01/2024 09:44, Oleksii wrote:
> > On Mon, 2024-01-15 at 12:01 +0100, Jan Beulich wrote:
> > > On 15.01.2024 11:35, Oleksii wrote:
> > > > Hi Julien,
> > > >=20
> > > > On Fri, 2024-01-12 at 10:39 +0000, Julien Grall wrote:
> > > > > Hi Oleksii,
> > > > >=20
> > > > > On 22/12/2023 15:13, Oleksii Kurochko wrote:
> > > > > > Signed-off-by: Oleksii Kurochko
> > > > > > <oleksii.kurochko@gmail.com>
> > > > > > ---
> > > > > > Changes in V3:
> > > > > > =C2=A0=C2=A0 - add SPDX
> > > > > > =C2=A0=C2=A0 - drop unneeded for now p2m types.
> > > > > > =C2=A0=C2=A0 - return false in all functions implemented with B=
UG()
> > > > > > inside.
> > > > > > =C2=A0=C2=A0 - update the commit message
> > > > > > ---
> > > > > > Changes in V2:
> > > > > > =C2=A0=C2=A0 - Nothing changed. Only rebase.
> > > > > > ---
> > > > > > =C2=A0=C2=A0 xen/arch/ppc/include/asm/p2m.h=C2=A0=C2=A0 |=C2=A0=
=C2=A0 3 +-
> > > > > > =C2=A0=C2=A0 xen/arch/riscv/include/asm/p2m.h | 102
> > > > > > +++++++++++++++++++++++++++++++
> > > > > > =C2=A0=C2=A0 2 files changed, 103 insertions(+), 2 deletions(-)
> > > > > > =C2=A0=C2=A0 create mode 100644 xen/arch/riscv/include/asm/p2m.=
h
> > > > > >=20
> > > > > > diff --git a/xen/arch/ppc/include/asm/p2m.h
> > > > > > b/xen/arch/ppc/include/asm/p2m.h
> > > > > > index 25ba054668..3bc05b7c05 100644
> > > > > > --- a/xen/arch/ppc/include/asm/p2m.h
> > > > > > +++ b/xen/arch/ppc/include/asm/p2m.h
> > > > > > @@ -50,8 +50,7 @@ static inline void
> > > > > > memory_type_changed(struct
> > > > > > domain *d)
> > > > > > =C2=A0=C2=A0 static inline int
> > > > > > guest_physmap_mark_populate_on_demand(struct
> > > > > > domain *d, unsigned long gfn,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > > > > > unsigned
> > > > > > int order)
> > > > > > =C2=A0=C2=A0 {
> > > > > > -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > > > > > -=C2=A0=C2=A0=C2=A0 return 1;
> > > > > > +=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> > > > > > =C2=A0=C2=A0 }
> > > > > > =C2=A0=C2=A0=20
> > > > > > =C2=A0=C2=A0 static inline int guest_physmap_add_entry(struct d=
omain
> > > > > > *d,
> > > > > > diff --git a/xen/arch/riscv/include/asm/p2m.h
> > > > > > b/xen/arch/riscv/include/asm/p2m.h
> > > > > > new file mode 100644
> > > > > > index 0000000000..d270ef6635
> > > > > > --- /dev/null
> > > > > > +++ b/xen/arch/riscv/include/asm/p2m.h
> > > > > > @@ -0,0 +1,102 @@
> > > > > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > > > > +#ifndef __ASM_RISCV_P2M_H__
> > > > > > +#define __ASM_RISCV_P2M_H__
> > > > > > +
> > > > > > +#include <asm/page-bits.h>
> > > > > > +
> > > > > > +#define paddr_bits PADDR_BITS
> > > > > > +
> > > > > > +/*
> > > > > > + * List of possible type for each page in the p2m entry.
> > > > > > + * The number of available bit per page in the pte for
> > > > > > this
> > > > > > purpose is 4 bits.
> > > > > > + * So it's possible to only have 16 fields. If we run out
> > > > > > of
> > > > > > value
> > > > > > in the
> > > > > > + * future, it's possible to use higher value for pseudo-
> > > > > > type
> > > > > > and
> > > > > > don't store
> > > > > > + * them in the p2m entry.
> > > > > > + */
> > > > >=20
> > > > > This looks like a verbatim copy from Arm. Did you actually
> > > > > check
> > > > > RISC-V
> > > > > has 4 bits available in the PTE to store this value?
> > > > Thanks for noticing that, in RISC-V it is available only 2 bits
> > > > (
> > > > bits
> > > > 8 and 9), so I'll update the comment:
> > > > 53=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10 9=C2=A0=C2=A0=C2=A0 8 7 6 =
5 4 3 2 1 0
> > > > =C2=A0=C2=A0Physical Page Number=C2=A0=C2=A0=C2=A0=C2=A0 RSV=C2=A0 =
D A G U X W R V
> > >=20
> > > It's RSW (Reserved for Supervisor softWare use), not RSV, which
> > > is
> > > pretty
> > > important in this context.
> > Yes, you are right it is RSW. Thanks for the correction.
> >=20
> > >=20
> > > > It seems that I missed something in the Arm
> > > > code/architecture.As
> > > > far as I recall, in Arm, bits 5-8 are ignored by the MMU, and
> > > > they
> > > > are expected
> > > > to be used by the hypervisor for its purpose.
> > > > However, in the code, I notice that these bits are utilized for
> > > > storing
> > > > a reference counter.
> > >=20
> > > Why "however"? Hardware still is going to ignore these bits.
> > Sure, these bits are ignored by hardware. What I meant is that,
> > according to the code, these bits are used for storing a reference
> > counter, not p2m_type_t. I guess I am missing something...
>=20
> I can only guess where you saw the field used for reference counting.
> This was the domain map page infrastruture, right?
Yes, you are right.
>=20
> If so, this is for stage-1 page-table (aka hypervisor table) and not
> the=20
> stage-2 (e.g. P2M). For the latter, we would use the p2m_type_t.
I confused stage-1 & stage-2. Now everything fell into place. Thanks.

~ Oleksii

