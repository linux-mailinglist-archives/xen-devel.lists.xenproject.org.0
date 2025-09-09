Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B31B4AA53
	for <lists+xen-devel@lfdr.de>; Tue,  9 Sep 2025 12:21:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1116261.1462656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvTj-0001Bz-Sg; Tue, 09 Sep 2025 10:21:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1116261.1462656; Tue, 09 Sep 2025 10:21:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvvTj-00018w-OJ; Tue, 09 Sep 2025 10:21:35 +0000
Received: by outflank-mailman (input) for mailman id 1116261;
 Tue, 09 Sep 2025 10:21:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=noAm=3U=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uvvI9-0001My-W4
 for xen-devel@lists.xenproject.org; Tue, 09 Sep 2025 10:09:38 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15f3f546-8d65-11f0-9d13-b5c5bf9af7f9;
 Tue, 09 Sep 2025 12:09:35 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU4PR03MB10645.eurprd03.prod.outlook.com (2603:10a6:10:58f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:09:27 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:09:27 +0000
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
X-Inumbo-ID: 15f3f546-8d65-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXvHfiZ1y8AHdP2QKxcwOv/UDY7xh/Z7oCeafGF7Y+bQb9R9NddZxXDvZfDbsJg01xcOY3eaz1s5HM4J2OpA4Fp/8jjkdKQEMCO83U/Z6P4uWX5HsqePOrlPKlihPVnfWXoh41MOhN3KfkVnQlD9GF15TLAzztyvyUGdDYhpbnH9oJT2gCmKemvcElKMjtnUmNvs45gwUNIHVuGkcGbbU6cJpotdat3gRTKtXprUJamrReimeEN/MjN35wJxsJ+H+FbH1jrqr7L2JSsXiHl4ZJLhvEFAsLia4xUIJ+Ed6wSu95kbquDdbGAuWoMGox8SooJBUJFbrp0sVCngDHyUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KSmiu/S9+GDUlRSRi8m0qwuFH79DCF3EJZkKQ62VV4=;
 b=iVp+LzxrazhjGLKSxpM//vomGhWp2wrMW024B399+24JaECsu9c4oqf6FOp7uUMcjs+vO2yGqsstVl5YxSbpINVWNFvpOZIBJQzRyQKYiQy0swCot8h/Vb2C5wfrKajbp/w2AeG5GXShGvfnpm/ryW41j8E2wfp1rnfqJjBvC9sFcljVeN1CJRRQHD1VGNIhYUK/lYVFQyR13mWVciJPShga/YCqOb5krb+6p5Y0OuleD7nuLw/xgAuWBpRKmdhanIExyyMG/cmqXxfFxtgXmrCAZK3vWYpfukp67c4CSiwUIqmKkjZGVqxTTsVsOs4SuppCBIu300pvVhbbPfA+Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KSmiu/S9+GDUlRSRi8m0qwuFH79DCF3EJZkKQ62VV4=;
 b=uYeIQjhpx1PzEEMkkzPDbYbTqanfY6JfIV5hM5UEoXrSmUP8QEok/GJj2TU5YPfo2H3CsAfVtuY2tUpzYKf5jaV1ZMc7frnqjT7x9MZlar5wf3AgZH2W+bem0Mf/EIQJlz2o60acwxaNDh5MlBXjLmmiX4XVdqUTIVKrNwcWFrWgIhxJWIVY9SCEMAUZDFyvwCBVftJBSFYBTI7ZfkQj6IjwgmoCa6y0NeFOJaMB/M5LPuKqMODS9rQcuhhe83u2i47lyTVNapnaac2xzIlkuP/sq3+vHepuY+zBesHLr8tWk36GkajAT9UL5ZwTpSbqnK0o7MAhelXXcbZ+NFCpeA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 08/12] xen/arm: vgic: add resource management for extended
 SPIs
