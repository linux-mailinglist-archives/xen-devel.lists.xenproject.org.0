Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2E1B428DF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 20:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108915.1458864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utsOt-0004be-BU; Wed, 03 Sep 2025 18:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108915.1458864; Wed, 03 Sep 2025 18:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utsOt-0004ZJ-8C; Wed, 03 Sep 2025 18:40:07 +0000
Received: by outflank-mailman (input) for mailman id 1108915;
 Wed, 03 Sep 2025 18:40:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aHaU=3O=epam.com=Dmytro_Firsov@srs-se1.protection.inumbo.net>)
 id 1utsOs-0004Xv-F9
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 18:40:06 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 679836f3-88f5-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 20:40:03 +0200 (CEST)
Received: from AS4PR03MB8338.eurprd03.prod.outlook.com (2603:10a6:20b:506::15)
 by VI0PR03MB10904.eurprd03.prod.outlook.com (2603:10a6:800:269::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 18:40:01 +0000
Received: from AS4PR03MB8338.eurprd03.prod.outlook.com
 ([fe80::ac40:2d43:5ea:11fe]) by AS4PR03MB8338.eurprd03.prod.outlook.com
 ([fe80::ac40:2d43:5ea:11fe%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 18:40:01 +0000
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
X-Inumbo-ID: 679836f3-88f5-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6knr5LLfF3PvWqPjIeOJ3tkKFTSl6PPJEuUxHolzarE/mKHyo2jlFnbwRZDYvqHlN36sd4C9S4nRdpo+6jCdSKw3k3Uw7Vi8kRzwUZERA3AzN1kK61P+LsRjBvEw5RR0PADNf5IWKRHA7P91iqtoVhGgEKvJ2n6SK6ivK26PtNyJkSZwtvpPUXGTLMtME4/KEMqaJJCXTPATsAg4pViMcoCXsyNREUu3Vz3KMwBTSsayjIQkK4oWk31B/jd6V1eXF6GFkdNVCAh/xqdm7Zl6eCKC9zvYLSzX7RTNhfmgx2H+4eGhHQm3LRPsunvB6CpapiIObRWuVs61ee/NVwIfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG/N3T5kiz281dvzKrsKM6UpDLoSc5gNyQOn0fcgKLs=;
 b=h7lr3rfzG0XwSfW32VUqj0ZtxzLCmz/SRCALY+qvbZaQ8XYcWBHW7HwTOBt2jfuHn+zj8d3tHrSy3kJry6K0hk+09p35/lZV8c6E2fI9P+GIq2720o/0MeDdz7tuWx0w+lrxuEH149k/Db7IKMSE3oyf3bkxLuw2fxSGfZ4zQddSjcwcK+6qN5ySwCX9VH/Lx/ggkCCrTAgUqiZU6bcahSpOZSdrajomNfceC+tWzy2mAdRAvHbJdFVPURTntRHWRJW0+zzxaTwpXBXMOtgEk18+vn7smXLCmNVpvonPMFC1v3ORwplsuOs4a1q9COdYQLCpBn/qOEQKhBAq1mkmiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kG/N3T5kiz281dvzKrsKM6UpDLoSc5gNyQOn0fcgKLs=;
 b=k39HvhpiuJIEZ8jN/9/npyUjSLRIRCv5IsvQEx+to5QE6h41dAXRspYpdPm9+nuJKqKk2svNz4AVLvxg6ncHEq6X4gDP3uqXxdm1P8SKeqZz7UFgw58AVpuyXC5/SGKi1gwCjLdEqzuQyUCTJi9Ny94wa7QdoYHL9vkcB9GWjptKxq2POJQj23CXBaEcLKexBHz49vIXxr9gZbnYV5Ua68lncmhAJ/DhlynyjqpaEzRUePW4kJ/uOt/dqOnhiSqQtt93EXROoLoG/YbHIXuaCd/pljqgs3r2kK/ooedWrdClPaMCZczJCWRIw9m9x/CDoOKoBOVN3RgelVn4/4Mh8A==
From: Dmytro Firsov <Dmytro_Firsov@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Firsov <Dmytro_Firsov@epam.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>, Mykola Kvach <Mykola_Kvach@epam.com>
Subject: [PATCH v2] xen/arm: smmuv3: Add cache maintenance for non-coherent
 SMMU queues
Thread-Topic: [PATCH v2] xen/arm: smmuv3: Add cache maintenance for
 non-coherent SMMU queues
Thread-Index: AQHcHQIn+C0aN53q3kCiWfPloZq/2A==
Date: Wed, 3 Sep 2025 18:40:00 +0000
Message-ID:
 <6f4552aab3748ea3ad96d45affb8ce9146b557a4.1756922110.git.dmytro_firsov@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR03MB8338:EE_|VI0PR03MB10904:EE_
x-ms-office365-filtering-correlation-id: c1817b27-ca9d-48a2-76b5-08ddeb194a40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bclBucPbHYFsNElZ7pPEU31f29q6j6Z4JLN6fw57roSVkatEhpS6U+V2dV?=
 =?iso-8859-1?Q?aKKtlEfesioz2cYXKBfVCyHQEdnRmZ2+huHGXpwAubdbxhPivrXLiFlIZr?=
 =?iso-8859-1?Q?+XhiXXbyg0NVQ3teCoENoCfgloXjRa+XtpW4V6N5KQ+epkiOV3AxrFdFt1?=
 =?iso-8859-1?Q?HAByYKHqy2HxrMMaQYanZJDUKszM2KTzAOQIa0sfFpTsIQcX9zRztIodgX?=
 =?iso-8859-1?Q?lg/laLDqgjYK3ppAxLNrE9wZQkMoLDMCn6Mg0rv6Cm72Bl8WLrWDy2bh0R?=
 =?iso-8859-1?Q?KA/Xl5I6lBlj2Ztn+ltDotXXUeooiAE2Qf/Vpd/Bdxexsf1o0hmVCsgWpO?=
 =?iso-8859-1?Q?C1uM2PtTCxUpWmFUQDjFwZrIDsREBZVvS/4TTysC4/HlbYoawLUGDvBCO5?=
 =?iso-8859-1?Q?LXnpJAPSCy/hgNHI4yfj0cumskq+DSQABxekE1NDzgtMvcdQFhIgAXr+2X?=
 =?iso-8859-1?Q?tu0pk/2g388FLdpsefKg5k3LyPxbnFCqIqfAth08me2mAUxOix8YgmuH13?=
 =?iso-8859-1?Q?ODdihi4+PAtNij5PfaU9uCkGrvU0uwQvQWMouvQFe9hg/zrNMbEVRg9aty?=
 =?iso-8859-1?Q?oFZP/FEIVIfmO29MEu1a8jkDzDo0UOnSBrGNa9WmFQMijkZl0ilxVOcx8h?=
 =?iso-8859-1?Q?aYSnSFQg084wZIb1wRBhE7clIHrTry+C9YRJseoLtyVKr0gaEdOjZuSTwl?=
 =?iso-8859-1?Q?yGZkSS0O3N+oyRMm/8SYCEgmZNfYvyx1qv7/Ax60qR0XanVEeIHuWyDHHl?=
 =?iso-8859-1?Q?O1gDHVHIvNP6qhQaZ7ch0hEbQyFOENgUBoxPnK996FG4LdL3dHDr3HDWjZ?=
 =?iso-8859-1?Q?g2so+fYuY66RLOdeDfNym5FVYMG9uwosZOq7axtWOGS759BXw+Xhy6ebsm?=
 =?iso-8859-1?Q?+MDm5HXSQOsJjpZ3hT00QhOUVGzMwqJ2bUvh1YetedGO2duJnJzoTwzPAH?=
 =?iso-8859-1?Q?WA49atCPNYLmVlTjTmwpGMAPQNGwvPDmBPGPQszLn9axWS/66MBfH/7uVm?=
 =?iso-8859-1?Q?e6AZKDULXcvT9YlU+POOzWjuD7Ouf3NxCvIt2dngamI6Z8ybRSRiySq0TA?=
 =?iso-8859-1?Q?tr+rBeBVSXZ5R839s9GO5HhMCRrJq9ClraiHDikxiS7AkZssfRODbHla0Z?=
 =?iso-8859-1?Q?sfJJ166iqp9NEmbP/1Pa1Fp0+Zlp6PPZl0uW8pCZSs2zFf1bnb2l2acbcQ?=
 =?iso-8859-1?Q?hfmnsJXTtCtHpKJ64nSiSZZYB1qU3r8upXrEtUQPK9nF6ww/XaiQihjQUV?=
 =?iso-8859-1?Q?F1zda5qhgEKLOzzE3zzL2wjWQTJkLqlNmF/bpW1oeMyizrD8cd6KhuOIlo?=
 =?iso-8859-1?Q?ltAbcBgpVS4y20dHoTKWhLvf4cYVYx/tsnJxc1UjJgOJDm0TcSpZXmAqpB?=
 =?iso-8859-1?Q?tGknYRffkvj234sxW70tVMOTnr69RhEKvYlJzO0uXfLkaGXe4fJHyMTzd7?=
 =?iso-8859-1?Q?f6MzrBpMddlCIsG5E+M7SPYDJsjYgixkPJbYwCsLg9onpq4Cq16laU8BBT?=
 =?iso-8859-1?Q?CPB6W4lL3HRSfUgtuHAS5lZNHQ8KIha4x7Ew6JBX5xOA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8338.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?jfo7G0DIsumDyk4yJ5sva9Kp1bziJdZXhViqVEANR3dq6z5sERDm8kgRRZ?=
 =?iso-8859-1?Q?og+eOC2njhGOtLMN4HKHk0CMyknVKmbi0+wuxb74wkVPGOSHD47I44QOHn?=
 =?iso-8859-1?Q?HfUA0kp0b7NR8AbMB3V5hZ5fPCnWLkh+HwIfU4LLChiQC9TkhztkA77uWC?=
 =?iso-8859-1?Q?bZHNuJLv1j3OxzZVys+kZiznhdf3gdmn0dRCB2VWHG0AWjdF/46iQezsK3?=
 =?iso-8859-1?Q?6TF7Rv6R0vw+Zb+Jqklgn3j3q96hLJ4FYdzCLweHbawpZE41NNFJImQPZS?=
 =?iso-8859-1?Q?4Le8XjI/Wn97d607/zzG5hg3p2yjtR8GS4hlkqyImeHW0YjMovjE5Spo08?=
 =?iso-8859-1?Q?mjuQtAgOADT6gvW11VF3BVDyqqS7IYzzrDgHhFPaVsKfF3AqAaVgMUPXlg?=
 =?iso-8859-1?Q?vf5KFQaUaFccRyDr+Hw1dxf6sva3yuGpz/ekFrBA9vh3Jljq+1G+Oym+mm?=
 =?iso-8859-1?Q?f0jRIPvSVL9v6hVzlpHJUhUFsYjgxF6W9Ucm3tISgnt5icuBGVDD5Yik80?=
 =?iso-8859-1?Q?IyqBMSMzzcdFqfaBaT3IvU1hRWZya4v0Xeu8yC4otIfiaro9uJOdUnzFlY?=
 =?iso-8859-1?Q?5/Oof6X3OGv8OkHrYAffEXhsXhWJmlh9oyllVttZTnYdKwhqLRuZqpYr+5?=
 =?iso-8859-1?Q?GQbs1XXrhcMnaRCCi+ZHzrUyQLcsChujKio2dwY6dI5ZlxuiZxmmrhbBzt?=
 =?iso-8859-1?Q?zflwIqaf/56jmMzZL3FScWy3HVhJLHTRE5gLlut3jfIkmL2VEuXM8Qo9Yr?=
 =?iso-8859-1?Q?z0ICpyJ/IaS97OxX42kHxXpz9I79Givzs+VynTXSOdo57lHf+UFN0v8Zbf?=
 =?iso-8859-1?Q?RYE6xitpPdG+NYhuNX52ZWmMbeBDNl23LbHTEPTwtcQo5/OKwZ7yKxoGCq?=
 =?iso-8859-1?Q?QjcaPeM9IcKb3j3KXBuigg6Je1g0QEphB7AUpqM5afbLKFJ8hHBYSJ7NHT?=
 =?iso-8859-1?Q?FraISyJDKKAiVVJc5nXeJlKqsqCUvZ2aVuxJ71gX9SH6MUBLnnLnX42G9o?=
 =?iso-8859-1?Q?puNjmPEIgYWBrFGqoORMwbD0VAllG8JB7hPjjR4wuPs9CPydbhLzXsU6dP?=
 =?iso-8859-1?Q?Mbu5O5dXSLAtI7+bYt36ZAxnZkV4Ic7Wa23b6copduXi4mfcoxgf9484Kp?=
 =?iso-8859-1?Q?VzuN5z1YiJCf+VzEByIYQO3oK6G+PkztlyLQ4/yuyaFXzJypUnNpwqGOmR?=
 =?iso-8859-1?Q?t2KlDXaEIqLXxSsZ60jGkzQVZcDbVz94UYNOBTYme6A7F7revwnXosJGzd?=
 =?iso-8859-1?Q?Axtv67X8LanAipsVyJNqCzgd2nMtRPTtngaD+M/YT+ZRLJeutY7l3u46sw?=
 =?iso-8859-1?Q?UmfNrhL8xZ/ilE3vIhzZeQxBu9RQ8DKZ1K+oVl/iMdbFSiKUctnGKBT/ET?=
 =?iso-8859-1?Q?7WlwEdN3FHa+rvmbDkItQFRIcPArxBhCVOUmHOUBPrItM7NUpLxE9KBgSk?=
 =?iso-8859-1?Q?3/ftVwgKYh3N6CtMhbAu3TnRoqUr1E8MhN0e0sduL68hYphCvfS53ZtV4R?=
 =?iso-8859-1?Q?hqofSwftcys6QSNJVv93NBM7ygBk1EhC0enGGTru0+CC52fXMWxOALC5Il?=
 =?iso-8859-1?Q?d6X4Eo8LPxcIotZCcvvNEqbHlg+l6tGfDQ1lRka0LirpE12MHm2rxfGH0I?=
 =?iso-8859-1?Q?3X/mP4Z28N4qfoJQL2jQG1nEIgX19qB+Q/QVUqN2JYwmDLeEzAVo0vJQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8338.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1817b27-ca9d-48a2-76b5-08ddeb194a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 18:40:00.8630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uWQS/VXQ4ZT2MgGQK5p9UXwIEU0vHDdfc+PA4hcsZNe6h+iDbglmfPx57WkO/Q9wkOlRXAeLF8eWK8sWcTFDMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10904

According to the Arm SMMUv3 spec (ARM IHI 0070), a system may have
SMMU(s) that is/are non-coherent to the PE (processing element). In such
cases, memory accesses from the PE should be either non-cached or be
augmented with manual cache maintenance. SMMU cache coherency is reported
by bit 4 (COHACC) of the SMMU_IDR0 register and is already present in the
Xen driver. However, the current implementation is not aware of cache
maintenance for memory that is shared between the PE and non-coherent
SMMUs. It contains dmam_alloc_coherent() function, that is added during
Linux driver porting. But it is actually a wrapper for _xzalloc(), that
returns normal writeback memory (which is OK for coherent SMMUs).

During Xen bring-up on a system with non-coherent SMMUs, the driver did
not work properly - the SMMU was not functional and halted initialization
at the very beginning due to a timeout while waiting for CMD_SYNC
completion:

  (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout
  (XEN) SMMUv3: /soc/iommu@fa000000: CMD_SYNC timeout

To properly handle such scenarios, add the non_coherent flag to the
arm_smmu_queue struct. It is initialized using features reported by the
SMMU HW and will be used for triggering cache clean/invalidate operations.
This flag is not queue-specific (it is applicable to the whole SMMU), but
adding it to arm_smmu_queue allows us to not change function signatures
and simplify the patch (smmu->features, which contains the required flag,
are not available in code parts that require cache maintenance).

Signed-off-by: Dmytro Firsov <dmytro_firsov@epam.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Tested-by: Mykola Kvach <mykola_kvach@epam.com>
---
v2:
 - changed comment for non_coherent struct member
 - added Julien's RB
 - added Mykola's TB
---
 xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++++++++++++++++----
 xen/drivers/passthrough/arm/smmu-v3.h |  3 +++
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index bca5866b35..c65c47c038 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -341,10 +341,14 @@ static void queue_write(__le64 *dst, u64 *src, size_t=
 n_dwords)
=20
 static int queue_insert_raw(struct arm_smmu_queue *q, u64 *ent)
 {
+	__le64 *q_addr =3D Q_ENT(q, q->llq.prod);
+
 	if (queue_full(&q->llq))
 		return -ENOSPC;
=20
-	queue_write(Q_ENT(q, q->llq.prod), ent, q->ent_dwords);
+	queue_write(q_addr, ent, q->ent_dwords);
+	if (q->non_coherent)
+		clean_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
 	queue_inc_prod(&q->llq);
 	queue_sync_prod_out(q);
 	return 0;
@@ -360,10 +364,15 @@ static void queue_read(u64 *dst, __le64 *src, size_t =
n_dwords)
=20
 static int queue_remove_raw(struct arm_smmu_queue *q, u64 *ent)
 {
+	__le64 *q_addr =3D Q_ENT(q, q->llq.cons);
+
 	if (queue_empty(&q->llq))
 		return -EAGAIN;
=20
-	queue_read(ent, Q_ENT(q, q->llq.cons), q->ent_dwords);
+	if (q->non_coherent)
+		invalidate_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
+
+	queue_read(ent, q_addr, q->ent_dwords);
 	queue_inc_cons(&q->llq);
 	queue_sync_cons_out(q);
 	return 0;
@@ -458,6 +467,7 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_devi=
ce *smmu)
 	struct arm_smmu_queue *q =3D &smmu->cmdq.q;
 	u32 cons =3D readl_relaxed(q->cons_reg);
 	u32 idx =3D FIELD_GET(CMDQ_CONS_ERR, cons);
+	__le64 *q_addr =3D Q_ENT(q, cons);
 	struct arm_smmu_cmdq_ent cmd_sync =3D {
 		.opcode =3D CMDQ_OP_CMD_SYNC,
 	};
@@ -484,11 +494,14 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_de=
vice *smmu)
 		break;
 	}
=20
+	if (q->non_coherent)
+		invalidate_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
+
 	/*
 	 * We may have concurrent producers, so we need to be careful
 	 * not to touch any of the shadow cmdq state.
 	 */
-	queue_read(cmd, Q_ENT(q, cons), q->ent_dwords);
+	queue_read(cmd, q_addr, q->ent_dwords);
 	dev_err(smmu->dev, "skipping command in error state:\n");
 	for (i =3D 0; i < ARRAY_SIZE(cmd); ++i)
 		dev_err(smmu->dev, "\t0x%016llx\n", (unsigned long long)cmd[i]);
@@ -499,7 +512,10 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_dev=
ice *smmu)
 		return;
 	}
=20
-	queue_write(Q_ENT(q, cons), cmd, q->ent_dwords);
+	queue_write(q_addr, cmd, q->ent_dwords);
+
+	if (q->non_coherent)
+		clean_dcache_va_range(q_addr, q->ent_dwords * sizeof(*q_addr));
 }
=20
 static void arm_smmu_cmdq_insert_cmd(struct arm_smmu_device *smmu, u64 *cm=
d)
@@ -1587,6 +1603,9 @@ static int arm_smmu_init_one_queue(struct arm_smmu_de=
vice *smmu,
 	q->q_base |=3D FIELD_PREP(Q_BASE_LOG2SIZE, q->llq.max_n_shift);
=20
 	q->llq.prod =3D q->llq.cons =3D 0;
+
+	q->non_coherent =3D !(smmu->features & ARM_SMMU_FEAT_COHERENCY);
+
 	return 0;
 }
=20
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index f09048812c..ab07366294 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -522,6 +522,9 @@ struct arm_smmu_queue {
=20
 	u32 __iomem			*prod_reg;
 	u32 __iomem			*cons_reg;
+
+	/* Is the memory access coherent? */
+	bool				non_coherent;
 };
=20
 struct arm_smmu_cmdq {
--=20
2.50.1

