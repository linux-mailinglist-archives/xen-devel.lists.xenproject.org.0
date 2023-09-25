Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12D27AD136
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 09:15:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607632.945884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfnc-0002Ej-GX; Mon, 25 Sep 2023 07:14:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607632.945884; Mon, 25 Sep 2023 07:14:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkfnc-0002CA-Aw; Mon, 25 Sep 2023 07:14:32 +0000
Received: by outflank-mailman (input) for mailman id 607632;
 Mon, 25 Sep 2023 07:14:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3u+g=FJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qkfnb-0002C2-6N
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 07:14:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20608.outbound.protection.outlook.com
 [2a01:111:f400:7d00::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a07ffa0-5b73-11ee-9b0d-b553b5be7939;
 Mon, 25 Sep 2023 09:14:28 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VI1PR04MB9859.eurprd04.prod.outlook.com (2603:10a6:800:1d9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Mon, 25 Sep
 2023 07:14:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::1353:3b49:2b70:6303%3]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 07:14:24 +0000
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
X-Inumbo-ID: 2a07ffa0-5b73-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DN5tKtWhYSCofPNrLdTdyaQkId0L0C4TmMTTS+jsUQ7Y/dmtes2neLTfRgaNnDW4BcnX/U9cMxW/BBxXXovwR6KSWAGavZz/e+iINZEdmvBJd4t2CVeeyCuMcXftl2RIe3uZSZGSl+qda5iWGtInCEIdLlCoML0JKpaPhtg4lGRVTtxMijjLFRuDq9dXZgAmeaona4O52wc+i6/iJu3l4FQ7sATKQyDN9J/AXoylPLbFX83bshB9XVDAX26/e5H57jebK+cZ3qEgLWejqcYkJ+kMosbmObunx6WTBx+8zyqiKFKwkPwQjVbVkl9Wasgn3nyZp6F78Vo6fYq+3IuCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DH3rbZ+u+EVzKUssKuqq/xr3hL9vtQ66aSQ3cCrbWwI=;
 b=RLUsk/zaQxg5xrN4tnCWJ7B0oSNRED4Rs/rPRDfFuuO3ySmzJjLTQa993xCKIlOhUjNUHIpNSwHHDKvcz/HIbS4gYTxYGGGq39lFrQoEFilFTMbaby1u2KSeR+Mtvthih3LkodOZY7dRbt0y2mcdlP0joPVDDH5Eq6bK1sAwKM2A6xIfIXpgWoUUm5/MlCTlbykCEVBviEX1a7kY2Hilu6Spj7DxrTlZL/FqZSnqof6nAMP93VdxzEH3MmXg0RUztxYSBLWmoRm9XfSfkkkWP+4vvjtl3Z+/Zlih8rKYMdVJPouUgMU8P7jUFh2v+cFlAQ42MRVYPEazeWcoOUL9rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH3rbZ+u+EVzKUssKuqq/xr3hL9vtQ66aSQ3cCrbWwI=;
 b=j3H2giJ41EdtvHtwgXfY6xh1gtvCxf+ZQhm+3Iecff/69XYTB7LsT9nCXY5FWd1J30QscJtkodUOfe8P3A/a/BrdhS/lwdAZLLjAc0F2mGSZfVQt1UEhbQRjgChBYfeqBqbuWU26pQ5ojniGCerTRxveegkbscBBDfPhXNfN2CRORZe3GIxK18chyLP79dIGFp8baIO0RkzGdI5QwgtFrZ6nPXl9WnJr9gluTYSLTBYxOOWHRgXKSRv8mjhnx2+rE4gSq9TTw9QYyLRLzphL9LC39ywza2MGjmmYy/65PZJxBlGExXoXU7cVCrwsE6/0AJhNdi0R/86veFRaV02hMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aebd0b15-4e1d-3ca0-ede9-524aff777576@suse.com>
Date: Mon, 25 Sep 2023 09:14:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Xen 4.18 release: Reminder about code freeze
To: Henry Wang <Henry.Wang@arm.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <6399a816-ac1a-b741-ed52-b5d03b498ee6@suse.com>
 <2AB20BED-9ED9-4713-A39A-59891E09E02C@arm.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2AB20BED-9ED9-4713-A39A-59891E09E02C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0108.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VI1PR04MB9859:EE_
X-MS-Office365-Filtering-Correlation-Id: 45cd9aa4-a346-41bb-ca22-08dbbd970c0b
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vJzjcqnR+z73Rdonool1EwcMnwgvH9c7kwleFaG32qGa+YGjVOqxQLVWJ3K+PUFboMnzZHU86FP6DsMqODln8ld192i5D2weWFksj407Ty9PfNfG77te5pNw2TubV3v+Nhn/Y7xrDxSSA0hPwyW6Sr8l5vgD+ka64+f3Uc8AqqXUCthe39h9hXofckNISm3k6di3Tf7ay77rmHWlDx+j3VdOaUVdoTE4q3UB5qtsJI2HVsUsSML0615T30wo7F1H2i1dLc1qZEuhEBD0i+/KFDKoipl1rkh8QakZm2x5JUfaiu642qA/NLX+wSFBN/BYFCPRgVIt6tswHlV1oWXdr7stiiFVf7fsgdx4eVPyYtofZruA1FhbnKBIvDauX9nhDfOkrkWasOyjQa90NEtcyb80GvSvTIrUSEM7GldeK0ucnnHeFXuGzvxIfDvhakCy86YkS39ATZJc37vcVt0V9ow6NxMjVR0KUcfij0wvbI0Q4YYNAfDU3Fp2rssLUlzT23xBnjL0ZS9umRJQejyKqF9ZGonpZqcoCvsI20s2rHDwC7YYdQFhG94bmvO3K9ifLaG95l/GLiy3OspxANrAY8NxfGOz+0xmYClJpvZib6vDMlD6hPaquq0Q5IRMQn5zVAZzfv6ASxeEMIDR4iRMlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(366004)(136003)(376002)(346002)(230922051799003)(186009)(1800799009)(451199024)(66946007)(53546011)(6506007)(66899024)(83380400001)(66476007)(26005)(2616005)(66556008)(6916009)(316002)(54906003)(7416002)(4326008)(8936002)(8676002)(6486002)(478600001)(2906002)(5660300002)(6512007)(41300700001)(86362001)(38100700002)(36756003)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGU3V1c1V1E1NzFobEVqUmJ4eThQdVJrOUFSNllGa3FveitRY2I3VVFNTWJq?=
 =?utf-8?B?QlRVR1RWa1Z4NHBFVUVyK3lqTHVibmRYeEJMeU9IOTdZb2t3c0pLNytZU0Er?=
 =?utf-8?B?VGdqZlpuTW05WjZBUG5XY3VrQ3crbHhQNXYrNWlKSE1zd25ad09CazlwK3Za?=
 =?utf-8?B?V0VMNC9KTVVUWXNhbWx4Uk84VmNqMlVPbkZoTTE2VkpOc3ZSbFVKUFFDejlw?=
 =?utf-8?B?bG5LN3VGZk0vNW5zOU1CNWpKWVM4b2hFTVpuOGpmekN2NXFjYkN0VGxOU2N6?=
 =?utf-8?B?OFBaZnN0eE5BREt0MkVvSjhlZ2c5amZkdURybDhVR0NkeGtjRVhwVXcvNnRF?=
 =?utf-8?B?ZER2MmUxbjNEYUhGOFNVMEF3SXVyM3hQallRbGNnZFFYbEVjaFMvaXNmdlM2?=
 =?utf-8?B?VHZVNFVPOWVuMm9Kb1crbWdaNTFnOE9QcVdqRm1ndmwxd0hqQ1FLbWpQUW85?=
 =?utf-8?B?N296Snk2YkRZQTJaWGdZNzljb1d5L0VVTHM4MzF1NUhDc09MR1JBYTVlTm84?=
 =?utf-8?B?a1U0c3BWYXNob3hxMDEvZ0NKa01KOUo0Rk9qay9rQ0xRZ1A1aFo5WDF3QUUr?=
 =?utf-8?B?VnZzQkVvMWphVWpzRlgxd3cySGZPMHFncDQyNHpkMmJMUlo3bTFpMTNxdnYx?=
 =?utf-8?B?OC8zL3VPZmN6Vm9RTXEyWXVvd3h1RkRTb0l4d0dkcGVad0FQNjBIZGQvT09j?=
 =?utf-8?B?SGNZWld5VDZOSUtVaWpTVElCOTZYZmdMT056TWNGMHdqVmp4Q05HUDE5OFk0?=
 =?utf-8?B?Q203cHF5YkVLd0VDZVE3cEk4cWxYODU5UEJDTjRyQjBjMzR1TXZoaEJyRWNV?=
 =?utf-8?B?WXJSNGN3b0JWNGUwN0QzeWk0V2xjS3BUVUpaWnN0K1Bwa2lqbjdnemJmb1RJ?=
 =?utf-8?B?OEFGKzFqVm1qUHJaWTFzVnN4QXJGcVRnb3VYNmtFeVVpSEVkTXM0ZzdVTGVG?=
 =?utf-8?B?RGcwL0w5VmJ3UE5ISXh6SXJqMEoxekVndlVnNnhCT0hzb0VYTGRuSmZOQVRm?=
 =?utf-8?B?ZytrY01qZ1FHWnNyWm9nRGRWdHJIWXNWUDM3RXJORDZlTk5WSE1HdmJGakE3?=
 =?utf-8?B?ZmFVWlUraG1JRjhNVHAxM2duUGMzdW5yTXVLRjQxNUpOc0QvbG14YzV4cVFy?=
 =?utf-8?B?RjIrNkZaNUtxbHlrb0VkNWNtT2VYbkVtd293ak1jaTJtTXJZbEZpcThUNi9a?=
 =?utf-8?B?ZEJMTG91QTRBa3V6R0hLRnEyMEpwR0J0c3RWQ3IvZTB4ejhVV3YydG5HMjVE?=
 =?utf-8?B?Q3NSQUZMSVptRVFvTGh4YkwwS1hiMXVPSTF0UDdqemhpdTdaTUpFK3pqLzJC?=
 =?utf-8?B?OVNHemVDWHlzSU5kNHoyM3Z3KzdUWnRjbGQrd09mNFNqazFzMlJNemQ0NWgv?=
 =?utf-8?B?UmlLRGt6cVpqNFZ2QUIrbVE5ZmJmdnhieXNJcXNsSVlncS84cmdzYVc5Z3d0?=
 =?utf-8?B?Y3MwMnh2SS83NVRqTVMrN2VMNVZydVp0eGF5akZqRVFtTklGMmRVUEp5Z3lw?=
 =?utf-8?B?VVNWc0w4OVQvZ0loVzNXMVl4Z2psM1RGQnJvMmh5U296dVpEOE5EOVR1cEhI?=
 =?utf-8?B?bE9YM2pUdXdyTmtScFdhU3MrcEIza3lPVTdSSmh3Y3FJaWVIeHI4SndqZzlU?=
 =?utf-8?B?NWlyUzQxa0U3OFl5Q0N0UkF6SGVoMnVodHp1UGRjcnY0RFlPZlNLTm05RW9j?=
 =?utf-8?B?cjh1MVVoMVZhWnJ4TXRqbjcxbzVicEVZMnpWbjQyR1BReW1UZFlEb01TOXdP?=
 =?utf-8?B?YTAyUWkrQWE5T0g5ZHNBc0d4UkFtazlGaVN0Sk1Zc0F4L0NmUlZCdDlXSjFu?=
 =?utf-8?B?bWNGMDQzM3R5Z2ZKb0hnUlJnODhlTmpLZGFNVmxNZDZkRzEwR2dHUDJPQjBM?=
 =?utf-8?B?NUNJSjZteU1Qb2NHcUpYZjRldEpHSFoyUGhzcHpGcFhKRlJhYzQ3cTZDWVZl?=
 =?utf-8?B?aDJKSkRrUFZ4R0FFRENNRHlxOTA5QnJJQXRIaEhPbTVFRkpod0Y1WXVDQTRO?=
 =?utf-8?B?NXRzdStpMnc0cFZBZDJwS25wVVN4eDdpUllnR2xSMWl1c3hVbjdiVUoxZjNK?=
 =?utf-8?B?U0I3OTRMM0tPeXNTckt3L2NVNWxUQjJtWHZEWHhXdi9vd3BZYUYwb3pMWHhn?=
 =?utf-8?Q?PyfXfsUkRDwRQkUONc7+tiZJr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45cd9aa4-a346-41bb-ca22-08dbbd970c0b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 07:14:24.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJHu6qKu20OesDQ5KTov4nS3kWkjLHlNtnTSLf4PQ3n/80OTOu9cW0OkgAYnrQXmkAI40zEqykVtFSxgA+Levw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9859

On 25.09.2023 08:40, Henry Wang wrote:
> Hi Jan,
> 
>> On Sep 25, 2023, at 14:32, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 25.09.2023 03:25, Henry Wang wrote:
>>> Hi everyone,
>>>
>>> This is the reminder that we are currently in code freeze. The hard code
>>> freeze date will be in two weeks, i.e. Fri Oct 6, 2023.
>>
>> Could you further remind us about what is (not) permitted to go in during
>> this time?
> 
> Sorry, my bad. From code freeze, technically only bugfixes and release
> Blockers can go in.
> 
>> I also understand all commits need a release ack from now on?
> 
> I think so.
> 
>> (I'm sorry, we're doing releases only every once in a while, so it is
>> always good for things to be re-spelled out, i.e. even if they haven't
>> changed from earlier releases.)
> 
> Actually, thanks for asking! For MISRA work...
> 
> 
>> This, for example, would then likely mean
>> that all Misra work now needs queuing for after the tree re-opens ...
> 
> …I also thought about this, to be honest I am tempted to loose the control
> or at least offer some flexibility on this specific part, as normally MISRA
> related changes are harmless and actually harden the code. I am wondering
> if there are any objections from others…

On a case by case basis, still allowing some in might be okay. You will want
to release-ack them, though. Right now I have three pending for commit which
might qualify:
xen/numa: address a violation of MISRA C:2012 Rule 8.3
xen/hypercalls: address violations of MISRA C:2012 Rule 8.3
xen/emul-i8254: remove forward declarations and re-order functions

I'll also commit "MAINTAINERS: Remove myself as RISC-V maintainer", without
thinking that it would need a release ack.

Jan

