Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D491493A3CC
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 17:37:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763342.1173614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWHZI-0003zq-Ra; Tue, 23 Jul 2024 15:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763342.1173614; Tue, 23 Jul 2024 15:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWHZI-0003wi-Nx; Tue, 23 Jul 2024 15:36:48 +0000
Received: by outflank-mailman (input) for mailman id 763342;
 Tue, 23 Jul 2024 15:36:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWHZH-0003vM-9H
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 15:36:47 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dd7bd1f-4909-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 17:36:45 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so83805841fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 08:36:45 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ef3074e87asm7999261fa.81.2024.07.23.08.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 08:36:43 -0700 (PDT)
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
X-Inumbo-ID: 5dd7bd1f-4909-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721749004; x=1722353804; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lIj8zvACM1852usyHUDax4NYrsFS+cOKd746s7hhDNc=;
        b=e75Rbu9R+g3wbhfTmY9NnIgENpNwrPk2+zZE2tc4Gxur9+Lp+JTWM9RgZ3GnKym5Gq
         HydkMTbJtdCRSq+h6LnTaL3YRDFzf6gCKLz6d1V50uWf2PDVs4TaZbU57SVjvxt1CcKe
         UwU5dCCNFstGSEMYYGHIQcA6K/eClHu7Q7i4B8T8CF4+5Zl7XBri9W/2wT7Kl5X9Z+Dy
         2fIAQ5Is6XjbN6llM1sno+PFGU8eoIwEePG3vWMGGFWnZ7TaVVih+3/W7f116KKqrHDB
         naQzmJBfd60JLOJ0uM/xT03qW0FEcHumAx2Rw4B5XaiIhWsXpl7FpL5mz1KT88PkzJU+
         l9YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721749004; x=1722353804;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIj8zvACM1852usyHUDax4NYrsFS+cOKd746s7hhDNc=;
        b=pfWu9pHNeX6MbHO93UEbvalHeg0A4aQOyjRg8u/P4TrPNeJhbtMalAqWyj9ueMRtEc
         mKo1TMFCje+xM8DDNaxLPjiSWGcwF0/y4yS+ygLQuzAesdRJC1PwG09SXn3dPKQIjttb
         6JByCbB877l38u4kIs6Rcr/fod3k3r4/ZawlJeyhQPqALu3OGlB9gfzNte1SEZd26iew
         pgIlJh+IgybBE75yZTwBgbCnNPIDk8VnIVy3AGHtmuzlqh5eH6v+YPjaYV2VKdjTV8o2
         c90f/QVvka4ePzr2eMS6+BiWEberTkw+FfToSLqrOBHGxHrm/kY/2Jouo/kuyV8SZr0+
         /now==
X-Forwarded-Encrypted: i=1; AJvYcCUYUb+qF/ZXRJRgyAERtiOE6U2p9Hmfcg1GvQpKhuW7opO90k0huS8b96Cuglcm59VBUdcOLDNfxq94RhS0SJAVUMDPrQ+qvO7ZoleycX4=
X-Gm-Message-State: AOJu0YyxN7N17LWvdtvfdrR3m6S/ZuSDp8Yq2peJ1Pp8si/ld0SHN+PR
	7nR1ZO9JcKisoTC+/RuilWd2vZfEDf9WPKMiL1NLTf3F2xEl1ZQ7
X-Google-Smtp-Source: AGHT+IGUG1Cu4hebyLvxuTbID6fkfEusAmO1p3EkqfATCHyQm/dqBTi0nC0ABFZXPfY88T7qC/HArA==
X-Received: by 2002:a2e:8ec9:0:b0:2ef:2658:98f2 with SMTP id 38308e7fff4ca-2ef265899ebmr63252341fa.33.1721749004085;
        Tue, 23 Jul 2024 08:36:44 -0700 (PDT)
Message-ID: <b7e248ae79aaded532d86453520fcb4cb7a7fb3b.camel@gmail.com>
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org, Julien Grall
 <julien@xen.org>
