Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74141B3004E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:43:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089084.1446774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up8O0-0007rf-Ox; Thu, 21 Aug 2025 16:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089084.1446774; Thu, 21 Aug 2025 16:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up8O0-0007p2-Lq; Thu, 21 Aug 2025 16:43:36 +0000
Received: by outflank-mailman (input) for mailman id 1089084;
 Thu, 21 Aug 2025 16:43:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kfR=3B=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1up8Ny-0007ow-DP
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:43:34 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6dd5761-7ead-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 18:43:28 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB4PR03MB9482.eurprd03.prod.outlook.com
 (2603:10a6:10:3f6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 16:43:25 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 16:43:25 +0000
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
X-Inumbo-ID: f6dd5761-7ead-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gscr16RKOWdaw+R7KqRd7SlkU6c4RhCdfu6KJnrZkSSuB0zr4jQTvnRenELO59+V+xdChJIPpZwED4IKcnL+WxhAznb0AW61NfTdSkaZgWBjQKLxi8p9AN+EOqfERT7KpULm0DD9SYM0rfw+xjA0bhFtKoMYjFDdUS3gZI6CNks2HdMjHB6S+6pjb4yqUyq79SFHO9YB5W54omV8Ssw4/qpRJVo9uqgJ3AcHSZxZCcRsAe4Bm47hKrOmS0LTv1yBxxWM5fnlFx5/AOFNGx7JPpJ/FtZo4NAzjGVQdS+mp7skxDuA4GMPKmfjspw/pLGb5kvjP5s5B327+S88WxBmqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IngtRkxpUzuFacG1UFAZOM9ie72jpivLBmjUl1mXvEg=;
 b=pSzVo7JaEoBGuzbZox2IVL2bbI2gZL547mpnHNgVisMUEhLEjRSB+yJkTkdI+iH5kbSgl/DOrtgt98z3ZWoNT2YaKEpZZJQS41A3eKbH7xr5uPhltJZGhSbLB7c0gA21y7ftt3Kl40kP4f86iFfBjKgyTKHCvBM9aYrYuWPVQBIVQtPtU8rBkNccOq3im0+gTT4P1JeAK3n3ESEy/gZfW/xGEv62W5IjikmybAOSi/2R/uC354b678vJTpZhdUieH5Nqog01J26jPtGfTwaMTc23s1PGd3dzoKAh62KAXeNc2V30zj75ukv5CX+Hp5GShCeHCpYNT27I/dWWGgrRXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IngtRkxpUzuFacG1UFAZOM9ie72jpivLBmjUl1mXvEg=;
 b=MBNkSps42ug30cQWNajvVHc3qupD0CFl7McVF+ctSlPGzFZq43XRWqEaoQCwLO9KJu9Kd/h1JQJKvrH7Z0YZRM/fHmyxCF3l0M/HVa3OkRe1YNNIM7Rzjzi6JS45nrBhmMwM5v+dIObxjEOdA2aSki497tNe17SYuur6do114RcNzXlxraJ15zFiJP5LAvHfjZfIuvKlKltSnaJI+AlPrNSY2BTiPL0hKUf3+sEDwRMslWZ5h9WQoNqguDfEpYz4diAk5BNXHB8ZBVTgZ+w6NxN6udGsrizIEgB5QZ4YCph+0jt/OeEpkM1DbXBxb8QeIyh1IZ89fCQoCww311Iggg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 08/10] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Topic: [PATCH v2 08/10] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcB5d/ZFUghU0g3UyhcWfovVArTw==
