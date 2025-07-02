Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0D7AF0C3C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:10:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030261.1403922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbj-0001GS-09; Wed, 02 Jul 2025 07:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030261.1403922; Wed, 02 Jul 2025 07:10:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrbi-0001Ci-Oj; Wed, 02 Jul 2025 07:10:14 +0000
Received: by outflank-mailman (input) for mailman id 1030261;
 Wed, 02 Jul 2025 07:10:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hFQ=ZP=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1uWrbg-0000Dm-SM
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:10:12 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97c6f3d2-5713-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 09:10:11 +0200 (CEST)
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 (2603:10a6:20b:57a::22) by PR3PR03MB6651.eurprd03.prod.outlook.com
 (2603:10a6:102:78::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 07:10:00 +0000
Received: from AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873]) by AS2PR03MB10110.eurprd03.prod.outlook.com
 ([fe80::52f0:1815:60c9:8873%5]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:10:00 +0000
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
X-Inumbo-ID: 97c6f3d2-5713-11f0-a313-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQ6vMN3V29jh/ONAvuWuoOQYB4bdEA5pIDDfJXYuZZXOH0553+nr/v5/8tZ7s5RFF7g7SFXjJGc1X2TxH6XFOc1lfwSFgogmkJ25gcJaNugbmyo/cqKCXp8gc0hUfBUAcqONdLjleNK2XR7dvQR6wvP+jEkm09kwmsXryRnWHTojCA6924BgU4UcqmvaVk1OXg8bcpmwxBl68tmaoO5nNHvjT6ZHEFjKZX9AtmW8UbyVUT0m29JZZW68BLLzEa1BA/KrvQodKcZKu5Sl0FxmS0yFFUBF6Ld3lX4iJ+ZgsICS6eBONRZbWlyXvb3VdhNDk1BOM/I51shlkt6Q47wNjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JwjUU7hiRKcHALln6I1LgBy4unBAEf1z3MHc6eEovzM=;
 b=UtkZn3N3FEH6vEH8jMVvsYqryP1MOkhf9iGZSK5hv8wU5vCWcNHgrJOB40tAu/68kvX46YtlEXrI71BQcW+4YOZYHTGxq79MuMc6b/BUx85xbGEPtn8jFtUScde0/w7p/hRACYyV0nRYYuYYE9pSiZvnp2r3pYgeaiiXFC3XuspdFQ8A5mxyLjBk+Q9XlRjS70Btagi9pPIbH97JKNWP/QNl7fq6HxUK7FA2DkwsKb5+fCq57XdoP69YkXDVvKKXws3LFvJqqezpMAovVJZCzHshfHaWl5O7PxTGMDine0Rrjmh+z0Y3U7BSYnBP+RWcsaYv8jXEJjmEU6JORwfTiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JwjUU7hiRKcHALln6I1LgBy4unBAEf1z3MHc6eEovzM=;
 b=KPlU+/bgwcxNL+j2lV7j6GD1G9abUTEtrMNBmkWNKCAYLzQfOmGfi62W+bKgRZAU6OulUfr3/tgpVxQ6XKH5ghgOXoC6HinLp35Ttol/6qfi93Fo7d5qKjX9pANzG7aVpCBxGsUZyi1gTMx2Q72otRXvzZ4lMKbOnBCJfG+SfytNxNh1UExEytxL9i8XFMzojPzatmYPCIsRK19Sk57a/GTPUB+LorignVwXPZeuIYD/zHC5AcBkNHxVe7isIYxObjTIHVKN5/Xux6DdMfQbFUctRxs2KLxOWSu78iInvF6jTRJ6K7RC4vHCr9mT0098201BgKxrD2Kjdq6XpMuVjg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony
 PERARD <anthony.perard@vates.tech>
Subject: [PATCH v12 0/7] SMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v12 0/7] SMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHb6yBSPddj2HkfUUeeaduNOidf2w==
Date: Wed, 2 Jul 2025 07:10:00 +0000
Message-ID: <cover.1751439885.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB10110:EE_|PR3PR03MB6651:EE_
x-ms-office365-filtering-correlation-id: c7accec7-3bce-49d9-2dab-08ddb937758e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?xb4p0IosVc3GOY7f1jyA1/yoOL71uQkzJiJwpTS9lvwk9mi2GSBnuG+LD8?=
 =?iso-8859-1?Q?GC2gGFO1aYzhv7bWWDlKFtY8Uuk6MXseInOsioeJU+1TKqQ41knNxCVf7x?=
 =?iso-8859-1?Q?eHXuVTQblcjmrYNPQOE3icrZ3LrUEvJdBHPRmzWRl9doSpCZQ7YDrjHrl0?=
 =?iso-8859-1?Q?MfNRMItR6FPLye+CjK3fscuui/EPVytEPmCzPW2h6bSMvlwKAn8zVSsPcf?=
 =?iso-8859-1?Q?VFELEUvxLDNjh0Lub4ffHFbszhDQg2Bk8pacmaUc5m+4lgKWf1Kpa6jes7?=
 =?iso-8859-1?Q?5+z6bwUKfxgsRBiFdSdd4iNPwkhqgjifynfkb2eXiP4WJS5tnLBGF5Vc6l?=
 =?iso-8859-1?Q?O0FlYsL49NP/k5Ax8V6I8Ri4bzMBHMWddRoelU92ptIB8CeemgHkYCtGNF?=
 =?iso-8859-1?Q?IunVXSvZz/DVH8sB/IAaNZSMtoUdy8+ql3dc5S25cWB7oewEn0ehZa/rGQ?=
 =?iso-8859-1?Q?ADfscuc4hKBOc99xv2sQ0lWXx4vBX3ysPRsDsrVlqMUrRBmqTxxOz1OeSW?=
 =?iso-8859-1?Q?TUZPvLWKfXitPLvXpZnNby+t1xPLJUFCtvZ+w1QDp65z250NK2bOEpCAMJ?=
 =?iso-8859-1?Q?XgZPkXwG3XcEoTu5hjbUl901HzGAT0K2iynud1Y3znJeQR/NKIDqMTMkkc?=
 =?iso-8859-1?Q?dn6dgQvJtFrlA/N0xejklhOGw877/Tki/RKn0zpGBYABEEv8lj+ng6JWva?=
 =?iso-8859-1?Q?Kzi2sWzWzhTHbZI69Ej96P5Bli/X4/JSF6pI1s3CNam++HsYDwvMNMj13y?=
 =?iso-8859-1?Q?nNhqf7q/48EBZJz2SswG3cTlohspItWfvwSr/eYkqr4lGU27Z4cp285sb1?=
 =?iso-8859-1?Q?IgZrXEarVm3fDaeQRd9ozhQf9t/p4vtOVtxVYkBFc9mW8n6iOZdiDrWqoY?=
 =?iso-8859-1?Q?ajkLlCxkEblvhCrfeGRdij2YEj5e8GOKIwlYmTEkMql+z5ZftBfVDK37+o?=
 =?iso-8859-1?Q?JgCic/xXZSyv9wHuBhx5oKWZtL7Df385sKjHWrBk1+nJoG08LqJnJqUv4S?=
 =?iso-8859-1?Q?kMqB1Ye/k+WDU/VqmTOzVk1Jl+oRPHObpa58oLmlNZUFsM229MT/PKAquB?=
 =?iso-8859-1?Q?Qq37Xosb02NxjzQTj0l4FvOPCwaoJsfv1Tqsx8Xs6XkqYoIX+8ja8nFnTT?=
 =?iso-8859-1?Q?okGhKsCG3qImtJ8kvt2YuNUsuG3y6D8ixFA2Pg638vZxZxjdnsIX9E0S94?=
 =?iso-8859-1?Q?gXsB8qoGo3t4RcRZsYlcCCzvnQY5w1eMmlxSv2yrz8JinErnjLcEqiBlG1?=
 =?iso-8859-1?Q?ttWmLQpgzNSL0tJYuCkLknDOJnaB/NFOGU5VmOoip3l3N6rQrE+I2YIgFX?=
 =?iso-8859-1?Q?RDXFCmEXG+Bf2hUSvqda5LWNx3nwfMOcyD5XNDLkz9ZOi/+BUsSsOyH8rv?=
 =?iso-8859-1?Q?JkJqhiyoSSvnXY03jho2aq6SEc1ldG5vj/EpC+1/9NXAzbIJOh4soQrWQv?=
 =?iso-8859-1?Q?XWO7K0Y7F8D9FmVf7e8b0appNmpXmR959ItOQajgbNjmB5Xb9K8GGTed9J?=
 =?iso-8859-1?Q?s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB10110.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Jtx/LsPziX+b2BIs/21WMq5S2QbFU4BO940It0NExGhcJJGA8r+dQHQZtd?=
 =?iso-8859-1?Q?oh/PBgCII48eLHrKwGJNUbnI2YsBx9+yaf0iZZ9FvyFRpOrNJmsnhUEOmV?=
 =?iso-8859-1?Q?LFkXfiy2h/MZOCAfcJNFt/71gCv1V1H0XeqUkWfxGEwT8zlS4cHvq0M97f?=
 =?iso-8859-1?Q?OQ8VO2ue0J0xnctPf1I/842/zZJX/UNpR9nOLGM57rdwuUajSPRXYr3XBc?=
 =?iso-8859-1?Q?9XJmPk1s6MD6NC1mkZqiPnzBagHnrGpbbGbeH3b1canbGX5ndLsmMO3DJX?=
 =?iso-8859-1?Q?KRUp5kSrvjQa2OMhygo/Y/hNqgLlpALBm2g6B2NqIhi+lXZFF0OzsqFpNZ?=
 =?iso-8859-1?Q?0dghJE6hOi+tI8KilrZbY99OCn5lO+kM+DNO2xaWu7XnMhBSvKPqIADVc0?=
 =?iso-8859-1?Q?69RE/ZVV0YIITbczHmwEALo8WE90ZI3FiR4ZmkGnJJnlg2l5C7V0VptL+I?=
 =?iso-8859-1?Q?QqPdn6CRadUymWPzZt6deafB2qPMbc0ctztW1VDEiH0Ksb5AKZFZPgoaJM?=
 =?iso-8859-1?Q?Z7719ZNP58+SclknORkBfx3AnOUNShC4J4w7HYWnR+7NZRcQTN7h91/uS7?=
 =?iso-8859-1?Q?F6KhbbXcnCEzW0mHFaVBWeNv0LT19fSjx6IZY2m/fEGWqMeVeRn3w2TR8r?=
 =?iso-8859-1?Q?ZqUOPXWxZolq/3iEUo3dKOOYv7iioFw7MYPK+FufDEKMmLQs1cTgpQC191?=
 =?iso-8859-1?Q?qo41LFezhgKlUdkVzFK+uP7HM5HSbdMTijyyY/6QmG67Alc/TLotNPOYos?=
 =?iso-8859-1?Q?H82oheU3z69VmPkQq9Z9aJpzvC1nhHcovAZn3DEx4hgnz2F8LsP4sPljBf?=
 =?iso-8859-1?Q?bENrXeq9cUoOJL4VHCzrjRhvVyLlexe35fuV8adUj4TSo9fvuoSR7+McbX?=
 =?iso-8859-1?Q?XJ7aE6NRqQK8eInA0zvczfUBRjliSWsjBXnLq7zyNnRNfia8BEy+HhzLvz?=
 =?iso-8859-1?Q?4LO0MIdxSoATvXmXmPwOH4FxvLqYt9oqs7E2Fod/3BQuYpAmVtrRUJSVid?=
 =?iso-8859-1?Q?xUVkgcfdy5Tqwa1qAIMeAIUYoHk0BMDaeDj5VaMvWOWs7S1PJf7BCENR/Q?=
 =?iso-8859-1?Q?rikhm2pOWTbbac3u5f7Fyzq4An4Rz8T93SqEHifZojiZVON8iGJtHynq9h?=
 =?iso-8859-1?Q?KRl79hAdG8HNt5CVhVrtK+Eif1b5rcAC/s6Va1twMUOkwaJUJeyGBd1V8n?=
 =?iso-8859-1?Q?R7qbRvU6SDCWprdaIyYtFcIrbyiaiobCRJ8wIPv/H4XxpVXcWOcpsse6TF?=
 =?iso-8859-1?Q?leNhAxC/LyvINiRV0vAf0tRfKEPPehMuqEWZFpgNAaZgEH99Hq7gzztVF+?=
 =?iso-8859-1?Q?WWIfaPq2H+1dTHfUVXa1zR8/dHmP7DHUSCWUSE69RM2jmpllSHWfRxjhhs?=
 =?iso-8859-1?Q?Ll6Sf3I0fs9eWXfty3ZS+Pg1L0yCWaHYhiPZZSg+17FPNra/pfJd+oXLgU?=
 =?iso-8859-1?Q?NKsLUuybUvo4euoLj/J03gmM3aQmcK68tq/SrkWAqpA0TnqG2wMrFppEM1?=
 =?iso-8859-1?Q?/mLh7o1qZIKfym9dFU4ibdkoo4NO+i3RoJhuRt58Bp+zmyRVWIhWJaG8L0?=
 =?iso-8859-1?Q?i2Ss+4Z4yo/BGJDGdWTvKXMweXH76Xw8Jl2CzSevW+y2vfRpWTFZE1B/St?=
 =?iso-8859-1?Q?GpCfYX64qemR6+8smBRfXVu+auA4CGNvjqs0EtFj8F92pLq5rZJQ239A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB10110.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7accec7-3bce-49d9-2dab-08ddb937758e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2025 07:10:00.2794
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GC1lD4BOtOf0rrgVpYLqHfktBBm+wA7DBRTdEQrfKNTSeuJdIv8eL8xGwSu3uuu0Crf9z4M9NttvF0J+fd7LFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6651

