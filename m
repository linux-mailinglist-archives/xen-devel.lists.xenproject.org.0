Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0AE7E7ADB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:30:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630029.982686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nqi-0003zW-Bl; Fri, 10 Nov 2023 09:30:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630029.982686; Fri, 10 Nov 2023 09:30:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nqi-0003x5-91; Fri, 10 Nov 2023 09:30:48 +0000
Received: by outflank-mailman (input) for mailman id 630029;
 Fri, 10 Nov 2023 09:30:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1Nqg-0001XY-Ek
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:30:46 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2c523a1-7fab-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 10:30:44 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-53e2308198eso2954516a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 01:30:44 -0800 (PST)
Received: from [192.168.201.133] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 bh11-20020a170906a0cb00b0099bd1a78ef5sm3673074ejb.74.2023.11.10.01.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 01:30:43 -0800 (PST)
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
X-Inumbo-ID: d2c523a1-7fab-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699608643; x=1700213443; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k97xU64J5vTy/lN5XAno/ceDC32Hc2VjxczYpdq0V9E=;
        b=JJDItUL0PIeIlE/n/Rs/Aax3GCjXRQCC76dhHtVC0gUF/7XFIFQS/elOgCZ+9gq5cY
         O4c8KTd/JxdFibx091u61LYtMjN3ZupxsDy8cEq+OjT2tHqfs24zkQYoUcnwjTKkx1S+
         Cf72GgqztS5PtNyD72mTbosewJW1Wl0GaQo35cP7eox/g/Yi83H/z79KV2VwgMsZfFP1
         +TfJeLwGVSHNaobNOsmQh6TcY7wYVer2vDzgbb7U6LxdcBuVdWyeSTzR9JHQMG3BnEyM
         Dr6HCWyfiDuJRtt+7npj14dUoRj/FH14dgiRNji1kuHPObvkcc16Avfj0PYvjN5Epk8z
         qWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699608643; x=1700213443;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k97xU64J5vTy/lN5XAno/ceDC32Hc2VjxczYpdq0V9E=;
        b=hN+x9yyEThUfxEWxs3q1fSXuwsRncDPspw3dm2GnLDiXnjnMim0XsNoKJ36n9oGugA
         mKVIkGBNL4V2W/4AUW5pV+T1MKlfMBB/F8FPrxCRW46ZLYAm9+//NKfrLp3gTGhBp4pS
         9BLr+PAnGQx3rSW18MEnQey+Qr6ENi15bHdpX2k+b+dgSjOWa7by25pD8UPhjRafPykC
         4c7jJLu6l5GVLPF3x0U4tna5WCeZ252w9eJI5y4wKl5bpAWmbGkB/DdSi36P1XWxlSbX
         vWzl4zhkoYhC9k0vYPeimZmefCMck5fihwvaBqhw3qIby8jpTzrbaG1/o0zUTiM7vzu1
         sLTA==
X-Gm-Message-State: AOJu0Yzc7MxeclzCCnCFvVEIQY+Aoun/x0N+/nhIjIUoP2hEPSprXqzT
	VlP0fC+pp9L6ZWXu3GK5ffRO1GFXoyE=
X-Google-Smtp-Source: AGHT+IGzmjVJdcdsnEeSMCIGbu/93thi48QpGa7cwuah868JfRpL+vbvVDHzMRlhqIUpje7R8j/iqw==
X-Received: by 2002:a17:907:71c8:b0:9e4:198e:6c30 with SMTP id zw8-20020a17090771c800b009e4198e6c30mr3972571ejb.45.1699608643355;
        Fri, 10 Nov 2023 01:30:43 -0800 (PST)
Message-ID: <1d89dceb97c82504d4ed66d95f799f0a2e433716.camel@gmail.com>
Subject: Re: [PATCH] xen: avoid generation of stub <asm/pci.h> header
From: Oleksii <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,  George Dunlap
 <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, Shawn Anastasio
 <sanastasio@raptorengineering.com>
