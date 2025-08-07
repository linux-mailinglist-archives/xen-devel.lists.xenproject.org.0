Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0AB1DD20
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073330.1436306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Oy-0000mQ-3A; Thu, 07 Aug 2025 18:31:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073330.1436306; Thu, 07 Aug 2025 18:31:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5Ox-0000hz-SR; Thu, 07 Aug 2025 18:31:43 +0000
Received: by outflank-mailman (input) for mailman id 1073330;
 Thu, 07 Aug 2025 16:59:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xV-00076W-Qz
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:17 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da5fcbae-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:59:16 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:13 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:13 +0000
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
X-Inumbo-ID: da5fcbae-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vSsuP7Kb8wnc4OTDoozQ0EEvPH0YLgWx8LXPdgrbgE7OPUcvX5KkyU+/Y1j0acUkgvq9OOEQToiukQSPbMvUd0aQ+Y60pqryIjheC+G1InSptzSUIy29M4JXGo/SClLCL26LAsPIfvjg7OX223RauW/xuOMnJdrWGokosDedIOxFKy430/c7VbMOc5+1YfA30tZ/vJdARdk7Db33aC9aFi43cIGepprHr5fNnuiftC99riaDVSlDcTfgrrxAkoD5ITD6yfTghLR54YH7AKslKZ9q6TYHRBUpsxRNneViVec+58wiyWRxt23BfymwPU1N76zQJ7RbH+36HLIm3EVaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKB6igQTiBvBVZ+hzzVtYJ9jrTpGh6BG/26CnOmMYXo=;
 b=TbLChE4/gYiD5JdI20frrr7JZc0wMAyY3frR2nYun6ZBvcNq8NGS8zdW90h22xAKV90bfCShCp85XgMEUXResHl/vvRK9EUfUQjcfa1sEIMUHsqd8z3fSSa1nMFvsIsXHFLWpfjzmfUmK8/PLCIdKLRJa9NqFpHCuHnSBRZyKwGTSjNm8nOg9z6EAM3mu68oQLKAId9Gc93wuEh5b+uXs1OsOP0u06W+HJpzCxc5wQwsgbtlJnBFLJATqdwdZg2Xy1ketTRHmMCxj7UUaU0zwnQVG6wpdSbYnoRfe+UPHJS6iMlvN70dxD/9y33jW5qjdBAKuIgSa7G7AhTpS+Lh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKB6igQTiBvBVZ+hzzVtYJ9jrTpGh6BG/26CnOmMYXo=;
 b=BQUVNO3QlAQ+FXnOyk31bKg30Xk+uWc+oKFaOzEz7QmZPvs/VjzJOZRf3R9843Vb2dbLcV00KYTZVFdPi2cp4z+OLjvQx901tMPb5i0xdE447DTLscpNGgJbXLYTQ2KFHb27aGacQ1ht4Xuns7QFLiiCjidENXoRPAL8lHILdP0SO84xg42nRJJGGst11IRbHto8shUzubgl88gQZT39KajaUP0tclNmU32IT/aObovUGqRxEbCU/PqIfbbk2Ie8fQT76f8zNP0xGqHZERDMOp0ppK26w3vIpCSisA7N8iqS0UcTu68kV/FyNDHnxo5HcjemLnMhb1YJszGV4HengQ==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH 02/20] xen/arm: smmuv3: Add support for stage-1 and nested
 stage translation
