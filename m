Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3142A759343
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 12:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565760.884230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM4ap-0007HR-0A; Wed, 19 Jul 2023 10:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565760.884230; Wed, 19 Jul 2023 10:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM4ao-0007EG-SX; Wed, 19 Jul 2023 10:39:38 +0000
Received: by outflank-mailman (input) for mailman id 565760;
 Wed, 19 Jul 2023 10:39:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sL7T=DF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qM4am-0007Dg-I3
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 10:39:36 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d30ee89-2620-11ee-8611-37d641c3527e;
 Wed, 19 Jul 2023 12:39:34 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fb863edcb6so11382738e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 03:39:34 -0700 (PDT)
Received: from [192.168.201.189] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 f25-20020ac251b9000000b004eb0c51780bsm897751lfk.29.2023.07.19.03.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 03:39:33 -0700 (PDT)
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
X-Inumbo-ID: 8d30ee89-2620-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689763174; x=1692355174;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=222jWkyHz8jH/hwrUjdVRK8EWWdHDOdhgdSin3Xrbuk=;
        b=lTT0MvQNPvsV5aH2B+WpoRB4p7t4oMttz7SULWe6UTHVox3m/sLWzj9Q5mJre4vPKC
         2W0Zu2U2FJwypiERqX4qX7pQhp+PvENUfXSqeFMf9Hj/dPQgjhlDIEJ+WSUOGrTw0l8k
         HAivetGr1T04okD7KAtzzRPOJAX1LIDAcs5Zg9CCgFOFgRc8+Bc7ipreC7oa+4GSzAw3
         MB0XCWesGNeAdnsL0KxVgDQ3Ryi0xVW55gNJiNodQ02i/oorkVpBxST586YwWlb+bm0T
         mVmAdfFpMvVy6JCHBJm+0Xjv325z3PgzBJGY3ZqeWVTcBnDxaq2Rncqz/nDmUrlUSb/J
         ieWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689763174; x=1692355174;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=222jWkyHz8jH/hwrUjdVRK8EWWdHDOdhgdSin3Xrbuk=;
        b=KU+DnTQlwEYZ/rmMxCgDvSmtoKcXHmx8QsVAMj/R8V2P23tSxZgqJu3b9gQx2Qk/p3
         DtGHBxWdHnXb2OcpZgAhvj/plegBeEB/PwNHlWoCRe+qzMfhIdH1E608TH6F7XcN7KbR
         SeGA0+Rjz8r5vTr8MMdRkn9YAP9B9PzbmWCOITUEJfInONM/au4YEWgfF2gFQZMBFTyj
         0pSRpOm1LQF0peohlQkFHe0GxANQ0sOIGCmqKHn1F/a9O7Ea7Kl38dGNaSyqXqNCRyEF
         WKIx7GhOBhUO/oyT08RYtq2ZbLxtvsfg+npHSFMhi/OvCMv7Bx8kmwzdvgQCRJ9bciMo
         lRbg==
X-Gm-Message-State: ABy/qLaiBD7mQXsk17M51s7AefO1qfH6MhgX/fODYT67qwdN+VsG86ZX
	3SNc2llH2D8ZqBlSsCMUsNE=
X-Google-Smtp-Source: APBJJlE9aGLvXPfg91bSqn080WxMj62hS5hvm8sGeuRvrtA2K3Sp4vAszgpoBXXbo5lUfKn+RBcbeQ==
X-Received: by 2002:a19:7712:0:b0:4f9:5ca5:f1a6 with SMTP id s18-20020a197712000000b004f95ca5f1a6mr3457172lfc.17.1689763173755;
        Wed, 19 Jul 2023 03:39:33 -0700 (PDT)
Message-ID: <dbb568a33691b1fed5cb7f8de801a87e4aebbe4d.camel@gmail.com>
Subject: Re: [PATCH v3 3/3] xen/riscv: introduce identity mapping
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Bob Eshleman
	 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Wed, 19 Jul 2023 13:39:32 +0300
In-Reply-To: <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
	 <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
	 <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-07-18 at 17:03 +0200, Jan Beulich wrote:
> On 17.07.2023 16:40, Oleksii Kurochko wrote:
> > The way how switch to virtual address was implemented in the
> > commit e66003e7be ("xen/riscv: introduce setup_initial_pages")
> > isn't safe enough as:
> > * enable_mmu() depends on hooking all exceptions
> > =C2=A0 and pagefault.
> > * Any exception other than pagefault, or not taking a pagefault
> > =C2=A0 causes it to malfunction, which means you will fail to boot
> > =C2=A0 depending on where Xen was loaded into memory.
> >=20
> > Instead of the proposed way of switching to virtual addresses was
> > decided to use identity mapping of the entrire Xen and after
> > switching to virtual addresses identity mapping is removed from
> > page-tables.
> > Since it is not easy to keep track where the identity map was
> > mapped,
> > so we will look for the top-most entry exclusive to the identity
> > map and remove it.
>=20
> Doesn't this paragraph need adjustment now?
It should be. Thanks. Ill update it in the next patch version.

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
>=20
> Like said to Shawn for PPC in [1], there's now a pretty easy way to
> get this macro available for use here without needing to include
> xen/lib.h.
>=20
> [1]
> https://lists.xen.org/archives/html/xen-devel/2023-07/msg01081.html
Great. It'll be very useful for me so I'll add dependency on the patch
where ARRAY_SIZE and ROUNDUP are moved to <xen/macros.h>.

>=20
> > @@ -35,8 +41,10 @@ unsigned long __ro_after_init phys_offset;
> > =C2=A0 *
> > =C2=A0 * It might be needed one more page table in case when Xen load
> > address
> > =C2=A0 * isn't 2 MB aligned.
> > + *
> > + * CONFIG_PAGING_LEVELS page tables are needed for identity
> > mapping.
> > =C2=A0 */
> > -#define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS - 1) + 1)
> > +#define PGTBL_INITIAL_COUNT (CONFIG_PAGING_LEVELS * 2 + 1)
>=20
> Where did the "- 1" go?
My fault. Should be:
  #define PGTBL_INITIAL_COUNT ((CONFIG_PAGING_LEVELS * 2  - 1) + 1)

>=20
> > @@ -255,25 +266,40 @@ void __init noreturn noinline enable_mmu()
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
> > +=C2=A0=C2=A0=C2=A0 unsigned long load_start =3D LINK_TO_LOAD(_start);
> > +
> > +=C2=A0=C2=A0=C2=A0 for ( pgtbl =3D stage1_pgtbl_root, i =3D CONFIG_PAG=
ING_LEVELS; i;
> > i-- )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 index =3D pt_index(i - 1, l=
oad_start);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen_index =3D pt_index(i - =
1, XEN_VIRT_START);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( index !=3D xen_index )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
remove after it will be possible to include
> > <xen/lib.h> */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #de=
fine ROUNDUP(x, a) (((x) + (a) - 1) & ~((a) - 1))
>=20
> ROUNDUP() is even part of the patch that I've submitted already.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long load_end =3D LINK_TO_LOAD(_end);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long pt_level_size =3D XEN_PT_LEVEL_SIZE(i -
> > 1);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long xen_size =3D ROUNDUP(load_end -
> > load_start, pt_level_size);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uns=
igned long page_entries_num =3D xen_size /
> > pt_level_size;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 whi=
le ( page_entries_num-- )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 pgtbl[index++].pte =3D 0;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bre=
ak;
>=20
> Unless there's a "not crossing a 2Mb boundary" guarantee somewhere
> that I've missed, this "break" is still too early afaict.
You are right. I have to re-write this part again.
Thanks.

~ Oleksii