Date: Thu, 21 Aug 2025 16:43:25 +0000
Message-ID: <87tt20d3rn.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<fde65754a60a8cc090bb212749ec2c10877c4943.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <fde65754a60a8cc090bb212749ec2c10877c4943.1754568795.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Thu, 7 Aug 2025 12:33:33 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB4PR03MB9482:EE_
x-ms-office365-filtering-correlation-id: e90cc2cf-586a-4bcf-2aae-08dde0d1d950
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EjVK3dJv8lUYDCAKlVA6GYe7mCLfkGcDh5AP+0FGSN/+NL+feQdbcDx7l7?=
 =?iso-8859-1?Q?VTKp0M0kRgGOyF0csmNHmocl6ey+L6hc3UiuRWdLsfuFNKWSSb8qawufFQ?=
 =?iso-8859-1?Q?aCnc6YnBr9rAqHqHoJZW3iNaWMi0+zTD3vtPQPDMuyU/tK9ATKQ1hJRQrz?=
 =?iso-8859-1?Q?1EALJTRe0h46rLBuyuzwqn6+D4DFNUyPMybiDCkVJ5IKaTnp7M4gEBtW8h?=
 =?iso-8859-1?Q?sQbKQw1eYRjauxLN4WoZLCroZmSyxAufVA9H8L1G/ZmFmQWdsPG4a0hR3x?=
 =?iso-8859-1?Q?duogxx0Lmk3eCdEgc2+Zx1g53Us/cVBTHJ+qNSFBOYYHLTm/mPwnlHRb+J?=
 =?iso-8859-1?Q?aeenTZQBpXHKFQGYdTNkpbHbVysrwI+32EAu6v3wlcriGV56Y6ciNGkyDb?=
 =?iso-8859-1?Q?xY1vaEAsVv3mEq0uADgJQx/ciPMqrQSa1XOlWqjxNrsSF6zxl5InMH5u5J?=
 =?iso-8859-1?Q?Np6fKXC4iCpHN/rB/n02g70mJdzYWPZbQWZGpVQNrSTrL2+t+EUl3mXvVE?=
 =?iso-8859-1?Q?sCHTfV6t1tsI2SqcBI+F48a1urt3VJrSY6d5SzoXhkXfPdkHDX5HQweOvE?=
 =?iso-8859-1?Q?FknpuFQGZyT9vPd1UdtpZUYkGwPsjsgkNUG3G8Udl7z23+tOPXKhF4zLfC?=
 =?iso-8859-1?Q?U1mzS/Utv84ui15jCp8m7VYcXce+uTavhTOhGuqFOT67ePISLJzkzfU8I4?=
 =?iso-8859-1?Q?OTcKkTOvQrXsco54N3LgnLewkMniIo6sG26aZyPcVHIkZlKaiGygN30w9V?=
 =?iso-8859-1?Q?/SdC/RJ+EFAqvCEBCkS2mMes7l8ic48QB31OgiOdQXxhiKOGZYY/40D+dt?=
 =?iso-8859-1?Q?gANLMHedavA7tPv7lkH8jGI5Sf1QNXPiKxnOzsLuZd7jAPh/T/H2fp58P4?=
 =?iso-8859-1?Q?Cz/IrkxXYDufnniTq9PctRiWTNDmbaUN5oXb7YSdjAris7Z8AR+sltxQhP?=
 =?iso-8859-1?Q?yxLc/WB//ugnomc3gWeEajuTPCDFH34O9w6Z89xAlfSJCUfuggVlXv7RU5?=
 =?iso-8859-1?Q?0/z1dlzFMIBrO+yDbH5Rd9HLbr6fGzihIFEUBbTfFFnQBbQwfMaX31c1QY?=
 =?iso-8859-1?Q?r7yI96HGxvtzLrp1gyxH1Veq47dishLse3BkaNaXvLqdSAOIG4qiZhqocj?=
 =?iso-8859-1?Q?cuKnMUmOYpzXTPAczTn0NzuyrHryBvZtvuv+MbBY8E2JcQniM4TWad1ph6?=
 =?iso-8859-1?Q?IbK87U/ErxqzqTFzmsV4YCT2t9ZCHiNjWAJO9hjotrRIyxwJPbk8sPEjWa?=
 =?iso-8859-1?Q?S0Sg9xVdJP6M9b0zmU+7z5uzUigH4B3qdVWBa6p4KVDvjIJCowNaUJ1oDx?=
 =?iso-8859-1?Q?mNJHFtvqbIbzQHBfz6bdHGtFKVoqL20hBc5LjgYjEvUYc7IZz5b9UqWEPm?=
 =?iso-8859-1?Q?19iqN10izNt1rPPagbYD6Z/9b3EUpcE1+1SwVroCP4GOaxPcgPJ4O3OhA6?=
 =?iso-8859-1?Q?LXRWZDx/Ij3tGtFjOFtOEBEDAe1jiWgIIQqIatF4hDqwh896EQ6hgq3x5t?=
 =?iso-8859-1?Q?0vxkaYKAi7uPClQsYJrQofpZQABMu+gZ8fd/T1ESFnxw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?5c7lVq/lg9xz8wMSLT2YK+hYsnUXULsyjdtKV5RzDRezZC3ZWza/6wQWtX?=
 =?iso-8859-1?Q?7bq3nYfMMEJVu/SRq/QZN6ZOtgFzUWTXR/klzXKO40gxZaYpBNGkzmu00f?=
 =?iso-8859-1?Q?l8vzkDP9WWG6muGOVDcW+6IhQtURKzmzUI3l0Mz6pVuE4UEiBXxyjOfijz?=
 =?iso-8859-1?Q?3IChYWOb2q3P0iP91PPtujd4ozQqRfNUDH1X3zttl2xij0uTvQfhYizLDq?=
 =?iso-8859-1?Q?RgL8ZGzcG1URXSHpQdQDqUUgYmhGXJ35G3fpL7kJF73bVVfkgGHfEIMVTz?=
 =?iso-8859-1?Q?ppTYy08yo0Zf/1JEKm4iiRLsV5qEK9KQrbl/6Fm0ErgLYe8X8KsTh7UTns?=
 =?iso-8859-1?Q?p16+oaQwIRjQ6GmpdT/PJOQSbpKokdrwatLBcMWQTV318QaWM21tILD+8O?=
 =?iso-8859-1?Q?KgiRmtE29LbAIqHCH3AO/Xl3azxNO+Dz7RDkpfG5XWT445Ffo5luHvuM+f?=
 =?iso-8859-1?Q?30/E3kZ5IRCP2WBqmqk5bL4bcQM98WIe4/ufPV4c2//ozUwYVnlAxVr4I+?=
 =?iso-8859-1?Q?VfF5MGzJaPHr/RghPCgRricBs4r/DULQax9ftdLb1odTxo3Jy6ifakYsUN?=
 =?iso-8859-1?Q?9g/SA4tVW8FkYeahqj0ksXf6fl5nfCI1D7gExNM8HCahxGkymKVL68iegT?=
 =?iso-8859-1?Q?3KTl5ZZEmK1dbFBIyayZr/mVL7r6Blxk+mWQOrV7Jq+hke0Yuxsc6ny670?=
 =?iso-8859-1?Q?LcwhiyeLwW1LIJmqXyr+X62jnopZgjmme1jgVpCkAaXjGlGE1YRFe8VZ97?=
 =?iso-8859-1?Q?PO0DbWSU4Ud5fYYxl+7bnQNUfc/JJVw7pKCRuQ78ZPmJnPLTx/qsZOWszL?=
 =?iso-8859-1?Q?mXUPl3A6diZAknCnyaXZIK6JDKWskwCOuM+liEVxITUNv7QIinyFI4NavV?=
 =?iso-8859-1?Q?VSb/xcvfnkQo1ciPq+hwuMJTHZ+P93PDM8ObAV1+53WnSZtZ4EEvTeUkX/?=
 =?iso-8859-1?Q?Elh7YiJvLvGfDfMs3pNQBoet8icWzcMMJ7CkNBNwvXU863/XOx+Q6mhBKB?=
 =?iso-8859-1?Q?PPI0nimi+o0AZZeozDbwg/87Xlthxy8OnWm5N8JrHL0pcqNYVmuA5PAjmr?=
 =?iso-8859-1?Q?ztW3MN9RVUCpRlehPR7EIUf9vTsfClobITB4GmiOZKXRqIGu4EubMClQcA?=
 =?iso-8859-1?Q?s67BX3WF6bPnYRFjUH5PxQi1flLGJgDhUUkpTUW1nu0JtgHxe3hLukUOXV?=
 =?iso-8859-1?Q?ynCBhH0SMMoah+iedIAdggIXl+OlyGJWQcKmpmoytzWpzrIQb6jXLWK5tc?=
 =?iso-8859-1?Q?r9xARwSD9XAA/mW3Wtn/ptVDBvEMDYgy6lOU6lRR6IFOY+xPw4kBFz8RUq?=
 =?iso-8859-1?Q?V+0wj1ymwfm6YAlYFvQPYLaWXIPOaK0EAeeyv8ezMO+fzNko0i35KiqsTg?=
 =?iso-8859-1?Q?NAI3/Z1Z8myL3pDoBERLUiVPHZqyG2m/MNfERM+FMtnC5GpLnmg+ON/3Zr?=
 =?iso-8859-1?Q?JKwEJ+OGakgA3PS24W/1ABA/JzBNRelOpZuxZBY1FY5dESPGX7mcDZEGJB?=
 =?iso-8859-1?Q?OEvblh0inWi61tF+xut4Ati/3lr88KUx1ieSi7zyXC0wuO2cwmUbyUFtwo?=
 =?iso-8859-1?Q?IBpoHaSnArws3Qkwzx/Mc0A0fkPkO7NP4GYs4WhJ+A7FI1Rxdj6fLNGgBU?=
 =?iso-8859-1?Q?dNvvYA8OMDPNHRXgRuNMqzlm4VANWtk4BG/YZBpvXlZTfU7328NbCOEQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e90cc2cf-586a-4bcf-2aae-08dde0d1d950
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 16:43:25.4628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xXbCqeGp99jX6edLJdzwKeC6OX0UGwoWVQEEzkQSAzUGotNV4dts7zIwaUvNzlDD+XWP3L7iuE3oWOoYo4Td2E7OJ1SoE/QIVaA+vliv9ZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9482


Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> This change introduces resource management in the VGIC to handle
> extended SPIs introduced in GICv3.1. The pending_irqs and
> allocated_irqs arrays are resized to support the required
> number of eSPIs, based on what is supported by the hardware and
> requested by the guest. A new field, ext_shared_irqs, is added
> to the VGIC structure to store information about eSPIs, similar
> to how shared_irqs is used for regular SPIs.
>
> Since the eSPI range starts at INTID 4096 and INTIDs between 1025
> and 4095 are reserved, helper macros are introduced to simplify the
> transformation of indices and to enable easier access to eSPI-specific
> resources. These changes prepare the VGIC for processing eSPIs as
> required by future functionality.
>
> The initialization and deinitialization paths for vgic have been updated
> to allocate and free these resources appropriately. Additionally,
> updated handling of INTIDs greater than 1024, passed from the toolstack
> during domain creation, and verification logic ensures only valid SPI or
> eSPI INTIDs are used.
>
> The existing SPI behavior remains unaffected when guests do not request
> eSPIs, GIC hardware does not support them, or the CONFIG_GICV3_ESPI
> option is disabled.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V2:
> - change is_espi_rank to is_valid_espi_rank to verify whether the array
>   element ext_shared_irqs exists. The previous version, is_espi_rank,
>   only checked if the rank index was less than the maximum possible eSPI
>   rank index, but this could potentially result in accessing a
>   non-existing array element. To address this, is_valid_espi_rank was
>   introduced, which ensures that the required eSPI rank exists
> - move gic_number_espis to
>   xen/arm: gicv3: implement handling of GICv3.1 eSPI
> - update vgic_is_valid_irq checks to allow operating with eSPIs
> - remove redundant newline in vgic_allocate_virq
> ---
>  xen/arch/arm/include/asm/vgic.h |  18 ++++
>  xen/arch/arm/vgic.c             | 145 ++++++++++++++++++++++++++++++++
>  2 files changed, 163 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 45201f4ca5..9fa4523018 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -146,6 +146,10 @@ struct vgic_dist {
>      int nr_spis; /* Number of SPIs */
>      unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
>      struct vgic_irq_rank *shared_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +    struct vgic_irq_rank *ext_shared_irqs;
> +    int nr_espis; /* Number of extended SPIs */
> +#endif
>      /*
>       * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
>       * struct arch_vcpu.
> @@ -243,6 +247,14 @@ struct vgic_ops {
>  /* Number of ranks of interrupt registers for a domain */
>  #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis+31)/32)
> +#define EXT_RANK_MIN (ESPI_BASE_INTID/32)
> +#define EXT_RANK_MAX ((ESPI_MAX_INTID+31)/32)
> +#define EXT_RANK_NUM2IDX(num) ((num)-EXT_RANK_MIN)
> +#define EXT_RANK_IDX2NUM(idx) ((idx)+EXT_RANK_MIN)
> +#endif
> +
>  #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>  #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
> =20
> @@ -302,6 +314,12 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct=
 vcpu *v,
>                                                unsigned int b,
>                                                unsigned int n,
>                                                unsigned int s);
> +#ifdef CONFIG_GICV3_ESPI
> +extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
> +                                                  unsigned int b,
> +                                                  unsigned int n,
> +                                                  unsigned int s);
> +#endif
>  extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int =
irq);
>  extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n=
);
>  extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n)=
;
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 48fbaf56fb..1a6c765af9 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -27,9 +27,26 @@
> =20
>  bool vgic_is_valid_irq(struct domain *d, unsigned int virq)
>  {
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( virq >=3D ESPI_BASE_INTID && virq < ESPI_IDX2INTID(d->arch.vgic=
.nr_espis) )
> +        return true;
> +#endif
> +
>      return virq < vgic_num_irqs(d);
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * Since eSPI indexes start from 4096 and numbers from 1024 to
> + * 4095 are forbidden, we need to check both lower and upper
> + * limits for ranks.
> + */
> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int ran=
k)
> +{
> +    return ( rank >=3D EXT_RANK_MIN && EXT_RANK_NUM2IDX(rank) < DOMAIN_N=
R_EXT_RANKS(d) );

I am pretty sure that max line length in 80 symbols, and here you have
more. As well in couple of other places below.

> +}
> +#endif
> +
>  static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>                                                    unsigned int rank)
>  {
> @@ -37,6 +54,10 @@ static inline struct vgic_irq_rank *vgic_get_rank(stru=
ct vcpu *v,
>          return v->arch.vgic.private_irqs;
>      else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
>          return &v->domain->arch.vgic.shared_irqs[rank - 1];
> +#ifdef CONFIG_GICV3_ESPI
> +    else if ( is_valid_espi_rank(v->domain, rank) )
> +        return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(ra=
nk)];
> +#endif
>      else
>          return NULL;
>  }
> @@ -53,6 +74,16 @@ struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v,=
 unsigned int b,
