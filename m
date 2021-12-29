Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20078480E63
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 01:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252272.433265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2NE8-0006Hk-Lu; Wed, 29 Dec 2021 00:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252272.433265; Wed, 29 Dec 2021 00:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2NE8-0006Bt-HY; Wed, 29 Dec 2021 00:54:00 +0000
Received: by outflank-mailman (input) for mailman id 252272;
 Wed, 29 Dec 2021 00:53:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrt3=RO=renesas.com=yoshihiro.shimoda.uh@srs-se1.protection.inumbo.net>)
 id 1n2NE7-00068s-Dh
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 00:53:59 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [2a01:111:f403:700c::700])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdd1e6bb-6841-11ec-9e60-abaf8a552007;
 Wed, 29 Dec 2021 01:53:58 +0100 (CET)
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB5054.jpnprd01.prod.outlook.com
 (2603:1096:404:12c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 29 Dec
 2021 00:53:49 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::f167:7435:432c:ebdc]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::f167:7435:432c:ebdc%5]) with mapi id 15.20.4844.014; Wed, 29 Dec 2021
 00:53:49 +0000
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
X-Inumbo-ID: cdd1e6bb-6841-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdruakidrOctkT2exasEObhPQs511WJuqs526dGnm9SqqBlXreVJY0Ay4Q94BYAUbwpwmuS0Qhw9utnqm04AegIH16uXBfBxkUPQxzAoClp0NaThNBU3rNd84N3i0q1cfNZ803HnKkyBSj3nZNBVC9nq1N0MfxvzX3ylunCAU4asxzpWJ92H4RFFe1MW78RBR5kiIrJ6AC5IlYLwFcenYEM8iYr4KNAIAWVeT9JuM7Zz0tz2ljUvP9VG81VPQMgPOI7XT9KHnXpV0NTFgMwGPXsXHWJONRHnv81HOZiPry3LByVIeQ8JLIcwozDZtikWmDpo3VmS4HwbLUlvEdArOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XrfrB+mDR3uFUa6BePj1CUc7Wk6nDrhXphJwlhBTGRY=;
 b=PhmKq1EehsrNUBghs7IPqkl3wCciQIvRxldiamoz7eCwh9AtGfA1qankNa3CCrn8tnYuES0nda81pGyfpQqNaNBLK3wRHUnvyRqM9apqoC1QZSfeNN4g6FTrhK5aB7hNHyf4h4L8KFYUWt/ldxLnbdTpBK7Q0jrbEy2l0wBcaDNXxo3SGQDxc9tGPTgSkRaU72nzuPlwuOjbZTXslrnY6CwIEUkSD5Bx8E/2KzlW72k/MaT3ApBcEfr9ATwdYDd6EsRIkyOxV+Q9luT7wLJYyqeOEgF1EOspEU9XBMtkLlsRWvw5PeeC8+XFT3uwctG7BIAh5XK8RCuS4doZiEGWpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrfrB+mDR3uFUa6BePj1CUc7Wk6nDrhXphJwlhBTGRY=;
 b=G7izcctGQHtvLp3Q+XUJutHumPOlkKIDQq8Ll3isKOaJ4+t/fDLna2SioyfhgclcKkWlkkizFhrNmV8UOGlHvjItHB1XX827g6EN371hmvHr958hq5+qgj1tTsPazPWGwGePOSXjzVR8qDvR5yRNZ0sEyiAz52UmZ90F7c5xZgE=
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: RE: [PATCH V2 08/10] iommu/ipmmu-vmsa: Set IPMMU bit
 IMSCTLR_USE_SECGRP to 0
Thread-Topic: [PATCH V2 08/10] iommu/ipmmu-vmsa: Set IPMMU bit
 IMSCTLR_USE_SECGRP to 0
Thread-Index: AQHX9ebXgjGZd0iLi0ieVXpWLYB8sqxIsLUg
Date: Wed, 29 Dec 2021 00:53:49 +0000
Message-ID:
 <TYBPR01MB53418CEF0A1ABE1D7EC09F21D8449@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
 <1640034957-19764-9-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1640034957-19764-9-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 90df181b-6ba8-4db2-f493-08d9ca65ad2f
