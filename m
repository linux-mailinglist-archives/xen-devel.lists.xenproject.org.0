Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F001EB06F41
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 09:44:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044876.1414912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwnw-0008OS-NY; Wed, 16 Jul 2025 07:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044876.1414912; Wed, 16 Jul 2025 07:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubwnw-0008Mx-KW; Wed, 16 Jul 2025 07:43:52 +0000
Received: by outflank-mailman (input) for mailman id 1044876;
 Wed, 16 Jul 2025 07:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fgsf=Z5=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1ubwnv-0008Mr-AX
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 07:43:51 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c543b1b-6218-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 09:43:49 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AM9PR03MB7560.eurprd03.prod.outlook.com
 (2603:10a6:20b:417::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 07:43:46 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%4]) with mapi id 15.20.8901.018; Wed, 16 Jul 2025
 07:43:46 +0000
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
X-Inumbo-ID: 9c543b1b-6218-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KBVBloMICM2mXlcphgd7SmSp41BXBYila2xBvc6RKMjDqS224U2FP+l5f6Jl9joUpMx6tSSstmhQ93gHJ7upD3WTMm9VhRJRhyngSYJ38KRca2zW3/LHOfzXxH+ipxR0I3uqtK1CbrfBJ/Bx+nsdCBbZChuQx/m+R5TcvtRzQUtT8emfNdmuolF2obPsXLMeJD1popsPCS1I8VSXJAeTqkrEB/z/1t4vzi6PyDLSSSC60d21ojhuxI4vVYrWC25rE6FobDOL9mBEaOQY6HfnIJUxlOPHVhjdpbLll1Md6Q5eXaibbWBWF7/F2esHHQjn5If09u9ul/nf5crJC0MNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNl+De76luMDtgg6+GR3Usm904sUzzd5QdR3bxMn5Gw=;
 b=QmI0HdSz8vYVjHhYo1EjtnaAS0g5fsDMHIPxn6SS06M0vquwS2uYXEQgCgQmsYSTe0yY5T7ZiP5+PeERAZEH3laE1JrRSevaxCB77WFglucvpQ/CqRbykIOhteWN3qnj8CYNsyeJssKWzolhB7UJpNms7En7gDox8ZUWqwHr5q5nyIKz9MTsajqKbtTnvMF2EchvpYWELGAc6yH5CSvEr3Dj48rG54iS4g0BgV/xAeMxeXC10DCWAJDFdKdCKJDtIv/je4rjNtLen1VZBqvZKiCWU1ujlPYHeoGbivXPZxsA31XkbcHnYwe+VoDAFKdbabriWc4+ZEMbb45+OX2t9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cNl+De76luMDtgg6+GR3Usm904sUzzd5QdR3bxMn5Gw=;
 b=XB8wTni7NvjSS/hMP6T+3TGzQQc408ugKXeGlL4q98l0XJYP0GW/j4uDIUZWh/bSogPz3rFH8PYFW+Rhx/snEtJJOHSYWZboc4hmarUS0C6NWgdTu7qC6htf5jjkIpc1Vwy5CZP8MA311jagEi6IXOYZuurH2DCm7uO9/EVjrKIqCiEnEOSAx93twy0YIiLHXljvU2nxauTx6FPZOOnzbbWW0xqP0V/wIesnOP15bwF06mZGYDDLEbQnICJVYiMGVP0jWpL4JgWcR553Jk6inxRLlOHYYZCenCQc7bR/w6SgzdFgrKiiVrruKDBs7bXPlAEA0zR4oZK99kTsgGNryg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v13 0/2] SMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v13 0/2] SMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHb9iVcCERkzSTBv0CJFLR+Dx1Ivw==
