Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838BB38980
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 20:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096733.1451400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKot-0000yA-TQ; Wed, 27 Aug 2025 18:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096733.1451400; Wed, 27 Aug 2025 18:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urKot-0000ul-LQ; Wed, 27 Aug 2025 18:24:27 +0000
Received: by outflank-mailman (input) for mailman id 1096733;
 Wed, 27 Aug 2025 18:24:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+iP=3H=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1urKor-0006ki-AF
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 18:24:25 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d63a65a-8373-11f0-ae26-e363de0e7a9e;
 Wed, 27 Aug 2025 20:24:21 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by MRWPR03MB11023.eurprd03.prod.outlook.com (2603:10a6:501:76::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Wed, 27 Aug
 2025 18:24:20 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 18:24:19 +0000
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
X-Inumbo-ID: 0d63a65a-8373-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3mDpdBaV9713AyQXLHKmPRuDZ7raRoU8CQqQnVwhNbilNJWU7X9cVQpm92fZG20Q0xjNMILghNcQWW9MnM/9nr1K2I4bW28qjiL8WhyctDBWWlZkLigUpu5iCe5aRZ3b+Tg5oZKZL7KWcLHgQI0AGAp+Mz/Q3F4nMZ9vc2avWojgd7mTz3mNuc/Q90eS5UdWEk0ReGZ/H+QbPQqnwYjDGWVfr/03SE5bwwF2qSl06olfr1nDZjZ2bJGF1hPCb7Yxlw6xCYG14dTdu5u6It6vMMjMQpgbCL4fc7J+rzuqh8hLagpF9/13PO5R+/axTeZNC7gZn3YPHiKeTvgkn6wcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F6L4FXvFQbNB8ZhT4YotPvnWrT6H2MRs1xEiJVaPXYI=;
 b=HmIbLjDpSZBVEE4PPVtOW4L8Ar+8/Xtdea3p45R6mfcx2EHvTxkO7t0kWHcqmwaAYG/E1Gopb7rNmgkx4yishvB7eW27liC16BzMGqWIO6PCOIJyMxZxO/J9VY70kVhbsX7oHYD0kTcBT14JgE/JAwhxS7mP1/ZhHlaupyvfY5+2lXcibj4pZjvYBf5ZCB+uRhCnEsULgIi5Yj7H6EVygxEpirN09HxIX8z2wLKqFg3LNFWDrL5yElRk0I9DXRExevDxhgxXWRLAf3+CkRsoyYSYhOGkIZ8YqD1/wqAsAU/bDnPed6HL7qOrobJPeBS8M/vxUGsYzpFig7vqG1yf7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F6L4FXvFQbNB8ZhT4YotPvnWrT6H2MRs1xEiJVaPXYI=;
 b=ebXhZuQKIJNZpyxof0jisw9TfpHuycZCrQpmGNJA7X35tD20xgMj36nKctvdxaJ8iJc0Xt1S5OzloWaCf8d/eIhPUVP36gEuQO5bPBW4REzxXVAju5jo64LPXTcX2MBweS+JaLCzSXHiFZtq2RY3LmvVNwNVitRT/g8PBVz7le+FUaE5ApCeFp3pArSVIKtpMx8r3KurPnshvhMmuZsYsJov99pIGDojqV5g7h8E4hmQowu1Tfxfm0PVRUtMTTrqHJPaLKwstc8UQ+MCKxUhwIFj62VBb4iCaWiRYEolXeyv4ynh21v8p62wdazbkQQqoUdxhkWNoGt+JWwRQ2Zgeg==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 08/12] xen/arm: vgic: add resource management for extended
 SPIs
