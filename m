Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C85FB10E37
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 17:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056226.1424419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRe-0004TX-13; Thu, 24 Jul 2025 15:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056226.1424419; Thu, 24 Jul 2025 15:01:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uexRd-0004R8-RP; Thu, 24 Jul 2025 15:01:17 +0000
Received: by outflank-mailman (input) for mailman id 1056226;
 Thu, 24 Jul 2025 14:57:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMfj=2F=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uexNv-0003AJ-Fe
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 14:57:27 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 833e1691-689e-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 16:57:26 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by AM9PR03MB6756.eurprd03.prod.outlook.com (2603:10a6:20b:2dd::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 14:57:24 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 14:57:24 +0000
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
X-Inumbo-ID: 833e1691-689e-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVb2t9EXZYo7Xw9XU32NFzL3THBPvp5zO7W8h42TSN4TeFqRVuKllqVONY6KEpYIUMrHriS909lDKQOchg2W1W+MgZ0fQVzfiYDNgwdUsHlPzwziEN33Bo5HcQ2+js9IWWrsTQ00g/VVvFwTMpkvGTEMezjlhiqZgDqTBM1WxawqM+gjZ1bHx2RF7mCdmKAubw2+5saFMi1OudDGkruGIWkGOAHmSJvU/oeMgslULUSnThLpQXzZWSFXpVfB10VC2CLOeIrNbaQ+YWcwXk1W8qcpYVdeR+vV2hQCbmPqO5FKWSnLvhFIXapiQi9rVGq6lJbZ5PkheH+Z4UkAklXQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kKQugbaNDnaGX8At38aTes+BRdPgRq2jYGIXVz3Ti7A=;
 b=oTKEAZfQabGRnK9ufTvbFEBpBo8N1K0RJmNvjg0e1qLiIFrUCP8BoJw+b3NWwyudR990w7iM7ksGy11LVGxTgRpkxuEM/HrGZg1SYl7O4DWUhc1D8xgn05TSWTEI1DrehOT/da/TGlNyJPPSFMEHD3k/bXOZaDaXTReDBINyAiZHYjsfXJt8ETjOaIQSwBLxX1Iapl3RL8kkrBpmYDpLZNcrv0Gijdb19a0PDjNfsvNUS9OvM4EKwEtfQztk3kf98BTYGXfDI1163VSOu84C9bDVCuj6GHXtx90RWc2n+FA4a3pk+xE63o3G+d+ioPdJxiFhx5jwgxgIuse6thLeZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kKQugbaNDnaGX8At38aTes+BRdPgRq2jYGIXVz3Ti7A=;
 b=sXGFG8macC3FlMWMuyg3rgbbirlHUUgUsQTFy+wsHV0AgIty2G6bjdzsXscSR6aIqVDHYc/Q6GMmZlmXNXFNOOo4qaOB+6Iw5mXZTUWIpAomEcvC2PKjCrolipD8+1Plc+n2LvbDbnrM5UtrJ/mZcNxZgYymXQimGRkhqxrs8m3ZTFh2ZKEVcGhPjvoGI1CzTbv9+nLKnkHHClMkfBqZ4p0vyx66bq203YdURvtibR5Ul90dhDIOXeDV8Mt+ArTf5W6PmDGySIwg+PE6CvajwpBuA52alzaiIpBJrfP5K6Pfn7yCEHHaF6GXV2hgVx3lNQJ2+LqV1bKFf6gCCgAy1w==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 00/10] Introduce eSPI support
