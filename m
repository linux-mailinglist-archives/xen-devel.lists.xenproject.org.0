Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C52F874E8D7
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jul 2023 10:19:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561589.878031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ8Zu-0008Ff-Kc; Tue, 11 Jul 2023 08:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561589.878031; Tue, 11 Jul 2023 08:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJ8Zu-0008D9-Hi; Tue, 11 Jul 2023 08:18:34 +0000
Received: by outflank-mailman (input) for mailman id 561589;
 Tue, 11 Jul 2023 08:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B4LE=C5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJ8Zt-0008Cq-FE
 for xen-devel@lists.xenproject.org; Tue, 11 Jul 2023 08:18:33 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 853cb7cc-1fc3-11ee-8611-37d641c3527e;
 Tue, 11 Jul 2023 10:18:31 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB7620.eurprd04.prod.outlook.com (2603:10a6:20b:2d9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Tue, 11 Jul
 2023 08:18:28 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Tue, 11 Jul 2023
 08:18:28 +0000
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
X-Inumbo-ID: 853cb7cc-1fc3-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l8CcOPMbyvfMfdiJ6y5Qhu0ZuXcfsAm/U7hBy05AJhAP+xLhUN9V8czFhrClSBJKMRDgqCi0aJXKOIaM1pDlK0luiNOtxC5BB0lRv2AjOKeiwkbfp+TvUI+UFAIdBjgXT8bQ4al+QQaywNIljWuPikCLsrEk03Og5oqG9O88Ykm6W8SCpla9sPc4JPXbPtxXn9FbCISdSuCHDU/QSJCgX2fk62zn854e127MXna7SX+ol4LVutA+7XV7XREX1TKNSRKIKzwfXUFcECq2bmJI6YnN+s44AzrUpSgFKvvnCVIIP+a/cMg3IR6YBhR39GVVh6BdbSQd7sFkqOvxu6SAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3ZF2lWzKynvoNwmRY986rlw0ClMfqHtRt6TzMZ9ZTI=;
 b=UfLC3NEz/UWsngz7GBHkW3fYzzffbN9bjpiCalFZ2tG7GaUdoYlK8JEs1PD4qUyMQ9Zjth8fAdA30P1TPNJo3w1taO7gDcYVIQa2ot09wTT5tmxDepFjO6sGqNfZU4uvuEuCpEstxFzyZ6ONZwJHsJjOaeYcRTmdyXtD0uqt+DUTOTAfg8J5Y1nEqfIv/Q94iJsJYn1vRWW7AxcllaWBjAeMfOJ3d1wbdzhNXZDaaRq/gs4UwsdZvK7vKBUij9KVpnbN610P/xe1eh44j3gzlcQAKXa/OXPH4Wt0mQOeJZucR0I+LQuQAuqyZE+3nmV6NUzip4Y5SEKEG0u7olejbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3ZF2lWzKynvoNwmRY986rlw0ClMfqHtRt6TzMZ9ZTI=;
 b=z8YlJIaz3m2sM6bJyD23u+n8M/FbAxVJUOGQyhBpkAppa7J/lqTXwewD00u7O1TXsLoasEo+CgQGqBJ8dM4cg2wj0VOvYM+gO2GiC6Jo1j4T0WJLm7grWuFnyFhsOYe8K87sMFp+Ah9Dr37/Q8yEO5G26f3aGfNm+VhPvAgozWwms8nvexAXKsEdXbUhhPr5ZOQHU/p3S/ZsfbkE6hXoeBTXyamu41uT9QXLXCMFTASVTre1QvMF4CoqulTLtSIt+QzCLmARuCzPHCN0FhvrnbJbfaAYw/kcNXl2tMTR1XJv61BtE+Ltq4wTkIV532ufGOANrnylQKKjHVR/pHw98w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bfacee48-f640-f2eb-7fd7-f440ad03e612@suse.com>
Date: Tue, 11 Jul 2023 10:18:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 06/15] cpufreq: Add Hardware P-State (HWP) driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230706185440.48333-1-jandryuk@gmail.com>
 <20230706185440.48333-7-jandryuk@gmail.com>
 <eeeb032f-a21b-5eb2-e3d5-63357a04a500@suse.com>
 <CAKf6xptn0OL0qz+DW9qrwU=sFSKSp-O3S7z6vFbZp9RstFanbw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xptn0OL0qz+DW9qrwU=sFSKSp-O3S7z6vFbZp9RstFanbw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JN3P275CA0013.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:70::18)
 To AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: af676e52-808b-4571-95c3-08db81e767c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OQ83FrxAXjWdqRiDITaTvZt8DUJIplBpicg6UL7o8r/ODszNbEColG9LWOyw17SEoYRvuVbhwbKvZWiAMdOZrT1iPRwTzRICb/hHEd0wTEd9VCSn0GpWk2RdLVLE6RmjlU8s/W8kpIWUVbMAQgolNXNNz1vNYSApLS51RIDKKW66peKOZAz7BRLO/e/qDuHJa8SJzp/56bjBTJqcPimOgxmXzw5SQY/QyJIbWakphGokIdmJwEIydKa3qWX3Nn40/+vm8uyO8Znt6/wtV4ssfPvkgOAmNpryBrhut9Be2LBO6ktl0kpRA9wHKUKunksbAzWRJ1MMbqenxnDdOUOFB4+qQqidPE+0zB5qdAYFGj38OjCHR9yafmPd+aueQGJMjDXliY3JXdFMsvpU//pUbLWPbmCuxR1BVaKmLFbg+5Ynsfc6HKnV3Sd9KD2KF3V/ji/7b5iZpL/iTFe6a5zVcKJA1HK2Ml9xaZBX0ioat/zHT9F3hb/FFY98/g3jK1tb40xoswbvYKQ/f2xcTpTQuEg/cexhLsIB2BhVn563qppidEJ3t3IgWJV47NncUx7pTSqZN6Pa4xinUC/dUoctQ+rjbteV+sZcmTmIlEueWnYho0PMtp1dM+xYqmEmWtFgZftGuvFKp7Hrf8gUncdvIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(186003)(2616005)(6512007)(26005)(53546011)(6506007)(478600001)(83380400001)(41300700001)(4326008)(66556008)(5660300002)(2906002)(316002)(8936002)(8676002)(6916009)(66946007)(66476007)(6486002)(6666004)(54906003)(36756003)(38100700002)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eUZndVpPN2t4WmUvUnFveU9rYjU2ZFppcjErWkJReFozZzBWVW9STUVMN2pw?=
 =?utf-8?B?dnRUMktULzZnekh6SmgwSkVTKyswU0x5c2dUbmF0QlMwM016WklHYS9MQ3B5?=
 =?utf-8?B?dGlLNDdnZ2w4akd6VXNwWXovOUhYZTFia2FaWWVHdnVIUnBqR0o2SURwU1cw?=
 =?utf-8?B?MUpMdzJ5Nm50Qi9IcWV3Ym81REs1eDN2ZVdhVDY2clcya1RWc3lHZkxqRm5K?=
 =?utf-8?B?YzM4enJGTWpyQVo1Tkd1OER2Q0w2dUgrbHNZVzFaTkxKWVhoLzZaT0l2Ujlp?=
 =?utf-8?B?ZmVBVllMZFhNVStZQ0xkeHI3ZkV0M3hhaFJnSXZ2dWJrTnRMTHYyakxhcUhr?=
 =?utf-8?B?VnFON3YyL01ReG01bk5RejFnanhjdjV5OGZiS3k1bVIvNERTQ01zblV1UHVN?=
 =?utf-8?B?dHR6L2dFZTNUZTdtUnhVMnBwSUxzZGRrWk5VRjlKZU9RQVFqZzh2SzNpa01q?=
 =?utf-8?B?NHBOUTZ3SGtoaXFSbHMyYjEyeHZDbDFWekZMbWs0Y0M2QnF1V3o1akJUTllu?=
 =?utf-8?B?TFhacSt1ZWhndFBYREUySzFCaFRxNG9lb2RJSFIwVHUzMWlXMVE5MnhJZk5G?=
 =?utf-8?B?emNxOXdGWjR0UzhuK3RWUFNWVHV6R3VQYitjT3ZMb1dCd3pPMTBMSi9wS3p3?=
 =?utf-8?B?c1YyVC9LZzhaakNzNG1pakFwbDNCSHlwUEZnZ1BjUEZkWE5Wak1xZG5vcjRY?=
 =?utf-8?B?M2JXQXRlQUw4S2xtbWhRQ2ZOaGFiWlUvNmN2ZWd1bzQ5cUZSa0g4N0FsWVpr?=
 =?utf-8?B?Sk9NY3FNNjF0dkZ1ZGxwK05yaU8zeDZaeTZjYWN5cWxGaE9tMHJLckUzSzBo?=
 =?utf-8?B?aTRQZXI1ejRvVXlzTkxqSzJtQkFTSzAvc25CYlI2V2tRMHFFSGxpL0xZZGFl?=
 =?utf-8?B?SWtzaGIweEIyZFE1cEV2VThnVkRjeCtSeFhEaTlTTHdZZWZHOEgyZ05QNFk5?=
 =?utf-8?B?TE56bVRvakszZk1vYitQTE9Sb0FOMVZwcG54TnI0OHlOQURtS2FnNC9EckU4?=
 =?utf-8?B?OGo3cWZWcWtlYXZaSkFXT3pMbDNyc2JoMEh3RFdicGE3bFloMWpMNXpKTkE2?=
 =?utf-8?B?L25leDZmVjkzc0l4YWIrcGh1cEhFOUVqQ3VPdnlXa3pKTCtQTW03MTlGYmhX?=
 =?utf-8?B?STFoS1Fvd25FZDQ2SzZkNllKNUhJalY0dlZDZ3pPOHlNU2xabVpJUUtEblpL?=
 =?utf-8?B?WHAvaTFtUE9VVEZRZElZYzkySHNGenJUL2lVaXFEeVhmcGFmSE1MODM2TENV?=
 =?utf-8?B?UlZDSlJrRDRmeENGL0tZQXRmMzExQWZBNVBVbmcwMzdoNzRNTUNDVktCRlJm?=
 =?utf-8?B?Mm5EVStRdTc2Zk5aK3JRb0NmRGtHNGRkZXFBdVd1eC9zNXgwQXc0Qk1lR2FV?=
 =?utf-8?B?MVZjanN4NFN3bTFHdU5XQm56MDJybjBBVkhabGhaTUhBUlBIY3RGVnNXR0VE?=
 =?utf-8?B?eDRBZUtXNDFaUHc1cEVsUmdaYmlWZVNxbXhNODlSY1FFK2grR0k5c0srR0Fm?=
 =?utf-8?B?L28rNnpVMllnbSsrNmxlajZ6blFYVW0wdG4vdGFZalRjckhzNnlTbnpKUTVT?=
 =?utf-8?B?TEZ3NjdCUVBwZHgrV2YzcmpKNjZ6ZHBJMG9WNmdnOWF2UTRpMCtIOUh2T0lw?=
 =?utf-8?B?enRLeEE4NGpkZFJSWTJnZTJmZWl6SWh2ZVRTMnFMTkdIMjhNNkptNHptOHl2?=
 =?utf-8?B?bWtxNzRoZ3RZVDhOVWhDK1dEY0xEZEp1Y1JsMjQvSTZyU3dsQzlHcWphQXBL?=
 =?utf-8?B?b3ZPNGdra2FtaFRlZFRKSUJKMWovemN2Sm9wS1FDd1drN0lVZ3FYbU9JSVlr?=
 =?utf-8?B?ZEl4RW96LzBjcFpVTDExN3lTMi81aTRVMjF0R3NBS1dFTGdNTFNHK0xRc1pY?=
 =?utf-8?B?c05JdGJWcWZ0ejRoRDBDemMrNWl5c3hPYTljbmlPZFJRTE9sUTJTdVQxOSsw?=
 =?utf-8?B?UlRDRkE2ZXRmcGNoR2NXeCtvZEJCU0NrVHg2Z1o2Z3dOcnJieW13UC9ueGNt?=
 =?utf-8?B?SEVNRUdhN3czYm9oVG1UbHZCVnpQWFdpeFlxeFNZdXhiRzlYcTd3YjdBL3h0?=
 =?utf-8?B?Ny9nUE9rOWhlTktsWi9lM2FPemtpREFTdXR2dGllTFdEa1FKcFpHY3BsV2Rl?=
 =?utf-8?Q?X8uZtBi69VaT1k2w5Frx8xDoy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af676e52-808b-4571-95c3-08db81e767c5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 08:18:28.4546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfnBWgsJM10ZQ+uzo+cg/kIaa2+ybJMZze4Nnfdi8IvGnOVqjvE/IVHk0j5ULJa09iJ5Wbl9dJ388ooH3u+JwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7620

