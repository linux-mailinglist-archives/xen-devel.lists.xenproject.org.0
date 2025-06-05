Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A048ACF1D8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 16:28:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006960.1386223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBZR-0004Wf-AM; Thu, 05 Jun 2025 14:27:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006960.1386223; Thu, 05 Jun 2025 14:27:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNBZR-0004VD-6M; Thu, 05 Jun 2025 14:27:53 +0000
Received: by outflank-mailman (input) for mailman id 1006960;
 Thu, 05 Jun 2025 14:27:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VsQq=YU=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uNBZP-0004V7-C0
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 14:27:51 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2414::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4087ad56-4219-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 16:27:48 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA0PR12MB7577.namprd12.prod.outlook.com (2603:10b6:208:43e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 14:27:44 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8792.035; Thu, 5 Jun 2025
 14:27:44 +0000
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
X-Inumbo-ID: 4087ad56-4219-11f0-a300-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cm7+fef0sNWc/TWNS5XfXRNQ/eLZ5I/qCYAWvX9aNGELRF3TZTI615IF6aFhMzG7p66laEnHNUwNyYJivI/RVBt4pJbRTaPYzE5eTSnd7UXwq37aRGzdy6Qp6JyBPknoJiicn09B1UUlNdT/f7/PT8PPzyFx33omO8VMA8f1pkVIGJyBmTFPS8ADfR3rDonjunwebbEfsiFhNsGp0hLpWGDy9spkHuhDimGfcEl5ZSkt5jq0JHEp23k+6ZHjt82rGTgxP2okZ+YLfjQ8pdNfywgphjccrayYoXE4xjabSG5IUHYQ0brSy/eUxj5HY+vyNFlPBwJrxF1F/4Pacf1IVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHooqomRs93lb8qYsexZdpkQ3AHpuxhKmbs61F9u2CM=;
 b=vOJmodazRg545qyeI0ED3WlwmecgFoZe5d/df5CBEu9vTAAOGgebdAmejFtv3ck7sU/zI+/guF/nBDsff1LapjNf58i7i1XS2IyudPAtz+9au8P9n+x9mPy6ajrIWrkXusbOiuZnn7mL21rdr6nYOtu6rZUo6ZqR/zbN3lHpK+B7XRx6fj4O6EEBkb/B6ei4Jlahur2wBEwVgwgZdKMZpxklK+ZhBTDfaPTNSdld2sDKXW9KdV8ImV6sDYTgKfHibfTG7rZZjywZ89hBWDVT1YLVcB4BYs5vnZ7c++iNSBWUCrAQoSi/ml0ioAYlnFOqaP7AU78wFGSgelSDDTLzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHooqomRs93lb8qYsexZdpkQ3AHpuxhKmbs61F9u2CM=;
 b=dMm4qPUXMvYW7EHJlnRH+jxNzVc5539PcCfesEKe8KJIYLOcVP7Ev80DaiLoo448vvMwzdB02eJ3wcJW4rU8/biPvSua9Ds3GmCnE5dOcFsIfLO/uZ72Pp5GgIHDvkPqYVawlLvpu347LUauAS2ze/xdQF1W2GdaX4cZhRLmRzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <fbfc728a-0d31-4f28-9a06-5f6458b91a55@amd.com>
Date: Thu, 5 Jun 2025 15:27:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] arm/mpu: Provide and populate MPU C data
 structures
