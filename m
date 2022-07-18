Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECE5578024
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:50:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369584.601019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOK3-0008Mi-Pm; Mon, 18 Jul 2022 10:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369584.601019; Mon, 18 Jul 2022 10:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDOK3-0008KJ-N3; Mon, 18 Jul 2022 10:49:55 +0000
Received: by outflank-mailman (input) for mailman id 369584;
 Mon, 18 Jul 2022 10:49:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDOK2-0008KB-3O
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:49:54 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2056.outbound.protection.outlook.com [40.107.20.56])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a7966bc-0687-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 12:49:53 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AM5PR04MB3123.eurprd04.prod.outlook.com (2603:10a6:206:4::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Mon, 18 Jul
 2022 10:49:51 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 10:49:51 +0000
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
X-Inumbo-ID: 5a7966bc-0687-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A57o0BaYKU1zdflGsj7AoP9Qi5GlfOdjnW3N/RanhW3i52w00lcZqLN4db32mBHfQKanbUevVyYYvdtpp33+sArSezl2v+4QQGiSrQsd1pSHbYxria5yZI0Kcr5QfGbmZhTmZ7zrPit3hHdopTnnafGdLBK2ruDG4jGWt2SfHgqmE+H4RHBdz4S3Ci9z17pDnWD0w0z3kZ5IZe4hT3xMwYdZ1X0bdsov736xQaGPl5ZO943m6nCHHA1i92bJ1nm1rIzz4vKg+1Xf1mYOam32spL8iRmxsofWFp/6AO9OYJrKn9jT6wwhLln4UcfGl6rQ3ePQa2CQrEZYuR7eVW5sNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBWRsFZWoZy+aNo07PP8g1OPAChz3TVdvcqm3dh3xbk=;
 b=eTXPRAUmDBKYmyWV+JBDGeK89qJ1M/tDAhguPAqiE6idTZYjraGC6GiehEeM96qdaKy98FA6u8xsEnxbCAO8Q6Y+dGCoCzVV/E6gzNcGnjoxrYk2lQz41ywbQm3M2CLxbdhvlS7ymEJs+drQvxntbXLFY/5y3IH/uR+1kPaSYKrYm4Z9tWAkMHWrpg1hfjZnuT+RDB/Y93XoMWIpIOFNfNBWWXVuLGgSebfO6g15V1fLLtRqJw6VSxsMSrEWMdNg0RZDAJJ43sJzdJZ3pcOpl965yJrrD2MTRUahl5AgxrA3qZ+LNO8TtgguXlBDf3KAhUDg14uCQO842wzy96ry5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBWRsFZWoZy+aNo07PP8g1OPAChz3TVdvcqm3dh3xbk=;
 b=bh/gxMaMrlc2J68/BROrgt4i4+btkFHxhVKrZ18zkWH9BdIKwBQ/lHGVApDuYP0oGODS2YzGLitax3eKe5EEJQ8wz0FWIUy8Ced0oMoaORQlbG54hA5UVYxHttes3cvcOZGmhy2h2yZ1YAJsmj0DptS2Oiox+DLQNXvEKPMSOtFqj4x30QqfnnFadBIg+fbO4m5foCG8sgbV2/ujNa+8b3Ygd2X7F5TBYkHlfqF85w9EXhv6PmlaVrCg5083ottZnNJQjr3JJr/n2gH1FS0IFTvp0vBKd6ioccXD1DLbLi9vEEGQnkt20ol5DoH+fztb8A9WNmmKsiUKttftEBU0TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <384fbde7-1aec-88be-7127-61b1f0195b0c@suse.com>
Date: Mon, 18 Jul 2022 12:49:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] xen/wait: Extend the description of how this logic
 actually works
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
 <20220718071825.22113-3-andrew.cooper3@citrix.com>
 <40b1ab24-5e94-ea2b-c9cc-6efa5418d283@suse.com>
 <347aef21-e6e3-3ab3-f230-4e01339c742d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <347aef21-e6e3-3ab3-f230-4e01339c742d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 905cedd8-5c20-45e9-c7fc-08da68ab3dac
