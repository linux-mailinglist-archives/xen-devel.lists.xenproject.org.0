Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BA3B38EB9
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 00:50:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097075.1451539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urOxH-0008Hr-U2; Wed, 27 Aug 2025 22:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097075.1451539; Wed, 27 Aug 2025 22:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urOxH-0008FF-RD; Wed, 27 Aug 2025 22:49:23 +0000
Received: by outflank-mailman (input) for mailman id 1097075;
 Wed, 27 Aug 2025 22:49:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QSw+=3H=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1urOxG-0008F9-Be
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 22:49:22 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 114d6307-8398-11f0-ae26-e363de0e7a9e;
 Thu, 28 Aug 2025 00:49:20 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AS8PR03MB7554.eurprd03.prod.outlook.com
 (2603:10a6:20b:348::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Wed, 27 Aug
 2025 22:49:16 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9073.016; Wed, 27 Aug 2025
 22:49:16 +0000
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
X-Inumbo-ID: 114d6307-8398-11f0-ae26-e363de0e7a9e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLJnDpEPcfmSW7pdjRIfpb2kiOKqt+q/n4AHKCxrzbrsBOCBduUdmmJOlR3xUeByhv8A/zhBJFDVgd3KU3IEhHGpfDjcLHjqSW9+7vo14RYbdKI7K8VOz9+vyPiQwZHOTktK9dFufJpahhsksyste59HhUXebs2o0AguqD+vIgNRUyj3wMut8cTG6mK6sHe7hF2YfDiobUI7XCK/l3vIjvDKwOBwKvcdlrTEqrdoXdGDavAWBJhdFmwjAcsvvvhA+NEKZcn3p34vce2XYxf295w3I9p7wmCnjQDRgt7AzUViGk/l4lkpYvHJl8cV6ToSFM+CWMpoUaSu2+esUFblyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DWxrr77tRoMk+EJXw30Ji2cuku41C+9iowVH88zxY2Y=;
 b=w7d9DSxnfKilkCJt5aXqGX3kfvFRkNfhtXSINRlXXLNwsD32MSfvka0Nd+Tz25XDjZU1M2OYGX684vYbPYcZ9j0q3A1Rgf7BHs3G3UjS+NeJUC9kj+FacxSXxHziD5E77ITQw9bGh+W4dnniRjdKkpvafWqaDWl3D0am5M+sWsM/bwIYUMBGub9FzDkRYlhXJqnO65croyC4LsvytJnSN+gatyVLy91IvFUAaAGzO26p000csRQAOvWXuYoDfnVJ50EoONqcacV3s4ODnt3o37rEVQbNkb/B+bpcQHDf8rwIALPPsBkC9tkaoq+hiiFNFCzkiCygrPpZunC8N4t4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWxrr77tRoMk+EJXw30Ji2cuku41C+9iowVH88zxY2Y=;
 b=YYa8W9ir7GJm8ln2X9vXh4i2nhfjpbvCFKgiA6SH4sS+BI52aZcgkij17ElwrDRo2PCECxFuDm5UigzsI7bKAknZNdFJkK4aejzdak3SmmV1AcJqn1pHSuluPTSUfSnIXel6CpWdwyNijS2QyB8tssySS+MTMbK5yXpIO6BIEBUt2vtUQLCdBrruBRgtKZiMUJRI8KO5jShBiOFNHPhjeo1wdCQszbcWfnWcVuQoGrdxS4nZxVPxeJSdLOfgy9PSj9Q6E17F0ji38OiQJL7/9JeznQgAeM2yniWCFoWu8DrQd57QKfhgHIHvxOrUNkM7sPZ/kr7fNU/+vRFNVfnRTA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"olekstysh@gmail.com" <olekstysh@gmail.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v4 03/12] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Topic: [PATCH v4 03/12] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcF3/Hllj5Y0qHEkeemv3U6Hra1A==
Date: Wed, 27 Aug 2025 22:49:16 +0000
Message-ID: <87o6s01itx.fsf@epam.com>
References: <cover.1756317702.git.leonid_komarianskyi@epam.com>
	<65b148aea56b1a35fa061b0d8284584da97153a9.1756317702.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <65b148aea56b1a35fa061b0d8284584da97153a9.1756317702.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Wed, 27 Aug 2025 18:24:08 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AS8PR03MB7554:EE_
