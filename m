Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C09DA45BF7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 11:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896320.1305001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEoA-0004Yz-6h; Wed, 26 Feb 2025 10:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896320.1305001; Wed, 26 Feb 2025 10:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnEoA-0004Ws-3R; Wed, 26 Feb 2025 10:38:30 +0000
Received: by outflank-mailman (input) for mailman id 896320;
 Wed, 26 Feb 2025 10:38:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9aM=VR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tnEo8-0004Wm-Lv
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 10:38:28 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060c.outbound.protection.outlook.com
 [2a01:111:f403:2409::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf7e1f05-f42d-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 11:38:27 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 10:38:24 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 10:38:23 +0000
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
X-Inumbo-ID: cf7e1f05-f42d-11ef-9aae-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c6pw6brzBlQl/ntbwyXAhXMKMGot3vPfPKx7lFBXCETHaleSCF+Anh3eLAgHEjdIryUXoHGKIBkiVM/O4wFQDKxxUlzrjGT2QQY7FYSS8FwsNduy1iyAPlbUZbLPQ+7bE59a7VCOFaslf8Yz8tXwfy7CvJ3t3KtGz8jpxZJN3r/4LMn0oEP+9ei0P/2htchLYhVWtORyPgOZKpHplmyBTlmR+zqhVXeuc8tK1e7GyUiOdijXrKLibin/vXiLr3wghyZddzuA0vefJ9eUSb3FypEcQelpbv5wbBGtBcOonfSRfWxJT59mpwboXkPztwTTB8ZfEK63CWIpGREjxa+ZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=688jrxlfloaqRoVFmmGu6uTzdhTh0I0rlw2bPJafoW4=;
 b=tyd3LUvD4dEu2rR84Q0PKZmlqEGc/7bYQ0E1xgPGuyXGU9/c0LapbviL3At66AG0Zmk1v9AuCTUdW5agl4G8gcxbszJqQJ26WBJmTyKZeuogRM0090hpruAQNXxymJ15mZLRrGNTGnf2KcLFfXe5PY0niKD5dN30roZ8EnV6kZBADVV05uPj75vu5PWuhmGzhWz7Vp9mFMGPsw+At42qjnlYKaQl/QMrrruZXItSUcLK+iEywITRFUbaSiPe9J+Eenp2+rhmDWA1JcaBtwy1PBP4cEAsToQWhaD2d/HG+lAXiYO2GKlNavgDHuN597oB52z782bCqkjqD793wHrwig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=688jrxlfloaqRoVFmmGu6uTzdhTh0I0rlw2bPJafoW4=;
 b=RJrwh7JCeQX5FJfSWLfPYBizMgNWTnglbgpXToE+2h41DabC360BQSQEDwLUnpIFbpTFt82opBwzkEBjRsofjpCOqlDrVky7zi3CKFt4/7qMXIKHuVZXKqgp0huBy2sJCgX3CDPxPka7N9Rsnh/vyZtpSOQuPacmqrv+2/ySwYA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0ee45f03-c072-4552-b446-58fd9388dd0d@amd.com>
Date: Wed, 26 Feb 2025 11:38:19 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Don't use copy_from_paddr for DTB relocation
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250226083649.2063916-1-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250226083649.2063916-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0299.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::10) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ2PR12MB8884:EE_
X-MS-Office365-Filtering-Correlation-Id: 54ba7ba9-55d9-4d93-a914-08dd5651b1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzNBbXNLNm40K3dnN2s1ZllNZWI5MEpFK0JPUW5FWnVEV04vS1BaRGN3NDlm?=
 =?utf-8?B?VGxXZWE4S2hkMVNHa1VqbDZCdkJUR2NEakM5dU1KR0NyOUFGUFBJLzF2RFFR?=
 =?utf-8?B?WTZKSmpVOHJiMktvZml0S3I2cGRnaURCV1pyOFlCd0tsOTMxa05wSVZ4clVm?=
 =?utf-8?B?WExaK0R0TXArME4zblZmWFJoeFZzbWpQbHd6TWxweW5pZkt5S3dzZEU5Q0hj?=
 =?utf-8?B?d1FidWZWTmx4Mm1uN29VV296OEpvd1dxcVN4bzJVcGxYQnE0NDU0VFZ0S0lj?=
 =?utf-8?B?M0JxS0FoSjVpNXRxM2VGeUxQa1hMMCsvS3N6cHdBWjRyT0VrU2E2N0RxdUt1?=
 =?utf-8?B?cjFFL01pY29SRHNxWnozZEs1VEM1TGNqTXgwUGdoQm94a0IvNEl4ckNiSXVn?=
 =?utf-8?B?dWdQSmJPZVJQWVBUWjFuYUhsc0djYlVYN2lOWDlzQTUwQkhjN0JHVStKZlll?=
 =?utf-8?B?VjQrUHlmNHIyTnVwOGJFTTlRVjlSS1k5L2tPRVR3RTk2Y1Rkb2IvUHBDYzRP?=
 =?utf-8?B?WDVTQ1pEUG9zVXZMZmcveGR2L2g5RDh2WjkzbnZseUhuNzcwTUVxbkdCRHFN?=
 =?utf-8?B?NWhrc2RySDBaMjN6Y09RQ0lMV3lJYVloUzFKVTdLNERtMk9ScTl3Wml3bDh0?=
 =?utf-8?B?SWJjalVRVjJmdkc1Nlpud0M3cHZ5ZkpqTW5pRm5ZTWVzNGhnNWFoeEg5cTFD?=
 =?utf-8?B?djdQRm5mNndTZFFFcGdWZjY4T2U2R3pkTHZ3eGkyR0RJRDJ0NXJ5ZmFDRjhH?=
 =?utf-8?B?Mnk0UGZWWGNOaXE4YmVYaFpxVUZPSXNOYXJDdHVDbHZ0WHJSVW5qb2JzRU01?=
 =?utf-8?B?cCtPbnl0TmtoK0E5dkcwckhjNHpDN09OOThIaDZZN2ordWxKYW5xYW9MK0tO?=
 =?utf-8?B?bHo4eXg2d08yTFFLd28yZEljcDJpOGNnWGd6cGc0UkpHaTRyd3dVOWZhZmNy?=
 =?utf-8?B?RFNyd1htL3Y4MGtQU20rWlVsV0w2R3N2bUd5ckpmRjh6bzAvSFNhQ0pVYmM4?=
 =?utf-8?B?NlBZRjNlTS9vNTRaajNEZmRzZ2lrL28weDEzS09zZWVjL3NhYk9iYkxUemZw?=
 =?utf-8?B?VTZxbGdqN0s3Y1gyZ3R0cUdXMndqam5xUGxXQ1hKMG05QVgzUHYwOTA1NUFz?=
 =?utf-8?B?c3dNSFhhSHdaZ0E2K2J4SDYrMUd1Q2lQMmJMV1VRRWlDTFBjUU85bDR5SWw0?=
 =?utf-8?B?ajZSb3FtazhlcWdJc1pnZ2thWUxxWHJoWFlWNVRCak1rSUk3Q2dhMUl0aE1T?=
 =?utf-8?B?WHRZOE1yTjZzTzM4dm9JQWV0a3VIQ1hEQ2dqM2JrcG4zZGdtZWxDTlpPbEZB?=
 =?utf-8?B?Q0wvRFBnQ3l0NG81WDZ2bWlzSmFhbE1JUE5SRHBUTGlXNHRSRWZqNjFiL0Yr?=
 =?utf-8?B?V0Z1bjEwa3dhREF1d3dGRWdTUXFWNzZOTHluMHlMaGppY3ZzeDZ1UEFja3lD?=
 =?utf-8?B?TlhSTkxGOWFxVUp2dXFrQ2FUZ2pra3MwUWRuYThPZGlpUFdzSU8wYlpuWHc1?=
 =?utf-8?B?R2RuNUtUeDR0UjVDQ0RGcXlqOWl2ZUp6NXNXTmwva3czQ0ZtSnk2VFlNZzRh?=
 =?utf-8?B?TmVnVDQ3azNaeklNRGlMVXR2MzdVcVlWUFhSREcvYjVadXlQY2NSMytGUlVR?=
 =?utf-8?B?NkdrUmQ5MFA4anRoTzNEM05YYS9BRVpnNEZ0ajVzM05kOGl6ck5iNnVOTGVo?=
 =?utf-8?B?WnkwWUtnQ29SSVRobVZuejd2aUVMaHZwU2MxTGFIcW1BLzhsZEttYmhOWUlq?=
 =?utf-8?B?d2RBbEc3T1hXcWRrdmx5QmZsVWh1WVdGNWtMU3JDTnAxSmoyZjhSZTlnRVpJ?=
 =?utf-8?B?RThYN1kvN1JCdDlXWXJycUdrUk9UU1l4S2RRYzBtNE1aWklxaDV2R1pIck9B?=
 =?utf-8?Q?Ps9dktxZpgFe0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3h2OWpvTXlaUVJDS3c3NEMxL09JVFFKaVJ3TUF0VmZTV2xZTnErOEtUUEFy?=
 =?utf-8?B?M0I1VzQyK01vRmhUVkFTVnZKeHVlWHNXMzZwVXZLVERWMHFkRVdFUWRRYkh4?=
 =?utf-8?B?Q1ZaL1VZTmN0MVN4QjNNUHpad0J4d2hPOGpXYUxidVUrNEVhSXkvUDRjY29Z?=
 =?utf-8?B?eEY2VzhCb1VUMzYvRXJKZVpTZGh5ZHdjSDZuVnRwUFVEWU1pMWVXUGc3Z2Zo?=
 =?utf-8?B?NGdqT1ZzU2tWZmoxVlpYcm9RcHQwWElVbEN3VzJ1WjNHYkxIc1J0UnZJK1VO?=
 =?utf-8?B?VC9XKzFuNmxhWjNueUN1MGRxVGRIZE9PcXpNcHVvNTV5bVBiUGRMdm54NEJ3?=
 =?utf-8?B?QWd1TC9IWUhnaVVRdUp3ck9WeFo1d3VOR0tOdVN4L3FBdzNrQkhSV0lXR0FT?=
 =?utf-8?B?SS8zVldIV0dDMjRtNWh2MnpSVTlCNkNaSGhvL0NwL1FIeDlMdGt1Z1liekt6?=
 =?utf-8?B?Q01CTmpDcDFNMWF5cW9ZVXA4SmlrU1c5TEhzdjFZWmRiN2xvWE9wU3VId25D?=
 =?utf-8?B?N0xCcW5SOS90K1RWS3ZQWXYxcENzUXpveUxTNlN1bHNERDl6cTRiZTVobkZy?=
 =?utf-8?B?anhTREdJcm5qWXpiekU0Nno3Z2FadTgrWkhoQU41MWs5dG5acTlMV0djMW40?=
 =?utf-8?B?ZVFuMUdpY2c2K2RQSWI0ck9PY3l5SHc3WndaMWtuL1JMYXBaMzFubEFsVndL?=
 =?utf-8?B?azdORmh2ZDBIM1ZqbHpzYmlYNnFnUzE1d0srYnluV1h3YWhFaGVlaHF0TjVG?=
 =?utf-8?B?QTRrdlR3a05nQ1F1TUx4VE5aWm5yNk8zcjBrRkhQZ0R0bzQ0ajFrZFEvTFJj?=
 =?utf-8?B?L2tTTDZnSS9zVDF1cFQ0WWM5b1UvU0ZWb2FSd3BiRUR5QjJPN0VkKzNpSFdq?=
 =?utf-8?B?RUQ5L3UyZldPM05JY2pQRlBWT0tPUEpNV290VlVwSVlWM1YxdCswSC93R3Nz?=
 =?utf-8?B?aG9lODBFVHRlZytzbWxoT2hGRTlRblQwdmUwZTZtTUJUV0drNEd6RTd5ZjUx?=
 =?utf-8?B?Tyt0c3EvVFVuR3c5QU5pWlcrclNvSER4VWtyZTJTMmtLaDhIZjJuYXhJenNP?=
 =?utf-8?B?RFpaalYxYXpNeERtMnM5R044TTlmeG9Cb1RoZGJ0Mmd3NE9kcTIzT0xoQXgy?=
 =?utf-8?B?WnV5SW1HMWwzU2xUS3JoVEZQS1NhSi9UeEtjcFZOREc2NWRQYi9mcElDLzVC?=
 =?utf-8?B?Z0Q1cWpzT3FaTW9LWDFrOXlXMG5UaHM2V3YxUjI3N2E3R1djTDFwSThCRzZB?=
 =?utf-8?B?MFJjQTBiV3NNZFFHM3hQTXJkcjkwc253RmRYWGFHUzYwQi83dFMxZmN6M3NX?=
 =?utf-8?B?anNPU2VhbUpkWGNNc3JzaWxOdDlITmxVbDlEUzd4blhEUlkwTmJ2N01oSHBu?=
 =?utf-8?B?eFZ3dDErWnBMWlBtOTdUdTJHMjh1OTJVUzlBMWZrYlJLejFWR0FiUTRxSGV2?=
 =?utf-8?B?S2hEeWIxbzNxaUo2MzFQcTZCVDVuSE1vUmM0c2thS0xMb0pLb21kSWR6SWFC?=
 =?utf-8?B?d01CYldMd01OQm9BWFMzNHMzT2Z5OVpGeXg1WmtnOFo4TGxuS25PUm9mYXBQ?=
 =?utf-8?B?bDBUUU45ekxacE4zZzBkM0dxdXVRdzZEZUwyL0VpVjNpZGZWeW9MdjJWdEJF?=
 =?utf-8?B?OVpZb0NJRVZYVVp4NGlOVjRSN2RVa1QybGU0N25ueG81WXY2cWFVcFgxSlVn?=
 =?utf-8?B?T09tdUF4NzZraWI2ZmZKY2pLQlpVcmFwbGs5THg2d1JLeE1vUmlUS2pWRWd6?=
 =?utf-8?B?Zis0YXcvb2NzOUhzVFo2Tmd5ckJsZjBndHVDaEZDRTAvaWhia3pWOWpDV1Nv?=
 =?utf-8?B?QXFxMmlmMHlOTENzVWoyQTkvdENaMWhLYWI1ZEpnM08vTWxFYTFJd2drVkJp?=
 =?utf-8?B?V0dadU5TRWZVYmEzWHU4Zmc5Tzl3M0pIOXBla2ZtbHJIRWk2emR3NUVaY21u?=
 =?utf-8?B?ZXVqZVgwa0wzU2xBZ3Foeno1Yi8xWHN6TmQ0N3RnYzNjVFIvaDBYTk5OZHdO?=
 =?utf-8?B?ZWxlOEtwVldrUTI4WHEzc0Z4bTloVmlhQk1PTG1vYmVETVh6VlRINEhzY3Ns?=
 =?utf-8?B?WFVVTmdTaENWYkdxK2ppNWhzeUdnRmNLVzA3Q21GZUpzMnRETXVkKzhmbllh?=
 =?utf-8?Q?PVcj7b5PFwfIHnB3KQZBlTQHH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ba7ba9-55d9-4d93-a914-08dd5651b1ec
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 10:38:23.5598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoDQJU/Rw/nBQRGe0EdLTdDNzd9HSVKzMGA9tDBw82z1vjeK9uRkavcdk1IB7Nv5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884



