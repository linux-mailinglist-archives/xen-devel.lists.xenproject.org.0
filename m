Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05ED98D12B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 12:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.808685.1220667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svwZS-0000a6-HS; Wed, 02 Oct 2024 10:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 808685.1220667; Wed, 02 Oct 2024 10:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svwZS-0000Xg-ET; Wed, 02 Oct 2024 10:27:02 +0000
Received: by outflank-mailman (input) for mailman id 808685;
 Wed, 02 Oct 2024 10:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tl1C=Q6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svwZR-0000Xa-E6
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 10:27:01 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db5b70f6-80a8-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 12:26:59 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5399041167cso5414285e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2024 03:26:59 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a0439a98sm1880888e87.211.2024.10.02.03.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 03:26:58 -0700 (PDT)
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
X-Inumbo-ID: db5b70f6-80a8-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727864819; x=1728469619; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NGOJlVwtKFRB2vOSAddY/X76t5Zsej5l4QecAB/2cS0=;
        b=hH6duw6P+l9No3Za4pRGyJLO0fxCBSfZNeUInkvF/31qbMLTNeztoL5zgjRytgPNAk
         JNM/iIHDTXkdMAQ4kBuRs/d6QztBAEdY1maO9TPLdjWGlVwAo71zKOrlITlJ7YF/oKmV
         d74yss/BzCBxKN07/gNIJwBhxKD7YE1OQJ0SkVgiFnkEMTRJRUssD4hedDZTWTcmRMMs
         9Z/TY3oxZYhNnslpXjDZMvCBwrgrQgXqqcfqUVR+TLrsBqMEkHtBCLV2evmcc54NM9zK
         cnq9RQDEvzMDm5lIO+AHmKI65R4rvg6hTijeVZvWkUNZkQtl7+yWpLuvUMHniRMfmlsd
         QvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727864819; x=1728469619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NGOJlVwtKFRB2vOSAddY/X76t5Zsej5l4QecAB/2cS0=;
        b=V+Iqsr5HKMho9M8y1IV6lgqyvDx2lCQV65VLoDW/N7GTryy0OPYByjJEEa4bxS+yjD
         NG/v7JUarUJ4RJcML5/DuUmyGNSBQnCrSpinsiZXorXA8F0Gx6at3MRRro5oKxzA+lMO
         K82ksLPisBmoRIInu5Pg+MFsZ2U0d/+7o+9LMTTCW6xd9jfciatx8icH69DM4v/mNbNM
         jbpiFsGB9bdnAkldeT8mijiv47fWgFgzdmMi4NHuk04m19aQyfHc4eyH636KPMO4fsl1
         q0gcDTJ96wvZy61NCI2+CA7QI61L5mks6u7kPzzKmL7pSfuFMZGjuyI0phAiUYHGlwhL
         ltAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsmowO1EdQgl3XwQRGpJCj+DAfc//YV47lQkVjtG/5atZefU9N7j2dTmVpFsJkpbpBEqsBf/3xlZM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzWDKJa15LL7WO+UtrSEq8ycWjnz/veea4p2KkjKd3pfRtXhOWK
	5pHhnmxMFAwauikADbf1zTslU529M1TPJIn+87gR1jQjBxClBUZx
X-Google-Smtp-Source: AGHT+IEjFUx8xXeBPD/Isk6XhbDoXjP16lyY1+kvq71M6jksqT9kmx7S/bnU1SOieMD49WXETyUcEw==
X-Received: by 2002:a05:6512:31cc:b0:539:9767:903d with SMTP id 2adb3069b0e04-539a07a66b3mr1541597e87.60.1727864818735;
        Wed, 02 Oct 2024 03:26:58 -0700 (PDT)
Message-ID: <6aa27e6f75af3ad2f81eb5e43e213aa386460ed5.camel@gmail.com>
Subject: Re: [PATCH v1 1/3] xen/riscv: implement virt_to_maddr()
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Wed, 02 Oct 2024 12:26:57 +0200
In-Reply-To: <61347488-6b4b-442d-9058-cafd65b0834d@suse.com>
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
	 <1d4270af6469af2f95ede34abd8e9f98f775c1f1.1727708665.git.oleksii.kurochko@gmail.com>
	 <61347488-6b4b-442d-9058-cafd65b0834d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-10-01 at 17:41 +0200, Jan Beulich wrote:
> On 30.09.2024 17:08, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/include/asm/mm.h
> > +++ b/xen/arch/riscv/include/asm/mm.h
> > @@ -28,7 +28,20 @@ static inline void *maddr_to_virt(paddr_t ma)
> > =C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > =C2=A0}
> > =C2=A0
> > -#define virt_to_maddr(va) ({ BUG_ON("unimplemented"); 0; })
> > +static inline unsigned long virt_to_maddr(unsigned long va)
> > +{
> > +=C2=A0=C2=A0=C2=A0 ASSERT(va >=3D (DIRECTMAP_VIRT_START + DIRECTMAP_SI=
ZE));
> > +=C2=A0=C2=A0=C2=A0 if ((va >=3D DIRECTMAP_VIRT_START) &&
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (va < (DIRECTMAP_VIRT_START=
 + DIRECTMAP_SIZE)))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return directmapoff_to_madd=
r(va - DIRECTMAP_VIRT_START);
>=20
> While the cover letter states a dependency on another series, I'm
> unable
> to spot directmapoff_to_maddr() in the tree or in that other series.
The definition of directmap_off_to_maddr() is in xen/pdx.h:

#ifdef CONFIG_PDX_COMPRESSION
...
/**
 * Computes a machine address given a direct map offset
 *
 * @param offset Offset into the direct map
 * @return Corresponding machine address of that virtual location
 */
static inline paddr_t directmapoff_to_maddr(unsigned long offset)
{
    return ((((paddr_t)offset << pfn_pdx_hole_shift) & ma_top_mask) |
            (offset & ma_va_bottom_mask));
}
...
#else /* !CONFIG_PDX_COMPRESSION */
...
/* directmap is indexed by by maddr */
#define maddr_to_directmapoff(x) (x)
#define directmapoff_to_maddr(x) (x)
...
#endif

>=20
> > +=C2=A0=C2=A0=C2=A0 BUILD_BUG_ON(XEN_VIRT_SIZE !=3D MB(2));
> > +=C2=A0=C2=A0=C2=A0 ASSERT(((long)va >> (PAGETABLE_ORDER + PAGE_SHIFT))=
 =3D=3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((long)XE=
N_VIRT_START >> (PAGETABLE_ORDER +
> > PAGE_SHIFT)));
>=20
> What's the point of the casts here? va is unsigned long and
> XEN_VIRT_START
> is a literal number (which probably ought to have a UL suffix).
I thought that it could be the same as for x86 that:
 /* Signed, so ((long)XEN_VIRT_START >> 30) fits in an imm32. */
But checking the generated code for RISC-V casts could be dropped
as the generated code is the same.

Regarding UL, I will update to _AC(XEN_VIRT_START, UL).

>=20
> > +=C2=A0=C2=A0=C2=A0 return phys_offset + va;
>=20
> Don't you need to subtract XEN_VIRT_START here?
It shouldn't as XEN_VIRT_START is taken into account during phys_offset
calculation ( as you mentioned in the reply ).

Regarding the name of phys_offset variable, could it be better to
rename it to load_offset?

As an option I can just add the comment above return:
 /* phys_offset =3D load_start - XEN_VIRT_START */

~ Oleksii

