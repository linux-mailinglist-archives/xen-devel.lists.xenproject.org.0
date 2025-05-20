Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B45ABDF9B
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 17:54:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990969.1374912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHPHN-0000bR-3F; Tue, 20 May 2025 15:53:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990969.1374912; Tue, 20 May 2025 15:53:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHPHM-0000Ze-Vs; Tue, 20 May 2025 15:53:20 +0000
Received: by outflank-mailman (input) for mailman id 990969;
 Tue, 20 May 2025 15:53:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v48c=YE=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1uHPHK-0000ZY-Li
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 15:53:18 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20615.outbound.protection.outlook.com
 [2a01:111:f403:2607::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8aeb7b89-3592-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 17:53:16 +0200 (CEST)
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com (2603:10a6:102:7d::8)
 by DB8PR03MB6155.eurprd03.prod.outlook.com (2603:10a6:10:141::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 15:53:13 +0000
Received: from PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340]) by PR3PR03MB6412.eurprd03.prod.outlook.com
 ([fe80::2887:9068:38f6:8340%6]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 15:53:13 +0000
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
X-Inumbo-ID: 8aeb7b89-3592-11f0-b892-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndq+R88Z0Nd40WYJ9tJBuR6KQcNv84s3dOWikixa2kDFpv/9zypoQT0JVqdAaTo9J3KmH5PnpRK1q2gd9W8S5nVZsClop0MaFcoTEpExAKG/z4EGggrMAsrFJlmR1LFCbTgtfvCqIEN9LPHXzaOJUX0B83IwTMHSkcJ6YTlBLB9ufUdUHhJjGQhILhM42ROp8Xg6rx4NmKWxJJtTvp499g5KwD0M74uxVYS7Y34Y4YuT8B305AKNcsuKhwsnQnONrUUuzQgjsk0juDJ2ZeSNOa2Y05qNc2tCbOnmY+jBTPF0qmjKbtcLhlcauUo1/AI7jRWK0+Nol1AxEt6lbNeEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oT2PHo91Kin9htf70Av5ZJswwWgCA59U8JvihiA5XxI=;
 b=zUN7k39atyzVwVdtZUixZwdTqi7ijQuh2YCHo1OKIgL+8dCpE9NUs+cfnVONpyv1R9lkz7nMp/a/6AjdBrMPWxa1RMWZzQEAmsOz51BCndevX/uDxoLDRllsjjrZNwEUZuez1zq/p8uF9D4Tg/bPxLdIPq15PkGo7h+9TPcHRIu/Rwnb2LfJ43jA+4vyq69Yp86llUiyphhiSX+18yUWFI6Bbj6IP2NIYyKGjTYGbrgA5zwW6SHL/63GLUDVicDpJ8jQ2ObyVvjzJ3OtHJczol5dlrpZ4Y/bM1ud9r0NtTZ5XOjLHS0SAX6sx8LRFVj+O2ycqwngivGHPbUeICm58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oT2PHo91Kin9htf70Av5ZJswwWgCA59U8JvihiA5XxI=;
 b=YvGjee1Cg5V0iB9iYAZkHKqGNvmSH50h19rM/99jarukLeHEvRs7BST89Y/B464Ytp7fSAlryAaVZH/CsFE2jW7EekWgeh6+DLjhalQl2sYcJlCAmSn7f3lnIjDO4Y7uMXi/R20qfDY6ZvZA8xRz4rkThXWWYvb7PlGTLj6PJkLwTxbGl6t8Us5lA+VkBHwTgyvh/rMId045txHay+mOb8mOcqf9gIDi7HWztY0JGFG3pmaN0PJRAGTfG1yQfKznu1XHCgJGfOt6KN1gdTUS8tdRamu312dFK37CaQbgt4yPvHN9p2k7ZXH3IMVHKx94PvFg/l9z2e0ZfEzK08rO9A==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH V2] arm/vgic-v3: Fix write_ignore_64's check in
 __vgic_v3_rdistr_rd_mmio_write()
