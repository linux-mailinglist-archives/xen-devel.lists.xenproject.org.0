Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8124AB423B6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 16:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108413.1458558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUu-0007sr-OM; Wed, 03 Sep 2025 14:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108413.1458558; Wed, 03 Sep 2025 14:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utoUu-0007p0-L5; Wed, 03 Sep 2025 14:30:04 +0000
Received: by outflank-mailman (input) for mailman id 1108413;
 Wed, 03 Sep 2025 14:30:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rd+t=3O=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1utoUt-0006ez-6u
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 14:30:03 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a21a933-88d2-11f0-9d12-b5c5bf9af7f9;
 Wed, 03 Sep 2025 16:30:02 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV1PR03MB10653.eurprd03.prod.outlook.com (2603:10a6:150:203::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 14:29:54 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 14:29:54 +0000
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
X-Inumbo-ID: 7a21a933-88d2-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yWnW5gox+e8yQrydd1nsEbPKV4y+oj5C5Me0kTQt95ZtLMzhKx4WvPHPS9HHYFCG8CiOedXGtm3ct9TZXNFCmU682sCjh3QavdztemmzyMzK09Mw0oMsYe10rDavt843S9pGuc+r0yjvMIhw9vXXHESN6eSM689imL7zRlgN7/h07SwDLWlav4c7/MVUVRxS4DKpNC8eHsLyI2jk0HHSpbHhLLm8bCWw+lJlEZjqzKsgit4Bf/7bStLNfKbEUN0qu1dvylvf9mf8xFlOfrsg8c1xnAMhWxTmgyg/Jd7k51FcFsFyeKme/jv83XmPxLi04HW24kMEvo0rscASJJfNbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrWC5uRhNl1SE1q8EhTRm8eket1SP2p4NaLI8u9TMD4=;
 b=inAtqYVJGoL1ChVQXkwLGyC8MMkb+9IcxB4uZAKfKFeP1U/KZnlVJKXjnT2qsWsJ3+KhaJl1eDBwxd9OFUnjmsnGz7ZN2sgUF9EE5Kri7UKUsZwAfgqFjX7yYjIkpUT8Ofqo7GZqHgFZN+cpXp/QoybX7kf2zcrmqBPk42Tm1YjMzfxMz5fKVgc8btoysK3cgQuWzSY3QYxSsZZ2sPbkspJ35rBVFqXdjhJHT8pkGWlbPV1fPaBIhHTwnyHkC7o7vy9gs92yR0nuA5voTbrXywImwf80BhJvTmbcx3zZmbtBOfBAwvb7raBct8IQolzDRsyG6yuqoRX2evDMSYOftg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrWC5uRhNl1SE1q8EhTRm8eket1SP2p4NaLI8u9TMD4=;
 b=u+q2zRnP1vL5HVdwHt2EHJaLpNvWP+VaijJmsuyesSUfC8vbVECg6zkRWu6XMmlbNn3XLjgqLCaI+JrOUXHGiDNwFTZTKExNwU5dMQAn1YyR8p5NUjamJANXfR8fVEjtA8/AkaTwmuvB8af6yWukS129BXrJQM+8ko4FGfWMMg3hPNUKUwziFUEgjJZ2QumWPGzxBnIZ1HipYf7ddfqwU2TAv39jK4PyirUcmxGR1JRiY4UkrWK8u0TAkVUbYEpYg9VtVhplMcvMxjAIWA/nlv24XCxn6ZQTpmtTqKLPQqBRBIzu70wpYIDxk3eBQ+vbZfdDqXtJRRUuRAsdiIQDRw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 03/12] xen/arm: vgic: implement helper functions for virq
 checks
Thread-Topic: [PATCH v6 03/12] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcHN83+5P/oJUHqU6wiYlK9zjsyg==
Date: Wed, 3 Sep 2025 14:29:54 +0000
Message-ID:
 <4462db231fb6ba3f63ac6dd51ae4016c0efdb646.1756908472.git.leonid_komarianskyi@epam.com>
