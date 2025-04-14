Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E905A87EA8
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:12:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949800.1346254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hjp-00072c-NL; Mon, 14 Apr 2025 11:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949800.1346254; Mon, 14 Apr 2025 11:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hjp-00070L-KP; Mon, 14 Apr 2025 11:12:29 +0000
Received: by outflank-mailman (input) for mailman id 949800;
 Mon, 14 Apr 2025 11:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQ8q=XA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u4Hjn-00070E-R9
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:12:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2417::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57b16d91-1921-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 13:12:25 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA5PPF8DEAB7A29.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 11:12:22 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 11:12:22 +0000
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
X-Inumbo-ID: 57b16d91-1921-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qq18ypVl2D4PO1AuSuq/OiGvlPHoI79VxXOrDyA8pJDNKfzRV+4f7g+CoYDn28GvA9BfDStmImNp2hPFRKl5jeAXbA7Gbj4z0p3m6kw460iosL87xeGKagCvi3X4dSQfESdg5KXqgxgYcP3SUUM8W9abIggwPHROvpPdXf1pFYmFbZA/vwdgI17893JAJJt5Jgu+a8igTIc1ivAOKr+33YH20qFgNX1eNT7wegCmayvzJ8Ttew4Tv23PZI+xlzCUmHzqS+bvyD7W+5y4K5bZ6N+w7rtMo3YFPh0nqzLP1oxVq+U2pFNhx65GBIzQqoZyn9NexvZuJL/8gxBnIa3K+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bz9DlLgmyWRmHsSB253/9mAeBUZ+XKDOGwv7RjvyT38=;
 b=fWaezHdh7iRLscmZav7wP8fBrAQNFzwO3vEmfTGGqnYh31aOYyHjofOSAtxqN7VZohX4al01bQ0OTZvhvKzUe0yTQ81JARuzblKlJUrYv3JiwC8HisZ3VPb1weJ6gY/cd3eJPGItJgBrcAzsKXmMh7lH6byyAosBZXgXwqbqdS7kbECsbBYTcSxJAq/CFwFW28q7NJNNTZsevMUrCEKqPTUgtQXZvMn+ZqEmWw7cm/G2xcLNmM5Sawkze0PiEWieOxlvGhbW+13zT+FKk59J8BVOvew5H0XtvbgJXWjg9+jQWC9Dy8dcXGqnOV0OUWJrpt7GYYh4ekz23ORB4hkOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bz9DlLgmyWRmHsSB253/9mAeBUZ+XKDOGwv7RjvyT38=;
 b=ccqRYNv7t3QuRn628Ldh6VOUdqWf8HLHwUdFD0havzvqhyL8PjBfbWoqFebbCL6PjTf6daY0jHPnJNMjqiN5Dlo48J8QsGHAO+QFjdV/QkHVwSVUqTsh6ev/xubHMbNGBIkBFkzy2cIy1kFMF5gdpFjIprZUgGxxMRlQr6H+MU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0e20dc0f-ec97-4b6a-98c5-cdfcd3dfb44c@amd.com>
Date: Mon, 14 Apr 2025 12:12:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] xen/arm32: Create the same boot-time MPU regions
 as arm64
