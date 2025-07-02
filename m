Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03849AF0C3F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:10:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030266.1403951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbo-00029W-6D; Wed, 02 Jul 2025 07:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030266.1403951; Wed, 02 Jul 2025 07:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbn-00025b-Uv; Wed, 02 Jul 2025 07:10:19 +0000
Received: by outflank-mailman (input) for mailman id 1030266;
 Wed, 02 Jul 2025 07:10:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hFQ=ZP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uWrbl-0000Dm-Tg
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:10:18 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 937bf8f3-5713-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 09:10:04 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by PR3PR03MB6651.eurprd03.prod.outlook.com
 (2603:10a6:102:78::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 07:10:00 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:10:00 +0000
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
X-Inumbo-ID: 937bf8f3-5713-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXxufQSBiBZUHMhAiVnmSvMQd0S/NrhW4fVfIObxC0pnj3NSm9pAawuz0V0fqq56VF4oQdYntx3rNU+Ij7gY+82iztskf2ahhGclanORCAU9a2wus+MI0pXgMPr3BNwy6nHdr641HmytVxFiPGEJ/QnHDvt704GODQf5r1x0gUnr9Mh5f79XbDX9xYfMi028M1hgzBGFUy8zCpGbc3cHYHGVztxCIFhIROOww9OEg0B1h4m1J1X3SwVRPW9dGi9IXpjz09mNEnmK49arNJ6VOmGlGGjO0Osq6cclqgashb9LxQZUCS6/GqFvzDTTEzYMB2BiV2Z5PWQ9qBDw0C4uHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qQ+PMBtT+HioLLwK5GcfC0vHeU0mGowNeZgk/OtTQ0=;
 b=xNB23SMAs7DAOMzjz1u+gTbWgwIQHXPNi2IluBkvqGovpEvI5yIHzHRtBEXrhTDrCZuMa4b8hNlobi4S1MaqWewBM06ENNfavkVTpY7BK2m14sADh1EWVJ/cZEh1doqxUH9e+/00ujNTBcMQoWVDeRYVlk/He++cCg2lYHdvqUPzHiz1Ay4pJEIY/p9KmWzuEa/dHo1VlaBplcJfhQemWaM2YJIiPlvNiqSNmlnEjcf5xMaX2dhgfV4DU8WeSkPfSXEETgO7FkchtWct0gUbEt/1ex/KXfXjUrAkwRzWZvOYShCjn/Q9TsiHNi8O08UREilluf5b8Ygc9nNzr7b2yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6qQ+PMBtT+HioLLwK5GcfC0vHeU0mGowNeZgk/OtTQ0=;
 b=qJspAwibOqYy78t9S0C3rOwZSdS7Cgvturd8vzFdzAMMkF4kLhJX7caKxIiMRISYudm98qaTZPRX8TaL/NsLZ5XdVOHyDAt8sI4bvoyjjfqtjshPnnPTwrWIr4lDyQOKMJg8GbKcespqStPIZN+H5eDyKDEndboJSo4+240+CuLbGqLJPekFQudFLwX2dk6XELz54fW5nmzky0ZhSHJ+Flj8GTtzHw9K9jxAVMizbpbsiTljhGdjORYPFeTIVJ2dg6whJNQCMMEYRghJ8sTdyHoisUBiIW1sKKj/qyu3JtIAuigPaB46xnWngDFtBLL0lrtm1s98BRrIGhdM5fN6BA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v12 1/7] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Thread-Topic: [PATCH v12 1/7] iommu/arm: Introduce
 iommu_add_dt_pci_sideband_ids API
