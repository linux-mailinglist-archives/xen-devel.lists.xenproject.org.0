Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ADFA9EA5F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 10:11:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970255.1358991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9JaM-0007ZN-Fy; Mon, 28 Apr 2025 08:11:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970255.1358991; Mon, 28 Apr 2025 08:11:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9JaM-0007XW-Cr; Mon, 28 Apr 2025 08:11:30 +0000
Received: by outflank-mailman (input) for mailman id 970255;
 Mon, 28 Apr 2025 08:11:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1BrO=XO=bounce.vates.tech=bounce-md_30504962.680f382c.v1-8a41384c7644416789cc34f9b3a21e16@srs-se1.protection.inumbo.net>)
 id 1u9JaK-0007XQ-OJ
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 08:11:28 +0000
Received: from mail145-2.atl61.mandrillapp.com
 (mail145-2.atl61.mandrillapp.com [198.2.145.2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61256139-2408-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 10:11:26 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-2.atl61.mandrillapp.com (Mailchimp) with ESMTP id 4ZmGP909FFzQXmFy1
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 08:11:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 8a41384c7644416789cc34f9b3a21e16; Mon, 28 Apr 2025 08:11:24 +0000
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
X-Inumbo-ID: 61256139-2408-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1745827885; x=1746097885;
	bh=oef+M6oeicjGCGIqvpLf2Lb8tStQTOGORkRg6Ies/Cw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=qyT49auSjYbgkeSLjvvDwyD7my5w2u5h0ZFDz5qDAUvufxDuTxeK0SdCVhGO2VVem
	 ufUINq3EsUmJaG4J9zI9tq38WWxA7KMQkvRYrV5spXgB0AHrfbABQeqra1pLdx/Vdq
	 /ldaJx5t/dx3M5wr/io+JZfoR049wqkwfR5kxkIDzVD5eNlFFSvi8poWAvjAeQ1rgc
	 /JAuIwFJ3agqzyvrl396dXg3meuuNxv/W5ZFo5vCrF2pdak7+oyBbjL8kIa4AWCysH
	 apast5asYYqF5YetVsA50iplkEGPuhQdmJC23GeobnbrXSvhWk3ygvMzb+Zu4hrAnH
	 0vC7sRkqNyQWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1745827885; x=1746088385; i=teddy.astie@vates.tech;
	bh=oef+M6oeicjGCGIqvpLf2Lb8tStQTOGORkRg6Ies/Cw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DTQ57+2CtXJyiUQUG19/3C5HTZW8VYEpwMI80vE7fgkkH459CAs6TsitHe8Sfh8ps
	 6N1jPqkT7MyRqrhUfXN1F1vb1uA0d+Qq8mHrZI/IZ3Y4sPlsEO3wmaC/2vbXTjGqfQ
	 7aaav78rdBiHy2AFklhuqBM0/jEy36+UXbVHvaUHzTnZHvNUQcGFibUbJ9AaY6tj/H
	 Ft2HH3+mBunG321bbO8ThRNIji5lhXbU09pi54d7EPkM1S+CPk+s6Vg+ek1a8PvhiE
	 rb4ycxLOWSmtRdDaN/KoQ6k/7DyHwGGwyZ6SOk/1QoX89GQqyfoj7bGi0gk7ZirYm1
	 BN2wloimJ6CtA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH]=20xen/x86:=20allow=20Dom0=20PVH=20to=20call=20XENMEM=5Fexchange?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1745827881934
Message-Id: <f315a128-ce68-42be-9f0c-044ad0c5320c@vates.tech>
To: "Stefano Stabellini" <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, jason.andryuk@amd.com, agarciav@amd.com
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.8a41384c7644416789cc34f9b3a21e16?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250428:md
Date: Mon, 28 Apr 2025 08:11:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Stefano,

Le 25/04/2025 =C3=A0 22:21, Stefano Stabellini a =C3=A9crit=C2=A0:
> From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> 
> Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> addresses to firmware or co-processors not behind an IOMMU.
> 
> XENMEM_exchange was blocked for HVM/PVH DomUs, and accidentally it
> impacted Dom0 PVH as well.
> 
> Permit Dom0 PVH to call XENMEM_exchange while leaving it blocked for
> HVM/PVH DomUs.
> 

In addition to Jan's remarks, I think it wants some additional 
clarifications on the hypercall interface. public/memory.h indicates 
"only PV guests can use this operation", so the interface is actually 
unspecified about HVM guests (e.g what are MFN/GMFN in this case ?).

> Signed-off-by: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 1cf2365167..e995944333 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4401,7 +4401,7 @@ int steal_page(
>       const struct domain *owner;
>       int rc;
>   
> -    if ( paging_mode_external(d) )
> +    if ( paging_mode_external(d) && !is_hardware_domain(d) )
>           return -EOPNOTSUPP;
>   
>       /* Grab a reference to make sure the page doesn't change under our =
feet */
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 8ca4e1a842..796eec081b 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xe=
n_memory_exchange_t) arg)
>               rc =3D guest_physmap_add_page(d, _gfn(gpfn), mfn,
>                                           exch.out.extent_order) ?: rc;
>   
> -            if ( !paging_mode_translate(d) &&
> +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
>                    __copy_mfn_to_guest_offset(exch.out.extent_start,
>                                               (i << out_chunk_order) + j,
>                                               mfn) )
> 

Teddy


 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



