Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6951B446E0
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 22:02:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1110716.1459774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG97-000666-55; Thu, 04 Sep 2025 20:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1110716.1459774; Thu, 04 Sep 2025 20:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuG96-00063v-WE; Thu, 04 Sep 2025 20:01:25 +0000
Received: by outflank-mailman (input) for mailman id 1110716;
 Thu, 04 Sep 2025 20:01:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ukh3=3P=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uuG95-00062f-Tn
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 20:01:24 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed908d7e-89c9-11f0-9809-7dc792cee155;
 Thu, 04 Sep 2025 22:01:21 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by GV2PR03MB10974.eurprd03.prod.outlook.com (2603:10a6:150:27a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 20:01:19 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9094.017; Thu, 4 Sep 2025
 20:01:19 +0000
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
X-Inumbo-ID: ed908d7e-89c9-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVECdtmfvm/ifmprLF123ovutT5zrvHgw2ykQrQHGBUBTCaW/C2bHM5w+1mlM/a8OpTgMFmQFRcBv1LOpCyWKT3Q62reCh3gtoKzxxr6tf3J7N0fegg3VFeeb7ArRWJvgy1jm44i/z7lVG7WCrYjWBowtTP9k7pRgqUx2gXI56DBOBz2oaBZm8VZXpnXb27Ns66e02M79pCJNNHgt0pZ2sqUXPjDMn34jG766nUmgphZGWcqMKAJEHlmuPhkPEaRCVSrqWaqRpimjDgwjQAwwG19b27F1ANo+kchf7XkIISld+4GNisvPLa61WxF+VvgHJhgi5Xg57DxsM1TWEIgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUxC/EzITt3a0WgMgWfYUK8XS0r83FbjMjiYxSZk+jg=;
 b=nY1/rY+c7bQwb5MpETGsYV1vpMcfm1II+RnaTFN9JDGHPdVy+CWYzoYUMh7jkZmSJ0/WHTAmdcDAFQcOWPHtWwAtzeYuas0BNZIJAdGAterCBBI4hPDhb8koKBYOX1c5iljD37kfCJET9ajJkZ2T5Vrw26o4DXL4kKwu3I7Q7mK/gRxbNDvv7Tb9mTYwUkam3cu2OivfSVKsLs2XCn53rf1CYwpA74UsRuB/twmEvLQrIkuy9/uTZgqLNITXJ52uTyvJqk5yzB8u17naj3P1iBsedrw+ukIzlJRw827pJ/qUWOWvc4PjO/koiRtLQC73QCcCrDX8SmlXJUfUdeGkHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUxC/EzITt3a0WgMgWfYUK8XS0r83FbjMjiYxSZk+jg=;
 b=K2g415sg3Lqr9vnOuvH6oqMLLC/5mWKfFb6IhTbyhSrpfLEeDOwk2IAGg9+jGBq1ZwocivAEptlQThpwY0Zx/tf0JQw4s6hdj1r88orAU2ys+p85Bzn58AOUo6x/DbaYHF4bpKRN9T+9YA27HXxldk0pv1nzKERzrRyGu/nlWUm2eBw66IFk7emqTdu9JZdly5QXqnJjaV5IDwL2kdcmeQyNFNi1M/zH9H990Qc6dSOUFKbi1gteXunGvpy146u6kNQAf3kUnOXBF/TuiOhgzZ1TeAjCMsY8U21gL1m6VgyxKztZJapd+F02UHKEOay1eBhGpeO3FkdSy0cYNsKU7w==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v7 03/12] xen/arm: vgic: implement helper functions for virq
 checks
Thread-Topic: [PATCH v7 03/12] xen/arm: vgic: implement helper functions for
 virq checks
Thread-Index: AQHcHdat8GUnc6NjkU6Jp8NxZ7QMlw==
Date: Thu, 4 Sep 2025 20:01:19 +0000
Message-ID:
 <db4ff870550f55a1f856e172021b05366b1309fa.1757015865.git.leonid_komarianskyi@epam.com>
