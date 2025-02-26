Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A87BA45C71
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 12:01:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896388.1305071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFAg-0004ap-IW; Wed, 26 Feb 2025 11:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896388.1305071; Wed, 26 Feb 2025 11:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnFAg-0004Yk-Fh; Wed, 26 Feb 2025 11:01:46 +0000
Received: by outflank-mailman (input) for mailman id 896388;
 Wed, 26 Feb 2025 11:01:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9aM=VR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tnFAe-0004Yc-Qi
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 11:01:44 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20618.outbound.protection.outlook.com
 [2a01:111:f403:2414::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f784acf-f431-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 12:01:43 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH8PR12MB6866.namprd12.prod.outlook.com (2603:10b6:510:1c9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Wed, 26 Feb
 2025 11:01:39 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 11:01:38 +0000
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
X-Inumbo-ID: 0f784acf-f431-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qlq6qXGaPWkm66iwi2WNTA0sU4rTo+psd4MkuxWhde0koFXoVJ7TyUv0o3oZJjMyG2q9JdO3FKYTrp1U69xTT9fdraQCs7AK+MYBbYg+pWoJCfho2Pv2ERuqH6ADDtWqhrmLCvIYFB8uRVb9bHIBLVIg9VIWz6Pmcj/0GRdEX7IrqCHUoST/K3x0g80h9GkyhIg0lIumJAQ0V67R/0ofdx7imAApSZJ63xUO5AVY5VKD/vNg9WyB5BQ39rl1T0yve1zBAvRyhrvQdQ9m67/deU0RqKTaBBksTHBP7UC8xAz/h916xNy5bVCNJAATTNJ8d2a/oGAMyRkM5r++Chhp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSydAJw4QM/jTo5VeR6MsPtWMXgEeqvpLUqV+1a2FLI=;
 b=ONNm/oKASNHPcqRH6t8feG6wCamHH3wxGq05c6pfkH4fXl9q9NwlrcddAlmNDu7eQOoPBjMHlc0CcawPutMwUaX0dlLRoeyvxiGWG1Nb53JIqQrewOQjGX1CM9DdFu/j7psd38QMqMBl8yR7Fs6BFWddDOtLkEZ/DxsgUS52DeHf3NWqcXWlKI82RywnZKTsCWkKaWRkeF84bluLcGTq1d8IPh3TtZ9hFFQgerQdDA3m0b3LZxKONKxlGtOakhqZalewlefjh0sIi6MKZKzMT9UlzK7PEemrj8BVTX7FpxY2KaIWyLozL+VIDXlbhkpJzppr8a+CsqHwPCbTWaUBhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSydAJw4QM/jTo5VeR6MsPtWMXgEeqvpLUqV+1a2FLI=;
 b=Lsjd7rb3FW9P5ee45yA4Vb9Rt+2/MJNceiYavdugjwFbdNVZz9QQi5rhIi18oY/PnhOFKaJieL6CyJoMlohUlEcCdniNpyvH3wmxUYNT4KukgmZR8ytjVEGwxjgauqAScgT5gTaVUpF1lHyrBANQzWAEwC8F0zWUtdoUDapz5SU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <52805265-890f-45f9-bad0-dad5206bb61f@amd.com>
Date: Wed, 26 Feb 2025 12:01:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Don't use copy_from_paddr for DTB relocation
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250226083649.2063916-1-luca.fancellu@arm.com>
 <0ee45f03-c072-4552-b446-58fd9388dd0d@amd.com>
 <F32D92EA-D96B-4D5B-9770-B0D73832927D@arm.com>
 <47fb8c2e-a33f-43f9-93f8-fc09be754cfb@amd.com>
 <26F45E2A-EF28-40AF-B9BE-5B3AD5EE7C2D@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <26F45E2A-EF28-40AF-B9BE-5B3AD5EE7C2D@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PA7P264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36e::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH8PR12MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb765d2-a6d4-4c31-c02c-08dd5654f168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K3IzeUZmUDdGZFpmbVVyUU4vU0NFTWwxUGM2UlZqcjFtSlFJUEpLNDk1L2xT?=
 =?utf-8?B?MUt6Wis0OUM5V25UZjlaUDRDMjN1ZVk0dWNPejhzYjdaZUFlTnIremhOOUNF?=
 =?utf-8?B?R0JsQkZsZi9YWlpTa3hZanRoTDBSOGtaUkZCQVRzUEpGb2JjUmxtaitEMjZs?=
 =?utf-8?B?eE9TUnkyRUpZODI4WVIrOHE2c3lYMmhXZG0vZFY0VTFha2dXTTFRS0FnTWha?=
 =?utf-8?B?UVJaNjhBYTBEODRKQkxsTE50aUtjS0VjOStXNzREazFzTXFCSVMvUDBSdEFm?=
 =?utf-8?B?YmVNTWZtaGVzVGMraVcwd3k2YUVNYlZ1aGJycDZxcEFKaUNEcnNSTVdGaUFT?=
 =?utf-8?B?K1ZlWFNkSDJoMWFRMkNQMGxMMnVqWks0ekJqTWNZa1NLNVJRUGFEOGsrUG8w?=
 =?utf-8?B?MXl1bFdpZjB0SnRBL21OdTZRK0tvdUp2Yy9DY1Fib0JreE03Q3Boelcvb1J3?=
 =?utf-8?B?YVZWSENKM24xNzJNSUhiaTZpbW5xRDg2aUwxa1ZRcW9NdmJQL2JrWDJSMVZN?=
 =?utf-8?B?YTRMT2E0cmhOaFRZanBuY1ZOcDQ0R2orUFIzMkNQSHMyS1UvTnVraG02MFRK?=
 =?utf-8?B?WHF5amdEMFYvMVd6bkpMREFnS2dlTW4xRXpUZ2svOGowYmM1ZnJjaGRtYUNr?=
 =?utf-8?B?YlhlR2hVOFk3bUdxSHBka00yK1lVSWdXdGs4VjR2RDBsYnhOSFYxVCtDSkZ0?=
 =?utf-8?B?dWRRemNqaGhUS1ZIblN1V2YzZ01IbUEvd2x3dGh4VUsrTGdCQVR2cEx6NU5H?=
 =?utf-8?B?dzkzUk8waHNwZy9FSlZLQk83YTVKckl0QkNRbVJmZEdnUUhIazdCbWl1aWtR?=
 =?utf-8?B?TmZ3NktFZUFXM1I2cll5TG1LWUVBMkRFQkd4cGsyWGpSUUxUblZyZHRlMlQ4?=
 =?utf-8?B?UEl4WmoxelA3bmFWSTlBd2JJamVPWXFkVzhmVlVkYktTaVlhSnJIYUNJcDVs?=
 =?utf-8?B?a0NNR1g3SzlOL3pVKytiamFBbkFCang2YkZYbTQ2cFFHRVFONjd5bXZDNEdx?=
 =?utf-8?B?VTUwT3NrU1Z2cEd1NHJvUjFJcVhNYm12aThUQ0U0Q1FraHJUdmNXQmVUNWV6?=
 =?utf-8?B?V3dkQ1hqSEthTHJEN1BINE9VOGpoVkVFZnJVcHpoc0FBUzFNbUtGTlNoR1V2?=
 =?utf-8?B?U1Zxc2prZGsxNU92UW1XL2Zlck5vNUVhM1pLQnlnUHdhUGdWaFd2QnlkbXVK?=
 =?utf-8?B?YktVYmp4dzVEVm9pbnBhdyszS3ZQVUhRL0loWjZNRDZWU0JEdkVPNEc3dmJy?=
 =?utf-8?B?RDA3Mk5UNzg0ZlFrZCtrem11QW1sRnNHTVh5d3VnYUVPekswV1BydWpVZDFn?=
 =?utf-8?B?YkNZQnVsMXZkc2t4eHpaSjF3V3NUTElaNUVDclZOK2RkcFJ5a3YwOGRPSzVW?=
 =?utf-8?B?aDA5SkVHUmZxL1pXWUxpYWxBZEkzbk5PWXJnSlpRUVlZc0tUbEsyankwNnIx?=
 =?utf-8?B?eXduWkNtenB1Y0Y2Z2Jick8zazlGQkxrOVl6WSs0a3JyeXJmNDdGZHAzZW9L?=
 =?utf-8?B?RS9PMHVIWkk3U2lFcWRHazFXNGIyeittd3BZcHhra0pxYUtuR2lwNWVFQUtG?=
 =?utf-8?B?SElNaXAvMkZtRHY4UTBqYVNmK2lKMFR4Mkh0ZWYzRmZzVUtvMVhCS1ZXbDQ1?=
 =?utf-8?B?anRiY0E4cTZML0dvcS9ZOWI1MFJxdEtGcWl3b3BFTjdFN2hRYkFONERRNThT?=
 =?utf-8?B?ME0zc3N0ZkNxTEN4ZlN6bVRuWHpGSWVzUlB4RndOcTZhUEtqVG5xZFladmI1?=
 =?utf-8?B?ZXRzb2hRWjBGRVNJLzhhMy9XWnFuTnZFanZtTVJQaG02QXRvNG1icmUzakE5?=
 =?utf-8?B?RFQrYzRqOWU2Q2VUZ1VOSnpzbyt6Zm4vRG41ejd1b2Q3SCtMSFZ0VXgyWkFs?=
 =?utf-8?Q?cwYDlKz678yV9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2t2c3pocUN3bU0vQlU3WHZOM0F2a1V4dVZIcHZVOFUxTWloa2J2OXBPU3dW?=
 =?utf-8?B?cGkrYmp1cmttckRIMlhuYjFVajZRNGlxalpnejV1Zi95cSs1N3hNOHd3Zlhu?=
 =?utf-8?B?ZHZJTW9DcVJMdXpjSVY4WlJZYUJBK2RvZjh3dTZDVVBnQ3o2QzlhZlBQSFI1?=
 =?utf-8?B?RzluaS92L3Z0a3JGQ28vL3FmR3JuWjlLVTFLSGhadjBnZXlma0tReXU5UVpW?=
 =?utf-8?B?NWhvdjQreHNlTkRBUnBLUENLWTlRbGZwclJQdysxaTZaMVAvQkhPZ0NnZDI4?=
 =?utf-8?B?RzF4djRLd1g4ZDJya2hSYk1vTW4xbVlEN2ppVk9FZG5rbUlIbHg1ZkRJbCt5?=
 =?utf-8?B?dlRXQ3lIQ09OVHJndTkvY1h5T0N5MHNMV2tYVVpLZ245YzBadG9Xd28wSU5u?=
 =?utf-8?B?ZEx4aEN5MGdKbHBVendLTGoyYjVjdzhxQlFITVdDbFl2ck5tOTh2Umtha3pp?=
 =?utf-8?B?SEt4MEpKSVlWR0U3cEN1NzdudzR4dGxnUnQvVmlRa1dqblk4WkZOcnBCNEtI?=
 =?utf-8?B?T2hyZ1ZSNEFTSjd4K3JORmw3cEJHbGRJeVNMZk05bDE0cXB6WEppTFo4a2Jy?=
 =?utf-8?B?bGpYZDBTbFk3NUlxY29sbytERTBFY2FxNTFqc1U3WE9NQTBNcG0za25tOEFJ?=
 =?utf-8?B?eXhlZFJNd0tmQW4xRnZ1bExQSEpIQ1pUUFovVStnbm14Uzlpc0E4SmJqcG1a?=
 =?utf-8?B?MHpwdmdYd3hMb2lvMFhaNjhoV0dhNFgxVlZvTEE3eUo0VWZjYlNVamRCNHQw?=
 =?utf-8?B?Q3pwbVdLNURCOG00NmdVNWFqMXVKM2hKYUFGSFRUZEUvVUtKTVIybTU3enVD?=
 =?utf-8?B?NkNhNXVUQ2NhMU8ra05IZFYvUjF2YjV6RWpkNzlsNHV5ZDlFS0JNNllsRWdI?=
 =?utf-8?B?aTEvU0FSOVhOSU1rV3pVb3RNQmZya3YrWWlWeFRtdGpRVUhWMWpBQ2QxekhL?=
 =?utf-8?B?WWVEdEFZdHNxWTRNdlhsUW1rREh3ek9lMWNJTUx5YlAvUms2WHZIT3pONmZ4?=
 =?utf-8?B?M0FEdTRSbExQL0VNalRGbEFkQlNiV1BDcDFDRVNXRjVlcDJsTVNoY3BOLy8w?=
 =?utf-8?B?MGRkRlpNRFphVXhnbnNGSUpPNTJZN0NlRzRNT2luRFpCTGYzOGpDUnEvUVEy?=
 =?utf-8?B?QllzNnZjUjNKT3AyMk9jK3JpMFJVb1I5bGphbjhhQUZQUGFyYzE1ai8wVVZu?=
 =?utf-8?B?eFptZ0x4RGN5YTN2WDJVT3FWbXFTSVArRGFqSVRBVEV0Q0JBR1RrZDU2Z2h6?=
 =?utf-8?B?Vk51MzFvcStIOHE2dzZyd0JxZ1BVb2Q4ZjhFNTJFd3lFaWNJOUxPWjBsdWdt?=
 =?utf-8?B?UlFlSkVrRUVwQ0FpWmNsVlloNFFVNE9VdVh3MU50bG5VVEZhWjEwS1IwdFVP?=
 =?utf-8?B?MHQxcDhqUnpqNkNkMHNPcDdoSUFBZFlZRnR0dUcySmI1NmN2bnZkS1BRSlA0?=
 =?utf-8?B?YThQSGNNODlLd2lFZ1FDek11RjFGdVZmNUExdzl3TFlFb2JENjFHcFBzRlZ0?=
 =?utf-8?B?aHBLWHBNZFRwRzdTc1JjZVNDQVo3MW1CK20rOXczOVZ2R0doczNTbnR2TktE?=
 =?utf-8?B?Qms5ckZwd09yWWxHdmFNbE40WHdkVnlib0ZCdUVIQ2tYUXZUR0lLd0wzeU5I?=
 =?utf-8?B?NllNakFLVkR1ZkY3WHhQaUNKQ25FQTFuOUF5TEFEZEVwNGsweVN6YnZ2N3Ri?=
 =?utf-8?B?c1M4b1lxL1RrNDhCeUhxc01JbXFQZTYzR01TdXlJMVEyQ1Evejg1SHBhWGtG?=
 =?utf-8?B?QS8xL3hMSzBqVTBZZEdkK2sxR20wNENtaXZjV1JVdjZnZ2x4UGdWZWcxY09u?=
 =?utf-8?B?UXZ3U3Y2SG8yWm8wUlArVWt4OWtZYXhnK3BiYWVabCtwZ250bDM5eXB6VklB?=
 =?utf-8?B?UE43Zit3UDZiM0RqUFh5bnc1ZmFsS3llZDNPaHI4MURUaEkzVzhYYUpUTEtG?=
 =?utf-8?B?ZjVYMXpxdEtoR2toZkg1R1J2YVJ4TWxIOFh4VDZZVEplRTFqMzBDNGdKUmNU?=
 =?utf-8?B?Tm53aEFydllwQWVJTVdPajZwUnVuaU1VYVV5QkUrMzVISU1kNWgvclZxOHlU?=
 =?utf-8?B?S2NXOThzTFVvYXlwYjEwVFdzcTA2VGgwT3dROGNhK3BiT0lQNmRKSU5xb1p3?=
 =?utf-8?Q?vGtG9E0cMQO51KeQsDKsOagzs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb765d2-a6d4-4c31-c02c-08dd5654f168
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 11:01:38.5425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CFZYZGKt+jhGYn0bKMWGBU8DMM+kDG7iK7S2P3WHK/3X2C9PsU11iAtAH0b89eQz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6866



On 26/02/2025 11:59, Luca Fancellu wrote:
> 
> 
>>>
>>>>
>>>>>
>>>>>    return fdt;
>>>>> }
>>>>> @@ -362,7 +363,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>>>>>    if ( acpi_disabled )
>>>>>    {
>>>>>        printk("Booting using Device Tree\n");
>>>>> -        device_tree_flattened = relocate_fdt(fdt_paddr, fdt_size);
>>>>> +        device_tree_flattened = relocate_fdt(device_tree_flattened, fdt_size);
>>>> NIT: It can be just my PoV but it reads odd. Why can't relocate_fdt modify
>>>> device_tree_flattened pointer directly in the function?
>>>
>>> you mean something like:
>>>
>>> static void * __init relocate_fdt(size_t dtb_size)
>>> {
>>> void *fdt = xmalloc_bytes(dtb_size);
>>>
>>> if ( !fdt )
>>> panic("Unable to allocate memory for relocating the Device-Tree.\n");
>>>
>>> memcpy(fdt, device_tree_flattened, dtb_size);
>> You already make assumption about device_tree_flattened being global, so why
>> not assigning device_tree_flattened = fdt in the function as well?
> 
> just because it’s more easy to follow the global variable changes when reading the start_xen(…)
> code as the function is the only one modifying it.
> 
> If you strongly oppose to that I’ll change, but imo it’s easier to follow the code in this way
How about:
static void __init relocate_fdt(void *dtb_vaddr, size_t dtb_size)
{
    void *fdt = xmalloc_bytes(dtb_size);

    if ( !fdt )
        panic("Unable to allocate memory for relocating the Device-Tree.\n");

    memcpy(fdt, dtb_vaddr, dtb_size);
    clean_dcache_va_range(fdt, dtb_size);

    dtb_vaddr = fdt;
}

This would be best IMO. That said, I don't care that much. Choose whatever makes
sense.

~Michal


