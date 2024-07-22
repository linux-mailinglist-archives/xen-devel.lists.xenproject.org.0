Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC01F939104
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 16:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762075.1172209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuOw-0006Ah-4N; Mon, 22 Jul 2024 14:52:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762075.1172209; Mon, 22 Jul 2024 14:52:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVuOw-00068J-1N; Mon, 22 Jul 2024 14:52:34 +0000
Received: by outflank-mailman (input) for mailman id 762075;
 Mon, 22 Jul 2024 14:44:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H4cl=OW=gmail.com=inisider@srs-se1.protection.inumbo.net>)
 id 1sVuH9-0002sW-Rn
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 14:44:31 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e75324f1-4838-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 16:44:30 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52efd08e6d9so2548810e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 07:44:30 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52eff3bd6ecsm734888e87.4.2024.07.22.07.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 07:44:29 -0700 (PDT)
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
X-Inumbo-ID: e75324f1-4838-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721659470; x=1722264270; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KLcCUe3DQuLuEs5kLVFN8x3bGpofBM+4/6gzTmtveEU=;
        b=JnLzzRkxPyL9kpHciOrr2YukTnD4pvhf955mnpwctu4647pD35KxKSWo37H5w8Ilfn
         Oo7eGiLBINHV2pqpvVzBUqjkfwGEiM0ZzONF+5FqqU/zaEFBlEolqsJgiAqxF/fjASjE
         9q+4VFxVg5EDUd/zMZfj7Jb7m/MFJJaT1HXDPl0Euqyx1dlwk5s/P2mGvfL5+Xds+cqP
         BmkPM7TliKmdTwxWt0CEr7f38XZx9YsncKZsB3aHuZgBQODOfmmb7Hy6iW6xpWDpcyTY
         ucZoNGsJW2f8ZLHFmNnsgcyh1GcaEaU0KyP7N9sOoBLJzL4JPtPJyL9uiy17zOWu47vY
         DVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721659470; x=1722264270;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KLcCUe3DQuLuEs5kLVFN8x3bGpofBM+4/6gzTmtveEU=;
        b=snPRDxQCEWX77jEezzUZ3NeCgzlhQJZUAAzYMAnij/avyZXmaKWFtzEf26BQyhlm+d
         8nMn/2eey/7jGl9PYQFV2T7bp7atInhkkLg7PdKOMl6DHMRryfOUJX4veg5i6umK7r2E
         8p04WQdhRxTqDbI8J1s44oSOauIvivVh4Yqlfi5WZlVEbl1AzJRlZKjbW/Arxqbrov+a
         1/+Yi+xcMBSEkuOQW959FR0X9l9ou02Vdri1IfkBiW8rEoYMA6Kh++1jncS99ldZANSe
         vUYKUeROl7TVcLewcduItcjgvId4IfQ5n8KaliO9ArWaAbA/HQU+oUAzjvf5BmzzbnqK
         3W7w==
X-Forwarded-Encrypted: i=1; AJvYcCXLmUlmEHb/FuRryIdYO8BS7KrSqZV4BZvgGqCUMHLrKc2KmxCiLyow7MCwlw9V5/Zkl3WJ11LiHrR5rAayZppwHKHivbUlE1jt2n6EwDU=
X-Gm-Message-State: AOJu0YyifFK7rDoTQS/MaEyJ1EK7mCKQ4rIG3fs244rNvoSUzCXQynWc
	VIKfCMM8f46BMItl4ThE7ijfZmHaFLIuC3BgWb6VYpyl7qY5m2mG
X-Google-Smtp-Source: AGHT+IFU4CN1nGtxanR0T5CSS5qgsIbFS8KzWTviVAMVaMaEVY6ZS1zZ4/+NZ3MNA4G13Q9Csbtl8Q==
X-Received: by 2002:a05:6512:3083:b0:52e:d0f8:2d30 with SMTP id 2adb3069b0e04-52fc4075b25mr44591e87.59.1721659469955;
        Mon, 22 Jul 2024 07:44:29 -0700 (PDT)
Message-ID: <54af6fb751da1103054de2d79a2057bec658f399.camel@gmail.com>
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
From: Oleksii Kurochko <inisider@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2024 16:44:28 +0200
In-Reply-To: <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
	 <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-22 at 14:54 +0200, Jan Beulich wrote:
> On 12.07.2024 18:22, Oleksii Kurochko wrote:
> > --- /dev/null
> > +++ b/xen/arch/riscv/include/asm/pmap.h
> > @@ -0,0 +1,28 @@
> > +#ifndef __ASM_PMAP_H__
> > +#define __ASM_PMAP_H__
> > +
> > +#include <xen/bug.h>
> > +#include <xen/mm.h>
> > +
> > +#include <asm/fixmap.h>
> > +
> > +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t *entry =3D &xen_fixmap[slot];
> > +=C2=A0=C2=A0=C2=A0 pte_t pte;
> > +
> > +=C2=A0=C2=A0=C2=A0 ASSERT(!pte_is_valid(*entry));
> > +
> > +=C2=A0=C2=A0=C2=A0 pte =3D mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
> > +=C2=A0=C2=A0=C2=A0 pte.pte |=3D PTE_LEAF_DEFAULT;
> > +=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);
> > +}
> > +
> > +static inline void arch_pmap_unmap(unsigned int slot)
> > +{
> > +=C2=A0=C2=A0=C2=A0 pte_t pte =3D {};
> > +
> > +=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixmap[slot], pte);
> > +}
>=20
> Why are these not using set_fixmap() / clear_fixmap() respectively?
They haven't been introduced yet. And I thought that these fucntion are
used only in pmap_{un}map() and that is the reason why I decided to not
introduce them. But while writing the answer on another comment, I
found other places where set_fixmap() / clear_fixmap() are used, so I
will introduce them and reuse here.

>=20
> > --- a/xen/arch/riscv/mm.c
> > +++ b/xen/arch/riscv/mm.c
> > @@ -370,3 +370,17 @@ int map_pages_to_xen(unsigned long virt,
> > =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
> > =C2=A0=C2=A0=C2=A0=C2=A0 return -1;
> > =C2=A0}
> > +
> > +static inline pte_t mfn_to_pte(mfn_t mfn)
>=20
> This name suggests (to me) that you're getting _the_ (single) PTE for
> a given MFN. However, what the function is doing is make a PTE using
> the given MFN. On x86 at least the common way to name such a function
> would be pte_from_mfn().
If it is a common way then I will rename it. Thanks.

~ Oleksii


>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 unsigned long pte =3D mfn_x(mfn) << PTE_PPN_SHIFT;
> > +=C2=A0=C2=A0=C2=A0 return (pte_t){ .pte =3D pte};
>=20
> Nit: Blank missing.
>=20
> Jan


