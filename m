Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5DFA2E9FB
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:51:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884689.1294426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRO3-0008Aj-Dz; Mon, 10 Feb 2025 10:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884689.1294426; Mon, 10 Feb 2025 10:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thRO3-00088n-Aw; Mon, 10 Feb 2025 10:51:35 +0000
Received: by outflank-mailman (input) for mailman id 884689;
 Mon, 10 Feb 2025 10:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzWh=VB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1thRO1-00087K-Tt
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:51:33 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdb5ba0f-e79c-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:51:33 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by AS8PR03MB9582.eurprd03.prod.outlook.com
 (2603:10a6:20b:5a9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Mon, 10 Feb
 2025 10:51:31 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 10:51:30 +0000
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
X-Inumbo-ID: fdb5ba0f-e79c-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BwTE9aErPYYSg63yDFwJiEGILNKpNnBO5hsNbOVz4rIkURD6x9nVUzW8Q26C/+gwfgkEUJgN0qrqvQrxZgKthhp1yavij+lXKg2wi8dpGQdupFfdGJ9pUXyukxygcOQ7OtEygFODxKA17XS4Up1OeTfbJgoPlPJwbw2hsqA2Dh+Lz2TRH/kJL2aigzcONkOII2HYBcrEHF6RAi2goRLOJYe5Io0sUlinHbh+QZIXncjZUcSrD1fpPZM9Q03Nt3i3WpzAmgU3X7k+2nfq4lJT2uyaAoLhv3GFeFtigNh9rlY55ciclp9QQ05MysDrsTi5NmiJjaFl2PAiN8n9Gg0Bbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5zYbme3//s0huoh1N22iuHObY8pP8AbEUzNorHjiEGM=;
 b=vOo0juugKSN53/sAIiNyFMZJUNTz3lgDey5ANHWeNAKe/R5/KG7Av0TYk67vZZ+rodbVteGVAUSx0SWQzWhjBHNHRWTaEM/ctBRyPJkkAj81WkQPDBm9fXV0LG1qmEaVeu0nn9KIP2KTtSJB9kyFB/LaNOf2tCy121jvzRHC0kvaz5U1bQ1kPnA9cwQr4BhFHw7sJF4xls47l8RbEAzbSfDHupl2agFV+nGYEnSWlJhBPtacyDErcTXKw/j7HYOaUPq71GyRxoNRkYZzEpm1qkk4FJqjLglqvLO8T1Mb3E5u89Ea9Jmr4F48OiqjfspHajkdaBi1EIVIu71ttpIQAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5zYbme3//s0huoh1N22iuHObY8pP8AbEUzNorHjiEGM=;
 b=tKKQF7Zd6ZDujBIPCgNhNFpPfqGdYAMS9DDk5IeJD9sUgH8iMZoi/lgWl2p97W6/1e0kCujmHzJJn9IR7YPBWOISBd5xbG7moAHzSMm4vn1dUI3HazdXjUt2Sh9fQLoYGALZm77whApJVgpoZRBlWOFKkRVMGf9sC4JPgbjmqu0rzSLccGmWRRHFE7v9mWa1OCNVq4tmfXl6Vn4JFiJtG31UShwEsalaEHg+Q99ewurQ2ZXPbWi82dwjzASFv1EmwpudhQWJB8kBBuUKhRdukZfqJO6Sc/YqWNQWRcmYfyZV/P2yBus8iYHNRHaRKWxxASEwNrzto0AfkWBpu5QAMQ==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 0/8] SMMU handling for PCIe Passthrough on ARM
