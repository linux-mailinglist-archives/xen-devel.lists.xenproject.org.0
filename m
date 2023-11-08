Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5567E54FA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 12:20:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629267.981341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0gat-0001a1-AX; Wed, 08 Nov 2023 11:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629267.981341; Wed, 08 Nov 2023 11:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0gat-0001XJ-7w; Wed, 08 Nov 2023 11:19:35 +0000
Received: by outflank-mailman (input) for mailman id 629267;
 Wed, 08 Nov 2023 11:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r0gas-0001XD-9t
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 11:19:34 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b085c285-7e28-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 12:19:32 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8155.eurprd04.prod.outlook.com (2603:10a6:10:24d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.17; Wed, 8 Nov
 2023 11:19:30 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.018; Wed, 8 Nov 2023
 11:19:30 +0000
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
X-Inumbo-ID: b085c285-7e28-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AI21flVfNPgCWL5lzCH+p+tH0GgUMemDfqairI9dran7M92YTV748/DfFC4GFKJf2p8uXhSlkhWy0Ft1MTnL9+cVvSqsVveiDBvyWJpHmRoofy39LLNSuHQJu4lgA90xuD6RCAqjPflilF7MZEeUUlefSmxYRTJySyn3aLbEHt2xi71HdQy6kqMDniBx8Rr/tfHmtM0MRD8BcFJN7WnOPikhfX9PVWyzkbflH42/IcpX+UtbnHvYd3huH0vM8LGQ7DluvIDOamys2A6qvrghKr6XFqvIE68DhsHQvI2nxiLc1YudhlJTgbmXYTw0qcZCD7ogRFeBuUhkhC2TXWW37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPwGrlmT1yZA/HeLt1AaT2UJDJ1p9vKOM1seUBu/eXQ=;
 b=QJlQh//JEIZSjy/uyWfZ7e/bX9GQx18C1g6TNuWNNwdkXk/LHmvtaHNhERWAoXrB1TvN58EYZSkUPadLU//8yJT61yUuHe0VnFw5nnZT75QCau9YWg9dZTvOfQLn4wz/+YwO23XZuAsyRY+BbWpMmUz1ZYYfKs/8XxNxcFeS8umMw4EwW5ubM9SDhZW0KVGfuuUj6uqNKfYJ7DQGic0AunGpbYeTzfLT69AanPaQrC4hzuqGNAGjGFYLsgLkdxhpqLMd4V2f1fu7/+P13SXyvDyJMmJ8qT74oXWg9OO6R1GyEZKzQ1Wo05tFqGSQZ2IL9zILIdQzPAJXJrhgN8hhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPwGrlmT1yZA/HeLt1AaT2UJDJ1p9vKOM1seUBu/eXQ=;
 b=pX1UnqbBqAYs9mtGiqgf+m0Cu27I28i+gXuGj4GXTzAa66DS1GRp765WgvvFkRNWlApvmCbl3KyW7cABlZTEFfmir4Mc3aLaM0O5uehjAjYVhlnxwChztCmthhTmtwNfOmw5sXWP26wnwoC9ajAK3lTxZDvYJSPZdAsc0ZXf80SiiRO8tIzW4n9zw5Vatv753eV2gCKcq/aHlzabO/enHzPBKUZgduMPFsUhY1ZHWWR4RwB2WRgWItHsSXUuBwLHp4/PMMuUgnhYKh5AFBdzv9yAfdXtHh3RT0+JO1FZfwLGy9puYku4BqfE2X9sXq1CMDXvKYOM64vCldZfCk2YAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2c8c246d-caea-5c8b-4a2a-83248422c48d@suse.com>
Date: Wed, 8 Nov 2023 12:19:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
 <d67ec7e2-a606-ed62-150f-08e3c1c9aabe@suse.com>
 <44df74cb532bfb9642b1c8752ee8c0d6@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <44df74cb532bfb9642b1c8752ee8c0d6@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8155:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1f9722-58e9-4dc8-7b57-08dbe04c9375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nnHEnWYnyGz99puMFajRBLgaItpkMX++dm7tLw90Z6x7wrsBn92Cs66eFSLS9f3KE2iVG3+YtSrhq1+i2HrE8ZGnMNpSFUB8w+r3+V/SiPf9ANc5fT0Cw7nAjAzpE8i5MyhFzI00rY5xPNdFWxRBRZzsHSSVlQbheu6uuaIx8RSpW1NsQJKAUD5AKhlmCB8z5i/Yc8XjhFaY3HyW5Jk41uJml7JPST9Tehle7Hqy5iyrliyc6GFO2497rlwzcwcivc/xk2KJUTgD4ZvTHibHu+/aAAytI96SghURVSkPvWD+qD1oHUfCDObCsnDXJ5n2WLq16wV3kSKuE42TyFh+zcLjiq4LMikhAV0B2UAmFw6pyfklDSOG+xJ5ceqNj2bVlfa+uE7Omuf/pIkH9R6nwyD9+PTSmEwck7cLxZv3h2B7hdX6B6xj3k6pe6gMrkRlBXnPDJTB4HJpbJ5V+xD9lBZC0FR86veT/v6BtbsG8OsTPWuadMxaenOZKVZkfKjXhFjTXarvUjlf5MsUeLmpRBrFoCs7vDehQqy1akgMaTTaKYm+/zyzZzqVMfOAjeaUMGmNricp3mKoEAsqnMILCyDmcIejDNTNZfsKLb/LJEAMzaj6GlNhB2DPC+auXY+inHBaM80ml76nWhYguRrmmQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(86362001)(6512007)(31696002)(38100700002)(6486002)(6506007)(478600001)(53546011)(8676002)(6916009)(66946007)(316002)(66556008)(54906003)(66476007)(4326008)(8936002)(36756003)(31686004)(5660300002)(41300700001)(2906002)(7416002)(2616005)(83380400001)(26005)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TDM1VmxEWUpvZ2YvdEw0bUlVa0hQd1QrUGRTOHRYVkhsdFdWbHMwQ0QxSzB0?=
 =?utf-8?B?S1lqVXdpZGxTNm1peVg5dm9xa3NPOFc2Y1cxQTlHUlF0NUx3T3h1VVZETE5J?=
 =?utf-8?B?VGU0eitiRmRGWTIyTFpweTQ2SDNVcUdtYWRaWUtiVVFmODIyNEhyeDdPRzJZ?=
 =?utf-8?B?Wk4zWERnVVBOMHliaDR6Tzg3czRRTjYwYnpEM2RWNkhKdEtudHJjK2M2bnFm?=
 =?utf-8?B?VUI5cXBiS05pUkZvTmpTMEE4YXU0a1djL1d0WkVKYlNrejRMV1JUWm1LZTVO?=
 =?utf-8?B?a1V4L05tV1hUQ0JJME41Q2JPMC9vYWZwZ3NHeE05ejZ6YzVieE5uWlZRVnND?=
 =?utf-8?B?NXBiUlZCcC9oVjNYT01PbGJremtURDRqOTlqTWJiZEVtNk1Eb01hZEl5N1Vp?=
 =?utf-8?B?V3NvS1l1RDBxV294WHJ2OHV5MkpKcWF0cmdPNVhEYjhWVU1vUzZDM0xkMEVR?=
 =?utf-8?B?Yk5HMWNZeTZONmYrbDc1d3dLTitKa29ieHZHTThYWlk1N3loMEpBQVRUMEo2?=
 =?utf-8?B?dkNQTWdNZ0pGNVgwL0VPVlNKTHI1NVc0Z0dnWFZaTTlkcS9qcDlLeUJiaTNB?=
 =?utf-8?B?cERXWU5JVEcrUlkwK3FJaFRud0RqWFpuRHV3R29FelJqOStLMjBrNEtnZS9X?=
 =?utf-8?B?WkFDTnJQM0RpMkpGdGkzUFRGZEIzNkN6WlBjTTZuZnRyVS9CTlA4NlVVczFw?=
 =?utf-8?B?TFJOQmdFaHBYZG1lc0VUcCsvWFhPaTlsc3lMNzlJUGVhVG5vTEN5TTRSclph?=
 =?utf-8?B?YmRLd1E1K0NLNDRFaWNHMEYzSVNPYmhuWGxWb2MrelhXUmQ1eVpFRUlmNzNt?=
 =?utf-8?B?ZWhUTVRCZVUvNEpnYTA4N3dSSnA4N2V0TmhBTUhvZEsxbUlrVFAzbHY2SktR?=
 =?utf-8?B?eTNVMzg4YmF1VENsTWtYWGxMZGNZd3VSdUo4MkRtY2tSbEREK3VhNDZYZ0Nv?=
 =?utf-8?B?OWg1Qm9uNFU3KzBFdW5SOGlsSnQ0SDdSNlhBZnV3T25PMzZLMlM4bHVTbGxN?=
 =?utf-8?B?d0lwNUl0cWRONHIyTG9IaEpBdWpMMEoydmZVdU4xU0RydmF1ZUd2NG1FcUtE?=
 =?utf-8?B?eG4yd1BXSFJyY0dXS3Eya2dETnhtWkRYVjhIQlV4TjlIQUEzdE5JT3NRTDdX?=
 =?utf-8?B?bTEwYlBpNU03dFYrNmZJU3NmV1llSHlpaTVmTzdUUWdsUUZXMHRsRjVzSi9y?=
 =?utf-8?B?RVU5dnV6cHVkVXFNSGhGNzZSSGRTVVJRdnpiOWFBSFMxZi9lNFgweGJHTUpo?=
 =?utf-8?B?a0toVXlyRDhxVXJpOXl2bDBvTkdQUGlJVU5XK1lsa1daRldiTGFtd2Q3TjZo?=
 =?utf-8?B?MEtYMXI1RXVhZEk0REVCekEzTWE2WXlkbCtjdjNQb0tCS0N6SlMxbVJ6ZUtx?=
 =?utf-8?B?QzJYb2orTnkzQkpCS3FBd0tFS3BJSE85OW9YU0tmd3FycW9BcklaWDlzTEpJ?=
 =?utf-8?B?UURXUmNKdmMzamcwb1hvQmF0Q0JSZEh3ekluUjRvbUhuR2tETk1sWFZYbit0?=
 =?utf-8?B?QmhLY3dZdGFoUURyek0rQ3FqME9nZEpXeDVMOGIwUUR1aEwzenZ4NVlRT0Fo?=
 =?utf-8?B?blZUZkNWdzd1ZGZIUVg1WEdkMmhueVJGSjFuaEx6aXVLZWFZOU5tVC8vaEJZ?=
 =?utf-8?B?RzZub3B5STVmbU5FN0UxeDdXcitjaGg4SEJST2JzbnhvKzM5V205N3VYb1or?=
 =?utf-8?B?QWQ0K1E3Rm5ha0xQb3BlSi85aGt1ZGlGYjkycitzS0t1RDdBTy9WTGV4VHlV?=
 =?utf-8?B?VWJXUktHbjBWU0hNRWdKalpxZitJVXBFanF0NzUwSDJuWUovVFNmSzludUdn?=
 =?utf-8?B?YjR0YVBNN1JaQm0zWUcxT0RLR2FZdEVLQ05hb1VGNU9mTGl1bDhQaU5CWHRo?=
 =?utf-8?B?bWRnWEk4WmpHSVEvUy9XWUd2SDV2S3JockZwQTBiUFJ4Ujd6NG5PQkViMnFL?=
 =?utf-8?B?SkxqQVZqM3l0aGFOMjB1Vk5xSThyNnFVUzdFRzZvenRBUHB3a25JTWJRYU83?=
 =?utf-8?B?aXhRQS9icXk3aVdSeG5WUG54OTdqQUFkU0ZJRE4yZ2hIZkpsOW51RE5vZnVj?=
 =?utf-8?B?ZTRFVEg5Umgya3NjMnNRYnZleFZtT08yYldTd1JRRWxPV2lTOG15K0lRdlFn?=
 =?utf-8?Q?QGRo/+K1blbb9C8Ri2mz5FS4q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1f9722-58e9-4dc8-7b57-08dbe04c9375
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 11:19:30.0629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lf5Mta1hQXUewm/sRj+KCplyxtsSla8bjTXZugQuzJ91MN6VuCuRsfexlpmoLWA4OZYVfrA1EFBv2CAjsWBa5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8155

On 08.11.2023 12:03, Nicola Vetrini wrote:
> On 2023-11-08 09:24, Jan Beulich wrote:
>> On 03.11.2023 18:58, Nicola Vetrini wrote:
>>> Static analysis tools may detect a possible null
>>> pointer dereference at line 760 (the memcpy call)
>>> of xen/common/domain.c. This ASSERT helps them in
>>> detecting that such a condition is not possible
>>> and also provides a basic sanity check.
>>
>> I disagree with this being a possible justification for adding such a
>> redundant assertion. More detail is needed on what is actually
>> (suspected to be) confusing the tool. Plus it also needs explaining
>> why (a) adding such an assertion helps and (b) how that's going to
>> cover release builds.
>>
> 
> How about:
> "Static analysis tools may detect a possible null pointer dereference
> at line 760 (config->handle) due to config possibly being NULL.
> 
> However, given that all system domains, including IDLE, have a NULL
> config and in the code path leading to the assertion only real domains
> (which have a non-NULL config) can be present."
> 
> On point b): this finding is a false positive, therefore even if the 
> ASSERT is
> expanded to effectively a no-op, there is no inherent problem with Xen's 
> code.
> The context in which the patch was suggested [1] hinted at avoiding 
> inserting in
> the codebase false positive comments.

Which I largely agree with. What I don't agree with is adding an
assertion which is only papering over the issue, and only in debug
builds. So perhaps instead we need a different way of tracking
false positives (which need to be tied to specific checker versions
anyway).

Jan

