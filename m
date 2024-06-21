Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 438CC912902
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 17:10:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745308.1152437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKft3-0006ku-EA; Fri, 21 Jun 2024 15:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745308.1152437; Fri, 21 Jun 2024 15:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKft3-0006iQ-BW; Fri, 21 Jun 2024 15:09:13 +0000
Received: by outflank-mailman (input) for mailman id 745308;
 Fri, 21 Jun 2024 15:09:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBkP=NX=bounce.vates.tech=bounce-md_30504962.66759794.v1-7d137cfc1204456185aac7c8658aefb3@srs-se1.protection.inumbo.net>)
 id 1sKft1-0006iK-Op
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 15:09:11 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35d78739-2fe0-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 17:09:10 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4W5LNh3HgHz5QkLqV
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 15:09:08 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7d137cfc1204456185aac7c8658aefb3; Fri, 21 Jun 2024 15:09:08 +0000
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
X-Inumbo-ID: 35d78739-2fe0-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1718982548; x=1719243048;
	bh=lIV/U0ezGsXVmOjqbkafB5BjfIUquJ6q+7BRog7b6qo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gnYPzEPAuHv5IFdfKKkh/CwhCdlAdKKm0Wz8adR7g9EyQug2oplChvNVVVLyi/ZNR
	 qpyCUa7W4lJlVzsfcKXxnCgwbt03J6ZbvFa3bLp7ZwQo7mMVmgC8BQfcbAvAPhUJap
	 HkurX0avjtzxSL/iJ02Ed87OdDvZRerd4AGwNALFxoS5kDI7Zh9wMt85tvn3esiou9
	 L7n0oUUdZH3ahi8tU2dsL9RCqCdWDu4rajY5L2tFdWZ6C46I5kcAbnl2XWRI5K2QTc
	 THT1AzBQ71mdeEvcaNlPBOFA8VH23K7JWDqBJD4kMgBeE+KHRYw3kxKsXav/7w7Bte
	 YrvPkD1+9UdUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1718982548; x=1719243048; i=teddy.astie@vates.tech;
	bh=lIV/U0ezGsXVmOjqbkafB5BjfIUquJ6q+7BRog7b6qo=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GV1bbXFF1LgGXDJHgJlI0dsXBzt/XQ29AGxzHN17K2TafFRPAAJBhpiDOILQcgrUf
	 HDhLw8cp6y1FlB/W523p8v6GxkVgVViFcm89+Do0MovrU0XixOXPX1i3vua/scx2k6
	 Yuz1k13lPAX95jlAEmNj9MiyTZ7gbXPSC0Uqgf16VqEwIiPTTMB0fIx2lDOXpdzstt
	 +UFeqt40y0z6eqJ5q7grjOkeTKhA0qakRt2rWQlVDiy2UE2IAPOHsFyVTgjmQBsam/
	 SLyRBnkgzaRgv8dtVf+Qowotmgkx/QDJXUU/g4u98kfcd11h7p6WQortJNVYe6U32p
	 XSogVqNrxSIPA==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[RFC=20PATCH]=20iommu/xen:=20Add=20Xen=20PV-IOMMU=20driver?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1718982546557
Message-Id: <750967b7-252f-4523-872f-64b79358c97c@vates.tech>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <fe36b8d36ed3bc01c78901bdf7b87a71cb1adaad.1718286176.git.teddy.astie@vates.tech> <20240619163000.GK791043@ziepe.ca>
In-Reply-To: <20240619163000.GK791043@ziepe.ca>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7d137cfc1204456185aac7c8658aefb3?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240621:md
Date: Fri, 21 Jun 2024 15:09:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Jason,

Le 19/06/2024 =C3=A0 18:30, Jason Gunthorpe a =C3=A9crit=C2=A0:
> On Thu, Jun 13, 2024 at 01:50:22PM +0000, Teddy Astie wrote:
> 
>> +struct iommu_domain *xen_iommu_domain_alloc(unsigned type)
>> +{
>> +=09struct xen_iommu_domain *domain;
>> +=09u16 ctx_no;
>> +=09int ret;
>> +
>> +=09if (type & IOMMU_DOMAIN_IDENTITY) {
>> +=09=09/* use default domain */
>> +=09=09ctx_no =3D 0;
> 
> Please use the new ops, domain_alloc_paging and the static identity domai=
n.

Yes, in the v2, I will use this newer interface.

I have a question on this new interface : is it valid to not have a 
identity domain (and "default domain" being blocking); well in the 
current implementation it doesn't really matter, but at some point, we 
may want to allow not having it (thus making this driver mandatory).

> 
>> +static struct iommu_group *xen_iommu_device_group(struct device *dev)
>> +{
>> +=09if (!dev_is_pci(dev))
>> +=09=09return ERR_PTR(-ENODEV);
>> +
> 
> device_group is only called after probe_device, since you already
> exclude !pci during probe there is no need for this wrapper, just set
> the op directly to pci_device_group.
> 
>> +=09if (!dev_is_pci(dev))
>> +=09=09return;
> 
> No op is ever called on a non-probed device, remove all these checks.
>
> 
> A paging domain should be the only domain ops that have a populated
> map so this should be made impossible by construction
Makes sense, will remove these redundant checks in v2.

> 
>> +static void xen_iommu_release_device(struct device *dev)
>> +{
>> +=09int ret;
>> +=09struct pci_dev *pdev;
>> +=09struct pv_iommu_op op =3D {
>> +=09=09.subop_id =3D IOMMUOP_reattach_device,
>> +=09=09.flags =3D 0,
>> +=09=09.ctx_no =3D 0 /* reattach device back to default context */
>> +=09};
> 
> Consider if you can use release_domain for this, I think this is
> probably a BLOCKED domain behavior.

The goal is to put back all devices where they were at the beginning 
(the default "context"), which is what release_domain looks like it is 
doing. Will use it for v2.

> 
> Jason

Teddy


Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