x-ms-office365-filtering-correlation-id: cb6f7218-f453-48c4-fedb-08dde5bbf389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?EPSqEAtwElG5tipEiU7U/oGa5OhcIT9RtxdYzZ5CBusD6xnFruTPIqlcKV?=
 =?iso-8859-1?Q?HIdtuLlJWJIw1VWWS6BUVGUyFlIM0HWZ2FycSfMSClanv5NITxWzO1ZvxK?=
 =?iso-8859-1?Q?GW4ClvI2RM9iHNb6FrQ1H0lYOh/prYMDZHJQ1SCVXbPbBhtGBgeXO4JLD7?=
 =?iso-8859-1?Q?QulJIhDv3sTbyjUZwlzyKmTKQksfFaMmlZce2bMhUpTfay0tEYowD9lLIu?=
 =?iso-8859-1?Q?8d1GpVY5zSKp5Hk/cPKeFCwIVogf62Bce1WhJPa7BkGudxMGGP7eNT40tk?=
 =?iso-8859-1?Q?SMQ/Sya2tYuDn+VawSrpE80fFec6rYX5wIdrmuxtX6T0hY7ikK02rHO24y?=
 =?iso-8859-1?Q?KwFBeMIjG00HBuqwFAJuXtl3ig+/VSLEqiNZZM0vx1ETNhqMDst9u8DrCv?=
 =?iso-8859-1?Q?3n7YOLWeuwx3wMkuheUpS4U1rWxAmjrC20gfbKmv3pp8eQ8NXcWMKhEJoG?=
 =?iso-8859-1?Q?3iwug3nuBl4pQCISi52t8JRqUcK52BNDHFOnnRfFedsvBzJuQ4LHyyr6z2?=
 =?iso-8859-1?Q?Jm0s8Je2O4jRUyZdB5CuVHsDXcEE8A9ZybElSrcjcwbhGRyGs6ZDt0GoaP?=
 =?iso-8859-1?Q?AW76aQnrWt3XG6CSYvjUQfaWWZQft2ZTRT+qRcf7100aAXRnryWrUmGfQf?=
 =?iso-8859-1?Q?ha41s7rLvIYLuU8YUtI8/jzChuEdsVolI9dPO+Gx7i2AkHBFjPQTCgzqtW?=
 =?iso-8859-1?Q?BSSwYT57BWHpRKH/0jz9TK7N2AFQywGKBfLIoWYigC16VRJxDOkwdygcel?=
 =?iso-8859-1?Q?H0xaMOLey/hC77WsyBTcVq9IPl2gryUrMeUdiaLRTd0+V85F6KGzLukVXx?=
 =?iso-8859-1?Q?32Oa5yfybo2WGzKyR4G2tT7gqIGeR1GHWjB9UIZwajsN6lSrs6CaCgl6vJ?=
 =?iso-8859-1?Q?xjHbn98RLXAzuEfLk2kjCVZ7KncdrpjCyLsNJo3aAzqALISj0/DHwW1bkJ?=
 =?iso-8859-1?Q?g5UNN50KeG7KJ90rGwwc+DcergL5/vA8yv7KBh70IqK+Qh6bY60MGw/DEJ?=
 =?iso-8859-1?Q?xLvutRaIOPls5Tx0K2rOzKRaXsXGrPB5OT1pFYLDHrQx5wEHFEYaGw9Nbf?=
 =?iso-8859-1?Q?4xDvsQ4wHejqsgSXD2kB71WfO0a+9tEysYl9HbDUZ5kR/3Cktl/ZwoBwbP?=
 =?iso-8859-1?Q?SPDc/OwIS7btB+3TaZFzkn4beCSxcjvmzFKGBWIVrPOUUwNr5BBzdenr9e?=
 =?iso-8859-1?Q?6VSFtZ0HGGRj06TiBzThBD5eMR4IHGr8fLcRjI8j2Wb6kjc7d+t+jP6PoO?=
 =?iso-8859-1?Q?u2nU00YNj5iUVxXXwwk9ivi+M+WvjlCtC+aDxLlxENFYopVJY1ucQ4iDzy?=
 =?iso-8859-1?Q?/WuyPiW/upfaxGG1p1hSCvqBde1Sf+x1WTz6YBkUO/MywAWXBPbTj31BOI?=
 =?iso-8859-1?Q?BJ58b5VclkO/10Fz6r9g9mEIwV1dbv94wqQuP66RJjf557RsUhnvA+mBTS?=
 =?iso-8859-1?Q?y5hmbOIwUKA64j2Us0okxHRmTaP+/b6yQylOnDX1yrQzRKCkOFQxe0lcvB?=
 =?iso-8859-1?Q?fe+2saxzW34RofE3s8xSJJFz4PX48p2UmBos0Dmkv1sQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?l/Y4YCevVGtlG1PdjyrFLH2rr3NDzpMrfEiSHO118c7upZJwOb6szOPsKV?=
 =?iso-8859-1?Q?3U2W/+K8+Wr114Zw8jUqqnn9VN6dze/vaJTCTP+U180JUuVfDd1xN6Ya5K?=
 =?iso-8859-1?Q?kQAKEot3UvGyiM4tnm+XzNz/8EXnps/lRc4eVPUgJcf0N4DgCiTCxqisO8?=
 =?iso-8859-1?Q?wBcYjlDs7oepRZqbW/pEGHLRebvO6gepnXEIjDxr6n7axtfL8dInfy0rVG?=
 =?iso-8859-1?Q?uRie7OnTs1Eacem6O4wBXXoUFCKKTV3xWrmx4pBGeui6Jrc7eX6503F1eL?=
 =?iso-8859-1?Q?zl3kjYMrzGXvvb3rBhr5mkaFLbra3BMylDQsUs/JYNvQgw1PygP3I65GFG?=
 =?iso-8859-1?Q?k/4XGTB7dWQYRYUU30YCnSVwcGeAfFADgyh+KiWVqW/VoBUmDzv13jqIQi?=
 =?iso-8859-1?Q?Z/N7dN6DJkbg71+5qdPzn3i19rc3WWc4DPl1f30/50fJZoOEs+7iFrNjFz?=
 =?iso-8859-1?Q?eZEreMUCgdGASBrFS8clM0d2Di0Ganb4xnJjsMXFxQHzqni81vcz27h9cK?=
 =?iso-8859-1?Q?EutmoEK1kzPY5fupmXUpbGaAwDerI8u6z46yaCbSJ4Ms2NNuVXxrbIUSSh?=
 =?iso-8859-1?Q?vNCbK2Gf72so7eloZ0F/vAC7bvhr191x8K4Irv8geMDyCnYNu5mZzJCghI?=
 =?iso-8859-1?Q?CSNVhqFYz9eStRrQgeAkuywoHLC/QSnvGJ1If/O4VmH9c/FDTGSXLowZGa?=
 =?iso-8859-1?Q?aRBoCvzDJb2LipL6bSvXA3hklC0TkFj3yish2ugB/FSJ+khWRiTh0DWCI2?=
 =?iso-8859-1?Q?3vyNGpn4D9cz8f+hsOcX7vVW6WB9jlLnCmMLQVk+O//gy3zUIp5hjLsCy1?=
 =?iso-8859-1?Q?xB8PZI7wEBIhuejW5ROc7UhEHvwnUJuDWLbW1OaSwBoWBZXZMELkELMWNx?=
 =?iso-8859-1?Q?veOeQiI+tqRLCKlAZzl2jXodI5kOUZQV7MrJrUnLN8yWJ29IMD97A8RVq/?=
 =?iso-8859-1?Q?pCPW0XnQnmjc3NjkWQgku+tMNAcA0xFNFL5A8NfNfkcn069DtA3n4Su3UI?=
 =?iso-8859-1?Q?wM1OmUE2hHDLTiujEzEJb/Sf3LTgLhyYH4g3vyt2imzSEkpquAFUcNy2iK?=
 =?iso-8859-1?Q?K07kC8VkiKVf5UytOHi+IbqtZsoa9RMJajhVN9vup25TeinmPo/gA0KSPo?=
 =?iso-8859-1?Q?k5gVJB1Atw1yLwSsWMJiTPZmDRUCsMziNUOeY65ePw545L1YRK3dzWFY7v?=
 =?iso-8859-1?Q?ECNvQwVuIjRl/egJi1b8FwFx0IBtdQ3O8fCJJbOXrlPrrsT8J0++/0LEQX?=
 =?iso-8859-1?Q?AwzVF5QAlIbRbL31Ceq7/n8egBkI/BfkXc39K87YmZkx3JKuVwPnvha1IF?=
 =?iso-8859-1?Q?Hb8oYK1FekoMnnSeXTyEMLp8G7BT0mVL9devGZUNRSrx8gIKIoFkHDzfQL?=
 =?iso-8859-1?Q?//cwpRoRoqCMMEyapf2w2uPzP08Opar/biltA1LhH64ANobh7kn6QK3RYd?=
 =?iso-8859-1?Q?YbA8IbzaEPbF0UMOaZ4G9SPIfBHkA1raYVe0U5iSYIs7aoYcYGF+Cz2VM8?=
 =?iso-8859-1?Q?AuCnhAzGg1dp155Hz+wZ5FpiipjcSh/9KWa4H5GkkHWvJQ9+lAaJKoQ+eP?=
 =?iso-8859-1?Q?FXMNu6hUBzDf9SqtRpGAH9JVKD9L1SM/1wE3RddgNsC9CzRTeGZagUL0FV?=
 =?iso-8859-1?Q?Tl/uZCa+mnIOVz+m93RTed2D1LSgh3df8d9aEhzO4SIJWei57PmnPNTQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb6f7218-f453-48c4-fedb-08dde5bbf389
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 22:49:16.3947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gPEkBAYpdxM3PL7xZ94Hq66MwnrghQ7Vvq1t0xP2300CrVDgVnetFjO3zjLF8cyyy/mxH9pxPub2UVXt8f4KFS9txrVo6BN/212H7K5huK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7554

