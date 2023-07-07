Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3B74AECF
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 12:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560385.876282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHipm-0004zB-2h; Fri, 07 Jul 2023 10:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560385.876282; Fri, 07 Jul 2023 10:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHipl-0004x0-UI; Fri, 07 Jul 2023 10:37:05 +0000
Received: by outflank-mailman (input) for mailman id 560385;
 Fri, 07 Jul 2023 10:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jcIV=CZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qHipk-0004wu-Qz
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 10:37:04 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 364d2cf6-1cb2-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 12:37:03 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so2597655e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jul 2023 03:37:03 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w7-20020ac24427000000b004f76a88dbcbsm629049lfl.176.2023.07.07.03.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 03:37:02 -0700 (PDT)
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
X-Inumbo-ID: 364d2cf6-1cb2-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688726223; x=1691318223;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nk7NqYANnWZ6QHLF28Mg2hNcleSmLnmLQ6HMqzn0v+I=;
        b=McwZAhiwKuuLs8b9jO5EgTKuawLa1/E3Gv1Llckb9OVkRWbPDSIGYycfeI8ubdzBfC
         5AIMtrAgY2tuU+WuxVyCGiovabyOsel0PfLlpzdc6T4q1z7GNmh+97+fdNMwU7J1KrzN
         PY48edEx5wnjc6JKJXw+JIFFDfVJ71lH/pEJQ8k5N/Xyu1d8aXGT3yfQyVpSqAXNu6He
         Q604rvtYOho5J86G6IZwb0LcxJVwR+ppMSqYcLFMepPI7pX5tgoLROOTXCGasguPTZwi
         XvW9UdXi+r5xta42V18vhtCgeChG3RNH81IhQGxKnPHbghuiZ6+vaylFRchq0Ht6cCdj
         wTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688726223; x=1691318223;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nk7NqYANnWZ6QHLF28Mg2hNcleSmLnmLQ6HMqzn0v+I=;
        b=VkcocEK90Ohp+AG6pgWm3cUo5C+m0nnWdlDJZGgLEdmBfj1oM6rA+sqIQ7BsbyOehY
         kweJ9GkBX3bwyuH9uCPDb6rEZKxW0RAn2sTIvzk8e5dwoHOPfMUPicWmwpqls1Xv/4fa
         9OxF+TT9iigWvctm4D4/8ZG/SVwtTEEjGrinYj7qpxFdDVLXeVwhwcfhzVJUcN+6gPVB
         DSQJNAbatar3GlKBYHQ7/3C0H+ThhPdWk2U59pzUbhoCO4qxpAz/zoDvQxUPDe8Qc226
         EjlSTWGvOLlfO3LzY2pm+CpbcFjQEhP/suRDpJGftPj7vFVUfIcGjcL0dXE/S2DnlZ5O
         qFug==
X-Gm-Message-State: ABy/qLZaL78S9RQpGeK3tgiMY/rTnS9vNZ2wh9rf6Nk9STVbpnRupPCA
	0sGZ4N/MY6TuuHt+t6z54rI=
X-Google-Smtp-Source: APBJJlHfxxcrJICO4CW+7izLREQUYmLLrsET/+d22IvZ1srYsQtEKe0vc5L1ecRnWDAvkPbfqopihA==
X-Received: by 2002:ac2:4d9a:0:b0:4f8:6e1d:cf98 with SMTP id g26-20020ac24d9a000000b004f86e1dcf98mr3242092lfe.66.1688726222770;
        Fri, 07 Jul 2023 03:37:02 -0700 (PDT)
Message-ID: <1edb0c61a8ef64bb47809049252e9ad7b19f4bbe.camel@gmail.com>
Subject: Re: [PATCH v2 4/6] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall
 <julien@xen.org>,  Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Fri, 07 Jul 2023 13:37:01 +0300
In-Reply-To: <67df28ad-060e-07d5-acf2-02c3cd5f0b96@suse.com>
References: <cover.1687178053.git.oleksii.kurochko@gmail.com>
	 <21d8ce65f718bc10c2213688f79cf5f978bcaf16.1687178053.git.oleksii.kurochko@gmail.com>
	 <67df28ad-060e-07d5-acf2-02c3cd5f0b96@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

On Thu, 2023-07-06 at 13:35 +0200, Jan Beulich wrote:
> On 19.06.2023 15:34, Oleksii Kurochko wrote:
> > Since it is not easy to keep track where the identity map was
> > mapped,
> > so we will look for the top-level entry exclusive to the identity
> > map and remove it.
>=20
> I think you mean "top-most" or some such, as it's not necessarily the
> top-level entry you zap.
Yeah, 'top-most' is more appropriate in this context.
>=20
> > --- a/xen/arch/riscv/include/asm/config.h
> > +++ b/xen/arch/riscv/include/asm/config.h
> > @@ -1,3 +1,5 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +
> > =C2=A0#ifndef __RISCV_CONFIG_H__
> > =C2=A0#define __RISCV_CONFIG_H__
> > =C2=A0
>=20
> Unrelated change?
It  should be part of [PATCH v2 5/6] xen/riscv: introduce identity
mapping.

