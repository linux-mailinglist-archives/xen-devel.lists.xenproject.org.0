Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51951AD1929
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 09:42:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010115.1388236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOX8s-0000LO-0m; Mon, 09 Jun 2025 07:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010115.1388236; Mon, 09 Jun 2025 07:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOX8r-0000JV-U0; Mon, 09 Jun 2025 07:42:01 +0000
Received: by outflank-mailman (input) for mailman id 1010115;
 Mon, 09 Jun 2025 07:42:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1N5q=YY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uOX8q-0000JP-E9
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 07:42:00 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2418::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3587eda8-4505-11f0-a304-13f23c93f187;
 Mon, 09 Jun 2025 09:41:53 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH8PR12MB7205.namprd12.prod.outlook.com (2603:10b6:510:227::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Mon, 9 Jun
 2025 07:41:49 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8792.034; Mon, 9 Jun 2025
 07:41:49 +0000
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
X-Inumbo-ID: 3587eda8-4505-11f0-a304-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rZ2Ic8RZ1XYBzTgYZbeLj/swKZ53ms4rWjOTsOivrU8WxHN4NK+qQIZsM+RPbFZa6fIY+4LTlswAm0Djf5L80Rq7qH3FiySbc8fJV4j265MYMSWv8tWdzemTlM/8/8Hp8ywitPo2JSMX0XyaPsYgzpUMVjh7q8LSEMFegQwdpow7bQHWICfHzuqav0INI/NuzrA/ASHJxWc3rCdXA01vjcA2YXRWps9HUWX9x/IcHsLiTTSg5U6QQNH1cb9peGqSsbR66Sy7pRbqQR8gbM3+gfsyVbkSbQE9ZXaO4ZwfZ1YzEkts+/zcepZxqS/zZ9Pc/kftDu9lBgOHhIqXCU8aig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b2vBVMgHaVve863q3YYs1WwI5y+XWFqqCtBTfREES6U=;
 b=iPQoWniueKBC9BELiB99SXlaMWEtNvJKhPy4DJ0VpAokNNVbgtGe6sM7BExeUwC5Pc/2lCo6nWD8SS+FXYQbKw0u7kMibJLmAT4vdy6cLEX0hWfKcqx9gtG1St6yWjatZa+fN3OVPtgqUu5/7Y5ds0GCA7IHa8LMdsPedhBWgs95xobvTXHLVYQSt73K1QjIFurkrREq47n4IgmCixNhYEPngb8FmoJQxt/Kwenw4fKaDDjqlhq7P5fwXnBoXw2wAMQKBYUepkajapr9EwBXYOJpGrW8QQLatFdIa3qC41fFzlzpUf9zJtlqpy2fEUI+b3FplMQO/mW9irVhhYwpGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b2vBVMgHaVve863q3YYs1WwI5y+XWFqqCtBTfREES6U=;
 b=q2AQQHXKVdkYrkr1dv/Z1uq/8RzC91uQ8qa91wKEf1pJaJvPERwBQkeHtpzToSc3A0WOh6n9HzfrO899TDDMBm16B6tjSlRz+FcocX2PmVBXwbH0DnggbC3kGFpe5M68Sx9fccFXTQCpQ12+VC0b36+vSwavrwnq9B/Oj9qqfEc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ee8df4dd-1256-49e0-827e-c4dfe9543fc7@amd.com>
Date: Mon, 9 Jun 2025 09:41:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm/mpu: Provide and populate MPU C data
 structures
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250606164854.1551148-1-ayan.kumar.halder@amd.com>
 <20250606164854.1551148-3-ayan.kumar.halder@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250606164854.1551148-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HE1PR0902CA0034.eurprd09.prod.outlook.com
 (2603:10a6:7:15::23) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH8PR12MB7205:EE_
X-MS-Office365-Filtering-Correlation-Id: df4c6311-c71b-400c-bbdd-08dda72917b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZTYzMmRNVzNTZFhNbzQyMEd1cTkxTXhWdTAwMGpIR3pMWlVHTFBJWVArZ2Vw?=
 =?utf-8?B?dUhaU3NNYkVpK3owVGlRSFhwaVd0eE5FT0dFWVJHQ1ZrT3EyRE9ldHhhSzda?=
 =?utf-8?B?RkhMbXZMdHdtTU1nWjJZbm00UnRaTVdmMmp1dmlnaG5jR1VkTmtQbWl4eWYw?=
 =?utf-8?B?Q0I3LzhWcHpTT0hUektHbkhoVGMxSTVGMCtabXF6TmRxaUJobUVtbG5Ra3Jh?=
 =?utf-8?B?RnFPcm1ZaHp2Ym1RRkZydCtOejEvZmtyM0VGbTF5cDZjSmhBODVUbklMWSsx?=
 =?utf-8?B?aWZ4WlV6YjQrUkJmbm9CL296OGY2OXM3OCt6SGRHRWJ5cDREV0podjcyNUVV?=
 =?utf-8?B?TFRueUlZaGxwZGlvZE5kanpTQU1YUS9GandaRjB4dzRWQUdERFVoZldmVFdW?=
 =?utf-8?B?SmszaTFwdkJpZFFCcDI1Qmdac1NhT1ZFZXR3TXJzTGNibGdpWFJLVE9QVzI5?=
 =?utf-8?B?NXZMdnEvTmFLZFBtU2htUWV2WVJwRk1XeVdUYlJiRXpRcGQ4UjBGeGdEWmJ5?=
 =?utf-8?B?dG4zUFRNRnFFZmUvNVVZQVNwdldTS0NuSWk3aG11NlVsc3Q1M0czaGp2dWIw?=
 =?utf-8?B?ZVVnYUtqbko2ZjlVeXpzdDJjdnlscmx0NUkvMHBLL1hwNkVqQVNDamdvYTFz?=
 =?utf-8?B?WXVIRndia2ZLTkhzeTI2MFRoNEFJOGd5c3ArcW4wYmtMNWRYbktqNVZJbDJH?=
 =?utf-8?B?N3ZpSE5WWG4walQ5ZWQ3NWc5cXRLc0pvMDUrNW9GMnJPTE5pZDB2RVMyRmxl?=
 =?utf-8?B?OVJsbk91Y3E4c0FGSnNpaU1hSS9OWUhSWU9nNy93VlBBNitpcWxMY1huK1JV?=
 =?utf-8?B?K3MvczJuRzVsYnB4V3FyZ0ZLQXlWeUNIWWh1UXFSWVBuaWc2ZTlKdVVmNDQ1?=
 =?utf-8?B?eWFPdS9JaXo2ZTRMZDlTNEljdE82ckR2dHZxdUNBVWNXWFlCak1wdEJLd2dP?=
 =?utf-8?B?V0Y0T3duNHNaN2tnWjlFaktnY3NNZzlRUUFwRURXeGF2VVNEb0VzRHdVNGtU?=
 =?utf-8?B?VHBQS3ZZVm5SZVowTDMycnlsam5qVDVmUUViNm9wbU14QmlNQnZicDVORVJS?=
 =?utf-8?B?b3lwUVcraE05N21IQ2gwczVmdnVyL21DanRnT2hteFVYVDU2V1RJTC8ydnJJ?=
 =?utf-8?B?VjB4VVJ2elltVHZiVnE3Vy9NS3FMSWFRZjRJOEZqUGxaeW00ZkxFOW1ReXd1?=
 =?utf-8?B?WDFSdnp1cDdMZ0E1bWE0QnZENmloQzNhYW5lcml0YnkwK0RuMWErV1JtY0xM?=
 =?utf-8?B?bDBGRENnL0F1cXo1Wjh4aDdEVnhidnlZNkVkc1Q4dGVhYmF5VzZLUk9vOTlz?=
 =?utf-8?B?S2xBWXNQeHM3a1ptZlpHYVJpNlFtVHYyaG1LWGM3ZVQ1enpTZ1dlSmxHMHhn?=
 =?utf-8?B?by9QS0tlanY0YzBidE9LNDVTS0hWa2xvZm02S0QycFkxUFJ5SG5uczl0YjNq?=
 =?utf-8?B?K0pZWUJpOG1ZdFI2d0UveVJleVZPcDhuU2ZXUlBKdzVNUlpKTnV1aXJuSnQ2?=
 =?utf-8?B?b1NsWFIzZ2xXMXNyQS9CZCtMT2ZTODlCVnh1VUVvMi9RTUZML01WeVliVU0r?=
 =?utf-8?B?T3R6K1VWU2lTWjB4K1FhQnY0NmxGQTQ4VHNJL2Q2YUZLeEN3UlB1LzNpN1dB?=
 =?utf-8?B?Y0NSK2I0dzR5Mm1lTzNKQUFwS3NoRU83QVZEdjc3OXFKM0N6S1h6dTFaVzRH?=
 =?utf-8?B?SVFQa0l5ekF2WTZOTUJ5MlhlcFFXR3g5YXBKRk9Dek1tdEZhUUpWeXpiRnJS?=
 =?utf-8?B?Rk9BR29INks0K2ZaQXJjdDhsdVVKb0Y2eTZVV1o4N0ZoYzdHbUhDM1JDYVRj?=
 =?utf-8?B?aG1ZbXVQRkVNTWdxcVdqcGdVbDJnbmtCdnBuMU02d1NBakpJK3lJKy9vb3Zk?=
 =?utf-8?B?SFlNSzMyTm9zZnJUNjk4bTJvMFppK3dSYmpLK09CK25VS2xrajJ2WFllMUhq?=
 =?utf-8?Q?gPQA8C0mxQU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0wrbWhReElRU3kvajRsTlRKR1dVWmYwRUNCTHpwQ1BJVm9CazFabE5qeCtO?=
 =?utf-8?B?cjNjYlBZZ2pLMXJRY2RuSjZyZDdhVzcrdkhic0Q3MDdadGNZQ1E0YXlOMUlj?=
 =?utf-8?B?OE10TURJMEZ5MllDT3dFRGpnUVpYRTZBQWcxSnZvNVhMejJtK0xYUmN5bXJI?=
 =?utf-8?B?dXlRYnlCM2w0NmZJWUNWUU5EOGt1V0IvUGtnc1BJOVRKQTBxS2pOQUJzeFNk?=
 =?utf-8?B?YnRWaXBFQ3FJVUp4dm5XMHJsdEhITXhGQ0RjVnVKZFJDT1ZRTmNpRysrYnl2?=
 =?utf-8?B?M2FtOFR5LzdzcjJFc2tWOHBQSlA4NWxZL25zcG92b3FuQjJCRCtCSlNHMm1a?=
 =?utf-8?B?RlRPaXB4S1Q2ZzIzbXloSyt4M0dCSHkwTk40RnJJejFpTjNUL0dDbmJZZDBu?=
 =?utf-8?B?TVJidzFXbUZOQk5DTnlkaDZ1ZXBKMmw4cC8wY1gxdjVpYU5LZlQzVGEzbHhn?=
 =?utf-8?B?L0NKNDZPZVZTYlprUjZFOWYzTit6ZHZRS2Z3TkgzTGRFb2djNWJ2WWZkeHVI?=
 =?utf-8?B?Q0VHdm5POEJ4N2I4NHpLNHYzZXpZb3U0U3gzUUp5ejlyU0hjS0JEZDVlT3dD?=
 =?utf-8?B?Qm95SDhEa0tIYlhVbUw3UkhHNEphMWU4K0lrVExzRkIwb05aM1RDdFFCaFpJ?=
 =?utf-8?B?S0NoTkZ2MENSNDdKejZ1SzdMZzU3U0dodDJpOWU0TFdaVG9Tc0UzTkZKK00y?=
 =?utf-8?B?UGFhK0NseUJGb0h6S25DSFpDVFlpV25qMWxsYVdWeER2am5kbXcwZkNtZ1Er?=
 =?utf-8?B?ditIWXBDOU54Y2FJc1JUemZyd3R0R0ZUTHF5R1Q0N3N3QTRGTnh0UXVFVHRM?=
 =?utf-8?B?WUZDSDVwelJjYjcyeDROd0FKMDZ3Wm5xc2x3WEkyUW1UZjE3Z2ZPNW9Ubmlw?=
 =?utf-8?B?RGk2Ni9IZXpTU3hNRng3eUVXZGVTZDFNcXRHZk9zQkZHblp5TWJQc3lPSDdj?=
 =?utf-8?B?RjBGbWc4cW16REw1dEpWbytXQTBuUXZnMFBKVmJiajNSeUFWMXYvZWZra1Nj?=
 =?utf-8?B?ZTZORnRCeGdaaStSY0JJc2VpRGtwSXlhVXBlQXA3SlppV25wNmRTUHZ6VUZx?=
 =?utf-8?B?L09OQmlnTXNjajhiUUZOd0c0c0pMSWE0Mi9RZTRiM0oydHk3OHE5aEpIaEl2?=
 =?utf-8?B?UmFCcU8vd3ZUQlRxVTB5UURvWkRITGZwVkMyUnpSSENDbitGY1pNQ25USlNV?=
 =?utf-8?B?ZTYyMU1DVW83cW5ST3RIcm5xT1dETTJsN3hTaW5tSzNzTk0xTEZDMFppeWVY?=
 =?utf-8?B?bks1c1VhYTVMdWJSaGVwRkxnbXR4ckVUcncyOGpoUjhRdnVNZWcwZFdXNXE4?=
 =?utf-8?B?SjB4TS9rU1BrWUs2QzlyK1ZVb3lIcEwzU2pjMENWeCtyTmFuRzRzVjF3ZkUx?=
 =?utf-8?B?a0FXS1Z4RFN0SFFiU0tXRjNvUHRZSGVCQWxSN3pqcHFkT1hoR1RNMm0zWVpN?=
 =?utf-8?B?dkFwb3h5Z2E5SFkwNDczL0FoYk9VRFYrZS9xdnI1TEk4NW9YU3cyV0txUFZo?=
 =?utf-8?B?eU8xWXpmOHVuK3MyUkJLRC9yZGFMQlY2YVFDWlpZRFpWY3loeGdXamo1VytL?=
 =?utf-8?B?ZWp3TU1aZDRTTnhpZWVvbVJ3SGYwUzYrR25aN2pSRUpHRnFtR09ONnpmTlZn?=
 =?utf-8?B?MkZVWk9Dcm1iWVpSUFp0UWZVd0hjaWtiaHV5ZjRLNDJlMytpaVVmRGNTRm91?=
 =?utf-8?B?aXhqYkVqejUyd3ZyckRRUEd3SzNOaGR5Y1MxOElTZjB4RGFpWW5rVXNhY0Yz?=
 =?utf-8?B?cjZJRjZDTXNyRHE2cjZDUzdma0xjL2ZhU3NGTXhsL00rYkI3dTBuSjlrbmZ0?=
 =?utf-8?B?U1NyUXRUTE9pMm13b1J2SG9yZWl1QmpBYUU2RFlNVlRteERXMHFFRGkvK3JR?=
 =?utf-8?B?b01aSC9EOEY5eFlRSS9mOEVrbStra3ZYUXAzTjhZOWpILytlcHNhN1hXeng3?=
 =?utf-8?B?aVpzOUE3VFhxOUYrUUNuR2FpdG9heEV2SENYeE5Vc2dGTERSRUhXcjU4bExB?=
 =?utf-8?B?RmRqUnVsYXJGSnl0R1pSMW9ieTA3NnZYVkFCZU93VnhSc3d1RjQvaEk4NDdp?=
 =?utf-8?B?SkRsYUJHOWpQQkVPdHZ2Vm1MRUczRXVCYWw5QjdqaWQxLzRTT0Z4QmVqNVUx?=
 =?utf-8?Q?3TeiowaHRHQB7AIcO2Yjl8udt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4c6311-c71b-400c-bbdd-08dda72917b3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 07:41:49.2201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zpeHtgzAki2PoimubjuPmJDmM6YzpYVzl6qdPZuloxr5YsqrWrpfbc9GStSNmTcs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7205



On 06/06/2025 18:48, Ayan Kumar Halder wrote:
> Modify Arm32 assembly boot code to reset any unused MPU region, initialise
> 'max_mpu_regions' with the number of supported MPU regions and set/clear the
> bitmap 'xen_mpumap_mask' used to track the enabled regions.
> 
> Use the macro definition for "dcache_line_size" from linux.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from v1 :-
> 
> 1. Introduce cache.S to hold arm32 cache initialization instructions.
> 
> 2. Use dcache_line_size macro definition from linux.
> 
> 3. Use mov_w instead of ldr.
> 
> 4. Use a single stm instruction for 'store_pair' macro definition.
> 
>  xen/arch/arm/arm32/Makefile              |  1 +
>  xen/arch/arm/arm32/asm-offsets.c         |  6 ++++
>  xen/arch/arm/arm32/cache.S               | 41 ++++++++++++++++++++++++
>  xen/arch/arm/arm32/mpu/head.S            | 25 +++++++++++++++
>  xen/arch/arm/include/asm/mpu/regions.inc |  2 +-
>  5 files changed, 74 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/arm32/cache.S
> 
> diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
> index 537969d753..531168f58a 100644
> --- a/xen/arch/arm/arm32/Makefile
> +++ b/xen/arch/arm/arm32/Makefile
> @@ -2,6 +2,7 @@ obj-y += lib/
>  obj-$(CONFIG_MMU) += mmu/
>  obj-$(CONFIG_MPU) += mpu/
>  
> +obj-y += cache.o
>  obj-$(CONFIG_EARLY_PRINTK) += debug.o
>  obj-y += domctl.o
>  obj-y += domain.o
> diff --git a/xen/arch/arm/arm32/asm-offsets.c b/xen/arch/arm/arm32/asm-offsets.c
> index 8bbb0f938e..c203ce269d 100644
> --- a/xen/arch/arm/arm32/asm-offsets.c
> +++ b/xen/arch/arm/arm32/asm-offsets.c
> @@ -75,6 +75,12 @@ void __dummy__(void)
>  
>     OFFSET(INITINFO_stack, struct init_info, stack);
>     BLANK();
> +
> +#ifdef CONFIG_MPU
> +   DEFINE(XEN_MPUMAP_MASK_sizeof, sizeof(xen_mpumap_mask));
> +   DEFINE(XEN_MPUMAP_sizeof, sizeof(xen_mpumap));
> +   BLANK();
> +#endif
>  }
>  
>  /*
> diff --git a/xen/arch/arm/arm32/cache.S b/xen/arch/arm/arm32/cache.S
> new file mode 100644
> index 0000000000..00ea390ce4
> --- /dev/null
> +++ b/xen/arch/arm/arm32/cache.S
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Cache maintenance */
> +
> +#include <asm/arm32/sysregs.h>
> +
> +/* dcache_line_size - get the minimum D-cache line size from the CTR register */
> +    .macro  dcache_line_size, reg, tmp
> +    mrc p15, 0, \tmp, c0, c0, 1     /* read ctr */
Why open coding macro CTR? Especially if below you use DCIMVAC.

