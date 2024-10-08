Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01429953C4
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 17:48:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813267.1226130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCRP-0006Ed-JC; Tue, 08 Oct 2024 15:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813267.1226130; Tue, 08 Oct 2024 15:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syCRP-0006D7-Fk; Tue, 08 Oct 2024 15:48:03 +0000
Received: by outflank-mailman (input) for mailman id 813267;
 Tue, 08 Oct 2024 15:48:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J5/k=RE=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syCRO-0006Bn-LR
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 15:48:02 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2fd00d4-858c-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 17:48:01 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-5369f1c7cb8so6269778e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 08:48:01 -0700 (PDT)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539afe32721sm1243599e87.0.2024.10.08.08.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2024 08:48:00 -0700 (PDT)
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
X-Inumbo-ID: b2fd00d4-858c-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728402481; x=1729007281; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8STzR2wZXHnVeQ/eH4jvwv7sLTkrF8h23aYxeCGecL0=;
        b=BBa+yI91D9AWNHJb+LaN35aGRddv4ylXMyPzjgJwgLXRs3UOVF7OG4CjAX0Tg64nFo
         z+dKydTq8abHPBnZsICd/32eB6zksNWOiFxOOD03wyiSsG66u5MIrI+ll3w2GR3GhidL
         EI2EsUlYu9nRQVnMdQDx4cOLQ8YTF2ZOLk1c/BxVtzMhNWZbF1xQIV33qg6+LKb4Hzb4
         p9uM42ZTjKG9B+IU9k+0kgxQ3i0HjBgh6Ki1GOoLv6Rp4F15iQ9X2uP67MmwMEX3H5q4
         s6v5rz+ALJNi4fOM2g2XONn1vpAnLzzkqyLPtBcF509gkuCgsWTkOT1HQBUkL0/mHS0u
         o45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728402481; x=1729007281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8STzR2wZXHnVeQ/eH4jvwv7sLTkrF8h23aYxeCGecL0=;
        b=k2YXQveL+93RV6vl2zYKFZwskXWIHSn0LNFNhPIZLnvn3CIEo9D5orlGQWByLh7BWH
         T/kBaE1+pxmi9di1Yoq0DlW9tTPZLkzxp8Ld/zutgo9s6m3MKqENt2+efHdrwciGs0e6
         e6b9HAssw2A5h+nUtKvKaLmYNod82bGmyhHg1Q7vEdRF1255KgayrlzfhCVpy/THDpNW
         XpZ63h/e7RwQoawHNiuAcat9OX/iklZUiqzmD/2n5PvBy1j4xN0u2B/7aCYvGS9TfOqp
         k1UKjj+94zN7UZnNNUjOA7USmISvPvGAfhFwhpX2mn9N7z81B7Uk7Z22NW9YTAs5h1j7
         8Whg==
X-Gm-Message-State: AOJu0Yy2f4RpJcp4hzV5HIbxflGTIU20vs5osBkBlHcA/NWIN5Goae8N
	FTmbak8Jhoj5J+00NGoMQx6V39BVoQ7Xcx4CARH7Xjlw6sw8iFfU7rGkYw==
X-Google-Smtp-Source: AGHT+IHU67EkF8PITybY7gS2Hk0NIos5CJZzxjdcQKhLnyxdDPe3Xl0YLPYimv+Jr0aFTFBNUKU1Ww==
X-Received: by 2002:a05:6512:e84:b0:530:aa82:a50a with SMTP id 2adb3069b0e04-539ab9d0326mr8788274e87.45.1728402480587;
        Tue, 08 Oct 2024 08:48:00 -0700 (PDT)
Message-ID: <0ee9d1259a824b07642040d3b488c29aa6117f72.camel@gmail.com>
Subject: Re: [PATCH v5 1/6] xen: introduce DECL_SECTION_WITH_LADDR
From: oleksii.kurochko@gmail.com
To: xen-devel@lists.xenproject.org, Shawn Anastasio
	 <sanastasio@raptorengineering.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>,  Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>