>=20
> > --- a/xen/arch/riscv/mm.c
> > +++ b/xen/arch/riscv/mm.c
> > @@ -25,6 +25,12 @@ unsigned long __ro_after_init phys_offset;
> > =C2=A0#define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
> > =C2=A0#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
> > =C2=A0
> > +/*
> > + * Should be removed as soon as enough headers will be merged for
> > inclusion of
> > + * <xen/lib.h>.
> > + */
> > +#define ARRAY_SIZE(arr)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(sizeof(arr) /
> > sizeof((arr)[0]))
> > +
> > =C2=A0/*
> > =C2=A0 * It is expected that Xen won't be more then 2 MB.
> > =C2=A0 * The check in xen.lds.S guarantees that.
> > @@ -35,8 +41,10 @@ unsigned long __ro_after_init phys_offset;
> > =C2=A0 *
> > =C2=A0 * It might be needed one more page table in case when Xen load
> > address
> > =C2=A0 * isn't 2 MB aligned.
> > + *
> > + * (CONFIG_PAGING_LEVELS - 1) page tables are needed for identity
> > mapping.
> > =C2=A0 */
> > -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
> > +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2 + 1)
>=20
> How come the extra page (see the comment sentence in context) isn't
> needed for the identity-mapping case?
It is needed to allocate no more than two 'nonroot' page tables (L0 and
L1 in case of Sv39 ) as page 'root' table ( L2 in case of Sv39 ) is
always re-used.

The same ( only 'nonroot' page tables might be needed to allocate )
works for any MMU mode.

>=20
> > @@ -255,25 +262,30 @@ void __init noreturn noinline enable_mmu()
> > =C2=A0=C2=A0=C2=A0=C2=A0 csr_write(CSR_SATP,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 PFN_DOWN((unsigned long)stage1_pgtbl_root) |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 RV_STAGE1_MODE << SATP_MODE_SHIFT);
> > +}
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 asm volatile ( ".p2align 2" );
> > - mmu_is_enabled:
> > -=C2=A0=C2=A0=C2=A0 /*
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * Stack should be re-inited as:
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * 1. Right now an address of the stack is rel=
ative to load
> > time
> > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 addresses what will cause=
 an issue in case of load start
> > address
> > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 isn't equal to linker sta=
rt address.
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * 2. Addresses in stack are all load time rel=
ative which can
> > be an
> > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 issue in case when load s=
tart address isn't equal to
> > linker
> > -=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 start address.
> > -=C2=A0=C2=A0=C2=A0=C2=A0 *
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * We can't return to the caller because the s=
tack was reseted
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * and it may have stash some variable on the =
stack.
> > -=C2=A0=C2=A0=C2=A0=C2=A0 * Jump to a brand new function as the stack w=
as reseted
> > -=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +void __init remove_identity_mapping(void)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned int i;
> > +=C2=A0=C2=A0=C2=A0 pte_t *pgtbl;
> > +=C2=A0=C2=A0=C2=A0 unsigned int index, xen_index;
> > +=C2=A0=C2=A0=C2=A0 unsigned long load_addr =3D LINK_TO_LOAD(_start);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 switch_stack_and_jump((unsigned long)cpu0_boot_stac=
k +
> > STACK_SIZE,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cont_after_mmu_is_enabled);
> > +=C2=A0=C2=A0=C2=A0 for ( pgtbl =3D stage1_pgtbl_root, i =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i <=3D (CONFIG_=
PAGING_LEVELS - 1);
>=20
> i < CONFIG_PAGING_LEVELS ? But maybe it would be easier for i to
> start
> at CONFIG_PAGING_LEVELS and be decremented, simplifying ...
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i++ )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 index =3D pt_index(CONFIG_P=
AGING_LEVELS - 1 - i, load_addr);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_index =3D pt_index(CONF=
IG_PAGING_LEVELS - 1 - i,
> > XEN_VIRT_START);
>=20
> ... these two expressions?
It makes sense. I'll update this part of the code.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( index !=3D xen_index )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgt=
bl[index].pte =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> Is this enough? When load and link address are pretty close (but not
> overlapping), can't they share a leaf table, in which case you need
> to clear more than just a single entry? The present overlap check
> looks to be 4k-granular, not 2M (in which case this couldn't happen;
> IOW adjusting the overlap check may also be a way out).
At the start of setup_initial_pagetables() there is a code which checks
that load and link address don't overlap:

    if ( (linker_start !=3D load_start) &&
         (linker_start <=3D load_end) && (load_start <=3D linker_end) )
    {
        early_printk("(XEN) linker and load address ranges overlap\n");
        die();
    }

So the closest difference between load and link address can be 4kb.
Otherwise load and link address ranges are equal ( as we can't map less
then 4kb).

Let's take concrete examples:
  Load address range is   0x8020_0000 - 0x8020_0FFF
  Linker address range is 0x8020_1000 - 0x8020_1FFF
  MMU mode: Sv39 ( so we have 3 page tables )

  So we have:
    * L2 index =3D 2, L1 index =3D 1, L0 index =3D 0 for load address
    * L2 index =3D 2, L1 index =3D 1, L0 index =3D 1 for linker address
  Thereby we have two different L0 tables for load and linker address=20
ranges.
  And it looks like it is pretty safe to remove only one L0 index that
was used for identity mapping.

Is it possible that I missed something?

~ Oleksii


 =20



