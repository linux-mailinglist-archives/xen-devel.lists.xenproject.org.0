Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BA36B8F34
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 11:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509518.785396 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1WA-0000f7-D5; Tue, 14 Mar 2023 10:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509518.785396; Tue, 14 Mar 2023 10:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc1WA-0000by-8e; Tue, 14 Mar 2023 10:04:30 +0000
Received: by outflank-mailman (input) for mailman id 509518;
 Tue, 14 Mar 2023 10:04:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3caR=7G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pc1W8-0000bs-G6
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 10:04:28 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20627.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a2b04eb-c24f-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 11:04:27 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7819.eurprd04.prod.outlook.com (2603:10a6:10:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Tue, 14 Mar
 2023 10:04:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 10:04:24 +0000
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
X-Inumbo-ID: 9a2b04eb-c24f-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBG94Sv+XuU4faaSN+HeCxQEXB9ep1xfjjM0+miYo0osQxLXd8Vc96o51mebHSZeTcbjN463dJeSVj1UdmBRpSoBv/jhouyt5I8+8ff/drkdvo+1qa7k0xxwbxT9q3Cmv5k6Ph5DCjq+PMx9RAhB9zaWEHJ33XU21V75Zdijw9/XcSfWeRU8KTn8RjCzlBAVNVJT9Fw3kE/cdZxwykIuzDGZGsW5pL8qOYuOQiIDr8JJ8Hi4GEqhWhLzwZuGPrynDohV5uuQhp7Yo541atmHfiBxLBdkF02vWZjlWp4h42HXkX1Sp9dnAR9vB3lCzV4y6L6iPO8fDtHxf6fSEIQXaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lA/xKxbTURPOAvUbvJFs7wln/6jsZcZxrYUpwEvqp3o=;
 b=D72/2ccqDjs3TZQcZuJoqqDaiKLX2rxCoF7UUBGBgzrf1ZOLlNDhgfslb0KN2enw4LH1rEi+mE6EmXcKjcu6uhscUVNugmmMeuFpWTftdjz9Mqgs6ZHPUzdX0yl44EgTTsO7y6MM1GlmaKqV0OlLq7HmyaG7Tj2+KYQeK91ANxXCxWpsIKRukrzHiLANPtK7jhq+ZC2ma4gep0h7o2eUTCvz+eAUQ6Qtp+l6NCyoa7QyTtrj9fdnWjVcbgraWlr2lR+9HQTZYY/c4s1BhV6owPQpciY70m0e81yqphYYhi54mQJ0YtwB/rFLmYj2FX6p4VcxvlxN0u3ZwuceDBr5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lA/xKxbTURPOAvUbvJFs7wln/6jsZcZxrYUpwEvqp3o=;
 b=5vaE/S3/M3BBzv8gN6hlmuPHO/DZXcy2ut80YwaxUg+6EcJKmxWv6K65rtYQ6wsMOU5yDJqK4Ub16fhXsShy1+S8ny3amc+kXhFk5iBfb1KQuC4CB1BBIWPASk6xVk4ygBsaJQV6jQ+GGG+iiCTO4SnaVEwAStFX5wF8G+b0dq+WU1mnlGlbGMq0dJ241UcSb1pIvNxAD2odYqui0bGBGpyovb+l1ijhRFPfXlDlW17PrNUIKV0u5v3Adjv1mojz6Df5qEVvSD1LeXhMALmo9F0UQYOCGHB6RLyb/4T/lH1hdWmkiPEV0ivO57h7l0yqeT1MFGbmkNRtQ7EH4AFL5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04bfee08-53e5-49f2-3fb9-440b6861e3f7@suse.com>
Date: Tue, 14 Mar 2023 11:04:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] xen/grants: repurpose command line max options
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230313121632.86789-1-roger.pau@citrix.com>
 <2bcd9829-498b-228a-2a86-67f8c6e859aa@suse.com>
 <ZBA8yORIxXRM3RkO@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBA8yORIxXRM3RkO@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c693707-985d-43cb-d019-08db24737cbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nH5T84CM/r1hZy0eZCBJfbDYQeYKLuDRuMNj5Nqkybc+rJ3QIUwgUgEIHjWIm8Is2/SHF6IBVYYPzZjS4gD+4sPEHaJ9kWacHZRg2R0yz+RmWW4QM4llldQUubpPVRvz5xC/MqOFXdpNqKiVW/zMTwL+05I6PcqmveIkqbZGgSD4pwrM14rXIEseQjpFDipwVI0XVHq1Npxbc4IiLuPdgJ1xUhQbpM8n2vEWrzDTsGX7AhDjJnvZZmbrk8h4bv7RDdb/beAdv0afoX7PgNhoeCLaBrSsjTQzYq482+7m5iXwcw3vmr2+ScVzhl2Adp0njyz+SOUdOsjnsrWas95+veGqNnh8fAyLKPDUvTeoWtFvPAhCwgY1M49Qfsd9mEfz5amai7EOoYOBNoEI8cNoArdJ3eppkbVqEdi0qTU2ibcv2VkOAt/TWApBAkq9helCgGAW9l7ttq5oRRBFp+NlXtYI8l38sfigzOISNrq7Qg9HUsUFn5ErBKmIt4LtzdIONc63NgIvuYnBheJJ6fs+bE9hAUIT8tPwTAb3CC+kbDF03TTkQaRrpwWByvRXjQIdJiLyneuXtvmsSOPEp+ekBZPTdKD7rGEUIKMLzk1bxvvwe1tL7Q2xEJrJGM86cKS57Kf3z238IzCDtPvOeUECxGC8hLxwuK7B0URFcQ50+DLi02RN9+WcpXtUVSU6ZgiN1mmAxaxQKC7p18qBkKsrNSefI05D//joEJ7oo0/OuRA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(396003)(136003)(366004)(39860400002)(451199018)(66946007)(31686004)(6916009)(66556008)(4326008)(8676002)(41300700001)(83380400001)(316002)(54906003)(36756003)(38100700002)(8936002)(66476007)(6486002)(478600001)(2906002)(5660300002)(2616005)(186003)(6506007)(86362001)(6666004)(53546011)(26005)(6512007)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aG1rRUxhNmFoZEJPKzBHaTBIR2hZWmFXcXdmVUdiQ1JWZG42cFdDMXlJSzMx?=
 =?utf-8?B?NW1GeC8vbjlPRVhOUnRQMmV6cnZVWEdTVVdZbnNmcCttRnIyaG5qYUpuMzVL?=
 =?utf-8?B?MGd4bUU3TnZsWG04MXVIWVJmNU1RUjVoZ1U2SHNTNGtoYzNKY1BoeUNGTXEz?=
 =?utf-8?B?TmFoYWJkMDNNZnV0eDY1ZTRuSExnMXRzYjhrN2lYb1NFNVY4Zk9kUnRHbzlj?=
 =?utf-8?B?V1ZQVzhBS0o4YjlvZ3FoMlRSazgybUVBQnhoMTI5ZmdXVHozZ0VhY21LUWJs?=
 =?utf-8?B?L2F6aGRwQTlxbE14VjNDeXZFS24vZ1FLTmsxUDcyTllHc0owUnAvTEQzMzBM?=
 =?utf-8?B?TnlhampCalRaUlVMMjVnK2k3Z3hpR3hEdU00T2UxYlVwM2Z4bVJJWit2M1h5?=
 =?utf-8?B?TFNZcTNxZEs4RVJJMlBXbWRDMDNESHZhZHhKdjNPellQTFEzSitKMnljdFd5?=
 =?utf-8?B?MFVPUVpqUEMvc2dubjNUaGF5NThCbGZmck1zTHNuR1JIWlJFN0w2Sm14Q3dN?=
 =?utf-8?B?WVRRaXl2QURvelpVZ3lFRFR4WmpaWVA2Y3VqRW40VkJPWUlyNko4Y2FuNlRY?=
 =?utf-8?B?NVVTeXFkakQwYW1rUHRhSlU1cktVcFRTbi9aektMd0xVVTM5d2s0OThJRk04?=
 =?utf-8?B?WDJPR0U4NEZJUzhBZGoyamJFVzNVYTRKQ2VzTllLcWwzMWduZll4elRKQ3Zm?=
 =?utf-8?B?Y2M3emNTSWMwOVgxOVZRb0R4d3FBUkUrRFFMMzd2WkREbm1iTG1XL01KVDM2?=
 =?utf-8?B?OThOd2J6T1Bra1JNMTlGTFRCUTJuNkpMWW5iY1hRUUFWZGNKZTAyanlZeHFV?=
 =?utf-8?B?UzVrWTloek5YQlZ1cFhiSHpLTEF6MlRIME4yd2N4VXNsdm9wZmkxK3RXN2pw?=
 =?utf-8?B?ZjJ5dXMwY3JGVloyazlOcm1kMEplZll2V1ZBUVk1UHVnelZvVVlmY0xad1lW?=
 =?utf-8?B?YnR0dGtSV2wyekV4dXRaY1doZksvMVFCQWRWWUlKU2MzN1crRHNKOWIxQnBJ?=
 =?utf-8?B?bEJTcG9oeWxQbXBBRXlvcjR1WHpCVFVvZnlmelg1dkFnNFNSZDhtUm1DM1FR?=
 =?utf-8?B?U2dJTmQxRGFTNGVYZU5maFNvd2tITXRIOWZoMUFuS1M2UCtybnd2NUNydnZr?=
 =?utf-8?B?T1NKVTNabXFFR0c0M0NZMUtBdCszL0d5dFN5UXoxa0F1dzlpNkVtTFZNMWV0?=
 =?utf-8?B?QXdCMTJxTWNkWHYyS0RVREZwMnhKZlhUaTlSSFgvZFVyd3pTOGdhV0FlbzJH?=
 =?utf-8?B?bmZibFFFMVgzZTVIUktTZW4zaW5yTnRMbVVuZnNiL1plMnI3a0htQ010b2N5?=
 =?utf-8?B?ZHVNVDdJRnZTWmJ1blJ4NytaWU1MbjB6RmFRZVdYaFNPRmlZdk04bGtMbUdt?=
 =?utf-8?B?Q3hpL3pKdUE3cXhueWtoU0JEcWVEK0g4aTFnei9sRE9udlU4WmpXSXQ1THRj?=
 =?utf-8?B?dW1jQ0F1eXR0QktDTmtiVnBqN2lLc1I0Y0R2NGV4V0xha3hlZ1BLNlJHcStK?=
 =?utf-8?B?dndGOEY4TWs4L040MjB6dTNUQ2hvU0M5ZlBtdXdWWDlvUTJzZWRqZk5RcFBJ?=
 =?utf-8?B?MC9Pak1VT2dsdS9aU01kZUxSY2lOdms4U2hTY2RqK2RsMWl1cVFBWWczUXRQ?=
 =?utf-8?B?c2QwTWJzRjVVY1lEaTk5NzRQNXU1T3RSUzk4YkNuUkxLdktiU2dBR0tmWUpn?=
 =?utf-8?B?TWgwejdHRm80UythZ0NXNXRzVlA2TVU4dnpPZzJIeWwrb2dIWmRPVmxpMi93?=
 =?utf-8?B?T0tFWEVKL0JiY2JrRytGNXhtZFYrOThpQ0t3Wk5WTW50WTVseGR2a2VvN3Ux?=
 =?utf-8?B?elA0bEpETnQ3bGtHSFFyYkJMVkxNeE4xM1RZOEphaG4xOUJ4UzJNc1MyK1F4?=
 =?utf-8?B?ZVFKa0QxUkdmQUlLcmZyR2ZwWit1Yk1TUnlKczJhcE84MGVEcWM1QVZHdlNx?=
 =?utf-8?B?djM4dE82VkNQOFNmOWtvZytZK2xwb05yNmlUVjJ0bW9UVVJYa1Nmb3NiblpT?=
 =?utf-8?B?bDNHeVJNU3MvWEI1SWJWZitWdkl4MjlzK0dvOWM2a2o3b0h4OE9OM3dycUI4?=
 =?utf-8?B?cGV6aEhlcitQcXBncmxZTm0xUEt2Vm4zOXd5Skx1MWE5NmMvdmpMeFhtQmxv?=
 =?utf-8?Q?XVPSXfeNP0czsiiEc6dgMAnYF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c693707-985d-43cb-d019-08db24737cbe
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 10:04:23.7963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV9bz0of1WyMf1gvI0KNo4ipL6BOlbDyejhpn08RiTXgb+q8JAYGCZP6/HbZGr/ta12GwUJonrDjM9cEsubFtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7819

