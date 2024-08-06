Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29633948C33
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 11:33:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772641.1183097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGYw-0000Xj-F0; Tue, 06 Aug 2024 09:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772641.1183097; Tue, 06 Aug 2024 09:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbGYw-0000VM-Aw; Tue, 06 Aug 2024 09:33:02 +0000
Received: by outflank-mailman (input) for mailman id 772641;
 Tue, 06 Aug 2024 09:33:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HPS5=PF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sbGYv-0000VG-8Z
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 09:33:01 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df007a78-53d6-11ef-bc04-fd08da9f4363;
 Tue, 06 Aug 2024 11:33:00 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2f0dfdc9e16so5359381fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Aug 2024 02:33:00 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e273b68sm14101161fa.134.2024.08.06.02.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 02:32:58 -0700 (PDT)
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
X-Inumbo-ID: df007a78-53d6-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722936780; x=1723541580; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1/HjB2PAAaGycgqMtIi4q8QL2Xbc5dwur2HVMfpuOJ8=;
        b=KZtE1qjX6S2qGb8QvjOKbrOmFg0jCruxGIxxLvcDPfqYW/tSpb/owmks5/vDISStlq
         z5W/ED6GV9p2AzeT0eZMtAcZwlsrDT5KnAbWri9S4Z45kpGE4NtYUcJpFO86OUqs880v
         /1hJkanrYWky0xnVlThEw1atCYbgB/tMuGnUjhQcIDruKK7SkLjbodYrUkuH7/mFGU6I
         7ZWMvgty/2KzbsSWQ2MUSBNUGUPkdpCRPGcBUEEj0m48mZuhvVDjVytxRcTPLnxLQO8X
         rnI3G11W0mRFhsAOjEVBJlS+8B6xAPJO/cexB76RmT3wCGHdORuRENxzySa43DeBTUwv
         IaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722936780; x=1723541580;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1/HjB2PAAaGycgqMtIi4q8QL2Xbc5dwur2HVMfpuOJ8=;
        b=jnv7tSIP9zaQf0nwStUMCqaAGuflWFH/NLJHwIeKdBz5ijX23j7GtIBzCNJ98ETAJH
         Dl/Zrolz40X9eF/ldBO9i3UsZtqfvm8pdveK6HOpQKgHvbTYoIuOFgMmVC2RoSKfuc/o
         dj3la8DxJi8YLFmcKFrRCQy8GXOYW5JJM1SJOkRNiQXKTg5F/Xf5koohTAoecBBxpRZi
         5b0ccWB5qEidvWcC8JlwP0oBtUBsg87V3arCbXMhnb34OuRj6FQnmrmlRLiOcqxdGjqE
         2z8vGMnsho3PQEdoEmBHARUx/SJI6bJMu7QnvK52TE2RvxCQv8YTvXvi6vsnhCKUtiSf
         zzVA==
X-Forwarded-Encrypted: i=1; AJvYcCVIY8dRmGQ5C2IxkqDQbeEQmhDMk7eG//OeFCqEwgTrwqWleSjAAlKaAVOuK/UOojxyYpJF80KLtiSgJ2Mr16kOR1TeLdysGOqQHz4Bwrs=
X-Gm-Message-State: AOJu0YxMPwadNz1hqtVDtlQguk2S9jd6ObHRvRLeN+hXZCpinHEnwkrX
	mJcNVawB6qliPTo0+kv/WO7v6vzOI7gfcbDWfs4FNXCD8rkEpr3c
X-Google-Smtp-Source: AGHT+IHyit2VFQ9k/wMwWJkqpj8yE6znYUlEQ3GTzjPRotf3+sbkX6Vc/6Ss/etHxMvEl+MyTKxN8Q==
X-Received: by 2002:a2e:94cf:0:b0:2ef:2c27:6680 with SMTP id 38308e7fff4ca-2f15aa91245mr91107281fa.12.1722936779123;
        Tue, 06 Aug 2024 02:32:59 -0700 (PDT)
Message-ID: <7a1eb753125f7a3df55049de8e83bbef0818cf55.camel@gmail.com>
Subject: Re: [PATCH v3 4/9] xen/riscv: setup fixmap mapping
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>
Date: Tue, 06 Aug 2024 11:32:58 +0200
In-Reply-To: <35b277c6-8715-4c5b-b82d-ae29bbac8643@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <04576976b82b97442f645b83b3d62475d144af8e.1721834549.git.oleksii.kurochko@gmail.com>
	 <917cc521-c0c4-49e8-bc40-948679398bc6@suse.com>
	 <afbbf9ed7c575e3b2c3f9a668db0b27258822ee0.camel@gmail.com>
	 <d68f3047-5b12-4802-aac3-bb0b9c76cb08@suse.com>
	 <ca7ba33e8314d776a1c7928730ab58eeec58dde7.camel@gmail.com>
	 <35b277c6-8715-4c5b-b82d-ae29bbac8643@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-08-05 at 18:14 +0200, Jan Beulich wrote:
> On 05.08.2024 18:02, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Mon, 2024-08-05 at 17:45 +0200, Jan Beulich wrote:
> > > On 05.08.2024 17:13, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Mon, 2024-07-29 at 15:35 +0200, Jan Beulich wrote:
> > > > > > +=C2=A0=C2=A0=C2=A0 }
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 BUG_ON(pte_is_valid(*pte));
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 tmp =3D paddr_to_pte(LINK_TO_LOAD((unsigned
> > > > > > long)&xen_fixmap),
> > > > > > PTE_TABLE);
> > > > >=20
> > > > > I'm a little puzzled by the use of LINK_TO_LOAD() (and
> > > > > LOAD_TO_LINK()
> > > > > a
> > > > > little further up) here. Don't you have functioning __pa()
> > > > > and
> > > > > __va()?
> > > > Can __pa() and __va() be used in this case?
> > > >=20
> > > > According to comments for other architectures, these macros are
> > > > used
> > > > for converting between Xen heap virtual addresses (VA) and
> > > > machine
> > > > addresses (MA). I may have misunderstood what is meant by the
> > > > Xen
> > > > heap
> > > > in this context, but I'm not sure if xen_fixmap[] and page
> > > > tables
> > > > are
> > > > considered part of the Xen heap.
> > >=20
> > > I didn't check Arm, but on x86 virt_to_maddr() (underlying
> > > __pa())
> > > has
> > > special case code to also allow addresses within the Xen image
> > > (area).
> >=20
> > Yes, it is true for __virt_to_maddr:
> > =C2=A0=C2=A0 static inline unsigned long __virt_to_maddr(unsigned long =
va)
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(va < DIRECTMAP_VIRT_END);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( va >=3D DIRECTMAP_VIRT_START =
)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 va -=3D DI=
RECTMAP_VIRT_START;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUILD_BUG_=
ON(XEN_VIRT_END - XEN_VIRT_START !=3D GB(1));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Signed,=
 so ((long)XEN_VIRT_START >> 30) fits in an
> > imm32. */
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(((l=
ong)va >> (PAGE_ORDER_1G + PAGE_SHIFT)) =3D=3D
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((long)XEN_VIRT_START >> (PAGE_ORDER_1G +
> > PAGE_SHIFT)));
> > =C2=A0=C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 va +=3D xe=
n_phys_start - XEN_VIRT_START;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (va & ma_va_bottom_mask) |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ((va << pfn_pdx_hole_shift) & ma_top_mask);
> > =C2=A0=C2=A0 }
> > =C2=A0=C2=A0=20
> > But in case of __maddr_to_virt ( __va() ) it is using directmap
> > region:
> > =C2=A0=C2=A0 static inline void *__maddr_to_virt(unsigned long ma)
> > =C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(pfn_to_pdx(ma >> PAGE_SHIFT=
) < (DIRECTMAP_SIZE >>
> > =C2=A0=C2=A0 PAGE_SHIFT));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return (void *)(DIRECTMAP_VIRT_STA=
RT +
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((ma & ma_v=
a_bottom_mask) |
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((ma =
& ma_top_mask) >>
> > pfn_pdx_hole_shift)));
> > =C2=A0=C2=A0 }
> >=20
> > But I have to use both __va() and __pa().
> > __va() inside cycle to find L1 page table:
> >=20
> > =C2=A0=C2=A0=C2=A0 for ( i =3D HYP_PT_ROOT_LEVEL; i-- > 1; )
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(!pte_is_valid(*pte));
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D (pte_t *)LOAD_TO_LIN=
K(pte_to_paddr(*pte));
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D &pte[pt_index(i, FIX=
MAP_ADDR(0))];
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > __pa() to set a physical address of L0 page table:
> > =C2=A0=C2=A0=C2=A0 tmp =3D paddr_to_pte(LINK_TO_LOAD((unsigned long)&xe=
n_fixmap),
> > PTE_TABLE);
> > =C2=A0=C2=A0=C2=A0 write_pte(pte, tmp);
>=20
> Hmm, then using at least LINK_TO_LOAD() is going to be unavoidable
> for the
> time being, I guess. Yet midterm I think they should disappear from
> here.
I think that in this specific case both LINK_TO_LOAD() and
LOAD_TO_LINK() should be used.

__va() -> __maddr_to_virt() can't be used here as it's calculation is
based on DIRECTMAP_VIRT_START thereby we will receive incorrect virtual
address of page table.

__pa() -> __virt_to_maddr() can't be used too because virtual address
of xen_fixmap will be always bigger then DIRECTMAP_VIRT_START ( as
XEN_VIRT_START > DIRECTMAP_VIRT_START ) thereby physical address (PA)
will be calculated based on DIRECTMAP_VIRT_START and incorrect PA of
xen_fixmap will be received.

It seems to me that it is only one choice we have at the moment ( and
probably in the case of fixmap mapping ) is to use
LINK_TO_LOAD()/LOAD_TO_LINK().

~ Oleksii

