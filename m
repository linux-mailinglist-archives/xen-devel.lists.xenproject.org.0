Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4653E929666
	for <lists+xen-devel@lfdr.de>; Sun,  7 Jul 2024 04:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.754830.1163140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQHl1-0005xq-8A; Sun, 07 Jul 2024 02:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 754830.1163140; Sun, 07 Jul 2024 02:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQHl1-0005uj-1U; Sun, 07 Jul 2024 02:36:07 +0000
Received: by outflank-mailman (input) for mailman id 754830;
 Sun, 07 Jul 2024 02:36:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EiCv=OH=outlook.com=mhklinux@srs-se1.protection.inumbo.net>)
 id 1sQHkz-0005ud-5q
 for xen-devel@lists.xenproject.org; Sun, 07 Jul 2024 02:36:05 +0000
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azolkn190100000.outbound.protection.outlook.com
 [2a01:111:f403:d10b::])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a614447b-3c09-11ef-bbfb-fd08da9f4363;
 Sun, 07 Jul 2024 04:36:02 +0200 (CEST)
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by IA3PR02MB10675.namprd02.prod.outlook.com (2603:10b6:208:50f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sun, 7 Jul
 2024 02:35:58 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%5]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 02:35:57 +0000
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
X-Inumbo-ID: a614447b-3c09-11ef-bbfb-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFY9pvH5INRGJH/ECOsu2d6q6NwbNckq4+Hd0jsOSx1P5t1OPx33NpSnnWE3eOXJgC0zgC+CXk66Zlq1XO6JcUr2uQLS/3QzejRzhYaX6t+OELY7pvwfvPNaCR/6LEu3FslvVHj4B+cMKrIBFnigF0839pfuCWcBLVCLTLmYEDhUyr9iWOeiea8HrJjohAcIGBil9WsmtXWXQy4zFnHkrU8S9+JNvmmG9bYSL4Bw2RXHTCJQiCUsCJ8hzqB/gWIXngIn1rqofI4GHeiPuy61fk3z1P/zVYkhOZNdFzJTI/NlkYw5ns2pRNwcxfL9q6/gRakeyzYw2VkWGQJFuX13IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KzU+O3ozSDccvpcJDc7YDBn1Pzu2augdysaGFsYEoI=;
 b=nak967yj4Sq3u8gGKUmq9jI8WrG9FvdSKPOsBfnvX3E35LM+357Pck2oPP5rSmIGjHsxZSPtzRzplMHHUnwIur/aROhGwI4NYRubYx/wLlsWXrEyE3Nh0pXR6aNHIOJcLlTmC8hI2+Se9qyUfp8ywaUGW0myCMYr2hYuo4grm2IYYlVZt1J8ZlAv54QlbBd9zRKer5O5FpW6R0voI18oytDa3VxbzxwOJXXcUuHg9yqU0QW0zJ5UYqUwujj/hlpqybjitQvu5w3scQKF4u8WQ70sAGYiu6rq5uPjLMhTmY/cHkKJn7kDtJtpvmNxhIKMoRvbJTPDBIgcP1gB/s1qGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KzU+O3ozSDccvpcJDc7YDBn1Pzu2augdysaGFsYEoI=;
 b=Mk9hpqfcxFRybNnTlEp0AgZ/x37jpP1K0TQJnS+l1pR6bdJIQPkQVaTXV0+ARKvC9e0I50486LR+fGJTzU2zGwTMxQOiDrVPcmxBZQhQE+jWepzESrb9qGs2pTgUIR++O93KOaIyJC+YevSBfk8XjwJ4ILRTSBGKiPl7HmfSBpsdWiuxxSP6C1T1o6px4X5OmIr1jHbIyPkk9MSjrKvd2gSaj7qNQc3TgNRI7LW9mPToU8GX0RApi07wojcIJH688Y1gZwxKDU+uS5EnCTLZ3Y1ys3Rcxt90aT3clnLeh/ijeW0pVwMgn5DYZEog9xN1hHDYDOvYRPiqnULwkbN/CQ==
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
Subject: RE: [PATCH v2 1/1] swiotlb: Reduce swiotlb pool lookups
Thread-Topic: [PATCH v2 1/1] swiotlb: Reduce swiotlb pool lookups
Thread-Index: AQHay9fgMpKn4lnf90SYtF8Z1AfgLLHpORSAgAErN7CAADBQYA==
Date: Sun, 7 Jul 2024 02:35:57 +0000
Message-ID:
 <SN6PR02MB4157144A1C28D63E00B4F9B2D4D92@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20240701165746.1358-1-mhklinux@outlook.com>
 <20240706055019.GA13280@lst.de>
 <SN6PR02MB4157141FBF8252BDEAD831C1D4D92@SN6PR02MB4157.namprd02.prod.outlook.com>
