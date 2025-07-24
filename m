Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C76DB106C5
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:44:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055561.1423966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesVI-00030v-9G; Thu, 24 Jul 2025 09:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055561.1423966; Thu, 24 Jul 2025 09:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesVI-0002yr-5o; Thu, 24 Jul 2025 09:44:44 +0000
Received: by outflank-mailman (input) for mailman id 1055561;
 Thu, 24 Jul 2025 09:44:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G4HJ=2F=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uesVG-0002xM-K9
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:44:42 +0000
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c200::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d238f156-6872-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 11:44:41 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8003.eurprd03.prod.outlook.com
 (2603:10a6:20b:42a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:44:39 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8964.021; Thu, 24 Jul 2025
 09:44:39 +0000
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
X-Inumbo-ID: d238f156-6872-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqljdOAfMn8xr3X1H3kX9I6k3fKjmGLrnq1EwwNiMkJgqPf15fa7UC9JxW07cNqWD1/GSdChPO8+HKB71Wo72THCjq2QgSpEvh9yZMK51tLN3+yxsak4iDsu9+ijXXz+dacioH4zS/MKKCBWvNC4r6HqOaoJuJJmIpTKyxHlNBdmlarOEbexXoiric0Vom7NcVeirQuahoY0ylLlzQzCu8s9NW59x4E3wnVSLcF88cbz/hJXwAzwsfEZ/3R74L2qp+tOvH0Y1vkAJl78IPIDHmoDhCvycrBHTndiL4qTqwu/AnVDgAqPrAVdywjEdwb6sdVkM8opYZJV2hw/ndZNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iHxW7ZoeNWT51VIykahZIObN0ONV7exPRAU7jeTbWw=;
 b=U+CjR3WfMuDx5pZQmUQOUVh6rygalWo0IuRLniyInDMQA/1qUZhtl0a9Zm5rhTQ4wyQvTtpiZYSVtoSitO3tr2DqrbOxWwbZQD3/I5YuOz4fqnEiSZP/b7+zbWx1E1vboO5owGitPifOogRbhIvwpYM1x9n8+RwGVv8m7leqQaILcz5gfOJko0Xpc7rpdgM939hLWqaWS5WY7vCLqAA2s/uCJLH0tGvrr3OQR93UR9uM0mfcBfiFDFVWfFk4wMe5knkQ24p+f8FeUc6f5Zbex8GNLsf4ywvTZSJ4ihzbeMEtLweI3pQyCDzTJYD8tLTu7uODfuO4Q+Omk5j1VZQqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iHxW7ZoeNWT51VIykahZIObN0ONV7exPRAU7jeTbWw=;
 b=mqLWIrOPOC6L9XslgeU0mZQ/4XQ0KLlIEnC+204/6hvlyJjHmifLs/uj5VWG7QkxUjk/K1PibY1qtGIr0ruh5XxGT9PxqlzTUE+OfOU6QGzMFw29n92uofCOdBqoOeSIoXPkGCdKji3qDuIdwXg3QatUmbddu2X5v3X4VLAfpJJ+YP1cbkCT3cpN0sAzvf1vsCMC6vDiGYTv7Y3T8DRJZnCMcedglF+VLEX3fq6lfIuPIyKm+RzZeQ9C7KFPhX6a2h85rPMnl3j8TaCOg/8TE65cfKAzSGCiGyrE44ViqNH94BJYOmzAvHDATTrrY7LMYqQYmvSNEyTHqv0p5GvhhA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v14 2/2] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v14 2/2] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHb/H+SnDmWJDLqv0qq6DzYKbH52g==
Date: Thu, 24 Jul 2025 09:44:39 +0000
Message-ID:
 <cac6ce4379335b9a671eaddb934226363b3087f7.1753348261.git.mykyta_poturai@epam.com>