Thread-Topic: [PATCH v8 0/8] SMMU handling for PCIe Passthrough on ARM
Thread-Index: AQHbe6bWSthIneLqiEGoGplsvQOTy7NAWbUAgAACd4A=
Date: Mon, 10 Feb 2025 10:51:30 +0000
Message-ID: <927604a9-1dbd-4238-b19a-a25cfdba7662@epam.com>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <9589dd67-1c97-4e6f-abee-b727150081b3@suse.com>
In-Reply-To: <9589dd67-1c97-4e6f-abee-b727150081b3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|AS8PR03MB9582:EE_
x-ms-office365-filtering-correlation-id: 7fd1a59f-844d-437a-94e9-08dd49c0e09e
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MEZJR1pKM0FXWTljSUN6TkEraUlrTWRySUxNRGN6TEMvZzlDZE9hQTJRakhF?=
 =?utf-8?B?THdwbzB3c0FQNENuRVFLOWN4b042U3BuZlpiUkdoWXVwS21jdjRhb0psUitY?=
 =?utf-8?B?RTBqMi9mT2RkaVk3dmM5ei9pcHFzTldsTGxuenhjK2ZTTnd0WFIvUCtTQmdj?=
 =?utf-8?B?SGpkdlVLMzQ3eUdRc1U3dGJxNkZDZkJhUG9oY1hGa2pjelVhNittY3lCZm9x?=
 =?utf-8?B?UGdzdWVKRzJlM3BKL2RLaSt1bWh1NWo3WUpOUGpQc0F2NDJHcHIzM0dLTGJ5?=
 =?utf-8?B?SkdJc0hnVFZ5Y1JWUVNucmgrbUNXUm5xdFd3dGhyZ0FzRmRyNHVZUXBsejM4?=
 =?utf-8?B?bnJENk5UTFR0dXRvQnk4WDM4aFcvVUFxLy9iSGRjWnBBOEtNRnR4UFNROEw4?=
 =?utf-8?B?NEk4RHFGL3dicjloYS9pbnlXQkFObkp4TWJ1TEJia2poNHpSZ0xiTWJTaTJo?=
 =?utf-8?B?bk9tZ2llOHVyWE5UalV3dk5BMFd4VHdEcmQvMUpVdGNQbnZZUDlETDlhcTdH?=
 =?utf-8?B?SG04KzdEZkpSVG1wMXhUSnFKNUpTZkhnVzZiVDJRNjVRbGZrWWovcXZIN084?=
 =?utf-8?B?K285YXBOZjVVbU1ZWmF3dFY5KzF6cHI3Vlphd2dDV1JEbzZjOHgvZEVnS2hw?=
 =?utf-8?B?NC9UbjlOcEZtbTY2QVkxbGltWFEvTWxPWGRnUmtPM05NOGlQSVl0RG00VXF0?=
 =?utf-8?B?NE1tVjFpVkxkRjZ4bW0vc0I1U3RhdzI4UW5pRzJHUnkyQjQvV1NoM1JFdUZq?=
 =?utf-8?B?SUw2QzM1eDJGVFJTUkhwM2dnUUk0MEt0UGVNYk92cklrTG1xZnh3KzB2Y1lC?=
 =?utf-8?B?QmpYRmkyc2RMZjk0ZVROTlEvNVZDWGFDSTRkcE5uTmJSMUM2T201RDc4Rm4z?=
 =?utf-8?B?Szk2SmV2N1Myc0RQMytld2tjMFFhODBSTHJXeGxrYTdTaGFJeVpERU4vZ2dC?=
 =?utf-8?B?SUkxekhyUzBYWWxmSWY5NklzK1pjV3JjMVJ6dzhWQ2ZFc2d4c0dGTWVwRWEw?=
 =?utf-8?B?anJxVTVxemZYWERiY0grNG03OExHc1dGejc1VnNYNlFzd2txQW9TNU5pNzFM?=
 =?utf-8?B?SVdiVlFUT1NrdTVYSzB5WUlEbU82amxZR3B0MTV3Q3ZqNjJjellqV2plWXU1?=
 =?utf-8?B?M3NDK3BHVEE4OGdXS0VlL0Z5dEhDWCtUd0Z4cjVaS1AxMFdjR2JTRGVaNmVl?=
 =?utf-8?B?ZWFLVXBHSlNyZUtJTS9DNXRoWjIreUYrclFkaXJIT1JDUFJEMlYxUHF5RGo4?=
 =?utf-8?B?UWdDRmxvYTJ6cGdpbzIxdWkwSGRhak9GVXJwSUYvL1pnclJ5K3VnZS9qZDVw?=
 =?utf-8?B?d0xQNFJtRDZaTStRc3hxbXhqc05uQjR6QU9aQk41d0tJUTZ6cHk2cithYzZK?=
 =?utf-8?B?WmMvdjI3NDZKU01UYnNRMEpkOGJyWjEzWkJ1d1NtNi94amhEaDZTMW53WWVD?=
 =?utf-8?B?dHY4aTFVeXdkdTVlaU1WY0pGeG4xQmUwQjNHdjJMdnRBRng4TS9TY2NwS3lF?=
 =?utf-8?B?N1pUUjNKY0tLZEhqZUk5cVk2M1hBdmVpcjJZMTlDSCtMTWJVTjU0MG50cFZF?=
 =?utf-8?B?cXl4UW0zVFJMSnRTNWxpN0d2c2VoTWU3UXdTR0k0WU83UUU0cGlBMFJmVDhv?=
 =?utf-8?B?RzlaQ1laSU1qT1VWdkY1T0lsVVQ4bVRXZnpVdGcydTlRcTdTb0tQSlFzL3Zy?=
 =?utf-8?B?N1ArWDNYbUJqOSt3ZFJ0MzFzWENKcWpFNVRYQTlBYlVTY2dKUzJFUzlYTFRa?=
 =?utf-8?B?NDkwRHRKQ3B6QWRtTlJRclNDWUxHK3d3UEtxSGZzYURRTzRMZWFiQmk1Zkpl?=
 =?utf-8?B?MXhRbk5LdlRsamEvMndkSVVFQlFSaldKeEV3VGhFSENYZVVpcUZWS0krSFVJ?=
 =?utf-8?B?TmgrOTFpS2ZIOW8xS1cwRks3UW1WMHVhZld3ajVkQ1lGNEhsWm43SHlya3Er?=
 =?utf-8?Q?xPSA/omxipi3gVxaRScAuRyoFfRgKh3i?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3RjcEZPS3M3MS9BQjltV2V5VXkzV1lISTE4ZzFsRThzV0NXNmR4NmI1QWpR?=
 =?utf-8?B?UnlQN0xmTDBITkVQN2U5aG5uOHV4TGhVTVk4ajZlOVFQQmNISXc1ZWJzeE9O?=
 =?utf-8?B?TUordGdkdC9PV1A2bzhhSmlTQXV2YXNibFp5MUxzeTJNZ3pkRm95NlFaOTdZ?=
 =?utf-8?B?aG5yNUROR0xJQmwxZUdLc1pBSnkvWDVzTEpmcVMrbDgxLytobjJlRzFHZlVX?=
 =?utf-8?B?d3RwNVR0bVpEQmxtbFZjZGh6ZjVpVEVSVGRCV0xCbUI1V1NXOHdFc09GRzcr?=
 =?utf-8?B?OFpkdkI3WCtqRjY0Wm1mUUNUcDFOUktZc3EvN01GOHExR083UVZjUnlrNGVL?=
 =?utf-8?B?L1FqREN0V3RRR25oNFR1dHpwWFYxeW4xajBxeUJuemMzNWdOWHU5Wlp6WCsx?=
 =?utf-8?B?TG9oMkYzcUE1QWtPcFpWdDBseHowTWsxWG1GOHArU2RhZS9KRnNWbW1hTEFl?=
 =?utf-8?B?WFdBY3gxcHB3aTNlQjFHaVpSTDhGeHdRUFVXR1hhbW85dG10ajFZU2VZODQ3?=
 =?utf-8?B?Z2IrSzdpVUZYV21QOFJLWWRPUHZJNnRSanRER2NCam1wTkRsT3RkeUxMdmRC?=
 =?utf-8?B?SnlteGNhRy9NN0hIVTdUVCtoK1c2WE1ZUmlNdVE3L2R2OTZobm5WTHN1VVUv?=
 =?utf-8?B?dE5FbEVDa2pMMDFBUkJYc2VvU2NTZ0tBZzR4a2VWeW9XZU9oc3B4T2dJbUds?=
 =?utf-8?B?ZGNhNlNxTGpUSWNlNWNVSmdjRC9wVk5ZcHY0eEcyZE5nNk1SK1hGdUh0U3Mv?=
 =?utf-8?B?Y3Z4bldUQkR1NVBVRXV5OENNQzNkc1lmZE0vaDJLb21yVVhvOHd3K0FWaGo1?=
 =?utf-8?B?azUzcmkwdFVWcUwrdVhia2VzNGV0cWhyeG9jaFZXUVNPRWtYWXFzR0x3UWdO?=
 =?utf-8?B?cXlSR2lFb2llMXR6bjU2MGdhd0lSd3hnVjRlTmRUK3NBQVh0SXRxMlR2WE5y?=
 =?utf-8?B?bXhXVXRsYzM2bURmTmFpeEd5WndkVnpjT3VTczBxMkc0a1FMbWR1Tjh2dDNT?=
 =?utf-8?B?akNHeHFTdlBLdmZOYjM4clE1cDB5L1MyemFXQlhEa2h4MkJZKzhYVmVjUlg3?=
 =?utf-8?B?Uk8rYk9hc3Q3R0JJdlorVGxXd1QxTVU5MnYvS2IrK1hTK2dDTS80MWRVMURi?=
 =?utf-8?B?SkF6K1ZlU0lwMXU4NEZkOTAwWTJrand4YUpUYlpjUnZlSXZ0cmk2SEpONFl6?=
 =?utf-8?B?TkpJaDZkY3gyQ0JFQ3kxMmQ2SVBaQ28xMnlGdk9oQzZsZ3VnMWRkOU9HWmVt?=
 =?utf-8?B?UW1ER3ZrTldoZGVjdG9BS3N0eWhlcjhxUFVxa094bVFGVmd0WEY5UzlGenNB?=
 =?utf-8?B?cTBYa1czemF1bWc4WTNnenlFeFQwaEtyc0lYaXAwMVQ3ZHZ6TFV0Uy9rbith?=
 =?utf-8?B?WXZtK0lRaGtLNmQrU3NGbWJNcVFDQUxLZWp1Z1R1Yk55WHM4eW1NK05VQ0gx?=
 =?utf-8?B?WHBmUDB4eHg2eTk4VHhPNngwTHN5dXpMMnphaUczSFo0clRCNzJmYkQ1ZWhF?=
 =?utf-8?B?eDFUZjh1UmJZL3YxMnA4bDZ5K2pOMUY1TTNoUThZbU9RTTJuUm1RRjFxdFhv?=
 =?utf-8?B?SjFWelhiYkMyNVRJclBNaWMvb2Y2alpVWnNTOXVHN2xKV0ZhV3FHbEhwVGNS?=
 =?utf-8?B?Y0VFMDhUYThYUmRlRDFFczdSeVlhTmZ5clh3bHE5Q0hNWGNIYjNmTHJlTkRr?=
 =?utf-8?B?YURZYUk1L0NuaHdtZFpDbUk2SHJmQWlMSWpaL05TK2p1UldiL1NXbVlDN2R0?=
 =?utf-8?B?ODlMekxNT0hRbGJEZjFxYzIyaGx6Zi9Dd1pvcC91ZkNPSzBqeWVQdi9Da2pT?=
 =?utf-8?B?bDdNY1NxSEwvQXVxajJUc1B1RzA3Rmx5b2I0VGdvQUFEQkZWZnFpMDRCY2lI?=
 =?utf-8?B?Y0pHUXRtbmR0b2pzRUJwWlliT2JuaGFaL3J4OTJXemRoeXdXTTdSS1RVdVpD?=
 =?utf-8?B?ZzJsejU2K2RjVjB2M2QwQy9lc1M3MjZVNXYrUmtTVmMrV2hNOElCc0tnTmNI?=
 =?utf-8?B?RWZtZFJFOUtzNWJFYXNhd2h4dVNtMWduN01Kd1VkODd4N1dtK0xjejhiUVJ2?=
 =?utf-8?B?WE5maE9KcTV2bWdPeGs2anhoVmVJYzBBc05RdElkei9lQlpQMm9XQy9EK09J?=
 =?utf-8?B?VFY2a2g1QlMzUXNnV0M1V2dtSll1OHJtamFrMDRaYVBJVFhSVVlqOW96ZkZ2?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8883E399EEA1349B52AC86F10A5E48B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fd1a59f-844d-437a-94e9-08dd49c0e09e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 10:51:30.7163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P/5+F8mER/xGFyS9mkIDzqx+2cg/EPF/L2kUZk05npP7fJD3GXQQeaPH+X29xJrlNAHWdDHbEl8h5is1NbxYfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9582

