Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61040B3C045
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:06:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101649.1454625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cK-0006fn-5M; Fri, 29 Aug 2025 16:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101649.1454625; Fri, 29 Aug 2025 16:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cK-0006ct-2P; Fri, 29 Aug 2025 16:06:20 +0000
Received: by outflank-mailman (input) for mailman id 1101649;
 Fri, 29 Aug 2025 16:06:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cJ-0006O9-3j
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:19 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1867a15a-84f2-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 18:06:17 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:14 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:13 +0000
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
X-Inumbo-ID: 1867a15a-84f2-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9i5qlG+IVYrfgYLzt+V+AkKnZF5n4j1lZynypm5CQ9F+0dQT3StguojV9eL8xba0qXa4/y5UKflMtGERNMHx5sARsJ0h0p6QAXA0vc2x4QhOn5l23sxi+VT+4vMdxcXWkqjXoJsp53MGTXEAT35wP/Z4iLWzRxBpdQroQgfFQHSHbeCKGgrsB1cLf1CqmYXOARWSEmYKdPmnm5JAMWlc4bULPOIcVlDqMoxXokDdwZMD4NyAAGVmaoWXN429JSZ4UiKZn1EeqmxJ27fccal8/bLFRUlt/qQrjHvftf1AZD1GmD3pf3iTpjL1pLwOtU3Wl6hpkmE8jp+KRt26gpHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk7khFfzSe18EhZ0K4NETdNh6Ro6VTyrixUNQx4Nt+E=;
 b=cN2OG+czfsYD/VwfainepvbC2FiDXucVgGTZrmdymcwP4/OT8RRdwvKNFB0ETF7AC/YhWjZ5dTf+UG7lywko2AgDfgVcJWUzXzp3hzauJ2wpAB3m/rLJZdTcHpOK6Kcs7vmYVisOPlRZZrATUy7K2cMDC3CIjQok/YEXd6AJ2N68NaekUXl7nwaAJq5q82LT779y8n4unITFB9Z1gn5AYDllWxzBniC1oLu9ClWWKk1qPihDMtlYlfJzyd5Im5ZGaiQoXrSfoN9nB3Al6Eipp0vIsZJ04RwZL6gseQklIR/+Skpl0qxJ+LiDlq8V7W11kU5sVgIC9hKv57jBoyTi3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk7khFfzSe18EhZ0K4NETdNh6Ro6VTyrixUNQx4Nt+E=;
 b=vjXvvYsu1f57nZhPOzrpOqZlvhhbTnED1sAX+rptbm15BunSgaEyrnLkbq5xM1ohKa6mHwMn29vBs3y4d7FVl4N4YyQ+SlDhLJle+E6ckTX0LHEALdJ6o7z5eSlRqOS/aSfFqOlU6X0mXw6jHgDrfakftk+vz6tDp3SUnfmmf/Y9uVALfaqi9G8Yxl4Y1votyi5SfYfYvTrnh6yi6rLleveQ5icMuuJUioMF7q1vxjtL5IdTCIFVC85/HqgwTsUL02J+14VhfeStNEWGl79r5o+p+wTSD0uNkyedxpKmi63mxdriaJ94P/P6defaV9KXyhYgfGaPdWwUajj0x2iM/g==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 02/12] xen/arm: gic: implement helper functions for INTID
 checks
Thread-Topic: [PATCH v5 02/12] xen/arm: gic: implement helper functions for
 INTID checks
Thread-Index: AQHcGP7XgADFYzc0NU2aQr9cJjulKw==
Date: Fri, 29 Aug 2025 16:06:13 +0000
Message-ID:
 <baf87f8f0dffe33d3674f7fa73eb2488c49c2101.1756481577.git.leonid_komarianskyi@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756481577.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR03MB8676:EE_|VI1PR03MB6317:EE_
