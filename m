Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844EB6D07DB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 16:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516750.801375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pht4A-0000G1-5G; Thu, 30 Mar 2023 14:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516750.801375; Thu, 30 Mar 2023 14:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pht4A-0000E8-2M; Thu, 30 Mar 2023 14:15:50 +0000
Received: by outflank-mailman (input) for mailman id 516750;
 Thu, 30 Mar 2023 14:15:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+wKg=7W=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pht49-0000E2-5r
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 14:15:49 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e2620c1-cf05-11ed-85db-49a42c6b2330;
 Thu, 30 Mar 2023 16:15:48 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id j11so24683993lfg.13
 for <xen-devel@lists.xenproject.org>; Thu, 30 Mar 2023 07:15:48 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a056512377100b004e8373b2bfcsm5893447lft.176.2023.03.30.07.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 07:15:47 -0700 (PDT)
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
X-Inumbo-ID: 5e2620c1-cf05-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680185747;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x8J+C50Gx9N8RiRxl2TNTDmWAh8ayiOOaz/OM0NNRRs=;
        b=D/ap/V2fa08cVTNI4gnxMoQfsB+D4GA+5ovbTi/c5tkmxnEKeXPRnvSJntbEM+Y2+l
         nnXpiDIyde3AUrGdgzKezvTRbh/+ZshhJNdXralPlwIxoae4CZadxaVzaF+BlNpUUzFO
         03bhFCKGC7Huxb8V4Cv7YPaa8ETilaXnI1BYEp0meP/5uABNQHpLoeS4JIcoOk2iTx6k
         PS7B5yUPWzJDuWQCYcqkMKeNEBDyx280RRK7Fgcc5sMUZacbGpiDyW2/O43aR+U0FNra
         EgFthDi0pOguBwwNp5NOm5/9s2PV2bYNHqRejc64JIqMOOwqcLRXgZPDGX5vfQcJ+4dd
         C/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185747;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x8J+C50Gx9N8RiRxl2TNTDmWAh8ayiOOaz/OM0NNRRs=;
        b=ef/1zaQVLV9TO9hdDd2strk57FsTjmVVfhiUzO/51iBDvL4Lhgv9O0fflfg5ZRvKMN
         yyJUYLjJhv/KuP9q5GuxeGVErolHmFJ72DQu3S1zGJNc25ooQCMi/tffUIxKU9ldGPaE
         q2HYTIKg3CFw3YHLVTPYfvSzkIBD8eI1C/+cM61xFa1TuBTubP67iFmKLNmRIiGlSjwq
         Bz9tljdJhLEhWKsO9DBGoMJGTcb3TqQ0nyXAGaQ5P7F/FZgHNDKSFjZhsspsNzLdoy1w
         VvO8NkwF0D2/irMuA6+qILQbYaeGctfbNpUNg2/xWGfu7Jd4t5rgZLLvGYi2F9jp2jML
         0wSA==
X-Gm-Message-State: AAQBX9fZh9yZoT377QQ9fySnTUqwNH0Z2m3iNRM7MdFuSntvuvY1RYVS
	hf+1nZpNrtBejmtXr8waXt0=
X-Google-Smtp-Source: AKy350an6njVXQeYw1ucmgFd0w+zZuWvXBlMcTC7M3VNcqmO0QVeoqkroAqhC1df8nJjRq1gJ4wkZg==
X-Received: by 2002:a19:7518:0:b0:4a4:68b9:19e7 with SMTP id y24-20020a197518000000b004a468b919e7mr7009449lfe.15.1680185747276;
        Thu, 30 Mar 2023 07:15:47 -0700 (PDT)
Message-ID: <66bc6fffbadf14212755b3cee806d43cfa843a0c.camel@gmail.com>
Subject: Re: [PATCH v3 1/3] xen/riscv: introduce setup_initial_pages
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>, 
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Date: Thu, 30 Mar 2023 17:15:46 +0300
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

On Wed, 2023-03-29 at 14:06 +0200, Jan Beulich wrote:
> On 29.03.2023 13:43, Oleksii wrote:
> > On Tue, 2023-03-28 at 17:34 +0200, Jan Beulich wrote:
> > > On 27.03.2023 19:17, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/mm.c
> > > > @@ -0,0 +1,277 @@
> > > > +#include <xen/init.h>
> > > > +#include <xen/kernel.h>
> > > > +
> > > > +#include <asm/early_printk.h>
> > > > +#include <asm/config.h>
> > > > +#include <asm/csr.h>
> > > > +#include <asm/mm.h>
> > > > +#include <asm/page.h>
> > > > +#include <asm/processor.h>
> > > > +
> > > > +#define PGTBL_INITIAL_COUNT 8
> > >=20
> > > What does this magic number derive from? (A comment may help.)
> > It can be now 4 tables as it is enough to map 2Mb. 8 it was when I
> > experimented with bigger sizes of Xen binary and verified that
> > logic of
> > working with page tables works.
>=20
> Since this is connected to Xen's image size as you say, I guess the
> constant wants to move to a header, and then be used in an assertion
> in xen.lds.S. That way one will become easily aware if/when this 2Mb
> assumption breaks.
then we can not be tied to 2MB but to:
ASSERT(_end - _start <=3D MB((PAGE_TABLE_INIT_COUNT - 2) * PAGE_SIZE),
"Xen too large for early-boot assumptions")

>=20
> > > > +struct mmu_desc {
> > > > +=C2=A0=C2=A0=C2=A0 unsigned long num_levels;
> > > > +=C2=A0=C2=A0=C2=A0 uint32_t pgtbl_count;
> > >=20
> > > Nit: Style (as before please avoid fixed width types when their
> > > use
> > > isn't really warranted; afaics unsigned int will do fine here and
> > > elsewhere below).
> > I will change it but I am not sure that I fully understand what is
> > an
> > issue with uint32_t.
>=20
> The issue is simply that ./CODING_STYLE says to prefer basic types
> whenever possible.
Thanks.

>=20
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

~ Oleksii

