Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BB6AA0ABE
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:52:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972141.1360586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVZ-0000RO-Vc; Tue, 29 Apr 2025 11:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972141.1360586; Tue, 29 Apr 2025 11:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVZ-0000Jg-MT; Tue, 29 Apr 2025 11:52:17 +0000
Received: by outflank-mailman (input) for mailman id 972141;
 Tue, 29 Apr 2025 11:52:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zRN=XP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9jVY-0008Cw-5j
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:52:16 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 646d14fe-24f0-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 13:52:14 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by DU0PR03MB8809.eurprd03.prod.outlook.com
 (2603:10a6:10:412::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 11:52:09 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 11:52:09 +0000
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
X-Inumbo-ID: 646d14fe-24f0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqwap8XhFjQgDuZjlrq7wfp7cOC4lPBphSaLvF+CqCcoiTIyVHIvUvVG5dyj8kww9Huj1Jz91vJBpcofh5wkXYNK3wrhO9hovEb70T/a+68tMO+LPxObcVMdsXm/oaHvWXLnl5DzJILszSLejLTHNtWxlQJGFpwVawwo3TotFG3lq58WxF0V7HUKtIhxcRbgv88KhNkkvUDQ0WbnBGV5D+1r0sbYQXxt2qBK4SqFLjAoMA5aXF5A6M40q88OlVXAM4JrWq+hDkhTwjZmuakbTCJ9c+l0454HM9jnHG4ilaWhIrMBRl7NiJ/jEGNWH+CqiDf/YR2Q3DvFFtXVetQ1rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kfSP0ijPoUJ0zOanbfEnGTkKZRccDFaPxR3SPywojbA=;
 b=aZB6ALHsolm0dGeetQbkkwbeD9/91ZBxfexfLgqGTMbP/Geh7mJvyBF5PChS2V/iRuf4ChgbpSsKQmtWD8Ynpt1mL5vgeEuRW8p8Iq66PMAg35+wm5dlUTaC4wANxPo7gkVjkoYlsjHiG3hwu6Cq5dor4AxsidLQmpfWyx4p6GiQh1Fq38ayDn9I4+LN1cimbGiF/Cw1Dxl4j1xgeO8aHOltLDJqq4blAi3cWM40JAYhWayvRwQIPGSrIGHIh2jjfEp8zQdwT5LYxCjT4WkOyso+fW445Nymn2qkBjCUHQoI5t9M9XClBv42BPAtLgXfenKoEv3Ixpr05vL2ap6IfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfSP0ijPoUJ0zOanbfEnGTkKZRccDFaPxR3SPywojbA=;
 b=vV0OpZwt0H9E09rs8AKgbGOC8iRUuxpCvuWxLahVhJ0EkaxHjE/VTkAv92vvmXApMP2v6cWxEHs+UxapAq23FqMNg16Hc86oxYCnLEqJM4lGrRJ8nzOXtKOWhIAiphH4QzbKWHCugX1JrzjgR+r6EEBe2MwEX0IhrguO9od1itfd0Onl0YjMJ2y92h4l5UFgMDdQrB+gOITH5VUfgxHyXW/rTP3gE3+Efwqx6eQG2eufo3wzW8eGdnNil7IxVR2D/OBQgB9FDmqm80CH9QoGccaOIMMDSJuasHLBhWzlFzPSxdMzs1Y0glo4i+J+vrUwMlg9XrSEB9urB50DZ7sFQw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v10 2/7] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Topic: [PATCH v10 2/7] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Index: AQHbuP0jzg3DGv9AAEa6MkzlniNuUw==
Date: Tue, 29 Apr 2025 11:52:09 +0000
Message-ID:
 <d4f10994cdfc202689b2978434d0d50b85fbdb7f.1745918678.git.mykyta_poturai@epam.com>
