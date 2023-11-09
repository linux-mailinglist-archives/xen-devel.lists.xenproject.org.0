Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0623B7E6614
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 10:02:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629501.981782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r10vJ-0004Ox-VC; Thu, 09 Nov 2023 09:02:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629501.981782; Thu, 09 Nov 2023 09:02:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r10vJ-0004NH-RQ; Thu, 09 Nov 2023 09:02:01 +0000
Received: by outflank-mailman (input) for mailman id 629501;
 Thu, 09 Nov 2023 09:02:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NrbJ=GW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r10vI-0004NB-JB
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 09:02:00 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a423fd22-7ede-11ee-98da-6d05b1d4d9a1;
 Thu, 09 Nov 2023 10:01:59 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so7904811fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 01:01:59 -0800 (PST)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a2ea98e000000b002bf6852d135sm2162642ljq.94.2023.11.09.01.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 01:01:58 -0800 (PST)
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
X-Inumbo-ID: a423fd22-7ede-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699520519; x=1700125319; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hUlZ0XD8172RllV/D7UlmN9R3WubypjdG8BO584soiU=;
        b=kAbNBXa8MK7bSWmDvfOAhZpVNyU27nD+S5ftK4cI86s89dDAFM1uosz8bG4LV0oHRm
         qOug7kKSZLItaYGwa/3ie4D5le1LdgYzk595n8DPV1wfaVQ9F8IFjVCy3LazMqJ9BZFr
         vglYTkMTeQJZa+qewQIoOXGOZXHgzZOEx7n9Oo6EIiST6l5UnRpfu9A4MPdRpqcxoMNh
         hisWqw+kevY970W2gUx93UTPp+M5gdA85bLgsAxuRpGtkl6Dx7QMUVjd7ixQeGytTGyF
         7AgYJZoeTiJare251j2R8eCwsWGJIZ1TUP+prPAQkJ/dfS7NSFg5AiUrVf6Jik0DTibJ
         4cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699520519; x=1700125319;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hUlZ0XD8172RllV/D7UlmN9R3WubypjdG8BO584soiU=;
        b=xFjJmHdIOF0aatkz+WEoVOzqsXlcX5Ovu+mKCUVEtpiroyWTUygtAeU87GwAwyuDYd
         un3BH0a5wRHN5RSy4NHeOkx9rxBpIvUktOHxOwE0FGPza7fFWdtG7i6FY0KCONuasFmJ
         aNFUXrgau2q3aYcl4cjomBEZSMrK6/veJ9te5KFnpzgAdt3SiuPNvjytfXvoeWcBE34v
         SYzjv2fzObsYkcqn/fr1zOeuuZaOGz7ii9LmhhO0woPk471MbjAAdsBR8wQKg0CWNC2I
         d9zbpQP13JPyOQiYtcJt8FxX/kvJrb7+pOGWqvlxUvMkym50JwCpNYky9dEkV4eKYdpa
         CYQQ==
X-Gm-Message-State: AOJu0YySzp9wkKWfXJi60IYVuFIRRTRkXyAEAt9T49/i4fi2tCclQHN0
	xLNqHr8ZwRs76aIqtboigP4=
X-Google-Smtp-Source: AGHT+IER/UjuseVnWQwGRKP4CiBsg8kTFBsOxm4ShhPbYH3Utq8ZoUnZOfh4brW1yq0IwjZ0ccF7tQ==
X-Received: by 2002:a2e:a78f:0:b0:2c2:9872:dfc1 with SMTP id c15-20020a2ea78f000000b002c29872dfc1mr4587202ljf.42.1699520518812;
        Thu, 09 Nov 2023 01:01:58 -0800 (PST)
Message-ID: <314745757996935d8b2ae9919410c1abc0c86ce9.camel@gmail.com>
Subject: Re: [PATCH] xen: avoid generation of stub <asm/pci.h> header
From: Oleksii <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Wei
 Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
Date: Thu, 09 Nov 2023 11:01:57 +0200
In-Reply-To: <68471b07-6091-46c0-b2aa-562fcdec4a42@xen.org>
References: 
	<f3fff005a4f9af419144d768afcf2fd4de3f21a4.1698833709.git.oleksii.kurochko@gmail.com>
	 <68471b07-6091-46c0-b2aa-562fcdec4a42@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

