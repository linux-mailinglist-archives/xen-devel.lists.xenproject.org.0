Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D85B6A5B32
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 15:59:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503423.775701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1Qo-0005Mn-Ln; Tue, 28 Feb 2023 14:58:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503423.775701; Tue, 28 Feb 2023 14:58:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1Qo-0005KQ-Iy; Tue, 28 Feb 2023 14:58:18 +0000
Received: by outflank-mailman (input) for mailman id 503423;
 Tue, 28 Feb 2023 14:58:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX1Qm-0005KK-U9
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 14:58:17 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53944c42-b778-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 15:58:14 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9875.eurprd04.prod.outlook.com (2603:10a6:20b:652::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20; Tue, 28 Feb
 2023 14:58:12 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 14:58:12 +0000
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
X-Inumbo-ID: 53944c42-b778-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgHEE5U415W/qfOkw8em3sWbulikXJVZxIY4Y+AjgrE3HEmmc4HniPUDW2GKh7K2eroocvNd8LRcgl75Y/d/2UmFK6/KIlcOsd7Kkzxcho+mPYsfpogO6T6yUeTOEMw8vB+23Qg6lwWKQsxXW9G0GwYxGqYWEaDyZSOCTenLco5NCmA/YvY3tRBgZlUNp3uXMT/SI4XFM9VyNUTx0pjs53tb4ggwMQFHh2/4jE+lAHDPD1TMCicjTtgncJ/hvAQBpbJdbiMiZrq6U2U4qWwNVEQ4/lAE9WiAFtQ0GKJqk9xnLRcF/vT9tA4IeMBe4yJP/CAaRYzPfQDZLiURTr53SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wDCubEl21OJh4mW3wa05ewPX+PuTGVFIYqXsHA1+OUM=;
 b=QzaewnYW+uYOnnhzGdxbFjiv0V3sNkvxR4pQHl5qaqLBcE1lLTqJLOJbWdDBEy5ngQk3DscyZvJc8+Sub6VbqxGPL/tdjVzjSUoqlp/N4RcNfKLBAeE7AiBquCJ49yt4tR0oBK7CrpXJ3iLb/OTg/64rbjK9vReh/Ye2YAuoZ7FBquwLOz+8t9eNn8Y99PLKati+LdgWKGAAL+UfwctnHhw7CLTQftnKonA+7Szcqo5BoJrXRk3MxGSphXHeJsRdO5BJ56uvLLwqDdKkeaVFQOFSriTL532tsbw2YiikGB6EqpsbyS70A1iaPOT5Efy5dLYSKfZSEjmECybWHKnxsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wDCubEl21OJh4mW3wa05ewPX+PuTGVFIYqXsHA1+OUM=;
 b=Um5MEWzm5C8FQjtS1gff/qh6Eyhq4WMo+EvO/mn+R9BksH188UEXwQ8yfwMugDGs2QorDJMWszCHb7JERwL2tQ7WY37G6pEkxO9cu5/qyOdmPhJiJICWLe58UMsqtZdnFpk9+L2sO9+f/Od3NqcUBbHCMNjwvd2KeNib3Ko8TZbTkcAPOlTjGctiCyn9gZwjGXkCyV0sBgcZJWgFfAn6u46XVOElVEUm17ewSxlRqLeOFG9W5DMHiXodnvN3HLg31NF0agnZQR27J4FI3onHaRAOwn8BTjAnt+qaSXBxIzfiQVRyeYWYv+/G2ekCWRUl/I3Kp/+LStOoV3//TDylug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <732bbee0-24d3-f5e8-7353-b40a77c3ee2e@suse.com>
Date: Tue, 28 Feb 2023 15:58:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/4] x86/hvm: create hvm_funcs for
 {svm,vmx}_{set,clear}_msr_intercept()
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-5-burzalodowa@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230227075652.3782973-5-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9875:EE_
X-MS-Office365-Filtering-Correlation-Id: 8409ba6a-7706-483b-84bb-08db199c3677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W8otldPPZOmSZHiWNIr+oj/ucvcfjlKjLW3vedBJC/3s1JhrsidYDeVYSm1xpDlgoVJcjEOqnqO9QNHdtTEmPyuGAfCPoddboU9X1HJDfcGIiPR9XcaGOJWdNYAW9JOAsfgTH3DO8j1hug8SJv+EVlq3bLZEjgMFWliajul9hmey8Fg/xNQBL3Z33MgywBLzUbknvZksfaK8y6zZy71JpZB/mnTbgeuqB3EIamI3u/8u68jUep1BgIl4Kmwb8LBwRaKcz5nXrD1VfHBhdDawbFP+VdqdDficWjPuzN2jZXS0t9tnWI05jDE8//OSU6h5aUZ0RSfkdm2JhpRZd/zERJtdP3d21EWqFlr1g3aEz+lIZD4XYNbdt48KoLflEylhhwm0xf8xDrIC/scT/Cq+rvGgmHrNrq0cuqgDwTcpKEAHGwGxwnOMNIoZg77bOQ9hYXuOVuwLQnYNO0suNk8nUUo/dUG08skjSh0BSMpTUR8JimILcZFlln3tHbbALp5MNjDU8UeA6ymu6gSJEzEyGbX+Wuz10jAao/dXQ3Fd75MAOULwfqzs0Y+5DDd+xvD+BZAETVQ5tjVwY9s9OLE3K/q6v9GapJ2d+REAGOFketZnf1nHd94DqOnfr/l65Z4xAgnUI3EYc9QF+JudcxpSTKzoHJ1i8F3xA4hsttk7Wxn5aRSm4B6aHD+X4CvRqDYadxp/LmglTqNec2lEJ41pJIxz9WhFG84TneyMmP35Fic=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199018)(36756003)(53546011)(6506007)(6512007)(6486002)(2616005)(31696002)(41300700001)(186003)(26005)(5660300002)(86362001)(66476007)(4326008)(8676002)(66946007)(2906002)(6916009)(66556008)(8936002)(38100700002)(478600001)(316002)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDRmOWpFWkhnMVJqRFJuRkxiMWR3R3FMeG9jYUE3WXJ0NWZSUGVsamI1OXli?=
 =?utf-8?B?eFFzZSs3eEM1K1psVUIyR041aXJBejZlcHV6WHRyYlJlZzh3N2xKY28rS0c3?=
 =?utf-8?B?QldnSlVTZUxpc3lNd0c5bExRbFlLRklrV0dPWGJTR0FHNVBNOEFPeFJEMXBj?=
 =?utf-8?B?dkVHTHdaNUhUZ1prSXgvaGVlQmUwQXN4TkR0eGUwV2tKTXlkTHNVQ3NEQTNi?=
 =?utf-8?B?Ny95UTJVYUt4MjdoWUdIc0hrV2o0Mkd0NXJucXBkb2RJZk1PTzMwM0JPSXpY?=
 =?utf-8?B?MGE1NVYwcEJVL005cUxTTkpFZzg4dG1tSk5YempJZmxxRmVsV1BQODlKVGNM?=
 =?utf-8?B?Tk9QamJrNEJoNmo1WHZOTEYrd05OYXlOejZFQmdwa2t0Ulg0REp4VFhnYkx4?=
 =?utf-8?B?QnYwY0hsYjA3ZGV3Q0lOWTJ1bGxLWFdGbGNDSGEvU0I0QXRWVjd3blgxUnpl?=
 =?utf-8?B?U3RhTGhzV1VxNWM4cXdyNTRPOUNvVkQ0aWdwR2w4aG9SazIyemFoZWY1MGpQ?=
 =?utf-8?B?eVlyRFJudXlwTllTZUtacU5adFFtN0tybmRCNmprRndMaytjdjVyZ3FlYit0?=
 =?utf-8?B?WFV2NkN0R29IZzdGOU9oVi8vVUpjNlVRd2Y4Tis3WVdmWUpiMFpVOTBYVHJo?=
 =?utf-8?B?QVZzSUdtN3N1RUZ5VFd1aDlnajYzbXVKak1pWkNHZkluOHZubkpxMnZHOFpN?=
 =?utf-8?B?WUw2WTJHRjJZYUozUzVPTkpackZrWmJlTVJXS2NFMllzRTBNVFpiR0JiK3Rk?=
 =?utf-8?B?enZTYm56a1hBbTRZRkQ5bnVyV0k2c2N1SnBQNzZlbEtvaUR0VC96MFpjdEd1?=
 =?utf-8?B?WUpNZjVLMk96K21oakdtNU5MZHo0YU5QZFl1R2w5cEg1TVBIUlVJOVdrR0pU?=
 =?utf-8?B?Mk1MSlpyQTZRckI3di8wN050R1RIMjE4anRPL09ldEZNdkFPeC81QnNpcHRI?=
 =?utf-8?B?dEZrZWQ1Uk5pVXEzSDNaVy8xSmMxSGhIQTFWMUxpa3VaTS9RVXRUYmRuUHFV?=
 =?utf-8?B?UGdROWYxek1ZSDR0b0d6WmY0eGNGR05pSHBiWkZwS2QxQXNnd3AySWx5ZzJp?=
 =?utf-8?B?MzVaZFhPbzJ6MDJDRS9IZHRCSkdLMGlXVXhBOXNrREpleGVRYWwwZmVjaWt5?=
 =?utf-8?B?Wnd0eUQ5NjFqRllEMzJXSVR0c3VkcGNYbFQ5TTAwVWRRaHZicXhxSGZDbFc3?=
 =?utf-8?B?R1dtWmhOQXRhQjRTY01lNzF6Y0VpZWZXLzN5cXMvblJ3Tndrc1ZFQ2xTT2VY?=
 =?utf-8?B?b2J4RWo0azVQdjBaekl3MjA4eUlBR0lRcmdJek1mRWZCTkNMVW1ZRTVQbjha?=
 =?utf-8?B?d3J2S3RHU2o4NVU4MmZUaGFqYnhtSkhWN3VFVHBlNGU3M1IzWklXNWk3ZGRo?=
 =?utf-8?B?MjVCZjVYUkNtcUhjUWw3LzJaUGNOdmMwQjUyRHV3bU04VGxrUzVPQ1BjSUdY?=
 =?utf-8?B?QmpSQzF1ZXJmTFdmZXdjbkJxNmFGTmt2Njk5eXNJSUp5ZTlUa3M4bDg0Rjhw?=
 =?utf-8?B?akxrMnJlbFJyYXhnenNtcFp4TDEzbklMVkoyRDM5L0NvSnVMTi9jc0Y1Ty9t?=
 =?utf-8?B?L1FWcHR1MEgvaGZHOGVNbUNscVV1M2RFVVFSQlQ3bGFhbHNoVmMwU2ZTLzkv?=
 =?utf-8?B?Z21IcXBuRHgxUjV6L1ZNbXNWMTYyNG1xUFBjNm1ndFJVdFhEMEE2WTQ3TjFN?=
 =?utf-8?B?UEd6KysyOHpyNVlMTlZPQVJiTncvbUw0bW5Yb3dPMmF2ZThYWTNTZUxKckdR?=
 =?utf-8?B?S2RxeUorNFN5S1VoN2N3a0tKZ2J6aGxUdmFFNHROcFdXY3hRdnZnbWphZUlS?=
 =?utf-8?B?VWtjdU12TlF0VGNGbXRxYVlKU0c4UDJ1NHF1VXNaQVZrcWVSejc4MmdGWE00?=
 =?utf-8?B?eThzQ0ZneTdKZnJCSzFCNEZJN2R0R1lDczNZUjRVZUdEMXVxVTR0dkplTU1p?=
 =?utf-8?B?YTBkN0o0dVluNVF4bXl2Tm4xa0tSOWZ4TXZKdWt3bXl4RGthRDRUejJKY285?=
 =?utf-8?B?RE5rTmI4M0RzQ2lEQkFlVWNKUTJheS8rcG5yVVNBV3RTS3VWVFdEK0N3R0Zj?=
 =?utf-8?B?ZzBjY2x1U2RUNWorVkFLRUZORk13NitPMjZJT21ZaWwyUzc5c3VlL0ZGQ1h3?=
 =?utf-8?Q?YbMZm1haT3jgGkiIcfuXsUIGM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8409ba6a-7706-483b-84bb-08db199c3677
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 14:58:12.3858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IAjA9hATDSFUvdSmmtUQmTkL+81mZNwXPJbMpqLnaqAFDPGUYXVT7kb2NrMBqD/rozkUMyS1hI5GfqwiCCJVHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9875