Thread-Index: AQHb6yBTW0gZTRlk2UWgkqBvCOigwQ==
Date: Wed, 2 Jul 2025 07:10:00 +0000
Message-ID:
 <38532fd07a50c461c6e076dce326310368441b50.1751439885.git.mykyta_poturai@epam.com>
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
x-ms-office365-filtering-correlation-id: 4c87619c-9127-4f13-7e08-08ddb93775e0
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?RT8hiGWpIdbTzj8nGEQmJYzVjMA8+LbilRg/Xhh6PbdqWBb+3R5MOb7cNC?=
 =?iso-8859-1?Q?OdNbsqRXkGaQ9xW96KcwMGJhr13PlGH9n0K+5nSmiOZCI7i+rTWGeZYQf6?=
 =?iso-8859-1?Q?L+KRK64w1zBlOM8JmVNS/bqZGawEAZxc83nwFH5fmCpHEVqsyp893kXYUl?=
 =?iso-8859-1?Q?/AtRhLpgfPL2gMWX9vjthniLFR+8sDFgyMxWoLXNYSO9pIgIeycjLVC4eM?=
 =?iso-8859-1?Q?nCj1p2eSXn6bRgtn1RzQ6MGDxc3d5PjpVmQg0/gNsTip+rBA1FCgO+oYz5?=
 =?iso-8859-1?Q?UY0hI+KvdGOMvmlK7uKl5UrqoXXpe6N6VDcdNOOY8OqSF8soGkDKyYjCcu?=
 =?iso-8859-1?Q?ypeQGMAuTZuL8jjWem6cRDoMHAIMDK+mtSO1tEQDgskfoa30DVsTJxNsB/?=
 =?iso-8859-1?Q?g1Zz1fqX2DYSJUL40DurG8FMzrMIbpewFVSDr3GP2k/jzV1OdTnKFOzTdt?=
 =?iso-8859-1?Q?pVUtlBS89g1dyFSEcqqqP06ig9p9jfwFGW3omUmvyN+dyLvRiu4Xp4GTxX?=
 =?iso-8859-1?Q?5pidy+7FSztVIoPGst3nLXenDCIzsGMX7pwFxsZw+rn5kZC3y82PlBiAtR?=
 =?iso-8859-1?Q?au7OWx3tKYgnbTs4Wjs0UNioXuIi3e+UwPTRoz7O4HJIIVeJ3llhckU506?=
 =?iso-8859-1?Q?m8bvDqoDRmV0BaQhAj1PHC7wiUnU+9fEpVPUfSQqS3oXQ/CqOcEMcsCHcp?=
 =?iso-8859-1?Q?zmQwpkCuGCDeRyIrLysqEGgmNTbxsUFnha19j6L6lYIKFMMSQ7dSwjeLm9?=
 =?iso-8859-1?Q?FWIItMO8cja72bowYit2T4J5P5zi16ni7web+uST3CRY8+ZOM8x+gkVxXT?=
 =?iso-8859-1?Q?jMW1NGNhEs9dLSYMpNdhQNJ/ibp1g8//T0BI/Dkm/PENG995XZ+F5F3sFX?=
 =?iso-8859-1?Q?A3JfJ9G0FbbpDKmB3AViidXMifKL2Rw9xTEodgqsB+yVVJ58RFW5KeGdqI?=
 =?iso-8859-1?Q?ekpoV0heokRgxnL7Sv+McVk9UqFOFUS4DjuPadHqgFE53G96n3w94NIGg+?=
 =?iso-8859-1?Q?5LlwcXlSg4V0X5CzqY/wyHQiCEr4if/kwWHGhcg8zOFPO1zHPnagf4UVX9?=
 =?iso-8859-1?Q?9vwq7kyT4jCJr72qSjSQRm1uQUgujO8tA4KafTqrw2Svizvx4idkOaRsoR?=
 =?iso-8859-1?Q?9vgKfMnfJVd8fH+QZ+tPAfT0qj+P5KY5Ugnh9P5lRb4KMOFljKeelwnkUx?=
 =?iso-8859-1?Q?uY2SRKrQxF2OrvH6Oz8B7ooTwhsCXUigEuE3XeXqoy+y1KUZklC/KP0TDk?=
 =?iso-8859-1?Q?jDCJecHS50oGYBsn60YriTuUR9eesULTw9mOgj5Co7DzALkcN0Vi5ZEbbL?=
 =?iso-8859-1?Q?+6sDpeFK/2vveYn50WuBhHW4H2JGpzb1k2HQp2/1NAR2jmWf8Hf6UiXXYk?=
 =?iso-8859-1?Q?m+1z5s7ritBfFVp4kSThaym3Aa3IqgpDTWfiWJCG1eSIx8KcW0tXX3YiTl?=
 =?iso-8859-1?Q?dxMcEj/RnrC0UnaqZKU+LE1rVaK39rr1mXJj/MFpSePITN/EOCjhxFZCke?=
 =?iso-8859-1?Q?2eKih7hdJkMAAmJYcWGMLsnsbh3VyRP5L9wkRPmt9g9umHG22hONB0WhfI?=
 =?iso-8859-1?Q?b/fldzw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xGl1ZZLd2aD2mQv8X6TbmYFzDrtqYKNsTtYjC/j3HgYi4eQuSOgtX2xeUa?=
 =?iso-8859-1?Q?n9BisxD78aK5nYdgVJPsV8UUXs4d1c0SEvKOEqOdWyp/4d7Gggh0IkC/DB?=
 =?iso-8859-1?Q?qROxhVKC9S/pRtJ0BD9z83pbvt1lPWhaOLkmcT8Jqrp8ft9aJai1MRVjeE?=
 =?iso-8859-1?Q?ybLArz83GKQp/ODDPC5Mu/3t+Xk1yCPCnv7kjMqWS1bMMW7aHTnxnOl4g7?=
 =?iso-8859-1?Q?CiHlJK9VmXGOUv1B2/U2fUq3DVVAimitDsAum1KHKlBeo+1xTv51yFSFkq?=
 =?iso-8859-1?Q?h45r6v8ibq9C2Xgc1mDM7mVtkl3KjSHHmVdxLx/Jlj2R1cIozivYrpeytr?=
 =?iso-8859-1?Q?ykHcX3j/j/kw4Fx0uvm4QBbF6kMj+f8Fdh8UVfREzhyzX+D6fdAI0eF3DG?=
 =?iso-8859-1?Q?DMbS1rTilO3uRQKXtiz9VatuhGV6m/GpG7Nu8/iNkSTedjeSiohKhiC6Jg?=
 =?iso-8859-1?Q?OU7fFoX25XH6GlIf5vu4ocRScGR5mZ2CoEQVRifO2WQGK0F7i1CPOILtR/?=
 =?iso-8859-1?Q?pwPaX7IZ2GPh6B0yw/QiqcxlXr84QDF6K+4J1lQkVBxu/yPTpaXb8TYjXf?=
 =?iso-8859-1?Q?LCVSziEP2/hqn9AZJkmWpvwQfkzS0AVHPXwEQDsDDaoPX+xnFkWayOP0ro?=
 =?iso-8859-1?Q?6dp9+uwB8E5MUh5zyqPxRu3Ov7fX76+iX5lxTga0h70ZeaO/QWTSvFYOrn?=
 =?iso-8859-1?Q?l7E8xg+V3JaIS17niql/dq3kvm1lZzhUGbXxSrnA34rf77wQk4MU2LH1Yc?=
 =?iso-8859-1?Q?iXVR1cWFVRrS4XII3W237Ueaa32MoAO5lgrhi0I897SJv5S1Ge1nU6tsyc?=
 =?iso-8859-1?Q?b+Z6UG1E/l0PXJP0tEoIwgi6Kvcva5QwCNEVEIHUqdkpiAHIarK7ZmmFYQ?=
 =?iso-8859-1?Q?VgFLVNgkKh6XfcFj6RRCyMHRn94xykl8NUPM5onrTiQGOw52JwUFzsxXBy?=
 =?iso-8859-1?Q?551RpKVTx/brU7YadKodgQPekLR4VVoh2xYdyFXCk1dVjkJkxoe2H7Pwn0?=
 =?iso-8859-1?Q?TQuXLLxeDPiy/WAADqxAZYOKFo2F0NWLP2rfHJTfXSRNrrM6Zt079S1hK/?=
 =?iso-8859-1?Q?jUb1jluxfRiogR9wqQHyOWNY24y8FdKoSOGkkmLqHnK+ddRI/J7Xj7OV6U?=
 =?iso-8859-1?Q?Tm2HcQCti2LtaLi/BRnVywLoaB4yzbAcevJ8dSLhg6Zd84NinUDnLSjdbe?=
 =?iso-8859-1?Q?bikzQcwz38XlLdHc1aZ4d/i4mwHBbODWGdWvfY/4LN/E23YRzVCKSrO9TA?=
 =?iso-8859-1?Q?DbZVIqnG3j2vLpk/6OK7sD5UTJ8leGoEpj9jbq0uwGIIHsDV8jxqpZ4IZO?=
 =?iso-8859-1?Q?CI8kQmpmIR01pzuXsSl1bxGj7a3yQoajoUYJk7FjikwTkkHhS5BJiOuiH9?=
 =?iso-8859-1?Q?42HY6kQePM+tZYgpOKd6IK6teIrkynlYJ43hvIC9xzAlIfGKnchuc8DgB+?=
 =?iso-8859-1?Q?czs3IFJFLS+zrxgkfkkrZFmfL6IjbUGKDqECMuREZ60FwqHC31vaMq1lx6?=
 =?iso-8859-1?Q?wKOLQsulPV8Mi4N7EdPJV1Z/up4nEklzQ+SRE0DaGpMbdSTpKncosavJQF?=
 =?iso-8859-1?Q?ciD8OQnSYHMOTGOnOYjhhx9bLVstoOeZEY/UnLlj/fb7MVoiOqTrfQ8tSw?=
 =?iso-8859-1?Q?J58EQttKcHRnvm3gztFoHqAc1nMVlM4fvc0m+buIok4+Dufjb+GCtmow?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c87619c-9127-4f13-7e08-08ddb93775e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 07:10:00.7204
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DvNXdIgcpXQwQuSvVKminNawkfOUp8DGaOMKc6XTWdGbIvBxmFxKh528bQD9SEgCPeaTBpkVfhJfFS9PBbaHGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6651

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The main purpose of this patch is to add a way to register PCI device
(which is behind the IOMMU) using the generic PCI-IOMMU DT bindings [1]
before assigning that device to a domain.