On 14.03.2023 10:22, Roger Pau Monné wrote:
> On Mon, Mar 13, 2023 at 05:55:09PM +0100, Jan Beulich wrote:
>> On 13.03.2023 13:16, Roger Pau Monne wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -1232,9 +1232,8 @@ The usage of gnttab v2 is not security supported on ARM platforms.
>>>  
>>>  > Can be modified at runtime
>>>  
>>> -Specify the maximum number of frames which any domain may use as part
>>> -of its grant table. This value is an upper boundary of the per-domain
>>> -value settable via Xen tools.
>>> +Specify the default maximum number of frames which any domain may use as part
>>> +of its grant table unless a different value is specified at domain creation.
>>>  
>>>  Dom0 is using this value for sizing its grant table.
>>
>> dom0less DomU-s do as well, at the very least, also ...
>>
>>> @@ -1245,9 +1244,10 @@ Dom0 is using this value for sizing its grant table.
>>>  
>>>  > Can be modified at runtime
>>>  
>>> -Specify the maximum number of frames to use as part of a domains
>>> -maptrack array. This value is an upper boundary of the per-domain
>>> -value settable via Xen tools.
>>> +Specify the default maximum number of frames to use as part of a domains
>>> +maptrack array unless a different value is specified at domain creation.
>>> +
>>> +Dom0 is using this value for sizing its maptrack array.
>>
>> ... here. And even ordinary DomU-s appear to default to that in the
>> absence of a specific value in the guest config. IOW at the very least
>> the info you add should not be misleading. Better would be if the pre-
>> existing info was adjusted at the same time.
> 
> Aren't domUs already clearly covered by the sentence:
> 
> "Specify the default maximum number of frames to use as part of a domains..."

