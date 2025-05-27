Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1931AC492F
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 09:19:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997897.1378687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJoa6-0006fZ-Bx; Tue, 27 May 2025 07:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997897.1378687; Tue, 27 May 2025 07:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJoa6-0006e0-92; Tue, 27 May 2025 07:18:38 +0000
Received: by outflank-mailman (input) for mailman id 997897;
 Tue, 27 May 2025 07:18:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hp9=YL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uJoa5-0006dt-0Y
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 07:18:37 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [2a01:111:f403:200a::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca1da2da-3aca-11f0-b893-0df219b8e170;
 Tue, 27 May 2025 09:18:31 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Tue, 27 May
 2025 07:18:27 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 07:18:27 +0000
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
X-Inumbo-ID: ca1da2da-3aca-11f0-b893-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQufNGK64L57zpp5X0Y48pkZFeCN7CR6C44ew70Xfxkfq3vNX2axPWDt322IukTI/2pKX7RPyrU/30qfJ0js7YJh1t4mrvK6Xbbx2zN4hysp7JTeTyptZ4lJz/w1oVw7k8bxDFspziepNWOmSQbTPUytyR6xrDWGPxxHo/jHWeZLyECorBBDiS5OG2OXFXpdUBnsj69PlEm4mZxNiJLeRwyJdvLJ9d4oLGvlYuEW/Z+Xg9m+mSv/Q43vFWNsTR/2DI4EBgRQnktC5FIIZ2zoY8HusZd6KSDMMHYNL3cA3cZ605RXSc2GlMJevCD7LPtOhemvEgdg4Q+bxsLkEk3pAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5CxRwfMVLpvN9JfypqnMpIo1g/Jw7lYx0ffz23Z85nQ=;
 b=q37rEpBZS3Ks1QBloQK2LCvpiXPZCDKOZuyp567lP8JCcZK5vi/qzL49pBM9p9h9QrbEsOL7MMDvMxfN4oDDhy+R87uBOQnGCjE+Z1hCunBWom704tAvMm9MfDSY9eQy/Qi+sJV+Q9dDBWi/MthZVBZzGc80JDJlc4/xyYEh5Z/C28lU1WoCON1I44qPAYNzbAkgflYkdwISWP4696GLvs6x2ZVLg4eM4YYRtDyTLmpjl61PlUFWTWxVvMxbXLi55uX4PLtOYkMwNfjZBigraw9znitkx5Zjz8iIYL8+Brf8i4n3hV7JK4BVOGtbMA1l6JG1kuh3hwT0Y1wjkCF8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5CxRwfMVLpvN9JfypqnMpIo1g/Jw7lYx0ffz23Z85nQ=;
 b=LFlsCkJ5HidDBYmu3eCT7pt1fCeGM9U1gR1nxxsR15RZTN7AHWJ2IOU7DxLlX3uruEJAvaIjo0fxgbTb3PRKiz/kuMMnFhXu1I4O5z+gmJ/AQ2hIqipTLAEch/kZZhEVkVAt5EnxBBSHp3V8uScFwwWbMcCv1CVeog/o9VB6ISE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <e647b984-e854-4fb8-a68a-c5b78cbc51d2@amd.com>
Date: Tue, 27 May 2025 09:18:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] arm/mpu: Introduce utility functions for the pr_t
 type
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250523065406.3795420-1-luca.fancellu@arm.com>
 <20250523065406.3795420-6-luca.fancellu@arm.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250523065406.3795420-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1P189CA0010.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::23)
 To BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d63d06-2ecc-4472-2f5b-08dd9ceeacc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bzIrY0dqelNudkpKZVhPUVhIK3VaVVgyTENweTZSbmkxWE1yVjdnQncrUmJ0?=
 =?utf-8?B?cFVRcjNtdHdMMW04Umk1VVd5MnpZT00zNWNyYVhYeGR2QVduamtRYzE1OVJm?=
 =?utf-8?B?Vy9pWjlsRC9YU0tra25OMVh6UDZNVnNuaUQzSXprbW4vZVVkUEI2UFNJdzVN?=
 =?utf-8?B?bkxxak1IL2hLTnVjdjVEVHlsdXo2K05HYWN5NHNxOGdtYkpKY2lTVlpLaWxO?=
 =?utf-8?B?eHBxbW5VeTg0VEpQRlUyVmZXSUluMkNhTkNDQngrNi9KZytjQzNXRGlRTXRM?=
 =?utf-8?B?dUUyYmJKOGwvYWVESnpGV1Rvd01PT2Rld2NKQ2FWQUozaXBXY1BZa0NpQ3Zq?=
 =?utf-8?B?Nm5QMHk2UlBIMHBHeXB4RWMwbWY5ajlXOEsxT2ZLV0dXSXQyb2Jwb2tzWjdV?=
 =?utf-8?B?QURtdWtUYk1iL1Q3YTVJaDA0NXRtZDdZSnVualpFTjBQWUJkYlFnT0dVbnJI?=
 =?utf-8?B?bWI3MFBybStDbFJVNXczMm1FUGFxSDF6TjBvdmE5WUwrL3hORHBwb0dBRWZU?=
 =?utf-8?B?MGhReVZ3Q1dKMmdiR3lPL2ZHUFJVNWJoWngzYkpPdTdMUThDVGNBUlNDaHpB?=
 =?utf-8?B?b3BaWVhlbXY3YjlwajZLdFJBdzZTa0ErNEtzb1ZKOGlGLzZHYnhSMWNIL3VR?=
 =?utf-8?B?T2piM1dkM2hHZjZ5YlJTcEZINEZadFBid1lNTjZwaHY1em5TRHcwektpSEE5?=
 =?utf-8?B?U2ZUcnVySWFESkxMTmlFOFBHSnBEZWZxanNScDV4Z3N3VERZNjJ4TFA5N0JQ?=
 =?utf-8?B?b2Vad1VkNXo0QmRlM3grVFVadmVxM1pGNXRiZEVndzM5STc5R09EbGFnN0da?=
 =?utf-8?B?SFBwRlFzTWtyY2ZadE5BMHE2c1RWZndNNWpsRm9HQlFyeU5wSzN6STRjb1Yr?=
 =?utf-8?B?THl2eXZpRHhtYnJkL3FkZHUvV3MvWmtKN1EwWWNsWXptU2g5ZnpmbnM3QnF0?=
 =?utf-8?B?RWxPVk1tRFpKV1p5ZUU5U01JSVZEVkllL3FGQWNXWGErc2N5bVVlcStaVXRU?=
 =?utf-8?B?UzJEQ3VFSTdJdUR2VGh3NFBqcWpqemxnMzF2Sko5SGN2c05ZdkZlakhNN1oz?=
 =?utf-8?B?UlZBNlIybE16S1dvSXdOalp5WFFQNnQ3WkFGU2tta3pUTUQrdWdXdWtiL3Ay?=
 =?utf-8?B?VHYyQVZBb25xTUV1cm85Q3Ztb2RKYzAxVmdScjFWZ3IwaFByZUVFMkszVmxl?=
 =?utf-8?B?cnVWbGNUUjA3MjZKUTBvTzdBcGNIU04zOUpSbUJwc1hxZHdEdVR1UTJNTDcv?=
 =?utf-8?B?aVM0UWJuai9vVXVUb1BaQTl5dW0yZUxncmZaY2tpZWRHR2Yvamw0L3V3QlVu?=
 =?utf-8?B?c09DMkJPZk9zZC81N1hPVi9jd1VNSmZIeEZwY1dXV2hqNzFGcmNUT2Rncm9M?=
 =?utf-8?B?c1JqS2RRSURmbzEzQ1NHSHZiQ3ZkRFBCUGdZemRMV2NrdXBGY1dlYlpHNHg3?=
 =?utf-8?B?V0p2QjlUVWVrVHdKTUFCNWtiQXN6cy9kT2o2d2drSFpJRDlBZjRoRldFVFFp?=
 =?utf-8?B?cmQwOUg2b1QwaFN0SlI5a1VVSFZEVDk1d3FoZVR6MXJSR0pJT1BLaExnL05T?=
 =?utf-8?B?QjVqc0p3QjA3NlgvQUNwa01WeVZ0aDhheTJBWFc0QjI0Wi9WREJrczFmaDhP?=
 =?utf-8?B?VndjNTIzNVNzNWxON2xwSmtSRlVqVmNJeFBYZWtvMThCOXZzdnk2b1NCOXJk?=
 =?utf-8?B?a2RpL0k3Z3BSdWpEa09vYTNHYTk5T2NNUVdKMEJhQ0M2Yjh0T1lodzRPa1RZ?=
 =?utf-8?B?R0tGaUtuRzVlbFNmQ3A4dzdvRk03K0xuOGdrNE51bUFIUVZNSFIrbmQwWVJB?=
 =?utf-8?B?cDZRVUxiYkFPSkZFS1lsSmlYallQOGRMd3B2NkplY0xSeWJHOGNYKzNsTkFy?=
 =?utf-8?B?dU05a2JFV216UVMwckhURGozKytJZHlnK2h2Z2djWkhTQkk1MEswdFRHU2do?=
 =?utf-8?Q?tJjOAmp/05M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2hsK2IzdCtOdmxRcjZnNXhMSlhxV1NIVG1mL2JUa0tCbXNrcVpHV2V5Qld4?=
 =?utf-8?B?R0YzMDhYZ3loRVFuNGl2dHVHRW9KcURJS3ZFWFdDblR0djhRdktzZTRwNzUv?=
 =?utf-8?B?WTNpa3haZjBJRzY5VGpwYUtqNFppTXN0dVJiZnNLV251dlBoQjBvUGR4Uy9h?=
 =?utf-8?B?dXlybkxJVEk4aXY0NkNiUWoxK2FBUmxOaXJEb0NCTVJMQ3FKQWovd2RFZDVT?=
 =?utf-8?B?Y3VKcE5hOWs2UHdnSFhHMEtJTjhuRzd6Nlh0a2xpZW9RTE1PWXNGckNUc0dt?=
 =?utf-8?B?enU5NFNURUY3VWNabFBjY2NjOHhkVVRjaWp4UCtTaW9mbEF5T0xvNW1mVUJ5?=
 =?utf-8?B?dlZ6MUZNTWZ3MXZobU43VXI4cFpicnNWb2FOWjRFMU9kODhrNDNNK2k2Nmp5?=
 =?utf-8?B?MTI3UlgydXNnUlducU92bzVlTXBNL1pRaUppRUE3Z05OdmlpR1hvaWRXRExR?=
 =?utf-8?B?Rk54dDNSamlXVWJ2RWNmK05zeFBhOEl3anUyTzlsemkvS0pNU0ZTU0tUOG82?=
 =?utf-8?B?ZFlhWGt4d0pwWjdHOHJDcjB0K29zT1JUV1BOR3hjajF6QU9oV21EalZpYWRy?=
 =?utf-8?B?c3ROQVpWL0w1bUdONWFTcmRvOW5rbS9pTkQyVnA1OENFaUtrS2tCN1VXTXVL?=
 =?utf-8?B?d3U5Yi82V0MrdW5xVFlXMWF4dmRIUHZZVm5iRHQ3cjMvWFJMQ1lDd0dnM2ZW?=
 =?utf-8?B?WFhjZk1oY3gwRWw1eDhvcFVEYzVLZWdvY1Q5bVZTOUU5TUtlUm9TVGNVVzNu?=
 =?utf-8?B?R3dMUlBaUUI2VzFGa3dxQW5ta2lrVEt2NVN6cE9Nd2NWRFlvKy9EVGhVSzV1?=
 =?utf-8?B?UHArMWVGYlJtVkxEcVU3TVVLbFZYQ2FuZUpMK1VHTGxQRFBqcmZhYmJUU2Mw?=
 =?utf-8?B?eEx1MTRxbXhnMXJZS1ZCOEQ3UEM5bCs1NHljZG5qUHZHdUJ1TXhvOWVKeWpR?=
 =?utf-8?B?UzRpWUJSY3hBVlc3cmpicDJETllJVzk0c3ZsR0FpdVdFTmhndlpyeEQ4QU4v?=
 =?utf-8?B?ZkxxNkZBVTBkUkk4VC8wME9hMHVITWNhay9YMVZERmF2N2xOTXNCeU5hcXhQ?=
 =?utf-8?B?N2NhK2pMckVCS2d4b3B3bDFKRnpQM2ZoZGlrQmc4RjBZcmwzTG5YaklvT0Zy?=
 =?utf-8?B?T1NDZ2RtaGdYWmNidUprdzhKbEY0QktORHl5UW91REdtY0lCbm9oaG1keGxi?=
 =?utf-8?B?Qk9wWnpiRWp6Wlp1cFdKaS8wQndoamtjZHdLRythVVVYeFRycEpXQVowODFZ?=
 =?utf-8?B?QTVxTWdjeVIrVzVWQU9ycXBKc2tPM1JaMm0xSzlSM3hmZEpMdEp0TWk3SjJh?=
 =?utf-8?B?Zlc5cG0xM1dQRnFwQk96VlpVQ3hnblh6bXRQWnY4anlCVlZEZHprZFRlVmUw?=
 =?utf-8?B?ZVl1Y3ZJenk5NUlMN255MkNuRE5sbGcxMWdnNlZ2NEpJdmNKWnhmZ05KeGZk?=
 =?utf-8?B?d1JMekdWT3MzaytwZVUwd2RnbHlteWNmankwY2Z1Y0JVZ1pMaE1aeGV4eEp2?=
 =?utf-8?B?ZFpscjBNaGF3dzN0NU1PYzJ3a1N2NmVxMmkvS2tXdE8zMFk3ZjUrQm1HM3Fn?=
 =?utf-8?B?NnZjSXFlU0xRREVsZVdUVkJqUFcyMFloalhub0FEQUtvamRhZkdYV3dNNkFB?=
 =?utf-8?B?V1RMS3o3SUJMTzd0cjVrS1dMVzNJTjF5WldOT0JOdmpoeEZxWWd5b0ZoTXJa?=
 =?utf-8?B?cTFVa2FFak1oellFMUVsMkI2VVh0Vngvb3hycHM0Y1Uyb3YyMjJFN1l0cHZP?=
 =?utf-8?B?V0RLV1pvKys2RVJZMmZpUDJnblljZW9MWmVycmhmYVQ1Wm04SUFMbG1Nb1NH?=
 =?utf-8?B?VGJvc1JGc0VTWDhNS2lJRktGYzhydEpuWWlrZ1kvUnpFOVRvNHJkR1BiVmJN?=
 =?utf-8?B?UkkxcGtZN3hMWXRiTllZZjNNeUxMMzVwTkk5OERER0JYTm5QUVdsRE4rV0I4?=
 =?utf-8?B?Mi95T2U1R0lLaTBCd0luU05qSzN4dE02Q3pGQkFIRXUvWU9lK1NMRFU1RkVh?=
 =?utf-8?B?WHRSY3BvQjNYMnRnbzVsVHZJbVB3YjlhNUkwa2Z2cTFWNU9DVnF4TUhHandu?=
 =?utf-8?B?VUs5KzJ2QTJKODJaSS9jQm1zN2cyWnZGVHE2ODhTSE5lck0zNFR4bi9aMHhZ?=
 =?utf-8?Q?Knn51am08vdwNvwU+A8nf1Zad?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d63d06-2ecc-4472-2f5b-08dd9ceeacc5
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 07:18:27.3993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQGcwz5g0E3SVG3AsuZyNpqV7yw+6HhNDACEMOY6nJ/LXX9zCGl0Ur9dLnYWcKmh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950



On 23/05/2025 08:54, Luca Fancellu wrote:
> Introduce a few utility functions to manipulate and handle the
> pr_t type.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


