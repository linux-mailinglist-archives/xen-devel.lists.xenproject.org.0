Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CFCA66268
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 00:08:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918192.1322920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuJZ9-0004Ei-54; Mon, 17 Mar 2025 23:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918192.1322920; Mon, 17 Mar 2025 23:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuJZ9-0004Cy-1p; Mon, 17 Mar 2025 23:08:15 +0000
Received: by outflank-mailman (input) for mailman id 918192;
 Mon, 17 Mar 2025 23:08:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEb3=WE=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tuJZ8-0004Cs-BC
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 23:08:14 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f403:2613::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b30fff00-0384-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 00:08:12 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAXPR03MB8015.eurprd03.prod.outlook.com
 (2603:10a6:102:21e::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 23:08:09 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%4]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 23:08:08 +0000
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
X-Inumbo-ID: b30fff00-0384-11f0-9899-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gihpf9zPBTA12I+Wgp3vznpi64udN0vrkjarJczbmjLEmaHy40JmqKMvxyGksWXX1pXbYIszvrLJZUkk/bhvsEbg6xbmRDkevyda+PeuBQnT0XRBOw53xk9ZAIOQGHoSr0cj1Y10b3yWQ3gszdervo+DLc/mRd580a66qDbzY0yM5bbQuF4CvljqfBmGQiP09vo8rOGuyuZ9HUIxSuPv2N/JqRNA3a/OirjxsyWQZhRIyerJ8j5+Zm9nykgp8ms5a3hs/CONFtmpUIpoimQuFk1gxKl4ifZZbL36h5oXSHsYNh/nugXl10FSX6rQjFYsnXKAyAjG2Yr2KR1/J15wVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlMwrJCMLe42goTjVdw8aYjZxe8B17WCQCexhbej2/E=;
 b=NlT5wUn6RC6rPfyx2p1+4TAMQVK1UKe/l6Xe6/+B3NS6x80py9t2VRlgSNFbw2geycJq/HTAv2YGtUVl+PjNj/m0v3Lt2SyJ7OB2LKVTqrraa1q/fUM/I12tpNL3lX7sEkyeX6aiUiOYCjgTakbFndw+FV+WNiy/wna8QHt4xSU3XIRQ2SRy4wwoOqZxf2ezg6/6QSaYV66qeNLyRHjkEScGUR2Ba//Qj3nLx7SeTs5irS1/h2bxDo+viBTMntAxEmSZzWDH0CDea7bXNMgFKoQ9y2djM80+ARbCLyO1hQc4PvDcKI9uZe4mXLt6QaEq7wnnRmqZFP02pKpz/jROGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlMwrJCMLe42goTjVdw8aYjZxe8B17WCQCexhbej2/E=;
 b=IRPN8cRMXAZCaC3JB7HRNnDfxShC0KCiPM7LSDNgLWYZ2KWYOauqGjdUXYlNDN0My8soZTlFRaNre6tIQsqn/bmMC6Wuz9pHX94/EwoPRkJ+o2rkjL06UTJ0lVgc6lJmbDw/6NUWfSszLeTPSRHGNEDjTImHt3iFI1oOftfehelAf/PotIshssrdaub8QE+SiIqm03J+wTEIGZDo0GrGYlc0D/2CI5wlf4DFowNXe8xVOMgwkCi5p2WpamhdZXH1iCy65UB0J07cUdkJKy8C9y0IYEgfiJyUVmhGYPnN4tDquh2QGOWfoPKz3IZH63wJOE4S1WtCJ7Z8+EDSn2WsDA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>, Petre Pircalabu
	<ppircalabu@bitdefender.com>
Subject: [PATCH] xen: vm_event: do not do vm_event_op for an invalid domain
Thread-Topic: [PATCH] xen: vm_event: do not do vm_event_op for an invalid
 domain
