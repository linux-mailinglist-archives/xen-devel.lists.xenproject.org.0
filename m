Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC18B3C049
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 18:06:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101670.1454705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1ci-0001Bg-2B; Fri, 29 Aug 2025 16:06:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101670.1454705; Fri, 29 Aug 2025 16:06:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us1ch-00019O-TN; Fri, 29 Aug 2025 16:06:43 +0000
Received: by outflank-mailman (input) for mailman id 1101670;
 Fri, 29 Aug 2025 16:06:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qyNB=3J=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1us1cf-0006AC-Ik
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 16:06:41 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20a::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24e67168-84f2-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 18:06:38 +0200 (CEST)
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com (2603:10a6:20b:58c::8)
 by VI1PR03MB6317.eurprd03.prod.outlook.com (2603:10a6:800:136::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.26; Fri, 29 Aug
 2025 16:06:36 +0000
Received: from AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b]) by AS4PR03MB8676.eurprd03.prod.outlook.com
 ([fe80::c5ca:906a:1ded:634b%7]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 16:06:36 +0000
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
X-Inumbo-ID: 24e67168-84f2-11f0-8adc-4578a1afcccb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u2KyeoCFZnjUCIvYfaGo68Sur0kR3CTSrOTEL3q+RpjUDDe57cDfPVyNxUYZ9xA3kfq0+ASVS0a0LMPhqFsThRjLdHiXsikaziUgnjWFvFLv8Fdo3Jceh2sSObJmGnLvLQhPHc6mgyBwBEhHy9BHamuhcvs7Fapz/DB2moP7058Xk28lThKJkzsQOQKhDJ8mxTebBd21ZXlIB5iqhYgkp1VVeYycqFWVsWoSe3xE3vV9FsQIAbknqUOiYFyfBqHoZnqPyZ1TM8r13qkikuYZA69m0Nm/tUFG8ZaH4uk2mglIQA3yjpXsunydiNm+QM73JiirhftuLAKoZrqPiC4BfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=26ysfIiJ72vbvI1GzH7i91C/GKYdCtgUiMqtSwVMkNI=;
 b=agsLntYIW0CzCMNm/3Y6EUc5VXepkH0FHSdxMt00tSYim6yn6dUvyXy8GxQz1JNWC3S85XlbHyT7FW2taELOe1/sr244wg4n0Hf2556AIAWy4Tv7AMd6LbfqtYFgRinysg2cJ4RUnbzrupzY+EY9dVbednngmxCmg1OpCL0ZWk+x2FeIpjy/elYasZNLBc1cR/pjX+Tma2WWK7jwBj/+wBB20Et6NKPOObTZ0sOBnssd89Je9OkYl8XXoZpZvYz1q8SG0rG0etfS4jj8/z9y1i2zZuyycIZ3r8taNfHB1+uR1tkXgMpFvsxvD3xEdmA/B2veV3OfN9eXXBgUdIbc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=26ysfIiJ72vbvI1GzH7i91C/GKYdCtgUiMqtSwVMkNI=;
 b=VDZu1B1OGMNZAxsi8NeC/fYGBsB6/Eb76rAHyLX9LmjsnyBYfVagVpu77FNhuKs50xOJS8mYk90MZzrZKCWK28X3dcdiYMOqFcgpzPhYvWM36XFzbYA8Heibw9mWPfWNqu7Ygo62YKRXyEcJ30tW5XPoB9WgTdpHETYWJ3vEnfDRg/GSBK065aIzgSt2sN/6Glk4e9qeqnUGWGlofKBPUumwEPICOxJ2wTauQLtcYvRCIw26fI/aoxTSlhEDXSPIPhnj6H7Gi8z3pRXYQDkzOXBhOZNFy2hE7yY9z49v+sqcAZaybubGWIL2GghJ/GBUAYimSu8Ia2i/stdgu501Iw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Topic: [PATCH v5 10/12] xen/arm: vgic-v3: add emulation of GICv3.1 eSPI
 registers
Thread-Index: AQHcGP7lSnKp01vKiUyg8GCh+goOAw==
Date: Fri, 29 Aug 2025 16:06:36 +0000
Message-ID:
 <6fda233a1a2f0362062ff9a6e80ee223d33815cf.1756481577.git.leonid_komarianskyi@epam.com>
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
x-ms-office365-filtering-correlation-id: 379aa9ff-16e7-4af8-1c02-08dde71607c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Cg6tRIMu7T3j9a++iNQ2Cu79l4mu6a4PrOBUQHa0zoPTTso7IPDUR+e9fs?=
 =?iso-8859-1?Q?1fXuOFrLxiIHFjQzIm8GXJ30mMBdBICoNDPLcFQA/rh5b0tZK5R4lcOBke?=
 =?iso-8859-1?Q?MmA5yomvVxzqXNDwlzyiAKtnPwhSUjYGMelB+mvVSqahQ4A3j0iakm99Og?=
 =?iso-8859-1?Q?PvabDEslbgdtygQP/LHVDZvUyQpx1bSQ9/ZmmSZOQEgiYYe0LnuJ+0ovRg?=
 =?iso-8859-1?Q?POxQ82ggJj0U4vQ4oUfTPBahoHGssocC+Fu+geZPs2KYddXBTSMxVc/blP?=
 =?iso-8859-1?Q?UNxI9fZGFcTlMnBbr7vAJfWRxB0olA14GOCpnQUbZIT8PBEdLYjQ6SHSfy?=
 =?iso-8859-1?Q?pVNYP0jfe7qbXTeZwXQxWfmwgcl2qvAG34vVSyXwNKypd/qSrkV/i21N+w?=
 =?iso-8859-1?Q?2dtNw8qcjzYcvjLJVcK0JgRuNVy7ItJAUbIsDfReR7R+TiCAOByVqEzWIa?=
 =?iso-8859-1?Q?KHAcDhaDpdfxMqCK2YV7Pd3BELbCYu44v+uvnmtXRF2nfdhbP8VVWeyWcp?=
 =?iso-8859-1?Q?xMYOWkGCira0qLx16prKXq3ztcUsoJagkf7XtrW8jir3n5GOfQ226QbMBN?=
 =?iso-8859-1?Q?1UbgwmaAEZa2mj6dnLes4YlRohqUeKXCN4ZrOtguh7o1Zjurt3SGskUleP?=
 =?iso-8859-1?Q?285B2lY4bM63sTbDX42ouOcvFOC4VDQZCbvu8H9nM9VdoVgHUjgMvFY1Dh?=
 =?iso-8859-1?Q?SOMhEfXtc7K2AZCHPDn7eAbreMmB3Ew95M3EY8sqPoJnzIi039/Xt9/zcO?=
 =?iso-8859-1?Q?y8tvhfcBvx2zV18xIeXDs6a9MAIagQJ7XLdcLMi4laZ32jvaUfC6MHYflQ?=
 =?iso-8859-1?Q?X4TJtPS0UF6ZZ7jZhH0WeYWnoXDguGf9K8V0huymN282NTUwZjNXYTQlGO?=
 =?iso-8859-1?Q?QL8udUFPleHiwFaep5yu27KTOBgscauYqYU+0ktblmBUpH6WyvQTDi/ARb?=
 =?iso-8859-1?Q?KDiD7GNVQqmRcZHyyOj4bvw5baPLNY8WdaZRjNV5r49rY4IF3qOikjgx/p?=
 =?iso-8859-1?Q?InS2oFM4J9ge97MbArDvWwQiWi3io8g/cXv369vfjwDtmYX9gz0W0qWYSE?=
 =?iso-8859-1?Q?kofAwW6/bBoTgHMver40VheECGmMghehF8z+DC/MmweznkT7Of5pvB0Avh?=
 =?iso-8859-1?Q?EKxLRvPV8CqO0pfmCrKVASHnHEp7llXGIDTGVyyV5K0XTUGHU7OJznn7Zk?=
 =?iso-8859-1?Q?aUWAaafBFIXIhDxAQFGYhRW50D4vOTAHZsGRBohXvxnEMk7xIyPOgib+Ux?=
 =?iso-8859-1?Q?6VIef0EPnPGaq6DwBh2BY7AFmKzqJUvQA/T8U8kCf/lVtEHtSUnisc3tAF?=
 =?iso-8859-1?Q?TXl90PVnGTT57u95M1V2xwElGJeCqt084VkDc1cU1adRs5WTVIHwnKb7CU?=
 =?iso-8859-1?Q?gCCowme+KuKDYFi0MENYn8tnF2erzZUG1H5FVj7g/8N1xNQu9ffSQgSg6q?=
 =?iso-8859-1?Q?kWTtV0vebqbstnjCL+fkTN/AbpQ0iihjWezH4ofR5wtgd4RNLuIIWtSIO1?=
 =?iso-8859-1?Q?JxzbxzbTqPL82kNumci51E5HoZpz3OdAuHuBnGabGaEQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR03MB8676.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?r/aOqyQaRwBqjXdxf4ddAsz/rgGIEvw1Td8PAFE7bykDhj4kYTgu0oyB+P?=
 =?iso-8859-1?Q?C5jjxtGfEhVVA2Eam7i+weRyb1lNmJ46dsUFuef9wUufjw4OsUGoEqAA2g?=
 =?iso-8859-1?Q?J+fCtat+ToTz/owrfMIBAxf3cRtklBIFtBbkjOu86CbG1BhGyf+c/JDPhc?=
 =?iso-8859-1?Q?2U7w4zOqc2EX59ILPJ06Fa3p+ZFNqoV335ca/kwZ4z0Kzg81bHl+yQsBnF?=
 =?iso-8859-1?Q?PdRH9x0mm559qrK/E3Oz0hc/ArzK5VRK8Q5dWM2z+ghebqGiPPcU9a31oA?=
 =?iso-8859-1?Q?eh4ubDQxwf1snb0TI9r2fU/Quxdp1Igpe8tKxPyYMElnj9Vj8GdMWJzEHj?=
 =?iso-8859-1?Q?kge4d1vo9YJVjNBuCQKcf3M5AzyS+C4FDzfSrwTju/lRkHIb4T8iOjQVOQ?=
 =?iso-8859-1?Q?s7woUxRKqYtksvUuvHQgCFKuMRw36FWuXZQKNNoP6HzrepBeYkZ8MuXgK5?=
 =?iso-8859-1?Q?wOjp2GyY5mV+y+xB0sujRcVjC8lpv39dPnCAPtCRf7dOzATOqtlxp/v+w5?=
 =?iso-8859-1?Q?UjZVcX1Q2kKIjD5gECW4PoNXlez5R5kNVgzibdTQJGJ1F+VGmKLaFGfV1A?=
 =?iso-8859-1?Q?NTLzBew0o5dGmFByyzgguWwaQOqM8JECImuPAiayyVajFaoymTzaZQouge?=
 =?iso-8859-1?Q?w5uGMDYLWtIfcD7CuneAeYltL5Tq86FkiaMSWnMz78Ezfl571k95qv2wzt?=
 =?iso-8859-1?Q?Wk7XrwvnCVhRpLvkI/R5DVQH0UdmylyQNYpTxgERxAZIBDwoI0laWQNBNj?=
 =?iso-8859-1?Q?ocu5LgN1zUTL6MA1rq4HXYWlJQLx9ZcagXFpI0ysl87MJ53qq8UpCAfeUU?=
 =?iso-8859-1?Q?OMpOFZm15v4ClIkoPAAr4+/FShte7rKL0zGPYYc4TMLH0D86EsTJsnAqN7?=
 =?iso-8859-1?Q?GUATOLUJcxMG7Bxhls0pw0aVUlr19MmXdmZzvcAovKqi8NC0omD2pmpNY1?=
 =?iso-8859-1?Q?XiL8XyikQmfDaG/Q2JHbbty+DEUbhkXw14sddro6qG0/YfOBPrJCRK+Rv2?=
 =?iso-8859-1?Q?uaF9xs9ey+6qpCvsjpOhdwPsJ9CeSswBc3KGRKdxQamVuUc70JXMCHp86I?=
 =?iso-8859-1?Q?LzdrgO77uJdWjwYSjNNuBfqhNk6y1eooYG7/mPlppmDSeE/Q0HxwA93sDf?=
 =?iso-8859-1?Q?VJImkFh8wwsIdnkVyIBQBHlOOLRsiomrMR7YdtysSyPPJHFIiwEdXOWXaJ?=
 =?iso-8859-1?Q?JL+AaTYK8x7JsHCaIfpn54Lex/X+q1xo9+Z1ymbw3VXkRuF9tBFoJxIoHR?=
 =?iso-8859-1?Q?ss6m9higEt1TAPI0KWJ3UQy/u6olSCXc9rwhwiz5dzTu8/9wS80uZMGfcq?=
 =?iso-8859-1?Q?RAZk6BqDxGIQLNsDLwPMFQYvK3bghvA6S29ltCYbVjfWC+toqZeLTJZ+I/?=
 =?iso-8859-1?Q?x4Axc1xn1arvq2tnyWTxps6Ffuti+K9PrmoUOeYZk9MVdO3ckCNjEl6Vq4?=
 =?iso-8859-1?Q?JRQN/XAegR3PyoTR2n3tJaeqSmBTAjBSJNtKZCdeGp4TyNpftERGiJj5zg?=
 =?iso-8859-1?Q?fcvV0WMG+NthpGsEn/RrzKwfDsNSjWV5l/MoPGalWyrNbsDJHPLPejtnUo?=
 =?iso-8859-1?Q?Uz7yc6MDzuAqVASLF5QJNC3qjppsF9XbC4AImtJKKHGC2NgQOzL3vFcE4G?=
 =?iso-8859-1?Q?YXTv91NVInUjTaFVj9gjlxW85XtM03kxXWnfPOjXJreE+vd/B/HNoZaNDW?=
 =?iso-8859-1?Q?B86oM3mSQ0VtSdc6XlQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR03MB8676.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379aa9ff-16e7-4af8-1c02-08dde71607c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 16:06:36.1024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hjsdLPD7iPkhvP0ZLoJWPm7J9nnLvnzn1SZYDGbVgDQTRHv1gVkv+Lhi+H5yAEeUl9CDb01LgD44ONdM2oxTW91zUkrb8Wig444fq4Q4uyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6317

Implemented support for GICv3.1 extended SPI registers for vGICv3,
allowing the emulation of eSPI-specific behavior for guest domains.
The implementation includes read and write emulation for eSPI-related
registers (e.g., GICD_ISENABLERnE, GICD_IROUTERnE, and others),
following a similar approach to the handling of regular SPIs.

The eSPI registers, previously located in reserved address ranges,
are now adjusted to support MMIO read and write operations correctly
when CONFIG_GICV3_ESPI is enabled.

The availability of eSPIs and the number of emulated extended SPIs
for guest domains is reported by setting the appropriate bits in the
GICD_TYPER register, based on the number of eSPIs requested by the
domain and supported by the hardware. In cases where the configuration
option is disabled, the hardware does not support eSPIs, or the domain
does not request such interrupts, the functionality remains unchanged.

Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>

---
Changes in V5:
- since eSPI-specific defines and macros are now available even when the
  appropriate config is disabled, this allows us to remove many
  #ifdef guards and reuse the existing code for regular SPIs for eSPIs as
  well, as eSPIs are processed similarly. This improves code readability
  and consolidates the register ranges for SPIs and eSPIs in a single
  place, simplifying future changes or fixes for SPIs and their
  counterparts from the extended range
- moved vgic_ext_rank_offset() from
  [08/12] xen/arm: vgic: add resource management for extended SPIs
  as the function was unused before this patch
- added stub implementation of vgic_ext_rank_offset() when CONFIG_GICV3_ESP=
I=3Dn
- removed unnecessary defines for reserved ranges, which were introduced in
  V4 to reduce the number of #ifdefs. The issue is now resolved by
  allowing the use of SPI-specific offsets and reworking the logic

Changes in V4:
- added missing RAZ and write ignore eSPI-specific registers ranges:
  GICD_NSACRnE and GICD_IGRPMODRnE
- changed previously reserved range to cover GICD_NSACRnE and
  GICD_IGRPMODRnE
- introduced GICD_RESERVED_RANGE<n>_START/END defines to remove
  hardcoded values and reduce the number of ifdefs
- fixed reserved ranges with eSPI option enabled: added missing range
  0x0F30-0x0F7C
- updated the logic for domains that do not support eSPI, but Xen is
  compiled with the eSPI option. Now, prior to other MMIO checks, we
  verify whether eSPI is available for the domain or not. If not, it
  behaves as it does currently - RAZ and WI
- fixed print for GICD_ICACTIVERnE
- fixed new lines formatting for switch-case

Changes in V3:
- changed vgic_store_irouter parameters - instead of offset virq is
  used, to remove the additional bool espi parameter and simplify
  checks. Also, adjusted parameters for regular SPI. Since the offset
  parameter was used only for calculating virq number and then reused for
  finding rank offset, it will not affect functionality.
- fixed formatting for goto lables - added newlines after condition
- fixed logs for GICD_ISACTIVERnE and GICD_ICACTIVERnE handlers
- removed #ifdefs in 2 places where they were adjacent and could be merged

Changes in V2:
- add missing rank index conversion for pending and inflight irqs
---
 xen/arch/arm/include/asm/vgic.h |   4 +
 xen/arch/arm/vgic-v3.c          | 198 ++++++++++++++++++++++++++------
 xen/arch/arm/vgic.c             |  23 ++++
 3 files changed, 192 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 3aa22114ba..103bc3c74b 100644
--- a/xen/arch/arm/include/asm/vgic.h
+++ b/xen/arch/arm/include/asm/vgic.h
@@ -314,6 +314,10 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct v=
cpu *v,
                                               unsigned int b,
                                               unsigned int n,
                                               unsigned int s);