Thread-Topic: [PATCH 00/10] Introduce eSPI support
Thread-Index: AQHb/KtDAfO4HEFivE2PYxC976KEcA==
Date: Thu, 24 Jul 2025 14:57:24 +0000
Message-ID: <cover.1753367178.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|AM9PR03MB6756:EE_
x-ms-office365-filtering-correlation-id: 5474deb0-0407-4c8d-4ba0-08ddcac26630
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?GcKXccTsJaF2hTJUkY+ef6TxkgZ5RhiDkxEddphbYLGstogaxDEWSwr2RX?=
 =?iso-8859-1?Q?zenHw9kj6YCgQ0porAnPjDL4M6k7D/zuEI8PHNVPrYTbLXUdSrKm0djLpY?=
 =?iso-8859-1?Q?fu4uQiapkoYDFCyMTs5DSjCTP2mCpOxF4GH051rCqb7I+DEqItZdJHsnD0?=
 =?iso-8859-1?Q?EZcp9aYPs+f8+19ZBJc2yIb2UXnuMLy34PWGQ2kgOQXbt+LAKnRKn+U4jg?=
 =?iso-8859-1?Q?h5nvDV9owg/+tjvVFxrp/wqls6jE7SK62zQgLTnC1MxvB3ePulJf5/qQ1X?=
 =?iso-8859-1?Q?5XUTqIj03G9hOUwT1gJdiCmJpr8btkW7IEYK4EeY7pTz0VPtqp04EHSso/?=
 =?iso-8859-1?Q?MOZuxBec+CyG7cl74hvhUKkiOy8OpYaJqlX2BVUF7RYAlYevfo6xrzE8pl?=
 =?iso-8859-1?Q?Pu9oilfQ4orku7NAqwskJZFy05m6X/tUAEovO7EHLJsSc6i+OgAafAlx1x?=
 =?iso-8859-1?Q?ceFwGXFDInBuJlfFFgodywVLJjzU+pFJrGDqZnHTD0gsrcnnYG5oZMnFg/?=
 =?iso-8859-1?Q?WwPMRUip4NmpSQgjy25m+6AUkXUTEMKvMkfuJM5SjBSU41i3V0FKitqKai?=
 =?iso-8859-1?Q?sRGPmWXls5yP+/EckRybJQUxYHtxJew0iWLSwfOyrwUnx3veKpXcN72eck?=
 =?iso-8859-1?Q?ng2pugvnDrMmcU5xIkMZSIP0YYMc4HElygnbzufTw03njxUY8Bic/WaOsf?=
 =?iso-8859-1?Q?ftPxSfHOO26/f193BxnvFlhbDbkM4QTWF5Dg864hYvehK2MoReDK/a5hqz?=
 =?iso-8859-1?Q?tegaotQhQWksKkyiQF9V78Bc0rE1Y/wSIJLs9MDLZh1dwnJEDFSz3HyuWE?=
 =?iso-8859-1?Q?8lGc7TpGUXSmyAeXD5lWmUuGM7UZXM775iPT/c9DqiL5SY/qCnACHrgISl?=
 =?iso-8859-1?Q?EpunDfq+3Ss6QN6jNSdLmQQSkGdjsH4s8s7X3xmtndg7B8FzIpTwUIcUca?=
 =?iso-8859-1?Q?SCh0mKcDlyx9azbCfq0ZtSMABGdMUJcPodwDtn2JUbpe9rallD5yDq3LC5?=
 =?iso-8859-1?Q?6Tv3tEP4J0otXUC8DDJPeD70SHlsAUN+uTV55OgSZl8nyuue45HAGK/taO?=
 =?iso-8859-1?Q?+fTdtI4b9kgoApSXkHVNHjT2vuIHX1yjCnHsgDEQ4t/7/0G43rGABRZDEw?=
 =?iso-8859-1?Q?UFPskUMP80z6dA67tS3H1kAwnB7IKy49sBwSc2kmppsonu9Bq9BIFavWLY?=
 =?iso-8859-1?Q?+UiaDNSmFj522FbzcZSSygRqQi/BEhyCZSFwxu5BQF+FcIvAQQfbeNGI9D?=
 =?iso-8859-1?Q?ZZSOJQmT87yMNSVzWBj5NqCUIfcY5gXILtFrTxVE7UEeMpqPCAm8CPcdlv?=
 =?iso-8859-1?Q?/+lmHRg2BcUtXGXYh5pWYTVfMSw0653tMsLeHPpw89nbrFpEIIm51LEUqE?=
 =?iso-8859-1?Q?Em4NB5P1W6EOjIsD8LzBZGYPxqOrK7XbOw+MXUf3GIqpP/uJ5CgaUVPB2p?=
 =?iso-8859-1?Q?5Mar+DElH+rQBqLPWAlEITKgJKPl55wwu+0N5UKTjPkMQSjgBoPyhIsMVW?=
 =?iso-8859-1?Q?kiIVd1sWTp4jNqzewKExq6sSUGttZzi23fVHCUWI2e839UWtvm43YfHKPm?=
 =?iso-8859-1?Q?obWGV0w=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?tXpga9brkqj/tCwV9Wqny1ov+yEQli5KahYRb1XycLvhS6nA9wajQGEhQF?=
 =?iso-8859-1?Q?eAo4B2126spW50e2XmcTD/90qHCpuVff4fx/6xqiSCRa9oKbhiwvZXVjED?=
 =?iso-8859-1?Q?TJBcMEubb4DzdcQbZfAjDhz/0S+Z9SQZ5ZA9+aeU2bho9q5Po0hpOl9x86?=
 =?iso-8859-1?Q?wqgnH8/8/4nllDtbDxSvcgnZU853LWi01s0b7l5SOiABHeEBmAnk3QeVlq?=
 =?iso-8859-1?Q?q/A0/QJiYTyrT0ad427NPKFEgfwCCSyXIMm+S7eiTDlk50uedOHJZryu/1?=
 =?iso-8859-1?Q?40yFwbwQDZ2z9jEzvD+xbaUAo46luQz1ffn3HhwzM00gXFJDC2xR0d0Gcz?=
 =?iso-8859-1?Q?pVSsNxX90paMT7mhs3W8GloLP1xlS/pa9yAccH0ZewCYynvS038cEn4dZ0?=
 =?iso-8859-1?Q?BkGYsXoAnK5CvdYpL9xE6BBLgu1NK5YMODDEo/Jqbm5G2VprBv5WEgHfa8?=
 =?iso-8859-1?Q?7yVTzaX1FeTTgK1J+rLZQas1uJymb9RM3kG9xuZtSDqTepXF7PBbJVbzn8?=
 =?iso-8859-1?Q?oppV7MhRb9UHSbiDhiUFAZQFjnrojhrDZBPfwOonbRCI9//LKlbJNPaJaN?=
 =?iso-8859-1?Q?olKb3z85B1963by67qasdI4mW5MRsumue+flwHxwz08ZIhAzCSH6tL3PYu?=
 =?iso-8859-1?Q?Rc41zWm5qjYCylA3G6vvmmu4zO+EKEj7s61cWIx1wqQ8KvWfxsL1+/mlxe?=
 =?iso-8859-1?Q?jyu2gQfjAgSTOQXsX0MI0aVpUi+Fmm7Ltfhv7WK5a+634tYnNnZpfA1rMc?=
 =?iso-8859-1?Q?82qIrgBBtEwGTiV0G1Nkl938WRfa1XHRuft/wmXTVO4iCSRIZqXmi299Uv?=
 =?iso-8859-1?Q?BsCLMn/YlkhLyEAnBZzccs8cuTt969k2SZhklEkG4l1eumMbSvosHC8oDe?=
 =?iso-8859-1?Q?YGoHr+6aCH0Xi53rNV/Yxnt/zj2681L0z97QjWq6j0pBcBzfCAT5rnp5vi?=
 =?iso-8859-1?Q?i4V5wp/rmDmYkfbxuc0y+B2Cvs9vwZ91zc2Av82FraDCFB+Vkav7fXfJMz?=
 =?iso-8859-1?Q?1OlncVOKqhm2qlc58LSnxP/QZ2VHUo/KcmezgGuOoqVTsX4K05iuNqS4qQ?=
 =?iso-8859-1?Q?+J9/Q574NGQD97T00305cqJ/JbfJ5XQsY2Jmk5rAoMShPQAJr16TtXsjYP?=
 =?iso-8859-1?Q?UpJEFaLAb30HZ+qLuWbdRYtTUzScgikHzi56SCjEBQN42jWYhBQVO4z5Vc?=
 =?iso-8859-1?Q?5rYGLsEGbzf+iHEpDfhCFzlOLzpUzbHnUQTkwk7E20PL1N9KjqLrgn2wuL?=
 =?iso-8859-1?Q?GCPZPEvazCHcJr9kQctIQtRqh485qb5+kzEdQkSV6Uy6yFF0ungrExo4Fg?=
 =?iso-8859-1?Q?YYgux6jTt6x8xq5e76F0FxKoFHlxj3t2QlOM+6p39hi+RL7dI27EtO05RH?=
 =?iso-8859-1?Q?ah8tMulYezi1ZlaYwFLLTiR4BaxpfpbYmFE2Q6VVDtx1hSWihG3uDkl0yz?=
 =?iso-8859-1?Q?XibOt5K9yv+dzXOEDTIXVFrxQPcVtD1di+SmgyJu8LCWC6dcVt5PAFO5RF?=
 =?iso-8859-1?Q?hYKerPUWG60fS0mCvc3ZKDSDY5UWgIUWFz3zEanyik10k4ZLYHTFWtMSlL?=
 =?iso-8859-1?Q?4bV6/1VoeZ1JslNRsUXfxf9+EA5ojOBQB7I0rLFQ/Cg6D6Wr7+2/gwM6E9?=
 =?iso-8859-1?Q?uHNAvL7TFv+G3s9ViSdu6UEaOkQXX3RKpO4B09rh8fcmzuubcZFc0pKMTR?=
 =?iso-8859-1?Q?4FhPgqsU82LcUrZitXc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5474deb0-0407-4c8d-4ba0-08ddcac26630
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 14:57:24.3069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zAulWv8y9WvCkbK2n5q5uKR7lCvUfv+M1Lc26E8ehtJxjUH0IrVSlixauTfdrng+hVnsxBzaKEmjN8y0CMcL1YIy8CRvd+OeH/3q6RBBPNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6756