X-MS-TrafficTypeDiagnostic: AM5PR04MB3123:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R3hGmtAioXUd3ysjG+OyRlnk75FGYuYZeZZbuc+o2FiL0+lW8I/uxeKMxqxN8FIJLTMFO6waA/TA9YZfLCrrO6P2JxhZnAA7RiTGm+JmHpdQtB3sdXk1461kDUuE5ylH2chfVEc4QNaaIJYIftdwOrPBpXmUzOw6Kd8CX4qAcagebHFOx+/Y9YR0C8QHDs3LMRACa8yhhW7zWSekTu3mmb6dnnshoCKyjfaDzvtDGVlrrr9C/eKGWgzXisoZqZZX6yNgEUTYr7J4g4f4kNsP+1RCD3C+hZhjYRFyhouPI3XVvv2ydbamoAG9LevauPpNQQh9ZmZYSdMP52DcvUWyAWutiPQfN1mv/GhKY5Yv6hN6ZX1kY1nj94tCAqfgo+8mgy7F6dfEFZdwlaRTvLK35V3lEQAJdgtoYQRCmzcz8hQwg96XfqWC5kgIHMoaidcWrrhuZ81spKJiNpQDzd1T6NgG7L0Nn06CR6dIcMpxnZcyhhDXTsSR5eDHFR1HbbasDGDZS7kRuMnyJ4TweHictOAhVDaaGMjPdoRjtErjvjNx65BGxUZpsENpUF3qFQalA8kC8SExlJX6tEC4uQOqojxV6MzXKdFkwtK8Ga+4hBgXFbX99HN/Ier3AN/ygztSMwK7NrCJHdg/4mk3OC6dKMibQ/l3Wg7pyeVCqMAEongk+VcRRKUeJApHSh0pOyBZOr4mHX4arv+JVzsAmFxo63YLfoOjR5PaJplXk0BZX6O/XHIoYgFcq2zN1vuBaHQvYjB8h4JeJQwgUBr36zhiHaRTCnuqvMH6/GEoNZ6UsrukzOKDw5xaX0SiGfkdUJLvVYETBv7jgSg3ZktHVtPZ7cNqhyegoMusPpq88hHhTVs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(376002)(39860400002)(346002)(396003)(6486002)(41300700001)(31696002)(6506007)(2616005)(6512007)(26005)(478600001)(186003)(53546011)(38100700002)(83380400001)(4326008)(2906002)(31686004)(8936002)(86362001)(5660300002)(66556008)(66476007)(8676002)(66946007)(36756003)(54906003)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlF5M21RN0sva0VaTHVxNldXMTVrM0dtOHRCY2ZLZmdWY0J6eU9YT0o1YzRx?=
 =?utf-8?B?QzJoYXk0YVpwYkx0TGl2VllKMUdEMGoxYUk2bVJYazlOV05WV25ma2tBaG5X?=
 =?utf-8?B?ZW55MUs0bHo4cDJuNEpQZjU5U0ZyR3lSeXZUZFd0cnhRNHdxTnRQOU05UlJw?=
 =?utf-8?B?L01RYkIwVkYzdmh6aGQ2OFhVb0pWVlpKdjcrYU9mQlBkdmovaEtWTkNlYzBJ?=
 =?utf-8?B?WE13eHJyZGxQamVibFg2WW9JNm5lcWZKbGtyT2F2dmhZTlpQWFFLYUtiUGVO?=
 =?utf-8?B?VkxPQUUwbHpmTVpZU1JrWUlmQk9yNzNqSHJLSjZzVStLRndmTzhudkNQYVh3?=
 =?utf-8?B?dkZrR29id2xuYy90UGh0RFBZekFjWDhnNFJIN2hpcVpmTXBlTE5qUkJFZ3Rq?=
 =?utf-8?B?VmhLYTNudEUzR3RKY1BKSk1wcHRpWGkxUXM0TEFZNytmSjNCMEUzLzZleHJT?=
 =?utf-8?B?akNFTm9LT1RSRmpqdFdrdTFDLzFScVloNEJlcXF4WUovRmo2L2lxdTRFaEU3?=
 =?utf-8?B?bDc5UzdkVnl6MWtRbjZlZzJTQWtoVjZXWnhqd3gvd3l6Sys5VHNxR01RTHB5?=
 =?utf-8?B?dkh0K04zNFRQb0I4M3BRNHg3QWZyWFhwSXcwWTFCTWtYVGRQRVZ3TWwzKzJI?=
 =?utf-8?B?Nnp4TUM3bjMwNldsbGNxNHdzdFpmVW1xMWt2b3duekNqelhoY09PeUJZT2VQ?=
 =?utf-8?B?WExGckNkRFJnNjdTeUVjV2htbHJEeTJ6YnJJY2VscDJIbXZwTUZCTkdkRHRL?=
 =?utf-8?B?LzlIbmhtNlRkQk8vdFBoekRIMDVsNzNZdEVrMEJZZkdNK1hXSEJXWjRsU3B5?=
 =?utf-8?B?ZVVjS3VBNXdsWUkwNWpKTHBrazdsNkZZcjJXOUw1QktCMnVmYktnOEZlWVJW?=
 =?utf-8?B?dHpjdnNDeXJFd2sycXg2Qjg3aVFHWkN4MUhoeVhIWDI3S0s0dDZnaDFwWUNj?=
 =?utf-8?B?Nkl3UG93OHEvdys3dGlnRld3OXhXQk9lN3Vzdk1EbiszS0VOYW5EcHU2b3BI?=
 =?utf-8?B?Rmh1TkxGbHZUNkVqT3kzYzdmeDBud1JUNlVWdndKV0J3aUFJbWdQVnZQd1Yv?=
 =?utf-8?B?bWhUKzJ4RStNOTQ1TDJYeVpSdkIyeUtDL1FycFpRMHBtR1Y5ZW5tL0VPRWlq?=
 =?utf-8?B?bU03VVVZMFF0MVE0eU0vN1VON2tDSnA5WkFaM1NtQ2kyL2FNMzFldGJ3VTE5?=
 =?utf-8?B?eHV1NW9rYVdDR3VWTHFidVNJVW1zY3dnN1VxOUtDMXZEOE10cnUwTnUyRHo5?=
 =?utf-8?B?UE55dzlYcmZ3VzA3RHdjZjBXOWo5RlhGQ29lbENoNXZEanUrOVB2N2pOOU1p?=
 =?utf-8?B?VXVyRkdYODE2NWQ1TFp5clVGMjNBNW0rd053Q2J2dElCeXNucE85NUNVaTFl?=
 =?utf-8?B?aktrZGRybW9xOW5ZZGVrRDQ4dDJLTWpLeUVqTFMrbUk2WjdidGtWVVQ4RFBJ?=
 =?utf-8?B?cjkxeitqUlVxSEpySEhROGFnNjFvRDc0U3UxQUNKOW45WFI0Q0JFbEdNNWVP?=
 =?utf-8?B?UVJYVDE4Um80U1YvenZSbmc0RHBodHUyaGZraFJielBTL2lYdHVzTFFuc1JE?=
 =?utf-8?B?Ym44dllGSkhiQU5Oem5rSUFHaDJuem5ZQUVhRjJ0bXVpQzhkbUFwL01tY0NZ?=
 =?utf-8?B?N0xlczNLRzJ1MlhrMUR5Qm16QWt0bE5BcTdRMHQ0WUNoZTcxS2FGamptTkdG?=
 =?utf-8?B?OUtZYWlWV0ZnQVlaRXMrbklTZkdsUW1TZ2U5OXNDV1pyRHdYWVp0WnM1SThz?=
 =?utf-8?B?ZUlyYU1ZQ2wvZXRiZEVOZzhMckNadm1mald0aGQyRyswK2l6RHU1NWZBWFJo?=
 =?utf-8?B?aVpaMDRuY05ZaitqeGorUGFNVUFUZm9QZmtvQzFReXhnQ3JtNGVlbXlHSk9h?=
 =?utf-8?B?a2VvaTBObHIra3h4MkM4TzkrMVBvWWlCQ0Fja0VBbTlFK0VnRVJTeDVJWWlH?=
 =?utf-8?B?MHVmbGx0eU82UUd0WDd0NS9nbVNncHN1U2RUakl2bEcyQ3cyQ0JpQUtxd1l5?=
 =?utf-8?B?aVVDUEtsVXpnaDREaE5RRXdRTGFyQmU5YnVBRmJQWVYxbkFaUFZGRCtBWTlv?=
 =?utf-8?B?bjJFNEJFYWwyYW1GNVprcFNLRlB4WVNhMHA5NGtpR21zMmQzcm96NTgxMmx3?=
 =?utf-8?Q?EEQJkGOLq8TSp/0z39jVuf1Rm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 905cedd8-5c20-45e9-c7fc-08da68ab3dac
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 10:49:51.1026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xT4ANC3Qa/+edAEc/OQ4BGXxYKTRmZH1SDt5LwTQk8LuTFpO/LUrE+jgCvbqNimFo8sJOmjSOe/7E3R31VL9Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3123

