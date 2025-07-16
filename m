Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0F8B06F43
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 09:44:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044878.1414931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwo0-0000Qg-9q; Wed, 16 Jul 2025 07:43:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044878.1414931; Wed, 16 Jul 2025 07:43:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwo0-0000Oj-5x; Wed, 16 Jul 2025 07:43:56 +0000
Received: by outflank-mailman (input) for mailman id 1044878;
 Wed, 16 Jul 2025 07:43:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fgsf=Z5=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ubwny-0008Mr-9p
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 07:43:54 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e60ec36-6218-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 09:43:52 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM9PR03MB7560.eurprd03.prod.outlook.com
 (2603:10a6:20b:417::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 07:43:47 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Wed, 16 Jul 2025
 07:43:47 +0000
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
X-Inumbo-ID: 9e60ec36-6218-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HicH7hsIqaTKz0PT90bkwpfEzn4P68zkTplvNpyr6NoK3OctID60pRl8wivCaFIhvOjSWuymotbEyuURzBo1CZgWSARp4y7YT+XRY2f5XyEcUXBgKdri+/YJBX29iHPya6xQZLY+mWmQriP+yxg71Tpsa7DwH0Kce+shBP/feYos3Jdm0KEZ8cFQaIgUvqqSViJ2LJJgFnds+a/l7cSRf3sSddVZ0q+QWmqlg8bK4tVdhX7CCj/zWqtgGGVFA8vTNrAOo+gCc+tXEfDOAR6rjkrnRBG7dDvGu/dJ43KKHsAHKsFI0TUT6M36ueozyYrNcocq6dHAvmJMdacvKEzHQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGoUw2L5VQJKdN9YH0hBnYFS4mAon+CaHtTOATgrQ88=;
 b=Xs1ylPPhkaySVAnah/YiAkDSuz3yTp+QS/JTTrNoqEdfvXuiG5hYB8cod4eN/6pDGFQe8ecFfQ1IQVMBVYtHIbdG9SCAxUQWqnjrMKE7zpEYXRpK5LXyay9l1FRT4FkgPXbQIAw08us20hUVhhFyf2YObYGBB0Hk3qPjm/fJYDwZIfHo7GwiiuW1xK6uvjh6kJIxjWn9eoiD1O0zak+nH5WOIJu3CvDrLCw/FtirPmGVzt77p66HIhV6t4Wi4R2aN60ehhRQLFV1gPiRBPtzztzZAykAwvhdOkm5x+4/rPUixIKQ992Mo4AXahaPgwIDOhxBVG5Y83zOYdYx5/BibA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGoUw2L5VQJKdN9YH0hBnYFS4mAon+CaHtTOATgrQ88=;
 b=LXqQzljzXjVbdAX5o4t8TnlQQUyY2OC93zZWNRwmDzvjPDc/5ItN9lWKJJFxjPX7tgyE2ugmNEEdS2/KT+LY1HarRlktIza3v0WapjjkSz5lEieuJwzyzU5M2s2YiMRGJ5Zicis2lny3HSss32JGV0+z5PsiUFuFNC31v7oZ8Gzxsi5QYu+FVWhoyjlUI9n/qUOFXTzTpsXgYp57iJe1toeYPakxo3z+C3z1bpWGSPsa1gi+rR6W6/yyNkn4/A4ZWS7imz5yc1aOYJPP077kuUi9RwHJyydOuDAmFGSwFh2LHK5V+P5mXfYUZeJkppfk+ELYtH0dmGDcOSf/Bztb/Q==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v13 2/2] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v13 2/2] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHb9iVcIej+TVkxNUi6dscY2bTP2A==
Date: Wed, 16 Jul 2025 07:43:47 +0000
Message-ID:
 <7fee1963a17015a4b77b0ac10618198a2647acb0.1752649797.git.mykyta_poturai@epam.com>
