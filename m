Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E762989CF2
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 10:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807138.1218406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBvl-000702-16; Mon, 30 Sep 2024 08:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807138.1218406; Mon, 30 Sep 2024 08:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svBvk-0006xt-Ub; Mon, 30 Sep 2024 08:38:56 +0000
Received: by outflank-mailman (input) for mailman id 807138;
 Mon, 30 Sep 2024 08:38:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svBvj-0006xn-U2
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 08:38:55 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d958fca-7f07-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 10:38:55 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-53959a88668so3065730e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 01:38:55 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539984577c3sm64289e87.135.2024.09.30.01.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 01:38:50 -0700 (PDT)
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
X-Inumbo-ID: 6d958fca-7f07-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727685534; x=1728290334; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TLhw1l1tDF7LsCOOXf1MT/0xAYC1d0fLZSBNlqk3q1I=;
        b=Yx/b2soc7S5nE68N6CQPsVZDrQPZrWYzYu7LVxWyL/5+Mpck9eoYdIJ9+PipkbrwKg
         eBPAuj0V0pOoAHlhG9PzyOJPWJ9dp6cFbepLzC4g3BZzOy0mKrv5snwk4Nmp5dCjybEF
         kCr8L5M1pfmFPfE3xsdlozMzMoW1OW5yVUkJcQB83SuQtltbmoHyAlsURQ6zVF50wCG9
         q/0ZQyRhOB+7/Mh8v3JAwWfKWeTHiGbr1mZYFSSQbTTZXkHXX9pNS/E2h2bWofynLpFv
         gGnYt7jlQc1b8gxhooFAV1GdV1k6eSpmvADdzzqK69Gu+0LUrbHLkBNa5xTICHUrzYfE
         6zRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727685534; x=1728290334;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TLhw1l1tDF7LsCOOXf1MT/0xAYC1d0fLZSBNlqk3q1I=;
        b=Rv8c9FDOBKc44gZHsHNE7cXmz6IPF7SSGst3BmKlU0balyANsQ4Wsjpr/A/ENnf6Bp
         G/tyS6YT2Bzm49cUhGbqdv7elXJPoRJVnCKbsr8Q82/8DAOA8jwt2AONsvRhff6H26Vu
         XlDYSocjC7EnyyQ8dGAtIgJ2hq+yOioM7MleYF1s6yfBWAliVypRE6hbHOhTJ2WQJz/M
         zyfblSLFL8CUnkGSSQO4/ycQswo9bng732whadBYB6LFG5u4SmwP4iLlw/HUVF9KcMeX
         V10wgmr8whXUcftC8TI+yPwNg0a4/DC+3YAo0KLwHbVc6KUrK9YFiK16f4t2a0wut+3B
         QP6A==
X-Forwarded-Encrypted: i=1; AJvYcCXvCMUfXfssy9HWqSQ3wi6/+YjQMtotkxdXWrQ+Cf+vK2BtEbi5trSetFY9MfOwc5K2BYNl4SiXLu4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDnxRfKzTetCT4dHnHVIMqx2Izr3qw50wXn3+hmfcUt9XmMedO
	ycPMasYqz7pyY8Bk72LMRAQaaTtRsDH5Qf4fhdBY2+j7NZO6bTPz
X-Google-Smtp-Source: AGHT+IFLle/+xNy4seH3wJpPUMXCVT2cTNB8BrNPej6EAI+K07i8uAYOu61aUHz+YmvSr67bprfBMQ==
X-Received: by 2002:a05:6512:acd:b0:539:8f68:e035 with SMTP id 2adb3069b0e04-5398f68e08fmr1588514e87.20.1727685531157;
        Mon, 30 Sep 2024 01:38:51 -0700 (PDT)
