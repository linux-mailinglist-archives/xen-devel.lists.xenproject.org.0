Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 686DCB30062
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 18:47:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089098.1446793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up8R9-0000Nv-Hk; Thu, 21 Aug 2025 16:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089098.1446793; Thu, 21 Aug 2025 16:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up8R9-0000MB-EM; Thu, 21 Aug 2025 16:46:51 +0000
Received: by outflank-mailman (input) for mailman id 1089098;
 Thu, 21 Aug 2025 16:46:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6kfR=3B=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1up8R8-0000Iq-MZ
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 16:46:50 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6eea6d8d-7eae-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 18:46:50 +0200 (CEST)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DB4PR03MB9482.eurprd03.prod.outlook.com
 (2603:10a6:10:3f6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 16:46:47 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%5]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 16:46:47 +0000
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
X-Inumbo-ID: 6eea6d8d-7eae-11f0-a32b-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyOO4oCghPgRH49fLBXI5cIMlLNUNV8wHVtiqD8xVPyNKQF95nOTIz7MKMyYrKb/jFLG2fC3Oy25Dl8BImkrd4ejALM5UBceSzpij3H/nAtZ46MVmG3ANpczAE2qzoYPCfQL16g4UrGRRH8n8aecahoydWy/3FwZBpt+xDMTJNmKk38X2uwl27Z/Io4xt1HuTCz59TQIn4jNUNaDMSm3XlsJtt8Xk+C5f1lJdYcQ7bIGjl7etx01MFMPbbsSR+EmwquXwtFm06iFPPqSMnVP8mw/lbWQSya0rT+/9cJSL1j7wZGvudX0r8kYRAM6V5g+CC6R0x9YxfAT7unwkMlAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPzJv5BJ0T7G0j36da1Mrvc1hscTXiem2aNhdKiK+NI=;
 b=dbrop0lUuw/B0LX4qfXMdk7Gq3hQmeHjEhajAN3gDXw9m6nT4H0NP/gQg+kR8OrpWXVFKKau61lxpGrfyOkHSkkZpTsrE1xGWYLl4SybUH4p5gVr8hp+QsWfEfb0E3o+xLOpU+zdqYrupTZgALjQBA5rMPNHUbqQTvPJaOAe7QyhOziy8tZbBZ84MWpqomNFc3VlT2zarvTKLun3ba+2N8WjHyXx80CDCjz87CNAQ2WUsm6XHzjtfhEc9U6Nbr+lFRXGDvFUhACtrjv3/kZR5/0v3SM1exjtziSn+a+5XDkHqjzXgre3QFOzoPQmcMReT0szqMcrWm44GfjT3OOCfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPzJv5BJ0T7G0j36da1Mrvc1hscTXiem2aNhdKiK+NI=;
 b=JnUbRaIfziAO7eezuuSN/a3CNjO7kxwxy+Q7GFwvTsUUanPGhq+ekV3YISg2jOtYnvulw230bzDSvuO9D8C+GsAjntzPbYegIuQCRRezxmA+s77MpGz9RgDTVXMT6dURLKjLoL9ivn4xhQZ63+rZHOWr0dfQPXQTUrjD3dFs4FHj+y4pA78aet0bM2NqFDPWSsFmGt9ly6cGAIizIN+xGSnYKUGA4Uq1ZLILfMHXDHLrEYhxX6W0iGl12W1Ah9iG+mVTu8nJNaSHK2521qzT7q4yXEpx0eFuwjpa6pYMiJrVR4fAGQYvYYYUeKekCBmXXsKbX7PAFAWm8FXHNl8jLQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
Thread-Topic: [PATCH v2 09/10] xen/arm: domain_build: adjust Dom0 IRQ handling
 to support eSPIs
Thread-Index: AQHcB5d/fLeRBY0aQE6DC46DWY0Ygw==
Date: Thu, 21 Aug 2025 16:46:47 +0000
Message-ID: <87o6s8d3m1.fsf@epam.com>
References:
 <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
	<abba685916e6637eedbd831352bed2e968eeb7dc.1754568795.git.leonid_komarianskyi@epam.com>