x-ms-traffictypediagnostic: TYAPR01MB5054:EE_
x-microsoft-antispam-prvs:
 <TYAPR01MB505450A09D3DE0A359CA52C5D8449@TYAPR01MB5054.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ek00mJLukQ35nR5D1uFenaa+0i9TPpx4HekAklrcNtskdpDn6sZNP1SYgdTcGqqTJkbA9ohUl1vEeFuPKcSNEMWiD/QCXBQf37YXzzhDJ+oDQeJB8Okac6HYGBGOqM5b1uqeXNzWch5Z9oYX+RRJuorIaRRvI3aY+fIq6XubwFmccHDgN4DvGOxDedCo3bDiOk8CVMRB1eZprqqHJSJ0sH/hY0YNmTL/G5GpJDtBStIHcChT+Vl9Ls79/7DymksvZ3V/CclYbqiWugTJqfAsaii1Xi0DLEzSwDqJozqQnX5IKRvuNu0eTF6VDLD+PR0LspPZl8A33dwpMs+GtBO8MD4daZRPbXQJFQvNL5q1heEl3n/icHiK/wT/SxxZLVTRTTVoeeTv5rk7zqVkJYgt91sWfIxcgOcYMw+KcnGB0pRQob5T2L3YBoLPGKZG/WPLPzD64Dq/1XGamQAG7U24I0dpAUrVPcUdG0gx6N1hVxUXnKgtmMHsxZF/QA34LZwXF3FKPJjqPCozaYVzxz3B4ZGEyTSfOHMoMbXADNPdWTC8VO3KU6kKuXW9AvewvOzSMl93FVWqJr7hnTfL8LHxGx6MBCDxEnDGZFmQ7EefuFalEglKekX7htGua/2awJZG+exzJF9xGN2QdQqBK2A965jwDv39CPd56GN4qL1RiFE1s5d9lWBH3ioM8PBlB2Ua6/jzS0hWxo+kn25SH5IQEg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(110136005)(9686003)(508600001)(2906002)(55016003)(33656002)(5660300002)(8936002)(52536014)(7696005)(38070700005)(8676002)(186003)(54906003)(86362001)(66556008)(6506007)(4326008)(316002)(122000001)(83380400001)(64756008)(76116006)(71200400001)(66476007)(66446008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?BMqBggItQ9WAihhFKjuQ0KGADFXh8baL8V77VCjzl93hr7jNmOJmE9tjcVQG?=
 =?us-ascii?Q?Cu3sDZueeAmkY8GLXLP2KBNAwA1MSL8ktddr5v1i3NuDKXm1BRuOu8GH0a2u?=
 =?us-ascii?Q?ZJXAFW4dO0BfLUHsttKNKRU74a0Y6ezcWmug4WN4nySSqJCGt+rYsfGAKnTI?=
 =?us-ascii?Q?ZXUpa+KJS7dPRAw056G77In/BIdy6cG4SegX+J9bzGtyxvA46Ad2bgUypKfn?=
 =?us-ascii?Q?gaK7RQknTuvjlL7lIawbbi0vDf8jP5+NzxptoFP/tNiskHuTI+dpHiG+HJvm?=
 =?us-ascii?Q?vXeQIhMtxZheXlV2QTLRrCzJ3P/L2iDugEY/tVSvwgoTA0nfioo7mzUK2viG?=
 =?us-ascii?Q?eoJobanUhVXpHOLaO8xQZd+TOgXA0HR4M3bBhTP/WTyh9HyJmZtAm9humIVT?=
 =?us-ascii?Q?VRUHLxQ2BU0ILMsdlxH5cZJJ16GvEEBtxIgggkYFu2XJ8NbkT3xht5PLYOW0?=
 =?us-ascii?Q?+hUM6di7brHc5j1sUcUU8IIOby+NOG4hRZrDR2zPkTNJ7lRdu8O2hSuBwSas?=
 =?us-ascii?Q?FSeVbinHO0WBFrmF9hUDDVftFOFVOwqoUhP1wakf91yuno5nPigdQHFO7m+4?=
 =?us-ascii?Q?KEcvgZkXwrPgnKMeBnZJnoyW+4FbGzc2d01mjkTavnCePV6WnrAvWRdqypig?=
 =?us-ascii?Q?kwTPRAfaj+d79AkQjh7BszEJvntTo3U5y06oyRC/zeuD1rBYjYbbiFuRGi2f?=
 =?us-ascii?Q?RGGSbc6DoPv76ruV2bMTX98/LtV4+Vz74/+Hx7Mo4zUPZYxdwr8I0EgS7v/l?=
 =?us-ascii?Q?Lh5TDgH1oztEmc3HruJioQd6iesIhM0KqCviN5412SN8USAOHWnohU/QfQ5U?=
 =?us-ascii?Q?7g5k0K+Zu4Q9SKFtbBi+lg9arOoWXdhwPA9PEIGOV+J2/F7lQ2o+trW4Y2BI?=
 =?us-ascii?Q?BrVLAngfsEG4YmdIMQ89bwr+gYQ9fpgTI66JDevMSim3K2T8yCkSRxeb8a5l?=
 =?us-ascii?Q?ROVLubinx6sJzOwNHLsJF99Mzb78bAvne3G4rGkzVUBFe6pXAdjYVkMqcr5a?=
 =?us-ascii?Q?555A4h61iZ55BJy47xaV6OM+rGtJAOIcJMgGXZxEU641JbswCDRaOX1DQEvG?=
 =?us-ascii?Q?M5aA+ZHs6YzWGwACDbUYKroB3tp6mVj0AyfSbOJuHp2AKrgggJ0K6cbtgfrX?=
 =?us-ascii?Q?+Vf26/zPbcUhtnr/Fi/tNntOOcbP7VvXiskprLoq/tFIRnAlp55pL7VyGnKT?=
 =?us-ascii?Q?ZTZ8csM7/lAO0JYV8taX1LlyU55os63twnSYRFAskgyP2If485bjfwj1mWpq?=
 =?us-ascii?Q?Z/bxUhcwzkfWGiuH1I5CQ3cBZG2kD4s9YLUq2ONOiO7WgK4zR5rS2akevqFJ?=
 =?us-ascii?Q?2wGK+nwzJJQnQLfR5KmvKWHSayEgdacbv257N7dpa61+bW3CRQWGTQuuoXAz?=
 =?us-ascii?Q?Pq+4+6cZc8ckQ1xkQ+RDe2vYl/dKfUCCSeSi3UrMvzrMeAld7GhZMgd9shhI?=
 =?us-ascii?Q?zwWeS2q6iy996XVCP71lq0cohHQodK/fzZ6VGs95gMbsuUdFKmiY0R1i+FW5?=
 =?us-ascii?Q?PXfJdfWzZWuVTAkgzZdJLKXd0qVnwWzH0d42xqhx6YDWDB0W7CI21DPv3U2y?=
 =?us-ascii?Q?6Q6EiOu1/5A6OnGhBnL0Zk+yqgX6cSEhqLYbOzMzOG/+DdTBsG0B2EjyAdLq?=
 =?us-ascii?Q?zoFOBxOb2qlq9/sIBV3Ceo0zkUQDbHi5ioWRtPTn1KbT9OFjnYboyr3O93Fj?=
 =?us-ascii?Q?n79xgOpEV5aayaaMlwFcZkT0YBkdu+u9830Ax2KpVfeSL51jRWjzx1RFcS7i?=
 =?us-ascii?Q?sFVhXAF/G3736zHF3DRWaQBYA9jUBSN79BLQL7X7YCcPCrP5M+Qp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90df181b-6ba8-4db2-f493-08d9ca65ad2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2021 00:53:49.4360
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5YZT5EvVFfRqXvx1fSHSMCt16YXobWuSLzLiMWyp+t3ztKZ1wJsvZdRtuuxknIMkDDCfhWHvrszVl2A/9feMVgV9ajQUxra2+zmsT71yIWkuGoQmn5IQlpk8cOo9sINk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5054

Hello Oleksandr-san,

> From: Oleksandr Tyshchenko, Sent: Tuesday, December 21, 2021 6:16 AM
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Based on the following commits from the Renesas BSP:
> 8fba83d97cca709a05139c38e29408e81ed4cf62
> a8d93bc07da89a7fcf4d85f34d119a030310efa5
> located at:
<snip>
>=20
> Original commit messages:
>  commit 8fba83d97cca709a05139c38e29408e81ed4cf62
>  Author: Nam Nguyen <nam.nguyen.yh@renesas.com>
>  Date:   Wed Apr 28 18:54:44 2021 +0700
>=20
>   iommu/ipmmu-vmsa: Set IPMMU bit IMSCTLR_USE_SECGRP to 0
>=20
>   Need to set bit IMSCTLR_USE_SECGRP to 0
>   because H/W initial value is unknown, without this
>   dma-transfer cannot be done due to address translation doesn't work.
>=20
>   Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>
>=20
>  commit a8d93bc07da89a7fcf4d85f34d119a030310efa5
>  Author: Nam Nguyen <nam.nguyen.yh@renesas.com>
>  Date:   Tue Sep 7 14:46:12 2021 +0700
>=20
>   iommu/ipmmu-vmsa: Update IMSCTLR register offset address for R-Car S4
>=20
>   Update IMSCTLR register offset address to align with R-Car S4 H/W UM.
>=20
>   Signed-off-by: Nam Nguyen <nam.nguyen.yh@renesas.com>
>=20
> **********
>=20
> It is still a question whether this really needs to be done in Xen,
> rather in firmware, but better to be on the safe side. After all,
> if firmware already takes care of clearing this bit, nothing bad
> will happen.
>=20
> Please note the following:
> 1. I decided to squash both commits since the first commit adds clearing
> code and only the second one makes it functional on S4. Moreover, this is
> not a direct port. So it would be better to introduce complete solution
> by a single patch.
> 2. Although patch indeed does what it claims in the subject,
> the implementation is different in comparison with original changes.
> On Linux the clearing is done at runtime in ipmmu_domain_setup_context().
> On Xen the clearing is done at boot time in ipmmu_probe().
> The IMSCTLR is not a MMU "context" register at all, so I think there is
> no point in performing the clearing each time we initialize the context,
> instead perform the clearing at once during initialization. Also do not
> abuse ctx_offset_stride_adj field for the register's offset calculation,
> instead use recently added control_offset_base field.
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


