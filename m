Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1E7AF0C3D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030263.1403941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbk-0001ih-R6; Wed, 02 Jul 2025 07:10:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030263.1403941; Wed, 02 Jul 2025 07:10:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbk-0001fD-Jx; Wed, 02 Jul 2025 07:10:16 +0000
Received: by outflank-mailman (input) for mailman id 1030263;
 Wed, 02 Jul 2025 07:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hFQ=ZP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uWrbi-0000Dm-Sp
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:10:14 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98374b6f-5713-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 09:10:11 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by PR3PR03MB6651.eurprd03.prod.outlook.com
 (2603:10a6:102:78::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 07:10:04 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:10:04 +0000
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
X-Inumbo-ID: 98374b6f-5713-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1H//fzjmbuyn7mhC13Qy9SEkZQkj5Ow2/0ULQHF8B+LGLrl9uyrSadcCOAa5NIMLQ4PtBGwCSAVGVSLVIuudTC9LgWkfd63A2K8yhdN1bYxla3QeHH+hAeDqRQSHTpi+O3LYkIsS8XOBLrwV4OrmtxkOCKRHBcf/tf1mC/YGBooBtyp3/THddqBAe6aFfdeq1YMMZlyLCc3aNRbdnPW+1OeXFPllra9J5Wen2Ogb8TWjU4xkiS7J6sTpgen3Oee1Q1bSZ45JbwxNJgmEa2rxWjaXJVy+485HzU5w9/ZlWq+n/CxIHo4WRwGub+EL3b4hw0z0Bz3FQjTQN2Wly6v7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0Qta02KU2i5eR6LOiPYT0O0sxIAYJlAJ/hF7D7pSQI=;
 b=pRlLaX7nxYzvyb/bIQQ0039YKrLPNo+DpzWpe1kNrNCdY5HC0MtKqTnbCJMRN+56nBrAeOjG+D7ixCBLy5TYENnaST+arVYN5k09LpGj0sAMmYWBBtHBmFIy3UP/8Css9g8agxyl+0Gg7yPLM1aXs5VxaPl2bzbhf/FX5zYHUoRU9rcbThFIIwWbr3bwhhO0hUI5y3PiOE/1H3bOxrApCTLJQhDoal00b9lKGtobmp4YWE/B7PdyrEHx5rc57aN1Lq4pYdTTO7+d1Nb6XQwhY5gAMALCEbE1WZeQmsXdTJ3UiNH1PsxBM0U5l59814Qcqm4TO2gDdheZycWyeLudaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0Qta02KU2i5eR6LOiPYT0O0sxIAYJlAJ/hF7D7pSQI=;
 b=owUFpDV77j42qehQKPe8nRtTBI8yBYnb6mW5/D7Gx/mZTtIJ2NwcwHVLtMTWsDCfBEBhRW7GQERue3GHUR6SJFYtjZONzPB2AlThJdlKkKN9wY2BuF1I28PWTKfceiCxLodCfWelY4cc1S5uEO8GyJWfNaGg8BqIOSA6TXJLGT/bxa47wrhI+Y54/ES/zF9viG95+uJyhFIMQ1XRHDquJE+1XQSBa62cU18zVnG+et2cPfbn7KAzH/y9ZAt3HjgYR0UX/iggau7nXeJZGLIUTfDIxFCluv9DPW60f+LEXDJ6LzS4inRgExP20ezxBd5LaniDII3ZhDRHgBZrh2iNKg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v12 7/7] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Topic: [PATCH v12 7/7] xen/arm: Map ITS doorbell register to IOMMU page
 tables
Thread-Index: AQHb6yBUo/4pCLPsgkWKLD7C6qkH7g==
Date: Wed, 2 Jul 2025 07:10:03 +0000
Message-ID:
 <fbd4d4f46f07ef3a855cd9bd806eceb04a1b6c69.1751439885.git.mykyta_poturai@epam.com>