In-Reply-To:
 <abba685916e6637eedbd831352bed2e968eeb7dc.1754568795.git.leonid_komarianskyi@epam.com>
	(Leonid Komarianskyi's message of "Thu, 7 Aug 2025 12:33:34 +0000")
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DB4PR03MB9482:EE_
x-ms-office365-filtering-correlation-id: 6547d4e2-0236-4c0a-04fd-08dde0d251d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|42112799006|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?cGkB2013VCvO/6pqIv3hMXJOdtyq81y49U46prHpG4TEXdT24PS/xgrxmd?=
 =?iso-8859-1?Q?nJVvTBpe1kttaqpa5Jw6S3Wu6FVrBiVmwyGsMtVSI914MPnZDIxK3dErRn?=
 =?iso-8859-1?Q?QHYAWipzfCS41lubeXiu9Shg4lrkmys19I3dX+bBxZ46nERZr7YK4qAE5I?=
 =?iso-8859-1?Q?AacGxPyHLU49cECkmtjhC8gc8B8CZ0jLAL5XRvpqkCd8/28S5INL1Viv/G?=
 =?iso-8859-1?Q?t+EzVt7jX8bkyeDq24V1bJk+wZNko+xF1lIh08uu6F0JBut0V2OMi5aHzx?=
 =?iso-8859-1?Q?pWFu0CXnGX97cT+dZ2YlwvsEgtDO7WXWa//UV8/jgfS+gmoaJdqd2VLLE4?=
 =?iso-8859-1?Q?E6DDm2gT7UcdQsAkwpxEIvHXW1k/tnuudPt8XV8Px5LSaEHH8zKhwCJ3PU?=
 =?iso-8859-1?Q?dPWUG+AUuzob4gFFKXxqZ7H8VySKKVSLUtmNeCz502lVKIx2woEz89GRfX?=
 =?iso-8859-1?Q?1JmJBd/Am5dChz9x0HbLDJ70OcdCUPE05qT/BDJjhHk3RfEJlT3feN36N/?=
 =?iso-8859-1?Q?Uc0uZHe/g6bZANBKAAN6o4UKoOrLua7rwVXarb01Yflh4SdbQ5C9p30zIN?=
 =?iso-8859-1?Q?fxTYzfV0TxOqhMtLgoX4aI5XwyliuqTJoyAGisOHxxUPKmd0i751trIf65?=
 =?iso-8859-1?Q?PqkUPFroO0vuPouFQujLOWHk4WYI8hlDLVojHmIIryEgTzsoRxZVhvqgEQ?=
 =?iso-8859-1?Q?+xPJslZWf42Xqr4kqStTSnhIpe38UZMny8utzg+myAjVYKaN81Z33mLcPs?=
 =?iso-8859-1?Q?VfqiRd1jhjjpe8vEj6Qr4WDu+IQoukmMHRvDpLa19qMKb5pFPdpfvIxEKn?=
 =?iso-8859-1?Q?9y/QpApuyN50lY3lHjVGE5qORtCJuA2lXXDfb3Ynm3ireBFuUBBlX6sL2E?=
 =?iso-8859-1?Q?Xxv22PVfzx6ZdfOI5gHmJ5X/cYyy9Pg47t2g6m+EGYBdODek0J87is0JYj?=
 =?iso-8859-1?Q?1mA3CuKWkUV5KNZxwBvntbJYBlhZ5Gud6aB8OYaHhqKI30A9uW5MlURvNe?=
 =?iso-8859-1?Q?uWllL6jMaXDTBP5WhRCBEXkXpeekN6mZqBgSD2hhBS0g5WUM/9kB5eNMYb?=
 =?iso-8859-1?Q?p/uBJD1OujOp/xZsKmW/+hidHdEpPxY6s9CNObwB7UMFURW/vIIx7eENpK?=
 =?iso-8859-1?Q?OqCrbOVq3ZYwLcoBlIA1Oj/efVCvWOppTOKuNIiSG/h8WY99ruRr2anTcW?=
 =?iso-8859-1?Q?vbx7jy/NLv5SrhkGtvLvIhkt8cAKTrwFQhriFclZfYN5QVGyY+Ug9mBWSq?=
 =?iso-8859-1?Q?gZfmmrRIZdDkqeUQls9/CFB/pxDBZQA3NJ4FdxFyjUUEekqAotlr96rFrJ?=
 =?iso-8859-1?Q?ufVhSVEvSyZn7ftnI0jeeLukZwmVTBndkGJiDqQ8TXfJFzFmizixoZSqHD?=
 =?iso-8859-1?Q?MxIG0PVy8wsJHnayJtb35AhrP2bLlzUU/P2PV3xbXi9nnpfqxjHsdLoBy3?=
 =?iso-8859-1?Q?EcSsM1mwfXw09WdSfzjtfxfIjG9P3YuFHPgMRjSUXLS4Zb0gNICDaK723F?=
 =?iso-8859-1?Q?TTEEBOpH/op6kwfBUwWVIXwUQcju6UQYBWltzeilrQkg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?J3M8ecLhzNyqPXYD1G+e2udEY7UlbJT5xI2nGcPk7N+RIWQ8POCWeYOV60?=
 =?iso-8859-1?Q?ZCWxZ4XPGG0tBghDZXdSDS9Z1wNQw/AAehcW+tDp+5ZIT4dp6ccPUjyJx9?=
 =?iso-8859-1?Q?2XA5opNPVDUqSzwnFpIfhATB4d7ZFSu78B8vrD+42opsCoGkNvvdjZxHlD?=
 =?iso-8859-1?Q?JMXcvDmeO74BBez6VFI5YdkFzG11ZkFX+TIdP5EnMLrvLH3Gwrw2yytU5I?=
 =?iso-8859-1?Q?PPiG1DnztJSPe56fHiMFchpL4g3vg9+w/GQElkKqxX0K7GBSSNjpjqsmsW?=
 =?iso-8859-1?Q?pL/8ZkC28w+pIBqoiFz4z18aEXPIAP5X27zn1hHEt5c8iPQOIp9qjlTsHC?=
 =?iso-8859-1?Q?H0uu4FgmrPotOhofdCpMUi89S9vHf9EA/1M474vajXW+BTSjVDSIlYL9QY?=
 =?iso-8859-1?Q?KyVzV31qQ0MAGBkfMVjPjw1SXGkZVyBCMgsAvC3NU+Eejbdj8RWvJ1TbYc?=
 =?iso-8859-1?Q?0aUdBskhfjCaMX0TsEuQ4Mq+9EBUGMLUD673QJC+yRhrsMWsTIeF++rwaC?=
 =?iso-8859-1?Q?v5+bUtJMayNHAzhS1EERNyKzNjpNDJxq2Y1U6rNh8r3X7LpmyIe5nZcCA1?=
 =?iso-8859-1?Q?CASI2SXr6KD607j2k0ZkKPzJ+54xMtFybbBlBRc9FAg0kiFPBrvsr5UzDT?=
 =?iso-8859-1?Q?iCz0Q/2h1NY0zcgs0If1ruNS24xTEvS6szNA9zODXh9I5U+sKQ1F0pBBTO?=
 =?iso-8859-1?Q?IbDd+6cVvHH72KyT/+6KyHKYK2aJ3HvI3Vx80eDotasLZuCS5VGDEYueoT?=
 =?iso-8859-1?Q?HLnancpqao1FnaJrcYpuahlx+lL7axWDiZJbKCedf4MJFW84bSebdxcwdU?=
 =?iso-8859-1?Q?bjhdlu0KTdM6RXWy8Yx83p9QH2XMslIo4MSnjC8ZlzXwoPsbTIV92J8gDr?=
 =?iso-8859-1?Q?yaf63u7DC3H6Q25tsHVMYivaMtjvL1Y59IwhAtnlY6l98ejJXEqdzMwB4I?=
 =?iso-8859-1?Q?Az58JDBm+h/mRIjxt76uOGjZ7pAI/LgKAbYXV3ypq4gWhH8Fda9Ne6ZEBW?=
 =?iso-8859-1?Q?x4mZvRt4np7eTLy8YNFU5I4jV9WoDbJu980h/f1Ecyk8Go7HiEB3RCBZrW?=
 =?iso-8859-1?Q?CpCzNVGonHbusX/ItoJgLs9vU/cvlXYVvQt9Qhxc4z5bZyQk//D2auKAnj?=
 =?iso-8859-1?Q?dz7hFWgojxYMNG41KMs1dTzSy7XtT6gT+rM2mIgKNRhmGm9P6uuBzXlnAn?=
 =?iso-8859-1?Q?ayrwqVF84Z0DUyme1pXFix/nl3SAul0FQOrV+qlEC3UX8Lj7McA8S2jeOD?=
 =?iso-8859-1?Q?vO3MvALA+n4gXpoVD244wRC4cP3xqfFERPRnfIBkgBbVFLXmaeS/HCCIc8?=
 =?iso-8859-1?Q?/eCHhs3tpam6pS4mF1u1LQ8fMcwcEqwZ/+7DK8Viwd4hQAhI4nX1Zk9432?=
 =?iso-8859-1?Q?70olceg3f524Ppgq7JsmVeo2v01vnEzET33u4P9KYf0ninHR0OlPbQ7CTq?=
 =?iso-8859-1?Q?+SzymGC0cpYZadoLQYaOFoANToR5QdPQLyhJTCihxyyo4BAHTWmuy1cIVL?=
 =?iso-8859-1?Q?QuC8lTY4HY3ucTs/4zg9SiBNvNd/BDWqcb+QcV0iaBG+wNYwd+jM2FDPiq?=
 =?iso-8859-1?Q?gRiiAk3A7znB9wOOfAR7q0KZ/Sds7ygeQZVadn0RblRdgVoxhMuR5m5YGr?=
 =?iso-8859-1?Q?beHrSEtiKQDAZhy3dC2iBWhOhwKP8LNtreibHAmI3VyO9Lpf3hC6H1pw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6547d4e2-0236-4c0a-04fd-08dde0d251d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 16:46:47.6687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C+mnxWcPTyz/8X3WcxL3JPDX3EHvRfQh1bG0KoF52FRwdyI9j2bmkEwvODwOuacqsJvuUgnsyYd3yogQZcUw6rSDQIZwRrN57iT9EtZ3i8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9482




Leonid Komarianskyi <Leonid_Komarianskyi@epam.com> writes:

> The Dom0 configuration logic in create_dom0() has been updated
> to account for extended SPIs when supported by the hardware and
> enabled with CONFIG_GICV3_ESPI. These changes ensure the proper
> calculation of the maximum number of SPIs and eSPIs available for Dom0.
>
> When eSPIs are supported by the hardware and CONFIG_GICV3_ESPI is
> enabled, the maximum number of eSPI interrupts is calculated using
> the ESPI_BASE_INTID offset (4096) and limited at 1024, with 32 IRQs
> subtracted. To ensure compatibility with non-Dom0 domains, this
> adjustment is applied by the toolstack during domain creation, while
> for Dom0 it is handled directly during VGIC initialization. If eSPIs
> are not supported, the calculation defaults to using the standard SPI
> range, with a maximum value of 992 interrupt lines as it works now.
>
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
>
> ---
> Changes in V2:
> - no changes
> ---
>  xen/arch/arm/domain_build.c     | 10 ++++++++++
>  xen/arch/arm/include/asm/vgic.h | 11 +++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d91a71acfd..fa5abf2dfb 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2055,6 +2055,16 @@ void __init create_dom0(void)
>      /* The vGIC for DOM0 is exactly emulating the hardware GIC */
>      dom0_cfg.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
>      dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_SPIS;
> +#ifdef CONFIG_GICV3_ESPI
> +    /*
> +     * Check if the hardware supports extended SPIs (even if the appropr=
iate config is set).
> +     * If not, the common SPI range will be used. Otherwise overwrite th=
e nr_spis with the
> +     * maximum available INTID from eSPI range. In that case, the number=
 of regular SPIs will
> +     * be adjusted to the maximum value during vGIC initialization.
> +     */
> +    if ( gic_number_espis() > 0 )
> +        dom0_cfg.arch.nr_spis =3D VGIC_DEF_NR_ESPIS;
> +#endif
>      dom0_cfg.arch.tee_type =3D tee_get_type();
>      dom0_cfg.max_vcpus =3D dom0_max_vcpus();
> =20
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 9fa4523018..117b3aa92c 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -353,6 +353,17 @@ extern void vgic_check_inflight_irqs_pending(struct =
vcpu *v,
>  /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. =
*/
>  #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
> =20
> +#ifdef CONFIG_GICV3_ESPI
> +/*
> + * Returns the maximum eSPI INTID subtracted by 32. For non-Dom0 domains=
, the
> + * toolstack applies the same adjustment to cover local IRQs. We will ad=
d back
> + * this value during VGIC initialization. This ensures consistent handli=
ng for Dom0
> + * and other domains. For the regular SPI range interrupts in this case,=
 the maximum
> + * value of VGIC_DEF_NR_SPIS will be used.
> + */
> +#define VGIC_DEF_NR_ESPIS (ESPI_BASE_INTID + min(gic_number_espis(), 102=
4U) - 32)
Name of the define is wrong, as it is not number of eSPIs. Actually, this i=
s
maximum SPI (including eSPIs) number.

> +#endif
> +
>  extern bool vgic_is_valid_irq(struct domain *d, unsigned int virq);
> =20
>  static inline bool vgic_is_shared_irq(struct domain *d, unsigned int vir=
q)

--=20
WBR, Volodymyr=