x-ms-office365-filtering-correlation-id: 59b4d118-73d4-4bff-b087-08dde715fa6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?tRjGvpSTpU2J1wGbvLW2ZF/B5ZmhJ/2vXYkbAIoSSwp7p7T+r6V6/hyvUH?=
 =?iso-8859-1?Q?nYq8S6ALb5+k+OrWA2UlM2yYq8e/DXdX6zTph5+LAqksJ0VHBp83Zz0wzq?=
 =?iso-8859-1?Q?enbCYrYITzBCVHlNJg6Gv3+9PP+sEjt6NiXzPKdk6LgG3HD1a9kbBRHsDK?=
 =?iso-8859-1?Q?Yc2VXoWuIXC388kzlbr7XtcgS8rIv83tJeDos/dUlNQgm6f/02rq2St1Tf?=
 =?iso-8859-1?Q?XJhaUABpq2MxbfJ5K6Qtv98GGM10ft5yAeEFhQG5okIU/Hxrlchfj6BLqJ?=
 =?iso-8859-1?Q?6Lff5hsFnjY401QyTJCUOrM+4mIf1WESVXvd93zBp94W6nes3MWLq+4Bpr?=
 =?iso-8859-1?Q?+5E0TFizeYJ60sYfZy0oUQtQ7srxeDPHULoOC/vM7OB7OC60HyY3J76SVP?=
 =?iso-8859-1?Q?tb+QvIh8VnIOo8RZBqZUZUHPpizO8VcsCQmsGX2/rWf2oNTDJm/3zemk0F?=
 =?iso-8859-1?Q?OpWtg94eLdvnmHqjSIdW2D55kPWA4+8zBoQ1hzdixgF7QMtWyhhIFvzIMv?=
 =?iso-8859-1?Q?7Jp0EsvZkbmDtmgsk7KBxfOqN2MJh4GkyINCkeItbqPI+pXnDlNnfb+8qV?=
 =?iso-8859-1?Q?4FCFeVQsa5YpMpwqy5RZDb0tuKUqglfWU4IHtQFU2wG71QsXYXWC0RzgZr?=
 =?iso-8859-1?Q?FTirvGzhggvTGz3iAze7d7pojVRdrFcXRZ/FR6eNxEAQ/x0tTVGPiTqTSK?=
 =?iso-8859-1?Q?BCLNGzEOLTMr6eYXZFtiVCj368wrFHHch0XJwkeV9zKPjXSjfKU3YFB7qt?=
 =?iso-8859-1?Q?wdP913StqVCB7Q+PLDKL8lHeyhFZNiGX4RWzhB4c41Oq3xUsr0+4piT4jT?=
 =?iso-8859-1?Q?9odQ4jPzm2nWtlvRkanVaA4ankir4/U/+l2/+VH4UI6UwDbHiMttFUCXwt?=
 =?iso-8859-1?Q?ZtlYrabT/8rBhc98d/xmZy7MUcl1C9R+mB9DKgPNIorWRbp9ikXhl9jcjv?=
 =?iso-8859-1?Q?npQNwQV9kp61ALydlg5iH4MIn7mCDkJcaWjQQjuMZEpefcnA+yPZLwZCuL?=
 =?iso-8859-1?Q?NVdwO+3SP6uA9u09HJzrNN5KV2pMU48Erq15DH0bRi6wdSVTyTATS9QyPY?=
 =?iso-8859-1?Q?LsJ8LLeAqVlmmO6qv7k7vKAV/QZGCovQgDDYMzWJJ3QhzCGeaHF3gBiR5z?=
 =?iso-8859-1?Q?FrVHGrA8upKYYGersYV58yLmDbNOoDLi3au6n0VdzNEtIPQwYEjXYQR28j?=
 =?iso-8859-1?Q?tx+9Vp5Aq32TpxPuQ4n8ZWSMfAB47ryRpttm981+Z8Y83PnOqQKHJjSB1v?=
 =?iso-8859-1?Q?hexpFkGkzpKFPttN/lEkesKEnYeqdk5VcFdo6M99q2DirGkCvSuN/yiNrZ?=
 =?iso-8859-1?Q?8UTt33toB+M89mOnEm5h9LN1pSSH/kykzMdUwipfxBIuXjSksL1vifxULu?=
 =?iso-8859-1?Q?iEUSM6sqxFTlbdPJ4FKW3htQJfu7Uy1eLb7B28gqBzfPJZBOQAz1TNWNVF?=
 =?iso-8859-1?Q?Pj61DO9rEZM1eecf6W5KkVt3LAmi+MkFLDoxW7zA4WZIe6WglR3qen3nox?=
 =?iso-8859-1?Q?e3QDsyMZMAAIYqesUhx+MPD2fJxUviHPe2w7Wp7aF4Dw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?PBvpXDbbLArpW1gh2CgZzY3BApi3q07nG+5vZ2rbF3LDbmwb/RKlv+wLGJ?=
 =?iso-8859-1?Q?rveeUFn5QbEq/PAf3VvrA8kWbfIhbaQpTX9sTUJGdsMTt/9K6havRI9vPp?=
 =?iso-8859-1?Q?eGvKpAwj8q6ENYNfoO+0O/KkteDgbI+qG1I6USLnO7S3QSi8qXhRLqxd6a?=
 =?iso-8859-1?Q?K27bYWcppws63sHeViEWSif4Td57YbSeFX6B3/+/+uCdxFnKOYtSeDrXHs?=
 =?iso-8859-1?Q?l+XuDhA0nv+a/zEKYfejM/x7wvNs2q8JfzDfoZsYoq3VGTdjje3ZuL0MFM?=
 =?iso-8859-1?Q?FL8t/2FecGHzbiOpy36/FtixA7YOePFOHun/hX0OWFXbewWENNnQ6UbHcb?=
 =?iso-8859-1?Q?zl6gGmeK1OfwoNjXW5QIi69KqgbA3fLCM23DwNStIwxgB7HUTaVEJXI8Cv?=
 =?iso-8859-1?Q?cXkX7c5/7zWZou22wYfk+VnpfvYFkURfZyaDwcQ0Mvx5oeH7QGdTHccSTU?=
 =?iso-8859-1?Q?p/H6rKF3OqZdLXDzNeYH2VVnyFIjyd2cZcq6/ZE1KNlXTQClU6XmhAt9eV?=
 =?iso-8859-1?Q?g5HMdhYDp8KQKagC9iV8xonx3wfFabK6+y181ozKuSwG4/pj7IJq82oRYs?=
 =?iso-8859-1?Q?eXlJows8VdD8JQDfAvvCGUZJKBee/vy3rc0N34lyc7XHnGG4xzn8WjqFVi?=
 =?iso-8859-1?Q?ptvTxUTjUwhbj8SBFYYHWQSGAxWbQgLBag6aPfziu6Fhs3uyXFiGGwALqA?=
 =?iso-8859-1?Q?mSAPiY1962fQ4tGUUnXDD/5O9/PjhXlGxfTcygXL1n1LmAVCkjp6jtB1xx?=
 =?iso-8859-1?Q?84C6+68LcbNvXbW4MAC6gcw0ETkFl3tdDQC/yUbtE6kpo6Z/GIQTuffOAR?=
 =?iso-8859-1?Q?cC4mtDXhKk8HPiSI6l8iVcSudpvGXPHmmfyf/rHnp9fj8E7VcS5l5SVDED?=
 =?iso-8859-1?Q?KtLRtJqQ2rsa2oXjjRdrZxz1maEzZI+UEJ3M6EXOyWXEUUtP2jqTSiRwy6?=
 =?iso-8859-1?Q?k3i5CvfJy6k/V0cxLcY75hrlz75qocU9UFuXDckZ1Y9jPSbiJzVzcwkwk3?=
 =?iso-8859-1?Q?cP8n1EpOmKWjXbmy4WU6D78K9goaG5ClDFMg+gijxBxTtdeZeJg9QBdntr?=
 =?iso-8859-1?Q?6WYu+vK3ie5fcv2NIjgyLUuIXLPqvnpdBkXvUA3hOxELTy6RP1ogaH8DOi?=
 =?iso-8859-1?Q?C/4VMNvbpWhVSzJrATzl4i1r1dSJFp9voOQfwlW1R99TP6cIgv6eITSh5m?=
 =?iso-8859-1?Q?ST9giRUvL+9cCNDMCAo49KiHVIfqrJg8Axq1E4D6IElqh2XFWq9sjVTS26?=
 =?iso-8859-1?Q?Qz3a1tZqGECH6GK1MQ7jjFecDWj6U4v9Ey7MkIPX7u40qUf4vEkKzLYpSn?=
 =?iso-8859-1?Q?oKcUsV94DeDfp/e8VFWKEuSWNrTPX6pmVYZanwgIIPcUprtl6WrO3ro954?=
 =?iso-8859-1?Q?qpneRQaO25JrJADSV5grGK/0m5HGFiVQjULQ54cjd1iVT42vbs0ncDuyE/?=
 =?iso-8859-1?Q?pFQq5zi0A7W3C2Yb9o/MpsWhwWVYJxwUk2axaSQRf9qZgkxtSNY6IaTsyv?=
 =?iso-8859-1?Q?yWO4yMyHPyzAKAF1tHOIgjZA5vSqJbEIvB41jtwkrbm1SNWM5TzgO3sek3?=
 =?iso-8859-1?Q?ZzyxcO4KTmQDablWwg0CoGB852M8yCMx7gDsPuF57UPqyie3+fPYwQdTDV?=
 =?iso-8859-1?Q?NgnOMupcDeWANamGrVY4Di0R8d44PTDDkn1UgKc/f/CSqqb+jUDBpCMPt9?=
 =?iso-8859-1?Q?uVwTSgc+zZw6NYDnpvM=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b4d118-73d4-4bff-b087-08dde715fa6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:13.8308
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9E5WrPZ5+VeKljSJk1AHEK75HK5l8Yo9nh1G5lOywOmIezwNST0OpTROEfSI1oZINy4LqJ6SKNMqRTjJDGz1BTQQheZOUl4aBxR2Y7fsrSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

