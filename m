Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF60B2F5A8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 12:51:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088464.1446202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2t3-00082P-29; Thu, 21 Aug 2025 10:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088464.1446202; Thu, 21 Aug 2025 10:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up2t2-000802-Uj; Thu, 21 Aug 2025 10:51:16 +0000
Received: by outflank-mailman (input) for mailman id 1088464;
 Thu, 21 Aug 2025 10:51:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m+ul=3B=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1up2t2-0007zw-99
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 10:51:16 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd9cc337-7e7c-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 12:51:07 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB10276.eurprd03.prod.outlook.com
 (2603:10a6:150:15e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 10:50:59 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 10:50:59 +0000
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
X-Inumbo-ID: bd9cc337-7e7c-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u0SWz/gu9BZwaEoqpnejdV0uMq5/32VhTjiFBc1v3tN2JzUzSTvWz76/PHHvQyaqOe63wkaR+K17IEmzOv9wZf1pkjsNKUs5JWMydXJU4dVZtfSn08O9nAGAyS+FVq0l1Q5h+MgIP+CFQ0EJpFgJ5+hEVnmb8IxpG+rUxqosFiM3chzTEUn89G9aUClj0c9gNvqS8RCJIapB4aUIjeEYwwDC49BnPfCdToxh+1KYbUmAw9B11Yx5IyT+7i6+6eqCkgMKd1sngjieAH2sVU4IGOA8CjI3Q21n3vLou12TEvUymwwoGORjiCJa/E9zDNSH3Uf1o8KWLneixP+uzxK+FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZFxoHjk2LCW85ctA8CHNhOh+xhpEnzUimziGQcn7K8=;
 b=HXytk0NJrM2RPAAhvgpIcfRx6HyIniUiobQFa5d4D6GDdraWkiLml3kU8hCCEM2GGFYXHjUrjE/0+8zbk7kysE88wsdF8yRqwDlkdfGVhv6IlmTXJZoX8YpYiF8DaUyQMxzcZZe7Hpv/3HxpCfqSB22Qbn2lWIPPE5CsT6kSLJ44Pj2wC0VBI4a6aqDs8S1PKnPDD7sVOQIj4EYrxg7yhuizPaWnLHW+q14PWR4URoB+lbmZx/vlIKvO6+D1CBQALsnwqurFhzAsusTFKlVjTKli/YxXY0F+QqiDPwZ8FFjw3A90cclV8+4hroIa5WHbnf+ykQQftUV2Zs0zGZJezw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZFxoHjk2LCW85ctA8CHNhOh+xhpEnzUimziGQcn7K8=;
 b=poKOYxD+nhiYbwrpJKNswcmYm8Hl206xEn/uiTnE0IkZ/jGV7AY6gFMa9hrmArTgSmjZ5y/bjQSw/zywnjZSS8a+gR1rD0ZGB/g6mNmwrBVxEzl8NmJMVJPonccLwTaMXVHR8cIFTpc1mcsv1XOvaQlcGTHSiDBquSw999KX2hQkOro18qiy2Be30mUcbgZLQQJpwuEqUE/avoZ2z/9R3xPz0VfbEKj5UWVC5TdJPo+5P7BwYHaAVoWnN47+1L9OhKKD/DneHamUaSyN3EoDIbfGcZfPGYQc598YBCsGLRhBhCEerp06qQBO6lS6QZY7a2P/zZQ9p+4sdR80BmftOg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
Thread-Topic: [PATCH v1] iommu/ipmmu-vmsa: Fix build with HAS_PCI=n
Thread-Index: AQHcEol6WY2CZ9Gyh0KXEcdKpt6HNg==
Date: Thu, 21 Aug 2025 10:50:59 +0000
Message-ID:
 <f6a8095483ba54e1eabeca5e4b08138312fa822b.1755773176.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB10276:EE_
x-ms-office365-filtering-correlation-id: 138560a9-ebcd-4c2c-8917-08dde0a09d0b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?p89lxhNurkfZNJYxUh/YyYK9UhBhWWtolzN5FJ46c8DJ2tVNhyrqBpwQPt?=
 =?iso-8859-1?Q?Ng04mGuO/g/gin6+Ckr/l9XieD2KZiX5JbIWVW943IRm5Qst0y4bacVm3+?=
 =?iso-8859-1?Q?urS97ZhDNQ5Zj0F23kcQ5Xn826XDC064t3BsNtsaWaTn9hFEQkaf4gKwTq?=
 =?iso-8859-1?Q?Z9JRXZj0tmZjS78qbI7E0KyFPNn3rwFBY8wIHHy5i0V1UyM/y+HqwcrRRf?=
 =?iso-8859-1?Q?2uF+prIFOdVdrg89+xt6nbkWa9aIdVk3Jqr+PD53sn+KRjVczkr8gbc0Yr?=
 =?iso-8859-1?Q?XeeBbRk6T94aQ2lqwsjUP3F8Lrh0tukYtUv1FeOOp9BVG+Ws9RWhDRr8eY?=
 =?iso-8859-1?Q?eVq0Vqvt74SXolYjYnA1la6dgJQ3a24K7GUrKpR8gNqauew5trXJ4D+g6I?=
 =?iso-8859-1?Q?dxnWp5jSTy+0UbPMdw422zOjmzRFvfq2a96J0rwogkwOvZTBdY4jPkFu3g?=
 =?iso-8859-1?Q?cF6IoerDQjgSQHKC51HPvRqueRC8UvhUJDCJ9l7RovNhrRwShGSa7EF4Gh?=
 =?iso-8859-1?Q?pioLLsEIIqcI3s5MB94g3+/h902LSs2nbRiCvGKw+5Z3xxz9276e+HfByG?=
 =?iso-8859-1?Q?M3IIa3K/VZC7tibsByQ65C/NSljr/kIk0MoOr+Rc0LEQgVx7lneYkbiktE?=
 =?iso-8859-1?Q?T7KdHIb26drr4fBrFeQ72E4ZAh73scJwb0A3iwsHfOTQkPjGKEhRPZISmT?=
 =?iso-8859-1?Q?A66OzgKIDO102/cye+zgRkOqeBhddZK9XXpfJ6jheW1ZuzKydSjG3DwBM/?=
 =?iso-8859-1?Q?F2UMQ1i02QYhfCO3PfWOWlKhnzTDeLO+kt1vEUjYkVz44AURX/XEgG5rv6?=
 =?iso-8859-1?Q?tIwq7sGkKY73YyteZ5M2fPojzPjkdyob1PnvZT3rbRNQpmQ9uI2/xqxzEL?=
 =?iso-8859-1?Q?Jy2TiS4xsPizRhv7yIwLge2IjB2q4w5/4+xeD+OIWt2tqQzuCYSObgMg1j?=
 =?iso-8859-1?Q?+D++k7ZoH0HauiLCUoBTt3FY7mTbiPvBTfOHpYPK/SAyCSkyCLvrrAbMpk?=
 =?iso-8859-1?Q?qJhOae3rOk/aX3/PZjgzkGGfgrM19v04EYUMEmlB3Tzp5FS8OrdtFqM9Ze?=
 =?iso-8859-1?Q?+yCv4sFvC2lBflhlwKz3t3Kn1vw5tl2MDNuwowManx8V4M7hoZW1tHfV4R?=
 =?iso-8859-1?Q?J++Ao6N6poOF1P2AprBDamifCmI7My/RhtvSKEerWV6k9kKLLC4F2dLwuV?=
 =?iso-8859-1?Q?8jH4+HMyUK+EdLbGqJr7wgkvZzUGBM9vehWpbccQHeVUBttBbdAwLOJ3jh?=
 =?iso-8859-1?Q?sytYbMtUlEHQ8vR+jy9cASnDxDRXX/VY0wPU0Vcb1l5QbcwEtZQ4m/HLQQ?=
 =?iso-8859-1?Q?Tf2MorEbin7poXdeyq1OqCflxSqqd+N9s86uneaMnKTAyYfogx8Tx7Qc0K?=
 =?iso-8859-1?Q?W3adut1/Q6bjFOnEQeU9NIeQfZOPDCQcxtH/K+lis2sPEw8+L8WAZ5cDeZ?=
 =?iso-8859-1?Q?dAFRgU8+F6B4y6mEyhNpTa6/SrNCG/I9NpAYN+Dz+4zhWoVt+YiuYc4Q7T?=
 =?iso-8859-1?Q?12ql6yyzXDe/orD4iBDITvpxvpvvTWAGSozyx+ZBbyfw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cG4sVIOAKDP0s2jGhz/ofL4UiuJTXvocfkKXmuLm5Z5pMHBpkR/kI8YZnP?=
 =?iso-8859-1?Q?+Pw8URe+XG5eMa/MHoFybTJ26Vpf8gUa95kkXH8+CzyRL8OD2MOFqnFi7b?=
 =?iso-8859-1?Q?hxNEQ/qvJKypc5XpOa7ZvTODu1VghTZ+JILZ9KuwwXDzHmIBvYKhx9IaWj?=
 =?iso-8859-1?Q?qWD2AoQnoxrwikRJl+mKlAlJl2OYPtd/linj09CjUgClsyOub25lmo1c1F?=
 =?iso-8859-1?Q?RabuZGbkJtXk1aXLuHIEIeAgyRdmeBFyMN2DVpGDQXkZrzLXGZIvFWzcxC?=
 =?iso-8859-1?Q?AAes1EF+IdzaOsXV6WvFPih5Ke4LNq/Psh9syeezXpPuiOqOP0fkoTwWPA?=
 =?iso-8859-1?Q?RRthfJ1S4NAbKf/NTUJ4Hfw7S8dYr+sVvyFvjJGT9v7YejluwKrb/n+W1V?=
 =?iso-8859-1?Q?3JwqEaf3yhkfICsNi94v9QCMAusMkimrUY+LVswSC/im06GC7GBpQy90qr?=
 =?iso-8859-1?Q?6d15KqSao5xvQpSn2Fy1q7gStJatv1kG5NYsx8ZytAmMsfSev33MGNQAP4?=
 =?iso-8859-1?Q?OORf/+b6zqRiNdpE9CQ422RiTCHGsx/v6p2Pd89najHcwbU1TCEBAmCTfv?=
 =?iso-8859-1?Q?6088PkWksEdiuHXEWMcAFUOIATmpAKEIW2OKyjWwEen5jb/owu0jiHDY3g?=
 =?iso-8859-1?Q?Ioxrf7YPUcimyEZiluhHq5EA8ECd2UYgl0/2PvsNXTLn92d1wz7HesdBr6?=
 =?iso-8859-1?Q?9WixBgZ1it15rsyJPe+zft6QuGu0AomQmWJtqkm+uSH+0VnzwaM9MXo9NV?=
 =?iso-8859-1?Q?RnUGSwgbEIcP1GZXjTsmkFp0K9ysJg/g3zlKMjAYYSRo/w770yxxUGYQ7S?=
 =?iso-8859-1?Q?7cgkFlr19HujMre9whDBwmp69JbayUqU/tXFfCyQx0aWHg9dx7+m13zLJd?=
 =?iso-8859-1?Q?d9C+loGZmDIcrEQ7eUTciv6+QNvGwV/GNGbRr3hAmWW1c5IiU0vbJSghIU?=
 =?iso-8859-1?Q?lG8+JJ1HxuLJdtgejDHSohtJhkK3vgaifXUbBEtyGI6wihoBRTV9dyZcvj?=
 =?iso-8859-1?Q?rZmmRNzlv8ORwdN/7YTMPL2S1hlCBSXQjL/PIyIMawOwBu6bf0o5rSqKw4?=
 =?iso-8859-1?Q?27kIKF5e7R8paeteLsYLnlKoax+VGFw/4Y6xh2TkaUvFs1n0WSEE0zcNpy?=
 =?iso-8859-1?Q?cdVHf/o5Rea3XkxeyJEYaqZB+0iB/biV6H7BUMtC8ZH7SzEmcFkFzllOP6?=
 =?iso-8859-1?Q?p6Y+I4DLw36TIcr42K8SzBPQAwcZ6IJKNG0OOzP/n0z8XqSVzSRZo49jMJ?=
 =?iso-8859-1?Q?mNFr3vBkohG2WS/koWbuGztdu+6JMXaU1It3SVq8C6jN5dD1S95mqJijZy?=
 =?iso-8859-1?Q?iCmBNubcPFSnOMWBoL5QUygI3fYdOP+XVO1J7m/OL0RmeMuuk52Y9tFWxD?=
 =?iso-8859-1?Q?wKu+JxDZlnhb73exfkOid9G8j8r7/xvrFNwnj8sWV/TkrNR3S++ZkT4/KH?=
 =?iso-8859-1?Q?4KPVx+l8RIMNe9OwiMz+Rm7pfscD0LXDa46QsvU3MLZj0dKD8hsD1iBMvs?=
 =?iso-8859-1?Q?bb07SPLN0JDLx1HLnuDrHU/iiXUhJrYcFs8NCcB7Uars3IB71XEpO4fizg?=
 =?iso-8859-1?Q?NePt5GRivvIMMIWAJSqJoLp+xdvP8dHRRucgfrPPhFsQIdVbdKKgrHESLm?=
 =?iso-8859-1?Q?dhoMOOe7zjVZwhO4sQWvetno88KW4bESh1POv3S4EuWB+zQQk50Pk9xw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 138560a9-ebcd-4c2c-8917-08dde0a09d0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 10:50:59.0368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYjt4Hwd6clJqTipCK8/6ynVVWHk+bFdBVhIrK91ttBX9AEktw2sHSm/WfPQ28253xcz/i1wZvjliQdF54LD0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10276

With PCI disabled the build fails due to undefined struct
pci_host_bridge.

Add ifdef guard around pci-host-rcar4.h to not include it when PCI
support is disabled.

Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
---
This patch can be squashed with iommu/ipmmu-vmsa: Implement basic PCIE-IPMM=
U OSID support
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthr=
ough/arm/ipmmu-vmsa.c
index ea9fa9ddf3..49f149e222 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -51,7 +51,9 @@
 #include <asm/device.h>
 #include <asm/io.h>
 #include <asm/iommu_fwspec.h>
+#ifdef CONFIG_HAS_PCI
 #include "../arch/arm/pci/pci-host-rcar4.h"
+#endif
=20
 #define dev_name(dev) dt_node_full_name(dev_to_dt(dev))
=20
--=20
2.34.1