References: <cover.1745918678.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1745918678.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|DU0PR03MB8809:EE_
x-ms-office365-filtering-correlation-id: b34aea09-1a8f-4890-cfe5-08dd871445d4
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?A/oSPDQd28u1QpECkHAh1BU1dDePLfeI6gr37j30m0Nn7I/hG6CbRSEXAE?=
 =?iso-8859-1?Q?tm8cUN9aiGjlnbqnOHj+5P5JdBYazUg1VTmWPl2oHtYs+7kbEkNIr+gKaf?=
 =?iso-8859-1?Q?YHwrw1XdbpJ89jQxcSNgPrlJtCrxN6pI1hgoYvJMkOWCRePX/bKH7o4KsU?=
 =?iso-8859-1?Q?jfoXZQUlnVZy8Wnpqr+weRMfrpSTMpEcQRQytkAhs96bC3MOI1gkiOH/rA?=
 =?iso-8859-1?Q?zidwWvEXqCLgPdG/cymrzD8DOOYRtISnGh0gsmK58OHvRt9CQrMT73g0WD?=
 =?iso-8859-1?Q?ZG6p7uTwvtyp5w5jPiUQyxdQHZ4BgRRetm6TqVDKaFub8XEv8hMDQyUL+0?=
 =?iso-8859-1?Q?KZEeUoruHg+B2hMs2tVzDHgc/W9AHdIv2MBKBJ12lZqG5CDM/smLh5BPei?=
 =?iso-8859-1?Q?W7agkJW8WuXu9jUHqrMAFutEa6xb8vKh+JTA/jWqHOjzlDyT+r0Vziq7Fm?=
 =?iso-8859-1?Q?q6JA/pWrhnjku8FlfdPSiDNZgY8EMXiiHmotFx2Td995DxW7uffz3ShNGr?=
 =?iso-8859-1?Q?c4W6fOvgyJGjZau4xFxtsQTTZLpYov+CgXWFzfrfyL9AzHxQoPeDTJSBnA?=
 =?iso-8859-1?Q?sCCU2+5oqh+ds3E5oo97ado+g7sRs/qlhRCpCrkUTbOfRRN0ZrT/AsvSIh?=
 =?iso-8859-1?Q?iWt8qBPCPokNxAo5BoK7KRbSm1oud31yENnZZsJE2xQripbxLEC3Gc6SIN?=
 =?iso-8859-1?Q?vXaeIsqJdGcS9n8WjHkONYNiX+jd8Q1C+8IG5d+l2UPlw7PtL95GrrKXtV?=
 =?iso-8859-1?Q?HkZnP2o8f6IwRWbiBdPWeAxa6Lzad3r1MvVApzb85ZQO31qSNHVuY/f5BS?=
 =?iso-8859-1?Q?HfOfJq5L3c8OVrkwGUQteLEIGGh4KHH5QZsYosamtrHnAEbCiwW5MZjO4h?=
 =?iso-8859-1?Q?FQwnPomxwqZ/cIh2tDlO5OB8M0I6ODqHqNJbdzPx1yv0QhVe65G3Hk87nS?=
 =?iso-8859-1?Q?1Arzz4ReoSmu3dbF7FjrHW5e06L70NjEp1gpEqGPTxGfJlLWRQ0r+sGXUb?=
 =?iso-8859-1?Q?Dq+pB2wIsRiB7Mz09I+8waP6g54NW4IlQYeHiOgENAHe3IKYWYM6Z7N3im?=
 =?iso-8859-1?Q?HXPkAtxYi91OoC6chViY10AfOuRV/d+rUCCw9NPcmVe+nY6H3h7eiFk0fP?=
 =?iso-8859-1?Q?18jcIOzqNfWCEaNQBGTsQ+N1Gib/Ol24fpFBExO7Td1Cg1d3kktsi1joEj?=
 =?iso-8859-1?Q?1Kn2pI9e/g7cLZTOs5YkbAKLku1e+nKBVH1aNgM1NFnDWbea4z3hidcvEG?=
 =?iso-8859-1?Q?eFQpUZ/tVime5BGyAeMOuy3DLovaeMPMfRU9PHfxPJSu2SOWxYIcODWvAT?=
 =?iso-8859-1?Q?I4Lo25qHf575vRBZ75Dv3fyL6JuwJA6lKQRhjV/aet8VvUdg0tpfKZxZ9v?=
 =?iso-8859-1?Q?EiHkg6k8emkLlfoe/Agz3pZZ2+DmW06fZbIXE+3gpuuOzbvKnT4yA3Avof?=
 =?iso-8859-1?Q?0CuQ6Mf55wVyyyR1FQ0D3jWatj8OdNn6dJqLKIznk/9FBw5d042yK6LHLo?=
 =?iso-8859-1?Q?EyyRliowckTj8iGxcYqvYM2QPsAvGLrzvEqjLJ3D42eGbkviftKGw8Vo3Y?=
 =?iso-8859-1?Q?of2MNXs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tq5sxX6OmrIizEhNVhX3e4xjG5/kUKyteF4TJCAK2pA9KVxjgnLqkVTVF1?=
 =?iso-8859-1?Q?lCzuRLkXPCYCDJ5rTHxkKU8TJCnM+kHfmA7VQPIkHdW4ZRcUlPno6b9SzS?=
 =?iso-8859-1?Q?SP9ScQ9Zys4KEQlEMhjzBaWM3g2sDUdDTCwZeKBriwN+0aup9x6N1Olv+B?=
 =?iso-8859-1?Q?+jn9aErb+L4kzt7VaaAimTaD2pqS0py3l6kkaSOgLaay0SVdni6K/W/Fa7?=
 =?iso-8859-1?Q?PFDjG+z9IUiFRxS3K1IhywmNHiLqxa5TBwddkvND1SoxBatpN0ZPzInmyv?=
 =?iso-8859-1?Q?Tg2TJniNuRsLbdiqQrIuZFQaTiEeobLySKMGCKPLhAcqtUPUU4PHI1UfU7?=
 =?iso-8859-1?Q?zMfotHWrFE6YeSSx3LvtqAnDdiWxJG4APuFw2XP9ENRx0m3DeUhPv4yQIj?=
 =?iso-8859-1?Q?GwImncaMHJw/AeH7yQcEOj/x6a+U5p4tROhJuErTzqyq6uIeyWzSTEkffq?=
 =?iso-8859-1?Q?TleQGXSGRyncncascEVAdFhGx/kU87U0PfoKvSlirZ+7O0ykfdrdPbLBtX?=
 =?iso-8859-1?Q?9Ac3eK0leQ09yqL26aSvksQqAtbHIDhXY0sq1Q14jRwTP9xhxidE26BVeQ?=
 =?iso-8859-1?Q?xdVFdPWZLMzJ9fK9WjxBAEYSK/ZdCpHubddHytRcGypwHoFTnhORPlqNmf?=
 =?iso-8859-1?Q?+GZn4fU0BadIUZ+rkmau9g33YiQit7qLsD7CwnD+MUYU3eWIUON3tm8OMJ?=
 =?iso-8859-1?Q?0sah+zw9NY333POpQB/KtSTr+a7gVhVXZde6Dy8rqsH4wr1jsj/EQxuV/w?=
 =?iso-8859-1?Q?ry1S/Abb6khke6DVI9xGH/iSnZpH/oMrnuvdw2AkckK8C5OdIyRcTapJY3?=
 =?iso-8859-1?Q?OUNpryJnCMmgEgptqZmITCchdL2cM30AVS4Iyda0NcR+l49r/mnXzlmu5d?=
 =?iso-8859-1?Q?0AfM/L06uLvjCFuQ3CDCUfBIV1t1BOnBDzcrFAbUvzD3KNaaEJsZkbUUlG?=
 =?iso-8859-1?Q?Pgt9Dj3hymBrtJIonD0kBkSlcpcVuHrII4gXQuzqqV7X7xKmeHshTw2zJJ?=
 =?iso-8859-1?Q?3iLnGh5G4xDFRHVlUu8ynrFjg4oMNwZQFAzTUtjsLPH2Kb0Uxk+rU9BrUG?=
 =?iso-8859-1?Q?7Qpc/6lkO7QGcRmEjWVU54JCH0x2D4wSZSla2rvnDu/yYYhWAoJNLKruNJ?=
 =?iso-8859-1?Q?t1xot+aaab077Ci038YocaefdQWHpOL4nVgju74NqQ2ic9Gg+4/KerECFb?=
 =?iso-8859-1?Q?FdOtoUAKxAE4abKm7FGm+jKpu0jNAtX2vlEsUZFJ8vObPEGROF7i8j1uK0?=
 =?iso-8859-1?Q?VaHmddDDwwUQAnvYcr4lbS5Xrp4F6cUvLlrKcrbhsSYysKWTuwee2ZVGYk?=
 =?iso-8859-1?Q?d0KGHFnQIyZgBww0/eK5x7zpZDu9WJUTf+IqTqKoXWZMGRKIeNTbq+KxCj?=
 =?iso-8859-1?Q?dYDXrI5wIYakgCutX0cTcDJWEMCVzTna8Wx8+1h5izy2Eu/GNKg8H+k9B/?=
 =?iso-8859-1?Q?rGL+gcFfVb02zrFW8z8XdvsLgVez0asGNNq/Rq695xx9K6ur3NnO7OB29V?=
 =?iso-8859-1?Q?XNsGTMh4CICVzjRgZGEvdbwdPEZADv38GK/K4v6GpWl1oZ4uUDmOGR6FMZ?=
 =?iso-8859-1?Q?tjkIidiHgDnnOUwfdTaBV/ZPVsMYDiYnKD1QTUL51+q1KPQsoUFDnluTk8?=
 =?iso-8859-1?Q?7zEpHuUfRwIl7KU2Plcv49Kx9Nnw/TPZjT5ZLPQundoIPVdEFunTOGdw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34aea09-1a8f-4890-cfe5-08dd871445d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 11:52:09.4957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9UJ9JfM90TEdUB4WakmdVQTK1sk+nUMkeraBaMUtXAUnY+y5OrFvlU1KlaanHsuUFJL3+HvVOWNeLbZbNJtZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8809

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Handle phantom functions in iommu_add_dt_pci_sideband_ids(). Each phantom
function will have a unique requestor ID (RID)/BDF. On ARM, we need to
map/translate the RID/BDF to an AXI stream ID for each phantom function
according to the pci-iommu device tree mapping [1]. The RID/BDF -> AXI stre=
am ID
mapping in DT could allow phantom devices (i.e. devices with phantom functi=
ons)
to use different AXI stream IDs based on the (phantom) function.

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-io=
mmu.txt

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
v9->v10:
* Add Stefano's RB