References: <cover.1753348261.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1753348261.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8003:EE_
x-ms-office365-filtering-correlation-id: 958f120c-3f29-493d-7758-08ddca96b55e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5+nvmg/aWWc/EaLeuV2N0TlPwbzdlz+Qx/pck4NOrroAE39fx5pvoiDVzR?=
 =?iso-8859-1?Q?hlvfSjsAQPDMKvhTQAJSc+BG8f8+9ujBbeBZLk63VbtF9Emf49m2wk5SgU?=
 =?iso-8859-1?Q?ohCJnncxt0XKIoS//74yIJE6PFs/k4xmiGmsaHJeP9k2J6QMM+xwTEJONY?=
 =?iso-8859-1?Q?DbfLE7OVezdjIxKridpIwvQFWgfLtxUsn8pTUupBhNcbJqqI4kOd3EvaLb?=
 =?iso-8859-1?Q?z9XrXfu8E8zpptpORp1CyL7F8Gnj1usUxDIkml8gCU7wiY6AVNTq70N7Wf?=
 =?iso-8859-1?Q?vmAcjj4OSmLdXFR81Kj3Too59Z+p4xPDMW+aDlJ2B1zc9VKXO1iEc3Kgks?=
 =?iso-8859-1?Q?+07O4Tff5ZshsAQX1uCM6fLS3HPoe5D9DSu4vstY0TV9TX0JD7TPa6k/uv?=
 =?iso-8859-1?Q?VtLm1DdIjCi8oy7WFKPB24fcGVNZqw4VEa7XiaPOf7gyr3HshAR60aRq6f?=
 =?iso-8859-1?Q?ec0byEKfWVYpWu3XCc7wpPXAm0NMu6dWGrlu/I3zYWOL5Eu8L0S4ClG8aA?=
 =?iso-8859-1?Q?LD0TuGz+da5lnq6uoG0c4/z+vXQIJ3IVJl3aChOtFMPkqvD9vSpBVbNQqg?=
 =?iso-8859-1?Q?JOudZcNa7FroS/tlV1ZaQR0zTYEl9JtfQAyZD7Me5ylrX+0xYZDGEARtt+?=
 =?iso-8859-1?Q?rAIqa9vtFrysIK6/hBtR59/a3TYyYRdqLQ++mOygoEhIlW6jEvg1d+Sock?=
 =?iso-8859-1?Q?dIIRhGpNCSFPnpktd4c+9lKQfyKPMKLEKdaE106eO4xrdsJZYVSXSj2SFY?=
 =?iso-8859-1?Q?0mYUy6m+MaExKOXhqKYV8I86xNIr1rcTuLZaGTxXycIxJFQxdqONRmWAwi?=
 =?iso-8859-1?Q?Md2RPCBFLMF0PrZ33zd0AkNXiBAlnCXxaFaPMZGxnHKGMF8xWKHm9qrQ2Q?=
 =?iso-8859-1?Q?RQ6DVRzEMLRM2tomkjFds/SZwFdFuDo/4+bSHGc8h586N6350sgL6KtRbh?=
 =?iso-8859-1?Q?/Uu8fRVUBJ6dknPFwL7x3/1ZLEBR2G11Ser0SflFdP814pti1DgU+Z/UyY?=
 =?iso-8859-1?Q?8SkJS9v/GlX+TzXezz8NTiKCGOhqV9xivh4Nyw6RuQ1gma+e/QF3clxN0d?=
 =?iso-8859-1?Q?e1FDxpvBHj5GCUhQaFaJr0EIKvnzA64er7OdsRzoJf50Nwy13loTbAU2lt?=
 =?iso-8859-1?Q?qfmiIBAvqvjbDCTe3qdVTftKakgTy1K6lrU2yRZeF9H+xR0KnY8U8DyR70?=
 =?iso-8859-1?Q?23xkiwDRpDD7dpN0sSk66FnCWqJIvgM3e9OD8IDx/k22A2Er8DX4NsxVb7?=
 =?iso-8859-1?Q?qRWlfhilo+oSn1yWBEE7TZ4tJ4TC/B8rAsjTPA4IMeJ5IS7WJ0sLVvg4Zd?=
 =?iso-8859-1?Q?oml99r2dvtDMGRbtySjA+w8rsmPGyvXOFa4/GMRrajUL/WTFVBnrPhuuye?=
 =?iso-8859-1?Q?ZRJzpluIYj/a/UrCL7BzAWCQA2oEUllVThlZVdw67r/CcgfH2w85RKWZP+?=
 =?iso-8859-1?Q?gRJtL3oFgYCyyUpF+9ZbJ3vD8a1zLGfF8ksKaI/YmkYbfNH71M8MoKbznr?=
 =?iso-8859-1?Q?Y=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hzILvtdmpbCqyesHS7x7Gx0sqLUIVGo2nIiTiriv6E3wt463VbLS/Zeu79?=
 =?iso-8859-1?Q?BN3TdzLO0kVvZC8uvQE7kSSiBlrGKIWgefgblbir4bQx05lRvZ/R1W868W?=
 =?iso-8859-1?Q?lQtvGtVa1Yp+JdzqUnvJp3BtZE5L2IPyBNmkDSFV4ck1F1Jk+u20vPq2I4?=
 =?iso-8859-1?Q?SQuCKPy7VqZtwv/Ghaly9LZZbmCkBPjfkJIbZDqqx6fmTCw6Gj0tPXT86b?=
 =?iso-8859-1?Q?ynmyow+u4nkhAHGGZW4AlSrgX5ZkoSygtoCfEWYLFFKyl+VYhvJBnUWSaJ?=
 =?iso-8859-1?Q?2sPdg0Q/d1dvN/2rSmzjjaFfvZl0uaek+01u1GgagTjg6flGZ6Cyey6FhH?=
 =?iso-8859-1?Q?uLsyB2pGmxRZbdmP12Bb/bTQnvdC3kTQvr6bIST6XlcQAWkYPbieOfphpp?=
 =?iso-8859-1?Q?87YcephVWB/FkVW3tMW4taybBOJuS0mh0tbiwgJ2wJtzJ9b+PAo/x/ZJE2?=
 =?iso-8859-1?Q?cMP09zv9ur9DAECoahIT1BAim4/Acmb82yLoUx2VLRk6eMl9e+N99zh/XH?=
 =?iso-8859-1?Q?mX6OzmaGhOp4T9t+Ws25QXvSiV6nNNUw+1E9GdvtAmGDLHJ8ieXhNnHiUK?=
 =?iso-8859-1?Q?YNNPpwQZqlJ90zkUv3DvWRRjpryJgBkI7FYEk+GGgIqYvAXGJSFVMzHo1S?=
 =?iso-8859-1?Q?SpfiVFfn4dKmI05XQIEEvHK3FK2VxdujJSq+B5ghlAC7esW6P4OKObZOy2?=
 =?iso-8859-1?Q?pa68y8RkS+xzlmn+QnH2rVLB11ZWFIql+jT6FME+WbgaME5MW+YVeLg5r8?=
 =?iso-8859-1?Q?GVoQnyMSKJjd8M+UM/MWCXB9thlp3V4A+pG1Uoa5rFBMhsS+X90GvOpS+8?=
 =?iso-8859-1?Q?OWorushlVWRmMnAc49nwWdiOvJKSiaxrI5QFFBpztGp8aopfAgylrqex35?=
 =?iso-8859-1?Q?CFaBqEtm0VW6q16qtvffC499uUPPhY3akutyx0b62YW9uZP5S+YxaXZ0wi?=
 =?iso-8859-1?Q?9faqBonly85BBcJJ/eh6yZLv7emv6mbQUmLvBRIBqALYgPtkVQCR06GIee?=
 =?iso-8859-1?Q?8MAXosqY73i+7pmmLhLI+CYjJ8uXZ/aeh43U/OJDcFEWh+LGMgyCOMOFH4?=
 =?iso-8859-1?Q?3PvjwwZp1+nvteP/QJQwLKm+YtsHiiKS8IJgAp1Ag+mqDT5zgcDoVxdgyF?=
 =?iso-8859-1?Q?nxllY8uzh1PoxSqlUMDkZlHB1bqbZC8EmfcFnZzM9FsQqV9BzToHnVY+ml?=
 =?iso-8859-1?Q?dzBa8o9HYvE0js7/CWfRksnfUX1clf1xvM32v1cuW9VRLsda/14mXvrEAf?=
 =?iso-8859-1?Q?9m+Jw5nODlrE62Re6KTukUNh1Cbt+PdxGCmB7Kh7o443ZIpxYfDC/3vFgA?=
 =?iso-8859-1?Q?Mv9K9or0u73dtbUUsmW1zj1cj+ydHIAt8cjNLbfTtVBn+mgMAjy8mg8ESw?=
 =?iso-8859-1?Q?x5bOMPGPcRTcx+EyuUrvZV7m52af43G4l8yYIXmP8pXc+jT/QZ/pptd17h?=
 =?iso-8859-1?Q?q1p0Bnh9nhKsWUzFyQg0/T+nx1/nsUD4XjPO969m00WRAPkExo2d8W9Q96?=
 =?iso-8859-1?Q?TGba03gh8ZCGt0SqNBT8+cA9z1eCY0k2wrKLovutA0aVcP65GxpdKIpEOe?=
 =?iso-8859-1?Q?1wWb6CHy/bAh64ByK730D55Y1X8txvhvwBneT27qqMN1pAmcU05A7PScQM?=
 =?iso-8859-1?Q?lTOiN3oNA2vmly+52M6W4bQNlHmcKR4ZfdVjd2V9iNcQvoiJXx4NMjlw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958f120c-3f29-493d-7758-08ddca96b55e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 09:44:39.2346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xyVlYoLqrXAjkNYihSgzq4N+eY4Ud/aWVH6rnhgCsQxXevYIchjCTRkRMUJNWhayin59I30syBoLiJZDwWrc3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8003

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

v13->v14:
* make x86 arch_pci_device_physdevop more clear

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
 xen/arch/x86/include/asm/pci.h | 10 ++++++++++
 xen/drivers/pci/physdev.c      |  6 +++---
 xen/include/xen/pci.h          |  5 +++++
 5 files changed, 33 insertions(+), 4 deletions(-)

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
index 2e67cba8b9..665b321165 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -57,6 +57,16 @@ static always_inline bool is_pci_passthrough_enabled(voi=
d)
     return true;
 }
=20
+/*
+ * Since PCI passthrough is always enabled on x86, physdevop handling does=
n't
+ * need special arch-specific behavior. Current call sites work with eithe=
r
+ * return value, but true is more consistent with passthrough being enable=
d.
+ */
+static inline bool arch_pci_device_physdevop(void)
+{
+    return true;
+}
+
 void arch_pci_init_pdev(struct pci_dev *pdev);
=20
 bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
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

