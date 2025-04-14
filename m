Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B9A88629
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:01:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950564.1346840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LJO-0004Bd-F4; Mon, 14 Apr 2025 15:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950564.1346840; Mon, 14 Apr 2025 15:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4LJO-00048s-C2; Mon, 14 Apr 2025 15:01:26 +0000
Received: by outflank-mailman (input) for mailman id 950564;
 Mon, 14 Apr 2025 15:01:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m6tK=XA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1u4LJN-00048m-0I
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:01:25 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20606.outbound.protection.outlook.com
 [2a01:111:f403:200a::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53cff488-1941-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 17:01:23 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by MN6PR12MB8470.namprd12.prod.outlook.com (2603:10b6:208:46d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Mon, 14 Apr
 2025 15:01:11 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 15:01:10 +0000
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
X-Inumbo-ID: 53cff488-1941-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LLqqCA2vduWnFXtHCVS1+suG9zW48ukq3bCsTFd+o+V8ZgTkAQJR1BSu17bt8QClGw/MBW2cICgU3oErAdQRoloBtz1A38niZDO7iXjimy1a9v7DHvHATBlCZ3ZAbKLswDSMt//56EJ3dW1QWhcT6bu21NsQgl1QYulf0hUDN5/K8hUEgV1KHTfSadL7Y+RciDHP1bArGga+86RJgj5slLejfapB79E6KBp8myTcPai4TeMHxRRzzk8FqrwvyY3+L6bOOL6GLm09C4WNncPQSSk+ZZAlhabHx3jDQdcxR1aUIhOOrK/mUDNzhkTIY9pz049YBCSa/itKkRnl+UQ3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30Gw0EOu8RcewQf3B3k1hxG965TJxUvi9TbFYyyZxl4=;
 b=ac4rQTAvEOW4LeacAWsxqxPf8hXCHezZ7oGhHlJ+Vns0BEAeKQgVSQSYsOCSA+C5eQvRcgpnpLwVIubHctZU7cA7+NM8Tw3sPyTW3pBLzESb0wlzfyMNjyJSJqOGYbFHHBYCALD02aUBGkMK7eTBcFAeFRFwZeaAAwRuxN/CZPRTZl/kS+G5KC6oiI6umnkCT2Vdnow3VJaW95CBoGO8zZS+ug4Oj6xlRnGvlfZJD5yKFxDKWx8J0KpDnCp/wvtqkcoNVyHrh6ktUmTT3UXqRTnFU92UxHe1OBmM0JHAxc/+XFmF8EDftwAL7Wxq80Lp+b2Lr1DfLsrQR6JUPN+J/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30Gw0EOu8RcewQf3B3k1hxG965TJxUvi9TbFYyyZxl4=;
 b=O63cwa53kHohPHNgIP8Hji4N7GGAOMwENvN3amzDN8wgPmJqhRjKZy5XOOKwju7gDRLkcTxyZJ2AXtlKx0A76zU+/YMnzzQ1kEc4VD78c0FUdRyGNowo7Tz4rFLOIhEi66xf86yvzASZrmFBjKe6IS00KGWG5bAfxmU1wgg8JU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <d85090b5-43f4-41dd-a423-ada90d572001@amd.com>
Date: Mon, 14 Apr 2025 17:01:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] arm/mpu: Introduce MPU memory region map structure
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-2-luca.fancellu@arm.com>
 <d323425d-b266-49d6-95d4-0e1acb5e489e@amd.com>
 <FCB86533-FFE9-4A79-AC8F-E2DBA2B1F553@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <FCB86533-FFE9-4A79-AC8F-E2DBA2B1F553@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::17) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|MN6PR12MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd14393-8387-4464-612c-08dd7b65315c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1pNNGllR2d3N1BiUnRkMms1b0gzY2Nla3c5NFZMbSs5REUwcURVb3BkR3c5?=
 =?utf-8?B?UHJPaG1hOCtBK2lseXUyT0QxVHRwd0FTbGNOSHZsVW4rWFEvK08wSmRvd0c1?=
 =?utf-8?B?RHMzSHBtZ2lxc1lKQlMrWEQ2MCt1MC9kZzI2aFhmTlJpMHppUlFpVWloMHR0?=
 =?utf-8?B?UmVQT0Y5dkVPYWxYMFZDOTh3SGFSQSsxQjBUeHZNYTVZTDB1anJlZitSaUta?=
 =?utf-8?B?eVNnOVJuU09JZnZOMk9PaCtZY3pkOG5ydDBkZk9MNC92RFdGT05RSUdMMWgx?=
 =?utf-8?B?NzB4bzZhTnRaQWx0SU9DY0Q4UzBRc3Q1MFdCTlBGK3VlUGJCWFdEM1RBNTIz?=
 =?utf-8?B?WEV6ZUVMb1dEMWxPUG5qaFNyeXZwME9aK3czclBMY3JoaEQrL1hpUjg4VTBl?=
 =?utf-8?B?VjBRNlF0eHhPckJlSUhhOTQyV3lFT3FjSGRLdVdIZDZMaVN2L1pOWE9HMkZn?=
 =?utf-8?B?NkQ5TFBrK09wSXdXakZEdDY5QzZ4ZFY0QTRvN3llSTFjT1A1VkRoeHBvYWRW?=
 =?utf-8?B?a3BqcEkrdlMySDlKVm4zeURLUzNCdmZwcFY5dGJhR1l2VWVNVVEwWlVYYTN0?=
 =?utf-8?B?VUJDR0pRRXZvY3dJekVpK25NSmJjR1VMOTljQ2kvaDErbXN5UTd5bm1CQmZl?=
 =?utf-8?B?ckE5MkJpUWZrdGdROFhESzgrUTRyL25aMTI2WjJDQnkzOGJTZS9ibWVKU2p2?=
 =?utf-8?B?cm55b1dWME0rREFSZlpqTlpPUzArbjUrR2FHSzZ5ZFN6eXN1dWF2ZFp2R1RW?=
 =?utf-8?B?QmU4a1JXNGRtT1FJdWtwMmUvclRYbnYrRDM1emFIek56KzdmTWFFeDRmSUZs?=
 =?utf-8?B?NW4xTGtBMS91WWVwa2dWYmx4RjNvYXdpdFBOZGdlcVJrYlZrblRPczJWMHhh?=
 =?utf-8?B?RWwrdXQrWWxJMjBSQWVHSkV6dmhQZUJlU042aFo4M1ljaVZ4Vmx6aTVQdGVJ?=
 =?utf-8?B?dFBJNGk2eGZGSlFURjZQWE1xbnhZQndsb2pUZ2FUc1hyOGdHSzNnSjBHeHVM?=
 =?utf-8?B?WFBGU2NzRXl6bTNUVnR0Z3BLR1M4ODByRjNNN2RVOWo0YWxiTGlRZzhEMEQ2?=
 =?utf-8?B?VGJpckJkQk11dEhnZGczc3llZlBmTGhZdjZqeFNuZ3pMZmV1OXRYMjZ5VGVw?=
 =?utf-8?B?LzZMc3pQMzhkR2hIYzlHYlJuK1E1VG5NNlNwd2pGZm0wVWF0QU51Zy9UdmRs?=
 =?utf-8?B?RlV4YUtySGRwYUoyRGNWbHIyOFZnVUpvRU82Mi8vWllYcU56WWtSL1UvSnhv?=
 =?utf-8?B?ajN5MkNDbzZlMWFvRmtNanRQS25RZXoxNEgxZU96a3hONWNMNXZ5VWNaL01a?=
 =?utf-8?B?enZtQ010MlRaa0NzMUg2NDZTSVh3K09jOUF6T29NMzlJU2x1aXBobzhCL2s5?=
 =?utf-8?B?MjBYUXY1VmxmNGRYRXpMcHVjTDJaRW5OR3NxOGhPais0UitDdk45TXVzR3pZ?=
 =?utf-8?B?UkZldVBQcldpSlpmYzhxaityNVBZbjlkLzBsN3F1clJXc3ByUmIxRHFGNVRj?=
 =?utf-8?B?VHdQVDNTNEFETFRhMDhuQlBBMVcyTndpdEVWbGRUTHVaVnFJUmZzRloveDk1?=
 =?utf-8?B?OU80cG9BamZBbzJqQVlwNCtRVCtEWS9Hc2tFU2VVSkRVMUY4YmIzSUFHd3Rz?=
 =?utf-8?B?WEVGdWNwRHVPbHo3bWF5MG1UeG1Xdlp1bVJ1S0FodmNFUlBaQTBHZ2tBbVZp?=
 =?utf-8?B?UWpOaEs2VFRjRmJBSXR5Z1JSRzhHSURLanhMaVlPc3RGNWZNR1g3SXlvRTdP?=
 =?utf-8?B?a1hDOXRReCsyVDhxcHE0UVFmYVMrSHRvVVRCUlZMN2t5cUJ2YTdnNEpaWlRZ?=
 =?utf-8?B?MTRsWXNmUkdYdVc3cExNR2U3M01ZTmVVRnptSkNZcGFYYmhHQm9odWhqZGtp?=
 =?utf-8?B?UTlZdCt1TkczUG1wT3N2c3QrUlppTzVUN3hFNkh1WkV2NmRrckVwWEo1b3ZO?=
 =?utf-8?Q?+8TVY1/GTpE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWhUUlpyS2RqN0Q3dnZPanNoaGFxeUdMck10cU9Cbkh0QXRSRHRMc1VkS2JQ?=
 =?utf-8?B?dmhycHNiMGRuZUhZSml0WGxkb1FqYTRiUndPNDR0U25WNzEwSFlBWjBNSDZG?=
 =?utf-8?B?TTMzcXVTL055VGlSYjBNc0daUWk4c05PWTcrMkxnTytDNThNcmZNb3QrWWRl?=
 =?utf-8?B?bmoybTY3Z0c5cVBFZ254eDlPUG52MkdYVXNqWUdsQ3dMVU4rZEZTUDhFVEtG?=
 =?utf-8?B?ZSt6cW51QjMvQ2JFV3lvNEcwS0lBRUVMZHdxdmtxam5JQmYyQ1NjbW9PNHVX?=
 =?utf-8?B?NXNqY2hPOVNsWTZadUJ4UVR6VlpjZ3MzQXQwOFc0ZGpGcDRhc1FyYU53UzFU?=
 =?utf-8?B?UUpKUVJvQ1dKdlVpUjZCZDhqd2VTUk13NmJJZTkzcGhOWHhjZVNkOTdPVitC?=
 =?utf-8?B?eWJOOHlDc2dTRGVZVytCMzBmZjN5aVFxckNHSHRrb210V0FrVVJ4ekZ1YVJq?=
 =?utf-8?B?N09WNk5wMXc2K0RIZHBVcGZHSTJiNXBBL1o2VHF3R0R1TUNJVE9NTHVJYlRh?=
 =?utf-8?B?enlRY2dLOHd2QnFJbTRNRVJVZFFOOVRUcEpPSmxURi9yMkcxVmFUU3VDMjRB?=
 =?utf-8?B?a0NXbEVlUEVhWDF4aFNQN0QwMVlzVVQwTHV2Z2tOUWh5Z05vbjNyUDF2UlFN?=
 =?utf-8?B?VWxXVjlGRUpCUlovMS9XVml3N2hNaWRWOWdhVE9aUFBoT0JoTjVSMEFvTGlm?=
 =?utf-8?B?NDl2dmNjUlZCYktJaFlUQmJISGJNT29xazNYVDYvTVh6YW9PZldQYlAzaXA4?=
 =?utf-8?B?OE54ZE44S2NRV3dIWXBpcUtVWVZCSis4aERyLytpejFKV1NabWZsTkg3dDZM?=
 =?utf-8?B?NTM4N3FzKzQ1cVpOOHI5TjdJSUw1K0d4c0QxR29UamFKdU1GU0xreFVHYTN6?=
 =?utf-8?B?WEhUWG5EMVJ3WngwVXhubStuRU1PSHpvYThiRWs4NEdCcFFMRHE0Qk9PTDN5?=
 =?utf-8?B?TjZYK2owTkVuMEdSaXhaSVFFa3ZuSStVZHlPM0NIUHdoTEpJRkErZEFVSXNK?=
 =?utf-8?B?aFhJSDlRZUE3cmNiZnUzSnhmcjZUYXdaUzMvNnNjRWxmYWJxQ3pBZ3Y0UEpE?=
 =?utf-8?B?OVZXNThwUVB3ZEgrQWp1Y1Y4ZTFOL0xZcWhZRko4eEZWNkROWWgyREQ0aVlO?=
 =?utf-8?B?d0k3NTFjSm5mTlhHdmhjLzFLYlFub3FkR0hyNTM2VDNzc1VWRno4RUQ5WTRK?=
 =?utf-8?B?Mi96NVBOK2svVnBIZWlMWEt4elYwUjh3allHZHduMEIwWU04VlRkNGc2WFF4?=
 =?utf-8?B?Mkk5amtxU1JUbnhZM3VxSDdEN042Qy9ldXF4dlcwbFFtd01PVTYzMzZaeTFC?=
 =?utf-8?B?TzJYa0doNXpBTjFTMWF2Q2dVV0FJU3dLSnZzVTFmRG44U3YzSkQ4ejhaanBp?=
 =?utf-8?B?Nk9zQitlWlJLY1pQOUt0T3RtUEJ0TEFROVBuTlFobWs4Y21uS2pZdDRhVDdW?=
 =?utf-8?B?SUJKM0VEQXcxb1M3N1hud04zaUJpRS8rOHBiUUh3QTFPeVh6TEpIT2dHQmJh?=
 =?utf-8?B?dXlLcWJqWHFxWXp6emxmczhlTHRBQ2ZQYmNxMlpQVC9mcndsLzBTVTBiQmZo?=
 =?utf-8?B?WnovbjVFdXVNSm5nbjhSUkVGOXB2Zlk1azNCQmJQM1JTVm93cVV3RXpDemNB?=
 =?utf-8?B?VTY4NlNmdFVLWnB5R1RqRVlPNk43VGF4d1ZhcUFnaUJ0OGd4cWRpRVZlUDdk?=
 =?utf-8?B?TWI1NEZnbGxodGZRUHpvRFFncUM5MzkyYUc5Mld3RkFXYXJVZ3ZlOFg2THVh?=
 =?utf-8?B?a1JGQ1p0dGJKVkFFSGlUYVpLMGE4TDlZZEZEN2E3ZHpMVWdSd3BUUjJSb0cz?=
 =?utf-8?B?TytGK2xvazJMVlpoL2xYQm1keWNtMVhncHg5VFd5QVNIU2dWUzNjRFBzaUxW?=
 =?utf-8?B?dWNxQWFLRXc3YXBQU3hIVW5vT3NZMnRibCtKYm5zaWlMWkVpWWl3QnhwVC9p?=
 =?utf-8?B?QU9RZkVUYXdHVkM3MmFjQzZBSWY5N2JiK3ErbkFsTnVJeDBpYnQ4UEI5UGdu?=
 =?utf-8?B?dU1LUEJCaW1za1doVWl3d05rUmtLa1RRRVpBTjhjUVhmc29BMEYrRyswK2NZ?=
 =?utf-8?B?eWZvUW5Da2ozM29Ud0NkaExaT05nTTZyTWhBVmRBdm5ULy9NdzdkSW1BR1lj?=
 =?utf-8?Q?VnbWKLfcfJUWyXBww3fIWGwVj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd14393-8387-4464-612c-08dd7b65315c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 15:01:10.8768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzuMtSD0skvLM2NtEl29DQyY8bW//DnkIaAV2eYoKmCZ/wYkAPDA+k0Xyar1cSl7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8470



