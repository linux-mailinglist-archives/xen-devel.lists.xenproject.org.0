Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 732F065E691
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 09:15:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471686.731632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDLP4-0008Dv-6K; Thu, 05 Jan 2023 08:15:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471686.731632; Thu, 05 Jan 2023 08:15:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDLP4-0008Bu-2I; Thu, 05 Jan 2023 08:15:10 +0000
Received: by outflank-mailman (input) for mailman id 471686;
 Thu, 05 Jan 2023 08:15:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lIpW=5C=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pDLP2-0008Bo-0o
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 08:15:08 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2066.outbound.protection.outlook.com [40.107.247.66])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fdab74c-8cd1-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 09:15:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM8PR04MB8020.eurprd04.prod.outlook.com (2603:10a6:20b:244::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 08:15:04 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 08:15:04 +0000
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
X-Inumbo-ID: 0fdab74c-8cd1-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0Fk8ZV87V9TBQSrXBFa5Pihfxwot/6gD6VgL2hefcfA/ykN1oSWoRt/EEHbW58JlqpdjOAp+NP7zSEOltp+6c0ivNIvXqlMtTvur8TcBqwU57oNR4UztpILxmMg5DmVLRMMH0YmI/C2va7JxjWuOCf9DOb3UaPDmx5NiZJJmnZsQ7KRuIkMRbx7ZojwgG71NPEepcdBXoqyW7B74lLL9epwKTdYn5Mz4N5XzgKsVQNa83JfFVkbcr5rfzXPhk5HD1+hJ12NIilQF8A8JvJagvp2JV3XUqewQF3cz4nBRyWiOlbLSz2bQIx+Cykmquu8w0ikQybwFPIkWSFLj3KNZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYVrlbX8302WXqllVpFUD8somimCH2U2T6URi+6uf4s=;
 b=Juy10aC5QMK+ZSCdhuMRudsb4JpV8T2xaHYulUInMks9ZfX7RjwuUhPEvk4h7DfgyKDmnczuHkFHMtzGlTcXJjCh+eUhunEG/oyTDSATxkgAv0/WWZBTaqVD0VZlrYgjUZtXmCF7udczPpqhq+VGgf7Y1uryh3RQ0qED9ETrRLO6YYNHDZ/LBNNetNrcJcpu0A0/vTu+tMxWLviGUEcu8yOXy2qboShPzZGFhSfAIk8q3YJ/JuSSpwcJqRbD0kKXHbqm5MpdEjBVb46cjrkCXgxfQRxal0j3BUZM2adhxF+Ig1cPChk0xWUgIkt8ikChCmZTx6wUnJJ0q9UlPgBGyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zYVrlbX8302WXqllVpFUD8somimCH2U2T6URi+6uf4s=;
 b=rCT0kTdHZM+MwBQOr9BzqQWBes2miZQR8Io2g89wgbktQxTipm1sbrsOeWO01tUip1u+xtzrOZKZBPUVvi+9lku0w3FEEhIDrnqaj63sUl/FaeMJ3S5R+pZgGDMaRMNF/MMbSiupJ92yYqke6pjiorTXzU8UbqJVwgGVjdN4ZEhA97q0iY42zTj+NEn9/8HwbEHIjAR1V/SyVwJQ8eNFzidJP9qKwWOh4nowTKntkY9ZX6iJ6f2N/DLGO2gJNEH2CxLLT5+/AkkSSw0+YdOQyjcuogEgmiWgjyGjOFEMmIZsX9TTXVl4s+RSoyNgo6jCHTQ36HrI7R6nNe4YHNJETA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f90111d0-b94e-8127-3b13-fbe3558d53f7@suse.com>
Date: Thu, 5 Jan 2023 09:15:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/4] xen/version: Introduce non-truncating XENVER_* subops
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230103200943.5801-1-andrew.cooper3@citrix.com>
 <20230103200943.5801-5-andrew.cooper3@citrix.com>
 <a0cb9c83-dc4d-5f03-0f65-3756fadfde0b@suse.com>
 <9c9cedd5-cca7-95d4-00bb-f34a56de2695@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9c9cedd5-cca7-95d4-00bb-f34a56de2695@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM8PR04MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e40d968-ce7c-4b69-3737-08daeef4f2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dC+Z0LrCgx7J61M1ks1w+ze+cxyEs00MHcT0Lebwg01gRvmV5mhYhomwKndyQ6eQFkNmt4+Ujhewn5vX8Vl/b+9bbWopggEdSfYBJfDglQNbGN5nGXdvxnNr1QeHI9DmgL+khvx6dAGFUUnfnVwldwWhpK//N2RUvxIZH3AezUSGzH8KQBja6G+tjfGypqvF5smNkmU9KqYf48j4mUJ9u3163752WyxDgdIrxTyurwqi6lLpPLjCTxqw7TuasI8rdcMewAur7rBU+rPlz1ENrpWBjgZd4Qa7EOOp7Getdv4hR9qDxKqMQMhdrUn2+CD9U4KaApanlQ8UJ3pwMHLsb6/n6spdu3SbvVrh7iRrGABmMdWwqqrQg5vBpAns3ObbILK+VlXxUyDLUW6EuQvtEDcIsgHp81K0B50+xZnf7MbWi+pFXxdHYmC2r6OLbMofOHedE1qZv5EZ2YuC6VEFN+3lj6SR80t6pM84p4caTUe6fQ1Dc0Ujnttc/9sTC1Us2hJVSQasNojaUzc4jupLsVm5kR6PZ413iKlp6aHIoFdXADdVsChkZfwYCknknfYuxUaNcGSvCImZJpZxNVNB5VKDNoLjzPdM2Howm0ayuuWnbfBuYO8NNsMk3QW6GnZL4KzUJdQ/wxBIM6Dyz6YvWu2udVfwmYXTF0CYnuyjruk7OP9cKOjxPctdxjGFOC+wfLsMJGwz+zzl7IDFlGGoGaTpXIGWMxmpr0GtrIWlDlM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(396003)(136003)(376002)(366004)(451199015)(478600001)(38100700002)(36756003)(86362001)(31696002)(6916009)(54906003)(316002)(66899015)(31686004)(2906002)(6486002)(2616005)(6506007)(8936002)(186003)(26005)(8676002)(66476007)(4326008)(66556008)(66946007)(53546011)(41300700001)(5660300002)(83380400001)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S0xvVlY5b0p2R2tSb2tXbVUxTlczdENnMEpOaDFkb212WVd6NkZTL2lERURy?=
 =?utf-8?B?cG1oS25ySEVkU29VMUdSMlJyRzl3TlMwUVptOWd5OWtpdG5yeUppbWRoVEVO?=
 =?utf-8?B?T2V1c1djdHNTWXFSV1dkQkcxR1dzNmFSaGJvVzlyYllvVDRxd2g0ZFlZL2M3?=
 =?utf-8?B?OFM0bnFhMkhaRUZweGZDRUQ0OG5pN0dGc2xmUVZYV0dLS1loMFZTZHBVUU5E?=
 =?utf-8?B?Y0xkNENCZ0hUcDBIdkMxSktYYnBvWGV2TW40Sm5VVGQveXp4bFM5b250QzRv?=
 =?utf-8?B?UDZiYzZQcVUvOWxQdVZJRHZTU0VmRkx6ZDdWLzM0QTl5NTg3V1htQUI2U0JP?=
 =?utf-8?B?SnM2UFJSR0YzSUxKSVF5elRrWm04SURyRW95cHUrNURhaFlWc1RodUZkN1o5?=
 =?utf-8?B?ZnJOK1JhSUcwVXBNcEJyUDVhZzBPT2JOUHhtcVlETyt2aWtiNVpuY0lnVzdP?=
 =?utf-8?B?S25URjJ6ZHR4TzlBMHU1ZnIwVktiOVl6OE54aCtXMlo3YlovbldiMUFuZy9P?=
 =?utf-8?B?V0c4dUlBSVFBV0xKQjMwUnVTZVoxb3ZpVWpRMlVIWkNqM2hhZkQ2U3hzMnVi?=
 =?utf-8?B?SHVGTTRvKzZEWVJLRkpTNldBckZUeXBLVXd4YXlYVHRjRTFyN0JSU2I0dmRV?=
 =?utf-8?B?Zms4TVpRNkI4UW44NkZoMGk5aEhobjhHVCs5RE5qZGc0TUZ3Tyt1NGFlQW40?=
 =?utf-8?B?S3E4dCtzR1BrWjZWay9Yc3AzWnpmMFRobHcrOFZNbDJHNHBLZy9Ya1BOZ2Qr?=
 =?utf-8?B?eEYydFRXTzJ0QkVhZWoyQlAwazZPd2EvT1lPenJlSE1IazIzSkk0NU1kK2ps?=
 =?utf-8?B?WlNIZVpJQWhKTXNFVmU0QlFwSGhjVzR5TnFYVHdjcVpsNjd1ak9PQXFTRyt4?=
 =?utf-8?B?dGg1WlROQzhrQ1Z1YXJJUHpCQVBoNjJNTGlrQUpGY0xlTlFvYTdUTFNTMWVP?=
 =?utf-8?B?TUo0UW9kQXVuS1FKeVFBUDlYNWZZai9zMTVFOHhWbGJpVmNLK2RCMnpWeTE4?=
 =?utf-8?B?N2JBZUVrSXlYZE9YaTVQZ0c1SDV5eWpDU2JSd2MreGx4eElHTUMrQk0vblor?=
 =?utf-8?B?aGhjdzVrQnJvQ0pJanlscWFWWUo4d3BPVjc2azFaT2puRXVINVVhZDROQ2dD?=
 =?utf-8?B?dTEyLzNLY29DeDBzeXV0L3Mrc1dDZjlMMDdOdThEMXdmSytnNk5IK3B4UjRG?=
 =?utf-8?B?Mjl2aHcraG8wTFZRV0daVzBLbFBKNk1jQWhNNUFnS1IzVE5DR3N3R0hrd1Va?=
 =?utf-8?B?dDcyKzFuNjhrNzEzbEd4SU5mQzVIdm4yUEYyU3BwRWorUGQvRWZ0Q0tyL1pu?=
 =?utf-8?B?YWF6bDNqQVlnRlUreVdHaE5kM2N0UWVZUFplMFJGYzRQK0hxZHdzT3hvS0VL?=
 =?utf-8?B?N21pVjcvTzUrWjBPTmZIeTFwKzdaanJwTWI5SjQzK25VTTRVRUR2UWxGTEJ0?=
 =?utf-8?B?dW50Rm1ETmUzbGpMNHZ3UmgvTUh3TTdxTGJSUDJ6d3d5L0djbFFWdGJoQ01x?=
 =?utf-8?B?VENNNS9ubkxOSWVTWVRteXZ2c0VBZjBrZjJ0enE2anRUTWhuVkJ0bW8xTzlX?=
 =?utf-8?B?QlFHY2VLWS92d1ZQcGxGRm5rOUNyS2VwbzVoTThnZ1VtWU14VmwvaVk0Ukxl?=
 =?utf-8?B?YmJjVHFVK1RlTWdjN04zRklsYjBUak05RkdVcGpkL0U5aXlUbk5xeWJHZG8y?=
 =?utf-8?B?cEJ4RlFWSXJLTExnSEkxYktER0JyYWFERXVXZE5hQXExS3NhMlBiYVNZTDVp?=
 =?utf-8?B?eHJqR2oxV0tqTWZYN0lTWEgyYWRIeExSajI3bVR5VzJkb1ZhMWNGZmJsd0tK?=
 =?utf-8?B?ODNMZ21oZ3l2bG9URGRBR3I1RGdpSUd5dGxLdVlkZDA3ajczTW1BZkFUbXc1?=
 =?utf-8?B?RXFVZXBqZlBQbkJwRFczbFJmWVYyQ1hHb0dMenJMQnJ2YkY1OXQxOGtEK2ZT?=
 =?utf-8?B?YVJ0NEtJV2Nld2EwODJWRzM2UlpkckQ3U2R3K1JHU29ROWc5VXFjcmVmTjJ5?=
 =?utf-8?B?ZDBWWjQ3bWErTGVLekZmNUNaekNKVWFPUENtcU5GbW9oaDRtQ0k5cEhLZzZS?=
 =?utf-8?B?K244QlVEakRLM3c1MWQ5UDRBSG5BTERsN2VYVS9FcUlEV05mS25rY0F2ZXBF?=
 =?utf-8?Q?utvRic9M6LSZgIfeyDoU9JFJn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e40d968-ce7c-4b69-3737-08daeef4f2f3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 08:15:04.3209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q8Xm8LYaC64KMNZyCbVXr7MAe2LrUKftR+CQwhxwXLOkBDwFHD0ZCkIfqGhmAkT9rh0xk5P+BRu3qPpdLjq0dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8020