To: "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
 <20250411110452.3748186-3-ayan.kumar.halder@amd.com>
 <f4c43d72-b403-4829-b490-46823391f82c@amd.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <f4c43d72-b403-4829-b490-46823391f82c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0188.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::13) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA5PPF8DEAB7A29:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f333e4-7fb1-4925-017d-08dd7b453a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWt2YWswOU1VWFNlVGZqamhMYzRqVDNaRkxzbmduK3E3Yi9QeFg4M3hzS0h3?=
 =?utf-8?B?bzdjWHRWdlVEOUVxR0N2SzZvUGYvSGptSlB6aG5LU1ZlTGRnV2Z6enFXMnpB?=
 =?utf-8?B?aVozYXAybHF2a3o3MUNZZm5URFhmRFYxdTAzQ2pRcmxmK2RJTEZzZTgzYmZ6?=
 =?utf-8?B?elhyWEZMelAvang1dnJHeDR5UnNYdVl1M3pYbGU5ckd2bUNpMjBvZXhaSk5K?=
 =?utf-8?B?M0FmMlJWKy9LT3VtUTdkUUZwYkpmZFBsckFJQ1ZuUGRKUktjbHN4TTIyekM4?=
 =?utf-8?B?dVNWUDFGemc0THFSTWUwM1U1YXVDUFhrL3NiRjJvV0xzdkJzMk8wd3RYYm8z?=
 =?utf-8?B?Z3Z4amdqamg2ekV5S29FNlYrT29pRzRhTHpkTnQxcmRRQW4vV0xLYWVpNXVQ?=
 =?utf-8?B?WDBYY0tBbFFycEtPT2lDNHMwbUlwN3crd1V5THdtNUllUm5JT3FIcUxqbXha?=
 =?utf-8?B?dC9SLzJBYldzWFR5K0RqWWhKd0szZmdxWXEwaWpuMzV2UkZCY1I2WkdPQU5U?=
 =?utf-8?B?RUlpTDVpTmx1VEVyMHBnd1VLbHhQNnlwZzRZQ2xLZmtrZjQ0c2tGMTNSTHRz?=
 =?utf-8?B?Rmc2cTQ4em04UmdqQWpRdlpNNVUyV2lUUHBqOUlmbDdNTUI1UXpPRDVSdEpr?=
 =?utf-8?B?WWxxeHVSWktJbnZhaDhQdjJCcC84eGFYc3JuQjNackNQQm01dDU5RjVDcG5K?=
 =?utf-8?B?QmRLUzFlczlWWnFYTWxaa0lvUTVFdW1ZYkxKaHdwY2MwTDJYL1RBK0RBbTk4?=
 =?utf-8?B?RGFzcEJaa1huenJ6UGc4QTBCVHJ4alphRm5SdHlQcnBqSTF4Z2lmZnVUcWIz?=
 =?utf-8?B?c0lJQTgyS1UzaHFIRW01Kzh4QWdTRDBQanJPZHUweHFKK3EzbFZWa0p1ZDhi?=
 =?utf-8?B?QUkyVFJaUjJ4cmJqdCtIQWhUOS9KNDA5TGNnSlQrZ2lKWWxIU0poenEycFA4?=
 =?utf-8?B?OHBISk9pWjRlRVAyQ0dWUHJsSnFlaXA5UmJ0SDRadkMwVSs1QjZ2WktQNERG?=
 =?utf-8?B?bE1qNjg2S04wTXlHanFMVkNGampzcG5vL084amhuWXhTUXhhRXduMlhnV2tP?=
 =?utf-8?B?RVFFM0VjOTFaRWhiNm9TUXBIaGJTenNLa2tleDNtcmxyZm1hZ1FGMWFxZG5i?=
 =?utf-8?B?OHl2Q2pybWNZaXI1MXgxWWoxQlR4Y0ptSElrRS9oaVZUSXlWS2xkUmtGeTFT?=
 =?utf-8?B?ZTFSVkxFdlB2dVZvd282dDdVdUh0YmY5MVZ5YnhEc3c1QVFxMTN5NktYR3Zi?=
 =?utf-8?B?SXNKRGlFU3dvWEJGbTlmR2l3ZVUrZDVSc2JkajExTDMxbVQyM1AvNWtGOER1?=
 =?utf-8?B?dGVkUzY2d1FUQkxYb0ltYlZHTnoxKzRKOUdVVFRxYm1BY25HQmZPeVhXTTVw?=
 =?utf-8?B?Z3I0YXpmV3o2M1FyVnVuTmVJL212d2dkWVhKQmtDQ2JsY3pwRjkrL0RWQ01u?=
 =?utf-8?B?K1kwMTdPSWtPSHNqVDZPNG1XZXdDTGdYdHBvOUlkK2I2K0RaSDltOHh3aDky?=
 =?utf-8?B?blJHTStuczZsUEZIcFhiTlR1STV5UUJ0RTk0YTArWjBzeXhPOTFOcU43K3I3?=
 =?utf-8?B?L093cDBrZWx3S0ZuWlh1NGxRQzlJZ3YwcmpLTlA5Smh6TjFDRGtrcHZYeFg5?=
 =?utf-8?B?bTlQNklTdGlJT2NTTHltR011NVZONXhaUVplNWR5cytHZis4TURCTnZRSzhx?=
 =?utf-8?B?Rm9GWVdFeVQ5cWxZbVZtSXoyQTEveHhJRDUrRjVSbERJeDU2MnlCcVkzLzlz?=
 =?utf-8?B?dnlWeG5neXFWbmZaTVJ4Y1NySjRjblNTK2k2bXJOb3pCMXcybFJYODRKcXB4?=
 =?utf-8?B?dlFpdnN5NEt5K2grSDVvUEgzWk9sNnllMnZNN2h5VU5wMDZrbEUrYzMzQkw1?=
 =?utf-8?B?M1JFSGI5YlVvRmpHV2pCc3pneWsrTXI3TGNTZ0xPWkV6Ukk3Vm1EYnp0Qmts?=
 =?utf-8?Q?HLCZFLxFXW0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QnNQOGRkc2R2U3F2ZXdXbENCSUl2OHZBbjV3MHlna1UxbDJodjg1Qmt5RTlm?=
 =?utf-8?B?TWZ5WW53dHduUGtCUW1KTThWWXVURDZWVlV5VXR0cTVKNENHU2lucWl6VWo4?=
 =?utf-8?B?OEZObzZvVmRMRHlvVHBaVkhqRlVrMG9HWkdPaFF5NGFuZktld3drZ3hBYXpy?=
 =?utf-8?B?N25qazI4c2dFcGQvcU0xQXJhOVA1bzFhSVRudTVpSEpuV1dNTWJTMWhCTEd6?=
 =?utf-8?B?ZEtyZ2p3bXk1VThrVEpiUnhjL2g2ZzFZVFRTUDJQMERLK1JtR1dMVVdXVzIr?=
 =?utf-8?B?Ym1jN1BobHA3T2hRRkJwMHgzWG9iRHhlamtqbjBGNVMwVXhzMFVvVUJaTXRm?=
 =?utf-8?B?ODQyL01hU3JrNGl1emhxc04xR2pJc0VxRjlnS0MvRkx5QnpReVl2dnl5TFZq?=
 =?utf-8?B?bGE5OW1pVHJhWUVQdmdrTnpVWHlzRWx0bmV6dk51YTJhcjNnTFZpNzZqQ2Rx?=
 =?utf-8?B?dkRHSXdHM1F1UHFvSnlTdFZ4UzNaeVVEMGtSdW03SVdPWTJ5eDVyQ1RLeVBE?=
 =?utf-8?B?VkgrRVB2L1p4UWZuVW5KK1pjRi83ZWVYZWFKbzZvTlJLVUVjNDdweitZemhr?=
 =?utf-8?B?ek9NSSsyOVpYbjJzdjZvSUFYQzRjbUNZQWprWGlzSjlId1BHcUFXclNoQWMx?=
 =?utf-8?B?RzdjUVM3N0RmeFJkaDdiWmE1WTRYSEJvTHVMTXIzWXdtYm12S1d5ZU1jY3RD?=
 =?utf-8?B?enYwZjNmaitvampicmVoL1FtOE1ER2JCL2dlVnhPeHNSaStKbG5HdU5Dcnpq?=
 =?utf-8?B?UW9TY2pTd2RHY2MzWkhzQXJuUVlIQ2NYdWZkVDBHQ2N5RGdQRU1WcHlSejJn?=
 =?utf-8?B?bFFpVHFkRkxjSi9MQTJaSjNnbWJUQWZ5QXJGdHUvVVBmWFpQdGhSZERQTG1J?=
 =?utf-8?B?dFZrMFAyMm1pWndiVlNEaU1yMS9DZ0p5YSs3RnREL3B6aC8vbURMb1Y2QThX?=
 =?utf-8?B?WXBBKzBOUlNCbUNiTysvRGx3UXJSNEx0YnRBZS91SHI5UDljcVJUQXA4dWlh?=
 =?utf-8?B?Ukd3NlBPZFlSbkI3YWdIc2NVTUVka2xUWVBHVFhna3VGMjZ1cERwb1RRWmpo?=
 =?utf-8?B?UmZsYnluTnM1cXVpZkdGdmcrRXp0RVJnbUc3bkovVEIxMmZCY1IxVjR3NTZs?=
 =?utf-8?B?eEZtM0RBYUVBMHVjQkx4SHQwQlI2MzEvZk9hM2RodWwzaUhjNmlaWWlxaWhC?=
 =?utf-8?B?TFBEUS9Nc3hxOWRyUXlqL1huVXBZeW02KzlGditVS2N4YzhjNXkrcWcxWXNU?=
 =?utf-8?B?ZjA3NWVjVDhpblhYVHZoV1prVkFMdThoekRtdGJVRWI4MzJKVU9URUdZWnNy?=
 =?utf-8?B?aHBmYnpTcGU0UldxNUZvSjR6SFJ5MGxoTlIxcnpDODZIQ2NSNXo2WnBUVUw4?=
 =?utf-8?B?dnkySEY0UEZaUkgxRUtLWjcza3dWVlJueTlrR2RTUUV4SndmbUhaaERpd25G?=
 =?utf-8?B?dUEvbkRxdFFTd1ZPa0kza0E2UnZYR0ZQbkdyOERxNldlc040ejJCL2lqN0dk?=
 =?utf-8?B?eGFDcHM0Z1U1bWY4d3lBb21WQlVzb1dxVWZ2YlpkbHh4cGszOU05bXIvVVlD?=
 =?utf-8?B?Mzd3V0pQU0JFN3VRckhCY2g5aU5TWGJxU2NFaHZnNEVsZW9qc1o1YzdDN0tU?=
 =?utf-8?B?bEM5TmdWcFkwQ1V5Q20veUxRZHlxSHR3MmFZVjF3eWdwWnVHMktNZTRyc2NU?=
 =?utf-8?B?QXE1UkJGUitHWDJoTzNKRUtUVmFmZVVsVnFGK2hiL1ZpbVg3cW5PT2xoVHFJ?=
 =?utf-8?B?N2YyajAzZmMzNFc1Nk1vVHUrZUdrNTB2aVdrL1NZRS9KdmlaU1BNdFFvODdH?=
 =?utf-8?B?UWhsMmIveEU3eEdYR1d5d3VhMm8vT1dSdXRhcWhGTldQL2VhNU5UaUxBNXB4?=
 =?utf-8?B?bHZTVVpBRXE1ZUVOTVdNenErQkxKa2RQc0hPbHN6RTRmdG1pUms2U2Y5cU53?=
 =?utf-8?B?cjR6UnplK1V5K1l3dGc3bUxZajVid3JBOG44WVR3aldlcDlSZit2VFNxcW1j?=
 =?utf-8?B?aytnd3RlWkQrU1VLeHJXZWJybmxuOTNkZG1vU1BUbnVIbUR0d3JKcXZFbUIr?=
 =?utf-8?B?NUQxQm95SUtsVTVKSm5LQ3VWMzNhY00vMWxuRURMWWdvMWVEKytzU1ZFQWRO?=
 =?utf-8?Q?Zbw8sNdu6Or6zLaZRvRFx1j6x?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f333e4-7fb1-4925-017d-08dd7b453a4a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 11:12:22.0322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kaOkJ0x86j+/9IoDqsLo97RFNBJqM+l3tu2nhSh8eJYL6JyMryK1GggujL9MtJ/8roSRUXhuvyO1FB2k2h436Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8DEAB7A29

