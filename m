Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D4766D88A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 09:47:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479090.742701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhbv-0001OA-8P; Tue, 17 Jan 2023 08:46:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479090.742701; Tue, 17 Jan 2023 08:46:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHhbv-0001MM-4D; Tue, 17 Jan 2023 08:46:27 +0000
Received: by outflank-mailman (input) for mailman id 479090;
 Tue, 17 Jan 2023 08:46:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IWGa=5O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pHhbt-0001MG-NW
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 08:46:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2086.outbound.protection.outlook.com [40.107.6.86])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b9ec1ff-9643-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 09:46:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8856.eurprd04.prod.outlook.com (2603:10a6:10:2e3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 08:46:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Tue, 17 Jan 2023
 08:46:21 +0000
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
X-Inumbo-ID: 6b9ec1ff-9643-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ig4x/Oh0qEZCGOC67eZcnZv36W7IfcMogkgRTiV3KvZAACW1XuFrClKE6AOpmGqIzT88nVKZxWJCS129mDeq7q0p48JBBPNwu643Pv/Z4593adjdooJp/Tv5W5fBkfsgPpMdmFMI5RwYhacIYql1oqsfGvaI3wL6p2A7PZXZfWMa2ZlqvjG082mCwqeveSnmhvP6EjWc0upv34amZrVhrpBer6vzMYwmT2tseoTzZtXS/9aGqXNi5Ng0gV+k0Qq3r7qyze5SMovr40CRy3FdtNditUoQQ5Wc9WqOtKSFBxbYd3+MOiVaLy0m02E3AaPH35WwdKPPvPpzIJuAgILI0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rn5GBTSM+U69lN2djSQA9cKttj49h9QItBQKYFoZY5E=;
 b=BS+ndgcNtoznEyBxPPUtJMafDsdwaKSVwqz+y4HEMWrnb6vhPc6CTiuGmyLKSUFk2xwxk7ELs5B0IYSih8O0J//hc+roY905XFXi0SQsc1VIvk4mZNvnzfkK8KoTmcQ8XCp85jgZtSvrpL4vFeNsvAVuE96WP6FbNrr54BvgtIElmw/+Vh0NKTmGBDJx637phxFEOT1cceI+fx+MvI/Vh1bO6QHsmQl7rQ3OVqRsaw8BpT5wDhS+RQJhZSZRvW9zMVyEbfE5fF8ZnK9RMhoSQmu5zmlCqMK/Kh1FiL2gqLnTCGzJnpWzO/KoNR6AOwSkGdSxp517d+FZ2Jby13766g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rn5GBTSM+U69lN2djSQA9cKttj49h9QItBQKYFoZY5E=;
 b=kH6piNBcmjz9ArSszpImdZfjEy+Cvzq3Txd64IgJcX++cBr0H1QicJC9tSIkl5ZK6sor6xtVJX5zLeuZVsxDc5GRuCNyT6FHq7eM2I9s2RNlrl40QYyX08NbC0hsWa8d9AhXjVoLy6et0A5q4QcplQ/YvMsKzt+Ouww3hAPobcGFPxyXqEVgjoxeJRVf06EFKEEmHyQLztHqSiIBFHwNHgakPak5nXKsn23xExdBISerXHZABXdlDWdOijnGRGAGfOjL3GzvGgfSWpSPYwo5BbcJcbVukLQwRomnZe2vMl/qMKWp3FgwZ4U4olygYt2QksU7TOyaLjzeNvIl6KXWJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b867256-7ec5-27f9-9089-cec551ef79ff@suse.com>
Date: Tue, 17 Jan 2023 09:46:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/5] xen/version: Calculate xen_capabilities_info once
 at boot
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230113230835.29356-1-andrew.cooper3@citrix.com>
 <20230113230835.29356-3-andrew.cooper3@citrix.com>
 <9ff94f87-e3fa-c397-ebf0-b4849cba757d@suse.com>
 <164e5248-948e-9467-5b34-1510d32f8d82@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <164e5248-948e-9467-5b34-1510d32f8d82@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8856:EE_
