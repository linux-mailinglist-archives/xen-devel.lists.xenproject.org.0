Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E4F91CE08
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jun 2024 17:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.750980.1158899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNaOG-0004HH-IC; Sat, 29 Jun 2024 15:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 750980.1158899; Sat, 29 Jun 2024 15:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sNaOG-0004Ei-FP; Sat, 29 Jun 2024 15:53:28 +0000
Received: by outflank-mailman (input) for mailman id 750980;
 Sat, 29 Jun 2024 15:53:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6MN=N7=outlook.com=mhklinux@srs-se1.protection.inumbo.net>)
 id 1sNaOE-0004Ec-5L
 for xen-devel@lists.xenproject.org; Sat, 29 Jun 2024 15:53:27 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2082c.outbound.protection.outlook.com
 [2a01:111:f403:2c12::82c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6a7d3ac-362f-11ef-90a3-e314d9c70b13;
 Sat, 29 Jun 2024 17:53:24 +0200 (CEST)
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DS0PR02MB9534.namprd02.prod.outlook.com (2603:10b6:8:f4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Sat, 29 Jun
 2024 15:53:07 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%2]) with mapi id 15.20.7698.033; Sat, 29 Jun 2024
 15:53:07 +0000
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
X-Inumbo-ID: b6a7d3ac-362f-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EivFZ62BSRqlLbc2KPBullcZi8bTa41ryg9LTf03kOW0jLTWrXPdO6tDqooqQUqRv7BOidJdfm1ZoAEQiFBZZIW3JF/EgmGyAiwJjgLjw8BnvzCIKrY47sU+H0hjTDoZL8seNAGXClDWNoVMHnDzJPR7i2UIz2nbrb6OhXKyTGdlGRZ6ciZpHTU+SImAn3k+YSysUPIAqAya2OMX5vW5PhCrZD7Q4Rr3yUCxJtCxrtvRWJsFUW8YkK+LM4+tkqHec+35KeI34NBBWef1y+m/xleU+dxH/Z99HXncKS+6XQr2IyAoE9/NHhZWRt9Pxolxz8BpyoBsFNaGBv6JYYeP1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RWj2FbwXeSXYv/TiJrBTuayy9dMETUpl6Go1ASRp+Gc=;
 b=XU4fXCrPp5hKk+In0UYiE3AtwybPErgROaERlQ6KLT+srlNap7Md7LjL8D6RxKZDqDlOubtWBNzCSzdY8MI663lEwMZS9KayN4zHdSE8XVSVbbnCXYVZSVQAGkoe1dO9giKu1Sf8GwU9S/0BIt0QKRbDgkD3tr+8T+eU7DfJRYET9tbsjajafFo+fd1iYi3IToyWb9TFMxjO/ZDMtwxhARofzakrL+p1xsm2dovPNxf6LRIf8ky4/466ggqlPo2JpvnAYeppYMyxXxIg/xWXxYR/lLcFIDBNRt+ms9QCMawyx1ODvjCxch78ZrJ5f6zzm0spqHeLRmbkpNuUgsSVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RWj2FbwXeSXYv/TiJrBTuayy9dMETUpl6Go1ASRp+Gc=;
 b=HMycqL7CDQq58vQzgBVyFcKuqei64hNxmKj67mkyhSP1IuN8/hTdR0gItOzDpKgIUig9PuWInrkUe6FJqV6sGA/2zc6Qi926WF+g29kW9viC7w3MCET8xuGiOFjRMOrCUbxkmRhgiz7tKspIQVs/dPaj/BGEKAMbc2prowQeG+4koKU68/mjbW8iexuwLRQO1Lqwmg3NeFAE1F4dsMhKCgNFwyfTZvCJwyX4yBVraEjOACKNdbv51CS0axZi9wPkEwFCdIxLVkQkM7+uYQTge6zEETVRCMdTPOZ2DxVwEIiHge9HKlKYyPVX3apY5EUkFC4wYdoPNE3Xzlts3u/CfQ==