Content-Language: en-GB
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250604174311.754899-1-ayan.kumar.halder@amd.com>
 <20250604174311.754899-3-ayan.kumar.halder@amd.com>
 <50c8e74e-95f6-4cea-b979-8b81d7575a21@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <50c8e74e-95f6-4cea-b979-8b81d7575a21@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P193CA0082.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::23) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA0PR12MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a1595d-a577-471e-6fe1-08dda43d228d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dExLb3orWEtneit5T0pET2ZzUzFsbkxWQ1hGYklkdGc3WlZtYjM5eHpPVVdB?=
 =?utf-8?B?MXhuSzNqZWk4M0JycENCT2ZDVkEyalE2bXJaSU1heGJnWHRyQXZIUWtDYkZH?=
 =?utf-8?B?TFdEcUdjRENkNkxIRmN6UHRxVXpFWXR1NG93Wmt2TFFyUFo0NzRXakVOd2tz?=
 =?utf-8?B?N1JIOVYrckRWSUFDeE1zaUpJTjI0SXc0alkrQUxodW9BNTI2ZjJIOCt4K2dT?=
 =?utf-8?B?RnVOSVZKWUd3MFZNQVVxRVR2ZENHMUNsU3VxMk11VVhFOXhSaFFIWkNsbVR0?=
 =?utf-8?B?QW80VHFJRFgvSEMyamxwdE1SdzFSRFRtSm5oSlM0aDZJSlF1SG9zU0YvYUNG?=
 =?utf-8?B?STcwQVNyM2dzSE5QK0VqYUswcmJ0TGZPNCtWL0MzaUlrMGp2ZzhpdnpNd2pN?=
 =?utf-8?B?S1V2eWxxeE9WNWN3MmxFVkRXclYybmVTUXhYbHM1a01mWGUwQjdyTG1RK1JL?=
 =?utf-8?B?djF5eDlpOURjMytMM2ZnS1BGdjg3UXpzZVd0cVJkaWxVYmhkYTR4aGRIRzJT?=
 =?utf-8?B?OXBBSHMrSDRpNmUyTUNXQnhQUEhtSCtkNFFaL21LNVFMNG1uaWI4RU9yR3Zx?=
 =?utf-8?B?RE1WazJmYnQzYjNKZmoxVXhUWXNzbnMxanVFeWZrbnZ2cUNGeXZsM1hQVktv?=
 =?utf-8?B?ZzVXVFM4S2NJY1pwNWFtRjA2RnNOcGF3bndIY3JMWXBYYitDa0ZSWkFuZlNj?=
 =?utf-8?B?U0FwM0Z3ejZMRDVJWFdtNlp6M1V4VXlzMW51MXRuWlM2S1hlVEJodmd5VFQ1?=
 =?utf-8?B?bjhuZ2tRQlJyOG91SnVYVDhNQitHR3dKdGJXVmlSYW52Q3JHYkxlMW50aVlL?=
 =?utf-8?B?Zy8wM0JNOHpXbnFsZm1PQjNzOXFQekVGMjVma0ZoVlN6UlRDTi84YVFPaUR5?=
 =?utf-8?B?OUEwd3lpSmdMU2pseGNkVHNSTngyYmNMOWV0VUtBR00vSFdWTElqa050TmFS?=
 =?utf-8?B?R2l4a29kNlhNMFZqMkpqWmp2cHdkRGJiK0xkUDhUQUlVV3MybndrN3VlNko0?=
 =?utf-8?B?Sk56cUlrUUdwL3VEUkJGWVU0dDBQMThJQlIzNUthRnJLNFZuRVVjdFBwZEJC?=
 =?utf-8?B?citrSldLK3BNRms3Q0lDNXdaTml1M1FWeEVGY0ZJWXQ5MzJmUCs1c2Fybllo?=
 =?utf-8?B?emp4a2ZsK3dJUFc4amJvdnlCdVk1UmMveHYwYU9JOEMzMjUzcFAxbEd5d1VI?=
 =?utf-8?B?RlU0OTRRYmJjbzJtbi9QV2Q2UThWSmxrK2I5RW5rMDJtVXVyWU9PMmxpOEdM?=
 =?utf-8?B?Mzg4MXIzNXJRMExqdldmR2JWTTlsVnR5MFJXdWNnWGNmTmZBSDE3c3BCZGdC?=
 =?utf-8?B?VThlbFNIQzZIZlBXelpQbUZwL25tSE5OZ2MwSU0xNVdjL1RlYnlBc2tDdjVP?=
 =?utf-8?B?N0VoTTExWnJXWXlaM2szME5sMWZkQ1RBTldVd25Ia2ZDOUNuVnR2T3VKVjdj?=
 =?utf-8?B?d1BzL3F2YUY0MDladm9MdkxsUFlENko0OGk5SkNuZUc5MjNMeUFTZTBSWlRv?=
 =?utf-8?B?a2JOTVNZa2wwRzM3b1l1dzlrc3dXQ2dwVkxwcWx0Q3V6aUhDa1Z5elg0TDZy?=
 =?utf-8?B?citSbU5sVWI0OFRPUEpvRG12QnV3VTRXT1g0UVE4L3Yzd1RYZDAyYmtsRkNO?=
 =?utf-8?B?aWJ5T3l4bDVvSk4wN2liR1dtRzU5NXZKRW45NGs1WEN3a3JPa01GbTd1Umdv?=
 =?utf-8?B?Z0pvTllzM05HTFFVZlBCT1A5Q3lBQUFDS3oyU0pRNFNmYjRKV2dnSG9BSDJw?=
 =?utf-8?B?WnRMclJBYStyYzNod3lMUDJGdzBtWHNpMDJJN3J3ZDArckFoODkxT0ZIL3Bi?=
 =?utf-8?B?WENaUFJFczBTQzZoNzV4QkxvVWNlRWVtOHA1S1ZWVlBSQnBhY2NUZVcxOGRj?=
 =?utf-8?B?YThCc1VYSldFVzBBMHdBT1RSTGt1ekhPdGJVZnJ6MmgxTjRZTjNNUlB1SEVq?=
 =?utf-8?Q?1N72yB7xJXg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3BZdGFZZkZyZVVJeGpPOXRVNHNIdXVINEMxRVI3REJyUlUxRmVtY2dYdTd5?=
 =?utf-8?B?U21WakpJL1RHWFNwUTVBN3E1Uk1ITDhWYkFZN3l5RWttQ29JVUFTRDVLQXJn?=
 =?utf-8?B?ckVTWHNvbG1rM3dQZ0NuV1FXalU4OXBWMjJxZDlFbDBKMTh4K3hhMUExYTlL?=
 =?utf-8?B?aGtUVW45Mis3RXJqalc4Yk4xYVR2L3p2MXlpOU91NXFJaGlHUWY0bmJNemJz?=
 =?utf-8?B?aXNyVkYwdE9xTmZaak8zZ3RrQ1FqeFEwN2FyZGlJTzRQQUlRQ2YyZlZrdW11?=
 =?utf-8?B?R2h4K2tGZ05LWUxUQVpyTDJYNGhrendFblBQYThYYi9PUmRZOTNMSFErL3pJ?=
 =?utf-8?B?bFlQR1ZFSXdvRVdIZmpYK0hyb01EQkJ3M1RQUmpDaURtekRlRFovU1FYZ2lB?=
 =?utf-8?B?OGpuVlF6cGhBUTlYSFFhVytGRnFrMjBrRy9mdVFaOVV4ZWwwenN0OHlwOGQy?=
 =?utf-8?B?UDFWN1UxZHBYZDlNZFFuS3BodFNtYncrcjU4aU9YVEw3QkNKb2xDVmpzUWxL?=
 =?utf-8?B?VWExbFF5RUxMZ2d5OUptNVpQYW9wemxUbk10ODgyRTVsKzBmVTlvSFhjQ2c5?=
 =?utf-8?B?YTRpVkg0WEJOd1RiM2c1Znl3NG1QYjQ1aENlMmRzQW9laHhWOXNxODBBTWV6?=
 =?utf-8?B?em9GYk9HVUlLc0x5bnJtRXFadDJhcjVPYTkzM1ZDcXBJcElDYjhJUVUrYjdD?=
 =?utf-8?B?YU5wRS8yaVBNRlNIWnY4aU1zTzZsWTIra250SHBPblNOMTZGUmxYTmFQbTZI?=
 =?utf-8?B?WXE5UjJKTFllMlUyK00zOHBPaVFzcW16ZS9NVVRWMkdwODJzWm05WmUzTXpk?=
 =?utf-8?B?ekwzQ2pWUDJHcGI4L1U0WEp4ZTlRVkxOVWdTSzRhdGtFcmFqVnZWd2RqNXdX?=
 =?utf-8?B?Uk53VFRud3d1M2Q1VFdGRnhUeXdJU0xVbVFuNkIvKzdhTEY5QmlsL2x2byt5?=
 =?utf-8?B?blBWTEt0dVBiY3hpYU9obEhOWmhWV0plcGRSdHozZjF6cUx2Y3FXeUtZaFg4?=
 =?utf-8?B?YnlzSVgwcTl6a281VVdXNTc1MDIyN01kVm9nVjZYeGI3NmRLUkEraHRNZWN0?=
 =?utf-8?B?bktwZHJDMStLeU8zWTFhd2dWbENLdzM4MDk1bElPZXZpRnRJRUJQNXBtNGl0?=
 =?utf-8?B?eXcxSmluTUQwTDBsWmR1NGFmZ204SmNicGZHdVJGYWt2OUVJb0hlVGFqbytr?=
 =?utf-8?B?UGU5a0cvV2FiVXlLYWFUWW9wRHgvblU5Ukl0aXdkSHJpK0JtS1dWUlV3STFJ?=
 =?utf-8?B?WjVqdHJpbzAzTWN3SFJKWEF2cXcrcEEzOE5IcFp3QkFSSXJiOG5NaEsxZmJP?=
 =?utf-8?B?cXE3WjZVQmQ5V2VEek9VOUdMK1YxT2hNZ3hNVkNmVnFVVzM0Y25KWlBTajdE?=
 =?utf-8?B?RzY4V1g3TjNaelRlUldEditrZ0dKL2ZlN2F3VmFtdWQ2dDA2YVV5aksrTlhP?=
 =?utf-8?B?Ni9Qa25odmVGbVVGVlJMSVRqaGtqVyttSVFTM0tLYk4yU2h1RDI0VkhXT2dh?=
 =?utf-8?B?QnJNdFJLdERUaXdodzRLaDZBMGhmT2xvalpZWU1nUk1OaE1HM2ZFQUY0VGpT?=
 =?utf-8?B?ZWt0VTJrNmw4ZDROYlhvTVdleHVTM1FIODNWUWFHWDFCbkJ1ZS9Lc3VFcTBy?=
 =?utf-8?B?blBHK0dtRDJ5S3VKZGplQ0ZObUZCQkhZWkoxRmxSOGRkQzJWcVg4d3BZZTNp?=
 =?utf-8?B?ck1NUEdLYUF0WkxiRUp6ZDNkNTR6d1R1U0NGU0FCWnAxK0hvSTl3aTRsYks4?=
 =?utf-8?B?TkM2T1BqUDhIY0c5bUR4VzZNME5memYzRzlhSC9WVW5XYVFCVWl0S2puZ1lw?=
 =?utf-8?B?RG5lS2pmbzNsZFpMWjNHQ3JpVEVGeVd5OVc5NFVyb3F5MFRSZVV5aVA4S0lM?=
 =?utf-8?B?NXVzUjBValMyM29wa214RTdJWTNQNVpvb2d1MFpxdFRHa0ZGVXZhU1VLOXpG?=
 =?utf-8?B?d29zWHJMU0dvejRPRkRCYXFTR2djLzFLMko4TTZjNm15amFac2I3MzVjNFNz?=
 =?utf-8?B?QTBNNWtpSFVFTm5Fa254MWtaVlQwaXVjRitTZFM0dXV5d1hVcnEyNnN1Ujcy?=
 =?utf-8?B?SFVRcWpzQVJxRDQvRlRiTWZIb29haExBSVJwKy9wRXU3cVNLcHEwTlNaM0tF?=
 =?utf-8?Q?TT0wOzs0eNZmsMhDhddzurv9/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a1595d-a577-471e-6fe1-08dda43d228d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 14:27:43.9212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1BlExiwtuah+HOJNSp9P4dBdMaOJN/cuutHyJ767X+W4BLz33a3Rb+OE2JSgCVQ03vKVl/Ub/M8jRQmEQ5POw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7577

