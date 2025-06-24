Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6F5AE6E08
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 20:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024020.1400080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU7x8-0005fz-3I; Tue, 24 Jun 2025 18:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024020.1400080; Tue, 24 Jun 2025 18:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU7x8-0005e2-0N; Tue, 24 Jun 2025 18:01:02 +0000
Received: by outflank-mailman (input) for mailman id 1024020;
 Tue, 24 Jun 2025 18:01:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NF0F=ZH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uU7x5-0005dw-Vb
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 18:01:00 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [2a01:111:f403:2417::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cedc599-5125-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 20:00:57 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 18:00:53 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.8857.022; Tue, 24 Jun 2025
 18:00:53 +0000
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
X-Inumbo-ID: 2cedc599-5125-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oamGGq0szH1oi4OunNTl9Zr9PCMc/9grSWAmkFEZsyiQdloN8YAqhd+UqwoSkO1UhLhoRkTlbv4/jz9TEEeYUeDxCfEJxbQLp7JlKimUS120hc53IJM31vALPSjsZNqH6wi6j+ZOsIXnTgj6sh4sIvVvIF8ntVNGDk/G2uSxJx6+BAx8jMJol696GWWYTRt2ECgqO+6icirynbmPygIwCI3qB6Tb4Ra4aJP4wUaiK3alOtE2ReJr7u68YUle3Z2Ok5nk6v9eIQrx7n/20fAO2pugut7rljKsVZSw8+7iW4v01/8zeetgOtTHXZfQbDsv8ygWmyV1C8vt29RmoY8kXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5wJo0L1SKWgKFZ51jXd3Jpj2o2N23/1Qjr2Vkfukbw=;
 b=L0KZAA16dhaq/Eg28Hwxk80MQubUVzxXKbkFI7zgh3UzpfsHnXDPcqiPBeVDSCZf9lKVE+2UMEf+W9A7Dh8mJuDXM88A+jXEbLnyvK6sKw71kNeqVZyhxCOdI76eTvhvWEzgrH0Ry1EYFXLMccxmGB8u8freMrYtzG3QyNE4xwp2iHo+W35pql5epUbsvThAH3CAiAFlXUa1Fy52A4XhLVtTAy7c2/WOtdO2nAN2lZ+am7BP6dZVVukQ9lYsopo6d3W0zthd7BYOM5xeMsTJHkJcRgOzz8w6hja50Ove40pLsR+0WXN+nWnaZJ2qM1gAa0R/9LA7aZl4JKGi3tk//Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5wJo0L1SKWgKFZ51jXd3Jpj2o2N23/1Qjr2Vkfukbw=;
 b=wCdPmZTelUrVxwxDQztnJK1AdUM2WDrGt+QNaC96eod4TJ7K98+C1B6Z4V09ByVE6eH+WqpmIknmKWdCgJHx4q46Gst/m1JYNpLYVomr52q5QZ1N5H1xdZ/w0j5Vpt/NSPNGjAoHKgCnLTKoMFZM1CflpEctUnDT1VzRxnPt4ZU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <86f13ad6-317e-4abb-a664-9db33658bf6f@amd.com>
Date: Tue, 24 Jun 2025 19:00:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] xen/arm: Introduce flags_has_rwx helper
To: Hari Limaye <hari.limaye@arm.com>, xen-devel@lists.xenproject.org
Cc: luca.fancellu@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1750411205.git.hari.limaye@arm.com>
 <bf51672b258c374a76b8f6ae22d8ce87ca234395.1750411205.git.hari.limaye@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <bf51672b258c374a76b8f6ae22d8ce87ca234395.1750411205.git.hari.limaye@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0062.eurprd06.prod.outlook.com
 (2603:10a6:10:120::36) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: d7020abf-d357-4d4b-07c2-08ddb3490f4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STU2SDIxRkFJNkhsNTE0clBZTzcwVkF5NGpDK3UwNi9NSUZUWjBiNWh2ckl3?=
 =?utf-8?B?bE05Sm0zejl2UG5URlk1YWplQjVuSERnSWtFVEZZek1sTWE4cVI0SVlBSGQ0?=
 =?utf-8?B?c24rK1Uwa01obzJZSUxFcFAwN25zWFdibE54UFJuRUVIb1lvVmtOTU9ZSVBv?=
 =?utf-8?B?OHh4VkdJdGl2UnRXV2hMcjg0ZUVDNC83bFRjZTZCc0VMRkxIZ09nRW1TNEFR?=
 =?utf-8?B?UFZCU1hGajlUc3c5NmtMWGpSbGRKdlNSUmJDbk5wOXAwcEYwb3hCbmFNQlFh?=
 =?utf-8?B?RG8rQVYrZFlySTNyWlIrNjg1TTlJSFkxRkxlT3VmWlNacUs4Ylk1UEZWbjdT?=
 =?utf-8?B?OTRkUDBBQWQ2dWl1RHl2WkhteHZBSDk0UVNOalhqK24yRmxPQjZHTWt5ZzFl?=
 =?utf-8?B?WlZDNTYwRnJuMnZtYzJHWVlOUnMrRFN4bkxzckFTYVZiTTRPbFZqVkNmQmpz?=
 =?utf-8?B?eElEajB4eUxFZU04TVQvRlBRRE50eDZabWJwNnpSazZDMGtGRzFzNWtvZzZS?=
 =?utf-8?B?OFFyQThWeFVnVURpM3VKRTlTQnZGUi9zcmVwaWdDNTZVYnVlbnFHWnNoOVI5?=
 =?utf-8?B?eS9aOXcrY2Q0ZHZLcXd3cERoMnBmNk9IRm1MN1F6L0UzZHFoZmhXbHdYRW9h?=
 =?utf-8?B?VmFoaFpRNXNSbHV2bGVnNXpmRWZTMzFENHRSYkNESENTSTBaSWJLQVh2cXNY?=
 =?utf-8?B?REo3b1ZzUXRyU2FGd3BCbWxWWHVxRmxKa2lXQkU2TE5RUVd6RzVKR1hsU01y?=
 =?utf-8?B?SkxIdUJ2VXJzNHI3Q2l3QzNsR01NSy95VEE5bVlYWmM5T1N4N1V0WC96SW9Y?=
 =?utf-8?B?OUpwNEFyblJEL2I5VEE0Qi8wWDF3M1JYNCtkWTZTZDMveTBlMHRGZm4vSE4v?=
 =?utf-8?B?a0l6MnZxclJWc3I5ZWIvMm9meE5Ra3B1bis4VkFnOHQ4VzdQZ0xrcFVGb1cy?=
 =?utf-8?B?dXZYREkzaUZ6ZTBwRmpoSVM4T0Y2WkRBMXhUNGhQUWVraG84dGpJMzZma1Ji?=
 =?utf-8?B?TTFkQkgyN2xidTNnSkF3b3BpUTYrWEFrUis5U3RISE9QYVg2dFIyUCtrVXB3?=
 =?utf-8?B?ZGttNElNZGFyTmgvYUhoT21neVVHNFlVYVNtZkRHYU5yRzhsM2lIYjd0SWVy?=
 =?utf-8?B?QmFib0szdW9QamJvTEZXMkpuZExiVUVDWHRLQ3ZVWTloWVUycWFJTUVCVklW?=
 =?utf-8?B?TFZHdlNWZ1VCWWZQRFViaDF4WFMzeHFkT21BWis0Qmd2R2g0VS9OYUUyKzZ1?=
 =?utf-8?B?UGtIUDA1enpRSXR0NWF3K3Y4MitKZHBCRjVaR0liTk9EejNjSXFEM2RRQmZ2?=
 =?utf-8?B?SXJEcWZIeGNxL0duREd4KzRSOXF5MUZ4dHp1VEpLU2R5UUpTYk4zTzErVDB5?=
 =?utf-8?B?WXJnSy94QjVLUTRsMm1hTWtBS05OUlNpaW5pNjJFZVF5dDJMWkNhalczMVg4?=
 =?utf-8?B?cXF5VjJiL3Z6UUd1QjZLdS8rcUNNOHIzeDJLbnFDSWNETXp3VkkxYVo0ZmtT?=
 =?utf-8?B?aVNDU05hLzRaYWJYUVRxU2pNdDhua2ZGQm1xK1Azd0k0UUgrM21sSk5XM0sy?=
 =?utf-8?B?ZEV5OHVISU8wWjhLQVVFZWNGTGtWSzRZYjEyQzM0V1ZDYTZRNUUzVDZQcG9L?=
 =?utf-8?B?Q3NOUzQ3SkI3by9ic1ZvWjlrcUpndHBrTWl4NW5yN1dXVEtRMWQ1dGpTNGxX?=
 =?utf-8?B?anFhTit3ZTZaUStpWnNnNWFSWHMyTE8xZmJHK25iTkI2RlE4SWxPbUxNb0F3?=
 =?utf-8?B?VUxCL0tSeXBLNmhLakN0bkd6bEdiallLdXMwTHpXRkZ5LzA1V2FYU0d6ZW9X?=
 =?utf-8?B?Y1lZTE44NmtubjJ0dDZncHNTRFZwUGExTG1PREoyOEpRSzBIYSt1U2NHdzBx?=
 =?utf-8?B?UkdHRXlQbDV1M29WdUtDeEVZOE5UZ3VQQWVhNndZcUZ5YnNsZHI4bDdRNm55?=
 =?utf-8?Q?P/0KVhc+mB4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEN4SXdEbndaeDFYeWtBU093NFlSdExDWm1RVVpSc0FhdzZDNEJWMjNzeEFN?=
 =?utf-8?B?MHF5STRXQU0vUDBPb3lkeUJLbmpSUC9EYkR4OVNNUVNjck1VY2lwM0JYNCta?=
 =?utf-8?B?Q1VMNFhrSlVJNjV6dEpyaWJJamlZRStkMjVpWFp1c29GYVRQTXVSRkRUWTdW?=
 =?utf-8?B?SFNtTmFaSUR2bFZYeitIVmNwbVpxNmJScVZCMzRlZVFFTE11STM3OFliTWJD?=
 =?utf-8?B?S2d4b3RUQUFLL0N3TDhMWnpXeDg3Q3VQTDUxUzZYL1h2MU5FN3UvTngrZytR?=
 =?utf-8?B?MVIzZks1YzRsMmJWWmlMMTlManQ0ejVZVHFTZWMrU3NIc3prL1hCVDZCWDJo?=
 =?utf-8?B?ZjV0T01NUzJCdzBBTnByQmw5SUYxemppdmtvRHNXQ0hFNGF0ZTFwZFBEM0RI?=
 =?utf-8?B?SGRtYmp4WUhMZkJpUkVsRm8vOTQ5V2QwTWp1Vy9MMWwyUDNHSm1hSnVKNW9w?=
 =?utf-8?B?WmpRREI4cjdSSVdQaGVKaXRlWVhFVHluWThQN0MyR1kwbU93QlpvTDJ6M0Zo?=
 =?utf-8?B?YzZaMDIzSjBHQXgxZG4wdVFkRGpzc1hOZkFjWWJzZlJFTzR3Y0VycUYrSWU0?=
 =?utf-8?B?RENNNGVERjhhVjR6MDRNdGhIWW5TVUdkTE9SM0ZKTmgyU01jbEkzbVhBZHM2?=
 =?utf-8?B?YitHdTZXbjhUWUdzeHdROVFhc0Z1dzBnWDI1Tk9qUi9FVlZsRG83WHE2VUMy?=
 =?utf-8?B?Y2x4KzZoK2tZL2hnUEZWWDR3UUN1VDZjLzc0Mm5ROWFPaFh5d3VsNnA3WUlN?=
 =?utf-8?B?V2RGMkpLcDdOM0srRlAzaTBSZVgvbktkUDIwVVFWN1VnR3E2VzdQclFTc0VZ?=
 =?utf-8?B?VUdSUjAweHJXRDdiVkFMSy9qdnhnemlXSnAwZnZIQWdRS3hNUzgzMnVlak5o?=
 =?utf-8?B?b21ZaGhqbUtlUWhSZEdVRGs4WmRzS0xKM2FOTXE2U08zQ0xQZlpMa0lJZkRE?=
 =?utf-8?B?cE45NitvWXBPNTUwdzJ2bzZPUGo4K0UrZ0JwYUtxRWIvRTNvY2RkNys1YVZH?=
 =?utf-8?B?T0VtOFNxTGNUVkZCNCtaMFF3Q1ZxcFV2K0Y1NU5qK0tiZmE3bXlsRDB2NzlZ?=
 =?utf-8?B?anpTUWhjZk1lUFBUR1U5TnhacjI3RFR6aVduMTFsTUNtZk9Ma0dOaHhMN0dJ?=
 =?utf-8?B?ZmtBTWtxQlVrVWpKbWt4NkpkVzRnM250RTlONjRZaVgrbklQM1BuM2d4RWEr?=
 =?utf-8?B?a0ZaNVk4Z0d5ODNOa0VVeEI5U0lzMkpHeUk0cnRYZFJ1TTJGMFJ4UGJTYmFl?=
 =?utf-8?B?T0E5d2h4SVdHSVp4ZzUxREVBbmhNV2d6NVE5QTd5bWRQaHY0U2N3QVd6ZFRh?=
 =?utf-8?B?TjNKb2xDZDVRdURHN1hkZTltdzhmd2JGb20zbHp0d2pSbGNiaU1YNFJGUStZ?=
 =?utf-8?B?N2pHblNwdTY2eVdOYTlrSmJVcmxUMllwK0lEUWlwZWZ3MVVMaUJCU2ZsNllI?=
 =?utf-8?B?eFhPdy9VSkc4NkNqemc2akNHNmZuanQ3d2NaQWhBZllpTXJIanIwVk9neXow?=
 =?utf-8?B?NmFhbzIrNDRFMDhEd0kwdmVtTU9GTnJUSW0xdnJzRFlyQkg0dUdrcU1CN3ZF?=
 =?utf-8?B?a1dHRmdEWGg3WTJWVS90MjY3ODRLM2lyVVE0dS9Fa0w2ZVU3ZHpVWkEzamdB?=
 =?utf-8?B?R2dBVGJEUDNnWU1abUdKVEwvK1Zzd0c0MCtYMGFkNVBkRlF2V2c2N2hBU3Ar?=
 =?utf-8?B?M203SEZwMTR1K1I1bHhEZXpzMTIwRklZS1BPaVdLRFQ0eFBZcE9ERUdENFR4?=
 =?utf-8?B?RjFoNGdmNGEvd3EwbGdZeWQ0Q1R1OVpOS0NlR1hpMytmVnBJVnFYb2hXY2Q0?=
 =?utf-8?B?UWdpQzR5TjZNeGxncE1pbG10VmFUTmRaclFVc2lPVExOREc4UHhkQlp0dVo3?=
 =?utf-8?B?ZlV5alJDb21RK2NoZ3krSm91enFCY3VxVGtVeHFWUFB4WTE0WFh1S29kY2R3?=
 =?utf-8?B?Q3EyaU5JYU1wbDRiMTEyanhlVVNveFRQU0JGcm56TDVuTit4a1ZOT09pRlhI?=
 =?utf-8?B?SForeDEvak9kdVRxVk1WTnhkSURqV3NTWC90ZVZNTUkyTUJQRzJMeS9FVDVl?=
 =?utf-8?B?cXZ3QkVuVjlVR0VTaVR6ak1YS3hVdzJ2SG11OEtLbG9CUkIzMk1GNCs5cjZV?=
 =?utf-8?Q?H9PKo/JF4NGn/WYbmFvu2Tan9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7020abf-d357-4d4b-07c2-08ddb3490f4f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 18:00:53.0583
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mx959RoDJziJe3RzIWdX0gUbkzqBdGOl0PbwYLiD/HlX7ZhyMdGaLQ4Uav4L8ga9TeRoHhBh9gvvGV12v9H8yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415

Hi,

On 20/06/2025 10:49, Hari Limaye wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Luca Fancellu <luca.fancellu@arm.com>
>
> Introduce flags_has_rwx() function that will check if a
> mapping is both writable and executable when modifying
> or update the mapping.
>
> This check was already present in pt.c but since it will
> be used also for MPU system, it's wrapped into a function
> now.
>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