In-Reply-To:
 <SN6PR02MB4157141FBF8252BDEAD831C1D4D92@SN6PR02MB4157.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [0AoF1RSeJm00yQ3smvjGBiTH2ypQgbDW]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|IA3PR02MB10675:EE_
x-ms-office365-filtering-correlation-id: edeae486-2717-4228-2e57-08dc9e2d8834
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8060799006|19110799003|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 eoB7t4cQEtZTgMoHOtj+QiFPu4NwcMvlnh0gbEvUe68rGfpVhwwl2kg30YdX00z/n6SjKIPbsKMm9xK/P2G8inn6/g+fHM+FjFqysSqb6u4/JJlAjDvNIDI7cGkB9dCSrcmh32nxpj7kOIUCZdFCAtIhhvcuvzi4zGbamfl6qXAKhJlyAnebcnsVtFw1gcB5FaryOelZ+v/9KJafwyTz6MKL5dY/5AtQjS9/g6420ktzCham5/A5fwDlkf4i0XAIL/x/RV9sKS1kHifcoeyEQvOVQs/qI+3kSRqq7nJOUHYmGwou585+h/9C67z+f6qzTftWbqKueQyN7yJzU40HwoqzPKIXGm7HczIAca/3CaeYJBo+ywI71fJyHT+wYaKoPIEkCXMJJamyjAIPIBXzjOb9+XyQ4AiwtlHU67vOc1SKt8HBeKrEeeTyllDejgeU+gsxx83UkMi/OSkWrkC8ETE+w5NRTMx864vT1vaWN0YbCIIhV7LJ9pc8G9ftnkktpOkRBRj1BxnVojujtyLhbGFvFmtUoTYEYsqlAdVpzfwdQPXTN+eyvMNeWOYOzpgmscSZDAOObUKUMrXpqm4+km/DYyFF5Ng4pVEGuR7GpV/nI5PuwdaRVCRki+B8gHYwdi+bD1edZv71eVrrgfvoug==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XKxrFKf13SyFUhUA14pSiXK/kU9AuevkEZM6FJEraFIv/ttbr8o1PAn/E/t6?=
 =?us-ascii?Q?8/scAMixQhlgC5Do5zfNDJpmm3p0e0u+mpbsgziIOfhn27yjuRL5FNfg44eA?=
 =?us-ascii?Q?kHrd17j0/fK37uICYx7eL1lU/yCwMRffhi4lzS7fENLDjSSG6Pcbyd+i7n3O?=
 =?us-ascii?Q?02mA+ciAu3QJSrqWJFVruSbUZVeQ0hPL3dW8Q3ILrz0pBIWU/Ta4K2wbmp0n?=
 =?us-ascii?Q?y/ZeWuLv7cxhPqtFdROS3wI2QPhr5R8XATVjv1pbeYs6WQTHRmTWO7uS4Ocj?=
 =?us-ascii?Q?SSzS01WY30oZw6GhmBgkx62lr8c1sUxOayZ1GIoQCOEkZAuFUSD6bzCIZvDN?=
 =?us-ascii?Q?xIGt5lQUXUc8t+KLtuonv+sAtZN4WcdFnP5BYfdVmVn1biXea/UfBN3ANS7R?=
 =?us-ascii?Q?B0XCFWSKvY48CxOC2+57U+exMc4qp6N+33Xd2Voo+RKxocKdgnPC7bd1EDZg?=
 =?us-ascii?Q?/+PR4bbZMvMs/OqCQiUruNIcnYvHMtbs+G0irNwRk5YINvxqWOeevxxUm8As?=
 =?us-ascii?Q?MjVJTagwLjWkUi9moTXRBdqfwoDKt9OBmrS9UexB59FECzXgFcYLVvZxLV7L?=
 =?us-ascii?Q?bdNibAkny644i8YyMeh5+YYTBkZSVIWfaVdCjUMpYklBrU94eAV7WdLdAZEP?=
 =?us-ascii?Q?ICI4TR+GhSKb5nHt1XTF8ZxLQKGF2sLQfABzDBRuFP8wVegQ1fdS0qYMsXMv?=
 =?us-ascii?Q?BzBBl6o0NuTZRXkqHoTLkp/vIwR3ecOmqXaVQ12nk7kQ+3HEz27XwQvoAUXT?=
 =?us-ascii?Q?T6i1W3cZ52lTV+tG19WTITjSZTg7+SgjhV4cfSCkV6qxrwzOVRHIoWPNMuJi?=
 =?us-ascii?Q?Hb1aTKdjB8ohyNkICBMgLSqUKkYrCHlsjZvu1y2g5o9FIYpf4d3RFFJb44X5?=
 =?us-ascii?Q?U8ufOshXhW9iDsCbE9jsNnJToAuFI3I63ZZCM+jxTHBbkSZqM9I8132Y5Z3z?=
 =?us-ascii?Q?waXsd6aYwSqpWGA2jKtDZlTT1wkjMqWgAT+5FixHToixBZyi53t1jKMbKxMf?=
 =?us-ascii?Q?qX7BlOmhpL69IrkyZqDJ1OemQCqLKHbvNV9u1DdMLHg/rn7LMQzA49Lq7uZV?=
 =?us-ascii?Q?DWMTw+ZAMxlQAz6VtWN/wHrS8bSxmApsIq0ashYSz8VV4q1JipodXnjwXpsN?=
 =?us-ascii?Q?TGiMMGC7+fyRXr6xFtJ0DnRWHUKwtYk6IMCJfuyeCkI2PmKxhi3vNSZ5Vajp?=
 =?us-ascii?Q?sThsCmpu9DgdEIIbZNaRw/MI6RfcgbX3EtfQiD6kPHB6yOcLOaBJbLU3x/0?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: edeae486-2717-4228-2e57-08dc9e2d8834
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2024 02:35:57.5042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR02MB10675

From: Michael Kelley Sent: Saturday, July 6, 2024 7:12 PM

[ ... ]
> >
> > If we then stub out swiotlb_find_pool to return NULL for !CONFIG_SWIOTL=
B,
> > we also don't need extra stubs for all the __swiotlb_ helpers as the
> > compiler will eliminate the calls as dead code.
>=20
> Yes, this works as long as the declarations for the __swiotlb_foo
> functions are *not* under CONFIG_SWIOTLB. But when compiling with
> !CONFIG_SWIOTLB on arm64 with gcc-8.5.0, two tangentially related
> compile errors occur. iommu_dma_map_page() references
> swiotlb_tlb_map_single(). The declaration for the latter is under
> CONFIG_SWIOTLB. A similar problem occurs with dma_direct_map_page()
> and swiotlb_map(). Do later versions of gcc not complain when the
> reference is in dead code? Or are these just bugs that occurred because
> !CONFIG_SWIOTLB is rare? If the latter, I can submit a separate patch to
> move the declarations out from under CONFIG_SWIOTLB.
>=20

Ignore the "two tangentially related compile errors".  I schlepped some
code around incorrectly and caused the problem myself. :-(

Michael

