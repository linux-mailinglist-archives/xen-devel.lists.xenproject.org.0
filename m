Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77113B98B7E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 10:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129031.1469167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPR-000855-KE; Wed, 24 Sep 2025 07:59:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129031.1469167; Wed, 24 Sep 2025 07:59:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1KPR-00081y-GG; Wed, 24 Sep 2025 07:59:29 +0000
Received: by outflank-mailman (input) for mailman id 1129031;
 Wed, 24 Sep 2025 07:59:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A4Db=4D=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v1KPP-0007np-Ab
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 07:59:27 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 631d4f55-991c-11f0-9809-7dc792cee155;
 Wed, 24 Sep 2025 09:59:25 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB8118.eurprd03.prod.outlook.com
 (2603:10a6:20b:445::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 07:59:20 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 07:59:19 +0000
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
X-Inumbo-ID: 631d4f55-991c-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sWE/BPUjP/H8ZNFgxR2g2q2ZlTAIEnW92LYsMR3FaZSNVN0w2P76P3WVs61I6/hyfsG3kdqr2EgpSh7nJi5bitAryGwC8D0ZFUKn+4uYDXvUC7zUgNguyzpPECguZ0aeCL6EJHsc+IyvnP1EQUufcm2hUo+oLGeCH64Uoh1bhNhVfjxxAy3Y5rJugTLBPU4JKkpkVCpWnn9UGcm6TS864xxjp9fx4pG9wKhbYI3WUrpsIL7l1K8aC6Y48Fkpyzn89U6GQUFsP5lqlc5yUTtVPAIlt8jeDibBlqawgJF5b/1uHX3NqSyBKernMzxgQvh0t5oHeQZoc3bZ9EDQ7loUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTwXTNysux3iP3L58FkRp17XcK5UFJFmSy4ETHEy7e4=;
 b=Jdc/u+LXuaa+gkEE3YaMRYF2Sqy6mHkuXAfSNx83qsM7i9fCW9vPDJAJzQlcQNHCtL26EgMplmwyYPEy8dBCDlWMg8Ri9BnKtWmq22YHZwtqLa6EuFTW1jF9mQuAJQeNxN2pSi1fyL3wBT+AJip5s4x656UMfWo18+fT3gdytpy9o8vJ45/Z9HK/PAnGe23AZLLJiK++QUt5fhevwTejDzYVBdRWPnw5c+yl0sGGjIdV7W/rLgcn8Idr17AI+rl5jinPoXQQwu59UQdzD8m1XNi79tKGoU1teii+zhrStNvujWDQ/QXYWR/EJn/R7hSvny7eDdCOs8sAm//7BCczsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTwXTNysux3iP3L58FkRp17XcK5UFJFmSy4ETHEy7e4=;
 b=Sx/tQ9w5Lmd0XeoWNpfCkVC62eBQ/03KTP2szu8o3OFjs3YApAxHFE1JOEiqBu2w9sfInC008BcaUqzQrB7XIjhmNtHJuVcGsrcPb/K7FDlx+sg1z8s4Q2JFk2DlIhA4bbFDsCzt2xRPWQcDtE6WoTGKogb432PGwxhGBOOYsFUKDG1VK68KrQC1i8BAJHrWfS6Heh6Sm9HA/wM5TusgQVIPqWtfOTAHpUT9/PYTq2USr73IaLf4HS3HUsgNCh9EpQjrch25g4Eb5Ui3HqQZcNo38F/WDa4bR0L9P/8T1iBkUZCq+JrUkaSVpGyUV5XEIh8FLEQsvZec72bB+MfVKg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 0/8] Implement PCI device enumeration on Arm part 1
