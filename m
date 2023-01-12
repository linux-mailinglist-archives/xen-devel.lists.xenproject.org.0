Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FEF666C24
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jan 2023 09:11:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475883.737762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsgI-0005q6-SQ; Thu, 12 Jan 2023 08:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475883.737762; Thu, 12 Jan 2023 08:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFsgI-0005o7-PX; Thu, 12 Jan 2023 08:11:26 +0000
Received: by outflank-mailman (input) for mailman id 475883;
 Thu, 12 Jan 2023 08:11:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmgi=5J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFsgI-0005nz-05
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 08:11:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2053.outbound.protection.outlook.com [40.107.8.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3c50771-9250-11ed-b8d0-410ff93cb8f0;
 Thu, 12 Jan 2023 09:11:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9520.eurprd04.prod.outlook.com (2603:10a6:102:22f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 12 Jan
 2023 08:11:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 08:11:22 +0000
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
X-Inumbo-ID: b3c50771-9250-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8H+cCLnYeUtZ4rJi+HCktWJdNFdupoL2hPpY4d07Xa4y+CEZVplfe4+vu8guJe6T0nhI6OfBoHfVQ0E89SXZe1EZk/2ROqi4euoCoFWI2J1PoAiPOnFwlvnHFNRSaXC5+1wpkDMvJKNyzIw06Od0MxiGcLUZR8ZOdL8NxL4N+DS60tCBimPUenl5+aNeh/o36RBq/pXgl6l5ylJK3EmqR+YMkQ1bAPIqfmXQ7tTZ9U5pfL/5GQBzV3wWlZhSlFinbWiJSCto/p24/cM6RXWl4mWKQD+5DCQwFeii8PH4eG+YdrBy0x/iD8ytHQYelNJWUMKJxL2GrUNialZMRJfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDymfTCZTo/ms0/4p7VbEMIg1/AAMShmhSBVQAO3fpc=;
 b=aUrJGbSl3TCgLnPkiCTNXpUGsKSQGTqCrp+4sW3/ZWd1MDSKj+Ij+IHf1CqJ3qnh1ow6p0plLXwQCGdRVbqCyKdZsLaIB7BfQSGfysoSCh8bQdWmS0WHGDxiFnLweBIqdFfglC9/I/ih3ULLP+LdRDfpbUQ02Nx6WHnO3Tm2C21XDkbNGEYoOlBQYSiJwUZbuXpAHCMuXiVLA4FpLuKVPxawhjwjKv/+Pjl3AH1hBmRg2q4UuX6VkDqoF88Vfr8x2h+U8sq6pfo2fh5BOidBdDDBWuPGPqF7dKHt/0m0ViLuO0317YInELpwftsEEDohR8/+4wMwXD0MvE5c3shKNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDymfTCZTo/ms0/4p7VbEMIg1/AAMShmhSBVQAO3fpc=;
 b=0FFjyHd+eK4nQpFhg9Nr6A0ETZ9r+aExcAE6roQW7gqpHwFjukYbmNmxknDXkrgMuSYRpqhJXhNcf6hi7/9Svyo6l822p7u9CBpHrHgvSiqbBsFSQ/dEaformK1qJJIRXE0x55k+rn7+khUr3OSPu5JZWixPwMCsYkxUuQk4XvEkUwdGuxum4bYmRP4rTQtjcS6UWZcNzx/FTd9TbBiHJ1Iickx9Kb/qeWwivbEOHtDXyHoj16DoZCpZFaH1eoJhC2ggV7s4BNIEese0sDmGwlAjkRKWRPMH7FKa4N7mIKtCGH/TD28ohZ2fJKYA6ltfoN7O041joK6Sor+gjMjw4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ee06b9a7-bfc7-e6f1-f2f6-f73a1fb42d6d@suse.com>
Date: Thu, 12 Jan 2023 09:11:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 03/17] xen/arm: implement node distance helpers for Arm
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230110084930.1095203-1-wei.chen@arm.com>
 <20230110084930.1095203-4-wei.chen@arm.com>
 <9fd67aa2-0bd5-16a2-1e19-139504c2090f@suse.com>
 <PAXPR08MB7420A4E3DA252F9F37450EDA9EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB7420A4E3DA252F9F37450EDA9EFD9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9520:EE_
X-MS-Office365-Filtering-Correlation-Id: 326844cb-b5b0-40b3-0d37-08daf4749756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BlWd71viJKp60g7lcwzARRRS0dDb0H0UtlNEIpoob0Epywzn+J8YfxDcRfN3P65l5KmBF1NyrtCKs9TbAj7CbZSwVnKH0NRAjTiZv8DTDoMxKe77yHTw5E4Ns8xxDVkjVidGMJMf4HKF11iMNewMhsAf/qqgKhwQJnMPPJJGqVn+lay6eUaFNNmYvz7RH7hwJs020xNIQLwM9swoAGL27dJzfFiNciDyhOXZ4Y84UW/aiFj0e+kfZzJPwvGs31BDu8OzRzYT4eIOQGYA+EwgfGiBZUeZZnj2zzWqvGvE79xJ3P3tMe1qaiL1AsGW9AIpJcFQl+OY9Ow+7uFBoJDMPilEYVCEbt6Dk+Ct3taCfPeTZkHm+VIBxnu4Z3UvYtEyOHjnHcWWbRcyhnhR+f3JvJNCSQv3giK63tuwaaTDpls24P0EatbdkleqtVSY27x3YYMGIR0aTsokM84q0QX66H14VQKCKwZGUlF4WUhIdI66QkAkUh1Z40wGmL6sGI3zsvsnOHqabxhho+NgANptxzDA9+hpPbU6wduKeXhJGa2+1VA5COKCLbnuhdKD5bYO52WffJWX8WzaiYdNnsuYdG8BTHR62qf7K9DWmmtIaqZbKNYVp1/xuaHZRlxktKNEZ1UbPtaGvfBxIkug2WYySW/aeD+Hbtxd/vKVSOkDtGb8RAMRyZxDe7kucfvLOuXkmAzENCschvXgCtlOVwXbfPa7ier9mqPs4R0DDpU6iS4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(136003)(366004)(376002)(39860400002)(451199015)(186003)(6512007)(26005)(6666004)(6506007)(8936002)(53546011)(7416002)(478600001)(31686004)(6486002)(316002)(6916009)(2616005)(66946007)(66556008)(66476007)(4326008)(54906003)(8676002)(41300700001)(36756003)(83380400001)(5660300002)(2906002)(38100700002)(86362001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHJ6V1paSWNoYTg3SjRZbzdQclJlcXE5dXMvNlF2WitmL0dYR09GZHpIU0lq?=
 =?utf-8?B?WUlZRDNUY2FsSi9vZE5JNVdGRjRMZ1pSQURqNldjblArZWxZeWJCOXg4eEpN?=
 =?utf-8?B?WmZJV016MjhFLzN2M09LVlZaQ28wZFREVm5WSUg2U1NtWWkrbUNaZFkvcDc3?=
 =?utf-8?B?TXg0SW1xeWhScG1POGRjSTZkd2pZOWNIMTB1NWx5dW9iZXIxb0V6TzdwajVV?=
 =?utf-8?B?MzdqRHhyaTN6QXVhdC9taEdCZWtrVGFTdHJPNld0bnRsTWlLaWw4MFJKa2tX?=
 =?utf-8?B?eGFtLzJoNXRnTTRja0Z1RkQwZ01scms0amEvbFJDeDlnRERsazlNdGJ3eVpZ?=
 =?utf-8?B?blBnUnhtRlNrYVRJbGpxeHRodUVwWitRTHhjR0Vub2dZblYzSGFJdVJYZzdE?=
 =?utf-8?B?eFhHQjZhczFDUDZSVVMrd0duTnpXVmdVZzJHR3NHZmw4Qk1jcW93Z3dycEI5?=
 =?utf-8?B?aC9Mei9GNnY1RXM4aE90THJEZ01sS2tYUGlmZE5vR0pwWmlQZDlWa05VNzJF?=
 =?utf-8?B?OVc2TXpxNXJKNHZnd2RsZ1BYRzI2Z2Z6ZUM2cnlUbTNiSG5CUlRnajN4ZzBN?=
 =?utf-8?B?L0dYTGEyMWtra3ZtZDhiT0NsMlR6bWRJY3d4cGlSYWRsejB2aDVOZ0NKMVVF?=
 =?utf-8?B?Y3BkTGpESVo2QnJ6M3FpNlJNdHVVdnBGbXRNZHZnOVljc3NFTCtMd0Zzc2hT?=
 =?utf-8?B?VTF4Q3k4TzJWdkMzVjNxa1JQTmRicS8yNTZQc3dmUGhnc0g3aHJjRWlHcG1j?=
 =?utf-8?B?YW9wWnlVd0toa2hTRXhQRUZHRi9HUkVBMVU5Smpoc0FnazFReDRybUNSRmVR?=
 =?utf-8?B?UFdzOUV3UVp2L2VQZXg1d0lGK0huRWZyUkNyS0poVEY4K0F3Yk9Yay9MLzlG?=
 =?utf-8?B?Qk05VGVtd0NXd1k5RXNuWndlbnQ3RmVmb21aTVhHV01CWkdEUlRzOUI1MlFM?=
 =?utf-8?B?M3JlR2t3RHJRdWZ4SnAzeklaZTBZUFN2TWhET0hZUnViL3RUQnllb3hqTW1K?=
 =?utf-8?B?K05sZzNvVTkzK1N6eFQ0akZ0b0VhZ2ovcmFwc1lJUDcwbkE1QzlQeTR1U2FI?=
 =?utf-8?B?Skp2TEMvWllSMWxRRm4rQmxEeU5GWWFUTWlSekNnLytKeUNBWUFhWnhNWWZC?=
 =?utf-8?B?MjBGMkRJUEU4ME9vUTlyK09UTldKbHh5SVVYSXQrNzR0bThldHdNWWc4aCtl?=
 =?utf-8?B?SHYzcG1PWXV1czlDOWJXWk9jWHVlU2VtTGNuV1lFWkZjT09aU0YwZmd5Z0U1?=
 =?utf-8?B?LzNxTE00T2RFTmllNDFTclpVRWt0a1VQdnZjV2VRVDNtdkw0cUdEcmpZY2lu?=
 =?utf-8?B?QUpvM05keko0WVdKamhpbXJUMittaXl1dVVtTDVoVStNRlR1b2FSOWxzenBv?=
 =?utf-8?B?SEV4RER3WXdMM0hJTkZvOXJ3NmhxOFdVY3RGc2YzVGFqL29wWmRWNU03SS9r?=
 =?utf-8?B?Y2IrWHJER1RYYlRDVGNtOEg0a0Jkbmh0MXZ2RWlDeHY1UkduT2JxQldIelAv?=
 =?utf-8?B?cm1uL2x4OUl2UUJrUEJaZHFkWXFSejlFR1E5cTFSNlZzL1NCeGw5ZXcwNzR6?=
 =?utf-8?B?NktJazJ5TVd4cjBvczFPTXR6L2VqR3VHNnRuM3B3aWExdUVDU1F3K0RDd0NF?=
 =?utf-8?B?ajlhREVvVk92SmpMTjI4MDhSMU8xNjVsc21RUjlkWnlhMnoxaXM4akVJNGJG?=
 =?utf-8?B?b2EzVWNFSjNoaVF2MDQxc0w0VlQzWitVUlVWSXVUVklPbndsV1BhNHpHWWtr?=
 =?utf-8?B?NXdEaUhOZ0hQUUNTZWROVFMxd2JxQmxSMnpRS0JKTk0rb0hwSVdRbG1ra3lZ?=
 =?utf-8?B?ZzRLRHBnUlZsbVdLTzdjSHZ1RWVVUzMvK1lDMWJVOUhvQVhUTHF2U1l0YWxC?=
 =?utf-8?B?Q2s4V0djZVFaYXNtNlRyd2M4RHJ3ZUZxeE9yVzNHYkQ2WnpXZm1GelowQ01k?=
 =?utf-8?B?NkFwaHloZEZFSkRSS1FOWUFucXhJL2JMb3BPTWRBemhEdjdqd0hWYm52ckF0?=
 =?utf-8?B?aWtNSkdodGxYNHFEcG53UkZOTW5VTUM5cGhmNGRBaUpUU1hqb2FFQzgvZE1m?=
 =?utf-8?B?U3ZmL29YTjZlMTE4MHYyelI5ME9TbGE3MFJOMk10ZTQxbEg3WDZneG84VXFB?=
 =?utf-8?Q?dyZLX2KBkFM7fp6BAeQ1wdPL7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326844cb-b5b0-40b3-0d37-08daf4749756
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:11:22.0447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4yxblY93uDvC1Vuqunfpf0AtgiBWpszZLilF1wOGppqFnIOxYq90AyQMxCYZT+a/cmhp9MhGzZgIhoAjZgF+Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9520

On 12.01.2023 07:31, Wei Chen wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 2023年1月11日 0:47
>>
>> On 10.01.2023 09:49, Wei Chen wrote:
>>> --- a/xen/arch/arm/include/asm/numa.h
>>> +++ b/xen/arch/arm/include/asm/numa.h
>>> @@ -28,6 +28,20 @@ enum dt_numa_status {
>>>      DT_NUMA_OFF,
>>>  };
>>>
>>> +/*
>>> + * In ACPI spec, 0-9 are the reserved values for node distance,
>>> + * 10 indicates local node distance, 20 indicates remote node
>>> + * distance. Set node distance map in device tree will follow
>>> + * the ACPI's definition.
>>> + */
>>> +#define NUMA_DISTANCE_UDF_MIN   0
>>> +#define NUMA_DISTANCE_UDF_MAX   9
>>> +#define NUMA_LOCAL_DISTANCE     10
>>> +#define NUMA_REMOTE_DISTANCE    20
>>
>> In the absence of a caller of numa_set_distance() it is entirely unclear
>> whether this tying to ACPI used values is actually appropriate.
>>
> 
> From Kernel's NUMA device tree binding, it seems DT NUMA are reusing
> ACPI used values for distances [1].

I can't find any mention of ACPI in that doc, so the example values used
there matching ACPI's may also be coincidental. In no event can a Linux
kernel doc serve as DT specification. If values are to match ACPI's, I
expect a DT spec to actually say so.

Jan

