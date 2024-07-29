Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805293FAA5
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 18:22:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766992.1177545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYT8q-0002CL-5J; Mon, 29 Jul 2024 16:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766992.1177545; Mon, 29 Jul 2024 16:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYT8q-0002Ar-2P; Mon, 29 Jul 2024 16:22:32 +0000
Received: by outflank-mailman (input) for mailman id 766992;
 Mon, 29 Jul 2024 16:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZrP=O5=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sYT8p-0002Al-Am
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 16:22:31 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c02b1f39-4dc6-11ef-8776-851b0ebba9a2;
 Mon, 29 Jul 2024 18:22:29 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52efd855adbso5578489e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2024 09:22:29 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5c2d48fsm1523979e87.275.2024.07.29.09.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 09:22:27 -0700 (PDT)
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
X-Inumbo-ID: c02b1f39-4dc6-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722270149; x=1722874949; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0d3C7WDYGgQXysGo7utvuSdWbnb71BlRiRCFC64WsVE=;
        b=O5uItSPTDwBhRKGYM/k3iunrek7ApAQL86FpdE40xg5pd84bwYNSPf+h2unYJqjT/M
         Z/e3rLyjIoViV83TckRayBNibSVJWE7SRy7xaGo6L4mkGzrloQlSxw+zoBOfKGv9c3q1
         KY26MbEwbGVZ8THzKX68fmLboH1fhSaHmcpt7xRL9NNPPZurBpAYERBhoS5Wp/y9EZ1M
         o4IGmhECq3lX8/ADvb+H2zRBNo9vTeQ61LJ4eJJi19oozlUvjyBW/b2VHm1DvhgB0E51
         q7yZeibBDNnykYTb0gmgFCulf8HV2LfNlGtK9ysOvdFOzn8XFtMSE/AYcdbsYh92cddi
         BsOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722270149; x=1722874949;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0d3C7WDYGgQXysGo7utvuSdWbnb71BlRiRCFC64WsVE=;
        b=NlRWK2bw4lON5sr7wLwBxjJ3f/ZfzJoZKSInHyDFTuK6kf+xmWF+4Ri3N7IjS1NVHF
         B75fxEG7KD+0NMLAUKDbwNlGOiG/5iKlobsZF6baZoWUUTouOuFYCrVL5WFKJZj60s1d
         ep9trNg29+o38Aj9wwS5zArUbY8Q07Sb2OOoKldD2rCBCWSA3ECdsiiDndiX9TJfZdw9
         uRqz0fLnpeE0KbylD8CjqCOcccUBv8jaQIFvKAR9r1laVRQkrOrXm9fJgs7LhcY50de7
         euPO/V8UR84cAGZGRZ1hxxEmDi7lx8MLumjyfFbxW1QKVvKPr+zKq0eGHAekXpnlXhpk
         UkgA==
X-Forwarded-Encrypted: i=1; AJvYcCXKELpzyO+E3P9aeY6pMIEcTJKMeDKz2+CSezCXFEpe5IPwRBC3fVdSKbk35rPA40YyqmxM/mEIAmHx9qrh68BhQ3T+VBzm1vzqGhjUGyM=
X-Gm-Message-State: AOJu0YyXwc/Ia7Z9xAnvhlyD7DQwKTm8jXktZRyS0FB9XzmXM3dvUr8V
	WihhwxFNPrMp49EGWqTKuhRzvmawOuz8DMr3F7WGRx/LeOIt+X43
X-Google-Smtp-Source: AGHT+IH7Acq6fihlX7b+nyLuAIwCj2DSvIFejQWYvtsn9hmebArD0gdoiUO4eh+m+gd+NO/khJ1KGg==
X-Received: by 2002:a05:6512:39d5:b0:52e:f2e8:1646 with SMTP id 2adb3069b0e04-5309b2cea3dmr5878753e87.58.1722270148547;
        Mon, 29 Jul 2024 09:22:28 -0700 (PDT)