On 27.02.2023 08:56, Xenia Ragiadakou wrote:
> Add hvm_funcs hooks for {set,clear}_msr_intercept() for controlling the msr
> intercept in common vpmu code.

What is this going to buy us? All calls ...

> --- a/xen/arch/x86/cpu/vpmu_amd.c
> +++ b/xen/arch/x86/cpu/vpmu_amd.c
> @@ -165,9 +165,9 @@ static void amd_vpmu_set_msr_bitmap(struct vcpu *v)
>  
>      for ( i = 0; i < num_counters; i++ )
>      {
> -        svm_clear_msr_intercept(v, counters[i], MSR_RW);
> -        svm_set_msr_intercept(v, ctrls[i], MSR_W);
> -        svm_clear_msr_intercept(v, ctrls[i], MSR_R);
> +        hvm_clear_msr_intercept(v, counters[i], MSR_RW);
> +        hvm_set_msr_intercept(v, ctrls[i], MSR_W);
> +        hvm_clear_msr_intercept(v, ctrls[i], MSR_R);
>      }
>  
>      msr_bitmap_on(vpmu);
> @@ -180,8 +180,8 @@ static void amd_vpmu_unset_msr_bitmap(struct vcpu *v)
>  
>      for ( i = 0; i < num_counters; i++ )
>      {
> -        svm_set_msr_intercept(v, counters[i], MSR_RW);
> -        svm_set_msr_intercept(v, ctrls[i], MSR_RW);
> +        hvm_set_msr_intercept(v, counters[i], MSR_RW);
> +        hvm_set_msr_intercept(v, ctrls[i], MSR_RW);
>      }
>  
>      msr_bitmap_off(vpmu);

