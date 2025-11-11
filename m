Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC91C4FF23
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 23:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159421.1487753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIwUs-0007Gl-Tc; Tue, 11 Nov 2025 22:05:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159421.1487753; Tue, 11 Nov 2025 22:05:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIwUs-0007Em-QS; Tue, 11 Nov 2025 22:05:54 +0000
Received: by outflank-mailman (input) for mailman id 1159421;
 Tue, 11 Nov 2025 22:05:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiK2=5T=epam.com=Oleksandr_Tyshchenko@srs-se1.protection.inumbo.net>)
 id 1vIwUr-0007Eg-1q
 for xen-devel@lists.xenproject.org; Tue, 11 Nov 2025 22:05:53 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95d7c938-bf4a-11f0-9d18-b5c5bf9af7f9;
 Tue, 11 Nov 2025 23:05:51 +0100 (CET)
Received: from VI1PR03MB3583.eurprd03.prod.outlook.com (2603:10a6:803:2b::12)
 by AS8PR03MB7832.eurprd03.prod.outlook.com (2603:10a6:20b:400::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 22:05:48 +0000
Received: from VI1PR03MB3583.eurprd03.prod.outlook.com
 ([fe80::2bc:5a50:f3a5:29b8]) by VI1PR03MB3583.eurprd03.prod.outlook.com
 ([fe80::2bc:5a50:f3a5:29b8%4]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 22:05:48 +0000
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
X-Inumbo-ID: 95d7c938-bf4a-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOBsIUnQ3ntrypGI5K8ttSoLtYCd/MlqTBHR5m1WncV6Pyd+5eIjC7BVazXZjkoqf/lttjwWGhHfv2LJG/nWVT7BZqOWx6n2cAxdgOIiCUP3MpWw2QYQK+kftTsrWLyBMCFYt7hbWiDIOVWC+d9tYXRM/PCVXUHmK9+BTRlitoFHdNxmiv/i5S2VsZokJNMzcNgz4UPINZUphevCE8W6kvvtR/KxP05CS+BNH/dcAKgul+wrmoTJ/OlvChhtd9j8obUdGlMiEt1yg2i8upd+YPR3eM5RqEJNERCuioYsRW91DHSpyuDh6vSz0uEIUVJ5ugOrSWL8pBPQRDaZvwSg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=latH6tYcpoTTr0oBLr56i5bL242qq6FJCNkhqLqSt0Q=;
 b=cJ1W50gbTkxQggEM5VGfjdi0MU4OZcExfq/6dikZlA41pEa0g9oHkyU//kIDz94G2kTXXsXD5u2TaVSJWr667MoQl1pn14gjmShBK1FgD7w1VBHnK25WIwwN8gPpclTa7O7rajX3mn+Cbs7sEWTVVgXXcnmoktiMDvszzYAWN/PTHA9pKjBkkC5wQrs3HvSunLI5l4zkcmm6/Cvf7m3V3qu58JPchHQ6UxFWNeNtxBGdZKnd2MGPjGcnJeI8UeSN2qY/79BLjFDlOGKaV2tgS8mbLzot3jmOGnLbyBMyMcjM+VA47tx1nYvVcjXpfTjO+0ec2po7zptmBd3lYniTRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=latH6tYcpoTTr0oBLr56i5bL242qq6FJCNkhqLqSt0Q=;
 b=ZCmVEl67kKYK76pMZFnFjmxG2ptBzbTKwTpwmEu0H16+tvf5u75M1yQMXzcPJX1kqQ/yKciqFuzSWrChoFseI4Lo8gcNeG6xBGgRcPKb28dqPXGqyAGKAj++LKdkLhbwxQfUsdrGH66kLpfsoj1ydhDaJM4kLuSTUj6OmXrH8BJszm4uKeT18PgVqCvyOA8fAojKVD/lzbSqTte2azNIZQbIUwYmtvjl8R/Tp9wCsw0mwCa5tKPGwseUJy6lbrHLXmbt+EjriWdAwed9DGnxhCm7+zTgvLvdYcUdaxXvelkJw+AFXzaTOsDsA9pOfR+26UcF96LN6aK79br7mqXY/g==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Ayan Kumar Halder <ayankuma@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [ImageBuilder][PATCH] Add DOMU_TRAP_UNMAP parameter to control
 unmapped access behavior
Thread-Topic: [ImageBuilder][PATCH] Add DOMU_TRAP_UNMAP parameter to control
 unmapped access behavior
Thread-Index: AQHcU1dVYvgILOSeA0Gujbru3cwUKQ==
Date: Tue, 11 Nov 2025 22:05:47 +0000
Message-ID: <20251111220541.2531935-1-oleksandr_tyshchenko@epam.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3583:EE_|AS8PR03MB7832:EE_
x-ms-office365-filtering-correlation-id: 6c174c6c-f63a-400c-ed5a-08de216e7868
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|42112799006|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?hOVj+Sc2Uqqcd9bWzAUzS3BWQ4aAP7GeJ8iTLWNUTouKlQwigmUtrmRRdG?=
 =?iso-8859-1?Q?09l9n42RNdtO/JRjOfHG0h2V2sW/isDySVJ6KAN/UVmapQDOWQ+jQTMNdK?=
 =?iso-8859-1?Q?5EPkXh0sPeP5AN8x9DMAuw/3Y9jZPMznr4u07VTpsmi+gmId2k8wNCs9z4?=
 =?iso-8859-1?Q?hQw2nWucRaNFkiHuKN3+5VJqw1+OcR4o10JucjbuD1OL7OxGvoDBcbLj8C?=
 =?iso-8859-1?Q?GFSCM97wCf9gi9URGjQRASQapbglSiUrDDa2UEi1EL0TThdY8XxN4l0Avr?=
 =?iso-8859-1?Q?v+sgjmQfUcKHnPPaEqhZeBskaJQgYPIpQNOdess1m/fg/NBFJccABsiZt9?=
 =?iso-8859-1?Q?FD3k0hXrAfYTOwEsDRMjvaAy2IN2rnGeoco3yzDU4MODAw3qv2davWqhlz?=
 =?iso-8859-1?Q?MmfnTeS7tb4wDv+sTdYCPjVXepftUVypLVCU6f0gDhBjxnJs1Mv9xsgb1t?=
 =?iso-8859-1?Q?nNTfiIcl5qaQHZwIbG3oQsgeOr99GKwpVq9Ov3+jpAXfRza2Id1/mmLlk6?=
 =?iso-8859-1?Q?xQO3TDQxmJmj+3crdH4hh0LkRw5gUOJl+98kA0MkuiMlfKK6pthZUCe3lR?=
 =?iso-8859-1?Q?tZ6mYqEYH/kdjA+Ws6URg0UZFa9pDUBCy0FEdYV5IwtDmlW7LPvoDIk2tn?=
 =?iso-8859-1?Q?wf/IzmZojRLhIBX+qX/gYbsA83toWgPCKwJs8ovjfeJ3gjAKGEsXbBsRDP?=
 =?iso-8859-1?Q?ty8BClIeJF9PepF8Ul1A52ZjSlPrpohPk++X/VqSpdEFVpp+RH8WmwzPiv?=
 =?iso-8859-1?Q?o3xUpCtfCGUM8BiTAcMrC/jJm1mByc/v/GgDW8sGssGAmaJTxkx6kvNhsb?=
 =?iso-8859-1?Q?vBpTyCk7POfLqS3cezpy1w4ceWP2HghPDKev2K8+iO2TYX6bm22OZPhq5E?=
 =?iso-8859-1?Q?MCvzRjyf1eso4zaOASBss9/ozVsX7Uf1AH34uYa94Q+UQ5jy2nWNbauK62?=
 =?iso-8859-1?Q?gUo7xvBXt7DaR95Lrsgl3mzYhaZig1igHGvDbFp0YQK55VFxrq/fsrZR4S?=
 =?iso-8859-1?Q?qhcel80bPbZqYS68CWS1J+1vcvXEVtJh6SE2LVRslI5rPKii8oRYofEZ02?=
 =?iso-8859-1?Q?0HZLW9aFYz7YNdRHoYlqKpGx4pFeJoCEosStLPOIBHKOXt5EnxfOM0CK5v?=
 =?iso-8859-1?Q?B7eClAQSWxwY+BCRhhzv87Tn4hWMGjZwg57gdL277ciUPFmhDvPxEi/5aK?=
 =?iso-8859-1?Q?1GtFmY8NT0LtkRgMFdUDD34PM8Pom1p0PUgMs9uXspr93obARbdIpqmfVx?=
 =?iso-8859-1?Q?UMTOl4UZ+JyZXSamaCdENopX3qC2/wPtC1bcc/ZHV3XHYTU0VUp+kVfKD6?=
 =?iso-8859-1?Q?c1EHCkjp+3UUxr3zeBdZkjagaKxkTlVO+tsd97nDk7WmnprOmvGGqrK+nd?=
 =?iso-8859-1?Q?Eom4yhKmIwYUSiqZAEB3n9qyuWpA4w+hZyfDiJ/ywG+fBPdCVk4Y1B6z/y?=
 =?iso-8859-1?Q?OV160zGbo3GcGxzVSSRB5ML4G8ZIhSQpoH7h5HHhfywYr0V1IHPqUXfBfj?=
 =?iso-8859-1?Q?cmLugnEYKQdjJdUlXWhi7+PDoHTablVlvyVXj2TknGy+2Z9IgynjGgiFfI?=
 =?iso-8859-1?Q?xEiiNWdx5TEKEsJdfj5Rx6XLLFLH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3583.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OFU04pJ7NJjtQBNdJz/hmK03xWihXB7Wlf19Q2PuA6UawNN77RTGpDfDFe?=
 =?iso-8859-1?Q?LCx5YEtiU0hx8emgGPscLFfix7Sbji3l5OXpwDds0VbWLYNnjQGPRC45Xg?=
 =?iso-8859-1?Q?4ElkNgigSjZeRVohLvXMUFeU+fwiCUuE/ltKXT2L2f9L7/0V4MG4rMHiel?=
 =?iso-8859-1?Q?nnQkUZ/jGl9i1gBnvJAU8gC98pv7rENWnPdwIlITznJv/BvNJqWsWAqrKS?=
 =?iso-8859-1?Q?4yauYhOuWsEuEmIX2dXOAn/SGpFWBm3uoWjWsd5KLUFWnu++She9YDrbHe?=
 =?iso-8859-1?Q?n+cLBQybs6heLZfOdc0OyB1z70Z0csdpIbEkyt2BBgme/muhFBu8a2JwzI?=
 =?iso-8859-1?Q?7tfXV+Gqry3JkazX3eoCsL5qknyHwFTT4//ivA1yKyTLOYo8RzBRXlZSkM?=
 =?iso-8859-1?Q?ZOmJdniDwqgksGkZkjkj8KpMu8C6JKrLmn/HzGTU4x+ovMK7ui23M9Z29Y?=
 =?iso-8859-1?Q?v3qSHwcnGm1sm85vGEp6WyXVwX81X+/qcfFhj79q2R+ESj3mTWaZOnXBfc?=
 =?iso-8859-1?Q?huGO3n6uW8AWSn8HcvgKKHb3VwOgv23mDIxeJ1WD/f1RIpCjNnX3pxCfq3?=
 =?iso-8859-1?Q?pqfhv5UZmmBaJOEguXUzN8vtIXUn0B8LdIWHf2YGX70jtb2eQyZYdQerwC?=
 =?iso-8859-1?Q?0b80UxDz3Qd5fMWcON9I48xZliC8Ey8TcRCdhDZEmPIBCqnGIT8PoJmK9C?=
 =?iso-8859-1?Q?vjJkYpXc3ZeWL697+0STFkXTK1F34jp9VbEsmvARfKqDtzrJmcJ2gPN4Vv?=
 =?iso-8859-1?Q?1Isy6Cr/x+OeVoSUo8K5mLLob35Y6YG5evUSAsdIIE01dz/8E1zB8MUEk0?=
 =?iso-8859-1?Q?ICy76ww7Tg/jju6OfppDO6ROzXYu4Cb69yt3IM/dmUycuXu8UOdFkdfFsR?=
 =?iso-8859-1?Q?vMaGQO17rUhOR/VSOm463er/WWVWKUr2x6IbzWJPRw7nCqaW2wAaRDQyOd?=
 =?iso-8859-1?Q?pQCobtFASUwa7mKY07B5F2f4v+/fgbzJdAbZrMvaQ5ZF813BjdxP/dJ8ZG?=
 =?iso-8859-1?Q?mCq/kK+YNjwuvt/TniA+DCdO1aoK11KzeaMTKlIAVqdecffuk6VgfN+Iun?=
 =?iso-8859-1?Q?hEXC/7Z0B5GOHv7GgiUl+Yift2eYe5Znt3pbk7GXl5t5U1lxNRkJwzM5wE?=
 =?iso-8859-1?Q?ObLiyTCi2+YBihWx80TelSCpEnengGVqNMi3gFBA2gQ0ET/EpCVq/ATNvP?=
 =?iso-8859-1?Q?D9X1LgGB0sObknUrFpLcnYm+mFZaNklBMYh9JOyylXUFtjb6C4vf1hq3hQ?=
 =?iso-8859-1?Q?bWpYz1yl1oCJeOabsxs4C6W5b3+gfwFCI/TPt9XpWOdnlxsnk+psGxbZgZ?=
 =?iso-8859-1?Q?WdiyoO4OAGwEqkEQOt0UDbigfrlRVLBOjIMOYmIe/l9G2RC92rLcY0Hjyp?=
 =?iso-8859-1?Q?VcUDXrbBPL69cFWh+y0+jXoxGubZ0N+B1AVEkwPky8RR4SdhQb+kGa23HZ?=
 =?iso-8859-1?Q?R7ThbVcgzmTJNcFxGz6EwNYIpv9lVoqBy61zlIxdC6xtP5Ol1KDsxvcqSa?=
 =?iso-8859-1?Q?g45wmTXT3tCVQjgWWxLPVZ9ZE1MThS3QXVVcoNAuBEZwmFj45fYm1WA305?=
 =?iso-8859-1?Q?UhpY2rTncwdGGzNyJodg+frq4wgp0z+TwKk7fPvcnDLj5cW3CQn7kJqDb6?=
 =?iso-8859-1?Q?UKXgmlhLo8OgK4yRZ8/+dzIDbzuz0onyuRXAvwLGRGwrDkRZhmEXi6hfBW?=
 =?iso-8859-1?Q?TVVbltFOrxzNCf29DeI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3583.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c174c6c-f63a-400c-ed5a-08de216e7868
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 22:05:48.3196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S40OSPms21HY1L5pNO6Y7FlFbd0c14d7izPXCHCJKueXCwuC4g7l91Tq1B0zW4CBbHA5AatX55e5G+EzfFi4keaj9OS4pQ/bscNssi6pdX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7832

Introduce a new Arm-specific DOMU_TRAP_UNMAP parameter that allows
configuring how Xen handles domain accesses to unmapped address ranges.
This parameter corresponds to the "trap-unmapped-accesses" device tree
property.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 README.md                | 6 ++++++
 scripts/uboot-script-gen | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/README.md b/README.md
index 2efac97..7ec7e7c 100644
--- a/README.md
+++ b/README.md
@@ -319,6 +319,12 @@ Where:
   2: Hardware
   4: Xenstore
=20
+- DOMU_TRAP_UNMAP[number] is an Arm-only option that configures handling o=
f
+  domain accesses to unmapped address ranges. It is optional and has no ef=
fect
+  on x86. If set to 0, domain reads will return all bits as ones correspon=
ding
+  to the access size and writes will be ignored. If set to 1, such accesse=
s will
+  trap. The default is 1 when not specified.
+
 - LINUX is optional but specifies the Linux kernel for when Xen is NOT
   used.  To enable this set any LINUX\_\* variables and do NOT set the
   XEN variable.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index e319de8..7912cc7 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -493,6 +493,11 @@ function xen_device_tree_editing()
             dt_set "/chosen/domU$i" "capabilities" "int" "$caps"
         fi
=20
+        if test -n "${DOMU_TRAP_UNMAP[$i]}" && (test "${DOMU_TRAP_UNMAP[$i=
]}" -eq "0" || test "${DOMU_TRAP_UNMAP[$i]}" -eq "1")
+        then
+            dt_set "/chosen/domU$i" "trap-unmapped-accesses" "int" "${DOMU=
_TRAP_UNMAP[$i]}"
+        fi
+
         if test -n "${DOMU_SHARED_MEM[i]}"
         then
             add_device_tree_static_shared_mem "/chosen/domU${i}" "${DOMU_S=
HARED_MEM[i]}"
--=20
2.34.1

