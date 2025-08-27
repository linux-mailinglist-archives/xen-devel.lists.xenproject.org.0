Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9E2B3897E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:24:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096718.1451349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKod-0007Zl-PQ; Wed, 27 Aug 2025 18:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096718.1451349; Wed, 27 Aug 2025 18:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKod-0007X0-M0; Wed, 27 Aug 2025 18:24:11 +0000
Received: by outflank-mailman (input) for mailman id 1096718;
 Wed, 27 Aug 2025 18:24:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKoc-000703-JN
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:10 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0636dbd7-8373-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 20:24:09 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:08 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:08 +0000
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
X-Inumbo-ID: 0636dbd7-8373-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICgT/toCM4iCFcbzr1UGtg6gTNptlI3QqCJNcsCIYGUH6BVVCoB8Xje+LoBi8G+bJW2q4egUMlxyWk88KV7ptExuJOGeDvG+Q22vXYfg1NqFrKHrD5aww+x9P3x5VBd71FhLQ83F9Ucq9+XTRiJtvDp93dXKwguRwD7yfNkAKhXJvLunnvJ6kruj+fDb/h1XXATjy4IDH4kRI1PFyqZnYiJrtt+9nVQAkMH7DzkpgeyaiycWryiOp2PYrmbHvg/s8FJIBtMzjwgTxrY6QnkehX4p04Z9BAuKrLJjU9YqCE/Qc+6vJ9Pk+a6WtusvQXebHm9Mg/VCjb3ojbo+ZqTCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHYfYbL55imOCCjjrRRn+AUcBXKR1hjc8iKikRGMauo=;
 b=HVDjHHJNLglbId77+ufkOurqYdSfYX6wL8xvVj4YQ9/yAWDegYkhn28TrCbFYrQLK3yN4afKTPfw3D3EDXMeH8tPZZXRSN0tKSFOQOeXJFfWRSftdr5qp0OjBd5WXipNr5jSlwU4wE/QpICxIsBQNbOLeUDe3Erhu07WN99Ohusv6+umG7bzNlkADInLlDdiu0BTX3yRnizJWY6kHujosJ4hXcm3pG0rWzVifR0aHYWS98CEAFKsSI2YDzUOskn2oZX7hu32cVieh5t6qpUtH4dTz29IyEA7WUXFIZ+wf02gAhsDuaBjI/lH5cxy5Z1tyCZSfxOKCcmJbeSrxrpa9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHYfYbL55imOCCjjrRRn+AUcBXKR1hjc8iKikRGMauo=;
 b=pwfpQlcGgZypRuOZxeo0o0s3UNoB4Bm3EI/omSYr88x4skZ+0e2gfToaLWfBFMF4LmGO8OWyU5l5ZpMKx+CCBY+pXLbXQSK3Kks2tT8kZEh/7EaVomj6cP4xtF7MLOrAAV5xgZZCnBNOtzvyvCICfFMQOg2NPRFHpbkbZm8zxuPI9CrbMIJC0YMuq7sHjt96jXBl7C0UFxbj68SLZiwo8NWIqtJCjSVZJ3mNhL0vfKmGXu8RruewbXwX73CSQpTEuUQGQJB8aAAF4U7h+TonJT2D225YP5atjsQ8HV/HHmPDSifoj6PevSS+yt1LTB7642eaViz6njD1nyYlNg51VQ==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 03/12] xen/arm: vgic: implement helper functions for virq
 checks
Thread-Topic: [PATCH v4 03/12] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcF3/Ha+nKa9jlz0+nkOWkY9CitQ==
Date: Wed, 27 Aug 2025 18:24:08 +0000
Message-ID:
 <65b148aea56b1a35fa061b0d8284584da97153a9.1756317702.git.leonid_komarianskyi@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756317702.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|MRWPR03MB11023:EE_
