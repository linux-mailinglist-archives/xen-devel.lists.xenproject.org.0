Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C480A612CB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 14:35:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914587.1320311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bg-0003kN-7K; Fri, 14 Mar 2025 13:34:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914587.1320311; Fri, 14 Mar 2025 13:34:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt5Bg-0003hD-4g; Fri, 14 Mar 2025 13:34:56 +0000
Received: by outflank-mailman (input) for mailman id 914587;
 Fri, 14 Mar 2025 13:34:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/juS=WB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1tt5Bf-0003Jp-0g
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 13:34:55 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c8d8179-00d9-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 14:34:53 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by PAXPR03MB7950.eurprd03.prod.outlook.com
 (2603:10a6:102:219::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 13:34:50 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 13:34:50 +0000
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
X-Inumbo-ID: 1c8d8179-00d9-11f0-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lUdF7+YpF/RQ7KsWE4XlRUkwa8jRxs/gm4aLTsZofwVnLynl+IDgTGZNRFj8wNPDL8LXuCTQsy5xdeHGDOz55eRvW0hkWKJREa0cWQzFExqM+FgAHYIuANgq2k0aE7HCv4AfoZjG4AozwVakuwPzhSIBibZ3mgck5q5E0SVD++AW37CuzpS2d1a39jF8BaYZU0BA6LJCSITpRgOKA6TG2pYKZULL8oXTeIY0zbgwe5Nxzhun8vHjSqtnZbG2b9WSwJURLW3F/pSiir3pzYqYdKT1SBSQmxXMnlHFgy2Sr3Ri7ojRUbhTQoScxdfLhVl9mMeAqr59uY9dthQ2TBoXmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiHfeCJsztnzol3w0nFYnZOBAO7JVtS2ELlpCTYYWPw=;
 b=uyTk+ALrUZdqM+LlVgnLVcXuLQALqniCdfulKmvjTRWRKFjjBMhawZ8K89NxLXNqgTvUN44w4OGsCt0PV5L8aDVPFOwAhJuhGQgawxgYaz+KFYJZScN+d+B279QyyKyKVHOBu9P0UoOfrFq4bDvtVSXF7aroa5i1MlcxdRQk1NHXgg+tJ5Titf6Cb1whwYCuIQm31uOs6wuGgBEYVuogjvjZzVYKZ52Gt5qInjZoaYEuv+kX8oCLdKADZRnUzW2s1tAxSLpW0pe8sAHJYKzzWwkW8o4cvRCVnJyF3FE/VFMaarjPvU0ZuDKZYSo7Ge7ZNnmrIoPTYoJ4rS51vly+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UiHfeCJsztnzol3w0nFYnZOBAO7JVtS2ELlpCTYYWPw=;
 b=GkomC9US+rKuBNWHrCwFBiqYE6cZ12Rm9fMvKsZpyL/aOZcFsc/G+ZYuFcgiPJZUWAMMv3c9I6WjQ3UwBRFJ2TcWAIIvPFI4/LLyEMrEpYlCApm8v6a5/przFIU9opaSWf4MdvI04l51wDvSP0Y4QoCy6tNwZx/SgUh/Wy8zwbNdG+Ui/EaQ5OaXR/muGJSVwZjBrtQjWUK/D94oztU0pqauxqv1TRo0Ul6tj5o/8QAupMRFcOYKBoYTqPEDEBswDpNPi5FqKEHBMBv1HMaeO4fzM8GOQbi1Ktt8a8HQYZyK/mdbauVt/1kYeXc4bEpbATiJAgkOTTVgiwSdM5Iv0A==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Stewart
 Hildebrand <stewart.hildebrand@amd.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v9 1/8] iommu/arm: Add iommu_dt_xlate()
Thread-Topic: [PATCH v9 1/8] iommu/arm: Add iommu_dt_xlate()
Thread-Index: AQHblOXcMT5vj1FVrECA/jH3D/u0iw==
Date: Fri, 14 Mar 2025 13:34:50 +0000
Message-ID:
 <d44b09bdce11137574f3a54ffd4abb6e8a9b1d5f.1741958647.git.mykyta_poturai@epam.com>