Introduced two new helper functions: gic_is_valid_line and
gic_is_spi. The first function helps determine whether an IRQ
number is less than the number of lines supported by hardware. The
second function additionally checks if the IRQ number falls within the
SPI range. Also, updated the appropriate checks to use these new helper
functions.

The current checks for the real GIC are very similar to those for the
vGIC but serve a different purpose. For GIC-related code, the interrupt
numbers should be validated based on whether the hardware can operate
with such interrupts. On the other hand, for the vGIC, the indexes must
also be verified to ensure they are available for a specific domain. The
first reason for introducing these helper functions is to avoid
potential confusion with vGIC-related checks. The second reason is to
consolidate similar code into separate functions, which can be more
easily extended by additional conditions, e.g., when implementing
extended SPI interrupts.

The changes, which replace open-coded checks with the use of the new
helper functions, do not introduce any functional changes, as the helper
functions follow the current IRQ index verification logic.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V5:
- fixed a minor nit: moved the existing comment to the line above to fix
  formatting that exceeded 80 characters
- added acked-by from Julien Grall

Changes in V4:
- removed redundant parentheses
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- renamed gic_is_valid_irq to gic_is_valid_line and gic_is_shared_irq to
  gic_is_spi
- updated commit message

Changes in V2:
- introduced this patch

