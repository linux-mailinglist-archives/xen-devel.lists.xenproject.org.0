Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAEE92B8C1
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 13:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756219.1164765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR9KR-00085N-MP; Tue, 09 Jul 2024 11:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756219.1164765; Tue, 09 Jul 2024 11:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sR9KR-00083N-JN; Tue, 09 Jul 2024 11:48:15 +0000
Received: by outflank-mailman (input) for mailman id 756219;
 Tue, 09 Jul 2024 11:48:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7aM/=OJ=outlook.com=mhklinux@srs-se1.protection.inumbo.net>)
 id 1sR9KP-00083H-VI
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 11:48:14 +0000
Received: from BL0PR05CU006.outbound.protection.outlook.com
 (mail-eastusazolkn190110000.outbound.protection.outlook.com
 [2a01:111:f403:d100::])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dfed094-3de9-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 13:48:12 +0200 (CEST)
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by MN2PR02MB6816.namprd02.prod.outlook.com (2603:10b6:208:1d9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 11:48:08 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%5]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 11:48:08 +0000
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
X-Inumbo-ID: 1dfed094-3de9-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xy8oFcyiAPOtVf9ex4in9ZEyq0saxjlgk3qxw+XXOAvroybMaSwgFMsgjnxcUromWLUygSkLlevIlK4S0qsEBs7lESLHdr23hAWxOsudoq1rycbvMCLuF5/rSpi7J2Flmd+dQ/+KuXkk5j8SFV8ZcrSHF7K8lLXV9WpOV+VHZvMuMqTS0KXLDVjPu9QCtzPR68rqexTn03kHELrR85E8FrexxKdO5DV1wrU7LJ3/bqwrwe6hN7i/Ib4iWZuQ6PQXYIhwq42kKw0BWEDIUHz+/btpAO8MKNR54qZI2Iijbzizux9iTf/e2BN43UssuINI5xJ4u9exY/OtkzY0cRpIQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6GtlEgdUutsu9B8/TLjEoU4TBoxmCXMqCs2HKNbgq8=;
 b=E4ibLt3OhB8lfjTwEvfS3LZX5+rFTw0w4ObEV7+d8nDbxEErua2R5CbHeqLZBoQhGY89SqEJhJg7t5Q3ZpB4xARYb4IfewPne8PMU8GqDKDkZq9A5vKKq9Gp6AHR+mjN6RTkvHf/l4YlsfG1pYAnFZ3iAJPCLYWU9/rntbRVFZ6N1O/1ES6YfErLmJwK0gXsaNSwflFS66UgH1/ks+AocmD/nqStELPmYdvlKFXuUDzh20y1ZiJ+0ku7vbTdc2BHc+aK11er5iAafjg5PEA/6D5VWucxPJ6nRCXZg9lRHB2q0PjcYYaAQrsyTxFj7Z49sS1PTV1a8IiYqCgIfWgOVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6GtlEgdUutsu9B8/TLjEoU4TBoxmCXMqCs2HKNbgq8=;
 b=lfF07HEUitjC1WBH/bschFn2zkiMPMG6RLllqMYEPwdBkZrNgwSeUJoZ0uYPhbzjy/9YdF7mCX91bWm0nTNWfsdj/L+Rlm6QMXhWFrM4fXSQePR7waBzwX3XJ3o9nsufIaX2WRQ0QlfKTfDl2QR59DX3YZ/y1uwaSNWa59O4hBvOWKbotEeGs8wa3bGNbxGtfN/fOhb2jrSxqmy5SMWMY22hAAFLgL0iEwS6kvpbdI/ezXJhZvVWas1QHIOeH7VifI7NZ0F+bC1YDUDISW8fXxf6M3EtpSTXlGSACGmj/FDhBosoZpjCD7x0FMEP208dePpp1jXk7sp34wFbVI1C6Q==
