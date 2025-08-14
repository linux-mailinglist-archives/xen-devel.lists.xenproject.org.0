Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1F6B2585E
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 02:33:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080486.1440872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umLud-0000Fz-Nm; Thu, 14 Aug 2025 00:33:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080486.1440872; Thu, 14 Aug 2025 00:33:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umLud-0000Df-KT; Thu, 14 Aug 2025 00:33:47 +0000
Received: by outflank-mailman (input) for mailman id 1080486;
 Thu, 14 Aug 2025 00:33:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjlG=22=bounce.vates.tech=bounce-md_30504962.689d2eaa.v1-f82e5ff317ef4803833550b6120c223a@srs-se1.protection.inumbo.net>)
 id 1umLuc-0000DZ-Ju
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 00:33:46 +0000
Received: from mail145-23.atl61.mandrillapp.com
 (mail145-23.atl61.mandrillapp.com [198.2.145.23])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 311c03a9-78a6-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 02:32:44 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-23.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4c2R624WgKz1XLSCy
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 00:32:42 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f82e5ff317ef4803833550b6120c223a; Thu, 14 Aug 2025 00:32:42 +0000
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
X-Inumbo-ID: 311c03a9-78a6-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1755131562; x=1755401562;
	bh=fyvq1kl+iP4CmHov+3M9OucDvmebNmPcZJRWq/jdFvM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sYXGVbwNizQeU4hRyQeQqC+J2y7sHGvankKxarM4ArkAy3ii6G6g119rQEA7e7s2P
	 7s0fJuY6owY537Z3ZJpP9y+NiA9gWLM+vVw92NujaEJ3t0EG16cCBh8XG+DezUWUeO
	 yig8NCX/7wGKkeAye9Vou9oe6X+d/7G2loMcYv7AfylFBsj2osyQP9u35QdY3ORoDc
	 EXN11CN1QsoxB1yzrTVbrC4ddPYze1rvDhxfruHak4rFt3qv5m1h7s211z9jSWMEG1
	 E5nnK26ZLkiwBQI92dCA4gdurW4gt2d4YnVn+BE91OErYXBZvVYF43bqDlSKI9MBn0
	 UoT1Y9tPf+iJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1755131562; x=1755392062; i=teddy.astie@vates.tech;
	bh=fyvq1kl+iP4CmHov+3M9OucDvmebNmPcZJRWq/jdFvM=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=X3AIhF+rO735fyTEV3CRB+wFutnQ60vMm6bs4QTrqRQu0P/Agb3W1/NiOz8POQ3Qs
	 PUgQxRDLTxEiQYJ7Rh2LcL0qstaRxEMJaoaqF8gVfABQTBU8ebtAL4WGeVQnLWQasK
	 WoTCnSP+O34bleBfDRP0FhOXtljNODjqiksVA+v4zTlIXpB0zrMEuSzX9l99V5+Clc
	 AX1WobEDJPCkv27jNIO7VS3KS5G7DiOQibTR2qDvao02Xd9rNPpSGdOaDx8e+xXaY/
	 k7Eqk6jov9SX/GASbwjKP/Jp2fZn1y33XOL6h2WlsQaaogY7/3QeEzQuCI4NgmWd0v
	 ouK8x9wEG8TpQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20misra:=20allow=20conversion=20from=20unsigned=20long=20to=20function=20pointer?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1755131560161
