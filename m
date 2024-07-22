Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2159392F6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 19:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762273.1172417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwXt-0003DD-P9; Mon, 22 Jul 2024 17:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762273.1172417; Mon, 22 Jul 2024 17:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVwXt-0003Ad-MV; Mon, 22 Jul 2024 17:09:57 +0000
Received: by outflank-mailman (input) for mailman id 762273;
 Mon, 22 Jul 2024 17:09:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H4cl=OW=gmail.com=inisider@srs-se1.protection.inumbo.net>)
 id 1sVwXs-0003AX-22
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 17:09:56 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36c01774-484d-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 19:09:54 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52f024f468bso2128626e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 10:09:54 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52efce504e3sm910195e87.109.2024.07.22.10.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 10:09:52 -0700 (PDT)
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
X-Inumbo-ID: 36c01774-484d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721668193; x=1722272993; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Fie+5TwjN6CDpwmiwmY8Q21t7VoAbo4DMmV+x9ms7Ws=;
        b=IZXHdgItpg1JXA3lUk2cjR4KcdhdKCoEMEeGcVHMQrMUCvEF5nmZp/KliwdiRD2j7J
         BuBiiaqJjcXjwo9qdzbB1nE068Vm9hj9r4Pn82ifPx3EW/2ZzclHjVjJKlUPR7ig6ZWB
         ob0MbiiuZ+ctglcN0RIYae8agI9ypV64IzqCJQ3Lw7AvNlsDW9nFveGlpuL4d7fHYQrd
         Xl+6sezFKdsjIaC4ILAsPXtk+rqO9u4e6EvRe2YrNbBTbVXCPbmy6CI5W9Nj8RnOvQE0
         AYTakGRMbX/FEId9sduCcfxXzrIc/9/IjQ8UOzX4E/aDXUUAaczzcR/oRpW4IAi+3kcy
         eYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721668193; x=1722272993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fie+5TwjN6CDpwmiwmY8Q21t7VoAbo4DMmV+x9ms7Ws=;
        b=jlIj75AmP+7cJVdkNounXWi5nwaaJE7h86QumiGbEYuNsHElAek85hK+WNckbiNZ/K
         wgf7oVj05MKPtFcMYa6+v1FdXQ4OYrq48mbs3BEXLAY4UzDI0F23u5Sh7LJzKUNjsM+U
         8/12+beSb/fSKQ0VUpSpDQP9lkfEZQ/vXz63L63mm2b4ZHWuv9ilEpV/3zjHbE+fFfnq
         RzHi8afVa58VLs+a0A3m2g1xPQ5/WgSesQ0HQZOp/dfdpZr+6lc2NfwaezREjgpArF+U
         xOCbQtGIFKaRwQx0xHFwDCHGYschSkd/FfEvOi2RPb1DvKsb2701OSqPJLcCts709V28
         enig==
X-Forwarded-Encrypted: i=1; AJvYcCU9BG39+kAVeEdpIQgZdKkVMwXhVWsuJFbmubc9D25ClvM5r7GLdsYwZrUY9frM1T69Tq6IMs5BqG/LdDU+ouYAqzSPLBwS0BCPk+AxmmU=
X-Gm-Message-State: AOJu0Ywo8E1wZRZIsAdiZ4ETTW7jmG3jRO/uwl5O66OIeTOVgq4WkihD
	pMkXQjwZdRWXRtJ7sb2IW5k8aT29JTc35IVAsFCB7M2YIxKx367s
X-Google-Smtp-Source: AGHT+IHSayyUTKE/F2d8sQdBjXIBvlyXWu7QUNG8cGxNmX8Vow6fC4hQ/gUKdCaFnHW0I8q7rGnSiQ==
X-Received: by 2002:a05:6512:2826:b0:52e:764b:b20d with SMTP id 2adb3069b0e04-52efb7e1281mr5120554e87.28.1721668193130;
        Mon, 22 Jul 2024 10:09:53 -0700 (PDT)
