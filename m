Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47CD6E8D97
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 11:09:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523988.814478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQHd-0004eM-5X; Thu, 20 Apr 2023 09:08:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523988.814478; Thu, 20 Apr 2023 09:08:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppQHd-0004bf-2M; Thu, 20 Apr 2023 09:08:53 +0000
Received: by outflank-mailman (input) for mailman id 523988;
 Thu, 20 Apr 2023 09:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fY2H=AL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ppQHb-0004bZ-C5
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 09:08:51 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062f.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f628b43e-df5a-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 11:08:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DUZPR04MB9848.eurprd04.prod.outlook.com (2603:10a6:10:4dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 09:08:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 09:08:47 +0000
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
X-Inumbo-ID: f628b43e-df5a-11ed-b21f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5STbLhpl93ji5LFNjwFmlxY586XDp9rdhXynlec3viF+kJq5NvVO3jsRWHyS73Or+Md9MWHUHjukup4eYhA0sJYffQ/INeecrNu8p6xs/2GxF13MBK/Yzh9fcRUlST896UmiLOvHFEGMyrLWZ93vg2i+8foZ4sO8T9DENzQFqIGIIOn4clA3x2FFpl9HjPwx+pz4ljCUqVdxo9N4jtVnZnqk8BU4HFEd1usCxTFjz2dDVEVHstHTzk6j82TizILj8Ipb4kiQKozE4AilT6gVjEKMAemyqe02quHwodDbH2AbB1EqIN94j2W/Y1EOtVomvw3vNK1ikFOlIRorN2m9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JI5EVmmDpYm8IlsuJKdADFEyaspx7x1QIzgvOy/1n0Y=;
 b=gTAzaavRu1mMVc12gkYys5OE+bEcGIUQ2M0ksiwz2I56GcQWj+8yavRQ8r8NtkGpTva7+2f8RHotspUSTnWUlYBZfA5+DL/hq/MQwQzHTsS09NWg9u3rtehu4QABTU2Pt/kme62g2bfupC85jgX3qn41aSUA4g7rVz33y3QXysz/4dI0Cqb3S7a1Bam8eQREuM8UtSntSOW8/vHzbEJOiLkZAEiCrj8yNzAeMUqMG1uT1+IhKpo3LviSA/MPpUgaGxCUMdtOWe80tYzDCLYm6/hL5FzsVRYh9IPgJsT44Ih1w7pti+5+5W/QLhMlT3Iy8YxjCHId+bkEDA8DcCCbVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JI5EVmmDpYm8IlsuJKdADFEyaspx7x1QIzgvOy/1n0Y=;
 b=PHy8JtxdoZBvt2bTIzEa15ia3++vn2htjvNjqpy32lKSPzgnOxwy6NyQ9pg15He8v/hWPik03Wdw1sNeY1h4eLFRrTbJGmOlT8FdrwBawFPaR9nR47mf28fgWYdbDIZXuAfhZBLDWKC6bfGMLQB8A85DGPry1rCtpOGJ4PrnSwfnFeNUhFe/qjTpNyl8oX4W+5PtS+v3RVntW8CAXd0IoSoYqvaKHMTkEBKEn5RCr0MyTKL/v4KcH0rSQKoKBFeuJ1fkukEJ72dtuWqaxukjA45FIXt8ANjI/a/Mf1B3m4tpVmI7inkPCY7MJku4Cfyv0XgAKbTmjA3DCyXGyqze9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a3add69d-8ff5-a206-0a37-4bee454be86c@suse.com>
Date: Thu, 20 Apr 2023 11:08:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 3/5] x86/PV: restrict guest-induced WBINVD (or alike) to
 cache writeback
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
 <0e60520c-d660-1a83-3f57-3466a0ad617b@suse.com>
 <e6315912-7d1f-bad4-71d0-355d361ccbc1@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e6315912-7d1f-bad4-71d0-355d361ccbc1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0234.eurprd05.prod.outlook.com
 (2603:10a6:20b:494::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DUZPR04MB9848:EE_
X-MS-Office365-Filtering-Correlation-Id: c7eaebd2-9dd5-4118-5caa-08db417ed942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OE++de3MFs9t2kl0IQ5qP5vMR98C2mekQ2HBLlcLM5hnPQuZegVKTAh14K2wPrb8J0Nczl1/HVfBbtQgcbnmSMPTenvcMuuZPbVDJsvX5lrdeE7zmJQYGmrXiqHSZa8dUq3PV2JYjc3hMUrgGpZVhSXJPrB0F2pVc3LC/IoakeQVZJxCtVoBGu4/7Kt9QTw+3diYmDrSnf3OYCjgiueAW/Rdeap9SomRJV0lKMLdI653cImkx1RoF5REf7FmbbA6PnTRyRFMzKOybM1U/Ze07WFrNaEbP3jV1Bu/t2wmH8VKVjd+WrLDfS99gqcAH+mEeyl6JQNLAMziFXsj3o6Po1fKiiX4edMagmBYnM8mBI7joGIVsB4ayG6AvoTk4ZDUG0EHwjjSruFpTl9rXn5dn0I6hhESIdIk9cpdEPNoYs01KtiouiSRon5TrU/VB+3Kl1SsOd08KZejaLI3nuhtPt/7sOQqCVJUXutUoN+fdgwvxG6QKc2urxq5oDE9G3pBuazMQeAyf12slP8nG1K1YXGgYYSlgMDKsW4FOFKNLv3L8zTRsf0M21E/DjE/jsWdMBMRn6rrLwv9JBZlxdBcMZNQcv1W1rrRaPtbJBCB5ErST3X1o/+bQ2edbegq2wR/sK4kn2v/Lbmcy93um5akWg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(86362001)(31696002)(2906002)(36756003)(31686004)(6486002)(2616005)(6666004)(186003)(53546011)(83380400001)(6512007)(6506007)(26005)(478600001)(66946007)(66556008)(66476007)(6916009)(4326008)(316002)(41300700001)(38100700002)(54906003)(5660300002)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3lvTy9Zb3NrYkRQZm5BaVcyNWVUUkdhbURrOWY3dU8xUzV1U0lwbDJXOGVW?=
 =?utf-8?B?dEhMU2NJNGpxWmpuSnhMZU5HZy9ibGs2TjFCS2VEaml0eUxGZy9qemFQWHZs?=
 =?utf-8?B?c2YvQU8yN0cyeTMrL2lWYTViL3FMaUQ3aWhSeVlqU2ZPbEo0OGo0djAyelBl?=
 =?utf-8?B?elNxK0VPcTB6MkJEYkcxaW9QSW5NQ2ZKNzJUemtqQXhSNHZITzV2cFZUMS9p?=
 =?utf-8?B?RUloVyt0cURRMDdGQVQzWXZRRnJlVDRUQmM1SktiQXcyTlV4YjVBWFk1aVdi?=
 =?utf-8?B?cVowOHJzZGR5L0dnam5tbTBVa2pyQk0wbkRCdDlBRHpuSGNKNkphSWIzL0ZH?=
 =?utf-8?B?Y2VUQklKcTBhekJMVTZpZ2I2bm5HNXQ1NG9OQUhhUTNKZFFYTjhDczl1YkxF?=
 =?utf-8?B?c2t4NWl3bTNLcFdkakcwUkNTTGIycGVadzAybmZWM2hQT1MxZDJzcGlYaEpr?=
 =?utf-8?B?T0dmSCs4YmNSd0VObmI2WWtRUExTWXZGY1ZZRHN6WFR1OEI1bUZheGVSbXha?=
 =?utf-8?B?d2M0WUhLbjZDUjZkejFLVzZxUHFhRENGMmc4TjZQVTlBMXkzVTFxeUgvRVA5?=
 =?utf-8?B?akNzSWN5VmtlQTRXa1hKQlBmdVpsTncxcGJycHNlbXFwS1JrVUZ5U1FZWThB?=
 =?utf-8?B?ZHU0STgxVWMyR3VmalZDQTJ0T09LbU9vemtjYk8yb0lwdzdkVFIyeWZGSTZ6?=
 =?utf-8?B?cXFvZHNEcFB2L0NTZlUxeUVKVEprMWlIMVJFV2o0YmpPY29wVVoyblBjQkxa?=
 =?utf-8?B?RHlvWnE2TmJZdFU4WHVYL3Q0WGtncnh1QjVFYlJRa3UvR3pyWXMzcS9kVm4r?=
 =?utf-8?B?ZTlESEcrVXdhZ2hOMzc1Y1JXVzF5bVFMdmpSWWdkZVFOZW9rTjFkS1BOZ3ZW?=
 =?utf-8?B?UVRsWElVYW8ra2QyelIvSmExOXBsemNmSFN6ZndvcDNWODZkRjRlem1qUjRt?=
 =?utf-8?B?bVgrTS9vbnVMUUxXeGh2cm05UU8rb2kyQUt1WHFqd2pWWGRlRGE3YXhIYlVH?=
 =?utf-8?B?RVZLWklBbE1YSlhiaGJ1Q0lvVjA1L0dpQUhhUGFuQjNqWDFoRXRrWENGL2pV?=
 =?utf-8?B?eXB4Z3pvYlB3K1lvbklpUkc0ZzFabUkxVTF3SitlRlYxblh0VDJXWEdnaVdu?=
 =?utf-8?B?T0RGdzBMYWNTdTZLWm5pdkNqTGFMWXNtZVZiT3lXeXd6VE9RKzVPSUMzaFZ5?=
 =?utf-8?B?WkZkUDFibitVMGhpRVFTRnRiVDVGOWNJdkhTTE10NVNZZ2Izdk9JT01oNkZZ?=
 =?utf-8?B?bTN6K2tpclBGNGUwRTNQNCswWVlPM3MzaXM2UnlIV3UwNXhxQmlNTWVXc0N2?=
 =?utf-8?B?elFWY20reDEzVWlaaTVEZlo0TnZlTHBRa05HT0hwL0FBSENaeHA4WjZyQjZ6?=
 =?utf-8?B?bTJCQTZQY0xpUnlrUmRNaVYvVmxuT3VmeFdRa2hiQU5oNDBoVVBBYmtnMVFv?=
 =?utf-8?B?elNaUHJyL1hpRnJHTlFzb1hVdkUrbnRBMHVvN3BTdnZjdkNCa0REMHdPcUJE?=
 =?utf-8?B?b3dxWVRMcVJham5McUJxZVJCNVRtUm1ndFowZTdNM1RnVGJic09Ld0NhMUhJ?=
 =?utf-8?B?N3VseW04N29XM3lmN3FIY3pSc3JuY0lxMzE1NFk1S0RnYStDUGtnYk5hRGRI?=
 =?utf-8?B?TjJtRS95d00wYWFEZlNDUjdBblZTV0RVZUVJQVVzNU8wNDVZWWxwbDZLd1N0?=
 =?utf-8?B?dHlveFlKWTRCMmNCOG9zTnQreWVrUVpIbW5CdmI0SUtWM1BTdEJMMzlzbDda?=
 =?utf-8?B?U3pUNVRZVkhsUG8xVVFCRTJOU25yZTYwcVRUeUdGNDNITlVtbW5odTV1SzV6?=
 =?utf-8?B?YWhteVFrNHZINXlVbVVJM3ZNY2RubEFTSXZhclJGM3FnR3BuSjBrN2tyS002?=
 =?utf-8?B?K1NzOUhtYUxKck1kNDgwTWVwYWdzSUdxZFVVeU00UlZlNFBRTWt1N1ZxdFRS?=
 =?utf-8?B?QTlpa1dGcnFRS0EzZDlSaGxab0RocDF4d290Y0IzYUo3Z200aEh6clJ4Y0tn?=
 =?utf-8?B?dlFBaldvb2RFankrbXA2bHRqT3c0UzZ1aVpSVWdHbGVncHRLVnN5VDE0QmNp?=
 =?utf-8?B?MkYzZTZUcTBiTU5oRFpuTUVSNXBXTTlFZjZGTkJIVWtjTzVyRE5wYlBkSlUr?=
 =?utf-8?Q?I28DTra0ftTCzbnJ6EvTwqcwt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7eaebd2-9dd5-4118-5caa-08db417ed942
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 09:08:47.2045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6nKIA+fBkeuauyvKdAMIOu3lFsJhLq1PXx3tA18uejDalTO3fdcxbPWoGimPpnk2sFQjCmWxnYuNe79DvUGTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9848

On 19.04.2023 22:10, Andrew Cooper wrote:
> On 19/04/2023 11:45 am, Jan Beulich wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -3772,7 +3772,7 @@ long do_mmuext_op(
>>              else if ( unlikely(!cache_flush_permitted(currd)) )
>>                  rc = -EACCES;
>>              else
>> -                wbinvd();
>> +                wbnoinvd();
>>              break;
> 
> It occurs to me that this is fundamentally broken.
> 
> The guest is not in any position to know (or control) whether it gets
> rescheduled elsewhere between now and it logically continuing execution.
> 
> So if there is actually any cache maintenance to do, it can't be a
> WB{...} of any form on just this CPU alone.

Aren't you merely confirming the respective paragraph in the cover letter
here? (The implication would be that at least the data added in the last
patch wants to be guest-type-independent, so that it can be re-used for
PV, even if maybe not in the same patch.)

>> --- a/xen/include/public/arch-x86/cpufeatureset.h
>> +++ b/xen/include/public/arch-x86/cpufeatureset.h
>> @@ -238,7 +238,7 @@ XEN_CPUFEATURE(EFRO,          7*32+10) /
>>  /* AMD-defined CPU features, CPUID level 0x80000008.ebx, word 8 */
>>  XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
>>  XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
>> -XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*S  WBNOINVD instruction */
>> +XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*A  WBNOINVD instruction */
> 
> Given that PV guests do have several real hypercalls for doing this, I'm
> not particularly inclined to let them do it via an emulated path,
> however easy it might be at a technical level.
> 
> I doubt anything good can come from it.

We permit use of WBINVD; it looks inconsistent to me to not also permit
WBNOINVD then. Furthermore exposing the feature then can serve as a
(better) hint that behind the scenes we actually carry out the mmuext
ops as write-back. not evict.

Jan

