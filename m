Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D3AAD87EA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 11:31:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1014137.1392388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ0kp-0004kx-7S; Fri, 13 Jun 2025 09:31:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1014137.1392388; Fri, 13 Jun 2025 09:31:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uQ0kp-0004ie-4a; Fri, 13 Jun 2025 09:31:19 +0000
Received: by outflank-mailman (input) for mailman id 1014137;
 Fri, 13 Jun 2025 09:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OW95=Y4=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uQ0kn-0004iY-Ne
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 09:31:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20610.outbound.protection.outlook.com
 [2a01:111:f403:2412::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f05a4ea-4839-11f0-a309-13f23c93f187;
 Fri, 13 Jun 2025 11:31:03 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA5PPFF1E6547B5.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8ea) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 13 Jun
 2025 09:30:59 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 09:30:59 +0000
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
X-Inumbo-ID: 1f05a4ea-4839-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kpIJYvyZPtrzjXMm2NN3dexg3uOK/2IvLWlecnbB43JCxRUSOtJCnLO9IBLr8y+doXNnJ8egKpl8R0kbbVNHhnCOYBSfjv5NwtHvgFRfqdKJdorv1hIl9npEGwxG95MDXuti0VDeMTvjUabO+Xgg1FEB2olAniQ1jxOW0gpyiE0MiBsAbFZEMvrqTG8lylr88I/JwAgGijkUvcfXXBac0bbAGUn35fhvneDGdiDGk7jvltmmqugRN81l36L67ymOzsXPDdqcvNaYEWCf9EaTdCJirR/sD+KO9yatL5K+xEUWMfXUNiHTBtfyIrXWWTqIQ0Lu8xiPv6T0pjaEDsQWTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZtqAEVsvgRRaAz4hZWMTFnxpJL5xeOQ3MWQ1jIMCF4=;
 b=OFXnu8olBV9QJ8KZlRWql/boHQY1npQ9IpOyUvkOrVFe+3SyYEGwXeFptl/zVmNNI8OU0xCNw7fE+UcO0r3Xnn9T3rCn6OxgyUHU/gCsCZuerVBrRX9uRQvt2dd1bdFj3ggCIn5NNC08irty/KQsLXcLsPTyS2Ssk8OvfazWmEDOeUtGbyA8IuiedHJnMGFY/A3CW754UNht2HRMgmvOnPqUZUXaBMB+TyhnVJnGPu72ncDKjingZwx1+bsL3LY6Fcr46keCFz/cxGqKbvb7UNwBTuXHlVGdWxetlrsWlrj2xFNJ5d5BNHIoPZPzGjbtXXrDfwLdwIOyAx6vb9HeDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZtqAEVsvgRRaAz4hZWMTFnxpJL5xeOQ3MWQ1jIMCF4=;
 b=0UaVUKaQ71tO3TrEuKYAZlofeidTgd0rMIbk3P2USoOTtkK50ekrwj+TpwCBuo/527y5vqcmcmqtb5NBoy9hswzhplU4ToL5TkNm0IuUixb63+UzEHp7mtgJ6kJZHUCVLBErFU6gIF9kCKuFPVTHFd/eTF0jxSrXO6CADp07Bcg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <41eef9a1-1f43-4f2f-b79a-89c0d0ec941b@amd.com>
Date: Fri, 13 Jun 2025 10:30:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm/mpu: Enable read/write to protection regions
 for arm32
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
 <20250611143544.3453532-7-ayan.kumar.halder@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20250611143544.3453532-7-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA2P292CA0020.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250::10)
 To PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA5PPFF1E6547B5:EE_
