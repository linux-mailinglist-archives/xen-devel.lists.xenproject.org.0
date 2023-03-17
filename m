Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A166BEC07
	for <lists+xen-devel@lfdr.de>; Fri, 17 Mar 2023 16:00:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511148.790049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdBY8-0004mW-HT; Fri, 17 Mar 2023 14:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511148.790049; Fri, 17 Mar 2023 14:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pdBY8-0004k7-Em; Fri, 17 Mar 2023 14:59:20 +0000
Received: by outflank-mailman (input) for mailman id 511148;
 Fri, 17 Mar 2023 14:59:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pdBY6-0004ht-2m
 for xen-devel@lists.xenproject.org; Fri, 17 Mar 2023 14:59:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20619.outbound.protection.outlook.com
 [2a01:111:f400:7d00::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48247047-c4d4-11ed-b464-930f4c7d94ae;
 Fri, 17 Mar 2023 15:59:14 +0100 (CET)
Received: from DB8PR04MB6554.eurprd04.prod.outlook.com (2603:10a6:10:10a::28)
 by PA4PR04MB7696.eurprd04.prod.outlook.com (2603:10a6:102:f1::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 14:59:12 +0000
Received: from DB8PR04MB6554.eurprd04.prod.outlook.com
 ([fe80::27de:8103:c137:3498]) by DB8PR04MB6554.eurprd04.prod.outlook.com
 ([fe80::27de:8103:c137:3498%4]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 14:59:12 +0000
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
X-Inumbo-ID: 48247047-c4d4-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJ9jdVHSDGMq/2fH2WZS35IhMGvm4jlNcLCDA0l3VF3e6Gnlcrb1Nmevx1cpsIELR7is7WDpxKuHw5LHBkOiESF/kXRZj2Wcxt7oTtJe/f/tlT7JlJvNRChnu09FGMTMsIK5JTk6Ew67TFTMgMl7vTs0OQnRO9P4I3xuicl08X9PuwKgaozqCOcXKiExnUTPb3g1KcLhLs73lTvvx1Ggk9LTyj4Y6ywowVX85bFe4uvrZmG1++clre2JcsATgYm/DRYiAjV0kLYkBVSig4JHOqVryBSEF/M2s34hKSzVxgblB10EB2oYrC05dMnnqTeXBhdan9snvPW1QVqgLQCH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gy/7RFBrrCcQztKvsuv/P8iLhDGJAZB2t2H4otjFx1U=;
 b=hk+rGVBjRzLKtkTJzZvEB56CIW324QATHaS6GuyO+qjqzVy2xCv+wgbtNCmwoam50WY7NqSQxIDWamxrHKAvp6SUg/Tvny71Vz1J7T24RfP23MMlPITuKBMWjq2YQ6nYLXAGHQIH9ZRiDumJfhih2USWkktofQV+UyFtmR7svCODsCa57NSixW+19BGbuIGdrgfVT+RhJuPD/YB2WzB9Sfsu2pZjk8o8YPq6Q3kENJUo46QvQ1kSU128EFYFvmBhq9yWWsdap40eXZUKiW0K1pukvpH/28tXqN//u+bST+1x0Z3vLdry5rCH0EehDNRK91AqweJ5a8fY0qbxHp/Z+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gy/7RFBrrCcQztKvsuv/P8iLhDGJAZB2t2H4otjFx1U=;
 b=cfYsmiFxkTGIMSvHYosiuX+b1CWeuYT11Gu34txwTyb5LLce59rUNzgtRHEgYa1d9ozbMveAIW3ddCHUDSAYZpIlEP6jtd8IvLgBKcT6DXw9HI4Hf5MvJci9LvJgLW6hT9WYj/hMiqLKmiPKkUJOOWxxruPzILQDPBK1Ktu6+Bs1aHFraqDKj/XBc2aULXHt2TQZ4PvL5DjA1a9Uan0redcBfc6v4vJVtCUNwfWJhjkvInvEvwNQWEaZaX1uM1rcWstl0LzesSx7wdGEFkIQZC5gfuuGJYd2YBeh7QffOc37zoA98JFnBzG8HjIUEF/yqn2LipViavXUAswKzxNfLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6af7a3ea-f454-7027-590d-f883e6c2a523@suse.com>
Date: Fri, 17 Mar 2023 15:59:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v8 1/5] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
 <2afad972cd8da98dcb0ba509ba29ff239dc47cd0.1678900513.git.oleksii.kurochko@gmail.com>
 <3bc211fa-a8f7-70ce-bfa9-5e4380776070@suse.com>
 <99354bbeabf11e86cbf3fd46019c08fb36bf0098.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <99354bbeabf11e86cbf3fd46019c08fb36bf0098.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::17) To DB8PR04MB6554.eurprd04.prod.outlook.com
 (2603:10a6:10:10a::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6554:EE_|PA4PR04MB7696:EE_
X-MS-Office365-Filtering-Correlation-Id: 470598df-28a3-4d50-fa97-08db26f82b18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uLwAZbySGHOMOj/pGu1ddBVGx9+VzfmCcPlvsTYMZ+HROA+Zj2SXDayYafuXl9dWdasYkpfhIwRuP4izQqjY33CCIHFs9fLiYQgAtOV5RoyvJP3MKBh2x/lZKHRMajAgzHH38B/zd2eh5A3dv6Mhg/E3QNW6epog1JZAVIy3Q/fDKsYLPMvioTvwbFvwWufTaoamKXvAHTfMWy0Vd1N3FphSYyuWvU2dt+oJLnGhKmHGjbKNCYpGZCCTp9H84+3cflU+/HqpZG0v2IRlcxzYqqX5sPiGkj0CqVq5s/+P4kN01BEllcgCCBPJB+9dyJaIwbTt72wf1BIJcAxVEGGWvm9JOhbPT11fE4wnBJb42cgjZgCqyiUL6OJzDfWtg0Y9AworbranDLIr/SfNSIU58mGW/qEmaK4EmABzjYuv3MrkyhxgLBZBJacHBH97RAfRmsKpHy512+pYvefMnS8M3azcPe9Z7oL7OywgeDuXGNjiR+KinArrNJUGP9sLdnaY4JrhI5+33VUJmHtXZwRAp2ob6AcextnEejvO8S79DY43p9cMpO/XOXWLMxhM0WANc3QuLqaWbvQ13s3XA5h8dlnP1nMCeACxml7vHMHfiqLctwbO+kLcYA5kTXs3YGMtLnP1wyTidRdUabcgxGSawedMTQdKCT/G4b5e833gojijBSReZeev/RyAB6RO1SDfhs9AnLoS/xHg6NJczmoS4dUCO2XVavRLv/Ex+eVfANgHLsG70pE/lumpC1GSlRaM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6554.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(376002)(346002)(136003)(39860400002)(451199018)(6486002)(53546011)(31696002)(86362001)(31686004)(186003)(2616005)(8936002)(66946007)(4326008)(2906002)(8676002)(6916009)(66556008)(41300700001)(26005)(6666004)(36756003)(66476007)(6512007)(6506007)(54906003)(316002)(38100700002)(478600001)(5660300002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGJORWhqWEtQcHB2M3FSR2Z6V3JPM21GTjhRWXEvdVVXR2gxTkpscWk5S08z?=
 =?utf-8?B?NTczMHY1MzdGUGRYRUdxZGhkVVRtaTRlaTZNN0tvNlR6MXc4ZkozYVV5Y2Jo?=
 =?utf-8?B?TUFwZWQ0aDdtQW95eG5pSnlnU0NadDhjbHRVdkhvcUdhOUpBVmpYK1dVTnA0?=
 =?utf-8?B?Zk4wMTB6SkoyR1RvcytJTHBQQ3JYRmlLejRBdzd4REdVVWh0dDFyVHljWEdv?=
 =?utf-8?B?VTlkS1hRZEVWUFJlVUJaM2hwVC96Ymxzby9hQTV3dzdiSTFhSmNRcDY4eVVa?=
 =?utf-8?B?ZXJoU3lLY0cvZXR2K1NaQThMbzZHSjBKVXVzVzlOVTlDZUJjNnRFMFFYdG91?=
 =?utf-8?B?YTR5YS9QZFFGNUhxTC81MUtXUUtMMVhBd1BsSTdjQ3JiKzlISVdNeXVRWkdi?=
 =?utf-8?B?ZkhkOW9hUlpXNytzMjJHWFB4YnM2WGkreUMvN3VkOXBzVHM1QUNqNVlXbWht?=
 =?utf-8?B?T0lJdS8yM2RLZk9ocVRqMVM4aGFacWZvTXRwQStqd3ZtMk1VaE83b0lsQ0M1?=
 =?utf-8?B?SWNCMTBFQTMzVUhvcVNzaUkweHI3dUtpMGtLNUExL2ZVUXZhRUJNTzgxQ0Va?=
 =?utf-8?B?L0I3U2VpaVZUZ0cvWU8vUnJCUUZVcjhkdUNsMDZxaXRxSnlXZmZOS1lQR1dE?=
 =?utf-8?B?dGVyZEMzV0o2M2lRUW9GMTFlRUlHdG9GM2Z1eDhENVJoZUk4Rm1qLzlmUGVU?=
 =?utf-8?B?cUUxV1VxUGNibzFCTlNINDFSMnUwVU1lQ1BJZFVLVDRsSTd2NlNuRmlxZURt?=
 =?utf-8?B?N1RXNFFXdGk0cFR1KzlzejZ2VHg3OGVETGRhQmlVVzBDZ2VRcHRmRC8wRWRr?=
 =?utf-8?B?UEZEU2ErWnZGT01UUUR5bytGbzZHWXp2NXJoVWpQN2N3dnNTMjRtemFkNlEr?=
 =?utf-8?B?QnhvL2V2emxsVFdxQ0lpV1Q3dkN1SFJOQU1TTVpIT1dPZ3M4d0c1bTl2K1Ir?=
 =?utf-8?B?Rm5pQ0F2SG93WHE4NlV5cTE4d3FKb3B4bEpWOUFpT29jQjZSUjc3VWRKUDJ0?=
 =?utf-8?B?Q1JmZ1paS0VuZXVnNWFVMWpZWWkxMjhOQkt1ZUh0L0kvdGxLVjIyOGdsa3Jk?=
 =?utf-8?B?b0FMUXJOY2MxQmw1RjM2bjNqSG1iVThGNDJ0ZW5OL05hVDBHby9mN3c5NytS?=
 =?utf-8?B?cTJYNmI5eHluRTVvajNDdWdtc2dpRG5jeXJXTUFDTHVPK2dQS3JGcks4MTF2?=
 =?utf-8?B?SUJ3TE5iaDBtR3FHT0dTL2pxek9EVXNLNHAwdHRKclo2bDljQ0tyZDZvUkhH?=
 =?utf-8?B?M1Y1RGtCTlMvR1c3by85SDViR2gxVXo4ajcyd2ZJTVNvN0k1czNPMUdsVW9o?=
 =?utf-8?B?RjNPaDJUbmwrQUMvYmlPT1ladmtkaXkzSm5wZTQyMVUzOE1GNHJmeDVsOGZL?=
 =?utf-8?B?OHZ4ZDhQZmtheCtuNFE0S3dqdWN0aXBaUzBWYWhRNndwSDZwbTBrUUtyZkpt?=
 =?utf-8?B?NFd5UnJxRmNRbU1OOGdoQWtubTgxNHRVNW5sbnZSL1lGTys0d24yS1phMUZD?=
 =?utf-8?B?RDJJa2ZUeGV2UGkwbkh5dlM4cHZGQzNqNzFPUFZ2NGZrU0QvQXpKYnZpQTNk?=
 =?utf-8?B?M1BCQ0ZuSzB5WHFDS3JDVEdGM1JWNDlkRnBHTlhoZklmb0tYSnZ5LytPUnBG?=
 =?utf-8?B?WDRVV2YxQ0VWYlIvM3VLWGxmRHJubnFYUlJkUXZUR041aDdiK2NpRUJmQkhJ?=
 =?utf-8?B?cE5RYnpmQ1hEM3oya3hweVhVUXVMZGxsWS9hWTlrdEUvTitWV3hZdDc0Zk0r?=
 =?utf-8?B?YkczVHlVU3IzQ2hEMWhodzFPZkdXUDdqUmtyeVNaamZHWWdDYThaRlF4aXc4?=
 =?utf-8?B?RERFNGROSFZCL3V3TkRaQ0t6TTF2QW9DNDNBa2RhTFFuSmN2Y2x0c2Q3VUg3?=
 =?utf-8?B?VWF4eXQ4ZDV1NktUTjlMM0VPdUpPdmRBS2NNZ0YvdHpiV0xUaGNpb1lEY3Bo?=
 =?utf-8?B?bEorT0hDaUttTG05UUd6UWRYN1RhdHpmL2tHZlM4UWE4ekNMMEtFcHVzYXh2?=
 =?utf-8?B?Y3RwR25nTkhlMzJwOElGTEcrdmxjYWt0UVdTZWU2TFl2eFNZTm14N3hDUzhz?=
 =?utf-8?B?RnhMTXZXOXdMeFoxOGNxNk8rTXRKc1FFWUdaT1hpRXR0VmJZL1VwVlhjdmly?=
 =?utf-8?Q?F6Tr9sNUoWr8Zo4ffz1WJAFjE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 470598df-28a3-4d50-fa97-08db26f82b18
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6554.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2023 14:59:12.1421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3u6L2yVIrlKW/f0XMalnLS1S0halONbx4rbJcizWtTqSdGOpE39NRnY0hXqjmh7xeVRCe+4Qv0OGHY/Bn6Guw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7696

On 17.03.2023 10:23, Oleksii wrote:
> On Thu, 2023-03-16 at 12:26 +0100, Jan Beulich wrote:
>> On 15.03.2023 18:21, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/common/bug.c
>>> @@ -0,0 +1,108 @@
>>> +#include <xen/bug.h>
>>> +#include <xen/debugger.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/kernel.h>
>>> +#include <xen/livepatch.h>
>>> +#include <xen/string.h>
>>> +#include <xen/types.h>
>>> +#include <xen/virtual_region.h>
>>> +
>>> +#include <asm/processor.h>
>>
>> I actually meant to also ask: What is this needed for? Glancing over
>> the
>> code ...
>>
>>> +/*
>>> + * Returns a negative value in case of an error otherwise
>>> + * BUGFRAME_{run_fn, warn, bug, assert}
>>> + */
>>> +int do_bug_frame(struct cpu_user_regs *regs, unsigned long pc)
>>> +{
>>> +    const struct bug_frame *bug = NULL;
>>> +    const struct virtual_region *region;
>>> +    const char *prefix = "", *filename, *predicate;
>>> +    unsigned long fixup;
>>> +    unsigned int id, lineno;
>>> +
>>> +    region = find_text_region(pc);
>>> +    if ( !region )
>>> +        return -EINVAL;
>>> +
>>> +    for ( id = 0; id < BUGFRAME_NR; id++ )
>>> +    {
>>> +        const struct bug_frame *b;
>>> +        size_t i;
>>> +
>>> +        for ( i = 0, b = region->frame[id].bugs;
>>> +              i < region->frame[id].n_bugs; b++, i++ )
>>> +        {
>>> +            if ( bug_loc(b) == pc )
>>> +            {
>>> +                bug = b;
>>> +                goto found;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> + found:
>>> +    if ( !bug )
>>> +        return -ENOENT;
>>> +
>>> +    if ( id == BUGFRAME_run_fn )
>>> +    {
>>> +        void (*fn)(struct cpu_user_regs *) = bug_ptr(bug);
>>> +
>>> +        fn(regs);
>>> +
>>> +        /* Re-enforce consistent types, because of the casts
>>> involved. */
>>> +        if ( false )
>>> +            run_in_exception_handler(fn);
>>> +
>>> +        return id;
>>> +    }
>>> +
>>> +    /* WARN, BUG or ASSERT: decode the filename pointer and line
>>> number. */
>>> +    filename = bug_ptr(bug);
>>> +    if ( !is_kernel(filename) && !is_patch(filename) )
>>> +        return -EINVAL;
>>> +    fixup = strlen(filename);
>>> +    if ( fixup > 50 )
>>> +    {
>>> +        filename += fixup - 47;
>>> +        prefix = "...";
>>> +    }
>>> +    lineno = bug_line(bug);
>>> +
>>> +    switch ( id )
>>> +    {
>>> +    case BUGFRAME_warn:
>>> +        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
>>> +        show_execution_state(regs);
>>> +
>>> +        break;
>>> +
>>> +    case BUGFRAME_bug:
>>> +        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
>>> +
>>> +        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
>>> +            break;
>>> +
>>> +        show_execution_state(regs);
>>> +        panic("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
>>> +
>>> +    case BUGFRAME_assert:
>>> +        /* ASSERT: decode the predicate string pointer. */
>>> +        predicate = bug_msg(bug);
>>> +        if ( !is_kernel(predicate) && !is_patch(predicate) )
>>> +            predicate = "<unknown>";
>>> +
>>> +        printk("Assertion '%s' failed at %s%s:%d\n",
>>> +               predicate, prefix, filename, lineno);
>>> +
>>> +        if ( BUG_DEBUGGER_TRAP_FATAL(regs) )
>>> +            break;
>>> +
>>> +        show_execution_state(regs);
>>> +        panic("Assertion '%s' failed at %s%s:%d\n",
>>> +              predicate, prefix, filename, lineno);
>>> +    }
>>> +
>>> +    return id;
>>> +}
>>
>> ... I can't really spot what it might be that comes from that header.
>> Oh, on the N+1st run I've spotted it - it's show_execution_state().
>> The declaration of which, already being used from common code ahead
>> of this series, should imo be moved to a common header. I guess I'll
>> make yet another patch ...
> As mentioned above. Not only show_execution_state() but also
> cpu_user_regs structure. ( at lest, for ARM & RISCV )

Do we deref "regs" anywhere? I can't seem to be able to spot an instance.
Without a deref (or alike) a forward decl is all that's needed for this
code to compile.

Jan