Thread-Topic: [PATCH v4 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcF3/NodAFMh424U2CquWmKsv0JA==
Date: Wed, 27 Aug 2025 18:24:19 +0000
Message-ID:
 <9e8a11b024833c1b91b8806e7708bf35b04a8f6e.1756317702.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: e378047f-1755-4721-71b8-08dde596f078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?d2N6JBLl/4/N9ZhOxtW7e7QEodM0RdFo96W5KUjETxAR5rgvaA2cD8n70Y?=
 =?iso-8859-1?Q?xPXNjHt4VTpnKIoWRyqecZBeZtpQvRrz18LWZv23gDD35CbA2sk6rLJRig?=
 =?iso-8859-1?Q?S9Cr7Gh3iRjzzlOWbF3P9g3LuOuAmbjbNsXdBFLXew1rt605U3YM7havgH?=
 =?iso-8859-1?Q?A7NWUEnworTD3KnSfXiyRNvE3NH7fUvNPYapzgjP+0hXtPHvchG75TZhGy?=
 =?iso-8859-1?Q?/BmWFbH6q6Si4OxFHWCTIG/kuaoaQm2ziVKSrUA/tWsq5Ds+2Iztfjjd9H?=
 =?iso-8859-1?Q?NamyJu6l+KQ3De8DqnwUJ9ojCeRzFBo6vZGFLZUw1sTspVvjhcmcQEBElL?=
 =?iso-8859-1?Q?1wqQPLdc3fzosnkvxATTDFZbP5NXjTX52aXI6nAzErwDczbJwzN0+kOG/S?=
 =?iso-8859-1?Q?JaBAdIyWqqml1b6IUAKNTv9Gp9EY3iXFGe6YaHSKNu1TqH9YejM0z59oWY?=
 =?iso-8859-1?Q?7B7hTmuOBmlZRO5v+OYgINPv97KjW6/omXR9jzjcL0svhJaCeFUPMDNeec?=
 =?iso-8859-1?Q?tfmVooJlEpi5mpVlCiGJ0gKf37fcWDVeTV+BlIuGOXr9qlOstbkISTFoUJ?=
 =?iso-8859-1?Q?1Ej/cgWW7Wl/x4bEXKXekbG0V1/l8agQfrRE0O3iLNwvraahDcmedDurJP?=
 =?iso-8859-1?Q?r8Dy+Tb8Y5S5tyQ1uBHrMfj1rLhexiVMsK0WteU8W3BaN1xqn5Mls0o/6w?=
 =?iso-8859-1?Q?1iOChPoMCiHKRGRTjCz/qDZ5ebPP/gunMVJvVqofJuOWLLlVrrn8lhxykI?=
 =?iso-8859-1?Q?vggjD8fY4xQq+rC/BXjNLdxP/sNkoL6C0aSQQIA9tl2lZZr93bMFq4eTj3?=
 =?iso-8859-1?Q?Wkbs6RYPE/wuYXw3nW+BZqZJqOu+Uck9x2WR/qZwciWWHVvzxTvjm9vfYU?=
 =?iso-8859-1?Q?g7AojVx8UaQy5h+KcNCQ0uVN3ObJsiRvhLMRMl20Ovsj9QyQ0HHKPpnHBF?=
 =?iso-8859-1?Q?IgBy7NLQ8BD+yp3PYxdcnOSTAfCjbXy0zfCkVJnq5hqVSBDiy8YVUBJ6uF?=
 =?iso-8859-1?Q?7T1i4DEvvhRPKc+gxf0VMBC1NqhKSJZBs7guyeQJQN0r1TGQF8mZ1BoNBJ?=
 =?iso-8859-1?Q?7+8IZbTDfqjUT1JVI4Vy09ZvCRcLQTBDZ7VSaQ32VSMMZnNQfeFNnAx1jW?=
 =?iso-8859-1?Q?r4j5Pn2ZLLO+VH9z67RzeDuLcykFMp7X1REak8T4rrDPiPnocZL9ZMFAMc?=
 =?iso-8859-1?Q?DCaXsfnItsW5tUguC20q5oSqs0RMzNtXNutoKFGfh5AnMHWPjC/pG6aRl2?=
 =?iso-8859-1?Q?UKJ1ZZYqQRaPHMg6FUHQqvgdzMhv8XtjxfNWlDYYY4MO0QpUGHfniceA3Y?=
 =?iso-8859-1?Q?A1IulavZBDcHphGoaTykf2khlBxc+zIyKE9ZKwVVe+zZr05+PMELV1MTvV?=
 =?iso-8859-1?Q?S3dpu5yMq0GlikJCLO391wFnHyUQcx0DBNBxmcR/R0DIyh10bdb3Glv79B?=
 =?iso-8859-1?Q?rQSG2J+K2bpSnsRqJWoGbuL6UzGgfvp+UgYGBA/SHS2GYWkjQwM625cABz?=
 =?iso-8859-1?Q?ZvL58WvHgcXZcXHKIMmdM5Gl6ozByeIL4OkC0UNdAFIw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?dwENzEJFF0cgNtN92m1QeeW8SJWHO8dSVMqbr+kI5RZYiC+6g2MvMUkj9x?=
 =?iso-8859-1?Q?CJc62U8yqXfH4XDlgq0Cbg9WvA0XuKuxnSMuzx+ylxgQToRdUhtQy7t0lm?=
 =?iso-8859-1?Q?jmoc2oVhvHn1uA6kxKFrWpkSaGwmHK6s1tFPBX6oiK5zOBsWXySUkYVJy6?=
 =?iso-8859-1?Q?+7vCKzWeYX1cC65eSr4B4Eh93oBNlOxp0NMubgLFM5ol84hkuNy1FZvKuN?=
 =?iso-8859-1?Q?3sFo3E9iAQ+QkIzHMRdgLwSzps+fvqGfxY4kyEX1CnBdm0+oXgs6+Dx87f?=
 =?iso-8859-1?Q?PKeDPlrorSwcJ7FOaoMQp9Csv/4UNYBSddczGvniK/EYuHSKvSb6J7uKwA?=
 =?iso-8859-1?Q?Y37VlqVZic05jLNpsQ5UP/Fs8SuOggz875cPuqVcEC47+GEJi+sDrRH5ow?=
 =?iso-8859-1?Q?/wn1RHsX/EAcHSrde/R2w4dnsrcScmzMM4GlTxBaonmosaw3ieWHetBGnB?=
 =?iso-8859-1?Q?gzAUxAlkI7kEZIO+C22ift3A/Kc1qHcZRNAAGLu6QBtG9Y5chKrVRVL0n6?=
 =?iso-8859-1?Q?ZQHWplzfMfkfNDt+/eSqA1BJhdfzL+OXagVmZhGFCFGQaR7vDlFQ9ovAKF?=
 =?iso-8859-1?Q?UVpFtt+oPwPR3W0dRR49wPuuIJ06X9dV/ehU+1F1QoufR7GsdhEaFe7Zkr?=
 =?iso-8859-1?Q?7zjtGR5AVYpUt66pIzmAAZIdNIgoaZYJJ6Jk5PbeeI0yWa2FxcNC01V/vP?=
 =?iso-8859-1?Q?sPk7c46IaWYXrJAl5XddAGvEeKG/kdN8xxNFsMpN/0wDlR79YvHL96gzoV?=
 =?iso-8859-1?Q?vT5cCZWyC3ydq0Mw6DtJyGngai1gVT5tXfBumdc6agYVgyt/BCC1I/D+bb?=
 =?iso-8859-1?Q?Do3r/3y9bYs3RMi1sGHmkY0kCE3rBXhZcwO597fdaNQKbIJxPH+61uBA79?=
 =?iso-8859-1?Q?WwcGFA6Obd8ck0eQqe9aGm95Y6AQpihwuu7WkCLHi//jV0Qzek4OlqRgMa?=
 =?iso-8859-1?Q?+HFNjIM58ojy6X3AP5Wo9q6DD4JViUteih6A53rQc8VFDLZBIP0bpoZ+qG?=
 =?iso-8859-1?Q?lnhLG1t5MD2td7wslB39EE7unY+Le2aaRwh+6q9EOKfIWuN0RBnzleOQ3A?=
 =?iso-8859-1?Q?NzYC1KUIkIcb4E8PdhEqEN78mK9kt5/p4U9YciN7KTaji8pGtcgeUkt4Am?=
 =?iso-8859-1?Q?AC6E2sVSUSgnchgHyaOPhOp1fH/kmGd9YI4D6gvYM1VtW8+1JhYKatplUC?=
 =?iso-8859-1?Q?F+/t5TqmfAtHB4IwRH4Mt9Ih8tZuGDBWOppuuqvJKebR7GhqauOjBrPRol?=
 =?iso-8859-1?Q?RUmMLtCPq+exFkxHf/Oq9yYbOMGYuSxOv4vOsU040fgqyK3PV79AzIfdjA?=
 =?iso-8859-1?Q?ZS2e/FlUwzFGWRdZqnI4VvxVVeAdNl25yInM8uwyRRVW9ezL4r+EWqNXfo?=
 =?iso-8859-1?Q?GNt+ZFzwNZUYJQrzmsLMMZ2bTqQ3PpeW3mJijjZfOHviPcMIkIjl8vR6O+?=
 =?iso-8859-1?Q?vGyfN5eYXdDQVbfjLIsWpNet866fmC90ilu3xM6sx5v8p95oRuksuLuvFg?=
 =?iso-8859-1?Q?eYbODjHQUSrSbsemdQv5arFWc/ZjT1mVDfhOHPXbhvLXx9R3xpa0NLO0Yz?=
 =?iso-8859-1?Q?kxVZMm1q4VemAIM+TLhm/9MhwLqRLdhyEf2MkVJzl+GtdRbUN+VjEUp93C?=
 =?iso-8859-1?Q?EJ/FATL6csp/XERVzMxcTLkk22pBRWLlKvNy3ezMPLSiiZdWb/eLbni2cU?=
 =?iso-8859-1?Q?Zoqc5ulEd44HG602rIk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e378047f-1755-4721-71b8-08dde596f078
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 18:24:19.8572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: umwuZCqRqeMgAL9AjXzEmFcvskxIjVB9DwIMBYMYNwvLeowBW6QEyV8CVQ18uPgDbA2weIpX5mSGZRpJ58NUOmqaUyyAMJLy7Z/8J9muWp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR03MB11023

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

---
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
 xen/arch/arm/include/asm/vgic.h |  20 +++
 xen/arch/arm/vgic.c             | 213 +++++++++++++++++++++++++++++++-
 2 files changed, 230 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 3e7cbbb196..fb4cea73eb 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -146,6 +146,12 @@ struct vgic_dist {
     int nr_spis; /* Number of SPIs */
     unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
     struct vgic_irq_rank *shared_irqs;
+#ifdef CONFIG_GICV3_ESPI
+    struct vgic_irq_rank *ext_shared_irqs;
+    int nr_espis; /* Number of extended SPIs */
+    /* To simplify determining whether a domain is able to operate with eS=
PI */
+    bool has_espi;
+#endif
     /*
      * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
      * struct arch_vcpu.
@@ -243,6 +249,14 @@ struct vgic_ops {
 /* Number of ranks of interrupt registers for a domain */
 #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
=20
+#ifdef CONFIG_GICV3_ESPI
+#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis+31)/32)
+#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
+#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
+#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
+#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)
+#endif
+
 #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
 #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
=20
@@ -302,6 +316,12 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct v=
cpu *v,
                                               unsigned int b,
                                               unsigned int n,
                                               unsigned int s);
+#ifdef CONFIG_GICV3_ESPI
+extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
+                                                  unsigned int b,
+                                                  unsigned int n,
+                                                  unsigned int s);
+#endif
 extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int ir=