This behaves similarly to the existing iommu_add_dt_device API, except it
handles PCI devices, and it is to be invoked from the add_device hook in th=
e
SMMU driver.

The function dt_map_id to translate an ID through a downstream mapping
(which is also suitable for mapping Requester ID) was borrowed from Linux
(v5.10-rc6) and updated according to the Xen code base.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-io=
mmu.txt

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Regarding pci_for_each_dma_alias question: getting host bridge node
directly seems like a simpler solution with the same result. AFAIU
with pci_for_each_dma_alias in linux we would arrive to the host brige
node anyway, but also try to call dt_map_id for each device along the
way. I am not sure why exactly it is done this way in linux, as
according to the pci-iommu.txt, iommu-map node can only be present in
the PCI root.

v11->v12:
* add Jan's AB

v10->v11:
* add Stefano's RB

v9->v10:
* move iommu_add_pci_sidebands_ids to arm/iommu.c
* replace be32_to_cpup with be32_to_cpu

v8->v9:
* replace DT_NO_IOMMU with 1
* guard iommu_add_pci_sideband_ids with CONFIG_ARM

v7->v8:
* ENOSYS->EOPNOTSUPP
* move iommu_add_pci_sideband_ids to iommu.c to fix x86 build
* simplify iommu_add_pci_sideband_ids
* add docstrings to iommu_add_{dt_}pci_sideband_ids