On 26/02/2025 09:36, Luca Fancellu wrote:
> 
> 
> Currently the early stage of the Arm boot maps the DTB using
> early_fdt_map() using PAGE_HYPERVISOR_RO which is cacheable
> read-only memory, later during DTB relocation the function
> copy_from_paddr() is used to map pages in the same range on
> the fixmap but using PAGE_HYPERVISOR_WC which is non-cacheable
> read-write memory.
> 
> The Arm specifications, ARM DDI0487L.a, section B2.11 "Mismatched
> memory attributes" discourage using mismatched attributes for
> aliases of the same location.
> 
> Given that there is nothing preventing the relocation since the region
> is already mapped, fix that by open-coding copy_from_paddr inside
> relocate_fdt, without mapping on the fixmap.
> 
> Fixes: 1bdc81dac816 ("arm: setup MM using information from the device tree")
Why Fixes tag? I don't see it as a bug and something we need to backport...

> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/setup.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index c1f2d1b89d43..b1fd4b44a2e1 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -237,14 +237,15 @@ void __init discard_initial_modules(void)
>  }
> 
>  /* Relocate the FDT in Xen heap */
> -static void * __init relocate_fdt(paddr_t dtb_paddr, size_t dtb_size)
> +static void * __init relocate_fdt(const void *dtb_vaddr, size_t dtb_size)
>  {
>      void *fdt = xmalloc_bytes(dtb_size);
> 
>      if ( !fdt )
>          panic("Unable to allocate memory for relocating the Device-Tree.\n");
> 
> -    copy_from_paddr(fdt, dtb_paddr, dtb_size);
> +    memcpy(fdt, dtb_vaddr, dtb_size);
> +    clean_dcache_va_range(dtb_vaddr, dtb_size);
The purpose of cleaning dcache after memcpy is to clean the new area i.e.
destination == fdt, not source region.

> 
>      return fdt;
>  }
> @@ -362,7 +363,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
>      if ( acpi_disabled )
>      {
>          printk("Booting using Device Tree\n");
> -        device_tree_flattened = relocate_fdt(fdt_paddr, fdt_size);
> +        device_tree_flattened = relocate_fdt(device_tree_flattened, fdt_size);
NIT: It can be just my PoV but it reads odd. Why can't relocate_fdt modify
device_tree_flattened pointer directly in the function?

>          dt_unflatten_host_device_tree();
>      }
>      else
> --
> 2.34.1
> 

~Michal


