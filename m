Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF26267B309
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 14:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484303.750855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKfXm-0003ac-Ls; Wed, 25 Jan 2023 13:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484303.750855; Wed, 25 Jan 2023 13:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKfXm-0003Xb-J4; Wed, 25 Jan 2023 13:10:26 +0000
Received: by outflank-mailman (input) for mailman id 484303;
 Wed, 25 Jan 2023 13:10:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8YOW=5W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKfXl-0003XV-6G
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 13:10:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062.outbound.protection.outlook.com [40.107.105.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a07518ba-9cb1-11ed-91b6-6bf2151ebd3b;
 Wed, 25 Jan 2023 14:10:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBBPR04MB7932.eurprd04.prod.outlook.com (2603:10a6:10:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 13:10:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Wed, 25 Jan 2023
 13:10:21 +0000
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
X-Inumbo-ID: a07518ba-9cb1-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3DTo5b66jq9CjZPtR8J4bwhgudK94cb3EZ3cD0sMhxJW2I+WczQIF8tTKLkZMtm/mVMGHebQiOiyTZhIikxfxzdz21DRsbysYtIaQNs/EJ/gUFvN/C3YHdYFkNzp/l/N1bYdtcOChVMDCznLITb0j2qfO0DMUY5BZeWz+s8Lck2PP/JgqpdVtfzNP73BoMB/LMl7+h4KNXotBHr+p0pLYnu8e99mrQHouBIYYJlduPNiCCBwKR5Y3NduMns1JrTpJTslGl5yDO1M5Cr5KUNLNmfCIrkR4016Lz0YPnTV9q1Ch7AEUS6El8FmZo5YYqeXDmIqmw0WK6LyYeNfmQtdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipOBsiNfElvS9REl+s0nHNRWK56gfuZF38I+aQn/+C8=;
 b=RojFAhr1532Far4P4c2wAMgioGXqXgUKDEgb6Hn0/3R/xbwTcnY6SeuwxkJ3o3qyvYwaYZka8TpMOynzwUjMYpY67j34STujgy+vtpfbHT9hd2n1ww3nECaMk/YoRRXxzPiCxLf+bfVRF3bTrwD62gtDxPTs/09ULNPfZI6Z+JhyKRoOq3PWkSz3iBssGVFi1e++ZNmxdkLBeFIskmBsTpBor5QHCSjBnQlZ7vAiet0bBGudLP20R9AaL6PfAJnNjAqebXD9JaAaPV5EtHKnJD+eWkBSl9b25kp16O6wRqk1ZHs+69fTaC3BPud5OyVI7JcUW5GHyWLO2eDxlGDG6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipOBsiNfElvS9REl+s0nHNRWK56gfuZF38I+aQn/+C8=;
 b=b747XuSGDz6kmzzg8eVwa9GldY9yLMMuvkzjF6iUwvaTVQeubaSSi/i20DUwtkO5dvam3cMTrJMI2Zrcqn9HA8EcPI3yJY/TPSuhv/Ny6XAr/nkd0EcugirpI6qy6e0ocFsRI2RDgq5buP5U9s4RRLB1TOk6tJN0kO1TTRSRtTuxr+/2e4tUcseCE3BtvFgEhSJyAF/l3ZDgKUIsJ1b9kCbMVSse4ezkNW4HltKhUnkjpUwZiJEpEgcGUdTlr8D44G1NBqsXUudaxJP4t1u3AGgVTf8y1InyBpWAiGgdwWlD5TYlOuCttzrwOv9Kxwizk9yIBp+RtkftGnDr+V4cFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6c952571-6a8d-e4fc-36ec-b5b79dac40f6@suse.com>
Date: Wed, 25 Jan 2023 14:10:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 01/11] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-2-carlo.nonato@minervasys.tech>
 <a470be46-ab6e-3970-2b04-6f4035adf1cb@suse.com>
 <CAG+AhRX9DVW5EfXKQoDG9hmcE0FORydTZd0pNm-0uqwddaN9NQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG+AhRX9DVW5EfXKQoDG9hmcE0FORydTZd0pNm-0uqwddaN9NQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBBPR04MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: b22bbbf9-bbd3-4428-b688-08dafed58320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N64OQdYCtSgj/AZPycOHgchpuyLYn6h4+9S6MJ7n8RME4eqeDDtRR/yl5Le5XqGTRDSwnvru7reawlrE7WSFSiZrU2icX2R6vqQnlw8ij+porKOZiKtV8Y2tFZdYGmXU+ctZqsluIFgiX5Jf8lXcaWD56wuwA9Ac5kM6PhDLm2REn15qmRq1E/s0Lpk2GwCMSuL61poQehbtZE9aNj/bsSgmJfOdM1yq08wTiBbyonqFjuiER/a7P2wBzB+rJPywtL6zaFvBkAzIBUtCXcy4z9boLENjGPO004DIkEXlCR8f+DZLNnZzgdvFxmPAhU4AM3Y6dVXm1oEHPC9OREYD/QzDqpAmHwyVha4NW9ek089o874D5s6QSF/53mmhDxaiMO4cj0kYjawqLefKt0YGoMMB6mAEBdUq6atrpjYb87EqyIfvh1Q+mLzu9gpTnZxc7KujYR4wVSwm9SKnKyqHOGmsYwAPfwTFn+JwVYlyu7/7lQP9XJ5PojN3gXtTZ7lGI5DcAF0aVf2WKZYm1Ng2b8gnXxWtFEcjpFMpMcjfYi1sI8FiNKpSO/OxSGE0dTBkEUe9ihSnaOg5FCM2kJcxpuL6IDXaJ64/C2NG40CSdkqH8QWEhtIrTNGjCbLkY+18s+f5h+HnPWpw7BnztYRS+BoS7Hng4TABXhbzWHFfIxqrRaDs0afUaqG4zeb3koOVhYlq8/3g6131rFmkUBh2To1mekY7wtab9EciaWPH2xUcUJXyW1Wco/KIaNszS1D1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(396003)(366004)(346002)(376002)(84040400005)(451199018)(66899018)(31696002)(38100700002)(83380400001)(5660300002)(2906002)(4326008)(8936002)(316002)(6512007)(26005)(186003)(8676002)(53546011)(6666004)(41300700001)(2616005)(6916009)(66946007)(478600001)(66476007)(6506007)(6486002)(36756003)(54906003)(31686004)(86362001)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1RrV1ZrcU1GLythTjZHellIdEt2S1ZKcUt4TG5TUGFGdnFjRVg2cHgxSEhw?=
 =?utf-8?B?cEFjbW5yMHh0QytvK0h5cDNzRE0xU0R0eXpqQ0VPdTNWUUNrZlM0RDZucWwx?=
 =?utf-8?B?a0lQNzNGWndqMy9LTVcyaHJ3czcrcWxxWm1PV2hkbk5MRVNvSE1RL2FHY1lG?=
 =?utf-8?B?ZGZCbzU3V2FGdlZrMlo5U2dKZ2xueDJmb3hNR0IyWUU4SmQ0OVlFR25RSDJl?=
 =?utf-8?B?bFljUU10VFc0MGVHUUxRbW1HaVZXazlHRm9MbVR0YlN6dzR1NlJlQWc3bk9H?=
 =?utf-8?B?aUFUTHpQS2RnZHFTamN3TFYwZW1LRnlIZWJMaS9wK085VS9hakFJQ1AvdzJ0?=
 =?utf-8?B?dUxlaWtkWkVuVURyZXd4V09nVFNqSVltNzRYNTFKQlgzemFzR0I1L2x5c2Rr?=
 =?utf-8?B?TXcwb3Z2VC95c0JmeEgrM2RBUk1MbytOYUdCNlhsTU9vZlg1M0hOZmlkVDZl?=
 =?utf-8?B?YVVNcVZkbzNNOGQrVDdaNmZvUjFESXNQMFFNR21TK1hPa3VWSVBDdGxyUjJu?=
 =?utf-8?B?eHlWUXpGTUg3S1JWSUgzWkk5VGhOaGZWaW5JMUhZWTEveGRwalpNY3p5dDRR?=
 =?utf-8?B?Tk14MUh6SlE5VjZUYjdGRzU3VmJ2Q1dVY1owU283aFNLeEtwUGRDZitCcDNr?=
 =?utf-8?B?M2t4aXBrZXU1bE9nMGhDc0M5UCtnQ2VRZXZtOGp2UzlISzNPdVk5MmwvTDFR?=
 =?utf-8?B?bWZXWnd6WHczNWtsMXBkN3hlR3JIdFJ6TFhoSS9Qa2ZqZ1hUMlVXdzhMUVM1?=
 =?utf-8?B?L1FRZGFQbDhBa3ppN3dRS1RrVW4zM1k3WjQwVEE5UmtraWFBMDh4cXl3ayto?=
 =?utf-8?B?K0t2RU9UdVlXNmpXUHJ2a2JCYTFxMUc3UWk5TXc1MmhmKzdTRXZsNTBOWGw5?=
 =?utf-8?B?Smk3bzhiTGR6LzVHT0ZCeVRYVTF2UlZHQ1JUclg3Qmo1V0k5cTlsSjNJZlFs?=
 =?utf-8?B?NEk0SjRvMUYzcjFsekdqVUhtTDNUeDRRaGdORjViRkdkWGdBcmNWeTA5anFy?=
 =?utf-8?B?Q1J4YVZXY3dnRmdVZW1TdnY2L01kMmhQODNXZFQ0Vy8vTDFRR2FVdkNaVDBS?=
 =?utf-8?B?MTF2K2RvVGs5Q1UwbTRaK2dHVGM0c0k0UHdybWg1OGZqWXFCVThYZ3l0NW9q?=
 =?utf-8?B?SmNJVkVLeFk4ZDZQZGYxL2FLTmVhLzVjczZXQzFTc2w3VFRoYStYcU9CY3kw?=
 =?utf-8?B?ZVBtOUs2Tmx6dndTLzcrc2xqTldHN1piODhFcGd1Y3BlcjNPelpPU00wZktr?=
 =?utf-8?B?c1hmVnk5K0pBbWhKUFZLYlJDaXdOU0NudExvZ3VVL21yWi9nbU5vL2R5QnlR?=
 =?utf-8?B?b1B1b0dzWXJNYmFXQ0E0VjIxNWYvSzF6TWhTUDZ5dXdKak5JQ2NDWTdwY2RY?=
 =?utf-8?B?NXY1YndvUHpqSmZXQjhaT2pPQWVaaDE5SjRxM3hvZlMyT2JUZ0FRZjhqaU8x?=
 =?utf-8?B?K1VCbHphcVBCUisva1Iwc2ZoMEZFWUJTMnR5SytTVE54UWowZXJoVURQUEp4?=
 =?utf-8?B?d0p0cUdVcU9QSzBnckZpK0RFSi9MMXhxdWRxa2QydUdKc0VxTHFpNVZRZVFa?=
 =?utf-8?B?L3ZiTkhKenhKSjlwL0FZNlZRb1hNU3o2RnVYeVpFTDJKNGtRZG1ubW1hV3pi?=
 =?utf-8?B?OVFvRWdGbzFPT0JoUEhMRktBdDQrZDZ6bmZtSkFvU053RmU1Z1RDWURnQ1I3?=
 =?utf-8?B?cnkrQkgzZ0pocjZDUndsSnVZR1pyL0NxUzVtSXZuNG9OaVk2K2dBaWlFbmE5?=
 =?utf-8?B?TlFBVnhPMllWdUE2cndUV1BOUnlRMjhnelZFUlBpZU5FNC8vL1prNk5OTGNQ?=
 =?utf-8?B?QmY3anpUeHVCdGtNdGJ0d1dHNGpTU2NaQ3VuVXZINnhkbVBJZFZzT09XaTlQ?=
 =?utf-8?B?VVNvL3JuWWd1NXU4dkVYZGdxS1pXRDZtRktOdVZ0VzV6ZTR6bS9aMUViWTVl?=
 =?utf-8?B?c1AybG5aZk1Rb3hnNnNJNTlLNW9zWWhESVVDcVFNcXhKSk5kWnBsem9BVmlN?=
 =?utf-8?B?KzNVQitIdjBwYnlQTHI5bG95SFRxMXZFNWxLNmJBZlBKY3Ywemc4cnQ2Yk9J?=
 =?utf-8?B?V1pMejl0L3V4NForM09ybG5CL21BK1l1cHRnUEl5N2ZDWGhScXJQWEwxUkRI?=
 =?utf-8?Q?sX+yJTs5aGxANLfaoz5TDEKSn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b22bbbf9-bbd3-4428-b688-08dafed58320
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 13:10:21.3888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ZpsmjwO7SdZXFeZ8zBbppRKLgl2UCM5mBCJzH1gOj+FwOa9o/7YCAXuSaXTIvk7qz57504upDJYOpewdL4TGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7932

On 25.01.2023 12:18, Carlo Nonato wrote:
> On Tue, Jan 24, 2023 at 5:37 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 23.01.2023 16:47, Carlo Nonato wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/llc_coloring.h
>>> @@ -0,0 +1,54 @@
>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>> +/*
>>> + * Last Level Cache (LLC) coloring common header
>>> + *
>>> + * Copyright (C) 2022 Xilinx Inc.
>>> + *
>>> + * Authors:
>>> + *    Carlo Nonato <carlo.nonato@minervasys.tech>
>>> + */
>>> +#ifndef __COLORING_H__
>>> +#define __COLORING_H__
>>> +
>>> +#include <xen/sched.h>
>>> +#include <public/domctl.h>
>>> +
>>> +#ifdef CONFIG_HAS_LLC_COLORING
>>> +
>>> +#include <asm/llc_coloring.h>
>>> +
>>> +extern bool llc_coloring_enabled;
>>> +
>>> +int domain_llc_coloring_init(struct domain *d, unsigned int *colors,
>>> +                             unsigned int num_colors);
>>> +void domain_llc_coloring_free(struct domain *d);
>>> +void domain_dump_llc_colors(struct domain *d);
>>> +
>>> +#else
>>> +
>>> +#define llc_coloring_enabled (false)
>>
>> While I agree this is needed, ...
>>
>>> +static inline int domain_llc_coloring_init(struct domain *d,
>>> +                                           unsigned int *colors,
>>> +                                           unsigned int num_colors)
>>> +{
>>> +    return 0;
>>> +}
>>> +static inline void domain_llc_coloring_free(struct domain *d) {}
>>> +static inline void domain_dump_llc_colors(struct domain *d) {}
>>
>> ... I don't think you need any of these. Instead the declarations above
>> simply need to be visible unconditionally (to be visible to the compiler
>> when processing consuming code). We rely on DCE to remove such references
>> in many other places.
> 
> So this is true for any other stub function that I used in the series, right?

Likely. I didn't look at most of the Arm-only pieces.

>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -602,6 +602,9 @@ struct domain
>>>
>>>      /* Holding CDF_* constant. Internal flags for domain creation. */
>>>      unsigned int cdf;
>>> +
>>> +    unsigned int *llc_colors;
>>> +    unsigned int num_llc_colors;
>>>  };
>>
>> Why outside of any #ifdef, and why not in struct arch_domain?
> 
> Moving this in sched.h seemed like the natural continuation of the common +
> arch specific split. Notice that this split is also because Julien pointed
> out (as you did in some earlier revision) that cache coloring can be used
> by other arch in the future (even if x86 is excluded). Having two maintainers
> saying the same thing sounded like a good reason to do that.

If you mean this to be usable by other arch-es as well (which I would
welcome, as I think I had expressed on an earlier version), then I think
more pieces want to be in common code. But putting the fields here and all
users of them in arch-specific code (which I think is the way I saw it)
doesn't look very logical to me. IOW to me there exist only two possible
approaches: As much as possible in common code, or common code being
disturbed as little as possible.

> The missing #ifdef comes from a discussion I had with Julien in v2 about
> domctl interface where he suggested removing it
> (https://marc.info/?l=xen-devel&m=166151802002263).

I went about five levels deep in the replies, without finding any such reply
from Julien. Can you please be more specific with the link, so readers don't
need to endlessly dig?

Jan

> We were talking about
> a different struct, but I thought the principle was the same. Anyway I would
> like the #ifdef too.
> 
> So @Jan, @Julien, can you help me fix this once for all?
> 
> Thanks.
> 
> - Carlo Nonato


