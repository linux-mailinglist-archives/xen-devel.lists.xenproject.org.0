Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DC93A19C
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 15:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763195.1173449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFf3-0002KU-1U; Tue, 23 Jul 2024 13:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763195.1173449; Tue, 23 Jul 2024 13:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWFf2-0002Ie-U6; Tue, 23 Jul 2024 13:34:36 +0000
Received: by outflank-mailman (input) for mailman id 763195;
 Tue, 23 Jul 2024 13:34:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWFf2-0002CL-6W
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 13:34:36 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d22adbf-48f8-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 15:34:35 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f0277daa5so3803696e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 06:34:35 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52efaf7bc4asm1273496e87.239.2024.07.23.06.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 06:34:34 -0700 (PDT)
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
X-Inumbo-ID: 4d22adbf-48f8-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721741675; x=1722346475; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=54B/T7kfM8m0KH/qFk8WedHdvr0bVpQONjmGgmlMV4o=;
        b=jVditT5mq9Hm3SjuXc9YxrZORwxx/92f+uGANVE7+1i22tWV884o0i8b9Xa63h4mkr
         6uh1/w7QMBulIZYNEg1f0EyUPLv3z5/1D9zeJlb2OLc+MpdZQULidufxgwPIjws+w+L/
         ik5R0ddsNSHVybuA0kYkYaeEVgHViKQtB7TMJN8mGbeN6SdGlEW58CBqJ1IEJD923CRq
         ct+IXw3VhpLpm7PgzYWSRXXooHUzwNtdGFfk7PHDvwfYrEfdWE1Pb8HA3ka+Et/LRZPE
         UNHfhjkM4SGpvlzg5k6qzX+wgx72gl5fdm4WmWdC/ra0KCw/gKRQxB4rrBv6DA6lZXSu
         wQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721741675; x=1722346475;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54B/T7kfM8m0KH/qFk8WedHdvr0bVpQONjmGgmlMV4o=;
        b=nq1lEScuLzfA1aIDMtVJ2jSdPwFcQlCRMHhnrdQYB7b/KCsaOSfN6Z3lLsLx4JAL5v
         IdwQlpr1XEa0REn+BeaahWIKKCNZrM+BhvptHRntAWb/hqQgK3Ak6HPrUijEO9W/diEj
         sd9j7omgU20mAOv84nw0KjM1JREngrOiz7tXdOG7M1bdHcbXvSti1kdlLDbuiu+MK1sS
         tPT8CpCZODSqG2qrGfru0Gh4Mq0XiLHy1I8GKPgh80amc7jxsGX8wmIR1RLi3AASzKG9
         Dy7hrJ9zF/M6PaTOvM5ZEwgGFbPkD/KznB4IjsDzbvMXE8ahnbwbItsmVs4Ojfq1t3/r
         o7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCViriRKto4n1GaGuok/yYhdjlOzuXuEoZsUuz7bQa1rcEY3MmIsv8m3v6kHkNOGH7anftgH0ONZtacqeXqEL4GOhoWczIygoUprHNrLqE8=
X-Gm-Message-State: AOJu0YxlRs59+2NXP4D06DlgdD5sxBINsNdTXe/aMWlQE+CMu2LhRwec
	ay5AMwCsMxzRVPlCLks+9y/TjfXbwrKBRhosTZUNaK4MchBudb0rLMGqmC11
X-Google-Smtp-Source: AGHT+IFmuWcTIT1qopslzTqxTAd/KQraSpEyyn5v7JCvn3+HGjwzcTy4CCKHG3eBEGwRZnHFr1iBEQ==
X-Received: by 2002:ac2:4bc2:0:b0:52c:e133:7b2e with SMTP id 2adb3069b0e04-52efb78ed6dmr7459040e87.35.1721741674680;
        Tue, 23 Jul 2024 06:34:34 -0700 (PDT)
Message-ID: <2f6a6c92ad9f9b1629008cd07a41b8374bd3ed1d.camel@gmail.com>
Subject: Re: [PATCH v2 4/8] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Tue, 23 Jul 2024 15:34:33 +0200
In-Reply-To: <215dd01dee2d793e371feab3a42c9d9c51252b03.camel@gmail.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <b1776fb20603cb56b0aea17ef998ea951d2bbda9.1720799926.git.oleksii.kurochko@gmail.com>
	 <16648c6c-416d-4205-8d16-38c006251bb9@suse.com>
	 <26a45d85fa22a696b629e602e87d5d95626b77f0.camel@gmail.com>
	 <53e2a88b-8d2d-477a-84cb-5b44af365dbe@suse.com>
	 <215dd01dee2d793e371feab3a42c9d9c51252b03.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-22 at 19:04 +0200, oleksii.kurochko@gmail.com wrote:
> On Mon, 2024-07-22 at 17:25 +0200, Jan Beulich wrote:
> > On 22.07.2024 16:36, Oleksii wrote:
> > > On Mon, 2024-07-22 at 14:42 +0200, Jan Beulich wrote:
> > > > On 12.07.2024 18:22, Oleksii Kurochko wrote:
> > > > > --- a/xen/arch/riscv/include/asm/config.h
> > > > > +++ b/xen/arch/riscv/include/asm/config.h
> > > > > @@ -74,11 +74,20 @@
> > > > > =C2=A0#error "unsupported RV_STAGE1_MODE"
> > > > > =C2=A0#endif
> > > > > =C2=A0
> > > > > +#define XEN_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(2)
> > > > > +#define XEN_VIRT_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 (XEN_VIRT_START + XEN_SIZE)
> > > > > +
> > > > > +#define BOOT_FDT_VIRT_START=C2=A0=C2=A0=C2=A0=C2=A0 XEN_VIRT_END
> > > > > +#define BOOT_FDT_VIRT_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MB(4)
> > > > > +
> > > > > =C2=A0#define DIRECTMAP_SLOT_END=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 50=
9
> > > > > =C2=A0#define DIRECTMAP_SLOT_START=C2=A0=C2=A0=C2=A0 200
> > > > > =C2=A0#define DIRECTMAP_VIRT_START=C2=A0=C2=A0=C2=A0 SLOTN(DIRECT=
MAP_SLOT_START)
> > > > > =C2=A0#define DIRECTMAP_SIZE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 (SLOTN(DIRECTMAP_SLOT_END) -
> > > > > SLOTN(DIRECTMAP_SLOT_START))
> > > > > =C2=A0
> > > > > +#define FIXMAP_BASE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 (BOOT_FDT_VIRT_START +
> > > > > BOOT_FDT_VIRT_SIZE)
> > > > > +#define FIXMAP_ADDR(n)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (FIXMAP_BASE + (n) *
> > > > > PAGE_SIZE)
> > > >=20
> > > > Why exactly do you insert this here, and not adjacent to
> > > > BOOT_FDT_VIRT_*,
> > > > which it actually is adjacent with?
> > > I tried to follow alphabetical order.
> >=20
> > Oh, X before B (just making fun) ... Anyway, my take here is that
> > sorting
> > by address is going to be more helpful.
> >=20
> > > > > --- a/xen/arch/riscv/mm.c
> > > > > +++ b/xen/arch/riscv/mm.c
> > > > > @@ -49,6 +49,9 @@ stage1_pgtbl_root[PAGETABLE_ENTRIES];
> > > > > =C2=A0pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > > > > =C2=A0stage1_pgtbl_nonroot[PGTBL_INITIAL_COUNT *
> > > > > PAGETABLE_ENTRIES];
> > > > > =C2=A0
> > > > > +pte_t __section(".bss.page_aligned") __aligned(PAGE_SIZE)
> > > > > +xen_fixmap[PAGETABLE_ENTRIES];
> > > >=20
> > > > Any reason this cannot be static?
> > > It will be used by pmap:
> > > =C2=A0=C2=A0 static inline void arch_pmap_map(unsigned int slot, mfn_=
t mfn)
> > > =C2=A0=C2=A0 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t *entry =3D &xen_fixmap[slo=
t];
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pte;
> > > =C2=A0=C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(!pte_is_valid(*entry));
> > > =C2=A0=C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D mfn_to_xen_entry(mfn, PA=
GE_HYPERVISOR_RW);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.pte |=3D PTE_LEAF_DEFAULT;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);
> > > =C2=A0=C2=A0 }
> > > =C2=A0=C2=A0=20
> > > =C2=A0=C2=A0 static inline void arch_pmap_unmap(unsigned int slot)
> > > =C2=A0=C2=A0 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pte =3D {};
> > > =C2=A0=C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixmap[slot], pte=
);
> > > =C2=A0=C2=A0 }
> >=20
> > Yet as asked there - shouldn't that be set_fixmap() and
> > clear_fixmap()?
> It should be, I'll rework that in the next patch version.
It couldn't be set_fixmap() and clear_fixmap() as I am going to
implement them using map_pages_to_xen() because:
...
    /*
     * We cannot use set_fixmap() here. We use PMAP when the domain map
     * page infrastructure is not yet initialized, so
map_pages_to_xen() called
     * by set_fixmap() needs to map pages on demand, which then calls
pmap()
     * again, resulting in a loop. Modify the PTEs directly instead.
The same
     * is true for pmap_unmap().
     */
    arch_pmap_map(slot, mfn);
...

~ Oleksii