Thread-Topic: [PATCH v1 0/8] Implement PCI device enumeration on Arm part 1
Thread-Index: AQHcLSkhRXSikUEA50SGGeDzHe8jnA==
Date: Wed, 24 Sep 2025 07:59:19 +0000
Message-ID: <cover.1758618839.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB8118:EE_
x-ms-office365-filtering-correlation-id: b18ece0f-493f-4507-aa48-08ddfb404432
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?37kzeYOjchjULRONejyV1WvlPhV7+IzF+vJK6MEmqYOnlZIn6rIWQStu/R?=
 =?iso-8859-1?Q?D8mTgdWZ5m4RwAd3Rpvkl2VQmZAO+GY5PHH0q28GQUJ787H2q6xTsZQRHL?=
 =?iso-8859-1?Q?5h9ucY5Nwo6WL/D4Ta2tKUh1TlFksDJT+HFawKd1jY4OkzWHx/syM90zdz?=
 =?iso-8859-1?Q?LPVlQLA0c24CfvBn/b7yiNX509PrsbUNEYm8lc3ulL9zJuxeP0L0zGO0xO?=
 =?iso-8859-1?Q?D04/Nt/V3nXstmY3g8VFaSSTdGV4qjzsoTZzrEUuJ93w8AktLy5R0fcieR?=
 =?iso-8859-1?Q?31QKA1k+zAidtQ5rBj0x6IakRGEXz+PWI4xagRhcqbb860Pn5rfvu+8kkn?=
 =?iso-8859-1?Q?Wtdx/tdYjk9C8ITMz4IN0UUd1EHEQtfhJAce6v5SnLgPqfGndwXh0l8bqu?=
 =?iso-8859-1?Q?6zfTGpol+o7Ycqsf5wDYkCa7bNdyKzKBTROe9ZPeVpbQkdq3fgMHtlG4Wz?=
 =?iso-8859-1?Q?OE2Lh/pw4UExC5YOOq6fpMJQLDZqj+tEvGq22ciqDvQiiqbFNwGgf/2vCg?=
 =?iso-8859-1?Q?gKvobiAZdOc6AXgprr+dDXkzaFU1l5UItjRaSwP1xMOB3pNo5Wi3Desbr0?=
 =?iso-8859-1?Q?KEyMAiLB43AOhMXOeb0GBgSOv0So3WvgKmlpkveUCaQL13JGSoKXkcWsim?=
 =?iso-8859-1?Q?U922d2cf4DYcieu1/iCZOI4vz+GpJ6wQHb8qnoKTVw0HrxzeelRz8dKwid?=
 =?iso-8859-1?Q?LiMPIwl0XCC2w18kSLyqTZqvnjgLt4ZWU2piPa1tyBESFWe2PEgG1lbgK1?=
 =?iso-8859-1?Q?dO2nuZWOD4u2U8FzboLXPaDBc24/ymQfuwtSMBHe4oaYx+ZMveF1ITRxd6?=
 =?iso-8859-1?Q?G2E5LqFNZXBZ6H7mDGBBrMGlHYJ4xKhBD1WEvMTyCRtnzDFhXrYsUyIMPw?=
 =?iso-8859-1?Q?Rshbij3iy50FsFxGO0HNMa2DhBaNUdl1VuLK8x/2VdAZ5GZuhuGIdOyah/?=
 =?iso-8859-1?Q?HAKA7wvVzJvbTtpuCZDoJKPp4n7r9E16W1DBPL8k7c3SWgOkWuFR4NRsUN?=
 =?iso-8859-1?Q?O9BB9WmiWoOiwdSIy1Oi16naBOBNrIGSS962Ms7vMfTPH6cpat6ozOCXXn?=
 =?iso-8859-1?Q?uVRE4MVRqIf9sUecEyICVgKw5I0uTNMaE6hfGrjw95B5a9o4+foOb0hBFh?=
 =?iso-8859-1?Q?cUMw+OfcqbqoxaG2SklbbV77s23fnR3J4Q5fA+SOGwsr7iSpckj4jXmizp?=
 =?iso-8859-1?Q?MfuMEswqbVRv6gfTRIV5xUUQA0o7WslFk/vnuwGamrFt9zl5+qYuWIfGnB?=
 =?iso-8859-1?Q?Tga8OAuLuWa5og1BFlWu+Fffgo2VQ4wnpzvFX9DvJsZO3ew1tBKU/1R8VA?=
 =?iso-8859-1?Q?8vXZkGYDB887XuGFPs1iVq2ogaj6iTCYQfW3h2W14jCYqJZPkI2j7i06A/?=
 =?iso-8859-1?Q?q/NqdVHy9Rcn1bXiZthYoBGutS8jsnljgGAVU3EtwK43PzN0J6j+CmU9DV?=
 =?iso-8859-1?Q?b0cSCjJhRV7aEHGOCPSZbRwH3coDeYS/0i+qJAIa/dz/shwdB6fH2UilJQ?=
 =?iso-8859-1?Q?3wPJkTI3d7N3b5xZYdIg/wz1mVOVD1wZRVXnYrHi38Bj3QEzge7R36Mj0L?=
 =?iso-8859-1?Q?kb3gd64=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3Ys2MrN8Zi5k6D6jZh8yWD9WZ6HYDN/DzEz56yobt2FoMZvtizbiXbyCEC?=
 =?iso-8859-1?Q?qHIAuKgouXCA9qX+/3jhi2Z6m4Pivvr59CHxIW8fYX2ajrHWtBN9+S0lMa?=
 =?iso-8859-1?Q?eBLWy2FMbi1r4LlwpJ9TVBWyQGc0ZDLjWJoXBoD0D+wR0sgJ4KEvxclKao?=
 =?iso-8859-1?Q?+oSBpbfD2cRrmDtyPzAVE2xIWs1SPHXo/IPdCXeN3sdF7ASxQucPXA6GXM?=
 =?iso-8859-1?Q?cc9UM/6dsyvhYwwDkUzvwsyFE4tarN6UKP+4wUHPztiOBUTeV2ikEV5TtU?=
 =?iso-8859-1?Q?QhffE5SwVa++tYKmorzt/sOvSJYWH3N63J9XF3LVhOEMpO/gLJC/d5hoP2?=
 =?iso-8859-1?Q?otYjIfb7g8lw3Q7sXVn0jP1nFXaaD/7lGq78Rep2ZmacSXNr3/HuB4NfXo?=
 =?iso-8859-1?Q?Zsk+mhbO4lcBvySsF51Tk9uKmGYTy0PSur0oKQWaxcSrBUXB0SQJwGq1bQ?=
 =?iso-8859-1?Q?vbc7+w82WKU5V2L2FXxB5KrusLrSwo+bJ1CJJr5/o54C1mcdvdUQIPeCwZ?=
 =?iso-8859-1?Q?1IsnOxUgyTY9L4/wXaNHDRxziO3+zdOagD1v08B40IS1stTzB+VLU35tq7?=
 =?iso-8859-1?Q?syfVlXTXVTnHyPH3l8ewGjBO30atYmoUZ2FVLCtfe00/7Qs/eMEobx974c?=
 =?iso-8859-1?Q?CghZhQVe4Crg/Qhp0ijIJ2Yo6WWUotA3y4l2S5MBR402oIZ4BxwYAgUIhm?=
 =?iso-8859-1?Q?1P2xMwW6VngdRdCtl6a+mblZT9n98KBI6BluH8IzoR/jjuBcaeYgJEo36V?=
 =?iso-8859-1?Q?D34gLUZ71FceVOCp3PtggPijqmH9axDVYwzwp5ySmKyS42L6rmCUcMU4XH?=
 =?iso-8859-1?Q?cYJVCLiNTtIeac7azZQgQ+roV7JdGo2xq5vTevuGua/y9R1p/JZWAnndom?=
 =?iso-8859-1?Q?eWBtTqf0lgCWinjbowG/p3zjuqphWt08gYxdzmBLj7BDkvpdUi+MKUXNIs?=
 =?iso-8859-1?Q?AAjv8wx0fexxnnjMpGo5EJtjQRrl9ewpxSaHNAA87Vxq8a/J3WzCX552NO?=
 =?iso-8859-1?Q?sQYpDuT5viXMkkvYEmNANGrweTUP/YDATuxs/dF6x25NyNitAEruVtN9WY?=
 =?iso-8859-1?Q?SIxv0FE08iUG/ccdCZE4/HADHwwZwthqBp+C+Rpv8VmArYeZ1tsz+Fcrw5?=
 =?iso-8859-1?Q?UVb3r9WdwLTSECss9piPih2mJ3h1Jf0h3cwZ7hP5YltkZsuCBt1Hxh5eAZ?=
 =?iso-8859-1?Q?BSAHxUAZupzcaAxlv5rSHeI/0TkhZKPbRmLn7YEsoQ5lLmlvUkPxz46xIH?=
 =?iso-8859-1?Q?dSqwJiaRumoUODvDPFFcAFkwwZt7b21TDN7ESaFlinrf6LdQ140W8Er0G8?=
 =?iso-8859-1?Q?VpzbfHLrJ0iVQTnz66gk2SN0Naa4IM8bu1l+78SfDgEw5fK0U+m83h0Bbp?=
 =?iso-8859-1?Q?IJTKudpVhjXcyGXpTnr+rd4jmdpD6paMeS8aIpnkLDPMHAasZlqNMfRZDB?=
 =?iso-8859-1?Q?ah+m0X+dI2bcgvuMnDQ5E/1jCHBR0TvCYN+CagDbjLbMCXF3UhESBqwrm0?=
 =?iso-8859-1?Q?HoowciFakRbn1TFxnHVrmqRxri5X2j/qrzBLZ5DLxMMRpWvnYv7clEYwRm?=
 =?iso-8859-1?Q?i8Dp8gqko6QKnZGcCVuot10w0zMhNM34f2Ffs/Cubs8OHMOCs2t9zb+GNP?=
 =?iso-8859-1?Q?hZ2IEobJYVe091hGsKQCa0a97SKew4PfRKxm/6NNmudzO5Pd6vf1BKLA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b18ece0f-493f-4507-aa48-08ddfb404432
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 07:59:19.6428
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QaVwfiWjkts2MldqktCjTqHDhrnxUcgB1JIAxHwKUPchMMD7SUPBvgXnvcluxJmSHJNZsG1lyedcuiJvwJnVhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8118