Thread-Topic: [PATCH v8 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcIXHSFZfGO31880KRZV6MierZkg==
Date: Tue, 9 Sep 2025 10:09:26 +0000
Message-ID:
 <368bb1e6842beac65151f02ee6491fcf8a819c02.1757412099.git.leonid_komarianskyi@epam.com>
References: <cover.1757412099.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757412099.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU4PR03MB10645:EE_
x-ms-office365-filtering-correlation-id: ffbb3c91-80b4-43f6-5743-08ddef88f57c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Xt6Y00o6LinjQCVbxuyxrjNcjcaB92fKooUxvEW+Jjx2WSoL8v/HMlmHlh?=
 =?iso-8859-1?Q?RVrq1xpyZ+EPdUgNGkAGe7dB4sqGJDijwUr5YhnDHxcyedR+aYvnrSMiZ0?=
 =?iso-8859-1?Q?Prs1tX3cI2/aizjEXE6NPgGk/vtEVsGDPL88CYWrBVUMVh1yrTEKeZHZes?=
 =?iso-8859-1?Q?nQdAkWzjx7tNLGyWK0iORwAQtfM5ZcDTL9dBamtNGvFVNueltSYBqxUsPm?=
 =?iso-8859-1?Q?KZ81R6A+r56WNBKCXat0wkAyERnvMm9QNQTSoU8QH9t3YdtXJUq7KynHDA?=
 =?iso-8859-1?Q?ZPdtblhLAonTIA8pIZ90CiqkU/AATUwp5chlcnCXJdyalJZpDzGh+rcm13?=
 =?iso-8859-1?Q?e71QFStCcwYToxsh4NrsD3E/xccCHwQeQw3qe8vf74PQnLc8Bd/Kpn2ypE?=
 =?iso-8859-1?Q?v2+Y0NeODWRfL/NCXbGLXD1WJ42wCiz9ZDel+K6g+RJs7aw2SmVCfbONA5?=
 =?iso-8859-1?Q?67WDRL3ukAuQUHsuKHp1sIPSnuAak+rwGtuIkCNuVcmYAUl6RZr3cXykDb?=
 =?iso-8859-1?Q?o5YW7pPBSy54njjVugL4bVBaobz+4R1FYQA0f+13olc0Hb2xSmwicwqtNR?=
 =?iso-8859-1?Q?5t61Y5jWsK3R8ST2kOb7BuHIhdN/fdOJ+qwCTvjCr/cTHMS8IzFAmELQNa?=
 =?iso-8859-1?Q?f/OVFJvP16OJP1bavCS5e2JwRF2FbgCRaAZuFEDflaynzvMauQWjYo8BxH?=
 =?iso-8859-1?Q?XSAAyppXKXP7RK6l4ZoZYuPTJt5OkthYF9y+oodHLeeag1nbh4KVP99Uww?=
 =?iso-8859-1?Q?ViihQ7cGIjQLoICTtgBJrQSdxhyLB3tDt8rupByzJRrFDe4tR2u0vLltin?=
 =?iso-8859-1?Q?2z0Au2Pry6HmvGJoMXvXYbIoqwhWLrtmu+rhTCA+ThkKfKXKXDvsTzOYSJ?=
 =?iso-8859-1?Q?PLJJhs4CrWORGtp8MuSxNsY1xWuaLD+3IkASMRjem2ITUIMPCHJGnn23cf?=
 =?iso-8859-1?Q?klVzkkGVu7gCAWLriZ6NoxuFqDmV8BU6yVarrTBN4gOr797efqMmyErlIL?=
 =?iso-8859-1?Q?9rmshxuW17phYnDmeLdFJXz51flD9m31lYggBrZVNGvsknf6O0tqM6dFTR?=
 =?iso-8859-1?Q?2bBeKzPSVh4mGUlFpJnbEmClcHRVUbox8S/5Jw6IJqNV+f0UfxhatEqI/0?=
 =?iso-8859-1?Q?mXHSbCRy4vlVg0KulxZn+F/iXxArab3KsepF29g4QFlsOzcFYZ646ZAJZS?=
 =?iso-8859-1?Q?iBJGxuLkpy/+Im2JzGRouNJB5ToKJt4MJqL7kr5wyiQrMIDSWq2zY6fYeY?=
 =?iso-8859-1?Q?xz2iQ2W2TZTP9xVKPJGnJlrhIF2kMy9Z7etvPoGrWeEoBLz+JG8DjMUWC3?=
 =?iso-8859-1?Q?oFASgTtQsDB2L/VOAvBXveL2CmP7qtstmIMIQa7io6zUO0C8FLtFYQkZio?=
 =?iso-8859-1?Q?JNEi5rD1m6zDIHvqgr2mRDZrEQcJ7FVcUqZ1lY0A6LDh/m6WEnugnRrj3Y?=
 =?iso-8859-1?Q?On+hMdJWMkp2tJnRI60Fl8TTTWaCFxtRDWXz+doXLAFgjkyG/3ZhNDYUcp?=
 =?iso-8859-1?Q?hPAm/sDYbS1f8hcMrH3uuIxSQ4Pr7ZAT+WE31clS+Jxw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?I3ixdCl1N6yGUHcY3cbnG0EL9xhESY4HcY9fqkBgLFdhDGMGD3jWm50TKP?=
 =?iso-8859-1?Q?ZoSKg6lfMZzdsicvwbUjx1ScWF6tv9CgGMK4YikbmUu958gx1IDi3L0DRi?=
 =?iso-8859-1?Q?PfzKKcKQx3JUeyKEdrxRR9dGwX2FbtCm8S2WVMvi5KbT6TiocHtY3BMbl0?=
 =?iso-8859-1?Q?893ZSr1ftJm4E8e0isi/B3ymi0oWMd83mqu6yMmv6FJFtpx8wpPuKlUcIO?=
 =?iso-8859-1?Q?JsFp49EOFQ7PVH6dYXOpt8p72flFtCcs6L9Lazq4SfmWWHeBMM936Oh1iV?=
 =?iso-8859-1?Q?39+Uq0M+4XDkMl/zoOErAL0SxXH0D2sMF0VDS+zvjqCSdeQyC8gnZ7RWRP?=
 =?iso-8859-1?Q?OeyWd5WeKl2nYk8JbjkidSxnrjm3/cqGdASJfnqBOspyQ3y2rB7i3p/ydT?=
 =?iso-8859-1?Q?cjSPVs5FKJ8Xxh83Nvu5Y2AlCAbJRR4yBkCMnuOAfvlW4LZo4DuMmedrIO?=
 =?iso-8859-1?Q?0c/HPwffWWdr8ezJSsilx1rTvjwLQmhLhx5dv2kW8FGCvUrzyp5S+jQ63I?=
 =?iso-8859-1?Q?anpNHUkmE8Dk1yifr6p4Psfy1Bqcz+JHHOL3SrAAmMTnsCYVJ1Sk3e4sgP?=
 =?iso-8859-1?Q?CmhU+rcamINIhr27XipqlVlTLBMcf7wNuTcvO4Z+A3cJ+ZPGc3ho6DLZs2?=
 =?iso-8859-1?Q?j2Kho8WO7NP+mlXKFnR1nv8LnGcw2haiBcpnoX3N/sZd43t4ME9hbydgTN?=
 =?iso-8859-1?Q?n34X22qAgeHJhg6keJOLtJiSXuHG6KWZmlup26YzuWHU+a6gARm9i/0tXH?=
 =?iso-8859-1?Q?XXZJHParMGr2o2kIgMBle6xKPgDXemTiB24RG1mYLrFgy/kepVqEMRxd+K?=
 =?iso-8859-1?Q?gJ48bIHAWoXRTABWQ1S9UqYC83gzaZVSOPidPLgBUxIzvd4XuPflGpbVbI?=
 =?iso-8859-1?Q?gFdAMCZAduxUKza893KMAu9fnBaB53w9tFE20sdbhJ4JO3Y5VUn0vTg81/?=
 =?iso-8859-1?Q?nr222S0eqK/s+0BGdYbiTf/95woPhdWWFSIwgVeb83AMXRrJ4NxFyNmEy1?=
 =?iso-8859-1?Q?LRl8VQwxkAI+2Lx+l2xrHa8Cqay6fTlea9oaO62O6fLdzX+VjzlCcS1xFj?=
 =?iso-8859-1?Q?jp1SSgaOpZI9eH3UmHVnoGY8KPafMGSoLoKdA3Odts4M6CJOii1lsbT5uQ?=
 =?iso-8859-1?Q?ng+5YyVsiRhUOSmWkVwN7v41VtidHeei2ZOoKqiA8M/0VJ508+BBDkyKJw?=
 =?iso-8859-1?Q?cBSm7kmSGcQ8obXuRoLmqRuv+r5t6QNe6me+/wOOyWyxlsdbTf+CosUSX2?=
 =?iso-8859-1?Q?+ZiRcgsHCOuYRDpqRt1vzZNOpQidTTc9USEsyROGEPeyKDP4gDyif0sUcc?=
 =?iso-8859-1?Q?A1tXp9WR+hoU9qrJzx/jEZC7a/tBy0SmrTVxmWRSwqRI/o9vukQZ8M8oks?=
 =?iso-8859-1?Q?nvEBvDuBETnbwXs49HGtKOs5MSWDVe1BrYpn9C82LKQm45gsCj6VzpiOH/?=
 =?iso-8859-1?Q?1nZNIByy4hSfdpV8ZCpRy5UZiPfMTPqKacTETLeh5Wv6u5vH75kXvT/nyU?=
 =?iso-8859-1?Q?Dahais/1r5hrFXlI6DU70lvMgtegBVAlBZ8L2FxLZaCG8X1OebxtkhJmAu?=
 =?iso-8859-1?Q?4krwNUauMRdcOR6ixT9YdlT/bxyIr3Ku3xDSJTSbyCfIhFYdxX6Ypx57Jw?=
 =?iso-8859-1?Q?fCCMXjiWu0AWbuLIYr4P/KrdIhc95D6kFQIALgcEbJB10gQ8cmmjgfYm8Q?=
 =?iso-8859-1?Q?IysfpJ08WYnOzmZ1ZXU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffbb3c91-80b4-43f6-5743-08ddef88f57c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 10:09:26.8772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bq7w+7OzcTpK5V2kWHaKb05Ta2mbJBCHHprkPuE8K+TmnSony7l+I+At3S9ges+JfdRD2QdDhmc3Zg2/aj34+r8b+tv3PjMZG6ShgE2vUBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR03MB10645

This change introduces resource management in the VGIC to handle
extended SPIs introduced in GICv3.1. The pending_irqs and
allocated_irqs arrays are resized to support the required
number of eSPIs, based on what is supported by the hardware and
requested by the guest. A new field, ext_shared_irqs, is added
to the VGIC structure to store information about eSPIs, similar
to how shared_irqs is used for regular SPIs.

Since the eSPI range starts at INTID 4096 and INTIDs between 1025
and 4095 are reserved, helper macros are introduced to simplify the
transformation of indices and to enable easier access to eSPI-specific
resources. These changes prepare the VGIC for processing eSPIs as
required by future functionality.

The initialization and deinitialization paths for vgic have been updated
to allocate and free these resources appropriately. Additionally,
updated handling of INTIDs greater than 1024, passed from the toolstack
during domain creation, and verification logic ensures only valid SPI or
eSPI INTIDs are used.

The existing SPI behavior remains unaffected when guests do not request
eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
option is disabled.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes in V8:
- minor: add variables in vgic_reserve_virq() and spi_to_pending() to
  avoid reading from objects that are possibly affected by order of
  evaluation (fixing 2 cautions of MC3A2.R13.2)
- added reviewed-by from Volodymyr Babchuk
- added acked-by from Julien Grall

Changes in V7:
- minor: changed hardcoded value of 32 to NR_LOCAL_IRQS
- minor: used local variable idx in spi_to_pending() and vgic_reserve_virq(=
)
- minor: added a comment for allocated_irqs and pending_irqs with index
  mappings
- added reviewed-by from Oleksandr Tyshchenko

Changes for V6:
- introduced a new function for index to virq conversion, idx_to_virq.
  This allows the removal of eSPI-specific functions and enables the
  reuse of existing code for regular SPIs
- fixed the return value of vgic_allocate_virq in the case of eSPI
- updated the error message in route_irq_to_guest(). To simplify it and
  avoid overcomplicating with INTID ranges, propose removing the
  information about the max number of IRQs
- fixed eSPI rank initialization to avoid using EXT_RANK_IDX2NUM for
  converting the eSPI rank to the extended range
- updated the recalculation logic to avoid the nr_spis > 1020 -
  NR_LOCAL_IRQS check when nr_spis is reassigned in the case of eSPI
- fixed formatting issues for macros
- minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
  into appropriate inline functions introduced in the previous patch
- minor change: changed int to unsigned int for nr_espis

Changes in V5:
- removed the has_espi field because it can be determined by checking
  whether domain->arch.vgic.nr_espis is zero or not
- since vgic_ext_rank_offset is not used in this patch, it has been
  moved to the appropriate patch in the patch series, which implements
  vgic eSPI registers emulation and requires this function
- removed ifdefs for eSPI-specific macros to reduce the number of ifdefs
  and code duplication in further changes
- fixed minor nit: used %pd for printing domain with its ID

Changes in V4:
- added has_espi field to simplify determining whether a domain is able
  to operate with eSPI
- fixed formatting issues and misspellings

Changes in V3:
- fixed formatting for lines with more than 80 symbols
- introduced helper functions to be able to use stubs in case of
  CONFIG_GICV3_ESPI disabled, and as a result, reduce the number of
  #ifdefs
- fixed checks for nr_spis in domain_vgic_init
- updated comment about nr_spis adjustments with dom0less mention
- moved comment with additional explanations before checks
- used unsigned int for indexes since they cannot be negative
- removed unnecessary parentheses
- move vgic_ext_rank_offset to the below ifdef guard, to reduce the
  number of ifdefs

Changes in V2:
- change is_espi_rank to is_valid_espi_rank to verify whether the array
  element ext_shared_irqs exists. The previous version, is_espi_rank,
  only checked if the rank index was less than the maximum possible eSPI
  rank index, but this could potentially result in accessing a
  non-existing array element. To address this, is_valid_espi_rank was
  introduced, which ensures that the required eSPI rank exists
- move gic_number_espis to
  xen/arm: gicv3: implement handling of GICv3.1 eSPI
- update vgic_is_valid_irq checks to allow operating with eSPIs
- remove redundant newline in vgic_allocate_virq
---
 xen/arch/arm/include/asm/vgic.h |  26 ++++-
 xen/arch/arm/irq.c              |   3 +-
 xen/arch/arm/vgic.c             | 190 ++++++++++++++++++++++++++++++--
 3 files changed, 203 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 3e7cbbb196..caffea092b 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -144,11 +144,25 @@ struct vgic_dist {
     spinlock_t lock;
     uint32_t ctlr;
     int nr_spis; /* Number of SPIs */
-    unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
+    /*
+     * Bitmap of allocated IRQs with the following index mapping:
+     * Local IRQs [0..31]
+     * Regular SPIs [32..nr_spis + 31]
+     * Optional, if supported:
+     * Extended SPIs [nr_spis + 32..nr_spis + nr_espis + 31]
+     */
+    unsigned long *allocated_irqs;
     struct vgic_irq_rank *shared_irqs;
+#ifdef CONFIG_GICV3_ESPI
+    struct vgic_irq_rank *ext_shared_irqs;
+    unsigned int nr_espis; /* Number of extended SPIs */
+#endif
     /*
      * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
-     * struct arch_vcpu.
+     * struct arch_vcpu. The index mapping is as follows:
+     * Regular SPIs [0..nr_spis - 1]
+     * Optional, if supported:
+     * eSPIs [nr_spis..nr_spis + nr_espis - 1]
      */
     struct pending_irq *pending_irqs;
     /* Base address for guest GIC */
@@ -243,6 +257,14 @@ struct vgic_ops {
 /* Number of ranks of interrupt registers for a domain */
 #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
=20
+#ifdef CONFIG_GICV3_ESPI
+#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis + 31) / 32)
+#endif
+#define EXT_RANK_MIN (ESPI_BASE_INTID / 32)
+#define EXT_RANK_MAX ((ESPI_MAX_INTID + 31) / 32)
+#define EXT_RANK_NUM2IDX(num) ((num) - EXT_RANK_MIN)
+#define EXT_RANK_IDX2NUM(idx) ((idx) + EXT_RANK_MIN)
+
 #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
 #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
=20
diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 80befc2913..c3d4d63d88 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -487,8 +487,7 @@ int route_irq_to_guest(struct domain *d, unsigned int v=
irq,
     if ( !vgic_is_valid_line(d, virq) )
     {
         printk(XENLOG_G_ERR
-               "the vIRQ number %u is too high for domain %u (max =3D %u)\=
n",
-               irq, d->domain_id, vgic_num_irqs(d));
+               "invalid vIRQ number %u for domain %pd\n", irq, d);
         return -EINVAL;
     }
=20
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 2bbf4d99aa..eb22de6aa6 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -25,11 +25,61 @@
 #include <asm/vgic.h>
=20
=20
+static inline unsigned int idx_to_virq(struct domain *d, unsigned int idx)
+{
+    if ( idx >=3D vgic_num_irqs(d) )
+        return espi_idx_to_intid(idx - vgic_num_irqs(d));
+
+    return idx;
+}
+
 bool vgic_is_valid_line(struct domain *d, unsigned int virq)
 {
+#ifdef CONFIG_GICV3_ESPI
+    if ( virq >=3D ESPI_BASE_INTID &&
+         virq < espi_idx_to_intid(d->arch.vgic.nr_espis) )
+        return true;
+#endif
+
     return virq < vgic_num_irqs(d);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * Since eSPI indexes start from 4096 and numbers from 1024 to
+ * 4095 are forbidden, we need to check both lower and upper
+ * limits for ranks.
+ */
+static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
+{
+    return rank >=3D EXT_RANK_MIN &&
+           EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d);
+}
+
+static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
+                                                       unsigned int rank)
+{
+    return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)];
+}
+
+#else
+static inline bool is_valid_espi_rank(struct domain *d, unsigned int rank)
+{
+    return false;
+}
+
+/*
+ * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn,
+ * because in this case, is_valid_espi_rank will always return false.
+ */
+static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
+                                                       unsigned int rank)
+{
+    ASSERT_UNREACHABLE();
+    return NULL;
+}
+#endif
+
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
                                                   unsigned int rank)
 {
@@ -37,6 +87,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct =
vcpu *v,
         return v->arch.vgic.private_irqs;
     else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
         return &v->domain->arch.vgic.shared_irqs[rank - 1];
+    else if ( is_valid_espi_rank(v->domain, rank) )
+        return vgic_get_espi_rank(v, rank);
     else
         return NULL;
 }
