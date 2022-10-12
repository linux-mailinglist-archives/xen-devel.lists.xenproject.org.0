Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D5A5FC0C8
	for <lists+xen-devel@lfdr.de>; Wed, 12 Oct 2022 08:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420752.665749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVOh-0005OT-7S; Wed, 12 Oct 2022 06:39:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420752.665749; Wed, 12 Oct 2022 06:39:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiVOh-0005MR-4U; Wed, 12 Oct 2022 06:39:19 +0000
Received: by outflank-mailman (input) for mailman id 420752;
 Wed, 12 Oct 2022 06:39:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zIvO=2N=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oiVOg-0005ME-BB
 for xen-devel@lists.xenproject.org; Wed, 12 Oct 2022 06:39:18 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20057.outbound.protection.outlook.com [40.107.2.57])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97dcb299-49f8-11ed-8fd0-01056ac49cbb;
 Wed, 12 Oct 2022 08:39:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7142.eurprd04.prod.outlook.com (2603:10a6:20b:113::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 06:39:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.034; Wed, 12 Oct 2022
 06:39:14 +0000
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
X-Inumbo-ID: 97dcb299-49f8-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHmzNYFAg1TK06fK2D6m8O6lfP0qfG+yjoAX6X59ONW3uR6JiStQLpqVC39YMr5ILCc3A3ImvjLB2tSSWznM9WhanagFkZk/phdcKDeNzRFWmT58x/YNRTXCn0iatYPI24B70wxr/QHJvJzCZkF41Q+Tc6Bjq6MTMLLm0bXZoh4F+vXBJUAZjbF5D4bej2OfEgxzYICoSX0CIHX1nwK2Kyu5o69CnktmMEo34AOF448iuv7MxqooG831/7fl2wUsMHwnBKNDfev5UOIW4GTRdjUhWhyvKLD7h8f6yqTFEVepOFNn/3LcYiyLD1d0cKet2H4CCzwTfaj5qREpMIU7uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiR3lOtyI7kl4wiASiFNsVg7dyJSUlAYC9iNTt2HI+I=;
 b=oGdaGMyTouQ7Lq9oOZIJVlr9rMlK6hVnfFWkuMFrFCeyjsYP0I6wso2+He7ihjyuSN6uruFzJa2FNAb2sYKEEYZyYHhvi4i7ljQq0wqy5f0yKinzy3/CPxIF3W/wBWFxiz1lmqhoHrY0fGV+QiZ/J8X8KRIifPjCUEJRqwhPWAKd4qXc4IVGFJG8AgfRcxB9iPxSJu0ZgmqGVctGb1IJHDJJRQfuMz5sZ2zdfh+MPyYIGHDy7OYM/gr7XNhPZ1dFpvlH/BZnSxzH/NuG7ieFxNfxIpchBDJRn9l8T2HATVEcAFfOSmZfYMb4aatTf5YoJe6EIuX7yYZwEuYTccDcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiR3lOtyI7kl4wiASiFNsVg7dyJSUlAYC9iNTt2HI+I=;
 b=fmCJJZhoHbt4gSh27U28I71Mi++mqPgLh1HBOWjqPxGSzZ6iNztogwJElQTVQrU7Dit+zLQoCUOv3ivxE5U4kQUtlT91urquVk743LvjJRJGmJcV9DQV1xtlp+2Sx/X14FBrmbYV8gHnNo3SGbmHgslEl0qFg/6w6SxDcSx7z6T3xevLaGCGJrsvuppT870FqqFUpzmK9rYgI5spbHe6NNEW+Z7xdrV++FsK4uWT4bThCjupsMfnS8VDegb9yPItFRexwrDwHlryNV7vrUrNNKsEonQ4uSLt4P5gyKZBa0S+2aOz3865f1fX/ZzOlddgQalGzYOLi2cwoxPup2Js9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b8e0d396-119a-9cfd-d758-b3f26cd1849e@suse.com>
Date: Wed, 12 Oct 2022 08:39:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [xen-4.15-testing test] 173498: regressions - FAIL
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 Henry Wang <Henry.Wang@arm.com>
References: <osstest-173498-mainreport@xen.org>
 <AS8PR08MB79914E7F4F60378327C271D692229@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <9d048659-aad7-7c86-9f41-94489d9d90f0@suse.com>
 <233ccf7b-43ae-d563-3d3a-0dac4bed61c3@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <233ccf7b-43ae-d563-3d3a-0dac4bed61c3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0701CA0058.eurprd07.prod.outlook.com
 (2603:10a6:203:2::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 6142f0b7-9d3b-4c4a-2cf2-08daac1c7a65
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MEUGNflARdsGENqXIrhZcQjRWa2cNl10zAj6OO+hQVa3vJg3cF5DzRo+K+c5kmIYffY3rsaWtFm3vFIwivyo3M7Ke79H7TWLCdHUKLAzoTjN3eAuMak3RJqqEXIV6yYOiKHjXR138h06ziAfUQjRr+9HRNkgIDAGo2Y6UftwndKWVVX2HdhdnYFi9s6lWsEYFxyUFBi7rzZRE+wa9YxsifX/W/uEhL7kJAA1h7U4PC8rCLxfp8QzjV8D1FiAaW9w5REwnhcqBe7KexILsNwI3J8HFlER5n1WIOIci0AFuUX+WbaP6csO9+gxehJA5O6aa2eFRbhwJnr64FNcU6gkSJY9arSPIjjlBMfC+DgDzjgzK7F8GGFwr+PEq79nJKY0xRMJaZV4YV1/2gZLiuzRo7wklVb3KOGLGrDULUqNckSFqaoQHs28fCX29eMQl3RAAq3nt+xrm+/8KJ1D1MbFJ7LtpjQTf2dY2/zaEcLKbOfJsHbwpAwwIqvcuW2JTOgH3N+AlBuCcQcak9BDRlqAA1Cjn9Qt3qq48eFXXxIPLa/mF7S5lmlx05bbrT+NqvOlcRqYMz/iicX0XPq843GvMkr/uQSFyjHcrDmuq/xqFZcED0wOX2zDRaO9vHjD/HlWdUD7sDrSRVHpNpKWfOEQNpuZbmDTjhaNMLnz6JOYjpxIHInQgQSLn9bWr2lhsfNswWy6vs408dcqoVXWRDblusrWoDKqcB5C77OIT+Th53H/Kz/rpa7N24i2B8YKO/hhfLUL8UJXjxm3FqRctFGY0DwJ0Xh123jkWN7FU5YdsLfuEtXaE9+hDxMxLDP9ExWZp788JPSjH3EgvvFgouYRxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39850400004)(376002)(366004)(346002)(396003)(451199015)(31686004)(36756003)(31696002)(86362001)(5660300002)(38100700002)(186003)(2616005)(83380400001)(8676002)(53546011)(316002)(6506007)(6666004)(6486002)(966005)(6512007)(478600001)(2906002)(37006003)(54906003)(6636002)(66946007)(66556008)(66476007)(8936002)(41300700001)(4326008)(6862004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVQ2dzVVUVZpNUh2dXE2REJnN2g4MUsyblV3R3IrbjlzR0hvUmg2VHpUTUEr?=
 =?utf-8?B?VFNvQTlGWGtoL3lFbG9jM0xFVHkzczJFVjJTeXFINnlTQjU4d1pnUDAyUE8w?=
 =?utf-8?B?YUZ2T3NOTEI0L1JUUUpTYVBYNWZUK3llS0tGZW8zcGFUL204MXlLNTVKWVI2?=
 =?utf-8?B?ZjZRVXNqOXgzaFBDcmRteW5aYVJKMXNvRXQzcmc0a1RYejhnQjA5ZUpteTIz?=
 =?utf-8?B?dEc2cklySHBvTGNNRC9wYi9rZDExMXhoN1RaZ3VMQ2FybEJ2T1RpSktzcks3?=
 =?utf-8?B?dGVQUjVpdlVTbkQwS2xlWXROTTNqQk01SVl3MElkdkdDK08rMUZjeFRndjlC?=
 =?utf-8?B?YmRXdnBBazNjekQxT0Q4d2hNKzM5Q1NBSTVsN3JGL2lRZ0QxQ2NwSW1kSEV6?=
 =?utf-8?B?VUNtTDhraldIYTJTM0NTL1QvMVRKdmUvQmxsYXIxRWFxSEl2YUZmeEdTQytu?=
 =?utf-8?B?RWsvNS9qdG9aN01JVkJhMHd2RjloUDQ0NTBXRUp0QTNMU2ZjWDZyMlB4b3Yr?=
 =?utf-8?B?RW93TjN3VmM0MHhiSEtFMFBQNm5PZFpLZysyZlYrVURmcHJhWGNyWVRBWGk0?=
 =?utf-8?B?dENZb0kyS3psY1ZJQUthUlo1SUZyUGhQaC9UQUFqMnF0YVdESys5TkgxODNB?=
 =?utf-8?B?TXQzYnJ6czJsZ3VSR082QnhDYjdneXM3UjV1K08yK3hoK1dsMkZBNDFNa091?=
 =?utf-8?B?MFJNRXFVVEVPYzhuM0pSSjZOcmdiTk14WTZ6aXZLck12Z0o3OFU5SWFncUJB?=
 =?utf-8?B?MkFjblRDU1VmOElhRnhOdUExOEN5OG8xSTQreWkrT3hVRm9GRkQzNWk4azRI?=
 =?utf-8?B?VDZxNjhkTUFpNEFpS3A0c1M5T0ZzSlJaeVdyUFBIWDE0TE1jeVR0SHc4bFdD?=
 =?utf-8?B?akFnenFkWktvaE1BQTlONzBTc2xscFJHcXQ3a2lxMDJGbGlWNzVQZzlMRjNG?=
 =?utf-8?B?TDZ6OGdhSmhHTDIweDZQRDlkSUVhTm13elNJRFFWVlJld2xTOFVzUW4zZ2Vv?=
 =?utf-8?B?eVpOU2lOSkJGRHNUUnZoK3FTcVYxNW9QbUJ6VjRNNHNVMldoVjFoeXNha2lC?=
 =?utf-8?B?VncyMmVqMGo3RGlQdDhmVUhqZ1BNenZZbkNQWXU0Rlg1QjV4V01XcmVXMDlS?=
 =?utf-8?B?NDFqWnhiN2RYaTM2b25ROWNybGhEeFJUeW9yTC9xdnA5dmhobVhaQnRxNHRm?=
 =?utf-8?B?TXBDTnlyZUR6V2xxQ05mTy92WXFBUFlQQWhjck1vclEzL28vVjRPbGRtNGMz?=
 =?utf-8?B?Z21ROXdnN3Q5T3hsY1ZnK25WNEpLZDF0WHgzSzlYMXVtVjVwQ0xoZzEvcHVO?=
 =?utf-8?B?NE1ZVjV2bUd3WDhYTUtUUDF6U2NWUWtuZlNoZzJtMnlYdkp5cWlBMktsbDdU?=
 =?utf-8?B?NGZndUJ6ZTc5ZmpIdmVGd1RtbEZaSDZtNlZHMzczcXRWMFU2emlUTm0ycEVU?=
 =?utf-8?B?WnJBZkovVmZGRGVKMmx5dWJmUVZoUXZ3R3k3K2VkOUZlSWxna1I1cEpmR0pU?=
 =?utf-8?B?RUJ3eUJOazl2VS95QzVpekRzQmsrK3lVN3lkNmMyR1BPVkpJRVpvUzdNWlpX?=
 =?utf-8?B?VWw5enhlOEZEWnZHOW1aMEEwcTlFY2txaW11Y1RUYm5pOW9uTlljRWxUQnds?=
 =?utf-8?B?QVFLaEs4djd2UVdoSWRVWTYzWUdvc20wYXZVRE16NkJsTzNjREZSRmVJU3N3?=
 =?utf-8?B?dzFTNld6alhNWWlHbklrWVF6dGFFQ1pMUEZKRzZLdGhQKzdRL2EvYVZHbEpo?=
 =?utf-8?B?dG1UVWxma1phNUx0OWVpeHV0VjJCTFB6eGRjOUowbkdabXRxTEE5VjM2SWFE?=
 =?utf-8?B?eE9wNGVoaVBRTldCanZBcVRGalJMYms5dHZSS1AyVUZjV3FhTy9FdExsVjcw?=
 =?utf-8?B?NWx0aUMyWnZOUENzZk5iSFhQYWJ6SlUxZnB0eDdpVTdIMjFSRkJFWDRPQW1y?=
 =?utf-8?B?VTVqZkZIMlcwNjBuOEhlOFdscDJyb0NHcUo4RXdZNjNGSStoVU41NUswVm1s?=
 =?utf-8?B?UllzNzNJTE9SRmRrMkRValNQQUo4dFlJYnI4REFxcXlqRExrN3Z2NEpiR0hU?=
 =?utf-8?B?djMxZWFMQko4aEdyMVVEN2p5SEEyNGlNUXJDbVFzMy93NU1WNEJFeWhoRzJq?=
 =?utf-8?B?TzdWS1N5WHZHNUJzRFppaUQ1MGZjQXEvZTYzYkVTNEN5Zm9KU21QekhkdTFo?=
 =?utf-8?Q?d67YuFITa/HTnEUP2YuvfEPRwEYzi6hNpOvAyGOqESPv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6142f0b7-9d3b-4c4a-2cf2-08daac1c7a65
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 06:39:13.9952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SQdgrL0WvbSboQ9i+NvvJc3+ZD6wHzhs66tDTQ87Eqy4Iqna5eHQMX0YAdyzx1WbArjatrt7rW9SJS4eGXjbFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7142

On 12.10.2022 08:34, Juergen Gross wrote:
> On 12.10.22 08:28, Jan Beulich wrote:
>> On 12.10.2022 04:42, Henry Wang wrote:
>>>> -----Original Message-----
>>>> Subject: [xen-4.15-testing test] 173498: regressions - FAIL
>>>>
>>>> flight 173498 xen-4.15-testing real [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/173498/
>>>>
>>>> Regressions :-(
>>>
>>> I think these regressions are from the backporting happened yesterday,
>>> see below...
>>>
>>>>
>>>> Tests which did not succeed and are blocking,
>>>> including tests which could not be run:
>>>>   build-arm64                   6 xen-build                fail REGR. vs. 172547
>>>>   build-arm64-xsm               6 xen-build                fail REGR. vs. 172547
>>>>   build-amd64                   6 xen-build                fail REGR. vs. 172547
>>>>   build-armhf                   6 xen-build                fail REGR. vs. 172547
>>>
>>> ...The arm/arm64 regression is from the backporting of commit:
>>> xen/arm, libxl: Implement XEN_DOMCTL_shadow_op for Arm
>>>
>>> The issue is:
>>> In 4.16, commit
>>> 2107cc76db3a libxc: split xc_logdirty_control() from xc_shadow_control()
>>> changes the prototype of xc_shadow_control(), and hence the calling of
>>> xc_shadow_control() in 4.13, 4.14 and 4.15 does not match the calling of
>>> xc_shadow_control() in 4.16 and after.
>>
>> So did I commit a wrong patch, or were the patches for the older branches
>> wrong already in xsa.git?
>>
>>>>   build-i386                    6 xen-build                fail REGR. vs. 172547
>>>>   build-i386-xsm                6 xen-build                fail REGR. vs. 172547
>>>>   build-amd64-xsm               6 xen-build                fail REGR. vs. 172547
>>>
>>> I think the x86 regression is from the backporting of commit:
>>> xen/gnttab: fix gnttab_acquire_resource()
>>>
>>> As the error message is:
>>> make[5]: Entering directory '/home/osstest/build.173498.build-amd64/xen/tools/tests/resource'
>>> test-resource.c: In function 'test_gnttab':
>>> test-resource.c:74:19: error: 'gnttab' undeclared (first use in this function)
>>>           (void **)&gnttab, PROT_READ | PROT_WRITE, 0);
>>>                     ^~~~~~
>>
>> Hmm, I'm pretty sure I did a local build test of tools/ with this in place.
>> I'm not in the office today, so I won't be able to do anything about it
>> right away.
> 
> Maybe you didn't build tools/tests?

I'd need to check, but yes, that's the suspicion.

> I can send a fix.

That would be great, thanks.

Jan

