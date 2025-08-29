Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 169A2B3C048
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:06:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101654.1454666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cT-0007mm-L1; Fri, 29 Aug 2025 16:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101654.1454666; Fri, 29 Aug 2025 16:06:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cT-0007kR-Fb; Fri, 29 Aug 2025 16:06:29 +0000
Received: by outflank-mailman (input) for mailman id 1101654;
 Fri, 29 Aug 2025 16:06:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cS-0006O9-3w
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:28 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dd58780-84f2-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 18:06:26 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:24 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:24 +0000
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
X-Inumbo-ID: 1dd58780-84f2-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmV4x1G7CVIAqUf59F15xmoOesBe0tiaRSS4BTyUcopNs7Or7MabF/+XP7MkZXx+nWGyTWIL5p8CVj0uAph/41decQnPu+MC/uRNll2sMBwrhFVd/yj1BMwHhpfXSsAoDquS13eNQ05wI6L2WB1fiWMXgGftqUKPku0VrnUyX8LBaRam5E3C+NbXMWfWrh+30QmUQC/lfEC64Mav4Q6U/RdjRr03N6pVLcfbJPoO5V/VSEJX17H6EBBRgln8EY5Iv5bN5dynRG0vzT+Ym5/WpB8aHftgOkeGQvKI7uwljZcD7PtBaNeZyGLBE0rssNJY6sZ99/h7LIN1kuMEUkja9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WAB47z1uuBIE2JzTvdTFBqibyuGo+r3x71Man4KXMUo=;
 b=Wu3bdIF+oRhhMNpGn1PbBEI2wyX88HLX4CNmvW+9IVa35B+K9EKpVrzWYnZa4V1ZAUEFEmN2FVvLYrVvKfBfbEsOs+80Nr6M6RvQHLyvBKAvsPJ26+PxrVA+uQnc2BZ2/liy6Y8xBO22TVaksU0haumLUj+74b8+XN+0jgsiiYVCAzhqIuGF4dz5Lyj1rbx9CsNec/bVis7tEAb1oyzj8ja3Z+ZJRExlIMF8bQMCe0GK6BBIfmFUaNAJI8ruxHEKcklpAP5yVzqw2x8URtqiskp995qS3aGkNgy5WrLlaRH1LyeCCG4QwdjV59urnZbBDflIVoIp4YtOKr0k92c08Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WAB47z1uuBIE2JzTvdTFBqibyuGo+r3x71Man4KXMUo=;
 b=I0hsjI/mQ8bEqmpOudbyPtzmZANbH0qLTJoGQwsDwkzYwHbnVWxjpNM9ADPJo/B8JKkbzbthN52vPDZ1rhtCsL+uw5/XKeR+guqcqHC+C6NiWIVeEwGLZ94o2eXjS3xakvsF/6Wi7pae3wTK1w+ZgaspT37OwnA25NS2gBLm0WGy5wRnniCKLrBNI1Lql8hU1CTrM64IUH9VGDj/aZzA8DwpTt2HKZXCbTZASD7aWTdeIgvznyaOUOYMVgaO6n37vY0QIOTvi9x7Ik1mGt7JnQHJD2wTPGkKh2WCfsO682K6hA0kNyv9CTTAeRr+sH1IqGuex4BG/F1mbU8Ynq11yA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 06/12] xen/arm/irq: allow eSPI processing in the
 gic_interrupt function
Thread-Topic: [PATCH v5 06/12] xen/arm/irq: allow eSPI processing in the
 gic_interrupt function