Thread-Topic: [PATCH 02/20] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Thread-Index: AQHcB7ya52I2vrwap0uCF6HUjZseiA==
Date: Thu, 7 Aug 2025 16:59:13 +0000
Message-ID:
 <8989630dd0c2b88e045a5af6fe11bb3aeb76e5b5.1754580687.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: f60fd54e-12bd-4134-c1f5-08ddd5d3bcb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?UVP1aFdKspMvtDimbjLwiTP8xsmwYU03pVA7RHV90Mp9oVM9gcIDIl6zad?=
 =?iso-8859-1?Q?VjnmPLp8rBxdZa8V4xIElpo6gQK4FxfDRWBWRZR+MfssQfrKfp4NfA2jzH?=
 =?iso-8859-1?Q?xl4O5kUbJ71U61lYt2AG+046JaBSFRm3fzGSMO/ELwvi57RKmO8rfoKf7P?=
 =?iso-8859-1?Q?xB0u+r9FemA+pV1OO3zX4kV7nhmd/TlBukRe157F7SRkmQzKCL5D2Owqpy?=
 =?iso-8859-1?Q?8EiA06V1ON/ruIAU4U/EpFffh8p84hflgfmlDi3FF8nptBld+F/nbZltur?=
 =?iso-8859-1?Q?LfCmZpiV5Dk7dhE4rFtS01urifsAvw+kviLXW+Gxe+lCDZUDYczthKS+rY?=
 =?iso-8859-1?Q?V6sQGwr7/rWRQrci9a5yhuZicMFIeOAVQg5kUPJtd9oFSN+Nq4Ch0b+TMh?=
 =?iso-8859-1?Q?03RfAaylv5gZuhSO5qtyFj9VJbBfwR5mA/gl78ruKNZETadiFlNKyqEr50?=
 =?iso-8859-1?Q?/R6O40GoJ3aM7f/FNvXaLGwDX9pj8YrXibbQCBfDHjQjfb5W7XtelsvqqH?=
 =?iso-8859-1?Q?l1ZwYtghqZtxx4CBuIVm/DkVH3uuJse1gmufKolDNhzzblP0xsUFzD/Zuv?=
 =?iso-8859-1?Q?wVZncvrWAVbge0hEPt4k4C32siCcRswum1WXzoPLmpSgltgKTbV3b2FfNU?=
 =?iso-8859-1?Q?A0mZffv7B0W0ZfPegloBjYfDV5+8d/JmZjou0ad0qC31m+PNdVI5ooFTKp?=
 =?iso-8859-1?Q?QLWF1HysFPFA7jB/j2Xdy9ZaN9U8va/gBGtg2kv3kZUz97u9uMn1iSpAcC?=
 =?iso-8859-1?Q?2PZGjUjaaBd1BH5NXqQ0oQ5HlC5K27we7HQX6OpzcWfxV/bO80em7u2LEg?=
 =?iso-8859-1?Q?68+MmGjWATtUf8mVj7IHYO6z6Ijn9SutPGCNvgVLj6AlcnYykUstoEiJqe?=
 =?iso-8859-1?Q?yy2ErcgQ10WBgFEGQzBMrAoKnF9bqpZqjMv7hjkQs3qZdMariER6tUmWbD?=
 =?iso-8859-1?Q?dz7Qo/onEIogABfP1pF0ndGilzz2CioRz7qYErPA+GItsQk/xZPphlAf9B?=
 =?iso-8859-1?Q?0WkLFPnCXBgDkQVQ4A/JAB5G8M4+OAK0O6STNe0nPpCUmSqzUfyHqeY3TP?=
 =?iso-8859-1?Q?hfnqaEpinGJvU6r0pnThy9k4cU/PwY0x5n1dhS5Y0itkg9l4h6KibmhrDM?=
 =?iso-8859-1?Q?04819gIMWvNesnhyxxwWgfQJ6Zd2hEY9dtb8qfXO4n39QcQ3L91tF2vSIa?=
 =?iso-8859-1?Q?gHVVdjOBxSdNQOw5jDOCrXP4hWtRPa5pdR0HUrGqLiuKBw/436obX/MHRE?=
 =?iso-8859-1?Q?WKyZv4GK+dFlH14O7vaOGfN/htdtZnUCLOw/v+KLPNIS9Td30h0nEFASfa?=
 =?iso-8859-1?Q?IXV/7uIKYUska5jFsK/t6J0GxflSu0U6b81+dv5izgMZCtr8pv+tg6BueM?=
 =?iso-8859-1?Q?moFvRdL7MbZlYY0HMwXOc0oAlymlW/UjYGN1wSsmfRHOhUJ5mqK5PXVcHg?=
 =?iso-8859-1?Q?Ms/8ljmbQ3N6FFugmDzkGNiH+f5t/S5gcSpBmVyT3/x4XRazeoJW1S/Sq/?=
 =?iso-8859-1?Q?l9jka3pJXLBPCD4qBZxQBxbH6qKKXF3Wohhxz6N77WrA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ADgXfQjLrefROdtgAYCbgT9cYifrnBdLbQcZ4+vluWApVUTxwRHdwhQMuo?=
 =?iso-8859-1?Q?1rHvqRpEeTgjlDL5yQdKOjLPeD9IXEj0CcYSRK61dciKM0WaZ1epLJCKNV?=
 =?iso-8859-1?Q?KamBsm5bqFmY8QbjaRDF2RHfE164WSGT/mLeNYsN9YZYYzeG7WXwA5VISU?=
 =?iso-8859-1?Q?Cc32qL/Zfu2GgwUgzvOaIqqmj6YW7LusqvDhWdtoFKBM8sLGrxxK3qRNZu?=
 =?iso-8859-1?Q?lLJxq9dTdBY51Fy0Ez/bTMH6TB3xc4y15ZRed0+E4/q/IBxELlMPmiA/Pd?=
 =?iso-8859-1?Q?ABrhFJ+YF6oRs3Kdw0m9bqm8ATrBQk2PgO42EKcyv6OgL6XCwoFtKY+uZr?=
 =?iso-8859-1?Q?EipjP3jXBmzgvSnJASszMYaGFQciwuApiwd18ry5txI2u+sz9UOKUJ703D?=
 =?iso-8859-1?Q?Et8KcZEm/XCW6gCF7zvpMZHrTgergXeSHiSqHVrWa95guty/n9waa3sBLH?=
 =?iso-8859-1?Q?YTEtp1gpHQ1ULgMnbYbWxbOUJebLCPvXZ4+3v2+YT3FvbY7cXRO+H6lkmU?=
 =?iso-8859-1?Q?9RXoWzRnunioLz+eifv88YWFTcoiN4PFW0alyQUScXBZzUnRPj6Z/QzVxp?=
 =?iso-8859-1?Q?aSw5hBdh9AvIlE7I3hd7ZxsIcBioPrNMYORfj7+6FX9onUlvilfjIrox3C?=
 =?iso-8859-1?Q?3s/OXgro1Ov3AgMKiVijALoKrFiNjfsn89+mFE1jpMpufm4BWpBVo26b2B?=
 =?iso-8859-1?Q?vAwkYDTNIV6BCcRTCdxMOAyMiYpnTEfJ63o1jUXK3Ajo8bIKgkQaLj7LZC?=
 =?iso-8859-1?Q?6s4ai3izyYpHnNN7f48htZLCcHiGwAqgi4aBRqCYxP/R1NXFHHWq3god+2?=
 =?iso-8859-1?Q?EiLPwSz6I37MQAMMjyEHx59iqLR0YyFEgeF9EcMPpacR3D68GnQirEa6GE?=
 =?iso-8859-1?Q?JNoHzDiC5HwnJqVyzAIpHMu72/Bl5quPrrC/8kOZ0XiTe0Z25v93xzzYOC?=
 =?iso-8859-1?Q?ALrDA4+7WLfkAM50y+vM8Nsg+vZ1XmQUIjgbJn9WikCnd3oOpAa/fm3soW?=
 =?iso-8859-1?Q?sTFgfJ/SUn/Keps8v8CGIcGyWze9s4MpiR5GOdxem33u+7gh8pos8kDAA9?=
 =?iso-8859-1?Q?hurFo59altcKTyx+5haac1ut91yCR5qJGhZ8IVH3POAIHMZSJPq6kFtwDg?=
 =?iso-8859-1?Q?hWyDIDs+Io4U3VrREaK0snESekmPRCQkkhVri70d9J4qWt7EaJ7ekib921?=
 =?iso-8859-1?Q?Q1WQ3blL5RijBF7k63lePnNa1AvKUaZrGIY4CN0DW3L7O23GjkzJT8stQz?=
 =?iso-8859-1?Q?KAZELAI1hDIC5baLRRVwtGKZwEFMN70K7PaGrLmYBeWqsXb1SKRW98fx5X?=
 =?iso-8859-1?Q?YNL25SArSgoGy1loDGCexrUhp7lXHdSoRZqaZ685fjWHK+GpBMPzhoREsm?=
 =?iso-8859-1?Q?W4TsggxPLcmGtdOYiNNyXoEQa6r/vF1MabdQkxAnbgxp7xh6gLgFZ8SJ8C?=
 =?iso-8859-1?Q?jZtXfRHyXYHqomCYM6z7gD/kc9ijxjX4EF2zrhdXi6FMshakfHrRnU34Tx?=
 =?iso-8859-1?Q?QgGEITMlsBDKNa3/fdY5cXAjRjAd1dhPZG36E6JP/8HoVdiTCNdsdKaVj6?=
 =?iso-8859-1?Q?r00UQvugEbDlygNRckPFuSd/QOm7VqxELZghdRXRJW1DtOpaEI2Q13v5QM?=
 =?iso-8859-1?Q?QyaKcgv9J9zbdmWrN5zpZYNF9+ImSqmeTK?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60fd54e-12bd-4134-c1f5-08ddd5d3bcb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:13.6435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pcvE8iWNxNKyrqDah8COG4Q4hA+0Er5BibYNOXpAdfr9+Ns2qCQsAWIMK89YhnaZ8f+x/aC9ZxoT91t9LRhevQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