Message-Id: <7129feb6-31a3-40c8-9d99-f7d7d2ae89f7@vates.tech>
To: "Dmytro Prokopchuk1" <dmytro_prokopchuk1@epam.com>, xen-devel@lists.xenproject.org
Cc: "Nicola Vetrini" <nicola.vetrini@bugseng.com>, "Doug Goldstein" <cardoe@cardoe.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>
References: <8cbc9e6d881661d0d7a1055cbcef5a65e20522be.1755109168.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <8cbc9e6d881661d0d7a1055cbcef5a65e20522be.1755109168.git.dmytro_prokopchuk1@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f82e5ff317ef4803833550b6120c223a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250814:md
Date: Thu, 14 Aug 2025 00:32:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 13/08/2025 =C3=A0 20:30, Dmytro Prokopchuk1 a =C3=A9crit=C2=A0:
> ...
> 
> from `vaddr_t' (that is `unsigned long') to `switch_ttbr_fn*' (that is `v=
oid(*)(unsigned long)')
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> This is just a RFC patch.
> The commit message is not important at this stage.
> 
> I am seeking comments regarding this case.
> 
> Thanks.
> ---
>   automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
>   docs/misra/deviations.rst                        | 10 ++++++++++
>   docs/misra/rules.rst                             |  8 +++++++-
>   xen/arch/arm/arm64/mmu/mm.c                      |  2 ++
>   4 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automatio=
n/eclair_analysis/ECLAIR/deviations.ecl
> index ebce1ceab9..f9fd6076b7 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -365,6 +365,14 @@ constant expressions are required.\""
>   }
>   -doc_end
>   
> +-doc_begin=3D"The conversion from unsigned long to a function pointer do=
es not lose any information, provided that the source type has enough bits =
to restore it."
> +-config=3DMC3A2.R11.1,casts+=3D{safe,
> +  "from(type(canonical(builtin(unsigned long))))
> +   &&to(type(canonical(__function_pointer_types)))
> +   &&relation(definitely_preserves_value)"
> +}
> +-doc_end
> +
>   -doc_begin=3D"The conversion from a function pointer to a boolean has a=
 well-known semantics that do not lead to unexpected behaviour."
>   -config=3DMC3A2.R11.1,casts+=3D{safe,
>     "from(type(canonical(__function_pointer_types)))
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 3c46a1e47a..27848602f6 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -348,6 +348,16 @@ Deviations related to MISRA C:2012 Rules:
>          to store it.
>        - Tagged as `safe` for ECLAIR.
>   
> +   * - R11.1
> +     - The conversion from unsigned long to a function pointer does not =
lose any
> +       information or violate type safety assumptions if the unsigned lo=
ng type
> +       is guaranteed to be at least as large as a function pointer. This=
 ensures
> +       that the function pointer address can be fully represented withou=
t
> +       truncation or corruption. Macro BUILD_BUG_ON can be integrated in=
to the
> +       build system to confirm that 'sizeof(unsigned long) >=3D sizeof(v=
oid (*)())'

Wouldn't `sizeof(unsigned long) =3D=3D sizeof(void (*)())` be preferable ?

I assume sizeof(unsigned long) is the size of a CPU word.
Having `sizeof(unsigned long) < sizeof(void (*)())` makes use of 
operations like cmpxchg unsuitable on function pointers (because of 
object size mismatch).

> +       on all target platforms.
> +     - Tagged as `safe` for ECLAIR.
> +
>      * - R11.1
>        - The conversion from a function pointer to a boolean has a well-k=
nown
>          semantics that do not lead to unexpected behaviour.
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 6812eb7e8a..8b97ecf3f4 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -414,7 +414,13 @@ maintainers if you want to suggest a change.
>        - All conversions to integer types are permitted if the destinatio=
n
>          type has enough bits to hold the entire value. Conversions to bo=
ol
>          and void* are permitted. Conversions from 'void noreturn (*)(...=
)'
> -       to 'void (*)(...)' are permitted.
> +       to 'void (*)(...)' are permitted. Conversions from unsigned long =
to
> +       function pointer are permitted if the unsigned long type has a si=
ze
> +       and representation sufficient to store the entire function pointe=
r
> +       value without truncation or corruption. Example::
> +
> +           unsigned long func_addr =3D (unsigned long)&some_function;
> +           void (*restored_func)(void) =3D (void (*)(void))func_addr;
>   
>      * - `Rule 11.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Exampl=
e-Suite/-/blob/master/R_11_02.c>`_
>        - Required
> diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
> index 3e64be6ae6..998d52c162 100644
> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -150,6 +150,7 @@ void __init relocate_and_switch_ttbr(uint64_t ttbr)
>       vaddr_t id_addr =3D virt_to_maddr(relocate_xen);
>       relocate_xen_fn *fn =3D (relocate_xen_fn *)id_addr;
>       lpae_t pte;
> +    BUILD_BUG_ON(sizeof(unsigned long) < sizeof(fn));
>   
>       /* Enable the identity mapping in the boot page tables */
>       update_identity_mapping(true);
> @@ -178,6 +179,7 @@ void __init switch_ttbr(uint64_t ttbr)
>       vaddr_t id_addr =3D virt_to_maddr(switch_ttbr_id);
>       switch_ttbr_fn *fn =3D (switch_ttbr_fn *)id_addr;
>       lpae_t pte;
> +    BUILD_BUG_ON(sizeof(unsigned long) < sizeof(fn));
>   
>       /* Enable the identity mapping in the boot page tables */
>       update_identity_mapping(true);



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



