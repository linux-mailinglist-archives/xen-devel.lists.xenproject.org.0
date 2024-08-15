Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F9D952D5D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 13:22:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778012.1188089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seYXb-0008Bl-CE; Thu, 15 Aug 2024 11:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778012.1188089; Thu, 15 Aug 2024 11:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seYXb-00089p-8j; Thu, 15 Aug 2024 11:21:15 +0000
Received: by outflank-mailman (input) for mailman id 778012;
 Thu, 15 Aug 2024 11:21:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qQtD=PO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1seYXZ-00089j-37
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 11:21:13 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a03bb8e-5af8-11ef-a505-bb4a2ccca743;
 Thu, 15 Aug 2024 13:21:11 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-52f01613acbso2213462e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 04:21:11 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5330d3b97c2sm171710e87.117.2024.08.15.04.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2024 04:21:10 -0700 (PDT)
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
X-Inumbo-ID: 7a03bb8e-5af8-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723720871; x=1724325671; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j3uagsZLL9tvmC9Eh57RDKrml1Wp1q97m4stz+UKhis=;
        b=JrmOl9i2U/XokA5SUkWFY+089v9KSUHi+9kSjtQNkllMNm4ttp4W503Af5dlLKp7RE
         kuxoIxpJJsr5NHpDLgw1dfSNmzMMuV0UKNSZY3p5ufCnXpnHb6cYNExsXu2F1R5yEPXx
         fxprk3l+R80d47BZmlxb5OXSc86/9/aSb+lOboZV/eHAdC/Ob0j1DCGm5ejlAt30BLJK
         00RnXPtCvYDtVIvH2R8pKWZ3wzq3++F9T70N3DZ+T9Vad/9zs/+b1e9FyjONkvAYCZHB
         ustJzhAV/RHNRS56bL8W0kg5PtzNx61DQiJ0rVGdawDMTEXxNurwPsDit2BtqFbHugaf
         Rayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723720871; x=1724325671;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3uagsZLL9tvmC9Eh57RDKrml1Wp1q97m4stz+UKhis=;
        b=RjglI5Kb/UcQ9LqxkEORGHCqRTBWFZNcUXNNejvMX/+Lxwjd1mTNdc2tl6aPalzKfu
         Lmg03PlX08HBi0JIfUOpsb9EP0uiQoFAmcYQaiBXf0WiKpEVbCw+3JEKQZ2BS4PEuapl
         UcMuKcG5tZLxWNqNheNH8mUemX6Ce2GtNX2o1tK1tKoPd/IXdMe0FwcGTXT1m+JHKQOp
         f26Fqf7NCPWDULtIYJx22stJ16ZD6KfSpOjEeoHljn21oUwBUUIak2B1vi5fM5UBrMpp
         hr6a6dDfaL2eG1OBTsbQtQbjCn0cD/phUq1QLkVxr8whcCS+3Ypp/ffwA63Oo0DMR9Xj
         Q6vg==
X-Forwarded-Encrypted: i=1; AJvYcCUl5J3Zp9uXmrG++hJL4nvMS0F0XlvTaJiQK4y8AfL76AgaIEg3+ySnObXKAE9PhnBcZaY3/OfxUniaHW8dRqPFTaRl4aXfprk+Du7XiL4=
X-Gm-Message-State: AOJu0Yy6KgoJMKl3D2R3qA0MU9OKwH0Qxup/OyeiKS7b4UUoHI8qLg0B
	ho42GNRbCQXuP8zFJlJKG7ZIFly9nRGULA5AhpyHNjnwSZkwXejd
X-Google-Smtp-Source: AGHT+IG2N6JQbyC7QdSRAaK/f6XNRX4CcwORpC/t7qt1W20hEyMIgGnQKqCb8boLWpvz/RmDmCQIvw==
X-Received: by 2002:a05:6512:3056:b0:52f:260:c459 with SMTP id 2adb3069b0e04-533080910c3mr656347e87.22.1723720870574;
        Thu, 15 Aug 2024 04:21:10 -0700 (PDT)