From: Michael Kelley <mhklinux@outlook.com>
To: =?iso-8859-2?Q?Petr_Tesa=F8=EDk?= <petr@tesarici.cz>
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
Thread-Index: AQHauIjoJBWSrCyO6UWzcncSceBiMLHbU/+AgACADXCAAzLqkA==
Date: Sat, 29 Jun 2024 15:53:07 +0000
Message-ID:
 <SN6PR02MB41578519BA2E432E1B2154FBD4D12@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240607031421.182589-1-mhklinux@outlook.com>
 <20240627092049.1dbec746@meshulam.tesarici.cz>
 <SN6PR02MB4157CF368284CA48061E35E9D4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To:
 <SN6PR02MB4157CF368284CA48061E35E9D4D72@SN6PR02MB4157.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [3jSSy6RJpec1y9yGlKuW0UsMqr8rhynj]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DS0PR02MB9534:EE_
x-ms-office365-filtering-correlation-id: 4592181b-2b33-44e2-1f08-08dc985391ed
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|461199028|3412199025|102099032|440099028;
x-microsoft-antispam-message-info:
 TklGObHOvm4E4w+NIUWWVVbeuSdVj9dxNC3d40cRBWntqalYeBNEPEBg5UBgRDtyrxahinZGRD7mBTYOYepqkd2m+RqesBqZxnhgvO7PHTSG7/AavRYOPiZz2rnrDyKIupJPLRltBZe9fCtHH+YTIRGfoGm2fx4cBDSti2g0rgOaa57YqWT+yX2M8w86LPGQAviEtjzeI6mQqTFJ+WlU4RzraB8F8KuBZN+yP/muc9Mj8PqbnaUNIkyr+qy8Rt21UH0ZSPZTVHyIFs9fFPm26EY1J6s4qlA49QIFbZOsSsTtk0v92A+wR5oRpWhLZlqWnZUzm5bFl3+qwjwtQ2qubTsADCmor689ffcuoujsbhHn6JzQskA6Gy7jf3mO9ya6Nc2NDSa3VHWljyLa8hgyRisu3zXqAU6+0jqzf0VMs9NGwSkMxeyY0EB9Sor26RsIHeZPU8VEGtdlWcPH2RgaxeZMx0ZUgknXlgYbBM/42OhXV4O/OIiYwitbsnqxh/X6DkO6sUCg2LFSHpr26Ns3wF62pwHlC8S3aILRpL7DKejLBTK5NRgqW/iq5NQIpmHvS4ySEiQdgUszEb0RNTLjRxXDdwlSsab37t8nqgJdkwfI2s/B6SZKQVkbK4meNd38
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?Ut4FFUTD5P4GT5SnVfFUTUSnEYohUtodJaKLtiGtPNyKB82/WEk9sS3oYu?=
 =?iso-8859-2?Q?s+4GxpTeaADkKhlBaAdiTZqaaQcp5gqXJxujQSALbB4WgeW5o8XvfQRioP?=
 =?iso-8859-2?Q?YCATHOZ0APV90s8FlEdAxtHNa90fzmdoT+DTo9rv3LPCHfUQA4Fenc7Tie?=
 =?iso-8859-2?Q?dk7WoLfKb0KjyBqNGuMbkymtUaXKGnHjyg9DF66zlhmZFe7+uIGQkTuyy1?=
 =?iso-8859-2?Q?9zEOAAQ4KysBSCpPGxgebRGUISe55bVK6ZOXDLHm5n5hUuVBNlaKa73XP9?=
 =?iso-8859-2?Q?j0anDhBwWCJTcBzT2+wqoGgaz8vXuPWXbb4wV4mhnDL23JSNQUflR/DoTh?=
 =?iso-8859-2?Q?uVXdAWmA5/Y9joCMZ/IBHf9k6Dgz5MF6MleIhhA9ckfOH9ImO3ZFsrhFKN?=
 =?iso-8859-2?Q?4acUjbXUZEx4inWsNIHVbwfp72hVeKaXnFJT0MCpPbVwHD1DsyN5SjUdUh?=
 =?iso-8859-2?Q?WGfeBrQp9yW2QjpHiO4wlXC8OtakWcNuKdyH2jD6vp0g2Gut6Xh+RScc5g?=
 =?iso-8859-2?Q?DibofAQX5oU2TBeksn8RtM0bbx3SlG89y2ixbH44vdL1BnCZwpJcDphRNk?=
 =?iso-8859-2?Q?gKdC0EbK+XKjUFQKmcdj0NPkvWnraApPS35WBLJpuGjQYkm5Vi3/+Dch/j?=
 =?iso-8859-2?Q?D55uU8t0CmyTGI5L8ly1BrvN8y4kryykgvLopekMol+lyU25lKAq1Bqzuq?=
 =?iso-8859-2?Q?ksPKSu3byJKXT0DnAUlnMfWZcxPh7wNta3sZa25m6EP0PbzLQE635USrEj?=
 =?iso-8859-2?Q?zkbtqJa+DYHtFTOSKYivz5qNbws/f2jtno/sn9uD9Q36BcCWjmsQ7iy8GX?=
 =?iso-8859-2?Q?6IQA1nPQFH8hJfuiJrgwS0pzdS546JMgvZW1AEIh2CIb3X1sBJAtSbxFFX?=
 =?iso-8859-2?Q?WFUno1/Yw9pGtWqnnNkyP6A76n1xcTAR+t7Kh/Ti7tzJapO3ZWX62dzk5q?=
 =?iso-8859-2?Q?JvHO+RiXRM9vzfF+v5BX97IzmgNQ0PrElv6NON3tL7YvSV+O8pq84ca8/c?=
 =?iso-8859-2?Q?auX+dIYkOAT4fkz6e9ErSD1AiMSZgSq4l7wbj+5XTxZzKXHKE5jzr29kPr?=
 =?iso-8859-2?Q?n95HLsdqKYtj7j14FB8R5eBDv+XWaFZ9Ks9ttBBqyjEkx28kByPYak4pM2?=
 =?iso-8859-2?Q?16qjbD1jxhq6rykiGCasf8Pl84gGxt0X+YUVrjB2QNELh9/GQMI3tPyjhu?=
 =?iso-8859-2?Q?2NPG6CPVPekRMurjlGvv4+C4S4LEkk4eB2TUWsIqZ5I5JuP4bmOqGP2z21?=
 =?iso-8859-2?Q?/Yce3CnVxxH8/KUyvrV1t7tASvv2CvTaudW+Q9ZPY=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4592181b-2b33-44e2-1f08-08dc985391ed
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2024 15:53:07.7663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9534