This series adds basic PCI device enumeration in Xen on Arm. This will allo=
w us
to not rely on Dom0 enumeration for supported controllers, which will enabl=
e PCI
passthrough for dom0less setups.

Enumeration is disabled by default and can be enabled with "pci-scan" cmdli=
ne
option.

For now the discovered devices are only assigned to HW domain. To achieve t=
his,
several things need to be done:
1. A VPCI node is created for HW domain device tree, and the real PCI nodes=
 are
hidden from it.
2. Discovered devices BARs are initialized.
3. Register handles for VPCI are updated to change behaviour depending on
whether or not the calling domain uses VPCI or HW PCI, instead of relying o=
n
is_hardware_domain()
4. PCI physdev ops are disabled for HW domain using VPCI.

Edward Pickup (1):
  arm/pci: Add pci-scan boot argument

Luca Fancellu (3):
  xen/pci: update DT for hwdom when it uses vpci
  xen/pci: disable pci_device_{add,remove} when hwdom uses vpci on arm
  xen/pci: assign discovered devices to hwdom

Mykyta Poturai (1):
  arm/pci: enable vpci for hwdom when pci-scan is enabled

Stefano Stabellini (1):
  xen/pci: introduce has_vpci_bridge

Stewart Hildebrand (2):
  xen/dt: pass flags to callback in dt_for_each_range()
  xen/pci: initialize BARs

 docs/misc/xen-command-line.pandoc       |   9 ++
 xen/arch/arm/device.c                   |   4 +-
 xen/arch/arm/domain_build.c             | 154 +++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain.h       |   3 +-
 xen/arch/arm/include/asm/domain_build.h |   1 +
 xen/arch/arm/include/asm/pci.h          |  25 ++++
 xen/arch/arm/include/asm/setup.h        |   2 +-
 xen/arch/arm/pci/pci-host-common.c      |  83 ++++++++++++-
 xen/arch/arm/pci/pci.c                  |  24 +++-
 xen/arch/x86/include/asm/pci.h          |  20 +++
 xen/common/device-tree/device-tree.c    |   5 +-
 xen/common/rangeset.c                   |  35 ++++++
 xen/drivers/passthrough/arm/iommu.c     |   9 ++
 xen/drivers/passthrough/pci.c           | 119 +++++++++++++++++-
 xen/drivers/pci/physdev.c               |   6 +
 xen/drivers/vpci/header.c               |  14 +--
 xen/drivers/vpci/vpci.c                 |   4 +-
 xen/include/xen/device_tree.h           |   2 +-
 xen/include/xen/rangeset.h              |   6 +-
 xen/include/xen/vpci.h                  |   9 ++
 20 files changed, 509 insertions(+), 25 deletions(-)

--=20
2.34.1