On 18.07.2022 12:11, Andrew Cooper wrote:
> On 18/07/2022 11:00, Jan Beulich wrote:
>> On 18.07.2022 09:18, Andrew Cooper wrote:
>>> @@ -199,9 +211,18 @@ void check_wakeup_from_wait(void)
>>>      }
>>>  
>>>      /*
>>> -     * Hand-rolled longjmp().  Returns to __prepare_to_wait(), and lands on a
>>> -     * `rep movs` instruction.  All other GPRs are restored from the stack, so
>>> -     * are available for use here.
>>> +     * Hand-rolled longjmp().
>>> +     *
>>> +     * check_wakeup_from_wait() is always called with a shallow stack,
>>> +     * immediately after the vCPU has been rescheduled.
>>> +     *
>>> +     * Adjust %rsp to be the correct depth for the (deeper) stack we want to
>>> +     * restore, then prepare %rsi, %rdi and %rcx such that when we intercept
>>> +     * the rep movs in __prepare_to_wait(), it copies from wqv->stack over the
>>> +     * active stack.
>> I'm struggling with the use of "intercept" here, but I guess that's just
>> because I'm not a native speaker.
> 
> "intercept" is the same terminology used in the middle of
> __prepare_to_wait()'s block.
> 
> It's because we have a weird setup where this is (now) a noreturn
> function merging into the middle of a function which already executed once.
> 
> I'm happy to change it if it's unclear, but I can't think of a better
> description.

"... when we go back to ..."? (But I'm not meaning to insist on a
wording change.)

Jan

