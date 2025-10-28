Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6393AC16B0C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 20:58:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152382.1482850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDpos-00026h-Mc; Tue, 28 Oct 2025 19:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152382.1482850; Tue, 28 Oct 2025 19:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDpos-00023o-JM; Tue, 28 Oct 2025 19:57:26 +0000
Received: by outflank-mailman (input) for mailman id 1152382;
 Tue, 28 Oct 2025 19:57:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pDzw=5F=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vDpoq-00023i-8r
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 19:57:24 +0000
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c112::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fd79ae8-b438-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 20:57:21 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 CH5PR03MB7861.namprd03.prod.outlook.com (2603:10b6:610:20d::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Tue, 28 Oct 2025 19:57:17 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 19:57:16 +0000
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
X-Inumbo-ID: 4fd79ae8-b438-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcCIo762WZi4EV0AgY35X8NANa1GyAt7HboR6ndni5np2Dctyt2QUR2ZL24f0vXF2tayMI5hMdMoNuEZsAb5v/36Ov8SbGxt+LVB8UdzcLvtc2iDq5AQqiXtUOVTAQS0TO8dJYgYgJFfA8PIlHvLC6s6dYEsvHaZAZI2/Wq5Vd319p+YfoMzJLDYa4NzO5p+22/DV8RTR7ixEOFQk8K5zDH9PkfEoItqSvpPhCsIQgoTKQkIUwylhsAQ73yUxn4lhoVeXTOgrhaD8eFc10fksrQdbBOAN7F/Qld/E+i8JQ9f1eTskUbQILzkeKA46p+cW/uzicZD8wQE78QzyyakCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IIgSA0kMWtXWV/F+EtIK0Whz55JWtvAEip39HJMEx8=;
 b=q14mZyyVa/Fiayuz+/NvesbdwBV4E+PxyjLJNV5HJbtBsB+ibQVjJUANH7ULj6GV0vWrgcKCB9/Nx3Gp1+MkYztos4Ih7DAyXqs5i8SC0pk8TN7SblgnzIZn0Rfuen8d/ZuMOsOix8ifRvtn1FM2P4izmKd8c+9mOzWYTFImrL0lHGJvx9A4Xnv3ISGzB5wwtVK3KG0uVQNv1Ybo+MPJKB5zmCdQhDXGWFNBYzq/XsDUnWW/vHPBBHc1t99eYmS+B+1eDbuqYzE8rxBBfP20RMIbhDAVz499qyWN1HXly6rGSC1I2P9k+HVdEVDGQsySXh1NXiGW6d/ETSu9qCNshw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IIgSA0kMWtXWV/F+EtIK0Whz55JWtvAEip39HJMEx8=;
 b=XyyL9H/i4mkDkdsR8u0j9HZEmSdGv0F6DRntsSuLPuM+GriOxzsqj7cVl8h8pC0I3aOnWDT3nCRtVUQV/oXaDuU0jgTuvONY88PFBlxuFF/w4wCOJ669HdcK5gAeglgKlJenHmkCbH1WCvFTjg78e6WBATt4itiPb/HGEu1DkFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b7e9eff3-c3ff-4b88-92ee-cec9f1a4cf03@citrix.com>
Date: Tue, 28 Oct 2025 19:57:12 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: avoid unsafe cast of __init_begin
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <680a7418c445381d68fc95f0e3cd03f574fdda86.1761672602.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <680a7418c445381d68fc95f0e3cd03f574fdda86.1761672602.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0166.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::10) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|CH5PR03MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: a715f503-1836-4ee8-cbb9-08de165c31fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OStjOVdtRFVLWlNXalpkd2Y2QUduanFvMi9Wa04wYTdnVWhsWk5OS3RBd0Zs?=
 =?utf-8?B?OTVyYmh4WEhza1dTUWUvVmpzUHMzNk1CU0hOa0RUT1RTSUlQZWhLNUtjM0Nw?=
 =?utf-8?B?Vzg1L09jbGZqSko4SXVDbXZsOXd0MHk5MVQzVUE2bXJBc3hic0kyak0ramdl?=
 =?utf-8?B?VUY0azB2Y2NVOS9NSWVjZWhRaEI2bDVYWnlqZzBLazJyRjA3V2J1ZnkrVEpn?=
 =?utf-8?B?YmxUdjBXbG1GL0hRQUZIWVdpbE5ZRlQwUFR6QUxZa0pyRlpPdTdkd3hUMjBo?=
 =?utf-8?B?MUI2eVZWNlhKSjlKZW04NGpvVGNRU200dUV2Y21ZSzJIaSsyeFhKVDFWbTd2?=
 =?utf-8?B?WDJIWTA2dld4TGNXMEQ1UWFnWDJsS1BlTlJ2K0YzYWdDNHpYeW5HV1p3dXY1?=
 =?utf-8?B?MUJRSjRKL1p2RWMvdU5HK2RxSXR2WFlNekJXMi9iMjRNN3gvdWF6UXRjQzhJ?=
 =?utf-8?B?NlpTaGoreS9jRHErRmx3M24wZkcxUXFyYlZGdjdaZHdaTHpqMnFpUUs5RjAw?=
 =?utf-8?B?aE5tOWN4THFoU1pjOGNoaVpkbkVCcjRqSytMaGloRk5wZEtYdzZvYzVHejRw?=
 =?utf-8?B?ZG5DZUNseTZBeXF2S1NmVVAycGt6eXFqMFJlMWVQUUlsK3BYMTBuQTNXV1hF?=
 =?utf-8?B?YmF0cUtUVmpaRGZFQmY0clhBbHFFU20zTlpIc0RPSU52YTc2a1Q2MWdXT0Zq?=
 =?utf-8?B?RkhvUmVWcEdBNnhMeEVEZWIvUU1WL21pZE1xRUJRbE95QWxTeGRrMFZrQWJ1?=
 =?utf-8?B?ait2Y2Zrd3lDTjk4emlsbGwwdS9rVGZWaGd1bndrU1JDM2d5bjZIY2R5WVI2?=
 =?utf-8?B?VWNNM093VTlyUWsvV3B6WGhtRmwrOXI3OXZBN1lJMVZvYWlUTGtvNXRIWXll?=
 =?utf-8?B?VFRuTmJlY3NwMVVTc3VDWFFKa0NiMUo5VlNFcWZvdEdRSVFkV1lYWm9WNEw3?=
 =?utf-8?B?ZUk0a0Z6MnZsNkR1R3dUZnhvNTM0ZVkxaWQrcDZ0dERpK0dqWENaOHc5bWk1?=
 =?utf-8?B?VHlNM1ZBRVlnMUhiSW9ydXVWWlVhKzFLTm5CK0dYeWRCZkhrWEk2Q2JaWFhu?=
 =?utf-8?B?ekZXNEJsQTZ4WGdPd0NFWGpOeG5mYm9KdDJ6UE02enZ4REdHb3BZcEozcTRq?=
 =?utf-8?B?Q2JDUmJFcjAraG1MRHUvOVMrMXU0Z1YySGpMbWJJbTNKZmJQOEVidHAxQ1FF?=
 =?utf-8?B?QXB1YUQya3dJaDZjYzJLK0svUFYzVWlzYzc2YzhoVEJiLzJJbGJLUnBVd2ph?=
 =?utf-8?B?clNtVjl4Nms5UTdadlpCNFBLLzhGbERta25HNUZDZkVhbUc5dklBZlg5L0VW?=
 =?utf-8?B?Qk82NnM0a2RSOHFEZ2FHWWZaczZGc2JReVdvSTl0UFZpeHN3V1dRbXlrcG1k?=
 =?utf-8?B?SU84YmxzcnNYWEEwaEFxRm5zN0dyQkxOWGhnaEtKVVgvbEIvODVFYUdoWUdU?=
 =?utf-8?B?QkwxQnErNG5oNUlhSWx2enlxMHMzdWZjNCtsRzRQdFFqa3VGdlUxOHY2dThV?=
 =?utf-8?B?YjZ5cEM1Q0lEUWNORkdTQ1ZLWjV5SVNNSUdvTHZuSU5ET3RhWEh5YWczVm5E?=
 =?utf-8?B?aHp6OTJsTWlIcVF6bVRkV255MG0yYUFOUGJrdXJDRGdLL3d5TnpzT1Jobldh?=
 =?utf-8?B?WCtCQnY0dGJhVHB5cHhIdkhOUlBIeUNkRklCMktjQnZwYUVSQjc0Qjc0K25k?=
 =?utf-8?B?c1dJUVkyUVFpZHhBYVdRVi9VMGRGTUJlbVFGdEtneVVLdG5WMHcvVUsrKyto?=
 =?utf-8?B?MU5FUTYyU3djdVc1V1hZUncrd1doUlM0N29SK09VNnBRWkZhMUc0MWRYaFly?=
 =?utf-8?B?bFh3ZGVOOEcwelVtb0JsaHlZaks0TS9JN1Q1ZEsyOFRlbEl2clhJdk5hcm91?=
 =?utf-8?B?eEd6RVRIOWQ2SGhBSldFNDErWVpYa0UxazFOMEJOMGprdVo1NkhtRitlRzZu?=
 =?utf-8?Q?CyeeY7Pl+PeCYkudIOeA0qlpOjBK4WWA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dDBDSUNCRWJ2b1NOcE5uSW5OSjU0Z2JreE04aXF4VTZaeTE1QmFYdXNsek80?=
 =?utf-8?B?M29lTWtpRG5WUmtDdGg4MXVEWVpaMkhFVW1penRsZ0xRNHc1bTdQU3Zwd2Rz?=
 =?utf-8?B?K293ZmZVRXVZQUl5blpBVXQwdGNqbTJVeVNhcUtYQXRBOXg3bnIydVNEc2U2?=
 =?utf-8?B?K0lDcUlmTmtFeFVhTDczYzFLSkhvS1VYOHZSUFdqZSsvRVV3ZktKSzZ3MVBP?=
 =?utf-8?B?Um1NWTUzV1ZnS0FBM0ZLWnQvanFxSmhnRzk0bTluU2VZMTdvOTFzcWhRVy9E?=
 =?utf-8?B?NWNRN0RvSGUySDNTU0d5M1lyRkthMU4rRlhUWDlPS2U0Vko0TytOVU90T1gr?=
 =?utf-8?B?S01LVVYrSzJ3WHh6dDZrbnRzdmdVTEc2OUNKUGFJcWtEZElvZTU0ZHdzaEtK?=
 =?utf-8?B?bm0zSDJOVnZTRnpGUC9BYTNoOFNpNUFnTXZYWlQrTy9wa3crTCtPNWJGbHdz?=
 =?utf-8?B?MnphVUxBbXpLdlBEWXI3a0JqWittZmZYZFFUWHFRTTBSK1licXBFbDF2MlZo?=
 =?utf-8?B?c01SYitlNFJKZ082OWdwWFFuZ2s1MU5YSVRRSk1xclgvUXFFNHZGOWJPTi9I?=
 =?utf-8?B?bmFkdUhOMS83Z2hvWERTTXFieGNlY04yOVZEZ1kvMFF0Z1E5cjN3T2c5dThu?=
 =?utf-8?B?ZFRLS1AwSWFXTHFoTnBKLytxbXNoN0UyUTlzUzRmL2RoMUkvYXVXeFlnNVdN?=
 =?utf-8?B?L3NTWXE4MEZZOWIxd3hNeE9EeHAyRjNZcTF0dTF5UzcwRmgxOWFRdG1nMzZu?=
 =?utf-8?B?WlVnWXBqRGRMUTJCQ3hzT1k2NERVdnhOcFZEVkFtQlFpR3FyMXlBRWN1YVpZ?=
 =?utf-8?B?RHVxazdFdmtjaCtSR1p5SGZxdzhlV05tcVA4TW5MN3lTczI1YnNTd0g0VzB2?=
 =?utf-8?B?MkpLOFBxTU5seGN6ajVVenk5NEQ5NkFqTEtlQkZWV2hzMHhrWU5EcytUTTZP?=
 =?utf-8?B?VDl3Z3BEeENENU11U3dOemV4Y0Y0VzBtMUt4aGJrM0RITmM4MElIRTRENGFk?=
 =?utf-8?B?bDI5d2ZkbytWTGRCRHEwVHhndWhzanZWZjZWR1FTZUNYTC91a2Q3ZkNMemUv?=
 =?utf-8?B?UFEzZ2lUTHhLc1FlWWRBNEhqZzRpQzdrazE4UFZ0cDlONWtkNVd4RlhqU2Vx?=
 =?utf-8?B?bGw5UWFGS25FZTNvNXg3TllLVEdnQXgrV0ZMUE52ZytKbzYySFljTk13NUdi?=
 =?utf-8?B?RzFKVWpabmtnV0ZtMENzMzd2SzZmL3lvdUJ6MnRybWlaZGJsTldmcmhQelE3?=
 =?utf-8?B?di9ZSzdxejIyTTkxd1AxNWdEN2NiK2p1MXYxbGNwc1VPQXllTk94UlFPMllm?=
 =?utf-8?B?WTc0OG82VUorN3QyQWVBVGFYU2ltN2UrclZzRllvM3ZTTmRKdUpSMWVvVWlJ?=
 =?utf-8?B?QVZyeERrVEV4T25xOGU5bXRNZEd3NUdhU3pHUXZ4TlhGamczKzlmZnBGRGUv?=
 =?utf-8?B?QytzMkJuSE9mMDNtWDN5S3NHd2lVTHVSRy9GMzBSVE80NHY0M0V2N2tZUjcz?=
 =?utf-8?B?bDVEbE5sZVJ2Ym9XcSs3NVBvVjFpcjRZYnBnZ0pLMy9VSG1kNkY4di9ZS1lI?=
 =?utf-8?B?Vmh2Rld3T0ZpZGpDcVZRK0J5ekV5S0tuOEEzZTN4Y1Z0aXF1ZDFNWTZydFFG?=
 =?utf-8?B?Sm9NaUpxUDNiWHNRaW1VNkl4RTd2ZXdHa0hvWGxUYWI0MU42ZTBNOXowR3ow?=
 =?utf-8?B?dzhtcWlMYUloaVBNdmFod3dQMmNEc3RiSlAyK29WUlQ0bWF0SHcwU05hSkNE?=
 =?utf-8?B?emhZQ08yS2UyYm16MktyWkQ1a01VY3R5UjA5WWtJOGMrdkdsZERFd0lLSy85?=
 =?utf-8?B?cDdMTjc0bzBFOVJGd1pOZlBGVElaQW11eDdsdjArelFJOTJING91Q1Urb2Nv?=
 =?utf-8?B?U3BWREs3Y1p1VWZHT2NqM2ZqcGxwR25MZ1ZkOFYrWnBxWGVKVngvQ0ZwRlZ4?=
 =?utf-8?B?MktrMWJROXNPZ1A0VWFhdWZMYml6c0NjSUZrVkdsQUYyMnQ0Rzl5MVNXeDhw?=
 =?utf-8?B?Sjdoa2U3QzRaVzVMR2x4VUVOZEZSOGoydFlSZHp5R1NWRzd5dkk5VkZ1MURi?=
 =?utf-8?B?ZmlOdzN5NkNjbnNJQ0IvUEV1TGRwZEVNc3dLcHdDc0VQTGYxc2hKZms4ZVRR?=
 =?utf-8?B?VDVKNDJ2cXg5VE5YUURPcDFkRk9Fa3BVR24vRTVpbUF6OW5oaWNmU2ZWUGlC?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a715f503-1836-4ee8-cbb9-08de165c31fe
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 19:57:16.8536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKppHol4mOHypw0ky834x23Q1WDAAs7qUx7gT7Hv1LK/2eTXxSktfFI6ieUb4zHB3pzR81Mhslesq5Qn6EqYBKq3kMGU/hz3cGOclrIsEg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR03MB7861