T24gMTAuMDIuMjUgMTI6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMC4wMi4yMDI1IDEx
OjMwLCBNeWt5dGEgUG90dXJhaSB3cm90ZToNCj4+IFRoaXMgc2VyaWVzIGludHJvZHVjZXMgU01N
VSBoYW5kbGluZyBmb3IgUENJZSBwYXNzdGhyb3VnaCBvbiBBUk0uIFRoZXNlIHBhdGNoZXMNCj4+
IHNob3VsZCBiZSBhYmxlIHRvIGJlIHVwc3RyZWFtZWQgaW5kZXBlbmRlbnRseSBmcm9tIHRoZSB2
UENJIHNlcmllcyBbMV0uIFNlZSBbMl0NCj4+IGZvciBub3RlcyBhYm91dCB0ZXN0IGNhc2VzLg0K
Pj4NCj4+IHY3LXY4Og0KPj4gKiBubyBjaGFuZ2VzDQo+IA0KPiBBbmQgd2h5IGV4YWN0bHkgd2Fz
IHRoaXMgcG9zdGVkIHRoZW4gYXMgYSBuZXcgdmVyc2lvbj8NCj4gDQo+IEphbg0KDQpUaGF0IGlz
IHN1cHBvc2VkIHRvIG1lYW4gdGhlcmUgYXJlIG5vIGNoYW5nZXMgaW4gdGhlIHNlcmllcydzIHN0
cnVjdHVyZSwgDQpvbmx5IGluIHRoZSBpbmRpdmlkdWFsIHBhdGNoZXMuIFNvcnJ5IGZvciBwb3Nz
aWJsZSBjb25mdXNpb24sIEkgd2lsbCB0cnkgDQp0byB3cml0ZSBzb21ldGhpbmcgY2xlYXJlciBu
ZXh0IHRpbWUuDQoNCi0tIA0KTXlreXRh