X-MS-Office365-Filtering-Correlation-Id: 63566c19-38ac-413a-c39a-08daf8674e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uzaYrS4slpYdP5JJcwQojeWJi0bzQHXqYv7AFs4jRn/hfkteEg4mdJyGv09OKkw8zpxZy9Yv9kwvsY/uBvGTDVAO8AZsCzfp9zEfQBNMyljYTrXbCUlftPSrI47gkrwU7DR1Ms6GHRXNsaOHBYBHsAMbo73FWTpi7Ca3qvn3BDQSS8PHpOvm49gIGvzCpMxdHm8yCObIcNkrfAzk996TjCzwggwfT7SBhQTxtoUYTd4Vx7pbXmhCfobFBFBd6Zidk2AdjDRpLUDSkMjI0ay38MtkNnUo459EibPE+aDGZgvVrY+s6lh//7CU/C2HdRrhIhQ9OL6H16AVf5w6Rtbxl2OHThbxj+tw7BevttFYoa9OiTERmzL8HXicIHeXujt10NOdInoFiXJ9zCQQhGUrsrR5R6rJRg4zMFRKC7AJ7Exw4ASegvKBUyxGFW3hnfiTCzSRSTUJtRsxJbwzwTZHzVlP0FIJle6+nZgdoZ/c0RTT1S6JfYKjA9lU+Ao48IxiJSNRZv06C0Zw5le7VqOOuPj6tqk3hQLYDaKjtLgWl2Havhom8kkw3gWwDsjH6aq/WKVKOhZgox+m0PihKEFL25BkE8L89cPhKC4kvW4PvyVSkG5P5COFJDrTKhTeXaWWRatQVej8d91nazRzP/MK7Z7WzQxVXgpIcFX9IVcRCoplwwEVK95tcIFuGVTcz/KruYnrA2P0G4MMAf+WIoH0R2unhIaCSK5whqw3FnT87PU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199015)(6486002)(478600001)(41300700001)(6512007)(38100700002)(186003)(86362001)(31696002)(316002)(54906003)(2616005)(66476007)(66556008)(66946007)(26005)(4326008)(53546011)(5660300002)(36756003)(6506007)(2906002)(31686004)(6916009)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXMwc3Z0V2JjeFl0TFhqTU8wREtEQXgvS2FNeHUrbFIzN3hybm41UFBUdm02?=
 =?utf-8?B?VEFab2J5cFg0OTVNeE1VaWlwS2FRNVhRbC9TeE1NaEJGV0Jja0hSMWdubVYr?=
 =?utf-8?B?V1A0VlhidmpzelgvLzA3OHgydUdGbGxrZjEwMDBsYllaK056NUlnNUlhcEhl?=
 =?utf-8?B?RW1NMDBzN0ZjK1ZOVFE0eUNmM2xwMTdOOXhFR25XdE45SUgyY2dUMDF5WGpm?=
 =?utf-8?B?cGlDdEJJK0lvZ3l5WVEzUG1qMHF4cEorWE9zUjhyV3UySVU5Z0hEaWJka3RD?=
 =?utf-8?B?NC9CUEdMWUUxWFhyV0grUVRBNmpGYTdaYnlQbzJ5VEprVU9BMWE5em1tUzQ0?=
 =?utf-8?B?RWUxNGxmR2JWZXFvcDQzTldyOXY2MTlpOUJjWWkzZ2p6dC9iT2RjeTI1dEFk?=
 =?utf-8?B?WXpYTUZxWkQvQmk4cFpiMXk5Qjl0Tk5BS1hlRmNSNTgvb2tuQ2RmZWtrRzhn?=
 =?utf-8?B?Ri9keGphaU1zWDhCTExEVnlxNk9qeHNzRllycEhQUFV5bG5EejdsMU4vV3p0?=
 =?utf-8?B?d21lTmZtQnRrNTRBOWh6VFJqWFVRZ09QbkoxQSt2L2U3akJlVFphQkY5amR6?=
 =?utf-8?B?Z2x3ZnpjVkhDTXNFOWlWNlBtVXptaWYvY202dmduZkxueUk2M0lWRlJmVDhW?=
 =?utf-8?B?Rk5wNkIwNUZmNDVVNEpwYTJJZHBPbnhKeTk4M3VaRll1cUVHTmZWeHNZb1JY?=
 =?utf-8?B?T2VleFhXOXZhRzI3UXZmRUtscllwYUxvdDdKTGNBQzBabDNGakhKUVJ0MUd5?=
 =?utf-8?B?Yy96MXVCQ05FR1dYZnc1d3lhMDFHZlNYY2NFTHgrcllldGVvM2Vha0owOU1j?=
 =?utf-8?B?a3NZWEZTWlBHTkFvcG8zanJYRTArSjA2cEtzdndDNDhOc2xvNGpDM0xzNlZi?=
 =?utf-8?B?VldvcG5qeXYwd0dsNlNIaVYzOGhxS0ZqQkdRWGxhYlloMGZoc0kzWGdiemUr?=
 =?utf-8?B?VjhIWG13Q2JwcENuUm55VC9ZbW5NOFhpeUc1MWIvckNucE5uWVM2ZlY0T0oy?=
 =?utf-8?B?anJpNWtiTUlwYWlzSm80SWVQSWhRbW9hZ29FWk92bWFqUFJuZlNvNkdvWlpX?=
 =?utf-8?B?NHpKUlNaRUp4cmhuS1U0RHpibWJIc3hVZ3VBZ1kxTWtGVnBtKy9nRTd0cjdL?=
 =?utf-8?B?Q2oxVnM3UWhET3pUS1ZGVnBrdnRQSXUrYSs4ME1FYldYbitzRCtZSXp3cnIr?=
 =?utf-8?B?SDgzYnBPeUVOR0tjdmt0ZlNxZmVsbE5OdFBjakVQWm50M2p4Y2grRGtiYlpR?=
 =?utf-8?B?aGp3Tkg4R28rMXdPSVlFYU9MYWNGOVhZbGl3THpzZGZLZ0dlQ2grNVVaZ2lj?=
 =?utf-8?B?S2ZkTjRHN0VINFJ5ZFZmQjZSVzIzamtaeDBRQ0daeXRTVkZubnZQZWoydFpU?=
 =?utf-8?B?K1Q5dEFXdlFYL3Q1TjRxaTg1TDY3K1lDOG83TzdXS2psNENFMWZTVTBpOWMy?=
 =?utf-8?B?WVNCOU8xYjVXMUFRcE5hQWljU0QwY0tSVmFGVk02UmFoQVhEOTFWQ2lrcWNi?=
 =?utf-8?B?bFE5Y2NmV3A2MHhiWEVEQjh4OGN3a3Yra05FLzh5YjJHeHMwaktmSjZrbExE?=
 =?utf-8?B?TENCc2dFYnd4YThmcEtHeFRmTUNmeUFzYVVnN3NhYzdBTWRiYThuRFlvUTFL?=
 =?utf-8?B?WUQwYkp1RzNtMHUxRHV6Q21xMTlCMFhtYTE0K1oxeForcFpnaDBGbFNRWEI3?=
 =?utf-8?B?Y2JqQ3VGL3AzcStmQkJLR1IvY2pVT1BUQzdRdlg3S0hOaDQ1WlBBMm9wcEll?=
 =?utf-8?B?SmNOWWZXUG5kY05RVTViOTZaVWVyU2FTdzZGWjNUODdKUUlPMndvK0ZmV2dw?=
 =?utf-8?B?YUdxT2UxL3IyQWorMTIwN3lNU3VSUXMrSStNelBsbUxaNGVkZDBGUDVocGFD?=
 =?utf-8?B?dU54d25ESVdsdURJVHA1NUNZMEJCSFIvUXYwRFZsc1c1SzJwb21HaXYvWms4?=
 =?utf-8?B?eXphaDJSR3BUSGhiK2JucWZpVFQzM01LMCsrTjdnKzhEUHJCOHBPcWhRdlVO?=
 =?utf-8?B?cUdqK1pxaFgwcjJuQ2U5WGdQYzNxUDg0WTA0OGJiVFdZc3BHb3J3L2NzQVlG?=
 =?utf-8?B?VldkWDc3Mm1BQkpyQlI4bHo2cWdYOFB2VHFXajRkWWl4MHdzYlREM3JHcjU5?=
 =?utf-8?Q?it8W/zjFB30oKSwIZ0XdU6PXh?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63566c19-38ac-413a-c39a-08daf8674e8e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 08:46:21.4332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+O9DrRMh4D7ujJQmYOxCgAdfHK8nqH9ZSOO2B0r0ZWr0ymSgz61bjq5+NaYCuu/vbeKlqVzuep6R9ThFV8vMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8856