X-MS-Office365-Filtering-Correlation-Id: b91384bd-bc7f-4fac-6d39-08ddaa5d013d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0FzZkYyUjZldUpVVno5bU9tWmZJcmtYTEFhaDZBaHFZMVY2NWYxYUxKWGRP?=
 =?utf-8?B?Q2xTNTEvQ1ZqZjhQazRNcUtKNXB3dFFFSTF5YmVScmVGOFdaemtJb2g3bG51?=
 =?utf-8?B?cVpCVmVBalYwQjZ4R0pDMU9iY2oyaU94UFg2L2czTGxIcTJGeGNLK1l6azl6?=
 =?utf-8?B?MlM3NGhKazV5K21pTFRHQnVtejcwaFRhU3RTM3RSL004V3JtNHJ2c2FuVHM4?=
 =?utf-8?B?bmFuRElYeGgzVThvSzVIR1lSdzFqM0tQeUN2S1JVQVo4QnBYbzV0cVgvUXNB?=
 =?utf-8?B?TUlFelhoemcrZnh4b0xDcHFWNllRWWVCZnQrcGhTVjlqNjJ0SEFqcW5kVlgw?=
 =?utf-8?B?cTE3ZlJFbUJKWlpkaFFZcDcxU1h2bkZGdzJhSzZmYnFSa0VSN0JFZm9IWlZJ?=
 =?utf-8?B?cThTMkhjV1NxK2ZoZXQxaXlBRU1KMjd0dzJaQVpUa1o2L1FEWDZkQkh2Wi9z?=
 =?utf-8?B?QTJmbFJzSWVCV3Rab1BjdWZQVG5yVEJrMk56UXNSMERkeGxWUVBHZkFaQnE0?=
 =?utf-8?B?WjJpS0U5SS9xSUFtZkhWN3dSbjhJUlpFMEtiR3M2UlVCU3M4MzhFaFpMVkRG?=
 =?utf-8?B?NFFzSUxDb0tPUllZNlkxRjlWWjU5VUNnbTIxQkR0RTJtRHF6TC9SbjdiRnJI?=
 =?utf-8?B?K2xCWC9nQ1hYRXNrQnZOZTc2c1R5dU5KR0lPUWE3MnZ2UmVKbmlKbDZKNGxF?=
 =?utf-8?B?UitGZHB5SERIODF1bWRGZjEwSWJCUm8weE5WcUY4RlVkVXZSSmVIVXJ4bWYx?=
 =?utf-8?B?cUZjTHcwdG91Y0s0VGhCZ3dFNjVjem1ibTUrOWpGUC9wckRZcW1VV2J2UGZF?=
 =?utf-8?B?bk9yMm5aSGtKRnlvblRjWm4vMXlwcm11OUwzcks1U2Ftb0pQQXptKzBBOFFQ?=
 =?utf-8?B?N3BOVUJZS05ya0syNFZyaVFZTE0wN096NjhIejl5M09wb1ZWSVdpOG83MVBv?=
 =?utf-8?B?VWJTdDNsMEk5Zm1qdENrOUdQc3E1VVp5V1REQ3M1L1p2eFdIWUpRN2hmaGt4?=
 =?utf-8?B?eHNiUXBVVWlGWmVFRzZOU0ZpVyt3V3d2bjR1Um9tZEs4UFdFWHdTbWpmblRO?=
 =?utf-8?B?T1UrcWh0TUZWYjhWTXRWU0xSU1BJcWpuVXNBb1pBUUhmSVprakV0OThyMXBN?=
 =?utf-8?B?bGxlN2o4eE54TXd0anp6WXZYb1o0OHFTd1hoRlVTbDBQMFJTL1FkSzNad05l?=
 =?utf-8?B?azNYWmozMGhQaSswY1Q2dFBIamlKTmYzTSttK0ZleHdJdVF6TGhlTDN5cmZJ?=
 =?utf-8?B?c0JPYzFoN1BBR29tenZYNnVPYXhiaDMwWE1VZ3F6T09nRFpHM0JrWHplWEtp?=
 =?utf-8?B?WmpGOXBoYWIxTERvYkNBVTJhd1dXc3Znb3JUbkpRQmdkbEtFNmVlbjMzdU9Q?=
 =?utf-8?B?aVVuSXdCczhXMmp6U1Z1MkUzem8rZVk4YWZhWmNocFlnOWpGNjZqanh1eWVN?=
 =?utf-8?B?WWg0Rzd6T2RZbnFOSjRJNHhXK2IrRno5STYrZGhvRVVIVjNvc0NQUW4xeGts?=
 =?utf-8?B?YStzNFJGaHFscXJUcG1PM2NWSWdOV2U1ajJmNDhKejNYK1NQazVmOVk0RS8r?=
 =?utf-8?B?MUtsRG1QSTlXYlEweXpibVdkWVBYci9kaTBxeVUvSUJUbDllNXJPTmgzK09x?=
 =?utf-8?B?WXB4VlpDOXZxU2tHSmtUOTVqZ25BZEF1KytkcGZ5M21Ia08rL2tTaVZUc0lD?=
 =?utf-8?B?OTQ4V1V0eDlXcUE1WlZEbkp0c0ZucjJVejBMWkU0eWpmc0FpK0lWTTY5MzhV?=
 =?utf-8?B?QWFxbHNGckVXVUM2cnZES2FKMzJXdXRMbVNXMG5HVmFLVFNBbUVqenBYVWQ0?=
 =?utf-8?B?YnhaK3lsWkZHUXVtdnB1SWRuY2VFamM2L2VNYWZHdkRTdjViZ2dVMTNQSnRO?=
 =?utf-8?B?dWljWGFoRGp5WnFIVGJvZkJGeUVRUW9STDErbU1wZzB1Sml2R3VNaWp1dk9H?=
 =?utf-8?Q?g0u7pbP9sMg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0VUU2p4OVRvelFocWJabXYxVG0rRXNkYkRvRjg4alI3K3hNbUZVNDVuaGZQ?=
 =?utf-8?B?aEZ4dnNxc3ZKczFSOHZUbXJxdXorMWdjZU9NVm5mRDZEbS9XdTVDaXJPS1hp?=
 =?utf-8?B?cW82Vm5VbFJMR2JoTUpnVDhtVnV1aHFQTHVZMUUxN0wzNnhmRWhxMVIvcnVU?=
 =?utf-8?B?Q2hNZXVDSE1zK01WcEltQThKOVRoRTFJQllidmF6Wm85WjlIREh0VEdUck42?=
 =?utf-8?B?cERxaXdVcnZydUJoVE4vQUxMUFZCbFNIM25UTkxpcmp3VDJoNldzS1dsYXE4?=
 =?utf-8?B?cFhmVUUrQ3ExZUdwTnY0REJ6aDJXOS9TaFlKZ1lreTU3UkE2OTMzb2gyRGlU?=
 =?utf-8?B?dDZWWWczMUtJY1hSZzF1a25xZWFSSE1NNjBydmpLZ3UvNlZJS1Z1THNnVHZp?=
 =?utf-8?B?eWlMV2lJZFp3U3R2VmpLYnlFZFRxdzcxMHhES3BQaHNtcnVqWFV4SDgvSUxU?=
 =?utf-8?B?MWxrb1pyMWVHUk1xZkRxc3hOaDVoQlpEMS9IN285UzhycWV6Vkg2d2xRb3NU?=
 =?utf-8?B?UGtvNW44Y2lxOStZVnNmWjQ0K2RXRHg4T0FnVG53VG1nejBmblowYlo4MFpY?=
 =?utf-8?B?Z3pmajdRMi82VlZXWkxwN05CZm5YZ0dUTmtvcFhvenErbWN3VTFTNXNmSFlE?=
 =?utf-8?B?clhyTnVIRzdNdXllRStYdlRkQ2puSURwSTdlcmJKNWNYTjMydzl3MnlxRUdW?=
 =?utf-8?B?M3E3U0hkTmczdE1rWWZMTFNFc2lEcG11M2t3eW94bmlTalRmalNqMXA2amdL?=
 =?utf-8?B?MkdVM1hSWVN2SHRLemZadFRtV0FmRGliR3ozT3N2MUtzaHpmRUMxVHZCYTE3?=
 =?utf-8?B?Mkc2U3Z3cnIxSUR2VXVPcDhnQU5GTnFnQ0I1bWpYTjFPSW1IRm4wN0xBdlQ3?=
 =?utf-8?B?NG1ZQm9nYm1XUUhuK0N0MlVYeDA5VktmTW1ybU1jMWc0MmF0KzNmT1MrTHR2?=
 =?utf-8?B?T2ZUTnF0RG56WjlUdDFQdDRXZ1ZmSGRyN1dHUm5IdmNIVGNPUHRQck56V1Jp?=
 =?utf-8?B?SXlQZ3Q0NGk5UVZyMmh1Qkk3VUNZaEp1Uk8zR1VrelY0WkVPS2RsbERqaWlF?=
 =?utf-8?B?ZzJtZVVhakVId2VBbTdRSEpiSGRRbG5pQnhRYzlyT3Y0R1piY1BLM2dTS2FD?=
 =?utf-8?B?SzhjcGMrS0VKVzMxZVJLVU83Z21GRzRhTVZTZHhqMlBTblM3T05DWEhpeUZO?=
 =?utf-8?B?VDNnZXVQc080WHJkQllTemx4a3U5NjV4VnFCQTMwZEFmcGVONktKa1FjMUhw?=
 =?utf-8?B?by9WVkxIME1wcFM0MnJGdlpHb1BJcytEcDRnU3lhL3FNdUJVWTBYc0JzcEFm?=
 =?utf-8?B?SUlhVnFqZHpqK2d0ZFdRUVpKTlBudTVORlNHMG1HTzZBRk5QNzdFUHJRNWs1?=
 =?utf-8?B?ZkxKbWJzN0RhWGNmRWNzTmJiYkcyU0JuVXUwR0lXTXJFemlnR0hKcVRFS2VZ?=
 =?utf-8?B?WkEvbzdXQTBlMlpkM1ppZ0JROTZKVXF0ZlRWbVNmTEFsU2gwYjdEUFQvQXRj?=
 =?utf-8?B?Y1RhZHJQcGlSdks2RE4zNE5PUlpKaUM3Q2p4bUp2SFB4UkhLbURqMkdPVWRx?=
 =?utf-8?B?ZVpLMTJCYm8xa2l3ckdjTDE5eEIzdnNrakNRdFZERjB6eVFLVC9CVys5RkFS?=
 =?utf-8?B?aCswZ2RnczNwVFArZHZGcytHaXY5UUNqa1ZvUGhxVUNHUWdzdTZvdDNhbjRG?=
 =?utf-8?B?TGFRbFk0K2FDanBKRW56UXhFMDl1VmpSa2dZelBRNDdLT3pINTk2YUE0Mm1W?=
 =?utf-8?B?eFlwajA2WE1nMHArWkZTelhtaTI3WEZiekNRNXZvNDgyeGZOOWJ6NHovajRZ?=
 =?utf-8?B?b2p2Ty9KNG44dHFlaHdTcERubWdKTFZZdm9LOUg0QnIrRks4emV6elZwdVcz?=
 =?utf-8?B?THViK0hYMW1vdVhIOFZlVkYxT2l4YXZKcno1TzE1UjY2MkRjWkxUcWlidTM5?=
 =?utf-8?B?TEJUdlZ3ZGF0dzFPWlhqVTQ3N0tqZGtMMmRrclluNDFWbHZOMTV6QTBhL1pK?=
 =?utf-8?B?dmVOamJBaENvb09Kbk9Gbm95aDZBR2pqRVFlRmNyWFVoV2RIdWJqY0w5Y1Rz?=
 =?utf-8?B?YWxTcXVYZGpZUmVMam5nS25pQ3VhbmxybjhxQ1FQUDJDWXZBUGpiWWh1SUFw?=
 =?utf-8?Q?0foGmmjTnuNH1TI7TvB1DeVSB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91384bd-bc7f-4fac-6d39-08ddaa5d013d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 09:30:58.9203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHFW8xrbz54SED+8wDgrA+Pg5AtOe1f/uBFVsCwX8gjhS2xoplGKtaY7e5LZSxS1qMLRfG4pNhUsRRYScUgOkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF1E6547B5


