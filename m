Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A718ACAFEC6
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 13:28:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181590.1504614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwp5-0008BP-B9; Tue, 09 Dec 2025 12:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181590.1504614; Tue, 09 Dec 2025 12:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSwp5-00088m-8b; Tue, 09 Dec 2025 12:28:07 +0000
Received: by outflank-mailman (input) for mailman id 1181590;
 Tue, 09 Dec 2025 12:28:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2qC9=6P=epam.com=milan_djokic@srs-se1.protection.inumbo.net>)
 id 1vSwp4-00088g-66
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 12:28:06 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c201::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8285f048-d4fa-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 13:28:04 +0100 (CET)
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com (2603:10a6:20b:509::16)
 by AS8PR03MB6903.eurprd03.prod.outlook.com (2603:10a6:20b:299::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 12:28:03 +0000
Received: from AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb]) by AS8PR03MB8322.eurprd03.prod.outlook.com
 ([fe80::e577:995:fb9d:38fb%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 12:28:02 +0000
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
X-Inumbo-ID: 8285f048-d4fa-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3ylQcMb8COaLBozSicVvCkxPGT/uIO4YKQHXz/qncASiRBDjLy2nPhDYsDkYC8AIo3DWfFtEG0tgPwqqKAX9tg6ZFHzVQdGqEsocpeZiG1i96+Clp74tRk7iDx2mR2PRahbeWvu66CMywf0MamFFiCdxRCJTGPiAemrg2pFmTQHdUJOptASmF7a95s853jXhFqVbi1+TQ0qYLvp1AjlzrgANZeGLksg5LCeicfXe0Ik5RdRcULfzvZjwGpHGLYksQ0BodU2yQV6CNBo+MaPlMAT8e2uW9TlM++wWrQf2RTvGW/UF/G/MZ7mexjw5TovkMroVEgqFMkuljNL2QPHUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkGLKUMvPvAKukj0uAKKdbWWe8DJTWAmHjJexk0MGuM=;
 b=Bs2wTxpZfH1nZfEJ31Xn/8p52TwOMhM+YVEuLYGcNDp5uR5aT4sqnC2FpZ7CnWTmyZ/IXN6io2GH6Ao25OfuuqTmbl7Qe/Xk9c/1O2Se/Cb4/kMuyzAXybNESVpG+3fPYq2MY+GJ9B+3CUOw5nz+vPYiJNaSA/6FOcrPju594AQiQb1sAfyWsaoWlC87LMzERTQ6haEhvaCMmLursC5wo3J133MXMZtJs4Pc8o/6Ic4xc/M4KaObvydIjRmTaZiG1iehMf6Z00ZzJ02YFomwRwjeTBdcJtq5XoS33Zza0ZODXRs3H0lYzByPOMXGJAwWkPeOBU530jnPlWTPcR6dSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkGLKUMvPvAKukj0uAKKdbWWe8DJTWAmHjJexk0MGuM=;
 b=EwKVNEOrkdJo9WqvV4UqdfzFZnfGjUSKsx/FdeHlNALMU0fEvVx9kEb+2UpzInpW4kHzh7Otv4+u9odCJo+WWuDM4UxxD3NMUEsOs4BGLNEzHIBjvYihqFdRAbkrSPmgDL8qFJqWJQCDTlYtJORKxUtZsoFxLsP2cvB6Q2nZEM4MLg/Udf/uH6ZUyw0WEAJXqPp1GPw1P2JBSsRUhv9BTTars23AarscJ10IRyLGlCQCQSV9LC8DZ6g8dbWCUupaq32wb0l/viCZYXDEbcEDIr0mhiqhi3vB/u6bMbXTz0NwUrJgkdyUutNP4A7It/dtwNlW1W1cF9FGmw2DbaF84A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <53957207-6c55-4336-9b85-5c217859dbaf@epam.com>
Date: Tue, 9 Dec 2025 13:28:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Align handling of domctl/sysctl unsupported commands
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1764961645.git.milan_djokic@epam.com>
 <79b05298-1042-4cc7-b5bf-5c3698c4da9e@suse.com>
Content-Language: en-US
From: Milan Djokic <milan_djokic@epam.com>
In-Reply-To: <79b05298-1042-4cc7-b5bf-5c3698c4da9e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0202CA0022.eurprd02.prod.outlook.com
 (2603:10a6:803:14::35) To AS8PR03MB8322.eurprd03.prod.outlook.com
 (2603:10a6:20b:509::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB8322:EE_|AS8PR03MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: efde8545-981e-48c4-d2f6-08de371e6591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHZHV2J4MVZ2OE16Y1hZRmxoNUo4ckE0OFJUbWM5YkJvTDhRL3dsazNXeUxS?=
 =?utf-8?B?YWtzMXdKdTJ4bnpCU3pJOXNEUk9vb0lqY3IxUlJrdWR6UlVYZkE4Y1ZDUGtZ?=
 =?utf-8?B?M3dnYS9hYThnV0pGRGxsUEpFOW5USFBqcm1saHRyTEdzYVFPSDZCUGp4ckF5?=
 =?utf-8?B?M2ZhS2JZdlZwWWZKbGN4ZXhCeG5oNUVkcnpxcUZYVFBBc1hweHl1ZEJtQlEw?=
 =?utf-8?B?clp3SXNIcFRLK3NReHk5WSt6N1huN2pqN1l5VnpwSkU3MU1yZkp3ZXNRSURM?=
 =?utf-8?B?bGVQcHRwdnREWFlMZFgxVWpBRUNKNmdjT0lLRkptT3ZlbW1IakVnckJKSzN1?=
 =?utf-8?B?L0xXUmVDUVlxUlQwMHlzU0N3VmdpenVFeW11WW1WelpWbS9DSWltOWFrSlBK?=
 =?utf-8?B?aithZFYwamh4VGZrUUhHdjZHUDI1QW1keE1XNEVaTlJodDBmdWpNUGZnK1d2?=
 =?utf-8?B?L09oUFowMWgvV20xbTJuT1BmTjJwTmlJalZqOWZyWXFKYUNBbHgzUHFpZmZZ?=
 =?utf-8?B?cVpXWGd3NldHSENTNXVvbit4WGxLQWpyUjZMVUZNOTVNNjZCNm5Nc2hzVGxz?=
 =?utf-8?B?WlQzZ2REdEZub0d3VjFoVElIVHdROG9GSVpXcXdhS0lra2ZmQUFXVHNJWjhT?=
 =?utf-8?B?OEFlTElJbVlndGtNaEZuTnRra1lXOUFKOUE5TitNRXoray9ITk1lbld6Y2Fp?=
 =?utf-8?B?eFlwZy8yYVBhS3JnaVNPZnoxUUxYbUVSa3FLa1lad1JHeXlXRUYyZzVBbzk2?=
 =?utf-8?B?YTJKWlNTeElGd3hQSXk4b25vNDhic05jMk84UHhGY3BpeExDaGRSaUg1REZO?=
 =?utf-8?B?RC9kS3J0WlNjZmNwcmsreER6cE8yRE1iZUV3V2lGN2JSN3pEdk1FZ09zV1dV?=
 =?utf-8?B?OW45eXJ4ZHVRVStmSWE0Ykl1a1FjNGxsanFNOEhqb3BuNUxaekhIUWxqVVlH?=
 =?utf-8?B?YWxqeDNDRFBrQmJ1V0pjVU81UmNkWVFVNWs4bXhFTWhqam5lSlRmQkdVd2Nt?=
 =?utf-8?B?UUxGbFh5MDc4L3Q1RitXZis5UHpiQ091cjlwd3phSkdpZG9ZMDZwV2d4N1B0?=
 =?utf-8?B?Q3hQS3Z6dTR0U09ROXl0MmNUSy80U1owNnJmNklIOUFnbVpnSlRIMWVPSkpC?=
 =?utf-8?B?clIrOFVMZVRsR3Z6bFhWR0hzNDdQWkFBb2NLRUJ4Ykh3MnZJUllxMFJHdFdJ?=
 =?utf-8?B?WU5wRkk5ZTB1SHZDYVhWNUN6R29jL1JtRXU2YU94LzhVRnpTSHRIM1IrMitu?=
 =?utf-8?B?WHNtZlp0YmdWbVhyNGtNZzloekVOUmJXODA4ZlFROGlvdGhIc2MxNm9XVW04?=
 =?utf-8?B?Zm9NbkNvM1ZOZWpNY0JibTZoNFBaREdEUGJ2U2g5aVRpS1JhZWtzSjFxVldY?=
 =?utf-8?B?a2drZ0pRN2RRVFEvZ3VaKzZyS1Y1bHFvaFpOaFJ1WUxLY1RwM0ZPd1poV0Z0?=
 =?utf-8?B?Um1LWkgyNU95OWlVdk11TG5vVDhGakk4Y2dlZlIrQmcvT1VEeHFIK3lkazhS?=
 =?utf-8?B?cXFGQmdCa3liQzF4TlZDbEpEdGNPU2VJbEI2VitPUXJvZHVOeGhsNlVBQ2Nh?=
 =?utf-8?B?L052cTlNOHMvdUFqS0NzME45L2toNUt1QldtTVBXVTllTVREeE51Z2Q0b3Yw?=
 =?utf-8?B?U2R1NmFaRi9xRWU4RkNyb0Zkd3NJVG4zMXpxVDB4RVNOYk51Q3pKOEJweXc1?=
 =?utf-8?B?Z3hHNEd3U211RmRUcC8zNmdjMEdTNTRnNGpTZGdXTzUybjV1cU1GUWxpSDhj?=
 =?utf-8?B?QkluT21BcFhDSkF5bGR5TVhaRVBJRGxwaXo5WHlsdHE2MWdTRkthZ1NqZmx4?=
 =?utf-8?B?VTV2QzVpRUJDUGpNR3JoZ0V6ekwwSzVNdlRtbDlCdlE3WXRkYkpTeVFWSEpq?=
 =?utf-8?B?YjRNQTVVZ2I0dWxVUy9qeXRycVROSFVCNTcyV2h4TkZDeEw5ZHFXZ3d3YUlt?=
 =?utf-8?Q?nrfxzYdjdmzLXcjDbkwWgNHSi3xKNora?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB8322.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2lSWDZ5NWczOExOQ1pHNXhMSUJtb2FJT25LdkFZYUczVWJrTnE0aHhpY3lq?=
 =?utf-8?B?OEhVRW5OM0VhQ0lyNlhiclkxbFRXQUx3Q0d3Q1NFZG02NTJLSUJoVEVTM043?=
 =?utf-8?B?bjVwTEo4SXBpM3AxOUoxUkJMREZpaENEVUEwbHF1bk1CWHM0VTdwcHFyWFBs?=
 =?utf-8?B?VWZxT1V3YmVXMEpsNXIxVUZlcUtrQ0ZBZHVJL1dSaVA5c0tPVFV5eVV6TzVi?=
 =?utf-8?B?K2dDL0ZKazE5ZHFjSldKYzJ2czdOWUhuTC9iay9vZ1puaTdvWC9ZV3JRV2s1?=
 =?utf-8?B?UUJqNDBaUVo2R0orNlhTZkxlNnRVTzBmVUZKZnhEWkJQamtYL3IrMDMwdGhq?=
 =?utf-8?B?MVFMaysvaG1ZaWd5WFJ2UUIxdk1BNGVCVndiL0xUb3ZCUUdJdm14eDBaVEY4?=
 =?utf-8?B?R3I0SGtFMEd0bHI3OGcyMnBjTWxmRVpmT0Zxamk5eFMzaVhEVFlJK1pFWnBT?=
 =?utf-8?B?QjkreHR0NDJxRWp3c1BXdzViMGZVa3B3cXF4OVlBQ0V5dWR0aTltYW03SFVh?=
 =?utf-8?B?R0p2bHhDQ1JkYSsrelFHS0dTTWlROXVocE52YXl6Yjl3bnRaUkNxdmZOOGYv?=
 =?utf-8?B?eW1hNWFDWXRLR3Zxd2tCdC9sQmtncVZnQTVkQlVCYVllWS9BR2NrUHdkR0tn?=
 =?utf-8?B?Z2RBa0hSbW1wWjdaMnh5Y1Z4UndTRzRZbnp4WHAvQzAxUUpNM1Blb01SREZ6?=
 =?utf-8?B?ek5PSHZWTllqK05hZGNZK256V2RyeXhHR0dKNndSTWRnNENYczdQQnEzN2dj?=
 =?utf-8?B?eTVVbDIxVGIzdkE4NmhXdTZIRVRudUZDVXE3QXBmRWlsN09PbVJleURZRHgr?=
 =?utf-8?B?aU5WYXluci9TcGtqTGFVWGRvK2JiSkdIdCtrazZEL3RVZGdFRFpFK0VFaVdn?=
 =?utf-8?B?Nm1LNllVa3F0OCtZU2JXbUZZa1kwUCtydXIvSlZoVmpOeldTRjdCdXBtOFNy?=
 =?utf-8?B?Y05OVkVLS3JsWHlLNlFuM2lDV3RXNi9nckF0ajVvcExXblp6L0tEUDM4ZHRj?=
 =?utf-8?B?aDRmMEFvS2ZqS1lXUDVSTzZDUXF5SFhFNXFkb1RKazkrclRoQW5aQVVsZ0tE?=
 =?utf-8?B?Ymd3NWo2cFk1R2R1R0pJL2hJSTNrVVdQcmhIeHBuUkxaK3JNRHpGZ1N1WmRz?=
 =?utf-8?B?UXdvRFVacFVzNHgvc3JGUUJhU2VkWm85cW5LdE50SEhXd2ZVYWdwR0pkbEN0?=
 =?utf-8?B?M3llaDRwZExuVk1WWEV6VVlpN05HTFh0THNkaExVMmViaDNFdFZ1bW9FSGc3?=
 =?utf-8?B?N3p4cFFKai82NmpPWXpRbVhBYm1yYXZXTXRYZXdJV2w2QjJBc3dycUtHRUxY?=
 =?utf-8?B?MEI3dzA2WWFWakNDbExqcVh5THRRWXdPNENSU08zNUpHakg0STJjZlR0UVJ0?=
 =?utf-8?B?K3NYUXdXQk5kYk0xWmE5TXFQL0s0TlAwNGowMHhPZEtFODR5TGM3SGlYZjBD?=
 =?utf-8?B?Ti9rY083dmlTMHhwanB4ckdCb082MFBxT2EycjRsNUlNVXJsbU92L3hYMHJp?=
 =?utf-8?B?MnZIU3dYdG9Ucnl2WUYyaHBWWGQvNHVFWktjNHJCaFRBNnlTSjRoM1RmWU5M?=
 =?utf-8?B?N3JBSDNMSlEwWXozSmFKdXNSMWM4OERXNmdlNUFJenZRblJ5ZStDWUtoOTlY?=
 =?utf-8?B?VGpYQkYrWk5BWXE2VEl3cWFJRmhTN1hIMmg0UlJkd0ZVa1NLMHk4b3h3eU9q?=
 =?utf-8?B?ZUxHeUQ2S0JDUDRHeUVuamhuVG5ZbTV3NXRaUERsazFId1RhZjZXeEFRNm9q?=
 =?utf-8?B?SzRuK1VGMWFGazM5UlZTMlNVdHpwbWZlU3R0dFBmLythZXNsOG9lV0hUTytU?=
 =?utf-8?B?VG51MFlRRzRXT2hUM2NYTFRCaWxhU1Y4eTlOQW5Sc2w0elBvdjFiZTcramtn?=
 =?utf-8?B?KzZwTDNISlJlY2N4blFLWWtxempsMXRaaUxTK2ZVYnVYczdDeDZ5M0ZaRkJR?=
 =?utf-8?B?QVowWnRWL2xmaHNZc0xEY1cybDRiZmxYMXY0ampPQ2U2RVA5UVFyaUk2UXdS?=
 =?utf-8?B?MmprbDlNcDM3UCtQaWVFbTh0RDJmWlg5M1dWY1NZTjlBdmgzM1RqZmV0dEhz?=
 =?utf-8?B?WFB4WkJiMTVvWEo0ZEwrcWUzU25YbWxkYTdmT1drVzYzOVorM3dLUnpyd0hQ?=
 =?utf-8?Q?MdpeAHHGaf9gSenBIFPrhbi1e?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efde8545-981e-48c4-d2f6-08de371e6591
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB8322.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 12:28:02.8275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2DeXNaJmqaQ8zammuo/H2r7FZ3xkbmr+5afXkbzThQmb/1Q5/NMisHez8YkgR+t2D1gs0nEEn5629VSC6cmJjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6903

Hello Jan,

On 12/8/25 14:35, Jan Beulich wrote:
> On 05.12.2025 21:36, Milan Djokic wrote:
>> This patch series provides minor updates to the domctl and sysctl handling
>> of unsupported commands. Currently the behavior diverges: some commands
>> return -EOPNOTSUPP, while others fall back to the generic -ENOSYS.
>> This series aligns the behavior so that unsupported commands consistently
>> return the appropriate error code, allowing the control domain to correctly
>> identify unsupported operations.
> 
> What, even after having looked at all the patches (and their descriptions),
> still isn't clear to me is why the distinction ENOSYS vs EOPNOTSUPP would
> matter. Tool stacks still need to be prepared to get back ENOSYS, at the
> very least as long as they mean to run on older hypervisors as well. And
> with Penny's work to allow excluding domctl/sysctl altogether, I expect
> ENOSYS would then also be what results if that option is made use of.
> 

I think that ENOSYS and EOPNOTSUPP are both handled properly by the 
toolstack. This change is more related to control domains without 
standard tool stack (e.g. zephyr or xtf domain). Especially for xtf 
tests, we expect that consistent error code is provided for unsupported 
hypercall commands. Right now this is not the case.
Still, this is not a ‘must’, but in my view it would be better if we had 
the handling aligned between different hypercalls and commands.

BR,
Milan