q);
 extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
 extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index 2bbf4d99aa..f4b80cb05f 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -27,9 +27,82 @@
=20
 bool vgic_is_valid_line(struct domain *d, unsigned int virq)
 {
+#ifdef CONFIG_GICV3_ESPI
+    if ( virq >=3D ESPI_BASE_INTID &&
+         virq < ESPI_IDX2INTID(d->arch.vgic.nr_espis) )
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
+static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int v=
irq)
+{
+    return !test_and_set_bit(ESPI_INTID2IDX(virq) + vgic_num_irqs(d),
+                             d->arch.vgic.allocated_irqs);
+}
+
+static void arch_move_espis(struct vcpu *v)
+{
+    const cpumask_t *cpu_mask =3D cpumask_of(v->processor);
+    struct domain *d =3D v->domain;
+    struct pending_irq *p;
+    struct vcpu *v_target;
+    unsigned int i;
+
+    for ( i =3D ESPI_BASE_INTID;
+          i < EXT_RANK_IDX2NUM(d->arch.vgic.nr_espis); i++ )
+    {
+        v_target =3D vgic_get_target_vcpu(v, i);
+        p =3D irq_to_pending(v_target, i);
+
+        if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
+            irq_set_affinity(p->desc, cpu_mask);
+    }
+}
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
+
+static inline bool vgic_reserve_espi_virq(struct domain *d, unsigned int v=
irq)
+{
+    return false;
+}
+
+static void arch_move_espis(struct vcpu *v) { }
+#endif
+
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
                                                   unsigned int rank)
 {
@@ -37,6 +110,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct=
 vcpu *v,
         return v->arch.vgic.private_irqs;
     else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
         return &v->domain->arch.vgic.shared_irqs[rank - 1];
+    else if ( is_valid_espi_rank(v->domain, rank) )
+        return vgic_get_espi_rank(v, rank);
     else
         return NULL;
 }
