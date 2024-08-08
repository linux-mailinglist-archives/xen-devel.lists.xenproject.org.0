Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C864294C1EB
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 17:51:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774405.1184857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc5PC-0007dO-08; Thu, 08 Aug 2024 15:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774405.1184857; Thu, 08 Aug 2024 15:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc5PB-0007br-Tc; Thu, 08 Aug 2024 15:50:21 +0000
Received: by outflank-mailman (input) for mailman id 774405;
 Thu, 08 Aug 2024 15:50:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eqo7=PH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sc5PA-0007bl-Dz
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 15:50:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20621.outbound.protection.outlook.com
 [2a01:111:f403:2009::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8618f6b-559d-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 17:50:17 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.15; Thu, 8 Aug
 2024 15:50:13 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7828.024; Thu, 8 Aug 2024
 15:50:13 +0000
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
X-Inumbo-ID: e8618f6b-559d-11ef-bc04-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xW0tTbA82r29sEfHTAIpURKkYWzd+YJCO6u8bxdhObWfIZ3P+3XeIh5VeoSHQ2bXLcDjJ4DLpRkf4JE/xXtkZ78mSoe0+xFTBR/5B2pAl8TCmFlxHQvA4W1xG8mZuUHjdFfwXejLcr85BrlW8Ceu4I6N0cCaS9RrQESAjXokGvziqulemXXKNN2uAebvzrtVO14nkrbNseui6FCboYSNdb80ywUTY/Ycd4M8Iln4XxeKElv1RW6BQn9MHedD4nyljjgqdCEZM0KzGwfEbaQO4YnMrHBEBYxySizU3qhoSgKGGe6cpsfPYLEPmqUymV4j59MbUIULG1JGMqqrtvUXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyitCXqEbTERU7nFSSyE3+PH9eypHEnE3aJSa5KpLkM=;
 b=nZDktst9v3fvCdkHKj4K1rl13TFjQgK9r0b3OgsHcZ6MEYTn6hadjDh1eHINAtxJHtdJGs+0en+Keajxg/c0w0m0iYVa5u8ikeqFVwvuldwiui6SKS+Qhrn8x9HQV9gBQpmJBpzuSRm7cD7hwXXXcGRScn3CD9526wv11nWGUNN92KnszQGURGbIsPtSoqtze03SkqgwzyGX2htybZd1iE8vjeHroYBds7LIdzkIdmg4hgsXQq6ge3sPaM77b+yq8DA3HRIikgORAtbBAvzAYDGQFGOQXo1DaoXxrByBnhD7A6wPktf7meHA5mNVw2u9crP2cgq4dstIfrKm8v8wpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyitCXqEbTERU7nFSSyE3+PH9eypHEnE3aJSa5KpLkM=;
 b=C4SlaTdZCFKtREzNmqFi6OyKBxotFXmMAA7AMVaH8Uh8JL86R9NV8hTDjuObYD1YRFAZRvM07Pud5R1CwAwH3RQrWaBvv3ifNEDGwGxkCQhmtBOmNENsQIagAT6D4KPinzBPfDLQMVR9xCcIM9IHxhNaq36CIyo3VukgFoEipKY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3c491d8f-6180-46d7-a996-049df88a023e@amd.com>
Date: Thu, 8 Aug 2024 16:50:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen: arm: make VMAP only support in MMU system
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com,
 julien@xen.org
References: <20240808120936.3299937-1-ayan.kumar.halder@amd.com>
 <20240808120936.3299937-3-ayan.kumar.halder@amd.com>
 <bc643306-a41a-41bb-b7b7-b7c67f9e5bdf@suse.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <bc643306-a41a-41bb-b7b7-b7c67f9e5bdf@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU7P190CA0003.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:10:550::16) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: aa91a4bd-ceed-4b3f-1a37-08dcb7c1ca79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzRBN0Z0RGpoci90amRXMEl6aURiZ2ExajBRSnBXWlViRk9ERWJmZ0dYc1h3?=
 =?utf-8?B?ckxRQ2s3TEZWTVh1bVhGT2VDK1NCdW9sY3U5eU5rdHc1MHB6aG00TGpWR3M5?=
 =?utf-8?B?ZjFIT3RXNEp1bHpzaFYxZnVQU3FPUXJudGVQZEZJK3k0Q0ZVQ1VsZXNMSkYz?=
 =?utf-8?B?Q1dJM3JTZ0R3a09UUVV3QmYwME5hZCtlOEg0UThQRldkYSt2N0pMbC9LdHZM?=
 =?utf-8?B?T0Frdm1IeHRsbFJONTFiY2dWc0N5QnN0ZEZ1ejV4SHdZRU45TURxaHVnYVpI?=
 =?utf-8?B?YzdGeEQwaTdzL2U0TEhhUlhuKzBPeGdkT0tjVzBJYmY3Z3F4bTZPRWxSZkRG?=
 =?utf-8?B?TktEYW9hMzJ0RkFyeTJ2TmlXYTZsM2FMZ01nU1ZVRmdqUUZXZG94cmNhTVg0?=
 =?utf-8?B?dExWWWk0U2daSGZWNUNuTG0zQk1KMHNUUnkxM28xRGhnUkowOURLZVNST0Zn?=
 =?utf-8?B?UUNPM2Nmam5WZU1wYnZrSGVyN2FYOWtXTGFYcTVweElBVEpSaXlHZFFZTDFk?=
 =?utf-8?B?dHBPWmVDeUR6cjNia1p6eWp5SGhwM0ZDU3lzUmxWZ0ZqbnZaWTBMdHA3ZS9k?=
 =?utf-8?B?ODMzb1kwK2Y1enRLd2ZHb01BNjlNd29SVUhjUXJkd1EwaDJrV3BPak9HcGUw?=
 =?utf-8?B?R1ZoOU00aVY2eGUwRTN1YVBMMEdKaUppa1NyUkZ1aFNuZ2pvWEVreERSTVpv?=
 =?utf-8?B?cW9mak9aZ3ptYzZkSk1xTXM4N0VoR2gyY0RHKzVIM3VJcTBOTkJsTjVlZEow?=
 =?utf-8?B?Z1lxSFBGSHNBRXVpTVVTOWthRWVOL3JzZkMyVUFCNFNYMHJWQ0N2TzlUd3Jx?=
 =?utf-8?B?WkJXRlN3N2RNd3pjSDlFMk1TSFRWOTBnbWZGK2NVQm5kcU9zN3lSbTBFOEhT?=
 =?utf-8?B?R1liKzNZWHhCbkV0NWE2elluOEJDOEJwRnZYSW16Y3V6QzdoTXRWK2k5Y2N6?=
 =?utf-8?B?VXBtckRnNmd2RVpoOTBXeUlpdGwwT0Rxbm8xcEZETzNaODMrZWk3QW9ERDdk?=
 =?utf-8?B?ZzlvS2E0cTdIUm5JNVd1dHJnenpGb2FPNkJJejFwVSsxK0VoQitVbjNEa3l2?=
 =?utf-8?B?V2ZZZHQ1ZXlxN012UW52ekptQkZvUmZldzhhaHgvdk9mL2I0cCtjSFZRODMy?=
 =?utf-8?B?MUo0WDNKL05QWWZkeWV5V2dYWjBObkhlL29tL1djck0wa3QreDZQU20rWUNu?=
 =?utf-8?B?dVg2QzFiOG03YVpnZVdZZEZKUDd2cVBWZVIvcm1PREhjNmg5bDBiVjZFeHln?=
 =?utf-8?B?WXczZkpuSDVaY2ZsRGZkTzNrc05jSVo2QkM4citKN3c0YjNCNFFXWXB0Q2RQ?=
 =?utf-8?B?c2dzdzVSQmxaQVhEem5DOXBtMGlWSGQweW0yMTlaWjFUN2JIcmg2elVaUzIv?=
 =?utf-8?B?MDZEVEx3a0VsRHJTYld2bEZFQ0RzVGFqM1RlRmhmNWcwOENqZWJGSXJ4Unl2?=
 =?utf-8?B?OG5Jck1oR3JzRGpkeGl4ak4zR214ZUJXbUUvd0pKTEFoZ1NvL0dIWWpLMXZx?=
 =?utf-8?B?VjRoVjkzVUtyVHJBM2c0dFllTU85bWlvTTB1Uzgrc3Zhd213Z3RQeWdYUWNK?=
 =?utf-8?B?YVhIbXgrTVZaUGlKRDljdm5FVHkrUUlad1VHT1RMcVRZOHFNU012YklLWXNX?=
 =?utf-8?B?ZjJZbldJankxdERsYmJqeDh4VFV1T0pvZlFlN3M1Z0k3ZHFIT1JuU2k3eXZp?=
 =?utf-8?B?cHUxTWJFb2Uxczh4b0tGZzAvZnVOSm1OOGZuTkd6ZmFqTzlnSlJodkxwY3hl?=
 =?utf-8?B?Z1RmZ1l2YjhoNk9iWElCQksxM0xkQ1Z6U0tramZROXB6SUNSTEgzdCtDaEpX?=
 =?utf-8?B?T2loL21Dd2RIOSt6bkFMUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1pMVzdOTEpuWWdPQnc5MXoyL1ZhemdHc1QxZUhRZFRMQ3YxVlFKLzhVUjY3?=
 =?utf-8?B?dHd1dU1oS3BTQ2RjYUR2S215aGFtSEwzdE0zVFpuRXYyamNDaTlFNmVrQmU3?=
 =?utf-8?B?ZUJ3L1VyTVhqU3c4NWd0c281LzI3RFE2WFNqK3VEU0o4VExhditMMWhWZXgz?=
 =?utf-8?B?UXBHODRZZ0RhR0FvWlljQzg0cTBRVXh4STBVelhtZ3JWMXcxSDA2N1hJUDhm?=
 =?utf-8?B?MEljZTNucVdJSlN5WkxMcFdvdmVvT1NUQ3lLQURyZWdBNUFqRTd1ZVVtRkdV?=
 =?utf-8?B?L2o2azFyL3l3SUpKUVZSdmJITDZ2V3FGWkhjaDY2NE5KOUdnaEkzbmIzNWFZ?=
 =?utf-8?B?ZjV1bVAxMmtyaFEyNjZaa0VHbFo0VTRvTmFUNlo1YTNhcWdYakxic1hhUlg1?=
 =?utf-8?B?cVdCYUI2QWJTM3R1THp5N0o2UTdKbGhwOXhGTEVrbUUwUzQ4bm11ZjdrWStZ?=
 =?utf-8?B?N0d2b2QxVjl6QXFadWxINytYRFREK0FCR0VYbnZEU05FemtJdFZoK2JScjlW?=
 =?utf-8?B?emdCdmRwWG1EQUxZRXZDaVRzbHdFd29DVDFTN2pJaXRlWXpxaS9GUjdGNWto?=
 =?utf-8?B?cW1vNEIwMndTYk1XTURsaHg1NWVkL05WSGR0MjRIUU4wVHRibXk5bjEwdWpq?=
 =?utf-8?B?eTduUjNHM0p3MDgzckRlcnYxZlZMWmZVcDQxOXdHSHA5ZVd3OUprTk0rMmlN?=
 =?utf-8?B?MUc0cEwzeWFGcVRqZ29XLzBld2NhakFYRnpwNmcxVHdoZnlYMkxoRURrRmhD?=
 =?utf-8?B?aDMwcm5RQlB3UGtKVGxmazFlV2Y3RGRIVlZOMTJWaGYwd3ppRHlUOGpIZ0Jy?=
 =?utf-8?B?MkdWbncvUjBnUFNhV1dRblhVSXRkZlREVE5ha0VoQnUrMVFDZG5wVEIweFRi?=
 =?utf-8?B?b05TaVdRamR5TEhqaEJob0hIdDNEem93dXFsU2xlS0llT1hEMkY3MWw0Vmwy?=
 =?utf-8?B?NGxpZG9rTzNqOTJuK1V1TlNaNzFLN0JIaitrbjVpOThwejMwSC9XOTVUakw2?=
 =?utf-8?B?WWZhcE9TemVRaHFOdElyRSsxRGZLSEFKYTB3L29FM1BucmdUaGVJMlNmVjcx?=
 =?utf-8?B?VVdwWE1HcldNb1Q5Qy8rcTZmZXg5OFVNUEhXUVZCS0JKS2ZFeXdZQWR5S1pS?=
 =?utf-8?B?WHNEbFdqdmczTnlPaEFDbEpTVngyV2drV1JLK1lNMUJrMTRJSWoxc1FpVjJr?=
 =?utf-8?B?eFpKOHNBcjdUcHVhODlNWlRObUQvNExpWmNiZ3RXazBqd21pdzFRR2hGRjBn?=
 =?utf-8?B?NTh5ejFJaGpYemlmd2d4ZDA2SUtoalpjbUNhVGVTeHU5RFVwZnJVTlo3Y0R0?=
 =?utf-8?B?akt6NkJBZ1FKcVlZNjI3RnVBVVk1eE5TRVdIZ3UxVU1qSTI0amRoUUhWcXlh?=
 =?utf-8?B?TkRBaWpPTGl2OENUMzExTW9rSXNJMTFEeHpkMmd6a3hGWm5hMDNvTzdDam12?=
 =?utf-8?B?YVlsSGxTVkRTNlpRdHVhYWo2MDRONENPbG5FUzg5cUhLUEpSV29kZHJFM1Z1?=
 =?utf-8?B?Q3lMTU13K2hFM0w1aHFrcmxtSjdBdHgva3kvTkJWNVp6Z3hNa3MzZUZUWlRr?=
 =?utf-8?B?T3N6Umh5QVVoM1o5Y0x2a2ZSMmRVYSthQTJjaU5HcFI4MUcyNXNtRElpT3Zo?=
 =?utf-8?B?cjFNZ2Y3S0V4RFhLSmtBSjlZc1l4T3NSOW5EQllmbmh5Nlg3K3IxMlY1akpN?=
 =?utf-8?B?cUwyWTNzMitVV2M2MURoLy90T0pnOUVSamJOd282TkwvUmxvZWM5d29LeUtx?=
 =?utf-8?B?MUNRNFdJTE5Fdy9QdGY5SUVrNExlR2tTZUswZmZYUHl3b1NiSGhQSEx6eGdp?=
 =?utf-8?B?ZmxIS0FJR2NaLzAzMVE5K3BxUmhRRjBGNEpkZExGMTBPdUVBc0ViUHhFZ2J5?=
 =?utf-8?B?aUl3eStia0dPSU0rUEM3T1FWWm5QMmw3RDZIaHdpeHIxNmx3UjFpam9VVE1Q?=
 =?utf-8?B?OVg5aHAxZjVnbHJIbnRBYkdVMmJ3ajNzQUR3L1ZwcEJkU1dLYW0vQm93RVhY?=
 =?utf-8?B?Z1QvWTY1bWIyN3pERVhUZVdJWDYrTnVWUVExemIxcEhPdUdGR1lJcWtvUnJk?=
 =?utf-8?B?TWNPd0VwbnpwL0lEVG83bzRFK2JLZjFkOXRjMWMrbEV0SUFoSE9LdHZ5Qkpi?=
 =?utf-8?Q?NgXnXzp5/xVyWrmQQWtraNr0g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa91a4bd-ceed-4b3f-1a37-08dcb7c1ca79
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 15:50:13.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F2cr8Q70f/OjjpXikR4DLvbb5tXywqT6y/kFFIEn2lN0Kt++ztJd2rpSQ3FVWhBWIMkdZG7KZFIWnrjFYki/QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

