Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44B66D8D5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 09:55:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479105.742723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhkW-0003V5-HL; Tue, 17 Jan 2023 08:55:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479105.742723; Tue, 17 Jan 2023 08:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhkW-0003S0-DF; Tue, 17 Jan 2023 08:55:20 +0000
Received: by outflank-mailman (input) for mailman id 479105;
 Tue, 17 Jan 2023 08:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHhkV-0003Ru-1B
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 08:55:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa2cc600-9644-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 09:55:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8452.eurprd04.prod.outlook.com (2603:10a6:20b:348::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 08:55:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 08:55:15 +0000
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
X-Inumbo-ID: aa2cc600-9644-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A62ayVvoPNO3ApzkyeDi66NbD69bqRJGSxd3Ojb3pXmRDbHJwuo68GQK2RMinz0xZYMGR6p8OZf1eFu2I8z+9rx2klMZyzgpj+bIH5nZPjvlnc/mcvpYA0Z+dztEelnjMBBVdn8028q31y/yAoxbu8llEAo/JdKeVfp49jS6EAueYhgRakromi9OhMGMBQXGnPyEKZVg896o84zLe98c6romWHiIU557N1JjAWia6ZvvgEzzRLy1/0YgbDRd8wcssffo0HO0HTpRPrI4vm56+MMOWn3WZcd7nAYU1QISCVmNAJmDLXJXx8GjBK3sx6qWHpLQNoVvY+GgU+poGFn1HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1d0EFzGoUlPmQpIOV+viY6VDUfuyum5MtDkj6IXo63I=;
 b=hW4nG+5M/xEVgQsLtujmG2dUixrriIVLzDTZqrU4+l9h0pia7MVuWMknDNSv8KblZmu1qhuGqGhrOlGDwLaBRLfRoLfd92wBWL+LvLG313CtfUxear+F0tnX5cMQS7Q8CBmSxlluOSbb5SFDEpboe0Q0KJGlNEdhE7RbKedYz1n6k4lin5c0rx6DPxDTGoHJI0nkTXO0puQUpzAgsdK8Zu+DB9ZXrOamjMZ0B6oR4LdWW0kvON4zJLaVqSJrdcV59Yi77z09zDr7PDwTcg8pAgYi5wYqDHwsdYvRSRpkC8TQfKmKugbuJaHvYeLKsaDOl1Xkp2N6Yuq+ZhiI3pjFQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1d0EFzGoUlPmQpIOV+viY6VDUfuyum5MtDkj6IXo63I=;
 b=dJWCzvJ2HqJpVyE+9HzlKId0rfeTeRTScNr+kPvuC39G9z5hJcg3AdVx0Z4fgt2Pkt+DUWKNsSj8XJHUpSpiMClgWLL+px4qqOqQkVxiKTauj0HKWZwY5253gp4B5okCHABqQqFiYCp6bPBXFjEc0XpOgiHmy84uaX88I7+TGt5ujsexf3hFRyYeQ8PUzbdlA6AMu+jGC0aJ+b1HsnpNS41vXuO8JMIXaX0rKrpeZaYQIXmtTXO0hPp0plgDVuu6l0NNXWtTe1FZ60Xt3SVj+JGHhoerHEr2X8MMNtkmmBOvqRrOz4PHsqvltKPK3DFxfjpyigNu1QeEvj9/lCTOQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff7770d4-841f-356a-78b4-294bdb770fbe@suse.com>
Date: Tue, 17 Jan 2023 09:55:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/5] xen/version: Introduce non-truncating XENVER_*
 subops
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Jason Andryuk <jandryuk@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-4-andrew.cooper3@citrix.com>
 <5ebe5337-f84e-12a1-e8a0-92832100946d@suse.com>
 <2d3dc0ef-4920-2bc8-6ffd-6b954fc8c68a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2d3dc0ef-4920-2bc8-6ffd-6b954fc8c68a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d884473-77ee-4a3d-73a9-08daf8688cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pJVnSEkjWkGxMepRse2q3KCOx+SajIWcoIbdlc64Kh23iNiVeHR0/14L10pmqimDdvMcPPVDhKTCG9J9FNHSvL4zamLOQ80Lcbz2aic4g3cIKcVwGPlqkJcJvXTQbeUIp0dxLSzU1H5EIRxQgqyFuccc/58OG7D/AXb+161joHf6o5iEVhNlV9TmuCsXc1VLZkwpEA3pw507t2LEHbqBnyYM/Av4PWBxQoY9huug8NtYEsbDTi04PYV+rlputs4pvBmhwrxyGy5nC8qwC1bN15cBLBpl4GMdE0neeKVxvsbBaXiRCQI8FKT7KmKOHpbezE3v3ia0Cxs6syefQ7jUd7vr30bJWvuPpicRsh/eFqTQmtNw9TXRlYP4tAEsOj0IJpGnyRIAejn0RYI+chdfN+uSSvfB/fglk/mMa58tP/8uGhgfZkBEbiqRQXzrtDW+AiYH9J+Nb6pAdttOHhFs4aha3nnuZNwWqm7CTxH9AVXEtJhjP5kAaHZoOg9dRfKdNCiaxB9+1ZhS4etb0QAt0jArmBtnRD4TVpuRriOAJfLGLBY+0SoatySbiL2eKggcA2Q6ENi+6Gr/If7ep/E9Z3UPgFp5MYkRmeZEj7yAPlMm2jKKjlOKKkSmgu8pKj4SPIwtEeuwo3wecobH3NsY+dDetXjgDNmy7Wxs/YtgFHtpHaM2/b2HhXJGFsresroocq6oghRffswzJVBXNU6c64doBwdGs5U1rNy3rSRw59Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199015)(31686004)(36756003)(86362001)(38100700002)(5660300002)(8936002)(2906002)(83380400001)(31696002)(54906003)(41300700001)(316002)(478600001)(6916009)(53546011)(8676002)(6506007)(66476007)(66946007)(4326008)(2616005)(66556008)(6512007)(26005)(6486002)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZWQ3TXdNQjJlME4wdHUvSVlLWEkxbXNMb05tbUR5UCs1Q3hlNXdVaExXRW5G?=
 =?utf-8?B?MlB0cU9BdGNXRWxTNzg5Vy8wRHdaUjlzNkwyNmsxQVpzeFlXV0E1TjlTZWhS?=
 =?utf-8?B?RkJGeVZYNXlJU1JSV2dXSzlSTkl6aXgvTk5oM2s3dy9KUUordnhvZUg2Tm9H?=
 =?utf-8?B?R1NqanVaL29kTWVNWFJia0cxZjYxdW1hYS9pcHFkNTlXenpUcDA2RHh0aFRG?=
 =?utf-8?B?M0ZmbnhQeTlCTnhORjY4YWtqNk9OY0NsUVJNdXR0Y09lSXNwNjRxME10M1Mz?=
 =?utf-8?B?cjN6NDBhUjRmZXU5SnhSckRFeGdaMEg3RGtKZU0reHA3WHFhY2ZUbGhhOW0z?=
 =?utf-8?B?M2w3THN0em1YcGU5ZTEvSkp2RWpCU3dOR1ZzWTZweU44b3FjVXlSZXNnUDRi?=
 =?utf-8?B?T2RsK0NHckQwVmdOUTZRK3lDeDJ4Y3FUeWhtQTk3S0ZscldlNk1xVWJGT2ha?=
 =?utf-8?B?dVFWYlNjei9kS0dia2ZybHBUS0k4bllMcXE4WUU4UlowMFBhbkFSSWFBYk5a?=
 =?utf-8?B?cll0d1B0RmlDd21GM0RwVzVGRUJIUTBWak4wSVNkUTFBNG9Wc1B3a0ttdGNx?=
 =?utf-8?B?MTVGakpuTWxYUE1aUkJkWFZ5b2MxODJzQ3ZTYTdiRkJtTTM0UmtOVENxcjVV?=
 =?utf-8?B?ZGh3YTRUVW53TytXZjIvcmg4YTBOWk04cnNTZ2J1OG44dUxGaGJzMEIrM0NW?=
 =?utf-8?B?aFJzWGtTR3RKS0NwREdDRFVLMkNOeE1OOE14aXJ3c3NLZTExM29CRHlmU3dV?=
 =?utf-8?B?N0VYdVdDYk5RVWlFM256eGhMcUtBQnpRYjZXN2Y4eXdpT3dueUJGSktGV3pM?=
 =?utf-8?B?OUVFc3ErRWtoTHdCR0w2dEd3bElObzRpaFdFbWFQMUVwanE0aXd5NDVITEp5?=
 =?utf-8?B?OE1oV0Z1MWoyeFFSVWRoWGJiMDhHcUJndHA1VHVEQ3VEeW9ieTBRSy82RFdm?=
 =?utf-8?B?ZnJqQmUvTnh5SFJ4WW1Pb0pQWURKbTllK1JEc1JCeUJmMDFBMWRjRVVmc3NR?=
 =?utf-8?B?MnhxTXc3UmtRaGJ6S2Zob2xRMHMzOGloVEFJTW9XNVg2SklKMEtCc1UwcXdw?=
 =?utf-8?B?T0FUcDlCZWRLVndWT1BJajNRdXhnRi9ETm12UzlrM21hb2U5cWN0SVZxR3lj?=
 =?utf-8?B?bUhHTUxOamdvNUZDeUJ2TmYzc1JkT1ZVRG1DbnVZOUMzQ0RiaU9EaHVHcFpY?=
 =?utf-8?B?S2k0NVJ5SG1FN0FmQ25HMGIxaTU3dTY5d0pjZnZ5M3o0MUVUUkl1dm4zdUo4?=
 =?utf-8?B?dytHNWVDMGlPYzlnb01JSVR4V0E2MjBHcW1LK3FNOGFXY2p5L0hBcFBvQkZT?=
 =?utf-8?B?aE41REFlOTFBL3hXTCtvQjFpQkJyRGtRWFZBeVNJSDhnNlhYTW9DbVdmL09B?=
 =?utf-8?B?S3dRR1RjNDE3RThpS3RINEtmSUxQcTVPeHB2Q2VxOXVIaU1ldkFqd3c1L2Nq?=
 =?utf-8?B?cEtESUVDMndOM3E5TEFjSzZ5dEVWRjdqdmR3K3VGYklmOU1rMVpJL1pJOG5J?=
 =?utf-8?B?emNqM0oyVWJJL2F6SEo0eDBkRWFQUHpwSlNtN1NyWE5oTStTYThpL0lrcG5B?=
 =?utf-8?B?dGtML2NqWlRKV2trbmIrclpBZ1JRTVVxS2IwckZnd2p3VVVrOHprRC8rZUNl?=
 =?utf-8?B?QkVGeldtTWlyckNHYUhVMThPdlBZYWZqUmphQTRvS05VUTVnbTVpekNrbUJY?=
 =?utf-8?B?Skk2aWZ4NFZNUHA3Z2dGTHNvbGwvQk9mQ0hYMWVWdWQ4R1F6aHQ1eTJPUmY1?=
 =?utf-8?B?TW5hbWdsbm9uUGJRdkxUaXRrTDJuMFhzZ1hCRVN3UTI2NmRMQ0Y2YVk0ZWRV?=
 =?utf-8?B?MUxLdnRxVkhUc1pmNFBQYk9qeHZnRU5DUW93dXZkRUJheFZPQlJGTWFZZmhG?=
 =?utf-8?B?Mm11YjE1bGxKU3dSZEtMbXdaVThOdSt0bkZpdHlJRVRTZFg4UzJkR3prcFE0?=
 =?utf-8?B?VUZwM2ZkZS9WeWp4aTloSHNhY2JtN0NaWnRZQTRMZ0toNE01MjRYK1dmS1F4?=
 =?utf-8?B?T0JBbkZLSzBvcE80Zk9uUzlpSmdQUlpaK1dMRk52VnBSMHlVTDRYSnlxR1F4?=
 =?utf-8?B?ZFhwREtiOW9Ua1AvQjl6eVgycVRhbExBbXFEcTY4aGFYREUxNlBXOEdjZFEv?=
 =?utf-8?Q?U/LsxF/aaYlo4hKNpWrDXZPdt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d884473-77ee-4a3d-73a9-08daf8688cfe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 08:55:15.3682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CUqnYFztPU5M5dXchvRJ5yiTxGZ1Aj9WS+mHxn5A90Tpn1ovVg5QMQF7nTscP/tlaV+0NP+jXeZSAJ1kt3loTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8452

