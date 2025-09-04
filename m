Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07C9B446DC
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:01:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110714.1459754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG93-0005dT-HZ; Thu, 04 Sep 2025 20:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110714.1459754; Thu, 04 Sep 2025 20:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG93-0005an-Do; Thu, 04 Sep 2025 20:01:21 +0000
Received: by outflank-mailman (input) for mailman id 1110714;
 Thu, 04 Sep 2025 20:01:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG91-0005Me-Mm
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:01:19 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebcd3938-89c9-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 22:01:18 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:04 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:04 +0000
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
X-Inumbo-ID: ebcd3938-89c9-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUqBKVYNO1+wPqoL7ggsymvGweaqMrAqsZM+9iJDeWCBTx7vxBwt/oeUL3C99W4ydsxg51zX4wZ/W/oHS2UmU4fgSz3eILfTM8aeOyDnSYrXDbOVtAokch1KW4x6AkDfUlsFbM1109+yxKjtogmzslhQr7L/CB/7iWryXr5Us+O59swTb0PO1gmIE444zSp6NPxd3XOsLxfdBsqghVQfPA9IeAy/OMXU1Fq0gAnqsKgwIg+qWtlZARe7JmloJnnPjfhe+ee2P886kAVeLu2HDn0CUhJA4dYuAr1ab5+TJGlBwYMDk4Zd10kZt6Dvgp2kaR+PL1D8Aqa+AQdjMSY5Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5kUT3eHgwr0S9xZDmX1S6lCOxxbrUCPmHvjlMrO3hY=;
 b=xgIgzhXVFIm3WrpJewoxLH4W+aH5wppTBRWOYWl1vcfBvJym5FkYJ7i+xybAbLg9CpY1RfHxMqvXMQUr13mu9wht/LMlfppNfCyluhj96DtJ06edE++tC92rXwhx1z0n6qHl2+gdBgpANKkGlSLSLzgRozU5NM2ml8pC/L//ljz5SkEFcEmdR/Dkq+CJ0+astIzvumoCaWfBfoUP/pGFs/nCjaBiJR8G+X2ZNPfY2B8R58ivV1u67XLuTu1ThEL4IOZn93IsvS1U4MqssSqnXfVPRbhHJfIwD7q3Vy17XbDNbx4QCnDgXo2Pib1OZzuw/BYVi4pGlXl0BtPtS+RlDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5kUT3eHgwr0S9xZDmX1S6lCOxxbrUCPmHvjlMrO3hY=;
 b=lQzirvgHFcA64PhjJPGCvDN9eCAKfeY+tkHLV24gWhZyXrTmLFIke0st/k1W5rjhlVDJwVkl9Fu/dXK+qCCBIIMM1CBhdsDAH/59ucnSZJp4aqN0M/U6P/FMw67tlCKoYtFjRjs/AP90PvymAeS/tXLmU8lOj9P9kLDIctIHPhqPwDlC2ObSVuUk2GLjir7KldKoPLX1Q+NWl2ceSuPVs+8miVd6AwcpT4AwehFIdgMUmseZcyXxj/Ar+nLi6sRyEjsRlaClEvQmVuk5aORDAqWsExS0tOwsf/eF6buNQ/on/T8Wh6XFy/qpG9uC0fGXvAv6QpiVCWs0sVn+I/FcMg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Julien Grall
	<jgrall@amazon.com>
Subject: [PATCH v7 01/12] xen/arm: gicv3: refactor obtaining GIC addresses for
 common operations
Thread-Topic: [PATCH v7 01/12] xen/arm: gicv3: refactor obtaining GIC
 addresses for common operations
