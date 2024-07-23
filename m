Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45642939D03
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 10:55:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762867.1173093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBIj-0007Zn-3B; Tue, 23 Jul 2024 08:55:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762867.1173093; Tue, 23 Jul 2024 08:55:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWBIj-0007Wd-0B; Tue, 23 Jul 2024 08:55:17 +0000
Received: by outflank-mailman (input) for mailman id 762867;
 Tue, 23 Jul 2024 08:55:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/3h=OX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sWBIi-0007WX-5R
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 08:55:16 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 46629e42-48d1-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 10:55:14 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52efabf5d7bso2899796e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 01:55:14 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ef9f79b89sm1257727e87.230.2024.07.23.01.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 01:55:12 -0700 (PDT)
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
X-Inumbo-ID: 46629e42-48d1-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721724913; x=1722329713; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=76Z5IFOv5O0wP9wxNtE1qbuZnLSJK9LP8ZBzOVOSips=;
        b=kEqPCnkkFCiMRLoO+EKcLrqAeQOEs6QQAVFdU2ghlyGi9Q7mSyNjfPLJafPcpkTt0r
         tW7E3eMsynxHBJtmV5231HycMhqdcE9dlUcTwkkKsqteLzCGmqYV9jJDm05mfLSeF4j6
         H3reeJxt38bdkv3TByx+mBhxIZd5PmJUZIfSQoIiU8PKoQ7Hs6t9Rqa7WsfGp3PCYziq
         lc3h3ZXWIhvMr0uHjgIaKPzFk34QQR9ma9kGuKO9ODoIj3+PEElLT96ViEnv7Dh4ENfy
         m+/J4PQGVRMWTuENDuzEXYZ9jF1sHObJn5E6tCtog58t+rF7/qi3m6+TRA8NRWsckKbn
         tuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721724913; x=1722329713;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=76Z5IFOv5O0wP9wxNtE1qbuZnLSJK9LP8ZBzOVOSips=;
        b=Okpjl7gB/L+0nIQTV8W/4WVVbP+UFNI6JOXjhbt2nyRvaw+TXjh/mku4FckUr8jNFN
         Fm2lHU+sv3sUEJNwq5Sht4IcaDG6qizvNPku5k35fk//IVkP9EA2yQXSeONuOzxmUf6f
         zlQMsS0zmiwAbThtWrTcgI3w0SK3OKp8KCDaD/xgcaRhnKHep8UfUJ8C4UeNVI7ObufF
         1y4VUYtd8kvJObEGpvWK+deETQedBYxZvB3fzKFQop+HXQzThLOx+8Ez7WSugkKxTx6U
         r7Qwv/FxUxJmdmu/QEZLmB1ln8e5s+Yvl0IdMTllNDpi/JC/3QtQSL0B8SGyeFFt3rp/
         VXRg==
X-Forwarded-Encrypted: i=1; AJvYcCXlDj7biIvKWZ9guOPMq/6PJ48QEG6k6iuAFQjzLejpv+wgBu41NYpZctEuXQLdcgF/tOZJkQK5eVbQZfBj6TwHABMmrTzdCceDvu2/Ak8=
X-Gm-Message-State: AOJu0YzB+QGtkUAwixr+8gGFlngSdD0NYhuccEf8MDtdDLLeD3PHoDD1
	cv+jmdN/LjNdmzA2siOBGk9unwINspdhkW/iI2z/jiqTLxWGjJu0
X-Google-Smtp-Source: AGHT+IG/GdYnjN1E7ftGJni1NdmN1IYpASsqllTqQOf3vQYq8+lfPPmz98f3zXsF7c90xeWiVXWFiA==
X-Received: by 2002:a05:6512:224e:b0:52f:287:d16f with SMTP id 2adb3069b0e04-52f0287d2e8mr4781445e87.11.1721724913181;
        Tue, 23 Jul 2024 01:55:13 -0700 (PDT)
Message-ID: <4c9eb7a79c33c7cd2f6bde05b1fbc7770e662026.camel@gmail.com>
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
From: oleksii.kurochko@gmail.com
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  xen-devel@lists.xenproject.org, Julien Grall
 <julien@xen.org>
Date: Tue, 23 Jul 2024 10:55:12 +0200
In-Reply-To: <97c82aca-0b8a-4b78-980b-0857dbdae80a@suse.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
	 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
	 <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com>
	 <54af6fb751da1103054de2d79a2057bec658f399.camel@gmail.com>
	 <623da862-8e76-4d40-9aa9-b02c8fd9944d@xen.org>
	 <a53ef38e044db149bb37b70f1e56a33c6a3e7c83.camel@gmail.com>
	 <26ae01e2-d085-48d7-8b1f-da1e44b01e53@xen.org>
	 <CAMacjJwWLjGcFbYEhCPyNEW_+sfb51+XtKqyBcc2JGm=D5bf0w@mail.gmail.com>
	 <97c82aca-0b8a-4b78-980b-0857dbdae80a@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3 (3.52.3-1.fc40app2) 
MIME-Version: 1.0

On Tue, 2024-07-23 at 10:36 +0200, Jan Beulich wrote:
> On 23.07.2024 10:02, Oleksii Kurochko wrote:
> > On Mon, Jul 22, 2024 at 7:27=E2=80=AFPM Julien Grall <julien@xen.org>
> > wrote:
> > > > > On 22/07/2024 15:44, Oleksii Kurochko wrote:
> > > > =C2=A0=C2=A0=C2=A0 /* Map a 4k page in a fixmap entry */
> > > > =C2=A0=C2=A0=C2=A0 void set_fixmap(unsigned map, mfn_t mfn, unsigne=
d int
> > > > flags)
> > > > =C2=A0=C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pte;
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte =3D mfn_to_xen_entry=
(mfn, flags);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte.pte |=3D PTE_LEAF_DE=
FAULT;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixmap[pt=
_index(0, FIXMAP_ADDR(map))],
> > > > pte);
> > >=20
> > > It would be saner to check if you are not overwriting any
> > > existing
> > > mapping as otherwise you will probably need a TLB flush.
> > >=20
> > > > =C2=A0=C2=A0=C2=A0 }
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 /* Remove a mapping from a fixmap entry */
> > > > =C2=A0=C2=A0=C2=A0 void clear_fixmap(unsigned map)
> > > > =C2=A0=C2=A0=C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pte_t pte =3D {0};
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 write_pte(&xen_fixmap[pt=
_index(0, FIXMAP_ADDR(map))],
> > > > pte);
> > >=20
> > > Don't you need a TLB flush?
> > >=20
> > Inside write_pte() there is "sfence.vma".
>=20
> That's just a fence though, not a TLB flush.
From the privileged doc:
   ```
   SFENCE.VMA is also used to invalidate entries in the
   address-translation cache associated with a hart (see Section 4.3.2).=
=20
   ...
   The SFENCE.VMA is used to flush any local hardware caches related to
   address translation.
   It is specified as a fence rather than a TLB flush to provide cleaner
   semantics with respect to
   which instructions are affected by the flush operation and to support a
   wider variety of dynamic
   caching structures and memory-management schemes. SFENCE.VMA is also
   used by higher
   privilege levels to synchronize page table writes and the address
   translation hardware.
   ...
   ```
I read this as SFENCE.VMA is used not only for ordering of load/stores,
but also to flush TLB ( which is a type of more general term as
address-translation cache, IIUIC ).

Also, Linux kernel uses sfence.vma to flush TLB:
https://elixir.bootlin.com/linux/v6.0/source/arch/riscv/include/asm/tlbflus=
h.h#L23

~ Oleksii

