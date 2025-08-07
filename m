Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F01B1D822
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 14:41:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073002.1435961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzwF-0000fy-5R; Thu, 07 Aug 2025 12:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073002.1435961; Thu, 07 Aug 2025 12:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujzwF-0000e9-25; Thu, 07 Aug 2025 12:41:43 +0000
Received: by outflank-mailman (input) for mailman id 1073002;
 Thu, 07 Aug 2025 12:41:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGIa=2T=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1ujzoa-0001m4-RF
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 12:33:48 +0000
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazlp170130006.outbound.protection.outlook.com
 [2a01:111:f403:c201::6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3410df8-738a-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 14:33:46 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by DU5PR03MB10563.eurprd03.prod.outlook.com (2603:10a6:10:51b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 12:33:34 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 12:33:34 +0000
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
X-Inumbo-ID: c3410df8-738a-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arCR8dLw7AtjeuRj45jbunxTLMn/K6qIYQawX72OP7gtpJGn+Cxltrf272u4UAXm6MeEJn9Mo5vW+xb5S7CklsmWc5+DPdFNAGyRHcmJcs5MyYJMMBduT31khEAGKGkgpEo7BqDYFopEJk2KhorwPP1Fz9EVXUrXF7gncypIt8EZ1NoYZs99SjJ/EgWO3hlJra98+rjUucHTu/tmd0Sqi45atiAPpHSm+E+Jm8xjNpBpHNHOhceVaR/41qdONXVXBToOr6PIAkZtgG6l8nPhN2OBsfsL9ocrOWWizDPLHGnpcu/TuZEZ8Nd5bbwbdHj/ABLjuEh9GEx6+XRELw9/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k24ZeMIWJBScosWjOnfAG1zBAOVNlmJrx4Zkv/BkUDw=;
 b=c8/JfhZycflhS/2vyXacw3eO/0ApV2nhl2zAQzjN1EAv4XSrg+LvVKiVq6pmvs22pMezXDptNlWRWrPFNxjKJIY18AZg12M69l7YC6MIr0PULYiGxN8kIMTlWHxHrUp+23uTYfBTHjDveNHwMc+c0jMC5FEJtwwPilTxtQ0CfhQ2fC3Nsg39o14SjabkEHulXjMNPTr6FTlo6KdrmCVumE2VxgfIGFMchZMSD/+sikjT4mEZpPeLFh8x0QjMaZmy97y2NSfKXA4UT8q7gJKhIeu/WCsNPyfRrXmU+BCIWxTVrOnguPGVnqRClNJ466O4zK6BUNJguH1hHz6gM1VR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k24ZeMIWJBScosWjOnfAG1zBAOVNlmJrx4Zkv/BkUDw=;
 b=Cc+CEPNKBhsKfbqOdBtioXJl0HKrB2j/y11XntDTtMHCQ5MXLaZWZvVN+0dTv0ou1R+xlPq4313wvPQ8g6nM57Orj4Yv5RFRLbI415bdLqsiEQHgtf8meolYrttWrSfWcDCK+7rPwhezqZghYf+Q+cpf6+ieWn+mOOd6Khs7Ld+yEWYlxz2OIe28oNRfcvTqfBVYnC78tuPt3lA/VdFyjGD1P1Vpmss/YfkR97IPhgT4HYInJT5O/T/2bXYNq1dbl9oX4M+2eFrWssJ3p3mZ4IV6cdXL29el7BaJFWRMuRey0+KYbuZI9g8+QmiZq/5hz/ABdi7cXbTxFK8PgH5RjA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 08/10] xen/arm: vgic: add resource management for extended
 SPIs
Thread-Topic: [PATCH v2 08/10] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcB5d8BuZ0dq8rx0Owht+h5hVtIg==
Date: Thu, 7 Aug 2025 12:33:33 +0000
Message-ID:
 <fde65754a60a8cc090bb212749ec2c10877c4943.1754568795.git.leonid_komarianskyi@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|DU5PR03MB10563:EE_
x-ms-office365-filtering-correlation-id: 437159ee-7e02-49a4-9a6a-08ddd5ae9fea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xUlsxo/L4T7DpFjv/1a4MOmLqBtIaBDhAPkJCzsATIVyPPQaU+Ya5L7Mf7?=
 =?iso-8859-1?Q?NxNuT1+qPDhDxurTiXybeDO3jnQ1AabFAhKzZr5E/y9SINvOYTmXMefnZk?=
 =?iso-8859-1?Q?jy1SBh9Xiz6B07OFTGPhelfrrN6O0WJK/wHhRc7fUCBkE3yu7IOKqBWmH5?=
 =?iso-8859-1?Q?NwCWLG1xAJJPl4AyCl/+C0KwPXg5hMVJk01j1IFM66jZ+o8+CzeVgUjnRV?=
 =?iso-8859-1?Q?RxBvP+1ecSG11QBy2jueX/ZM+Sgd2VZJ0XpMHjvzQC5HZm6O3+tK2cLTMP?=
 =?iso-8859-1?Q?WUmGQkcar6ZZt4Rc9gqorp/EtI39fA2faseR/WKmkB573/kI38k4Js3OJn?=
 =?iso-8859-1?Q?oKJvKpZj2CB78C8t3xBWrTv4bv7klYAp/Z/6Bdc5RAQcngzzf4u51NWxr2?=
 =?iso-8859-1?Q?e7kJ/r6P/EKZVC3wHstHM40jOWlHALB6wyY3gjCe2K1kLUuBKmVf1dn+dN?=
 =?iso-8859-1?Q?8JDI6yWsGvEcKUJpehFjLcWGAVxgq/h5apKUtlVWXEHZScEmsXN0uzoaZj?=
 =?iso-8859-1?Q?xrrpoZSrzImKf+/b6kbC/8lWCGOb239wQunnTnzSuVHy8x3dEn5HoDfH1k?=
 =?iso-8859-1?Q?5LyHet5PxJCaj55bZRJJzO34Q16Wy9/VlFM53iKNlbSLM28GwqM2FVOWvR?=
 =?iso-8859-1?Q?iiS9UNyZYx+jYDKJeRv9VkthZWjNgLL42KEx0wTIhgltXpuBnV5dSvTlZx?=
 =?iso-8859-1?Q?YWmFetv4Yv+mzXrwVAAcsbAxl+evh/c92mF/LZmTntUexBmQwfGDbpAHZg?=
 =?iso-8859-1?Q?VF+Jyd/zYmsBUcqKtvtizob56n1eGqxKaha0Xb4aQ4zckxZhit+0YuWeos?=
 =?iso-8859-1?Q?2ItjdIAIB3FFtnYBgxKf5o/oW818f1yqzqTd2B03bJKQsuQe2to7lIx96y?=
 =?iso-8859-1?Q?sxgLM+ueKZTnwOQ5NYrjzL+413GsdafbxNq33CcrOgJdlYD/O8q/GBJD4a?=
 =?iso-8859-1?Q?Gr/v5C0pC71dC7GLXQEooisgjWGLFxaAUJ8cEyL92JJpF7yb0MJTyjHZn5?=
 =?iso-8859-1?Q?ucDGxN18ZsVQRI6wwNZmkhqN2Bu/AX3Du/xdCGn9pBnFYb27gVlwiJM/Jz?=
 =?iso-8859-1?Q?eamFZX8wrRpEgny4Zj6zleViPuNbMCGxpVWZ3zhhHU2WU4ihxONT7P3zET?=
 =?iso-8859-1?Q?D+reoOlRu5zKvbWFaLq8P3q7jFGRLJSD7+hysTegTtk6NblCQRlu+thAU5?=
 =?iso-8859-1?Q?FLAuSlMWtjMJ1m/OIjRj7dIXUKN6NyF3+SlxOrGJBO4wh7ImUn7bajgrhh?=
 =?iso-8859-1?Q?0oXxpOwO7WmaAp3m7+R1H8MeYRx2UU/7CX4hZpAzI9q0G7+vS3fuxv/WlU?=
 =?iso-8859-1?Q?wRw1NTn7zBGH5C7Sb4zzw436q0lKEGVwvq6DG9owRpwTK7BNN4EJo9kZ0d?=
 =?iso-8859-1?Q?XrPClgitAr8jdlAQmsKAdwEf0MYt+Fvc1nOELk9+4xWOTv7DaUBfOaPYtI?=
 =?iso-8859-1?Q?wQqOcSejY1u9jLr6ipDKrwjeZNX6gTjVVlXRDVsnFh79GiPbfFb9barGZm?=
 =?iso-8859-1?Q?EtTR/ZeQcfe2p5KnJwugte40fFUqTj+xVIp1tjfQuhJA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?goTqzFf8pl6L+dqIdOiGJjr2GqjYMHTzN4Muw4hjfkTvDOPgW1bi4NgiPo?=
 =?iso-8859-1?Q?tpGUuof7EPW50jWyAYAwHoDnjsGXqUCd9vxCVdwtpQsgFFt7xubypFklyX?=
 =?iso-8859-1?Q?eWnzaJy5lEGjT2JvM4z7TG2nM/JizKv/EdBOiXACzRD2vISjZR7mFErpwJ?=
 =?iso-8859-1?Q?iB4p+QK7g9oJPJvKRAQglCIPHhbVkhFp1ODSsxtiEbNNMD4rGWnhq3ShFs?=
 =?iso-8859-1?Q?9T5nrCgPe6DxTZqIeCJ899KpMiByVe3lGC+US7MFsItYZxauLZGhZVgGkr?=
 =?iso-8859-1?Q?tAaZBt4aPep6FKOgaEPbI5UpPpkRQHkolJMAscD8aYlEgG0EiBrvucUoQK?=
 =?iso-8859-1?Q?pPI3NmbPN/A9yylWmJAk7TwzFqvoHsFj3cmnonDO+lNHh+uA1FQ+a88ial?=
 =?iso-8859-1?Q?ZBzfESVA0vmni6Nr/VmyqEISSFVSI+ZNd7HXQExhGr+/XAQjQN+yBxpo+f?=
 =?iso-8859-1?Q?iXyKIxgZVrE7XgDK2V9yd8Sf4VdyGAU2tmcBXdkgzUpsj88hFWVUnUOQv7?=
 =?iso-8859-1?Q?ghqeWzHEmtDINZtpGpeCRiEVMW9K/4mNYmovZtiRWuQShU5pluk38BT//R?=
 =?iso-8859-1?Q?IYopfyrV0VDUNywWshVhGrKjF9/VJNSsyN5FQNeTR80nvoZM1CPtNiAMAh?=
 =?iso-8859-1?Q?IlnK4mSrxSOR2/FtahBc22t1k03tKjoxGGXa0dlXA2n9Izi2uAeiIIWqAh?=
 =?iso-8859-1?Q?fYLbPgk8nI98AWKA3wSdbwW1UtTkI9CdX+yv8QHV8YCNmRm87KSE6rKqkA?=
 =?iso-8859-1?Q?zhnIqbW6a6JBC0m7KlXTmj5BDGE7XDfnE8+9i9lazKDPioIu4yKEtlOpbB?=
 =?iso-8859-1?Q?UBTdhmCmFkcmt91GTcuaPsTtktDspufPUenUJHlaLLW1cApVCNSLVVz74N?=
 =?iso-8859-1?Q?/SYsCak25aJf7FR52WU+v6p5RxEUEkUHnyH9N9Ua8HFxSGE8CdUFXVOnwN?=
 =?iso-8859-1?Q?1vXjH9klqFlvGxmzdyuyrc2lKnMMd9LH3FzZM7/aeYqmC62zEPuilFpqGW?=
 =?iso-8859-1?Q?mJlQKGIovULJbxIdrhXmrNuf+zIh9qwvulSAfFQlic07XZRI64IwDGl3G3?=
 =?iso-8859-1?Q?5DKfS4BEINSN3ZDtkyqTXkxQvCliGQ1xv0od1CDencsXkNWEomu59tjMnm?=
 =?iso-8859-1?Q?jKLfB3E8ZB5u+w9VcauAUZFlFIo+YIhlZcwJDPUdD+5pjjBuCvZS9q3CEM?=
 =?iso-8859-1?Q?ftt8edyHU00mWsTgsSK45uc58Gv4EuJY6kbl5FcIDQStvcp59vjaDCEG82?=
 =?iso-8859-1?Q?BDo7L33FtIqhVM1qJtz5jlWa3u74o4eg2lb+xkjekk+c87rRBVhCjzMmjr?=
 =?iso-8859-1?Q?s4cuyhQ80jC6sMIshgvIiDxOFv0A4JMor1FKpYAniSwEF5majJo0W/LNJK?=
 =?iso-8859-1?Q?c8AfEMXnrcbSo57Co6Xt8MLp8YQf1Z67rATioQek1z5OPuoKrYC2TfgJ1b?=
 =?iso-8859-1?Q?d9Pjw76v0AJeMgzfO1sNrzX6FLYcSeETAqOxTtVZOAf5teWJg7gG0XmBzG?=
 =?iso-8859-1?Q?KzBZ73rAVsD28OCalxxFtFifh3ZvUf7CE4XQGLIfzVyCdOhX5hzaFNAYGx?=
 =?iso-8859-1?Q?7X19xLE8PjwrI9AR7ck8EAjl4kv7BktEdpBqqdQxHu49B1ZibhubQsSfeR?=
 =?iso-8859-1?Q?wfaxGIGsJFVI3eDaQqdWiwMtQo4ZyK01LL8g/bn1hK1nvYgZ0LdlF6gWkK?=
 =?iso-8859-1?Q?yOH8C2DIMS58SyoNOUc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 437159ee-7e02-49a4-9a6a-08ddd5ae9fea
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 12:33:33.0440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jvVnaQ/7caqQnPedEtPEuCdMqNdb6eTCYZ9t8C+EwDXHDTNz6PhfDf7xisnaxZzRZil8r9J4pP3DgGnQyPJiXI56S1N794kW9j5QR8JI62A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR03MB10563

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
 xen/arch/arm/include/asm/vgic.h |  18 ++++
 xen/arch/arm/vgic.c             | 145 ++++++++++++++++++++++++++++++++
 2 files changed, 163 insertions(+)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 45201f4ca5..9fa4523018 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -146,6 +146,10 @@ struct vgic_dist {
     int nr_spis; /* Number of SPIs */
     unsigned long *allocated_irqs; /* bitmap of IRQs allocated */
     struct vgic_irq_rank *shared_irqs;
+#ifdef CONFIG_GICV3_ESPI
+    struct vgic_irq_rank *ext_shared_irqs;
+    int nr_espis; /* Number of extended SPIs */
+#endif
     /*
      * SPIs are domain global, SGIs and PPIs are per-VCPU and stored in
      * struct arch_vcpu.
@@ -243,6 +247,14 @@ struct vgic_ops {
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
@@ -302,6 +314,12 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct v=
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
index 48fbaf56fb..1a6c765af9 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -27,9 +27,26 @@
=20
 bool vgic_is_valid_irq(struct domain *d, unsigned int virq)
 {
+#ifdef CONFIG_GICV3_ESPI
+    if ( virq >=3D ESPI_BASE_INTID && virq < ESPI_IDX2INTID(d->arch.vgic.n=
r_espis) )
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
+    return ( rank >=3D EXT_RANK_MIN && EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_=
EXT_RANKS(d) );
+}
+#endif
+
 static inline struct vgic_irq_rank *vgic_get_rank(struct vcpu *v,
                                                   unsigned int rank)
 {
@@ -37,6 +54,10 @@ static inline struct vgic_irq_rank *vgic_get_rank(struct=
 vcpu *v,
         return v->arch.vgic.private_irqs;
     else if ( rank <=3D DOMAIN_NR_RANKS(v->domain) )
         return &v->domain->arch.vgic.shared_irqs[rank - 1];
+#ifdef CONFIG_GICV3_ESPI
+    else if ( is_valid_espi_rank(v->domain, rank) )
+        return &v->domain->arch.vgic.ext_shared_irqs[EXT_RANK_NUM2IDX(rank=
)];
+#endif
     else
         return NULL;
 }
@@ -53,6 +74,16 @@ struct vgic_irq_rank *vgic_rank_offset(struct vcpu *v, u=
nsigned int b,
     return vgic_get_rank(v, rank);
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
+                                           unsigned int n, unsigned int s)
+{
+    unsigned int rank =3D REG_RANK_NR(b, (n >> s));
+
+    return vgic_get_rank(v, rank + EXT_RANK_MIN);
+}
+#endif
+
 struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int irq)
 {
     unsigned int rank =3D irq / 32;
@@ -117,6 +148,29 @@ int domain_vgic_register(struct domain *d, unsigned in=
t *mmio_count)
     return 0;
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+static int init_vgic_espi(struct domain *d)
+{
+    int i;
+
+    if ( d->arch.vgic.nr_espis =3D=3D 0 )
+        return 0;
+
+    d->arch.vgic.ext_shared_irqs =3D
+        xzalloc_array(struct vgic_irq_rank, DOMAIN_NR_EXT_RANKS(d));
+    if ( d->arch.vgic.ext_shared_irqs =3D=3D NULL )
+        return -ENOMEM;
+
+    for ( i =3D 0; i < d->arch.vgic.nr_espis; i++ )
+        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i + d->arch.vgic.=
nr_spis], ESPI_IDX2INTID(i));
+
+    for ( i =3D 0; i < DOMAIN_NR_EXT_RANKS(d); i++ )
+        vgic_rank_init(&d->arch.vgic.ext_shared_irqs[i], i, 0);
+
+    return 0;
+}
+#endif
+
 int domain_vgic_init(struct domain *d, unsigned int nr_spis)
 {
     int i;
@@ -131,6 +185,30 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
      */
     nr_spis =3D ROUNDUP(nr_spis, 32);
=20
+#ifdef CONFIG_GICV3_ESPI
+    if ( nr_spis > ESPI_MAX_INTID )
+        return -EINVAL;
+
+    if ( is_espi(nr_spis) )
+    {
+        /*
+         * During domain creation, the toolstack specifies the maximum INT=
ID,
+         * which is defined in the domain config subtracted by 32. To comp=
ute the
+         * actual number of eSPI that will be usable for, add back 32.
+         */
+        d->arch.vgic.nr_espis =3D min(nr_spis - ESPI_BASE_INTID + 32, 1024=
U);
+        /* Verify if GIC HW can handle provided INTID */
+        if ( d->arch.vgic.nr_espis > gic_number_espis() )
+            return -EINVAL;
+        /* Set the maximum available number for defult SPI to pass the nex=
t check */
+        nr_spis =3D VGIC_DEF_NR_SPIS;
+    } else
+    {
+        /* Domain will use the regular SPI range */
+        d->arch.vgic.nr_espis =3D 0;
+    }
+#endif
+
     /* Limit the number of virtual SPIs supported to (1020 - 32) =3D 988  =
*/
     if ( nr_spis > (1020 - NR_LOCAL_IRQS) )
         return -EINVAL;
@@ -145,7 +223,12 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
_spis)
         return -ENOMEM;
=20
     d->arch.vgic.pending_irqs =3D
+#ifdef CONFIG_GICV3_ESPI
+        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis +
+                      d->arch.vgic.nr_espis);
+#else
         xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
