Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C7364A48B
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 17:04:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459786.717566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lI1-0002C4-J0; Mon, 12 Dec 2022 16:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459786.717566; Mon, 12 Dec 2022 16:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lI1-00029a-G9; Mon, 12 Dec 2022 16:04:25 +0000
Received: by outflank-mailman (input) for mailman id 459786;
 Mon, 12 Dec 2022 16:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8fsB=4K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p4lHz-00029S-Co
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 16:04:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3ba8490-7a36-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 17:04:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9575.eurprd04.prod.outlook.com (2603:10a6:20b:4fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Mon, 12 Dec
 2022 16:04:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 16:04:20 +0000
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
X-Inumbo-ID: a3ba8490-7a36-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DOLH4dLQ5yTg2jb9+JxzvEGQXAJYc1SG9d7Up18EYikqHaiRPJ14lJnkNbVYt5szomCIG9EA2a5pcNGR2dNPXhntPRau5ggv/M1Qyn7+3BJIsPgC1MdtFygs9uQbBeVMfnlhNvQxo+OEEwKHpxho79/68L4ZAIepZSZ37Hqb7Zgb6t2Hojz9aQjzpnufHD7saLkcgHXw3lb/51aYsYNB+D0t4HNCR0baei/dggftmV4mvFI0LR48M/mJg4YvqEyh/osqR9g6DPoKWpg+vwmVJu/t9qMJiVnSxHwsHA82wG+kX3XcfOimG9q/vF0zW8Ml08J8GvThmaonGRLbfnxz/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2/D0Klcfmma0bx72GJde9Wxyl0C9StOThGNh4A0o8U=;
 b=K31VsWgRIufTFj5QZDBlZ312bAQWeuq/Jf7A6KhaxlB4UjnqSmKSPd9InlbBFQUVVcPqOO6D81QXLtj4VmocUstvlXtMSxJyiy13WmwSItT6ELiH8gsriqfaZCnuKF0J7BCI7MZPDNlWCmoGW1UD1zokxZ+QB+byjPLsTbRuJVBYfDjaWysCh7VXQp+reZZTjHq9MizLGhFZp1pOIQd9LXWVwzvX1gh9wTvfntW1PbLurOPYnHq+CdiyIb5R1pW5NB8h1+NlgjDGKNYsdPlBtXk83mB3N3S3irZ+cQfDJlr7CUrTlqO+K863PBsuGygLVZaKbLD6wGrFpQ6FyUzeqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2/D0Klcfmma0bx72GJde9Wxyl0C9StOThGNh4A0o8U=;
 b=tIbPIu2ZcRzlYKew7exd9fYT6MrK1AM4W7LtNI0rpd93Axw3SRQO1rTM3dFvE/R1RXk/fWYLouxCL6hqgA1SzbXWpVhaNYBsAfpsbXDHe6nF0CMAiI2nOiJGB7x8P8SBuE+cTxQRa9b1Qd+3Rcj7snK/NbpaPHq0YDZapo1ooP64k1mm1StYX0eFAKj/C6hUVroRUD9eDKcAOOKsPrpBw+BUyS0ji58K+sbwXExhs+lbgtjbeOwlMUOK7v3xrDvtLWUdqV+3WykwatD7z1kZwAHSi3E/c+IHhuYfpaenfSxUHTs+PdK5mQtP7ltqXwhmbggDA+6X8ThDkwwcUktLBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e15114b3-d30b-14ad-ab73-6a9cbf5767d4@suse.com>
Date: Mon, 12 Dec 2022 17:04:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] x86/ucode: allow cpu_request_microcode() to skip
 memory allocation
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Sergey Dyasli <sergey.dyasli@cloud.com>
References: <20221208132639.29942-1-sergey.dyasli@citrix.com>
 <c6676171-8cab-dfbc-4b18-d9c724588398@citrix.com>
 <35f9e529-35b9-0432-8e98-8b0100953856@suse.com>
 <CAPRVcuccXaLNX3suy1t+xD_kptnV2yLxoCN_193PF6Gj_FBD1w@mail.gmail.com>
 <b610b461-4c77-66da-c930-10def3138e5d@suse.com>
 <f980e5c9-b175-2741-ed95-43bbc643baf7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f980e5c9-b175-2741-ed95-43bbc643baf7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: 298722e0-c01c-41e1-d038-08dadc5a8757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F06Nx4gVCiDUsuRCGrQeWh8EQAUiBBePYKuyZWkhevzTeuJZgdsj1ZWmhWMtF0mnrSqnUZ6U6AbvYK/w13JDAUh5na/KlO5WjrAS8KNXEJzhEy/WCHKAzO4dwLn4iOC8+nwfrtPqmDAKbf4EeqgB2HrFyBCjFttb4lwl0QGLH8tXK4CV+tHg2s1BJLLnKf5uWS1zCSeacpw2ER0BNbokLviTIAi6d+lVq74iivyN5fViDu6Zh+THrEO29vIx3OoCPg4S78zffKfJ7GT37+o2yrZSzl0LFh4vydLnd584AbBClMT76lfCOdKc7FBkLKyu1plXbGr22R9eTDkVl4xYhO5FehzZk8VBcfnd6CL7rY4AtQhRLOq/YENZDpZV+j+m22YF88bexK2r7inhbQi3dAHipN56tEHh5QXxQrFtpKLBdcyQELFk9ktseTqC/8hT0CLO+Ob+5xc5hjB7EkkIm2CCirfsmoxFzSzA6s2r/qLxiP4/JMQEu5HzUSlIc1COFQQRP/eUfD8YaOA6XrdpTIYxHsgZ6CyD8bKmaOSn6gR/+5h9yj/3HxGBDFThMWti1W90k2YuBHQUQaTx0iK+pTEu3wzZQ6NVYy/DSmN63yOwO+ZYHxMAtO6dnFC2FMl+UaOEJo/wZ48jU1wdJw2Qbpbz0j4A4XbUcVAhYd5KyNk9x5gCp/I4ngFBPo/L2qF2QUiqJ/tlv/RXWztzV+FaWIEFPtkUPQwjrGYCLX2cRJM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199015)(36756003)(186003)(54906003)(2906002)(316002)(6916009)(83380400001)(6506007)(31696002)(86362001)(2616005)(6486002)(478600001)(53546011)(26005)(6512007)(66556008)(38100700002)(41300700001)(66476007)(4326008)(8676002)(66946007)(31686004)(5660300002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uko0M1hXa0tLQmlJMXloS1hXS2NzZ2dxQ0t0RXBwbFRjTk1vRU9QWVh4NnJx?=
 =?utf-8?B?UWtPWGdjQWdobkFLVWpXcjhBT1ZYWG96N3NKVHBqN3d0b0tuZ2FlVHVIV0di?=
 =?utf-8?B?cHdHbnNPV0tKd291QjZkQnJPZGJhZHRVTWhKd25aUzRlUXBFUkJOam5QNE8w?=
 =?utf-8?B?M0EvOGZHZXFUUVNsL3RucitYQU9hRzJwM2tONGg4Qld1VU5oVC9RT2Eva2xw?=
 =?utf-8?B?ZkVvQ3FqQTFDcW83d05lQ3A2WDJyajBaa1V6R3IzbGUxYVdNaDBCeXN5S3dh?=
 =?utf-8?B?NXNzT21xUXpaazlra09MYkJQZEZsUCt3OEQ4STBhSlJqd3N3RTd1QnRXYlRV?=
 =?utf-8?B?STZ3ZndBRkdUM3ZkaWFIT2RMQ1RXY3J0WEtnakQwUmM5RGd3MnZEQS9xVkxn?=
 =?utf-8?B?cDR0MHdSRlpKWnFnbWFxSlN6ZUc5TVRyeUNkTTJ2SWthWkdTKzJJQ3BzVENI?=
 =?utf-8?B?SHhVS1lzOFJMNlhrU3ZmZG1VMEZ6U3VXcGZOTmVOMmgveVNzNUFLSitkTW1u?=
 =?utf-8?B?SDN5b05xeitjNGR0YUhZaDFwMEVyVnV0Y3B4Zzk3SHIwMk40L2ltWDFkeFZC?=
 =?utf-8?B?RnBpNmh3SlBTbk16bDRDYkcwN3AxUEJMTVhjNEtEejVyMjNiR0R4bnk0WXNV?=
 =?utf-8?B?ZXVrOWpMNGtMZmJYRnJVMkFyWlY2MnJkYkJobGU3ZkpYaUpsbEdOMHY0bE9I?=
 =?utf-8?B?SEgraGZrNE15T0VRL2FHaFJBUFkrU2ZTeGt4WnY0UTB6bmN5UzJkM0lZMVFp?=
 =?utf-8?B?T1BMSWVPYTRSOGdteWRqWDJ4YmV0NEVJc1l4bjUxZUoxanU1bDJWdUhDOElN?=
 =?utf-8?B?Sm1XSzJEZ3dka09aU0psSFJnaW5XdHNLZG9ackpHL01rVHRIT0pZMGZOOTRE?=
 =?utf-8?B?U2FiMCs5bUx4V1pWMFNqSFNvN1ZzbE01NGYzM0FyMVhvSHhpL3lSTmVUSXc2?=
 =?utf-8?B?OFFtNlZ0QmJrSk91Z0Z5Qy8zNjRncitOOGd0MjVmckU4UG13SXJuKzJ5VDRK?=
 =?utf-8?B?bWR6cHRRWDZQVkRvSlpOVVZXTzM5dDlsNWtrWHlKektlRmVoT1luNzV1UHB5?=
 =?utf-8?B?MG4xYmM4S3hZK1l4RHJjQ2JTek1tTUJMU1JPd09FMjI3TVgvVDJuZmovWEZ3?=
 =?utf-8?B?VUZidHZQRmhvYktTYWcrTlUvblRlN3VxTkR0YTRpdXFpUHlFOUZHMTZOR3I5?=
 =?utf-8?B?dG9YYUplQzRUYUgwK2U2cnNJYjRPdjViSEI3RTFydHV6V3h3NjREdXNOZ2oy?=
 =?utf-8?B?TERPZ1hZcnBVeVVsSEhnMk01WVNYRkwxOTRkS05acy80L2FLZHE0SGNkdkRI?=
 =?utf-8?B?b0ROcUVEWHgvR0tXRjl3SUdxaUMwRVdNMnZ0RTZ5eFlsMGxiL0NkUmZxL1Jw?=
 =?utf-8?B?Wlp2ZU5BVHJhYWlTZDZGQWVvK1V1NHdGOVJSN1FJOStFMTIrV3J3K2FzSm4w?=
 =?utf-8?B?Q044azhuVTEzU2VIOWFlKzVnc29RTDBFdy9EV1dWMlJRWHROa1BsR3dYV3NU?=
 =?utf-8?B?Umx4R1hJc2VlRkJ3V2dSdUgwRUZLNVpUaEhkYVVnTks4Y29CQ2E1bXZnMW9W?=
 =?utf-8?B?a2hXbHJnNDVaeWFlUjFLVUx6b2xjYldEcmE3R2YyL0dFR3U5Mm9FY3dBZ0o4?=
 =?utf-8?B?SlNCK2FQNGROV3BXTUE0VytHWERGK0hFV2hpVGV6MkRGSE82eEovNjRFWGp5?=
 =?utf-8?B?MlV2OE00U2ZZbUl1TXZRQUtrRGR6QlZ6RERpdzR3YlRFU3dHZWZhN0tZdXFy?=
 =?utf-8?B?MEswckxxMmJVY1kwbitNR0hEb1cySEl5ZDJxNXNpejgzTFdBa3laSVJPdVht?=
 =?utf-8?B?cmhNZDRQNFhwWlJRR3VSM3BGR3N5WVprcUhVcXRjYndUdmxnbXRlc2h5cnJT?=
 =?utf-8?B?aUNRM3pzc3pybi9XeXlOclp1LzVaOWpSN3k4YTF0a1ppN2VHU3lyRC96aW9a?=
 =?utf-8?B?cFdVWkNKNG1HRWpzd3ZNbG9SMXVtVVhEVHJxL2x3a204THpQMHVGb1JTT3Vv?=
 =?utf-8?B?S0VOcWNITVNnY2x6R0Z3SHB2YXhBbWpINlNOL0ZZZ2ZRZGMwclhveWtETThu?=
 =?utf-8?B?VCt4QzdmbWhad0FtNXIwR0I1MnBqVlhiZVV3ZnZNRG5BZ1BIUWY4UU1Jd3hQ?=
 =?utf-8?Q?btQzuK7tsgopO6w5fVmV1QvYc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298722e0-c01c-41e1-d038-08dadc5a8757
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 16:04:20.3599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bC8izyTWHVFOiqM9UdGOfDjCT+xgx4dIsYTv8F7YQbNfvPA6z6dl/RPKflWh2fcniujQgrvQiS9Ea0cZ9/cVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9575

On 12.12.2022 16:18, Andrew Cooper wrote:
> On 12/12/2022 14:59, Jan Beulich wrote:
>> On 12.12.2022 15:27, Sergey Dyasli wrote:
>>> On Thu, Dec 8, 2022 at 3:34 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 08.12.2022 14:59, Andrew Cooper wrote:
>>>>> On 08/12/2022 13:26, Sergey Dyasli wrote:
>>>>>> @@ -240,20 +240,20 @@ static const struct microcode_patch *nmi_patch = ZERO_BLOCK_PTR;
>>>>>>   * patch is found and an error occurs during the parsing process. Otherwise
>>>>>>   * return NULL.
>>>>>>   */
>>>>>> -static struct microcode_patch *parse_blob(const char *buf, size_t len)
>>>>>> +static const struct microcode_patch *parse_blob(const char *buf, size_t len)
>>>>>>  {
>>>>>>      alternative_vcall(ucode_ops.collect_cpu_info);
>>>>>>
>>>>>> -    return alternative_call(ucode_ops.cpu_request_microcode, buf, len);
>>>>>> +    return alternative_call(ucode_ops.cpu_request_microcode, buf, len, true);
>>>>>>  }
>>>>>>
>>>>>> -static void microcode_free_patch(struct microcode_patch *patch)
>>>>>> +static void microcode_free_patch(const struct microcode_patch *patch)
>>>>>>  {
>>>>>> -    xfree(patch);
>>>>>> +    xfree((void *)patch);
>>>>> This hunk demonstrates why the hook wants to return a non-const
>>>>> pointer.  Keeping it non-const will shrink this patch quite a bit.
>>>> Alternatively it demonstrates why xfree() should take const void *,
>>>> just like e.g. unmap_domain_page() or vunmap() already do. We've
>>>> talked about this before, and the argument hasn't changed: Neither
>>>> unmapping nor freeing really alters the contents of the pointed to
>>>> area from the perspective of the caller, as the contents simply
>>>> disappears altogether.
>>> Despite my love of const, const correctness in C is quite a pain. I've
>>> tried to make xfree() take a const pointer but then issues began with
>>> add/strip_padding() functions and I couldn't overcome those without
>>> further (void *) casts which just takes the problem to a different
>>> layer.
>> There is exactly one such cast needed according to my attempt, and that's
>> in an internal (static) helper function. See below (and feel free to use).
>>
>> Jan
>>
>> mm: make a couple of freeing functions take const void*
>>
>> freeing functions, from the perspective of their callers, don't alter
>> contents of the freed block; the block simply disappears. Plus it is not
>> uncommon that some piece of memory is allocated, filled, and henceforth
>> supposed to only be read from. In such cases, with the parameters of the
>> freeing functions not being pointer-to-const, callers have to either
>> omit the use of const where it would be indicated or add risky casts.
>>
>> The goal being to make xfree() fit the intended pattern, alter other
>> functions at the same time to limit the number of casts needed to just
>> one. strip_padding() necessarily has to have a such a cast, as it's
>> effectively strchr()- or memchr()-like: Input may be pointer-to-const,
>> bot for its output to also be usable when the input isn't, const needs
>> to be cast away. Note that the risk with such a cast is quite a bit
>> lower when it's an internal (static) function wich is affected.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> If you can persuade the C standards committee that your interpretation
> of how to use const is more correct than theirs, and get them to change
> free() to take const void, then we can continue discussing this patch.
> 
> Until then, there's a damn good reason why free() takes a non-const
> pointer (nothing handed out by a memory allocator can ever be const, and
> it is never acceptable to free via a const alias), and contorted
> arguments about how its "technically fine" are missing the point.

"damn good" and "never acceptable" are strong statements, which will want
accompanying by actual technical content. It's not like I've invented
this "interpretation". But when I saw it elsewhere (I don't recall which
project(s) this was) I found it very reasonable, and hence I picked it up
to at least consider for stuff I'm working on.

Jan

