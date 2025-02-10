Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D47A2E974
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:31:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884565.1294324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR49-0005hA-Mh; Mon, 10 Feb 2025 10:31:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884565.1294324; Mon, 10 Feb 2025 10:31:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR49-0005e8-8c; Mon, 10 Feb 2025 10:31:01 +0000
Received: by outflank-mailman (input) for mailman id 884565;
 Mon, 10 Feb 2025 10:31:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzWh=VB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1thR48-0005K1-2S
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:31:00 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2608::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16e87567-e79a-11ef-b3ef-695165c68f79;
 Mon, 10 Feb 2025 11:30:48 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS2PR03MB8977.eurprd03.prod.outlook.com
 (2603:10a6:20b:5f5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 10:30:44 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 10:30:44 +0000
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
X-Inumbo-ID: 16e87567-e79a-11ef-b3ef-695165c68f79
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lsUDKoQ4R8a+8EYGMzb20vH2aHFaJ4Hc3sYpYSDOCTvMYt3uFOUhOAZMlNTOXQA+Z37fPmE3jWSTEoBP6ytDW+lNILKJAwMTQVneBA3/ctgtr41YcmAYROQJwWIEzW/nMUAxOsxYW4Kr+XGSXUTL5hiuF59WlvxKBebimcrC0iO2EqYD5G8vL/9g9qbDxAryURhSoAq2FJk2y1FJ8p2mrSYL/XXcsUDPKgOKtyjktelckklz/X2MMpJ2jB9fBfopO9BYpaNqV6bceE9GYkurieaGNeR1rUrU3ruel0qanmR4l3feKuPnPQ5TmVfyaQw25nZHf33Nw3VkNvPUJnI1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCW7C8b58Ul2Wopo7j6ZkTpn9ICZ3z4mFKy8XEwA5Cs=;
 b=A/B4rntYAq17uQfEDmxbGlL43T9o4zFr+Iu0fK3n3LWC1OJMtRPBFFYqGzxb677lQHdWGcgN9/Pd9/dikrOa8PyQ2VNXzJjSmCaLK4KtXf6IiWlB+8RtQKEcz/Fm3Y+vvQ8Pzc9TGjUpm9SA+NLYt5EN0xwggLJezF7pGo6PVWc3TPlzaaC+320lSThFbO/zfNi03LO2WPqXsjKMn3IqOsi6GB4oIg99YkbcOhF5GHA6bAYajv0tzGQRaTqvAHc7IuLm3fiPQe4HdbOn+3k014IEKCVIjq9mAQlgywjz45Le+KytMwh9MISBmX9k1muYihVU68Y3IZ6EU/keoX7OGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCW7C8b58Ul2Wopo7j6ZkTpn9ICZ3z4mFKy8XEwA5Cs=;
 b=SGa0Dr0P6ggvyxB6GVErgBiq+3HTi/42dwRrAhG5noDAZXKfej5WhMsAuJG+h8HKVVg3s2A+iadGCFcmmS8WrQbLxG6YcimPdhIVyh/aDDJLb0zICt0oTJE8+NfVr/HYXiZjPVnj/x0iqWN6Q32Tv/9iVYUv3Hv31SYT2s/mE+Kk/Pajb8Tr1PLUUvQ1I0gQCavgG/awCytiAwoYNcW0aHrLLMAzYTZSe3/9OgDP0y/HpiB7MYTqUzqas8VGociz7ed8UP1dkpVpsvPiIxzAifNG0mmrGBhNAx9I2pINObGENKKHr0Xb0rhcsmloYVH/HpL+amrH+uns6xmrjW6tnw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v8 3/8] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Topic: [PATCH v8 3/8] iommu/arm: iommu_add_dt_pci_sideband_ids phantom
 handling
Thread-Index: AQHbe6bXWR/R/96qAES/+u91wAjzrg==
Date: Mon, 10 Feb 2025 10:30:44 +0000
Message-ID:
 <35a8a688dcde59649ec02c13e0c7a61d1381f836.1739182214.git.mykyta_poturai@epam.com>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1739182214.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS2PR03MB8977:EE_
