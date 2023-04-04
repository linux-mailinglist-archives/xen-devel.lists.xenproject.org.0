Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C95C86D68C7
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:27:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518066.804222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjUu-00030W-Nt; Tue, 04 Apr 2023 16:27:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518066.804222; Tue, 04 Apr 2023 16:27:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjUu-0002xS-Km; Tue, 04 Apr 2023 16:27:04 +0000
Received: by outflank-mailman (input) for mailman id 518066;
 Tue, 04 Apr 2023 16:27:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcaL=73=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pjjUt-0002xK-2n
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 16:27:03 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86249a4d-d305-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 18:26:59 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id br6so43025676lfb.11
 for <xen-devel@lists.xenproject.org>; Tue, 04 Apr 2023 09:26:59 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 w7-20020ac25987000000b004d5786b7299sm2393695lfn.5.2023.04.04.09.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 09:26:58 -0700 (PDT)
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
X-Inumbo-ID: 86249a4d-d305-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680625619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OmE3+4mkKRClmf97yq5669zSeIG+gT8wURrmTIS+7sg=;
        b=OSFBnMwyzxDpJUp2dHCeg7rzHTOaTjujj/6I42VEd9kOWuiWeXIzI5qCdpWtSZZ8b0
         D8jBXn+kbirgwJMhnaibRRJusCs2ifhQb6V6enzIsDxiZUBUfglbSqICznk5OGEBq6k8
         qA0Y7YP2VjIUyDu6fOaz7fi/IfPbO+/+KpUOu/mv/ELS4octetJr+yHrmU6nmHPwmhP4
         ZA3Slvz9K2IPtPfozOH+qbdqGgXfOikvjhNFnVwKXr8zIE8JUZadWUkKTZcA3VJu5pBG
         O2oM1b5z2dRvroZgtXT9YP5kO4i6ob2siBbA9pDbaBO5Box7j3VxK+RCeeSS/3AjDB6v
         igHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680625619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmE3+4mkKRClmf97yq5669zSeIG+gT8wURrmTIS+7sg=;
        b=UZO06bw78qzTBMzceL1nL1bQLc1sl5jQYg8sOSMEzBuSzp/bPD/h6iLY1naDyWjDon
         Ot773JOUY05I/jeHNY8VP2l1bIzgzu8Jy3uu5aGfJqnWnFIPc35f5Cs5zLoKZyRolGBz
         JhDlIysiPic4gusoE4sbUM9x3IM1H9pI9m5t5lV5fF3S9VXQfXJvgk5hJ7ExgDD1WuzX
         0ogR+gPe6LDZm1VW27JFCesShQmgkfRCGp3V7LUW2c2JrztjB2XKEeVI+S0V+Ph/uSzI
         OR854AWB9CfkTEGLeCuPt2YG5Im4AB/NfTEh/vWbjh2fCEn/4WtS093HrF8kuQ7BkyX6
         tg7A==
X-Gm-Message-State: AAQBX9cxyqo0M+2RdF79E81iFjG3vU+trLlE/gbLlYSJrhTVDKDXCT/V
	hbdCjpxJvfGfCMwUmrt1/CU=
X-Google-Smtp-Source: AKy350Y7stklTXPa+K/oV7wrJeU6Tm1Gp8FOdgiWdJxinC8a8+cNvUU/yYakY30v/7Enn+G90YTRHQ==
X-Received: by 2002:ac2:4823:0:b0:4eb:edf:fb5e with SMTP id 3-20020ac24823000000b004eb0edffb5emr863032lft.44.1680625618897;
        Tue, 04 Apr 2023 09:26:58 -0700 (PDT)
Message-ID: <d2c63b45e269fb7442486e33592e03f55c9c2d6e.camel@gmail.com>
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Tue, 04 Apr 2023 19:26:58 +0300
In-Reply-To: <621425bb-03ad-1a5b-f53f-553eeefebf44@suse.com>
References: <cover.1679934166.git.oleksii.kurochko@gmail.com>
	 <93da6ba381604748e2c71e2ebd35e80798ec4bb2.1679934166.git.oleksii.kurochko@gmail.com>
	 <0a16b79e-8292-6947-24d4-dd027113943f@suse.com>
	 <f83cf0373bdcf31d6d273d53949cb81f54f74d5a.camel@gmail.com>
	 <621425bb-03ad-1a5b-f53f-553eeefebf44@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

Hi Julien,

On Wed, 2023-03-29 at 14:06 +0200, Jan Beulich wrote:
> > > > +void __init setup_initial_pagetables(void)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct mmu_desc mmu_desc =3D { 0, 0, NULL, 0 };
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /*
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * Access to _{stard, end } is always PC-r=
elative
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * thereby when access them we will get lo=
ad adresses
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * of start and end of Xen
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * To get linker addresses LOAD_TO_LINK() =
is required
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 * to use
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long load_start=C2=A0=C2=A0=C2=A0 =3D =
(unsigned long)_start;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long load_end=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 =3D (unsigned long)_end;
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long linker_start=C2=A0 =3D LOAD_TO_LI=
NK(load_start);
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long linker_end=C2=A0=C2=A0=C2=A0 =3D =
LOAD_TO_LINK(load_end);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if ( (linker_start !=3D load_start) &&
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (linker_start <=
=3D load_end) && (load_start <=3D
> > > > linker_end)
> > > > ) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 early_printk("(XEN) lin=
ker and load address ranges
> > > > overlap\n");
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 die();
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 calc_pgtbl_lvls_num(&mmu_desc);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 mmu_desc.pgtbl_base =3D stage1_pgtbl_root;
> > > > +=C2=A0=C2=A0=C2=A0 mmu_desc.next_pgtbl =3D stage1_pgtbl_nonroot;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 setup_initial_mapping(&mmu_desc,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 linker_start,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 linker_end,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 load_start,
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 PTE_LEAF_DEFAULT);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 setup_ptes_permission(&mmu_desc);
> > >=20
> > > ...: Why does this require a 2nd pass / function in the first
> > > place?
> > Probably I misunderstood Julien and it setup_pte_permission can be
> > done
> > in setup_initial_mapping() but here is the reply:
> > https://lore.kernel.org/xen-devel/79e83610-5980-d9b5-7994-6b0cb2b9049a@=
xen.org/
>=20
> Hmm, yes, his option 2 looks like what you've implemented. Still I
> don't see why the permissions can't be got right on the first pass.
I would like to ask you again about separation of mapping Xen and
setting permission for specific sections.

I am not using setup_initial_mapping to change permission flags as it
was before so do we still need to do two passes? Can't we set
permission during the first pass?

It looks like there is a sense in merging setup_initial_mapping() and
setup_ptes_permission().

Probably I misunderstood your opinion from the link above.

~ Oleksii

