Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE1575FB5B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 18:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569052.889356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNxzF-0007hH-Du; Mon, 24 Jul 2023 16:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569052.889356; Mon, 24 Jul 2023 16:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNxzF-0007fd-9H; Mon, 24 Jul 2023 16:00:41 +0000
Received: by outflank-mailman (input) for mailman id 569052;
 Mon, 24 Jul 2023 16:00:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c6P8=DK=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qNxzD-0007fX-TV
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 16:00:39 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d2f5a5e-2a3b-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 18:00:14 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2b93fba1f62so64335021fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 09:00:32 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a2e2413000000b002b6ec6cb24bsm2955187ljk.57.2023.07.24.09.00.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 09:00:31 -0700 (PDT)
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
X-Inumbo-ID: 2d2f5a5e-2a3b-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690214432; x=1690819232;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zYlzHlK3um2lM7goEapzGJltSbWGvQox88EIUcqrIlE=;
        b=QDtOlKbdUrKOKbDmwOdLw4bmUBgnrpW6BFmn7+RM+YDi8jCx2ZscSsA7VYOdiUChUH
         ZHGToD5dBmONkXB4gwkaqXfJ+XXQXMuPNa809Ab4nxOoI/Vnntp/rsbJjuck4rvHidNv
         /hojHWKkJ9sVejLw1we9LFsq1+EjzWiS1UtSmGfaJinbtgDcxMWnlfxJikex9JJXy3zm
         ueKWv2uN4Uz+o2PqekjOqrwQQl2u+RofQe489XYtYKRzS28NOWv2G9+nEDKfkbXpGFHA
         c+8Zla65bKsmBjkS0JUMfMxgAHpKMKy37wym0wj7y1DwC9G1Cf8FMCl0M65AVJjDlU45
         aoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690214432; x=1690819232;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYlzHlK3um2lM7goEapzGJltSbWGvQox88EIUcqrIlE=;
        b=YCwjzfY+mwB6dlAuyr63toa+xn/DhOAxFtuoefPVtTrFK3niwKGh/6TSiKV/6oLwwy
         LzypCqxpsAHRzBEAs+cUSBYdGwCpFb6wbYkrIC0k4oCgG2nWfCi61/yv93/OjwLt8s6f
         78qn3jUNb1bxwX8gKA1Fn8UVg7IxmPYBnO5gZbDc8Aci+TWJH3Aj/JO6kMRImv/rYk57
         mzOI4XOiO0Ujp/rK+MmwL4iznyrhnynjNhzdX2+2gHebIDR7PH853HXwpd0QKUnTxwHD
         zUT/mfilGRVTua/NqlBfMXbyl7SFz5RnKtuCM7t8s3SFyY2GbvrXlXeFn1UKmutoJLj8
         nSCQ==
X-Gm-Message-State: ABy/qLaqnyzpHXxwuYMghlNTX9QvlGn+lqONZXNJX04ekAawqQcaRS8s
	FCNJ2BqNyqW58UFHeNrQLVE=
X-Google-Smtp-Source: APBJJlHWCO8ER6mL7YLVDBndcPO1DB9s8FHg+rqbAvgsriMlcfuvep69ePtTyNpiVS572hYE4wK4Tw==
X-Received: by 2002:a2e:90da:0:b0:2b9:4476:ab28 with SMTP id o26-20020a2e90da000000b002b94476ab28mr6947230ljg.38.1690214431845;
        Mon, 24 Jul 2023 09:00:31 -0700 (PDT)
Message-ID: <dddc1effe5fc112f79a84e4f0a7ccf283877a466.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Mon, 24 Jul 2023 19:00:30 +0300
In-Reply-To: <c32d8be8-75cf-78f8-304d-247b93b611cb@suse.com>
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
	 <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
	 <c32d8be8-75cf-78f8-304d-247b93b611cb@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-07-24 at 16:11 +0200, Jan Beulich wrote:
> On 24.07.2023 11:42, Oleksii Kurochko wrote:
> > @@ -35,8 +36,10 @@ unsigned long __ro_after_init phys_offset;
> > =C2=A0 *
> > =C2=A0 * It might be needed one more page table in case when Xen load
> > address
> > =C2=A0 * isn't 2 MB aligned.
> > + *
> > + * CONFIG_PAGING_LEVELS page tables are needed for identity
> > mapping.
> > =C2=A0 */
> > -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
> > +#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) * 2) + 1
>=20
> Comment addition and code change are at least apparently out of sync:
> With such a comment and without thinking much one would expect the
> constant to be bumped by CONFIG_PAGING_LEVELS. It is true that you
> only need CONFIG_PAGING_LEVELS - 1, because the root table is shared,
> but that would then be nice to also clarify in the comment. E.g.
>=20
> "CONFIG_PAGING_LEVELS page tables are needed for the identity
> mapping,
> =C2=A0except that the root page table is shared with the initial mapping.=
"
Thanks. I'll take into account in the next patch version.