... here will got to the SVM functions anyway, while ...

> --- a/xen/arch/x86/cpu/vpmu_intel.c
> +++ b/xen/arch/x86/cpu/vpmu_intel.c
> @@ -230,22 +230,22 @@ static void core2_vpmu_set_msr_bitmap(struct vcpu *v)
>  
>      /* Allow Read/Write PMU Counters MSR Directly. */
>      for ( i = 0; i < fixed_pmc_cnt; i++ )
> -        vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
> +        hvm_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
>  
>      for ( i = 0; i < arch_pmc_cnt; i++ )
>      {
> -        vmx_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
> +        hvm_clear_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
>  
>          if ( full_width_write )
> -            vmx_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
> +            hvm_clear_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
>      }
>  
>      /* Allow Read PMU Non-global Controls Directly. */
>      for ( i = 0; i < arch_pmc_cnt; i++ )
> -        vmx_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
> +        hvm_clear_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
>  
> -    vmx_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
> -    vmx_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
> +    hvm_clear_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
> +    hvm_clear_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
>  }
>  
>  static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
> @@ -253,21 +253,21 @@ static void core2_vpmu_unset_msr_bitmap(struct vcpu *v)
>      unsigned int i;
>  
>      for ( i = 0; i < fixed_pmc_cnt; i++ )
> -        vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
> +        hvm_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR0 + i, MSR_RW);
>  
>      for ( i = 0; i < arch_pmc_cnt; i++ )
>      {
> -        vmx_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
> +        hvm_set_msr_intercept(v, MSR_IA32_PERFCTR0 + i, MSR_RW);
>  
>          if ( full_width_write )
> -            vmx_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
> +            hvm_set_msr_intercept(v, MSR_IA32_A_PERFCTR0 + i, MSR_RW);
>      }
>  
>      for ( i = 0; i < arch_pmc_cnt; i++ )
> -        vmx_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
> +        hvm_set_msr_intercept(v, MSR_P6_EVNTSEL(i), MSR_R);
>  
> -    vmx_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
> -    vmx_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
> +    hvm_set_msr_intercept(v, MSR_CORE_PERF_FIXED_CTR_CTRL, MSR_R);
> +    hvm_set_msr_intercept(v, MSR_IA32_DS_AREA, MSR_R);
>  }
>  
>  static inline void __core2_vpmu_save(struct vcpu *v)

... all calls here will go to VMX'es. For making either vpmu_<vendor>.c
build without that vendor's virtualization enabled, isn't it all it
takes to have ...

> @@ -916,6 +932,18 @@ static inline void hvm_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
>      ASSERT_UNREACHABLE();
>  }
>  
> +static inline void hvm_set_msr_intercept(struct vcpu *v, uint32_t msr,
> +                                         int flags)
> +{
> +    ASSERT_UNREACHABLE();
> +}
> +
> +static inline void hvm_clear_msr_intercept(struct vcpu *v, uint32_t msr,
> +                                           int flags)
> +{
> +    ASSERT_UNREACHABLE();
> +}

... respective SVM and VMX stubs in place instead?

Jan

