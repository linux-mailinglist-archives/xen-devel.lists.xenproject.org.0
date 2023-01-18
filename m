Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A08671511
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 08:32:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480184.744440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI2vz-0002oM-T1; Wed, 18 Jan 2023 07:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480184.744440; Wed, 18 Jan 2023 07:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI2vz-0002lz-PU; Wed, 18 Jan 2023 07:32:35 +0000
Received: by outflank-mailman (input) for mailman id 480184;
 Wed, 18 Jan 2023 07:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QcrT=5P=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pI2vy-0002hn-3w
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 07:32:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2071.outbound.protection.outlook.com [40.107.20.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 459a82ac-9702-11ed-91b6-6bf2151ebd3b;
 Wed, 18 Jan 2023 08:32:33 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7725.eurprd04.prod.outlook.com (2603:10a6:102:f1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 07:32:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Wed, 18 Jan 2023
 07:32:30 +0000
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
X-Inumbo-ID: 459a82ac-9702-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hzg6jfLzVpCh1YGUwBeUPuiujQEQFeGUcvJMSqpoz/9xrxWze5TzeHIwyh3SjkmyX6F34IAs4LBLlbCjKLZPGXt943rn+CZbBHRwfnSOrG2ynlJdSv2PFR/aqNU8kLopSJttPu8yOE3rRE96AOzv5T2nRqgq8Qa5wv5leY3A7PZhNfRmwvMEfe5Qi6+DSaaw2+Q8g7nBkL39QAagx5vbhE6/z3k573y9TsMig6QHC0XXkFx+9rqZoKs+h7PT8VeAQunBs8KQYItlNieEFicBe13a8+GVYsn+J2xStnxOTN90lql1532WzM9y29zpxIPhqyp8/KXHU2UAiGBp3JumEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBeENcj6uVSUXec8n/4V0RMBHbX8hAq+T5n5jGWYUpA=;
 b=f6e0zOaUKYltDFIR+6kOQYhRjjqGcAEGHXn0kgjnCTxbw3tlNncRYgIqvpWAm5Mq74pVqHTayP9ye9+um7PIhpThsHAmu/OQJ2YT43aNTQF3+p0nPK3VZW7hXCcNSr21n86s5RiClnmziqRTFOJswbn5JGJJTArtB7njnOu14Imog36z5u26AOvfYcytSqwBmbtI7aT/LpqMBfzjbO9dhPBwjEfsRsEr1T4vULP4GxZGSaiHLdWvpQ99lKLZ6TxQZN2aqfJZrMrvcrrmInAo5K0cO10yDf2DBhrZSLCPia+JE6xZFoeXSHkugSf6GbkxuqfeEqAQxrIS/72X9n/r8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBeENcj6uVSUXec8n/4V0RMBHbX8hAq+T5n5jGWYUpA=;
 b=aRYJa6uH4x0RPZ7oCr9XVagdgxHSbEVrUHHfurMPjQ7e2zrxyvZVVjcx2BLcIYhEvMMUrZ34Hfcfuw5D8m0Awu83ti7aen4R6GxQM4H8FQTKFIzmAgyzUehKnZQPYynctcfUfcpXf8/o0R4DJeohK9E1PRABwclSl8OqfwHACypLNUPTUJ6OxMhcXa89KZqpgjf1uvU58Xnqb+UM04EbqxUXooq0c6HV/vP8y87Bx3Q9uCmKedFT2q4cB2wMnUj6yEQOK+CynFJtvRU4NtzgyJKNlsErQQTuwyZuU4dK5sB1mOt5T2RGYu2i/1yorSBd4g9sDoLKiR0nUx56FG5lnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <99b628f8-f383-ec28-2d5e-f7d899f9dd85@suse.com>
Date: Wed, 18 Jan 2023 08:32:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/10] x86: split populating of struct vcpu_time_info into
 a separate function
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <3ff84ed1-8143-15c2-2b4a-3ae8ef23677c@suse.com>
 <18016404-c3e3-8b99-569d-b6f786635a2c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <18016404-c3e3-8b99-569d-b6f786635a2c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0003.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::13)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7725:EE_