x-ms-office365-filtering-correlation-id: b0087552-dc8e-4130-08c7-08dd49bdf9e4
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?16LNX4/MTYjBIS9218267LfHRFlcUZdLLiLHzHJ/LieDxT15+3xd9E7EY4?=
 =?iso-8859-1?Q?kPk+Nm0OdNvK5AoUZYs+EMFwsMUEnH/PTT32QcoWuoolbdjN11/kDo0uXo?=
 =?iso-8859-1?Q?b68MiaJi7PeGq5iUmsRi7nMDBbtBw9I3ulkqZQrUzd+N9AwFyObiaKviPi?=
 =?iso-8859-1?Q?lXKvqdMlXgNgM+V9Nv0nPmMdLa97fOwa6vUx0xt0ArEBFod/ppo/ANs8dw?=
 =?iso-8859-1?Q?EWfz7zegMz9WBD9a4rSK6JzzrKJqi4q1tDXHxDb9xb5rgVjLa2oPk2xAk1?=
 =?iso-8859-1?Q?ybo4wOXi9I76k6ymEgkT0rXv6hnIzJwC++i10UfdkfWwtoQsy2lH9SCzyj?=
 =?iso-8859-1?Q?9+5mtuNB1pLCbBLvGmAcRgGkL9l2fjEu/vpXq1i9KpBN00Q89e+Q+3QxXW?=
 =?iso-8859-1?Q?1XGUzCRIHDL6EJEtP/EadkegWJyUAEO+UHby807yryrUJfDpGtphN2AP3M?=
 =?iso-8859-1?Q?FEzuzwCRe+RFPToSlpRVJ89QvsuVvrAauDG4OSbRf9Zz0z0oVktsv+Er+Z?=
 =?iso-8859-1?Q?ljPzvHqk7hVp7VUYF1wfID6NGHehjm6C7U4RgjIs1+A32T0A5ZSELl9sLo?=
 =?iso-8859-1?Q?wVrrI8ar6HgvZ7cM+akINHaO56ZTHpibW3gdiCc43GKXGvnBXQummgFP+A?=
 =?iso-8859-1?Q?7uDE79BT8lerqMw9eWNf/X31g5S0WfSq3WkIsCqR9ciokp/gCQVJMVHore?=
 =?iso-8859-1?Q?7ir3vTLhE0zFy0L4JS38AnlU4y9TNfTXcnHpmI3qwBXa3GRro0wrsqlEAt?=
 =?iso-8859-1?Q?xOXay74yAyV/P7ALyB67S0zFEfccl0Rc3cAmrDXfuZkoqtasdeziCaVVpG?=
 =?iso-8859-1?Q?E7yLy9XjgFh69qkx+IeBIzDzyvPRreVfzbUIUhdZjYt8W7xADQkUSxw3ch?=
 =?iso-8859-1?Q?JtB/ATQN09SGQ/TON8moOxaCtRCbwLjbAYlccmDroriUsJU6Uv8Q77w0YI?=
 =?iso-8859-1?Q?Zho88HMB+s50tnMyhkltBY4f3ZPa2J2/hKNfvTcM0rBbSI3GmUO8VlMirn?=
 =?iso-8859-1?Q?CS3wgpoCEKAlXkO1WlWR7Xf1597GxbO9G7jgOyKvDrEShshPYyAXV0fht1?=
 =?iso-8859-1?Q?iBTx2bBo6NWcjlVIUQkqUReqAxM9HZyo7LhFcD/n9mn1fLM9UD8XWcZZZL?=
 =?iso-8859-1?Q?0poF6DzBJ+4Sl6O1972h8O1OfT1sHpxLWA3LDdZvSSq5a1q+JEVOBItO1x?=
 =?iso-8859-1?Q?4LzPfTWp63nkfQuduPN7fI5JEJZSi8JylVIuFqR619Tk9tFUKmv9ZhzEzc?=
 =?iso-8859-1?Q?WXpuG25sumABGXsBt46nWdFB0tbQBg6SyWftxif/b9GXfKcgf4QtikntZ4?=
 =?iso-8859-1?Q?WWaskna26kZSrHtPt+R4yp5uIWtMQW6hpN9l7hQG7ImV6w334siKmT/iJi?=
 =?iso-8859-1?Q?Kq4imCkqwAcZrffx0RuOfRaIChVlROU7yqeDPPWjkhddvnc31o3s2OuOQp?=
 =?iso-8859-1?Q?F7H+f9b1bn8vUL7xYeCHZc+wNjtsec8LIxCpWChOJKtDhfm6zSZbmtS6dh?=
 =?iso-8859-1?Q?i85cWFfVYfBSrnRQ0Lawpg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?x6oyQJW+Yvt6JKBBlw8pCO5ZNb/aGMallLMK5hCpdjJFLV7h2pxl+zGPF4?=
 =?iso-8859-1?Q?AlbX2z2efGKS9c6SrPnRIhi49KBCEYUE1vfDEKE8Nb9a4NN/7DN7ZiDSsO?=
 =?iso-8859-1?Q?BkqGgSxHnMhAq+c3wqqYiRpAa0UydKHqSqEig8R1QTYMZY3ZUoboooAMAO?=
 =?iso-8859-1?Q?iXp7wgE90i1+3B1iWcb/OInQAj2qPkB/oCDfzdqtiBnUyZhBr4kGHBvG20?=
 =?iso-8859-1?Q?I664F0XWZBTsWQRLGPNRlJZ26kAHp7Q9Ktx1HJtPSZaAb6w4DfRyMXOb98?=
 =?iso-8859-1?Q?zugNKyTT+9Q9Hkj5VPe5hKgQcHZcPLylZHQkPuhrZjmmJyNa9W0PMyhXHw?=
 =?iso-8859-1?Q?GmCf3NUW9XIHFETtzDqu1fCl0l4CKZiTalNc0JrE8qsUoaOQkc7NCqlkTp?=
 =?iso-8859-1?Q?1kY1YxS22vpvJrijBtDuCAYbeGCIas0Ag92/2XrHwPF6U5j1pWfQUcqWti?=
 =?iso-8859-1?Q?Txemld+PRQTqdBBTZBEpRtRuoPqOZKuS0RLLH91Yv3Y9DzWIWOTUJ7IuQY?=
 =?iso-8859-1?Q?2qsBSNRoiSApYXO7ZIUpYhmbP6jP7w5r6TeuNl2ISGv/2+uDok+UTufIRl?=
 =?iso-8859-1?Q?mox4bPeTW1ZmO2EyxkykM8X7l5MUbMIsS0yGqiRam8BojJyUJfzp+riN+g?=
 =?iso-8859-1?Q?IGiC+U/u9mTRaoWU6OyuFBjFQSBDmtDQZ7N3fvxx303izvTqizeESrN+7H?=
 =?iso-8859-1?Q?eL3QeqkFQB+Eb/usFcqtlVlIsdTaUB2tTr6m2+vgAlrujQPw9NZUdBbrAS?=
 =?iso-8859-1?Q?NNhU86gaP4iDHMvNBty1BoISCLdmjseOQrPCPpAYBwXJV5caOrC1FnYxCX?=
 =?iso-8859-1?Q?gn9KTwMTZ44v6atKd4Bk1ijT3Vx8iiRNuodlunaTv0V/YUOHFfsgQmLnPb?=
 =?iso-8859-1?Q?IDp+qHiFUOPRbINCZsGcuZT6XYOCydyhqIFs/M7NrWgU18rfL1s2chv75s?=
 =?iso-8859-1?Q?sbn4g01PQkKZ+MSyOHiZSo+2UmodiY/XOmXEmyZIEQAQoqQPAYgneUfSRG?=
 =?iso-8859-1?Q?Anp7zmilmR9B3BGNNP0hNXpRP6wb6xdJfN/nvJDiYITrpkPDTg2SGjD3ia?=
 =?iso-8859-1?Q?gAk/E9YRC0I+ElOWx4oMYFIyd/o4OkzVR0SnJ/qMy0o4Q8tXAPOAz+zhMQ?=
 =?iso-8859-1?Q?S5EoXfM9Zed/HXNyeBlxSR72OG3yWyNc8HbsL+xU0cKIP7xjECCEnokCKJ?=
 =?iso-8859-1?Q?rPsg6nuC7rJnIuR/QTlx+LhWB8P064dbXWaYos0/+wrhBA22/fMrsylStf?=
 =?iso-8859-1?Q?+oEizwLKtsoqq8HQ7Mmxef6XOwb/6h7QsgGLvQDYHS/ZaIwFNI19pEmZH8?=
 =?iso-8859-1?Q?z0qpIZUPAWjoolVJfyubVBu+drMMOuJPeRngcW7YHnVsGxg3ch8zwvXe6c?=
 =?iso-8859-1?Q?Fb9OV6BfybSBfU6+LU4ok4CiqaDInxTR2GQrv+nyPattIaMvjE2mPzUtNU?=
 =?iso-8859-1?Q?GJIgd/E473J+j4YwYLPaeLSE01UYj8SlvgsXQYo2+NNtlVGtcxUzlvOrbN?=
 =?iso-8859-1?Q?e2FVchUHTaaqh6YU9sG697K0X7qcHpQGlt8OKFFhpfBN+E/nObxA/L4nJ7?=
 =?iso-8859-1?Q?+h1iqazW4eNgx1k6wtk5MLtTHTGXOe7ugWVJT32KE+wJDgQ+fwbPv13o3c?=
 =?iso-8859-1?Q?WfISmPEaN1okHYxVKXcmInbZDKvt2YOSL2XOsDm4j6MH5TZ0FvXS0Djg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0087552-dc8e-4130-08c7-08dd49bdf9e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 10:30:44.5620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LQX4MT3lv6VuUCpPrQEnIZEo3M48v/86vNLeRTrOSBZL5iFK7wrtbcYhLJuFy7tcDvq3mMACCrEN9ANanBmJ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB8977

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
---
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
index 065fbbc0fd..fed4fcde43 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -169,6 +169,7 @@ int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
     struct device *dev =3D pci_to_dev(pdev);
     const struct dt_device_node *np;
     int rc;
+    unsigned int devfn =3D pdev->devfn;
=20
     if ( !iommu_enabled )
         return DT_NO_IOMMU;
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
-        return (rc =3D=3D -ENODEV) ? DT_NO_IOMMU : rc;
+    do {
+        /*
+         * According to the Documentation/devicetree/bindings/pci/pci-iomm=
u.txt
+         * from Linux.
+         */
+        rc =3D dt_map_id(np, PCI_BDF(pdev->bus, devfn), "iommu-map",
+                       "iommu-map-mask", &iommu_spec.np, iommu_spec.args);
+        if ( rc )
+            return (rc =3D=3D -ENODEV) ? DT_NO_IOMMU : rc;
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

