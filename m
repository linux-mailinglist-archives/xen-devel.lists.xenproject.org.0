Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1EBB18794
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 21:05:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067491.1432210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhv49-0001xY-O9; Fri, 01 Aug 2025 19:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067491.1432210; Fri, 01 Aug 2025 19:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhv49-0001v6-K9; Fri, 01 Aug 2025 19:05:17 +0000
Received: by outflank-mailman (input) for mailman id 1067491;
 Fri, 01 Aug 2025 19:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GtvS=2N=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhv48-0001ux-9a
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 19:05:16 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 744a9bc4-6f0a-11f0-b897-0df219b8e170;
 Fri, 01 Aug 2025 21:05:14 +0200 (CEST)
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
X-Inumbo-ID: 744a9bc4-6f0a-11f0-b897-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754075112; x=1754334312;
	bh=oLeSik1vUwLPTmknUiN5N0jEWWDWQv90PmqFTYaDqLQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=k9YalSSQLYPzlPZusKOlu4ZrDR24sEyKTBhem6SEkNAW1313b9NkepOG/Nodz/hDK
	 KU7SsoKvj+RlHWQGWPgmSp2OTZUe9wPzra1p3ChB06/Cu6gdgCOBXkWwl5MVH3qoEN
	 tbk7wbB0uCGMrfEzXIjOpj4a0YSwJJZWtReSqhh3ZDgVLK7rmrPbpOap655tcMK/FI
	 SKsrH4C9OcPuW5nptsewX8qyYjCI8AQn+EjiXLc9hYGwQq1K+MZGLUDs247CYBOPHb
	 oGxCr+pQWZO64pv7muRmY4fB4GOFlEwWYwbN7V3BuOwEoodyQdzdaPlMZLEJZL1Cs3
	 MxXpVssTuSVgA==
Date: Fri, 01 Aug 2025 19:05:06 +0000
To: Grygorii Strashko <grygorii_strashko@epam.com>
From: dmkhn@proton.me
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN][PATCH] xen/dom0less: arm: fix hwdom 1:1 low memory allocation
Message-ID: <aI0P3dT6Lz/WNU4B@kraken>
In-Reply-To: <20250801155429.1402395-1-grygorii_strashko@epam.com>
References: <20250801155429.1402395-1-grygorii_strashko@epam.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 81cd4bc29104ca0f73b7d5332f5b502769dad235
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2025 at 03:54:30PM +0000, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>=20
> Call stack for dom0less hwdom case (1:1) memory:
> create_domUs
> |-construct_domU
>   |-construct_hwdom()
>     |-allocate_memory_11()
>=20
> And allocate_memory_11() uses "dom0_mem" as:
> min_low_order =3D
>   get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
>=20
> In case of dom0less boot the "dom0_mem" is not used and defaulted to 0,
> which causes min_low_order to get high value > order and so no allocation=
s
> happens from low memory.
>=20
> Fix it, by using kinfo->unassigned_mem instead of "dom0_mem" has correct
> memory size in both cases: regular dom0 boot and dom0less boot.
>=20
> Fixes: 43afe6f030244 ("xen/common: dom0less: introduce common dom0less-bu=
ild.c")
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>=20

> ---
>  xen/arch/arm/domain_build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 801a09071a50..0a555d1ae0e5 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -278,7 +278,7 @@ static void __init allocate_memory_11(struct domain *=
d,
>                                        struct kernel_info *kinfo)
>  {
>      const unsigned int min_low_order =3D
> -        get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
> +        get_order_from_bytes(min_t(paddr_t, kinfo->unassigned_mem, MB(12=
8)));
>      const unsigned int min_order =3D get_order_from_bytes(MB(4));
>      struct membanks *mem =3D kernel_info_get_mem(kinfo);
>      struct page_info *pg;
> --
> 2.34.1
>=20