Message-ID: <be47249638cbae5e057279acd9a3464c218fbac8.camel@gmail.com>
Subject: Re: [PATCH v4 6/7] xen/riscv: page table handling
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2024 13:21:09 +0200
In-Reply-To: <d41f3027-14c8-4716-9444-d8bc109bb2b7@suse.com>
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
	 <8362795280a48702bef6f01d41d148edcf299935.1723214540.git.oleksii.kurochko@gmail.com>
	 <85a4e760-07af-42bd-ac27-12a4fa5172cc@suse.com>
	 <1e83981cff0b6c47aa941e7ffee0ce658aefef22.camel@gmail.com>
	 <d41f3027-14c8-4716-9444-d8bc109bb2b7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Thu, 2024-08-15 at 10:09 +0200, Jan Beulich wrote:
> On 14.08.2024 18:50, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-08-13 at 12:31 +0200, Jan Beulich wrote:
> > > On 09.08.2024 18:19, Oleksii Kurochko wrote:
> > > > Introduce internal macros starting with PTE_* for convenience.
> > > > These macros closely resemble PTE bits, with the exception of
> > > > PTE_BLOCK, which indicates that a page larger than 4KB is
> > > > needed.
> > >=20
> > > I did comment on this too, iirc: Is there going to be any case
> > > where
> > > large pages are going to be "needed", i.e. not just preferred? If
> > > not,
> > > giving the caller control over things the other way around
> > > (requesting
> > > 4k mappings are needed, as we have it in x86) may be preferable.
> > Yes, you did the comment but I thought that it will be enough to
> > mention that shattering isn't supported now and=C2=A0 also since
> > pt_update_entry()is used to unmap as well, there could be a need to
> > unmap e.g. 4K page from 2M block mapping what will a little bit
> > harder
> > then just having 4k by default.
>=20
> Shattering isn't supported now, but that's going to change at some
> point,
> I suppose. Where possible the long-term behavior wants taking into
> account
> right away, to avoid having to e.g. touch all callers again later on.
Arm still leaves without shattering support for Xen pages:
https://gitlab.com/xen-project/xen/-/blob/staging/xen/arch/arm/mmu/pt.c?ref=
_type=3Dheads#L454

So it can be pretty long-term behaviour.

>=20
> > > Hmm, but then ...
> > >=20
> > > > RISC-V detects superpages using `pte.x` and `pte.r`, as there
> > > > is no specific bit in the PTE for this purpose. From the RISC-V
> > > > spec:
> > > > ```
> > > > =C2=A0 ...
> > > > =C2=A0 4. Otherwise, the PTE is valid. If pte.r =3D 1 or pte.x =3D =
1, go
> > > > to
> > > > step 5.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 Otherwise, this PTE is a pointer to the ne=
xt level of the
> > > > page
> > > > table.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 ... .
> > > > =C2=A0 5. A leaf PTE has been found.
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 ...
> > > > =C2=A0 ...
> > > > ```
> > > >=20
> > > > The code doesn=E2=80=99t support super page shattering so 4KB pages=
 are
> > > > used as
> > > > default.
> > >=20
> > > ... you have this. Yet still callers expecting re-mapping in the
> > > (large)
> > > range they map can request small-page mappings right away.
> > I am not sure that I fully understand what do you mean by "expcting
> > re-
> > mapping".
>=20
> Right now you have callers pass PTE_BLOCK when they know that no
> small
> page re-mappings are going to occur for an area. What I'm suggesting
> is
> that you invert this logic: Have callers pass PTE_SMALL when there is
> a possibility that re-mapping requests may be issued later. Then,
> later, by simply grep-ing for PTE_SMALL you'll be able to easily find
> all candidates that possibly can be relaxed when super-page
> shattering
> starts being supported. That's going to be easier than finding all
> instances where PTE_BLOCK is _not_used.
So if I understand correctly. Actually nothing will change in algorithm
of pt_update() and only PTE_SMALL should be introduced instead of
PTE_BLOCK. And if I will know that something will be better to map as
PTE_SMALL to not face shattering in case of unmap (for example) I just
can map this memory as PTE_SMALL and that is it?

> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/pt.c
> > > > @@ -0,0 +1,408 @@
> > > > +#include <xen/bug.h>
> > > > +#include <xen/domain_page.h>
> > > > +#include <xen/errno.h>
> > > > +#include <xen/mm.h>
> > > > +#include <xen/mm-frame.h>
> > > > +#include <xen/pmap.h>
> > > > +#include <xen/spinlock.h>
> > > > +
> > > > +#include <asm/flushtlb.h>
> > > > +#include <asm/page.h>
> > > > +
> > > > +static inline const mfn_t get_root_page(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long root_maddr =3D
> > >=20
> > > maddr_t or paddr_t?
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (csr_read(CSR_SATP) & S=
ATP_PPN_MASK) << PAGE_SHIFT;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return maddr_to_mfn(root_maddr);
> > > > +}
> > > > +
> > > > +/*
> > > > + * Sanity check of the entry
> > > > + * mfn is not valid and we are not populating page table. This
> > > > means
> > >=20
> > > How does this fit with ...
> > >=20
> > > > + * we either modify entry or remove an entry.
> > > > + */
> > > > +static bool pt_check_entry(pte_t entry, mfn_t mfn, unsigned
> > > > int
> > > > flags)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 /* Sanity check when modifying an entry. */
> > > > +=C2=A0=C2=A0=C2=A0 if ( (flags & PTE_VALID) && mfn_eq(mfn, INVALID=
_MFN) )
> > >=20
> > > ... the MFN check here?
> > The comment is incorrect and should be corrected:
> > " if mfn is valid or ... "
> >=20
> > > =C2=A0And why is (valid,INVALID_MFN) an indication
> > > of a modification? But then ...
> > the explanation is in the comment to pt_update():
> > =C2=A0=C2=A0 /*
> > =C2=A0=C2=A0=C2=A0 * If `mfn` equals `INVALID_MFN`, it indicates that t=
he
> > following page
> > =C2=A0=C2=A0 table
> > =C2=A0=C2=A0=C2=A0 * update operation might be related to either popula=
ting the
> > table,
> > =C2=A0=C2=A0=C2=A0 * destroying a mapping, or modifying an existing map=
ping.
> > =C2=A0=C2=A0=C2=A0 */
> > =C2=A0=C2=A0 static int pt_update(unsigned long virt,
>=20
> And how do readers know that comments in pt_update() are crucial for
> understanding what pt_check_entry() does? You certainly don't need to
> have the same comment in two places, but you at least want to refer
> to a relevant comment when that lives elsewhere.
Sure, I will update the comment in pt_check_entry() properly if this
function still makes any sense.

>=20
> > > > +static int pt_update(unsigned long virt,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t mfn,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfn=
s,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 int rc =3D 0;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long vfn =3D virt >> PAGE_SHIFT;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long left =3D nr_mfns;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 const mfn_t root =3D get_root_page();
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * It is bad idea to have mapping both wri=
teable and
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * executable.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * When modifying/creating mapping (i.e PT=
E_VALID is set),
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * prevent any update if this happen.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 if ( (flags & PTE_VALID) && PTE_W_MASK(flags) &=
&
> > > > PTE_X_MASK(flags) )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Mappings should=
 not be both Writeable and
> > > > Executable.\n");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( !IS_ALIGNED(virt, PAGE_SIZE) )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("The virtual add=
ress is not aligned to the
> > > > page-
> > > > size.\n");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 spin_lock(&xen_pt_lock);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 while ( left )
> > > > +=C2=A0=C2=A0=C2=A0 {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int order, lev=
el;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 level =3D pt_mapping_le=
vel(vfn, mfn, left, flags);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 order =3D XEN_PT_LEVEL_=
ORDER(level);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(left >=3D BIT(or=
der, UL));
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D pt_update_entry(=
root, vfn << PAGE_SHIFT, mfn,
> > > > level,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags=
);
> > >=20
> > > Indentation.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 break;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vfn +=3D 1U << order;
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( !mfn_eq(mfn, INVAL=
ID_MFN) )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 mfn =3D mfn_add(mfn, 1U << order);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 left -=3D (1U << order)=
;
> > >=20
> > > To be on thje safe side, 1UL everywhere?
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 break;
> > >=20
> > > There was such a check already a few lines up from here.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /* ensure that PTEs are all updated before flus=
hing */
> > >=20
> > > Again: No double blank lines please.
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 RISCV_FENCE(rw, rw);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * always flush TLB at the end of the func=
tion as non-
> > > > present
> > > > entries
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * can be put in the TLB
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 flush_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
> > >=20
> > > Coming back to "negative" TLB entries: Assuming RISC-V, just like
> > > other
> > > architectures, also permits intermediate page table entries to be
> > > cached,
> > > the affected VA range may be much larger than the original
> > > request,
> > > if
> > > intermediate page tables needed creating.
> > It could be an issue. Could we some how=C2=A0 to calculate the proper
> > range
> > or the only option we have is to flush all.
>=20
> Right - either you maintain state to know the biggest possible range
> that can be affected, or you flush all when a new intermediate page
> table needed inserting.
I think that the second one option will be easier to implement in the
current implementation. It is not issue for now as fixmap, fdt and xen
are in the same slot so no new intermediate page tables are needed.

>=20
> > > > +=C2=A0=C2=A0=C2=A0 spin_unlock(&xen_pt_lock);
> > >=20
> > > Does this really need to come after fence and flush?
> > I think yes, as page table should be updated only by 1 CPU at the
> > same
> > time. And before give ability to other CPU to update page table we
> > have
> > to finish a work on current CPU.
>=20
> Can you then explain to me, perhaps by way of an example, what will
> go
> wrong if the unlock is ahead of the flush? (I'm less certain about
> the
> fence, and that's also less expensive.)
pt_update() will be called for interleaved region, for example, by
different CPUs:

                     pt_update():
CPU1:                                    CPU2:
 ...                                spin_lock(&xen_pt_lock);
RISCV_FENCE(rw, rw);                 ....

/* After this function will be
   executed the following thing
   can happen ------------------>  start to update page table
*/                                 entries which was partially     =20
spin_unlock(&xen_pt_lock);         created during CPU1 but CPU2      =20
....                               doesn't know about them yet       =20
....                               because flush_tlb() ( sfence.vma )=20
....                               wasn't done     =C2=A0
....                                                                 =20
flush_tlb_range_va();

And it can be an issue if I understand correctly.
>=20
> > > > +int map_pages_to_xen(unsigned long virt,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mfn_t mfn,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long nr_mfn=
s,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int flags)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Ensure that we have a valid MFN before =
proceeding.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * If the MFN is invalid, pt_update() migh=
t misinterpret
> > > > the
> > > > operation,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * treating it as either a population, a m=
apping
> > > > destruction,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * or a mapping modification.
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 ASSERT(!mfn_eq(mfn, INVALID_MFN));
> > >=20
> > > But flags with PTE_VALID not set are fine to come into here?
> > It is fine for pt_update() but I don't know if it is fine for
> > map_pages_to_xen(). I see that other architectures don't check
> > that.
>=20
> That's not my point here. It's rather along the lines of an earlier
> that I gave here: Since pte_update() is a pretty generic function,
> will
> flags not having PTE_VALID set perhaps result in pte_update() doing
> something that's not what the caller might expect?
I think that everything will be okay, if PTE_VALID is set then it means
that pt_update() should update ( modify/remove/insert ) page table
entry and all the cases which isn't expected by the logic should be
covered by pt_check_entry().

and the case if when page table couldn't be mapped:
```
           rc =3D pt_next_level(alloc_only, &table, offsets[level]);
           if ( rc =3D=3D XEN_TABLE_MAP_FAILED )
           {
               rc =3D 0;
  =20
               /*
                * We are here because pt_next_level has failed to map
                * the intermediate page table (e.g the table does not
   exist
                * and the pt is read-only). It is a valid case when
                * removing a mapping as it may not exist in the page
   table.
                * In this case, just ignore it.
                */
               if ( flags & PTE_VALID )
               {
                   printk("%s: Unable to map level %u\n", __func__,
   level);
                   rc =3D -ENOENT;
               }
```
>=20
> And yes, there's a special case of map_pages_to_xen() being called
> with
> _PAGE_NONE (if an arch defines such). That special case plays into
> here:
> If an arch doesn't define it, unmap requests ought to exclusively
> come
> through destroy_xen_mappings().
I thought that it should always done through destroy_xen_mappings().

Arm doesn't introduce _PAGE_NONE and pt_update() is based on Arm's
version of xen_pt_update() so this special case should be covered
properly.

And it seems to me (if I am not confusing something ) that if it is
necessary to unmap pages mapped by map_pages_to_xen() they are using
destroy_xen_mappings() which is defined using xen_pt_update():
   int modify_xen_mappings(unsigned long s, unsigned long e, unsigned
   int nf)
   {
       ASSERT(IS_ALIGNED(s, PAGE_SIZE));
       ASSERT(IS_ALIGNED(e, PAGE_SIZE));
       ASSERT(s <=3D e);
       return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, nf);
   }

~ Oleksii