@@ -117,6 +192,74 @@ int domain_vgic_register(struct domain *d, unsigned in=
t *mmio_count)
     return 0;
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * The function behavior is the same as for regular SPIs (vgic_rank_offset=
),
+ * but it operates with extended SPI ranks.
+ */
+struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
+                                           unsigned int n, unsigned int s)
+{
+    unsigned int rank =3D REG_RANK_NR(b, (n >> s));
+
+    return vgic_get_rank(v, rank + EXT_RANK_MIN);
+}
+
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
+                              ESPI_IDX2INTID(idx));
+
+    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
+        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);
+
+    return 0;
+}
+
+struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
+{
+    irq =3D ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
+    return &d->arch.vgic.pending_irqs[irq];
+}
+#else
+static unsigned int init_vgic_espi(struct domain *d)
+{
+    return 0;
+}
+
+static unsigned int vgic_num_spi_lines(struct domain *d)
+{
+    return d->arch.vgic.nr_spis;
+}
+
+struct pending_irq *espi_to_pending(struct domain *d, unsigned int irq)
+{
+    return NULL;
+}
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
@@ -131,6 +274,38 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
      */
     nr_spis =3D ROUNDUP(nr_spis, 32);
=20
+#ifdef CONFIG_GICV3_ESPI
+    /*
+     * During domain creation, the dom0less DomUs code or toolstack specif=
ies
+     * the maximum INTID, which is defined in the domain config subtracted=
 by
+     * 32 to cover the local IRQs (please see the comment to VGIC_DEF_NR_S=
PIS).
+     * To compute the actual number of eSPI that will be usable for,
+     * add back 32.
+     */
+    if ( nr_spis + 32 > ESPI_IDX2INTID(NR_ESPI_IRQS) )
+        return -EINVAL;
+
+    if ( nr_spis + 32 >=3D ESPI_BASE_INTID )
+    {
+        d->arch.vgic.nr_espis =3D min(nr_spis - ESPI_BASE_INTID + 32, 1024=
U);
+        /* Verify if GIC HW can handle provided INTID */
+        if ( d->arch.vgic.nr_espis > gic_number_espis() )
+            return -EINVAL;
+        /*
+         * Set the maximum available number for regular
+         * SPI to pass the next check
+         */
+        nr_spis =3D VGIC_DEF_NR_SPIS;
+        d->arch.vgic.has_espi =3D true;
+    }
+    else
+    {
+        /* Domain will use the regular SPI range */
+        d->arch.vgic.nr_espis =3D 0;
+        d->arch.vgic.has_espi =3D false;
+    }
+#endif
+
     /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988  =