References: <cover.1752649797.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1752649797.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM9PR03MB7560:EE_
x-ms-office365-filtering-correlation-id: e3fd0feb-f041-4ec6-bc10-08ddc43c7f7e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?GTkDPQ2siLewHEACj72DtkLmIZSX5IxzIq5vmAKW+pupyw0c1GQo+z048q?=
 =?iso-8859-1?Q?h2d2lnnAmgAkQGOGBa2a02r3cd+gLffDF6Jb4R1Zn1ndZKBBuoZOV6d3UL?=
 =?iso-8859-1?Q?48uGB0+rCZ5NEPDtOEQoUaNioiFZykprMGVt4/42CWUZ7KTzyuqFsmH7lF?=
 =?iso-8859-1?Q?NO6pkioBXr2Ty4nvMpMCU/etwkthGA92vH5l2knN0Z4SdyOuULDzk1DKrQ?=
 =?iso-8859-1?Q?+omaHyQ4ZIoTZIArerc9yRnpudOY9cz/xprI0T9uLhdkIFsBYxXgo5PD26?=
 =?iso-8859-1?Q?tShIeeY8ywHoQ8Yi1woXbxUWd3sIHmZWhBumO29z3rifkjp+oHpjh0oaIV?=
 =?iso-8859-1?Q?GfNax+S4u4NGvP7SXg8Y6UFG61QgW7ROak7tkVnQJuBnTgTFBdnlPCqp/E?=
 =?iso-8859-1?Q?yUCOWrl1aDvYvU6JFbQSO8elSvvCveofkc4hEUS6hjCQLSSW9myj7BXvMH?=
 =?iso-8859-1?Q?gHizUqUfjtNO2mSM9rerKYvtsoKC+HyqqHbQsjD45fRKSTrEoD2f0y+QCs?=
 =?iso-8859-1?Q?fXWr2UtILdSZMSgPyV+JuMgouGe6V+w39MBUmxRImHPz681t4I61GNbDd7?=
 =?iso-8859-1?Q?8Q4Ww/x0MEJhhD3kfnDP7f82lcjWMUdaHyk521pBF45dA37B6vTRON06cs?=
 =?iso-8859-1?Q?1pKZyfuCO/cwBntgATZFJv1QraUb4+JTLc7E7RFH7i9B5GsTRlETc2ODjJ?=
 =?iso-8859-1?Q?ldPWTwVckUhfw/eDMIndSG4AqeUGT/IYOZ/cJgnQIB7GDn0Y7iDv3im5BD?=
 =?iso-8859-1?Q?QBRIEsG58cqoNbr/yOQmCVMJAkYH8OFZSk4is4Nq3keLM3ofjd6NcanDpJ?=
 =?iso-8859-1?Q?Md1bXmWCDwtpF6UztbL3tBhjDfEt8YkiAamYcUU1xCctGJDoSdWqt20LM1?=
 =?iso-8859-1?Q?ej9lKhEIppQZ6PAGCuIoTXtJnzn1bbRGTVGqBVsNw/0vPAELUzObbFc/nR?=
 =?iso-8859-1?Q?qsKQMSFwt2UBwB02KyYVLHx4CAFYeAqYd6G5jKQGLA3rzykrIdN2YiuV5E?=
 =?iso-8859-1?Q?DlpfdWT4QcoCMyX6CO0I44bq97RbMDhSDnpVn9qxRBg1CTeAIHjcunWqUp?=
 =?iso-8859-1?Q?jM7440m9epLxFnqt+Ei21vZFzp6CK4z1SNYSvmxhjA6J/NTwZYMjwuAi+b?=
 =?iso-8859-1?Q?NfAVQ39FGWJULTWmGpu4Pmc0eDFy8g5iMA1Zo1LYMS3k8a2ykgdvDceMTo?=
 =?iso-8859-1?Q?Al7YhgOs5yacNizzR+duqKPFdMmcrRcUY6lSRfXtlG8QCS8L5YigQa3oeO?=
 =?iso-8859-1?Q?lcWhqmujdS3JdFv9S9USVPn0bJof6GIWnHb8MAp3dEY3xa7Yp7ufYJ+wOh?=
 =?iso-8859-1?Q?Nt/EdxLkV4dZdEjDnGAm0t+RiU9g0oQQRCLnr//kvKYn3cd6F87d+UIzn+?=
 =?iso-8859-1?Q?Ow+p3hiNL1cOqA3cnmZYx3pl+m7UDUlGeaPtEeV6DKJ6NFVcYr9XLatiDE?=
 =?iso-8859-1?Q?ZjKAJQbg/I4+/1Vh/eh+x3GXeJuAckkBtfGXaAyi4MBwC5DjtpRGTDezCQ?=
 =?iso-8859-1?Q?I=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nZHqKp0YoNQKN6wMhzYWqVAgVNSBnH3eCpRHb7R0up7/PZSGV+wSZuL9K+?=
 =?iso-8859-1?Q?asEoT7oHd/zTXOGaERHSuFadOZBVlMVybWlEUukIepvLn8A9p43y0+AIA6?=
 =?iso-8859-1?Q?Bls+iGJ9egPMOqbYgjVyjcZKnhqFEp/+X9byi9h6+03YrLaXpkZGmEYIGK?=
 =?iso-8859-1?Q?DdEflvL8ezhFBb0B3wmD0Xm/oLBEHGBv35PxguLawBxn6+qTpsqXjI39V7?=
 =?iso-8859-1?Q?Xs1RTXVYCLdRrZZhJdmfARyWQ5U2u0lFGnoYWwWcQpjtFweWoR3XNuTeBa?=
 =?iso-8859-1?Q?WHWmGAfxr0Vtb0ntJXm4iCsOvFH3UtqswmjVxo8wUfG0woub/gVAXIc3nq?=
 =?iso-8859-1?Q?x2qxEMTst/LzRq2GCT3fzdBG0VfPNRbLfUx6yGtNJ0N/SbqJq9a+jESKA9?=
 =?iso-8859-1?Q?AAk0/+QSceoDQ9zYSncjqH91ps3w8tiOsJRyV5JX94AzIPl1imxio/tSW7?=
 =?iso-8859-1?Q?9to9A8zCaMAKEa7x1AAZl6VnGKPdtUAcQVhKG7/RpnRfD/KKSfMxH2Wtso?=
 =?iso-8859-1?Q?eajprAtEqFmZ/+1bMKa8dVUpO1Xss+Af9fgjhXjZVBNW3IWLzg/DUaVRri?=
 =?iso-8859-1?Q?bvL3ie0geXIcSi44mINECy6WteOoRAZ3LRy9bk32WdzG5HsQPXbaHox7bf?=
 =?iso-8859-1?Q?H2QinGeZp5Iy+5EThBaREk/PnNHhdygba6FGeEi/xCGAz3Mq0aMaVWtGw1?=
 =?iso-8859-1?Q?waQqeY/N/f3J9KoFCFLMN9rBJfKFt8jOdepEi1IxO0FPV40RrluuF304Fp?=
 =?iso-8859-1?Q?C7USoayW101ARSkbhTj6ndO907nM9GFvwxcrwzYT9InuUmwcfFAgpJRLdg?=
 =?iso-8859-1?Q?R5quCAJJR7EVY2UgAMLUCf9eirmTmHpYEojK+My25rhW8eemTcs6ImZdk1?=
 =?iso-8859-1?Q?812E6QrxqEXdatVlLx89Mh+dUbRkO1gVKr7slvjsPlW9AWMwV6MeVlhVGj?=
 =?iso-8859-1?Q?+GtLMwsT2IAu5//PSV2M9eAv/d9EtHDLuT9ssvp2hIvuo3IUtUb91Bh+76?=
 =?iso-8859-1?Q?oxZIE+4YwIhuqLqi1/5PmdM65xVpa56T1G0pGc0cEHHBeMauUWwFW4JaRV?=
 =?iso-8859-1?Q?q7QoiQc9g5H07QuMzLK2VA8WoijjzJuJtYHkHK0gd4r53fWv+qWLF/2c3A?=
 =?iso-8859-1?Q?X6jh3Qy7/H5lENT/0PaStOn2bII0k2ELq4qhPdG9mFc/+9QxlG5unNsuzO?=
 =?iso-8859-1?Q?DuFP6WVF9ELp6ECLE+l5v23xDrE8SPvTUlxKEOIeqJ3X9NgKn9ZEoHYI9s?=
 =?iso-8859-1?Q?kshKQZqZC2dLGdRQhFVMfAFWCMo+dOb8StRyPJ5FAsohMIVcZd7lqifzwB?=
 =?iso-8859-1?Q?udAzimd1pHiUL3Gxt1l/QpwVrXytsVD1BFgjBEchZXj1e8N/F/1Ld34Ste?=
 =?iso-8859-1?Q?xX5lcjNCBvJMNC3k112QIuncVGjlQ1f7+9raNrx7efXAQUgn+zC128uewS?=
 =?iso-8859-1?Q?rCnld8zf6hiF9xg+XGDZLKHEQXpFwhBLhYwFdnbJ4PMiFLwbRVDgajnT8C?=
 =?iso-8859-1?Q?b1JhOqn9SdXQ/WlGKJNaKmCIiKe+bOLdLzjxo3KHE5LpKU8UldOtrqX016?=
 =?iso-8859-1?Q?zfVwnTy6R0Olzu8eO0cAOkzhEsDtC1Xrz+jCikJTKERe0BDpw8yzZ7uJTI?=
 =?iso-8859-1?Q?3OIXjZk5BNNMbIXBfeGFbD956dT6kvTIg4oRYVMgvsJNwg+AfLch4xIA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3fd0feb-f041-4ec6-bc10-08ddc43c7f7e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 07:43:47.2247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SKEtg/ceVTrYemAaa+f3631AR0rTqzPeuCpOQkh/2lZmrI30t5VJio4i7fJsZuZMgSvvuM/OpYp95vrm055ojw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7560

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Enable the use of IOMMU + PCI in dom0 without having to specify
"pci-passthrough=3Dyes". Due to possible platform specific dependencies
of the PCI host, we rely on dom0 to initialize it and perform
a PCI PHYSDEVOP calls to add each device to SMMU.