X-MS-Office365-Filtering-Correlation-Id: 14a10794-a2fe-4f3a-908b-08daf9262841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5o5UVvN1JKSfyG1FlE0VE5hBSiOoELvedMfpVM7ES0jhktAyIiao/VxKwd9p3C/DEO42xt4m+/5KAu3SfhhthYslFMCwzMWQD+8KbvlidAphYm75367qCHNuhLct95zbD1M/+RqRUi76DuS6obxMntOz+F64AVQRFASyWS3j2fPGq0AYf7qTtZtLGGQOxu5A0cm37QNdsFpOyH1BUK3y6mbPeyZmDpupuk7cwXMVPwh9PToStJ1LLVRsOKRM2iDTnWjLYB8b5Mmyu0GNPeT0z6qOjTdgO0vOWGSEse69ZcOZzl/XN13uirtp++RvdtyrfEWTiKC2monOIvq3wuvDOQg3C/MKaUwpYot8sLOkJ5vZsoc+Ov9V4Ru2i3FHeJarkeNJ90Ay4eqVDrNFsD4+XwQAWPGtQYAWDoNsPyMMFUkAf6oZZFxRg7GZmGrKRj6S3Ojb/uxUKp/tRvfCa3TpyWr/CRzhqvMApaa7uhr8Tgga95xWjyTVV1P6ynlo8Lsp3BxDv5uxfjlCZUXhUNWppfqiowkgur5qUvXa4misJlTcOYS+p6O2NpXk8cLsxgQFsGztqIt8DxT0iqBDebG0HO8HF+twIJo6ZqXe76a2XppVJ17oJFVQBF8m4Bxy1LuN6IYc9ft6xo5XGPStxIlgl1dZSEyConYtX34WcgENirzVwH9/uS6EHeDJ22fYAuhO1L3EGJ2lmT9EqLXkQoZJvz8NVrP+6RKs6hxFYW6stFE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199015)(6512007)(186003)(31686004)(6486002)(26005)(6506007)(478600001)(316002)(66476007)(54906003)(2616005)(66556008)(4326008)(6916009)(8676002)(66946007)(86362001)(38100700002)(53546011)(5660300002)(83380400001)(41300700001)(8936002)(31696002)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RS9EQm9XNi9hZFBiWWhmK25hYTRXLzFackNLeUFkZmxIb2F3b1Yvam5ocjBz?=
 =?utf-8?B?WmFqMjR3NWd6RjFFUVl6ZDMwaDlIZFk1bXp2aTdDUXZIVTdlek1VNitTdTVD?=
 =?utf-8?B?ekRYbG4ybXp5amhMSm8wWGF3a2VJM1hob3BvTWNEb2tyalkzQjNMQ0JnaVRH?=
 =?utf-8?B?Ym9wa0lkeGdxNHVoT2k5UmVtSVg4VUJtdVp4Ymc0b1BWMFFEVmRYNTJXNUU1?=
 =?utf-8?B?M3RWQ2tnYnAwNS9KNnRIaDl6bGFKZHhzMGdleTdPc2o5UGRpQnVERVRYUVBJ?=
 =?utf-8?B?alF6dGV2NVlDL3ljSUxUaWtTVEVwTlIvejhHVUxOUlFsdFBDcW9JemgyTzZ5?=
 =?utf-8?B?TUVHQlhWcnE5NVVsdVRpNnFxbHFyRTVCUnBNWUk3OVU0SXJmTEY2VmtCUmQz?=
 =?utf-8?B?ZnhMcUJhUmwyNGJwQmNhS2w2Z1hEVXRBZzBsdVhOY2ZYOFNoYkQ5bnN0cHI0?=
 =?utf-8?B?M0Z0emVMWjZqTlp5U0NDRDE5UkcvaDFxbW1rVnF3czM0eVNpL0tLZGlOVmN2?=
 =?utf-8?B?UXA5TE1CSXJtaGliUHVYRkhSMkdFQ3ppb3JvOERLRHJkcjZrZ2luTmgzTWxm?=
 =?utf-8?B?aS9LbE5mY3F4dU8zcWJudTlDWlk4Qko4ZFYrd1hRcFA1ZUFPMFkvNDJ4NFFS?=
 =?utf-8?B?QldOa1JobHh0a3dsRUNXV1ZYbnF6UmtlbHI3WmttMCtxZ0hGQTNoTm5pU0cy?=
 =?utf-8?B?c2psNlhKQ1JQdytXK2lobHlUMWtRdzJXMDdrdG5FSGNNS0d0eHczRHNKVVBU?=
 =?utf-8?B?R0NCSXFQSFJCZ0hmNmpVZHNvdWdITVhZMmZGblJLazBkdFQ4bkVQR1hQMm5V?=
 =?utf-8?B?YjhKSlpmeUdxZVZQaTYzQkNxbDFNQXM0eGF6Ky82T1ZHbW5qN2EyTnh1K1FS?=
 =?utf-8?B?TFl1R2l6RmVFRU0vU2w5OVJUanVyTHNhRTRaTnBXaFR6NlRPSjdXWjFNVDc2?=
 =?utf-8?B?Z2NsMVZVbHNodnl5dm53SXdUUE55ZHhrY09OdFBGRmt3M2RKNVI5VW1JQVhP?=
 =?utf-8?B?NmN0R2dPOGY5MTB1NDVTSzdzVFg1ME9NOVh2NmtrOW4zbm9PZmFCTUpOVTJN?=
 =?utf-8?B?UmJENCt5dDM3UTdLSlJJZElnYUkwemJRdkkwWjFHdWNUU3Njdy9tWWhPaWlW?=
 =?utf-8?B?a1kvSjRZU1JkYmprbllJcjRyNGJoZnFibVp3OHpBUnNma0ZSam1VRXlaMEc1?=
 =?utf-8?B?MGIycUhyZUZraDl4ZXVsc0VENW92Ykk0Mmo0MDFSbUFxYkVtVWtqMUtDOXY1?=
 =?utf-8?B?MVUxYytWMlhzeEpjc3hqaVgzK3F5RFIrODh5Q1BLTDZSbzNQcnRGVHNqV3A4?=
 =?utf-8?B?MkpvUzIzM3VXVGY3QXFpa3ZXejF3Y1VxejhkYUtidm9PVE5LTk1OeFM0aEtO?=
 =?utf-8?B?aVBSSVRTeUY4NzhUVE5qc0lvdVdHUVFiUkV0aFVSMTB2QnUvcE9KV1RoMGxV?=
 =?utf-8?B?UmpFcWJLaGdZRmU4V0d2aUs0d1BqNndId1VRUHJKd0dVNWwwRXNpMVBDalFo?=
 =?utf-8?B?TEJEcGhkbHdpS1BpMzlGUUJ4UGlaOHVKT1draWNxSDZnT2FDUmU5MXdsQUgy?=
 =?utf-8?B?UmVXaTE4N3pLekFZTUlZWHg2bkJuaWhHbFZhYmRHVnlPS3hFU0FxYm8wamEr?=
 =?utf-8?B?bENqUVBDMDlQNXdFNjNJeEpkcXlDcVQzczM0aUJ2cDdpbDgycjZsQUJRYjJC?=
 =?utf-8?B?T3JSVjZOS3YwL1NvZUlyLzRSZUxTUWZjL1hhVC9TR1lPd2FzallkcmdWYm5t?=
 =?utf-8?B?bzE0eU9XYjhzM3FGQk5RanlkblZqcHVZQ1l2SDdvb0xUUnlSanJWU1U2VGJ0?=
 =?utf-8?B?c1F4ankxd2tLek5UNURJeVNaTFYyeitxZlZKWmI0cDF3MS9uaVBqenFLSm8y?=
 =?utf-8?B?OEROQ2d6RndhcDVieDZkbGFIL0NDS1Q2bWJVNzJ6elZwMzZqd09ZYXdFeS9S?=
 =?utf-8?B?bGZCRk1jNEhaUVQ1YnJqUEVLOWY5SkNpNlhxOXlobVJzamNGL2p5ZFlCOUFp?=
 =?utf-8?B?dENmeGRJeVlxUHduaEVuUEJzOTJPaE5YU1ZIWjJldWNCUk9KNkJyem1lcGdr?=
 =?utf-8?B?YTEyZXVHZjdoRWFmRjVLQ3JPaVZySHRGajN2M3VUQTJPSnZEbTI5VVlTYzVi?=
 =?utf-8?Q?IZQrn7HQq/c4qGQBb3DsWT7rH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a10794-a2fe-4f3a-908b-08daf9262841
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 07:32:30.7211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3nlMkiXzA+7c+ERJ75HWSlDD08S5/mPsIamlLJQpkVdnJWIt/5B3xemlRQ0k8kSX8aczYCwyY+VMsP5VukeTYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7725