On 16.01.2023 21:52, Andrew Cooper wrote:
> On 16/01/2023 3:53 pm, Jan Beulich wrote:
>> On 14.01.2023 00:08, Andrew Cooper wrote:
>>> The arch_get_xen_caps() infrastructure is horribly inefficient, for something
>>> that is constant after features have been resolved on boot.
>>>
>>> Every instance used snprintf() to format constants into a string (which gets
>>> shorter when %d gets resolved!), which gets double buffered on the stack.
>>>
>>> Switch to using string literals with the "3.0" inserted - these numbers
>>> haven't changed in 18 years (The Xen 3.0 release was Dec 5th 2005).
>>>
>>> Use initcalls to format the data into xen_cap_info, which is deliberately not
>>> of type xen_capabilities_info_t because a 1k array is a silly overhead for
>>> storing a maximum of 77 chars (the x86 version) and isn't liable to need any
>>> more space in the forseeable future.
>> So I was wondering if once we arrived at the new ABI (and hence the 3.0 one
>> is properly legacy) we shouldn't declare Xen 5.0 and then also mark the new
>> ABI's availability here by a string including "5.0" where at present we
>> expose (only) "3.0".
> 
> "the new ABI" is is still two things.
> 
> The one part is changes to the in-guest ABI which does make it GPA based
> (for HVM), but this does need to be broadly backwards compatible.  This
> ABI string lives in the PV guest elfnotes (and is ultimately the thing
> that distinguishes PV32pae vs PV64), but nowhere interesting for HVM
> guests as far as I can see (furthermore, the 3 variations of hvm-3.0-
> are bogus.
> 
> xen-3.0-x86_64la57 would probably be the least invasive way to extend PV
> support to 5-level paging.
> 
> The other part is a stable tools API/ABI.  This can have any kind of
> interface we choose, and frankly there are better interfaces than this
> stringly typed one.
> 
> 
> "xen-3.0" is even hardcoded in libelf.  I can't foresee a good reason to
> bump 3 -> 5 and break all current PV guests.

I didn't by any means mean to suggest to bump. I was seeing us add new
5.0 entries, with the presence of the 3.0 ones indicating the backwards
compatible ABI. An option might then later be to make the compatible
ABI compile (kconfig) time conditional.

>>> If Xen had strncpy(), then the hunk in do_xen_version() could read:
>>>
>>>   if ( deny )
>>>      memset(info, 0, sizeof(info));
>>>   else
>>>      strncpy(info, xen_cap_info, sizeof(info));
>>>
>>> to avoid double processing the start of the buffer, but given the ABI (must
>>> write 1k chars into the guest), I cannot see any way of taking info off the
>>> stack without some kind of strncpy_to_guest() API.
>> How about using clear_guest() for the 1k range, then copy_to_guest() for
>> merely the string? Plus - are we even required to clear the buffer past
>> the nul terminator?
> 
> Well, we have previously always copied 1k bytes.  But this is always
> been a NUL terminated API of a string persuasion, so I find it hard to
> believe that any caller cares beyond the NUL.
> 
> Because of safe_strcpy(), xen_cap_info is guaranteed to be NUL
> terminated, so if we don't care about padding the buffer with extra
> zeroes, we don't even need the clear_guest().

Right, that's what I was hinting at as a possible option to do right here,
or to do subsequently.

> Also, similar reasoning would apply to XENVER_cmdline which is typically
> rather less than 1k in length (at least it's not on the stack, but it is
> still an excessive copy).

Indeed, but I understood your primary concern was the on-stack copy, so my
suggestion first focused on that.

Jan