Xen SMMUv3 driver only supports stage-2 translation. Add support for
Stage-1 translation that is required to support nested stage
translation.

In true nested mode, both s1_cfg and s2_cfg will coexist.
Let's remove the union. When nested stage translation is setup, both
s1_cfg and s2_cfg are valid.

We introduce a new smmu_domain abort field that will be set
upon guest stage-1 configuration passing. If no guest stage-1
config has been attached, it is ignored when writing the STE.

arm_smmu_write_strtab_ent() is modified to write both stage
fields in the STE and deal with the abort field.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 93 +++++++++++++++++++++++----
 xen/drivers/passthrough/arm/smmu-v3.h |  9 +++
 2 files changed, 91 insertions(+), 11 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index 307057ad8a..5c96e8ec7c 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -667,8 +667,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_=
master *master, u32 sid,
 	 * 3. Update Config, sync
 	 */
 	u64 val =3D le64_to_cpu(dst[0]);
-	bool ste_live =3D false;
+	bool s1_live =3D false, s2_live =3D false, ste_live =3D false;
+	bool abort, translate =3D false;
 	struct arm_smmu_device *smmu =3D NULL;
+	struct arm_smmu_s1_cfg *s1_cfg =3D NULL;
 	struct arm_smmu_s2_cfg *s2_cfg =3D NULL;
 	struct arm_smmu_domain *smmu_domain =3D NULL;
 	struct arm_smmu_cmdq_ent prefetch_cmd =3D {
@@ -683,30 +685,54 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu=
_master *master, u32 sid,
 		smmu =3D master->smmu;
 	}