Thread-Index: AQHcHdal7cagAlXN9kSVHBDXaJuORw==
Date: Thu, 4 Sep 2025 20:01:04 +0000
Message-ID:
 <39bc13a7de6db81d6c5d19ddde7d6400feeca34f.1757015865.git.leonid_komarianskyi@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: 140b36de-500c-4c08-b7ec-08ddebedc799
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?WfPNkCDsAab1oza5gJHfJA4FbUWEVfI7pgLIJe1NR+JXRXuCKTkYHPYRhl?=
 =?iso-8859-1?Q?yGlRyJbUZbLuRfSnOMp7rEtCt+W7VPRiA9MIXgxxFwh1DhTkfyh7gakZAd?=
 =?iso-8859-1?Q?yHthrbBkrNtkegB+tmLHS+3LIpIjnaXM6joJLDQ+Z9+ujGFDWtsoGX4VWs?=
 =?iso-8859-1?Q?2CsVjmSrhImoQgeVwt2m0BuzLkRmq52t+05xHUqqjyfShcqfsP9aOWoKh8?=
 =?iso-8859-1?Q?MvFKhRUVsJjXeqp1bXo5hkksS29d+JHkRbiohJFMZ46qm4LW8jFqpD4Efy?=
 =?iso-8859-1?Q?+eEqF4Pl4hE6GAb55cSWvqTS1fcZarwrSjOB3Vo5s+0QzUR2jBHzct8aP5?=
 =?iso-8859-1?Q?ySFjEcDmNGWDn2QzAVeGTixMrKvwjrotUEPfQg3YeSLu94683xve3VI36N?=
 =?iso-8859-1?Q?zqni6efaRQLleTg4eOmHeovE36Iy+Rv2+NE2miaucVStSK1rSNZIZcc4wi?=
 =?iso-8859-1?Q?SJtHcYQmQer7SuA5rYqDzkdmQPQr6XO8k3XSjA93x9gK6909Fk4jB0dX7v?=
 =?iso-8859-1?Q?PgNEvwT0rv7QvIJshF8tglXNWoAJjoe328SsXQmXC09dmmuQsTW7L28v9j?=
 =?iso-8859-1?Q?vVpc6hswm2HxANxkQDiEsnnhTuKzQj+6WfUN2pxpGa16u+bFViOMwQwBpV?=
 =?iso-8859-1?Q?KW/P/w3TtW4beiZ4BX/voxpbynrZ6dkbFlPy7C6TJiMDxxbWSrrmYT5gwi?=
 =?iso-8859-1?Q?G3x3SfsVif0Az+EfjohzS8WG9J5nXpoY0o5PCzoy1aUn+TJm3/0nv/O7Lc?=
 =?iso-8859-1?Q?UwLaT2hBogEDWcryyIkmJRZ4BOPl5MsdzKW6ja+QiHA/+DoWKYwyvH31kM?=
 =?iso-8859-1?Q?NI4PcVNUy2/TtJWI0Kv3yNS2fzoP5tjP3q/7wEzC070bPVotSfiN4ExVsZ?=
 =?iso-8859-1?Q?oqTXEUpNwO1TvdaaiwpOmq1ku5W2pIVuxHBN0j/8dnFzU3r2yih/HjFsOJ?=
 =?iso-8859-1?Q?oy1KguBf0VHgX9urAIonIi/xa3k2n6mElW+gxBzLk89xlJCi6s33Lo/njS?=
 =?iso-8859-1?Q?WKwSGUFfL43vnTI1dhqTvpcKpj4VYR8aBJib9fVHuBKdO4TsEYSycol6YV?=
 =?iso-8859-1?Q?u8sie1EHdOlCOkpKihfqhBIIVPdI9aBG6sbQMpocRqkfqPmJaROlz6aR8R?=
 =?iso-8859-1?Q?Yo/DkmojnNzhI6oprur5MdxoCQ6aSbhcSdFgDfvMLZRpYQQa6wbjX2A/QP?=
 =?iso-8859-1?Q?KonuC4SMN6f+Ls+8NdVoMvf2AkN2X53Mlrcxty6pg4Lp3MmW5+UuSkcB+i?=
 =?iso-8859-1?Q?CzGD/QksFJsyh58End1Wb9On8FGUcAiSbNTiRCJ3N0uo0YLvROANWnZWU3?=
 =?iso-8859-1?Q?jwriE5/410Snvk2y8wa+YVvxLpYIbVV2vYHHZ8kWsTZ0H5HJllwCZuiwUT?=
 =?iso-8859-1?Q?Lv32O2clxxeUnTr2NyZvyLXJQ0WuzXLOHF8g8VMdO+OMy9HjGDG1KoAXMe?=
 =?iso-8859-1?Q?E/k2m5zr8SUorddTgEgn235bSxcT6rGr0nP6gnlOhfLW8GQFLfHrvTvQop?=
 =?iso-8859-1?Q?vH21cEaBu+qavCV4D4eBxb17hk1VsLFohxdAdWpD7Qvg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?w1imJr0Tpl107yBwjkjmI+Dix3hkTyQXIiSwOG7CE7x9L1FH0ASKuo45WJ?=
 =?iso-8859-1?Q?lKkp+QLlSJGddPlGrZNWAMpHdTNmBFmZyrTUu5Nc83P95mS/3ts2YzHVPm?=
 =?iso-8859-1?Q?A6t427K0wVpBZAIiOMJgxheoe5j+K6U/MUcBtUrMSIVJxn1B7J/cNevv98?=
 =?iso-8859-1?Q?kUcbND5WQKhQQHZm+RbuloxozMAkX702jMD7Rll3lAy8I7dP4Kx3vaFaRU?=
 =?iso-8859-1?Q?N7tf/lvw8rg+e1tNG4mrb8N2QrRj+wL21/WJjitfHOdLz9g29fmFQbSskA?=
 =?iso-8859-1?Q?Qde/F+qCUcPdSFnDs9KTs99d068ga/7HxLoBr6uSPJapnnNs1s7P7IYx1a?=
 =?iso-8859-1?Q?krx00cWrh91obOu0GbXIM/ezkKR3muFbI15GgioSS55wpZpTUIPfxj/Yqr?=
 =?iso-8859-1?Q?pQrnnhtocyqJF9K/NC7obdnouStLtrWwyTsiBX/eg1TiVaVGNZDBC5jFF1?=
 =?iso-8859-1?Q?X8DDJTn8UCMF8q2x9vsOltTFjk3Bb2yPlnQy7AHYqQC3yKHYKa96xO+XEe?=
 =?iso-8859-1?Q?uphmTAlryQo9ZDnryKsh0939rw6oi+lB1yui1VnAf4vpJBRso5eDy0F3pw?=
 =?iso-8859-1?Q?6RXij0Ychr3VA/zY0pxODIoGbZwYk5C4hsun4OUaK9jY51sY+P/7FoKJLz?=
 =?iso-8859-1?Q?bEbxVkovSeCpMniJCIjr3S85iNjCqCWU/Y1G0x8DVyRI9hwAxF6EcU5DWw?=
 =?iso-8859-1?Q?eRlgimsRJYn8YqeO5xFz+Qm6yfC50Ab7a6saVHKY0+HTafzKvAwcvUvAZg?=
 =?iso-8859-1?Q?fTL8wmz86FQ1PV4yqdRNN9ytczujgBnYVz5Vsdv4KMPP5gxbkRBWYcBt3+?=
 =?iso-8859-1?Q?WCeKbxIfgiTOmtFuNylNHQ0u943oC/meXs/avdv7/v2/1ijp6Piswue74B?=
 =?iso-8859-1?Q?B59LYlM8o9JULK2viNYiEhMUP9zTlGBKrF7a2pwFpvmESTHYNm3Q/NmDMT?=
 =?iso-8859-1?Q?qTthvo0eqwvM83d3jCI7bSOqqZSbSJ8rBn/ITOJHSXYJ2kTu8GQ4zZvQ22?=
 =?iso-8859-1?Q?8lvbvu6yN/oBDX8Nl7y+cWAuK5ruvgFTA6nqdnk8pz0k2+TFXjhUChcCtL?=
 =?iso-8859-1?Q?xVrQQA8sQg6eRUfuyS8xc9fGPn13MlwbkjThLT0H6sXdcmVOULHIhdw5uH?=
 =?iso-8859-1?Q?VLcqQE9Gc+vDEMupGgBXsw3P79t6Fg6sXUbbE3HHW36XQlh6gGjkd3SdTa?=
 =?iso-8859-1?Q?O2IsnCvfMiCZ2/eKk+W684yKdtU+r1+wrFIrNyiz1dA4lBV9a0LZMfe/v0?=
 =?iso-8859-1?Q?421tkRt3gM4bb92XALGiSW/vT0XbJqVPg92z1yqVi59hrVjGOZOU/qvTty?=
 =?iso-8859-1?Q?cRSQ98hh9wIxCQzuuD8dITuhibFGG+mAIZjCou2riFKERqzaE5VP77p4I5?=
 =?iso-8859-1?Q?RkSXQ0+BhSV+ySoLEA/wEgNln1zRzipm1HItYofyImEebUV59c9bi79STe?=
 =?iso-8859-1?Q?EW5gVq25v93+gqhbysjU6W631WQVu+xDEN8LIzoYSv6anM4qGedPApXu0l?=
 =?iso-8859-1?Q?UOkdkZRMRjMThTV2cCn3Xm8FaTk7ENc6m0kML9Fy8qVZciy7urAhGxR+IV?=
 =?iso-8859-1?Q?lWgm+vI9b3h2X/zXmb9onzh/Nq28ydLnCmZJwqRqyLKlKtxIBPYAKawKqD?=
 =?iso-8859-1?Q?K3ml4YMHdherWbnTTPLqRfe8mpHQHVViWbqP2iFv8vpB0VxVX9vEy3RrQQ?=
 =?iso-8859-1?Q?BQsWRetOdPYPtBN70Ww=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140b36de-500c-4c08-b7ec-08ddebedc799
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:04.4507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +VdXNKgU1BwL0eu9TK3hXv9jY+7VkGq0UH0ToQtr6UtTM7P2qbev/CWomhm3QNIvIWAZbtA4it4NbVtP3I0P47PeJxOtghXHKxvO3FvTKOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