x-ms-office365-filtering-correlation-id: 54844cb9-4a9b-4ee8-e3f5-08dde596e9ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?m8qsv0+bp4QF46g/0g5vYODFL3aFdttb3iGJsaj6oqZuj9DxKSoyqkHba2?=
 =?iso-8859-1?Q?N6ZoHZLjQIqQtu47F9xUT+Jr9oLbBulxwhvFt2PZaF8j/KQ2nPWdITEzqk?=
 =?iso-8859-1?Q?UpePgZ4FDt9owvmPJUwvX3ms2rYqIIDo0kyUvoycvevZ1QGBA6h944DJyx?=
 =?iso-8859-1?Q?MYpWxgQPatqDf97/3dyrbypgzvGKQS1yWlS473a9oOZ9+LDVkSzQAXt3sP?=
 =?iso-8859-1?Q?w7TDlhtp4FwbwqPYrkkbBIsd0oEQye17smE07WDYyI1m/93GcfB4qho+k9?=
 =?iso-8859-1?Q?kLj2THa00Wh6ZNxnfdecZ7f9HU08DKtbDHuRmnZTT3dCiOLUIgIkAgPjrn?=
 =?iso-8859-1?Q?+FJOW3afIIjJAW4qhsZx2Yxa/B38ePZ/jK6Pq5OK7yzibt+QXjRcZNgotX?=
 =?iso-8859-1?Q?pbBtoJoq0NF4T2gPvEMNm5S9w5OHV6maTFe1tM6DH5G55t83HwSSRixRJz?=
 =?iso-8859-1?Q?0oKx8p0N8kLTNQb8rEsmXks7i4J/98Zzw+j89P3J3nLNIJ6x9FHGPTB9+H?=
 =?iso-8859-1?Q?BcPMJozEeJGPGdSBgufl7owqf4XAYFvCJTfl4B1eISPVZHbk4RBSwshvEp?=
 =?iso-8859-1?Q?wZaOor0VeiuA1z8Lk4+dLyt3oV3kQXwjnl3QkP8+IG85hYL1Ofu6W20uVy?=
 =?iso-8859-1?Q?s/jVYKFk9R2zSAEpG3txZLorlcbCwyqlRrHCxcEiNaxRD070+vlyKCIB2O?=
 =?iso-8859-1?Q?rZsxHt4VSaXY/Hjsc8rvuD8KsCS3GgdncFWzRq7SQQRq7JQ9lM9H3FNEM9?=
 =?iso-8859-1?Q?Eh61YyXomxzC702Y2dJMx0OiLu9ILbWMeivVDd+DgspmXn/VwIG7bhqDnf?=
 =?iso-8859-1?Q?visw12FdrhjhGGsKwRVcM+WoSnr76ro91vGKkYzIolhRQchjkhsOeHOUWj?=
 =?iso-8859-1?Q?cb/mu0VVkSF9ZpPXjgbiNT7DET4Fwc5nUU5QhYVtBeCpQ6UrY5a4J3scpY?=
 =?iso-8859-1?Q?td+7u17fepOEoe1fzOTjYqUymTlO7me8ltaDx9f4y7HZT9EkvWVcg7ofPq?=
 =?iso-8859-1?Q?BgG5UBvT38Sipcer4JYLq48Lh8FTFej8zWOmChktJT4uOhvB0Ys4BXFIy0?=
 =?iso-8859-1?Q?o/kLA2exYL2ppmzf3gIrelIu69wip9dF0UsQKJeBPx6DKB6bXvjQdciIE2?=
 =?iso-8859-1?Q?NoMhstX3SVfwGeikBknuDx6JIIgTi7lYWxkXvtDmO5vbfOyNX5y7t5ct6q?=
 =?iso-8859-1?Q?oJRef1IwG9ZjKDyRMZWPwYdRuF98FCO0X5zCpylwKIT/tJS420KCkAzy9t?=
 =?iso-8859-1?Q?U6JTb3ngyRI2MzHBEGhcpdq/oKqaQ8HyVWx+9WbrlEyzVdtG/As/2bCwwK?=
 =?iso-8859-1?Q?wUKhG/57TGjUCXoihNkuWnqrssXKzeWf6anGked8wSSH/UtAAc4XjEcEur?=
 =?iso-8859-1?Q?wMvwT0rSv2QbAdSOyZYybZcy+7xuzr7uV6z59Llup1ofGaqxarqUyK5BTl?=
 =?iso-8859-1?Q?Rcx0V7ym2NQJYf4vW/MRlTa/kO2JYSs4pXRWwuSc0Au+rIKpdvl2tJtymM?=
 =?iso-8859-1?Q?6KcdLXAPBHJxz0/kJXHN7Wj3t2zQFFKv6TqlMyZx1rR0CLDHEP+gIJ8hkS?=
 =?iso-8859-1?Q?m5OknaM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tXR7veJTUi4ZC9pRwfAdAE1kEYQ8ttHYMYkzdQauCPoC1iYxdgK+YCbtNb?=
 =?iso-8859-1?Q?rKiMsBF14YTs8INMkB43DkeBFFQSF/6OSNt7daziDIY0mnvw6JGxQ70BnY?=
 =?iso-8859-1?Q?2f665uO/TokIixY6B7Gvgo2B+PmTZ3MP9KaE0tezhED8H5wg3Q7VB5BJcI?=
 =?iso-8859-1?Q?zkRasEFHLl51KYwfeQfH/kuUv4ahhVtEK1RzrvIdNRvz/YzHna20G4TNNJ?=
 =?iso-8859-1?Q?iSCA56RhLBOxPamz2QxwAndd3eM7ZBmJn9vOhe/TXN/yRdixmubDzFnGT7?=
 =?iso-8859-1?Q?Jad2oNTAWGGu9AwCBaTqaS97x5wuhdVySLaO6lhvRV2iUM+PCre5EPAdzP?=
 =?iso-8859-1?Q?hrZzdxU1yTIXhunWBTuN5S5+871YmzNqA1PdVpEK7eBd8ptH0b3vOie8Lt?=
 =?iso-8859-1?Q?H6kzFtkapcndVIc5zD3Dh0bgQ9HnKAUNfv/PiOArZmfCFVPCwo6jUARClY?=
 =?iso-8859-1?Q?13AhtbGjKIfWQ43EsYHYH/mXfVGXaLra565s5VV7kpapciLXYPnRYvSr4N?=
 =?iso-8859-1?Q?+IzhMM6Mk0G8YOueimg5+hxo6iqpVKTfdH9WlpEgWTKFWQFbhiNhk90juu?=
 =?iso-8859-1?Q?Dtb5AEJNBdi11XETrGbasAhDda8vQ/J0IesDk02j4KiybVygI8jPahS5f6?=
 =?iso-8859-1?Q?gMx7GAZ23rXJJ7jumc5ZkHWYbhc6p8GurMj268Z8Qpm/1epMGxYq74dV46?=
 =?iso-8859-1?Q?iMWys44mZUe4z/6zfRhAv+ovnW5dM5v++fZHshId3XIiEFdyefX4vYMTxw?=
 =?iso-8859-1?Q?CZiHSX/zOcVNIhJlk4JWJc1e/yvpEjCf5XL9n00pTdvpfJkSB0UCqayyQj?=
 =?iso-8859-1?Q?CBGSPoaPK+wxbEaTNtBshqE0jKZTYky70jVdZV1pr+5hx6c96aU8BbNSC3?=
 =?iso-8859-1?Q?NXWaG9MybZFOXOCmreiDyI0wNfUCyM/An3aeOQ8/wCJ1sc2qhTxQPndDZm?=
 =?iso-8859-1?Q?ky4w71Xybb/87e2Sh9j1Xp5QAYWCmbopw7sO+7JgxRG1JKFZWycUT6xXmn?=
 =?iso-8859-1?Q?6y1YdOljwqj7QXZ4rLC+zWuCMEesAXtkPiu1jJDVlRTAF6dLRO8e1nzOdd?=
 =?iso-8859-1?Q?rx9J2+BA5IQTU+Zid2zEWzZWJATiG1R3nVLRnsHzoVwpB5fCi+hLP4jskU?=
 =?iso-8859-1?Q?POJ1hjv6dNlb31ulY/+sRzD1AqAD+VHjLVxM1wftN0nLfyw4/E6QdSNx1D?=
 =?iso-8859-1?Q?HQA/Y6np8fff+123aSwv8oqkAu2Ho/q9XyaallxM7u9dfWT1v9F95dCVMq?=
 =?iso-8859-1?Q?2E55AoeAAVvcAAzm73DeB+J6kJant6Psos2c5t5HNxkGfs8m/8QktMfMcC?=
 =?iso-8859-1?Q?6Kc7+IB1A5lpm/xY0yNUbFnkdu+forp34UAo1/9815NP6/PicABK1o5UuR?=
 =?iso-8859-1?Q?68/CjUfArKUVvHrq7l2PlexbCKVZBu1FuAWkvY7VuWsj2Q/VJhsMCII3x6?=
 =?iso-8859-1?Q?Jhb88ePDYMjDsTxy0glE8gMjlesrOMJ0I0FCv65twB3bJ37XDyMyd6ukOk?=
 =?iso-8859-1?Q?rCoQeau3naQBz+Y6aEj46jEKXlsVtJ9df7Y4LJZG5Ic+52dq5LSC6x8OKQ?=
 =?iso-8859-1?Q?suIx4zxOx6EIZiCcPvjY59tPdn+La6W1TmmYz25FpshHtUiCbUC64mGptD?=
 =?iso-8859-1?Q?v16ZiQ2pZczXg0qqXnrjvLK9wz57nP97WhA82KMAFbrbCBwU1tKhvKCXz4?=
 =?iso-8859-1?Q?29p2z7pvTaz9d5U4rxk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54844cb9-4a9b-4ee8-e3f5-08dde596e9ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:08.4142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YtU2bPhbfRH6XDSrChiLi7LcY764L24d05eQPoRo8vrcC07nAsJIzSjGxchMp9OlfM9HlMvibA19X8xP6b4J1gV/xenFT1A2IeulYemCz84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

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
Changes in V4:
- removed redundant parentheses

Changes in V3:
- renamed vgic_is_valid_irq to vgic_is_valid_line and vgic_is_shared_irq
  to vgic_is_spi
- added vgic_is_valid_line implementation for new-vgic, because
  vgic_is_valid_line is called from generic code. It is necessary to fix
  the build for new-vgic.
- updated commit message

Changes in V2:
- introduced this patch
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
index 35c0c6a8b0..3e7cbbb196 100644
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
+    return virq >=3D NR_LOCAL_IRQS && vgic_is_valid_line(d, virq);
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

