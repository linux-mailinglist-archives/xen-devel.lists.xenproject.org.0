Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52826B36761
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094533.1449844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ1-0007d9-CV; Tue, 26 Aug 2025 14:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094533.1449844; Tue, 26 Aug 2025 14:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ1-0007X8-7N; Tue, 26 Aug 2025 14:05:47 +0000
Received: by outflank-mailman (input) for mailman id 1094533;
 Tue, 26 Aug 2025 14:05:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquIz-00072q-9X
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:45 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1e83ef4-8285-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 16:05:44 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB7887.eurprd03.prod.outlook.com (2603:10a6:102:216::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 14:05:37 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:37 +0000
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
X-Inumbo-ID: c1e83ef4-8285-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYIITd1S1dB7Dv9l63yHCD8+0qbB81WXHEhdJOKaeDAmZnTOWPGDKGF0UEFMci2g77nRfsMFtIGL6TQzFNdfE69XyAW74U9xEx9InNr9KcdJx6b7ZM3jXIwiCeE5lcBHSvCd4D3jCz51E0yYN4UIiI7vlZTuNNheAgyAeH+0ZD4wSYpSMr8yJWXchVc5diMDwWuTWH0j30+fXnODpocij2MoLeT6bE3Xo26Yze5OTyGmK03fhyD9z7WanGCJ0N0zlXelOoWSnZYGlBSLTSLN9n/6PVykIxv6/WqRpY9sC+BpViWtD6nVkd3TslrHD6pGfkzc2G2UYYsvmmfwD5UDQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdwEuhIp/AyycO0khwMfMN5p1ABKaSbPzkCWurtKwBQ=;
 b=gWOJDv48yjsTWSZ+jXLBi7JnN23VIfzP1Sp71fYmuck8JE9U4A0sE8gh1ePBIEaiH9CPIWpvf742/3oSOp0quF7V06Jeg92LZlypEok1uDDahcgC5xEZSdT7zXF0iVq4a4Prna7N/DMP4OgzmEfPtVebCJMlHEV+lX0h43u5MVFb9p12tGV63bMrih8MqjrqhJHsFn9mFrLr91v3ImyLZIHuU2HcYsyB2aMEG47GSxg1etY+4za7FxPAiqVk8cWJq5TS6Dw7YvT8ZwejTI4MsAw4pnv2KdvyRka/HEOlePR5k05B+dhdkUp2lpH8fEgL4iRw10D23YuWjeC60PWaQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdwEuhIp/AyycO0khwMfMN5p1ABKaSbPzkCWurtKwBQ=;
 b=gAvgHag7TywEGWSzcEz66atlIUec2qbqAnGGFSyqB+tgQNtt3DGU2lpneCvFZTXZ5WiflaVB9o89PLL5ExHiCL4Q3oB9U11//ULwN4BUT0UTG/5j59mOXUni7WxdW+rIvQVSd2jL7Y7yhQwzPFTQsD8+741uTTpoJS49U6A2tiEszGJzZI7p/jHbwfWz5ho4x0bQTEwkKIxL3S5+nNAW6iaLJaTH6pJACfbsMiLMZxIdkjKUr6YOfIp2AJB7hDufEGwdlJ7w13s3glFlPQ2RlkS74q3eGFJFilQp1QSoYrbbQOZQaP+1+49pN6OT/1Kn9JqgKM2W4jLS/NKAzbH4ug==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 03/11] xen/arm: vgic: implement helper functions for virq
 checks
Thread-Topic: [PATCH v3 03/11] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcFpJ/eek3/DqJlE2eNsEQLkbJqg==
Date: Tue, 26 Aug 2025 14:05:37 +0000
Message-ID:
 <a50e978b0442d737bb2621085e95aa6bee8c506b.1756216943.git.leonid_komarianskyi@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756216942.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB7887:EE_
x-ms-office365-filtering-correlation-id: 7243e37c-763d-40b4-8e2d-08dde4a9a22f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?0uR9164kUSfL6g25EFY1ib6WU7QDF9xGbY6NqIgiyzZrwbzCyLbOA/vTY4?=
 =?iso-8859-1?Q?zR17ohK9NtGqv7hMQzLt5diLkj6s+tk4ObrC9ZQMu1B7b1Ih2Wq6AIF8+B?=
 =?iso-8859-1?Q?B9RH60RcBwEsamL1TtuUxA0LYNxzGRyjcF4qxntP4jQstoaR8QRJff4Dfy?=
 =?iso-8859-1?Q?QXvI7ytRDNCT2rpC3Vh+ri3Mb9Tl/B9tJxPuhSRvhogDZcXKbrsGQ87G4g?=
 =?iso-8859-1?Q?czOw248lTav1AJAp28ukswUi7RCy9hqri7unV9vym++iio7qYMEMgpXpAd?=
 =?iso-8859-1?Q?m0LU1LggVxk1+XF4Ih//CjfnCLGzvQ3RjKoEaMKrJ+1BIYW1q3eLMpO+oF?=
 =?iso-8859-1?Q?INh1rIXuAUm5lWg1BeTSEIibMoAEZVwzW7VvUmSkdVkapeAbRM71Q8pW8G?=
 =?iso-8859-1?Q?+KWJA7a3teJ5F4P44xZA0LlOcQDKVUOSCiqHeEDbrfT+uLR6xIB9jFvpEM?=
 =?iso-8859-1?Q?ZK6KNt/drOtwR9YvNnKZ0DKp5U23voY9S2/0Qvb/EOn9q7Y0/gHlMc4QVL?=
 =?iso-8859-1?Q?vt99ukOwP5oarfU2KrUTByUF9fFdoql0sHX/6wWI35G31TGbBwzC3RU99o?=
 =?iso-8859-1?Q?EvpV6ml0O8Ozz0SyT2z1RsBLFBU1VjE/zBO9CHoXJMiCapN+1qr67d9dV9?=
 =?iso-8859-1?Q?EUyU2f5SM4EmoPpvtIbaS021Rzb31aKtN/L47l1XfztQlFxkGLK/+2A7jG?=
 =?iso-8859-1?Q?Tnl2ezF3+8kMLO5QU3vVpiiA4Hszj45WOucKxgbakaMsa5a4qHiumPhg8t?=
 =?iso-8859-1?Q?HJygGzsQYzMRguGzs4x317kDNjn+zzUb8I1OZ0GbbMtfSv0uzBxlhMoEMC?=
 =?iso-8859-1?Q?m2bzz0dEjrqKeLuxtGkk+mERaa5gH4Vyk+nDhkNJfQn263aFpAQ/stvovU?=
 =?iso-8859-1?Q?eTJpT4ETMsaSQxzLET4vuYdvrUp+n2ELwWKdNoN/VtGhPduAI98Aq3WvW3?=
 =?iso-8859-1?Q?bQfVqB+yWqMEgBM5l28y6ZEGNAV8MK9IK3uKjZO9U12WoHkOk/oZPxDA7g?=
 =?iso-8859-1?Q?op+U86Iecoqnq+ofbKSYwfYYQcwQHF1/78U6nRpqF42TuMDm4o/PiheqIK?=
 =?iso-8859-1?Q?Y9/UePM/pxlLz3M90J+znt0QnKF46+d7chXIG6+VV4Q1Bw/XG2KG3tQudC?=
 =?iso-8859-1?Q?KaK1HCSAzRlOrTDsnKadsfo7L9JBvC3QgWFoa+BUJN47XQaw+rUtlhGVy1?=
 =?iso-8859-1?Q?8m/gJcrvwDpmbH1QipK7naC8fdbHj5+du7K4veyGaPYRDY3aSE0JI4CSWR?=
 =?iso-8859-1?Q?V2qqlcq6guysxfqh6oMl0lpxN4IDvo4O3U/0V2nWk+Ph1GCdYHfQMhQgkG?=
 =?iso-8859-1?Q?nBTkNsJd4d1H4AT+L0+nViJx+2UB0uX1UErtHPB5E2xqLAZ+4BBg1e6pEk?=
 =?iso-8859-1?Q?FyeB1MgT1WuWIM0rQ63V5kSYTR7Kscv/7xREVl2W1Q00ZwIU39Yc5hZl6c?=
 =?iso-8859-1?Q?Yyu8q9lABwyU/cp4gBmxFdlPy++xOl8EGn5hqYDY0OmDmgNdv4ZxLG6z87?=
 =?iso-8859-1?Q?i5mpeBti2F1e0LZZiohC07w2QyghL5E3xTEc0JFK/j7g=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?+B+5QlOmbpTw401FB7V9xyuo05Ojvg7lyGUHmT6GCXFkTAGOX7GUDq2K6L?=
 =?iso-8859-1?Q?XPcAFAHLA+vPTVNnNlPXV0ysVtqhSvQ+CQLfwdYR/qjZFqfH7WTmxwVPRi?=
 =?iso-8859-1?Q?rl8LnyaBZKgwPdL78HZhQv5tUBhJZqcExtC/2eC6b+uenMsCwO5qIiLuCx?=
 =?iso-8859-1?Q?ZHmq3tUGAHZUy9CiyHEx9QIg6o3QV1OS4F4GYmPb0oPr2p7ClEkMl0ILzz?=
 =?iso-8859-1?Q?Q3dl8CZncToyMfLSaqwtC19PKXPcRggS/DgzqirfTjn4Za3j0xGxUJXE+O?=
 =?iso-8859-1?Q?ijrTcXwRXH2aIdVr7TbsfjAaDZjSWKE/CHpNvavInzRxfoQlJ7L2ZJRiBU?=
 =?iso-8859-1?Q?6h1hrVFYpK5210g7opVNXRjJ3xJ46IhxR9GasBFwSYYjXZs/j73SXm1Hg0?=
 =?iso-8859-1?Q?YxZhwUFrwkAIiOwczXL3sMF0UNQ3L/g36XS9zFFVYnXyHJSiKlxDHnnWZr?=
 =?iso-8859-1?Q?2Ypqs9ucRtMfiYwCfAmlEd9BrULKKW/Juj8ZCvWVsu3otpOsWoKr7gUw92?=
 =?iso-8859-1?Q?JXpAiepRlBiaQAKrN598Tiwp/ZRdTdPVRzmoB8aiLC4sclwfTSLgjOI1vE?=
 =?iso-8859-1?Q?w8IGiVaoSjPoNMVdG8A6TDqU1hlOG7rsxjqkEobLhdwzK486A14AeUtmOX?=
 =?iso-8859-1?Q?PzmEC6GXAvh4orRXtP1zc9C8AG8ZKBh/LbST59T5Fw2wk+2O1XDUh65Uj6?=
 =?iso-8859-1?Q?oAvqTB8utNOVDDy9WU8puPo8qMe6Dn4JlRMO/6v5e9qDJOm8nvNY8e8ggY?=
 =?iso-8859-1?Q?0kwhdUcaE7q8aaKBUEgmQprDu1kY1axAXnyif5l/wI2kpmIqe8+VZQ7VwA?=
 =?iso-8859-1?Q?49mTXCEYP2sYPkLmqXxNduW439VNMKoho06n4EROlJDowRGKL7DFgHuxrp?=
 =?iso-8859-1?Q?9zRxB7TiEUkUlKe3KWoOrhuOtfqgsZk3v9aEGjKJeqkd3tsRC06gRK8wWo?=
 =?iso-8859-1?Q?kTt/B4ed7KIZ7k6cjXyn+4cVkQXW9G2zkPEo28CN2YbHFIJgPYKML44+Wc?=
 =?iso-8859-1?Q?orr41Ngs2jDStOJov/yi38Re0Rxp5EJwEor7nHCW+WCkS7EYmSmRjskAUF?=
 =?iso-8859-1?Q?fQ08YinMXEgKn8+fQBDADaSCpTc8/ininBh62MzbTZzoYWEwLpav028sY3?=
 =?iso-8859-1?Q?sp/mUfqMSEne/eT31w7/u5uB9r6yVo39u+i7Il6IC77oxZHFUCGBILyxwO?=
 =?iso-8859-1?Q?WKU0CCVTbpbD/BeIlBmwp87ZwFCXpMB8rymnTSB+0vAkQvD6EC1Njf5byH?=
 =?iso-8859-1?Q?EaIOjGhBZOp/6vmPBo9gdkEy7qSxrdm7qP6bd3xLU6IL5Rc6zv2XgrH6E7?=
 =?iso-8859-1?Q?OZAQXcCVGFTdlLTNH67kRMw0Kcp045WL7nvparUa58O+M4CSiNMY9Z4QIK?=
 =?iso-8859-1?Q?hRylTpGgig8FxI+jejaBsVI383uxjlj61/OKTplLqCGWnZq134mDMRpE5a?=
 =?iso-8859-1?Q?nIiwf0wYI30ltgKz0sA8iFKaYctwy4Pec1AOpXTsktjk4K+RqDbKG3Uqf/?=
 =?iso-8859-1?Q?4SLSt9cnPf+j2zewmLZE45WhFqT+kuJfmPOMq5gOQoIM5BcvIpPSzVH2j1?=
 =?iso-8859-1?Q?2V3ho0B7MWAmqSHGCBjX8eJMltuYpWCArSpyw4GuWETFJfSQ4Sa8x46b/z?=
 =?iso-8859-1?Q?ToXyQGhkOFNObxkIntTOHmZHLSId3r5wRkmpA8X4tkHe0FjidLK1s5qNyG?=
 =?iso-8859-1?Q?2o9kclfhbpVxg4lhzys=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7243e37c-763d-40b4-8e2d-08dde4a9a22f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:37.0742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgXlygd1gKHUj8THEF55vX+IkSx2ERa5Z4mtRaZW/t5R50uYX+H4NpfJnWucAXjMTobYY41G8JDY+IuvyGZnW/VXMcyE8smiq7kexDMBTjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7887

Introduced two new helper functions for vGIC: vgic_is_valid_line and
vgic_is_spi. The functions are similar to the newly introduced
gic_is_valid_line and gic_is_spi, but they verify whether a vIRQ
is available for a specific domain, while GIC-specific functions
validate INTIDs for the real GIC hardware. For example, the GIC may
support all 992 SPI lines, but the domain may use only some part of them
(e.g., 640), depending on the highest IRQ number defined in the domain
configuration. Therefore, for vGIC-related code and checks, the
appropriate functions should be used. Also, updated the appropriate
checks to use these new helper functions.

The purpose of introducing new helper functions for vGIC is essentially
the same as for GIC: to avoid potential confusion with GIC-related
checks and to consolidate similar code into separate functions, which
can be more easily extended by additional conditions, e.g., when
implementing extended SPI interrupts.

Only the validation change in vgic_inject_irq may affect existing
functionality, as it currently checks whether the vIRQ is less than or
equal to vgic_num_irqs. Since IRQ indexes start from 0 (where 32 is the
first SPI), the check should behave consistently with similar logic in
other places and should check if the vIRQ number is less than
vgic_num_irqs. The remaining changes, which replace open-coded checks
with the use of these new helper functions, do not introduce any
functional changes, as the helper functions follow the current vIRQ
index verification logic.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V2:
- introduced this patch

Changes in V3:
- renamed vgic_is_valid_irq to vgic_is_valid_line and vgic_is_shared_irq
  to vgic_is_spi
- added vgic_is_valid_line implementation for new-vgic, because
  vgic_is_valid_line is called from generic code. It is necessary to fix
  the build for new-vgic.
- updated commit message
---
 xen/arch/arm/gic.c              |  3 +--
 xen/arch/arm/include/asm/vgic.h |  7 +++++++
 xen/arch/arm/irq.c              |  4 ++--
 xen/arch/arm/vgic.c             | 10 ++++++++--
 xen/arch/arm/vgic/vgic.c        |  5 +++++
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 9220eef6ea..b88237ccda 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -133,8 +133,7 @@ int gic_route_irq_to_guest(struct domain *d, unsigned i=
nt virq,
=20
     ASSERT(spin_is_locked(&desc->lock));
     /* Caller has already checked that the IRQ is an SPI */
-    ASSERT(virq >=3D 32);
-    ASSERT(virq < vgic_num_irqs(d));
+    ASSERT(vgic_is_spi(d, virq));
     ASSERT(!is_lpi(virq));
=20
     ret =3D vgic_connect_hw_irq(d, NULL, virq, desc, true);
diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 35c0c6a8b0..9f437e9838 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -335,6 +335,13 @@ extern void vgic_check_inflight_irqs_pending(struct vc=
pu *v,
 /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
 #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
=20
+extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);
+
+static inline bool vgic_is_spi(struct domain *d, unsigned int virq)
+{
+    return (virq >=3D NR_LOCAL_IRQS && vgic_is_valid_line(d, virq));
+}
+
 /*
  * Allocate a guest VIRQ
  *  - spi =3D=3D 0 =3D> allocate a PPI. It will be the same on every vCPU
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 7dd5a2a453..b8eccfc924 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -442,7 +442,7 @@ int route_irq_to_guest(struct domain *d, unsigned int v=
irq,
     unsigned long flags;
     int retval =3D 0;
=20
-    if ( virq >=3D vgic_num_irqs(d) )
+    if ( !vgic_is_valid_line(d, virq) )
     {
         printk(XENLOG_G_ERR
                "the vIRQ number %u is too high for domain %u (max =3D %u)\=
n",
@@ -560,7 +560,7 @@ int release_guest_irq(struct domain *d, unsigned int vi=
rq)
     int ret;
=20
     /* Only SPIs are supported */
-    if ( virq < NR_LOCAL_IRQS || virq >=3D vgic_num_irqs(d) )
+    if ( !vgic_is_spi(d, virq) )
         return -EINVAL;
=20
     desc =3D vgic_get_hw_irq_desc(d, NULL, virq);
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index c563ba93af..2bbf4d99aa 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -24,6 +24,12 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
=20
+
+bool vgic_is_valid_line(struct domain *d, unsigned int virq)
+{
+    return virq < vgic_num_irqs(d);
+}
+
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
                                                   unsigned int rank)
 {
@@ -582,7 +588,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v, =
unsigned int virq,
     if ( !v )
     {
         /* The IRQ needs to be an SPI if no vCPU is specified. */
-        ASSERT(virq >=3D 32 && virq <=3D vgic_num_irqs(d));
+        ASSERT(vgic_is_spi(d, virq));
=20
         v =3D vgic_get_target_vcpu(d->vcpu[0], virq);
     };
@@ -659,7 +665,7 @@ bool vgic_emulate(struct cpu_user_regs *regs, union hsr=
 hsr)
=20
 bool vgic_reserve_virq(struct domain *d, unsigned int virq)
 {
-    if ( virq >=3D vgic_num_irqs(d) )
+    if ( !vgic_is_valid_line(d, virq) )
         return false;
=20
     return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index 6cabd0496d..b2c0e1873a 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -718,6 +718,11 @@ bool vgic_reserve_virq(struct domain *d, unsigned int =
virq)
     return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
 }
=20
+bool vgic_is_valid_line(struct domain *d, unsigned int virq)
+{
+    return virq < vgic_num_irqs(d);
+}
+
 int vgic_allocate_virq(struct domain *d, bool spi)
 {
     int first, end;
--=20
2.34.1