Because pci_passthrough is not always enabled on all architectures, add
a new function arch_pci_device_physdevop that checks if we need to enable
a subset of the PCI subsystem related to managing IOMMU configuration
for PCI devices.

Enable pci_init() for initializing Xen's internal PCI subsystem, and
allow PCI PHYSDEV ops when pci-passthrough is disabled.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
This is the last patch from SMMU-PCIe on ARM series
https://patchew.org/Xen/cover.1751439885.git.mykyta._5Fpoturai@epam.com/
hmm. Since
  dec9e02f3190 ("xen: avoid generation of stub <asm/pci.h> header")
Should we also move is_pci_passthrough_enabled() back to xen/arch/arm/inclu=
de/asm/pci.h ?
Not sure if PPC/RISC-V will plan on using this check.

v12->v13:
* move introduction of reset op check to a separate patch
* update the commit message

v11->v12:
* add enabled checks to pci_device_reset
* fix style issues

v10->v11:
* always_inline -> inline
* add comments
* clarify reset sub-op handling in the commit message

v9->v10:
* move iommu_enabled check in a separate arch function
* add Stefano's RB

v8->v9:
* move iommu_enabled check inside is_pci_passthrough_enabled()

v7->v8:
* bring back x86 definition of is_pci_passthrough_enabled()