From: Michael Kelley <mhklinux@outlook.com> Sent: Thursday, June 27, 2024 8=
:05 AM
>=20
> From: Petr Tesa=F8=EDk <petr@tesarici.cz> Sent: Thursday, June 27, 2024 1=
2:21 AM
>=20
> [...]
>=20
> > > @@ -187,10 +169,13 @@ static inline bool is_swiotlb_buffer(struct dev=
ice *dev, phys_addr_t paddr)
> > >  	 * This barrier pairs with smp_mb() in swiotlb_find_slots().
> > >  	 */
> > >  	smp_rmb();
> > > -	return READ_ONCE(dev->dma_uses_io_tlb) &&
> > > -		swiotlb_find_pool(dev, paddr);
> > > +	if (READ_ONCE(dev->dma_uses_io_tlb))
> > > +		return swiotlb_find_pool(dev, paddr);
> > > +	return NULL;
> > >  #else
> > > -	return paddr >=3D mem->defpool.start && paddr < mem->defpool.end;
> > > +	if (paddr >=3D mem->defpool.start && paddr < mem->defpool.end)
> > > +		return &mem->defpool;
> >
> > Why are we open-coding swiotlb_find_pool() here? It does not make a
> > difference now, but if swiotlb_find_pool() were to change, both places
> > would have to be updated.
> >
> > Does it save a reload from dev->dma_io_tlb_mem? IOW is the compiler
> > unable to optimize it away?
> >
> > What about this (functionally identical) variant:
> >
> > #ifdef CONFIG_SWIOTLB_DYNAMIC
> > 	smp_rmb();
> > 	if (!READ_ONCE(dev->dma_uses_io_tlb))
> > 		return NULL;
> > #else
> > 	if (paddr < mem->defpool.start || paddr >=3D mem->defpool.end);
> > 		return NULL;
> > #endif
> >
> > 	return swiotlb_find_pool(dev, paddr);
> >
>=20
> Yeah, I see your point. I'll try this and see what the generated code
> looks like. It might take me a couple of days to get to it.
>=20

With and without CONFIG_SWIOTLB_DYNAMIC, there's no meaningful
difference in the generated code for x86 or for arm64. =20

I'll incorporate this change into v2.

Michael