Hmm, yes, my attention was caught too much by the Dom0 statement. While ...

> IMO dom0 needs to be explicitly mentioned because in that case the
> value provided is not the one used by default, but rather the one that
> gets used.

... explicitly mentioning Dom0 is fine, I still think this needs wording
differently here, because Dom0 doesn't actively do anything with this
value (and, as said, it can't even obtain it other than by probing how
many mappings it can create).

>> I also wonder about the specific wording down here: While the max grant
>> table size can indeed be queried, this isn't the case for the maptrack
>> array. A domain also doesn't need to know its size, so maybe "This value
>> is used to size all domains' maptrack arrays, unless overridden by their
>> guest config"?
> 
> I think the wording I've added already conveys this meaning:
> 
> "Specify the default maximum number of frames to use as part of a domains
> maptrack array unless a different value is specified at domain creation."

Well, I mean specifically the Dom0 related statement.

Also to me "default maximum" reads odd (and slightly ambiguous). Would
"default upper bound on the number of ..." perhaps be a little better?

>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -1956,18 +1956,15 @@ int grant_table_init(struct domain *d, int max_grant_frames,
>>>          return -EINVAL;
>>>      }
>>>  
>>> -    /* Default to maximum value if no value was specified */
>>> +    /* Apply defaults if no value was specified */
>>>      if ( max_grant_frames < 0 )
>>>          max_grant_frames = opt_max_grant_frames;
>>>      if ( max_maptrack_frames < 0 )
>>>          max_maptrack_frames = opt_max_maptrack_frames;
>>>  
>>> -    if ( max_grant_frames < INITIAL_NR_GRANT_FRAMES ||
>>> -         max_grant_frames > opt_max_grant_frames ||
>>> -         max_maptrack_frames > opt_max_maptrack_frames )
>>> +    if ( max_grant_frames < INITIAL_NR_GRANT_FRAMES )
>>>      {
>>> -        dprintk(XENLOG_INFO, "Bad grant table sizes: grant %u, maptrack %u\n",
>>> -                max_grant_frames, max_maptrack_frames);
>>> +        dprintk(XENLOG_INFO, "Bad grant table size %u\n", max_grant_frames);
>>>          return -EINVAL;
>>>      }
>>
>> I think I agree with the relaxation done here, but I also think this not
>> introducing security concerns wants spelling out in the description: My
>> understanding is that even in disaggregated environments we assume only
>> fully privileged entities can create domains.
> 
> Yes, that's my understanding, as domain creation can only be done by
> privileged domains.  Of course when using a custom XSM policy
> the permissions can be changed, but it's then the job of the user to
> asses the security implications in that case, and there are existing
> paths to cause resource exhausting when having access to the domain
> create hypercall. I can add:
> 
> "The relaxation in the logic for the maximum size of the grant and
> maptrack table sizes doesn't change the fact that domain creation
> hypercall can cause resource exhausting, so disaggregated setups
> should take it into account."

SGTM, and ...

> But domain creation for example also allows creating a domain that has
> MSR relaxed, at which point it could also be vulnerable to other
> issues.

... I think while what you say is true, it still is relevant to point
out for every change which may cause yet another way of running out of
resources.

Jan

