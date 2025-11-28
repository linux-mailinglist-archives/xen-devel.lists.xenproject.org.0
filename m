Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B5BC914F7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 09:52:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174571.1499526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOuCP-00040I-1Y; Fri, 28 Nov 2025 08:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174571.1499526; Fri, 28 Nov 2025 08:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOuCO-0003xL-Tf; Fri, 28 Nov 2025 08:51:28 +0000
Received: by outflank-mailman (input) for mailman id 1174571;
 Fri, 28 Nov 2025 08:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q4nf=6E=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1vOuCM-0003wh-Hk
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 08:51:27 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 644e91dd-cc37-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 09:51:13 +0100 (CET)
Received: from DB3PR06CA0002.eurprd06.prod.outlook.com (2603:10a6:8:1::15) by
 AS8PR08MB6358.eurprd08.prod.outlook.com (2603:10a6:20b:337::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.16; Fri, 28 Nov 2025 08:51:06 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::97) by DB3PR06CA0002.outlook.office365.com
 (2603:10a6:8:1::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.15 via Frontend Transport; Fri,
 28 Nov 2025 08:51:07 +0000
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Fri, 28 Nov 2025 08:51:05 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com (2603:10a6:10:2d7::16)
 by VE1PR08MB5582.eurprd08.prod.outlook.com (2603:10a6:800:1a5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Fri, 28 Nov
 2025 08:50:30 +0000
Received: from DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc]) by DU2PR08MB7272.eurprd08.prod.outlook.com
 ([fe80::ab1e:55db:9d8:afbc%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 08:50:30 +0000
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
X-Inumbo-ID: 644e91dd-cc37-11f0-980a-7dc792cee155
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G01D3FrlbB9SvPCJIdb5WUdU+xNUCUxvjnsq+iU5BxoSZS+Ga+pD/pruyNcYQHPeW8LyBgjUooereUetVb4ZnxBj7PLJ7Jb5mChGhejUJs29EROCgSClp9ciaEaMaj9PFmCj7xtBGsrhJJQVPQiYy1pKHgC8pMFzFrkE+6nzC9h0q4bu+E/LxxhVEP02mbV32YDSkAu4chJu5goI5PLLEtZBI8eWuIDGeTneQdhsSeOBHy5cSpVyhimcVDj+SmkB4Ae4dNqO00mrUw0oiAiSfpWKEyxqWCcZBx2NVpGaQounpb9z3YahWeGFL6h8mHRlqrjmVNC6QTq7JL/OpOC76Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mt58WoVL8z3lFCQlq8fkRyvg3543CR+7QjtFB/29Pfo=;
 b=j5ZMAid+EFsBFC7GOLRbbyYX3zM50AEhNSjJ41wIKdGxXSS8tU+pTawMDE05NzuCIU+HJy37WkQbgZDt1iiG4B+bzceB52GEHASJIgslPbzT0rsID6Uda2X1J2N/ICyPwhoNoh0DbzYMoN/5Sg9Itu/tKcbsKi/1/wxvFlOyyXzVX2bn3jRAq2bpUfPu2MTs/gctgy+YClLRTvJttxQp3ET1VML8VFTuJCK3Z8KP+l51VYitV/rKZd4P284pdJ9AdRR1LRNrnYxULrALzqjGibWLXWrAWKTtL3SUNETg5nAzpxRBnv3GTSziDJKPCCkeovHVWvN58UkyBL9XaVAHuQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mt58WoVL8z3lFCQlq8fkRyvg3543CR+7QjtFB/29Pfo=;
 b=UE00+IpWSA1Bf5/AX3VA9l6HRE+F8kblDva4fK/uLEkG81K4Lhg3zHMc8oopmkH1ncEDeHURrb0y5miwo41rkoGQUjNfQMIXvy2BKyXiadhucnVcgJvuFjASSZ7i8gDIGk3/vqEy0kB9224jL+bhIe8bzMbxBM66SY9L86x4tNg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8cOmEz4bAoip01NyXlO78E+/4ASrr50huT+35obuxUIUigrQfpY93tX4o1Ge2dgXUlfz5eXNaerWTM0eweSiIyJt41aDHSw3tpUK7CqNjcZrmjm4yk/Lt/di0e28Cl0obNHoNd/Uz3J3hrhcUcG4Y4ocjME7xMD0+gb/4EeFNX58SAYd+fx7YSfCVVxFFQdlg4a2CniiFAXyAMNI0ExatpFY8dbAGthJrdosMfP3RLdgYUuigxiBkEYATu462PLd5TJHg0uMo+zRYau8nyRscmFQmk7aM309EcQr+Ja8XksOImbuXocDYNLnN166Ca+DDrKw206RA7AqrfY1Whgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mt58WoVL8z3lFCQlq8fkRyvg3543CR+7QjtFB/29Pfo=;
 b=vXgOJ5IPur7qjz+jdNq1pDGNyiGYID5BTHJaPdezCXcVSp8AtRxzeIrqlZoEjl0i+hX3hZ/z6q22vIwyDvEj79CdI1RmTaGxyZQoRQ0+JZ9swZvqsNrtEz+FfaKJgnCLJezbpbTxy9nqvBcfCp38VCEDysW7xG4F8lWMoTgXAvT5dLymh9VHln73CUXtBXGfzUtrwt/wmT0lo/Osc2iS2L5PcKNPsyPfLCYJ0SNkNIQMEgIg8Nz0RN7rgDZfVjXA1yvTFj2mCWBda29BAYKFXnuNdXKZN+rhyyolsj1S8LHIxTfS2jcAO7QHUh74fH1XC9R0XXK0t6/Y/WhyvQzXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mt58WoVL8z3lFCQlq8fkRyvg3543CR+7QjtFB/29Pfo=;
 b=UE00+IpWSA1Bf5/AX3VA9l6HRE+F8kblDva4fK/uLEkG81K4Lhg3zHMc8oopmkH1ncEDeHURrb0y5miwo41rkoGQUjNfQMIXvy2BKyXiadhucnVcgJvuFjASSZ7i8gDIGk3/vqEy0kB9224jL+bhIe8bzMbxBM66SY9L86x4tNg=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/dom0less: move make_chosen_node() to common
 code
Thread-Topic: [PATCH v2 1/2] xen/dom0less: move make_chosen_node() to common
 code
Thread-Index: AQHcX7qka++CFdufxEmRWlGEcHg6JrUHyH6A
Date: Fri, 28 Nov 2025 08:50:30 +0000
Message-ID: <E64D2D6B-0E5C-4582-8D21-A25E321F5297@arm.com>
References: <cover.1764260246.git.oleksii.kurochko@gmail.com>
 <84178652f3cd60303ac1e81f36f852bc685e0ba4.1764260246.git.oleksii.kurochko@gmail.com>
In-Reply-To:
 <84178652f3cd60303ac1e81f36f852bc685e0ba4.1764260246.git.oleksii.kurochko@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DU2PR08MB7272:EE_|VE1PR08MB5582:EE_|DB5PEPF00014B8A:EE_|AS8PR08MB6358:EE_
X-MS-Office365-Filtering-Correlation-Id: 06db430d-6c9a-4b2c-c2c6-08de2e5b441b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RUkxVkdaaDJyVzREUmhHQzZEcUU1S0RSK2M2NFgyK0RIc044YW1lejNySVhQ?=
 =?utf-8?B?b3BHTS9ndSt0aWRqWC9kLzcwZXM3aGs4RDNKbjc1dDVxOU4xRHIyTTBZSkFO?=
 =?utf-8?B?citCYTZBeWhHUVM3T1FRcUF6MDQ1a2hrVHgycEc1TU5hZ3Z6QnlDVzNxaDRi?=
 =?utf-8?B?QnBEdi9rU3VlODVDb2pHM0s4MzY0ZXh3alBNMHJJY056VW5ZKzdlR0Z6eDMr?=
 =?utf-8?B?VDQwZy9KbE92VDFPNFlMeXRWZDd4eXJ0dFNsbFFxckZvNFBsb0VrUUp4K1lT?=
 =?utf-8?B?UlRJVUh6ZHVvVkJQL1ZvVDZvZXNZRnM0SXRCKzlsMzBmZ0Z2SFNuL3JhUTRB?=
 =?utf-8?B?OFE3Zm0yaTNzSFlpdVFGcldiVDVpUTlFY1Y1LzZBZGRwYlVqUHUzYkk5elNv?=
 =?utf-8?B?dkpTU1ZhTllyM0JucjZycmRZaldRWXB0eHcreXdxTnY1OERPR2lYWTBrUXQy?=
 =?utf-8?B?QVduOWw0SjU0bDNWRHVidGZucWFoSE9XUHN0UTJBemQ5R1p5bWhEaUsvbys3?=
 =?utf-8?B?bEZPRDdDeko2WnhXU05OR2E3bUVGWUQyNzVDOEJtT1BZOVE0VDZXOXIxMWZZ?=
 =?utf-8?B?Um5nbFM1L2xwL3RSZnRqK1NuRlVKY0ZHbEFoMkZNNXVrU3cwZlFyWFI2SWoy?=
 =?utf-8?B?R1ZsVVZ6My9NcndhM2t0QjdzQitRZSthckhZTVBDYVF6eGZZaDhTSThRT1BX?=
 =?utf-8?B?cEpPZk0rSnl6SVVEYUJBNnBXTDI5NFU5cnVublhzOHlhMGdIazN4ZXlYcHVu?=
 =?utf-8?B?bTgwN2k1UmRsOURwSk9IaHhKeks0TjRoTEVnYkdaUW5WRHN1SlNzZm9kOTlj?=
 =?utf-8?B?dHRZM3ZpRTZkeFFjVERhUjFLeXBwaVM5YVE0VEw3VnhYUzJyZk9BU1VDODZh?=
 =?utf-8?B?RFlUWjU2Q1dXc1RlYStCbzNCbzZpbVdXYS9rM2FsOFFxQVJKbTRXaU9zRXNq?=
 =?utf-8?B?d091bW13UU9QTk9mb3M4MmhOeC84NUZCMFNYeVFGc09VamdvdDJIS0hmMVBa?=
 =?utf-8?B?NVN2VlM3clNIc1Mya1lnUitVU2o3NnFmUVZzbkg1TGNHQXdDb21DVWV5NGFQ?=
 =?utf-8?B?dnpaN1QrZ1BvOFMrRHZobThqcHBlMzJDZTRjQSt3TmVmUUx3Q09ENGtzL0ov?=
 =?utf-8?B?MHg0ZEZaK1BsNytqZEtnS3hCVms3MFk4ZHpwWmxZdWhYOEhaM0xpOENQaStM?=
 =?utf-8?B?c2VGVXVXa1dVMDRZNFFjaTNKZE5mYXM5b1ZJYURPVW9uVjFod2o3NFRVbUFt?=
 =?utf-8?B?Z3lhcGlGWmNsNDN2bm9ZSGViVEFoajNHcnMwbWQzblFBNEJlYklpRmkrcm9G?=
 =?utf-8?B?VENOeGQ3bGJma3RQakxYSGN5V291amVQMWdKVXNVWXhBQUMrdk1yeCszTXdS?=
 =?utf-8?B?a2ZRVWRNQk9mZDF1eHR2Kzd0NEVsOVZRQlpNOGVoYVhOTC91dkJvYUNqVjZo?=
 =?utf-8?B?bi9Uc3RQaVQycThqbi92Ujd6Y0g0SFJObStrdmxtckErVjQ1OStNYWZEUi9B?=
 =?utf-8?B?RUR6WDRwUjAzV3JLTlVkcHcrdGxBd2QwNjVXUUtibGRwamhQSnBNYlRKeUR6?=
 =?utf-8?B?bTNDL3Z2cnY0L2ljNWZKZDdETnNUQThmNlNCK1lEVndVS2NlWFBtSmN4MWZY?=
 =?utf-8?B?TmNjZzRMaTBaVzRBTWg4eUlmZk5pZE50aGJmb24rd3J2MmRTRjY3aG9NTmRX?=
 =?utf-8?B?SGZiRlVDTnlqZGczY2dDUGJyWkJGbEJ5N2lpbUdHaXVRVWVRTmxLZFcvNmYr?=
 =?utf-8?B?YmlrVUVtU0RwMllJb3ZrR283endxSTFBL3JXY3o2Z282K0JKR2pQbVMrTWdG?=
 =?utf-8?B?U1RtcXo2dFI2K3lwNzBsUE5qLzh6S1hHYnA2WngxN0FsUUx3WWN6M3V5TEt3?=
 =?utf-8?B?Y3J1R05UclBWblJqbWl4TmVsbXgzU29RS09FZ0hPUlJ1TlRpUGpzQmFKeThp?=
 =?utf-8?B?Q3ByL2NvdWJvTlVlUXVFY3hKMWFmRFRGTE9OTU5ZSmdXQ3RvWm1tazQ0c1ZN?=
 =?utf-8?B?ZFNGb1hSa21tQWtLaEVSaSs5T2EwVjFpeWFGUWNSYWFnRHM2K3NJczFmSTBq?=
 =?utf-8?Q?77qhuX?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB7272.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3AA93E4A52001F4AAE4E62367BAFDB7D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5582
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2d7112c2-c5a4-4016-3568-08de2e5b2f2d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|36860700013|82310400026|14060799003|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q2dvMGE1UzVZZFRjcnlEZlMrUFNDL29lSlZxZXlpVXlYcTg0ckFLS2tyeEpQ?=
 =?utf-8?B?NlM4bDlVdUM0OWp0d2J1QVZ1dHNBKzBDZHBrODdoS21JcmlNV0kybmdnaXFV?=
 =?utf-8?B?VzJiQUVZTnRVbDUrOUJZWmtyZXROQmIvWmIzck1hRUVmYmZWMkRDTkN2VUwy?=
 =?utf-8?B?bXJyQnhiT0NzcmNyc3RMWUpBMDRMVnNmYk1FRlEzaC9xZ3RoZjdrQnpCbTha?=
 =?utf-8?B?cHlsL0tMMFUxUi9HZllFcThUYlZzRXg2VlRqR2x6dUNCeS9hWkZoWENKcGpJ?=
 =?utf-8?B?dVMxNDJNcEJSZkdjMUJwU1AxNkZwQm1DRDMzemY0Y045dDZOTzl1eERuVk5j?=
 =?utf-8?B?WkszbU5PaTF3c2ZDWXFUQUxrVWJXMUcwTStmNi9PeXpwU25nMGt4RjkxNFlZ?=
 =?utf-8?B?Q2w1aGo5a3p3enY1NitLNGtoRkVKVk9NVXlaakJZbjBzUHZZaGZ1STZPTEZ0?=
 =?utf-8?B?OE9GanZpTVZyR3ZkTmlYUTN3ZGR4YXFBV3NJTys4RkxWK0ZWWVVzUzBTeCt3?=
 =?utf-8?B?ZXRNMnlIUlVUemIybGJIWHpOYVpKRVp3MzYrSmhXZWJ3aVo2VHB1YllaTi93?=
 =?utf-8?B?SHpBMWR4UFFwclBaa2hCTXZMc3VOTEZidk9iQmpSR3VCVTNWMXFqU04zcmFm?=
 =?utf-8?B?WWhpWVNoblZ6N3NQSmpYUU1NekxJMnNIbjdLR0VteGcybXY2a056eGZTR0V3?=
 =?utf-8?B?OXI3ZWpkOHJFYXIwOTlHYk1ESFhxL09vZ1B3aUlDK1BKbnoreHM1R1ZjaGVw?=
 =?utf-8?B?WGhZSFlZU253Z0FER2Zyc2t2QmM2Y0tNaEhjalYrUHRnV1R0SWpXWHljVDc5?=
 =?utf-8?B?WmQweHMySFhWanNPcTRncjhrMzVqQVpRUFR5dnl6R3BtOFZmYzdoSEJLYWVP?=
 =?utf-8?B?dUpueGwwdTMvWk5mZG5lTW53cncxRTRqZGY3cjBtT1lyTW9yL2VpMkUyUW1S?=
 =?utf-8?B?TVhaRi9ZRElFZXNJOXgyTU1Pb1p4bVZBb2hVb05HWitBYUhjc3gveW50R1h4?=
 =?utf-8?B?VjhUOTNzaFo4b0gra2lkNlpDc1FUUWZPdzV4VGtpQysrcmFOVHVBYVlHcXdr?=
 =?utf-8?B?YzJDendFRW1FbFNNWWozLzhBOVJYYlM4ajAvK0g4RS9wZDBjTnpLR3RPRjdN?=
 =?utf-8?B?ZUFQTElJQ2ZVRDN3YmhZVzYyQUJ1QzJOOVhkN0hFaWtBS3UrN3E2SnNDYUxN?=
 =?utf-8?B?aVd5dzBsenFtR1hHbzBtVWgrTU5rSXltT0hSa1NCYVRHK0J0MUhnL2dMUWdw?=
 =?utf-8?B?M2pnU3VudVFnNmVSd3hHUVFBNFBBMXFUWmIzZ2EwcjNwZmQrMWpMdi9xYnJ1?=
 =?utf-8?B?bVdUazRzdTNwM3VIekIvTmhoWDlmbDAxaVVoQ1l1ODRySzkycFVUNk8yaTJi?=
 =?utf-8?B?MFZneW1zb0ROTUdWVlZFekRZNWJPMjM3Z2FyLy9jRENlWno5aVU5QjBlQjhk?=
 =?utf-8?B?VHZzUGxydll5NFJmVG0xWkFFMWxUMEhTQmZMcnowOTRJRFF4TExnMHZrVk04?=
 =?utf-8?B?SVZQRWZaWHFzcWZEbXBVejVnV3dxczVCZGIxUS81WGwrQlkzWHRJZXB0dFlk?=
 =?utf-8?B?My92RGNwSTFQeVdZcHBsL242aG1Jek5Zc0FnU0VxSXB0Uis3eGtHVnl2Q3dQ?=
 =?utf-8?B?anduOXFnM0tTUXVWeUVocGRKUjVabjlZQWdBK2FZMFpacHNmYlFBRnYyeEhI?=
 =?utf-8?B?cUl3RmJnaXZKK1FjY3NBeEtYbSs2TkRCK3BtWXNYR2phS1BIcHlMYTVONllt?=
 =?utf-8?B?RkhBcWQxeHp0UTRiemIrSzN1a2VOMStacXExdUQ0LzVaS0FWOXVKcjBOVFIw?=
 =?utf-8?B?SS96b3poclozM2d5c29aUEZjMFpSNkp0MFVMMGRYc2hvRzg0STh4b3R6SnRM?=
 =?utf-8?B?UnZEbnZzZkdrYnRlS3k3azIvSU4rWC91VVhvRkoxQlVPLzBlbGFHV0ZCMjB3?=
 =?utf-8?B?emcvaUtYRE4vMG5QSFhEa0JvQ09sN1ViR0NscWVkcUpqWnpPWjRZWDB5eUI3?=
 =?utf-8?B?MC95Lzk4eE9wM05LVlBCK3Yza2dxelBsRlFVa1lqSFU1TXJMczl0dGtmZzdm?=
 =?utf-8?B?YmxoZ3FJYXlmOW5yVW1PUE4yd0xiYUZyQ0ZzbDVEZTFSTG0xaUcwRFM3dE1h?=
 =?utf-8?Q?NhYQ=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(36860700013)(82310400026)(14060799003)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 08:51:05.1698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06db430d-6c9a-4b2c-c2c6-08de2e5b441b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6358

SGkgT2xla3NpaSwNCg0KPiBPbiAyNyBOb3YgMjAyNSwgYXQgMTY6MjYsIE9sZWtzaWkgS3Vyb2No
a28gPG9sZWtzaWkua3Vyb2Noa29AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IFRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIG9mIG1ha2VfY2hvc2VuX25vZGUoKSBkb2VzIG5vdCBjb250YWluIGFu
eQ0KPiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMgbG9naWMuIFRoZXJlZm9yZSwgbW92ZSBpdCBmcm9t
IGFyY2gtc3BlY2lmaWMNCj4gZmlsZXMgdG8gY29tbW9uIGNvZGUuDQo+IA0KPiBBdCB0aGlzIHN0
YWdlLCB0aGVyZSBpcyBubyBuZWVkIHRvIGludHJvZHVjZSBhbiBhcmNoX21ha2VfY2hvc2VuX25v
ZGUoKSwNCj4gYXMgbm8gYXJjaGl0ZWN0dXJlLXNwZWNpZmljIGN1c3RvbWl6YXRpb24gaXMgcmVx
dWlyZWQuDQo+IA0KPiBUaGlzIGNoYW5nZSBhdm9pZHMgZHVwbGljYXRpb24gYW5kIHNpbXBsaWZp
ZXMgZnV0dXJlIG1haW50ZW5hbmNlIGZvcg0KPiBhcmNoaXRlY3R1cmVzIGxpa2UgUklTQy1WIGFu
ZCBBUk0uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2lpIEt1cm9jaGtvIDxvbGVrc2lpLmt1
cm9jaGtvQGdtYWlsLmNvbT4NCj4gLS0tDQoNCkNoYW5nZXMgbG9va3MgZ29vZCB0byBtZSENCg0K
SeKAmXZlIGFsc28gcnVuIG9uIGFybTY0IGFuZCBhcm0zMiBvbiBGVlAgcGxhdGZvcm0uDQoNClJl
dmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQpUZXN0ZWQt
Ynk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KQ2hlZXJzLA0KTHVj
YQ0KDQo=

