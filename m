Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A81737BF0
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 09:18:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552486.862600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBs6N-0005sp-8r; Wed, 21 Jun 2023 07:18:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552486.862600; Wed, 21 Jun 2023 07:18:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBs6N-0005qh-5Z; Wed, 21 Jun 2023 07:18:03 +0000
Received: by outflank-mailman (input) for mailman id 552486;
 Wed, 21 Jun 2023 07:18:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RZUy=CJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBs6L-0005qR-4k
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 07:18:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062d.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c08d0446-1003-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 09:18:00 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8385.eurprd04.prod.outlook.com (2603:10a6:20b:3f3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 07:17:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 07:17:58 +0000
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
X-Inumbo-ID: c08d0446-1003-11ee-b236-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpyxFcUsHLmzgXgedxw7irf7JmkUXikwMuYAIjqNw3SXWmHIN39C0cXp/tqmPfROQdFu18I5Mu25eA28U1sudXTnEefLPKSHHXrBwZBcV1WjjxU599cwaV4gm4xotJeGOok4msOIm7JQMiuo4aES5+mEQ/4nHqXuVhBOWmdiyBunWxmg39fI5GEbuHvXYRRX8ec3nUiAls+e8LFk7UY/Y4WPQlZ9Ih49FnDlK/vBUJKWNTRhyVaJl9kX+MhRN/spCvRybCEZfDnY6T5VHJSal41xi2ZyRrrYCw/ZV0NP42Wjly8CskazLQ3s/9ulznAVYOupWFqLYNnGxBEM6gXEgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4lmfqkE7JwZA88CjxHCFIroKkc6gZDlIKTmkKWfd4JI=;
 b=IhihtXxpXzlaA1KsURVFFpsWNu2YFdpGP4GhVoEyaMpxegLrLqxFiZVbfg4oIuXLpH6h8lMjW9ocZHy1sVaXHXxzTFffkw9gf8uMYiaWlKvtUZUiqES46UoUX/fRhsxI+qCqm0e0yo8ZcjCNGKiqDjwUziymSC3ME2N3GhKVGac93B8HYj3DG6zBxbjoAk3RV0CD9eBVNcI404sJVFTINTU6NO8ui9xPh6fxAmerHadihjE1AtJo0AbnCWs01DpcbLQwmji7uTGuq4jAYdeHC4m/sxKOt9hcYBWc4leZPQlJnbBxQNzZAoZnwWd0MoBbKW+mec50BRjHx84RwL2TZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lmfqkE7JwZA88CjxHCFIroKkc6gZDlIKTmkKWfd4JI=;
 b=2KzL9nlIOJvPNpMKzfF+uXhIYfmxybuv2+mZ42JXdF8PTTVUG+tA8lPZGT30SrWzMfi4GzKejPZ69ida03dUrqiJeMZ2P9f2N4I3zLvQrD0dlY/theZfIIefbg16EOmD1qcs4rsClqsNCjVDPKibGpmw/thc7I0tKW2q+OlIbpHOYXuvqPF78o0r+wgn5Mfd+RSDTtc5ikoOXxprkQdQ64WKSa/D11ntf1z4fa87sps9pjGfoI5drV5hzCrwOPX8QRpxuSCbHILhTvokhIkOjYtTIoPFiHHGQOlgx/SPSbiICFNVbdIPxshIkadEemDHJNxdA2pr/WeLzKD3uF9shA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e1f20861-fea1-068e-06c1-83558f7885cf@suse.com>
Date: Wed, 21 Jun 2023 09:17:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH 12/13] xen/x86: fixed violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Gianluca Luparini <gianluca.luparini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar <ayan.kumar.halder@amd.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <27690fdf9658339f12061f1bd171ebe5f969eb1b.1687250177.git.gianluca.luparini@bugseng.com>
 <alpine.DEB.2.22.394.2306201422230.897208@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2306201422230.897208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: ee685691-f048-461e-7ded-08db7227a3cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	19uao1nQ8Bz6J9PS08jOTmHK64wYkTv4ArnXd+bvJJ4lgEfbWxYizBs0ZCbePhVaY7PFx+XQUQ4OhLJ3fvw0yPCpq52aY54Cdh0u7TVvvW04oNPFxzooItLVWLY53qsL15KZOeb635BShTjCZFW4MlKwXWeFvOBVwCXAhXN7xJbGXyHskCsJpCIAJcjwdU0iwY/3OhxTdrJ8aZP+jnokKnt/xKJCEEsmpijRd0Xh9Pfheb/5RKhgbHc2R8aK++8H8sQu9aOrrP+t5N3Idu5H0wlTTAvKMFO8ZM6AbT4dWshuiuvZaoDF/dVvff58a91LhOov+SYpQQhz/7yiwk4lqrI4x/gvYQCCEBcqZLdxayV8WrnGDw6PDbE9Bnc2SOT64yB+2JW5UFABqF1lQM4yIO/f3Yz/B+tTJ2+BCppUevyjng5j6p8T27MWlnYlai0ytyy7APdGj1ttw4zbgq7ix4nc1kjweQ3rcbT74MTwV+IPVeTYqi/KwywJ5rznkJ7UkLqtAGAJINTAIEcnBIq95A/TEg4Kcj99J/pjhYRxtcZF2+DUpwfzqqailp1FU0/TT/Q4pXiImWLVkDy9jya+9HYmQ+08Fn7xhjIb/JVqnpbUvx6DmdzSiPfO88hipEW5A99yoTjez8VUNiGag2DwGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199021)(7416002)(5660300002)(66556008)(4326008)(66946007)(66476007)(6916009)(316002)(36756003)(2906002)(31686004)(8936002)(41300700001)(8676002)(54906003)(6486002)(86362001)(31696002)(478600001)(38100700002)(6506007)(6512007)(26005)(186003)(53546011)(2616005)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TnRuTmw2QWh2eEw4MUZWUUg3TDliQ1N3aExlRnRkZ085ZFhDVFVnN1VBVHFy?=
 =?utf-8?B?NFFMZ1VsWWFxbVR3ZG1IZmxVVFhUczFUS2QvSFRMTW83US9XTW5Pb3plMkJM?=
 =?utf-8?B?MFlhQkhVRWxSRTU1c2dlM1BhMDk1Q1lKSmYwejV1bkJXTDgxeGNoYVk2WTV4?=
 =?utf-8?B?VDdWQ1hLcmYydE05b1ZHWHlXT2R5N0htWXkxV3ZxeVI5MmRWZjZ2dEg4VmU0?=
 =?utf-8?B?d3FoMFBxRGhVSlRhZVVhSFhkMWxFZVVtVmJ4bEZqQU8yR0U5d2pTSlZ6OXd3?=
 =?utf-8?B?RSt2dmZJZllkR0E0Q2c0SlkxUUlxZVVlMXpkWTVhdnZUQjhvT1dvR1A1RDR5?=
 =?utf-8?B?L0ZGN3REMGxzdURnMkNtQ211NFk4YlVQc0QvaXlIZ09WaUtOanVqUjJCSWsw?=
 =?utf-8?B?c2IrT1dSMU5pbThMaW1DQzlMYklHZWF0RDJHaDRzd3h0ZzJ0bnVCYk5yWndk?=
 =?utf-8?B?Ykp2TWZMdmxBZklLc253NFcyUVlUL2F1eXZ3aEpwbkNGNDY3cnJnN2p4NzYr?=
 =?utf-8?B?K3ZYU2wwVnc4d2NFUDEwNWEwdTFJT3paYlZ0c2pwNUtuQXo3WC96WEdtamx3?=
 =?utf-8?B?Y1ZQRkdTdjlEV0o3SHA5Y1hCU1NpZmtMbXRyNnIzNEF3RGlGcWxXOFZJbFda?=
 =?utf-8?B?MW41bXU1d1FTamx4OGg3d2RWTnF1bmlUcFBHWElTQlVmcHFYWFN1Ri9iN3pa?=
 =?utf-8?B?QUtxMlJPRzhQMlRXbTNSSzB4TC9ucStHcExoa2pPem5uNUorRzQrSVY4bk03?=
 =?utf-8?B?T0J2eU5Kb0c4MDROaGRzLzYxRnRVOVpDMUJkeTZwZjZVdmFuWUlJdFdoZjlz?=
 =?utf-8?B?UlhtNWVYVUVManlNcWhwTkhxb2tNbUVXNzk5dWsvZm4vMjJuME11ZGhkbm14?=
 =?utf-8?B?SHlGUHVQRGE2eFFGU2NubVM2a1Q3dGRCZDVWemdGUnJWd0o3cU1odjhqWUts?=
 =?utf-8?B?OEplMTFUMU5RMWlKUCt1a3VydUFDNlZrVnNEL2I4S2RRRXZQem15b0ExTFdI?=
 =?utf-8?B?dXI5bmZseHlBN1M1VEd6aFpTYlp3dlRvaGdiQ0FKeVpDVGwwd2Y1SFozd3J1?=
 =?utf-8?B?aUhwem1wTU1NenNtVFA3djMrQU9vbFFQaWdMUEJhSyt5UFpFWW5qVjU2N1Nq?=
 =?utf-8?B?ZnpFbW1Pd0E5blhMWGhmUmNkbGFvYmFTbXhkUk1iZ2cvdnM5MGdRekt0SjUz?=
 =?utf-8?B?Y1FKTlBaTFBiRE5iRURMR2M0OHA1bEdyWllYdTZSK0tSU0JqMERabHd6OE1m?=
 =?utf-8?B?VkpWSE1YREZLMHFmMUlPYTZSWHJ1cy94MmlYVUxxZ0FIVDR0azMxQ3ZNWVVx?=
 =?utf-8?B?Y1FGN01aRkk3T2NjZ0JiU1lDKzdRaXVSVHN5SjNDdnhvY1dsRFJhd3picFpr?=
 =?utf-8?B?bVdPTmkxS1MvZSt2ajZONnZtR0tzSUZEMW42OGJzVUIrS1JWR0tIdVI3Q0R1?=
 =?utf-8?B?U3NpMURyS2JDWjY2NXlTMU9WdlE1a1FBVnBEQ01SaWlrVzRORHZid09ZQm9V?=
 =?utf-8?B?VmFQYmRuSFZqQWVTZVRkWFBTWHZNaExOVmhrbXpLcjkzbTVRN2JBbkhsUkV4?=
 =?utf-8?B?OFpuZlN3VGZyUnA5bTFXRXcxc2UyV0tFVFNIK0dRYm5pdVlLc0lJcVN2S1pZ?=
 =?utf-8?B?cjNmU2RzemtMbXJONGdIaUY4WSs5eFhQSWE4VGoxemtsNnZ2SzlIUWdONDcr?=
 =?utf-8?B?aUxpT1NQQ0tuMDJ0ZXFMTGl2aUNWNlJnN0p6UkljREkrL3NlN1A5OVQvMHlz?=
 =?utf-8?B?MDFhVER0T3JobCtFZW5qb0dHV3pjYnNWcEFDVS9uZDNHU2FwNUI1ZExHNmJR?=
 =?utf-8?B?cUpwMllFVk4yY3lEL3liTFhwKzc5MlU0a2FEVFJWM0wzVW1uekZzNWFmTVA3?=
 =?utf-8?B?RjYweWh6NDF4V3JXazNZZ29obTd1alR2aHZHWnpqMllTK1UxalJNSTRZRk83?=
 =?utf-8?B?aEJ5MUFWMDJqbUsyZlN1WVFLS1BlREE4TEdJY1JUVXhtZENCb3FQSnk1QzI0?=
 =?utf-8?B?VTQ3cnYveVAyZE41Z0xrNlAzNkpvdXhLc29YdUdSOGFKUGZmSmtRNlpUb1Zl?=
 =?utf-8?B?RTU3aWdONVJiTzhYRGVYYXkzK2RyZ3BaOU9lQzVORnBURkZnZGZPdDdQREZ3?=
 =?utf-8?Q?SOD9uP0vneZZFB0c37u8rcb5G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee685691-f048-461e-7ded-08db7227a3cc
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 07:17:58.1693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MP8fmFqSfucjwKsZozF0wfYEIv4YcIz2XGk2o/Pg8fC9B4du2X0qimfqZY4hpfrsNqHlMianNIUX6Yb/63YjIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8385

