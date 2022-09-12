Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0635B564E
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 10:34:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405563.648014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXeti-00063c-6q; Mon, 12 Sep 2022 08:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405563.648014; Mon, 12 Sep 2022 08:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXeti-000616-49; Mon, 12 Sep 2022 08:34:30 +0000
Received: by outflank-mailman (input) for mailman id 405563;
 Mon, 12 Sep 2022 08:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oXeth-00060s-2g
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 08:34:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6c6c751-3275-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 10:34:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VE1PR04MB7312.eurprd04.prod.outlook.com (2603:10a6:800:1a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Mon, 12 Sep
 2022 08:34:24 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 08:34:24 +0000
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
X-Inumbo-ID: b6c6c751-3275-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPRIlbnOaD9hOu0OFdA25+Nj06aO3U95Cf0ljKYuU93Pd3n7l9SdTjerVmexeJaYWXZQzqd5LxrRomdbTh/tOrMek5y6pKTmxywqtgNzgk2bFpvPvGuAbeqWAAhSVeHmUFMA2zfP7bp9vbHQxirlR9KS8PiJpICbz+LbdZbpGSrHDiKJSIjYIBthr5QUXGSTHu8pcpsPMvBrBaqPlXs2dIyyQhxI6KZv1tDGGSfeeIRw9SG0DgdUPbqfroi0R4zeT9BUoUlcToDCMhkgLH4gZ0+/kAoZ2r1TSdPuHUBjdYTSQkFxskDPXgwfLv+XAMsyNE4U8O2Iwkhwo7LyFUULUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SwAjpLWz7zLWGNC8h48U8N86qrSvD1eKwMZ9h40wuSA=;
 b=X23Ui/s4FbGPjSc6ODG5ExP8yC3gQ8GcTGp3xrkIK72w4eM0g4Rxt+XMljhzWHt19qPfDfy4MaycTzx7hN2MrcRllulD+ppi0wcn2ZRAgB1B8++1KQOFgQioh0tg3O/X6Y2Vv3R66UkRyYvqRcDcwhh66IqltEDGpHvHMpDUWGYnPn7Vz9jUni9gZlrimZzyTUwY/g8SFzaEA7MHRp9EZ+5KvDiekBXV+Cfx1Q3EWTq+93C4RDCG+Y3UH+J90zAYzKhKbjrMON1YZ9w6O1MA2vnIQXTdg7jTPLRrF5mmvgIzYV1yKCyWa4MiOIEW2+hGeM3sweQnQP7muPt9J/au9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SwAjpLWz7zLWGNC8h48U8N86qrSvD1eKwMZ9h40wuSA=;
 b=2YTfELbXWYwWM4n+X+1CMa4z8/MjRd7m/soLNesLr8C98jZVXol1jyohCYKNXmz6n4oM/VaGtm2U/HyORF+BeqZOeTkpD8z7xcjUXTi8VmC+hmqTu4qlU6oQJk9p4012HHawDDv48WffROVjrv4MCQ5Tvhvx4DOAxt05Z3TpRhCtzTGTNYDNABaxUsltXObRMJdKsHGSMCjXWPPolLvEgzHvSXU/WWJIz6HPJk7rYylo9w2E53CuI63guyX5wPcsROgCpR8a6PqP2HY0+HhCUEMMJ0BhX3HpNIc2SftoscEEkWTxfum4g1Bf258kYiNvGu4jhH7XmI7f1vnWQxmnuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <021b2bff-6a64-337a-ed2c-98b657e4f9dc@suse.com>
Date: Mon, 12 Sep 2022 10:34:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] xen: add domid_to_domain() helper
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220912055356.24064-1-jgross@suse.com>
 <20220912055356.24064-2-jgross@suse.com>
 <f1f2b4a1-c8d5-a481-1075-0227877dda8a@suse.com>
 <28e13b17-1296-62e4-0dc5-867b58f40ba9@suse.com>
 <e65cc75e-28fa-906c-c7c1-982d7e573b00@suse.com>
 <5893a2c0-f01d-f097-16bc-2ef14a1361f8@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5893a2c0-f01d-f097-16bc-2ef14a1361f8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VE1PR04MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 59f5e124-1658-4470-d83b-08da94999913
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iYuJTrrURm04xvjruyw28q6HOsxA8QQmbyRdngQLZnEW7MokFB61XESNAeEt9mN5caPQGP3xHokTRqr4qUIAWlzITEKfhfF73Y0uyc+QC4Cs/yvt25Kv8/nxma9U694s8QTvZBJY2C2T8TmOA078ZeVx1DRqx0Gj/B43tQveWLgaSU/tZ+fkVOhPEJPxDhezRmZGxW2zaEHH1sSQ6b5db9Oml9MBEsuYSu9xH+NcTOgdhs0BwBNDFylu6AEbr7p50uDYoM/srHmELhv7kyZB08OCIvajHMYJIiAw0CMNMl9kzdO5KtXr435e5NP9HH06TE8g09SDPsuC0biA2rmXr4r12gQWL4Hje/jn/k3L8cLEFPkhd5DqIFl1srj19S9vA66E4NxdarGWY1jLkJkIWB8d+CTZ1o5xooRKkLqsmMZ6YFKtkjHCnrruCv6qvePP2tUQfeOdtXo5CVJtSnIIvvGF8SizgZhG0ZVwpIywgX/pb69nCOazliGNO3vvj/5neFwVgizXi8UzTsC5HHcvm/iN/ITickkQ5fdBzaxHNjDABPCtTHDYUSRFhYY23y+MHXYHMNPi5OpIemI8aK6jo2v8vbl73AqgkDJnEz9zTYmdiA5BQd1aE6Patn1gDkcdDQrS+Flk2PzT9zrWHOfBabZXOSIqNzfBXG39GAKZ9AERIBhtwhJ1fyJEIop0NG2lQZeQb2oPsrCUY0/sUAKJSrsLCZAKabx9x1fKOqYdbVhkGF4mEtxBZacvw4MZjqJO+x4uPWuvmyB2zkN6KdjWpzP+u1GFwMLkzC8JKTTCNjY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39850400004)(136003)(366004)(376002)(86362001)(31696002)(66946007)(8676002)(38100700002)(31686004)(66556008)(66476007)(4326008)(36756003)(186003)(83380400001)(2616005)(53546011)(26005)(6512007)(478600001)(6506007)(41300700001)(6486002)(2906002)(37006003)(6636002)(54906003)(316002)(5660300002)(6862004)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDBXeVhScjdHNVNXYUJSSVBQMGZLUXptaCtLckRQa3FYTVNpMDF0alYwZGwr?=
 =?utf-8?B?Z1MvVFkwWWs2KzNyYjFZRjNqOTd1QkhxRlRGNEdiK2pvZmE0UmVvMkE3b1FG?=
 =?utf-8?B?SmpVZllOMTVqQXBGK3Vidi8yaFg1Nk1ieTdGSEJrOEU0ZUZKK0VJVkE0UE1E?=
 =?utf-8?B?S2FrMGRkeng5RjIwSVZHenNMRWl0MlF1VU0zSmhiQTdSUkcvT1ZnYVFGWVNH?=
 =?utf-8?B?bHVveHlOekhyVzVHZlB0bTJxOXo2dkcrQUJEcks4eVlsZ2h6UjM0b05lVU5E?=
 =?utf-8?B?Mm1CNURTQ2poN3ZHQlAveTJ4WW1hMkRTQnI2blVVbmJBQ0dqYkhWKzhrb3NW?=
 =?utf-8?B?UGpBUjAyZ1hsUzNCOTl1M1hVb0hJTjBoU3pWL05lMEI5RmRJdlZodS9LZGZw?=
 =?utf-8?B?VEVhb1JjODkyVmVLSGtLUFFrWmRGMVY1ZHk1OWZQYzhtKzI4Vlh3Wnhra2dQ?=
 =?utf-8?B?b3gwYVJxSFcrNFdYNHBIUVRMaHduamNyMkFBTS85MlhpVFAzREUyRjk4NkFQ?=
 =?utf-8?B?bUt5L0wzOHVHazgybGV3cFJmekxXUzdGeUtsZS80RXdVWTVMaE1ySkY5UFR1?=
 =?utf-8?B?UHQ4cmk4M0Nsd1J5YjUrRXdrL2Y1SkQrak5QZWZuMG03dnhpTXVsdmpjUkdF?=
 =?utf-8?B?UERPM0NrZlBWL2J4THl0NHBZRkZWSjI4emZZNUFpY2x6bElJU3dRS1BMcjhz?=
 =?utf-8?B?SVhoYTNJMHNVcC8xZVA0ci9KY3lxaks4emp5eFBhN1hUNEUrUlZkcFcyZHl0?=
 =?utf-8?B?YVNLemZDRFNHbjY3eW5uaEtIb3dCR1RndWF5MzdpY0NyMFE3anl1RE1va3BS?=
 =?utf-8?B?OTZIbk9DeWFQK0kwNkNJRjIrMTlEcmRCcFA2dG1RekgxSGtwMUprdFRmR3gw?=
 =?utf-8?B?ZS9UUHh1Tk5icjdDa0VXVk5iRjhVUlRKcjd4cnFUVUlhSExwRzlHNjAreGp3?=
 =?utf-8?B?SUJodWJWc3BsYWxJM2xWRGxBcitiWlhxVk9JbjYybG0rYUd4dDR3MklFbVBP?=
 =?utf-8?B?aFVTTEYrSWhFbFpnZU4zRVo3VE05UVNpU0loQkpLSGF4eWZSQytpbXQ2Uzdw?=
 =?utf-8?B?OXlxcTBTUGJpS1V0eWo4cVZSTHRCR1FhMm9qbUJsaWtEM0NCckF0YldzT1pF?=
 =?utf-8?B?RkFSWEUvSWdSM1oyeU92UFdqNnpmcFJYOGVCeTBJaExCRU93eW5rakZKaU01?=
 =?utf-8?B?c3lGRkRiTW02SVlleU1uNXBZRjV6cTlWZTNuSVdqajIvcG1mNy8yNzFmU216?=
 =?utf-8?B?Y0NsNTQ2dGtnVzU0RkdlTVNJOHhiT2Y1SFBFc29nd3diRXM4OGw0THVSTzFL?=
 =?utf-8?B?UkVZWmltN0gwTE9hVFpBMmxYaTVya0FTWkJGZnRCTnF3cWJXL0I2R1MzbFRr?=
 =?utf-8?B?Zm1oZ002RjZjSTJUQTRsaklJZVZMVnM0KzBuZjVFY1A3eWFTM21wNTVJNUtl?=
 =?utf-8?B?RWlFYTIyUG9LQ0RTNFdYdHhkRVFvaXFJWS90MjRjTkh6UHUxVnU2aXZKQ0lL?=
 =?utf-8?B?NUxaaWVDVkxIL2tTQzdvaVFGU0ltUHBFS0FNQzVQYzJETTBnbmVydzh6SmVo?=
 =?utf-8?B?d3FOcFBwRXN1bmRxdHlqdVBXTUJJbWlxQm1SZm00VTZCdFFFK21oeStIeXFS?=
 =?utf-8?B?dGw3TXFJTUV4OVFCMlpEN0Y3eUVQbHlaNmw5dis0ckJGaldMcDVzRFFtN3hv?=
 =?utf-8?B?c2xlMG9sSDJjcmxnd1hOVzJFdDI4akJiZHAycENxNkhNOElMbHNTNGQxbGtB?=
 =?utf-8?B?RzA5eHlrbjZYbmY4RkQveXR3bUFpbjBrd0VUc0NrekpMY3drZmQ5a1NrejdF?=
 =?utf-8?B?VmNjWnlRQjdxOFdxeEpMOXVwbS9TWXBLTnNSRytpczRINWIwcUZ5b1pwNUQ0?=
 =?utf-8?B?bnQzR1ZNNDEvUDdlNk9CNnJ0Zm9INGtNTFBjQS9sVVU0eWNHZ1g2U09pa1U5?=
 =?utf-8?B?bjFOU2Zvak9pQlZidUdqd1hLenNTT3R3eUlCbEZjV3NaWklRYzZ5Q294dDhw?=
 =?utf-8?B?QXBuU3dHTjNWdVh1eXROMFpFQWpjbkNaSkM0QlExT0hVVm14a1Rzb3V5TU1O?=
 =?utf-8?B?WVNZZkxJTTgxNnVSZ3duaFJaSWJLcUxEMWV4SnZtTENWU3lFeDQwb0U1YXBh?=
 =?utf-8?Q?ZhZmyM56umyFKwSFUodvhvS9q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f5e124-1658-4470-d83b-08da94999913
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2022 08:34:24.7343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XcsutJZQMOXz1VEeUGiPWxE9VxeD5W2hPycY76uc1T6M+rU11fEMsHiyLSWpzayicrKxXXKZi0qG5avhUZ80Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7312