=20
-	if (smmu_domain)
-		s2_cfg =3D &smmu_domain->s2_cfg;
+	if (smmu_domain) {
+		switch (smmu_domain->stage) {
+		case ARM_SMMU_DOMAIN_NESTED:
+			s1_cfg =3D &smmu_domain->s1_cfg;
+			fallthrough;
+		case ARM_SMMU_DOMAIN_S2:
+			s2_cfg =3D &smmu_domain->s2_cfg;
+			break;
+		default:
+			break;
+		}
+		translate =3D !!s1_cfg || !!s2_cfg;
+	}
=20
 	if (val & STRTAB_STE_0_V) {
 		switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
 		case STRTAB_STE_0_CFG_BYPASS:
 			break;
+		case STRTAB_STE_0_CFG_S1_TRANS:
+			s1_live =3D true;
+			break;
 		case STRTAB_STE_0_CFG_S2_TRANS:
-			ste_live =3D true;
+			s2_live =3D true;
+			break;
+		case STRTAB_STE_0_CFG_NESTED:
+			s1_live =3D true;
+			s2_live =3D true;
 			break;
 		case STRTAB_STE_0_CFG_ABORT:
-			BUG_ON(!disable_bypass);
 			break;
 		default:
 			BUG(); /* STE corruption */
 		}
 	}
=20
+	ste_live =3D s1_live || s2_live;
+
 	/* Nuke the existing STE_0 value, as we're going to rewrite it */
 	val =3D STRTAB_STE_0_V;
=20
 	/* Bypass/fault */
-	if (!smmu_domain || !(s2_cfg)) {
-		if (!smmu_domain && disable_bypass)
+	if (!smmu_domain)
+		abort =3D disable_bypass;
+	else
+		abort =3D smmu_domain->abort;
+
+	if (abort || !translate) {
+		if (abort)
 			val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT);
 		else
 			val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
@@ -724,7 +750,33 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_=
master *master, u32 sid,
 		return;
 	}
