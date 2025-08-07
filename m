Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6E0B1DD22
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:32:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073353.1436418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P6-0003CA-N5; Thu, 07 Aug 2025 18:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073353.1436418; Thu, 07 Aug 2025 18:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5P5-0002oZ-DY; Thu, 07 Aug 2025 18:31:51 +0000
Received: by outflank-mailman (input) for mailman id 1073353;
 Thu, 07 Aug 2025 16:59:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5oaB=2T=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1uk3xo-00076W-3P
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 16:59:36 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e4cf57d6-73af-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 18:59:34 +0200 (CEST)
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com (2603:10a6:102:ea::23)
 by AS8PR03MB7336.eurprd03.prod.outlook.com (2603:10a6:20b:2ec::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:59:29 +0000
Received: from PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f]) by PA4PR03MB7136.eurprd03.prod.outlook.com
 ([fe80::36fa:728b:e216:6f6f%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 16:59:29 +0000
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
X-Inumbo-ID: e4cf57d6-73af-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdARz9YZHH9R86xxx+WlN/widb1iN5V1vq2JUm9qXHfLlqPF5o2ePgjEDKlToNs8CK1xdLhKYdbXNnpnFTSq78wQD31sUrxppnYfS/gOMh6Og9EBf0vrETH5i5ArSGL7DLbxvh3MNxk4b1kdkIl5TKE3AycgNvDz5Y++o1dIziKDXCTE2a/YMPfC8bDS9oefbGKQFsIX17MJHaeVnBMS1r5eaHCEpqK1JThFSvZcnV8Zp0BLS+Kbxa1mcLbYwxePIAyLUQjK11J71uNVTMm88IL20nBs5tkqDS1H4f+VG+H+7Flq6dGEwqHUVDne63QnFVO2QOzvFspwpHf0TH1O9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5OBPEBLSadQAGgVsqDpXNpr3niqH2AxeuuS4TFN9R9c=;
 b=I6Wsa0D3pT3z/2AtJ6TdZtCVrHeHvNQXMTIjo/3FfNUtjQ0Jc77idqILHT5nLfkc3/8IIYiEY20xmRZVpylv/elSgcG2pyET38CzknjKTFLMSTtFfVRMppF/D9GerDGhK+NnQ7cL/vaP97+1tnZVUYFWzwDoIsRMNQ/GniPhnJJFh9f21SIN6Darua3b3XR+xBTD4pDThozR/dMezUAx8onVHPggG/d/lUnAzSNHYH9MtxHRw831NDoRhEcR1AJhyvfj/IZOuatdlJvHwImelHfCHA9Q+1lzpbB5Di84gdtfDlNruTsmcoMstvJz78thEIsr3P4BYG2gdRevUpUK/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5OBPEBLSadQAGgVsqDpXNpr3niqH2AxeuuS4TFN9R9c=;
 b=U2hsHvVkd2EWlm9kQRhAeMk5s6ufVWjWcstZDkLsZu998tac8xfYXoR4fTcxOoDG1KVkqaKc7zAZlyvr+xOhr3HWM/v4kNU9luYtfNIO4HG4H3/MFbI2xNHo5t4XTVwzT435M8eHX2F8C5LEmxUYFlSlZgFIx3Dd5TLVrDib9zMHpdv8ydm98IA9x6qzoOyZv3il4AdP1jP3ZPR4VDn4O7/+k+8Mjoj71QeylrSUJ5eQp8ym3HW2xC3H+g98zMsWagf7OdvAWaQmRcGWsi3yuyDmYutAYFM21i0znlo5ihNW2ogy1OplHfRUrqNVbbOyTeane14qZ20ww6/IDV49pA==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH 14/20] xen/arm: vIOMMU: IOMMU device tree node for dom0
Thread-Topic: [PATCH 14/20] xen/arm: vIOMMU: IOMMU device tree node for dom0
Thread-Index: AQHcB7yjVZWSIfKg2EWj5KqbQYkZRQ==
Date: Thu, 7 Aug 2025 16:59:29 +0000
Message-ID:
 <b723bb23e0ede21ca312a2a9f3c7db00ce5e193b.1754580688.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: a27e1c5f-8182-4af8-bbd1-08ddd5d3c619
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?vx8ht0I/phsmPbDtWLtomODWn758u2VW0HTy8Sb9vT+iycMWFrd7xV9aqK?=
 =?iso-8859-1?Q?p2gT5fG0NYdQEeyDEm7uFRfi6ntUd3H6K2uvcwlEdW0XkWGyY5HP8PHJPD?=
 =?iso-8859-1?Q?SlyP/dR6Kh0pnpIYpa5EvLZPp4N0dMjBncSqfLlTDAOaH28+/3w+nraFTQ?=
 =?iso-8859-1?Q?gls3uTUfflRPTAkNWcH1XGdKptjho0XNGT/Ohu/WPK7cD03hCsDlH78/GL?=
 =?iso-8859-1?Q?AHemYC7kMEB9Nte8xLCzlNIFOjwu2K3GRlM5MLoNlyZu9SaAmq7Auan4Z1?=
 =?iso-8859-1?Q?J2DbCZN6k2U1lBU4TK0btUZYYp+uA9NJEdQtd7QmuGJvVLcXjVCy+f4xcU?=
 =?iso-8859-1?Q?yqnI9i/H8YUzTXyOKTieAYv7fBGom9kdudpRfgWro8kQfm1Fqyv82LIJBz?=
 =?iso-8859-1?Q?H8jF5Zk6U+m5d+79pI+WsL6UkMfu0O6c4MF7Zj1fV3AOtP/uJFEKtdOG1z?=
 =?iso-8859-1?Q?bOPqwVxMJTQlQTnynKP7LCiiOf5TZ2YSszwqDeINsSGv7GhwjmNrrDFf4v?=
 =?iso-8859-1?Q?eQHf4plqZLM3Nz5hVg5UUQn5mDzPhLVhsgSaR1vR+DvszDfZ3j4dpnK2Ct?=
 =?iso-8859-1?Q?bA5FjgPh+8zypya1LwVp/qn12ZevDtuDM/kEeXRTORxeHPqJmuMZmFIhjl?=
 =?iso-8859-1?Q?wlUbsSH+yTzypYX42r3eQBBRjH71O4Ng0UZXHBUEXvM+9fGE/i7Y6Oto9e?=
 =?iso-8859-1?Q?D8vVYcYxBMdJ5zzuxF3G09QftzOLleQ69G+Vvk6ZUlqOSHWQrKiNGq+6zm?=
 =?iso-8859-1?Q?C2ruHjZ5X8KdHe3TZIwtcox8BS4bcmaKSrTl/Zart44c5VySB/Zezu1o5O?=
 =?iso-8859-1?Q?0fOT8xI456YY4mau0uEP2mXhXMEL9+hFUPZ/RSu8mLUg/sj8MPXj2Abbkx?=
 =?iso-8859-1?Q?CfmGc/35pujBZkjhPhfgEf3pOpeSAaYs95B4FfN/cbJJiwrR3JSyv3VKra?=
 =?iso-8859-1?Q?ge4NAvxQ9Bi15eYyhb1Hpk0c4rwyHYUSwmrDtlxUqxkgngLYzMFp8IkKs1?=
 =?iso-8859-1?Q?MbzEjMuQO7A3bod8XYX70dU0b4F26ihltooGlEqD+N9wWi2/hFKcwKqW0P?=
 =?iso-8859-1?Q?Z7tLlQPWi1wJ8+0AyQ2c2BV0B1AaWa8eBxpOfN784fy91ht/Wso5LyqUJZ?=
 =?iso-8859-1?Q?CvdgnH/NVeiZC3IWIStBu2M7/ZOO6ZCKybLtKzXcra05XA164luRYlDW8Z?=
 =?iso-8859-1?Q?8Z4PKzZZ/AMuz6zmTmA0c/WPbi+jTbWHffLgUc7Yea1VIHvYVhhOVaM+HR?=
 =?iso-8859-1?Q?y+avjHS4a2kDuXeSQUTmRYbX3EuCTjLGEqxznrIqsn5a0/Y1Z9w+CtCP3D?=
 =?iso-8859-1?Q?jqGUmaAGZGNRgJcUIrg0UItvFTykyLz0LtYHV3VLqmzB1h7IfBaJ0+yfIi?=
 =?iso-8859-1?Q?p2KgjaJrgt9mzInv3tjLEWukx4Idd8SoAVXwe4dHtAHXWqtIIUTXp8VLaZ?=
 =?iso-8859-1?Q?YCdw4j6F4Zo8ykIMEOBcySmoyrWLTh9turc6Qx1xeAUAU+aPUI0T7VuKxA?=
 =?iso-8859-1?Q?3lSqt1n/SmpwIUQhAgLo6KBzUUwACNHMJi471en1et6w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7136.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?HgeC1+Rq4fhKH58OPL4SIJoM0r/uOh/Ti4qFKBt31u5vEoXK5Gu4xeG2Zv?=
 =?iso-8859-1?Q?dGp9faSGNuFUjZe87n7Ri32hLmAY3F5BJe7/9mzDAvQb59375vc5MO0yp3?=
 =?iso-8859-1?Q?rSOUHRB7GUUy1OkzjPgeV3JVXgGWESp9bivHCRqcbydsiD3VPVHr82w6KQ?=
 =?iso-8859-1?Q?AY9BecfVJdYfu8FnGCpWMGcCKqdHuFIZsUF5fKfnkt7WU+Jle1EZ7f84tQ?=
 =?iso-8859-1?Q?qA1f5EK+EEyW/9tbneDtrr02EOte069+ogK6Ivm7t34b1cJHSDKgIQ8egG?=
 =?iso-8859-1?Q?GJL95KB+z9aMP+H5K6aP0uHoXStow4eM/bt75KR6W5zk7+ZlB4GgOkS3RU?=
 =?iso-8859-1?Q?ODWXZvmFr/6OvZXV8oXMx8KPWnoXWDlg06rB8RGvfegl8ghP2iq0gSqwYk?=
 =?iso-8859-1?Q?ONmz+vdDgHaMB8D6zu+aQC+EDvBjzRWt7rDserzvgaYT8iqnH1rPCq8P8A?=
 =?iso-8859-1?Q?EWaNHlh8ZQBYBqO3q9vOAH+YD2S5gLe+w7WBgcfnieC3S3phZsBEG3/W0p?=
 =?iso-8859-1?Q?DEbG9/tr28xUMTyEdwQ565kFBabavx15dNpxaHmVNNYYAfAoRuBEzrWLuJ?=
 =?iso-8859-1?Q?WvrxCHNKgusTTQcdvPqXmegwq1s/bcjlQM2s54/lkJizc7P159E3i0hMFe?=
 =?iso-8859-1?Q?fd7jrF/DrBMmcviB+NoQ69/h4sw0T8jVytTpN6ebW/JrRDEkKkOr1zt365?=
 =?iso-8859-1?Q?nfDnJBxGYwmXTAlIW9pqJzw+xFtZlw+KT15hk4yZL8H7zj7DSQtp5xotc2?=
 =?iso-8859-1?Q?Lf6THRkbhqEBjLBaCl8k9EpUJdkZ2uf+QuaeOtTcQvPb1dnQjYYsAyJAIs?=
 =?iso-8859-1?Q?HUsEBD0woZR7/CtrGkgIoeUksGammS4+HrcrpuQwovvYu3MrmHvBRPwsrp?=
 =?iso-8859-1?Q?y1Hc4l9Ubg4oDPQa0/vjJyIXnWy51zEzeK7PRb9c9DLtswImuv36hlev/i?=
 =?iso-8859-1?Q?u+6MoJ9r87Y7uEyQYcXJqjDHDm3JdoShZt89g+rDOPjSfP1Z2zGha6Jx8D?=
 =?iso-8859-1?Q?y6wgKPBwTdKLOU1ebg987wAh5mzSEaUY6OuCHoYWJDAv4juM+M7JrQAUG0?=
 =?iso-8859-1?Q?Q55SZbwmnvnBNA5ToziVE6pjB1xG8hvgc7xuW01cLVSlNsUaOk1kBRlmDc?=
 =?iso-8859-1?Q?4eAfmkrq/23u2651DNiG8OFyN8fZfoUuOaVDXwyHtxPo2mZGhA1ATBOCEX?=
 =?iso-8859-1?Q?BIYlkZudPzx6zLT3j0GTMPJ1Sw5OsPQoQZQhSYBARKglW+VwAqSRfW2wN7?=
 =?iso-8859-1?Q?+Mt0EVVGB7QG5EphX94y13QviXq6oXEJrcaFL5YU3xv3PFYdsdwAAuYxpA?=
 =?iso-8859-1?Q?LjuPWmWhR6zpeH0RdQOY5Kok0/t0FSr9GSiqzDbCwnzfWcacmjpu6KAQqr?=
 =?iso-8859-1?Q?6Uc2iG2fYfH92y4ke2+ch/NFMeU8N07RWoW0Rbk2noVbkXFddjRG+ZtPWS?=
 =?iso-8859-1?Q?1V3EgP7UD9tF3ErcEIQQYM3CLyf71EOFLuo6kiU3d0wH+OrsJPsY0NuykQ?=
 =?iso-8859-1?Q?YGgZHp9Ke76/KIwXMeUH4CO6lWdXj8aSZEDgPqCt7ZdMOFrBWEJMbdoA8x?=
 =?iso-8859-1?Q?6r+fjM5MZZ7rVockg6uL2qePs4QfpXJs5mVExOY7EP54t9JWEt3OytmDdy?=
 =?iso-8859-1?Q?YCtdGW161p/dsu0dQP+FwQPuB3NM6y7pml6d6/XxRCHJLdltWT+5FQmg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7136.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27e1c5f-8182-4af8-bbd1-08ddd5d3c619
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 16:59:29.4780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X4I64MS3a30bM3UtXqKGwkzKQm2Nj/vxTz/y/dMkPnJKOltLPi410wfxJqZLvNJ/iNdXcEEAcBcoFS9vMyJ0Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7336

From: Rahul Singh <rahul.singh@arm.com>

XEN will create an IOMMU device tree node in the device tree
to enable the dom0 to discover the virtual SMMUv3 during dom0 boot.
IOMMU device tree node will only be created when cmdline option viommu
is enabled.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Signed-off-by: Milan Djokic <milan_djokic@epam.com>
---
 xen/arch/arm/domain_build.c       | 94 +++++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/viommu.h |  1 +
 2 files changed, 95 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 9d2b0ea928..aa2b3bdfcc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1559,6 +1559,95 @@ int __init make_chosen_node(const struct kernel_info=
 *kinfo)
     return res;
 }