+extern struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v,
+                                                  unsigned int b,
+                                                  unsigned int n,
+                                                  unsigned int s);
 extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int ir=
q);
 extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
 extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, unsigned int n);
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 4369c55177..b5d766c98f 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -111,13 +111,10 @@ static uint64_t vgic_fetch_irouter(struct vgic_irq_ra=
nk *rank,
  * Note the offset will be aligned to the appropriate boundary.
  */
 static void vgic_store_irouter(struct domain *d, struct vgic_irq_rank *ran=
k,
-                               unsigned int offset, uint64_t irouter)
+                               unsigned int virq, uint64_t irouter)
 {
     struct vcpu *new_vcpu, *old_vcpu;
-    unsigned int virq;
-
-    /* There is 1 vIRQ per IROUTER */
-    virq =3D offset / NR_BYTES_PER_IROUTER;
+    unsigned int offset;
=20
     /*
      * The IROUTER0-31, used for SGIs/PPIs, are reserved and should
@@ -685,13 +682,20 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /* We do not implement security extensions for guests, read zero *=
/
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         goto read_as_zero;
=20
     case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD);
+        if ( reg >=3D GICD_ISENABLERnE )
+            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE,
+                                        DABT_WORD);
+        else
+            rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WOR=
D);
         if ( rank =3D=3D NULL ) goto read_as_zero;
         vgic_lock_rank(v, rank, flags);
         *r =3D vreg_reg32_extract(rank->ienable, info);
@@ -699,8 +703,13 @@ static int __vgic_v3_distr_common_mmio_read(const char=
 *name, struct vcpu *v,
         return 1;
=20
     case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
+        if ( reg >=3D GICD_ICENABLERnE )
+            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE,
+                                        DABT_WORD);
+        else
+            rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WOR=
D);
         if ( rank =3D=3D NULL ) goto read_as_zero;
         vgic_lock_rank(v, rank, flags);
         *r =3D vreg_reg32_extract(rank->ienable, info);
@@ -710,20 +719,29 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     /* Read the pending status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
         goto read_as_zero;
=20
     /* Read the active status of an IRQ via GICD/GICR is not supported */
     case VRANGE32(GICD_ISACTIVER, GICD_ISACTIVERN):
     case VRANGE32(GICD_ICACTIVER, GICD_ICACTIVERN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
         goto read_as_zero;
=20
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
     {
         uint32_t ipriorityr;
         uint8_t rank_index;
=20
         if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto b=
ad_width;
-        rank =3D vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WORD);
+        if ( reg >=3D GICD_IPRIORITYRnE )
+            rank =3D vgic_ext_rank_offset(v, 8, reg - GICD_IPRIORITYRnE,
+                                        DABT_WORD);
+        else
+            rank =3D vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WO=
RD);
         if ( rank =3D=3D NULL ) goto read_as_zero;
         rank_index =3D REG_RANK_INDEX(8, reg - GICD_IPRIORITYR, DABT_WORD)=
;
=20
@@ -737,11 +755,15 @@ static int __vgic_v3_distr_common_mmio_read(const cha=
r *name, struct vcpu *v,
     }
=20
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
     {
         uint32_t icfgr;
=20
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
+        if ( reg >=3D GICD_ICFGRnE )
+            rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_W=
ORD);
+        else
+            rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
         if ( rank =3D=3D NULL ) goto read_as_zero;
         vgic_lock_rank(v, rank, flags);
         icfgr =3D rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR, DABT_WORD=
)];
@@ -782,46 +804,81 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
     {
     case VRANGE32(GICD_IGROUPR, GICD_IGROUPRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /* We do not implement security extensions for guests, write ignor=
e */
         goto write_ignore_32;
=20
     case VRANGE32(GICD_ISENABLER, GICD_ISENABLERN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WORD);
+        if ( reg >=3D GICD_ISENABLERnE )
+            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISENABLERnE,
+                                        DABT_WORD);
+        else
+            rank =3D vgic_rank_offset(v, 1, reg - GICD_ISENABLER, DABT_WOR=
D);
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
         tr =3D rank->ienable;
         vreg_reg32_setbits(&rank->ienable, r, info);
-        vgic_enable_irqs(v, (rank->ienable) & (~tr), rank->index);
+        if ( reg >=3D GICD_ISENABLERnE )
+            vgic_enable_irqs(v, (rank->ienable) & (~tr),
+                             EXT_RANK_IDX2NUM(rank->index));
+        else
+            vgic_enable_irqs(v, (rank->ienable) & (~tr), rank->index);
         vgic_unlock_rank(v, rank, flags);
         return 1;
=20
     case VRANGE32(GICD_ICENABLER, GICD_ICENABLERN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WORD);
+        if ( reg >=3D GICD_ICENABLERnE )
+            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICENABLERnE,
+                                        DABT_WORD);
+        else
+            rank =3D vgic_rank_offset(v, 1, reg - GICD_ICENABLER, DABT_WOR=
D);
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
         tr =3D rank->ienable;
         vreg_reg32_clearbits(&rank->ienable, r, info);
