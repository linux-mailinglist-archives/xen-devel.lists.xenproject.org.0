Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD65C97042
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 12:35:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175711.1500332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ2AY-00078C-RT; Mon, 01 Dec 2025 11:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175711.1500332; Mon, 01 Dec 2025 11:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ2AY-00076B-Ot; Mon, 01 Dec 2025 11:34:14 +0000
Received: by outflank-mailman (input) for mailman id 1175711;
 Mon, 01 Dec 2025 11:34:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RN/T=6H=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vQ2AX-000765-AX
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 11:34:13 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6005852-cea9-11f0-980a-7dc792cee155;
 Mon, 01 Dec 2025 12:34:08 +0100 (CET)
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com (2603:10a6:5:3::28) by
 VI2PR03MB10596.eurprd03.prod.outlook.com (2603:10a6:800:26d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 11:34:04 +0000
Received: from DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66]) by DB7PR03MB3577.eurprd03.prod.outlook.com
 ([fe80::49f8:7615:b631:1a66%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 11:34:04 +0000
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
X-Inumbo-ID: a6005852-cea9-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tth1eWm0dDDYzRC0HAe4x6hs2Xt6o2QmbhTQOr/86zeZuQaZ7AIrR47j8nVDBp4qCV30D6dIQ4ZeEE87W1zerX3f4RkA8KPiEBD4TyKH9EInKoYKy1upucdZOekA1tuS+M2RdljmBUwJWc/KmcPKhsv3wbHKOcmV9b3frNXatAkEotSdjjX7Y5lPWxz3OlvHMbapY5YmyR+KWutKeuFTvrq/sGdsFStu5JrVlr1JVMILZMkVcArIEdkcRmlfGduvs9sAacyvfoh+zQvzboDu2L4EVr9q4J6pumYwJkw8k6bk1+SPqBaOVWCy2Ej4pI6gNLUqNqi7dTZI1T7Cy/Ec1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kY+sMmVl54NGo+Pk5wX1Z0fiWE7PBAn7tS4jA5GOxVs=;
 b=Ewwq7VOBKzVpEP3/SfC14ZR40ZiWcAscht2T0AZL+cx/l8v2nkSY3usAIvxG6ATwLLelHfKRQC/iNDyPwjEwE0HGPWaHm/5LhM026tiHJk2hJQQ9EeiPcJmcURezMk9bVnO6XTaf+byvT8YddbV8b7FnGJDxUP/5/8pWxdMBKEQSCLxKNWLz9S4RhrKwQ88hjXuqkVNn1+UP4b8EPI3QUE6Ro4V1v1KHGtdWvL2ihtvsMKObEHXnsAUIezqNnN0XgFlcOULnb57tg9t7ZP2DM/mYyD3YsJ+5NWDP9M0dn6mdlLQUaYnB7aRMiInEevY147cHCWquZ1X/pfKPquAn9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kY+sMmVl54NGo+Pk5wX1Z0fiWE7PBAn7tS4jA5GOxVs=;
 b=Trh1AWjgh5j5xugfaMLr+t9lSBDALBFeyVEqV53KM3JeIh6DyQfQFbPeycP2L6p6Y3Zri4gSjoLHF+nEXw0BzhC7nKIzoSwLvL2b/ksXGMSqPjFbc2pqPPxrvFbv81DWYeT/NaeRWsOVaXc3QNwAEgavVPFCGvMkJXP2MKHmuKm8zkuVeJUTLqj5dUwHPvKoDh0aIp8vpqBVHNjsFAavVA9FrVjvS9Twf6xgqIP2U49YstvJDAZWJhH7nXWFlTBPyI/q4nKN5zEGQjeZKl4evLuHHX4arkdvljSZlkRRlpTHsW0rX0ipDIPaMiqYzRLhwOcezODf10miMVoYBWgmfQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [ImageBuilder][PATCH] uboot-script-gen: Add support for "passthrough"
 property
Thread-Topic: [ImageBuilder][PATCH] uboot-script-gen: Add support for
 "passthrough" property
Thread-Index: AQHcYrZlLhWjOcFOMESo6Ja5HoKvcA==
Date: Mon, 1 Dec 2025 11:34:04 +0000
Message-ID: <20251201113403.2898396-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR03MB3577:EE_|VI2PR03MB10596:EE_
x-ms-office365-filtering-correlation-id: 27394682-fa47-4661-b882-08de30cd8812
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?oLeDgkEepHhd8GMlzcUI3RPyvS+CG+Sgm51/Sap/x1fsFA1onXS51zIX9d?=
 =?iso-8859-1?Q?eBGdfmxre6VwriS5CAIC6mSjP2Yfj4zX3d17H/Ovm22UCK394iEdUZgbhP?=
 =?iso-8859-1?Q?gsFtPttCS1Rp99NqCMmpYYnz41iKXWRMMn8Zv5dQcXt+4QN0C1PFY+yd2w?=
 =?iso-8859-1?Q?PQ4nbAuZONVbKAU3ns9sSLmGtGsCIJx/VwQpzM2KOuj1P+2tfeZjH1ji15?=
 =?iso-8859-1?Q?NsJJQFTP2QqjYZr7zduAAGpKSB4X2agsWnmnGzQUWZlhX2VWXXZAUIUAzl?=
 =?iso-8859-1?Q?QGgbkg4OksbT8YWr6dNi4U0IpU5o5hzhA9YFVGfZ65W17PN09sMtaO48VR?=
 =?iso-8859-1?Q?ieNvUQQoTtNOMbU++dTTWuLykl8Mvlxpc+DwLNRbG42N3L6OihhO5EjmDi?=
 =?iso-8859-1?Q?p6RMdIMxcBQGGMFlQCckp12y9tmMFiaftlLOtZStu7fdnDesujaFFckGmT?=
 =?iso-8859-1?Q?serP3Q1GlD5Itb1Nf3hmK3T4goYj6fUnwTgMFgadhjsT/bz2GFpONR1Yrn?=
 =?iso-8859-1?Q?z20rRSYWJSmModYoE9ihatA3+4PGZZ4UkTJRbG4o9ul0HrpgkM1F2L+LLG?=
 =?iso-8859-1?Q?uwfx3SYwrpHYoxwPinmRCl1gNemS1iFxJ+h476kqVXH86692vqtpQ/8/Tj?=
 =?iso-8859-1?Q?zAcA/uWU1JTmtNoKG+ZTcl+wDvKLRgPFIr9qP5OFiQqu88Zv1bAf/5BEec?=
 =?iso-8859-1?Q?kYHPet5kvXijSAFprXBy1f8ET0Rydja4750NVihyKyfm6HuQkTLFwHUeq7?=
 =?iso-8859-1?Q?huLFkxEWH/pyfMWbmXJ+eCmQTJ4g59Tf8c8zRHLFXmoG6A8V0aW8GqsVNa?=
 =?iso-8859-1?Q?zjW+nw0eIuTFFgIV2lJEZUXeruCqn19CFXa/7IhttoUW9OA4PtcEbMvyLA?=
 =?iso-8859-1?Q?V91vbpy105dkxjUjmGlOAMroDwPpWF1Q5Socy+yt3ZUMbIzmI//UMuw3We?=
 =?iso-8859-1?Q?nWAocUB0HC82CgQl3S19gJXgezaujZBg/93hI1mahupl22yJciOeu/HeUF?=
 =?iso-8859-1?Q?dOmdSQwhF//PRj46zNwhNEcaKqyJNrsL1hD+FmgLC2KLzUR1lOIJjL1K1D?=
 =?iso-8859-1?Q?x1IGG8EiaE0kwVsTOnLw/wfGr2RLatcGVpZsfHc1zgypE+x3OpU7CGlOkD?=
 =?iso-8859-1?Q?jc4AJzgFFuQSw75vPO5EGM3XuiDNUtlHDohxhgrjfZ32J89A6mCxS65OSp?=
 =?iso-8859-1?Q?aQjlLF8KF9XA6/31WxrlzJZuBjFwXs/oIlk8JO2i1vbL3AC12Cm8jo/PHz?=
 =?iso-8859-1?Q?qsHAfMybHOc6piqeGfc11YUDenP4xhjC0O9YQ0YmxuW7snOUfAexAnDTMo?=
 =?iso-8859-1?Q?VVtHRJs5mVl7iGyZhY23l6wzYX4duxKDC1mZFsUFNOOwwjqbZpqLMXHksR?=
 =?iso-8859-1?Q?uwy2mWb2Ewp7smLmcaVgme/v6vH1cHxLYyIi+OGPUBhn20MObCpSw0PVtJ?=
 =?iso-8859-1?Q?4y5gx5JzwmerVuhWDnKcKZ7YT5JxWSBEKhLfx2uMjrUaKZcC3TB+TDc8mT?=
 =?iso-8859-1?Q?k6lbgH5YPRvqbXrp5uH1VgySVGCccs4YjR7XwDOQJx/eOoU+bmDltavl0h?=
 =?iso-8859-1?Q?iPyXlyo2YGTzSZqG3bWPM8/S29MR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB3577.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qShyKq2GF2B2JAcTCwYJLXkGPfXJbiQDw6mpQpZdIClwNlCluC2F7Q38x3?=
 =?iso-8859-1?Q?DQZ/miJc4HwLRgKjVjZgycj3hIWbKx50Q9WSm7afFeoXPC2J2acQ+tBpKz?=
 =?iso-8859-1?Q?PHM93a3ieh9pX8sF5dtZPqmxSy9VTatdbhPCk2bzXXckRqlt58AamSYcAp?=
 =?iso-8859-1?Q?H6EGQdkD38/DeAq/yroZ1lBdX/1PPtx6++LHpAUAMiMJHCIbMUN2s+Ew2h?=
 =?iso-8859-1?Q?o9JOvhwF6rxcLL8qmLAF1F+IyH5JIJKN6qBtXCdVsERNUzpcBSx5RJKwwf?=
 =?iso-8859-1?Q?bSwvulhxwSea4k43xSeHHy2zEMznBXFZIJoMga9W/IB+ZydZmJVmPXn2ZH?=
 =?iso-8859-1?Q?b0TG7S8/b2FdfdqWPE6MaSiSK9F2cCOO7qsIt+ABV/g6lINrJ1q7cVR5yW?=
 =?iso-8859-1?Q?yEtfYw7W7k/tcw7WkrmXaBziWnD8IDeNGXjNrq6U4cix4fro1+4eY0+IQf?=
 =?iso-8859-1?Q?cOZls9bp3lsU0cGc+9xPSY75B6C/Yu0Y2x2eCGodAsv4Zva5X4bhrYBU6a?=
 =?iso-8859-1?Q?uaz7TkE4G2J6a4EBnIIdv0T7z8g0lWXrRInMpLpoWU4jBy8rZvT0F5ic+7?=
 =?iso-8859-1?Q?7GoAqRa0LUYKjS5cUibebNGP3vsUa87uMTNpWgG+V7cDjictcK344k0uMV?=
 =?iso-8859-1?Q?Iy9A5jAUFOjwTdPsXpQO0lN84IGyKjtHaDmVHeIdZHc6acBvMzn4AbdsoM?=
 =?iso-8859-1?Q?Ct1aOgj1M4KYffTLtCabzhW8JsV1wsppwMfT7axpWkqk8vMi+UzNk28zm7?=
 =?iso-8859-1?Q?JeHCYwf6jQlbw4ydYe+Th4Db3eMpAhn3GV6EwRbNnUAd5yPGcyU86DtNRI?=
 =?iso-8859-1?Q?H4cTe4dbCGK2jPo0a6Kl2P8f18jSl+ij/ltwE6pDxSaVRazHpozIo65NLG?=
 =?iso-8859-1?Q?ZUPpnRVjYauP08SqWDoFseXJhuKgAq34VhI50oDulk+F+2fGf9oOZye/SK?=
 =?iso-8859-1?Q?MksocttSOWGhaok6YJZF+pWBAGkmDgKl0XAh4q6EjaanHaQWRJUsEA456k?=
 =?iso-8859-1?Q?yfmSYWWcrCCBLpjPgfYPkj0IA4EzRu4vkD9+e+Fd0Y8NVa3LGxLxcCc1GP?=
 =?iso-8859-1?Q?gbjBejxlgszFPlB1l2q2kDXfdgRLStLfCeet2OKLUBeAnrX1RRbPZt61Nm?=
 =?iso-8859-1?Q?end9fgni6/lp0t7MgEod8CgAhjDrQoo+Jz5CuyCzJkYNPiFvR/tL4IK/4y?=
 =?iso-8859-1?Q?fmHwAjZwVn4+N2W8rrgvwcICSOq1yYUjgkcBLc1lNwODhofQZDXztGoXAo?=
 =?iso-8859-1?Q?znCUs1oVMnrJr4vlBV9xtLDtUbED1k+pbsz777JDtaNunuvz3q6gyPSR2n?=
 =?iso-8859-1?Q?cmAVKMfZqmZ61hTbzYKvJwyMQkH2bITOOqxGY8WfQi/NXfc8zSvaoEZDfV?=
 =?iso-8859-1?Q?KN7VWO+GrupQk+woXG561ZY7lWcQamff7TUtY6ivxn7KwtJFyS0NNwyBWo?=
 =?iso-8859-1?Q?o7pFt1DUP+g79yxjartrcx+5Ykcq1FCM1n0GQFm2jPxzibQSghK/Pc/ulb?=
 =?iso-8859-1?Q?c3hSwjIHU6NC0/T4exKk4V+jcex5XxaxjeKCCywMZST3LH1OJDBOtBfHuJ?=
 =?iso-8859-1?Q?Tj8TRzXlNhSqUmSSyGYcYB4Q77uiV/mEjuHmL5GNoT3wAzFjfRMsy6XoGj?=
 =?iso-8859-1?Q?J7zlwpEYWZTeXsQf42xWOHe/3mjBUxy6Ag/I9NB+aRxfLiH739VnwldnkU?=
 =?iso-8859-1?Q?6LyaMsaZeGcbmAG+deM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB3577.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27394682-fa47-4661-b882-08de30cd8812
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 11:34:04.2132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eojb2lKqpnOJ3h8bo2PdkWbQLrLUUcLthJ7tE1lmtg912Oe/cMw0OGgsEntRose/qeuzmYe2kw4NnHEikZE4RkIGFxFkDSeDlp/w+H0QtL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10596

This property is used to grant a non-hardware domain
permission to use the IOMMU, which is a prerequisite
for device passthrough.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 README.md                | 6 ++++++
 scripts/uboot-script-gen | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/README.md b/README.md
index 0063747..983cbbc 100644
--- a/README.md
+++ b/README.md
@@ -338,6 +338,12 @@ Where:
       assigned to a regular DomU.
     - An explicit non-zero ID cannot be assigned to the hardware domain it=
self.
=20
+- DOMU_PASSTHROUGH_PROP[number] is optional string used to permit a non-ha=
rdware
+  domain to use the IOMMU, which is a prerequisite for device passthrough.
+  If set to "enabled", the passthrough =3D "enabled"; property is added to
+  the domain's device tree node. This option has no effect if the IOMMU is=
 not
+  active.
+
 - LINUX is optional but specifies the Linux kernel for when Xen is NOT
   used.  To enable this set any LINUX\_\* variables and do NOT set the
   XEN variable.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 78a731d..d18ac55 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -509,6 +509,11 @@ function xen_device_tree_editing()
             dt_set "/chosen/domU$i" "domid" "int" "${DOMU_DOMID[$i]}"
         fi
=20
+        if test "${DOMU_PASSTHROUGH_PROP[$i]}" =3D "enabled"
+        then
+            dt_set "/chosen/domU$i" "passthrough" "str" "enabled"
+        fi
+
         if test -n "${DOMU_SHARED_MEM[i]}"
         then
             add_device_tree_static_shared_mem "/chosen/domU${i}" "${DOMU_S=
HARED_MEM[i]}"
--=20
2.34.1