Hello everyone!

### Background
Unlike the Linux kernel, which has supported extended shared peripheral
interrupts (eSPIs) since 2019 [1], Xen currently lacks support for this
interrupt range. For SoCs with GICv3.1+, this feature may be essential
because critical devices, such as consoles required for booting Xen
itself, may rely on eSPIs. Additionally, these platforms require eSPI
support for fully functional domains, as any device using eSPIs cannot
currently be used with Xen setups. Without eSPI support, Xen cannot run
properly on these platforms, significantly limiting its usability on
modern ARM hardware.

This patch series adds support for the extended shared peripheral
interrupt (eSPI) range (INTIDs 4096-5119 [2](ranges of INTIDs)) for Xen
and guest domains. The implementation uses a generic approach to handle
eSPIs, similar to regular SPIs, while maintaining compatibility with the
existing SPI range. Functionality remains unchanged for setups that do
not require eSPIs.

The series includes:
1) General refactoring of common IRQ operations with GIC registers to
improve code readability, simplify further maintenance and prepare the
key functions for eSPI implementation.
2) Introducing a new Kconfig option (default y) to enable or disable
eSPI support. Disabling this option prevents unnecessary resource
allocation for setups that do not require eSPIs.
3) Adding additional resources to store required information and operate
with up to 1024 interrupts from eSPI range.
4) Adjusting assertions and checks to pass verification for INTIDs in
the eSPI range.
5) Configuration of eSPI-specific registers during GIC initialization
for systems with GICv3.1+ hardware.
6) Enables eSPI MMIO emulation for vGIC, allowing guest domains to
access and operate within the eSPI's INTIDs.

