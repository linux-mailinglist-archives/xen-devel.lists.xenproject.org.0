Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF7E91AA54
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 17:05:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750191.1158448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqfx-0004a3-Uu; Thu, 27 Jun 2024 15:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750191.1158448; Thu, 27 Jun 2024 15:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMqfx-0004Xq-Rj; Thu, 27 Jun 2024 15:04:41 +0000
Received: by outflank-mailman (input) for mailman id 750191;
 Thu, 27 Jun 2024 15:04:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JfIA=N5=outlook.com=mhklinux@srs-se1.protection.inumbo.net>)
 id 1sMqfw-0004Xi-NS
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 15:04:40 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10olkn20807.outbound.protection.outlook.com
 [2a01:111:f403:2804::807])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92b8b871-3496-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 17:04:39 +0200 (CEST)
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by IA0PR02MB9702.namprd02.prod.outlook.com (2603:10b6:208:487::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Thu, 27 Jun
 2024 15:04:35 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%2]) with mapi id 15.20.7698.033; Thu, 27 Jun 2024
 15:04:35 +0000
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
X-Inumbo-ID: 92b8b871-3496-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=junSST0Oet99976p1kU7/GaJlYJroYc6b7SLrTRZt6eolD60vjysh08sFSuJwWJ69EDreIqbdQDbpLYDSgzl7KBLfEBODNxTpXYwFEH/2PTVZV+l1GP3eg5Zb3Fb1nC3z8RdolCN7cMV3NJ/BVyRUz3F2Ff1zwngcNGqRBAjGL0s1GGLtxJVnLewIL2EmCqTui//l5kEl+vhkFNz5m6XCBTr3fnhZsyJgFWGEA/eDGTPjCNJa6LIOt664I30oHLr/mpyH1gxnnBBAyneC0atWng5VIcrLxoheKlzRVshjh/wVy7jM4757zKndit520aMyoeeQA14G2a7e3rvzNMrrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=raNG0jVWFpSJwFielu6FwfYrMP8/HWhkBSOCMgEBgYM=;
 b=OXeHoEv6nwKM334GfD571hdH3afo5GikHpgA7fN/cC3x7lUyc7eUqkFA3pOvdfqQPDA2v/ZttIht87/7yLndcvaAFIjJc7HexkEa/+lJX0/p41zVvMxruIWK2B37pkIil7v+9MgM2QTJ/TlVeRGcMeun9qp4DPGvRvbVnonVM94+63bn0CGenq61mtDpQbsZFBQm3K64rqPTQVI+K1pjQx2FQK6clIrzSTBkxJ7yQ0BxX5P7WggXkP5/2l9OpcbTqcKr9RekIzS2owv+3QMhkMsfB2nQ/P+OL7JQhf1btqLXycAMvNi7sNdkktGipb4aSyCBFW9VMmZBqkkK095aBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=raNG0jVWFpSJwFielu6FwfYrMP8/HWhkBSOCMgEBgYM=;
 b=f9iOte9BsmltkGsn8IdYrqhZX8zwOu4/Y9RLlzjmr6/QavC0p999C6kIvFpy4yL/Unadzh1MYU/56+arIdnHk81gy+GOzsJvuYCZ7Nh0Y0fUhREhc0k3TJX9mhE7gB8Kflwh+J//a1EJsJqVxv0FYt4wlc+3GTCa3AyrsSt2sHpWnVdVxTaE/LikkDmm234qbPMryNwWinmi1kGjCfnZ4GYsBNu9DtGUXuD6aczoOe5XEsb0GFPIbkH+qur75n3iy2Ngb0MgHNtW2gfZ5YPB428ANcqG3QoqIoMitHXuGCy3KTHJqEDl6GKaKTKvKqkH8SmQpIxq4m7rGwj5aC2q6A==
From: Michael Kelley <mhklinux@outlook.com>
To: =?iso-8859-2?Q?Petr_Tesa=F8=EDk?= <petr@tesarici.cz>,
	"mhkelley58@gmail.com" <mhkelley58@gmail.com>