References: <cover.1751439885.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1751439885.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|PR3PR03MB6651:EE_
x-ms-office365-filtering-correlation-id: 0c3f2554-32c2-42b0-28d2-08ddb93777f9
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tFFmvTU5mXcoFqj6dIufLYkPsMqheWzRJfD6ezQ2VGRpYDwyqfA7OBEary?=
 =?iso-8859-1?Q?YC3RhYxl9mArhzkY2iO8foRRXEKCeT/NafdIuO8hbdI9dtQYmnIkcV/svZ?=
 =?iso-8859-1?Q?tW0aoe4sg/DURjfQiuQVr8ig0oV/ObTja3VMbbcIXei5+ppF0BvLsQuSUM?=
 =?iso-8859-1?Q?RIkkd/8BP6GiHJLif6jHY0d4ZysCkgUyrLZjNuFcKfxSDlRSPoK0Mx/L7R?=
 =?iso-8859-1?Q?3oFaNGp4mE/9lLcvxVIiAgyr57DkWVVq57NvMO1JVm+F4dxIe1oczC1Tc8?=
 =?iso-8859-1?Q?14enueP7a/nlefIAdW6E1oF4xgo3hgZCayeWzk5mEiglXVHYd9ZV6Pe7QD?=
 =?iso-8859-1?Q?0VU1jlHOVaf0h5B0ij25lUkDwulr6o/euBsx2VF6+u8LC+7buEbP3tsBv5?=
 =?iso-8859-1?Q?tlHB2NkMUMCIjKxOCuGrPA7HiPL4Ak90Wt+/oiRHqK8kf5dwgYOLENTSrY?=
 =?iso-8859-1?Q?8GZtGit8s7Uch22k8vA6cMHEtMZuSCJBPGdyju9cXMzZLAMt4dzQTFbtUb?=
 =?iso-8859-1?Q?4wzZBkItDpHSmvTDVbA0e7FeIRv1Jgitogy6rf91UlhGEFhkGSDXZrGJAK?=
 =?iso-8859-1?Q?wsAedV4JdTH/zLjB6nQIvDG/Lq2idnRFS4T8ZSWP1jIEECvpDM1PBqaAIX?=
 =?iso-8859-1?Q?xkK9P0xhzNtIdZvcklb2OFlfO5an02kJQMJ5V0bYDPJeTXQmUKflrGtwNK?=
 =?iso-8859-1?Q?xERFVUzrJBfT7FbNHzEu2LTOvvsPlm9aP0Y7dxKW4F5n36Kx6xXqWdQXha?=
 =?iso-8859-1?Q?BLpTscyLH0X9A2SUwwPyLv2egTcZ3Tsm1soDGVAjOg7+VqNhzlYBRDkYf1?=
 =?iso-8859-1?Q?264lqbHNshTLYMP00NBUxP4El7q9m6yA7BOcYABupy1vOy2ezfSd9OHhVy?=
 =?iso-8859-1?Q?TZb3p6nwFkpkstKkIm3qRblDhJUSUnjr7jOGONVhLb/06VGwXu86f4xpOy?=
 =?iso-8859-1?Q?EhVbzzymAoWXbn27vI7v2UwZwLER9nyJ6VRhzu7mziNmf265eTMXe0aCth?=
 =?iso-8859-1?Q?umid/F3gOjB71+FYcguOGaZv0VpKyaQXo6HmxdLCfTiykaUw2gOtbaaPXi?=
 =?iso-8859-1?Q?udITkNHfZ6kHhG50HuwCe4VfExiXRxsR+qX/hpa8lw/80jMhaNRDg4bFvK?=
 =?iso-8859-1?Q?5OrqVQXGpS9bUQeQOhTUrRDMmZENltOvn+NGDuO6BjyPyex0an5oxRSduh?=
 =?iso-8859-1?Q?/maHgdz3W4wcAP17ZtbbsFrHelPM7W9ft/gnuQRrEe8n2Hz8TvI5TvOnln?=
 =?iso-8859-1?Q?a2iBejNMpmKN85e9Rbg2vdgdYsZZ2ueMrFMywjatO1F5lX+obKIoROMNwF?=
 =?iso-8859-1?Q?ldJRvVVsWhPakmAMN+i3z9zlqhlWRnqRsAhSNxGQ1Bg4Gs/Ud87hW4CzUq?=
 =?iso-8859-1?Q?tFrxmDNulM1vg6ZRoNcFqus+4Y57ufIn+v0AgI4aCQ/2dcM4jDSCA46Qoc?=
 =?iso-8859-1?Q?RAWf8ao3JJaPHAxe//SOwvGZBmAGFxBWcXzk8YA4E7oIXoAxYUC/XnOBAr?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+tc3gGB1TudiHZXyz57+jTmkcCYhzZa+VEoGbyc0+d6lAmBL5nZs2q064r?=
 =?iso-8859-1?Q?rfHRyB6RzrlzuEFnnTfZr7IyLEoW9Pvvp0QQSwA5nUvIGyPVtVcq0KAmEz?=
 =?iso-8859-1?Q?CFwqsjwXPzJG0+gpantCeF9p/QS20YsMXHKyqDkREHit/CvBGnFm9Ky8bD?=
 =?iso-8859-1?Q?iJsgY13BE5ZynykuzoKKvCid4lNtTvhfIHsimrZyFz8s6dHu5VipYhq2y0?=
 =?iso-8859-1?Q?vV12rBjfXNseHNbrj6O9dHo2t56m6hKqhz+P84UUVWiTPDTvvZsuv6j7U4?=
 =?iso-8859-1?Q?3guz7KuFOpivZskdJlrepA03+DTDR8k4qokiHVzplHluAMm9nnYAU83odB?=
 =?iso-8859-1?Q?dnc2vp6LqnrRpPTWmfIsWETOKQhR15lwa7K3AsGozCug/XCwcTmbOCkYWy?=
 =?iso-8859-1?Q?nmNNPckEc1dRa4oKWeRLfVep3VWrzq8YRsMbnNaZiRq5OIT4TVG8hSMbFK?=
 =?iso-8859-1?Q?JsfftjrAvu1/uzN5+uIUkFrr/CnRBbWBCQihkUrazsrMmC4PrhwkOfeFN2?=
 =?iso-8859-1?Q?AwrxKKrFaUnVDC0QLyS/E3c7DAr8wfsntgV80dJuTKjrTwSMITemM55T0U?=
 =?iso-8859-1?Q?U0q4+i3AGzbH71y+fSn1rT5xp2yu+cx6//WribkwwjUkFZlBn4Ah57nZ4H?=
 =?iso-8859-1?Q?RHsSCmiBMn0awdqAaMNOJasjin+SZC8WJ2Napgn4sNk1/64RkyDlGt2cA9?=
 =?iso-8859-1?Q?14ds4xp3XNEjQpFZzNe4At7uMYkT7ybbDtEHmfNZlv0BbCBFYkVAif6Akr?=
 =?iso-8859-1?Q?T+ifFkUR/XMplAa2QMYUWzvbzQOkjGZRW/UpqPcLDwJjll4bJyqvs6S+4J?=
 =?iso-8859-1?Q?ijV/B44oVfrIQVfIO+aMCreO182WhVidlfUCrxpkxU5GppRIsERcnmeWTr?=
 =?iso-8859-1?Q?pSSwVbgdmBgO5tzEa1lbBmQ1C9iqt9Chh7Ng2uIuB+UdYlusntMsYMUk8N?=
 =?iso-8859-1?Q?cPtZdbYlCEMd67s/Ie/RrJZhF6mQWPM+w1RLIRpBby2lVx//DY0A5msv0b?=
 =?iso-8859-1?Q?IpLt72Eu34+Or8k/p7JTMv1x8hgLzGN4rowfVX9H9bJM0t5xzsT9prxd7Z?=
 =?iso-8859-1?Q?tkJsuGjXLNdptfN3dQotyrt4bc4Ta/fndSaR43ohyh/O4525P0hD+VeKal?=
 =?iso-8859-1?Q?mQcVDIt4Z4udPID+zh6uNNjpb0yw9Skl8wkLhF5Hk2OKfrxbGa2mGff3fb?=
 =?iso-8859-1?Q?Ec7BZt6Nnmb5nywpe8sXPQxuCTXCc77RO104aPUPIhqfvLOQuYboJfL6gH?=
 =?iso-8859-1?Q?Gt7chOXvuufggnHt7QyeCAtYj1b6JExt6RwmAfsinWPZrXDYhHHoWBvQJD?=
 =?iso-8859-1?Q?qXhAlaYklpEUhbqjDYMCl6k/oZGWhHfUSpXFXAVYKoLOoDq64u8Je5giFe?=
 =?iso-8859-1?Q?RB9jn194DswCvh0NPJVdmeQV7sVcm5W5nG50J6BWNk/v3/16bCibMX1hZX?=
 =?iso-8859-1?Q?i6JXr00rjseyHW8xgFinYks3TpBbIb73MBqLX3pGfRPXYNrX6avwojT+CR?=
 =?iso-8859-1?Q?rw2x2Nn4td7OpfLIO283hJ1TxWeXvhHgjKl2JeN6ZvI4z6gGqzi2tLxV04?=
 =?iso-8859-1?Q?CO7YAiOPvCxHyVPtn6QrKkHSLwC/Bb1iEyn+xomiswoG1iV5rrKS1x47R3?=
 =?iso-8859-1?Q?F48vMMNIHrlI/WaIfipor49K3uR0lBJR62k4b+Fln9bkv9kJCxP17wQQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c3f2554-32c2-42b0-28d2-08ddb93777f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 07:10:03.3850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pkl5aUlsWZUDmpQfDQ2r5za29Y8dbiYqabdy+oulWx9X/cjRZMjZcwaxXg+7WYpVLCpJwTrtOOlCq2/iglYgZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6651