v6->v7:
* remove x86 definition of is_pci_passthrough_enabled()
* update comments
* make pci_physdev_op checks stricter

v5->v6:
* new patch - this effectively replaces
  ("Revert "xen/arm: Add cmdline boot option "pci-passthrough =3D <boolean>=
""")
---
 xen/arch/arm/include/asm/pci.h |  2 ++
 xen/arch/arm/pci/pci.c         | 14 +++++++++++++-
 xen/arch/x86/include/asm/pci.h |  6 ++++++
 xen/drivers/pci/physdev.c      |  6 +++---
 xen/include/xen/pci.h          |  5 +++++
 5 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 37a6f14dd4..08ffcd4438 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -151,6 +151,8 @@ void pci_generic_init_bus_range_child(struct dt_device_=
node *dev,
                                       struct pci_host_bridge *bridge,
                                       struct pci_config_window *cfg);
=20
+bool arch_pci_device_physdevop(void);
+
 #else   /*!CONFIG_HAS_PCI*/
=20
 struct pci_dev;
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 8d9692c92e..beb1f971fa 100644
--- a/xen/arch/arm/pci/pci.c
+++ b/xen/arch/arm/pci/pci.c
@@ -16,6 +16,7 @@
 #include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
+#include <xen/iommu.h>
 #include <xen/param.h>
 #include <xen/pci.h>
=20
@@ -75,6 +76,17 @@ static int __init acpi_pci_init(void)
 }
 #endif
=20
+/*
+ * Platform-specific PCI host dependencies require dom0 to handle
+ * initialization and issue PHYSDEVOP_pci_device_add/remove calls for SMMU
+ * device registration. This check is used to enable the minimal PCI
+ * subsystem required for dom0 operation when PCI passthrough is disabled.
+ */
+bool arch_pci_device_physdevop(void)
+{
+    return iommu_enabled;
+}
+
 /* By default pci passthrough is disabled. */
 bool __read_mostly pci_passthrough_enabled;
 boolean_param("pci-passthrough", pci_passthrough_enabled);
@@ -85,7 +97,7 @@ static int __init pci_init(void)
      * Enable PCI passthrough when has been enabled explicitly
      * (pci-passthrough=3Don).
      */
-    if ( !pci_passthrough_enabled )
+    if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop() )
         return 0;
=20
     if ( pci_add_segment(0) )
diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.=
h
index 2e67cba8b9..3830232246 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -64,4 +64,10 @@ bool pci_check_bar(const struct pci_dev *pdev, mfn_t sta=
rt, mfn_t end);
 struct rangeset;
 int pci_sanitize_bar_memory(struct rangeset *r);
=20
+/* PCI passthrough is always enabled on x86 so no special handling is need=
ed */
+static inline bool arch_pci_device_physdevop(void)
+{
+    return false;
+}
+
 #endif /* __X86_PCI_H__ */
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 78de67ec64..d46501b884 100644
--- a/xen/drivers/pci/physdev.c
+++ b/xen/drivers/pci/physdev.c
@@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         struct pci_dev_info pdev_info;
         nodeid_t node =3D NUMA_NO_NODE;
=20
-        if ( !is_pci_passthrough_enabled() )
+        if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop()=
 )
             return -EOPNOTSUPP;
=20
         ret =3D -EFAULT;
@@ -57,7 +57,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
     case PHYSDEVOP_pci_device_remove: {
         struct physdev_pci_device dev;
=20
-        if ( !is_pci_passthrough_enabled() )
+        if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop()=
 )
             return -EOPNOTSUPP;
=20
         ret =3D -EFAULT;
@@ -74,7 +74,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         struct pci_dev *pdev;
         pci_sbdf_t sbdf;
=20
-        if ( !is_pci_passthrough_enabled() )
+        if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop()=
 )
             return -EOPNOTSUPP;
=20
         ret =3D -EFAULT;
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index ef60196653..130c2a8c1a 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -79,6 +79,11 @@ static inline bool is_pci_passthrough_enabled(void)
     return false;
 }
=20
+static inline bool arch_pci_device_physdevop(void)
+{
+    return false;
+}
+
 #endif
=20
 struct pci_dev_info {
--=20
2.34.1