-        vgic_disable_irqs(v, (~rank->ienable) & tr, rank->index);
+        if ( reg >=3D GICD_ICENABLERnE )
+            vgic_disable_irqs(v, (~rank->ienable) & tr,
+                              EXT_RANK_IDX2NUM(rank->index));
+        else
+            vgic_disable_irqs(v, (~rank->ienable) & tr, rank->index);
         vgic_unlock_rank(v, rank, flags);
         return 1;
=20
     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WORD);
+        if ( reg >=3D GICD_ISPENDRnE )
+            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ISPENDRnE, DABT=
_WORD);
+        else
+            rank =3D vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WORD)=
;
         if ( rank =3D=3D NULL ) goto write_ignore;
=20
-        vgic_set_irqs_pending(v, r, rank->index);
+        if ( reg >=3D GICD_ISPENDRnE )
+            vgic_set_irqs_pending(v, r, EXT_RANK_IDX2NUM(rank->index));
+        else
+            vgic_set_irqs_pending(v, r, rank->index);
=20
         return 1;
=20
     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD);
+        if ( reg >=3D GICD_ICPENDRnE )
+            rank =3D vgic_ext_rank_offset(v, 1, reg - GICD_ICPENDRnE, DABT=
_WORD);
+        else
+            rank =3D vgic_rank_offset(v, 1, reg - GICD_ICPENDR, DABT_WORD)=
;
         if ( rank =3D=3D NULL ) goto write_ignore;