On 28/10/2025 5:45 pm, Dmytro Prokopchuk1 wrote:
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index eb8ed19ca1..00c4c8832d 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -481,7 +481,7 @@ void free_init_memory(void)
>      unsigned long len = __init_end - __init_begin;
>      uint32_t insn;
>      unsigned int i, nr = len / sizeof(insn);
> -    uint32_t *p;
> +    uint8_t *p;
>      int rc;
>  
>      rc = modify_xen_mappings((unsigned long)__init_begin,
> @@ -501,9 +501,11 @@ void free_init_memory(void)
>  #else
>      insn = AARCH64_BREAK_FAULT;
>  #endif
> -    p = (uint32_t *)__init_begin;
>      for ( i = 0; i < nr; i++ )
> -        *(p + i) = insn;
> +    {
> +        p = (uint8_t *)__init_begin + i * sizeof(insn);
> +        memcpy(p, &insn, sizeof(insn));
> +    }
>  
>      rc = destroy_xen_mappings((unsigned long)__init_begin,
>                                (unsigned long)__init_end);

I'm in agreement with Eclair, this is horrible code.

Putting an undefined instruction here is pretty useless.  By the time
destroy_xen_mappings() completes, you'll suffer a pagefault from trying
to execute there, rather than actually getting to execute code.

On x86 we simply zero the memory and then hand it back to the heap
allocator.  ARM doesn't seem to do this yet.

Irrespective, it either wants zeroing, or maybe SCRUB_PATTERN as we use
for other invalid memory.

Both of these can be done with a simple memset(), which simplifies
everything.

~Andrew