Changes for V4:

Changes in V4:
- removed redundant parentheses
- added reviewed-by from Volodymyr Babchuk
---
 xen/arch/arm/gic.c             | 3 ++-
 xen/arch/arm/include/asm/gic.h | 9 +++++++++
 xen/arch/arm/irq.c             | 2 +-
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index e80fe0ca24..4bb11960ee 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -111,7 +111,8 @@ static void gic_set_irq_priority(struct irq_desc *desc,=
 unsigned int priority)
 void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
 {
     ASSERT(priority <=3D 0xff);     /* Only 8 bits of priority */
-    ASSERT(desc->irq < gic_number_lines());/* Can't route interrupts that =
don't exist */
+    /* Can't route interrupts that don't exist */
+    ASSERT(gic_is_valid_line(desc->irq));
     ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
     ASSERT(spin_is_locked(&desc->lock));
=20
diff --git a/xen/arch/arm/include/asm/gic.h b/xen/arch/arm/include/asm/gic.=
h
index 541f0eeb80..3fcee42675 100644
--- a/xen/arch/arm/include/asm/gic.h
+++ b/xen/arch/arm/include/asm/gic.h
@@ -306,6 +306,15 @@ extern void gic_dump_vgic_info(struct vcpu *v);
=20
 /* Number of interrupt lines */
 extern unsigned int gic_number_lines(void);
+static inline bool gic_is_valid_line(unsigned int irq)
+{
+    return irq < gic_number_lines();
+}
+
+static inline bool gic_is_spi(unsigned int irq)
+{
+    return irq >=3D NR_LOCAL_IRQS && gic_is_valid_line(irq);
+}
=20
 /* IRQ translation function for the device tree */
 int gic_irq_xlate(const u32 *intspec, unsigned int intsize,
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 03fbb90c6c..7dd5a2a453 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -415,7 +415,7 @@ err:
 bool is_assignable_irq(unsigned int irq)
 {
     /* For now, we can only route SPIs to the guest */
-    return (irq >=3D NR_LOCAL_IRQS) && (irq < gic_number_lines());
+    return gic_is_spi(irq);
 }
=20
 /*
--=20
2.34.1