On 11/06/2025 15:35, Ayan Kumar Halder wrote:
> Define prepare_selector(), read_protection_region() and
> write_protection_region() for arm32. Also, define
> GENERATE_{READ/WRITE}_PR_REG_OTHERS to access MPU regions from 32 to 255.
>
> Enable pr_{get/set}_{base/limit}(), region_is_valid() for arm32.
> Enable pr_of_addr() for arm32.
>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
>
> v1 - 1. Enable write_protection_region() for aarch32.
>
> v2 - 1. Enable access to protection regions from 0 - 255.
>
>   xen/arch/arm/include/asm/mpu.h  |   2 -
>   xen/arch/arm/mpu/arm32/Makefile |   1 +
>   xen/arch/arm/mpu/arm32/mm.c     | 165 ++++++++++++++++++++++++++++++++
>   xen/arch/arm/mpu/mm.c           |   2 -
>   4 files changed, 166 insertions(+), 4 deletions(-)
>   create mode 100644 xen/arch/arm/mpu/arm32/mm.c
>
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index 8f06ddac0f..63560c613b 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -25,7 +25,6 @@
>   
>   #ifndef __ASSEMBLY__
>   
> -#ifdef CONFIG_ARM_64
>   /*
>    * Set base address of MPU protection region.
>    *
> @@ -85,7 +84,6 @@ static inline bool region_is_valid(const pr_t *pr)
>   {
>       return pr->prlar.reg.en;
>   }
> -#endif /* CONFIG_ARM_64 */
>   
>   #endif /* __ASSEMBLY__ */
>   
> diff --git a/xen/arch/arm/mpu/arm32/Makefile b/xen/arch/arm/mpu/arm32/Makefile
> index e15ce2f7be..3da872322e 100644
> --- a/xen/arch/arm/mpu/arm32/Makefile
> +++ b/xen/arch/arm/mpu/arm32/Makefile
> @@ -1 +1,2 @@
>   obj-y += domain-page.o
> +obj-y += mm.o
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
> +#define GENERATE_WRITE_PR_REG_CASE(num, pr)                                 \
> +    case num:                                                               \
> +    {                                                                       \
> +        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, PRBAR_EL2_(num));   \
> +        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, PRLAR_EL2_(num));   \
> +        break;                                                              \
> +    }
> +
> +#define GENERATE_WRITE_PR_REG_OTHERS(num, pr)                               \
> +    case num:                                                               \
> +    {                                                                       \
> +        WRITE_SYSREG(pr->prbar.bits & ~MPU_REGION_RES0, HPRBAR);            \
> +        WRITE_SYSREG(pr->prlar.bits & ~MPU_REGION_RES0, HPRLAR);            \
> +        break;                                                              \
> +    }
> +
> +#define GENERATE_READ_PR_REG_CASE(num, pr)                                  \
> +    case num:                                                               \
> +    {                                                                       \
> +        pr->prbar.bits = READ_SYSREG(PRBAR_EL2_(num));                      \
> +        pr->prlar.bits = READ_SYSREG(PRLAR_EL2_(num));                      \
> +        break;                                                              \
> +    }
> +
> +#define GENERATE_READ_PR_REG_OTHERS(num, pr)                                \
> +    case num:                                                               \
> +    {                                                                       \
> +        pr->prbar.bits = READ_SYSREG(HPRBAR);                               \
> +        pr->prlar.bits = READ_SYSREG(HPRLAR);                               \
> +        break;                                                              \
> +    }
> +
> +/*
> + * Armv8-R supports direct access and indirect access to the MPU regions through
> + * registers:
> + *  - indirect access involves changing the MPU region selector, issuing an isb
> + *    barrier and accessing the selected region through specific registers
> + *  - direct access involves accessing specific registers that point to
> + *    specific MPU regions, without changing the selector, avoiding the use of
> + *    a barrier.
> + * For Arm32 the PR{B,L}AR<n>_ELx (for n=0..31) are used for direct access to the
> + * first 32 MPU regions.
> + * For MPU region numbered 32..255, one need to set the region number in PRSELR_ELx,
> + * followed by configuring PR{B,L}AR_ELx.
> + */
> +inline void prepare_selector(uint8_t *sel)
> +{
> +    uint8_t cur_sel = *sel;
> +
> +    if ( cur_sel > 0x1FU )
> +    {
> +        WRITE_SYSREG(cur_sel, PRSELR_EL2);
> +        isb();
> +    }
> +}
> +
> +void read_protection_region(pr_t *pr_read, uint8_t sel)
> +{
> +    prepare_selector(&sel);
> +
> +    switch ( sel )
> +    {
> +        GENERATE_READ_PR_REG_CASE(0, pr_read);
> +        GENERATE_READ_PR_REG_CASE(1, pr_read);
> +        GENERATE_READ_PR_REG_CASE(2, pr_read);
> +        GENERATE_READ_PR_REG_CASE(3, pr_read);
> +        GENERATE_READ_PR_REG_CASE(4, pr_read);
> +        GENERATE_READ_PR_REG_CASE(5, pr_read);
> +        GENERATE_READ_PR_REG_CASE(6, pr_read);
> +        GENERATE_READ_PR_REG_CASE(7, pr_read);
> +        GENERATE_READ_PR_REG_CASE(8, pr_read);
> +        GENERATE_READ_PR_REG_CASE(9, pr_read);
> +        GENERATE_READ_PR_REG_CASE(10, pr_read);
> +        GENERATE_READ_PR_REG_CASE(11, pr_read);
> +        GENERATE_READ_PR_REG_CASE(12, pr_read);
> +        GENERATE_READ_PR_REG_CASE(13, pr_read);
> +        GENERATE_READ_PR_REG_CASE(14, pr_read);
> +        GENERATE_READ_PR_REG_CASE(15, pr_read);
> +        GENERATE_READ_PR_REG_CASE(16, pr_read);
> +        GENERATE_READ_PR_REG_CASE(17, pr_read);
> +        GENERATE_READ_PR_REG_CASE(18, pr_read);
> +        GENERATE_READ_PR_REG_CASE(19, pr_read);
> +        GENERATE_READ_PR_REG_CASE(20, pr_read);
> +        GENERATE_READ_PR_REG_CASE(21, pr_read);
> +        GENERATE_READ_PR_REG_CASE(22, pr_read);
> +        GENERATE_READ_PR_REG_CASE(23, pr_read);
> +        GENERATE_READ_PR_REG_CASE(24, pr_read);
> +        GENERATE_READ_PR_REG_CASE(25, pr_read);
> +        GENERATE_READ_PR_REG_CASE(26, pr_read);
> +        GENERATE_READ_PR_REG_CASE(27, pr_read);
> +        GENERATE_READ_PR_REG_CASE(28, pr_read);
> +        GENERATE_READ_PR_REG_CASE(29, pr_read);
> +        GENERATE_READ_PR_REG_CASE(30, pr_read);
> +        GENERATE_READ_PR_REG_CASE(31, pr_read);
> +        GENERATE_READ_PR_REG_OTHERS(32 ... 255, pr_read);

This should be 32 ... 254 . Thanks Luca for pointing this out.

The max number of regions supported is 255 (not 256). It is the maximum 
value of HMPUIR.

- Ayan

> +    default:
> +        BUG(); /* Can't happen */
> +        break;
> +    }
> +}
> +
> +void write_protection_region(const pr_t *pr_write, uint8_t sel)
> +{
> +    prepare_selector(&sel);
> +
> +    switch ( sel )
> +    {
> +        GENERATE_WRITE_PR_REG_CASE(0, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(1, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(2, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(3, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(4, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(5, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(6, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(7, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(8, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(9, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(10, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(11, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(12, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(13, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(14, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(15, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(16, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(17, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(18, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(19, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(20, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(21, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(22, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(23, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(24, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(25, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(26, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(27, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(28, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(29, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(30, pr_write);
> +        GENERATE_WRITE_PR_REG_CASE(31, pr_write);
> +        GENERATE_WRITE_PR_REG_OTHERS(32 ... 255, pr_write);
> +    default:
> +        BUG(); /* Can't happen */
> +        break;
> +    }
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 7ab68fc8c7..ccfb37a67b 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -39,7 +39,6 @@ static void __init __maybe_unused build_assertions(void)
>       BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
>   }
>   
> -#ifdef CONFIG_ARM_64
>   pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>   {
>       unsigned int attr_idx = PAGE_AI_MASK(flags);
> @@ -110,7 +109,6 @@ pr_t pr_of_addr(paddr_t base, paddr_t limit, unsigned int flags)
>   
>       return region;
>   }
> -#endif /* CONFIG_ARM_64 */
>   
>   void __init setup_mm(void)
>   {