Hi Michal/Julien,

On 05/06/2025 08:44, Orzel, Michal wrote:
>
> On 04/06/2025 19:43, Ayan Kumar Halder wrote:
>> Do the arm32 equivalent initialization for commit id ca5df936c4.
> This is not a good commit msg.
> Also, we somewhat require passing 12 char long IDs.

Modify Arm32 assembly boot code to reset any unused MPU region, 
initialise 'max_mpu_regions' with the number of supported MPU regions 
and set/clear the bitmap 'xen_mpumap_mask' used to track the enabled 
regions.

Use the macro definition for "dcache_line_size" from linux.

Does ^^^ read fine ?

>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/arm32/asm-offsets.c         |  6 +++
>>   xen/arch/arm/arm32/mpu/head.S            | 57 ++++++++++++++++++++++++
>>   xen/arch/arm/include/asm/mpu/regions.inc |  8 +++-
>>   3 files changed, 70 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
>> index 8bbb0f938e..c203ce269d 100644
>> --- a/xen/arch/arm/arm32/asm-offsets.c
>> +++ b/xen/arch/arm/arm32/asm-offsets.c
>> @@ -75,6 +75,12 @@ void __dummy__(void)
>>   
>>      OFFSET(INITINFO_stack, struct init_info, stack);
>>      BLANK();
>> +
>> +#ifdef CONFIG_MPU
>> +   DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
>> +   DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
>> +   BLANK();
>> +#endif
>>   }
>>   
>>   /*
>> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
>> index b2c5245e51..1f9eec6e68 100644
>> --- a/xen/arch/arm/arm32/mpu/head.S
>> +++ b/xen/arch/arm/arm32/mpu/head.S
>> @@ -10,6 +10,38 @@
>>   #include <asm/mpu/regions.inc>
>>   #include <asm/page.h>
>>   
>> +/*
>> + * dcache_line_size - get the minimum D-cache line size from the CTR register.
>> + */
> I do think we should have a cache.S file to store cache related ops just like
> for Arm64.
ok, I will introduce a new file.
> Also, no need for multiline comment.
ack.
>
>> +    .macro  dcache_line_size, reg, tmp1, tmp2
> I would prefer to use the macro from Linux that uses one temporary register
/*
  * dcache_line_size - get the minimum D-cache line size from the CTR 
register
  * on ARMv7.
  */
     .macro  dcache_line_size, reg, tmp
     mrc p15, 0, \tmp, c0, c0, 1     /* read ctr */
     lsr \tmp, \tmp, #16
     and \tmp, \tmp, #0xf             /* cache line size encoding */
     mov \reg, #4                          /* bytes per word */
     mov \reg, \reg, lsl \tmp         /* actual cache line size */
     .endm