Date: Wed, 16 Jul 2025 07:43:46 +0000
Message-ID: <cover.1752649797.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AM9PR03MB7560:EE_
x-ms-office365-filtering-correlation-id: af9b9ddb-35f9-495a-f74c-08ddc43c7f07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?Umw78W+wOwmZnF9iwBDld0c6L4kzR5Yc+IopV6aQ+X3O1xwFkRb94lSro8?=
 =?iso-8859-1?Q?qQYcZoDTbu9OiXUSbND3dlHb40fRLOUF7vyVteEM4MsnWF8gMnKhRo+EGw?=
 =?iso-8859-1?Q?WKycGtIq7x70dGyPfriWUic5SDOzTvvDjsGYE9HOrnag0QitM2L/zhV5j2?=
 =?iso-8859-1?Q?DUflN9JBLgez+l9tW/keHkxv+OM9nfUMDKJaUBHPD4q3mT/i9fjJeDl8L0?=
 =?iso-8859-1?Q?wd84MBQflunz9wB+kZFdxuiAl6KlNGzhr89TnBV9C3D5vV9qQWsxvhYABA?=
 =?iso-8859-1?Q?qoLlftOXb8gxxvTrXfZHmL1aE5L7iAanMH65Nu+NYJbE3LXS4k/oJSJR+R?=
 =?iso-8859-1?Q?GJil9x53HCswsrbPFV5bCkPBByuVtL5w/2N/NcS6fEvK9ByTbv6eHIgjVZ?=
 =?iso-8859-1?Q?EMPf9hGLribnaJ5TjeOKHb3IK+ERwT7wDAAfnbIYAa0iXG8hvVp/ybKJ7j?=
 =?iso-8859-1?Q?+9NScyikXIN9ZDBDyxWF+QfoOJ+PrjhBdFoxrLJAaH+tfzPFdQ89PNXT0/?=
 =?iso-8859-1?Q?E0jvtifrmNaRI6gANf6Ox9n1UsAtSuNpwdcmONA8BYlrXISJwLgqOgZB7u?=
 =?iso-8859-1?Q?h9q8/O2t1wGCmEOKk+4HEPRqVABNl9r+Rm4N855Ttl+p4WqZalzhpaffXa?=
 =?iso-8859-1?Q?1ySBCEd8xLlujD8LjVWSlC1quiQ3e/VgsrwChhPSqTiTTFRsZPoK6DxiVu?=
 =?iso-8859-1?Q?Yg6na1dn4XuZa3QW6N7hmNcaojnBeP/9H6utD8cAfrXlouO3MfTSHsi+14?=
 =?iso-8859-1?Q?VcJhl6eyeQcc583wuH2ILyE7uApPnZ55Fy39EfLElhyfGsRCzit9goHD32?=
 =?iso-8859-1?Q?LIZjz2v/DX+6bHHErVDq/IJBOgY4k7MSKVxNiliwpD4WYcXllO3ooSveCw?=
 =?iso-8859-1?Q?xZb7kDSkrXCxqG4HrjeWxEJ6jU2hfutRaXJ+wEFFfqJtHO6kVkG1BKWfqB?=
 =?iso-8859-1?Q?oanZRVDukJBuft9+N5+ow4B6jNgcr45uTapOaL6MtwyTQp1Q9kS9NsfnlS?=
 =?iso-8859-1?Q?4Nk8ZXYwRbZd6EL7/ZsLf2qDOnHHHy+iut1d5/vh4gU754jVBmQsrilmW5?=
 =?iso-8859-1?Q?lEhhYzDv7tksIfO/92+8wIJEBbRSeJatkTxKI1UTqRS9cQuhfcADaSwC6E?=
 =?iso-8859-1?Q?2WCcCGn5wTCTcFjA+P69yvXxis3KD1PDw0l1Uo3/NiuBIli6k7TrEmxgxo?=
 =?iso-8859-1?Q?EhKkC8XHIdZPvoqjYjM1+PzankALgc3XMSsVlCsrWY71CT6i73X0cCP6Tx?=
 =?iso-8859-1?Q?HrkyvX//Tj7kLQJ2D+nlHrhWGn/BSZTGvnpDTWyPstFReKFa4fx0lwn0vP?=
 =?iso-8859-1?Q?+sIkb0rdGlcnYB59jgMijF5XUfreULwfSO0v+rBGeP4sfSRHXIRXXTXHjS?=
 =?iso-8859-1?Q?KdqDre8o1XWTYWHZyem1q591eEOnR05R5FjJRdwFgOpyXhXu4GRzhl0KPg?=
 =?iso-8859-1?Q?IrHcANDfPKIQhnC0gTbYx7HG21in4KAqJbp7tVnIe1Sp2FXEDO/Sjtw3Ct?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?xvyiP+7/y7j4jPsxeYlZDZxVvG9l5DXaKMm0bqgipU/3/+5tpqO6kYqB8L?=
 =?iso-8859-1?Q?0+5yQv+vtAxmEOz1zeIlTDmCs51wxLhyokWL/+LznrBSHRJwKZrSbsoj2c?=
 =?iso-8859-1?Q?Lh+33JHvnx/Tvosf7WWawPRok1e5scpUTxPnzlSNbhA2Mg/VPyIEnNDW3E?=
 =?iso-8859-1?Q?TFEW1iJh9NPTa4L0fUYBsPE6VK6z4TGZsVvbDQ+pfiLIrcQZoooNBHcjGY?=
 =?iso-8859-1?Q?nIq0NvvozLv3uouSe8GV9LvFDsfjojJp7kbugHdJW5vU//YvPzEjctv++h?=
 =?iso-8859-1?Q?6Mz70JLvQIYXz6zf/2YZIK9Jml0Beip4+iVAE+MSfz8BqtcASD+i5ODIIQ?=
 =?iso-8859-1?Q?z7VmVkVg7vNjuw0hmHd2d3c3qp5CWFVqvu3TAPF8PBO/d7nnslOZiluXJn?=
 =?iso-8859-1?Q?F9ckHY4VCKNroctwAoYn9RaEZB90z+MHX6/bdRkvBNLhDRvTFtHCl2TxFE?=
 =?iso-8859-1?Q?8aC9tTFVYUUuobpD9YrJzbunigwOrGbl1LfyRsB9OozPsmb5THn9LLUW0a?=
 =?iso-8859-1?Q?YyJCowOwQO8t7lttoXCECe6Fu64zKFADpIDKtXzPH+1rj4VDZan+yElDjt?=
 =?iso-8859-1?Q?wZT6MY5/E3S8vlR2xti8yknxlBMVPYknjozTowHkFpr6Z0Vz4w0e2AMUSe?=
 =?iso-8859-1?Q?iX3cgzgyUm7pxMDg4DqwY05g7TIIP9oq7ZFknzeBuqC1tkOE0Mr1zGxnkk?=
 =?iso-8859-1?Q?G/MFaxYAnmzmDxpHypslkvz0v4QErp0khheu70+b7c5jtCl/MysmUWFZEY?=
 =?iso-8859-1?Q?1biYnhs/YRfS3aYBUdrmR/9p8xDeaSMGpezMTHyG7tBwUiTvz+PU9gkx+n?=
 =?iso-8859-1?Q?8w6359Cp4UOuyq533Anex7hnHfG1i2sMaSQkdbAaMeAAMTmj+Bp8lRfXDq?=
 =?iso-8859-1?Q?DWGSwNXgv7chKczsvoQW/mZewElhwzd0bpvaSDH8fekSS3QkLid0rRpE6o?=
 =?iso-8859-1?Q?DplOwPGoEPROWuVQXhBM8BNJqnDMG4kFj4vBRdMr+BS/vGP/4suPq3LXCj?=
 =?iso-8859-1?Q?Y8wiv2MpvfGTd64MTNB/kloepdjdrMQyRqCIBcB1JsCDZZ1G3ChQcYQ0RK?=
 =?iso-8859-1?Q?C7LoM9B8aMs2enpEEDZI9ZjuKUNHxT5Zw7h0Zm+cazbqPaTfSmQrV3J4eh?=
 =?iso-8859-1?Q?unI4dhzD4vKGCCJaxGaXD9X01YmS5gfSt6/RQFIjf85eK8equ2oS1y4lkK?=
 =?iso-8859-1?Q?lRnEWcdeGboufAfTyZtoOxjNqU3r6XU3fhARnYHAVGvnxhTxMW/lFzsDoG?=
 =?iso-8859-1?Q?GPyiIm5wfwqXfOusaFuRr8Mo0Ok9nmms3tlwaheW1sUJAJSO5gYMazACIh?=
 =?iso-8859-1?Q?XPG1JkOlGeDB28WPJWGXo5xlBXHRFvp9jNhfgjEsbxkZhfkj2IkJifdAg+?=
 =?iso-8859-1?Q?vQtewu5s5hbbcd0n+UTFVJ5UaRG1nxPlvMc075WLleqXfqQ5FCixL2uTSn?=
 =?iso-8859-1?Q?NkfPDZZOoBenyuSG1SIWwIp8gAg+ActsBDP0v1XetlB+64V2t6PByB7aIS?=
 =?iso-8859-1?Q?MdryYiNlJ4jgRPaBKPq9I3o1mlb+7xsF+Ham6pWWIGc0YkMh+F5Ikzofq6?=
 =?iso-8859-1?Q?eIEaPx0vHalQicZWGnBSmJDLb1Wok/kU4+rcKxK/4QqmdX0YDjVWAfonMI?=
 =?iso-8859-1?Q?J3ZoK6fy0tpchsTDVclxGtb4iM/4SgK3H5HsUY+qu3G80c/MMTSoTDWw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af9b9ddb-35f9-495a-f74c-08ddc43c7f07
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 07:43:46.3558
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aH9Ecfcu2Xcwtbk7DBamcwYOU9NJqAPEoSgZd0VtB574Qacbj/waL99G1krgxn4QAqhKcE9uYD5MElfmrB2Lrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7560