>      return vgic_get_rank(v, rank);
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int =
b,
> +                                           unsigned int n, unsigned int =
s)
> +{
> +    unsigned int rank =3D REG_RANK_NR(b, (n >> s));
> +
> +    return vgic_get_rank(v, rank + EXT_RANK_MIN);
> +}
> +#endif
> +
>  struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq)
>  {
>      unsigned int rank =3D irq / 32;
> @@ -117,6 +148,29 @@ int domain_vgic_register(struct domain *d, unsigned =
int *mmio_count)
>      return 0;
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +static int init_vgic_espi(struct domain *d)
> +{
> +    int i;
> +
> +    if ( d->arch.vgic.nr_espis =3D=3D 0 )
> +        return 0;
> +
> +    d->arch.vgic.ext_shared_irqs =3D
> +        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
> +    if ( d->arch.vgic.ext_shared_irqs =3D=3D NULL )
> +        return -ENOMEM;
> +
> +    for ( i =3D 0; i < d->arch.vgic.nr_espis; i++ )
> +        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i + d->arch.vgi=
c.nr_spis], ESPI_IDX2INTID(i));
> +
> +    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
> +        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);
> +
> +    return 0;
> +}
> +#endif
> +
>  int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>  {
>      int i;
> @@ -131,6 +185,30 @@ int domain_vgic_init(struct domain *d, unsigned int =
nr_spis)
>       */
>      nr_spis =3D ROUNDUP(nr_spis, 32);
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( nr_spis > ESPI_MAX_INTID )
> +        return -EINVAL;
> +
> +    if ( is_espi(nr_spis) )
> +    {
> +        /*
> +         * During domain creation, the toolstack specifies the maximum I=
NTID,
> +         * which is defined in the domain config subtracted by 32. To co=
mpute the
> +         * actual number of eSPI that will be usable for, add back 32.

I think, according to this, your if ( is_espi() ) check is wrong. Should
you add 32 here as well?

> +         */
> +        d->arch.vgic.nr_espis =3D min(nr_spis - ESPI_BASE_INTID + 32, 10=
24U);
> +        /* Verify if GIC HW can handle provided INTID */
> +        if ( d->arch.vgic.nr_espis > gic_number_espis() )
> +            return -EINVAL;
> +        /* Set the maximum available number for defult SPI to pass the n=
ext check */
> +        nr_spis =3D VGIC_DEF_NR_SPIS;
> +    } else
> +    {
> +        /* Domain will use the regular SPI range */
> +        d->arch.vgic.nr_espis =3D 0;
> +    }
> +#endif
> +
>      /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988=
  */
>      if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
>          return -EINVAL;
> @@ -145,7 +223,12 @@ int domain_vgic_init(struct domain *d, unsigned int =
nr_spis)
>          return -ENOMEM;
> =20
>      d->arch.vgic.pending_irqs =3D
> +#ifdef CONFIG_GICV3_ESPI
> +        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis +
> +                      d->arch.vgic.nr_espis);
> +#else
>          xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
> +#endif
>      if ( d->arch.vgic.pending_irqs =3D=3D NULL )
>          return -ENOMEM;
> =20
> @@ -156,12 +239,23 @@ int domain_vgic_init(struct domain *d, unsigned int=
 nr_spis)
