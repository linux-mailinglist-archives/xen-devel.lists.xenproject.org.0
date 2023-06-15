Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 297C7731B61
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 16:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549633.858265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9nyF-0008En-Ip; Thu, 15 Jun 2023 14:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549633.858265; Thu, 15 Jun 2023 14:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9nyF-0008BV-FU; Thu, 15 Jun 2023 14:29:07 +0000
Received: by outflank-mailman (input) for mailman id 549633;
 Thu, 15 Jun 2023 14:29:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9nyE-0008BP-0J
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 14:29:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9ff3fd7-0b88-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 16:29:03 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7942.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 14:29:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 14:29:01 +0000
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
X-Inumbo-ID: f9ff3fd7-0b88-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqhpgNxHS+jwEBdK6PSxp1iGBj/brM/tgy6n/GWpdpulJ1v+hKVApxgbbs1OzDAk1UThoH88Xm07Bp6MzBBYmqUJuok/aGJxcNvO5dZcbWRuBC5zLQ71pA0iO1vNz4CPdNUPiq+jWiFH1cSbv0FZo6CQPDoHutSfqg8YzNZVd1b0SLLPVsT3ChT60AKAMjjYxFow0BbN+TiWQbfjysFoAZq6Gd+gMivzH3WD1WQDu1RvBh5kXhr8d3n5gwbeLSehq63VXqej6CSpq9qZmi2uUwnOx6rBxQqGU3UT0/TNVx6F22baczXONWzOn8EKwclKRw67b2VQ80g27g3L24Nb/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mcpi16jFW5svy6wcXcRTb4Pq7ldv2xnKYnlaTHJbYrg=;
 b=DCE2l81wgo7yqAknsqJLlg10wYGK33HDFbvFQDxYeOPN3FN6RePOVhs/wboQsFS36pOTbLrrbOZkh54HOtXJSt9JFW1Itp4dszm7rEU1bE4IviNstbAJibVwlfHo5Y+An4Yo8IVbZuEr3iPJEtccsLcf/cmQ2jWReKnrMJJs3Fg3bu6SI89pRfSBOCLrN2+L0y11vkgv9ar4X3kfIDhcF4L0vEO9k5vJBA0xGX79Dn3mUztSTZnVt84AI8WoVRRByB2yiTthn6DaB+6xpEaZVDlXvPqP3vkg30se43XRzc2IpDFAdZ/evRtVr92w0N+jfE9xqkhuqEb/PpmbSqeurQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mcpi16jFW5svy6wcXcRTb4Pq7ldv2xnKYnlaTHJbYrg=;
 b=Kn7R+U8GO8RGp+3Cvx1l7YhePk1nVIxkGbnoejf/wkjLlY5QiRl6Gd7YLrS3XKTUx4X1M7g8py0xeOm9ri4qXp/B49xhnAtJAY9cc3Sp8Ri2AuxpdKx9pe0TizDlO6rWcQ6IwFgu3pX+yC+Ov7BuHelSzAhatbbzRkvrtnmbZMjD53orwDYUtkCl3V2ZYCCR21evEI4/s3rfrMQlqD2mm6+qI3HDOHnKRxUsFAW8HCwS4/qFkQstbqAdQRVRjqD4aR6yLPiaTSJTjeHJCiU7FBBi975NgQc/rI7aBWlM83iWzd1lHh/nX5k6C4uuGLMcRZIogOP/pdDAPik0zg2NRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d00571e-7f04-3cf1-dafe-05d811318e92@suse.com>
Date: Thu, 15 Jun 2023 16:28:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 04/15] xen/sysctl: Nest cpufreq scaling options
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20230614180253.89958-1-jandryuk@gmail.com>
 <20230614180253.89958-5-jandryuk@gmail.com>
 <194760c8-31fe-d0f7-828f-b8a637884989@suse.com>
 <CAKf6xpvoD2vVDzFU-VzXVTN1td0j-tN_VB7Z4z7ZfMwCWh+Tjg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpvoD2vVDzFU-VzXVTN1td0j-tN_VB7Z4z7ZfMwCWh+Tjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::6) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7942:EE_