On 10.07.2023 17:22, Jason Andryuk wrote:
> On Mon, Jul 10, 2023 at 9:13 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.07.2023 20:54, Jason Andryuk wrote:
>>> @@ -510,6 +510,22 @@ choice of `dom0-kernel` is deprecated and not supported by all Dom0 kernels.
>>>  * `<maxfreq>` and `<minfreq>` are integers which represent max and min processor frequencies
>>>    respectively.
>>>  * `verbose` option can be included as a string or also as `verbose=<integer>`
>>> +  for `xen`.  It is a boolean for `hwp`.
>>> +* `hwp` selects Hardware-Controlled Performance States (HWP) on supported Intel
>>> +  hardware.  HWP is a Skylake+ feature which provides better CPU power
>>> +  management.  The default is disabled.  If `hwp` is selected, but hardware
>>> +  support is not available, Xen will fallback to cpufreq=xen.
>>> +* `<hdc>` is a boolean to enable Hardware Duty Cycling (HDC).  HDC enables the
>>> +  processor to autonomously force physical package components into idle state.
>>> +  The default is enabled, but the option only applies when `hwp` is enabled.
>>> +
>>> +There is also support for `;`-separated fallback options:
>>> +`cpufreq=hwp,verbose;xen`.  This first tries `hwp` and falls back to `xen`
>>> +if unavailable.
>>
>> In the given example, does "verbose" also apply to the fallback case? If so,
>> perhaps better "cpufreq=hwp;xen,verbose", to eliminate that ambiguity?
> 
> Yes, "verbose" is applied to both.  I can make the change.  I
> mentioned it in the commit message, but I'll mention it here as well.