Hi Michal,

On 14/04/2025 09:38, Orzel, Michal wrote:
>
> On 11/04/2025 13:04, Ayan Kumar Halder wrote:
>> Boot-time MPU protection regions (similar to Armv8-R AArch64) are created for
>> Armv8-R AArch32.
>> Also, defined *_PRBAR macros for arm32. The only difference from arm64 is that
>> XN is 1-bit for arm32.
>> Defined the system registers and macros in mpu/cpregs.h.
>>
>> Introduced WRITE_SYSREG_ASM() to write to system registers in assembly.
> It really reads odd when you write what patch does in past tense.
I will change it.
>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> Changes from
>>
>> v1 -
>>
>> 1. enable_mpu() now sets HMAIR{0,1} registers. This is similar to what is
>> being done in enable_mmu(). All the mm related configurations happen in this
>> function.
>>
>> 2. Fixed some typos.
>>
>> v2 -
>> 1. Include the common prepare_xen_region.inc in head.S.
>>
>> 2. Define LOAD_SYSREG()/STORE_SYSREG() for arm32.
>>
>> v3 -
>> 1. Rename STORE_SYSREG() as WRITE_SYSREG_ASM()
>>
>> 2. enable_boot_cpu_mm() is defined in head.S
>>
>> v4 -
>> 1. *_PRBAR is moved to arm32/sysregs.h.
>>
>> 2. MPU specific CP15 system registers are defined in mpu/cpregs.h.
>>
>> v5 -
>> 1. WRITE_SYSREG_ASM is enclosed within #ifdef __ASSEMBLY__
>>
>> 2. enable_mpu() clobbers r0 only.
>>
>> 3. Definitions in mpu/cpregs.h in enclosed within ARM_32.
>>
>> 4. Removed some #ifdefs and style changes.
>>
>>   xen/arch/arm/arm32/Makefile              |   1 +
>>   xen/arch/arm/arm32/mpu/Makefile          |   1 +
>>   xen/arch/arm/arm32/mpu/head.S            | 104 +++++++++++++++++++++++
>>   xen/arch/arm/include/asm/arm32/sysregs.h |   9 ++
>>   xen/arch/arm/include/asm/cpregs.h        |   2 +
>>   xen/arch/arm/include/asm/mpu/cpregs.h    |  27 ++++++
>>   6 files changed, 144 insertions(+)
>>   create mode 100644 xen/arch/arm/arm32/mpu/Makefile
>>   create mode 100644 xen/arch/arm/arm32/mpu/head.S
>>   create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
>>
>> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
>> index 40a2b4803f..537969d753 100644
>> --- a/xen/arch/arm/arm32/Makefile
>> +++ b/xen/arch/arm/arm32/Makefile
>> @@ -1,5 +1,6 @@
>>   obj-y += lib/
>>   obj-$(CONFIG_MMU) += mmu/
>> +obj-$(CONFIG_MPU) += mpu/
>>   
>>   obj-$(CONFIG_EARLY_PRINTK) += debug.o
>>   obj-y += domctl.o
>> diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
>> new file mode 100644
>> index 0000000000..3340058c08
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/mpu/Makefile
>> @@ -0,0 +1 @@
>> +obj-y += head.o
>> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
>> new file mode 100644
>> index 0000000000..b2c5245e51
>> --- /dev/null
>> +++ b/xen/arch/arm/arm32/mpu/head.S
>> @@ -0,0 +1,104 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Start-of-day code for an Armv8-R-AArch32 MPU system.
>> + */
>> +
>> +#include <asm/arm32/macros.h>
>> +#include <asm/arm32/sysregs.h>
>> +#include <asm/cpregs.h>
>> +#include <asm/mpu.h>
>> +#include <asm/mpu/regions.inc>
>> +#include <asm/page.h>
>> +
>> +/*
>> + * Set up the memory attribute type tables and enable EL2 MPU and data cache.
>> + * If the Background region is enabled, then the MPU uses the default memory
>> + * map as the Background region for generating the memory
>> + * attributes when MPU is disabled.
>> + * Since the default memory map of the Armv8-R AArch32 architecture is
>> + * IMPLEMENTATION DEFINED, we intend to turn off the Background region here.
>> + *
>> + * Clobbers r0
>> + */
>> +FUNC_LOCAL(enable_mpu)
>> +    /* Set up memory attribute type tables */
>> +    mov_w r0, MAIR0VAL
>> +    mcr   CP32(r0, HMAIR0)
>> +    mov_w r0, MAIR1VAL
>> +    mcr   CP32(r0, HMAIR1)
>> +
>> +    mrc   CP32(r0, HSCTLR)
>> +    bic   r0, r0, #SCTLR_ELx_BR       /* Disable Background region */
>> +    orr   r0, r0, #SCTLR_Axx_ELx_M    /* Enable MPU */
>> +    orr   r0, r0, #SCTLR_Axx_ELx_C    /* Enable D-cache */
>> +    mcr   CP32(r0, HSCTLR)
>> +    isb
>> +
>> +    ret
>> +END(enable_mpu)
>> +
>> +/*
>> + * Maps the various sections of Xen (described in xen.lds.S) as different MPU
>> + * regions.
>> + *
>> + * Clobbers r0 - r5
>> + *
>> + */
>> +FUNC(enable_boot_cpu_mm)
>> +    /* Get the number of regions specified in MPUIR_EL2 */
>> +    mrc   CP32(r5, MPUIR_EL2)
>> +    and   r5, r5, #NUM_MPU_REGIONS_MASK
>> +
>> +    /* x0: region sel */
>> +    mov   r0, #0
>> +    /* Xen text section. */
>> +    mov_w   r1, _stext
>> +    mov_w   r2, _etext
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen read-only data section. */
>> +    mov_w   r1, _srodata
>> +    mov_w   r2, _erodata
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_RO_PRBAR
>> +
>> +    /* Xen read-only after init and data section. (RW data) */
>> +    mov_w   r1, __ro_after_init_start
>> +    mov_w   r2, __init_begin
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5
>> +
>> +    /* Xen code section. */
>> +    mov_w   r1, __init_begin
>> +    mov_w   r2, __init_data_begin
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen data and BSS section. */
>> +    mov_w   r1, __init_data_begin
>> +    mov_w   r2, __bss_end
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5
>> +
>> +#ifdef CONFIG_EARLY_PRINTK
>> +    /* Xen early UART section. */
>> +    mov_w   r1, CONFIG_EARLY_UART_BASE_ADDRESS
>> +    mov_w   r2, (CONFIG_EARLY_UART_BASE_ADDRESS + CONFIG_EARLY_UART_SIZE)
>> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>> +#endif
>> +
>> +    b    enable_mpu
>> +END(enable_boot_cpu_mm)
>> +
>> +/*
>> + * We don't yet support secondary CPUs bring-up. Implement a dummy helper to
>> + * please the common code.
>> + */
>> +FUNC(enable_secondary_cpu_mm)
>> +    PRINT("- SMP not enabled yet -\r\n")
>> +1:  wfe
>> +    b 1b
>> +END(enable_secondary_cpu_mm)
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
>> index 22871999af..8d7b95d982 100644
>> --- a/xen/arch/arm/include/asm/arm32/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm32/sysregs.h
>> @@ -20,6 +20,15 @@
>>    * uses r0 as a placeholder register. */
>>   #define CMD_CP32(name...)      "mcr " __stringify(CP32(r0, name)) ";"
>>   
>> +#define REGION_TEXT_PRBAR       0x18    /* SH=11 AP=10 XN=0 */
>> +#define REGION_RO_PRBAR         0x1D    /* SH=11 AP=10 XN=1 */
>> +#define REGION_DATA_PRBAR       0x19    /* SH=11 AP=00 XN=1 */
>> +#define REGION_DEVICE_PRBAR     0x11    /* SH=10 AP=00 XN=1 */
>> +
>> +#ifdef __ASSEMBLY__
> In previous patch, you had empty lines surrounding the macro.
I will put a empty line here.
>
>> +#define WRITE_SYSREG_ASM(v, name) mcr CP32(v, name)
> Hmm, for arm64 you surrounded msr within "". Any reason for these style changes?

