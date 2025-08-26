Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8336EB3675C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 16:05:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094539.1449902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ6-0000cj-Vl; Tue, 26 Aug 2025 14:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094539.1449902; Tue, 26 Aug 2025 14:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uquJ6-0000O0-JM; Tue, 26 Aug 2025 14:05:52 +0000
Received: by outflank-mailman (input) for mailman id 1094539;
 Tue, 26 Aug 2025 14:05:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqrf=3G=epam.com=Leonid_Komarianskyi@srs-se1.protection.inumbo.net>)
 id 1uquJ2-0007NC-J5
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 14:05:48 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c325363f-8285-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 16:05:46 +0200 (CEST)
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com (2603:10a6:150:7d::13)
 by PAXPR03MB7887.eurprd03.prod.outlook.com (2603:10a6:102:216::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 14:05:39 +0000
Received: from GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9]) by GV2PR03MB8678.eurprd03.prod.outlook.com
 ([fe80::4eb:3e7b:1ffa:25f9%6]) with mapi id 15.20.9052.014; Tue, 26 Aug 2025
 14:05:39 +0000
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
X-Inumbo-ID: c325363f-8285-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N8KM5iZd09RhkjxVToc1OZbJz280mn95Gf712fEW1nULP+bcEcugyt7qs5lo0yD3hMO5fn3lceC2HIeE5fCMo9hKMbZMJigeO6sCDG4mXJd6XEwMFsYfc+D74VhPL2wPUkfzIDztul+g6OPszXtrOLgYmPYiCNUqIikgSBEwDGQdBdBU8ZCylROGo/zX2BGzndTm+fcNS6IHFf/rMI83A/2kEaWhyIVYHGQncHWX1hLFWrlGXO9wwIhldl/Bs5/4hpMrc9hyMznhW9piVWZEA2Byvzg0SjMLAimywDC+nRwqG2Ot0YZ2NSViy7P64Mnnf+yYDJQnuq4yM9mEGMQwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYoVNJk58OQZq82ieOAGJKlEee8Hur+e7ApKFsLILnA=;
 b=R4Zw4rYZnmqU0Bb93Rc9G0GpDlJL7XdtXf2yFGIV4PwEh1jEtX+rTIv78QsE1laO1XxCxRiYjJoTzCAzxE5+vnQOGKhOFSQhzIdQSH3VHHN7cJGkhdRSs58SfjOvN7Eyu27gL5gS+kYk6NftnIfY2m3xUZ8BN45i9ZDlH7r0yzETmAx7Pi3/5vbRk41EdnVDCvP18DokR/S7o8pIdx2GsHYp3BqMrX9x+LmaJsV/rWaJMxH4a8dnUhXiD2jXXT8Niyr6HEHliJKhvu5rpObowvZTC7aPOAAVl9Yjw/Ven39bzWINNeDwH6WFFbwWdApXhy0btugu2gMUEZEu0KPLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYoVNJk58OQZq82ieOAGJKlEee8Hur+e7ApKFsLILnA=;
 b=cxz5+Y20VMc7G89BinF2XUCgrCYsBEgWaS9ca0HrjDs16I0PgZKuG0hDdqMR8vso1DUb54FmNVq+7CmGEbWhuft3BvKQEWTy7gkF7nKI/4KB/u8sTCDZ773Pz0zTXdWnvbTpUZ7ItCMnv3Sbo+MZ7RsC57e2BkKC+0Dl+joG9C6Zqdxz5srVGlyMavBx9DJjfoKCrLQnyliV/Sh5qhLHw6DNjXxSOamLVa/OL+8ucj4YoNA4afGHYqijqC45jlpoorZm5AyXPnJj8rhzJq+PBEn/m+lYBr1tNcJxc7QANPMi8VB+IHEtANb/1c3dXCkbsoR4WHrUMCKVbQ0bAAnqNA==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "olekstysh@gmail.com" <olekstysh@gmail.com>, Leonid Komarianskyi
	<Leonid_Komarianskyi@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 08/11] xen/arm: vgic: add resource management for extended
 SPIs
Thread-Topic: [PATCH v3 08/11] xen/arm: vgic: add resource management for
 extended SPIs
Thread-Index: AQHcFpKACzOaRjOW50q/bIpnflDhkw==
Date: Tue, 26 Aug 2025 14:05:38 +0000
Message-ID:
 <88254ec24a25e3d99950fb5041ac6b050aaa1e4a.1756216943.git.leonid_komarianskyi@epam.com>
