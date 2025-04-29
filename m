Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5ACAA0ABD
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 13:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972142.1360592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVa-0000cT-D5; Tue, 29 Apr 2025 11:52:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972142.1360592; Tue, 29 Apr 2025 11:52:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jVa-0000RL-6m; Tue, 29 Apr 2025 11:52:18 +0000
Received: by outflank-mailman (input) for mailman id 972142;
 Tue, 29 Apr 2025 11:52:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/zRN=XP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1u9jVY-0008D2-FQ
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 11:52:16 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2608::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64bc7b41-24f0-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 13:52:15 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by VI2PR03MB10907.eurprd03.prod.outlook.com
 (2603:10a6:800:270::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 11:52:11 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%4]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 11:52:11 +0000
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
X-Inumbo-ID: 64bc7b41-24f0-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PD5uXbC+8LnLQbINB2f4GFmldUGUM65nluF+d656m/HHfTKvpRGGEdcylB7vI87CEQIC5l8sAOI93JilVgPWwPSdgnM2O/IdSyubDzaFZn5y4C0VlKVoz1J2lTDxHv/0ujbsl9eZuxutBbXHDcAdYE1MbYJpnUtX3Ot29VRk3o4L/5jZ8IMlS7xv72h5VIylNMac5xsGCzG84aSbu6kRIjm6Yr4WTuJxh7FD+PWtn9uCGYeU9VR9yenBHRV4Swqb8tURonNe5XWlBsPKpXE3lpWtAZv+Z+XuG3rthFiGyiDxFcb1cKH1BXfHrF45dW7SFiUieeKv6k92HlKMnilxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcCLV9RnODRe2WDtRiKZ4qVK9p8GiRJduvEBRCUTL2s=;
 b=FHi7d3KIwNhFvS8hMYlGbm7158tiGenvCbLiodp4X/jBOlOOkIdGEIEG2VJuaYD0AGs6VhIhShwepG3oFHfatlSN7Bxj6mAiOqt/UtFvXjbeYrGKklBOWMVWP4X9aK8/o8NdaV46GjTG6GToq/Mu3IZ2rcLu5zDeQQBFkIoAl/ITdIh0jyOcyjh95n/9RYSh4jXllpROp5PaF0Zj+6hsiMswHWYoli60kMEeD6b/iohd5kDGtbx65MT7JwBWHYLA1HPZlEUcWHxNRGANjToVahmyjwxDdkioSlXJUYTfnXPjfnNzDBwQv1j7Z26VXswXBtICvkdJ6Wq6mliVezWqlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcCLV9RnODRe2WDtRiKZ4qVK9p8GiRJduvEBRCUTL2s=;
 b=DNvziR0avhYmSlopeVUIIHN14i+2JPSkzuHIUMgFC9Qv9o2F5B2vOixQfBDGWvsAAu3zgtglJQ5+G88WYLo5VboDXy99Ybttch+SRZZhHuawiYCJDVSMm2/JcrsS77W4H9+nZLPDsOGA9Hv+qhKsZ0tHQQA2e/GKi0ljn6Go4nRhVdwpiQfbGwO4cP/vqDyshY2u4XkCM4Yf1GQgMnJcZR/z+fP0qKLqx/4XYjKTTYT5hyGjxWEt0YU1R/Ql7V49rNfMj32QCaf79QYFgogH5Ig994Bn1KjGvnUOERVGwtPWbF54XpNBycsPzCgW3NvbHwkMVr47ztVarFIlBwrduA==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v10 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v10 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHbuP0k0QR8aqz5V029F3Jm2fq6qg==
Date: Tue, 29 Apr 2025 11:52:11 +0000
Message-ID:
 <ef583aaae0a311ac8fec8fe4f18e76e9d62432ca.1745918678.git.mykyta_poturai@epam.com>