FTAOD my earlier comment implied that the spelling form you use above
should not even be accepted when parsing. I.e. it was not just about
the doc aspect.

>>> +            {
>>> +                switch ( cpufreq_xen_opts[i] )
>>> +                {
>>> +                case CPUFREQ_xen:
>>> +                    ret = cpufreq_register_driver(&acpi_cpufreq_driver);
>>> +                    break;
>>> +                case CPUFREQ_hwp:
>>> +                    ret = hwp_register_driver();
>>> +                    break;
>>> +                }
>>> +
>>> +                if ( ret == 0 )
>>> +                    break;
>>> +            }
>>>              break;
>>
>> In this model any kind of failure results in the fallback to be tried
>> (and the fallback's error to be returned to the caller rather than
>> the primary one). This may or may not be what we actually want;
>> personally I would have expected
>>
>>                 if ( ret != -ENODEV )
>>                     break;
>>
>> or some such instead.
> 
> I guess this comes back to our fruit preferences. :)

Does it? It's not just a style question here, but one of when / whether
to use the fallback.

> I can switch it around like that, and make hwp_register_driver()
> return -ENODEV for hwp_available() returning false.

Thanks.

>>> +int __init hwp_cmdline_parse(const char *s, const char *e)
>>> +{
>>> +    do
>>> +    {
>>> +        const char *end = strpbrk(s, ",;");
>>> +
>>> +        if ( s && !hwp_handle_option(s, end) )
>>
>> This check of s not being NULL comes too late, as strpbrk() would have
>> de-referenced it already. Considering ...
>>
>>> +        {
>>> +            printk(XENLOG_WARNING "cpufreq/hwp: option '%s' not recognized\n",
>>> +                   s);
>>> +
>>> +            return -1;
>>> +        }
>>> +
>>> +        s = end ? ++end : end;
>>> +    } while ( s && s < e );
>>
>> ... this it probably wants to move even ahead of the loop.
> 
> I'll switch from do/while to just while and then the NULL check will
> be covered.  In practice, this function is never called with s ==
> NULL.

In which case - why not leave things largely as they are, simply dropping
the odd check of s?

>>> +    if ( data->curr_req.raw == -1 )
>>> +    {
>>> +        hwp_err(cpu, "Could not initialize HWP properly\n");
>>> +        per_cpu(hwp_drv_data, cpu) = NULL;
>>> +        xfree(data);
>>> +        return -ENODEV;
>>> +    }
>>> +
>>> +    data->minimum = data->curr_req.min_perf;
>>> +    data->maximum = data->curr_req.max_perf;
>>> +    data->desired = data->curr_req.desired;
>>> +    data->energy_perf = data->curr_req.energy_perf;
>>> +    data->activity_window = data->curr_req.activity_window;
>>> +
>>> +    if ( cpu == 0 )
>>> +        hwp_verbose("CPU%u: HWP_CAPABILITIES: %016lx\n", cpu, data->hwp_caps);
>>
>> While I'm fine with this (perhaps apart from you using "cpu == 0",
>> which is an idiom we're trying to get rid of), ...
> 
> Oh, I didn't know that.  What is the preferred way to identify the
> BSP?

Sometimes we pass a separate boolean to functions, in other cases we
check whether a struct cpuinfo_x86 * equals &boot_cpu_info. The
latter clearly can't be used here, and the former doesn't look to be
a good fit either. However, ...

>  This doesn't necessarily run on the BSP, so "cpu"/"policy->cpu"
> is all we have to make a determination.

... isn't it, conversely, the case that the function only ever runs
on "cpu" when it is the BSP? In which case "cpu == smp_processor_id()"
ought to do the trick.

Jan