References: <cover.1741958647.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1741958647.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|PAXPR03MB7950:EE_
x-ms-office365-filtering-correlation-id: 58bfbc27-e59c-4612-cff8-08dd62fcfec5
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?BFHhT2iyl5MsO3H5aWAvd/1EJfnumSP+9Rs3L6p8LEGLxLAOetq6cM9/+q?=
 =?iso-8859-1?Q?MpBpx3SVqK2a3VuCAkacwwUH4AGzJk0bpOmRjG459aSkPZQIPUKi7zrqLe?=
 =?iso-8859-1?Q?7DZZLeVYx1h598p29h/j1aDuM3ap1sM/+oxv6FUU9t5n+kq444kSFYfCfK?=
 =?iso-8859-1?Q?NPv5sBk513M/I5hdN7de2JHyhzkhdGf6JChXnwHYFE7FRhtZx6qjuNwakV?=
 =?iso-8859-1?Q?xXFb/F48xLxjVNkMcLy0ylP6yJ0a0YcjDz2V0oRhufwiCj4oZoONoTaVF1?=
 =?iso-8859-1?Q?aIVEsXpfnZvpWXACa3oyngsjUQW0KzlK2dHTjEVarjnV4JytoNh8ZqYiEM?=
 =?iso-8859-1?Q?XWHdNjARKQRYArmNYCHtEEXZSY4ey2RFOm/KHRsxee+jyyIuAJEOjznpHk?=
 =?iso-8859-1?Q?2vTXDVg7gRhir2GEmA/WhVwIgfmr5tyaYkBOacBV0JyDffboaWLdJuteJ8?=
 =?iso-8859-1?Q?tHaL0cmHHKlyYDVFDYGd9sdyBoAHYeG1zGSPXfpTza6U5fYdMSiiRunICQ?=
 =?iso-8859-1?Q?XwIUfri2r5Rg9xt4c6toakAlcidbRX0FN2nWQOo5wg6nHQi0pzydQyJ5dR?=
 =?iso-8859-1?Q?L+j2gdQiA88hNijpMuQ+x7n5wy3t0AC+SDYmLtJ2794+vhDCzc7KHR33dj?=
 =?iso-8859-1?Q?DSmCnJkKCxLGoOWb3eEsQpTcJd4ZNC1aSeUA2xt8IZ4exR3T5xY5D73MRn?=
 =?iso-8859-1?Q?dX/xEnYQM7BjS3OGiLTPH2pnlWuB6SMVpSWQS7htRkUgI8DZ20fY3YRWnF?=
 =?iso-8859-1?Q?x4rJMWnZ2h25Z9OOo/Ym25eJ4Ee6KX+3d6aL1BammAtGSA5G7bX8cyVm1i?=
 =?iso-8859-1?Q?ijNO+7Xj+/7jt3yfWRGPkVrM3+lfP9fThFPUPvXx/bs/OrglDvjRGrAuWh?=
 =?iso-8859-1?Q?XjrmBdfnTv4797WOfIKwdheEzyoQpTP1PDmfXt7j9ndxaLwUVnxONrVn11?=
 =?iso-8859-1?Q?UVc38+45fxdJgsHxKxmLWXjr1v3CMLwoAkvPYIT2e2u6otcq/AskMi+UnB?=
 =?iso-8859-1?Q?RetrJtkjhZ9uMoBry/dGbesQE0AqdIb19u9+w+cANhykdEGyiOK0+swHgL?=
 =?iso-8859-1?Q?sY8p77td4DG7U2ZQqCcMKIyBkiV9FmAxkAuFzxXwmgLrP416BDlPAVEj4K?=
 =?iso-8859-1?Q?YAOyzF0CF0OVVhnRY1tZdIRaZzHaRRtkMRDt7XOrIyiQ7LRb7dmHt/GErZ?=
 =?iso-8859-1?Q?YFFIJzpemh/lPcdSKLE7b2r8zOtRJiw7/3yj3dyMSQVMf/zuW3J/XdYP+y?=
 =?iso-8859-1?Q?gv7kLW/ehBLFhYIsP6aBiADY/o1FV4tqQCh/BuJKHfDdFmIvRDommUUFtr?=
 =?iso-8859-1?Q?TyhqK1iBcQgpL5etkQGG8EZU/8ep4pCJwVjDGyoy8xeE4JAf2i+eAa9f8W?=
 =?iso-8859-1?Q?EuAOn1Mo95+gmrUXJY7JqB6tmzx9kFZbJogXhddYbRzTvW5H17Odr7/u0F?=
 =?iso-8859-1?Q?3kHwCILYdd5YPFx34wKRuLPeSzifQm+yC8rJnj3Yfv4fMQ2K94srCiC+Sb?=
 =?iso-8859-1?Q?X/uN4mVsvMpA/EPeUIf2n4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IMqpYnrDuwaaC7OjwjJjrdin6EE/F+SOkuYEJdPOoXwsT2K0ZzttYAcoB4?=
 =?iso-8859-1?Q?xxGkJI4ZQXiAY3QV7arjsax/TcVy3qrauP956VE+2cdGs+qBtj27LTVSd0?=
 =?iso-8859-1?Q?M3w3eUKl2VikZ6LEKh49BzXmcAECZUPR17Z1lsJFQpGZN7V8649g3mTkKh?=
 =?iso-8859-1?Q?Stua7QX1woDK587837BvvwCt5Jdtt6CizuULDZjbAaInNwqey0kpxzKjnj?=
 =?iso-8859-1?Q?kfB9nkBFN4xBJ+bVXCFMe2FN2SMN232UaXPrO4FP0gw+UHjJ1yRQ9d6Gm4?=
 =?iso-8859-1?Q?1AKZsYOh19kpeDDd6/uSSHOIt7c4+D7hWAIFihP4sXr5rudP0CGODx19v0?=
 =?iso-8859-1?Q?/PH7yKBqKzqnfIDVB/GtFW1FdvLDf8Cuz8NTP/fUOuOmcyHIxLl61dwZ97?=
 =?iso-8859-1?Q?oYLHoNVaaXO5p7PBVvHCGcmnmcJXM5KXAkDYl1HBl+ZiieXAnJBh543nnG?=
 =?iso-8859-1?Q?2Vu0GpwPGIE37VZ3RHflIegEHjEHk0bXvNykeQivBhTLMLsm/mInqEYwnS?=
 =?iso-8859-1?Q?FTGrgzuMOfVbmfM2NHTCH4nFLPm4DLssd37XLo6z5h/6pIuJensn+XTY7J?=
 =?iso-8859-1?Q?ta2tq0GvwCRGctlZTuE6dIn0In5N/JUT+XOeQSxVonSYEAZOu6pktfYnt1?=
 =?iso-8859-1?Q?yPaU240vGSES8eN+RXGk01mZCkIV5PD+Q3ZILuV3GrTSAOJSX30/jiIe+W?=
 =?iso-8859-1?Q?K1SHJtQD8Nghe+6/ETR/nbEDHMmigpqNhZm6kPR9rWPqcHAFgIBNMjr7uK?=
 =?iso-8859-1?Q?j0PUO1ItwO9xO/QkAm14eZ4i7bhliAhEjmNPEDm/w0V5sHLEHpNERxwoYO?=
 =?iso-8859-1?Q?Knl0y4eX61HTl50mGogI14LywbUCiYyWx4xZBkGyxczLj3BcvPv44fv+cI?=
 =?iso-8859-1?Q?9YKHvqG8vHDlA23w3BBEDV4kR1+KEcWlaN1QKGtv+g5uBs1q81NrAg89/0?=
 =?iso-8859-1?Q?9N45JZtapIcTj7Ou2vCB0TWWRPR4PT9o2bjffMlxmm49Eghie45BjKMumH?=
 =?iso-8859-1?Q?caLm/zUydY2tDiiyLulsP1pohRWoszhAaSLTvVPZImQI7E4pHwHkcoyvGB?=
 =?iso-8859-1?Q?nbP7v9gZFgJoSzS849arzC6WjO47FKn0rAsDU5rfo1fBiHub/GAayoZY8A?=
 =?iso-8859-1?Q?mMp5Z140QVuqqba2z6Udgc14S0jl71TcAimktiN0n1S1Lc4AavtEXan9D8?=
 =?iso-8859-1?Q?lVOKkeSzcAo1gmCs6r3j5d7BpVFrK+wKb0W6eFwY6RAzq48RdlXRtuJ20Q?=
 =?iso-8859-1?Q?KvtcfO1tvOVXoj9MosrNTTkwn2zdtnjp039B5FuvT3gz+FmCRMPiieF0bs?=
 =?iso-8859-1?Q?vNBwjlRUmwzAe8VA6Akc7Rme342caVOBP68Xu1DgiCels/Bznx8k6+RWxE?=
 =?iso-8859-1?Q?CQP9lPOFK5W11ziFqTM5LHRGxX3yC44od0xqgpGxEF/l+Y6J6S043Oxabh?=
 =?iso-8859-1?Q?4VmZ0bXZN4S4OhwFyRX7/uLyUSXgoSROoEDYjZEhKYNq4aAqKqT16QKosq?=
 =?iso-8859-1?Q?hztl3n+FNBMDr7lP1Cx5u7QK1Sbo/bycLqPPKcF2hUtadHmH3v1YsT17FE?=
 =?iso-8859-1?Q?cfKPHrTA8TFBmoCcDtX1I/otMvmgCytB8/qpdqhCjJZkbZWuE+KQY/zLJg?=
 =?iso-8859-1?Q?4iyobU6Rhnq79AT9EZ+hYvpum3km7HTVREfNp66rx6yUgmxGE8cbbT8A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bfbc27-e59c-4612-cff8-08dd62fcfec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 13:34:50.1971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ngazcFMwdbPitJk7tcZusBCuR1nxm+NEKXIk+wUkxV+ugTHk0ud2qS0qYDyl+Gb3flF9ucqbcuhhvLrhIcY3sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7950

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Move code for processing DT IOMMU specifier to a separate helper.
This helper will be re-used for adding PCI devices by the subsequent
patches as we will need exact the same actions for processing
DT PCI-IOMMU specifier.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v8->v9:
* remove DT_NO_IOMMU