Message-ID: <c1426b095aafcb3492edb679195342c4d0387626.camel@gmail.com>
Subject: Re: [PATCH v8 0/7] device tree mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2024 10:38:50 +0200
In-Reply-To: <5565ec42-4985-44a0-a8ac-c348c24dcede@suse.com>
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
	 <863cdc98-a811-485d-8c21-fbde9dedd070@suse.com>
	 <f12ad3bbe24b611c68be75abeab722571fe4e655.camel@gmail.com>
	 <5565ec42-4985-44a0-a8ac-c348c24dcede@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-09-30 at 10:32 +0200, Jan Beulich wrote:
> On 30.09.2024 10:24, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Mon, 2024-09-30 at 10:17 +0200, Jan Beulich wrote:
> > > On 27.09.2024 18:33, Oleksii Kurochko wrote:
> > > > Current patch series introduces device tree mapping for RISC-V
> > > > and necessary things for that such as:
> > > > - Fixmap mapping
> > > > - pmap
> > > > - Xen page table processing
> > >=20
> > > While nothing is being said here towards a dependency, ...
> > >=20
> > > > ---
> > > > Changes in v8:
> > > > =C2=A0- The following patch was merged to staging:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v5 1/7] xen/riscv: use {read,write}=
{b,w,l,q}_cpu()
> > > > to
> > > > define {read,write}_atomic()
> > > > =C2=A0- All other changes are patch specific so please look at the
> > > > patch.
> > > > ---
> > > > Changes in v7:
> > > > =C2=A0- Drop the patch "xen/riscv: prevent recursion when ASSERT(),
> > > > BUG*(), or panic() are called"
> > > > =C2=A0- All other changes are patch specific so please look at the
> > > > patch.
> > > > ---
> > > > Changes in v6:
> > > > =C2=A0- Add patch to fix recursion when ASSERT(), BUG*(), panic()
> > > > are
> > > > called.
> > > > =C2=A0- Add patch to allow write_atomic() to work with=C2=A0 non-sc=
alar
> > > > types
> > > > for consistence
> > > > =C2=A0=C2=A0 with read_atomic().
> > > > =C2=A0- All other changes are patch specific so please look at the
> > > > patch.=20
> > > > ---
> > > > Changes in v5:
> > > > =C2=A0- The following patch was merged to staging:
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 [PATCH v3 3/9] xen/riscv: enable CONFIG_HA=
S_DEVICE_TREE
> > > > =C2=A0- Drop depedency from "RISCV basic exception handling
> > > > implementation" as
> > > > =C2=A0=C2=A0 it was meged to staging branch.
> > > > =C2=A0- All other changes are patch specific so please look at the
> > > > patch.
> > > > ---
> > > > Changes in v4:
> > > > =C2=A0- Drop depedency from common devicre tree patch series as it
> > > > was
> > > > merged to
> > > > =C2=A0=C2=A0 staging.
> > > > =C2=A0- Update the cover letter message.
> > > > =C2=A0- All other changes are patch specific so please look at the
> > > > patch.
> > > > ---
> > > > Changes in v3:
> > > > =C2=A0- Introduce SBI RFENCE extension support.
> > > > =C2=A0- Introduce and initialize pcpu_info[] and
> > > > __cpuid_to_hartid_map[]
> > > > and functionality
> > > > =C2=A0=C2=A0 to work with this arrays.
> > > > =C2=A0- Make page table handling arch specific instead of trying to
> > > > make
> > > > it generic.
> > > > =C2=A0- All other changes are patch specific so please look at the
> > > > patch.
> > > > ---
> > > > Changes in v2:
> > > > =C2=A0- Update the cover letter message
> > > > =C2=A0- introduce fixmap mapping
> > > > =C2=A0- introduce pmap
> > > > =C2=A0- introduce CONFIG_GENREIC_PT
> > > > =C2=A0- update use early_fdt_map() after MMU is enabled.
> > > > ---
> > > >=20
> > > > Oleksii Kurochko (7):
> > > > =C2=A0 xen/riscv: allow write_atomic() to work with non-scalar type=
s
> > > > =C2=A0 xen/riscv: set up fixmap mappings
> > > > =C2=A0 xen/riscv: introduce asm/pmap.h header
> > > > =C2=A0 xen/riscv: introduce functionality to work with CPU info
> > > > =C2=A0 xen/riscv: introduce and initialize SBI RFENCE extension
> > > > =C2=A0 xen/riscv: page table handling
> > > > =C2=A0 xen/riscv: introduce early_fdt_map()
> > > >=20
> > > > =C2=A0xen/arch/riscv/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > > > =C2=A0xen/arch/riscv/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > > =C2=A0xen/arch/riscv/include/asm/atomic.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +-
> > > > =C2=A0xen/arch/riscv/include/asm/config.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +-
> > > > =C2=A0xen/arch/riscv/include/asm/current.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 27 +-
> > > > =C2=A0xen/arch/riscv/include/asm/fixmap.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 46 +++
> > > > =C2=A0xen/arch/riscv/include/asm/flushtlb.h=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 15 +
> > > > =C2=A0xen/arch/riscv/include/asm/mm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> > > > =C2=A0xen/arch/riscv/include/asm/page.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 99 +++++
> > > > =C2=A0xen/arch/riscv/include/asm/pmap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 36 ++
> > > > =C2=A0xen/arch/riscv/include/asm/processor.h=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 3 -
> > > > =C2=A0xen/arch/riscv/include/asm/riscv_encoding.h |=C2=A0=C2=A0 2 +
> > > > =C2=A0xen/arch/riscv/include/asm/sbi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 62 +++
> > > > =C2=A0xen/arch/riscv/include/asm/smp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 18 +
> > > > =C2=A0xen/arch/riscv/mm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 101 ++++-
> > > > =C2=A0xen/arch/riscv/pt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 421
> > > > ++++++++++++++++++++
> > > > =C2=A0xen/arch/riscv/riscv64/asm-offsets.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> > > > =C2=A0xen/arch/riscv/riscv64/head.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 14 +
> > > > =C2=A0xen/arch/riscv/sbi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 273
> > > > ++++++++++++-
> > > > =C2=A0xen/arch/riscv/setup.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 17 +
> > >=20
> > > ... I had to fiddle with three of the patches touching this file,
> > > to
> > > accommodate for an apparent debugging patch you have in your
> > > tree.
> > > Please can you make sure to submit patches against plain staging,
> > > or
> > > to clearly state dependencies?
> > I am always trying not to forget to rebase on top of staging for
> > this
> > patch series:
> >=20
> > 65c49e7aa2 (HEAD -> riscv-dt-support-v8, origin/riscv-dt-support-
> > v8)
> > xen/riscv: introduce early_fdt_map()
> > ead52f68ce xen/riscv: page table handling
> > c3aba0520f xen/riscv: introduce and initialize SBI RFENCE extension
> > 3ffb3ffd38 xen/riscv: introduce functionality to work with CPU info
> > 4bfd2bfdb2 xen/riscv: introduce asm/pmap.h header
> > 87bc91db10 xen/riscv: set up fixmap mappings
> > 09b925f973 xen/riscv: allow write_atomic() to work with non-scalar
> > types
> > 625ee7650c xen/README: add compiler and binutils versions for RISC-
> > V64
> > 5379a23ad7 xen/riscv: test basic exception handling stuff
> > 2b6fb9f3c4 (origin/staging, origin/HEAD, staging) blkif: Fix a
> > couple
> > of typos
> > 6e73a16230 blkif: Fix alignment description for discard request
> > 0111c86bfa x86/boot: Refactor BIOS/PVH start
>=20
> This looks to be a mix of several series. And "xen/riscv: test basic
> exception handling stuff" looks to be what the problem was with, as
> that
> wasn't committed yet (and imo also shouldn't be committed, as
> expressed
> before; of course you can try to find someone else to approve it).
Oh, you are right. I will put it to separate branch to not breaking the
things. Thanks.

~ Oleksii