v6->v7:
* put iommu_add_pci_sideband_ids under ifdef
* remove ifdef CONFIG_APCI
* style: add newline for symmetry

v5->v6:
* pass ops to iommu_dt_xlate()

v4->v5:
* style: add newlines after variable declarations and before return in iomm=
u.h
* drop device_is_protected() check in iommu_add_dt_pci_sideband_ids()
* rebase on top of ("dynamic node programming using overlay dtbo") series
* fix typo in commit message
* remove #ifdef around dt_map_id() prototype
* move dt_map_id() to xen/common/device_tree.c
* add function name in error prints
* use dprintk for debug prints
* use GENMASK and #include <xen/bitops.h>
* fix typo in comment
* remove unnecessary (int) cast in loop condition
* assign *id_out and return success in case of no translation in dt_map_id(=
)
* don't initialize local variable unnecessarily
* return error in case of ACPI/no DT in iommu_add_{dt_}pci_sideband_ids()

v3->v4:
* wrap #include <asm/acpi.h> and if ( acpi_disabled ) in #ifdef CONFIG_ACPI
* fix Michal's remarks about style, parenthesis, and print formats
* remove !ops->dt_xlate check since it is already in iommu_dt_xlate helper
* rename s/iommu_dt_pci_map_id/dt_map_id/ because it is generic, not specif=
ic
  to iommu