References: <cover.1757015865.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1757015865.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|GV2PR03MB10974:EE_
x-ms-office365-filtering-correlation-id: 81ab3b00-d4c2-438a-438e-08ddebedd069
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?F9xKCfWVFZqC1Spqr4Vp5p6iIT6mczWjO/u2IVEuwPSSOcdDTPyXCB8kGc?=
 =?iso-8859-1?Q?Ic8P8oT1jYFTPsrIx3dMLQc7QduZGWBFr2ilvvWobfsHUksnzs3XN1FM3K?=
 =?iso-8859-1?Q?/n/Ji4hemNMr/x9xBbYAl/l6xe2t2Rp2PWeOh7t42aUb/9HuXSOTx3+/qE?=
 =?iso-8859-1?Q?AbGZIzFVh+MnquIIHWlauFKr6ly9hYlTeSPXUbcUWhsb+UqxBbIclIGiZN?=
 =?iso-8859-1?Q?tD/gS0HipIYcQC4hi6foj0/e6EAEITOU9IQ0hhafiw+u/8U2D8xfRGBemi?=
 =?iso-8859-1?Q?rKNdF5/6cwZp1KTjMltvYM64JAM9b62PoNRbeWFcxklfOdJXrq5cIaIsOc?=
 =?iso-8859-1?Q?HK+6M9cOywKVRD4KXlogiM3Kb3buptUbe2ZnfeU1E7W8//ofjvRleRHd88?=
 =?iso-8859-1?Q?AdelEcued7M+YcbMYZZ1x4VpDW0hnhnzme9e3avpczP1beRgObyPBhbgji?=
 =?iso-8859-1?Q?e2H+9WGxBFaR+BOz8VaJk0wHmA51QbQ0SkSNZugjeOMnCdoWkKUUveqtt1?=
 =?iso-8859-1?Q?VbO7VUNnEpua42KahqE/P+8omX96avm9MubrKWa6Tme2c7iSSlSmtSOqlx?=
 =?iso-8859-1?Q?A2Z4Q/aoWCKpDCP55mvCh6RCeumMtv1MR1w7NHJwy8LLco+YRK8QvCeJpX?=
 =?iso-8859-1?Q?vb905/0c3KuNKBaYgauodBkNVEmaKLXPXryABCqehQhHmYs7IG0babEXcA?=
 =?iso-8859-1?Q?YZI9voWFHwl5nCNBlEpZ0qyMvDx1r8MGpYGxjgkYJ32zvTPEwSJWPcavap?=
 =?iso-8859-1?Q?5TyXNh6ZdnNyRb0zydDYqcg2PDb/o3X9z378ZG9s9lW65pfhWXDLYxM0CG?=
 =?iso-8859-1?Q?z62zTncQ3LdUwDKmwVEY1wt8OES6OpMaPfTOI9XQtGR8gRThUVfh5tUtaE?=
 =?iso-8859-1?Q?gPz5jS/Lg1MqN5MuTLuaU+7WGlRgN2XKlA5/hUXQoX+4i4fmRGvLbDbL0n?=
 =?iso-8859-1?Q?s8zofi/jqqoiRZy+BcN9V0/hsqI7rVUte5NCDZlblqIedx/ep3f9kCj/jn?=
 =?iso-8859-1?Q?754mEzWtmNwnsSeHIvOLJjSqCtyBPHaxJTZ+yoAd3qQLJCkxEvyG1doxeC?=
 =?iso-8859-1?Q?wcQVKSbVhBbp9SjHTWIB9yhbsitaCEN5ud0Od2d29R7ArZas/dZYAghkSL?=
 =?iso-8859-1?Q?6INJl9FJcd7ypVI24udZ32hupsGu+f7Ssh8cj1Iu7Cv+VekQS46UX+9+Fs?=
 =?iso-8859-1?Q?Cj/Ezt+pTsCifv9pjTHgzqUwIhnhbHZx/eS5vEpeLVQRqDpjLPdqkKMhUa?=
 =?iso-8859-1?Q?wsvjHe52CvUAOeMxcArepmH/N4OpuNs0869lj0TeE2cpoFQ5ZnGdH3nexj?=
 =?iso-8859-1?Q?tS7VWd0091ZEEee9i0hTiVfPci6i0iPeo+rzOH/iopPiDRNe9JuEmGtNs5?=
 =?iso-8859-1?Q?us2OC61x+fqLUE38v9Ld67H9fkvnrneDVBXeDHN9LuKtQWX8mmw4BCGjdi?=
 =?iso-8859-1?Q?aw4CJ/9rnLx/k8/GTLPhupHjlWsVcKKmtq93Ixu6W6Ag+p9s60rQOwUiSP?=
 =?iso-8859-1?Q?FVh03Ybf0Lu+E30Iz9P7UIXHo5U0wLeFrNWShmK+8IZg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?/ntgAEkM9syAH9awizfzttxBny+eayHV9XihKzLmdlV8IeSAzpmmYcPyWo?=
 =?iso-8859-1?Q?AvLoS4oOux7yb8jSDF4KWierQwL6uSUPx2EUTwHZ9oo4Nel366OvlI/RGE?=
 =?iso-8859-1?Q?5df15CL1P3pLojoSedhnmb3WTIy58Q0n2KmlbKAJHeBeMPsk9OJVOJpkpi?=
 =?iso-8859-1?Q?ztosHvQUfV3pUow8NAOBI8idh17Y7s/w3bynPOND4cBzx7KIb2JuuNxLXr?=
 =?iso-8859-1?Q?D6v6scD4ZJ8aSqDhHZUnISA2grQ94yhwg99G/znWwBr/p3Fu6PZLLfGQ0o?=
 =?iso-8859-1?Q?ez4zTNATsF6AT2ttCjYBobikWERC26PiixMACbL3DwXbwEZfDj4qcdJa22?=
 =?iso-8859-1?Q?cnerSGhlNvdWdg2Bb0WGdcFw9iSND1twmiHzQlw3ibdQ1KPmZlN1/3hDKs?=
 =?iso-8859-1?Q?XJpVaa/uASR32n3wIgVz5aYk3CBUDRlVr+TAhhn21ibNjPAFQC4nmc4CtL?=
 =?iso-8859-1?Q?JDXEAUDzhWK4zJMSg4WCAJJ8ip9lZ7u/X39uR4jkWk0G6WeYBJLGtOpb9v?=
 =?iso-8859-1?Q?t/4udnj66gEwMrBB96DT+RDZyAAmA1wLUBliHGLC9y4QDGztjOZOkum2JO?=
 =?iso-8859-1?Q?iBOGonofs4JBP2zlCNYb9rxWn2n4JhYb7nHmGAOotTSTB5pLFvDSwwYKHM?=
 =?iso-8859-1?Q?ShCR+xDWejEyFJkcpds8OhR0ThvaNOM7Tll5wqwohmxj37ChfC3GyOJXMH?=
 =?iso-8859-1?Q?rUEZ/wOcgTN1B3gHce2vGG5nULqh7avo3a+fc8CQ2rBPonNkUw5RRC91Om?=
 =?iso-8859-1?Q?TxoRIEXlAM3l7CPckSExV6YKYRjMvF2IUEt+P/CzJvnRDFolN8v87ojsR5?=
 =?iso-8859-1?Q?b1GlWo9WNvHI0PT9NfIzCp7u1Q4qnGES5u/fhFw6zKx42oLnWG+dWlZZhe?=
 =?iso-8859-1?Q?wiF2dkfM6QlMC9OwURGZs16Itpbt69WS4EnvFMrqhvCkp6gwYAHp9NhBYW?=
 =?iso-8859-1?Q?UsrrNtc+fz0vwxi9XfnSdnhs6mKbaCWrFgPVdGvB+E4UVnjgH/EzFpnHfR?=
 =?iso-8859-1?Q?py6X+oOKpjVMYjRHMC7Gnlq8XISpviSh1sWY0D9yylyGRHdaZu2YLay1vy?=
 =?iso-8859-1?Q?8CQhROLQtZNZrkSytfVklZy5dC72IeEN+ZHfAMStunLETIz6ew1cPxUfJR?=
 =?iso-8859-1?Q?h/T8tyzy83ey31b/fDO+aqs6cCTPzjElOTfdfsIpZL0LFLKx7gWwW4SoJV?=
 =?iso-8859-1?Q?yl4JvkyfopM4MpjqO2YUy7HDVNh3CmtMpLADWjYVZwIXdJFFBXwhy1IidG?=
 =?iso-8859-1?Q?xM4aohoY0Kajya6u2rtTMjDfeom8Mb5OQ18HzT5Iy2f8LHE5H6xaI3OPhs?=
 =?iso-8859-1?Q?DDdnctbOn3Jg0iHTtSiALZPTylTjg+j8lX0h4XsgETtmObfNsrGDPwFA1J?=
 =?iso-8859-1?Q?ZrWKboQggDKenlc+lU3x6ej6VufbZr77z6qyQ+xnxNJMA4wOgHHbuhkzqA?=
 =?iso-8859-1?Q?7SBUho8nZdbJW+cJ/OlJ0NZJsEhRF75VUCj8uG3Q8nd8WE8RO8M/5z34t1?=
 =?iso-8859-1?Q?Id6R1onqQbMZsOT2dDgUWDJ0LMTXQLuWPDYSXeEwY9QvBIjWRYuySMdmsV?=
 =?iso-8859-1?Q?2GfD1WJnsJJYEkfn6D5H53MItiKTAk7iO0A4Bg66x1UZx/JtCeZV7dkgHp?=
 =?iso-8859-1?Q?FZGktGi9Ne/pPJu4187OAxGjAQA5kI43i+mQ2e++wXj3WH4POqx7kg+25+?=
 =?iso-8859-1?Q?8Fga2HuU9yBR/IBwklg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ab3b00-d4c2-438a-438e-08ddebedd069
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2025 20:01:19.2787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JdIXcWRWL1P8sG8bu/fzo1L2pQ3qvmmxzr67hnSkyzkwh4u/uiGkspDlN60+np0aw5u1VGh3vYz4UNGzErsTBo4bL0bL5/0fH7E5bBQnOPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB10974

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
Changes in V7:
- no changes

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