On 16.01.2023 22:47, Andrew Cooper wrote:
> On 16/01/2023 4:06 pm, Jan Beulich wrote:
>> On 14.01.2023 00:08, Andrew Cooper wrote:
>>> @@ -470,6 +471,59 @@ static int __init cf_check param_init(void)
>>>  __initcall(param_init);
>>>  #endif
>>>  
>>> +static long xenver_varbuf_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>> +{
>>> +    struct xen_varbuf user_str;
>>> +    const char *str = NULL;
>> This takes away from the compiler any chance of reporting "str" as
>> uninitialized
> 
> Yes...
> 
> It is also the classic false positive pattern in GCC 4.x which is still
> supported despite attempts to retire it.

Hmm, I didn't think this was the classic pattern, but instead it was when
there are two variables, where the value of one identifies whether the
other was (also) initialized. But yes, if proven to be needed for 4.x,
then keeping it there would be unavoidable for the time being (but we
should then remind ourselves to drop this once we've raised the baseline,
perhaps short of adding a gcc version conditional around the initializer
right away).

>>> +    if ( sz > KB(64) ) /* Arbitrary limit.  Avoid long-running operations. */
>>> +        return -E2BIG;
>>> +
>>> +    if ( guest_handle_is_null(arg) ) /* Length request */
>>> +        return sz;
>>> +
>>> +    if ( copy_from_guest(&user_str, arg, 1) )
>>> +        return -EFAULT;
>>> +
>>> +    if ( user_str.len == 0 )
>>> +        return -EINVAL;
>>> +
>>> +    if ( sz > user_str.len )
>>> +        return -ENOBUFS;
>> The earlier of these last two checks makes it that one can't successfully
>> call this function when the size query has returned 0.
> 
> This is actually a check that the build_id path already has.  I did
> consider it somewhat dubious to special case 0 here, but it needs to
> stay for the following patch to have no functional change.

Would such a minor functional change actually be a problem there?

>>> --- a/xen/include/public/version.h
>>> +++ b/xen/include/public/version.h
>>> @@ -19,12 +19,20 @@
>>>  /* arg == NULL; returns major:minor (16:16). */
>>>  #define XENVER_version      0
>>>  
>>> -/* arg == xen_extraversion_t. */
>>> +/*
>>> + * arg == xen_extraversion_t.
>>> + *
>>> + * This API/ABI is broken.  Use XENVER_extraversion2 instead.
>> Personally I don't like these "broken" that you're adding. These interfaces
>> simply are the way they are, with certain limitations. We also won't be
>> able to remove the old variants (except in the new ABI), so telling people
>> to avoid them provides us about nothing.
> 
> Incorrect.
> 
> First, the breakage here isn't only truncation; it's char-signedness
> with data that's not guaranteed to be ASCII text.  Yet another
> demonstration of why C is an inappropriate way of defining an ABI.
> 
> Secondly, it is unreasonable for ABI errors and correction information
> such as this not to be documented *somewhere*.  It should live with the
> API technical reference, which happens to be exactly (and only) here.

I agree with spelling out shortcomings and restrictions. The only thing
I do not agree with is the use of the word "broken" (or anything to the
same effect). Instead of using that word, how about you actually spell
out what the limitations are, so that people have grounds to pick
between these and the new interfaces you're adding (and being nudged
towards the latter)?

Jan