v8->v9:
* replace DT_NO_IOMMU with 1

v7->v8:
* no change

v6->v7:
* no change

v5->v6:
* no change

v4->v5:
* no change

v3->v4:
* s/iommu_dt_pci_map_id/dt_map_id/

v2->v3:
* new patch title (was: iommu/arm: iommu_add_dt_pci_device phantom handling=
)
* rework loop to reduce duplication
* s/iommu_fwspec_free(pci_to_dev(pdev))/iommu_fwspec_free(dev)/

v1->v2:
* new patch

---
TODO: investigate Jan's comment [2]
[2] https://lore.kernel.org/xen-devel/806a2978-19fb-4d31-ab6a-35ea7317c8de@=
suse.com/
---
 xen/drivers/passthrough/device_tree.c | 33 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index 37e1437b65..f5850a2607 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -169,6 +169,7 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
     struct device *dev =3D pci_to_dev(pdev);
     const struct dt_device_node *np;
     int rc;
+    unsigned int devfn =3D pdev->devfn;
=20
     if ( !iommu_enabled )
         return 1;
@@ -183,21 +184,27 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pde=
v)
     if ( !np )
         return -ENODEV;
=20
-    /*
-     * According to the Documentation/devicetree/bindings/pci/pci-iommu.tx=
t
-     * from Linux.
-     */
-    rc =3D dt_map_id(np, PCI_BDF(pdev->bus, pdev->devfn), "iommu-map",
-                   "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
-    if ( rc )
-        return (rc =3D=3D -ENODEV) ? 1 : rc;
+    do {
+        /*
+         * According to the Documentation/devicetree/bindings/pci/pci-iomm=
u.txt
+         * from Linux.
+         */
+        rc =3D dt_map_id(np, PCI_BDF(pdev->bus, devfn), "iommu-map",
+                       "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+        if ( rc )
+            return (rc =3D=3D -ENODEV) ? 1 : rc;
=20
-    rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
-    if ( rc < 0 )
-    {
-        iommu_fwspec_free(dev);
-        return -EINVAL;
+        rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
+        if ( rc < 0 )
+        {
+            iommu_fwspec_free(dev);
+            return -EINVAL;
+        }
+
+        devfn +=3D pdev->phantom_stride;
     }
+    while ( (devfn !=3D pdev->devfn) &&
+            (PCI_SLOT(devfn) =3D=3D PCI_SLOT(pdev->devfn)) );
=20
     return rc;
 }
--=20
2.34.1

