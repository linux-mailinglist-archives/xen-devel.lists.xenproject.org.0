Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D35B947EF4
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 18:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772298.1182748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb0AT-000605-4E; Mon, 05 Aug 2024 16:02:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772298.1182748; Mon, 05 Aug 2024 16:02:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb0AT-0005xp-0V; Mon, 05 Aug 2024 16:02:41 +0000
Received: by outflank-mailman (input) for mailman id 772298;
 Mon, 05 Aug 2024 16:02:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=006L=PE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sb0AS-0005xj-7n
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 16:02:40 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23909ace-5344-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 18:02:39 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so1307008666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2024 09:02:39 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9d437f5sm462243566b.125.2024.08.05.09.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 09:02:38 -0700 (PDT)
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
X-Inumbo-ID: 23909ace-5344-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722873759; x=1723478559; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6yxsVWFOrJPfBxYTPcsTdHoghvDcDOv2KcXLSMOwrA8=;
        b=INbIjSC63SiKLzT1KKMPn7lsxnCWMSUWQrZ6BaSqgT/N/Lv0aVei/sH1AITF5Yinqr
         5+atsBqtgYR8B948GBqxEVRvUG45JVxXYJG2K0Ve/KeDLPF2cLimFau7n166zphtLPva
         726qM1ocYqARZtS31DWsxCaeAALPJDu+UZo9w9f+R3huQXK3qFMUxz8tfPv5keNPXXL5
         ZFG11GDN0WAjypAhJBIUsTig+CXeoZQG2eHgYgpgeRjdFFQSgmPott0+onWHNXHlifZK
         vU2pWTnQnldltkkp3xRCWi6bzbhR7C9VeB9DG935Xh1yeGptLRWK+6UdXt9I/e4wiRjK
         VsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722873759; x=1723478559;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6yxsVWFOrJPfBxYTPcsTdHoghvDcDOv2KcXLSMOwrA8=;
        b=oI6qHpwD0GGQ3YcO571O4FQsEqqInZsTk6JJOnehYWg2zkqovP2gaf81KaChhPPmU9
         kvfo1KobBHTnPOB5npYBiAdeWOI7TwJUmb1mwenqWSWn3QUymMiuW+JqhNbimlpE0fls
         GHt0htTFdvwuxx7HB3Qz1vZcKgETrQrrZJQkkpIiSyVkOBbGGP41paMMu/IgqrKNkogb
         ck9WHz3gw3Fn2Jcn969nt43od+jnb9Btt33QwyA8B/7QQSx2iIUGGSAg6/5XjyLv+irp
         B52mBUd5J+IhCLGWEwjrnTt0RGdxLKj3NhXiX6jJaW3BfeilBN/UANE7w2tgUU4LrfRj
         LOyg==
X-Forwarded-Encrypted: i=1; AJvYcCXNuNnroWTW0OXnibgB/LyGaYQa72KD/1jbeHuWLtIu3GU0N1JwDWrhHw/AATJWWUlKVwHocM15loq3tnKco5Sp5vwJIojpPV2+MWvn3UE=
X-Gm-Message-State: AOJu0YxOPDtdPuy682vO4aAv1eWFLYeS/TTUZWcu5Tls0taEPf1PI2w3
	F/6QFJjwLALDrvPKlXrozf/hxWj0fCMYZEIWDqUzLQwfiftgUd2y
X-Google-Smtp-Source: AGHT+IGrDFDLwlyVSKXwOtYEYDVh01p6oxiQoUDhxPfSIJQtJcgkWxhNoBHx/HiPe24S59GYgS2ZVg==
X-Received: by 2002:a17:907:7d94:b0:a77:cd51:3b32 with SMTP id a640c23a62f3a-a7dc51600b4mr860203466b.62.1722873758297;
        Mon, 05 Aug 2024 09:02:38 -0700 (PDT)
Message-ID: <ca7ba33e8314d776a1c7928730ab58eeec58dde7.camel@gmail.com>
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Date: Mon, 05 Aug 2024 18:02:36 +0200
In-Reply-To: <d68f3047-5b12-4802-aac3-bb0b9c76cb08@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
	 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
	 <afbbf9ed7c575e3b2c3f9a668db0b27258822ee0.camel@gmail.com>
	 <d68f3047-5b12-4802-aac3-bb0b9c76cb08@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-08-05 at 17:45 +0200, Jan Beulich wrote:
> On 05.08.2024 17:13, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 BUG_ON(pte_is_valid(*pte));
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 tmp =3D paddr_to_pte(LINK_TO_LOAD((unsigned
> > > > long)&xen_fixmap),
> > > > PTE_TABLE);
> > >=20
> > > I'm a little puzzled by the use of LINK_TO_LOAD() (and
> > > LOAD_TO_LINK()
> > > a
> > > little further up) here. Don't you have functioning __pa() and
> > > __va()?
> > Can __pa() and __va() be used in this case?
> >=20
> > According to comments for other architectures, these macros are
> > used
> > for converting between Xen heap virtual addresses (VA) and machine
> > addresses (MA). I may have misunderstood what is meant by the Xen
> > heap
> > in this context, but I'm not sure if xen_fixmap[] and page tables
> > are
> > considered part of the Xen heap.
>=20
> I didn't check Arm, but on x86 virt_to_maddr() (underlying __pa())
> has
> special case code to also allow addresses within the Xen image
> (area).

Yes, it is true for __virt_to_maddr:
   static inline unsigned long __virt_to_maddr(unsigned long va)
   {
       ASSERT(va < DIRECTMAP_VIRT_END);
       if ( va >=3D DIRECTMAP_VIRT_START )
           va -=3D DIRECTMAP_VIRT_START;
       else
       {
           BUILD_BUG_ON(XEN_VIRT_END - XEN_VIRT_START !=3D GB(1));
           /* Signed, so ((long)XEN_VIRT_START >> 30) fits in an imm32. */
           ASSERT(((long)va >> (PAGE_ORDER_1G + PAGE_SHIFT)) =3D=3D
                  ((long)XEN_VIRT_START >> (PAGE_ORDER_1G + PAGE_SHIFT)));
  =20
           va +=3D xen_phys_start - XEN_VIRT_START;
       }
       return (va & ma_va_bottom_mask) |
              ((va << pfn_pdx_hole_shift) & ma_top_mask);
   }
  =20
But in case of __maddr_to_virt ( __va() ) it is using directmap region:
   static inline void *__maddr_to_virt(unsigned long ma)
   {
       ASSERT(pfn_to_pdx(ma >> PAGE_SHIFT) < (DIRECTMAP_SIZE >>
   PAGE_SHIFT));
       return (void *)(DIRECTMAP_VIRT_START +
                       ((ma & ma_va_bottom_mask) |
                        ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
   }

But I have to use both __va() and __pa().
__va() inside cycle to find L1 page table:

    for ( i =3D HYP_PT_ROOT_LEVEL; i-- > 1; )
    {
        BUG_ON(!pte_is_valid(*pte));

        pte =3D (pte_t *)LOAD_TO_LINK(pte_to_paddr(*pte));
        pte =3D &pte[pt_index(i, FIXMAP_ADDR(0))];
    }

__pa() to set a physical address of L0 page table:
    tmp =3D paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap),
PTE_TABLE);
    write_pte(pte, tmp);


~ Oleksii