Thread-Index: AQHcGP7eN+yGlYwKSkircjBNqV5JFQ==
Date: Fri, 29 Aug 2025 16:06:24 +0000
Message-ID:
 <d5634a41e70c517bc476894f3b871fc910d9d648.1756481577.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: a6b71faf-17ad-49f4-eb7d-08dde71600e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?RU3+nmw3HcefttD3uNNU9ewoIbQkzJ5CNInk2w0oqxU5d63kECCDOBjd1z?=
 =?iso-8859-1?Q?/PVUEOKo/H0TKZQDRDBw+OshAXrfc13Klz6iJ/tw08L89yorY7dGnYCBtv?=
 =?iso-8859-1?Q?WtHU9NgpiTNoRyP1CAgPDETwEg8P0x+ksnMScBT2Hzfoi1ijbepum3qUwt?=
 =?iso-8859-1?Q?uETpFRTrShgqqprWnZs0pY0byd50otb4oLqxlkqh4Ucx2G2YF+XuRbLT8x?=
 =?iso-8859-1?Q?E/hIYlszuR566Of3UAtP4cIF3yszPkEoDC0YNd29bQh8KOR1mR03i1QojU?=
 =?iso-8859-1?Q?IWZepOxam0aq8uKFQWQ+937EGDwNcpYSZGQHitmXm0odDx0G+qhEpA2Di4?=
 =?iso-8859-1?Q?SRzw1UjrjRKkuNb5K64D5aY5bSS+rVK1PtpshfZwG8FMbXTGvq22S+0PHL?=
 =?iso-8859-1?Q?TkcH2mMwb5QAx/oV9j6nJLJfnmD4FyHV150M2ohKqE4hI7gHglYpaVE1SR?=
 =?iso-8859-1?Q?7qpZAxB7o5ew0KAB78G2pPNuOSM2Lr0kCdCwzgE/ccVoEUKzUFjDNVB2ly?=
 =?iso-8859-1?Q?l4u+WLSl2aTNzTHk7N9HHWoi6d0RkkjK9oVxk7HEj+IvH4XEFy0lpRSABI?=
 =?iso-8859-1?Q?iA/57j1Cxz5FMXd7k+ZI70hXqnW5V+kDkcImIPWPj9QJORQUJmI/zZVyOl?=
 =?iso-8859-1?Q?yOGTolfBPaP+b/Kc2SxUBqin+BL2QqbLRiurtLmiuaAvQd8YRgC136jwx4?=
 =?iso-8859-1?Q?YnHvWhzmS0Ebw+NjxRNJvsdVM11LixJvM4A4yaO1mAKhZOpSBcUvA2YBXx?=
 =?iso-8859-1?Q?q7EmW88dVyJdHyOt+X1mMu5yUS+43wdqgXF6E81DSrRh+X+1LL+DWGJi3k?=
 =?iso-8859-1?Q?7cuKGNAcXGxpjIlHYobYVUtUa/pt4WTuIkXa/TmIT54GZW27qlcAvoGcg8?=
 =?iso-8859-1?Q?naBtdUs6P0BT5A4UN7iq7xq6U2SeWWXojui/ZI8IqmBYXr2ByPaJgYvSbi?=
 =?iso-8859-1?Q?MXp53C+1Ffq2NJJuzIXXwCnH9YkrKZ38NkrN2ggZkEEEY2pIBf7uE0bE50?=
 =?iso-8859-1?Q?Vc26GEdvmm5Lp/zI0VJyTnUxrEWmNmwEQf/rBpjYKBSfU9PZ4hYrocfb6q?=
 =?iso-8859-1?Q?cLE1y1doNshrQ0O4SOWQF1sgG/n74P4BFbOOYLNwWUZaPV6nAEGWF15RoD?=
 =?iso-8859-1?Q?vwJNlp9Eq5ryGcF5WLHJq0clUozoSArOT2uMqdlfx1PC+k34KNtp9OKaZg?=
 =?iso-8859-1?Q?KvRoQD1KjfaKdR9hiOX7cxfCA84MhTPHDk1gbOJ6wR4pVoB7p5O7ayx0z3?=
 =?iso-8859-1?Q?J1tcrMsno1SSmN5XAWb01IA1EzQ7mYHVM4gaL65bhZUPhaGOHBfXIRQmmS?=
 =?iso-8859-1?Q?DkA37taHfex2cNV9yMYPjImOQcn6AxBL4/isyrY4E8WRR9COu09+37mvja?=
 =?iso-8859-1?Q?6bbRv1MMyW71gDdhHX0Pxjvdw+UXpxZPr62//LZb+UibkrHgHSJjphrJHq?=
 =?iso-8859-1?Q?8hIalb/ohwPxXV2t+eaGAeWJkTTVESqQxcPpzlDT+E75IYaCYO8a7HK4I4?=
 =?iso-8859-1?Q?PiWXVaIqUNNn1lxAS7ZDviK/MwwFQPt7NNSVoYZEfAjA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rtoKTEKKzSf4Bmk+ujOaIYKGQIgfjSmgdsyJB7FWbTBd+0JpwRhjx9Ty2t?=
 =?iso-8859-1?Q?cBCAjV2gHXQ7jQg1DUOdP/e0Y5RY6zNG90LNRdBvn3RJiQw2V8Q9N+fETe?=
 =?iso-8859-1?Q?jYsKkEFU0fwM0MvS7EPCOI9mP52M+kXL6zck+w0zavDOG72rC4RvgmLZWV?=
 =?iso-8859-1?Q?8pwYbtBvZdHJOlsMVBaI+/gC4715GeTZMq5phPDDdM2qmngx1zEsRY9dcN?=
 =?iso-8859-1?Q?U7EaKq/MUBEVcE04AWyh+lgBxzSxkln+JOllTVC5OZWOZSwG6fCBvc+YjV?=
 =?iso-8859-1?Q?nwjlaccC6idn4PzZLsuEq9AX0dwZoyLKW454wFVxBxSKJpsC2ZcBu1ZN3S?=
 =?iso-8859-1?Q?eu5aKRSTJRcsv9Zt1NO9daiQ4gNPN2/CdI7v35W+IF6qOydgGeXXextHpI?=
 =?iso-8859-1?Q?MAmRPzzOLjc/PwxrzeZWtnim565iulKZVdpllFJYqOyQdy/ZBYilEntPES?=
 =?iso-8859-1?Q?1ubZx8mL6ZDED1ChhCab6ksnbLyP/9eIytA7vZzuucTp7fwXpwL/06Psta?=
 =?iso-8859-1?Q?LZVyFYi57KroJGXSrkHEXf/QH3YhBAmW6ilBCh2j6+Z/vYD+1NqKz4vt3t?=
 =?iso-8859-1?Q?ZMKx4tBo/kNRqe6aJDKa75NxWBCrMnVsStB3kIzPxqcjODGJ1rd3xCqAh3?=
 =?iso-8859-1?Q?G3f3Q1rHzOkHE4c9Y+m8evzolpbRNtt3jkiSvqEuXvwP/DJ5cPERu7DwL+?=
 =?iso-8859-1?Q?rmw8kXfj8SeigcGDT9G7bC2+pZKaJDCiNDrwkTNOCmN5S/uqLec87UOAO8?=
 =?iso-8859-1?Q?UlIyQT8TgsdEOMfqDoxg7iGi3NB8CiJcdAG3NPc16TRoE6eJhL1BG8roqd?=
 =?iso-8859-1?Q?NZMSb3ic3nFHJU0r7uJlzSv1dqBdL1wKDA282J48qlqe8w95GJgl7VIQKv?=
 =?iso-8859-1?Q?ywc9stTXFMcSCE9TMwCiBkBsDLUtxrGgZ18YRdTKdF4WGQuQgoBZYPJeSa?=
 =?iso-8859-1?Q?XXuHPFjR4dUAVN8Zy6fIcR14Lm/XURcd7DzLm32429nuMY3wf6lQheTVup?=
 =?iso-8859-1?Q?x/Pf8MxN2/npsLz02hy11L63b7uZkyT7Xx8XXgcORt+nS/q0jWU5kZkxte?=
 =?iso-8859-1?Q?pPSwfScGbuRKebo2I1ri4kad2+iF6Y6hH+0+h0xla59Sp5T3juPshwiRQ2?=
 =?iso-8859-1?Q?PasddL8pp9NBWStV3VsTna7o2e1Qluj9/uDdNRotTOZFa0G22hXVCYL1YV?=
 =?iso-8859-1?Q?y6ijilK7HeGGBfRZLq8V1X/947578o3JmY6yPfaimWKqR7i2ZkRzCC12vS?=
 =?iso-8859-1?Q?vd/Wl5d9C+d+KI8myLDeGnZN8rUFVCtVS8KC+UOQnrHRenTOf1cvc7OO65?=
 =?iso-8859-1?Q?g+YcLB1GQsSyLFDxx5tyG8lpy9AIZbKoj5SBA2SJebGvyGqYLcS9ke1CRI?=
 =?iso-8859-1?Q?kWYbcEruPoOMi1Mi0DaA4Van62V4aZdCtmPHztpz6Kr+4x8gObH7otBdZV?=
 =?iso-8859-1?Q?ioya02WWNp91VmSYb/SEiDjCrU4QBmo8k/UqDBl3Zv8M01cXKxrIhmj1t2?=
 =?iso-8859-1?Q?UorPbKcff7v0BjJN8KElnLu2+BesK8xty9DojO12kN/Yvx4ncz83J/7RmU?=
 =?iso-8859-1?Q?afjwijxv79l/p9KN1ehDj9ZmOqjJKFq/rzOJe+S+OpvV5kMRQcExaiA3RZ?=
 =?iso-8859-1?Q?OAlDgdcUZu3ivcJwUeFa2bp1ZEIQHnzuroRSpJpL7AGAh4FGDTvNVbH9fW?=
 =?iso-8859-1?Q?Sm63/D5h6Qdp5aRhDuc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b71faf-17ad-49f4-eb7d-08dde71600e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:24.5982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBqgpWPvBx0r32vDvVhLYO+D75cRsMTuXzu3GS/AXA7bewljFe48jXfSn7Ay6vVwrRf/UVkn5fZAJNUWAOCU42foKXyouazjqUvWsdYwm/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

The gic_interrupt function is the main handler for processing IRQs.
Currently, due to restrictive checks, it does not process interrupt
numbers greater than 1019. This patch updates the condition to allow
the handling of interrupts from the eSPI range.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---
Changes in V5:
- no changes

Changes in V4:
- fixed commit message
- added reviewed-by from Volodymyr Babchuk

Changes in V3:
- no changes

Changes in V2:
- no changes
---
 xen/arch/arm/gic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 9469c9d08c..260ee64cca 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -342,7 +342,7 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_f=
iq)
         /* Reading IRQ will ACK it */
         irq =3D gic_hw_ops->read_irq();
=20
-        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) )
+        if ( likely(irq >=3D GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(=
irq) )
         {
             isb();
             do_IRQ(regs, irq, is_fiq);
--=20
2.34.1