@@ -117,6 +169,54 @@ int domain_vgic_register(struct domain *d, unsigned in=
t *mmio_count)
     return 0;
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+static unsigned int vgic_num_spi_lines(struct domain *d)
+{
+    return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
+}
+
+static int init_vgic_espi(struct domain *d)
+{
+    unsigned int i, idx;
+
+    if ( d->arch.vgic.nr_espis =3D=3D 0 )
+        return 0;
+
+    d->arch.vgic.ext_shared_irqs =3D
+        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
+    if ( d->arch.vgic.ext_shared_irqs =3D=3D NULL )
+        return -ENOMEM;
+
+    for ( i =3D d->arch.vgic.nr_spis, idx =3D 0;
+          i < vgic_num_spi_lines(d); i++, idx++ )
+        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
+                              espi_idx_to_intid(idx));
+
+    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
+        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i],
+                       EXT_RANK_IDX2NUM(i), 0);
+
+    return 0;
+}
+
+#else
+static int init_vgic_espi(struct domain *d)
+{
+    return 0;
+}
+
+static unsigned int vgic_num_spi_lines(struct domain *d)
+{
+    return d->arch.vgic.nr_spis;
+}
+
+#endif
+
+static unsigned int vgic_num_alloc_irqs(struct domain *d)
+{
+    return vgic_num_spi_lines(d) + NR_LOCAL_IRQS;
+}
+
 int domain_vgic_init(struct domain *d, unsigned int nr_spis)
 {
     int i;
@@ -133,7 +233,39 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
=20
     /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988  =
*/
     if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
+#ifndef CONFIG_GICV3_ESPI
         return -EINVAL;
+#else
+    {
+        /*
+         * During domain creation, the dom0less DomUs code or toolstack
+         * specifies the maximum INTID, which is defined in the domain
+         * config subtracted by 32 to cover the local IRQs (please see
+         * the comment to VGIC_DEF_NR_SPIS). To compute the actual number
+         * of eSPI that will be usable for, add back 32 (NR_LOCAL_IRQS).
+         */
+        nr_spis +=3D NR_LOCAL_IRQS;
+        if ( nr_spis > espi_idx_to_intid(NR_ESPI_IRQS) )
+            return -EINVAL;
+
+        if ( nr_spis >=3D ESPI_BASE_INTID )
+        {
+            unsigned int nr_espis =3D min(nr_spis - ESPI_BASE_INTID, 1024U=
);
+
+            /* Verify if GIC HW can handle provided INTID */
+            if ( nr_espis > gic_number_espis() )
+                return -EINVAL;
+
+            d->arch.vgic.nr_espis =3D nr_espis;
+            /* Set the maximum available number for regular SPIs */
+            nr_spis =3D VGIC_DEF_NR_SPIS;
+        }
+        else
+        {
+            return -EINVAL;
+        }
+    }
+#endif
=20
     d->arch.vgic.nr_spis =3D nr_spis;
=20
@@ -145,7 +277,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_=
spis)
         return -ENOMEM;