Hi Leonid,

Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> Introduced two new helper functions for vGIC: vgic_is_valid_line and
> vgic_is_spi. The functions are similar to the newly introduced
> gic_is_valid_line and gic_is_spi, but they verify whether a vIRQ
> is available for a specific domain, while GIC-specific functions
> validate INTIDs for the real GIC hardware. For example, the GIC may
> support all 992 SPI lines, but the domain may use only some part of them
> (e.g., 640), depending on the highest IRQ number defined in the domain
> configuration. Therefore, for vGIC-related code and checks, the
> appropriate functions should be used. Also, updated the appropriate
> checks to use these new helper functions.
>
> The purpose of introducing new helper functions for vGIC is essentially
> the same as for GIC: to avoid potential confusion with GIC-related
> checks and to consolidate similar code into separate functions, which
> can be more easily extended by additional conditions, e.g., when
> implementing extended SPI interrupts.
>
> Only the validation change in vgic_inject_irq may affect existing
> functionality, as it currently checks whether the vIRQ is less than or
> equal to vgic_num_irqs. Since IRQ indexes start from 0 (where 32 is the
> first SPI), the check should behave consistently with similar logic in
> other places and should check if the vIRQ number is less than
> vgic_num_irqs. The remaining changes, which replace open-coded checks
> with the use of these new helper functions, do not introduce any
> functional changes, as the helper functions follow the current vIRQ
> index verification logic.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