=20
-        vgic_check_inflight_irqs_pending(v, rank->index, r);
+        if ( reg >=3D GICD_ICPENDRnE )
+            vgic_check_inflight_irqs_pending(v,
+                                             EXT_RANK_IDX2NUM(rank->index)=
, r);
+        else
+            vgic_check_inflight_irqs_pending(v, rank->index, r);
=20
         goto write_ignore;
=20
@@ -838,16 +895,38 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
                v, name, r, reg - GICD_ICACTIVER);
         goto write_ignore_32;
=20
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+        if ( dabt.size !=3D DABT_WORD )
+            goto bad_width;
+        printk(XENLOG_G_ERR
+               "%pv: %s: unhandled word write %#"PRIregister" to ISACTIVER=
%dE\n",
+               v, name, r, reg - GICD_ISACTIVERnE);
+        return 0;
+
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+        printk(XENLOG_G_ERR
+               "%pv: %s: unhandled word write %#"PRIregister" to ICACTIVER=
%dE\n",
+               v, name, r, reg - GICD_ICACTIVERnE);
+        goto write_ignore_32;
+
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
     {
-        uint32_t *ipriorityr, priority;
+        uint32_t *ipriorityr, priority, offset;
=20
         if ( dabt.size !=3D DABT_BYTE && dabt.size !=3D DABT_WORD ) goto b=
ad_width;
-        rank =3D vgic_rank_offset(v, 8, reg - GICD_IPRIORITYR, DABT_WORD);
+        if ( reg >=3D GICD_IPRIORITYRnE ) {
+            offset =3D reg - GICD_IPRIORITYRnE;
+            rank =3D vgic_ext_rank_offset(v, 8, offset, DABT_WORD);
+        }
+        else
+        {
+            offset =3D reg - GICD_IPRIORITYR;
+            rank =3D vgic_rank_offset(v, 8, offset, DABT_WORD);
+        }
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
-        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, reg - GICD_IPRI=
ORITYR,
-                                                      DABT_WORD)];
+        ipriorityr =3D &rank->ipriorityr[REG_RANK_INDEX(8, offset, DABT_WO=
RD)];
         priority =3D ACCESS_ONCE(*ipriorityr);
         vreg_reg32_update(&priority, r, info);
         ACCESS_ONCE(*ipriorityr) =3D priority;
