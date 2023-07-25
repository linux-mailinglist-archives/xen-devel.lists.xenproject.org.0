Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A24761BE2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 16:37:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569738.890747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJAU-0006E3-RB; Tue, 25 Jul 2023 14:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569738.890747; Tue, 25 Jul 2023 14:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOJAU-0006BL-OL; Tue, 25 Jul 2023 14:37:42 +0000
Received: by outflank-mailman (input) for mailman id 569738;
 Tue, 25 Jul 2023 14:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nivo=DL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOJAT-0006BF-Ve
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 14:37:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20615.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cef58edd-2af8-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 16:37:41 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7293.eurprd04.prod.outlook.com (2603:10a6:800:1a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 14:37:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 14:37:37 +0000
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
X-Inumbo-ID: cef58edd-2af8-11ee-b23f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F2bP0Fjt/8fOdptKzADti/3jypXtci+A2YMjK3r6e+x7hBjxH0NQ9U55PbVtinqKcxQFuhr9mGbib7rjsum0KnM1CJ6HlpjU0zA56XwiMczEofujtuTsjumzro3MVaaLYqwagNvEo0Gyvmmmd2iK5P11GfqIg6fHA+VmV3SgFoZ+oY3sPc10c6+WXKjJKwsR+poe2Mt9ZP9bzTvyuVrh7tRd7KOXJygdF5Tok4cqiVVgZA7cu3y6GmYzGNtDucLZ6WCHJPx9RpZ/ziJxw6qcW8zPv9XuAHd+qXbKFYMr6eBSxqWkFXk2t7uavtwfpPUW9qAm3sBPrgiYSKDpP9pONw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e0H5zcfSPg6NMySGaHQY8YOf1VikXtEJGncfYPRtJN4=;
 b=c3jkQNOkl7nKzuME7jQ30mK+NeQPjZHRTjOS6LwBK7TUrunrEy0c5skrSXfkVUWzq2RgCg760t9CmkuSggNa0OV3EMcyOhMd+7qHixaY6kVOhiM2jczEXt2LjKwQ5ZbyaIx657ZLENGYvnsjbLh6Mvrx2POL4tO3XvQ8486VLCjPSkZryr0dR1v8dnhpsMnJl/NLk6ewcnO3xVtyBApFcQP+FnqpOYl6eezZXsRYMTwGsteErstBxnUp7kKsUmxBex4MGcy0tPc62hfdVWI4bm/UJ+6xlpQW3viId1Ske7d7GIZsC3ZiLoBJm4CfeGn9cIIDhnSaZ1ftVNvG5gNxWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e0H5zcfSPg6NMySGaHQY8YOf1VikXtEJGncfYPRtJN4=;
 b=yLrsXNFzA0xSdTsAXnnriG9WPV2sf5F7GYffHaxivsORyML3wlR4hKTTPV20NbO0l3qhu/1f//mxTc28TDo7ppaHoD2KZk6+PCPfll8dAP6ayfGsju8aBMSjicDJQ9M3K+M747cQG7xZekdIBixyb2Uu7mQsbBbpSxQegenceGvkocBaPZvdFcsg+EAqJSgOGoHBQln9l+62qxKiI3Fb/PFV2R6gTPKVF9fsj8LkHz5CKJ47gBbjUzXsDwwaGUl8C/aqxpaSxGHk9rdu3LGb1ggRyoG1PGwDfjEyNkrCxo8Hz5vKoDInr1uWysak8ITFCr98g7bQ9S0KWp6EDYf0/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3f43f36d-b661-ea65-e8de-d1c4fba34509@suse.com>
Date: Tue, 25 Jul 2023 16:37:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v6 06/15] cpufreq: Add Hardware P-State (HWP) driver
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230724125857.11133-1-jandryuk@gmail.com>
 <20230724125857.11133-7-jandryuk@gmail.com>
 <7636d3d2-c78d-711a-ed90-aedd1b464c6c@suse.com>
 <CAKf6xpt1LzKMv7E-G3sTpUWrEApy+BX8z7dG69oS1upHcpytMg@mail.gmail.com>
 <d3d8123e-2b81-d3e0-3883-83dcdaf99700@suse.com>
 <CAKf6xpsE_=XYWcC8Q6NhKkboMajnOKZAsfUpOROeGuhU+7CTdw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpsE_=XYWcC8Q6NhKkboMajnOKZAsfUpOROeGuhU+7CTdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e2f3685-1d83-4453-7bde-08db8d1cb14b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F64SLqIwpZpA6D3FdInWOkh+4gGGiyseAIFnZkCH1Av+VjQlALIvCP3bAFEz4NilBLX2Il/xptsasEKl/+6tiifHho4aydbgDAPd0lUsJ5maw0md+AqYMSoCD/1cNwQEQGuCB/wK5bHwtYVImerX//8XAN6JsIeukcedtAh6H89f/E3zceFIHZn31ANxPXKw23Osilrp/tfdqII92+z12AhS3VrzJcMNcS1KJl5wrOWXXcR3Ilf3hXSy/sYzNu2aZ7J0cZas2HkB8UfRClI/NwvioDhfQcZ304asRHmw/OLcc0zVS43AG5joM3s7aSScQRqE3U9qgqQI21/L19aEDpEirRFMPlFrptgJR4tVG0A+pP6JHJzJc6IAlhpIdQw1ct1yO3Yge4Rlz431sPJWzo02mg9rWLCi0IAM3/RKVoqAAG6xXZIRWPKc/2pUqDYe7khQY0esEVkI4l3kgxHVb/WGbySG86L1dLZ6WThsagl9mB2jjmVH940x+lq8O1pw6wPjf9xPbAhTh7PrsXRX3Xifd95Haqjt1VuwKot/bnJpsMSDFCo1G5xLYIxk0+m/nPtHU86OBrbPZoYhPWT3TRLNpJQ/85R94NJUGheI04mKJoKClgS+T237NEhM3XGO1IMghJqrFwlGS1Dv59O66A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(54906003)(66946007)(66556008)(66476007)(6486002)(2616005)(36756003)(83380400001)(86362001)(31696002)(38100700002)(966005)(6512007)(53546011)(26005)(186003)(478600001)(6506007)(31686004)(316002)(41300700001)(5660300002)(66899021)(2906002)(4326008)(6916009)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGV5bW1BR1EyREFWUXQwdkRyanRNYkYyZDhzNnpqV1B0dEhpTDRldDd3MkQ5?=
 =?utf-8?B?dUk3YmhSUVg2UGFhWjhLRVYxdzRibzVyMTh4bmtiVHpIbDZETE1sKzlaek5L?=
 =?utf-8?B?ZnliN1U1aFNQZ0h4dGw3RzFUOUNYNU1rRDdZM2RlTXptUVU1aFYrcEplVE44?=
 =?utf-8?B?Q2cyMVNsTU4zYlZTcDdjTUZzSGFrSVBSeEsveVFBa0Y2T0I4b3IrTHlEdDdM?=
 =?utf-8?B?R0NQT2hzODJ3L0ZVd1ROMDFZMmtaT3ZlbndlK1h6MGN0T3VhbURjQXhmTzlT?=
 =?utf-8?B?Q2lrcjlQUkdqM1ZLdVc3bmh6dCs1SnkwWTBTaElUcTVzZ292WUNRTkwwbHB1?=
 =?utf-8?B?WGdJVXVvVkdiVVNRbitPc0NsSjNhY2laVlR0K2JIallTa1hxZDhGWEVaY3Ft?=
 =?utf-8?B?VnZjNEVIVTREd0tSUHJQMW5pRlVNTTFIWmNWamZxQVp6NGtkOUpuR3RDL3ZS?=
 =?utf-8?B?UVcvUlI4UUF2Q0NWdGdBR1RKelZldDJpSmFrVStVdTBpcEdvQnVINktwY3A1?=
 =?utf-8?B?Mmd5dmtOZkJRdWhuWlRoSTBVWjYzazNCR3AvN1NwbnczUmpCbWxoRE5NNUxl?=
 =?utf-8?B?VEpBQnhUc3JpMFVMMytZaWRVSHdmcVZTZjFHT29Pb2luZnIwN2VUTWN6TUk3?=
 =?utf-8?B?YjVFakxPRmhGOTdPUTk3aWJ1TFkzN20wUm8wcS9BbC9IQnIxcjcyMG5MUEVS?=
 =?utf-8?B?U3JsTE53OCt3VHFBVFFvR0R3bnRLYWM3VWxSaGZsUENxRStYdnBhb2NOVUND?=
 =?utf-8?B?cDlEM2ZGQSs1VUtpeGVCOHEyVHZiVlpUSStzSS9KMXlkcUlKMWdFb1JrZDc3?=
 =?utf-8?B?QWorTHlFcUd3MDE1NHIvZDB6SjhWTzlhL05CVk5qMDFLbW1nQnZkM1UyUGlE?=
 =?utf-8?B?eXZOZ1M0VWJSY2FQY0prRmltR1JsL09aTC9TRDMvYy9PdEdwK1RycFlzbUFo?=
 =?utf-8?B?akMzeHhLaW9jODhpSFVhYXZmemJBb3dtUVlDRmE5eFRkT1JNU0t0VmFhYzZI?=
 =?utf-8?B?dnFDajhiV0dpYzgyRVFBS3Zoazk0VnlaaXloR3JRVGJ0am0xb1gzVms4T2xx?=
 =?utf-8?B?YzF4bEFLMjJNcmhPOGM0eWJTWG1PWlNDNklLajdmRjhZNit2cXd2VUFsbHpu?=
 =?utf-8?B?WUtVV3dKZ2VXN0FxcUo0aVBNb3BZbmR6eThEM3cvTEdaZGtqSS9HRVh4UW5x?=
 =?utf-8?B?akNzTGlrY0R6MFF2a3lzNFBPSE9XZ29ieWpCTWY3WVoyOUs3ZlU3aWFvY3Nh?=
 =?utf-8?B?NmhmVVc2bTNEeXhvRkRBbkhuVE1pOHNnMHhrRFpnclFmU1U3eUhFT01OMFph?=
 =?utf-8?B?WTV4NC9KcGw5MGd2N0VWVkt3bGpTUllBYndWbVEweUh1QzhFYmZ2QlJncjVa?=
 =?utf-8?B?S0Q5elgvTnFtY1ZhU2E4dWJLU0lhWUpXSlZRbEhIejhBaDZnS1Z0SVFmeExJ?=
 =?utf-8?B?R2VMWW5meGFuYnc5dExKVXRUcXBhQUdnQWsyS1RacWx5NjBVNVQ5Z01FT0dz?=
 =?utf-8?B?RmtveDI4OFFtVmZmVXlzcGdvVDdFUFplMXpJSHNvdVQwdHNRbGcxR0JXcnJO?=
 =?utf-8?B?S0pGMTBnUUlqc1E1OGV4YlpIRzVRV2hHOVJUUFBNS0lqVFV2WHk3bVVwR2ti?=
 =?utf-8?B?RGZNTkV1YlBLbGYySzJHZ3RDQ2lsTCtBU1QrM09RR2ttTWVOSDk4R2I0elE0?=
 =?utf-8?B?S0FOM1lKclZxWUFZV0lOUGo4YUNJSmc5VmlRd2xDem1mejdqcFZJd2tHU1ln?=
 =?utf-8?B?U2F0a3duWHF5dGRsN28ySHdSMzVvSERnaTZicHNtUzBGMFFsUENvNWRMc2Fp?=
 =?utf-8?B?UzQxM1ZJdjVLbU1HUUNYd1I5Qi96a1l5UFd1TEgvTmRxU3MzSEhweDhYZnM2?=
 =?utf-8?B?R29UVzNDeWdmdmRkZFpiL21zM0hNQ054T0xCV2Q3SmNkbVYrbU5Kby9iaHYr?=
 =?utf-8?B?NXBObWtDeUpoWXluZWE2RDNtYkVJREg4K1I0T0lUVitWZUpCV1U2ZVMyVU1F?=
 =?utf-8?B?NzhNSmpNb0daRjByQUdVYWorbHBJM3RBYVdVeFduT3ZOYUovS1FEWmgrWDMv?=
 =?utf-8?B?QU5vM1lZa29LZ1RlckxucG5ZN1luVFBKTVVrUG1JZHVvMVE0TXdBUkxpRTFJ?=
 =?utf-8?Q?VhgOfXTiLLz/8xGoNlOsPDy/Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2f3685-1d83-4453-7bde-08db8d1cb14b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 14:37:37.7829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CgK1362wY5wgnSe3gcajMlkKnf4zxnRZaNUwNmRhv6jKRnEOkXs6cn8V6d5D+snR/+OPUQtAWa5RtRIDlp+sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7293