References: <cover.1745918678.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1745918678.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|VI2PR03MB10907:EE_
x-ms-office365-filtering-correlation-id: 86e439ca-6162-459a-87ac-08dd871446b9
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CZVlF8uFIQyE2eamKD8iN116g0YTpHGBGLd8KydLyab8nPBTihqmI5yo2K?=
 =?iso-8859-1?Q?usWwo761mLZS7Q35Y+fWvwAY2f2T3guRDmBsHByL4WoMH1MHYSIBB8PDXf?=
 =?iso-8859-1?Q?1qBGSalskT0DyE+rT2VIbUBk1Mt9zkgfUOuHb5tEF3nuZLVhKRzT2f4HZj?=
 =?iso-8859-1?Q?aLdJK4mqjL0ehFYFyfviUcyLlrHSD5mKG5MozkUq5fyEl6iWC3OBgU63at?=
 =?iso-8859-1?Q?H9k6InEglwZyg3tBM1YBq47uLnecupPZs88csvqAa3XruAybNbQn1V4AYk?=
 =?iso-8859-1?Q?Rz2ynjml99vKFm7alrt4xOn8W9pGuPYjyEjK2TVB8tFDMtJmnF3RheXm1+?=
 =?iso-8859-1?Q?/7deQj5RLMv1ONN7YJPgkqb7iKew3PSZqhPKW8QJ37h40O7v9V7+RvZFp3?=
 =?iso-8859-1?Q?1Bkn/xlfR2JRiGznYsBJ0JX19oNeQyagzDkFmplPzx/0E3YKXDCHEKWLlR?=
 =?iso-8859-1?Q?IYvc2V4dwTmgnNaSlQV4A5OlgV7g69TYdNr13UrT7gT2YR3x8bGizhF7Fw?=
 =?iso-8859-1?Q?T21gEk040iFtc4GLKGWwoJ6XmMq/jCUjpn9dOOm1p1OQHETAXQfmm7q/Mo?=
 =?iso-8859-1?Q?wgmTd9ojtoVrF26+nKFZ8vfvCOdCnQ1ZdpnwWJDBfq0AGgEz5RsJKpM38K?=
 =?iso-8859-1?Q?WTkvGWotSV57y78kIgsmDxzTvXpp+LDwCXQs4vSrDAYDET/4BtrYbpuuFP?=
 =?iso-8859-1?Q?44k+0IWSMXDa8dhHksl1WryQnDTIR1LtXXuba2CtvlXwALrcSlZadBxmUe?=
 =?iso-8859-1?Q?wkbTcK7Iitbttzu25Zly5qIA32bYu9HRdJb52mt8uL7cuAhSHKGPipJryl?=
 =?iso-8859-1?Q?RK4cjIeuszaqFtwY1eOHk4SZyJqw9rQ8EkxUI4ulvivBG78KhYSoW7torN?=
 =?iso-8859-1?Q?mpbQkmS1JPonBZ3SU0t7Mk4jjiZAU4hT2Syu5HToUvOWiXvA9xSxvdaEAp?=
 =?iso-8859-1?Q?njdCfoJE5rz/X6wK/Ee2ioPnIbggEB6RipUhnTWjRawMbfd0PlR3mlFDw6?=
 =?iso-8859-1?Q?T4LXK7mnAMwlkhAaRiClF24E85F8jcH7Y7OhXrwPtrwVtAmJmBUoo1ouRc?=
 =?iso-8859-1?Q?Zg12/8A9pMDZiSVAfAsEBbHsAM7xMYE9RnzO8hUKKlpT9d03RIfSKVVPaG?=
 =?iso-8859-1?Q?f7UxlsGITQ9Nly4V4ofZs/UHFuN8UHQoocM/jbh6zJBIxmeSAhxcP79522?=
 =?iso-8859-1?Q?vO8ziMhPyhFAB/CLDjHIflbLApVPuefHeEpGbsMT5KoEaV8NAvDyJPOzOh?=
 =?iso-8859-1?Q?EWmNED/pK2vE2Ye35ndI6SkTaNaysCHFi8LyZYoPajkAaphuyMgwIgvTB9?=
 =?iso-8859-1?Q?hql1Lp/7RP1quBZQxhJezGgLoMH6qZfcP2c65g0uGXTUvFKSgjbE3rllDF?=
 =?iso-8859-1?Q?8O1G+8aD4WK/yQ7qTd9WzU+f1UFQp+Gwr61hBxcbQPjB1Z/QyMREWMbX3N?=
 =?iso-8859-1?Q?nVMkFfat20leLsLqNgFTQL0ypNrhwWxLULjcWfcwEEA17s18n0EUL45KQq?=
 =?iso-8859-1?Q?9Qq4HR4jIdkoQHvlz+Yo4tUI5g0+erjYKkcpLTJBI8tA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6AouvNVKpYaxfirmxHtdRcKBXFBi/y/HudsNz0eJXhtuJr5Yb2QJ8/q4H5?=
 =?iso-8859-1?Q?7tto43R35LvOkCCwwKIWU5beg7FOLoC9hm5nKwtA+wAuNpbXkaM19HdcHn?=
 =?iso-8859-1?Q?IIJHM3QVVILNa4fYl8rjUeSv5DKeiCQLb3sduQ/FYqyWt2p3BZCFBp4WrX?=
 =?iso-8859-1?Q?4vi4hnWAxb7sIy4EZ3Xvr9UhdDYkwqtnimLWNrtKnHBL2thpK2rL4SuIG6?=
 =?iso-8859-1?Q?bHiesttSptM8JPe/rVA70ZvnCR/TFFJ3HlqWTufZeb7JTU5pZQmfTbS/VZ?=
 =?iso-8859-1?Q?SZwsbDZd9jv44KGixuMljC+9bjfhiBkA9rOx/DrxCfYBUhjg2i4wTRxsn2?=
 =?iso-8859-1?Q?AtvCCxhH7a8kVFrtnEDT4TODlTKJ8C0AvFagTlSPhhzmWYCWGoIie+91n2?=
 =?iso-8859-1?Q?JLZBJI4k9STb/uPOwunQ9vkGrnhpn6O5prA0ZiwyH6zr4ILTRU2ptTV54n?=
 =?iso-8859-1?Q?E2d0tnLcw8uqYVUot9mTrpOasUQ2XOCEsKrGkgkzSXO8dIkU/lC00pARS+?=
 =?iso-8859-1?Q?YWTAHzpIm/682WW5jhkyckMWWlxw3oXWLc4pX2LM3iOjAnT7xB/s6Mh1OT?=
 =?iso-8859-1?Q?5LWDgzhWp6dFkeNWPokkApij1Vvi8W5ytRgZMlsI+59XBC05AUiA7LeDTn?=
 =?iso-8859-1?Q?kUJshertmmV3HMGuQCXEJdquUkhKIVONKaieqjV8kfQ1Sr2SA8/DdvuBhT?=
 =?iso-8859-1?Q?fchRMeFzNU+NsQqy4vYn6L6wRp+0z9NlTkIS5mflXBPyKBRaBazhEbKCEH?=
 =?iso-8859-1?Q?KG8olmK3JQz4Q0LkOi+r9hcGig/wFfhLE6hFD+m1wbun+E731LQCVffR/e?=
 =?iso-8859-1?Q?NoyEfo93fs9D3hb1Y23VzyvWyD0f1EfsnZV71rMXY+vs2kVF7Mz1tuHi1z?=
 =?iso-8859-1?Q?ds3iMRjvwXohEttlLSzR7xprwNOLoJIg2k8h3+P4LBPycMcMKfqwx41bEt?=
 =?iso-8859-1?Q?+mjR1o0QaRYt5niyHCFuyFQe0MmUcjz2F+w5QepaEjVyJ/UjHbaeV6S0Zd?=
 =?iso-8859-1?Q?xNbmL3UT9tsXOG62cjS9Ill9xh8gXRKPzZWM/CtUVzjG4szkqbgXtZxbsl?=
 =?iso-8859-1?Q?3c/hZWqWkbvMDtRonxw8DZbDyqRfNgWw59geZ7pUwozfOG13ETqN1qWiCL?=
 =?iso-8859-1?Q?p2jYjTDUPqTt/VB47hElXql+f8a3N19tPyTx3924bcSpLsa8j1ubvWCge7?=
 =?iso-8859-1?Q?kYJPcHsTxp7ZmdWHIstx6+0vH2vXV3GS+cW0DXIffbEnaB9tqCMUw651Ve?=
 =?iso-8859-1?Q?HPIlQh9GTHPbprxuIzzv7o/FERW3wq7lSXRwjBDWdguWuOFRnEDxHqhlKT?=
 =?iso-8859-1?Q?ANvv7ZdFKYdBr40gdDbinPy8crqEkuK9V94HU6LxZ1plhjjvFv6oeHMnEi?=
 =?iso-8859-1?Q?FmuAx26kGVFKgCKKqRMMsM9ulgHeFdyBnzHpvgBSeyzn9BOsd3R/j0toPZ?=
 =?iso-8859-1?Q?vUIq+8DUjTOhsg916HlQ98jVwILrQ0cVOHVbFrPtAgGcgd8YIPm4zveiBg?=
 =?iso-8859-1?Q?WZLkvvwhXqr1e6kAyu8eG34us3p4SZX4gU/glwfXdQAPnQDvv+laZvOI2t?=
 =?iso-8859-1?Q?G9ta4ox1OagwVqBlM5jtZt4ZLUlyA+dZDyRTCwn9z0HIR3w0HLTKA8k7st?=
 =?iso-8859-1?Q?G3hBZX2jP/ao2WA7/Ux8FvIXC7szGXNSjzf4UrIfoqb5ESwn6XflI0Xw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e439ca-6162-459a-87ac-08dd871446b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 11:52:11.1341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ecMvwhWxpRPsDFo2beWOejlNTAuilud1mbD2OeMTVsu62RrmaTTS8kfuww9HEVJ9kqyguIuD2Joe/5cYIDiJGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR03MB10907

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Enable the use of IOMMU + PCI in dom0 without having to specify
"pci-passthrough=3Dyes". Due to possible platform specific dependencies
of the PCI host, we rely on dom0 to initialize it and perform
a PHYSDEVOP_pci_device_add call to add each device to SMMU.