Message-ID: <a53ef38e044db149bb37b70f1e56a33c6a3e7c83.camel@gmail.com>
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
From: Oleksii Kurochko <inisider@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2024 19:09:51 +0200
In-Reply-To: <623da862-8e76-4d40-9aa9-b02c8fd9944d@xen.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
	 <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com>
	 <54af6fb751da1103054de2d79a2057bec658f399.camel@gmail.com>
	 <623da862-8e76-4d40-9aa9-b02c8fd9944d@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Mon, 2024-07-22 at 15:48 +0100, Julien Grall wrote:
> Hi,
>=20
> On 22/07/2024 15:44, Oleksii Kurochko wrote:
> > On Mon, 2024-07-22 at 14:54 +0200, Jan Beulich wrote:
> > > On 12.07.2024 18:22, Oleksii Kurochko wrote:
> > > > --- /dev/null
> > > > +++ b/xen/arch/riscv/include/asm/pmap.h
> > > > @@ -0,0 +1,28 @@
> > > > +#ifndef __ASM_PMAP_H__
> > > > +#define __ASM_PMAP_H__
> > > > +
> > > > +#include <xen/bug.h>
> > > > +#include <xen/mm.h>
> > > > +
> > > > +#include <asm/fixmap.h>
> > > > +
> > > > +static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 pte_t *entry =3D &xen_fixmap[slot];
> > > > +=C2=A0=C2=A0=C2=A0 pte_t pte;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 ASSERT(!pte_is_valid(*entry));
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 pte =3D mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_R=
W);
> > > > +=C2=A0=C2=A0=C2=A0 pte.pte |=3D PTE_LEAF_DEFAULT;
> > > > +=C2=A0=C2=A0=C2=A0 write_pte(entry, pte);
> > > > +}
> > > > +
> > > > +static inline void arch_pmap_unmap(unsigned int slot)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 pte_t pte =3D {};
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixmap[slot], pte);
> > > > +}
> > >=20
> > > Why are these not using set_fixmap() / clear_fixmap()
> > > respectively?
> > They haven't been introduced yet. And I thought that these fucntion
> > are
> > used only in pmap_{un}map() and that is the reason why I decided to
> > not
> > introduce them. But while writing the answer on another comment, I
> > found other places where set_fixmap() / clear_fixmap() are used, so
> > I
> > will introduce them and reuse here.
>=20
> I am guessing you are going to implement set_fixmap()/clear_fixmap()=20
> using map_pages_to_xen(). If so, for early boot you are going to end
> up=20
> in a circular loop because map_pages_to_xen() will likely use pmap()=20
> which will call set_fixmap().
I am going to implement that in the following way as I faced the
described by you issue when I first time tried to implement it using
map_pages_to_xen():
   /* Map a 4k page in a fixmap entry */
   void set_fixmap(unsigned map, mfn_t mfn, unsigned int flags)
   {
       pte_t pte;
  =20
       pte =3D mfn_to_xen_entry(mfn, flags);
       pte.pte |=3D PTE_LEAF_DEFAULT;
       write_pte(&xen_fixmap[pt_index(0, FIXMAP_ADDR(map))], pte);
   }
  =20
   /* Remove a mapping from a fixmap entry */
   void clear_fixmap(unsigned map)
   {
       pte_t pte =3D {0};
       write_pte(&xen_fixmap[pt_index(0, FIXMAP_ADDR(map))], pte);
   }
  =20
~ Oleksii

>=20
> There is a big comment in common/pmap.c which explain why arch_pmap_*
> was introduced rather than calling *_fixmap() directly:
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0 /*
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * We cannot use set_fixmap() here. We use =
PMAP when the domain
> map
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * page infrastructure is not yet initializ=
ed, so=20
> map_pages_to_xen() called
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * by set_fixmap() needs to map pages on de=
mand, which then
> calls=20
> pmap()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * again, resulting in a loop. Modify the P=
TEs directly instead.
> The same
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * is true for pmap_unmap().
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>=20
> Cheers,
>=20