>
>> +    mrc CP32(\reg, CTR)           // read CTR
> NIT: wrong comment style + wrong alignment
yes, I should use /* ... */
>
>> +    ubfx   \tmp1, \reg, #16, #4   // Extract DminLine (bits 19:16) into tmp1
>> +    mov    \tmp2, #1
>> +    lsl    \tmp2, \tmp2, \tmp1    // tmp2 = 2^DminLine
>> +    lsl    \tmp2, \tmp2, #2       // tmp2 = 4 * 2^DminLine = cache line size in bytes
>> +    .endm
>> +
>> +/*
>> + * __invalidate_dcache_area(addr, size)
>> + *
>> + * Ensure that the data held in the cache for the buffer is invalidated.
>> + *
>> + * - addr - start address of the buffer
>> + * - size - size of the buffer
>> + */
>> +FUNC(__invalidate_dcache_area)
>> +    dcache_line_size r2, r3, r4
>> +    add   r1, r0, r1
>> +    sub   r4, r2, #1
>> +    bic   r0, r0, r4
>> +1:  mcr   CP32(r0, DCIMVAC)     /* invalidate D line / unified line */
>> +    add   r0, r0, r2
>> +    cmp   r0, r1
>> +    blo   1b
>> +    dsb   sy
>> +    ret
>> +END(__invalidate_dcache_area)
>> +
>>   /*
>>    * Set up the memory attribute type tables and enable EL2 MPU and data cache.
>>    * If the Background region is enabled, then the MPU uses the default memory
>> @@ -49,6 +81,10 @@ FUNC(enable_boot_cpu_mm)
>>       mrc   CP32(r5, MPUIR_EL2)
>>       and   r5, r5, #NUM_MPU_REGIONS_MASK
>>   
>> +    ldr   r0, =max_mpu_regions
> Why ldr and not mov_w?
mov_w   r0, max_mpu_regions
>
>> +    str   r5, [r0]
>> +    mcr   CP32(r0, DCIMVAC) /* Invalidate cache for max_mpu_regions addr */
>> +
>>       /* x0: region sel */
>>       mov   r0, #0
>>       /* Xen text section. */
>> @@ -83,6 +119,27 @@ FUNC(enable_boot_cpu_mm)
>>       prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>>   #endif
>>   
>> +zero_mpu:
>> +    /* Reset remaining MPU regions */
>> +    cmp   r0, r5
>> +    beq   out_zero_mpu
>> +    mov   r1, #0
>> +    mov   r2, #1
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prlar=REGION_DISABLED_PRLAR
>> +    b     zero_mpu
>> +
>> +out_zero_mpu:
>> +    /* Invalidate data cache for MPU data structures */
>> +    mov r5, lr
>> +    ldr r0, =xen_mpumap_mask
> Why not mov_w?
mov_w r0, xen_mpumap_mask
>
>> +    mov r1, #XEN_MPUMAP_MASK_sizeof
>> +    bl __invalidate_dcache_area
>> +
>> +    ldr r0, =xen_mpumap
>> +    mov r1, #XEN_MPUMAP_sizeof
>> +    bl __invalidate_dcache_area
>> +    mov lr, r5
>> +
>>       b    enable_mpu
>>   END(enable_boot_cpu_mm)
>>   
>> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
>> index 6b8c233e6c..943bcda346 100644
>> --- a/xen/arch/arm/include/asm/mpu/regions.inc
>> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
>> @@ -24,7 +24,13 @@
>>   #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>>   
>>   .macro store_pair reg1, reg2, dst
>> -    .word 0xe7f000f0                    /* unimplemented */
>> +    str \reg1, [\dst]
>> +    add \dst, \dst, #4
>> +    str \reg2, [\dst]
> AFAIR there is STM instruction to do the same
strd \reg1, \reg2, [\dst]
>
>> +.endm
>> +
>> +.macro invalidate_dcache_one reg
>> +    mcr CP32(\reg, DCIMVAC)
> Why? You don't seem to use this macro

oh, this can be removed.

- Ayan

>
>>   .endm
>>   
>>   #endif
> ~Michal
>