Currently, many common functions perform the same operations to calculate
GIC register addresses. This patch consolidates the similar code into
a separate helper function to improve maintainability and reduce duplicatio=
n.
This refactoring also simplifies the implementation of eSPI support in futu=
re
changes.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V7:
- no changes

Changes in V6:
- no functional changes, just fixing minor nit: changed u32 to uint32_t
  in get_addr_by_offset()
- added reviewed-by from Oleksandr Tyshchenko

Changes in V5:
- fixed a minor nit: changed %d to %u in the warning message because the
  IRQ number cannot be less than zero
- added acked-by from Julien Grall

Changes in V4:
- no changes

Changes in V3:
- changed panic() in get_addr_by_offset() to printing warning and
  ASSERT_UNREACHABLE()
- added verification of return pointer from get_addr_by_offset() in the
  callers
- moved invocation of get_addr_by_offset() from spinlock guards, since
  it is not necessarry
- added RB from Volodymyr Babchuk

Changes in V2:
- no changes
---
 xen/arch/arm/gic-v3.c          | 114 +++++++++++++++++++++++----------
 xen/arch/arm/include/asm/irq.h |   1 +
 2 files changed, 81 insertions(+), 34 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index cd3e1acf79..a1e302fea2 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -445,17 +445,67 @@ static void gicv3_dump_state(const struct vcpu *v)
     }
 }