X-MS-Office365-Filtering-Correlation-Id: 80dc4d2a-f08e-4f14-b296-08db6dacdcf2
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vnl7kxHFnEKgIREUg58mjLgGEiII+iV3JctOUvvglLTfPLFOegkmRygzTtQ+HMARN0OWbWXfMEQd1ndLKC6u996o/rMk/ri+lzertb/W3Rr+EfMzb8IYFNyUhsRDDXPOV14qmo55MKDmMkuVlvEqKMiK9UhXuaWuHaWGcoMAKugw2lJOL3lE+ihZeYkNNBrpBA4yDr31zULAtlIscCdpf8mwozvN9UJfT1eyJjdI1ALbrUXf5qxTZgQUOKtFigKIeLvYFq7NvH6sMgGhZ6g3YEj5/Wc0Oiu/PEC7QXbHuGwGNLBkDCM0IRKSgFQYkrKvnByZMOSs5Dl0DBXoFCm5DzCZ2UhBjv2xiTPpA88r4FSqLCf5IZDO7oCp02JqPqDAl3ERjaX5Avd2PC51V/3njOGY9sRQiARxjtbyQzbU1zTZzFjzS8O0PG1lTC8GRHZEYcXJ09w+c0ePT6Fr+/nyMC6E3zMQQdEXXPbi07E+wYD2sm4+F7s2raArNByYppphRv+d02hJQGldCdx9G5UW8sq2CybDDMhtmTcztCgz27r0ZGDkwYVJDE5ysXDF5ypWr1sHLmBFnjfP8F4o+QSEjx7PywG2aA4AU68MNS7SqzIq9bT1f+be4GtrHf2sqM4QRe/NKu8kMmwgUmsuJGmB/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(396003)(376002)(136003)(39860400002)(451199021)(83380400001)(31686004)(4326008)(5660300002)(54906003)(36756003)(316002)(53546011)(8676002)(8936002)(86362001)(66476007)(26005)(6512007)(6506007)(41300700001)(2906002)(31696002)(38100700002)(66556008)(6916009)(66946007)(2616005)(478600001)(186003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUc1ckhtZTFuVTU5MXBESGhOWDhlcUg1eEtXU2FORUtzdDZxNXU2TlFuRWRC?=
 =?utf-8?B?WG1qUmJZbmozMENsNWdoZWhhYW9tYVI1QkVBOExsOXZuUjFkeTQxdE9iL1Jp?=
 =?utf-8?B?TnM4a2FtZlVLTDNZUklhaHNDSnFLYm1wWk9qMk1iZDhNUGhTNkE3YS9zTHJH?=
 =?utf-8?B?dDlCQlZDZ1RjMXhJSm5ad2Y1ZXNTWllPYkJoRy81aWxCZS9LZmZtYXBKOWlH?=
 =?utf-8?B?SnV6NjZTOVhnazFiVEp3QndqNDR4WThBYUxianRYbUJHYkhXTXdBdEczVU1I?=
 =?utf-8?B?cnEwdjVrSDBGNmpXY0VMWGVEYmN5UWVUR3BrZkQ3ZVd0R1VEM21vTXNXMCti?=
 =?utf-8?B?T1hwdGozeEhwejg1dm5Zb3Y1MWp1L0hVbzRSNkxZMnNXYzdGVXo5OU9ORFZ1?=
 =?utf-8?B?NmYyZll0ZDdwWVRHbEsySGlNSVNxRUtmYmYwWWZRM25RMXZ2NC9sWVpzaG5C?=
 =?utf-8?B?d0N2S1VlelNNaENWTnFZa1JmVE5ZaVZadjQ5bnNGcGlJMWkyWmppR2lyVVNz?=
 =?utf-8?B?S3FkOTlBdFFOQTA3TXJWYlBFMTIrcVZWN2NZQ1JDMEJhdVIxQUNENUtVT1JC?=
 =?utf-8?B?dHRiNFF3eThrK3Rkd2xOUG9pRHdrT1F4bmlMUTA3SVpKMThES2FaNmVTcDlG?=
 =?utf-8?B?TkRZUHF6T3FGQm92S3BaR0NBVktJZ3pXSTBzS1BrZWJZanV6Ym1WaWR2NkdX?=
 =?utf-8?B?SUQ5QmpwN1pId2V4ZTFWSWZaeGt3WGZFUzI2VHJHQURxaEhvWUVrZzE3TjBY?=
 =?utf-8?B?eGVEVzB4MG04dzJtVmVrZVh4VlRsQzFLb2lkRWcxSURvMVF6S2ZzUUF5SHZ2?=
 =?utf-8?B?WG0rY01pbkJZTE1iK2xwRzZ2aVJmZkFNbThnSUM2K3BsbmIwS0RGd056NVFX?=
 =?utf-8?B?K2dXWWcyR0ZJTVlqakVBWGFBQnVOWXQ5dm5rcjlNNEpWWkhPeDV2RjBwaFp1?=
 =?utf-8?B?WTZndUhiODlQK0d3VFV5ZzNDVDgxNjd5ZmFldENFVFRDZG5uTXFMQ3o5L0hU?=
 =?utf-8?B?SGNJeE0yUUlLT2lObm9TSFpJRjNPREYwblZ1dUIxb2RINUZzRkw3c1dhT2dJ?=
 =?utf-8?B?c2I3RUozbEN1Z3UzY1JjWk0yVUg4T0pQNGpGenhmS0pPM1o1NTB1SnB5K010?=
 =?utf-8?B?cUdBY0JoMVdTSThxR0tTdnVVZ0tRM1E3eGVVNkdESmRtem9EZlo5Y2xvMVBn?=
 =?utf-8?B?S0lSWnNvczVhWEt5ZjMzTnBsNHhYVmcxV2NYRDhJNXlPWitoVndUc21WL2xk?=
 =?utf-8?B?NEFxaU9UY3RDS3lIdkd4anExZVJ3dGpSL0lIaXdRaWZUelZQaklKanEyMWhI?=
 =?utf-8?B?UVJ6R1ltdGJramgvUVppOWg2d052V1F3Tkc0Q1NjdHU4NU9OQXVSTlQ5UU9n?=
 =?utf-8?B?bkpXcFg3dGE2Tk1hTm1TSzNzQ3VDTEFad3ZJcmd6WHowdXIxYmY1VGx6dFhj?=
 =?utf-8?B?T0ZTcVlPZlNNRnFhYm1oZHcvdnlocE9OVGtZcW1XVTV5NGxObVJpbjZIT2pq?=
 =?utf-8?B?WSt2V0ZQbnljSDNPbTRyVGtURE51TDJLS1gyRElicFM5MEZ3QTFVYTE1Sms3?=
 =?utf-8?B?SUFCTUxFejQ5ajR1MEF4aVJmZUVVeTgxLzZKWllwdFRnUDZMZS84TXU2YzJ4?=
 =?utf-8?B?SjNJSGtnR3lCaGlYem1rK0EzOTNGUGNZenFCVUlWYVVKYi94L09JNG1NNm1K?=
 =?utf-8?B?MnRNcUhUUFZvYWI0VndsWjhTcFBsRWN5ZHRqTGRWYXFBNnZ4d0JqRjNDcXZK?=
 =?utf-8?B?dWJOeDVTSXQ1SnBha2dzUVRlZHV1L1VFc0lpSGFtVG8vVXdYOHpSS2d3NjFm?=
 =?utf-8?B?YmQzVlBWb3E1M0NLYU1aT2NpbVBLQnM5RW9wMi9Ga3Z1YWsxL2gybzgzMXcr?=
 =?utf-8?B?QlU0M1RDc3d5cnpxN2NRRTRSMmFSMVVrWXZ1NThpVGgzZUdyVEY0S2tMTlFC?=
 =?utf-8?B?ZUVGRFpqNmM2WmoyNEhTa2lwYUFiWlVHR242Q2txUitUZERrNHFaNXVBbzcx?=
 =?utf-8?B?OWVrdWMyaTNMYWk4Qkh4TU05a0ZNNUNOMjlzOEVFMXZMZDgwZ1M2WTF2UEkw?=
 =?utf-8?B?ekViUmVBWUJKNW9RNnByNWUzRnhpRzRuOVV1MmY0ZkdubG1wcU9FbmpoNTRl?=
 =?utf-8?Q?/Qc4OdgQBE72wnJx1/J6C7AHM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80dc4d2a-f08e-4f14-b296-08db6dacdcf2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 14:29:01.5053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+RsdJjgyncmbCkmvchVLAA95HfVkRirffMobtg9jGyej3uYvtwMi8SlVpiyL+rbJcocYDReLMvtFVWUwqlPTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7942

On 15.06.2023 16:07, Jason Andryuk wrote:
> On Thu, Jun 15, 2023 at 9:29 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 14.06.2023 20:02, Jason Andryuk wrote:
>>> --- a/tools/include/xenctrl.h
>>> +++ b/tools/include/xenctrl.h
>>> @@ -1909,16 +1909,20 @@ struct xc_get_cpufreq_para {
>>>      uint32_t cpuinfo_cur_freq;
>>>      uint32_t cpuinfo_max_freq;
>>>      uint32_t cpuinfo_min_freq;
>>> -    uint32_t scaling_cur_freq;
>>> -
>>> -    char scaling_governor[CPUFREQ_NAME_LEN];
>>> -    uint32_t scaling_max_freq;
>>> -    uint32_t scaling_min_freq;
>>> -
>>> -    /* for specific governor */
>>>      union {
>>> -        xc_userspace_t userspace;
>>> -        xc_ondemand_t ondemand;
>>> +        struct {
>>> +            uint32_t scaling_cur_freq;
>>> +
>>> +            char scaling_governor[CPUFREQ_NAME_LEN];
>>> +            uint32_t scaling_max_freq;
>>> +            uint32_t scaling_min_freq;
>>> +
>>> +            /* for specific governor */
>>> +            union {
>>> +                xc_userspace_t userspace;
>>> +                xc_ondemand_t ondemand;
>>> +            } u;
>>> +        } s;
>>>      } u;
>>
>> There's no comment in the header that this needs to mirror the sysctl
>> struct. Does it really need changing?
> 
> Since this matched the other structure, I kept them in sync.  The
> cppc/hwp data needs to be represented somehow, and it gets introduced
> in the same way for both later.  If this doesn't get the new nested
> struct, then maybe fields could be placed into the single union.  That
> would grow the overall struct and have unused fields for hwp.

I guess I need to leave this to the maintainers then. Still ...

>>> --- a/tools/libs/ctrl/xc_pm.c
>>> +++ b/tools/libs/ctrl/xc_pm.c
>>> @@ -265,15 +265,10 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>>>          user_para->cpuinfo_cur_freq = sys_para->cpuinfo_cur_freq;
>>>          user_para->cpuinfo_max_freq = sys_para->cpuinfo_max_freq;
>>>          user_para->cpuinfo_min_freq = sys_para->cpuinfo_min_freq;
>>> -        user_para->scaling_cur_freq = sys_para->scaling_cur_freq;
>>> -        user_para->scaling_max_freq = sys_para->scaling_max_freq;
>>> -        user_para->scaling_min_freq = sys_para->scaling_min_freq;
>>>          user_para->turbo_enabled    = sys_para->turbo_enabled;
>>>
>>>          memcpy(user_para->scaling_driver,
>>>                  sys_para->scaling_driver, CPUFREQ_NAME_LEN);
>>> -        memcpy(user_para->scaling_governor,
>>> -                sys_para->scaling_governor, CPUFREQ_NAME_LEN);
>>
>> Did you really mean to remove the copying of these 4 entities, rather
>> than simply change the way the fields are accessed?
> 
> Yes, it was intentional.
> 
> The immediate following lines are:
>         /* copy to user_para no matter what cpufreq governor */
>         BUILD_BUG_ON(sizeof(((struct xc_get_cpufreq_para *)0)->u) !=
>              sizeof(((struct xen_get_cpufreq_para *)0)->u));
> 
>         memcpy(&user_para->u, &sys_para->u, sizeof(sys_para->u));

... this suggests that some matching is intended, yet it's not clear
to me why then the hole struct-s aren't assumed to be matching / made
match.

> And this memcpy copies all the moved entities.

Right, I should have gone to the source instead of going just from
patch context, sorry.

> I suppose the comment could change to "...no matter which cpufreq driver".

Yeah, well, it really would be driver/governor then, I guess.

Jan