[1] https://github.com/torvalds/linux/commit/211bddd210a6746e4fdfa9b6cdfbdb=
15026530a7
[2] https://developer.arm.com/documentation/198123/0302/Arm-GIC-fundamental=
s?lang=3Den

Leonid Komarianskyi (10):
  xen/arm: gicv3: refactor obtaining GIC addresses for common operations
  xen/arm/irq: add handling for IRQs in the eSPI range
  xen/arm: gicv3: implement handling of GICv3.1 eSPI
  xen/arm/irq: allow assignment/releasing of eSPI interrupts
  xen/arm: gic/irq: permit routing of eSPI interrupts to Xen and domains
  xen/arm/irq: allow eSPI processing in the do_IRQ function
  xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to allow eSPI processing
  xen/arm: vgic: add resource management for extended SPIs
  xen/arm: domain_build: adjust Dom0 IRQ handling to support eSPIs
  xen/arm: vgic-v3: add emulation of GICv3.1 eSPI registers

 xen/arch/arm/Kconfig                   |   9 +
 xen/arch/arm/domain_build.c            |  10 +
 xen/arch/arm/gic-v3.c                  | 172 +++++++++++++----
 xen/arch/arm/gic.c                     |   6 +-
 xen/arch/arm/include/asm/gic.h         |   7 +
 xen/arch/arm/include/asm/gic_v3_defs.h |  37 ++++
 xen/arch/arm/include/asm/irq.h         |  26 +++
 xen/arch/arm/include/asm/vgic.h        |  39 ++++
 xen/arch/arm/irq.c                     |  42 ++++-
 xen/arch/arm/vgic-v3.c                 | 248 ++++++++++++++++++++++++-
 xen/arch/arm/vgic.c                    | 133 ++++++++++++-
 11 files changed, 682 insertions(+), 47 deletions(-)

--=20
2.34.1