+#endif
     if ( d->arch.vgic.pending_irqs =3D=3D NULL )
         return -ENOMEM;
=20
@@ -156,12 +239,23 @@ int domain_vgic_init(struct domain *d, unsigned int n=
r_spis)
     for ( i =3D 0; i < DOMAIN_NR_RANKS(d); i++ )
         vgic_rank_init(&d->arch.vgic.shared_irqs[i], i + 1, 0);
=20
+#ifdef CONFIG_GICV3_ESPI
+    ret =3D init_vgic_espi(d);
+    if ( ret )
+        return ret;
+#endif
+
     ret =3D d->arch.vgic.handler->domain_init(d);
     if ( ret )
         return ret;
=20
     d->arch.vgic.allocated_irqs =3D
+#ifdef CONFIG_GICV3_ESPI
+        xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d) +
+                      d->arch.vgic.nr_espis));
+#else
         xzalloc_array(unsigned long, BITS_TO_LONGS(vgic_num_irqs(d)));
+#endif
     if ( !d->arch.vgic.allocated_irqs )
         return -ENOMEM;
=20
@@ -195,9 +289,27 @@ void domain_vgic_free(struct domain *d)
         }
     }
=20
+#ifdef CONFIG_GICV3_ESPI
+    for ( i =3D 0; i < (d->arch.vgic.nr_espis); i++ )
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
@@ -331,6 +443,17 @@ void arch_move_irqs(struct vcpu *v)
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
             irq_set_affinity(p->desc, cpu_mask);
     }