Date: Fri, 10 Nov 2023 11:30:42 +0200
In-Reply-To: <f3fff005a4f9af419144d768afcf2fd4de3f21a4.1698833709.git.oleksii.kurochko@gmail.com>
References: 
	<f3fff005a4f9af419144d768afcf2fd4de3f21a4.1698833709.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0

Hi all,

On Wed, 2023-11-01 at 12:15 +0200, Oleksii Kurochko wrote:
> Platforms which doesn't have HAS_PCI enabled it is needed to
> have <asm/pci.h>, which contains only an empty definition of
> struct arch_pci_dev ( except ARM, it introduces several
> ARM-specific functions ).
>=20
> Also, for architectures ( such as PPC or RISC-V ) on initial
> stages of adding support, it is needed to generate <asm/pci.h>
> for only define the mentioned above arch_pci_dev structure.
>=20
> For the Arm-only stubs ( mentioned in <asm/pci.h> for disabled
> HAS_PCI and ARM-specific) will be needed
> to add <asm/pci.h> directly alongside <xen/pci.h>. Only to
> <arm/domain.c> <asm/pci.h> was added.
>=20
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> =C2=A0xen/arch/arm/domain_build.c=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0xen/arch/arm/include/asm/pci.h |=C2=A0 7 -------
> =C2=A0xen/arch/ppc/include/asm/pci.h |=C2=A0 7 -------
> =C2=A0xen/include/xen/pci.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 11 +++++++++++
> =C2=A04 files changed, 12 insertions(+), 14 deletions(-)
> =C2=A0delete mode 100644 xen/arch/ppc/include/asm/pci.h
>=20
> diff --git a/xen/arch/arm/domain_build.c
> b/xen/arch/arm/domain_build.c
> index 49792dd590..2dd2926b41 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -23,6 +23,7 @@
> =C2=A0#include <asm/kernel.h>
> =C2=A0#include <asm/setup.h>
> =C2=A0#include <asm/tee/tee.h>
> +#include <asm/pci.h>
> =C2=A0#include <asm/platform.h>
> =C2=A0#include <asm/psci.h>
> =C2=A0#include <asm/setup.h>
> diff --git a/xen/arch/arm/include/asm/pci.h
> b/xen/arch/arm/include/asm/pci.h
> index 8cb46f6b71..7f77226c9b 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -130,13 +130,6 @@ bool pci_check_bar(const struct pci_dev *pdev,
> mfn_t start, mfn_t end);
> =C2=A0
> =C2=A0#else=C2=A0=C2=A0 /*!CONFIG_HAS_PCI*/
> =C2=A0
> -struct arch_pci_dev { };
> -
> -static always_inline bool is_pci_passthrough_enabled(void)
> -{
> -=C2=A0=C2=A0=C2=A0 return false;
> -}
> -
> =C2=A0struct pci_dev;
> =C2=A0
> =C2=A0static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
> diff --git a/xen/arch/ppc/include/asm/pci.h
> b/xen/arch/ppc/include/asm/pci.h
> deleted file mode 100644
> index e76c8e5475..0000000000
> --- a/xen/arch/ppc/include/asm/pci.h
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -#ifndef __ASM_PPC_PCI_H__
> -#define __ASM_PPC_PCI_H__
> -
> -struct arch_pci_dev {
> -};
> -
> -#endif /* __ASM_PPC_PCI_H__ */
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index 251b8761a8..168ca320ce 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -68,7 +68,18 @@ typedef union {
> =C2=A0=C2=A0=C2=A0=C2=A0 };
> =C2=A0} pci_sbdf_t;
> =C2=A0
> +#ifdef CONFIG_HAS_PCI
> =C2=A0#include <asm/pci.h>
> +#else
> +
> +struct arch_pci_dev { };
> +
> +static always_inline bool is_pci_passthrough_enabled(void)
> +{
> +=C2=A0=C2=A0=C2=A0 return false;
> +}
> +
> +#endif
> =C2=A0
> =C2=A0struct pci_dev_info {
> =C2=A0=C2=A0=C2=A0=C2=A0 /*

I forgot to update xen/arch/{arm,ppc}/include/asm/Makefile:
    generic-y +=3D pci.h

Should I send a new patch version or it can be updated durig merge?

~ Oleksii