From: Michael Kelley <mhklinux@outlook.com>
To: Christoph Hellwig <hch@lst.de>
CC: "robin.murphy@arm.com" <robin.murphy@arm.com>, "joro@8bytes.org"
	<joro@8bytes.org>, "will@kernel.org" <will@kernel.org>, "jgross@suse.com"
	<jgross@suse.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"oleksandr_tyshchenko@epam.com" <oleksandr_tyshchenko@epam.com>,
	"m.szyprowski@samsung.com" <m.szyprowski@samsung.com>, "petr@tesarici.cz"
	<petr@tesarici.cz>, "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v3 1/1] swiotlb: Reduce swiotlb pool lookups
Thread-Topic: [PATCH v3 1/1] swiotlb: Reduce swiotlb pool lookups
Thread-Index: AQHa0W7SFxxRPYjEqkS2vOXnJ50UvLHt7teAgABXtOA=
Date: Tue, 9 Jul 2024 11:48:08 +0000
Message-ID:
 <SN6PR02MB41571D61C2DE0D914D8B0923D4DB2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240708194100.1531-1-mhklinux@outlook.com>
 <20240709062555.GB16797@lst.de>
In-Reply-To: <20240709062555.GB16797@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [HVTDK+uCEaeHZgfZn7MwsYzJS7qXaDgz]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|MN2PR02MB6816:EE_
x-ms-office365-filtering-correlation-id: 6080a5e0-45ff-4c50-4210-08dca00d00b6
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|19110799003|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 vo7tbdZjjqEoerB0jtj9RnHvA+bLylOEahcBKDanFMeYxpDfmYrmHnvvU/XrNxve2JJgNRIZu9Q3Kl6VDyPjGBTsh43v5lOBhE09NJEiMW5oUWwT/Sb69QMCUJqAYz3jV1zq+tjGk17kLTr0td3/S3H1s9JC9c+lxZQD09AnxYwKDGRw5OcPaOT6aYPCjchVrYxgXEshQtreBJQcyrLZFnXEqNA6qAjypAMy6H8qu0dfgoEvaV4vLwelSyZcArjsn/j5zunRuqeaMN3KsqpUp5wQG6PolDkEMtQMJUi54OWOKYw9c18EIlCOoQg78Dd1yhlPNg2pCps8PvFRQtMr3pBMAkQVOnsEAMYz9OGjAZQ0tFE2V304P124gBOLciMQiJ3Ht0pTIN3Cfissq0vFing7jDmofhVE6qU1ZDUTfEOZEOU//Iw3JLBdSFgK1rVD2sbHOoCLOJAfZ3Uyxb4qD83xxng7NRYGqj9dbqGBTiGz4qb9f4FOZp8it51RimEkoOZ55o6T0rkbib4GUw2DDmI6RE5EsrAIQAd9byLBVxigLBlaJLfIQ5GJJoW54YA4v9AJFZPS1F+57qMMZr7oOPBp0m9enT7G6r5Wl3wfEeQMyKPLMFzhLkDZg3d+Y6iWPdc/RdoMzlWYp2clLEjyaA==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IxKq7bLAfKKaosF7QxAVSz56hBFpDS4KVcL2FUhg0lKWptL8tw11srjR7nCs?=
 =?us-ascii?Q?h9UfYnpK92LqF0hztu9yxMDE8jjHTk1cSyLhJViw4lAnnOe/XNEgQtOjzAcw?=
 =?us-ascii?Q?YQ9Y4p5XMgVT4YDNeiHVNBTBwJyry/QPQT/f+O84bawXyC4av4XFLViWscJl?=
 =?us-ascii?Q?Pw/mm3+IDQV7k/g8IQVrkXxjqbTAEM0Um/cYWeo7HWq6Qb16bKcN1Hqarnc4?=
 =?us-ascii?Q?vuOUP8cx5LVtPdQCzZvaa5y35VpGWET4bH74qpmWvnuxyAVb1mB+nbAhobb6?=
 =?us-ascii?Q?VshQuTJU/JqQmuCF7FIpaW2hEwVGKDsSKxjqkYgiuTbCtTAX2O9Hbi6xNyhG?=
 =?us-ascii?Q?TJJWtkNkghh9mgIzOr+rfB2lVwDlBJ1WMR0xdJZT3ZW1W+qB9q3om434+fZF?=
 =?us-ascii?Q?hqwHq7yIg9h0xi2Cx3I3AR8GlPE6L05RZdLOh2VRASAJtOgo3zlOWJ+w24hY?=
 =?us-ascii?Q?CxR068/UC6IJGPJgjIEGDovbvFfwICLVq71jGPNyeebuhMPOsSQhFahwfco3?=
 =?us-ascii?Q?nqe3judH+dP83HFfdvZTAIvdnpAfGmh8frcJ3IqMDUAL3u+GAi8Xyw3GJtXp?=
 =?us-ascii?Q?/aIIVcr3lo5dkbXf5hdJwpfejkk02UmcQInGYh6jfOeAyCPj3oT/5RFFRHwI?=
 =?us-ascii?Q?QsWhJdNZGe5HL0Dv4T9SMnZMoFsJ19ZTpbmvqQ6QcZ7sfBna4htWbeeHMdMT?=
 =?us-ascii?Q?70g0PAkJqbpmaK3utF4rUIFuta2q+E1TZ276aS+Ek/waac4c33+zvuzGvhvh?=
 =?us-ascii?Q?gnJDAWtR5bZK8SmCDYeipqCKCkeA9lgCTn9yClcsukxZINwWLPQoyk3I6tHh?=
 =?us-ascii?Q?beV9TJleEP21agKDP++CEwsTTa3LDHBu4wH4dV07hH9gclZC4+X1boeuftj0?=
 =?us-ascii?Q?QbEUcQ5m1KDFUQKk7Tn6Xh+Yv+tAaDRNF7Wel2A9lT5J3lLOqs/grgB4mA0q?=
 =?us-ascii?Q?xySRTDAflmikhKKodl3o10ykQWfxOda4ixJ/cihFbRjerjLSOlw/ZcnZivwL?=
 =?us-ascii?Q?z1ExBOj/BGRkHgITAeAbQgLW6klD6jt/DwL0DM2eBmi0mW7wfV6TM5tKuub6?=
 =?us-ascii?Q?E8GLaRvjD5BxsHSZVlM/OVlMmDtNRnS8g5B+GL6rYgwe18+cFTewKcduL3rU?=
 =?us-ascii?Q?fCJhbsLblS5AfySC7wapIMhnx43mzdXqzCdHeBRRscCF5ixb3ZRiChJGnSo7?=
 =?us-ascii?Q?c1QUjBMn6XUoSFXegFzKQnuKOhiy0vtnZ1xKoWY7Uxhp4ObDMnMo4iPIGug?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6080a5e0-45ff-4c50-4210-08dca00d00b6
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 11:48:08.6511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6816

From: Christoph Hellwig <hch@lst.de> Sent: Monday, July 8, 2024 11:26 PM
>=20
> Hi Michael,
>=20
> I've applied this, but I've made a few changes before that directly as
> we're getting close to the end of the merge window.
>=20
> Most of it is very slight formatting tweaks, but I've also kept the
> dma_uses_io_tlb field under ifdef CONFIG_SWIOTLB_DYNAMIC as I
> don't want to touch the device structure layout.
>=20
> Let me me know if this is ok for you.  If I can get reviews today
> or tomorrow I'd also love to add them, but given that all this has
> been extensively discussed I went ahead with applying it.
>=20
> Thanks for all your work!

Your tweaks look fine to me. Evidently I misunderstood your
preference in our previous exchange about #ifdef vs. IS_ENABLED()
in swiotlb_find_pool(), and the effect on dma_uses_io_tlb.
Reverting to the #ifdef version and leaving dma_uses_io_tlb
unchanged is my preference as well. The #ifdef version also had
#ifdef CONFIG_SWIOTLB_DYNAMIC around the declaration of
__swiotlb_find_pool(), but that doesn't really matter either way.

Michael