This series introduces SMMU handling for PCIe passthrough on ARM. These pat=
ches
should be able to be upstreamed independently from the vPCI series [1]. See=
 [2]
for notes about test cases.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.h=
tml
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.h=
tml

v12->v13:
* removed merged patches
* move addition of pci-passthrough enabled check in reset physdev op to a
separate patch

v11->v12:
* see individual patches

v10->v11:
* see individual patches

v9->v10:
* drop iommu/arm: Add iommu_dt_xlate()
* see individual patches

v8->v9:
* see individual patches

v7->v8:
* no changes

v6->v7:
* drop ("xen/arm: don't pass iommu properties to hwdom for iommu-map")

v5->v6:
* don't revert ("xen/arm: Add cmdline boot option "pci-passthrough =3D <boo=
lean>"")
* add ("xen/arm: enable dom0 to use PCI devices with pci-passthrough=3Dno")

v4->v5:
* drop ("xen/arm: Improve readability of check for registered devices")
* drop ("xen/arm: Move is_protected flag to struct device")
* add ("xen/arm: don't pass iommu properties to hwdom for iommu-map")
* add ("xen/arm: Fix mapping for PCI bridge mmio region")
* revert ("xen/arm: Add cmdline boot option "pci-passthrough =3D <boolean>"=
")
* add ("xen/arm: Map ITS doorbell register to IOMMU page tables.")
* fix test case #1 with PCI device in dom0

v3->v4:
* split a change from ("xen/arm: Move is_protected flag to struct device") =
into
  a new separate patch
* see individual patches for further details

v2->v3:
* drop "pci/arm: Use iommu_add_dt_pci_device()"
* drop "RFC: pci/arm: don't do iommu call for phantom functions"
* move invocation of sideband ID mapping function to add_device()
  platform_ops/iommu_ops hook

Mykyta Poturai (1):
  arm/pci: add pci_passhtrough_enabled check to pci_device_reset

Stewart Hildebrand (1):
  xen/arm: enable dom0 to use PCI devices with pci-passthrough=3Dno

 xen/arch/arm/include/asm/pci.h |  2 ++
 xen/arch/arm/pci/pci.c         | 14 +++++++++++++-
 xen/arch/x86/include/asm/pci.h |  6 ++++++
 xen/drivers/pci/physdev.c      |  7 +++++--
 xen/include/xen/pci.h          |  5 +++++
 5 files changed, 31 insertions(+), 3 deletions(-)

--=20
2.34.1