>
> ---
> Changes in V4:
> - removed redundant parentheses
>
> Changes in V3:
> - renamed vgic_is_valid_irq to vgic_is_valid_line and vgic_is_shared_irq
>   to vgic_is_spi
> - added vgic_is_valid_line implementation for new-vgic, because
>   vgic_is_valid_line is called from generic code. It is necessary to fix
>   the build for new-vgic.
> - updated commit message
>
> Changes in V2:
> - introduced this patch
> ---
>  xen/arch/arm/gic.c              |  3 +--
>  xen/arch/arm/include/asm/vgic.h |  7 +++++++
>  xen/arch/arm/irq.c              |  4 ++--
>  xen/arch/arm/vgic.c             | 10 ++++++++--
>  xen/arch/arm/vgic/vgic.c        |  5 +++++
>  5 files changed, 23 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 9220eef6ea..b88237ccda 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -133,8 +133,7 @@ int gic_route_irq_to_guest(struct domain *d, unsigned=
 int virq,
> =20
>      ASSERT(spin_is_locked(&desc->lock));
>      /* Caller has already checked that the IRQ is an SPI */
> -    ASSERT(virq >=3D 32);
> -    ASSERT(virq < vgic_num_irqs(d));
> +    ASSERT(vgic_is_spi(d, virq));
>      ASSERT(!is_lpi(virq));
> =20
>      ret =3D vgic_connect_hw_irq(d, NULL, virq, desc, true);
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 35c0c6a8b0..3e7cbbb196 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -335,6 +335,13 @@ extern void vgic_check_inflight_irqs_pending(struct =
vcpu *v,
>  /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. =
*/
>  #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
> =20
> +extern bool vgic_is_valid_line(struct domain *d, unsigned int virq);
> +
> +static inline bool vgic_is_spi(struct domain *d, unsigned int virq)
> +{
> +    return virq >=3D NR_LOCAL_IRQS && vgic_is_valid_line(d, virq);
> +}
> +
>  /*
>   * Allocate a guest VIRQ
>   *  - spi =3D=3D 0 =3D> allocate a PPI. It will be the same on every vCP=
U
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 7dd5a2a453..b8eccfc924 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -442,7 +442,7 @@ int route_irq_to_guest(struct domain *d, unsigned int=
 virq,
>      unsigned long flags;
>      int retval =3D 0;
> =20
> -    if ( virq >=3D vgic_num_irqs(d) )
> +    if ( !vgic_is_valid_line(d, virq) )
>      {
>          printk(XENLOG_G_ERR
>                 "the vIRQ number %u is too high for domain %u (max =3D %u=
)\n",
> @@ -560,7 +560,7 @@ int release_guest_irq(struct domain *d, unsigned int =
virq)
>      int ret;
> =20
>      /* Only SPIs are supported */
> -    if ( virq < NR_LOCAL_IRQS || virq >=3D vgic_num_irqs(d) )
> +    if ( !vgic_is_spi(d, virq) )
>          return -EINVAL;
> =20
>      desc =3D vgic_get_hw_irq_desc(d, NULL, virq);
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index c563ba93af..2bbf4d99aa 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -24,6 +24,12 @@
>  #include <asm/gic.h>
>  #include <asm/vgic.h>
> =20
> +
> +bool vgic_is_valid_line(struct domain *d, unsigned int virq)
> +{
> +    return virq < vgic_num_irqs(d);
> +}
> +
>  static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
>                                                    unsigned int rank)
>  {
> @@ -582,7 +588,7 @@ void vgic_inject_irq(struct domain *d, struct vcpu *v=
, unsigned int virq,
>      if ( !v )
>      {
>          /* The IRQ needs to be an SPI if no vCPU is specified. */
> -        ASSERT(virq >=3D 32 && virq <=3D vgic_num_irqs(d));
> +        ASSERT(vgic_is_spi(d, virq));
> =20
>          v =3D vgic_get_target_vcpu(d->vcpu[0], virq);
>      };
> @@ -659,7 +665,7 @@ bool vgic_emulate(struct cpu_user_regs *regs, union h=
sr hsr)
> =20
>  bool vgic_reserve_virq(struct domain *d, unsigned int virq)
>  {
> -    if ( virq >=3D vgic_num_irqs(d) )
> +    if ( !vgic_is_valid_line(d, virq) )
>          return false;
> =20
>      return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
> diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
> index 6cabd0496d..b2c0e1873a 100644
> --- a/xen/arch/arm/vgic/vgic.c
> +++ b/xen/arch/arm/vgic/vgic.c
> @@ -718,6 +718,11 @@ bool vgic_reserve_virq(struct domain *d, unsigned in=
t virq)
>      return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
>  }
> =20
> +bool vgic_is_valid_line(struct domain *d, unsigned int virq)
> +{
> +    return virq < vgic_num_irqs(d);
> +}
> +
>  int vgic_allocate_virq(struct domain *d, bool spi)
>  {
>      int first, end;

--=20
WBR, Volodymyr=