From: Rahul Singh <rahul.singh@arm.com>

When ITS is enabled and PCI devices that are behind an SMMU generate an
MSI interrupt, SMMU fault will be observed as there is currently no
mapping in p2m table for the ITS translation register (GITS_TRANSLATER).

A mapping is required in the iommu page tables so that the device can
generate the MSI interrupt writing to the GITS_TRANSLATER register.

The GITS_TRANSLATER register is a 32-bit register, and there is nothing
else in a page containing it, so map that page.

Add new host_addr parameter to vgic_v3_its_init_virtual to prepare the
foundation for DomU MSI support where guest doorbell address can differ
for the host's. Note that the 1:1 check in arm_iommu_map_page remains
for now, as virtual ITSes are currently only created for hwdom where the
doorbell mapping is always 1:1.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
This patch was originally picked up from [1], and commit description
loosely borrowed from [2].

Example SMMUv3 fault (qemu-system-aarch64 virt model), ITS base 0x8080000:

(XEN) SMMUv3: /smmuv3@9050000: event 0x10 received:
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000800000010
(XEN) SMMUv3: /smmuv3@9050000:  0x0000008000000000
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000008090040
(XEN) SMMUv3: /smmuv3@9050000:  0x0000000000000000

Example SMMUv2 fault (AMD/Xilinx Versal), ITS base 0xf9020000:

(XEN) smmu: /axi/smmu@fd800000: Unhandled context fault: fsr=3D0x402, iova=
=3D0xf9030040, fsynr=3D0x12, cb=3D0

v11->v12:
* no changes

v10->v11:
* add Stefano's RB

v9->v10:
* map vITS doorbell to host ITS doorbell instead of always 1:1
* use simpler addr to dfn conversion

v8->v9:
* no changes

v7->v8:
* no changes

v6->v7:
* add tlb flush after mapping
* style: update formatting
* revert back to printk with XENLOG_G_ERR

v5->v6:
* switch to iommu_map() interface
* fix page_count argument
* style fixup
* use gprintk instead of printk
* add my Signed-off-by
* move to vgic_v3_its_init_virtual()

v4->v5:
* new patch

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00483.h=
tml
[2] https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/623=
2a0d53377009bb7fbc3c3ab81d0153734be6b
---
 xen/arch/arm/vgic-v3-its.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
index c65c1dbf52..bc738614bb 100644
--- a/xen/arch/arm/vgic-v3-its.c
+++ b/xen/arch/arm/vgic-v3-its.c
@@ -1445,11 +1445,13 @@ static const struct mmio_handler_ops vgic_its_mmio_=
handler =3D {
 };
=20
 static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
+                                    paddr_t host_addr,
                                     unsigned int devid_bits,
                                     unsigned int evid_bits)
 {
     struct virt_its *its;
     uint64_t base_attr;
+    paddr_t host_doorbell_addr =3D host_addr + ITS_DOORBELL_OFFSET;
=20
     its =3D xzalloc(struct virt_its);
     if ( !its )
@@ -1478,6 +1480,26 @@ static int vgic_v3_its_init_virtual(struct domain *d=
, paddr_t guest_addr,
=20
     register_mmio_handler(d, &vgic_its_mmio_handler, guest_addr, SZ_64K, i=
ts);
=20
+    if ( is_iommu_enabled(its->d) )
+    {
+        mfn_t mfn =3D maddr_to_mfn(host_doorbell_addr);
+        unsigned int flush_flags =3D 0;
+        int ret =3D iommu_map(its->d, _dfn(PFN_DOWN(its->doorbell_address)=
),
+                            mfn, 1, IOMMUF_writable, &flush_flags);
+
+        if ( ret < 0 )
+        {
+            printk(XENLOG_G_ERR
+                    "GICv3: Map ITS translation register for %pd failed.\n=
",
+                    its->d);
+            return ret;
+        }
+
+        ret =3D iommu_iotlb_flush(its->d, _dfn(PFN_DOWN(its->doorbell_addr=
ess)), 1, flush_flags);
+        if ( ret < 0 )
+            return ret;
+    }
+
     /* Register the virtual ITS to be able to clean it up later. */
     list_add_tail(&its->vits_list, &d->arch.vgic.vits_list);
=20
@@ -1522,7 +1544,7 @@ int vgic_v3_its_init_domain(struct domain *d)
              * base and thus doorbell address.
              * Use the same number of device ID and event ID bits as the h=
ost.
              */
-            ret =3D vgic_v3_its_init_virtual(d, hw_its->addr,
+            ret =3D vgic_v3_its_init_virtual(d, hw_its->addr, hw_its->addr=
,
                                            hw_its->devid_bits,
                                            hw_its->evid_bits);
             if ( ret )
--=20
2.34.1