=20
+	if (ste_live) {
+		/* First invalidate the live STE */
+		dst[0] =3D cpu_to_le64(STRTAB_STE_0_CFG_ABORT);
+		arm_smmu_sync_ste_for_sid(smmu, sid);
+	}
+
+	if (s1_cfg) {
+		BUG_ON(s1_live);
+		dst[1] =3D cpu_to_le64(
+			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
+			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
+			 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
+			 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
+			 FIELD_PREP(STRTAB_STE_1_STRW, STRTAB_STE_1_STRW_NSEL1));
+
+		if (smmu->features & ARM_SMMU_FEAT_STALLS &&
+		   !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
+			dst[1] |=3D cpu_to_le64(STRTAB_STE_1_S1STALLD);
+
+		val |=3D (s1_cfg->s1ctxptr & STRTAB_STE_0_S1CTXPTR_MASK) |
+			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
+			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
+			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
+	}
+
 	if (s2_cfg) {
+		u64 vttbr =3D s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK;
 		u64 strtab =3D
 			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
 			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
@@ -734,12 +786,19 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu=
_master *master, u32 sid,
 			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
 			 STRTAB_STE_2_S2R;
=20
-		BUG_ON(ste_live);
+		if (s2_live) {
+			u64 s2ttb =3D le64_to_cpu(dst[3]) & STRTAB_STE_3_S2TTB_MASK;
+			BUG_ON(s2ttb !=3D vttbr);
+		}
+
 		dst[2] =3D cpu_to_le64(strtab);
=20
-		dst[3] =3D cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
+		dst[3] =3D cpu_to_le64(vttbr);
=20
 		val |=3D FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
+	} else {
+		dst[2] =3D 0;
+		dst[3] =3D 0;
 	}
=20
 	if (master->ats_enabled)
@@ -1238,6 +1297,15 @@ static int arm_smmu_domain_finalise(struct iommu_dom=
ain *domain,
 {
 	int ret;
 	struct arm_smmu_domain *smmu_domain =3D to_smmu_domain(domain);
+	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
+
+	if (smmu_domain->stage =3D=3D ARM_SMMU_DOMAIN_NESTED &&
+		(!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
+		 !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))) {
+			dev_info(smmu_domain->smmu->dev,
+					"does not implement two stages\n");
+			return -EINVAL;
+	}
=20
 	/* Restrict the stage to what we can actually support */
 	smmu_domain->stage =3D ARM_SMMU_DOMAIN_S2;
@@ -2334,11 +2402,14 @@ static int arm_smmu_device_hw_probe(struct arm_smmu=
_device *smmu)
 		break;
 	}
=20
+	if (reg & IDR0_S1P)
+		smmu->features |=3D ARM_SMMU_FEAT_TRANS_S1;
+
 	if (reg & IDR0_S2P)
 		smmu->features |=3D ARM_SMMU_FEAT_TRANS_S2;
=20
-	if (!(reg & IDR0_S2P)) {
-		dev_err(smmu->dev, "no stage-2 translation support!\n");
+	if (!(reg & (IDR0_S1P | IDR0_S2P))) {
+		dev_err(smmu->dev, "no translation support!\n");
 		return -ENXIO;
 	}
=20
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthroug=
h/arm/smmu-v3.h
index fe651ca5a7..3411edc47f 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -197,6 +197,7 @@
 #define STRTAB_STE_0_CFG_BYPASS		4
 #define STRTAB_STE_0_CFG_S1_TRANS	5
 #define STRTAB_STE_0_CFG_S2_TRANS	6
+#define STRTAB_STE_0_CFG_NESTED		7
=20
 #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
 #define STRTAB_STE_0_S1FMT_LINEAR	0
@@ -546,6 +547,12 @@ struct arm_smmu_strtab_l1_desc {
 	dma_addr_t			l2ptr_dma;
 };
=20
+struct arm_smmu_s1_cfg {
+	u64				s1ctxptr;
+	u8				s1fmt;
+	u8				s1cdmax;
+};
+
 struct arm_smmu_s2_cfg {
 	u16				vmid;
 	u64				vttbr;
@@ -666,7 +673,9 @@ struct arm_smmu_domain {
 	atomic_t			nr_ats_masters;
=20
 	enum arm_smmu_domain_stage	stage;
+	struct arm_smmu_s1_cfg	s1_cfg;
 	struct arm_smmu_s2_cfg	s2_cfg;
+	bool			abort;
=20
 	/* Xen domain associated with this SMMU domain */
 	struct domain		*d;
--=20
2.43.0