On 12.09.2022 10:33, Juergen Gross wrote:
> On 12.09.22 10:31, Jan Beulich wrote:
>> On 12.09.2022 10:23, Juergen Gross wrote:
>>> On 12.09.22 10:19, Jan Beulich wrote:
>>>> On 12.09.2022 07:53, Juergen Gross wrote:
>>>>> Add a helper domid_to_domain() returning the struct domain pointer for
>>>>> a domain give by its domid and which is known not being able to be
>>>>> released (its reference count isn't incremented and no rcu_lock_domain()
>>>>> is called for it).
>>>>>
>>>>> In order to simplify coding add an internal helper for doing the lookup
>>>>> and call that from the new function and similar functions.
>>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>
>>>> I don't see an issue with adding such a helper (responding to your concern
>>>> in the cover letter), but I think the constraints need to be empahsized
>>>> more: We already have get_knownalive_domain() and get_domain_by_id(), so
>>>> how about naming the new helper get_knownalive_domain_by_id()? And then ...
>>>
>>> I explicitly didn't name it "get_...", as those helpers all increment the
>>> reference count of the domain. And this is NOT done by the new helper.
>>
>> Hmm, agreed. But domid_to_domain() isn't expressing the "known alive" aspect,
>> yet that's relevant to see when reviewing new uses of the function. Such uses
>> aren't likely to make the reviewer go look at the function declaration when
>> the function name is pretty "innocent".
> 
> Okay, what about domid_to_knownalive_domain()?
> 
> Or knownalive_domain_from_domid()?

Either would be fine with me.

Jan

