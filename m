Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E813475B021
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 15:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566603.885631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMTnY-0002ho-1B; Thu, 20 Jul 2023 13:34:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566603.885631; Thu, 20 Jul 2023 13:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMTnX-0002eg-Te; Thu, 20 Jul 2023 13:34:27 +0000
Received: by outflank-mailman (input) for mailman id 566603;
 Thu, 20 Jul 2023 13:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/1Sz=DG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qMTnW-0002ea-NA
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 13:34:26 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22a53180-2702-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 15:34:22 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fdd7d09576so1266405e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 06:34:22 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y1-20020ac24201000000b004fa35167729sm207302lfh.159.2023.07.20.06.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 06:34:20 -0700 (PDT)
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
X-Inumbo-ID: 22a53180-2702-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689860061; x=1690464861;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eSe7g1/0ty8ZLGeXTV0gG+04JxeYAA1SOw780NbVcqg=;
        b=kBAT9zX35VagErvaLhAoxdJ9vRN8vmMDjRfE/vdpLd7mIFqRjtkGftiDv0446O46PW
         W963+X3/kfAbNjDKTU5Klc83Ue076+7uc1FH3//k9eCp2BMXzR8GWPDp6ruKsHNgtxP5
         B8ufNjOFisK1C3Gkv5xITQrXaD0SMqI69ecZq5U5KSIIs1Kyvi6m0eANX6xXrYA7u5oN
         cRuAeqoVpyr9JZpcZ+w6gkFUz8/69N/YWdEWVIGUF2XV/RmutwSb1WE2qjwEEOoqYXwA
         s+YCaDHHF03vqpJrqvR0AiBlSG02Zlbx9elQsvDb5A7fO6NKagytemJQbiF6wJhehh41
         jqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689860061; x=1690464861;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eSe7g1/0ty8ZLGeXTV0gG+04JxeYAA1SOw780NbVcqg=;
        b=U+wg1q/64ExQ3R+ejqYJBtkWZe9K/imXXBDWB5Qa1yRNEXGcv1+dDVxFLSGQiQwS44
         ERqqcq5Ax+zxRmSJo3RN6hl9UmuOnX7vh/3ZhOmP51D8uyd3oCvtiF6TTU7muq8J+Gz7
         qdePCJBxaInL/dXHv4uSXSv4EI4dksyaqx+IJDr7mvCgBFr4KqyYLZPrAIgUeWjHN/hx
         qbHzT0tgg0XSZ3k0yjiTflL/u0Z2byH32X8vrmYzIkInzcdGJ8QhBOkKq/IT4iUth3zK
         w5bXlux4qffFbW3shBiez5dL8R/hM5kghok/J6s6S63xMbMkoZQJC+kIET85zHV0zl94
         o9Og==
X-Gm-Message-State: ABy/qLYr1tjDu1mVZq9mtj7G+1tg2QDDgPf7fwg8Pb2kiWW6mPRD4EYJ
	b9CZ58Zc9QOqwQ8IMkE3Rz1wprbJ0/k=
X-Google-Smtp-Source: APBJJlENDgW06kKChSI697SrMBHSF36e78wmmjHKtWBqBBpXbunyb+FPyRuSLcH/YCHqMehKSNQQaQ==
X-Received: by 2002:a19:6452:0:b0:4f8:631b:bf77 with SMTP id b18-20020a196452000000b004f8631bbf77mr2097882lfj.22.1689860061072;
        Thu, 20 Jul 2023 06:34:21 -0700 (PDT)
Message-ID: <fce99ab86730de77a82e60efc2c550a3f52a2443.camel@gmail.com>
Subject: Re: [PATCH v3 3/3] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Thu, 20 Jul 2023 16:34:20 +0300
In-Reply-To: <ad72e892-2ec0-5188-f3bc-6d33544c775a@suse.com>
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
	 <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
	 <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
	 <30540953fb363fce4dfd59f8a7e709247a9872fd.camel@gmail.com>
	 <c1a3d447-4b4d-cd9f-642d-e30fed088302@suse.com>
	 <0cbf6a69e8ae08f6b85edcc4f8d53a84e0103d8b.camel@gmail.com>
	 <ad72e892-2ec0-5188-f3bc-6d33544c775a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-07-20 at 12:29 +0200, Jan Beulich wrote:
> On 20.07.2023 10:28, Oleksii wrote:
> > On Thu, 2023-07-20 at 07:58 +0200, Jan Beulich wrote:
> > > On 19.07.2023 18:35, Oleksii wrote:
> > > > On Tue, 2023-07-18 at 17:03 +0200, Jan Beulich wrote:
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned long load_end =3D LINK_TO_LOAD(_end);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned long pt_level_size =3D
> > > > > > XEN_PT_LEVEL_SIZE(i
> > > > > > -
> > > > > > 1);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned long xen_size =3D ROUNDUP(load_end -
> > > > > > load_start, pt_level_size);
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 unsigned long page_entries_num =3D xen_size /
> > > > > > pt_level_size;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 while ( page_entries_num-- )
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgtbl[index++].pte =3D 0;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 break;
> > > > >=20
> > > > > Unless there's a "not crossing a 2Mb boundary" guarantee
> > > > > somewhere
> > > > > that I've missed, this "break" is still too early afaict.
> > > > If I will add a '2 MB boundary check' for load_start and
> > > > linker_start
> > > > could it be an upstreamable solution?
> > > >=20
> > > > Something like:
> > > > =C2=A0=C2=A0=C2=A0 if ( !IS_ALIGNED(load_start, MB(2) )
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0printk("load_start =
should be 2Mb algined\n");
> > > > and
> > > > =C2=A0=C2=A0=C2=A0 ASSERT( !IS_ALIGNED(XEN_VIRT_START, MB(2) )
> > > > in xen.lds.S.
> > >=20
> > > Arranging for the linked address to be 2Mb-aligned is certainly
> > > reasonable. Whether expecting the load address to also be depends
> > > on whether that can be arranged for (which in turn depends on
> > > boot
> > > loader behavior); it cannot be left to "luck".
> > Maybe I didn't quite understand you here, but if Xen has an
> > alignment
> > check of load address then boot loader has to follow the alignment
> > requirements of Xen. So it doesn't look as 'luck'.
>=20
> That depends on (a) the alignment being properly expressed in the
> final binary and (b) the boot loader honoring it. (b) is what you
> double-check above, emitting a printk(), but I'm not sure about (a)
> being sufficiently enforced with just the ASSERT in the linker
> script. Maybe I'm wrong, though.
It should be enough for current purpose but probably I am missing
something.

>=20
> > > > Then we will have completely different L0 tables for identity
> > > > mapping
> > > > and not identity and the code above will be correct.
> > >=20
> > > As long as Xen won't grow beyond 2Mb total. Considering that at
> > > some point you may want to use large page mappings for .text,
> > > .data, and .rodata, that alone would grow Xen to 6 Mb (or really
> > > 8,
> > > assuming .init goes separate as well). That's leaving aside the
> > > realistic option of the mere sum of all sections being larger
> > > than
> > > 2. That said, even Arm64 with ACPI is still quite a bit below
> > > 2Mb.
> > > x86 is nearing 2.5 though in even a somewhat limited config;
> > > allyesconfig may well be beyond that already.
> > I am missing something about Xen size. Lets assume that Xen will be
> > mapped using only 4k pagees ( like it is done now ). Then if Xen
> > will
> > be more then 2Mb then only what will be changed is a number of page
> > tables so it is only question of changing of PGTBL_INITIAL_COUNT (
> > in
> > case of RISC-V).
>=20
> And the way you do the tearing down of the transient 1:1 mapping.
It looks like removing=C2=A01:1 mapping will be the same.

Let's assume that the size of Xen is 4 MB and that load and linker
ranges don't overlap ( load and linker start address are 2Mb aligned ),
and the=C2=A0difference between them isn't bigger than 1 GB. Then one L2
page table, one L1 page table and two L0 page tables for identity
mapping, and two L0 page tables for non-identity mapping are needed.
Then at L1, we will have different indexes for load_start and
linker_start. So what will be needed is to clean two L1 page table
entries started from some index.

The only issue I see now is that it won't work in case if identity
mapping crosses a 1 Gb boundary. Then for identity mapping, it will be
needed two L1 page tables, and only one of them identity mapping will
be removed.

Do I miss anything else?
Wouldn't it be better to take into account that now?

>=20
> > Could you please explain why Xen will grow to 6/8 MB in case of
> > larger
> > page mappings? In case of larger page mapping fewer tables are
> > needed.
> > For example, if we would like to use 2Mb pages then we will stop at
> > L1
> > page table and write an physical address to L1 page table entry
> > instead
> > of creating new L0 page table.
>=20
> When you use 2Mb mappings, then you will want to use separate ones
> for .text, .rodata, and .data (plus perhaps .init), to express the
> differing permissions correctly. Consequently you'll need more
> virtual address space, but - yes - fewer page table pages. And of
> course the 1:1 unmapping logic will again be slightly different.
Thanks for clarification.

~ Oleksii