=20
     d->arch.vgic.pending_irqs =3D
-        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
+        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
     if ( d->arch.vgic.pending_irqs =3D=3D NULL )
         return -ENOMEM;
=20
@@ -156,12 +288,16 @@ int domain_vgic_init(struct domain *d, unsigned int n=
r_spis)
     for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
         vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
=20
+    ret =3D init_vgic_espi(d);
+    if ( ret )
+        return ret;
+
     ret =3D d->arch.vgic.handler->domain_init(d);
     if ( ret )
         return ret;
=20
     d->arch.vgic.allocated_irqs =3D
-        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
+        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_alloc_irqs(d))=
);
     if ( !d->arch.vgic.allocated_irqs )
         return -ENOMEM;
=20
@@ -182,9 +318,12 @@ void domain_vgic_free(struct domain *d)
     int i;
     int ret;
=20
-    for ( i =3D 0; i < (d->arch.vgic.nr_spis); i++ )
+    for ( i =3D NR_LOCAL_IRQS; i < vgic_num_alloc_irqs(d); i++ )
     {
-        struct pending_irq *p =3D spi_to_pending(d, i + 32);
+        struct pending_irq *p;
+        unsigned int virq =3D idx_to_virq(d, i);
+
+        p =3D spi_to_pending(d, virq);
=20
         if ( p->desc )
         {
@@ -198,6 +337,9 @@ void domain_vgic_free(struct domain *d)
     if ( d->arch.vgic.handler )
         d->arch.vgic.handler->domain_free(d);
     xfree(d->arch.vgic.shared_irqs);
+#ifdef CONFIG_GICV3_ESPI
+    xfree(d->arch.vgic.ext_shared_irqs);
+#endif
     xfree(d->arch.vgic.pending_irqs);
     xfree(d->arch.vgic.allocated_irqs);
 }
@@ -323,10 +465,12 @@ void arch_move_irqs(struct vcpu *v)
      */
     ASSERT(!is_lpi(vgic_num_irqs(d) - 1));
=20
-    for ( i =3D 32; i < vgic_num_irqs(d); i++ )
+    for ( i =3D NR_LOCAL_IRQS; i < vgic_num_alloc_irqs(d); i++ )
     {
-        v_target =3D vgic_get_target_vcpu(v, i);
-        p =3D irq_to_pending(v_target, i);
+        unsigned int virq =3D idx_to_virq(d, i);
+
+        v_target =3D vgic_get_target_vcpu(v, virq);
+        p =3D irq_to_pending(v_target, virq);
=20
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
             irq_set_affinity(p->desc, cpu_mask);
@@ -539,15 +683,28 @@ struct pending_irq *irq_to_pending(struct vcpu *v, un=
signed int irq)
     else if ( is_lpi(irq) )
         n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, irq)=
;
     else
-        n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
+        n =3D spi_to_pending(v->domain, irq);
     return n;
 }