Date: Tue, 08 Oct 2024 17:47:59 +0200
In-Reply-To: <e835f07478a528266f72d9ac99c090464522bbdf.1727452451.git.oleksii.kurochko@gmail.com>
References: <cover.1727452451.git.oleksii.kurochko@gmail.com>
	 <e835f07478a528266f72d9ac99c090464522bbdf.1727452451.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40app2) 
MIME-Version: 1.0

Hello Shawn,

On Fri, 2024-09-27 at 18:32 +0200, Oleksii Kurochko wrote:
> Introduce DECL_SECTION_WITH_LADDR in order to signal whether
> DECL_SECTION() should specify a load address or not.
>=20
> Update {ppc,x86}/xen.lds.S to use DECL_SECTION_WITH_LADDR.
>=20
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

Could you please take a look at this patch as it requires your Ack?

Thanks in advance.

~ Oleksii

> ---
> Changes in V5:
> =C2=A0- s/SIMPLE_DECL_SECTION/DECL_SECTION_WITH_LADDR.
> =C2=A0- add space between # and define in x86/xen.lds.S.
> =C2=A0- use DECL_SECTION_WITH_LADDR in ppc/xen.lds.S.
> =C2=A0- update the commit message.
> =C2=A0- add Acked-by: Jan Beulich <jbeulich@suse.com>.
> ---
> Changes in V4:
> =C2=A0- new patch
> ---
> =C2=A0xen/arch/ppc/xen.lds.S=C2=A0=C2=A0=C2=A0 | 2 ++
> =C2=A0xen/arch/x86/xen.lds.S=C2=A0=C2=A0=C2=A0 | 6 ++++--
> =C2=A0xen/include/xen/xen.lds.h | 6 ++++++
> =C2=A03 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> index 0c4b94814b..30b4a6ced8 100644
> --- a/xen/arch/ppc/xen.lds.S
> +++ b/xen/arch/ppc/xen.lds.S
> @@ -1,4 +1,6 @@
> =C2=A0#include <xen/lib.h>
> +
> +#define DECL_SECTION_WITH_LADDR
> =C2=A0#include <xen/xen.lds.h>
> =C2=A0
> =C2=A0OUTPUT_ARCH(powerpc:common64)
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index b60d2f0d82..7d2aa2d801 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -3,6 +3,10 @@
> =C2=A0
> =C2=A0#include <xen/cache.h>
> =C2=A0#include <xen/lib.h>
> +
> +#ifndef EFI
> +# define DECL_SECTION_WITH_LADDR
> +#endif
> =C2=A0#include <xen/xen.lds.h>
> =C2=A0#include <asm/page.h>
> =C2=A0#undef ENTRY
> @@ -12,9 +16,7 @@
> =C2=A0
> =C2=A0#define FORMAT "pei-x86-64"
> =C2=A0#undef __XEN_VIRT_START
> -#undef DECL_SECTION
> =C2=A0#define __XEN_VIRT_START __image_base__
> -#define DECL_SECTION(x) x :
> =C2=A0
> =C2=A0ENTRY(efi_start)
> =C2=A0
> diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> index 24b8900ffe..c6178bdc42 100644
> --- a/xen/include/xen/xen.lds.h
> +++ b/xen/include/xen/xen.lds.h
> @@ -5,6 +5,8 @@
> =C2=A0 * Common macros to be used in architecture specific linker scripts=
.
> =C2=A0 */
> =C2=A0
> +#ifdef DECL_SECTION_WITH_LADDR
> +
> =C2=A0/*
> =C2=A0 * Declare a section whose load address is based at PA 0 rather tha=
n
> =C2=A0 * Xen's virtual base address.
> @@ -15,6 +17,10 @@
> =C2=A0# define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
> =C2=A0#endif
> =C2=A0
> +#else /* !DECL_SECTION_WITH_LADDR */
> +#define DECL_SECTION(x) x :
> +#endif
> +
> =C2=A0/*
> =C2=A0 * To avoid any confusion, please note that the EFI macro does not
> correspond
> =C2=A0 * to EFI support and is used when linking a native EFI (i.e.
> PE/COFF) binary,


