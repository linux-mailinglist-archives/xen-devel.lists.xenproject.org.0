Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 326FBAF0C3E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:10:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030262.1403927 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbj-0001Jj-9v; Wed, 02 Jul 2025 07:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030262.1403927; Wed, 02 Jul 2025 07:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbj-0001Ga-2Q; Wed, 02 Jul 2025 07:10:15 +0000
Received: by outflank-mailman (input) for mailman id 1030262;
 Wed, 02 Jul 2025 07:10:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hFQ=ZP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uWrbh-0000Dm-Sg
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:10:13 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97fb8ff4-5713-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 09:10:11 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by PR3PR03MB6651.eurprd03.prod.outlook.com
 (2603:10a6:102:78::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 07:10:03 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:10:03 +0000
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
X-Inumbo-ID: 97fb8ff4-5713-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fzg/XruLWcdUyM2W4YDrsUbFQYw3bhrEP/ardk9QpLjC7dGD92veLukk/NX0mP+JB/QDvSs/sKEnlUZ3wPmwiHF+g4Ccec+vQ2tSmqmniPXHeB0ZYZ9PFqwIbZ+DLOFaqAovTa+tF4NDdvFvxKAv+mnH4H+3saXvaZM9pTFkA6Sod8RqY27wslb0CETvsK77saMc5lCBhJAJXpWOFtnQKOUPZKAy1HI8PahHwe/rbOSQrszqRqbg1PsmrFQ/D8S1MkZrcaTgjYVE0Vek7abR1txlNvDbAKeQkf5mWhMRpFzAhEF5QpTseFWMuXO4r3A6jeyOhit4WcIsSvC9H1W17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gx02fWw4/KPcrXSVDhcSP89YyPi3yqVvrZifvhGLY14=;
 b=nXUBOrxgQoq4ZdAmQcAvyJiX16e3zS36gX/uhqs3WgdpvUYRyzC1X8ZBRGnAG7Cgm9v/WsMywtu7UAdL2Dd98M1PO676i0ihVxg3/wYmgZvqzir8amPI1NRI4ZCGevN6GP6lGJVMOWKAhflnNY1qoyIhHFEpi95yQ3jvSdE6lZDuG7nr7SxtZUy8ZEPZHMx7JARptQawO6puc+XM5zHPeWdq9ffVs/rGO0RWouhzdE4Csu+i8AlvXlqs+V+l60qZ3eJtJCfwU1OU9hKyu0OOxLg+vagadDUpuUMOMp5UIhiKFN+LrstNnSKGFQSYLRJIA/NAtxwB6lS0AtvtCjPBHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gx02fWw4/KPcrXSVDhcSP89YyPi3yqVvrZifvhGLY14=;
 b=udQQPbds8XnHPTvjwKgfxv0qWFeSaDGOHmBev+zuEzERaXVcDd1sEQiF3EPXNnPUMLlSQe9MCcdbM7g/yrTD/1D5yd5q++YDdOeoNHxJiTxqJKoEqcLkXREdpsdogu4JLYlwdZRLn2SeOu/QAQzuw/zM9mR1ggFtsbTPPTVT1bYiGZ3im7otrSZai0AFuU5K7XlKU//xrHcmgqNFR9KBVL4DqbzTBx/zs9ItS3e88+uq3E9woMm0w/PgeCr4tXq5pfrCR6Mk+i9QcgwdSTnmtbPMEJgwLZmdZU3VdA05qOUiFxtLm+CcqQaFjWS7iae7fDQjE4l3YWwyU/86AqLaFg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Subject: [PATCH v12 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Topic: [PATCH v12 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
Thread-Index: AQHb6yBULI+qebFTaEmQEujYeGYPTg==
Date: Wed, 2 Jul 2025 07:10:03 +0000
Message-ID:
 <88a7dc50bdff2ce9cb0f10a66155ae558e11cf50.1751439885.git.mykyta_poturai@epam.com>
References: <cover.1751439885.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1751439885.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|PR3PR03MB6651:EE_
x-ms-office365-filtering-correlation-id: 1434f23e-9c48-4354-c4f4-08ddb9377760
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?dD+QMruyyo3HI8b67CD8eSYDMtqXOlAXLrppXlr+Ftss4YUsGhbUu3teNP?=
 =?iso-8859-1?Q?CVujizR12EMo55qLiP3t58h+k2+tGgg/1Am7KMn3p331HZLQqTh5oPNbfD?=
 =?iso-8859-1?Q?NokPDX6aV+2wa+RD/ZKJGpBBfCEw/kQVGbM9rH7wvlio2TSYRtbLYi4Isx?=
 =?iso-8859-1?Q?1bgBMiAz37Lb6YxlIvcXDu5k251pGNDDp8skZqARSx7DlzUZOobBCg/rXO?=
 =?iso-8859-1?Q?YfJhklkn0GUTLtlXGYjBz5FJBf0weNeRpKP+5ZbTfLY12YwbfMYcwTkHNe?=
 =?iso-8859-1?Q?rXi9acsuweqYCasixoELCqzWABT+ZJB0D701rN2Pbwa4dBXlL/XUkoD/9R?=
 =?iso-8859-1?Q?lWokrzMT6tMiditmx9SiopJjubAizVpI22L8tes4/uiaLaOQ2BcK/BPkYd?=
 =?iso-8859-1?Q?jhkylBpwba/LeE5Z5gBVprrWquXSiXYhu0AX+Igl/sNPdQJUD78OA1RtpN?=
 =?iso-8859-1?Q?6VOG99HpWzi0Y/L/fbA2YaYWNMzPJQVaca3JUvFgPPvQUxyyNquxLp8pQe?=
 =?iso-8859-1?Q?0laUlLhKRroVjsjtbyKjf7TZGzt6BJXQuS8YwPfV1P11hgyDZo+xrfbe8B?=
 =?iso-8859-1?Q?rbd3qeXaAAJ250JOu/L1XY3/HK4mn9ViTzvvCXbKFkGheuPsJAKCf46iws?=
 =?iso-8859-1?Q?cR9Gtew3tcUndmFvWIc5p5q2RCdPzJXX9MveZ0CiI34iCJ9FBzqQRQKqbD?=
 =?iso-8859-1?Q?Oc34yuudLwJgLy6iAJqG38Tx4n2oTShf3NsTRcFYVZDU09HMS4tXREAEdY?=
 =?iso-8859-1?Q?GoWDPfAX8dCFFzgV1GP10kB4RH2hCd0ATHcujowdSjjkAt8hUHdjvCNXHP?=
 =?iso-8859-1?Q?IdkUu3ogHQ67hFKQml7zsQHjBTuLex1weBk5NqTjrMVE+N0jC34SpT/qYK?=
 =?iso-8859-1?Q?IpcO2m1KqO5spaEDgowvI1XM5k3sIm+rgjjMfsluCX8dHsA/wbj0qBp/ar?=
 =?iso-8859-1?Q?tELZKcnHabveM2Q6wpfzOQIvL9dnt3/+RjM4rPbTq1v836HnREQhaUsisk?=
 =?iso-8859-1?Q?JqzGV7sj/9nQfyxTEqiYChRXzs5Gt+yDLlVs8VtJw9FkeyXbgM4XJxcTty?=
 =?iso-8859-1?Q?KNQOxJjNNw+ojxec4wsiTjrsAVi/obC25mpeFKlrRRDnB20rbiQOoTwQuI?=
 =?iso-8859-1?Q?YXbANvLJIx+joTAqXKh5p0GNlb08PODDk6sKdhjIm2gR/9madWcrOxkI3v?=
 =?iso-8859-1?Q?2jjaZmsqESsfvGRgAjTobPhQk5mwIv6WpsUXEKT9RIXllpK0vMcFbHVGUu?=
 =?iso-8859-1?Q?igcnrycUDoOFb5MaJOnvmDsY0AimktmRtMhYrfkbFsQHQN59aGaK/CkNCK?=
 =?iso-8859-1?Q?JOlC8MFSr7iogNkNLx/OulOStCePV1AgwhNZt+wdLHCUtaPkRvoQY93WtX?=
 =?iso-8859-1?Q?Dv++SDOBKhYV5lCNB62TRZK1yFcT+murmJblsedHNuhElBaTEFwphMuTTr?=
 =?iso-8859-1?Q?0vg1JEzxhGDnc/UKocQiWViH3q3s1fhHa77sTyPmhmnkj1WEh9Rw43OisX?=
 =?iso-8859-1?Q?9xCACfMHlwFFNGnTmCzjC+agPy2ZP+ELGf+Mv2vUhK2Q=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?OAObmQ5rzzFKSLFvvxbOIiKoiBnFTAWiyLm6lu6FSu+XDdnc9e94cLUCZU?=
 =?iso-8859-1?Q?j4lF8vWEa9K+cz/AiqjbrwTb2OvXfsfnA7lfLYeiM+plj9bZdRNVQcLo1r?=
 =?iso-8859-1?Q?z6mi7XZvMGSSzAFavLRCOomExjPwHbUuuRe6iFArxl0w7ohr5xow2FnzX4?=
 =?iso-8859-1?Q?IOqr9lqoP3b8qIYIPMSah27WzMPE95wfuB8blTHYEG3oev3+9sVkJZzn51?=
 =?iso-8859-1?Q?mbB5A7w1+8DY5qhthRWtc+C/5qciZExrLe8/Ogeor5z2lKfC1ES/5v1pST?=
 =?iso-8859-1?Q?CEc52w65DPD8Hmthm9ss8kn3YbnN0uS7ATOVRPrkXCHShCya2CCfR0MxqS?=
 =?iso-8859-1?Q?+jvNA8Yeh/O0HdsMgc/sWHyHn4c9KTGmj6sNj0S5pT2PNNGmtLs3BDLOVn?=
 =?iso-8859-1?Q?ohzdq6kOHYnmSmWeh3MpMpIspKAfPwhe3hsIbQjQxpkRZIy20Guu/XXBkG?=
 =?iso-8859-1?Q?OjxiR+WOUkKWh9xxGq7WN3Z2RnGjbo//RCWHGZpLG4QMy3XBm2Br6nejn/?=
 =?iso-8859-1?Q?xMNO74QrdMGKbwb6Ejw6Ka7yNvH4YJ/sekdT4ZMLCvln0CXZ+dq4UijISV?=
 =?iso-8859-1?Q?AJ4nBVDjfU6g0UicxGOdr5UuOVLrdxaZrMLeF95jNmC5gOz/30NeH6YBpV?=
 =?iso-8859-1?Q?4Ro/9437UauwVUTJkN+IjlrAhpsIIt9+NhOpZ/eyg8Tdu0hmwrhnQllcVq?=
 =?iso-8859-1?Q?S0pH/vLW8IBLxHs/BkwK++ZSHi3GUxenaqCDqqcONLX0z8stzl/u2jbTI4?=
 =?iso-8859-1?Q?PzjgG91GklsVnXZ2AdXvfUhW/lXgQIc32vi883NV9+ZKIFQ7lsa1nXfQmS?=
 =?iso-8859-1?Q?Z9YaZEMp5eHffk4WJYObc1weOKBZV4Uv7/WNpWOJSIjnU4YsL+0S/ZFF29?=
 =?iso-8859-1?Q?w0wjy62s0d89x5/wDYwbki5V+TPubk7E1rINRUh/d5yipqkMo4paMIyCYO?=
 =?iso-8859-1?Q?7UBuHKaPL/k9FC6auetuX0iqnWK7vyNbk350ZRtd7dDCJdYmmxphr47k6f?=
 =?iso-8859-1?Q?X0tx9zkGqOnBstJWSgkyBLbtu6zrZa97oVXh6Tsmh8fITApvy8+AvfGQ9j?=
 =?iso-8859-1?Q?RDHRO+5wZ/gsACZVq46c4G9rv9DLAKYmAuZHiWwYMcyP27CmIdtVjk6h6A?=
 =?iso-8859-1?Q?pJJs3ML2FedRY2NGP0IO+hEgkDQl61yUt7+0zMQFfQqi7KgQHAI/d7u0Zt?=
 =?iso-8859-1?Q?/7Fva08UxQNESeGe+9AzkL3TsIr2r/0qYZtjfPsVc+tBEQ8XFANqCIaxEd?=
 =?iso-8859-1?Q?lPKe9SO0a65MF9hbTtTlTVNGRi7hCmYNj86RQvpoJLWN4jjUoGCCLQ7PQ3?=
 =?iso-8859-1?Q?aApTFwlp+U2BZomgqRr1UnIENL6MhCfgzH8mZtCwWFN2JHOP2UqjAOyNb3?=
 =?iso-8859-1?Q?vm+Ku8nhXSI3/TbAJOEE+GA9RafThjXALhVLXONFiGhklgopVUJPJbhaws?=
 =?iso-8859-1?Q?rlRDw7DKbkGeCWMt/RV20gXAlzWvXj0iFM42TDbHN/yp+3csatIdxfPTDH?=
 =?iso-8859-1?Q?JRBcM8s/zuQr7prLa74JV4XLwGaennaj7NMOl3UJlHXtXVpngWOiwnU4rj?=
 =?iso-8859-1?Q?f6BPipj63X8Jn1sXsdfy20Dy5URrTJ6V7240gP5BkXOPiiaf5dkYZ0Bs+S?=
 =?iso-8859-1?Q?A39pFD+FWs44vHQ0eyiUZHA7Gll5QnKNx7kcvSxoV3+6pOepOxwQrWYA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1434f23e-9c48-4354-c4f4-08ddb9377760
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 07:10:03.0601
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ID6TIUI6pRGLI6aLq4JI0n+qzDIJt910pIV+QodQUmV2jMDY6VBpXMgQ3QFpc4zVPvTILnvgzzQCGGo8gIihKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6651

From: Stewart Hildebrand <stewart.hildebrand@amd.com>

Enable the use of IOMMU + PCI in dom0 without having to specify
"pci-passthrough=3Dyes". Due to possible platform specific dependencies
of the PCI host, we rely on dom0 to initialize it and perform
a PHYSDEVOP_pci_device_add/remove call to add each device to SMMU.
PHYSDEVOP_pci_device_reset is left untouched as it does not have the
pci_passthrough_enabled check.

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
 xen/drivers/pci/physdev.c      |  7 +++++--
 xen/include/xen/pci.h          |  5 +++++
 5 files changed, 31 insertions(+), 3 deletions(-)

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
index 0161a85e1e..3210f3aa96 100644
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
@@ -74,6 +74,9 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void=
) arg)
         struct pci_dev *pdev;
         pci_sbdf_t sbdf;
=20
+        if ( !is_pci_passthrough_enabled() && !arch_pci_device_physdevop()=
 )
+            return -EOPNOTSUPP;
+       =20
         ret =3D -EFAULT;
         if ( copy_from_guest(&dev_reset, arg, 1) !=3D 0 )
             break;
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