+
+#ifdef CONFIG_GICV3_ESPI
+    for ( i =3D ESPI_BASE_INTID; i < (d)->arch.vgic.nr_espis; i++ )
+    {
+        v_target =3D vgic_get_target_vcpu(v, i);
+        p =3D irq_to_pending(v_target, i);
+
+        if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
+            irq_set_affinity(p->desc, cpu_mask);
+    }
+#endif
 }
=20
 void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
@@ -538,6 +661,10 @@ struct pending_irq *irq_to_pending(struct vcpu *v, uns=
igned int irq)
         n =3D &v->arch.vgic.pending_irqs[irq];
     else if ( is_lpi(irq) )
         n =3D v->domain->arch.vgic.handler->lpi_to_pending(v->domain, irq)=
;
+#ifdef CONFIG_GICV3_ESPI
+    else if ( is_espi(irq) )
+        n =3D &v->domain->arch.vgic.pending_irqs[ESPI_INTID2IDX(irq) + v->=
domain->arch.vgic.nr_spis];
+#endif
     else
         n =3D &v->domain->arch.vgic.pending_irqs[irq - 32];
     return n;
@@ -547,6 +674,14 @@ struct pending_irq *spi_to_pending(struct domain *d, u=
nsigned int irq)
 {
     ASSERT(irq >=3D NR_LOCAL_IRQS);
=20
+#ifdef CONFIG_GICV3_ESPI
+    if ( is_espi(irq) )
+    {
+        irq =3D ESPI_INTID2IDX(irq) + d->arch.vgic.nr_spis;
+        return &d->arch.vgic.pending_irqs[irq];
+    }
+#endif
+
     return &d->arch.vgic.pending_irqs[irq - 32];
 }
=20
@@ -668,6 +803,11 @@ bool vgic_reserve_virq(struct domain *d, unsigned int =
virq)
     if ( !vgic_is_valid_irq(d, virq) )
         return false;
=20
+#ifdef CONFIG_GICV3_ESPI
+    if ( is_espi(virq) )
+        return !test_and_set_bit(ESPI_INTID2IDX(virq) + vgic_num_irqs(d), =
d->arch.vgic.allocated_irqs);
+#endif
+
     return !test_and_set_bit(virq, d->arch.vgic.allocated_irqs);
 }
=20
@@ -686,6 +826,11 @@ int vgic_allocate_virq(struct domain *d, bool spi)
     {
         first =3D 32;
         end =3D vgic_num_irqs(d);
+#ifdef CONFIG_GICV3_ESPI
+        /* Take into account extended SPI range */
+        end +=3D d->arch.vgic.nr_espis;
+#endif
+
     }
=20
     /*
--=20
2.34.1

