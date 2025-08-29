Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D80DB3C040
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:06:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101650.1454635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cM-0006vB-Ez; Fri, 29 Aug 2025 16:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101650.1454635; Fri, 29 Aug 2025 16:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1cM-0006sB-AJ; Fri, 29 Aug 2025 16:06:22 +0000
Received: by outflank-mailman (input) for mailman id 1101650;
 Fri, 29 Aug 2025 16:06:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cK-0006O9-MI
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:20 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19546c98-84f2-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 18:06:19 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:16 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:16 +0000
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
X-Inumbo-ID: 19546c98-84f2-11f0-8dd7-1b34d833f44b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R02WH9uVO6ci5Kqnlp1rbg6aZTCjSmNuX3gtEt9NPcW6V9ijxIqIgOIrByaa/g6eMczHbswa+fe/iyTK7AfQ5b8Oxb+rSZaFrQBvRPBBe4H9ze3fwWFgp5PRlco+AP2lb22apWsp249st+r3mxp3Ts1hU7nBApIWKClIlQbQ1t7GJ+UFQKZHeETzGVLAw1r4903x17YHc1sjxIFGIae68B+/ihWLZSFAm1Xu0L5cQG+yHCb0ros6tskymSkLSYqbG+0ceHEMNqCngrI8XfuT4kOgmQvWLj3ZxK+MtTef083FqArmcGZvOrfmfe5XGMkHTmqbfH2yHQfBe58Q6zCn9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dskB0B0eE1Y40O40K/ixPtdYqmAwbFF7zEh20dywNZk=;
 b=A4hz4Y1Jm4owrnYOjhQ/X6qeGl0OioAd+sqfiQuMYqmnTtWRwVEkUeZwdPFE3WTOaMagzezpTkYuwnKGlY4bu6IjmH24It6Oonbtdy0Y8IXsxXGzlpLaZefCJkFgplwsWhuhl8WDsM3U9ixy7dhMz1vy3so+3X8nY4m8Jdp2EdK4vlvFeoSq6KFLxCsMW8td+Mmow1qjre49zaj3PExdCGmQZjQSZ5lDZlFAYruiX6SB3aXD+dpt1cz4C3PsDYPz2JwIUdsneh3/kHT54+i54eF2PJhVra0tAAAtP5dx79gyggl9SGOW+wLW2I69fBInRNevru3TNTXCsyO5qC9fBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dskB0B0eE1Y40O40K/ixPtdYqmAwbFF7zEh20dywNZk=;
 b=jGQAGs3yg957lH+OeCQgKOS1gIN90c4TqsMX5Pg12ThfaSlK9fd5X7yfEoVKKxlsei8ErqPqFKZATE9+ntZ6fJdR24OE51Cmt7lXNeD5HyaZC/vVCN0yX987BXgQlw6mut5EBt+cGaFu6G0cIjBxz/EyoNEIzjQzfua//zB46iYlh68PPzuEjWbwXfMpDyQnBGjFqtDJo8OTTuqSnN6NkLmpXSlrso5DJB+UDq2gAL1b/ueXFn7nyUM0U58kHZmd+pW2ut3meenxeXT6p/yNz1/chxFS/+erbjyygLRob64gWVunwcN/Ie810cNjNW/kPLMvLtaIMPBxTiP5oVkTgw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 03/12] xen/arm: vgic: implement helper functions for virq
 checks
