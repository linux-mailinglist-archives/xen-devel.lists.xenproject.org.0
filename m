Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DC793A4EA
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 19:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763422.1173693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWJGW-00064Y-4a; Tue, 23 Jul 2024 17:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763422.1173693; Tue, 23 Jul 2024 17:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWJGW-00061p-10; Tue, 23 Jul 2024 17:25:32 +0000
Received: by outflank-mailman (input) for mailman id 763422;
 Tue, 23 Jul 2024 17:25:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWJGV-00061j-5o
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 17:25:31 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e23a12e-4918-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 19:25:29 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52f008aa351so3711815e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 10:25:28 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c7b6b49sm560816466b.52.2024.07.23.10.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 10:25:27 -0700 (PDT)
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
X-Inumbo-ID: 8e23a12e-4918-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721755528; x=1722360328; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AqfKVDpD5/hFYkOOqLHCRvOZZqZemtIDnbKGDolJazk=;
        b=IEuUhxW63pn73VF5oeQL87Dn/fddmbD0IjTHW0XX1yoSL4dGIPJjDoao/Zny5Dn3hP
         iSTUBIwNxuDXi4hO4ZUVA+8QWJonhwkHVqUPqctw/0iznriQPN4AAwTHWL9EtfdCJDLM
         d8iCfhCgeb0lx5CYZAjZ901Kjy9beMM/hzq8WZO6xoojcJZB5s4M2KTIA/3m8Vn5Jk7C
         PPjF0IyBnkq1McTELE72YBaTxoF6GiKz88A8Pi8ggC3rqSIUxKS5ti/yW5MDM1Ri3ROj
         LCK3YpgIiPqfS0g2s8BgseDOu7Cfw2nZg03faMzIg2h0TC/SAvfVk2O2LTp+0OC52unk
         MKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721755528; x=1722360328;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AqfKVDpD5/hFYkOOqLHCRvOZZqZemtIDnbKGDolJazk=;
        b=OAiiuxTJeppy3IU6TEQhhVCgYfK9GZTS8cAm4avC8ajsgImahTzy5gpru4wEYtZ7rQ
         Gt2Ijn4Ry9nSwf2KjuKAC6qsaK4eSHWbDJs7obk7y9rf6DpaoycAbOlQOqJerQA5Rb2o
         Z/PKAFzzZ/ZfAxi1VsFet7o8qfUWPmJZX+j+S7UK2JCHAEzV7Bb76mB18bSM7C0dd2T4
         SXNXv2zitqOLLsngVgDTGQI/3AkIgeJr8Aiv5s/WyLcr9r049XhAi3ovorFCyN6ItfGD
         a1n+Ufewcxcib+nrpAs6G2RubRT1gBj5mNuf4Rn7BYcmTJx3F8LhvUEqXuuaLmJxVVN4
         uusg==
X-Forwarded-Encrypted: i=1; AJvYcCVfrqv++E8+/nws0EgkDQrax18qgqDfdfpul2D9BOaY3sDhWX4NfIw3SyIRqreuAw8sbjGpmNdbYJoQcUtGdILD562wmJFWlwOU7azF/pU=
X-Gm-Message-State: AOJu0YwLN87E+iMe2nowz/1H8XCZYYWqoRBUrTpyPgnASBozIz01Y8pI
	LZHiCBzxqykvB1/8BxJYVaPbzF0d0tqyxdorcml3b91vnyAcSRPa
X-Google-Smtp-Source: AGHT+IHBfNZxWpf//OIX7NYV6r92xF/0Lr6XJO403xDplHZ0s9dvVAtM8nrcNq3bdG5VaPAALd0Kcg==
X-Received: by 2002:a05:6512:3343:b0:52e:be50:9c66 with SMTP id 2adb3069b0e04-52fcda6f35bmr160407e87.53.1721755527559;
        Tue, 23 Jul 2024 10:25:27 -0700 (PDT)
Message-ID: <29c8b24ecd240268caa64ddcc590188ec3e80cd1.camel@gmail.com>
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
From: oleksii.kurochko@gmail.com
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org
Date: Tue, 23 Jul 2024 19:25:26 +0200
In-Reply-To: <9baa3203-b8d0-4774-a2a5-7ba61b213f1c@xen.org>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
	 <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com>
	 <54af6fb751da1103054de2d79a2057bec658f399.camel@gmail.com>
	 <623da862-8e76-4d40-9aa9-b02c8fd9944d@xen.org>
	 <a53ef38e044db149bb37b70f1e56a33c6a3e7c83.camel@gmail.com>
	 <26ae01e2-d085-48d7-8b1f-da1e44b01e53@xen.org>
	 <CAMacjJwWLjGcFbYEhCPyNEW_+sfb51+XtKqyBcc2JGm=D5bf0w@mail.gmail.com>
	 <97c82aca-0b8a-4b78-980b-0857dbdae80a@suse.com>
	 <4c9eb7a79c33c7cd2f6bde05b1fbc7770e662026.camel@gmail.com>
	 <14ffb00d-d6ba-4c18-88c1-2601a2df8a8b@suse.com>
	 <b7e248ae79aaded532d86453520fcb4cb7a7fb3b.camel@gmail.com>
	 <9baa3203-b8d0-4774-a2a5-7ba61b213f1c@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-23 at 16:49 +0100, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 23/07/2024 16:36, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-07-23 at 12:02 +0200, Jan Beulich wrote:
> > > On 23.07.2024 10:55, oleksii.kurochko@gmail.com=C2=A0wrote:
> > > > On Tue, 2024-07-23 at 10:36 +0200, Jan Beulich wrote:
> > > > > On 23.07.2024 10:02, Oleksii Kurochko wrote:
> > > > > > On Mon, Jul 22, 2024 at 7:27=E2=80=AFPM Julien Grall
> > > > > > <julien@xen.org>
> > > > > > wrote:
> > > > > > > > > On 22/07/2024 15:44, Oleksii Kurochko wrote:
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 /* Map a 4k page in a fixmap entry=
 */
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 void set_fixmap(unsigned map, mfn_=
t mfn, unsigned
> > > > > > > > int
> > > > > > > > flags)
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pte;
> > > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D mf=
n_to_xen_entry(mfn, flags);
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.pte |=
=3D PTE_LEAF_DEFAULT;
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(=
&xen_fixmap[pt_index(0,
> > > > > > > > FIXMAP_ADDR(map))],
> > > > > > > > pte);
> > > > > > >=20
> > > > > > > It would be saner to check if you are not overwriting any
> > > > > > > existing
> > > > > > > mapping as otherwise you will probably need a TLB flush.
> > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > > > >=20
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 /* Remove a mapping from a fixmap =
entry */
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 void clear_fixmap(unsigned map)
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 {
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pte =
=3D {0};
> > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(=
&xen_fixmap[pt_index(0,
> > > > > > > > FIXMAP_ADDR(map))],
> > > > > > > > pte);
> > > > > > >=20
> > > > > > > Don't you need a TLB flush?
> > > > > > >=20
> > > > > > Inside write_pte() there is "sfence.vma".
> > > > >=20
> > > > > That's just a fence though, not a TLB flush.
> > > > =C2=A0From the privileged doc:
> > > > =C2=A0=C2=A0=C2=A0 ```
> > > > =C2=A0=C2=A0=C2=A0 SFENCE.VMA is also used to invalidate entries in=
 the
> > > > =C2=A0=C2=A0=C2=A0 address-translation cache associated with a hart=
 (see
> > > > Section
> > > > 4.3.2).
> > > > =C2=A0=C2=A0=C2=A0 ...
> > > > =C2=A0=C2=A0=C2=A0 The SFENCE.VMA is used to flush any local hardwa=
re caches
> > > > related to
> > > > =C2=A0=C2=A0=C2=A0 address translation.
> > > > =C2=A0=C2=A0=C2=A0 It is specified as a fence rather than a TLB flu=
sh to
> > > > provide
> > > > cleaner
> > > > =C2=A0=C2=A0=C2=A0 semantics with respect to
> > > > =C2=A0=C2=A0=C2=A0 which instructions are affected by the flush ope=
ration and
> > > > to
> > > > support a
> > > > =C2=A0=C2=A0=C2=A0 wider variety of dynamic
> > > > =C2=A0=C2=A0=C2=A0 caching structures and memory-management schemes=
.
> > > > SFENCE.VMA is
> > > > also
> > > > =C2=A0=C2=A0=C2=A0 used by higher
> > > > =C2=A0=C2=A0=C2=A0 privilege levels to synchronize page table write=
s and the
> > > > address
> > > > =C2=A0=C2=A0=C2=A0 translation hardware.
> > > > =C2=A0=C2=A0=C2=A0 ...
> > > > =C2=A0=C2=A0=C2=A0 ```
> > > > I read this as SFENCE.VMA is used not only for ordering of
> > > > load/stores,
> > > > but also to flush TLB ( which is a type of more general term as
> > > > address-translation cache, IIUIC ).
> I have to admit, I am a little because concerned with calling
> sfence.vma=20
> in write_pte() (this may only be because I am not very familiar with=20
> RISC-V).
>=20
> We have cases where multiple entry will be written in a single=20
> map_pages_to_xen() call. So wouldn't this means that the local TLBs=20
> would be nuked for every write rather than once?
Yes, it will be nuked. It is bad from perfomance point of view.
I just wanted to be sure that I won't miss to put sfence.vma when it is
necessary and then reworked that a little bit after. But it seems it
would be better not to call sfence.vma in write_pte() just from the
start.


>=20
>=20
> > >=20
> > > Oh, I see. Kind of unexpected for an instruction of that name.
> > > Yet
> > > note
> > > how they talk about the local hart only. You need a wider scope
> > > TLB
> > > flush here.
> > Could you please clarify why it is needed wider?
> >=20
> > Arm Xen flushed only local TLB.
>=20
> Which code are you looking at? set_fixmap() will propagate the TLB
> flush=20
> to all innershareable CPUs.
Yes, here I agree that set_fixmap() uses map_pages_to_xen which
somewhere inside uses flush_xen_tlb_range_va() ( not
flush_xen_tlb_range_va() ) so TLB flush will happen for all
innershareable CPUs.
>=20
> The PMAP interface will do a local TLB flush because the interface
> can=20
> only be used during early boot where there is a single CPU running.

Yes, I am looking at PMAP:
   static inline void arch_pmap_unmap(unsigned int slot)
   {
       lpae_t pte =3D {};
  =20
       write_pte(&xen_fixmap[slot], pte);
  =20
       flush_xen_tlb_range_va(FIXMAP_ADDR(slot), PAGE_SIZE);
   }
IIUC, originaly Jan told about arch_pmap_unmap() case so that is why I
decided to clarify additionaly.

>=20
> > RISC-V Linux kernel for fixmap also uses: local_flush_tlb_page().
>=20
> I don't know how Linux is using set_fixmap(). But what matters is how
> Xen is using set_fixmap(). We have a couple of places in Xen where
> the=20
> fixmap needs to be accessed by all the CPUs.
>=20
> Given this is a common interface in Xen, I think it makes sense to=20
> follow the same approach to avoid any confusion.
Sure. Thanks for claryfying. I will flush_xen_tlb_range_va() for
set_fixmap().


~ Oleksii