Thread-Topic: [PATCH V2] arm/vgic-v3: Fix write_ignore_64's check in
 __vgic_v3_rdistr_rd_mmio_write()
Thread-Index: AQHbyZ9LliRAEJcwbkSH1It1IBBGkA==
Date: Tue, 20 May 2025 15:53:13 +0000
Message-ID: <20250520155312.1509693-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR03MB6412:EE_|DB8PR03MB6155:EE_
x-ms-office365-filtering-correlation-id: ffe4041e-70ec-4c27-5544-08dd97b66da7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/PWOQHgdvmAADoadHiKLqjlDTKXdHeaBER2XAwSIa0ohO953iKq6Zg7U72?=
 =?iso-8859-1?Q?lTheUHZE0U0BiLwuzVDh/bhL7BopTQepCOS+9sXZsbpx7lN4BoBpWOhKNQ?=
 =?iso-8859-1?Q?q0ow7jWY2YUjQYmToRgePzZgCheaOKiTRPgrtgVTq51JqM9WS8/wrOLpsl?=
 =?iso-8859-1?Q?gxy8Fb8A1Yl8yyNg5T4c+dllrmswojrg6giXquAvMmTYVF8/k7afdc7O9n?=
 =?iso-8859-1?Q?Htgl2qp/Y3MPkzTFWdirkc3kNpenIk2ffFxM2eMxk0imEIlBilRRyaSPS4?=
 =?iso-8859-1?Q?Cr4ABF8ekWspX/nHdJUfOmDIx9bwXZGJIjD/MbZL0Fovh2X3ZIjsFY8fIi?=
 =?iso-8859-1?Q?n5pDGHCaEjs72j10VQd+Bu0YKqeuT6vNYFnZHTVK69VUAJkhVB/UBsvt0N?=
 =?iso-8859-1?Q?8Vu5LKHt0abYU5mUlLY2KLNW/Dvh+KcQ6+UMy19AonXXt5uiyUiUxNfCNT?=
 =?iso-8859-1?Q?9ksWJvJaBgCFUuI+3ukaOAj/Bo7gNJqaXZKgUAaceMlF6BmezbiUN4laQX?=
 =?iso-8859-1?Q?t95vIsC/8KMgrWZlGDaaDhcEuSEM/tcwwpT7jinx3Y/uPuS3fCaJTt8V6T?=
 =?iso-8859-1?Q?Uy5w7RiRc22tRMSJA1ZGUc9ULf0F86YIGMKudaGVU0dLjxc+Ovm7WFWuCq?=
 =?iso-8859-1?Q?vNlitz4d18OdnvJC6W0Sx7ELiUw9tchIU7zPnJOYV28WQ5MMzqu0WG9HCY?=
 =?iso-8859-1?Q?JuTgk5g9MumiMQQJr9dyadfm1GwYwtEYjLpRzWhqt0y+jCHFU2EgPqETqB?=
 =?iso-8859-1?Q?07qZjSdcdgf+bFqGnIxnWStXheS3B1hv8p6iGrerAgDtMDDFNcqMZbBjmf?=
 =?iso-8859-1?Q?1968yh/nFAhw4/0u4pHXLGo9S5dXneLd7A7SRLiJ/hriYiku9/Kgs8z01e?=
 =?iso-8859-1?Q?eIy0F/MDTEvB3i866QTxKZu+9GCS6J0cPMvMkp2tRs89UJ7nJ/7rHW9iyQ?=
 =?iso-8859-1?Q?G/+/ddoEEy2CMWYGzpM3Kg2FlIUkig/9lADLpJ+ctfZOPd2eMsjTlM79Uq?=
 =?iso-8859-1?Q?Ur/0CJo+kxeJ4MB2/CrSdLIPiax5jdzJCHhHz02U6RvQQaJHs9p7wFkqid?=
 =?iso-8859-1?Q?5TYA0tnJBr2zXM9mxGHt+ggS9EKdThJTUtsuRG6bFmYKjS8pzaQO0YGS/a?=
 =?iso-8859-1?Q?Mscr/WxsphnhWPjydnxgBoExf/Qbr2nltEQ6ZD/3WeWKmeWXa4AY0PPAT/?=
 =?iso-8859-1?Q?ee1nrBK50GkUtRCyE6ERqryXeJFVh/2Q6BUE0Ofnt91xHI/2UK7Bt4dbZ+?=
 =?iso-8859-1?Q?L0uhMsYWH4qwT42zCLY5WtGBvjfRxrf6CfAHzmInApO2Cdo5PsR2giWbnZ?=
 =?iso-8859-1?Q?tt0UNvGR+Z0YQd3eiuv+gBHxBsalM8UeEevG+G7jFvPJc++kQty2/Dcne0?=
 =?iso-8859-1?Q?0dzU1PvoChKB9Ab6BPd9rztAGgYsuxWnjaCsogNX7u6uthCKJoQg9r8GvU?=
 =?iso-8859-1?Q?sm9i0XAfrv+20oIcupUSsERcpRZShSgG8KA62KFp6CuMi6RX4PgXJKaVJd?=
 =?iso-8859-1?Q?TYzoyH0buB8667pxZTTb20x5YtsXzxnT1jRcVYImwvEx5dLMqtc8ehVPNv?=
 =?iso-8859-1?Q?LI72UmM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR03MB6412.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6ZUhtg0Xy/44Dao41chZmJfRQAd/RXRnBg1TXZUiv6dIzjo0NzqLRWTe2e?=
 =?iso-8859-1?Q?SlmfjtH6zwm2FXHNrZhEDZSEtRx2exh+S6B/hgjUv8EKPcaJG1bdmFfA+z?=
 =?iso-8859-1?Q?YSDFhcsFj9pEVygoQ2yrAfdVmW4jq70eF9gmnbIlitgk61pA46n0RTO0dD?=
 =?iso-8859-1?Q?ja98pzJIRktakvPhcxVkCysTDsKI/nhYMaKVt+Q4QRTqKeSqUlxiOdDhQU?=
 =?iso-8859-1?Q?4eC2Bs2BHY75mGgJ7GMHf8rS7W6g+ZZEtIyYSg/udY7Z1ptxq6OOG/biCC?=
 =?iso-8859-1?Q?OJY1u3FKc7lWMGNuOOLserbobd97zuL6+v3xlGDYCUHBoM2E5WszHA/BDS?=
 =?iso-8859-1?Q?dzj6C4RNot1lNHFMX6/U9QBgVNDeUzmFiE6Mr5zd3SgL/iKW2z6F6huVmI?=
 =?iso-8859-1?Q?4hqPLF2OJphvmOd4Qc2hntAV28vwfOQEgwwutcI+BsEKRIaOB1LfmEGK8/?=
 =?iso-8859-1?Q?zYbpfJIMjl83CuBoUY3cYWyY7acQIUjeKZJKpu0f0CiqA5+J0ydHDiBQVb?=
 =?iso-8859-1?Q?TudotSSWyV2ra3iYXLFAsQWW1R/iEM7svaOuvGZe9Eya/5IFjONqufsdGJ?=
 =?iso-8859-1?Q?gbctUaGwoZvfqBh+p2AyNsiIqNV4scKiKsMZXPYsVuJ7bt7jreNvHhacZU?=
 =?iso-8859-1?Q?s0lmkmFSbOpiKMeY6JtvE9jy6gbYYCQDiWuxcu0e/RjFNv0FEfqW9Df6IN?=
 =?iso-8859-1?Q?0JWEqpewBPQtmFsxu+ocFZv0/9xV4BHxK3Qu1ohFrpqpuzkoVHOIr1bFpM?=
 =?iso-8859-1?Q?r0DVJJHwPdw8w/Zuw1L62n7f/VWVXNSHYIhlIZ+3kIUyj/eZYzksdWU973?=
 =?iso-8859-1?Q?N7ng8uQYjYg6GsBW8d1D6idm/KyzzxvSSWguXrnlkPfI03CeQTjoukiyVE?=
 =?iso-8859-1?Q?lhiCOMYuknxbv4KGgXrm9q2viNWzGhk/gWYf7ZFpFuUJ13u04dCt1SKs70?=
 =?iso-8859-1?Q?fNwb3zpdrJj/yK2THlV/4RIkhtvDp2FTZA2KrJphNbBKc6neVeaqZLuxSU?=
 =?iso-8859-1?Q?8RY3ftpHohqU4tnpovsd8wqlg/sfH9OPhZdE414mIBE8+2CrTuN0na62Kn?=
 =?iso-8859-1?Q?GGc7GRMoDJnKgJtRj5TpzGJHiCZ0x/USpgQyDlAecPWZ/sUMhtfjtNY3fJ?=
 =?iso-8859-1?Q?/5TNXWBAPmDQCc4N5cI2ydvqy6wXHXjSmdHRBnzfq9odFXheR/7Dfpqqu6?=
 =?iso-8859-1?Q?wG7RQGIqqh2GBj9OM4ebveWFtv7FYYvV6JlOUz9q48hcxASonMo5QhfJKQ?=
 =?iso-8859-1?Q?yVWD6q4+D4QHT0MYXea7BKepljhGusWViscEjZL/y5lM9a53EXu/lI1BRF?=
 =?iso-8859-1?Q?BMF2ghtUHB/1PE4x6PkuFifCL5JTtF2DHgCYojFfRG1AoiUAp+MeMnaypH?=
 =?iso-8859-1?Q?abp4NBI6qj9FDJ3DjXOmB0gC7doK2halk7/aIijP9JXR5q0AWmqLHHcNfi?=
 =?iso-8859-1?Q?8MTKmT5awG6Tra7zhiLzk4TmludKiaAuD7AKjHaPINortLmKXt9o5UjUJk?=
 =?iso-8859-1?Q?lzXrmKk2Ul4YjrkZD3gYILJbZ1JKOs09u0lTKUZPj0JVwvCDo2W+RyQ7Iy?=
 =?iso-8859-1?Q?VvGgV9kSdGECRo71WAioIGcNM2aq7Mn4gXptd6xbHi24nwHfRFGGZ3psct?=
 =?iso-8859-1?Q?qOEwNjmyNpmA7ycgtiyf1XiqA/PYmq83t5fTOUhPOHSokgl3Udr+p8Cs7t?=
 =?iso-8859-1?Q?heUMIBxa8jUZyNDkNV8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR03MB6412.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe4041e-70ec-4c27-5544-08dd97b66da7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 15:53:13.5618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DocyiYCgJXqxLY2NpBWJMXyZdcZPSP8Nh5xa4CEHQig/8fFG2bo2VDiZirqEInorlva9DMJGzytkftn7iBcjxYacszoM/03CBwgeBYzW9I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB6155

An attempt to write access the register (i.e. GICR_PROPBASER, GICR_PENDBASE=
R)
which should be ignored (i.e. no virtual ITS present) causes the guest data=
 abort
due to incorrect check at the write_ignore_64 label. The check should be
inverted.

While at it, move goto to the next line.

Fixes: c4d6bbdc12e5 ("xen/arm: vgic-v3: Support 32-bit access for 64-bit re=
gisters")
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
  V2:
   - s/data about/guest data abort in the description
   - add A-b
   - move goto to the next line
---
---
 xen/arch/arm/vgic-v3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 2eaa48fadb..f20249f731 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -649,7 +649,8 @@ bad_width:
     return 0;
=20
 write_ignore_64:
-    if ( vgic_reg64_check_access(dabt) ) goto bad_width;
+    if ( !vgic_reg64_check_access(dabt) )
+        goto bad_width;
     return 1;
=20
 write_ignore_32:
--=20
2.34.1