Thread-Index: AQHbl5FytTUpgHIInUKTmFbOO0oHkQ==
Date: Mon, 17 Mar 2025 23:08:08 +0000
Message-ID: <20250317230806.1179478-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.48.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAXPR03MB8015:EE_
x-ms-office365-filtering-correlation-id: 6bfc5ee5-722e-4dad-6f68-08dd65a8953c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xiKZ6HEk/xLSom46P1sRm9Vp8MUv0WS9Z8z5m2TGzKGy8VLqD+Ymu2daRc?=
 =?iso-8859-1?Q?PKPWBR6ZNBAnQfmFiyuYSuLXexQjsFjQTuLJ7005YRlDCtCfOQgGeQUPJI?=
 =?iso-8859-1?Q?Z4z3PTHetnRu0AZ6rcEWMQGPj34qg2+D9pVNILAs3dT8oxsALUQ8GlSKrb?=
 =?iso-8859-1?Q?9QJgtcuylfP6prj2fDsXPdOWg6LJ9EnxXtJsCEIgKwso2qLOlPOlEv41kf?=
 =?iso-8859-1?Q?8+ftacnigrXfpB+vM++5XhWEOrlQ1wOGTBTb9/9tx7XVZMWqxcGWRC505e?=
 =?iso-8859-1?Q?DFuEBnodTuxHlbOUITX991yYOfTaoZckxbAGFjZB0MmsAiEPaM6l8IUcQW?=
 =?iso-8859-1?Q?JwKtP6N56f50hvV3suTxvoBpBOkVES3GmX3NYzphsvYp1wKXPKsQZidLeV?=
 =?iso-8859-1?Q?cMGNkPdFklyplR6Rj4yheQCYsd16fcJU6HFNj6ZbaTkH7FB7HLh1q8OmRu?=
 =?iso-8859-1?Q?7a7pHyDCKvguTOSrkXyvv5X9nXoRbXW6P7MVby79boDQWIANIr0cNkIJa8?=
 =?iso-8859-1?Q?8+nkJleiQHNbAnVhxZbXK7Xd+p8nUH6N1rbcZInYc3JghMR6JIVqj4lGtP?=
 =?iso-8859-1?Q?cigJoCF9ShdnzdbwJMe3tp25dbdCefQ74tDJs0ryt7P7ON49b0AtQF+Suc?=
 =?iso-8859-1?Q?H8AgkULgWonI2oUKMMjADcnNVp0Il8lh3XFHonk/Azi6WTRSrC5tQCdcSc?=
 =?iso-8859-1?Q?C083FJEL6pKOQSRlMOoPAbGvOENXY6zMspq6GWkM6407LJlZolj0vI2MOC?=
 =?iso-8859-1?Q?KeRY2Ws148n4y7pYG0C2yNmFpVvbDO6/SNfFQx7UG5+IEh7YAy/CTfv59q?=
 =?iso-8859-1?Q?QhFeHApTfPDG0TeaxkxWeTa79ceY1xp+YN48RoLd8ISgIX2GMZau6HNWSo?=
 =?iso-8859-1?Q?VrMbOPHo+Jz3Z5olU82CbSmqoMAwUUwjVmEmQnjeIz2mONPJuYNAQdvuzV?=
 =?iso-8859-1?Q?M1lpQ1aovp62o8k8r/FdStkx6qw/+4JD/kL90SWgMC3eItTtR2qF021HGW?=
 =?iso-8859-1?Q?qrl5a9WjCThM0carssNyC8bd1wgRkligsof+25jy/+rRAFMXzxMQHhlQO2?=
 =?iso-8859-1?Q?6RFfGOoBuZ+7O+LwPB6J+coEXElo9Lt073Az29OnIJoKNHTLskUY6JWnVT?=
 =?iso-8859-1?Q?y0fw5fft6TKur7ocTxk19D99jkZwBJ/BLeQEOqvrErDIVaS7DZciER04DT?=
 =?iso-8859-1?Q?NgfOsXvrodh5bjihWWKBHWPd9FMHMi2VomSl2OHjc1qChhh7RracmAa6C1?=
 =?iso-8859-1?Q?ydruKZQ/RJVwsY7Zx/gth/2AQVNqOmxuWhD2IZTyjmVV2N6O0JiQdk52dW?=
 =?iso-8859-1?Q?64O8TzdfDkb2K42EA0KbuyLv7uigavrrGAiO1pLkRuByq7jd6DEaOMhKV9?=
 =?iso-8859-1?Q?fZwik+LU/ugehmCSKRgyKIiZsEMRJwfUN/MYd1kzQ/cxO9+MaIABodOcUO?=
 =?iso-8859-1?Q?Xjw1TOI7LyPBVdaLlw7LE+b7uWDNQFIvXTz7BYb90Ly8kUHjmWEnoi1DgZ?=
 =?iso-8859-1?Q?GUUAdMdgur5+nmtwAfqxkf?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KlwNq2ckI7SuQVbECYIeyF96FW50XYvhYF+6mZ6or2THROYiqsDRqyWM8W?=
 =?iso-8859-1?Q?ap3ZD5Fe3ttio90ndOGIgn9ZwPHaYwrD8LzbJP+uygLFtbb6HX/jayMSxa?=
 =?iso-8859-1?Q?XEdaQ3xUjO5k+doYmMaofmN9uTPRg5Ui+RQS9f+gwYtx5xJMQ9rfgz4XOT?=
 =?iso-8859-1?Q?9SOPA8sZt3zIiZl3gOrIFzSeMPrUsKX8yKvfQOL/unJYCU/Ddyi0lmF7gM?=
 =?iso-8859-1?Q?wcAwl2vwrld7JhABvHVT2KTVdQ+FEs1kvIOSum0r1X6lTuDNo6Y5u0sdsW?=
 =?iso-8859-1?Q?Wvy8vs6ILZcKwMe+nKM6ZzQA4j49aneImHDis/q0Q1meEjrSWcJAhP4dea?=
 =?iso-8859-1?Q?v1wlwzTeKxKAMmUp026ulLK5dV72Cy4Eod+IzYVunGSPGNwJedfUabLpgK?=
 =?iso-8859-1?Q?/NdBl4yoU8ul5i+ix3gVbzmjt9Q8E5vlD3ori4nysHo2P/qyjIXIU1LRPv?=
 =?iso-8859-1?Q?Jyv6Z4O75YbTrplWB6gg0GsMdzLJ82lvMOoJ9K5GizBWkNNhCBGdIcI1Ai?=
 =?iso-8859-1?Q?o0jrLNH98SAl3UR3Xl6BotVUyPHt7Bwi7zjZpqJ3INBBzZ6bFe/XBK68X0?=
 =?iso-8859-1?Q?4Bd1f34Ahrd6nj8SLCDpg6B+5ekIRA6sgxbv7hq9C1SQGpZ9QHTo1dwZm0?=
 =?iso-8859-1?Q?3JBsqkkwxTPRHgcL1732+iqeLno8x87xs+D3lPYcMNfIyjYLx/4NDLSXHx?=
 =?iso-8859-1?Q?tNr9R4HVPwRo1Aa0bEE7z1F0ulwJc0YqJ4jHxGG1jEM6pmAOzZVEZ0MRGO?=
 =?iso-8859-1?Q?GZzHjObEGxtGfxq0ErIxr9qMkBSY5c/DXSuTJ8bLSQSab21ihgNjTniN0w?=
 =?iso-8859-1?Q?atN12ynNreCh5hm9pN8v1+oV3KXhKMr9MYMVV8pa6uKBKgzIT/N2rvzup1?=
 =?iso-8859-1?Q?JPkO89D5d9WDq8nYQ/2aDjTsBjVIu8FjANMr0k11ZVNhRRDzA6lqhoKRut?=
 =?iso-8859-1?Q?/375MUKljK/ReGfNYWCW/f23OJM+Hg2hOGMS9cbQey2f2s/1oAQVIxvxf5?=
 =?iso-8859-1?Q?j+FlbmGmfcNvPHpT5AgX5aEfSgYl1hHfnS0kG9lkdXYzialXcN30DK9EKD?=
 =?iso-8859-1?Q?atMvbQWp7KtAS8nMMUXU9/tmSC1CjH3VlOcXb85pp9NQSqoHwvMugAx9Oq?=
 =?iso-8859-1?Q?VxNS9G43Gx1SSEF2SvWRNDwuKn/Uud5lBs3Qn/x7GKi8wCTARLqZdNHXGS?=
 =?iso-8859-1?Q?wtHq4Gx3Q3CbAY6nGr28vSCe1+oNR0Z5Qa3/1dnjAyBGPFd3VilhvUDJ26?=
 =?iso-8859-1?Q?4VJyW8YdXlP6Edr0eI6X7b5iZmoNm2D/DSen0YlV6BNwO6lbi3DGrcPPfp?=
 =?iso-8859-1?Q?pIBAi5RJj6bcKd7bePnfrEiH+LUWRyeOGZu+tncpLA1G9JqPbRYsdXJMmg?=
 =?iso-8859-1?Q?rcGZiVEbnkxuEkiEh47yyW9x25DZzaQKB6spr0UYnkaVG1vZdRBB5Cg2Bb?=
 =?iso-8859-1?Q?f4o5XiLhLhHU9H32pbD3YPhhATWEplsEE/WPXjACJhAtUhSeFjax2NqzZf?=
 =?iso-8859-1?Q?+c57w26LtBHoNRNOS4+3+YoMn8jQpTqKYYjxTA3sNW1b5GmrISKbY6AV4/?=
 =?iso-8859-1?Q?n6HgPwY/30z95IHw/zrXw8xzJ9KfTBl25nQuKbGoJIrlmdV8+G1HBwL30p?=
 =?iso-8859-1?Q?3K9iqAq53CDY5ar5Hgjf+eaKWq5tncX8J/O5u8QE/c/3+MgufNoCeaMw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfc5ee5-722e-4dad-6f68-08dd65a8953c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 23:08:08.8573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69liaeHsV4NZgYMEBZfPbqJYwbrdAzB5G1B6s+XNvdMaNah4MART4ZA2Yn1BCVkA/cDt421XarURE038qxFg3/GBNLYwTpEfddvq//92ECc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8015

A privileged domain can issue XEN_DOMCTL_vm_event_op with
op->domain =3D=3D DOMID_INVALID. In this case vm_event_domctl()
function will get NULL as the first parameter and this will
cause hypervisor panic, as it tries to derefer this pointer.

Fix the issue by checking if valid domain is passed in.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

This issue was found by the xen fuzzer ([1])

[1] https://lore.kernel.org/all/20250315003544.1101488-1-volodymyr_babchuk@=
epam.com/
---
 xen/common/vm_event.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
index fbf1aa0848..a4c233de52 100644
--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -600,6 +600,13 @@ int vm_event_domctl(struct domain *d, struct xen_domct=
l_vm_event_op *vec)
         return 0;
     }
=20
+    if ( unlikely(!d) )
+    {
+        gdprintk(XENLOG_INFO,
+                 "Tried to do a memory event op on invalid domain\n");
+        return -EINVAL;
+    }
+
     rc =3D xsm_vm_event_control(XSM_PRIV, d, vec->mode, vec->op);
     if ( rc )
         return rc;
--=20
2.48.1