Because pci_passthrough is not always enabled on all architectures, add
a new function arch_pci_device_physdevop that checks if we need to enable
a subset of the PCI subsystem related to managing IOMMU configuration
for PCI devices.

Enable pci_init() for initializing Xen's internal PCI subsystem, and
allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
hmm. Since
  dec9e02f3190 ("xen: avoid generation of stub <asm/pci.h> header")
Should we also move is_pci_passthrough_enabled() back to xen/arch/arm/inclu=
de/asm/pci.h ?
Not sure if PPC/RISC-V will plan on using this check.

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
 xen/arch/arm/include/asm/pci.h | 2 ++
 xen/arch/arm/pci/pci.c         | 8 +++++++-
 xen/arch/x86/include/asm/pci.h | 5 +++++
 xen/drivers/pci/physdev.c      | 4 ++--
 xen/include/xen/pci.h          | 5 +++++
 5 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.=
h
index 7f77226c9b..d6e05f16b0 100644
--- a/xen/arch/arm/include/asm/pci.h
+++ b/xen/arch/arm/include/asm/pci.h
@@ -128,6 +128,8 @@ int pci_host_bridge_mappings(struct domain *d);
=20
 bool pci_check_bar(const struct pci_dev *pdev, mfn_t start, mfn_t end);
=20
+bool arch_pci_device_physdevop(void);
+
 #else   /*!CONFIG_HAS_PCI*/
=20
 struct pci_dev;
diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
index 8d9692c92e..78e9ef28d5 100644
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
@@ -75,6 +76,11 @@ static int __init acpi_pci_init(void)
 }
 #endif
=20
+bool arch_pci_device_physdevop(void)
+{
+    return iommu_enabled;
+}
+
 /* By default pci passthrough is disabled. */
 bool __read_mostly pci_passthrough_enabled;
 boolean_param("pci-passthrough", pci_passthrough_enabled);
@@ -85,7 +91,7 @@ static int __init pci_init(void)
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
index fd5480d67d..1d59437147 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -67,4 +67,9 @@ static inline bool pci_check_bar(const struct pci_dev *pd=
ev,
     return is_memory_hole(start, end);
 }
=20
+static always_inline bool arch_pci_device_physdevop(void)
+{
+    return false;
+}
+
 #endif /* __X86_PCI_H__ */
diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
index 0161a85e1e..21c8a3a90e 100644
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