References: <cover.1756216942.git.leonid_komarianskyi@epam.com>
In-Reply-To: <cover.1756216942.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB8678:EE_|PAXPR03MB7887:EE_
x-ms-office365-filtering-correlation-id: 897be64c-a7c4-48ef-f62f-08dde4a9a326
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?ZtIx72UugCzk8CKGXu7SdXiz92ABMaTHsH1EXuCg+KFEuT6VbE2f9mgc3s?=
 =?iso-8859-1?Q?M0k42XIzaU4nBUSkCjuqa6laCO5nqRthptLiNTZoI53CLA6GrgpG8PYqAU?=
 =?iso-8859-1?Q?VuUJSimR9OOzzSSRXGW+WjWnXqyOuaZCIlnmRC6j84sqK1qZSydxiPejv0?=
 =?iso-8859-1?Q?eSvOdcOpOuNeOpg2Opo/DluNFqtLdPfB06bRzjhZd8+t0NNv27ziIJBqzj?=
 =?iso-8859-1?Q?PQCzOCmkEK04ZwrEq7Hw4kGeN24mrQbCw8y6vfR4hwLaLSovb7MlAAV1bv?=
 =?iso-8859-1?Q?MN6u6VyJEXN+tht76Ky6YxeR12NeishONnxdAwSNvVNlTmZnRkMsjlsUBB?=
 =?iso-8859-1?Q?4AJUHFpOCmMSlE9LYXC1K0V6/fKB9yXk5+5Tpb6isqiWRK9h13iD7XyKoR?=
 =?iso-8859-1?Q?tlhrtcvRamPkm0Sb/sC85e2UpK9envtwJXHoISU+d2MGyYiUydcKZj/hLu?=
 =?iso-8859-1?Q?cJeOmMMgs4N4n/qaHk/dMJY6FNMXrScNyh3HLacRPPWLu/F71A4C43T7b8?=
 =?iso-8859-1?Q?PKuumvQUpMvev5UxfVRTX1tLhxxDoY7+5057fDqtd2ud7pR5vMetZmjl1J?=
 =?iso-8859-1?Q?Z/I+UhokLfbR+YirdRYXH1geDqx7bdeinYxfF3n+borFfiAsxX6uUA4C6H?=
 =?iso-8859-1?Q?fAHfwPsS4AKH9650WH1JbZT4Sucyvi/3EJE1T862/swwmKqtFrCxM2Xeid?=
 =?iso-8859-1?Q?A4IA/IFKjYvUQeUHa+7ez9OQ9pyCYwYSGgn11QFrPDjo1BnknnDHE9i4Yb?=
 =?iso-8859-1?Q?ES98kT8rLRgTHxxpLmOvjsrafegshhxs5nRmldAz/q9ib/dTbA64E2uxTX?=
 =?iso-8859-1?Q?tidT5ntjWdOgeN2Bu1qsXarb9dishHa1y5GKMRQBM8//iJ/AgQf3KaItmU?=
 =?iso-8859-1?Q?pdzwjjotYwNdd36M0eivsWY3pBY8Gk/KikuVH4Gv0T6Wg1ECWwhKw4BuBw?=
 =?iso-8859-1?Q?lMN5gjRf0zYAcmjWgLg/yiCjseTPcmUkVHC5QBPxW7toilC2bljy9h3yuO?=
 =?iso-8859-1?Q?/af8IGHCVjnDUC1qiwfj+AE4TW3yoymDG50aFcrRyXMUNJyk1flq6FXVAS?=
 =?iso-8859-1?Q?2d92zIlbwdmV2h7OPCGY3X78X8uzJ6e9lzAZ8Cb2K/mx9aBtciopDxGXW7?=
 =?iso-8859-1?Q?JgPP+ptbdp0B7+oBu5X2QJC9WZPPNf7cwJ2Q701tWvxbvXz/FIprSb0XJh?=
 =?iso-8859-1?Q?b92RVYviIsgxIiD0aOFen+lTh7qN7wZCCQ813FjbYSx1OCaRZYaaVTx0C8?=
 =?iso-8859-1?Q?LJ5sU3w3AeT4uGs/HCFE4ekSX01KDvsvmy0E5RevYeudFjJM8Inm/QBZml?=
 =?iso-8859-1?Q?HkRJszPLePNq7w/Nc+c0adeBdzJQM879J/UnJ/Bq76kuzK8sqsjVVElN3s?=
 =?iso-8859-1?Q?JoAoSF1RZ+cuGWPrqyFAkMg7c7erD9sGkY6OKrdpD/YlnJsz/VtHG86B4Z?=
 =?iso-8859-1?Q?P4Umc+NmvH0pWsQfsrKGiVphcssvoRZdCnxgiHgHBZg/0wGfwbtvXiyCi0?=
 =?iso-8859-1?Q?9ueqT8Hc4iEmPFaDvO9Z8kGthST+sAwRsJHIStytcTMw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB8678.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?q1FUm2OUydQ8hKSsrzLFhNb7OIxprzjX+me247br0UMEBE2oVE+QV4UbDF?=
 =?iso-8859-1?Q?LXCqMxDVv99NwrLEHcUZY6yGP2fx0AbrjTACT3NgXNHVYMAaBMTpesk8Oy?=
 =?iso-8859-1?Q?pzvUjCspzpy9CYwYmC/1+z4Wx4OvnM1Sx8VEivFpjgzMO88xmD1tutRqJo?=
 =?iso-8859-1?Q?Lyj3xvkLt5cbuO/LZsSi1OrxVbdqC4H0AI0FQAqtc5y/7+x8F8Vs1MPiNN?=
 =?iso-8859-1?Q?LgTNNfEDmKWF5qSWFv4xeWzz3MXxBox9Kd8fpJG/tkyrhByOUfhVt7I/BG?=
 =?iso-8859-1?Q?4H8qa9xd0o8QQMlMxqogXEfrEuhVddKPBP8BiH0hkq1X9bjtWAsmAd9knY?=
 =?iso-8859-1?Q?tLftQzZLuCNCe3XwD+YMnOKHa+EtGQIvXpiNfR1mkZuQeXnhXYWPG6YUmi?=
 =?iso-8859-1?Q?sn+wOm+nF70uJJhwiKf2OTKWrw2c+uZ9kHT5PA0+s4unB4kcGb0HLklIOG?=
 =?iso-8859-1?Q?OgxKBdJuCKSyCMO0wnXBga9SAicdCSJYmY7+tCg0O8sjPDDwg2VXX3WiWq?=
 =?iso-8859-1?Q?phAL5DHjsmE9l5+LVs5f56BcKxooezqXxkKMc6Q3+A7FzHgSuuf4H55+w5?=
 =?iso-8859-1?Q?Ig6PQ2fhK3O6MX/3hMHaSlDoeXKNy/XG5sFvcXCHmPbkh07dZE68wSFg3o?=
 =?iso-8859-1?Q?YHszdnQCWvFZO/vtGTl0ABuVXyku3W2hZY8t/3x7QSwSJzVVxHxtedhcEe?=
 =?iso-8859-1?Q?2qBr9rl3jJTJKRfXyvsbhfla3US8oD/xLYQlvKQ1VBVLGgEIMgooGvb8IX?=
 =?iso-8859-1?Q?t0XIAVqBm8sNlcfBNnoJt89O/krhhoXzb05n8rzMtpXB0DkXLzraec9WmX?=
 =?iso-8859-1?Q?UirLD/0zvJX3JfOpNpbTlCZWBWSVzECS+0w9lnx4BW6Xo1IsSgFkmxYagv?=
 =?iso-8859-1?Q?EjbhjDYVMfXiDdCscU+bpxwh13w3iFCb1yZCTSAWv+GvwPJ4j0oYqPkMXp?=
 =?iso-8859-1?Q?czpc9Vqigy8IOrQLVvv7E6udb4s/sk+WRaS09ychO3QDq636m5qZc4Q9mL?=
 =?iso-8859-1?Q?zkKxfqxDzSj2xV6Vu2D1MjFc+AeuebaDaKTxbPe3U7cna7ZNPzyBZ/c2hu?=
 =?iso-8859-1?Q?SdMqY8OLwvFYHkEzbNOkYzHcj1Vn4x4qlaYgPX5UuOJv2Yv7H/oemt2Wop?=
 =?iso-8859-1?Q?wactmWOb9kSUDcDYwImjXSQBsJh3QmzNUAAV2g0sZlKxiNe8Mmv+1pRfl9?=
 =?iso-8859-1?Q?u5NcZiyT4PQj/HQQtFLDWy7aeP0mQUtplJIeK7bNEYU41BEfBACPP32ZAb?=
 =?iso-8859-1?Q?bQ4TvIQyz9pTTb4nu2bPzABYRERaet8NanJU0T2XBmwhP9+ChJFf4jl1b8?=
 =?iso-8859-1?Q?xT8u1RCihiEwdOKAJqhMe4wO2GrIjaUn2C0uEFDs2cWEyD4bZpq42cgpya?=
 =?iso-8859-1?Q?mnwFCArnVhPe0pI2BhQVsKYzpESQYXbjIJ1uF6JT5hm8xQAbkt+NC47CgI?=
 =?iso-8859-1?Q?ztK7L1cEdXWU2fvve3nsR4n4M26pvRdymF+1IRaaUkG1NHfp3CrWUdEBkb?=
 =?iso-8859-1?Q?YcKhErQFoFmxOidc97UPqFoUFDq84QlQOt/4+7qui7aDKpGDy1Ziyctckv?=
 =?iso-8859-1?Q?mpvccge5giI1XZELLNcUvQiqGXtBVbCnXPIjPb2iWFfpbndwRevQiRlAAb?=
 =?iso-8859-1?Q?SqofFl5cpQFbMptZ3NPMcz19qey0rjqfJpiFW1oXMrMpiIQqRMO4pZHaJ7?=
 =?iso-8859-1?Q?KoAYwHpu99sGfupPc80=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB8678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897be64c-a7c4-48ef-f62f-08dde4a9a326
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2025 14:05:38.6764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QZBJOnRNGNNlTYZuInRRg20eQ6LS6jrz94Flf/Om/W0w+L20yg/GU16wdwqp3ZvW+RXkuowMJyRZhGaR4diNsg/deKnIFVIuXBN+C40brxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7887

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
---
 xen/arch/arm/include/asm/vgic.h |  18 +++
 xen/arch/arm/vgic.c             | 212 +++++++++++++++++++++++++++++++-
 2 files changed, 227 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgi=