Message-ID: <78effb178b1ffe7ccb1714a13157e94f5e816b01.camel@gmail.com>
Subject: Re: [PATCH v3 5/9] xen/riscv: introduce asm/pmap.h header
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 29 Jul 2024 18:22:27 +0200
In-Reply-To: <3359e37e-eaae-49ca-80a5-2bf70b9b46c7@suse.com>
References: <cover.1721834549.git.oleksii.kurochko@gmail.com>
	 <11b5487659a9c76793e520c108cd92c6c84b908d.1721834549.git.oleksii.kurochko@gmail.com>
	 <3359e37e-eaae-49ca-80a5-2bf70b9b46c7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-29 at 16:29 +0200, Jan Beulich wrote:
> On 24.07.2024 17:31, Oleksii Kurochko wrote:
> > Introduces arch_pmap_{un}map functions and select HAS_PMAP
> > for CONFIG_RISCV.
> >=20
> > Additionaly it was necessary to introduce functions:
> > =C2=A0- mfn_from_xen_entry
> > =C2=A0- mfn_to_pte
> >=20
> > Also flush_xen_tlb_range_va_local() and flush_xen_tlb_one_local()
> > are introduced and use in arch_pmap_unmap().
>=20
> Just flush_xen_tlb_one_local() would suffice for the purposes here.
> flush_xen_tlb_range_va_local() will need some kind of cutoff, to
> avoid looping for an excessivly long time.
>=20
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/pmap.h
> > @@ -0,0 +1,33 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef ASM_PMAP_H
> > +#define ASM_PMAP_H
> > +
> > +#include <xen/bug.h>
> > +#include <xen/mm.h>
> > +#include <xen/page-size.h>
> > +
> > +#include <asm/fixmap.h>
> > +#include <asm/flushtlb.h>
> > +#include <asm/system.h>
> > +
> > +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t *entry =3D &xen_fixmap[slot];
> > +=C2=A0=C2=A0=C2=A0 pte_t pte;
> > +
> > +=C2=A0=C2=A0=C2=A0 ASSERT(!pte_is_valid(*entry));
> > +
> > +=C2=A0=C2=A0=C2=A0 pte =3D mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
> > +=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);
> > +}
>=20
> Perhaps add a comment to clarify why it's safe to omit a TLB flush
> here.
> Note that arch_pmap_unmap() having one is a necessary but not
> sufficient
> condition to that. In principle hardware may also cache "negative"
> TLB
> entries; I have no idea how RISC-V behaves in this regard, or whether
> that aspect is actually left to implementations.
what do you mean by "negative" TLB? an old TLB entry which should be
invalidated?

>=20
> > +static inline void arch_pmap_unmap(unsigned int slot)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t pte =3D {};
> > +
> > +=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixmap[slot], pte);
> > +
> > +=C2=A0=C2=A0=C2=A0 flush_xen_tlb_range_va_local(FIXMAP_ADDR(slot), PAG=
E_SIZE);
> > +}
>=20
> For both functions, even if mainly for documentation purposes, it may
> be desirable to mark them __init. It's again a necessary (but not
> sufficient) condition here, to validly use local TLB flushes only.
Does __init in this context means that it will be called only by boot
cpu at the start and that is it?

>=20
> > --- a/xen/arch/riscv/mm.c
> > +++ b/xen/arch/riscv/mm.c
> > @@ -382,3 +382,18 @@ int map_pages_to_xen(unsigned long virt,
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0=C2=A0=C2=A0=C2=A0 return -1;
> > =C2=A0}
> > +
> > +static inline pte_t mfn_from_pte(mfn_t mfn)
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned long pte =3D mfn_x(mfn) << PTE_PPN_SHIFT;
> > +=C2=A0=C2=A0=C2=A0 return (pte_t){ .pte =3D pte };
> > +}
>=20
> My earlier naming related comment may not have been here, but it
> was certainly meant to apply to any similar functions: A function
> of this name should imo take a pte_t and produce an mfn_t. IOW I'd
> expect this function to be pte_from_mfn(). However, I question it
> being
> a good idea to do it this way. The resulting pte_t isn't valid yet,
> aiui,
> as it still needs at least the access controls filled in. Such a
> partial
> pte_t would better not be floating around at any time, imo. IOW the
> function likely wants to take a 2nd parameter.
Thanks. I'll double check the namings and update the prototype of this
function.


~ Oleksii

