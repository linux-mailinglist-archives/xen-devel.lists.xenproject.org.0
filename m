Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DE6B1DD1D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073331.1436317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Oy-0000vm-HI; Thu, 07 Aug 2025 18:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073331.1436317; Thu, 07 Aug 2025 18:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Oy-0000mk-7q; Thu, 07 Aug 2025 18:31:44 +0000
Received: by outflank-mailman (input) for mailman id 1073331;
 Thu, 07 Aug 2025 16:59:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xY-000773-I7
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:20 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id db45dece-73af-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 18:59:18 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:17 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:16 +0000
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
X-Inumbo-ID: db45dece-73af-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mjccd5ex3iHvEOrOc83veBjvKOmxBGUITWDSvCTHbQqMOyt5fgaNNaBo6nhTf8bRYrVXL5Qi6tgQeoPzt4dv/MZf8J1R2Y9lfiv0IpsSTvmIc+RCE38IPo0rDdkw+s4QtPNFJEdcCMu7fssFFLynNXUUX7gclXTY08+fDvFpeazdUMezk7ucvKhqlFWoxEg2wXgHQzz04GOjqra+5YJusLkZiaMooAlp6T0+8BYx/Uztc3cqt6rorgmV08rAu7UOZUQp0H+sJljk6sR/OsVFWT69a/2b6hMaq9Ag+yHF9b9XgqdWPl8XUhOJHSS4617bjwHK4lJCqm1CVhBgUG98zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xL00tNSF5yd9RoAGLx4Uq/x2+XNJeFpfg252zO6C4CE=;
 b=kXPM8uYcF8eKZNmUIOP2ub02mP5Sk1RDCRg/EmRjcdmhgrw76OfDIjl/VsI2QVBVvCwPAqre8LWLFqZOXAAYnQJp340cfjUa2mngJ3PIHD7SByTHB/GCEA7xaerE+BmiJlHDzpuDC+dcJ2ESwtFkE3cBZJhTJalSBN0vfnBwPU9aCgE6YDOk2Otbh7IvLsQF/FISksfCO83Vq11k7BEyKYAcqOjRXXZnszt4jGA0w7Fr1sMXSbJ3SqxL3vNk7f52XsPVVuJyg3esxfvClS3egdETmRDOKxUPcLvtzFq3WLZo2372SakMPLZ3CMalxvDu8RSJ0jrzsWxdQyPVzMSrBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xL00tNSF5yd9RoAGLx4Uq/x2+XNJeFpfg252zO6C4CE=;
 b=V6PmL7wNiwNIGljrVkqKqykoydvlrozb6qqyXVulM90womosuht5b7AoiPx850V2mnO2voE7avovuD9iFzEZEY2EDkf2cSGq9E37x8X79I2lhCcRQRufAAaBFWc+dKbtdgo2sNvMrThjFi2EHSQZmvtuKGvfDxzrRvcetqTnbPntPIdAb4BvA2MU4DBXI+BRegLoTMAKW6yg830z0Ncgpvn+niOCIVaa1cIICCUCvB0b+BP1wh4LkFIgV0lvjoVvc7JaEchnKE9HxNqcoINPG80iyypLul+dWmySg8yaaPvXFntnPr0lNSTxBif/yCURoSWEmAx4rmjiLWDzloE6Wg==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH 03/20] xen/arm: smmuv3: Alloc io_domain for each device
Thread-Topic: [PATCH 03/20] xen/arm: smmuv3: Alloc io_domain for each device
Thread-Index: AQHcB7ycdMk0c92iU0qjOO1oC+LJsw==
Date: Thu, 7 Aug 2025 16:59:16 +0000
Message-ID:
 <27a106209124c8d052d7cca6285d9b7b1b110ef2.1754580688.git.milan_djokic@epam.com>
