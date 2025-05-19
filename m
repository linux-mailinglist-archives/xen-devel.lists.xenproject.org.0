Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FABDABC46D
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 18:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990062.1374013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH3HE-0006xz-KV; Mon, 19 May 2025 16:23:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990062.1374013; Mon, 19 May 2025 16:23:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH3HE-0006vj-Hm; Mon, 19 May 2025 16:23:44 +0000
Received: by outflank-mailman (input) for mailman id 990062;
 Mon, 19 May 2025 16:23:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AD/E=YD=bounce.vates.tech=bounce-md_30504962.682b5b0a.v1-5edfc141b19041e8a7ebc0513a127574@srs-se1.protection.inumbo.net>)
 id 1uH3HC-0006vd-LP
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 16:23:42 +0000
Received: from mail187-4.suw11.mandrillapp.com
 (mail187-4.suw11.mandrillapp.com [198.2.187.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ee5cfac-34cd-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 18:23:39 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-4.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4b1NKQ0qRczlfcHv
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 16:23:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 5edfc141b19041e8a7ebc0513a127574; Mon, 19 May 2025 16:23:38 +0000
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
X-Inumbo-ID: 9ee5cfac-34cd-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747671818; x=1747941818;
	bh=BDjeu0XUR0uU2TT/7xPp2UlOmJZUCLxJErnlwMKjE0M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=d0ogPap/3IqOWqF3UFByhkRN/uhMfHCvnmBfferGevg2JFPoRodB5INUDA0BQzHdo
	 GxivhxefA6XaeFDYokMT68HRDLcZFTqNMA2I5Z1KqtoY+aY821oPIiFE3J8YSZX4u9
	 sRc7tfLpxWSLZHiYm2vThe+t4VyDiRWf22vMqWPsClsMJGLnjzJIBpJWG4YgQMXE1X
	 6+vu3bWeGSKar6wIAePXgvZFqWUg7kshv+0vGDMhC1RYXOMg0iSA1pNfuU0t2kvnfm
	 +6URokkmWbCixbRvgSQFnnlqxtfITSawHprNOWMM9Y0XP/Q4WXtgDfw9xvWhsx6lpr
	 Ys1vp+w/8LvAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747671818; x=1747932318; i=teddy.astie@vates.tech;
	bh=BDjeu0XUR0uU2TT/7xPp2UlOmJZUCLxJErnlwMKjE0M=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=0UjdA5fWBWBAVSI4BdGG20jzib1JotQD55/HC4ZNy0+j833WUt7FOX6Pxu85b1RXN
	 W+M9OewONbofEcwe6DGFWg++TnUkJhoRbiDOVFbseT6CXgSTkIrNnSyzbkTaK4VccP
	 v6YbYPe7uwWO1CwALfVWU4yfHE4ZKfVXZwWYsqtz5lxPcrqw0qCiJLvHgiENFIH9h+
	 fYiBm/WadpSoIFDvRl0t6oHgeIajl0kpyLXKwzg6aWa7u/tiXC2TsPMybZpc8D5x8L
	 x2LVecVzDQJlsLubMe8Vsg7b0d1AVPMV/eCG13AXxXhn0qhMGtOfuU606/ZIqxbzUf
	 JJQB5h1d6bEQw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v2=2004/16]=20xen/riscv:=20add=20ioremap=5F*()=20variants=20using=20ioremap=5Fattr()?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747671815716
Message-Id: <ac512e73-04ad-4156-8b5b-bcba7127629b@vates.tech>
To: "Oleksii Kurochko" <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: "Alistair Francis" <alistair.francis@wdc.com>, "Bob Eshleman" <bobbyeshleman@gmail.com>, "Connor Davis" <connojdavis@gmail.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
References: <cover.1746530883.git.oleksii.kurochko@gmail.com> <0258c1ac04a73b7d3f9f849507539a329b2998e3.1746530883.git.oleksii.kurochko@gmail.com>
In-Reply-To: <0258c1ac04a73b7d3f9f849507539a329b2998e3.1746530883.git.oleksii.kurochko@gmail.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.5edfc141b19041e8a7ebc0513a127574?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250519:md
Date: Mon, 19 May 2025 16:23:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

Le 06/05/2025 =C3=A0 18:53, Oleksii Kurochko a =C3=A9crit=C2=A0:
> Introduce ioremap_attr() as a shared helper to implement architecture-spe=
cific
> +#include <xen/vmap.h>
>   
>   #include <asm/early_printk.h>
>   #include <asm/csr.h>
> @@ -583,3 +584,36 @@ void *__init arch_vmap_virt_end(void)
>   {
>       return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
>   }
> +
> +static void *ioremap_attr(paddr_t start, size_t len, pte_attr_t attribut=
es)

you probably want __iomem here

> +{
> +    mfn_t mfn =3D _mfn(PFN_DOWN(start));
> +    unsigned int offs =3D start & (PAGE_SIZE - 1);
> +    unsigned int nr =3D PFN_UP(offs + len);
> +    void *ptr =3D __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
> +
> +    if ( ptr =3D=3D NULL )
> +        return NULL;
> +
> +    return ptr + offs;
> +}
> +
> +void __iomem *ioremap_nocache(paddr_t start, size_t len)
> +{
> +    return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
> +}
> +
> +void __iomem *ioremap_cache(paddr_t start, size_t len)
> +{
> +    return ioremap_attr(start, len, PAGE_HYPERVISOR);
> +}
> +
> +void __iomem *ioremap_wc(paddr_t start, size_t len)
> +{
> +    return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
> +}
> +
> +void *ioremap(paddr_t pa, size_t len)

also here

> +{
> +    return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
> +}

Teddy


Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