>=20
> Also - where did the outermost pair of parentheses go? (Really you
> don't need to parenthesize the multiplication, so the last closing
> one can simply move last.)
Missed it. Thanks. I'll move last parentheses to the end.
>=20
> > @@ -75,10 +78,11 @@ static void __init setup_initial_mapping(struct
> > mmu_desc *mmu_desc,
> > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned int index;
> > =C2=A0=C2=A0=C2=A0=C2=A0 pte_t *pgtbl;
> > =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long page_addr;
> > +=C2=A0=C2=A0=C2=A0 bool is_identity_mapping =3D map_start =3D=3D pa_st=
art;
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 if ( (unsigned long)_start % XEN_PT_LEVEL_SIZE(0) )
> > +=C2=A0=C2=A0=C2=A0 if ( !IS_ALIGNED((unsigned long)_start, KB(4)) )
> > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("(XEN) Xen sho=
uld be loaded at 4k
> > boundary\n");
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("(XEN) Xen sho=
uld be loaded at 4KB
> > boundary\n");
>=20
> The change to the message looks unrelated.
Yes, you are right. I'll remove that change to the message.

>=20
> > @@ -255,25 +261,44 @@ void __init noreturn noinline enable_mmu()
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
> > +=C2=A0=C2=A0=C2=A0 static pte_t *pgtbl =3D stage1_pgtbl_root;
> > +=C2=A0=C2=A0=C2=A0 static unsigned long load_start =3D XEN_VIRT_START;
> > +=C2=A0=C2=A0=C2=A0 static unsigned int pt_level =3D CONFIG_PAGING_LEVE=
LS - 1;
>=20
> These all want to be __initdata, but personally I find this way of
> recursing a little odd. Let's see what the maintainers say.
I'm not completely happy either. Initially I thought that it would be
better to pass all this stuff as function's arguments.

But then it is needed to provide an access to stage1_pgtbl_root (
get_root_pt() function ? ). So remove_identity_mapping() will be called
as remove_identity_mapping(get_root_pt(), _start, CONFIG_PAGING_LELVELS
-1 ) or remove_identity_mapping(NULL, _start, CONFIG_PAGING_LELVELS -1
) and then check if first argument is NULL then initialize it with
stage1_pgtbl_root.
Also I am not sure that an 'user' should provide all this information
to such function.

Could you recommend something better?

>=20
> > +=C2=A0=C2=A0=C2=A0 unsigned long load_end =3D LINK_TO_LOAD(_end);
> > +=C2=A0=C2=A0=C2=A0 unsigned long xen_size;
> > +=C2=A0=C2=A0=C2=A0 unsigned long pt_level_size =3D XEN_PT_LEVEL_SIZE(p=
t_level);
> > +=C2=A0=C2=A0=C2=A0 unsigned long pte_nums;
> > +
> > +=C2=A0=C2=A0=C2=A0 unsigned long virt_indx =3D pt_index(pt_level, XEN_=
VIRT_START);
> > +=C2=A0=C2=A0=C2=A0 unsigned long indx;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( load_start =3D=3D XEN_VIRT_START )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 load_start =3D LINK_TO_LOAD=
(_start);
> > +
> > +=C2=A0=C2=A0=C2=A0 xen_size =3D load_end - load_start;
>=20
> When you come here recursively, don't you need to limit this
> instance of the function to a single page table's worth of address
> space (at the given level), using load_end only if that's yet
> lower?
Do you mean a case when load_start > load_end? If yes then I missed
that.
>=20
> > +=C2=A0=C2=A0=C2=A0 pte_nums =3D ROUNDUP(xen_size, pt_level_size) / pt_=
level_size;
> > +
> > +=C2=A0=C2=A0=C2=A0 while ( pte_nums-- )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 indx =3D pt_index(pt_level,=
 load_start);
> > =C2=A0
> > -=C2=A0=C2=A0=C2=A0 switch_stack_and_jump((unsigned long)cpu0_boot_stac=
k +
> > STACK_SIZE,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 cont_after_mmu_is_enabled);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( virt_indx !=3D indx )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgt=
bl[indx].pte =3D 0;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loa=
d_start +=3D XEN_PT_LEVEL_SIZE(pt_level);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pgt=
bl =3D=C2=A0 (pte_t
> > *)LOAD_TO_LINK(pte_to_paddr(pgtbl[indx]));
>=20
> Nit: Stray double blank.
Thanks.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pt_=
level--;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rem=
ove_identity_mapping();
>=20
> Don't you need to restore pgtbl and pt_level here before the loop
> can continue? And because of depending on load_start, which would
> have moved, xen_size also needs suitably reducing, I think. Plus
> pte_nums as well, since that in turn was calculated from xen_size.
I forgot to restore pgtbl and pt_level because initially I used a
function arguments to pass that information so it wasn't needed to
restore them.

Regarding xen_size and pte_nums it looks like it is needed to init only
once on each page table level.
For example we have the following situation:
  ----------------------
   non-identity-mapping
   identity-mapping
  ---------------------- C
   identity-mapping
  ---------------------- B
   identity-mapping
  ---------------------- A
So we calculated that we need to remove 3 ptes, for first two ptes ( as
only identity mapping is there) are removed without any issue, then
move load_addr to C and run recursion
for the pte 'C' to go to next page table level.
At new level we are calculating how many ptes are needed to be removed
and remove only necessary amount of ptes.
When we will back to prev page table level pte_num will be 1 then we
will go to the head of the cycle, decrease pte_num to 0 and exit.

The same is with the case when non-idenitity-mapping is lower than
identity mapping ( but it looks like it is not a case becase
XEN_VIRT_START addr is the highest address by its defintion. Probably
it is needed to add a check ):
we know that pte_num =3D 3 at some level. Then we go to the next level
and remove there only identity map ptes, back to previous level,
decrease pte_num to 2 and remove only 2 remaining ptes.

~ Oleksii