This series introduces SMMU handling for PCIe passthrough on ARM. These pat=
ches
should be able to be upstreamed independently from the vPCI series [1]. See=
 [2]
for notes about test cases.

[1] https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00660.h=
tml
[2] https://lists.xenproject.org/archives/html/xen-devel/2023-06/msg01135.h=
tml

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

Oleksandr Andrushchenko (1):
  xen/arm: smmuv2: Add PCI devices support for SMMUv2

Oleksandr Tyshchenko (1):
  iommu/arm: Introduce iommu_add_dt_pci_sideband_ids API

Rahul Singh (3):
  xen/arm: smmuv3: Add PCI devices support for SMMUv3
  xen/arm: Fix mapping for PCI bridge mmio region
  xen/arm: Map ITS doorbell register to IOMMU page tables

Stewart Hildebrand (2):
  iommu/arm: iommu_add_dt_pci_sideband_ids phantom handling
  xen/arm: enable dom0 to use PCI devices with pci-passthrough=3Dno

 xen/arch/arm/device.c                 |   2 +-
 xen/arch/arm/include/asm/iommu.h      |  15 ++
 xen/arch/arm/include/asm/pci.h        |   2 +
 xen/arch/arm/pci/pci.c                |  14 +-
 xen/arch/arm/vgic-v3-its.c            |  24 ++-
 xen/arch/x86/include/asm/pci.h        |   6 +
 xen/common/device-tree/device-tree.c  |  91 ++++++++++
 xen/drivers/passthrough/arm/iommu.c   |  13 ++
 xen/drivers/passthrough/arm/smmu-v3.c | 119 +++++++++++--
 xen/drivers/passthrough/arm/smmu.c    | 246 +++++++++++++++-----------
 xen/drivers/passthrough/device_tree.c |  49 +++++
 xen/drivers/pci/physdev.c             |   7 +-
 xen/include/xen/device_tree.h         |  23 +++
 xen/include/xen/iommu.h               |  21 ++-
 xen/include/xen/pci.h                 |   5 +
 15 files changed, 520 insertions(+), 117 deletions(-)

--=20
2.34.1

