Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF3FB039E5
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 10:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042711.1412794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubEui-0000CC-MO; Mon, 14 Jul 2025 08:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042711.1412794; Mon, 14 Jul 2025 08:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubEui-0000A7-IF; Mon, 14 Jul 2025 08:51:56 +0000
Received: by outflank-mailman (input) for mailman id 1042711;
 Mon, 14 Jul 2025 08:51:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ryw7=Z3=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ubEug-00089a-W4
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 08:51:55 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9de3540-608f-11f0-a318-13f23c93f187;
 Mon, 14 Jul 2025 10:51:53 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by DU0PR03MB8854.eurprd03.prod.outlook.com
 (2603:10a6:10:40e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 14 Jul
 2025 08:51:49 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Mon, 14 Jul 2025
 08:51:49 +0000
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
X-Inumbo-ID: c9de3540-608f-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbcVa1Cqf2SnqLSRjm3bbPkl2VJLLQ3/+HsEMCorNZrT8O4PLtKnjG9GvknroQGv5KDU/uZMFfApVH779Iy4oBFsUvClYGiGF+KM8PKwMJf8Id3xmCq/lCQ87bKNH+Eri/BznlPyQHTwYGQdaLnyvzwRvSrLvzULm1+mNikwyawShLtjt5wwk/AMCVyqAehkgehsMYRSpIkwMHfViyUjOaP75UIRgk5xaSqaTEjTWYIHg7B/JhNRKZnZejF3KGMrtKuDKmLspdm2l2ftMQVJ0sKoTmUf279APer9OVY6xuAFFaydEKySQjqTC1iPzDu+ELlg69KlE3nlyXdcRZakUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uquipac1YPZuq4skWLYV2SO6seJgR1A2JOa4l/sOXsE=;
 b=v3vzPA9QjhHuOznXR51UJfnbY06zjheVZ5/2/pVfDQMC7zJO3epMvd25gR2vbZNyPa1jhi43AuGo9RuF6fPevTOXSKGEa1oBAojzj2EYdkfxXGWtQUMiJ5KHZoVeUv9fHZculG5NBfqci/Mdfl6Q+bP+vtV8M/oUoK0wQ0s9GV2aW6n1jKispb7zy+KAHPQQpgYFqiC8NYK9ebHn0gmMwz/51On3MqBhRrzxIP//mdvFAj/b0AMNPL3Bmvd5xqq4Se2LSzAVkjGEGkpeQVUGqJLltXuFjSF8B6SQa6g4Q5IoM/x5Nc8sBMEXFT4xbvRGrb0BsrcBo7/ZChmAwpfdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uquipac1YPZuq4skWLYV2SO6seJgR1A2JOa4l/sOXsE=;
 b=S6icr23pQwCch81UOZ17IuqZQdKBrWn7Joqx4nfP1+aB930NDx5bUxkXECmNv1h2D8WTelwgs6U6jKiCUL2nzp9teh1RUjVcoVk5L/YNmZGgzXix0FmId+uUR1Ym6TpjEg445lkSfBt7fdN1EgF6gemcSaBkE1tUkOD3R9ni6Pt4zAekpRu/uMKrAlLVRBXeACYpRk4FIXHPn+GjVj32G/oIVifGa1lH0dz81Iozef+a2eyqDTnhv20xZMKXjGoXfC9hXb9qT7PkbXcUEp2YhtiOMMxOWTQs5/q1vWnIdjMGiBsJY6sIYdoP5OONDWZfu35UjScOC42hela4vvcwqw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/3] pci/rcar: implement OSID configuration for Renesas
 RCar Gen4 PCIe host
Thread-Topic: [PATCH v2 2/3] pci/rcar: implement OSID configuration for
 Renesas RCar Gen4 PCIe host
