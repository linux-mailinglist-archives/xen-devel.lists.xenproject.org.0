Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D50AFAF82
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 11:21:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035408.1407682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYi1y-0001bh-HQ; Mon, 07 Jul 2025 09:20:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035408.1407682; Mon, 07 Jul 2025 09:20:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYi1y-0001YT-Cx; Mon, 07 Jul 2025 09:20:58 +0000
Received: by outflank-mailman (input) for mailman id 1035408;
 Mon, 07 Jul 2025 09:20:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wd65=ZU=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uYi1w-0001Ri-VQ
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 09:20:57 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af6b6c90-5b13-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 11:20:55 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM0PR03MB6305.eurprd03.prod.outlook.com
 (2603:10a6:20b:157::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 09:20:40 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 09:20:40 +0000
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
X-Inumbo-ID: af6b6c90-5b13-11f0-a316-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vty0tZDHERkr1kCvfmlUSh8+mDtQAsEF+W8s7NeXboJ6s5YFeUDoQjh33n17x4ohCQZgtlVJru+etb+F8D//7IqI79KAwuNrrhmz4u3naYp6d7dtpRVqKMKHXh/3Q/fAqKmgAHzChFMmzcKyMpxFMkVVjVcvPfjb5Ji6bSVHQ/+/i6zJLK8f1bA3QF87yA/YhKWvqoCQgETv3TtdPDfQ41skc5FvEJ+pNvzknOm02HGWhHB8+GOxR2mG6aIRwrBcz3D12h6bNUXWYLNEKnJMH/RJkOo1y4OiCWgh4dWZcSzEMbwnQSoK7hDEV39Y9VNV/baSSRitAFiEaUFzUSj/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxPvfOAsSigagv3rXTs+CLLre8x64/UR3pi98i0F9fU=;
 b=bWjMMTYLsTT3yW93xFTPzimP1e7T9yONbEa59mAuUYHfqAr9iyO0e02taIx0suNX63xczLLCc2qa26UJHI4m3dtL4+shV4VXLXDrQd5jJalW6bw82TgIXafJ+B73rpNIjddMxhfzcomlI1XPQRgh6Z0XZFCX2n1J3tlgGAn4/NY5vJlvfna/BvS19Ut81XJ6lAITuYCdun2vDZH0pkqFHDx48weIrcoFzPchdqSrJ4K3YXGnrdN+Tk5PwBN/mNCYnvcT6X87Xqm6Ghd3oA4o7gFLuJvqFa6wrnNrRcdm8SU1BhbN0YNvxaXsxH0kSIj8QUQUdZdNJKfHfJYWJ3saXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxPvfOAsSigagv3rXTs+CLLre8x64/UR3pi98i0F9fU=;
 b=XLdnn05QTtZBnEGvuqa+YyoX53gjRTAst8lRc4LMT9FthY7PPffqqEqc6UQ4rjv1R4jb8+j+rCMY0ABUFwUJQ3kOsbNCXpEczwct8VBf97NxgdSTjxkc30ckiTlblf8Nf9afakJqDvLot3GouTXFpNieg+M14iKDvunnCAVDczPpgDuOKMMnibeT/B+zGDruUTQZraWjxZsfqsxPnmSYPkUej5BI3tmSU5Uv/fXA6q7PlZC74FBKOOsQP0AmCE7kj9PUvBXnqyewGEYXTSHDx4JgCXJeXQdlXII7j5V9F+4K2oz4fPNL8JykRk1Zsm9xa1CJxgBHI3pK3JrxmDOV5Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>
Subject: [PATCH v1 3/3] iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID
 support
Thread-Topic: [PATCH v1 3/3] iommu/ipmmu-vmsa: Implement basic PCIE-IPMMU OSID
 support
Thread-Index: AQHb7yBofin73T46RkmI40PJapT1qQ==
Date: Mon, 7 Jul 2025 09:20:40 +0000
Message-ID:
 <780521b8646a0431a49e7696f681a420bf888668.1751874601.git.mykyta_poturai@epam.com>
References: <cover.1751874601.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1751874601.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM0PR03MB6305:EE_
x-ms-office365-filtering-correlation-id: be5bd5f4-7af4-4690-6496-08ddbd378ad1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tIEgZTpR05spTdZb/1P6uVzzImT+3dQjWNgZZdtAiHTeoubI5FSRY9V+Io?=
 =?iso-8859-1?Q?bAP5LzDavOjJOSScpWqVw1Ssu/PA75XfDhlDP7o8k5M5ZqEvxhpNEu+4pL?=
 =?iso-8859-1?Q?VwgXftzfHCWp7yW6tPgWMfZjQw4Wy7wP8s0TQddvKiLgjShE9XZio0nmhT?=
 =?iso-8859-1?Q?Qt3Kd59Yh0LC1ChdAIhFjIF4X66XSNjhoZMjUHNO0LTjzxPqBxcUIZaMLu?=
 =?iso-8859-1?Q?HlX2tDGmblR7enPb4GulZFba3h+6qQixBwfZ2Voy4S17Wmh808v9z7/3Ai?=
 =?iso-8859-1?Q?XJ7FbXKI/qk4q47bJH+fijE6ukhukfXswCnn0h7zAA3dAUSK95BfoJd2eW?=
 =?iso-8859-1?Q?if1B88oSU9zcbGJ+cuLJuaMMJM6fIsz7vGZ6jN2bHeQZr2zY0VYBTuMleY?=
 =?iso-8859-1?Q?EFj8WyM2PJ6lW7Q42KyGSv+rISMiY3BXBGNTvB8WKPIIWJtvSsUH7LjPLY?=
 =?iso-8859-1?Q?BJ/m1RCCaScX9XBWq3JXzmaN/jbnPhlvWL5LTSISJGiOQYbtBZ32iKuoZa?=
 =?iso-8859-1?Q?UjIT8GWChTJxpYu4L23Z3Kp5Xqj5eOzXyRcO0xCYG8CV5h0VkSL71UKtWr?=
 =?iso-8859-1?Q?avo624il75u2OQrBniM8FrzpPHfKdwEViU+I9G1bftQsfxoV84sSHA5Yjy?=
 =?iso-8859-1?Q?H8NCVbPPVCiXHiJDPMEPgqJ6pdWSAK1HhmSKgGwICfqHc5SWpE0pglJQgf?=
 =?iso-8859-1?Q?cjOcrDBXx6+kiemJ9ZfvOqkDo4dDsiLav4BDYnW5+LMFGGcipNZM+B2Gpx?=
 =?iso-8859-1?Q?EIxBSD0gBZCwz/MmWy0m06ed1ZnpHTA1dNp64IwNj/lH0ayZTn1ZWEANt+?=
 =?iso-8859-1?Q?zKGZD6YBAC/APgDtlUSrvuNX5WiP77bqUhkAIjlf+x/t3kYWV4B/4zFxNq?=
 =?iso-8859-1?Q?dzDZnpMcPNCow9G+OH0lBfil8BO9zoKeByIWLogj5G5iLTGNxkXPQmiWhg?=
 =?iso-8859-1?Q?7NRMaAM/kHl53Ka3d3uVhz8kQZLx9xiROdsKw4HXGgOLRjIy4OWQKo4sDP?=
 =?iso-8859-1?Q?91GKwHcr8YQkG/QpGGSV6X3SXYxJdmm5gmD1Je875eJVI7wF/YXzxnoze7?=
 =?iso-8859-1?Q?M0ZZ+SfpL0IIqG3iQgdUumgeazDfENLJyqO0SmeH7eVvpqr2uKlCjE1zCe?=
 =?iso-8859-1?Q?4gZ9QI3PZV1Ofpqi8IbyLSfXKdXQErmgISQzmf9rDDFZveyoOBKUlt3cyA?=
 =?iso-8859-1?Q?LyKjr1lqvScHAUKkIcw77PQx2MnPE6BI7hvcxEXGSHsZvWxB0Sb3REuCmf?=
 =?iso-8859-1?Q?G0ExKAptD/6tNXFliQc0dv4m8osCYgztGe5xwrjNCcNgHMe8cxQbFE+N7Z?=
 =?iso-8859-1?Q?9D+jRocEzvvaxMfyAgVf5vELWbYp/IfhCqb7iq6KP6jwMKLFERr7Er5pG8?=
 =?iso-8859-1?Q?mVvG9cJoRT9qsJs+7lBlJX4BNtR/dAcoarKTFMXzKCZBdm5ns6kgVdudWw?=
 =?iso-8859-1?Q?2PtlCiQD2yUuz6KvL1c+oe80hcEy0vJefjC1p6G9ZG6syGKxwLHy/NHfwR?=
 =?iso-8859-1?Q?m2gTq0ovCS9uIn/0+dkS8K/cbFi6CSzV2Bcu7qA/+AUA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lxASyCHAMurT8hDItqKUrPUecKMN1jLLsWwi+8pCFoG7rivbROp4egkvax?=
 =?iso-8859-1?Q?LBkBySJ94jlAjQdDWm1JNbP8faThKnW3Y6Gk6iI0EKtZ9XEwYO5WDP6ddI?=
 =?iso-8859-1?Q?dh4YktCTjcyFE0AWycuxyezsfYfMBBlsI4c275+oo0Qw73On1nZih709v7?=
 =?iso-8859-1?Q?F9k1aGGPZ9acjyJW4V5zlSLnI1jcnNXiL9+G0WR2eUTe4jcAGmwSd6Ne60?=
 =?iso-8859-1?Q?WARyPZJJsiRpaW1FEFBlrJYmG6wMGM5piJk0iROEfPj+mo+gx810TDoUSs?=
 =?iso-8859-1?Q?TBuXAGcyPjrIxB14ep9lmGkbB/RYOzInTIe1TzttNp1hcg0YiFNUVNnxIT?=
 =?iso-8859-1?Q?zdo7/PSfn5kzW9+Ha94fYs8+jbFfUN+WWNyIsctIQhCiG0lQjRiUSJtBJu?=
 =?iso-8859-1?Q?00Fct7LcJvXeyeHl7XKyMVNI/rf3uc2pla462OhS9LoajI0S3lW9Qwqquy?=
 =?iso-8859-1?Q?04/RWoXXU9Y/z+8tlEGJN6vEN/wjZCghqLEdG+keFQQrAPAxEpBAZjVPSJ?=
 =?iso-8859-1?Q?P32DuJSfuRVNfDrh/8bcW3FDdz/a8c8tSG4lvIFNQchEvXNKIQ3tEfzoYA?=
 =?iso-8859-1?Q?5cWGlayLVn+9i9F193HcaSwHn5DQXNmHdd8+ws/79aOy0ZwP8J7WMM9h2F?=
 =?iso-8859-1?Q?2SDvI+Mve1lc8rsbJNuwbwwvgnBU0rYwFtLu1IMEWChG6AVzJO3lSg8MLI?=
 =?iso-8859-1?Q?n0s+ZvP31YAvjG63ztz5IAbh7gwnh8H3iCxzg+rLaCP06CjxpzyS15fnr8?=
 =?iso-8859-1?Q?U8bCUGzwR079VOqqgGxB+bSWQroOU/YPjyUEETsgRuH4lBzchxI+2nljcI?=
 =?iso-8859-1?Q?JT4YQEJpL630zeLc5XBg7YW8wZ8jZkRNamiaUvaXCKl9dyFeyan4dFsmdZ?=
 =?iso-8859-1?Q?QwOR1CH0iY7AhWNF4CBDVBhVHu1dfMs7aTP1RxhRHCJXevtbR505JdcQho?=
 =?iso-8859-1?Q?oBURGa56JJIJxQgWIHT6V4fH9O8POchPHdqatPYNcqJxxFBT/8vn2tn7Js?=
 =?iso-8859-1?Q?0ildswcVamb4FYAjz17x1Ybkp3vR/PHreQ584VA36xs2/H7Bc0U0riQPev?=
 =?iso-8859-1?Q?zugbHDcVuHMFdvGBoPtYhVJAGSCyux8BDpZu+QWh8DLp6EBSFxOYhcD29n?=
 =?iso-8859-1?Q?zHg8OaCC65/2pCB4FiLu2CG0liv+nChNrx6fg7BkMC60sDr8QR99Dp9AYK?=
 =?iso-8859-1?Q?GezhoZkwVGmE67CyMsCHHXBf4zVTn2EWeDErca+HSaipxe0npdMaG5jXyP?=
 =?iso-8859-1?Q?Ie6e+Bv9I3Pe1WbcAJMrVeDRzI8rkK6nvxE54035M81SqeH89jWXOdpjpp?=
 =?iso-8859-1?Q?nU3dhDa3o/mt6SkqUhFsU7Mo3PwN/g1wap/rs+xqS7LNhASfbuF1eoaSRy?=
 =?iso-8859-1?Q?3fDK1CAztz5sXry35uh9lend2Wxx3jM285OnAZCpv32qfHWTDQw3pk37q7?=
 =?iso-8859-1?Q?SonagzTu9BZgGFqwiu7KXQvtNY0wuZMGJQs5EsSioN+Rsa+G+DlCbm4eqw?=
 =?iso-8859-1?Q?UpdcyoqRVTOb/YLOxcfUWx8EGzMiYKd8FRXdSh+0o0QzNCxgFs2yAIaCS5?=
 =?iso-8859-1?Q?ILdJ3q3u3gVPhW9NvYQ0Og7pkzp153NuwNvzulSpixkbpL7J2XXKCpSyn+?=
 =?iso-8859-1?Q?1BLJYvy3wOIAUQc21htEedRf98EZXampMyyxGZ2s1im5iJrZ6vHdvv9w?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5bd5f4-7af4-4690-6496-08ddbd378ad1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 09:20:40.6065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dts3oWUsnV1brMudSxTFsFSmxpqoChU9dtcn+Nl5+1ekK/JeeHNKyiCX/gB5Jmw/lhYaBOe2FPuceoqmRc26fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6305

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Program PCIE BDF-OSID assignment according to the S4_PCIe_IPMMU-OSID
when adding PCI device to the IOMMU in ipmmu_add_device callback.
This is needed for being able to assign PCI devices to different
domains at the same time. Programmed OSID is emmited as sideband data on
the AXI bus during PCI DMA transactions and then used by IPMMU to match
the transaction to the corresponding uTLB.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 141 +++++++++++++++++++++--
 1 file changed, 133 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthr=
ough/arm/ipmmu-vmsa.c
index d828d9cf6a..14ddabb30e 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -51,12 +51,25 @@
 #include <asm/device.h>
 #include <asm/io.h>
 #include <asm/iommu_fwspec.h>
+#include "../arch/arm/pci/pci-host-rcar4.h"
=20
 #define dev_name(dev) dt_node_full_name(dev_to_dt(dev))
=20
 /* Device logger functions */
+#ifndef CONFIG_HAS_PCI
 #define dev_print(dev, lvl, fmt, ...)    \
     printk(lvl "ipmmu: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
+#else
+#define dev_print(dev, lvl, fmt, ...) ({                                \
+    if ( !dev_is_pci((dev)) )                                           \
+        printk(lvl "ipmmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
+    else                                                                \
+    {                                                                   \
+        struct pci_dev *pdev =3D dev_to_pci((dev));                       =
\
+        printk(lvl "ipmmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
+    }                                                                   \
+})
+#endif
=20
 #define dev_info(dev, fmt, ...)    \
     dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
@@ -1121,6 +1134,8 @@ static void ipmmu_free_root_domain(struct ipmmu_vmsa_=
domain *domain)
     xfree(domain);
 }
=20
+static int ipmmu_deassign_device(struct domain *d, struct device *dev);
+
 static int ipmmu_assign_device(struct domain *d, u8 devfn, struct device *=
dev,
                                uint32_t flag)
 {
@@ -1134,8 +1149,43 @@ static int ipmmu_assign_device(struct domain *d, u8 =
devfn, struct device *dev,
     if ( !to_ipmmu(dev) )
         return -ENODEV;
=20
-    spin_lock(&xen_domain->lock);
+#ifdef CONFIG_HAS_PCI
+    if ( dev_is_pci(dev) )
+    {
+        struct pci_dev *pdev =3D dev_to_pci(dev);
+        struct domain *old_d =3D pdev->domain;
+
+        printk(XENLOG_INFO "Assigning device %04x:%02x:%02x.%u to dom%d\n"=
,
+               pdev->seg, pdev->bus, PCI_SLOT(devfn), PCI_FUNC(devfn),
+               d->domain_id);
+
+        /*
+         * XXX What would be the proper behavior? This could happen if
+         * pdev->phantom_stride > 0
+         */
+        if ( devfn !=3D pdev->devfn )
+            ASSERT_UNREACHABLE();
+
+        list_move(&pdev->domain_list, &d->pdev_list);
+        pdev->domain =3D d;
+
+        /* dom_io is used as a sentinel for quarantined devices */
+        if ( d =3D=3D dom_io )
+        {
+            int ret;
+
+            /*
+             * Try to de-assign: do not return error if it was already
+             * de-assigned.
+             */
+            ret =3D ipmmu_deassign_device(old_d, dev);
+
+            return ret =3D=3D -ESRCH ? 0 : ret;
+        }
+    }
+#endif
=20
+    spin_lock(&xen_domain->lock);
     /*
      * The IPMMU context for the Xen domain is not allocated beforehand
      * (at the Xen domain creation time), but on demand only, when the fir=
st
@@ -1240,7 +1290,7 @@ static int ipmmu_reassign_device(struct domain *s, st=
ruct domain *t,
     int ret =3D 0;
=20
     /* Don't allow remapping on other domain than hwdom */
-    if ( t && !is_hardware_domain(t) )
+    if ( t && !is_hardware_domain(t) && (t !=3D dom_io) )
         return -EPERM;
=20
     if ( t =3D=3D s )
@@ -1288,20 +1338,95 @@ static int ipmmu_dt_xlate(struct device *dev,
=20
 static int ipmmu_add_device(u8 devfn, struct device *dev)
 {
-    struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
+    struct iommu_fwspec *fwspec;
+
+#ifdef CONFIG_HAS_PCI
+    if ( dev_is_pci(dev) )
+    {
+        struct pci_dev *pdev =3D dev_to_pci(dev);
+        int ret;
+
+        if ( devfn !=3D pdev->devfn )
+            return 0;
+
+        ret =3D iommu_add_pci_sideband_ids(pdev);
+        if ( ret < 0 )
+            iommu_fwspec_free(dev);
+    }
+#endif
+
+    fwspec =3D dev_iommu_fwspec_get(dev);
=20
     /* Only let through devices that have been verified in xlate(). */
     if ( !to_ipmmu(dev) )
         return -ENODEV;
=20
-    if ( dt_device_is_protected(dev_to_dt(dev)) )
+    if ( !dev_is_pci(dev) )
     {
-        dev_err(dev, "Already added to IPMMU\n");
-        return -EEXIST;
+        if ( dt_device_is_protected(dev_to_dt(dev)) )
+        {
+            dev_err(dev, "Already added to IPMMU\n");
+            return -EEXIST;
+        }
+
+        /* Let Xen know that the master device is protected by an IOMMU. *=
/
+        dt_device_set_protected(dev_to_dt(dev));
     }
+#ifdef CONFIG_HAS_PCI
+    if ( dev_is_pci(dev) )
+    {
+        struct pci_dev *pdev =3D dev_to_pci(dev);
+        unsigned int reg_id, osid;
+        struct pci_host_bridge *bridge;
+        struct iommu_fwspec *fwspec_bridge;
+        unsigned int utlb_osid0 =3D 0;
+        int ret;
+
+        bridge =3D pci_find_host_bridge(pdev->seg, pdev->bus);
+        if ( !bridge )
+        {
+            dev_err(dev, "Failed to find host bridge\n");
+            return -ENODEV;
+        }
+
+        fwspec_bridge =3D dev_iommu_fwspec_get(dt_to_dev(bridge->dt_node))=
;
+        if ( fwspec_bridge->num_ids < 1 )
+        {
+            dev_err(dev, "Failed to find host bridge uTLB\n");
+            return -ENXIO;
+        }
+
+        if ( fwspec->num_ids < 1 )
+        {
+            dev_err(dev, "Failed to find uTLB");
+            return -ENXIO;
+        }
+
+        rcar4_pcie_osid_regs_init(bridge);
=20
-    /* Let Xen know that the master device is protected by an IOMMU. */
-    dt_device_set_protected(dev_to_dt(dev));
+        ret =3D rcar4_pcie_osid_reg_alloc(bridge);
+        if ( ret < 0 )
+        {
+            dev_err(dev, "No unused OSID regs\n");
+            return ret;
+        }
+        reg_id =3D ret;
+
+        osid =3D fwspec->ids[0] - utlb_osid0;
+        rcar4_pcie_osid_bdf_set(bridge, reg_id, osid, pdev->sbdf.bdf);
+        rcar4_pcie_bdf_msk_set(bridge, reg_id, 0);
+
+        dev_info(dev, "Allocated OSID reg %u (OSID %u)\n", reg_id, osid);
+
+        ret =3D ipmmu_assign_device(pdev->domain, devfn, dev, 0);
+        if ( ret )
+        {
+            rcar4_pcie_osid_bdf_clear(bridge, reg_id);
+            rcar4_pcie_osid_reg_free(bridge, reg_id);
+            return ret;
+        }
+    }
+#endif
=20
     dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
              dev_name(fwspec->iommu_dev), fwspec->num_ids);
--=20
2.34.1