On 17.01.2023 21:19, Andrew Cooper wrote:
> On 19/10/2022 8:39 am, Jan Beulich wrote:
>> This is to facilitate subsequent re-use of this code.
>>
>> While doing so add const in a number of places, extending to
>> gtime_to_gtsc() and then for symmetry also its inverse function.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper@citrix.com>

Thanks.

>> ---
>> I was on the edge of also folding the various is_hvm_domain() into a
>> function scope boolean, but then wasn't really certain that this
>> wouldn't open up undue speculation opportunities.
> 
> I can't see anything interesting under here speculation wise. 
> Commentary inline.

My interpretation of those comments is that the suggested conversion
would be okay-ish (as in not making things worse), but since you didn't
provide an explicit answer I thought I'd better ask for confirmation
before possibly making a patch to that effect.

Jan

>> --- a/xen/arch/x86/include/asm/time.h
>> +++ b/xen/arch/x86/include/asm/time.h
>> @@ -52,8 +52,8 @@ uint64_t cf_check acpi_pm_tick_to_ns(uin
>>  uint64_t tsc_ticks2ns(uint64_t ticks);
>>  
>>  uint64_t pv_soft_rdtsc(const struct vcpu *v, const struct cpu_user_regs *regs);
>> -u64 gtime_to_gtsc(struct domain *d, u64 time);
>> -u64 gtsc_to_gtime(struct domain *d, u64 tsc);
>> +uint64_t gtime_to_gtsc(const struct domain *d, uint64_t time);
>> +uint64_t gtsc_to_gtime(const struct domain *d, uint64_t tsc);
>>  
>>  int tsc_set_info(struct domain *d, uint32_t tsc_mode, uint64_t elapsed_nsec,
>>                   uint32_t gtsc_khz, uint32_t incarnation);
>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -1373,18 +1373,14 @@ uint64_t tsc_ticks2ns(uint64_t ticks)
>>      return scale_delta(ticks, &t->tsc_scale);
>>  }
>>  
>> -static void __update_vcpu_system_time(struct vcpu *v, int force)
>> +static void collect_time_info(const struct vcpu *v,
>> +                              struct vcpu_time_info *u)
>>  {
>> -    const struct cpu_time *t;
>> -    struct vcpu_time_info *u, _u = {};
>> -    struct domain *d = v->domain;
>> +    const struct cpu_time *t = &this_cpu(cpu_time);
>> +    const struct domain *d = v->domain;
>>      s_time_t tsc_stamp;
>>  
>> -    if ( v->vcpu_info == NULL )
>> -        return;
>> -
>> -    t = &this_cpu(cpu_time);
>> -    u = &vcpu_info(v, time);
>> +    memset(u, 0, sizeof(*u));
>>  
>>      if ( d->arch.vtsc )
>>      {
>> @@ -1392,7 +1388,7 @@ static void __update_vcpu_system_time(st
>>  
>>          if ( is_hvm_domain(d) )
>>          {
>> -            struct pl_time *pl = v->domain->arch.hvm.pl_time;
>> +            const struct pl_time *pl = d->arch.hvm.pl_time;
> 
> A PV guest could in in principle use...
> 
>>  
>>              stime += pl->stime_offset + v->arch.hvm.stime_offset;
> 
> ... this pl->stime_offset as the second deference of a whatever happens
> to sit under d->arch.hvm.pl_time in the pv union.
> 
> In the current build of Xen I have to hand, that's
> d->arch.pv.mapcache.{epoch,tlbflush_timestamp}, the combination of which
> doesn't seem like it can be steered into being a legal pointer into Xen.
> 
>>              if ( stime >= 0 )
>> @@ -1403,27 +1399,27 @@ static void __update_vcpu_system_time(st
>>          else
>>              tsc_stamp = gtime_to_gtsc(d, stime);
>>  
>> -        _u.tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
>> -        _u.tsc_shift         = d->arch.vtsc_to_ns.shift;
>> +        u->tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
>> +        u->tsc_shift         = d->arch.vtsc_to_ns.shift;
>>      }
>>      else
>>      {
>>          if ( is_hvm_domain(d) && hvm_tsc_scaling_supported )
> 
> On the other hand, this is isn't safe.  There's no protection of the &&
> calculation, but...
> 
>>          {
>>              tsc_stamp            = hvm_scale_tsc(d, t->stamp.local_tsc);
> 
> ... this path is the only path subject to speculative type confusion,
> and all it does is read d->arch.hvm.tsc_scaling_ratio, so is
> appropriately protected in this instance.
> 
> Also, all an attacker could do is encode the scaling ratio alongside
> t->stamp.local_tsc (unpredictable) in the calculation for the duration
> of the speculative window, with no way I can see to dereference the result.
> 
> 
>> -            _u.tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
>> -            _u.tsc_shift         = d->arch.vtsc_to_ns.shift;
>> +            u->tsc_to_system_mul = d->arch.vtsc_to_ns.mul_frac;
>> +            u->tsc_shift         = d->arch.vtsc_to_ns.shift;
>>          }
>>          else
>>          {
>>              tsc_stamp            = t->stamp.local_tsc;
>> -            _u.tsc_to_system_mul = t->tsc_scale.mul_frac;
>> -            _u.tsc_shift         = t->tsc_scale.shift;
>> +            u->tsc_to_system_mul = t->tsc_scale.mul_frac;
>> +            u->tsc_shift         = t->tsc_scale.shift;
>>          }
>>      }
>>  
>> -    _u.tsc_timestamp = tsc_stamp;
>> -    _u.system_time   = t->stamp.local_stime;
>> +    u->tsc_timestamp = tsc_stamp;
>> +    u->system_time   = t->stamp.local_stime;
>>  
>>      /*
>>       * It's expected that domains cope with this bit changing on every
>> @@ -1431,10 +1427,21 @@ static void __update_vcpu_system_time(st
>>       * or if it further requires monotonicity checks with other vcpus.
>>       */
>>      if ( clocksource_is_tsc() )
>> -        _u.flags |= XEN_PVCLOCK_TSC_STABLE_BIT;
>> +        u->flags |= XEN_PVCLOCK_TSC_STABLE_BIT;
>>  
>>      if ( is_hvm_domain(d) )
>> -        _u.tsc_timestamp += v->arch.hvm.cache_tsc_offset;
>> +        u->tsc_timestamp += v->arch.hvm.cache_tsc_offset;
> 
> This path is subject to type confusion on v->arch.{pv,hvm}, with a PV
> guest able to encode the value of v->arch.pv.ctrlreg[5] into the
> timestamp.  But again, no way to dereference the result.
> 
> 
> I really don't think there's enough flexibility here for even a
> perfectly-timed attacker to abuse.
> 
> ~Andrew


