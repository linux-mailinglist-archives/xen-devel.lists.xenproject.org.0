Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68919592AF2
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 10:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387158.623291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVM6-0005tS-CX; Mon, 15 Aug 2022 08:21:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387158.623291; Mon, 15 Aug 2022 08:21:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNVM6-0005rc-9g; Mon, 15 Aug 2022 08:21:50 +0000
Received: by outflank-mailman (input) for mailman id 387158;
 Mon, 15 Aug 2022 08:21:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iVAg=YT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oNVM4-0005XO-Me
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 08:21:48 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2041.outbound.protection.outlook.com [40.107.21.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4df69c89-1c73-11ed-bd2e-47488cf2e6aa;
 Mon, 15 Aug 2022 10:21:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB7PR04MB4825.eurprd04.prod.outlook.com (2603:10a6:10:1b::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Mon, 15 Aug
 2022 08:21:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Mon, 15 Aug 2022
 08:21:45 +0000
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
X-Inumbo-ID: 4df69c89-1c73-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBH7yjBUv7ihrEkv1CrVQ0UqbDW9A/J3nhmEP+UxwNiKiQk66Ye+XNVeec2xXrGMF0nMFkYlwXPqQQJWV2QR4h9Ga4jNEliloMoz2YRFDcAnaBQNwfYHCE2uo8lNzK+lNyQJExxoRahh0kK+GxJEldBDsZMj1/brp/7vYCpq9Zjs9zwBpShYc6//D/4sh16vzmRtrmVGTAtOpPE9Vz+BTAH0+22UDm/QW52rvTy2GRNdaxMZ46qWhxBXthY5fQNe2Q0pitWo1taTysaLfQfib1OnwLnof+t+8QDe0s4cNmMJxCHHxdVGQBWu8u08iWk5Mjn+fzDtt6fWDfTT59uQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGteyt2N4vJhcIfIwaIw/lKsxnkpy/uYQKr1uq4J/sE=;
 b=P3ZxH05R57/5I4GHQu82oJw3GVd68rkUJZDgPsC1yoDidkObCGCGBTH3n/of0P0XpMHE6leQjwnjlFOyvbb2Al5/MGillH/10oiVL/df5sWoaiDOp70XM9k5lNwHFJI8FCJm3gL3xp1Fc0Rsg2xBlAqNNOhm8chOSirN1SqX6q/3BbqEUfio1xwVuKGEczxXSZlBPPW31/NAgbWxw4O/OCh4w4+lXCEAw3AJBR8ggTpyEu2LKhnEdODkBqCV+iaE6ENnYZfIr4Myp8U+iKZM9zUqXxqPfpCnMXqVzgoTi7vk0CX7wBk3WTUf/dI+pWXwPFswk8OF67pFI7P6P1dTcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGteyt2N4vJhcIfIwaIw/lKsxnkpy/uYQKr1uq4J/sE=;
 b=qDZSOvEZbnwnBs9c0uw55sPWpfShaz7sYetFavgqhliucVjMk+v1ZOPobCFQGY9FGvXDtLVQ8W9U6kAiXTn/FdMX7IQY3EZQODKFZZClihKnqJRR/AlmwXNxo8YJC/5nEgIOxYKQxQBee2yl8yOkKTJcRZ8/A7StTTn5dnJbOg2e5KV5gkI7QYZg0ZY+GlMLpzcGMJEElja0/WMXfnDI6cYffxdshizyf46qAeRu+9blCTbY+J7GTLbS7phGV8gs6K5AkhkXZnmD7YK7fERAUkbYiZScDxNDz0qHu3qzE8r5DxPJzOs0xE+k+Z3FsvhySNy9kY7DqL4dK6ZMig32nA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ff329cf5-689e-89f1-c82a-7df6dbf11446@suse.com>
Date: Mon, 15 Aug 2022 10:21:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/7] xen/arm32: head: Move earlyprintk messages to
 .rodata.str
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-6-julien@xen.org>
 <432ffaec-c537-0337-5812-18385ccbb534@suse.com>
 <94843cc5-919b-68cf-31d2-a8625d9342d7@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <94843cc5-919b-68cf-31d2-a8625d9342d7@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR0502CA0068.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::45) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da89b2f4-bf4c-491b-d791-08da7e973134