Thread-Topic: [PATCH v5 03/12] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcGP7Z97jSCMPN5E6tDOtAPST59w==
Date: Fri, 29 Aug 2025 16:06:16 +0000
Message-ID:
 <02148c202b3083646b0feebc8b56f1984e4ac8e9.1756481577.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: 0b1d1758-344a-4fd3-76df-08dde715fbee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iB6j1+XqRC5bT0UsSJh7NUoPIC5+qmzzy3bI2L4TncAy6DOAIYS8LjGTTX?=
 =?iso-8859-1?Q?WvEHz77mIW52ssM5i3+dEL6MFdz7P8PK+E+Y7isLtM1KROvyitIBqzPb2H?=
 =?iso-8859-1?Q?2QmxFTocoKEWZiBiAUwANj5FjLH8GDYPg68QRKU8KmHyFJFPAGRmB74MW6?=
 =?iso-8859-1?Q?xp98kGRzK6/aKnQfZekid8LCOx09HmqhSMApeycJ08e3qfB1mN/6pTQ46C?=
 =?iso-8859-1?Q?7Ox+CbPfzUWTHB0FUKsjiUlWuF0Qq4Nz0I8r1lxzsgdXBsCMQHkcCbJQEX?=
 =?iso-8859-1?Q?+cYHKOhSJQ9hJ6aFKz4mIZR8gVyIxOP/IeUHcUDxaZhtEDlErAdhYeHuyv?=
 =?iso-8859-1?Q?MSLOWU3Khm7SzfMazX5aFv8gshuc2++JCCgapnigJJlp/Q66b0vSZh3rHN?=
 =?iso-8859-1?Q?R1q1xi8Fiq7I/GRtbbu8DlNfvdpvdP75WcJCZd7o9X0o5MEWKmTNAB5h2v?=
 =?iso-8859-1?Q?zg2arjB5n7TxRN1v/c+dtV7K6dpf8r4G6VQhqaZFpOeVayL3CNj+V7ch1Y?=
 =?iso-8859-1?Q?/10xuEE//F2WcypNDG/bV8bGP/fxEjKeU6Ps9qDG80Lj3OOHGMEu3ZWTI2?=
 =?iso-8859-1?Q?tr1sjWDLdWEWG2GcIP42kDkZlDQRdWE81ij+2+X52HurbiSUhVePgNuXkL?=
 =?iso-8859-1?Q?ie93q2qbPd48d/YJQw0o9RMPDhnAJOS1JYzbN2DiBuREc56IfxUSTDX23A?=
 =?iso-8859-1?Q?VjPgXfiDO39+UCo8UZOiPkxnoaisu7dDJeWBAvifQfFtzgvYSm2aqf9t31?=
 =?iso-8859-1?Q?dW/9XITw6w3/bXAt8JB4fY26red44rq4twby9WiG9FmOth0xkSJHF6LC5i?=
 =?iso-8859-1?Q?374WrU5tD+xcNUxvSk0OghVLKW6/duy8g7FPereaap335W9PiurjNPYesJ?=
 =?iso-8859-1?Q?Pi50LQmyM3mc9FLVIZXHGc7wLKLsXrPMhR1EYxavc6BLmp+55FcH7xNV2g?=
 =?iso-8859-1?Q?vGFh5D6zyq3GfBarILQxipRbyaWWLlp4ptJtSFActooVmI3v+IprP6Aswq?=
 =?iso-8859-1?Q?xs9ZtSKQ4Y2yPP6PyHCu4c+45dCQNDChKBbQxecV5Hj7Enyv6VnlsDgop7?=
 =?iso-8859-1?Q?ZhpfAsli6ZP/0K99Zfu/dTE3sdpo5Gan0QVWS/9qMtRImWLAxXpI1h8c+V?=
 =?iso-8859-1?Q?xJXJsJWXzt2BWXdKYIG0Yr95LRHf/yvYUyCvEzsHQUSHMB03OTFsUvx2+I?=
 =?iso-8859-1?Q?G0a1DNE8dkK3hWADMfMc7KgII2bx3wk1V+hpU+UoOA1aCwWb4UUqU4ym8/?=
 =?iso-8859-1?Q?+20aCxEOODoUI4FMSRE7xT0PFX73IGAC2WIOeIM0GI23Y6ztlFFqq0bbk+?=
 =?iso-8859-1?Q?qNV/+IXFAW7WPYZHEsh+aZFfZu3t64449JOG4o93aA2T+D66syo5PCWfoM?=
 =?iso-8859-1?Q?xi0v508B78sLtFZ44ptIpsSFQ1KrXGbfi9wrn0YrlFgCHstrA2BRcPYgNX?=
 =?iso-8859-1?Q?wV+FGnmzDtW3901V8FQqet6GWMgPlH7kmc7cEizCcxCw0/D3S6Y8/uSl24?=
 =?iso-8859-1?Q?wSVkU7lhO8puCyDccAz3Fo8CA/0oWAK10vImVFkbnhGg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KZOzrgB2FuJLdsZKJcxyu0d7l4BfFXRSHHZR7YDvkvEPxVj9ANpZbMeQjl?=
 =?iso-8859-1?Q?HjUMlQeICsrHKX8ghlaige/qlxVLq3yhkYyX4JbvjfZUqtge5+NI16Ae4p?=
 =?iso-8859-1?Q?p73YREZk0zlbI6Oq1IbiN5Lw6of+Lsg8DjaPaD2STIFuVinUBlnzSFYFmj?=
 =?iso-8859-1?Q?Du6rFPexfmRPnOuuHufR8FyBJnKmlgrzEKYRFQMoU18IFezz+5/waZGtoj?=
 =?iso-8859-1?Q?Sid2t3M1XighpvJPOiVDMpkdK9fBxhUVJC1fy7hhAhAV9Fbcodfgz+lN7Y?=
 =?iso-8859-1?Q?f6qHDynAhoGOU1JL6EbNrrRfhPPgoUUYBde5JbJ2QSyq7NL04LzsayVzUS?=
 =?iso-8859-1?Q?p24q+Rh7kEJcIpc4hLy7UoBLp8mSjmL3VqVTcBL+9Tgragh0FnMUvN51KR?=
 =?iso-8859-1?Q?M10B2QTjeyQVJKU/PgA7QTk5YGYFSzIEw88UYPPI0lGIgt5xqfgwkUyjAu?=
 =?iso-8859-1?Q?m1W0AjecTEPGv8T1QY/49PgT7id+r807j/n5gne6Xe43cSTdqEROxmJF8k?=
 =?iso-8859-1?Q?3u3LDL8NCPO5j1nbtOFDAMoenCK7Ls+8Cd1HfaEgyHJWuYh8rqHoVA6IhM?=
 =?iso-8859-1?Q?WnjsW2kYPfSlOX6cU8bDVCmV2gFPhGNB0f4oNdKIbWlptR4l82P8U2qMsm?=
 =?iso-8859-1?Q?PLhhK4RbZSYRqWvQrce2Hu7nGiDcHYNGOd0C6K9EAVv17XTbVTwJSnR3UH?=
 =?iso-8859-1?Q?ieALFvmJP8/XKP/AJP51NckZoiFwl2qZeTlaX1uYd3vsXOheQsetGabyVO?=
 =?iso-8859-1?Q?HhukGIsgGV0cjS1oXf4QSDnD8nqibsDqKMicBtTxy5NG+RGUqw0W5J/Yn2?=
 =?iso-8859-1?Q?97ghJSKozvDfBDe3Ru2cVe4O8LWdl8UZjqdb1rCDLPKdIgh4T4IPaW0lcC?=
 =?iso-8859-1?Q?PgbrxqrFr+PjjEnIm4vAi4GkXUTsUerJPB7WfqYIR5pMLlBriyy2oFmj0m?=
 =?iso-8859-1?Q?W9K8iX3o7QEdWQebyJ8hkmoREGvupbZ9uK7aIrpjHBijLddgPx4U83OhU6?=
 =?iso-8859-1?Q?t2+orggPZXg8+wKT5fNuv9N0l0PMnXDxgtASBkz/aVvtz1o+2Ah2gbSP3L?=
 =?iso-8859-1?Q?mRTgkqeNseboBbb1MCcTpOstEtQPfg4pPSa7rQsJpAbRGK+EY8/OOTMI00?=
 =?iso-8859-1?Q?JvV5KqgwyuZCHcq3/ZwgGBQ60V1oTr8/byIAR6emQcxho9Ne8U522njyBe?=
 =?iso-8859-1?Q?uO4Kc/NlYgdzDkzulD/Ksrc3m9CvpylaKWpLpg2d7YcoTy+Yhk4zgAO16K?=
 =?iso-8859-1?Q?+TkhNYW5r67QV13s/+AxkhdLkvC3dh530/Nx5R6lzs7P0DxIci74Cgogdx?=
 =?iso-8859-1?Q?uItB0pkfQl5SBCx9LiaqcoQZnkE8WVNhvPGPR4bfoXifn9W+oUxWRwIAsO?=
 =?iso-8859-1?Q?yt4sEXz2oywvoVm0jGw/I3P3IEmHAOKOYfKpdZdG0zYjLMrm42ib9sFPKu?=
 =?iso-8859-1?Q?hIqwteokWZZIy1o4cBbukKidJwIhKDhkvYm7I/kbXwjNuRbmFyV8vpYGaf?=
 =?iso-8859-1?Q?oT9FrJOcguWn1n9DRH7U3k2DIGlFUOnTwyQ6YpEfBpqMKrummYqYglvq3Q?=
 =?iso-8859-1?Q?Gh+gk+13nVyzQTNPoTQqCuHaXu4OSx7odUmAfgosQFUEAIsrd1JV6q9iqA?=
 =?iso-8859-1?Q?O3r9qNMq+YUDHGptt1vcbFKa7rG1V7NEw8nxH4Ny22W1PpNaFx/lyU4X+E?=
 =?iso-8859-1?Q?wu5VTywqbW4XsyVwLy8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1d1758-344a-4fd3-76df-08dde715fbee
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:16.3413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6EjBFQheazyL4ZpNZgQt/uVMFfmbZ5o9bcxjOr5+5MFW0VAJ9DvpOp+E5BY5Ojp6au8HfKO9P7mDRJ0Z35dVZu7m+qbDLzmqM//0XXEpBKs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

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