v7->v8:
* explain NO_IOMMU better and rename to DT_NO_IOMMU

v6->v7:
* explained NO_IOMMU in comments

v5->v6:
* pass ops parameter to iommu_dt_xlate()
* add Julien's R-b

v4->v5:
* rebase on top of "dynamic node programming using overlay dtbo" series
* move #define NO_IOMMU 1 to header
* s/these/this/ inside comment

v3->v4:
* make dt_phandle_args *iommu_spec const
* move !ops->add_device check to helper

v2->v3:
* no change

v1->v2:
* no change

downstream->v1:
* trivial rebase
* s/dt_iommu_xlate/iommu_dt_xlate/

(cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/device_tree.c | 42 +++++++++++++++++----------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index 075fb25a37..4a1971c3fc 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -137,6 +137,30 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
=20
+static int iommu_dt_xlate(struct device *dev,
+                          const struct dt_phandle_args *iommu_spec,
+                          const struct iommu_ops *ops)
+{
+    int rc;
+
+    if ( !ops->dt_xlate )
+        return -EINVAL;
+
+    if ( !dt_device_is_available(iommu_spec->np) )
+        return 1;
+
+    rc =3D iommu_fwspec_init(dev, &iommu_spec->np->dev);
+    if ( rc )
+        return rc;
+
+    /*
+     * Provide DT IOMMU specifier which describes the IOMMU master
+     * interfaces of that device (device IDs, etc) to the driver.
+     * The driver is responsible to decide how to interpret them.
+     */
+    return ops->dt_xlate(dev, iommu_spec);
+}
+
 int iommu_remove_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops =3D iommu_get_ops();
@@ -215,27 +239,15 @@ int iommu_add_dt_device(struct dt_device_node *np)
     {
         /*
          * The driver which supports generic IOMMU DT bindings must have
-         * these callback implemented.
+         * this callback implemented.
          */
-        if ( !ops->add_device || !ops->dt_xlate )
+        if ( !ops->add_device )
         {
             rc =3D -EINVAL;
             goto fail;
         }
=20
-        if ( !dt_device_is_available(iommu_spec.np) )
-            break;
-
-        rc =3D iommu_fwspec_init(dev, &iommu_spec.np->dev);
-        if ( rc )
-            break;
-
-        /*
-         * Provide DT IOMMU specifier which describes the IOMMU master
-         * interfaces of that device (device IDs, etc) to the driver.
-         * The driver is responsible to decide how to interpret them.
-         */
-        rc =3D ops->dt_xlate(dev, &iommu_spec);
+        rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
         if ( rc )
             break;
=20
--=20
2.34.1