X-MS-TrafficTypeDiagnostic: DB7PR04MB4825:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jSQM+Sf/sohcqrObQJiUmnvh/mqij+fGhUTC3o3Nq7b5HqMalfqnpBUTUJg6wQ4Ljh3Y+rXpC7qaTtfj5eYGFyzLOiypx7q/GfC8ZkKzzXaK1p6Hio2/L2JFn38oJGZD+UO2nomjJfpfbHnXJYGEcZDkv5oKZqdYiDXVNDeXMXKXK2yeXmA4fCWbFbJRbUPZNRWWiwRU2lAjqd8IsEkgIRu/o4JGdloutKCL0Ryd2mX0GnTtzYeY2QGnXujEETg8aMBwBrfzo92GfwdONYpEGaHlqYaHe2MnFfjmWEgsn7LAeaIqy8Yof/P6Nv7Bn8rxyKcNnCCRtVFTMrzM+TSa9+b9P9kLmU48dLRNOmLaBfoRxRxCPZDJa9rVTuvlIdmDTQBl+fi1evArBJlH/MaXa8FHiVOkRSDqDxeecWM70lw0vyULElUV8bmSMF05ZymwNK77mA44Tc+foTtYxp84zF3BbnkjcFxF/ema6uw0yBkPk5onhUFWOlcPE2VyxV4yrnQ7VF79KC2/+ZeNkghNPiRwWlkcXkQ6IYj/K7Ahi848U1Xcc+2aWmPQfxfFGkXrV3hYf3SyfBZ1EUwsWcIPSHXwjOV/uFgZ3KkCd6ON7FMXMQXhOZSA00u1/NoVGjZz3JLiCq4Rlr9bcwe1hN7NLiliSNDtXG5At9lNfw3CyVYpq06iK71qh4YhLZyRLHESoi2lpbGviqUkBbXiPq++uv5TwWAe9xiyflVqjkjfRzChrktDkh2eodHvwK4R5IRK3aKG6Kaafhs61Aoy7Ri9i5+cLrWNAQNhU2vPKYERmUepC7ZYF9HUmSpGrfHc+vjxiKKaihtm2jDa0A+h6Wy2OQkcNcN9ytz4NslsRkgl4NI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(366004)(136003)(39850400004)(396003)(186003)(6506007)(31686004)(2616005)(54906003)(6512007)(26005)(53546011)(41300700001)(6486002)(36756003)(478600001)(86362001)(31696002)(83380400001)(38100700002)(2906002)(6916009)(5660300002)(8936002)(8676002)(66946007)(66476007)(66556008)(4326008)(316002)(142923001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dGVmN0M5Z2krdnd3dmZtamRmSnd5Q1lEYTlOZU9jUjFKMlRuNy94K1c2cWpi?=
 =?utf-8?B?WlUzWFdvLzlNeGhIY1h6a25ZMGNVcXVINUIwbXRkU2JTNVRiZFdhVFROcUEz?=
 =?utf-8?B?ZHJwSnFmaFhmaHA0K2pQdGpLTlJPMDlUKzB6TUROSkExazdtM3RsTXFsWHVM?=
 =?utf-8?B?aGhSZkhCOW1tTHFTUUV1ZUFEVzZkbjhEUkdmQzcvMnJuQ3RQYnkyS1F3OUhG?=
 =?utf-8?B?MVUraVBJRHpIcWUwSlJPQjdQUmNVbGZRQnhCY1JOcUUvWTN1SDI2WTlETkxt?=
 =?utf-8?B?ZXVBLzV1YUNDbWxvZUxZN2RSZDlWeGdZN2JFekpKTU5Xa2lzU2UzM3hEak9q?=
 =?utf-8?B?Z21VRHVmM2h0VTB6SWJCR0t0Z25BMXVsSVp0cTdMMVR5WlBNOFRJWk50SmU1?=
 =?utf-8?B?Rm5WbUVZWDVLU2tJRTZhUUE1c1l0aTFWdG9EQS9kSlJ6NGMxd29TNXdHdEJs?=
 =?utf-8?B?V3RGRlBBczBURjUrUVllUGlzdlV3ejZ2NWFRSm00UXB4U0VKeVg1YThXRFhK?=
 =?utf-8?B?cm10bzYyVWF1eGVEUnN5VU9FSjBScVYzR1BteTN2aEVZTHdEZlhNcmdNeUhj?=
 =?utf-8?B?MCtzaTBkSWhTMlVXcDg3R2d0Uy9qM21PbXZZUW5aRFRIMWNUeld1b296YkdD?=
 =?utf-8?B?NWhiTFB5Tk1FSVcrMCtDdVhsUmYxcHVBTW0xQVhxVzZXdlFHaGp4UGNxZW9I?=
 =?utf-8?B?OTVaUVFMZGE1azlyZW1EWnVSRnRvelA4ZXp5Q2Fqc2JXbDUvY2ZkVzVVS1J6?=
 =?utf-8?B?TjdhSk5GRERPMWhXdEZEYVFJeDloekpYTTBIMGtzMnFvTlh6S01KQVp3SlFG?=
 =?utf-8?B?SmFGb0ZMUTYzRDJnazdmSkJvcDU5azdvUERiRncyVWRFRGk4ZlFIQ2YzVFgx?=
 =?utf-8?B?bHdZYUprSGZKNXNRczU3aklnY3ZIenJZS0poZGFwY2lLZzRPUHZ1S3lBNGo4?=
 =?utf-8?B?WEVRYzBDUDB6aXpRSjFXd1lYbFR2eXNYZ21MaVlWRk5GZ01NaHJ6V3VsR3o2?=
 =?utf-8?B?Y1hUeXhnMTBBYk93SW42eFRXUUpuaHVvQzVzRndqOS9iajFrdGw5OXk4Y094?=
 =?utf-8?B?dlZsVTVDcWhKY29ma3lsYnRTN1BaWkt4SGtMUHIyKzFnMXV0S0RIZXNKT1dn?=
 =?utf-8?B?UXRDbzdpQmJySVB6M21Ld2NuaVJ4R25KMksvdkQ3UGJ4Zk1MNzVBdUV2eWhv?=
 =?utf-8?B?MGZxOHdHOWJrakR2TFJHTWhsS2pBNG9ZZHM3VlMxbnh5OTkyRU9qZFNXNUpl?=
 =?utf-8?B?NGYyYlg3ZHphVmllcXMwVXF0c3FYWGcwbWl5UlBZRDIxMHh6ZWtYdDh3TUtL?=
 =?utf-8?B?dFQ3OWc3d2g1dFJidUpKNFRDTGhadTZjU0xCYWU2K0NpY0FSUVFUWWdRVlNQ?=
 =?utf-8?B?ZFBBQ3VNRzRjaXlhRnJ1TlhqUlArMUwxR0c5VVlMM2FLSnZaT0ZWaXljb25m?=
 =?utf-8?B?RFd3N1oyL0Z3SS8vK2ozN0xieTdqQ2tBNDF1MVhmaS96Nk8ybDRWTkhwYjFH?=
 =?utf-8?B?NFB2dmNiNnYwSFRUb2tHRXlKaVFVbDZPekdzOGk3bE8rbHNJa2pYVkJNaU9q?=
 =?utf-8?B?aEU0Q2F0MEhENEtUSzVXdG1UajNSNXNRL1dmcW9UanNKR0lqNHpjZXljOWE4?=
 =?utf-8?B?Y2RtamFQQVZ2cHVRM05PbGJGSW9CRHoveHFSZlYraG9JOEx2Ly9vTm90NFFu?=
 =?utf-8?B?K2NERmFTRytZdUZZVWxFRWNERzlMOHpUbFozcXpWZGNXWGhzUStVWnkwNVdE?=
 =?utf-8?B?NFpzWVJjbkt6c3dqbzVMNkpuVENuczgyYlkxSU56TnNFTnBPWlZCQlZnOVhS?=
 =?utf-8?B?c0c1U255eGNhV3o1a3YvMVB2U3UrS2w5SWhkTStLMWNGQlNUdjF2bXhKR0FO?=
 =?utf-8?B?TWlUYU5VNFF5WUl6VzlxN2JyU0l6aFZqYnQxQXVzSHRUd2hyNjJJdVN5UUhy?=
 =?utf-8?B?SlN5Q1FmQ3pFRjVWdUNTVlNMVkpFUnd0N1c2RzZveVN6TS9jcHhqU2tqZmhu?=
 =?utf-8?B?OW5yZUtnY0ZpMi84dEhMMW82MXpsWkxRdlBZeGlaVkJBNTVLV25DOHYyalhW?=
 =?utf-8?B?VHhHN2NtLzhNc1hReEdLSUZZSHBXZHpmdWIxS3pwZFA4VnhmMU5XMy9WU002?=
 =?utf-8?Q?KvjBQeB3GO/19fuHhLR6LGWXN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da89b2f4-bf4c-491b-d791-08da7e973134
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 08:21:45.8617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnxZmBPSonmSZT9hnVb+/4MmXDO4BGQH3/xflefuLMt904L+lPpch7KhjlEcUkGnDPaHlqtd7I+xwSma2aaaIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4825

On 15.08.2022 10:17, Julien Grall wrote:
> On 15/08/2022 07:43, Jan Beulich wrote:
>> On 12.08.2022 21:24, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> At the moment, the strings are in text right after each use because
>>> the instruction 'adr' has specific requirement on the location
>>> and the compiler will forbid cross section label.
>>>
>>> The macro 'adr_l' was recently reworked so the caller doesn't need
>>> to know whether the MMU is on. This makes it easier to use where
>>> instructions can be run in both context.
>>>
>>> This also means that the strings don't need to be part of .text
>>> anymore. So move them to .rodata.str.
>>
>> Wouldn't they better live somewhere in .init* ?
> 
> PRINT() is also used in path for secondary bring-up. So this could be 
> used after .init (even though today CPU hotplug doesn't work on Arm).

Then the term "earlyprintk" looks to be misleading?

> Furthermore, PRINT() is only used when earlyprintk is enabled. This 
> should only be used in a development environment (gated by 
> CONFIG_DEBUG). So I think it is better to keep all the strings in 
> .rodata.str rather than trying to distinguish whether the caller will 
> happen only during init on boot.

Fair enough.

Jan