*/
     if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
         return -EINVAL;
@@ -145,7 +320,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_=
spis)
         return -ENOMEM;
=20
     d->arch.vgic.pending_irqs =3D
-        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
+        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
     if ( d->arch.vgic.pending_irqs =3D=3D NULL )
         return -ENOMEM;
=20
@@ -156,12 +331,16 @@ int domain_vgic_init(struct domain *d, unsigned int n=
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
@@ -195,9 +374,27 @@ void domain_vgic_free(struct domain *d)
         }
     }
=20
+#ifdef CONFIG_GICV3_ESPI
+    for ( i =3D 0; i < d->arch.vgic.nr_espis; i++ )
+    {
+        struct pending_irq *p =3D spi_to_pending(d, ESPI_IDX2INTID(i));
+
+        if ( p->desc )
+        {
+            ret =3D release_guest_irq(d, p->irq);
+            if ( ret )
+                dprintk(XENLOG_G_WARNING, "d%u: Failed to release virq %u =
ret =3D %d\n",
+                        d->domain_id, p->irq, ret);
+        }
+    }
+#endif
+
     if ( d->arch.vgic.handler )
         d->arch.vgic.handler->domain_free(d);
     xfree(d->arch.vgic.shared_irqs);
+#ifdef CONFIG_GICV3_ESPI
+    xfree(d->arch.vgic.ext_shared_irqs);
+#endif
     xfree(d->arch.vgic.pending_irqs);
     xfree(d->arch.vgic.allocated_irqs);
 }
@@ -331,6 +528,8 @@ void arch_move_irqs(struct vcpu *v)
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
             irq_set_affinity(p->desc, cpu_mask);
     }
+
+    arch_move_espis(v);
 }
=20
 void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
@@ -538,6 +737,8 @@ struct pending_irq *irq_to_pending(struct vcpu *v, unsi=
gned int irq)
         n =3D &v->arch.vgic.pending_irqs[irq];
     else if ( is_lpi(irq) )
         n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, irq)=
;
+    else if ( is_espi(irq) )
+        n =3D espi_to_pending(v->domain, irq);
     else
         n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
     return n;
@@ -547,6 +748,9 @@ struct pending_irq *spi_to_pending(struct domain *d, un=
signed int irq)
 {
     ASSERT(irq >=3D NR_LOCAL_IRQS);
=20
+    if ( is_espi(irq) )
+        return espi_to_pending(d, irq);
+
     return &d->arch.vgic.pending_irqs[irq - 32];
 }
=20
@@ -668,6 +872,9 @@ bool vgic_reserve_virq(struct domain *d, unsigned int v=
irq)
     if ( !vgic_is_valid_line(d, virq) )
         return false;
=20
+    if ( is_espi(virq) )
+        return vgic_reserve_espi_virq(d, virq);
+
     return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
 }
=20
@@ -685,7 +892,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
     else
     {
         first =3D 32;
-        end =3D vgic_num_irqs(d);
+        end =3D vgic_num_alloc_irqs(d);
     }
=20
     /*
--=20
2.34.1