Hi Jan,

On 08/08/2024 13:49, Jan Beulich wrote:
> On 08.08.2024 14:09, Ayan Kumar Halder wrote:
>> @@ -58,9 +58,13 @@ config PADDR_BITS
>>   	default 40 if ARM_PA_BITS_40
>>   	default 48 if ARM_64
>>   
>> +config HAS_VMAP
>> +	def_bool y
> With this being always enabled, ...

I had to define the config somewhere. It seemed this is the correct 
place to define as HAS_VMAP will be turned off when MPU is introduced.

So, it will be

config HAS_VMAP

            def_bool n

At that time, only MMU will select HAS_VMAP.

>
>>   config MMU
>>   	def_bool y
>>   	select HAS_PMAP
>> +	select HAS_VMAP
> .. what use is this?
>
>> --- a/xen/include/xen/vmap.h
>> +++ b/xen/include/xen/vmap.h
>> @@ -141,7 +141,9 @@ void *arch_vmap_virt_end(void);
>>   /* Initialises the VMAP_DEFAULT virtual range */
>>   static inline void vm_init(void)
>>   {
>> +#ifdef CONFIG_MMU
>>       vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
>> +#endif
>>   }
> What about non-Arm, which all have MMUs but no corresponding Kconfig
> setting?

AFAICS , the only file that is of our concern xen/common/vmap.c It is 
enclosed with VMAP_VIRT_START which is defined in mmu specific file 
(xen/arch/arm/include/asm/mmu/layout.h).

So, it will not be compiled for Arm MPU arch.

> And why is this not CONFIG_HAS_VMAP anyway (with HAS_VMAP
> properly moved to common/Kconfig, where e.g. HAS_PMAP also lives,
> and then unconditionally selected by all other architectures)?

I am not sure why CONFIG_HAS_VMAP should be moved to common/Kconfig when 
it will be selected/deselected only for Arm architecture.

- Ayan

>
> Jan

