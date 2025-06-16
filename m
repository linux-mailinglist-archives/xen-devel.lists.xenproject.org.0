Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB398ADA7E0
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jun 2025 07:58:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1016439.1393336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR2qw-0007Wj-9d; Mon, 16 Jun 2025 05:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1016439.1393336; Mon, 16 Jun 2025 05:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uR2qw-0007Tq-6O; Mon, 16 Jun 2025 05:57:54 +0000
Received: by outflank-mailman (input) for mailman id 1016439;
 Mon, 16 Jun 2025 05:57:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHLp=Y7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1uR2qu-0007Tk-Or
 for xen-devel@lists.xenproject.org; Mon, 16 Jun 2025 05:57:53 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d38e34f2-4a76-11f0-b894-0df219b8e170;
 Mon, 16 Jun 2025 07:57:46 +0200 (CEST)
Received: from DUZPR01CA0235.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::19) by AM9PR08MB5908.eurprd08.prod.outlook.com
 (2603:10a6:20b:283::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Mon, 16 Jun
 2025 05:57:43 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::6) by DUZPR01CA0235.outlook.office365.com
 (2603:10a6:10:4b5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.27 via Frontend Transport; Mon,
 16 Jun 2025 05:57:45 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Mon, 16 Jun 2025 05:57:43 +0000
Received: from AM0PR08MB2978.eurprd08.prod.outlook.com (2603:10a6:208:66::17)
 by GV1PR08MB10752.eurprd08.prod.outlook.com (2603:10a6:150:15e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 05:57:07 +0000
Received: from AM0PR08MB2978.eurprd08.prod.outlook.com
 ([fe80::d3b0:d923:6dfc:822c]) by AM0PR08MB2978.eurprd08.prod.outlook.com
 ([fe80::d3b0:d923:6dfc:822c%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 05:57:06 +0000
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
X-Inumbo-ID: d38e34f2-4a76-11f0-b894-0df219b8e170
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LEvYiqUdG0F2w8d502SAeear/fjjAfW/cVDewwVhp53Ym0HPkeeBqfjzyoM/GWjJxtX0yDYYXtYisZAnKMQgMCc2UhAA/+h8JWLxUPOrlMXHjscvEYujhQ0/T6I+IkRkjWSA0GDlEEhvyp0BtH+Sjz5/FP6bxN4QhdD+G+WnD2pZEDm+VrtW08ghrTY4s9mR4EkfcSupPWFbLwroHMCZlRSZPFa0BfaTnZqqMEkeqmjTbPOygbaL9HIQyZMiaSIOA5MEdGXbOOiWvHe27xgounbCHLZmpnaqbaQ+C9NyZ4h9ufuu+dRX4rPDvvIgQFnOz9/oxBVUNDpBEeCj0YQOhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sztFwjggV4UNJ2Hc1FrZKNJw+nI5bTE2MBT88wTcXgY=;
 b=BeLJ9Ea9XgktpUR0Ji902fN/CZgLXTPrn5Qw57f+frr1mYJZfjxcA4b9pvHCu1/EfGVbQyXEjfkRL04Wp72ou7HWyap2yDFgEO7KOH8KcDek420VUTpHCeVISPcMaVsLe1ADkvzjFvtdTsE1CFDukz2UwUtoSlVQhLiaZI+oraK17E6ggfQX7gGsEJrDYLaQPtAvuEZJ0PP87JrD8dPAwwJOj35/TMoL4oWB8d7I/G3wv3T+zxYAT/1FzVBrdVrnVK6AMG/BBDStaeTzqSfC1mtTVbFaV7UB2P7gHypzqIEEgZR2toOcixPa8lqZ0Gnj6H8xYPLnvUfhp7gwmk/fQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sztFwjggV4UNJ2Hc1FrZKNJw+nI5bTE2MBT88wTcXgY=;
 b=NkBGb2kHz2QzvyLDnFW+gekZQkP4LJJvguFXC+RLtPOgSXHW0e36pOzizFmxR9YnKT/jVUV+jbPmjEAWCZP5BjTWkWPyn/+NO14CSznAWmlFRKGafNPfHrAfn6Cp5fdODneY658SP21nACP/slOs2S84099FZdCfM50s5TYLEKg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jTopw+b+IYE7d+9SU/2Lilfg5LGrMBtYx4VEHnkchMqZJ77BFzMVBN5dhXIcNnko9uwfTeBwgVjNc/NDLX+DGsKXCi7S7lTSaJgt/sDJfss7khdPMmjiStCesX9qhuaj88zeR8/Nc+DORfT4mZZLjZA+K4BN5AOdvz/HTJTkvmW2eHPCU5bsIfOnb6deOWXgOrPuzeoPyGQyk/xrUsRhZZ/pm3UyQfvqvibNyPIyn9Kkt8lJJyiiU/hCoJliOu0yFS2jHrbRT+/KhvDZk4C/UjuG9lXEUMS08MzrkAIHNW2PZV/r1nJHkt75a/coUWtxH5UGUjlQ2CdNmBJ5265iYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sztFwjggV4UNJ2Hc1FrZKNJw+nI5bTE2MBT88wTcXgY=;
 b=npVCA3vhGm86pV1VvS6UABnIhbDgUm9Xtoc6qhoSs5NCoh3ZwtLT2P3jABhTnxXLE7RUrZqypzsQThKnuGEKSAlv9YwqrmbBucEBR4MN8juA+5EBA4jS2wRBK4hOHGVc8hT7v2sYnXBOXxa88HGuuC1Lx4WEaYRpWRzrDR/q9JO++4P1FlzgIWJrpvCMYfC6KBKv+5Nski1NdFqsEHowE1aQLMGNumJedh7k0b+v22Of29ynJ0iidxcj7+DpI/zvIzGlPWsCEf0rZ8qHx450usaA5XHsfda1a2aU1wy5ok+bYOHIJXwiRcDcE/XxrmfBP5OWEbIPZrgmy0l1HZlnCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sztFwjggV4UNJ2Hc1FrZKNJw+nI5bTE2MBT88wTcXgY=;
 b=NkBGb2kHz2QzvyLDnFW+gekZQkP4LJJvguFXC+RLtPOgSXHW0e36pOzizFmxR9YnKT/jVUV+jbPmjEAWCZP5BjTWkWPyn/+NO14CSznAWmlFRKGafNPfHrAfn6Cp5fdODneY658SP21nACP/slOs2S84099FZdCfM50s5TYLEKg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 6/6] arm/mpu: Enable read/write to protection regions
 for arm32
Thread-Topic: [PATCH v3 6/6] arm/mpu: Enable read/write to protection regions
 for arm32
Thread-Index: AQHb2t7jddptbtJu60em4gEBgB1jlLQFURgA
Date: Mon, 16 Jun 2025 05:57:06 +0000
Message-ID: <4E45B90D-AE21-40C9-9543-3890FBECA276@arm.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-7-ayan.kumar.halder@amd.com>
In-Reply-To: <20250611143544.3453532-7-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB2978:EE_|GV1PR08MB10752:EE_|DU2PEPF00028D10:EE_|AM9PR08MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: 73df25a7-0205-4d7d-a915-08ddac9ab5df
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?991NRl2jAvF0rZb3XtmdHnXsVxOJx5jxJjtrYtL/yAW46VUPKkKawAkuIqoc?=
 =?us-ascii?Q?mHHzaFexcP331Nir5TV5yojzme00Z4mvNZRf87e1zIV67WjRpRLPgjnOeRhK?=
 =?us-ascii?Q?K95q95xaKGvZehGRGsyKllOtoy6pBt0OeyMfAEwmP+liM52B4CKgeVMFXCWc?=
 =?us-ascii?Q?85etBaJRIBl+dhWF+U6If12ZsScuxvAh0xDChw8Qmx1//iqGef2VuH4gmX5D?=
 =?us-ascii?Q?dSG7fPOah8MVeJTYh7Dg0kE/fkrXyazSF6xnnyW3p3UwdTQ5EA7wYbKtLA58?=
 =?us-ascii?Q?1Gw5sVi6e2jb6UtS7xWag+swx8DHG6uX1Dr9C88EvDUjYSYc4NJhlYxwMcZl?=
 =?us-ascii?Q?ZCiY0fGmP3Z9MjWfRpQQ+vf1Y4/v2gXgI1BEXIBcG5oyXCu4VWZIyczUg8DR?=
 =?us-ascii?Q?2WNCVzNsrSIMv2p4f9V9PIlq91r9yTyf7s8rqmiSg7pWN2YuA/fEABEoaj6Q?=
 =?us-ascii?Q?5u+57Rmps7DHbzUVjLHm4tH4tXxSf5UCsyUqBOtYDSl9zpnEY7jRbXuDVIhE?=
 =?us-ascii?Q?EgMN619yi1ENxG3Z2MwQYqcH36tzmCf9m2xzQDPqlwkvfCslu0F5lgas7Bzu?=
 =?us-ascii?Q?W/zOwG4RDQZI4PCBsBPTXDZEe7mnVlXzrwZhSRcObuJ9LF2fWecuLrC2Yg3Q?=
 =?us-ascii?Q?Ej9FqX/JQLDKZofp3PNV6YWEOV2TSFXmEbdjjKa4rguY/ecCNfQ3tcr7EEYR?=
 =?us-ascii?Q?aeaVYkoViIRqx3nU3w9VhlRwBqI+GC8FOKLDEmb88N2jqj2Mwq8ElmA4k6A+?=
 =?us-ascii?Q?xmY0E3eZUx7uSh1BVmeyQ3/QJ3gPSO0lrzv+AqZTNaeekd4BttQia4oEdfKf?=
 =?us-ascii?Q?8biYBZ2Td9KW0cA7PZgOhZhWFVaLcv2tafMWF9sGVNNo61gjUe8AWEuVo6z8?=
 =?us-ascii?Q?mzL9Cm8K2XIMhzIv5iR+7SaldM77V/c88PYeWNpUf0PY3sowfFUACOPyWWTi?=
 =?us-ascii?Q?dgPmE2JL3ZIlcjVbBGh64OiDJhzOzap9DNiftvLVlueQnw1eQc39qZAHteuh?=
 =?us-ascii?Q?4x7kfIuQcj7BLKiPe4eHTcP3QmZ5rYuhtJQB9anNEkBcHq1DiwoW/cpX5L1Y?=
 =?us-ascii?Q?VxeFolLJDAbJFFo7364n6TlC1UThc7nuoRhSeCZFROU5a8BtVLGpERx/4YWe?=
 =?us-ascii?Q?ncjvUZtUieWELEyVLTpFD54lhZdMpnBAkTl/1HD6s1RjNChto+p3eJL+fc9C?=
 =?us-ascii?Q?YD4OSF/nfSSyzqEH8lPPBQusRdy8u7C3hGipnjVrK5kldfZjAHhzbuz6JxUq?=
 =?us-ascii?Q?2VIGX0BGAY4Lhu/1sBqrRThJRZcBCgYUNFcV7yV+Mt46WtPIPlOD9cI+bVxT?=
 =?us-ascii?Q?Ft4C/B2FrD2IR4GtzWl7os8llez/aBjVWZDFbRJSZY/4WV71WbsBdj21k5ru?=
 =?us-ascii?Q?7LeD1XayN4N9kibxsh4zl15KHibuNAlHv3f/c9/vbN4hzARhJEMMyxjewWKY?=
 =?us-ascii?Q?BrqnAaljHJvThDNEwxN8P9SJ27QNFDoxmkm+bWynF+bCq0cHNyDILQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB2978.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0D92A7FE1164524B80BAFDD0B71357C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10752
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	051c60f1-b681-40dc-431b-08ddac9aa02d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|82310400026|1800799024|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jBrmgOo68kXxaStbO84Uz20GIztFWDcuOnh5+UuzcRePUawCW6r6uXKV0IyH?=
 =?us-ascii?Q?oIBbJDIe+D6mFct5j6WLTkA436dd14SYhXX4vKyHh+vxyjkgW8SsRCqV4Hg2?=
 =?us-ascii?Q?C7rlOgvM6zAxmpt3TqmTdU3C7zxxSqqF8L/owIHTP2iv/69WqlumMN50Ybh+?=
 =?us-ascii?Q?qiROIhJ+4Yrvy+j9y6IOi3OUXidoUg3eAlvjjocTbG6enns5qPivNtbgIVHc?=
 =?us-ascii?Q?6OXCEEUiGTtx2AHGYX5ugaMw/zCbOl1el8aXo2qijhwnTLPFt7103pGjApMP?=
 =?us-ascii?Q?taY0JkOw3U/0PuzCUCdxz5QPD1vW6HTA3Wk7PYhjbqt8mSDM/BnS7ylRzOMr?=
 =?us-ascii?Q?SvwfYDrzKeqh4+glS2tZ1psv3RRMUqaJduKIaMPP7M5ZISU44Pq/DXiyYEpd?=
 =?us-ascii?Q?Nwb0aappwosJm8selFKTeSYKQDF7P2RKNAOg+dP6k3zk7il6pMbn/T2+0oUS?=
 =?us-ascii?Q?7ZMCtvX6DUuu05ZXiCMjoZxBbhyhiJyGbHG3RG0YnsmjIDQRhDmIOLfoRUui?=
 =?us-ascii?Q?YGmdcjI9Tc2Mg9twWvCSZcVmc3UnSJGSXieb4+jb2KZFjuYZPhbC+Zz1P44u?=
 =?us-ascii?Q?cS0S57POEbeYL0njsgawyc10d5IE9qFZaTlRR+aKgFsgD/npi8JvmLwOnyg8?=
 =?us-ascii?Q?TNzXylNVaWvGCuNBcZyFTGKCXJXndYYm/QKOE0Zf1ZqbP+3xiyc2XuwPnZls?=
 =?us-ascii?Q?JaAWuZfYdujfDOWBFji0jcmf4SPGiTZRqJo7qN1oePaPZCTcvKawE9Osx3P9?=
 =?us-ascii?Q?HodvIfOC2q2lwbah9Kh6YizfQiPwsbvMtvOTHosFJZiAWf0axEZKjoXpzeAB?=
 =?us-ascii?Q?NEHh9UKLWbM254DrqGVYNliDS1z1VdvZ/QCSSqN1OQGOH7MgMnyrwhMntrYC?=
 =?us-ascii?Q?GadcLQAOicbv+YpPFql5bqedT7vBYeMmw7fXi04GlINjB0zy2uMn1SvFOjiR?=
 =?us-ascii?Q?orlL3GuQtkAniFZX1NbGe8fU1BxNiXuesJkmB+NS3DHPD6O1BwKRH+FjZNFq?=
 =?us-ascii?Q?UU1rtfQ50D/uIP1L3Lo+lgJDDzqrZ7wPuHD1c9Ghuf/AAGWaUJX3TVaNq2ai?=
 =?us-ascii?Q?dr8UUXizbGj7iqS3ybvgav7BM0sCYlESer8RQcZLttcDoqv0oaCGhGTC9E3J?=
 =?us-ascii?Q?cSk/Umy8DZpWlKbLMCqFOKsXx3oAvF2QuWdr06w9TZvoCRNbo4OQryJAgZzx?=
 =?us-ascii?Q?UxvP+2AOnUjfZniZlHEm+PKiy9SVJP/3U+y8T1FuFn9DMskwHChxHz7lpJO5?=
 =?us-ascii?Q?YkJoiPbOr2/lmboJItnlO0WI/Bk9aLTpF/bexgYm/mRtArfpRcY/woMJ347e?=
 =?us-ascii?Q?5yNKT4miP352LsLWU2i7tv13C7crZR0f8xiTZWRvFtbiLBFgpCxStrLVw9q2?=
 =?us-ascii?Q?dlz8UM76oekTqWrWPF16RBQWoLk4Vq6UII1/dNPlSnAEa6CJeT3HjSrsAFCP?=
 =?us-ascii?Q?4WpjgTN8xnnasdA9c6Qnx18+aFfDTD0uoPT5Kl3U5+r0yjAsBStmj36KAbAM?=
 =?us-ascii?Q?7uuFF5H6tGR8VxBugu/3Qsh9JKBsH0RvQtXt?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(82310400026)(1800799024)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 05:57:43.1808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73df25a7-0205-4d7d-a915-08ddac9ab5df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5908

Hi Ayan,

> On 11 Jun 2025, at 15:35, Ayan Kumar Halder <ayan.kumar.halder@amd.com> w=
rote:
>=20
> Define prepare_selector(), read_protection_region() and
> write_protection_region() for arm32. Also, define
> GENERATE_{READ/WRITE}_PR_REG_OTHERS to access MPU regions from 32 to 255.
>=20
> Enable pr_{get/set}_{base/limit}(), region_is_valid() for arm32.
> Enable pr_of_addr() for arm32.
>=20
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
>=20
> v1 - 1. Enable write_protection_region() for aarch32.
>=20
> v2 - 1. Enable access to protection regions from 0 - 255.
>=20
> xen/arch/arm/include/asm/mpu.h  |   2 -
> xen/arch/arm/mpu/arm32/Makefile |   1 +
> xen/arch/arm/mpu/arm32/mm.c     | 165 ++++++++++++++++++++++++++++++++
> xen/arch/arm/mpu/mm.c           |   2 -
> 4 files changed, 166 insertions(+), 4 deletions(-)
> create mode 100644 xen/arch/arm/mpu/arm32/mm.c
>=20
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mp=
u.h
> index 8f06ddac0f..63560c613b 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -25,7 +25,6 @@
>=20
> #ifndef __ASSEMBLY__
>=20
> -#ifdef CONFIG_ARM_64
> /*
>  * Set base address of MPU protection region.
>  *
> @@ -85,7 +84,6 @@ static inline bool region_is_valid(const pr_t *pr)
> {
>     return pr->prlar.reg.en;
> }
> -#endif /* CONFIG_ARM_64 */
>=20
> #endif /* __ASSEMBLY__ */
>=20
> diff --git a/xen/arch/arm/mpu/arm32/Makefile b/xen/arch/arm/mpu/arm32/Mak=
efile
> index e15ce2f7be..3da872322e 100644
> --- a/xen/arch/arm/mpu/arm32/Makefile
> +++ b/xen/arch/arm/mpu/arm32/Makefile
> @@ -1 +1,2 @@
> obj-y +=3D domain-page.o
> +obj-y +=3D mm.o
> diff --git a/xen/arch/arm/mpu/arm32/mm.c b/xen/arch/arm/mpu/arm32/mm.c
> new file mode 100644
> index 0000000000..5d3cb6dff7
> --- /dev/null
> +++ b/xen/arch/arm/mpu/arm32/mm.c
> @@ -0,0 +1,165 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <xen/bug.h>
> +#include <xen/types.h>
> +#include <asm/mpu.h>
> +#include <asm/sysregs.h>
> +#include <asm/system.h>
> +
> +#define PRBAR_EL2_(n)   HPRBAR##n
> +#define PRLAR_EL2_(n)   HPRLAR##n
> +
> +#define GENERATE_WRITE_PR_REG_CASE(num, pr)                             =
    \
> +    case num:                                                           =
    \
> +    {                                                                   =
    \
> +        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num))=
;   \
> +        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num))=
;   \

I was also thinking that in this file now you can use directly HPR{B,L}AR<N=
> instead of PR{B,L}AR<N>_EL2

Cheers,
Luca=