In arm64, it is

"msr " __stringify(name,) #v

One needs " " to treat this as string for concatenation. Otherwise, we 
get an error.

In the case of arm32, we don't need __stringify().

Let me know if it makes sense.

>
>> +#endif /* __ASSEMBLY__ */
> Why #endif given ...
#else /* __ASSEMBLY__ */
>
>> +
>>   #ifndef __ASSEMBLY__
> this one?
remove this.
>
>>   
>>   /* C wrappers */
>> diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
>> index aec9e8f329..a7503a190f 100644
>> --- a/xen/arch/arm/include/asm/cpregs.h
>> +++ b/xen/arch/arm/include/asm/cpregs.h
>> @@ -1,6 +1,8 @@
>>   #ifndef __ASM_ARM_CPREGS_H
>>   #define __ASM_ARM_CPREGS_H
>>   
>> +#include <asm/mpu/cpregs.h>
>> +
>>   /*
>>    * AArch32 Co-processor registers.
>>    *
>> diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
>> new file mode 100644
>> index 0000000000..e2f3b2264c
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/mpu/cpregs.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __ASM_ARM_MPU_CPREGS_H
> There are already 4 header files in this directory. Why don't you look at them
> to get a hint as for naming the header guards? You don't need ASM here.

Yes, this should be

__ARM_MPU_CPREGS_H

>
>> +#define __ASM_ARM_MPU_CPREGS_H
>> +
>> +#ifdef CONFIG_ARM_32
> If you look at cpregs.h, we only use #ifdef CONFIG_ARM_32 to protect aliases.
> I'd prefer to follow the same rules here.
ok.
>
>> +
>> +/* CP15 CR0: MPU Type Register */
>> +#define HMPUIR          p15,4,c0,c0,4
>> +
>> +/* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
>> +#define HPRSELR         p15,4,c6,c2,1
>> +#define PRBAR_EL2       p15,4,c6,c3,0
>> +#define PRLAR_EL2       p15,4,c6,c8,1
>> +
>> +#define MPUIR_EL2       HMPUIR
>> +#define PRSELR_EL2      HPRSELR
>> +
>> +#endif /* CONFIG_ARM_32 */
> Emtpy line here
ok
>
>> +#endif /* __ASM_ARM_MPU_CPREGS_H */
>> +
>> +/*
>> + * Local variables:
>> + * mode: ASM
> This is not ASM file.

Ack

- Ayan

>
> ~Michal
>