References: <cover.1756908472.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756908472.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV1PR03MB10653:EE_
x-ms-office365-filtering-correlation-id: ebda2755-f131-43a7-1380-08ddeaf659b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?m3REkfmRRFG4HKPfYLpvT7NWEdTvTr8enG30l4VO9VYBnc6oNMSODk/ZkB?=
 =?iso-8859-1?Q?2SxBY27NXYhhZELvAxkHrLQ0MAB9Cko1L7kQpSJwBDNeD4Q9l5MMFsugWD?=
 =?iso-8859-1?Q?L2TQOoEEruUh7T7bwD50hXkvpVfmRyQiVSXPa3xRZHcm4xq0HHq9JtfY2t?=
 =?iso-8859-1?Q?fYE8QEtLLVv66Pv9ygkLaf4QfJ4+SaMRB5MiywlGxPWtthTf8eo3uVAd6C?=
 =?iso-8859-1?Q?4D5wUUX8h5PgDiJkxHe6igqeTDsrkm9Cal8alRdDIh9mvlgb9LnIu6p8mQ?=
 =?iso-8859-1?Q?gDb+/h9gewTuEojle5pVUQ8WqDFD1JUwLynGDy2YOCWg/Uk5yhhLyZCA8p?=
 =?iso-8859-1?Q?2ut9hUycehK3fAIP2kni14hH7YIDYHywD9PbbeLr27/blf7Wmcf8SvUWl4?=
 =?iso-8859-1?Q?MQb9A4keZGXkMhk3tYliCbAHwbDqsZYc6h/A0SeDSAMsKbMaZZFtgFpAGO?=
 =?iso-8859-1?Q?h0hcWKdRaqpWRPZRC2tDNwp4m28mxedUHAtBtudaeaBQrniaZphpCakrgG?=
 =?iso-8859-1?Q?Uww2NzW70aNMfB745giXr6saGaEyvvXN4Er4iOo7t4081Wcx9ihv5vyfGp?=
 =?iso-8859-1?Q?0gT/u/MPVtCNpMsA3D3EUHNK/puh2Ko/HlqX2Sc9cKwuSN0WRym9/LyEm/?=
 =?iso-8859-1?Q?IAGDW8joyJMb0eWzAuU2VawV5+R3X6m+an7fAZTEVeNrQ/m+MatzLTI7Vt?=
 =?iso-8859-1?Q?gMFqfk6kkhgC21xMdTmlJeq1IWY5BgxbX8Pxv+6QomwSvWNBkObi6ah0Fs?=
 =?iso-8859-1?Q?wdYCDfCRu/oydQIPq0sDb64Lo5y7V8yPzLE245tFCMXXOxu7+5PFiPsmwP?=
 =?iso-8859-1?Q?sHORJMoNRwwXJwzVvh/TbrB0YCARvSwB9EaV3h6Yq+2qrNcqB+VrwaOY6/?=
 =?iso-8859-1?Q?QYLHTF2PQYzt5FIeKa2J4xF1z71AW4nckF7JmhTHcata+lXg3tY79KS+e+?=
 =?iso-8859-1?Q?JP4/Mfu//EdQOH5FXHi5ueWz5W/JmSbMQwuSDUyYSbsDrVPOXKWRxSS+PR?=
 =?iso-8859-1?Q?VonO4pKVJv1jjzJ/F9CCiClXvfZRcLJrYYyFDlmZoKxxKNY3JmrSHtwuGh?=
 =?iso-8859-1?Q?LGcpaMNQzNDR/6HF7QW8TFnMGYMLwCN47oECd+KxLDo74rfADqtg5LTNmE?=
 =?iso-8859-1?Q?qckBXbrQfcMLbFNhpEe0Uq0GN9Hsxr7ex8A/nGb8G5cDtkwFmcsIu/m8Rs?=
 =?iso-8859-1?Q?dM0cyA9Tg7KjDByYkb1BmrQZmR8tiGtI8bPIGP9/mBnhJBYlcfeasVFqwy?=
 =?iso-8859-1?Q?ApaI8DMidi+l+i27xq8lVIR3ZkzeYCxq1tuHe8STQWgevgGNy24ZcI9ecK?=
 =?iso-8859-1?Q?yp7B0MCrX8JSQ2ROZ4hJjWYfjAGfaUjRtAepW1J+qt5uQpMZOGSFmgG1jn?=
 =?iso-8859-1?Q?g2XdzJ2mY+4pmFfJBVROwyb/qIAYJHYjSBjUd9RE4EA75q7y2aVv1zIF2l?=
 =?iso-8859-1?Q?OozOtF/CKW7PFvrCE8Ynj6K5IiBIh8j5TgfiHosk6ohi3cD2YeqmZJgyfx?=
 =?iso-8859-1?Q?yepbMZrdPUKGIV8QGR1Szkg6GR3QgxCsi1cSz5jl3a3w=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?AhkwvMO1g1dG1KE79zalOjd/L0OeJP7OUiW0YBX7tUfid6oIVCNi+sFiBz?=
 =?iso-8859-1?Q?i+p8DiDW+zWCApioULwS9yWRzXHjvxQNEEn5JpJLw/CnHqSUzEq0sxrQib?=
 =?iso-8859-1?Q?wbm/whGpzMC/ugJPVKwDE9xAq5Zh19+lAp14/2HAn5OJGaHc4j5Rlf+ICZ?=
 =?iso-8859-1?Q?62eO3xZjR2GAFAp9D/ZBHje493BIXzcltiPQHDrdeaA3cJeNSPI3hDpwZP?=
 =?iso-8859-1?Q?cnK4/O2XNpEANk6kFCjObbPm/HyntsCzy/vymRg2mjqLMW256m3GCcStX3?=
 =?iso-8859-1?Q?tw3NM2kKuJeenuOUpoCv1X4KLdT721IUKGh7SwQ+6SwBLHwpY23x71Sv5/?=
 =?iso-8859-1?Q?8MjYkgJNi9Plfmj1b+Od4LR+xHkQ5S+3W8YXSTNLBlfCNohUa1znXvGEof?=
 =?iso-8859-1?Q?0mVvVOcgbCAqIiyPB8Gsoh6t91wwMpMRdZVxIEk50JsEM7V7EWT2Qeb20J?=
 =?iso-8859-1?Q?muNfbAWVf8xt+YscGiogGIjOXxJbg46crwZsilYqQSp1brd3oNlOfSh1fI?=
 =?iso-8859-1?Q?iyrH8xH9evpAhLDEZ1MqEsQGGhBseLFgPvx9aJVfScbMbgpmD5AdpTs9+L?=
 =?iso-8859-1?Q?emHF+Xe+vX/btv6GGpNmoUD47mQ7h9FFEFkJQXgMclUN08USePRrRGyA/o?=
 =?iso-8859-1?Q?mIBhbL1XUsYLe2Qd4x86RVY6XrBoEWqcQaD2XHXUHc1XTyGUKBNLiOc3rm?=
 =?iso-8859-1?Q?l9bwqUldUSW1bG7EiX79XReYymm78C2RxpXXrhS+lU0fubvEQiy80+agMG?=
 =?iso-8859-1?Q?0aUMwGymqffYEZ9p2SrPyi5OGCYy6Rbe8K0JHI6VqUVs/l36WWsa+FFR3X?=
 =?iso-8859-1?Q?LkDVS1aaa+aRLueLhJoHJLlgIPoIEijmLx89+lwXHbxiLz/8V9G4u1jjJM?=
 =?iso-8859-1?Q?eJvL+w4KiiIdU3vwsWmvYYDPKN9SEw3VE1TkbNaqLI7nHQiNNcpH87ZmXL?=
 =?iso-8859-1?Q?m53b6c0ff8OWCkTh0OpLHaHK7uF3AL8k7sL4ssQ5jJJz3vo/uTL0P4OvcI?=
 =?iso-8859-1?Q?C5Ddb/sBxlBGzBfQjX7GxPKRDufAi8f9GIfBW1Xi8kfupIDMF7Z5VY8B4K?=
 =?iso-8859-1?Q?nSaMhfqiEyizOd11waAMLfmgoFaDFkjXUV65fz4Kjzi/TQ0vGosh5OLMc8?=
 =?iso-8859-1?Q?Re/x8UOqSUUe+iV9+JUS2WfzVSqIMGUhrnus5IMPJzuERbCCuYaStQ+9G1?=
 =?iso-8859-1?Q?WLnVQlTT4yeglAlVghbX+yOmrkvS4oQodvWCa3ivhXtygpfhLgPNFHAGih?=
 =?iso-8859-1?Q?8RRJFN//LHYIssbq7c20yUgd/cwuGTMsS5IaguNShxXTIDE5W8JQyI7kX0?=
 =?iso-8859-1?Q?uIx1a10goYGv/tSkrDWxpDQeg0p4FhuMIioBESKWd2MdSo7HaXSN+0apOz?=
 =?iso-8859-1?Q?RnZI1bOtd8ydWay5JVAF37gfugvvc7ZnO41UhMV4Mc5FY6dTWKbgAgmvBG?=
 =?iso-8859-1?Q?wqHGy2A56i/n2qwUx+LwRE4IIk5tzRG97agr1ilBQvSKVmvzj1tylYFL/h?=
 =?iso-8859-1?Q?aLMzkwqlYjBEnlv2dFasO2+T+CtOXEwDqjjRhKDtXUVJBdRbaizmTgmq8P?=
 =?iso-8859-1?Q?A9i2jvJQgVVWHj/l6tbzIFg6/Q1W+F+erZtjHxgqS5k/Ju/Jq1AaVnURBU?=
 =?iso-8859-1?Q?msfkCh9PjYFXqmCRRRTTAoGQgXD32eLE8+fTtjDSs5jDUX2n2uDTLcISs5?=
 =?iso-8859-1?Q?wQ3dt8vgtZMKv8zxzY8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebda2755-f131-43a7-1380-08ddeaf659b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 14:29:54.3937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t8pQ1BfqZ6YnaStW2Lk/ILSVuLGuXhPIdLQuRH572ofi8qAXN1y5yTcmuRWT/RkPwBTyaPQze/Z6raCudOTg1CEHkd2lN9hdYR8eE/7XHdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10653

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
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V6:
- no changes

Changes in V5:
- added reviewed-by from Oleksandr Tyshchenko and from Volodymyr Babchuk
- added acked-by from Julien Grall

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
index 4bb11960ee..9469c9d08c 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -134,8 +134,7 @@ int gic_route_irq_to_guest(struct domain *d, unsigned i=
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