On 14/04/2025 16:50, Luca Fancellu wrote:
> Hi Michal,
> 
>> On 14 Apr 2025, at 11:17, Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 11/04/2025 16:56, Luca Fancellu wrote:
>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>
>>> Introduce pr_t typedef which is a structure having the prbar
>>> and prlar members, each being structured as the registers of
>>> the aarch64 armv8-r architecture.
>>>
>>> Introduce the array 'xen_mpumap' that will store a view of
>>> the content of the MPU regions.
>>>
>>> Introduce MAX_MPU_REGIONS macro that uses the value of
>>> NUM_MPU_REGIONS_MASK just for clarity, because using the
>>> latter as number of elements of the xen_mpumap array might
>>> be misleading.
>> What should be the size of this array? I thought NUM_MPU_REGIONS indicates how
>> many regions there can be (i.e. 256) and this should be the size. Yet you use
>> MASK for size which is odd.
> 
> So the maximum number of regions for aarch64 armv8-r are 255, MPUIR_EL2.REGION is an
> 8 bit field advertising the number of region supported.
So there can be max 255 regions. Ok.

> 
> Is it better if I use just the below?
> 
> #define MAX_MPU_REGIONS 255
If there are 255 regions, what NUM_MPU_REGIONS macro is for which stores 256?
These two macros confuse me. Or is it that by your macro you want to denote the
max region number? In that case, the macro should be named MAX_MPU_REGION_NR or
alike.

> 
>>
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> xen/arch/arm/include/asm/arm64/mpu.h | 44 ++++++++++++++++++++++++++++
>>> xen/arch/arm/include/asm/mpu.h       |  5 ++++
>>> xen/arch/arm/mpu/mm.c                |  4 +++
>>> 3 files changed, 53 insertions(+)
>>> create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
>>>
>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
>>> new file mode 100644
>>> index 000000000000..4d2bd7d7877f
>>> --- /dev/null
>>> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
>>> @@ -0,0 +1,44 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * mpu.h: Arm Memory Protection Unit definitions for aarch64.
>> NIT: Do we really see the benefit in having such generic comments? What if you
>> add a prototype of some function here. Will it fit into a definition scope?
> 
> I can remove the comment, but I would say that if I put some function prototype here
> it should be related to arm64, being this file under arm64.
Sorry, I don't see why you mention arm64 here. It is under arm64 directory, so
it's clear. I was referring to the word "definition".

~Michal