On Mon, 2023-11-06 at 23:36 +0000, Julien Grall wrote:
> Hi Oleksii,
>=20
> On 01/11/2023 10:15, Oleksii Kurochko wrote:
> > Platforms which doesn't have HAS_PCI enabled it is needed to
> > have <asm/pci.h>, which contains only an empty definition of
> > struct arch_pci_dev ( except ARM, it introduces several
> > ARM-specific functions ).
> >=20
> > Also, for architectures ( such as PPC or RISC-V ) on initial
> > stages of adding support, it is needed to generate <asm/pci.h>
> > for only define the mentioned above arch_pci_dev structure.
> >=20
> > For the Arm-only stubs ( mentioned in <asm/pci.h> for disabled
> > HAS_PCI and ARM-specific) will be needed
> NIT: You seem to have a mix of ARM and Arm within the same commit=20
> message. I know that there are debate on which one to use (even
> though=20
> the latter is correct). I am ok if you want to either, but please at=20
> least be consistent :).
Thanks. I'll be consistent in the future, and I am OK if the commit
message will be changed during the merge ( if it is convenient ).
>=20
> > to add <asm/pci.h> directly alongside <xen/pci.h>. Only to
> > <arm/domain.c> <asm/pci.h> was added.
>=20
> You are lucky here because there is only one place needed, so
> including=20
> both <xen/pci.h> and <asm/pci.h> is ok. However, I am not sure I like
> this approach as a general solution as it may require to include both
> the common and arch specific header in multiple places.
>=20
> Anyway, we can discuss this in more details once we have an example.
This is not the best solution, but it works for now.
Let's discuss it again when we will face the necessity of including
both headers.
>=20
> Acked-by: Julien Grall <jgrall@amazon.com>
Thanks.

>=20
> >=20
> > Suggested-by: Jan Beulich <jbeulich@suse.com>
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0 xen/arch/arm/domain_build.c=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> > =C2=A0 xen/arch/arm/include/asm/pci.h |=C2=A0 7 -------
> > =C2=A0 xen/arch/ppc/include/asm/pci.h |=C2=A0 7 -------
> > =C2=A0 xen/include/xen/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 11 +++++++++++
> > =C2=A0 4 files changed, 12 insertions(+), 14 deletions(-)
> > =C2=A0 delete mode 100644 xen/arch/ppc/include/asm/pci.h
> >=20
> > diff --git a/xen/arch/arm/domain_build.c
> > b/xen/arch/arm/domain_build.c
> > index 49792dd590..2dd2926b41 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -23,6 +23,7 @@
> > =C2=A0 #include <asm/kernel.h>
> > =C2=A0 #include <asm/setup.h>
> > =C2=A0 #include <asm/tee/tee.h>
> > +#include <asm/pci.h>
> > =C2=A0 #include <asm/platform.h>
> > =C2=A0 #include <asm/psci.h>
> > =C2=A0 #include <asm/setup.h>
> > diff --git a/xen/arch/arm/include/asm/pci.h
> > b/xen/arch/arm/include/asm/pci.h
> > index 8cb46f6b71..7f77226c9b 100644
> > --- a/xen/arch/arm/include/asm/pci.h
> > +++ b/xen/arch/arm/include/asm/pci.h
> > @@ -130,13 +130,6 @@ bool pci_check_bar(const struct pci_dev *pdev,
> > mfn_t start, mfn_t end);
> > =C2=A0=20
> > =C2=A0 #else=C2=A0=C2=A0 /*!CONFIG_HAS_PCI*/
> > =C2=A0=20
> > -struct arch_pci_dev { };
> > -
> > -static always_inline bool is_pci_passthrough_enabled(void)
> > -{
> > -=C2=A0=C2=A0=C2=A0 return false;
> > -}
> > -
> > =C2=A0 struct pci_dev;
> > =C2=A0=20
> > =C2=A0 static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
>=20
> Some of the definion in !CONFIG_HAS_PCI seems unnecessary. This one
> is=20
> an example. I will have a look to clean them up after your patch is=20
> committed.
>=20
> Cheers,
>=20
~ Oleksii