@@ -859,10 +938,14 @@ static int __vgic_v3_distr_common_mmio_write(const ch=
ar *name, struct vcpu *v,
         goto write_ignore_32;
=20
     case VRANGE32(GICD_ICFGR + 4, GICD_ICFGRN): /* PPI + SPIs */
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
         /* ICFGR1 for PPI's, which is implementation defined
            if ICFGR1 is programmable or not. We chose to program */
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
+        if ( reg >=3D GICD_ICFGRnE )
+            rank =3D vgic_ext_rank_offset(v, 2, reg - GICD_ICFGRnE, DABT_W=
ORD);
+        else
+            rank =3D vgic_rank_offset(v, 2, reg - GICD_ICFGR, DABT_WORD);
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
         vreg_reg32_update(&rank->icfg[REG_RANK_INDEX(2, reg - GICD_ICFGR,
@@ -1129,6 +1212,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
             typer |=3D GICD_TYPE_LPIS;
=20
         typer |=3D (v->domain->arch.vgic.intid_bits - 1) << GICD_TYPE_ID_B=
ITS_SHIFT;
+#ifdef CONFIG_GICV3_ESPI
+        if ( v->domain->arch.vgic.nr_espis > 0 )
+        {
+            /* Set eSPI support bit for the domain */
+            typer |=3D GICD_TYPER_ESPI;
+            /* Set ESPI range bits */
+            typer |=3D (DIV_ROUND_UP(v->domain->arch.vgic.nr_espis, 32) - =
1)
+                       << GICD_TYPER_ESPI_RANGE_SHIFT;
+        }
+#endif
=20
         *r =3D vreg_reg32_extract(typer, info);
=20
@@ -1194,6 +1287,16 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, m=
mio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /*
          * Above all register are common with GICR and GICD
          * Manage in common
@@ -1201,6 +1304,7 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mm=
io_info_t *info,
         return __vgic_v3_distr_common_mmio_read("vGICD", v, info, gicd_reg=
, r);
=20
     case VRANGE32(GICD_NSACR, GICD_NSACRN):
+    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
         /* We do not implement security extensions for guests, read zero *=
/
         goto read_as_zero_32;
=20
@@ -1216,16 +1320,21 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, =
mmio_info_t *info,
         /* Replaced with GICR_ISPENDR0. So ignore write */
         goto read_as_zero_32;
=20
-    case VRANGE32(0x0F30, 0x60FC):
+    case VRANGE32(0x0F30, 0x0FFC):
         goto read_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
     {
         uint64_t irouter;
=20
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
-                                DABT_DOUBLE_WORD);
+        if ( gicd_reg >=3D GICD_IROUTERnE )
+            rank =3D vgic_ext_rank_offset(v, 64, gicd_reg - GICD_IROUTERnE=
,
+                                        DABT_DOUBLE_WORD);
+        else
+            rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
+                                    DABT_DOUBLE_WORD);
         if ( rank =3D=3D NULL ) goto read_as_zero;
         vgic_lock_rank(v, rank, flags);
         irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
@@ -1235,8 +1344,8 @@ static int vgic_v3_distr_mmio_read(struct vcpu *v, mm=
io_info_t *info,
=20
         return 1;
     }
-
-    case VRANGE32(0x7FE0, 0xBFFC):
+    case VRANGE32(0x3700, 0x60FC):
+    case VRANGE32(0xA004, 0xBFFC):
         goto read_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
@@ -1382,12 +1491,23 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
     case VRANGE32(GICD_IPRIORITYR, GICD_IPRIORITYRN):
     case VRANGE32(GICD_ICFGR, GICD_ICFGRN):
     case VRANGE32(GICD_IGRPMODR, GICD_IGRPMODRN):
+    case VRANGE32(GICD_IGROUPRnE, GICD_IGROUPRnEN):
+    case VRANGE32(GICD_ISENABLERnE, GICD_ISENABLERnEN):
+    case VRANGE32(GICD_ICENABLERnE, GICD_ICENABLERnEN):
+    case VRANGE32(GICD_ISPENDRnE, GICD_ISPENDRnEN):
+    case VRANGE32(GICD_ICPENDRnE, GICD_ICPENDRnEN):
+    case VRANGE32(GICD_ISACTIVERnE, GICD_ISACTIVERnEN):
+    case VRANGE32(GICD_ICACTIVERnE, GICD_ICACTIVERnEN):
+    case VRANGE32(GICD_IPRIORITYRnE, GICD_IPRIORITYRnEN):
+    case VRANGE32(GICD_ICFGRnE, GICD_ICFGRnEN):
+    case VRANGE32(GICD_IGRPMODRnE, GICD_IGRPMODRnEN):
         /* Above registers are common with GICR and GICD
          * Manage in common */
         return __vgic_v3_distr_common_mmio_write("vGICD", v, info,
                                                  gicd_reg, r);
=20
     case VRANGE32(GICD_NSACR, GICD_NSACRN):
+    case VRANGE32(GICD_NSACRnE, GICD_NSACRnEN):
         /* We do not implement security extensions for guests, write ignor=
e */
         goto write_ignore_32;
=20
@@ -1405,26 +1525,38 @@ static int vgic_v3_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
         return 0;
=20
-    case VRANGE32(0x0F30, 0x60FC):
+    case VRANGE32(0x0F30, 0x0FFC):
         goto write_reserved;
=20
     case VRANGE64(GICD_IROUTER32, GICD_IROUTER1019):
+    case VRANGE64(GICD_IROUTERnE, GICD_IROUTERnEN):
     {
         uint64_t irouter;
+        unsigned int offset, virq;
=20
         if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
-        rank =3D vgic_rank_offset(v, 64, gicd_reg - GICD_IROUTER,
-                                DABT_DOUBLE_WORD);
+        if ( gicd_reg >=3D GICD_IROUTERnE ) {
+            offset =3D gicd_reg - GICD_IROUTERnE;
+            rank =3D vgic_ext_rank_offset(v, 64, offset, DABT_DOUBLE_WORD)=
;
+        } else {
+            offset =3D gicd_reg - GICD_IROUTER;
+            rank =3D vgic_rank_offset(v, 64, offset, DABT_DOUBLE_WORD);
+        }
         if ( rank =3D=3D NULL ) goto write_ignore;
         vgic_lock_rank(v, rank, flags);
-        irouter =3D vgic_fetch_irouter(rank, gicd_reg - GICD_IROUTER);
+        irouter =3D vgic_fetch_irouter(rank, offset);
         vreg_reg64_update(&irouter, r, info);
-        vgic_store_irouter(v->domain, rank, gicd_reg - GICD_IROUTER, irout=
er);
+        if ( gicd_reg >=3D GICD_IROUTERnE )
+            virq =3D ESPI_IDX2INTID(offset / NR_BYTES_PER_IROUTER);
+        else
+            virq =3D offset / NR_BYTES_PER_IROUTER;
+        vgic_store_irouter(v->domain, rank, virq, irouter);
         vgic_unlock_rank(v, rank, flags);
         return 1;
     }
=20
-    case VRANGE32(0x7FE0, 0xBFFC):
+    case VRANGE32(0x3700, 0x60FC):
+    case VRANGE32(0xA004, 0xBFFC):
         goto write_reserved;
=20
     case VRANGE32(0xC000, 0xFFCC):
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index c9b9528c66..27ffdf316c 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -193,6 +193,18 @@ int domain_vgic_register(struct domain *d, unsigned in=
t *mmio_count)
 }
=20
 #ifdef CONFIG_GICV3_ESPI
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
 static unsigned int vgic_num_spi_lines(struct domain *d)
 {
     return d->arch.vgic.nr_spis + d->arch.vgic.nr_espis;
@@ -241,6 +253,17 @@ struct pending_irq *espi_to_pending(struct domain *d, =
unsigned int irq)
 {
     return NULL;
 }
+
+/*
+ * It is expected that, in the case of CONFIG_GICV3_ESPI=3Dn, the function=
 will
+ * return NULL. In this scenario, mmio_read/mmio_write will be treated as
+ * RAZ/WI, as expected.
+ */
+struct vgic_irq_rank *vgic_ext_rank_offset(struct vcpu *v, unsigned int b,
+                                           unsigned int n, unsigned int s)
+{
+    return NULL;
+}
 #endif
=20
 static unsigned int vgic_num_alloc_irqs(struct domain *d)
--=20
2.34.1

