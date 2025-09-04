Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F08BB447E6
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:59:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110952.1459940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuH2l-0005X7-PT; Thu, 04 Sep 2025 20:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110952.1459940; Thu, 04 Sep 2025 20:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuH2l-0005V3-ML; Thu, 04 Sep 2025 20:58:55 +0000
Received: by outflank-mailman (input) for mailman id 1110952;
 Thu, 04 Sep 2025 20:58:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jpjq=3P=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1uuH2k-0005Ux-3x
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:58:54 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f63e5b21-89d1-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 22:58:52 +0200 (CEST)
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com (2603:10a6:10:516::14)
 by GV1PR03MB10848.eurprd03.prod.outlook.com (2603:10a6:150:211::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 20:58:47 +0000
Received: from DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4]) by DU5PR03MB10441.eurprd03.prod.outlook.com
 ([fe80::eeb8:470:6260:e5f4%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 20:58:47 +0000
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
X-Inumbo-ID: f63e5b21-89d1-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PaP7bvoYa+GfxuB3jTl9Pu5qbBGa60WkNwLduECwjtMWyt8aw0qj5tkdVEaH9kDrkWqeyCUtcMDACSCCgOq8i9d0sWvxFna12CcQIzoNH67g97T2AIz/tYuUR9u/eE66kKPgD1uz0SpM+Zo9u5Y5C1ud9LS59EKAA6us6GprtEpxxiZodlLicjRzsigY1gZKlQj3bSbTWjnk4SmL2o2jDQWEm0yGAMrvYjQ1Ie4tdlUzgOq6tBFijFQpgUhp32N9WX29YQ5Lf7phT6fh+fuhNVELGy3+kbXuwO3bulQEL7BeVfzjLa5NvtjmHLkwfYB7wxsTV1GxDpBv26gLkWbMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCu1e7+rs5Fohg4UFecIRKOUZ+4F/AqnfVDw9iSbt/E=;
 b=hLpLZ+5CNbIqPcmzav5veQRq0fhh9PasABIoICne7ujmZt5RtAqRPEprReb0SQPvzE+Id4c5e42uE3zYbWzLjgkqcIvU9mHadClSu63Cf6gCqolJpQ3hA0pu3SMfNqao6YonNHO+hy6PHnCMezwPM4zsxtBofOrL5xvKH2YQIDCvfi8jFMT5S3NmAAYOYccwKj/Akv40c5UU1iH6upKz7wEbh5qlUCoAQCBgzyZlrTI288rl6OJQ9P8RmtVcsHP2qHDazlRa6gXuQm1Wl4vJt0lRiGtyjTBU7O/Cpc/fswXuFFC1qTfgJ+9/p7t2t3T4hOXcRV5uLhiWt7PFD/XyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCu1e7+rs5Fohg4UFecIRKOUZ+4F/AqnfVDw9iSbt/E=;
 b=c+LKxhDBxYWB0+zMyR7pEZZOs2EGUktV5npLytaqHhU2JbSumnVvublznRmDyIwVuocx+zew5TjZOoYa3qDWPn+1u8JknNSneYVhKQN6vMLPBUOoXZZJwOI2xcgHuXrCt7jF7meL1EEd8+9NsCGRQNLvrqukQ7O7P72xkZmYTj/eSnK8Bqwji/6OVPWD3Bo0FCYrxtnlgMsnHLhb8gNzZwjdCJhIqAkq8+hwWf47cvFIqA5Lxq18yfTN+u98BS/vZmtfa/WbbPSLQVeVNTMlwopsbSd3pLYGJf2TzFOLP0I/y84BV0PvMiI6CnWUl0H+wp2oXL7rqFO9VbvWCLx8HA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Oleksandr
 Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Subject: Re: [PATCH v7 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Topic: [PATCH v7 08/12] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcHda81q3nGPOsmUqt6+f7nPiAvw==
Date: Thu, 4 Sep 2025 20:58:47 +0000
Message-ID: <87bjnqrl2x.fsf@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
	<5b34940bbc90c4144f4d91880524f452d974d14a.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <5b34940bbc90c4144f4d91880524f452d974d14a.1757015865.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Thu, 4 Sep 2025 20:01:42 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU5PR03MB10441:EE_|GV1PR03MB10848:EE_
x-ms-office365-filtering-correlation-id: b8de6de4-1306-49c4-0fee-08ddebf5d7c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|42112799006|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?41Sa8CyewuDbiEW+qGMOSJbSOcuGybkzU78i+vRENZWeRsp61XI0HmvgOl?=
 =?iso-8859-1?Q?Ht9QPXjjRFPFIXiuuNf6fOSxt1nGcfAggEq6L9gK1i8na6oYRL2v0aNrgX?=
 =?iso-8859-1?Q?jVquepxbimC3WWLrLAJ5H/tEDDiGIG1hMCba10TIz2rkDPt14Sy5cOQBON?=
 =?iso-8859-1?Q?AwFWhAxhJLxLfHtER0nelj6lN5Ah685Sjxxlvaq7MDfp7VvQtnVe/bk5mp?=
 =?iso-8859-1?Q?cKSQKRkDL7HZUEBfpq+MtBxVZ/Mc/11azTvHqsrCSz5NbnZcksFpRKDuXb?=
 =?iso-8859-1?Q?rQaXEllNSOkqWRdgQdgPgxC1aalOEfHC9jLCQDqoq8qBqEBud/BaDaCWD3?=
 =?iso-8859-1?Q?UMYiVw8vXpkxgIec/WGIzccLRfoRaGgdD6fvoMi0q5TlPUEo51She3mGPK?=
 =?iso-8859-1?Q?anrzmlAQb+1gbxXfDL41VoL24K7SgYk9aNrmczFfbGlpLVZXb8HnvhP1SP?=
 =?iso-8859-1?Q?XbkCkXMjOMCzp5WJyv9XBMCDUF84Uu7yBPuQzPgYpvWiVPRlhs2Am1ok2A?=
 =?iso-8859-1?Q?QweohMRiraoq90/7FymGxgBb8+MuD500v7qC0FtI5nsxRLsdnMb7e6s3zt?=
 =?iso-8859-1?Q?9rC+bofg3EbmyxbcHtmshd2nYOjir1kPyAf3SsU1/881ZHIcbAMq3Z89pr?=
 =?iso-8859-1?Q?62MB1rnuypqucC3ovGLe2AH8qaM/UBQJrAH1C9VO1n9wk+9bTaX7AM4mYi?=
 =?iso-8859-1?Q?mpaS9GqKq2AEvNnWErkBjcBC3PZeb4eG7rDZkS1vPhzVPHcIYDTIFTw8aZ?=
 =?iso-8859-1?Q?wWpdnY1UFYgTIKPZFlYoe+4U7/tbZxqPF5L4pjI7wPqGC8BIAyLESA+42l?=
 =?iso-8859-1?Q?obdj+F/5Tew5dvKopYVQEkq+k11kpNxJZRQDMcqzeboU6nTciHKbKAL25n?=
 =?iso-8859-1?Q?L4m06b3REYfzCQFh4tCL9/z2tHy4y20x/sm2HBSUZZp6vFsUYKNdj8I0n9?=
 =?iso-8859-1?Q?oDCsjdCXlZS1AJW/I49/8wHjLzQr8bADfmsT+uD3IqmurvXi+Ri7Y4fZjW?=
 =?iso-8859-1?Q?Jaxlqlx3EnWR+9+wo1dmg8RGXo+GaZutziPIE+eMRq62EfpbdNqLRfvYRa?=
 =?iso-8859-1?Q?xLVbtpDJhiq9Q7YDYNEf1O4C8jyA1JofiXzvrXDZmk+2u7qf5mIXBAuiCG?=
 =?iso-8859-1?Q?9V1q3QPWb79wXK7Q+63ssW9UtRIy6dpmuau7EMuLr6Ybw+hPoIxEwsMb6S?=
 =?iso-8859-1?Q?hZ5QwpGab3qxJ3o5TGowJx1Pt17pxCq8mgBsjkgPPoSlSlSiLF097kGRLW?=
 =?iso-8859-1?Q?TLkYRNbRgGpdbUDspMdNcO6Cglu3lrkD1qW9BhYPfWG3SskAXlTUmqSuDg?=
 =?iso-8859-1?Q?B4OcPdWidU+G2r5VIxVD4lbjqFvFGcP8PS3Z8O8PSLsxsu0Ydy2wx5tkQf?=
 =?iso-8859-1?Q?CN4kfbBfVXg1w56NV8JU6duLKr/HhCPUUfe/up4guRUyG2NNt3I3tj2VmV?=
 =?iso-8859-1?Q?fed5+ybV6RBgJba9gX4XZOLJdLMUNDnBDk1wZXNDt1bHtLDjktaP8otx3E?=
 =?iso-8859-1?Q?yoFgiFbKlFOR5TkmZXR/LuST6ufYZhwrYiw2gZxQowJA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU5PR03MB10441.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(42112799006)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?cjz31rBH1RJsFfhAUIVjWWtmOZqkPO6Ab7xjZiE1lUcJmjhEbnWx+GOzkI?=
 =?iso-8859-1?Q?wlDnY1HYecgzv3cFLnn9NHL+R7EmU8Vayl7XkiJEWmwJpmBqNlJsJ/Hb+a?=
 =?iso-8859-1?Q?fl7/VgPqUs+a6XYldk0xas/Vx79U+ZtHHJM8YsEWo2NDcUCVTm7CvUEiEA?=
 =?iso-8859-1?Q?y69vrPVIWPNa8zciQS5IEG4W+x1u4keLcMbK3X6SPdQR/b0+MQrjg87UtQ?=
 =?iso-8859-1?Q?vbkmsH4ySuoUikR6jdy0f0h9BD/VTl35+ckuMW0VbdOk5+oNKSdBlAeGIq?=
 =?iso-8859-1?Q?kswEwHrzD+5p1c4HSifV61rpTe71UjNW1o1cGhAQHTy2nG0oYkY5AF8UU5?=
 =?iso-8859-1?Q?SxvmMyQbPt56MSqrlYPgxwdTpg+Z/FBhys+bI2hwMjfiFI3g4qR0VVKpyu?=
 =?iso-8859-1?Q?FM5kkZk1F/sS8xznXJ6iiEO75mk6PIWnlxN3l+KNau01PRsrZKpvw6pzVQ?=
 =?iso-8859-1?Q?kvOvk+aCdDDAHorhoMdvEUUBpzaqU1o7VLkF3cWbdiWhkUN1qGyfwhFuxl?=
 =?iso-8859-1?Q?t/uVPsbyUkNM7xKXlTvgYM6TZXGIxlMq2HwYUpDvuryZVwxniMhQgF2+vY?=
 =?iso-8859-1?Q?C+tb99nakRMivW3Uq6dsstQBsGurvONbl0L5ShE+XJdcay/gsYeQS/Hdh2?=
 =?iso-8859-1?Q?+aStOjBe/pVro7LxFg+ayVk4fkGt17SEk1pmI8hxMUtP0Bbl+fgOnDXCjk?=
 =?iso-8859-1?Q?TljcLAqIRAFGvmHKBWXenQc039QKhTKeOW1BVmGbZTL6THOKeaMfLuymld?=
 =?iso-8859-1?Q?X2MdjOqDzW/IMuMP6M0CPC+ZEyMXWt7rk9LYasjjl6EMhZF4PqClbgHjch?=
 =?iso-8859-1?Q?JyAYz7FRPOJ2j+pARqm3Wa+1Aka4DJa0+T79FKcxhPeTdC9u5o6Ha8JeTD?=
 =?iso-8859-1?Q?s8RD5xaWmEl00VkCm9f08rRQgba8LJDQCEOyCX5tVXAoGgNyipCnM78YfR?=
 =?iso-8859-1?Q?01Do1jfmL4NdBGk2t2hUKH5AdUU7Lvlquq1+xi/o4nesXY76u+gYndyx7n?=
 =?iso-8859-1?Q?RJgAg6QRmwIO5wq/5BAvrJ5i9B4HD3vTrcQ6mrTwKtDDiCHBlGp65vo024?=
 =?iso-8859-1?Q?1v7knby/m+dYcqHvYdiWGb/AxYBrn3ELRizYu8UcuOMKc5zhblPhPKAsrm?=
 =?iso-8859-1?Q?v1hcUu8rsXyJiKmqrGFdjJjnohcc71wjK6G7d8UyQrEcdUG5A/XtSCRUM3?=
 =?iso-8859-1?Q?X9/SojIa5SmXi0MqYTq6vLXTA2EiPZTBZwU6h6kHkOXZD/nardg2oEaV1a?=
 =?iso-8859-1?Q?m0pywSbmAWBMa/dcqCOGxT9udEfM6CRjJcsNYPMThd9J5iH9UOk6io0Hc3?=
 =?iso-8859-1?Q?AT8qOyTnUasNzFma+EUQHIQl0FSIfXdJcve+wc4MMkh4yIr0LCnhfvv6K3?=
 =?iso-8859-1?Q?qieQ/Ax/94eoiqK6wtnHQjRyDpNoF50Tm1TAazMAABgNmA7H6RgPibFA4m?=
 =?iso-8859-1?Q?tWgRqBPkaAvJn5KkVYD81BItTlsJGKYDjMqmCEzk7FgYF7XJaMOPkNoSYl?=
 =?iso-8859-1?Q?uWI5u2+Dd7f5GSYBaFhDj1z7k1dEqWhVG0J83RRW414KmBVbkgnjrsDKUC?=
 =?iso-8859-1?Q?MC1wMvNSo7NOEeI9CPJcW9ZmM5Z0PgaGdvOOOUNsMg/nE2NebUsKWeEvN9?=
 =?iso-8859-1?Q?WhM54P/Ir8SibND2Vkzo/PcALBxHiko4ruDzvLSkrkl7ejGGah39diKg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU5PR03MB10441.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8de6de4-1306-49c4-0fee-08ddebf5d7c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:58:47.5174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l7t+fOC635mfe8OyiUShwM5NF2rfnT3nHu+I4aw3vvcarLnse0cJWBsp5+wtLqJnUFDEeDP8cF9zNK9nPbDU+ytOY8RCT4Jk+14U5nTEn0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB10848



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
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V7:
> - minor: changed hardcoded value of 32 to NR_LOCAL_IRQS
> - minor: used local variable idx in spi_to_pending() and vgic_reserve_vir=
q()
> - minor: added a comment for allocated_irqs and pending_irqs with index
>   mappings
> - added reviewed-by from Oleksandr Tyshchenko
>
> Changes for V6:
> - introduced a new function for index to virq conversion, idx_to_virq.
>   This allows the removal of eSPI-specific functions and enables the
>   reuse of existing code for regular SPIs
> - fixed the return value of vgic_allocate_virq in the case of eSPI
> - updated the error message in route_irq_to_guest(). To simplify it and
>   avoid overcomplicating with INTID ranges, propose removing the
>   information about the max number of IRQs
> - fixed eSPI rank initialization to avoid using EXT_RANK_IDX2NUM for
>   converting the eSPI rank to the extended range
> - updated the recalculation logic to avoid the nr_spis > 1020 -
>   NR_LOCAL_IRQS check when nr_spis is reassigned in the case of eSPI
> - fixed formatting issues for macros
> - minor change: changed the macros ESPI_INTID2IDX and ESPI_IDX2INTID
>   into appropriate inline functions introduced in the previous patch
> - minor change: changed int to unsigned int for nr_espis
>
> Changes in V5:
> - removed the has_espi field because it can be determined by checking
>   whether domain->arch.vgic.nr_espis is zero or not
> - since vgic_ext_rank_offset is not used in this patch, it has been
>   moved to the appropriate patch in the patch series, which implements
>   vgic eSPI registers emulation and requires this function
> - removed ifdefs for eSPI-specific macros to reduce the number of ifdefs
>   and code duplication in further changes
> - fixed minor nit: used %pd for printing domain with its ID
>
> Changes in V4:
> - added has_espi field to simplify determining whether a domain is able
>   to operate with eSPI
> - fixed formatting issues and misspellings
>
> Changes in V3:
> - fixed formatting for lines with more than 80 symbols
> - introduced helper functions to be able to use stubs in case of
>   CONFIG_GICV3_ESPI disabled, and as a result, reduce the number of
>   #ifdefs
> - fixed checks for nr_spis in domain_vgic_init
> - updated comment about nr_spis adjustments with dom0less mention
> - moved comment with additional explanations before checks
> - used unsigned int for indexes since they cannot be negative
> - removed unnecessary parentheses
> - move vgic_ext_rank_offset to the below ifdef guard, to reduce the
>   number of ifdefs
>
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
>  xen/arch/arm/include/asm/vgic.h |  26 ++++-
>  xen/arch/arm/irq.c              |   3 +-
>  xen/arch/arm/vgic.c             | 180 +++++++++++++++++++++++++++++---
>  3 files changed, 193 insertions(+), 16 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 3e7cbbb196..caffea092b 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -144,11 +144,25 @@ struct vgic_dist {
>      spinlock_t lock;
>      uint32_t ctlr;
>      int nr_spis; /* Number of SPIs */
> -    unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
> +    /*
> +     * Bitmap of allocated IRQs with the following index mapping:
> +     * Local IRQs [0..31]
> +     * Regular SPIs [32..nr_spis + 31]
> +     * Optional, if supported:
> +     * Extended SPIs [nr_spis + 32..nr_spis + nr_espis + 31]
> +     */
> +    unsigned long *allocated_irqs;
>      struct vgic_irq_rank *shared_irqs;
> +#ifdef CONFIG_GICV3_ESPI
> +    struct vgic_irq_rank *ext_shared_irqs;
> +    unsigned int nr_espis; /* Number of extended SPIs */
> +#endif
>      /*
>       * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
> -     * struct arch_vcpu.
> +     * struct arch_vcpu. The index mapping is as follows:
> +     * Regular SPIs [0..nr_spis - 1]
> +     * Optional, if supported:
> +     * eSPIs [nr_spis..nr_spis + nr_espis - 1]
>       */
>      struct pending_irq *pending_irqs;
>      /* Base address for guest GIC */
> @@ -243,6 +257,14 @@ struct vgic_ops {
>  /* Number of ranks of interrupt registers for a domain */
>  #define DOMAIN_NR_RANKS(d) (((d)->arch.vgic.nr_spis+31)/32)
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +#define DOMAIN_NR_EXT_RANKS(d) (((d)->arch.vgic.nr_espis + 31) / 32)
> +#endif
> +#define EXT_RANK_MIN (ESPI_BASE_INTID / 32)
> +#define EXT_RANK_MAX ((ESPI_MAX_INTID + 31) / 32)
> +#define EXT_RANK_NUM2IDX(num) ((num) - EXT_RANK_MIN)
> +#define EXT_RANK_IDX2NUM(idx) ((idx) + EXT_RANK_MIN)
> +
>  #define vgic_lock(v)   spin_lock_irq(&(v)->domain->arch.vgic.lock)
>  #define vgic_unlock(v) spin_unlock_irq(&(v)->domain->arch.vgic.lock)
> =20
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index c934d39bf6..c2f1ceb91f 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -494,8 +494,7 @@ int route_irq_to_guest(struct domain *d, unsigned int=
 virq,
>      if ( !vgic_is_valid_line(d, virq) )
>      {
>          printk(XENLOG_G_ERR
> -               "the vIRQ number %u is too high for domain %u (max =3D %u=
)\n",
> -               irq, d->domain_id, vgic_num_irqs(d));
> +               "invalid vIRQ number %u for domain %pd\n", irq, d);
>          return -EINVAL;
>      }
> =20
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 2bbf4d99aa..878daa71d4 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -25,11 +25,61 @@
>  #include <asm/vgic.h>
> =20
> =20
> +static inline unsigned int idx_to_virq(struct domain *d, unsigned int id=
x)
> +{
> +    if ( idx >=3D vgic_num_irqs(d) )
> +        return espi_idx_to_intid(idx - vgic_num_irqs(d));
> +
> +    return idx;
> +}
> +
>  bool vgic_is_valid_line(struct domain *d, unsigned int virq)
>  {
> +#ifdef CONFIG_GICV3_ESPI
> +    if ( virq >=3D ESPI_BASE_INTID &&
> +         virq < espi_idx_to_intid(d->arch.vgic.nr_espis) )
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
> +    return rank >=3D EXT_RANK_MIN &&
> +           EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d);
> +}
> +
> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> +                                                       unsigned int rank=
)
> +{
> +    return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank)]=
;
> +}
> +
> +#else
> +static inline bool is_valid_espi_rank(struct domain *d, unsigned int ran=
k)
> +{
> +    return false;
> +}
> +
> +/*
> + * This function is stub and will not be called if CONFIG_GICV3_ESPI=3Dn=
,
> + * because in this case, is_valid_espi_rank will always return false.
> + */
> +static inline struct vgic_irq_rank *vgic_get_espi_rank(struct vcpu *v,
> +                                                       unsigned int rank=
)
> +{
> +    ASSERT_UNREACHABLE();
> +    return NULL;
> +}
> +#endif
> +
>  static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>                                                    unsigned int rank)
>  {
> @@ -37,6 +87,8 @@ static inline struct vgic_irq_rank *vgic_get_rank(struc=
t vcpu *v,
>          return v->arch.vgic.private_irqs;
>      else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
>          return &v->domain->arch.vgic.shared_irqs[rank - 1];
> +    else if ( is_valid_espi_rank(v->domain, rank) )
> +        return vgic_get_espi_rank(v, rank);
>      else
>          return NULL;
>  }
> @@ -117,6 +169,54 @@ int domain_vgic_register(struct domain *d, unsigned =
int *mmio_count)
>      return 0;
>  }
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +static unsigned int vgic_num_spi_lines(struct domain *d)
> +{
> +    return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
> +}
> +
> +static int init_vgic_espi(struct domain *d)
> +{
> +    unsigned int i, idx;
> +
> +    if ( d->arch.vgic.nr_espis =3D=3D 0 )
> +        return 0;
> +
> +    d->arch.vgic.ext_shared_irqs =3D
> +        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
> +    if ( d->arch.vgic.ext_shared_irqs =3D=3D NULL )
> +        return -ENOMEM;
> +
> +    for ( i =3D d->arch.vgic.nr_spis, idx =3D 0;
> +          i < vgic_num_spi_lines(d); i++, idx++ )
> +        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
> +                              espi_idx_to_intid(idx));
> +
> +    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
> +        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i],
> +                       EXT_RANK_IDX2NUM(i), 0);
> +
> +    return 0;
> +}
> +
> +#else
> +static int init_vgic_espi(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static unsigned int vgic_num_spi_lines(struct domain *d)
> +{
> +    return d->arch.vgic.nr_spis;
> +}
> +
> +#endif
> +
> +static unsigned int vgic_num_alloc_irqs(struct domain *d)
> +{
> +    return vgic_num_spi_lines(d) + NR_LOCAL_IRQS;
> +}
> +
>  int domain_vgic_init(struct domain *d, unsigned int nr_spis)
>  {
>      int i;
> @@ -133,7 +233,39 @@ int domain_vgic_init(struct domain *d, unsigned int =
nr_spis)
> =20
>      /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988=
  */
>      if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
> +#ifndef CONFIG_GICV3_ESPI
>          return -EINVAL;
> +#else
> +    {
> +        /*
> +         * During domain creation, the dom0less DomUs code or toolstack
> +         * specifies the maximum INTID, which is defined in the domain
> +         * config subtracted by 32 to cover the local IRQs (please see
> +         * the comment to VGIC_DEF_NR_SPIS). To compute the actual numbe=
r
> +         * of eSPI that will be usable for, add back 32 (NR_LOCAL_IRQS).
> +         */
> +        nr_spis +=3D NR_LOCAL_IRQS;
> +        if ( nr_spis > espi_idx_to_intid(NR_ESPI_IRQS) )
> +            return -EINVAL;
> +
> +        if ( nr_spis >=3D ESPI_BASE_INTID )
> +        {
> +            unsigned int nr_espis =3D min(nr_spis - ESPI_BASE_INTID, 102=
4U);
> +
> +            /* Verify if GIC HW can handle provided INTID */
> +            if ( nr_espis > gic_number_espis() )
> +                return -EINVAL;
> +
> +            d->arch.vgic.nr_espis =3D nr_espis;
> +            /* Set the maximum available number for regular SPIs */
> +            nr_spis =3D VGIC_DEF_NR_SPIS;
> +        }
> +        else
> +        {
> +            return -EINVAL;
> +        }
> +    }
> +#endif
> =20
>      d->arch.vgic.nr_spis =3D nr_spis;
> =20
> @@ -145,7 +277,7 @@ int domain_vgic_init(struct domain *d, unsigned int n=
r_spis)
>          return -ENOMEM;
> =20
>      d->arch.vgic.pending_irqs =3D
> -        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
> +        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
>      if ( d->arch.vgic.pending_irqs =3D=3D NULL )
>          return -ENOMEM;
> =20
> @@ -156,12 +288,16 @@ int domain_vgic_init(struct domain *d, unsigned int=
 nr_spis)
>      for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
>          vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
> =20
> +    ret =3D init_vgic_espi(d);
> +    if ( ret )
> +        return ret;
> +
>      ret =3D d->arch.vgic.handler->domain_init(d);
>      if ( ret )
>          return ret;
> =20
>      d->arch.vgic.allocated_irqs =3D
> -        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
> +        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_alloc_irqs(d=
)));
>      if ( !d->arch.vgic.allocated_irqs )
>          return -ENOMEM;
> =20
> @@ -182,9 +318,12 @@ void domain_vgic_free(struct domain *d)
>      int i;
>      int ret;
> =20
> -    for ( i =3D 0; i < (d->arch.vgic.nr_spis); i++ )
> +    for ( i =3D NR_LOCAL_IRQS; i < vgic_num_alloc_irqs(d); i++ )
>      {
> -        struct pending_irq *p =3D spi_to_pending(d, i + 32);
> +        struct pending_irq *p;
> +        unsigned int virq =3D idx_to_virq(d, i);
> +
> +        p =3D spi_to_pending(d, virq);
> =20
>          if ( p->desc )
>          {
> @@ -198,6 +337,9 @@ void domain_vgic_free(struct domain *d)
>      if ( d->arch.vgic.handler )
>          d->arch.vgic.handler->domain_free(d);
>      xfree(d->arch.vgic.shared_irqs);
> +#ifdef CONFIG_GICV3_ESPI
> +    xfree(d->arch.vgic.ext_shared_irqs);
> +#endif
>      xfree(d->arch.vgic.pending_irqs);
>      xfree(d->arch.vgic.allocated_irqs);
>  }
> @@ -323,10 +465,12 @@ void arch_move_irqs(struct vcpu *v)
>       */
>      ASSERT(!is_lpi(vgic_num_irqs(d) - 1));
> =20
> -    for ( i =3D 32; i < vgic_num_irqs(d); i++ )
> +    for ( i =3D NR_LOCAL_IRQS; i < vgic_num_alloc_irqs(d); i++ )
>      {
> -        v_target =3D vgic_get_target_vcpu(v, i);
> -        p =3D irq_to_pending(v_target, i);
> +        unsigned int virq =3D idx_to_virq(d, i);
> +
> +        v_target =3D vgic_get_target_vcpu(v, virq);
> +        p =3D irq_to_pending(v_target, virq);
> =20
>          if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p-=
>status) )
>              irq_set_affinity(p->desc, cpu_mask);
> @@ -539,15 +683,22 @@ struct pending_irq *irq_to_pending(struct vcpu *v, =
unsigned int irq)
>      else if ( is_lpi(irq) )
>          n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, ir=
q);
>      else
> -        n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
> +        n =3D spi_to_pending(v->domain, irq);
>      return n;
>  }
> =20
>  struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
>  {
> +    unsigned int idx;
> +
>      ASSERT(irq >=3D NR_LOCAL_IRQS);
> =20
> -    return &d->arch.vgic.pending_irqs[irq - 32];
> +    if ( is_espi(irq) )
> +        idx =3D espi_intid_to_idx(irq) + d->arch.vgic.nr_spis;
> +    else
> +        idx =3D irq - NR_LOCAL_IRQS;
> +
> +    return &d->arch.vgic.pending_irqs[idx];
>  }
> =20
>  void vgic_clear_pending_irqs(struct vcpu *v)
> @@ -665,10 +816,15 @@ bool vgic_emulate(struct cpu_user_regs *regs, union=
 hsr hsr)
> =20
>  bool vgic_reserve_virq(struct domain *d, unsigned int virq)
>  {
> +    unsigned int idx =3D virq;
> +
>      if ( !vgic_is_valid_line(d, virq) )
>          return false;
> =20
> -    return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
> +    if ( is_espi(virq) )
> +        idx =3D espi_intid_to_idx(virq) + vgic_num_irqs(d);
> +
> +    return !test_and_set_bit(idx, d->arch.vgic.allocated_irqs);
>  }
> =20
>  int vgic_allocate_virq(struct domain *d, bool spi)
> @@ -685,7 +841,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>      else
>      {
>          first =3D 32;
> -        end =3D vgic_num_irqs(d);
> +        end =3D vgic_num_alloc_irqs(d);
>      }
> =20
>      /*
> @@ -700,7 +856,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
>      }
>      while ( test_and_set_bit(virq, d->arch.vgic.allocated_irqs) );
> =20
> -    return virq;
> +    return idx_to_virq(d, virq);
>  }
> =20
>  void vgic_free_virq(struct domain *d, unsigned int virq)

--=20
WBR, Volodymyr=

