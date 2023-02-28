Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB9A6A5CE8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 17:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503536.775811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2dA-0005b5-15; Tue, 28 Feb 2023 16:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503536.775811; Tue, 28 Feb 2023 16:15:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX2d9-0005ZL-US; Tue, 28 Feb 2023 16:15:07 +0000
Received: by outflank-mailman (input) for mailman id 503536;
 Tue, 28 Feb 2023 16:15:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pX2d8-0005ZD-3k
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 16:15:06 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060b.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0eb6f2f1-b783-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 17:15:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6855.eurprd04.prod.outlook.com (2603:10a6:20b:dc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Tue, 28 Feb
 2023 16:15:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 16:15:01 +0000
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
X-Inumbo-ID: 0eb6f2f1-b783-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dim9laGC/9pIt9pns7GRv9Ay3C5aJ0ATnPG9BXp3laKO5KOmKtMwXvRTg05hSQb81Y7zPKi221GhIirMS4ARG9vIbWxDv3x1xgPIAGoaChzsF4sEKg2m35eZ2ld2N3se5fUp2xqOy0/14ossIELjKC1EEWG3CENaULCnYU71HB4LuDONBo1qu0kGmkTI8QuBddxffbuKdel6SDgOudJmxK5bD6OPEDqu37WkUMhZvj79xnbIyY94TGRvbIKpgf8rjEB1zUR2+YRa1uASzPFyzqPI5Ql8gwqropWtBVBFxTXiZsxNGLv3AUjwY/b3Gjed2iSEWJLlmhE1+pUybAqoRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNp10086fur+oZYyp+BSwjOTKwUyAkJM+Eerv6MqBxw=;
 b=avE0qt7iuV3J1TTlDefzBsnbOHNy52IrWZGN5VE9LOLwYD95qEpAhQSuvTFYJ6aPOCTEyofHzlmIQN/bLV031lB9eRbW/01chLtH/ylFxlqhVrbxw0DqWpdK84VDIfk7Lal/lV6sGQ/mZBzF3F82snKGQEBAg2t8OpzBCr5EMvl21hkvyUZKUYVEIna+PWvSV/ap0d6U5hE7/5rm0zr7OxWzAOdbRAfe7yASUzvH4axOz2rHzzb6Xx7bWaoRP1O/Y/jlr25hrDYCmWsvRJQlLmNcbRYKgZVSqfwabJnNB39lw0QHZVXHYIvkHEFMz+yczdG1wx8OdeAkgb/sZjhNjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNp10086fur+oZYyp+BSwjOTKwUyAkJM+Eerv6MqBxw=;
 b=mpM/29Rb3z5lHBisHxDB/dc4Iv0plqcPYTeNy82jtrp9pmZKA/YReM4K7rYrr7syyYG4BF1VZNIVuX3EZPl6BxxKFeVIpC7RtOlnTI1IiEi1tbgopvuObgNS2rEjkXAWb0BELeiZ5uBXBsL/uBaTigry+6Cu0DDr9HC/mfjshZ77L2fs4qrPlnBurNdgwwhv1sZkd87ncHEjlTQniGtuDGY0Yd/m/M5lLvTUcPfekhgFjD9owk7OMuOoWc+LMwTxPDD0RB6XQAldNCThTX80mbjcsXZIv4TvfnsJiaFEci7VdGSnQ3JHexzMUCZgEXbSED+sglM8IEUnhyB8qGuOTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6e2fe766-1560-0f44-047b-d914048ef34e@suse.com>
Date: Tue, 28 Feb 2023 17:14:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/4] x86/svm: split svm_intercept_msr() into
 svm_{set,clear}_msr_intercept()
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-3-burzalodowa@gmail.com>
 <bf77733a-d0cc-8e31-5a05-f0709e7ef1fb@suse.com>
 <b13c5685-7d52-e0e0-95ad-7d766790d057@gmail.com>
 <dea4bf56-6b8a-7cdc-fa98-a9624f4fc67d@suse.com>
 <afc00a90-753c-18c1-65ed-8b8635874b2a@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <afc00a90-753c-18c1-65ed-8b8635874b2a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6855:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a85eaa-1376-48af-0fdc-08db19a6f18e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MOjUrtem6Kc8/N1TTVeeQpvWZgCvrvZibtlm/48sudhVZCAvVVCMdmfvLpYe7ctWYdT2gOSAVzfbXP6mQjOWXSVe3TYw4MSrPHYHS4K2aSrrA3b/OUt8RKr96xCuB0K0febVU2vcKgKP+3G+3ycnHRkmwW2YDGZCTeoyXfmlovFdfN1CMeusIplfaq1SMio387PLEBd5VR/gWkBqMHeoOOcuJl0AnNwoh6PLWb+mqNaHBXMhLJw3TTwGUJn87ySNVkIRA1XRCdLWnZSYrAE98+2ji8AGWwBsvqwrO9Nz9EsB674qhuDLxryE330MBdVXzAxZJrp2TrG3pvGyT+umpaYmyIHt+JbeJfysTQJbvdH+MadFPlf8zHaeRJIIeVtcvZdXUhFuNh+N5F4MjXSPU+IqmQecgCuUn335wtn07c+tQ0qeN7+dCdXD6uA8rFen8ENH8KZiF/T05RuA4azY4XF6sBL2SN3Hg3whTM1CJUmGguI1wJwcXIYht+tuXY9bLWjJySWa/EUqsfa4nYDgWj1+wMsmOY6qzto6Q61dYTvTEHAeeOL/I5y7D1yUuivlByDRdGS+ppKxMyke5ZJ7KgEl6ZPz7+iwAaDSARCvZKdPen142vt23CfodzlUncOt6Kmg9k5Cokn3Udm+ceN0bBjKBIHsgVfA4xtIzyWezl0vqNIzRkrqyit5NYSVMllJHMudo5Cw9/koDgBtYxHrphMEUtAmcOxhpXyDp+Hwdas=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(346002)(366004)(396003)(39860400002)(451199018)(5660300002)(36756003)(86362001)(8936002)(31696002)(66556008)(6486002)(478600001)(6512007)(4326008)(186003)(66946007)(26005)(53546011)(6916009)(6506007)(54906003)(2616005)(38100700002)(66476007)(8676002)(41300700001)(316002)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFlOWkNuYjZVcmhSd2tyaEJ2M1dwdXJkMjJ3S3ZjaXRrTTg4YTRUVDE0aE5E?=
 =?utf-8?B?TnlKTFl4UmRobkVCV1FlUGVWU2xZYU9mdHpwakdpd0oyYU9ONUI0aGpmSlhi?=
 =?utf-8?B?dG15TENzWS9GMzBBZDBIR0l6Ykc2RFdIODZIeHFTbCt1N2hLRmNwcjNIL1lU?=
 =?utf-8?B?clF0MGhlaloyYTl1VHhuajVCVHRUQkVnS3NZbFRobG55cWJNZi9wMUh1VG93?=
 =?utf-8?B?c1phVjBOaHFzTWFPWlFEV25XdGx6OFF1WHJXK2VjdmQ2bDhlemlLdXpMM2h3?=
 =?utf-8?B?ek9vQlFhQ2kzWjhYT0pDSDhMMlNJV2VLM3ZBYThPVzgwbndtS0dMbVovMUR2?=
 =?utf-8?B?RWFyRkdKd2gxL09YQlMzS2VCbUJyU2o1eGk1UjRMbDBHU1JRdTVYUzdhOVV2?=
 =?utf-8?B?SWNXYzZySzRiVUpUcE9Lb3RvUVpHeVgrR2xMZ3ZJWDNUWlpKRk5Qa2dvcGZj?=
 =?utf-8?B?SW1zQzh0bkx0bCtNV0tkbEJVby9QU25ldEhEbkFtZ05ZWEYreEtGWmYyeHRm?=
 =?utf-8?B?UzFRdXRoeWZJUFk2Y3RkRHhRUVFqWEgrWFhlSEltOVdUTXh0alV4ay9xSmpM?=
 =?utf-8?B?Z3l2SERIM0R3bXdhbUtEMDF4MXlwMFJnVCsvbEhpZUE3Qk5WQlMyWXl3b2JB?=
 =?utf-8?B?R2M0RjN0SWFzVFhFQTNKY2RuMFNWbGlOQjdxSzB0UlVFSzhER3MzRUFHMzZz?=
 =?utf-8?B?QjdSYVN5cEJzeFA5V1VZQ2lHTnVQVjlxeUdZRFFUNUZETjJjSVJjYWRidGNy?=
 =?utf-8?B?cjRaNWc5YTBJUUIwR2RvNGhFSDZYZjFqblhnNmlGQWlRaS9yUnZsanh2TzZ1?=
 =?utf-8?B?L1lSd005cFlWNnVJb251QkRJMkRiSzBFTEY0ekRGVmQwSGJmVGllclREcmx0?=
 =?utf-8?B?d01JRU1LSW9nVU45WnlXOGo5MnVmT2hDNWtOaTAvZkpjamZKcWg4dStFTkly?=
 =?utf-8?B?WmhvYmhZRkVvRE8rbE1hVGFSQ0dVNWppQ1lYNGlCMnlsaldmUW1XM2o2dEps?=
 =?utf-8?B?UEx1cDBHTFpLTXlrS3RIMCs4KzZKWmRNOHNRbnBaM216bnBYZzltOTduQUlJ?=
 =?utf-8?B?UlFSMjFSVWxldFdLVUR4YTBiYXVEVUEwa2M4Y09zOHVrVDV5Vjk4ODVaalc3?=
 =?utf-8?B?eHhDd3R1ZTlHVnlNZlRRemphckREaHFENGMwTjVqZ1paelRseEg5Q00zNWEx?=
 =?utf-8?B?TG5tTDdtZHRxdDREVkRIZUVrRStoOG9PckQ1VWIwWE5YdTV0STc1M2lwT05T?=
 =?utf-8?B?aGxpaElaVW50S3lQdHJaM21yTFBVOVRrQXd5RVYwRHlvbFN1YzcvSGRtVXFB?=
 =?utf-8?B?VHQ2bDRJdjdXRnlySmFPcEQzRVYyNUxsdy9DZ2lnZTJDdllXV3ZjVVM0QUIv?=
 =?utf-8?B?ZFJHa1FHM08yaXZLNHA3Vm1WZlArSGpYc2VxOG0vS3VVNDNKaUNaNnUyc3JW?=
 =?utf-8?B?eDBJcFFiQmlsYUhoSUkwdVBzdUZlemtGelYya3NjU1BsdnpjN1hRZlY3R0x5?=
 =?utf-8?B?Nnc5UlozRUlYZGhNUjA2UUtIUGVVcmtHTU5SRGs2Q1lla2hZcFdBWGlVVVlQ?=
 =?utf-8?B?M2p0dC8ydDJscGkwZ2U2KzJXVlBnQW9nWDlmS0NaUE1TaWFjaHpoQkR5SEtO?=
 =?utf-8?B?QzFiMlFQNkJhS3BSQmN5Y0ZqK1ppQlFlY29yM2d6MXhoaVNZZUthblhJazFJ?=
 =?utf-8?B?ZmpFVjBYRmREaWUwTDlVc0llYm1SOGxrM1lGQ2xKS1h2SXlJdG5QMlRqUk9w?=
 =?utf-8?B?TDBRYTRVQTRaZk9mMzYyZm9ueDRwL3NzSjg3MEl3L2wreUFmWXpvZlZEbFFz?=
 =?utf-8?B?eWZvNk9keXVEcnhSUDJYZVR3U1hSMVVSYjY4S0UrYnBpRnJ3SWJKeE5zY3Yx?=
 =?utf-8?B?b0hMV1YralVDS3g4NExJTGZiOFZleklTVUx3N1dCNG9sRzlERWdNaFllK0RI?=
 =?utf-8?B?RWlXWlRGa2xuekJOa2pHcU5aRFFyNHNrdE1FUzZuMThBRlQveDk5eVhLcUdL?=
 =?utf-8?B?R0tIa2dGeUxmb2MzdkpoSytlUXhRRThCR2lPSldENk8wZ2pOUWhXL1o4ZVFU?=
 =?utf-8?B?azFKQ2tQVDFaZ2FBZFhzVG5USUR0Z013L0ptLzcxQjZMK2tTRWFzcnZpZDU2?=
 =?utf-8?Q?aO++77qIHICATf9pWxXgwj4Sb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a85eaa-1376-48af-0fdc-08db19a6f18e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 16:15:01.3598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BjkqMJXkE+AMuK7X/M2bQ0msGt2GaXnWwl7I3xdr2guMblApvAo7cnl0miTLFid+smKudVNp1LyORIDAds6uzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6855