>      for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
>          vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    ret =3D init_vgic_espi(d);
> +    if ( ret )
> +        return ret;
> +#endif
> +
>      ret =3D d->arch.vgic.handler->domain_init(d);
>      if ( ret )
>          return ret;
> =20
>      d->arch.vgic.allocated_irqs =3D
> +#ifdef CONFIG_GICV3_ESPI
> +        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d) +
> +                      d->arch.vgic.nr_espis));
> +#else
>          xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
> +#endif
>      if ( !d->arch.vgic.allocated_irqs )
>          return -ENOMEM;
> =20
> @@ -195,9 +289,27 @@ void domain_vgic_free(struct domain *d)
>          }
>      }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i =3D 0; i < (d->arch.vgic.nr_espis); i++ )
> +    {
> +        struct pending_irq *p =3D spi_to_pending(d, ESPI_IDX2INTID(i));
> +
> +        if ( p->desc )
> +        {
> +            ret =3D release_guest_irq(d, p->irq);
> +            if ( ret )
> +                dprintk(XENLOG_G_WARNING, "d%u: Failed to release virq %=
u ret =3D %d\n",
> +                        d->domain_id, p->irq, ret);
> +        }
> +    }
> +#endif
> +
>      if ( d->arch.vgic.handler )
>          d->arch.vgic.handler->domain_free(d);
>      xfree(d->arch.vgic.shared_irqs);
> +#ifdef CONFIG_GICV3_ESPI
> +    xfree(d->arch.vgic.ext_shared_irqs);
> +#endif
>      xfree(d->arch.vgic.pending_irqs);
>      xfree(d->arch.vgic.allocated_irqs);
>  }
> @@ -331,6 +443,17 @@ void arch_move_irqs(struct vcpu *v)
>          if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p-=
>status) )
>              irq_set_affinity(p->desc, cpu_mask);
>      }
> +
> +#ifdef CONFIG_GICV3_ESPI
> +    for ( i =3D ESPI_BASE_INTID; i < (d)->arch.vgic.nr_espis; i++ )
> +    {
> +        v_target =3D vgic_get_target_vcpu(v, i);
> +        p =3D irq_to_pending(v_target, i);
> +
> +        if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p-=
>status) )
> +            irq_set_affinity(p->desc, cpu_mask);
> +    }
> +#endif
>  }
> =20
>  void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
> @@ -538,6 +661,10 @@ struct pending_irq *irq_to_pending(struct vcpu *v, u=
nsigned int irq)
>          n =3D &v->arch.vgic.pending_irqs[irq];
>      else if ( is_lpi(irq) )
>          n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, ir=
q);
> +#ifdef CONFIG_GICV3_ESPI
> +    else if ( is_espi(irq) )
> +        n =3D &v->domain->arch.vgic.pending_irqs[ESPI_INTID2IDX(irq) + v=
->domain->arch.vgic.nr_spis];
> +#endif
>      else
>          n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
>      return n;
> @@ -547,6 +674,14 @@ struct pending_irq *spi_to_pending(struct domain *d,=
 unsigned int irq)
>  {
>      ASSERT(irq >=3D NR_LOCAL_IRQS);
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( is_espi(irq) )
> +    {
> +        irq =3D ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
> +        return &d->arch.vgic.pending_irqs[irq];
> +    }
> +#endif
> +
>      return &d->arch.vgic.pending_irqs[irq - 32];
>  }
> =20
> @@ -668,6 +803,11 @@ bool vgic_reserve_virq(struct domain *d, unsigned in=
t virq)
>      if ( !vgic_is_valid_irq(d, virq) )
>          return false;
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( is_espi(virq) )
> +        return !test_and_set_bit(ESPI_INTID2IDX(virq) + vgic_num_irqs(d)=
, d->arch.vgic.allocated_irqs);
> +#endif
> +
>      return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
>  }
> =20
> @@ -686,6 +826,11 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>      {
>          first =3D 32;
>          end =3D vgic_num_irqs(d);
> +#ifdef CONFIG_GICV3_ESPI
> +        /* Take into account extended SPI range */
> +        end +=3D d->arch.vgic.nr_espis;
> +#endif
> +
>      }
> =20
>      /*

--=20
WBR, Volodymyr=