CC: "robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "will@kernel.org" <will@kernel.org>, "jgross@suse.com"
	<jgross@suse.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>, "hch@lst.de"
	<hch@lst.de>, "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Thread-Topic: [RFC 1/1] swiotlb: Reduce calls to swiotlb_find_pool()
Thread-Index: AQHauIjoJBWSrCyO6UWzcncSceBiMLHbU/+AgACADXA=
Date: Thu, 27 Jun 2024 15:04:35 +0000
Message-ID:
 <SN6PR02MB4157CF368284CA48061E35E9D4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240607031421.182589-1-mhklinux@outlook.com>
 <20240627092049.1dbec746@meshulam.tesarici.cz>
In-Reply-To: <20240627092049.1dbec746@meshulam.tesarici.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [AKhZ4FTPcx0HfZye0qhnHyABc3sw1wYl]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|IA0PR02MB9702:EE_
x-ms-office365-filtering-correlation-id: edd5232c-f037-4bde-a2e4-08dc96ba7522
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 C4w+6zLY5M7Vk3uroWbqkWyXGC/J79Dm3JF+VD8WwfvRbg6juRPuQm8IhWQNj+zmpc4pKMwvuDJV3V91oAJ7fZSMkw0SkuXgN71A1tuONyrOY2A5qoZ0rU7wV4wEh2Jvq5i9DJE/QWgR8p1hMVT0qx1ix4OhEl+tPPVosUR+HklI9k/Qy90CGkQ3UEdtP1lrvR3YT22WO5/pDotqpu/69fo+7okeDRfIFyxjsHQVQMws1jr2/uPStj1wFuRVRivaKVhZN9HsX6toKK6Vv5sWqXB/A6dpOHOr3hHJZnqLXOAOTnAOy7E1aPkKRqbQQaI8OJ8TFsfX5uDsywyWTvkuekbQaJpejkgjcJSmkHRQnv4yL4y2RIWnxBB0CBIH/5bj4wwvl8+mIYa3nwl/Df4OcUW8qE9aTCVX8ElNlowyw832/Q+bhTdGzBHF0oOmZZSk3H69M91QxJxpMcH2LRUPx5t64Zy6BsIiRxvZoTEfxbG4rtP79E1MmD/WrNMSl/aHIoiJIdGeCp4Qy+3jXcvFNyC+vN/t6uGMfpybgaX4r9Yiu3Hb1g1YmreLYk0g9N4p
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?TVNMMdrcwSsBtZ9+85O93RYN9thGCKdgW6DFpEwdGDNHimWfW1bHVKMKlm?=
 =?iso-8859-2?Q?9o3eDUT9g5d/PnTGCTn3B1yopqSeNACJCXTUClJdr3N7iM7pzoLcxNbzct?=
 =?iso-8859-2?Q?4KHjH9PP4JFJreFu6vBfuZsMj+d8AojebRkCfrx5ocKfxWsnYM1sJwawjY?=
 =?iso-8859-2?Q?DOnLbOwwr42c6pfLcjcBUn7+ly8n9bnAZxSm5yk6LPTIKTNdS56rhyUutk?=
 =?iso-8859-2?Q?kFDOJ+uaygp1OvTFoXDUIdcCxyZLArIyUZcrjKLrHBBtyFtG0rP2jdYVF/?=
 =?iso-8859-2?Q?TMpNLq9thmqc2eIVuZqULCNWNqwhawfoo7gOsMIljfSVGTJpVDLSpMQYcJ?=
 =?iso-8859-2?Q?tOhoxaCsGg3buoiS3UmxVxrc1kCBTfAMxaH8LGzEgfmrD2WJrSRzxkldcH?=
 =?iso-8859-2?Q?J+9R9py5O5e0kzAq4WC11CDH5WaId4iWqz8/XSS2SlqvQDMN5oogwB854B?=
 =?iso-8859-2?Q?WTHqVLHE4FLDDhkPg6YbFX+dPn/2FLVYWh7u0CHjxn3JuzFc1jaaJnUr0F?=
 =?iso-8859-2?Q?t/fTiJ9STvPUWY2v11rcf3XPRXa5GWThR6mGa8n+3jFFVfk5o0IYWUMy9i?=
 =?iso-8859-2?Q?MgzgUhrXNIDW2Fg43mziZru2MkUWTbcVBKJ0ZsfYcsZqUXREOwOcPm9k1I?=
 =?iso-8859-2?Q?w7pOfZa/qI3nNU6hx0SczoIN2NLf+p5y5wgEJE9iQNaxr7VGI4LBoEq8A8?=
 =?iso-8859-2?Q?0s+W22Gm/lvgGfDwCv3h+Aij2/iBGIAKGmWzuNNe9AWZ4B0UGv3Dc63LRT?=
 =?iso-8859-2?Q?JFdV1ED27t7sF8yL087Nj3zDwI6coUulRrjuIYsWpF7L+gRZMh1/2nPf4T?=
 =?iso-8859-2?Q?mtVUd2y/KeiEafeTptsOOe2d+2291rr1UURbkF1wgFOFAkBX1z/LhZgb6k?=
 =?iso-8859-2?Q?NXO9dkFRvxYEyJYM8EZx9Ev2RReC4yieq/S78VrQOgjkMKkgU2pStdg2ko?=
 =?iso-8859-2?Q?lNY3/Vtp2VaLsy5Pmh+KtWPKnsm1BuCnhKJzlku1Z68LnNTW7YG7IF8tD4?=
 =?iso-8859-2?Q?9HhLQnOHSQx+gj5GV+VQ3HvAna4Oa9fydnYmeSbmaI//PkSv/sf0zEluNW?=
 =?iso-8859-2?Q?cl2WSpWRDVhmS07tD8zJAwYiwTaQ1vg2ltlL57bat5BFpWdLjZ85q3THtX?=
 =?iso-8859-2?Q?dLyWP43i7RMsnOmpNDlqWxWIbsJmGQpOOUbgOO3BIcgxZFjcbGHe6y/w7Q?=
 =?iso-8859-2?Q?7AuLf4TDMiTQ6kKMkYLFC6ghsZkOmceH1NwRvOu5S+wVJAtPHXb2WJUWPr?=
 =?iso-8859-2?Q?UYM7R50V3Rbg64dHQa1aoZjNWAoek57FvkCcqDCnY=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: edd5232c-f037-4bde-a2e4-08dc96ba7522
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 15:04:35.2725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR02MB9702