References: <cover.1754580687.git.milan_djokic@epam.com>
In-Reply-To: <cover.1754580687.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7136:EE_|AS8PR03MB7336:EE_
x-ms-office365-filtering-correlation-id: e03d7344-5d52-4c09-a8d7-08ddd5d3bea1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FhLo/iG7C4abnVmAu7cgWGAKWMFwRqx31GF/VUzEgDpv5lJZZPzZNlscgv?=
 =?iso-8859-1?Q?UVG39Dz9Cilgv7QOsKocHC8Uxv7bmSweR9boaSH9I5n8QJhmrzxlWATsf9?=
 =?iso-8859-1?Q?B7+fWwnFpW+RlaG6ZmLnhxGZDxkJ6FDGidfAu+pAdsF/7lPDbsF+LMul/x?=
 =?iso-8859-1?Q?DBcgHLvpVygnT6fhMC5VF3nv6DPb+a/4fJK/3UPFURaI2RRUwNsPdlFZkR?=
 =?iso-8859-1?Q?ql4HgchpleMZzibTT0snGH248Z4Z6YU+9iz9eAqyQqpwa9IFA9oSvsCq3j?=
 =?iso-8859-1?Q?ECyGKDq9KCI6flHSQYbDD5oa/ORYIohvqXmkPn3h4SbYG/RfKk+rPqJvxc?=
 =?iso-8859-1?Q?HTTEBXumEKmOuAN9zcyUPDSzWfTn99A2OTX2nfRYrflNOCB2pCXeHacL/I?=
 =?iso-8859-1?Q?lpEdc3fKz4bs3gn757ydK9hZhPBLsG/jJR7HQKMVv2loenf41KkmOmfh38?=
 =?iso-8859-1?Q?ywkQJEToI2I/nLM4hmBVtRezlywoO7yfWMB3QjHFx6C6cMktwm+xAc72W5?=
 =?iso-8859-1?Q?ln4nCY1qXKehXnzuKIy0VT+dwA9gQF39eqiDP/Loxs1gR7GXCipVxheTR1?=
 =?iso-8859-1?Q?rAhX5MDG5Ruh2T5zmT2yLKKAczr87PI+JfS7jjbl9/JoNAFd56Hfn9eW6e?=
 =?iso-8859-1?Q?zYCXqoirGqrKsp7dS1/ZeVSUmvBTybIQ/FM7Qj+gA/boa9EEQ2QmlU990b?=
 =?iso-8859-1?Q?+8DA7LTRJo1MtYmxTvlVOA2sMcHokE4JdRXfI74+WLQUnXLYDm33NgkS0c?=
 =?iso-8859-1?Q?6eczLcGgEZqNHbbaCbFrZSydf8nVVYd3UZgqShse1KVIExGEo71s+k62nQ?=
 =?iso-8859-1?Q?FL2d0e+vpU+qGRHESqSuUfwGjO2mJhlf7+gZCS7rBQYeWM9AnGAv31ik3l?=
 =?iso-8859-1?Q?249jIXLnv87EUPbEoPhq0C2/3TBH4+EhZc3Rh/vbpr49OzYqQZyEwqlC2n?=
 =?iso-8859-1?Q?yCr4PwdLWMMETczlFYb/Q8VBFSfGkm6I2qF2jA/J2zrPI2W9axew3CYasw?=
 =?iso-8859-1?Q?VQKtoxeD9nqzrxRob6yJ5qhDOv2ARgpUpvVQD0RVgT60AnKH+I7PfZAUBQ?=
 =?iso-8859-1?Q?MK4H/iRF3bwrxjSXZw7LW+kjwSfxEUV1cWOzJFvrAcHeY221mO5XI9aZnC?=
 =?iso-8859-1?Q?SUCVHa+jjQUyvYJjFEZmuXGeod8m/WORVCqCJ0QEfZUOXWSnp+i+i1lJtH?=
 =?iso-8859-1?Q?AW7gxv0G+fnM0FxR1OunY4cJLjWPTtdtX3UVXXVaxP2YwGrShvjjliiuzh?=
 =?iso-8859-1?Q?IPqhL6TfoN1g383nshegXJTSlpmpYRrwIZn/4aaWFO4BdekT5479CH8PWI?=
 =?iso-8859-1?Q?hnJXgMRCvY6sO5f24QUCoXtB5rR1LsjpTBP0/agoUnEVb81u+EUhQyA6am?=
 =?iso-8859-1?Q?E9vEQrZhYM9CCzz8SdHa0CC1F1Cyn+9Oj4ktjM66bhSnYQT+X91koOdCCF?=
 =?iso-8859-1?Q?LJJwMpsnu+/SaeMJYTz4W2U0UILQqVz0NSGtiro+BcfCPIo6y+me41JNZL?=
 =?iso-8859-1?Q?bWaD9tXefzN7N9hinZbS4coS7t+ElwMCysZI8cG20o9g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?fhSQe74irvxFRaUNm7ursNLknfncIFfsMBw/3iVW2mqjWuviaiErnHRK6B?=
 =?iso-8859-1?Q?r9RyEX99H7LT32RtalG6uxsrd6zujrgZNxHQKTacpEWgoZuKXCpMOor1Xu?=
 =?iso-8859-1?Q?iUwNT556Q2llSqP5ixlXWrl397WnuEiv9OuVADlnjJLqYZLVJ6O4bpyXUP?=
 =?iso-8859-1?Q?Y9zPhyZSI9D3qX5Z0VTQSGFpXa1a46e9WmObI3JSrVfINg0mpPEwOpSi0s?=
 =?iso-8859-1?Q?3pwmr90OV3vFcrrSCB5xmqGxs+6U4CJy/OS8Tey7Qc/MuhfZl+ffA3xY7s?=
 =?iso-8859-1?Q?heRcdV66yC0hUCbGqpVdardSwcGJG8WKhx/axOqQcxyQzL5lyirfetjj3R?=
 =?iso-8859-1?Q?ZFLy7D/xyCoGa7nxMDEz0idVUK4dBKBYiqwqdLhw+diEXmuhcVnCj38yKQ?=
 =?iso-8859-1?Q?m+u7Zkt7SGYFiT5f+T/mXEubMiappZo9SCN5OIb6rpqJELg/UH8Vly+ZdT?=
 =?iso-8859-1?Q?F6zzJja8NV86iG57I4jK9IUqEecxOqGjWtL4uGSGNMDliRNlEaUj+gQEnJ?=
 =?iso-8859-1?Q?xl6rjuVNZSRb6noLKbxkbXTB6JvI9IeeQZTf5hYSIGK1+2AlhaeCeMcGHN?=
 =?iso-8859-1?Q?IKXKNS509ITSMpcQ35QDbHVFAvKtbTW/4CM+N39pjBQdBHicu1YfJ0lBa+?=
 =?iso-8859-1?Q?clxi4j0t8kbkerxyN0uUQ2AzxgkqwTzsc5SmnRiEcF8DvoWq9bLoIWuils?=
 =?iso-8859-1?Q?PvWi64ktO0DqUnWCVJxOFRwa4olsLuE5Lz9ozl1XddQ/f0V+ySlaCG9P3a?=
 =?iso-8859-1?Q?1dPr9Y41kQb4lqZ6zbm8o4wb3JGa2UnDx78w7bG/YbLO6EGqLEd0F11BQK?=
 =?iso-8859-1?Q?jTciEaIL0iVRtqm3gfcvwbGA+BvmMNFUBP6V79K0yP81uVi8oRVAkqN2PD?=
 =?iso-8859-1?Q?YYfUGB6A7Pg7D1dZa0XppetAiBEPb2IG3Jf+k47SuWQR9OWakhnYRhn/rM?=
 =?iso-8859-1?Q?mgc5jqgMyZNk4c9luSV/i7mgdOsruE2l+9GAFHiR9MTB+tHsdM11LxZZct?=
 =?iso-8859-1?Q?mdTzvoIofsOpw2LN2PpDEBhdgmxWN4i3GU1PPkSIQzeMeLzvch45Tve8Pz?=
 =?iso-8859-1?Q?AmW+QO+ZSyW2HK9XZd45zlamprlyzRRmPfq5bv57CjQYWw7u1zBCNGkc4u?=
 =?iso-8859-1?Q?Bd7p45L67ISAlr/6M7WnYFEjmUn8gpdO5ZzMoOU/6wxv8cSb8eP5ZSRi3G?=
 =?iso-8859-1?Q?M1RWRMCuqCKZ4bd4bzW7cwdEBA8d2AGEa48irQCAomv99Tr3blh4MmIl0Y?=
 =?iso-8859-1?Q?G334JFVhehkNTRAf17jUzhZc5fN4SMzp9PuLS9eVm4qG4yneDtDf/enIPf?=
 =?iso-8859-1?Q?OA5g9Vanx/cSflY2fN7vl7JW4oK0hdVt/DxI5LxjyC1YSkWIdITq1xueJi?=
 =?iso-8859-1?Q?n3Ilt4SdwgF96pGDjH73oMCOFnhTete/lCpo3o9hlOtt1grIyHNfYoZefa?=
 =?iso-8859-1?Q?M9r8J1UpLH5gsxlqzEmbFTOpGrBq4PTvXSGbokiEuOpjjTrEB8RpNInMEs?=
 =?iso-8859-1?Q?ZwkBAXUVNfkfkL4zfPrgdE0MZEk2rISJiQcYpPHJJHJyoOXg8Egim4QI2w?=
 =?iso-8859-1?Q?IsVFVMFFGxIT7LwAfzWjKWgG9wXIwIsG/0nrbAL5wlMu7i96r0qqQCagP6?=
 =?iso-8859-1?Q?iQONytzByDE4HegoIZ9S4fKRODk9YLqDfl?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03d7344-5d52-4c09-a8d7-08ddd5d3bea1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:16.9323
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6p/cR7AWA4AQleVmnJhKoggZVxXvKwXktFffnYsAgj2JTAc8tv4T2WQsV0TR0D4TTNYZzPXdhEMo8s/TI4o/gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