* update commit description

v2->v3:
* new patch title (was: iommu/arm: Introduce iommu_add_dt_pci_device API)
* renamed function
  from: iommu_add_dt_pci_device
  to: iommu_add_dt_pci_sideband_ids
* removed stale ops->add_device check
* iommu.h: add empty stub iommu_add_dt_pci_sideband_ids for !HAS_DEVICE_TRE=
E
* iommu.h: add iommu_add_pci_sideband_ids helper
* iommu.h: don't wrap prototype in #ifdef CONFIG_HAS_PCI
* s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/

v1->v2:
* remove extra devfn parameter since pdev fully describes the device
* remove ops->add_device() call from iommu_add_dt_pci_device(). Instead, re=
ly on
  the existing iommu call in iommu_add_device().
* move the ops->add_device and ops->dt_xlate checks earlier

downstream->v1:
* rebase
* add const qualifier to struct dt_device_node *np arg in dt_map_id()
* add const qualifier to struct dt_device_node *np declaration in iommu_add=
_pci_device()
* use stdint.h types instead of u8/u32/etc...
* rename functions:
  s/dt_iommu_xlate/iommu_dt_xlate/
  s/dt_map_id/iommu_dt_pci_map_id/
  s/iommu_add_pci_device/iommu_add_dt_pci_device/
* add device_is_protected check in iommu_add_dt_pci_device
* wrap prototypes in CONFIG_HAS_PCI

(cherry picked from commit 734e3bf6ee77e7947667ab8fa96c25b349c2e1da from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/arch/arm/include/asm/iommu.h      | 15 +++++
 xen/common/device-tree/device-tree.c  | 91 +++++++++++++++++++++++++++
 xen/drivers/passthrough/arm/iommu.c   | 13 ++++
 xen/drivers/passthrough/device_tree.c | 42 +++++++++++++
 xen/include/xen/device_tree.h         | 23 +++++++
 xen/include/xen/iommu.h               | 21 ++++++-
 6 files changed, 204 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/iommu.h b/xen/arch/arm/include/asm/io=
mmu.h
index d57bd8a38c..ad15477e24 100644
--- a/xen/arch/arm/include/asm/iommu.h
+++ b/xen/arch/arm/include/asm/iommu.h
@@ -34,6 +34,21 @@ int __must_check arm_iommu_unmap_page(struct domain *d, =
dfn_t dfn,
                                       unsigned int order,
                                       unsigned int *flush_flags);
=20
+/*
+ * This function is not strictly ARM-specific, but it is only used by ARM
+ * as of now. So put it here to avoid creating dead code on other
+ * architectures. When usage is extended to other architectures, it should
+ * be moved to the generic header.
+ *
+ *
+ * Fills out the device's IOMMU fwspec with IOMMU ids.
+ *
+ * Return values:
+ *  0 : iommu_fwspec is filled out successfully.
+ * <0 : error while filling out the iommu_fwspec.
+ * >0 : IOMMU is not enabled/present or device is not connected to it.
+ */
+int iommu_add_pci_sideband_ids(struct pci_dev *pdev);
 #endif /* __ARCH_ARM_IOMMU_H__ */
=20
 /*
diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/=
device-tree.c
index 886e6c7712..7bede20fa6 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -7,6 +7,7 @@
  * benh@kernel.crashing.org
  */
=20
+#include <xen/bitops.h>
 #include <xen/types.h>
 #include <xen/init.h>
 #include <xen/guest_access.h>
@@ -2221,6 +2222,96 @@ int dt_get_pci_domain_nr(struct dt_device_node *node=
)
     return (u16)domain;
 }
