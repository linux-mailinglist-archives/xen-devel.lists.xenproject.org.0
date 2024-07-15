Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E59093163D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 15:59:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758924.1168460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTME2-0007CH-Ul; Mon, 15 Jul 2024 13:58:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758924.1168460; Mon, 15 Jul 2024 13:58:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTME2-0007An-S1; Mon, 15 Jul 2024 13:58:46 +0000
Received: by outflank-mailman (input) for mailman id 758924;
 Mon, 15 Jul 2024 13:58:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/7M=OP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sTME1-0007Af-Ci
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 13:58:45 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 590e9970-42b2-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 15:58:43 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-58b447c5112so5901605a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 06:58:43 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-59b24a76c96sm3359347a12.18.2024.07.15.06.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jul 2024 06:58:42 -0700 (PDT)
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
X-Inumbo-ID: 590e9970-42b2-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721051923; x=1721656723; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1WFGltZFYWOHGz4/pAznsWvqVwfPA5bANidpHaZ0/NA=;
        b=gdWTaznsNC0H9BafZXScllZQ4p6bOy38fJe5DIoTf8QC4lU39509hQDNNESRYdzNXz
         Kauq5+a2UKlo+RtuVgMHrk8FFApY5xI8Zsez5akH4HpQRBrSFRkfJO/zlS2bzmRwOhNb
         NRhFrLHgoPsFb3GwrjhxRb7ZBKWyMlrStYPM0t59u5Y5QSuA8qlnQcxNgpC5ZrYVP4me
         NNhIbGH7zsUcP8Vnu8V+nOFEdjoucgVZKnY8IxALwrUuVzgocaWbutGifdDvbNDGUmYP
         aVnpk5qHjGX0jaM06zW8eeJLmfVLpJkEY4WS/4kBmVw7ZbO+ReuR0vR9DepPz9wADpB5
         rw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721051923; x=1721656723;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WFGltZFYWOHGz4/pAznsWvqVwfPA5bANidpHaZ0/NA=;
        b=UE591JvP0C3Q4BxetQeD6XHdOy6vnSehZKx6sWySS+apG9U+rMhEx4YjLAkIJ1OEbX
         eQHIq7R1MNBfwaUK9p1P1tMDh0YpfHsjUCf9CHqpjigGaqFaF+wSR8xh7SXu1R1VJkUa
         4q8ZqlCvxJayqQ590mkrbZqMtHA9oIcPANss/gAFz2Fouj0bD1owbK+Kr3BLDH8CMNUV
         2GUjo29/hTOPoqaFDAvC9ydKDTIysE0ct/lF5nabmUMIdOjxAsrPGyXau12nAGuaJgHS
         uqog7B8pPJdpVocChAUdvC4/U4+fMSWuDSD8u9ME2o9BUOxJKTygba2/S7KxUwpvZPad
         vGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYRzQBQ1PuAS11qyp+Q/cC0VqfBAwTd2eAWFxC+oh7qi/ngl794pCLkRIsh+JM+8R86O0+r8o/ILuKsylCuYCOr3knepKj/cb26l+zMIo=
X-Gm-Message-State: AOJu0Yyl8wqrciBU7IothQgoiuqIULm/LWMHBkd6hkAA9MzAvt408wkM
	nLYZQYUN8Ve/T6Aa/w6emuNkG61aTCAM0GtInVFvgh0rd5q80D9z
X-Google-Smtp-Source: AGHT+IHcnDckVJjSCEZrMg3HJNe+K4GjjyGLlx2waCa4/1s6Oq69+LstMf5wcMH6uT+QsXLO0e5vKw==
X-Received: by 2002:a50:955a:0:b0:599:8fef:3ee0 with SMTP id 4fb4d7f45d1cf-5998fef3f1emr6182006a12.36.1721051923113;
        Mon, 15 Jul 2024 06:58:43 -0700 (PDT)
Message-ID: <ba7c72745052429d84e172cf731849c54445d27a.camel@gmail.com>
Subject: Re: [PATCH v2 8/8] xen/riscv: introduce early_fdt_map()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 15 Jul 2024 15:58:42 +0200
In-Reply-To: <bc8d2e10-0898-4f5a-b296-1bc7f528bb77@suse.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <4e4f94817fb3bba5f52336ea0b4491f7bc867d49.1720799926.git.oleksii.kurochko@gmail.com>
	 <bc8d2e10-0898-4f5a-b296-1bc7f528bb77@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-15 at 10:52 +0200, Jan Beulich wrote:
> On 12.07.2024 18:22, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/mm.h
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -266,4 +266,6 @@ static inline unsigned int
> > arch_get_dma_bitsize(void)
> > =C2=A0
> > =C2=A0void setup_fixmap_mappings(void);
> > =C2=A0
> > +void* early_fdt_map(paddr_t fdt_paddr);
>=20
> Please can you take care to address comments on earlier versions
> before
> submitting a new one?
Sorry, missed that Nit comment where you suggested to switch
space/block and *.

>=20
> > @@ -435,3 +438,55 @@ inline pte_t mfn_to_xen_entry(mfn_t mfn,
> > unsigned int attr)
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 return mfn_to_pte(mfn);
> > =C2=A0}
> > +
> > +void * __init early_fdt_map(paddr_t fdt_paddr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 /* We are using 2MB superpage for mapping the FDT *=
/
> > +=C2=A0=C2=A0=C2=A0 paddr_t base_paddr =3D fdt_paddr & XEN_PT_LEVEL_MAP=
_MASK(1);
> > +=C2=A0=C2=A0=C2=A0 paddr_t offset;
> > +=C2=A0=C2=A0=C2=A0 void *fdt_virt;
> > +=C2=A0=C2=A0=C2=A0 uint32_t size;
> > +=C2=A0=C2=A0=C2=A0 int rc;
> > +
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * Check whether the physical FDT address is s=
et and meets the
> > minimum
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * alignment requirement. Since we are relying=
 on
> > MIN_FDT_ALIGN to be at
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * least 8 bytes so that we always access the =
magic and size
> > fields
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * of the FDT header after mapping the first c=
hunk, double
> > check if
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * that is indeed the case.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
> > +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
> > +=C2=A0=C2=A0=C2=A0 if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > +
> > +=C2=A0=C2=A0=C2=A0 /* The FDT is mapped using 2MB superpage */
> > +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
>=20
> May I suggest that you use MB(2) instead of SZ_2M (not just here)? I
> think
> I had voiced opposition to the introduction of xen/sizes.h about 10
> years
> back, yet sadly it still landed in the tree. I for one think that our
> KB(),
> MB(), and GB() constructs are superior, and (I hope) free of Misra
> issues
> (unlike SZ_2G).
>=20
> > +=C2=A0=C2=A0=C2=A0 rc =3D map_pages_to_xen(BOOT_FDT_VIRT_START,
> > maddr_to_mfn(base_paddr),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 SZ_2M >> PAGE_SHIFT,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> > +=C2=A0=C2=A0=C2=A0 if ( rc )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Unable to map the de=
vice-tree.\n");
> > +
> > +=C2=A0=C2=A0=C2=A0 offset =3D fdt_paddr % XEN_PT_LEVEL_SIZE(1);
> > +=C2=A0=C2=A0=C2=A0 fdt_virt =3D (void *)BOOT_FDT_VIRT_START + offset;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( fdt_magic(fdt_virt) !=3D FDT_MAGIC )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > +
> > +=C2=A0=C2=A0=C2=A0 size =3D fdt_totalsize(fdt_virt);
> > +=C2=A0=C2=A0=C2=A0 if ( size > BOOT_FDT_VIRT_SIZE )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( (offset + size) > SZ_2M )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D map_pages_to_xen(BOO=
T_FDT_VIRT_START + SZ_2M,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 maddr_to_mfn(base_paddr + SZ_2M),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SZ_2M >> PAGE_SHIFT,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pan=
ic("Unable to map the device-tree\n");
> > +=C2=A0=C2=A0=C2=A0 }
>=20
> Why this two part mapping? And why are you mapping perhaps much more
> than "size"?
I wasn't able to find if RISC-V has a requirement for alignment of FDT
address so I decided to follow Arm where FDT is required to be placed
on a 8-byte boundary, so FDT can cross a 2MB boundary, so the second
2MB page should be mapped if the FDT is crossing the 2MB boundary.

>=20
> > @@ -48,6 +49,14 @@ void __init noreturn start_xen(unsigned long
> > bootcpu_id,
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 setup_fixmap_mappings();
> > =C2=A0
> > +=C2=A0=C2=A0=C2=A0 device_tree_flattened =3D early_fdt_map(dtb_addr);
> > +=C2=A0=C2=A0=C2=A0 if ( device_tree_flattened )
>=20
> Is this condition perhaps inverted?
Yes, you are right. It should be inverted.

Thanks.

~ Oleksii
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic("Invalid device tree =
blob at physical address
> > %#lx.\n"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "The DTB must be 8-byte aligned and must not exceed
> > %lld "
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "bytes in size.\n\n"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 "Please check your bootloader.\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 dtb_addr, BOOT_FDT_VIRT_SIZE);
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 printk("All set up\n");
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0 for ( ;; )
>=20