Thread-Index: AQHb9JyJBlbuhl2mbUmNsZDyVSiclg==
Date: Mon, 14 Jul 2025 08:51:48 +0000
Message-ID:
 <7d98e1c353f7005a508eaff3390c500cd6f090c8.1752482857.git.mykyta_poturai@epam.com>
References: <cover.1752482857.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1752482857.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|DU0PR03MB8854:EE_
x-ms-office365-filtering-correlation-id: 38e89222-c66f-4707-0afa-08ddc2b3abe2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bR/kbeluqP9NqF0d5KbkU9Rhtypgvfgz+iXStdsa/WKFXuple3iVg/9okZ?=
 =?iso-8859-1?Q?nCYXQ+1/wctXApWjiIpXdLhRjhL3LGAp83/pNXI3LxhuI++VidLJzvJa2/?=
 =?iso-8859-1?Q?2jhqOnRRG7HIk1OOUYg82OEYbIZwn1iWLCaoaml3Q1esfMVl6dUwbQ5FsZ?=
 =?iso-8859-1?Q?V7BsB3aqXAILiCPQuEnxUbCTCA/87ZEbS56YCI7CQKBZuXWRGhNV1Eo02Z?=
 =?iso-8859-1?Q?539aXiHJgtDCyzU61E9n0oHV3vzbm+BbpJxZ40ebGSQ7iOJ7dCHA3wDUkH?=
 =?iso-8859-1?Q?I4zRTruXiUUMVPLuMZEcz2GMpA0fVheuqta63WL8EApsamRwY/NsScrg02?=
 =?iso-8859-1?Q?Lds3Yz8vG2EoCETv6V6ron1eZyUhaG+1moPyDe217lJqykgxzl5GMDDY6t?=
 =?iso-8859-1?Q?FDhtji1XxjaX3xBOUdVVkpNMThp3s1hYxo2Hink41NaJcF4n96yQ9NFbzj?=
 =?iso-8859-1?Q?/SY0Jpvq7kr7AQRngj4hqOtvC7WORmfqm+rHrXFMTIoLlLGRDblk+t6ydJ?=
 =?iso-8859-1?Q?3b/Ga1ViH8LazAud04r0ngbbRhY/SdPqjoRVdl1VHkxU8KKOd/kBg1kn6X?=
 =?iso-8859-1?Q?+taZLvcqYMykAV9x2NMsRTl0/LxC8U6466fT2ogHWrBGfIFIHagsMa+wSy?=
 =?iso-8859-1?Q?0KJT5SRaNKAw0Ba1HwL76wZ6OdhwqCUXTbGm/ueViY2KXvlk++weHDGOZ1?=
 =?iso-8859-1?Q?b2rPXSRWF74P8+i/Cvdi5CLh2ihrXsrddbBW2c3LwzEIzI+x4W6TOA5bz8?=
 =?iso-8859-1?Q?RKqK1eK9JIPFHuDsfcL9LS309pt5DAalTcy03X9E/kUgHrrVRu4DN1L28Y?=
 =?iso-8859-1?Q?OUvyZ8I5mNk4QC47ezE0ckSR0QdmYYx/p0D2snRddvYJJipppk9D5ki/us?=
 =?iso-8859-1?Q?X+U8aNWNLcEpcKvRipDOQVrCZRnAaYqhWu7aQbB/aZFjrfLKDfwe3ZXoNY?=
 =?iso-8859-1?Q?PRr+mCWL3zRWUsbiY8ZPo77pJw8wnYGUIZJUGLI3VCFEd/zmaOSGEL6zFy?=
 =?iso-8859-1?Q?PNhc2YOhxXVMyv49KWxvf/9S10fQ2FlDMk+eZBIhCbOKQaC5bxQmGXbbGE?=
 =?iso-8859-1?Q?oZ6mRG+CVtlIXLkzAERxzpNSsVr73p352MhFWJgIzdkQK/39bs3bAW+hvl?=
 =?iso-8859-1?Q?4b5HCnXE6ZuZM2YuJKe2YdtaJkY8ih3DPxUp/JdlXOa3j7edFoukUO4wwP?=
 =?iso-8859-1?Q?PV0v41BMHK05KpSX0UDEe2CkJgA491DrM7lvsDr5CBRiXzJ0U0ek9ivuJ2?=
 =?iso-8859-1?Q?VT1I4B7PcVpmNeJXnsZkafx5XzGefBt96zXuYs9pebpt5O3UlPHnTBak5J?=
 =?iso-8859-1?Q?B3pog6sfoCo9q/zwqm/jB9zAYKMxz9myeiu0HdI2z0+HYnkv2N7UX+9BS5?=
 =?iso-8859-1?Q?ka7zBrfif/DCCTBkpm0srFn6FaCKuz7bU2g6JklVj0oELXSEiHoGOOnh62?=
 =?iso-8859-1?Q?dCY7d/sKpOAX/VuEyuUw3JZgEpSmiiPAp/PjnHdvX9pSDAWQY43MSr6PYn?=
 =?iso-8859-1?Q?GALAhyWWGfkBTxHk60OuvR1Q1JPY5vYSBE8Vt9hocXag=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?iBWuP00yl0Qv/deVMKHQVyFquC8YRw91YbATYlXUR+Ej/aeTM+kx7sc0D1?=
 =?iso-8859-1?Q?cVX4cN3Pr9xNnUsNlhqUFxSwXldhRV7vkhRmzTWi5MNYDLwKcBu7aRzAJN?=
 =?iso-8859-1?Q?dVCoEXO34utSuSjxkbxVs0S1rdjV2q5LsqhRI7OD4+XHIVmdODY5udgv1B?=
 =?iso-8859-1?Q?Sy7kj13kZ7CxfsQPw529Im+RvORqFmAmlyI5JSZnNP3cSoRg5A1mZPJdci?=
 =?iso-8859-1?Q?YYAuoHSUciKWswWD/dyih14bS9y6HRF1VgQv6zghaY/tDgzruqz7mGD/Uu?=
 =?iso-8859-1?Q?BrgFIRlmfEIvIGx2dBSiu0TAG//2uyG/BHPOyg+FK3+yb59NZU+Fbinq35?=
 =?iso-8859-1?Q?P2jj8hWWBZrxWF12ccxR762dMycKDI0KyYpWN/d/S+zj9AHbT+wTnOpf2/?=
 =?iso-8859-1?Q?X8L8GCOn0pDtkEeHs/Jhp6ofplf5hHqADeGgTzVo0dcyjSaEVrI17k/n50?=
 =?iso-8859-1?Q?kVbU3KwxigU+khN93yY+kUMoYCKbRkV4BnH0rl4vL28LSCSItNTYPs53cD?=
 =?iso-8859-1?Q?8O5HEvbfiJKNfjJ5Jxr0pxvyWw0FeCEu0Cwk2IVBiNyDTibJi1ARJ+1Xn9?=
 =?iso-8859-1?Q?jF3RR56cbCfSSBF7IaDxhO1d1i0MQ6VJGeQa9yJC1zdcuY/6/kxPGC8fUc?=
 =?iso-8859-1?Q?nppPb4SfPlekVKV6NTVu7Y5TggWXA9mhrmDNJdruJYur8ivjP67cQ8bufS?=
 =?iso-8859-1?Q?1sgLtMsiqNp6ryx0o8lZYZyxUIs3MA4Y0Q3bP3SFjtn6gI40DXiBowmhpy?=
 =?iso-8859-1?Q?byI2trpAdCDZ9lPF1T62mVRdp9XbRDVgP/91i7m0MigVL3U7QAUQJGh9zx?=
 =?iso-8859-1?Q?VrxNob5Yk3juAQJ2xaV9qYINNKnhPMUnMtb/9VrQJPxpW2XrDHXtPNExxy?=
 =?iso-8859-1?Q?iJR1T676TOQvuytu+TK7NWLFsUytumjzbyGrkqux3u6wNnONlpnXhGZ5wr?=
 =?iso-8859-1?Q?d/yR2s1g6AeKJpid0Mq5rh9EnEYaS2zBegW3SpNsJKQmK5hpILo/VgKWrF?=
 =?iso-8859-1?Q?4KNBt6AoR5sfJVcKcHwg2UYseDLKEdPTT2ms4A6oGLjDRjtgqq/zkJrFGK?=
 =?iso-8859-1?Q?/TQ/jHfzXQAGe7Ly+IG9mB16YXo1DLZWkjwocqt57ILtUeNyvFc5pun1Nm?=
 =?iso-8859-1?Q?U1awEe/JOrlSXbECKe9PNSe0LGR9F5tcyYg+7nmVk+dovS8BcpjblxlWp+?=
 =?iso-8859-1?Q?xwn6ZOMea5LPz7qC3UOIKk7PQkDY2r1+5AaFIke20+aKKveyfVnWmQrtAk?=
 =?iso-8859-1?Q?O5GwZdGPnFLoTrxbA3QO0xcIkhpxtGNea9l4tcxXHTkO2zi5x6oM1avcs1?=
 =?iso-8859-1?Q?IURVv+IroCuZqcmMQULNKZdjsUlqbWZJ7vHSxx6trrnOxjdoIYCHp3eR+N?=
 =?iso-8859-1?Q?AFfDz5NxedVj6AZWJ/DtWk9iSRkuRvh5VEcwJ7BsU1mHg7oYtj01APMrXt?=
 =?iso-8859-1?Q?pImroghXcifiyW8gtI/a57s923eVImhR2GbLi8kHaVQpDcBvTvB/i+FbXG?=
 =?iso-8859-1?Q?KruG/2hyCqL0T+o+sihpvV6zyigGQ8Fvipxpl+JdNb7Uieo3+skixuWl5/?=
 =?iso-8859-1?Q?gsfvP2ImAj3rhIj5hHvp6QE9JhOs9XTCGPyV3ygvRppSze0jB3QLigOceA?=
 =?iso-8859-1?Q?/9hWIGenLzJoKE/4xYdYSasfzFxGDRcaIgkjow5OtmB9++zVatmzJKlg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e89222-c66f-4707-0afa-08ddc2b3abe2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 08:51:49.0383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leJ4g7SyVLlk6NBzC2+Vj/iu56ZjR1l1RhmeYO6hTv717JEtZrkCBZfdb//WqMqVV7orOftiA8+XonGQv3nWhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8854