First of all - please trim replies.

On 20.06.2023 23:23, Stefano Stabellini wrote:
> On Tue, 20 Jun 2023, Simone Ballarin wrote:
>> --- a/xen/arch/x86/percpu.c
>> +++ b/xen/arch/x86/percpu.c
>> @@ -12,7 +12,7 @@ unsigned long __per_cpu_offset[NR_CPUS];
>>   * possible #PF at (NULL + a little) which has security implications in the
>>   * context of PV guests.
>>   */
>> -#define INVALID_PERCPU_AREA (0x8000000000000000L - (long)__per_cpu_start)
>> +#define INVALID_PERCPU_AREA (0x8000000000000000UL - (long)__per_cpu_start)
>>  #define PERCPU_ORDER get_order_from_bytes(__per_cpu_data_end - __per_cpu_start)
> 
> Hi Jan, should this be ULL?

Not really, no - we're 64-bit only. Furthermore the expression is
about addresses, which correspond to "unsigned long" in our world.

>> --- a/xen/include/public/arch-x86/xen-x86_64.h
>> +++ b/xen/include/public/arch-x86/xen-x86_64.h
>> @@ -53,10 +53,10 @@
>>  #define FLAT_USER_SS32 FLAT_RING3_SS32
>>  #define FLAT_USER_SS   FLAT_USER_SS64
>>  
>> -#define __HYPERVISOR_VIRT_START 0xFFFF800000000000
>> -#define __HYPERVISOR_VIRT_END   0xFFFF880000000000
>> -#define __MACH2PHYS_VIRT_START  0xFFFF800000000000
>> -#define __MACH2PHYS_VIRT_END    0xFFFF804000000000
>> +#define __HYPERVISOR_VIRT_START 0xFFFF800000000000U
>> +#define __HYPERVISOR_VIRT_END   0xFFFF880000000000U
>> +#define __MACH2PHYS_VIRT_START  0xFFFF800000000000U
>> +#define __MACH2PHYS_VIRT_END    0xFFFF804000000000U
> 
> Also here ULL?

UL yes, but as above I don't think ULL is good to use for addresses.
That said, things are a little less clear in the public headers: In
principle it could be a goal for them to be usable on foreign
architectures (say e.g. a 32-bit tool stack, or an analysis tool
which can be run without being on the original host architecture) as
well.

Furthermore, open-coded use of ULL would make this no-longer-C89.
If anything, it would then need to be UINT64_C(), yet even that would
grow our public header dependencies on C99-like infrastructure being
available (right now we only require certain stdint.h-like types;
Arm alone, interestingly, also uses PRIx64 and PRIu64, which may be
kind of unavoidable there).

Jan