On 25.07.2023 15:26, Jason Andryuk wrote:
> On Tue, Jul 25, 2023 at 2:27 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 24.07.2023 21:49, Jason Andryuk wrote:
>>> On Mon, Jul 24, 2023 at 12:15 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 24.07.2023 14:58, Jason Andryuk wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
>>>>> +#define hwp_err(cpu, fmt, ...) \
>>>>> +    printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, ##__VA_ARGS__)
>>>>> +#define hwp_info(fmt, ...)    printk(XENLOG_INFO "HWP: " fmt, ##__VA_ARGS__)
>>>>
>>>> I'm not convinced ", ##__VA_ARGS__" is a good construct to use. I notice
>>>> we have a few instances (mainly in code inherited from elsewhere), but I
>>>> think it ought to either be plain C99 style (without the ##) or purely
>>>> the gcc extension form (not using __VA_ARGS__).
>>>
>>> Using plain __VA_ARGS__ doesn't work for the cases without arguments:
>>> arch/x86/acpi/cpufreq/hwp.c:78:53: error: expected expression before ‘)’ token
>>>    78 |         printk(XENLOG_DEBUG "HWP: " fmt, __VA_ARGS__);  \
>>>       |                                                     ^
>>> arch/x86/acpi/cpufreq/hwp.c:201:9: note: in expansion of macro ‘hwp_verbose’
>>>   201 |         hwp_verbose("disabled: No energy/performance
>>> preference available");
>>>       |         ^~~~~~~~~~~
>>
>> Of course.
>>
>>> I can use "__VA_OPT__(,) __VA_ARGS__" though.
>>
>> __VA_OPT__ is yet newer than C99, so this is an option only if all
>> compilers we continue to support actually know of this.
> 
> Right, sorry.
> 
>> We have no
>> uses of it in the codebase so far, which suggests you might best go
>> with the longstanding gcc extension here.
> 
> FTAOD, "##__VA_ARGS__" is the longstanding extension?

No. But you've apparently found it ...

>  It's the only
> one I've been able to get to compile.  I'm reading
> https://gcc.gnu.org/onlinedocs/cpp/Variadic-Macros.html and it
> mentions a few different extensions.
> 
> This part seemed promising:
> """
> This has been fixed in C++20, and GNU CPP also has a pair of
> extensions which deal with this problem.
> 
> First, in GNU CPP, and in C++ beginning in C++20, you are allowed to
> leave the variable argument out entirely:
> 
> eprintf ("success!\n")
>      → fprintf(stderr, "success!\n", );
> """
> 
> However, it doesn't seem to actually work for me.  I still get an
> error like the one above for plain __VA_ARGS__.  That is for:
> 
>     #define hwp_err(cpu, fmt, args...) \
>         printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, args)

..., just that you're missing the ##:

    #define hwp_err(cpu, fmt, args...) \
        printk(XENLOG_ERR "HWP: CPU%u error: " fmt, cpu, ## args)

Jan