On 28.02.2023 16:17, Xenia Ragiadakou wrote:
> On 2/28/23 17:10, Jan Beulich wrote:
>> On 28.02.2023 16:05, Xenia Ragiadakou wrote:
>>> On 2/28/23 16:20, Jan Beulich wrote:
>>>> On 27.02.2023 08:56, Xenia Ragiadakou wrote:
>>>>> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>>>> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>>>>> @@ -585,13 +585,12 @@ void svm_destroy_vmcb(struct vcpu *v);
>>>>>    
>>>>>    void setup_vmcb_dump(void);
>>>>>    
>>>>> -#define MSR_INTERCEPT_NONE    0
>>>>> -#define MSR_INTERCEPT_READ    1
>>>>> -#define MSR_INTERCEPT_WRITE   2
>>>>> -#define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
>>>>> -void svm_intercept_msr(struct vcpu *v, uint32_t msr, int enable);
>>>>> -#define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
>>>>> -#define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
>>>>> +void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
>>>>> +void svm_clear_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
>>>>> +#define svm_disable_intercept_for_msr(v, msr) \
>>>>> +    svm_clear_msr_intercept((v), (msr), MSR_RW)
>>>>> +#define svm_enable_intercept_for_msr(v, msr) \
>>>>> +    svm_set_intercept_msr((v), (msr), MSR_RW)
>>>>
>>>> Please avoid excess parentheses. Also could you clarify why you retain
>>>> these shorthands when you don't use them in the conversion that you're
>>>> doing (e.g. ())? Are you intending them to go
>>>> away down the road?
>>>
>>> Ok.
>>> I did not understand the question. Which shorthands?
>>
>> svm_disable_intercept_for_msr() and svm_enable_intercept_for_msr().
> 
> Are you suggesting to replace svm_{en,dis}able_intercept_for_msr() with 
> svm_{ser,clear}_msr_intercept()?  svm_disable_intercept_for_msr() is 
> used in svm.c and vmcb.c.

I'm suggesting one of two possible routes leading to consistent use:
1) drop the shorthands
2) retain the shorthands and don't ever open-code them
Depending on which route we want to go either your code adjustments in
this regard are fine, and only a remark would want adding that they're
retained until remaining uses can be cleaned up, or you want to use
them in your changes wherever possible.

Jan