In current implementation io_domain is allocated once for each xen
domain as Stage2 translation is common for all devices in same xen
domain.

Nested stage supports S1 and S2 configuration at the same time. Stage1
translation will be different for each device as linux kernel will
allocate page-table for each device.

Alloc io_domain for each device so that each device can have different
Stage-1 and Stage-2 configuration structure.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 5c96e8ec7c..15ff703458 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2790,11 +2790,13 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(=
const struct device *dev)
 static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 				struct device *dev)
 {
+	unsigned long flags;
 	struct iommu_domain *io_domain;
 	struct arm_smmu_domain *smmu_domain;
 	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
 	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
 	struct arm_smmu_device *smmu =3D arm_smmu_get_by_dev(fwspec->iommu_dev);
+	struct arm_smmu_master *master;
=20
 	if (!smmu)
 		return NULL;
@@ -2805,8 +2807,15 @@ static struct iommu_domain *arm_smmu_get_domain(stru=
ct domain *d,
 	 */
 	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
 		smmu_domain =3D to_smmu_domain(io_domain);
-		if (smmu_domain->smmu =3D=3D smmu)
-			return io_domain;
+
+		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
+			if (master->dev =3D=3D dev) {
+				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+				return io_domain;
+			}
+		}
+		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
 	}
 	return NULL;
 }
--=20
2.43.0