For IPMMU to be able to associate a specific PCI device with it's TLB
the BDF to OSID mapping needs to be set up in the host bridge. The
configured OSID is then emmited as a sideband data on the AXI bus during
PCI DMA transactions. OSID configuration registers are located in the
"app" region of the host bridge.

Map the "app" region on init and implement methods for setting up
BDF->OSID mappings

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
v1->v2:
* add Stefano's AB
---
 xen/arch/arm/pci/pci-host-rcar4.c | 148 ++++++++++++++++++++++++++++++
 xen/arch/arm/pci/pci-host-rcar4.h |  18 ++++
 2 files changed, 166 insertions(+)
 create mode 100644 xen/arch/arm/pci/pci-host-rcar4.h

diff --git a/xen/arch/arm/pci/pci-host-rcar4.c b/xen/arch/arm/pci/pci-host-=
rcar4.c
index 62d2130a63..9290c6cac5 100644
--- a/xen/arch/arm/pci/pci-host-rcar4.c
+++ b/xen/arch/arm/pci/pci-host-rcar4.c
@@ -16,6 +16,32 @@
=20
 #define RCAR4_DWC_VERSION       0x520A
=20
+/* PCIE BDF-OSID assignment */
+#define CNVID(n)             (0x700 + ((n) * 4))
+#define CNVID_CNV_EN         (1U << 31)
+#define CNVID_OSID_MASK      (0x0F << 16)
+#define CNVID_OSID_SHIFT     16
+#define CNVID_BDF_MASK       (0xFFFF << 0)
+#define CNVID_BDF_SHIFT      0
+
+#define CNVIDMSK(n)                (0x780 + ((n) * 4))
+#define CNVIDMSK_BDF_MSK_MASK      (0xFFFF << 0)
+#define CNVIDMSK_BDF_MSK_SHIFT     0
+
+#define CNVOSIDCTRL                0x800
+#define CNVOSIDCTRL_OSID_MASK      (0x0F << 16)
+#define CNVOSIDCTRL_OSID_SHIFT     16
+
+#define DEFAULT_OSID    0
+
+#define NUM_OSID_REGS    16
+
+struct rcar4_pcie_priv {
+    bool init_done;
+    void __iomem *app_base;
+    DECLARE_BITMAP(osid_regs, NUM_OSID_REGS);
+};
+
 /*
  * PCI host bridges often have different ways to access the root and child
  * bus config spaces:
@@ -65,17 +91,139 @@ static const struct dt_device_match __initconstrel rca=
r4_pcie_dt_match[] =3D {
     {},
 };
=20
+static void rcar4_pcie_writel_app(struct rcar4_pcie_priv *pci, uint32_t re=
g,
+                                  uint32_t val)
+{
+    writel(val, pci->app_base + reg);
+}
+
+static uint32_t rcar4_pcie_readl_app(struct rcar4_pcie_priv *pci, uint32_t=
 reg)
+{
+    return readl(pci->app_base + reg);
+}
+
+int rcar4_pcie_osid_regs_init(struct pci_host_bridge *bridge)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    uint32_t val =3D rcar4_pcie_readl_app(priv, CNVOSIDCTRL);
+
+    if ( priv->init_done )
+        return 0;
+    priv->init_done =3D true;
+
+    val =3D (val & ~CNVOSIDCTRL_OSID_MASK) |
+          (DEFAULT_OSID << CNVOSIDCTRL_OSID_SHIFT);
+    rcar4_pcie_writel_app(priv, CNVOSIDCTRL, val);
+    bitmap_zero(priv->osid_regs, NUM_OSID_REGS);
+
+    printk("%s: Initialized OSID regs (default OSID %u)\n",
+           bridge->dt_node->full_name, DEFAULT_OSID);
+
+    return 0;
+}
+
+int rcar4_pcie_osid_reg_alloc(struct pci_host_bridge *bridge)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    int ret;
+
+    ret =3D find_first_zero_bit(priv->osid_regs, NUM_OSID_REGS);
+    if ( ret !=3D NUM_OSID_REGS )
+        set_bit(ret, priv->osid_regs);
+    else
+        ret =3D -EBUSY;
+
+    return ret;
+}
+
+void rcar4_pcie_osid_reg_free(struct pci_host_bridge *bridge,
+                              unsigned int reg_id)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+
+    clear_bit(reg_id, priv->osid_regs);
+}
+
+void rcar4_pcie_osid_bdf_set(struct pci_host_bridge *bridge,
+                             unsigned int reg_id, uint32_t osid, uint32_t =
bdf)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    uint32_t data =3D rcar4_pcie_readl_app(priv, CNVID(reg_id));
+
+    data &=3D ~(CNVID_OSID_MASK | CNVID_BDF_MASK);
+    data |=3D CNVID_CNV_EN | (osid << CNVID_OSID_SHIFT) |
+            (bdf << CNVID_BDF_SHIFT);
+    rcar4_pcie_writel_app(priv, CNVID(reg_id), data);
+}
+
+void rcar4_pcie_osid_bdf_clear(struct pci_host_bridge *bridge,
+                               unsigned int reg_id)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+    uint32_t data =3D rcar4_pcie_readl_app(priv, CNVID(reg_id));
+
+    data &=3D ~CNVID_CNV_EN;
+    rcar4_pcie_writel_app(priv, CNVID(reg_id), data);
+}
+
+void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bridge, unsigned int r=
eg_id,
+                            uint32_t data)
+{
+    struct rcar4_pcie_priv *priv =3D dw_pcie_get_priv(bridge);
+
+    uint32_t val =3D rcar4_pcie_readl_app(priv, CNVIDMSK(reg_id));
+
+    val =3D (val & ~CNVIDMSK_BDF_MSK_MASK) | (data << CNVIDMSK_BDF_MSK_SHI=
FT);
+
+    rcar4_pcie_writel_app(priv, CNVIDMSK(reg_id), val);
+}
+
 static int __init pci_host_rcar4_probe(struct dt_device_node *dev,
                                        const void *data)
 {
     struct pci_host_bridge *bridge;
+    paddr_t app_phys_addr;
+    paddr_t app_size;
+    int app_idx, ret;
+
+    struct rcar4_pcie_priv *priv =3D xzalloc(struct rcar4_pcie_priv);
+    if ( !priv )
+        return -ENOMEM;
=20
     bridge =3D dw_pcie_host_probe(dev, data, &rcar4_pcie_ops,
                                 &rcar4_pcie_child_ops);
=20
+    app_idx =3D dt_property_match_string(dev, "reg-names", "app");
+    if ( app_idx < 0 )
+    {
+        printk(XENLOG_ERR "Cannot find \"app\" range index in device tree\=
n");
+        ret =3D app_idx;
+        goto err;
+    }
+    ret =3D dt_device_get_address(dev, app_idx, &app_phys_addr, &app_size)=
;
+    if ( ret )
+    {
+        printk(XENLOG_ERR "Cannot find \"app\" range in device tree\n");
+        goto err;
+    }
+
+    priv->app_base =3D ioremap_nocache(app_phys_addr, app_size);
+    if ( !priv->app_base )
+    {
+        printk(XENLOG_ERR "APP ioremap failed\n");
+        ret =3D -ENXIO;
+        goto err;
+    }
+    printk("APP at [mem 0x%" PRIpaddr "-0x%" PRIpaddr "]\n", app_phys_addr=
,
+           app_phys_addr + app_size - 1);
+
+    dw_pcie_set_priv(bridge, priv);
     dw_pcie_set_version(bridge, RCAR4_DWC_VERSION);
=20
     return 0;
+err:
+    xfree(priv);
+    return ret;
 }
=20
 DT_DEVICE_START(pci_gen, "PCI HOST R-CAR GEN4", DEVICE_PCI_HOSTBRIDGE)
diff --git a/xen/arch/arm/pci/pci-host-rcar4.h b/xen/arch/arm/pci/pci-host-=
rcar4.h
new file mode 100644
index 0000000000..8ac6626a22
--- /dev/null
+++ b/xen/arch/arm/pci/pci-host-rcar4.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <asm/pci.h>
+
+#ifndef __PCI_HOST_RCAR4_H__
+#define __PCI_HOST_RCAR4_H__
+
+void rcar4_pcie_osid_bdf_set(struct pci_host_bridge *bridge,
+                             unsigned int reg_id, uint32_t osid, uint32_t =
bdf);
+void rcar4_pcie_osid_bdf_clear(struct pci_host_bridge *bridge,
+                               unsigned int reg_id);
+void rcar4_pcie_bdf_msk_set(struct pci_host_bridge *bridge, unsigned int r=
eg_id,
+                            uint32_t data);
+int rcar4_pcie_osid_reg_alloc(struct pci_host_bridge *bridge);
+void rcar4_pcie_osid_reg_free(struct pci_host_bridge *bridge,
+                              unsigned int reg_id);
+int rcar4_pcie_osid_regs_init(struct pci_host_bridge *bridge);
+
+#endif /* __PCI_HOST_RCAR4_H__ */
--=20
2.34.1