=20
+#ifdef CONFIG_VIRTUAL_IOMMU
+static int make_hwdom_viommu_node(const struct kernel_info *kinfo)
+{
+    uint32_t len;
+    int res;
+    char buf[24];
+    void *fdt =3D kinfo->fdt;
+    const void *prop =3D NULL;
+    const struct dt_device_node *iommu =3D NULL;
+    struct host_iommu *iommu_data;
+    gic_interrupt_t intr;
+
+    if ( list_empty(&host_iommu_list) )
+        return 0;
+
+    list_for_each_entry( iommu_data, &host_iommu_list, entry )
+    {
+        if ( iommu_data->hwdom_node_created )
+            return 0;
+
+        iommu =3D iommu_data->dt_node;
+
+        snprintf(buf, sizeof(buf), "iommu@%"PRIx64, iommu_data->addr);
+
+        res =3D fdt_begin_node(fdt, buf);
+        if ( res )
+            return res;
+
+        prop =3D dt_get_property(iommu, "compatible", &len);
+        if ( !prop )
+        {
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "compatible", prop, len);
+        if ( res )
+            return res;
+
+        if ( iommu->phandle )
+        {
+            res =3D fdt_property_cell(fdt, "phandle", iommu->phandle);
+            if ( res )
+                return res;
+        }
+
+        /* Use the same reg regions as the IOMMU node in host DTB. */
+        prop =3D dt_get_property(iommu, "reg", &len);
+        if ( !prop )
+        {
+            printk(XENLOG_ERR "vIOMMU: Can't find IOMMU reg property.\n");
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "reg", prop, len);
+        if ( res )
+            return res;
+
+        prop =3D dt_get_property(iommu, "#iommu-cells", &len);
+        if ( !prop )
+        {
+            res =3D -FDT_ERR_XEN(ENOENT);
+            return res;
+        }
+
+        res =3D fdt_property(fdt, "#iommu-cells", prop, len);
+        if ( res )
+            return res;
+
+        res =3D fdt_property_string(fdt, "interrupt-names", "combined");
+        if ( res )
+            return res;
+
+        set_interrupt(intr, iommu_data->irq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+
+        res =3D fdt_property_interrupts(kinfo, &intr, 1);
+        if ( res )
+            return res;
+
+        iommu_data->hwdom_node_created =3D true;
+
+        fdt_end_node(fdt);
+    }
+
+    return res;
+}
+#endif
+
 static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                               struct dt_device_node *node,
                               p2m_type_t p2mt)
@@ -1627,6 +1716,11 @@ static int __init handle_node(struct domain *d, stru=
ct kernel_info *kinfo,
     if ( dt_match_node(timer_matches, node) )
         return make_timer_node(kinfo);
=20
+#ifdef CONFIG_VIRTUAL_IOMMU
+    if ( device_get_class(node) =3D=3D DEVICE_IOMMU && is_viommu_enabled()=
 )
+        return make_hwdom_viommu_node(kinfo);
+#endif
+
     /* Skip nodes used by Xen */
     if ( dt_device_used_by(node) =3D=3D DOMID_XEN )
     {
diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/v=
iommu.h
index 4de4cceeda..e6018f435b 100644
--- a/xen/arch/arm/include/asm/viommu.h
+++ b/xen/arch/arm/include/asm/viommu.h
@@ -19,6 +19,7 @@ struct host_iommu {
     paddr_t addr;
     paddr_t size;
     uint32_t irq;
+    bool hwdom_node_created;
 };
=20
 struct viommu_ops {
--=20
2.43.0