On 04.01.2023 19:34, Andrew Cooper wrote:
> On 04/01/2023 5:04 pm, Jan Beulich wrote:
>> On 03.01.2023 21:09, Andrew Cooper wrote:
>>> API/ABI wise, XENVER_build_id could be merged into xenver_varstring_op(), but
>>> the internal infrastructure is awkward.
>> I guess build-id also doesn't fit the rest because of not returning strings,
>> but indeed an array of bytes. You also couldn't use strlen() on the array.
> 
> The format is unspecified, but it is a base64 encoded ASCII string (not
> NUL terminated).

Where are you taking this base64 encoding from? I see the build ID being pure
binary data, which could easily have an embedded nul.

>>> +    if ( sz > INT32_MAX )
>>> +        return -E2BIG; /* Compat guests.  2G ought to be plenty. */
>> While the comment here and in the public header mention compat guests,
>> the check is uniform. What's the deal?
> 
> Well its either this, or a (comat ? INT32_MAX : INT64_MAX) check, along
> with the ifdefary and predicates required to make that compile.
> 
> But there's not a CPU today which can actually move 2G of data (which is
> 4G of L1d bandwidth) without suffering the watchdog (especially as we've
> just read it once for strlen(), so that's 6G of bandwidth), nor do I
> expect this to change in the forseeable future.
> 
> There's some boundary (probably far lower) beyond which we can't use the
> algorithm here.
> 
> There wants to be some limit, and I don't feel it is necessary to make
> it variable on the guest type.

Sure. My question was merely because of the special mentioning of 32-bit /
compat guests. I'm fine with the universal limit, and I'd also be fine
with a lower (universal) bound. All I'm after is that the (to me at least)
confusing comments be adjusted.

> But overall, I'm not seeing a major objection to this change?  In which
> case I'll go ahead and do the tools/ cleanup too for v2.

Well, I'm not entirely convinced of the need for the new subops (we could
as well introduce build time checks to make sure no truncation will occur
for the existing ones), but I also won't object to their introduction. At
least for the command line I can see that we will want (need) to support
more than 1k worth of a string, considering how many options we have
accumulated.

Jan

