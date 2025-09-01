Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05306B3E3CC
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 14:58:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104706.1455732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut47R-0002d2-07; Mon, 01 Sep 2025 12:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104706.1455732; Mon, 01 Sep 2025 12:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut47Q-0002bU-TS; Mon, 01 Sep 2025 12:58:44 +0000
Received: by outflank-mailman (input) for mailman id 1104706;
 Mon, 01 Sep 2025 12:58:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noMw=3M=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1ut47P-0002az-9C
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 12:58:43 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 627d5949-8733-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 14:58:41 +0200 (CEST)
Received: from PA4PR03MB7038.eurprd03.prod.outlook.com (2603:10a6:102:e1::6)
 by PA4PR03MB8223.eurprd03.prod.outlook.com (2603:10a6:102:26d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Mon, 1 Sep
 2025 12:58:38 +0000
Received: from PA4PR03MB7038.eurprd03.prod.outlook.com
 ([fe80::62a8:3ed7:1b8e:677b]) by PA4PR03MB7038.eurprd03.prod.outlook.com
 ([fe80::62a8:3ed7:1b8e:677b%4]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 12:58:38 +0000
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
X-Inumbo-ID: 627d5949-8733-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJ9jq0lTFevuC2sr5Fve4nLEtQU/phmAJs7Gvic2J2BIvT+uMx8yDcLEnc4LfFnUOgTx+Re8blcp3e9cfz0Fh1gNwulUF2mVPknTd3qTYjFwytC2WFfJQ+YnxK56bptzhfx2kjDPA07V9TmZn4PFRNGP1HPOlCYJ7KbH6Yt73JMMFftIHjaUy2tqt4MKZwlvr59CG/Q3m74xJkFHY7/E7KGnOAI5r/L+li7JgNLu5ij8pvQPiCfMJemVLh8htHKSp+1OD2s8S41Hs28ctD1M0H1zMZuuGr7lRF3lIUASxcXs/bBWSwFpZYAbmXGTNvdA2ueMo16nHDZmnQwfuFWTxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2o3P77ttyvIZEdJdklFoIAX7E+qAs5JkosERNNnEuiw=;
 b=ykvSSJF6QSBOloH3iwKHX2ZbEdjsd7ANlTRC2MOqi58x0NITVKhntkdCISpGqZWbG804mf1bq5QWkVWAWmm2t1Owi7sJlM32GN+Zku3GSpy7fEFBlWwQpgiIfHezTWAuh5UwSaeAOluLNYksmN0CE3CbvQu/ATi5xQ1kBW5T5R3M2xETRi2fAuNXnIYG2liyeaKp+nPl4S3IXxKGbYh2+IyWG56TVmC2SlqXETidG7CDNEFk3W7EZX33MWm18ADedh9XaWAnr8UfWgQ90eQ/dfPZvu4AlHTUCpF78hfP5o/fyHQYAP799Cp2+yeWzy/VbLi1HDJSGupsZNqfCtV5aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2o3P77ttyvIZEdJdklFoIAX7E+qAs5JkosERNNnEuiw=;
 b=oYV4v/AsrqX9a8/redwRRPulEiv+JVvSH8ckKTcWENlLYLYlZtoe12eQjpIe3tle1wwXehLFDaB3Y2LlOzXHpmugFGzmJMKIQbAI7hviqAUOd1un2nmC4qtgCKhAZzW0K+RLtlqY3lFMslWQk/T+JJDpeNGzm9SjEUUgYHgBs7M1MsnbyZsWjrhzruMflVZoLkoDZvhCoC0yxakMuYqeJktrGACtMAI0DbdsIHb47wpa1UaiGPq9wZoycLOMe67lWI60AMAa8d4r0UUqHDWFToT+aVCNjncl8FmvBMNzNd7ZABwFMc//EFDBQq19Ll/LGSz7Y/OYhyKOCKngQrbOCg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/public: arch-arm: Drop XEN_DMOP_get_ioreq_server_info
 from supported
Thread-Topic: [PATCH] xen/public: arch-arm: Drop
 XEN_DMOP_get_ioreq_server_info from supported
Thread-Index: AQHcG0Ai/cd/D2azrkCw2pxNjrn41Q==
Date: Mon, 1 Sep 2025 12:58:38 +0000
Message-ID: <20250901125837.1271101-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR03MB7038:EE_|PA4PR03MB8223:EE_
x-ms-office365-filtering-correlation-id: 291420a3-475a-4d06-e12b-08dde95744db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?/kwponZ8ODe5zSC2am+xP+seMvncKtTfdx/PjqwlpvYIYPDnWabVQfoPCC?=
 =?iso-8859-1?Q?WoDbh/Ff95UkxRIBf8OfANbSYhO1zmpTyQ0vhXiaFd3Yw2hFoZyuzE0rPV?=
 =?iso-8859-1?Q?bTWCyvkVeiDz1oAuRvoLxbeyZ4nzWX4h71v2L67UXlxUz3c/7S7myosKkl?=
 =?iso-8859-1?Q?O2IrqlPHFv793bg/zkYxtg6nvts6RXiGuqo2f4v25AfLvi/deDswm9KYxb?=
 =?iso-8859-1?Q?YG06g6mvg6MkQp76jtW2PAc3Rp2gIW9R2l+3PV/qY2K6kWeOuroxcA763i?=
 =?iso-8859-1?Q?Vw9BfNJ/wx+7VWmibUy9QSt9z4+Q+9Ua4JhH2vmD8aTrWXxGIA9o1pLSHV?=
 =?iso-8859-1?Q?3lQ6JIevRC7/3JqiQcxCABZVc1bkBVvaaDhWJrdctMLrOVhoJn3KAFy/Xf?=
 =?iso-8859-1?Q?23rZRgm7o54fJK6GlsX0vPaqhBZteErU1BFh5bktgNZ/2aGBb6NIz52kDB?=
 =?iso-8859-1?Q?lScX1D9H6pM1Nmc7Ztw+Q6o1MhBl2pYDLfGk0vn9eC6PnVTzNd5uTANYnS?=
 =?iso-8859-1?Q?Is0HPFWlnpmmQgNcvP5kC8sEQt22mn/TAqVIIqNXqEz4YPQGvfiWoUDz1d?=
 =?iso-8859-1?Q?2obLD34m9Y6mZjbO9sYa/zRsocP5RrZKy/vsttzCjv6xh3yQLrX5qpLqCI?=
 =?iso-8859-1?Q?Bphaew5mhiQIOugEEBJRHF5xlctNPDDKaxu0QHStqv9e01bVevoHoqJAtc?=
 =?iso-8859-1?Q?AYK13LWGOaLoM9bblOTUpUXLTn20t6F6qzoM+NudpWZUw2GxnJr5kzfpH8?=
 =?iso-8859-1?Q?PyaT3gLa6gJPm5DOXIVb1Qp+bNZD69oJ77nB1ArUWRCS4Di6zolKWAGFnA?=
 =?iso-8859-1?Q?0viIWR8vvMJ3n0DdVsMsKvKfA73cFXBCcmqhaYlMu18o8s5V5a90mUiuzy?=
 =?iso-8859-1?Q?A9wtbRUXCwpw3VXbYR8LDZlf82/XJbhdPZxCkWxAy32voWQNIgSXVyb0j+?=
 =?iso-8859-1?Q?yszloa6nIqZ9hW5vA+nfvnxBlXjHzhB4nHr1A6MoPnl01YX0lqqKamD+P/?=
 =?iso-8859-1?Q?2V5jmcTl20zdQdOr1dCDuMOAwyIszGLVczoLcjfQjXOAQFLU1G+LT4oJti?=
 =?iso-8859-1?Q?KDgv+8B6Aj9jcLKFekt7jl/p9l9W72XBqaTSPOJ2crh1sSG754tJVjA+w4?=
 =?iso-8859-1?Q?3qHmyvF4kQFnIoz0/4RjryZYWV/SKnC3QkTUWdeNZX1Ie9jGVJk9z8o7oH?=
 =?iso-8859-1?Q?Q8LwzmDi4dpsouAnILXrYQ8vfWQsa8TJPmBiHp3bneAsMhAMnpDk+vNs7p?=
 =?iso-8859-1?Q?A8aO1EBrG4bebN3bWKWFo2bGz72IViBqvb41fUWb2b+/bXj0D4/hJw+BeI?=
 =?iso-8859-1?Q?R5658Tlxezaswt+v0F+M3ihtUWLqEIAAQg94yZm20exR5WimoqAeGdO7FW?=
 =?iso-8859-1?Q?U/9G5gko6RTfezMDScyBmn4YOqx7y19nyLc0gh4D81NivDir6XugQo7NMD?=
 =?iso-8859-1?Q?bQtO6Eq86P6o0Ygc+Cs4N9/sSvRW9f9yKG1BIuPgoR5Vsho7v2gSBuEud3?=
 =?iso-8859-1?Q?wHbzUgHa6hRIT6WPcyPl3wuVfdulPKffnCXnm7NpBiTw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7038.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?JXWbxKvzOPfNVGooOhlwFSi/w1W/jiFaNgEyn+jAfqcgg4cK4PaLrWK8I6?=
 =?iso-8859-1?Q?Am9jU9R47DU7HDzPBx/+EdR/sc++A5YIThzxUCF9m/g2lZmYbHtUEpPUg9?=
 =?iso-8859-1?Q?cd4TBpQ9N3r2QHPC1GZi912+OeGXyJbVPB2KZlZXBO75ytf+6+lz4jScED?=
 =?iso-8859-1?Q?IRHa2hLy5iX1z+1CH7IokXIvVr5Exc8UNauAKR/hO4m2iYdYcEuwnwRkdV?=
 =?iso-8859-1?Q?oZ9bHfJpvsJTF7+n2X7ZgXQC3e+KE+TCJ/WSPEX5uMZXu8LcIZoBS9aQ72?=
 =?iso-8859-1?Q?TNgpsl47bHX2dNi70mPFVE3BBqTlEPE9aof2hbaeABIEQNOyJYbJJgp8oA?=
 =?iso-8859-1?Q?c41iu7mZIjK7RfM/PVOsnL/UcvjgF4ujz0QzznL+5XyJe9zAZKsk+EqiWy?=
 =?iso-8859-1?Q?pdVU70Y5Kux06i4X/XNWlKcP6kqQhqfoYxMopAtxARTt2IEEMdCwgsu3Z6?=
 =?iso-8859-1?Q?a85c279DpfTDV/ohqeVPHwc9bL14xiK1XDZWEEl5ER6y+/Ht3VRhLK4iOG?=
 =?iso-8859-1?Q?w+r1g7x3tbtPsyUHw/a6L0M25NQzZtDZEp6Btu36OZHO4lP4emtnvT+Grl?=
 =?iso-8859-1?Q?nnhKvEucYGcSwPwDe7/LeGWIV56pxraPzxL/vZHWlp8HhhImljAbFFcQ+W?=
 =?iso-8859-1?Q?ohEokl1h39/SK5acTMlbnoENPi0F0ziTbc7cH1rGo3l5sXsBrHGLYKXhae?=
 =?iso-8859-1?Q?lWuviznw8vzlDVARZmoCzkqZdJ4JVdzUKCZlYd9/7wm1xAw+jtp9uC3St8?=
 =?iso-8859-1?Q?oZEGRjhzQjLtGwZWobBzgLz0FjaQVH7h2TPO7+ek+GjojhN2RZAWyDluBJ?=
 =?iso-8859-1?Q?2vAdL3nUSUJS01ogvxC4rySt0gzjzHVTAp0MlwCS4YoWnogUsl4mw5+exG?=
 =?iso-8859-1?Q?sTsQd6OBUdSuihHe5SpdzyF0hOIyHVAWluSbd7cgouq2NPjgne1agauhjJ?=
 =?iso-8859-1?Q?1TNXbjWh3gcBB93MWijTQZu9zVHZ8xWAbBsEbYytfvbGf4HwDbouCD9N95?=
 =?iso-8859-1?Q?plxFSG49eQlMMHo5gXS8kvsemLvX1kldvbbXD42QOGFHdSxEPaiY2wq2o2?=
 =?iso-8859-1?Q?rh5Yk1GY4ZUSUje2bOdMowzZDWBtR36jALcZ+QraWv3vxRV039LClWvvVT?=
 =?iso-8859-1?Q?rI6sNPKO0I82h/UuebkfyuRxLlEb3eHF+lEkVdi9ztIbS2ClA+7uwBEhJV?=
 =?iso-8859-1?Q?Htw2ZfqCLNlH10xfeMOJQ8qaCSnL3+QAUc/dQOO+0t2otHCkFFaVmuDDra?=
 =?iso-8859-1?Q?OxUcHSXc4ktSmDWdDhHHbCSojNYlGgIS8pm2Eg2ZPBjYIPN98hDNR+SmaW?=
 =?iso-8859-1?Q?rY4Sh9TCN3/nlvhsZUC62WXPEHJN7BWA6eIcMO7luDFeaDexNFXoddtE0o?=
 =?iso-8859-1?Q?P50TyoIdN9aJQXwPs//6VY18dWhGB4c4LVAEM2iqZ5EBmpadjE779rtLk2?=
 =?iso-8859-1?Q?Ec8YuBB+s5axQn3NZUAwjzrf80HCOWTfCsDB93epI0bQKsHzQCLDfYNqkm?=
 =?iso-8859-1?Q?JyBIIQVdpRQYtxMgB0oxPf0o02TTzuFRxUJDPPELFdNWGqE0nIRR0ErpwU?=
 =?iso-8859-1?Q?c3sVKe9k2h6fFlx3DocDHjginzZEd1IBPb9hd3gHWuCs3ExbtXs/blgrdS?=
 =?iso-8859-1?Q?M9HLbw9z2ToDsXGUX9azKjtBrBl5wxaFpsJPX23IsgmmQRVwEIpQwHbzRw?=
 =?iso-8859-1?Q?ThsIFzES95CPcu9hN6Q=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7038.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291420a3-475a-4d06-e12b-08dde95744db
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 12:58:38.2855
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WEqm1pbQo8bId71Bgu1Sa25g6EwIuAOELqt4ZzV+sEEINmYMA2y/ydRX1pY4o18WFrnZhD3qy7sEo8FgWSn5LnJb2Jo43LwoRxCc3M9mB3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8223

The said sub-op is not supported on Arm64, since it:
 - does not support the buffered emulation (so bufioreq_port/bufioreq_gfn
   cannot be returned), please refer to ioreq_server_create()
 - does not support "legacy" mechanism of mapping IOREQ Server
   magic pages (so ioreq_gfn/bufioreq_gfn cannot be returned), please
   refer to arch_ioreq_server_map_pages(). On Arm64, only the Acquire
   Resource infrastructure is used to query and map the IOREQ Server pages.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/include/public/arch-arm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e2412a1747..023cc2f468 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -130,7 +130,6 @@
  *  HYPERVISOR_dm_op
  *   Exactly these sub-operations are supported:
  *    * XEN_DMOP_create_ioreq_server
- *    * XEN_DMOP_get_ioreq_server_info
  *    * XEN_DMOP_map_io_range_to_ioreq_server
  *    * XEN_DMOP_unmap_io_range_from_ioreq_server
  *    * XEN_DMOP_set_ioreq_server_state
--=20
2.34.1