=20
+static void __iomem *get_addr_by_offset(struct irq_desc *irqd, uint32_t of=
fset)
+{
+    switch ( irqd->irq )
+    {
+    case 0 ... (NR_GIC_LOCAL_IRQS - 1):
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD_RDIST_SGI_BASE + offset);
+        case GICD_ICFGR:
+            return (GICD_RDIST_SGI_BASE + GICR_ICFGR1);
+        case GICD_IPRIORITYR:
+            return (GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + irqd->irq);
+        default:
+            break;
+        }
+    case NR_GIC_LOCAL_IRQS ... SPI_MAX_INTID:
+        switch ( offset )
+        {
+        case GICD_ISENABLER:
+        case GICD_ICENABLER:
+        case GICD_ISPENDR:
+        case GICD_ICPENDR:
+        case GICD_ISACTIVER:
+        case GICD_ICACTIVER:
+            return (GICD + offset + (irqd->irq / 32) * 4);
+        case GICD_ICFGR:
+            return (GICD + GICD_ICFGR + (irqd->irq / 16) * 4);
+        case GICD_IROUTER:
+            return (GICD + GICD_IROUTER + irqd->irq * 8);
+        case GICD_IPRIORITYR:
+            return (GICD + GICD_IPRIORITYR + irqd->irq);
+        default:
+            break;
+        }
+    default:
+        break;
+    }
+
+    /* Something went wrong, we shouldn't be able to reach here */
+    printk(XENLOG_WARNING "GICv3: WARNING: Invalid offset 0x%x for IRQ#%u"=
,
+           offset, irqd->irq);
+    ASSERT_UNREACHABLE();
+
+    return NULL;
+}
+
 static void gicv3_poke_irq(struct irq_desc *irqd, u32 offset, bool wait_fo=
r_rwp)
 {
     u32 mask =3D 1U << (irqd->irq % 32);
-    void __iomem *base;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    if ( irqd->irq < NR_GIC_LOCAL_IRQS )
-        base =3D GICD_RDIST_SGI_BASE;
-    else
-        base =3D GICD;
+    if ( addr =3D=3D NULL )
+        return;
=20
-    writel_relaxed(mask, base + offset + (irqd->irq / 32) * 4);
+    writel_relaxed(mask, addr);
=20
     if ( wait_for_rwp )
         gicv3_wait_for_rwp(irqd->irq);
@@ -463,15 +513,12 @@ static void gicv3_poke_irq(struct irq_desc *irqd, u32=
 offset, bool wait_for_rwp)
=20
 static bool gicv3_peek_irq(struct irq_desc *irqd, u32 offset)
 {
-    void __iomem *base;
-    unsigned int irq =3D irqd->irq;
+    void __iomem *addr =3D get_addr_by_offset(irqd, offset);
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + (irq / 32) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE;
+    if ( addr =3D=3D NULL )
+        return false;
=20
-    return !!(readl(base + offset) & (1U << (irq % 32)));
+    return !!(readl(addr) & (1U << (irqd->irq % 32)));
 }
=20
 static void gicv3_unmask_irq(struct irq_desc *irqd)
@@ -558,30 +605,28 @@ static inline uint64_t gicv3_mpidr_to_affinity(int cp=
u)
 static void gicv3_set_irq_type(struct irq_desc *desc, unsigned int type)
 {
     uint32_t cfg, actual, edgebit;
-    void __iomem *base;
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr;
=20
     /* SGI's are always edge-triggered not need to call GICD_ICFGR0 */
-    ASSERT(irq >=3D NR_GIC_SGI);
+    ASSERT(desc->irq >=3D NR_GIC_SGI);
=20
-    spin_lock(&gicv3.lock);
+    addr =3D get_addr_by_offset(desc, GICD_ICFGR);
+    if ( addr =3D=3D NULL )
+        return;
=20
-    if ( irq >=3D NR_GIC_LOCAL_IRQS)
-        base =3D GICD + GICD_ICFGR + (irq / 16) * 4;
-    else
-        base =3D GICD_RDIST_SGI_BASE + GICR_ICFGR1;
+    spin_lock(&gicv3.lock);
=20
-    cfg =3D readl_relaxed(base);
+    cfg =3D readl_relaxed(addr);
=20
-    edgebit =3D 2u << (2 * (irq % 16));
+    edgebit =3D 2u << (2 * (desc->irq % 16));
     if ( type & IRQ_TYPE_LEVEL_MASK )
         cfg &=3D ~edgebit;
     else if ( type & IRQ_TYPE_EDGE_BOTH )
         cfg |=3D edgebit;
=20
-    writel_relaxed(cfg, base);
+    writel_relaxed(cfg, addr);
=20
-    actual =3D readl_relaxed(base);
+    actual =3D readl_relaxed(addr);
     if ( ( cfg & edgebit ) ^ ( actual & edgebit ) )
     {
         printk(XENLOG_WARNING "GICv3: WARNING: "
@@ -600,16 +645,13 @@ static void gicv3_set_irq_type(struct irq_desc *desc,=
 unsigned int type)
 static void gicv3_set_irq_priority(struct irq_desc *desc,
                                    unsigned int priority)
 {
-    unsigned int irq =3D desc->irq;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IPRIORITYR);
=20
-    spin_lock(&gicv3.lock);
-
-    /* Set priority */
-    if ( irq < NR_GIC_LOCAL_IRQS )
-        writeb_relaxed(priority, GICD_RDIST_SGI_BASE + GICR_IPRIORITYR0 + =
irq);
-    else
-        writeb_relaxed(priority, GICD + GICD_IPRIORITYR + irq);
+    if ( addr =3D=3D NULL )
+        return;
=20
+    spin_lock(&gicv3.lock);
+    writeb_relaxed(priority, addr);
     spin_unlock(&gicv3.lock);
 }
=20
@@ -1273,6 +1315,10 @@ static void gicv3_irq_set_affinity(struct irq_desc *=
desc, const cpumask_t *mask)
 {
     unsigned int cpu;
     uint64_t affinity;
+    void __iomem *addr =3D get_addr_by_offset(desc, GICD_IROUTER);
+
+    if ( addr =3D=3D NULL )
+        return;
=20
     ASSERT(!cpumask_empty(mask));
=20
@@ -1284,7 +1330,7 @@ static void gicv3_irq_set_affinity(struct irq_desc *d=
esc, const cpumask_t *mask)
     affinity &=3D ~GICD_IROUTER_SPI_MODE_ANY;
=20
     if ( desc->irq >=3D NR_GIC_LOCAL_IRQS )
-        writeq_relaxed_non_atomic(affinity, (GICD + GICD_IROUTER + desc->i=
rq * 8));
+        writeq_relaxed_non_atomic(affinity, addr);
=20
     spin_unlock(&gicv3.lock);
 }
diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.=
h
index fce7e42a33..5bc6475eb4 100644
--- a/xen/arch/arm/include/asm/irq.h
+++ b/xen/arch/arm/include/asm/irq.h
@@ -29,6 +29,7 @@ struct arch_irq_desc {
  */
 #define NR_IRQS		1024
=20
+#define SPI_MAX_INTID   1019
 #define LPI_OFFSET      8192
=20
 /* LPIs are always numbered starting at 8192, so 0 is a good invalid case.=
 */
--=20
2.34.1