=20
+int dt_map_id(const struct dt_device_node *np, uint32_t id,
+              const char *map_name, const char *map_mask_name,
+              struct dt_device_node **target, uint32_t *id_out)
+{
+    uint32_t map_mask, masked_id, map_len;
+    const __be32 *map =3D NULL;
+
+    if ( !np || !map_name || (!target && !id_out) )
+        return -EINVAL;
+
+    map =3D dt_get_property(np, map_name, &map_len);
+    if ( !map )
+    {
+        if ( target )
+            return -ENODEV;
+
+        /* Otherwise, no map implies no translation */
+        *id_out =3D id;
+        return 0;
+    }
+
+    if ( !map_len || (map_len % (4 * sizeof(*map))) )
+    {
+        printk(XENLOG_ERR "%s(): %s: Error: Bad %s length: %u\n", __func__=
,
+               np->full_name, map_name, map_len);
+        return -EINVAL;
+    }
+
+    /* The default is to select all bits. */
+    map_mask =3D GENMASK(31, 0);
+
+    /*
+     * Can be overridden by "{iommu,msi}-map-mask" property.
+     * If dt_property_read_u32() fails, the default is used.
+     */
+    if ( map_mask_name )
+        dt_property_read_u32(np, map_mask_name, &map_mask);
+
+    masked_id =3D map_mask & id;
+    for ( ; map_len > 0; map_len -=3D 4 * sizeof(*map), map +=3D 4 )
+    {
+        struct dt_device_node *phandle_node;
+        uint32_t id_base =3D be32_to_cpu(*(map + 0));
+        uint32_t phandle =3D be32_to_cpu(*(map + 1));
+        uint32_t out_base =3D be32_to_cpu(*(map + 2));
+        uint32_t id_len =3D be32_to_cpu(*(map + 3));
+
+        if ( id_base & ~map_mask )
+        {
+            printk(XENLOG_ERR "%s(): %s: Invalid %s translation - %s-mask =
(0x%"PRIx32") ignores id-base (0x%"PRIx32")\n",
+                   __func__, np->full_name, map_name, map_name, map_mask,
+                   id_base);
+            return -EFAULT;
+        }
+
+        if ( (masked_id < id_base) || (masked_id >=3D (id_base + id_len)) =
)
+            continue;
+
+        phandle_node =3D dt_find_node_by_phandle(phandle);
+        if ( !phandle_node )
+            return -ENODEV;
+
+        if ( target )
+        {
+            if ( !*target )
+                *target =3D phandle_node;
+
+            if ( *target !=3D phandle_node )
+                continue;
+        }
+
+        if ( id_out )
+            *id_out =3D masked_id - id_base + out_base;
+
+        dprintk(XENLOG_DEBUG, "%s: %s, using mask %08"PRIx32", id-base: %0=
8"PRIx32", out-base: %08"PRIx32", length: %08"PRIx32", id: %08"PRIx32" -> %=
08"PRIx32"\n",
+               np->full_name, map_name, map_mask, id_base, out_base, id_le=
n, id,
+               masked_id - id_base + out_base);
+        return 0;
+    }
+
+    dprintk(XENLOG_DEBUG, "%s: no %s translation for id 0x%"PRIx32" on %s\=
n",
+           np->full_name, map_name, id,
+           (target && *target) ? (*target)->full_name : NULL);
+
+    if ( id_out )
+        *id_out =3D id;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/passthrough/arm/iommu.c b/xen/drivers/passthrough/=
arm/iommu.c
index fc453180f0..100545e23f 100644
--- a/xen/drivers/passthrough/arm/iommu.c
+++ b/xen/drivers/passthrough/arm/iommu.c
@@ -15,6 +15,7 @@
  * GNU General Public License for more details.
  */
=20
+#include <xen/acpi.h>
 #include <xen/device_tree.h>
 #include <xen/iommu.h>
 #include <xen/lib.h>
@@ -151,3 +152,15 @@ bool arch_iommu_use_permitted(const struct domain *d)
 {
     return true;
 }
+
+int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
+{
+    int ret =3D -EOPNOTSUPP;
+
+#ifdef CONFIG_HAS_PCI
+    if ( acpi_disabled )
+        ret =3D iommu_add_dt_pci_sideband_ids(pdev);
+#endif
+
+    return ret;
+}
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index 4a1971c3fc..37e1437b65 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -161,6 +161,48 @@ static int iommu_dt_xlate(struct device *dev,
     return ops->dt_xlate(dev, iommu_spec);
 }
=20
+#ifdef CONFIG_HAS_PCI
+int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    const struct iommu_ops *ops =3D iommu_get_ops();
+    struct dt_phandle_args iommu_spec =3D { .args_count =3D 1 };
+    struct device *dev =3D pci_to_dev(pdev);
+    const struct dt_device_node *np;
+    int rc;
+
+    if ( !iommu_enabled )
+        return 1;
+
+    if ( !ops )
+        return -EINVAL;
+
+    if ( dev_iommu_fwspec_get(dev) )
+        return -EEXIST;
+
+    np =3D pci_find_host_bridge_node(pdev);
+    if ( !np )
+        return -ENODEV;
+
+    /*
+     * According to the Documentation/devicetree/bindings/pci/pci-iommu.tx=
t
+     * from Linux.
+     */
+    rc =3D dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
+                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+    if ( rc )
+        return (rc =3D=3D -ENODEV) ? 1 : rc;
+
+    rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
+    if ( rc < 0 )
+    {
+        iommu_fwspec_free(dev);
+        return -EINVAL;
+    }
+
+    return rc;
+}
+#endif /* CONFIG_HAS_PCI */
+
 int iommu_remove_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops =3D iommu_get_ops();
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index d2de7c3a13..a7cc092d05 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -959,6 +959,29 @@ int dt_count_phandle_with_args(const struct dt_device_=
node *np,
  */
 int dt_get_pci_domain_nr(struct dt_device_node *node);
=20
+/**
+ * dt_map_id - Translate an ID through a downstream mapping.
+ * @np: root complex device node.
+ * @id: device ID to map.
+ * @map_name: property name of the map to use.
+ * @map_mask_name: optional property name of the mask to use.
+ * @target: optional pointer to a target device node.
+ * @id_out: optional pointer to receive the translated ID.
+ *
+ * Given a device ID, look up the appropriate implementation-defined
+ * platform ID and/or the target device which receives transactions on tha=
t
+ * ID, as per the "iommu-map" and "msi-map" bindings. Either of @target or
+ * @id_out may be NULL if only the other is required. If @target points to
+ * a non-NULL device node pointer, only entries targeting that node will b=
e
+ * matched; if it points to a NULL value, it will receive the device node =
of
+ * the first matching target phandle, with a reference held.
+ *
+ * Return: 0 on success or a standard error code on failure.
+ */
+int dt_map_id(const struct dt_device_node *np, uint32_t id,
+              const char *map_name, const char *map_mask_name,
+              struct dt_device_node **target, uint32_t *id_out);
+
 struct dt_device_node *dt_find_node_by_phandle(dt_phandle handle);
=20
 void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 832775754b..ebfada1d88 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -241,7 +241,8 @@ int iommu_dt_domain_init(struct domain *d);
 int iommu_release_dt_devices(struct domain *d);
=20
 /*
- * Helper to add master device to the IOMMU using generic IOMMU DT binding=
s.
+ * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
+ * DT bindings.
  *
  * Return values:
  *  0 : device is protected by an IOMMU
@@ -251,6 +252,19 @@ int iommu_release_dt_devices(struct domain *d);
  */
 int iommu_add_dt_device(struct dt_device_node *np);
=20
+/*
+ * Fills out the device's IOMMU fwspec with IOMMU ids from the DT.
+ * Ids are specified in the iommu-map property in the host bridge node.
+ * More information on the iommu-map property format can be found in
+ * Documentation/devicetree/bindings/pci/pci-iommu.txt from Linux.
+ *
+ * Return values:
+ *  0 : iommu_fwspec is filled out successfully.
+ * <0 : error while filling out the iommu_fwspec.
+ * >0 : IOMMU is not enabled/present or device is not connected to it.
+ */
+int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
+
 int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
                        XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
=20
@@ -286,6 +300,11 @@ static inline int iommu_release_dt_devices(struct doma=
in *d)
     return 0;
 }
=20
+static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
+{
+    return -EOPNOTSUPP;
+}
+
 #endif /* HAS_PASSTHROUGH */
=20
 #endif /* HAS_DEVICE_TREE */
--=20
2.34.1