c.h
index 9f437e9838..248b5869e1 100644
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
index 2bbf4d99aa..ae4119316f 100644
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
+    return ( rank >=3D EXT_RANK_MIN &&
+             EXT_RANK_NUM2IDX(rank) < DOMAIN_NR_EXT_RANKS(d) );
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
@@ -117,6 +192,76 @@ int domain_vgic_register(struct domain *d, unsigned in=
t *mmio_count)
     return 0;
 }
=20
+#ifdef CONFIG_GICV3_ESPI
+/*
+ * The function behaviur is the same as for regular SPIs (vgic_rank_offset=
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
+    {
+        vgic_init_pending_irq(&d->arch.vgic.pending_irqs[i],
+                              ESPI_IDX2INTID(idx));
+    }
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
@@ -131,6 +276,35 @@ int domain_vgic_init(struct domain *d, unsigned int nr=
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
+    if ( (nr_spis + 32) > ESPI_IDX2INTID(NR_ESPI_IRQS) )
+        return -EINVAL;
+
+    if ( (nr_spis + 32) >=3D ESPI_BASE_INTID )
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
@@ -145,7 +319,7 @@ int domain_vgic_init(struct domain *d, unsigned int nr_=
spis)
         return -ENOMEM;
=20
     d->arch.vgic.pending_irqs =3D
-        xzalloc_array(struct pending_irq, d->arch.vgic.nr_spis);
+        xzalloc_array(struct pending_irq, vgic_num_spi_lines(d));
     if ( d->arch.vgic.pending_irqs =3D=3D NULL )
         return -ENOMEM;
=20
@@ -156,12 +330,16 @@ int domain_vgic_init(struct domain *d, unsigned int n=
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
@@ -195,9 +373,27 @@ void domain_vgic_free(struct domain *d)
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
@@ -331,6 +527,8 @@ void arch_move_irqs(struct vcpu *v)
         if ( v_target =3D=3D v && !test_bit(GIC_IRQ_GUEST_MIGRATING, &p->s=
tatus) )
             irq_set_affinity(p->desc, cpu_mask);
     }
+
+    arch_move_espis(v);
 }
=20
 void vgic_disable_irqs(struct vcpu *v, uint32_t r, unsigned int n)
@@ -538,6 +736,8 @@ struct pending_irq *irq_to_pending(struct vcpu *v, unsi=
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
@@ -547,6 +747,9 @@ struct pending_irq *spi_to_pending(struct domain *d, un=
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
@@ -668,6 +871,9 @@ bool vgic_reserve_virq(struct domain *d, unsigned int v=
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
@@ -685,7 +891,7 @@ int vgic_allocate_virq(struct domain *d, bool spi)
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