Date: Tue, 23 Jul 2024 17:36:42 +0200
In-Reply-To: <14ffb00d-d6ba-4c18-88c1-2601a2df8a8b@suse.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-23 at 12:02 +0200, Jan Beulich wrote:
> On 23.07.2024 10:55, oleksii.kurochko@gmail.com=C2=A0wrote:
> > On Tue, 2024-07-23 at 10:36 +0200, Jan Beulich wrote:
> > > On 23.07.2024 10:02, Oleksii Kurochko wrote:
> > > > On Mon, Jul 22, 2024 at 7:27=E2=80=AFPM Julien Grall <julien@xen.or=
g>
> > > > wrote:
> > > > > > > On 22/07/2024 15:44, Oleksii Kurochko wrote:
> > > > > > =C2=A0=C2=A0=C2=A0 /* Map a 4k page in a fixmap entry */
> > > > > > =C2=A0=C2=A0=C2=A0 void set_fixmap(unsigned map, mfn_t mfn, uns=
igned int
> > > > > > flags)
> > > > > > =C2=A0=C2=A0=C2=A0 {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pte;
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D mfn_to_xen_e=
ntry(mfn, flags);
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.pte |=3D PTE_LEA=
F_DEFAULT;
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixma=
p[pt_index(0,
> > > > > > FIXMAP_ADDR(map))],
> > > > > > pte);
> > > > >=20
> > > > > It would be saner to check if you are not overwriting any
> > > > > existing
> > > > > mapping as otherwise you will probably need a TLB flush.
> > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0 }
> > > > > >=20
> > > > > > =C2=A0=C2=A0=C2=A0 /* Remove a mapping from a fixmap entry */
> > > > > > =C2=A0=C2=A0=C2=A0 void clear_fixmap(unsigned map)
> > > > > > =C2=A0=C2=A0=C2=A0 {
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pte =3D {0};
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixma=
p[pt_index(0,
> > > > > > FIXMAP_ADDR(map))],
> > > > > > pte);
> > > > >=20
> > > > > Don't you need a TLB flush?
> > > > >=20
> > > > Inside write_pte() there is "sfence.vma".
> > >=20
> > > That's just a fence though, not a TLB flush.
> > From the privileged doc:
> > =C2=A0=C2=A0 ```
> > =C2=A0=C2=A0 SFENCE.VMA is also used to invalidate entries in the
> > =C2=A0=C2=A0 address-translation cache associated with a hart (see Sect=
ion
> > 4.3.2).=20
> > =C2=A0=C2=A0 ...
> > =C2=A0=C2=A0 The SFENCE.VMA is used to flush any local hardware caches
> > related to
> > =C2=A0=C2=A0 address translation.
> > =C2=A0=C2=A0 It is specified as a fence rather than a TLB flush to prov=
ide
> > cleaner
> > =C2=A0=C2=A0 semantics with respect to
> > =C2=A0=C2=A0 which instructions are affected by the flush operation and=
 to
> > support a
> > =C2=A0=C2=A0 wider variety of dynamic
> > =C2=A0=C2=A0 caching structures and memory-management schemes. SFENCE.V=
MA is
> > also
> > =C2=A0=C2=A0 used by higher
> > =C2=A0=C2=A0 privilege levels to synchronize page table writes and the
> > address
> > =C2=A0=C2=A0 translation hardware.
> > =C2=A0=C2=A0 ...
> > =C2=A0=C2=A0 ```
> > I read this as SFENCE.VMA is used not only for ordering of
> > load/stores,
> > but also to flush TLB ( which is a type of more general term as
> > address-translation cache, IIUIC ).
>=20
> Oh, I see. Kind of unexpected for an instruction of that name. Yet
> note
> how they talk about the local hart only. You need a wider scope TLB
> flush here.
Could you please clarify why it is needed wider?

Arm Xen flushed only local TLB.
RISC-V Linux kernel for fixmap also uses: local_flush_tlb_page().

~ Oleksii