=20
 struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
 {
+    unsigned int idx;
+
     ASSERT(irq >=3D NR_LOCAL_IRQS);
=20
-    return &d->arch.vgic.pending_irqs[irq - 32];
+    if ( is_espi(irq) )
+    {
+        unsigned int nr_spis =3D d->arch.vgic.nr_spis;
+
+        idx =3D espi_intid_to_idx(irq) + nr_spis;
+    }
+    else
+    {
+        idx =3D irq - NR_LOCAL_IRQS;
+    }
+
+    return &d->arch.vgic.pending_irqs[idx];
 }
=20
 void vgic_clear_pending_irqs(struct vcpu *v)
@@ -665,10 +822,19 @@ bool vgic_emulate(struct cpu_user_regs *regs, union h=
sr hsr)
=20
 bool vgic_reserve_virq(struct domain *d, unsigned int virq)
 {
+    unsigned int idx =3D virq;
+
     if ( !vgic_is_valid_line(d, virq) )
         return false;
=20
-    return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
+    if ( is_espi(virq) )
+    {
+        unsigned int num_regular_irqs =3D vgic_num_irqs(d);
+
+        idx =3D espi_intid_to_idx(virq) + num_regular_irqs;
+    }
+
+    return !test_and_set_bit(idx, d->arch.vgic.allocated_irqs);
 }
=20
 int vgic_allocate_virq(struct domain *d, bool spi)
@@ -685,7 +851,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
     else
     {
         first =3D 32;
-        end =3D vgic_num_irqs(d);
+        end =3D vgic_num_alloc_irqs(d);
     }
=20
     /*
@@ -700,7 +866,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
     }
     while ( test_and_set_bit(virq, d->arch.vgic.allocated_irqs) );
=20
-    return virq;
+    return idx_to_virq(d, virq);
 }
=20
 void vgic_free_virq(struct domain *d, unsigned int virq)
--=20
2.34.1