From: Petr Tesa=F8=EDk <petr@tesarici.cz> Sent: Thursday, June 27, 2024 12:=
21 AM

[...]

> > @@ -187,10 +169,13 @@ static inline bool is_swiotlb_buffer(struct devic=
e *dev, phys_addr_t paddr)
> >  	 * This barrier pairs with smp_mb() in swiotlb_find_slots().
> >  	 */
> >  	smp_rmb();
> > -	return READ_ONCE(dev->dma_uses_io_tlb) &&
> > -		swiotlb_find_pool(dev, paddr);
> > +	if (READ_ONCE(dev->dma_uses_io_tlb))
> > +		return swiotlb_find_pool(dev, paddr);
> > +	return NULL;
> >  #else
> > -	return paddr >=3D mem->defpool.start && paddr < mem->defpool.end;
> > +	if (paddr >=3D mem->defpool.start && paddr < mem->defpool.end)
> > +		return &mem->defpool;
>=20
> Why are we open-coding swiotlb_find_pool() here? It does not make a
> difference now, but if swiotlb_find_pool() were to change, both places
> would have to be updated.
>=20
> Does it save a reload from dev->dma_io_tlb_mem? IOW is the compiler
> unable to optimize it away?
>=20
> What about this (functionally identical) variant:
>=20
> #ifdef CONFIG_SWIOTLB_DYNAMIC
> 	smp_rmb();
> 	if (!READ_ONCE(dev->dma_uses_io_tlb))
> 		return NULL;
> #else
> 	if (paddr < mem->defpool.start || paddr >=3D mem->defpool.end);
> 		return NULL;
> #endif
>=20
> 	return swiotlb_find_pool(dev, paddr);
>=20

Yeah, I see your point. I'll try this and see what the generated code
looks like. It might take me a couple of days to get to it.

Michael

