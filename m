Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DBB761895
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 14:44:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569660.890540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHNT-0000qi-1l; Tue, 25 Jul 2023 12:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569660.890540; Tue, 25 Jul 2023 12:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOHNS-0000on-Uv; Tue, 25 Jul 2023 12:42:58 +0000
Received: by outflank-mailman (input) for mailman id 569660;
 Tue, 25 Jul 2023 12:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzC/=DL=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qOHNR-0000oh-Gl
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 12:42:57 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c79a17dc-2ae8-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 14:42:56 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-4fdd14c1fbfso8394116e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jul 2023 05:42:56 -0700 (PDT)
Received: from [192.168.202.116] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 j14-20020ac2550e000000b004fc863a0bf6sm2744707lfk.223.2023.07.25.05.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 05:42:55 -0700 (PDT)
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
X-Inumbo-ID: c79a17dc-2ae8-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690288976; x=1690893776;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AOH+pNKnr7Sxny4pULHZN2j0klw+6ma+TbLJC2RF++Q=;
        b=mVIs/Tm5D5cLMClLy/sV2jT0Zg9vER1e0UNT6gf1WEJuNmAuNK99u3fAED3O1v/mVZ
         dS0xyvX7fWgnyMdhLwKFTFeiUpQLrWsdOsTKmh643LwlNakAbBLKk0YiBsn0pDFWRXZP
         7gNt4bwEHdPrwBt48h+LdMVEuSQZJK/pT9uEq9FqiaiCkOSI0rTPO7zVLmJx6BNVZ+su
         h23w5D+rziQ7y61ACtSQhsLDkpQYpzhq6HICsd0G7WMtRfOHWSoL49v03BY+ZTBumgjj
         pQXU0O/WO3kflvp2HvoNaJyRZdiQgfn6YAlQnBYCO08XxBPlm5JC1Ps7+w/eDOVHWRC8
         f6QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690288976; x=1690893776;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AOH+pNKnr7Sxny4pULHZN2j0klw+6ma+TbLJC2RF++Q=;
        b=I/Y5/qaCbfJFal3AbnTTlRfqFKC1e89yBwiF5dkPRgBtOn6jjkxBE9/W+X+Ao4wTqa
         lkc1N9FuhDKJrTfSKZkutZgnLXkfJD5JkGSCjB3pZwa1+lJ+Ku4kOUhIAgU8Y6dNFIIS
         ng94xA5QBQwANtaAhkCx7HQ/xR+MmXH2c554uBIDo17e25xtG4KQ5jomT7kf5FJ4Vnp3
         a71MiKQfeZLOkk+c0d5lkPnXzJN05iQyqh5R3yuKQbvB//3hWvpXTX0rrahqqUX3YcPb
         Z2rJmK60kYPL5hg5TkWZQwAFRg0IJueZ8M7UpMLhkzw8lMVpwal/R5gpHfOZWV0t9AAR
         A0JQ==
X-Gm-Message-State: ABy/qLYuozl5Ajf1weVoBHDV1hNFeD8aenRNOVyyPhO9TW2mfrQm2TWd
	gNVF+UAaa5OGgfAQsKYDIwE=
X-Google-Smtp-Source: APBJJlEk7OenKovCVVmf8xfAGZLeX5pd8lXpr7ezYBb9uyE2dSCS5J9vK30c8w8ZKus1cBjoMiWqBQ==
X-Received: by 2002:a05:6512:2015:b0:4fd:fef7:95a5 with SMTP id a21-20020a056512201500b004fdfef795a5mr1785325lfb.11.1690288975667;
        Tue, 25 Jul 2023 05:42:55 -0700 (PDT)
Message-ID: <ef37e5f11a8a8f69f98c2069a8d71485a046b600.camel@gmail.com>
Subject: Re: [PATCH v4 2/2] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 25 Jul 2023 15:42:54 +0300
In-Reply-To: <d8aeb29b-1284-98bc-de75-3d5d8a825e1b@suse.com>
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
	 <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
	 <c32d8be8-75cf-78f8-304d-247b93b611cb@suse.com>
	 <dddc1effe5fc112f79a84e4f0a7ccf283877a466.camel@gmail.com>
	 <d8aeb29b-1284-98bc-de75-3d5d8a825e1b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-07-25 at 10:16 +0200, Jan Beulich wrote:
> On 24.07.2023 18:00, Oleksii wrote:
> > On Mon, 2023-07-24 at 16:11 +0200, Jan Beulich wrote:
> > > On 24.07.2023 11:42, Oleksii Kurochko wrote:
> > > > +void __init remove_identity_mapping(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 static pte_t *pgtbl =3D stage1_pgtbl_root;
> > > > +=C2=A0=C2=A0=C2=A0 static unsigned long load_start =3D XEN_VIRT_ST=
ART;
> > > > +=C2=A0=C2=A0=C2=A0 static unsigned int pt_level =3D CONFIG_PAGING_=
LEVELS - 1;
> > >=20
> > > These all want to be __initdata, but personally I find this way
> > > of
> > > recursing a little odd. Let's see what the maintainers say.
> > I'm not completely happy either. Initially I thought that it would
> > be
> > better to pass all this stuff as function's arguments.
> >=20
> > But then it is needed to provide an access to stage1_pgtbl_root (
> > get_root_pt() function ? ). So remove_identity_mapping() will be
> > called
> > as remove_identity_mapping(get_root_pt(), _start,
> > CONFIG_PAGING_LELVELS
> > -1 ) or remove_identity_mapping(NULL, _start, CONFIG_PAGING_LELVELS
> > -1
> > ) and then check if first argument is NULL then initialize it with
> > stage1_pgtbl_root.
> > Also I am not sure that an 'user' should provide all this
> > information
> > to such function.
> >=20
> > Could you recommend something better?
>=20
> Well, to avoid the mess you are describing I would consider making
> remove_identity_mapping() itself a thin wrapper around the actual
> function which then invokes itself recursively. That'll keep the
> top-level call site tidy, and all the technical details confined to
> the (then) two functions.
Thanks a lot for the recommendation.

>=20
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long load_end =3D LINK_TO_LOAD(_end);
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long xen_size;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long pt_level_size =3D XEN_PT_LEVEL_SI=
ZE(pt_level);
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long pte_nums;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long virt_indx =3D pt_index(pt_level,
> > > > XEN_VIRT_START);
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long indx;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( load_start =3D=3D XEN_VIRT_START )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 load_start =3D LINK_TO_=
LOAD(_start);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 xen_size =3D load_end - load_start;
> > >=20
> > > When you come here recursively, don't you need to limit this
> > > instance of the function to a single page table's worth of
> > > address
> > > space (at the given level), using load_end only if that's yet
> > > lower?
> > Do you mean a case when load_start > load_end? If yes then I missed
> > that.
>=20
> No, my concern is with the page table presently acted upon covering
> only a limited part of the address space. That "limited" is the full
> address space only for the top level table. You won't observe this
> though unless the Xen image crosses a 2Mb boundary. But if it does
> (and it may help if you arranged for big enough an image just for
> the purpose of debugging, simply by inserting enough dead code or
> data), and if all mappings are 4k ones, you'd run past the first L1
> table's worth of mappings on the first invocation of this function
> with a L1 table. (Of course hitting the condition may further
> require Xen and 1:1 mappings to be sufficiently close to one another,
> so that the zapping doesn't already occur at higher levels. But then
> the same situation could arise at higher levels when the image
> crosses a 1Gb or 512Gb boundary.)
In this case, all should be fine.

If we put identity and non-identity mapping as closely as possible.
I tested with the following input:
   XEN_VIRT_START =3D 0x80670000
   load start =3D 0x80200000
   Xen size =3D 4648960

So now pte on L2 level is shared, so we will go to L1, and calculate
the amount of pte nums on the L1 level. In the current one case, it is
3, so it will delete the first two L1's ptes ( as they have different
index from index of XEN_VIRT_START at L1 level so we are sure that
these ptes are used only for identity mapping and can be removed ),
move load_start +=3D 4 MB, and for the last one L1's ptes which is shared
with non-identity mapping it will go to L0 table, calculate a number of
ptes needed to be cleaned based on 'new' load start and page level ( it
is 0x6f in the current case ) to finish removing of identity mapping.

I added some prints inside:
    if ( virt_indx !=3D indx )
    { ....
And received the expected output I described above:
(level number) '-' means removed

(1) -
(1) -
(0) -
... 0x6f times
(0) -

>=20
> > > > +=C2=A0=C2=A0=C2=A0 pte_nums =3D ROUNDUP(xen_size, pt_level_size) /
> > > > pt_level_size;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 while ( pte_nums-- )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 indx =3D pt_index(pt_le=
vel, load_start);
> > > > =C2=A0
> > > > -=C2=A0=C2=A0=C2=A0 switch_stack_and_jump((unsigned long)cpu0_boot_=
stack +
> > > > STACK_SIZE,
> > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 cont_after_mmu_is_enabled);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( virt_indx !=3D ind=
x )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pgtbl[indx].pte =3D 0;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 load_start +=3D XEN_PT_LEVEL_SIZE(pt_level);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pgtbl =3D=C2=A0 (pte_t
> > > > *)LOAD_TO_LINK(pte_to_paddr(pgtbl[indx]));
> > >=20
> > > Nit: Stray double blank.
> > Thanks.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pt_level--;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 remove_identity_mapping();
> > >=20
> > > Don't you need to restore pgtbl and pt_level here before the loop
> > > can continue? And because of depending on load_start, which would
> > > have moved, xen_size also needs suitably reducing, I think. Plus
> > > pte_nums as well, since that in turn was calculated from
> > > xen_size.
> > I forgot to restore pgtbl and pt_level because initially I used a
> > function arguments to pass that information so it wasn't needed to
> > restore them.
> >=20
> > Regarding xen_size and pte_nums it looks like it is needed to init
> > only
> > once on each page table level.
> > For example we have the following situation:
> > =C2=A0 ----------------------
> > =C2=A0=C2=A0 non-identity-mapping
> > =C2=A0=C2=A0 identity-mapping
> > =C2=A0 ---------------------- C
> > =C2=A0=C2=A0 identity-mapping
> > =C2=A0 ---------------------- B
> > =C2=A0=C2=A0 identity-mapping
> > =C2=A0 ---------------------- A
> > So we calculated that we need to remove 3 ptes, for first two ptes
> > ( as
> > only identity mapping is there) are removed without any issue, then
> > move load_addr to C and run recursion
> > for the pte 'C' to go to next page table level.
> > At new level we are calculating how many ptes are needed to be
> > removed
> > and remove only necessary amount of ptes.
> > When we will back to prev page table level pte_num will be 1 then
> > we
> > will go to the head of the cycle, decrease pte_num to 0 and exit.
>=20
> I think I agree that this case is okay.
>=20
> > The same is with the case when non-idenitity-mapping is lower than
> > identity mapping ( but it looks like it is not a case becase
> > XEN_VIRT_START addr is the highest address by its defintion.
> > Probably
> > it is needed to add a check ):
>=20
> And it looks like this case being impossible is what voids my
> respective
> remark. (Might be worth adding a comment to this effect.)
I'll add a comment in remove_identity_function().

~ Oleksii