> +    lsr \tmp, \tmp, #16
> +    and \tmp, \tmp, #0xf            /* cache line size encoding */
> +    mov \reg, #4                    /* bytes per word */
> +    mov \reg, \reg, lsl \tmp        /* actual cache line size */
> +    .endm
> +
> +/*
> + * __invalidate_dcache_area(addr, size)
> + *
> + * Ensure that the data held in the cache for the buffer is invalidated.
> + *
> + * - addr - start address of the buffer
> + * - size - size of the buffer
> + */
I do think that for new functions in assembly we should write what registers are
clobbered. Arm64 cache.S originated from Linux, hence it lacks this information.

> +FUNC(__invalidate_dcache_area)
> +    dcache_line_size r2, r3
> +    add   r1, r0, r1
> +    sub   r3, r2, #1
> +    bic   r0, r0, r3
> +1:  mcr   CP32(r0, DCIMVAC)     /* invalidate D line / unified line */
> +    add   r0, r0, r2
> +    cmp   r0, r1
> +    blo   1b
> +    dsb   sy
> +    ret
> +END(__invalidate_dcache_area)
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/arm32/mpu/head.S b/xen/arch/arm/arm32/mpu/head.S
> index b2c5245e51..435b140d09 100644
> --- a/xen/arch/arm/arm32/mpu/head.S
> +++ b/xen/arch/arm/arm32/mpu/head.S
> @@ -49,6 +49,10 @@ FUNC(enable_boot_cpu_mm)
>      mrc   CP32(r5, MPUIR_EL2)
>      and   r5, r5, #NUM_MPU_REGIONS_MASK
>  
> +    mov_w   r0, max_mpu_regions
> +    str   r5, [r0]
> +    mcr   CP32(r0, DCIMVAC) /* Invalidate cache for max_mpu_regions addr */
> +
>      /* x0: region sel */
>      mov   r0, #0
>      /* Xen text section. */
> @@ -83,6 +87,27 @@ FUNC(enable_boot_cpu_mm)
>      prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prbar=REGION_DEVICE_PRBAR, attr_prlar=REGION_DEVICE_PRLAR
>  #endif
>  
> +zero_mpu:
> +    /* Reset remaining MPU regions */
> +    cmp   r0, r5
> +    beq   out_zero_mpu
> +    mov   r1, #0
> +    mov   r2, #1
> +    prepare_xen_region r0, r1, r2, r3, r4, r5, attr_prlar=REGION_DISABLED_PRLAR
> +    b     zero_mpu
> +
> +out_zero_mpu:
> +    /* Invalidate data cache for MPU data structures */
> +    mov r4, lr
> +    mov_w r0, xen_mpumap_mask
> +    mov r1, #XEN_MPUMAP_MASK_sizeof
> +    bl __invalidate_dcache_area
> +
> +    ldr r0, =xen_mpumap
> +    mov r1, #XEN_MPUMAP_sizeof
> +    bl __invalidate_dcache_area
> +    mov lr, r4
> +
>      b    enable_mpu
>  END(enable_boot_cpu_mm)
>  
> diff --git a/xen/arch/arm/include/asm/mpu/regions.inc b/xen/arch/arm/include/asm/mpu/regions.inc
> index 6b8c233e6c..631b0b2b86 100644
> --- a/xen/arch/arm/include/asm/mpu/regions.inc
> +++ b/xen/arch/arm/include/asm/mpu/regions.inc
> @@ -24,7 +24,7 @@
>  #define XEN_MPUMAP_ENTRY_SHIFT  0x3     /* 8 byte structure */
>  
>  .macro store_pair reg1, reg2, dst
> -    .word 0xe7f000f0                    /* unimplemented */
> +    stm \dst, {\reg1, \reg2}  /* reg2 should be a higher register than reg1 */
Didn't we agree not to use STM (I suggested it but then Julien pointed out that
it's use in macro might not be the best)?

~Michal


