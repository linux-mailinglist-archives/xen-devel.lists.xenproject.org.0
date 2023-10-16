Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07337CA6B1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Oct 2023 13:27:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.617478.960098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLka-0001Ab-Gd; Mon, 16 Oct 2023 11:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 617478.960098; Mon, 16 Oct 2023 11:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsLka-00017Z-D8; Mon, 16 Oct 2023 11:27:08 +0000
Received: by outflank-mailman (input) for mailman id 617478;
 Mon, 16 Oct 2023 11:27:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BBjo=F6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qsLkZ-00017T-BL
 for xen-devel@lists.xenproject.org; Mon, 16 Oct 2023 11:27:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eedb3a62-6c16-11ee-9b0e-b553b5be7939;
 Mon, 16 Oct 2023 13:27:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9146.eurprd04.prod.outlook.com (2603:10a6:10:2f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Mon, 16 Oct
 2023 11:27:01 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 11:27:01 +0000
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
X-Inumbo-ID: eedb3a62-6c16-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jwht8kFdHSw4zNktuMKBC6OGE/uurc6MiVEr7fCs3t50xQskSqqnNrz+3o5JLhS+yBqxvK64K/ov/yGEtHyvk/03azHA/AaDYHq8gf4dX/tUwlt+mlxdlO8o4e2afmk80shU89pxrsM48Cf7B24IJkOi1h5r/Snj2djc7Uen6HpRH7IpTAkIjUss+3vUVOjUXSby+rwfpVa+G6gYoF8/f9FMl3SWQS91bLJaMgki+7tSimv3WfXPeeIefVtyqhrkhmuSWiMjv+xP3bFqiw077lIvTGi7m4bXipCdAgN7oxVL7b4BnhEds1Ozo1g+qGmet0gxlD270qqui4NtoKFHzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEhhApO3+JBwOGKkSRqRV1Mo68g4noZCSaQ6puRgWQU=;
 b=Wxlt94YW+RKGujPsRsWFAtyo/amfiGL/2D3m/azRlSSN77PpwU4Th+Vgs5t1qQW4E9tUxloP7tEcew1y0tgf8pTE5BXRaxFM5G6d06GWoKWpu4wWlkD95uduj/9AnTAOzQYEbFXPwzLuSNgZaqEkEBzo7COzLKjKT/0Gc8JQ9dq+RCcgTp19lPGAEsAZbChqbCQqgKD+nSYunwBHu3SrV/WhTPDp7WHU3hZkgpsGMmduS/zhqjsWQxJBlGfxp8ERaTtc5d5TxnKWYGNbKV4OBWlr9N2B5lZ/reEPFIChsN1GHtgEUgM1bVYWxkiFHSqOIrN+COI2lBQ1CIVzrI+eYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEhhApO3+JBwOGKkSRqRV1Mo68g4noZCSaQ6puRgWQU=;
 b=5L5OLN6sbxJtdSQulve/Mq/MVA5gjdwjYwJo2P1XyJ7JHQfazLhGL9vla7laupSgPR7XQEztKs253JgUUQOMzw8WDb+Q9O42eLXLKSkBUpw3GWP315bFr9bqNG4rx4mP1qlAuGxd0+JgNVuQnl2jsJd5hh6bpuDBUS6nSb7jbB88jXMam92l5MiNfwWsI4MJhpR5FWFIED+psvvKo5Z27APZKVVJpj8zYoGwCmoR7pzr0qUYvFqKcc2sZEZYNeFrXHRSoKsrR3LgeJRI9oBJNHSC/XU1obt9JdV4bYQkSsZlQ7q+Jwj9PRIC5J+gMFQ6cTzIbbQl4sNnp4hsoAF/UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <725f5193-c8d3-1bc8-cd62-2a2b1b5ecc01@suse.com>
Date: Mon, 16 Oct 2023 13:26:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH v2 00/10] address violations of MISRA C:2012 Directive
 4.10
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1694510856.git.simone.ballarin@bugseng.com>
 <b62205a1-885b-ea4e-3ce2-7ad58cfc938d@suse.com>
 <f1759081-eb18-4597-82b6-d7d9ee1754ab@bugseng.com>
 <e0ff3307-99ee-7740-bc5f-52dd7f589057@suse.com>
 <c2b10554-673c-4452-a35c-0d2f314e8ad2@bugseng.com>
 <f0cd8400-5e37-6704-75ce-d965540bc2b7@suse.com>
 <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2309281515570.1996340@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0104.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: cf9dffb9-7ad6-42b3-f50b-08dbce3ad146
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FI+sAdGcPyTmN1635EG+WZeAIWN8q/7v+Mh2BJAScNV8icw67nEVo986ynZRHmq3vjAC3nZx7BPvFsZELgPYJUISU7OeDZgwLxaRVrCN924K2PPx5imZu82AohGoasw6cdWphWv54Rx8SgJZmNIJdQZ8Z/n0fgUABtzzIzfbdIHrBxE2FcRHbFXW+fb31O3jTs3HokKzcyfkuYa/1kfWdWEPnwNYts903wlnefT/u5+u/H0yXnKSx7kr8K2YStCxJS4J5VxbXmSqH3Krdbl3uvdnRYEW4pX3HtQlCbrzABMftfb/oX3SxO1hQ1GbDUd68bHhro+Hlzba5TkrDArbpss4lMw8mm8nAtC06DB6ROP6CRJBA7lZT/qgvWjD+VDc2yCqByW9oNjyFd9IjItIMDRbj0gE36Ceo4mAXpEN9Nn6iem+rcN2xn2KV3C277nnMODIPfVdBRuWdpwayl7pKHQ0TtXXlQAYSYGKS5H5gzgyFCn2vE0UbX83EyCNkOgyZyy4y/c6R5ZSD+sNZhdXtRg9SlAQeCHrw1D0hcRByB5jmZ5km9u8IH2vwg95jQh2lTdu1bD5SRPRD+fzM2A2BorK8t3VOGpOnWcupVZxPj9rWl84PvcI7DfB8Neta5Fb9J8nwsPK+/tAEfGnzSQEew==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(136003)(396003)(39850400004)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66899024)(31686004)(6486002)(478600001)(66476007)(66556008)(66946007)(54906003)(316002)(6916009)(83380400001)(31696002)(86362001)(38100700002)(6512007)(26005)(2616005)(53546011)(6506007)(36756003)(41300700001)(5660300002)(8676002)(8936002)(4326008)(2906002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elpuSkI4bldrQVhKTmpSU3BQOWhCQ05SaHdDY2N5VWhCTEUra3c4cDBhZklR?=
 =?utf-8?B?WStBZW1jdWtTL2VWWVVLZ3kvaVc5Z2xIWjZQUWRTd0RWTmg5clBoKzExVnQr?=
 =?utf-8?B?aXN0T1BNaWM3RnZqcTJ3Tk5MakN0QlhBZnE3Y1kzRjI4RGdxbVR2enFrRHd0?=
 =?utf-8?B?SlNsMmlLVDdFT2ovQlNpMHJNYUhJVGhaNWY1QnF1dER6Mk1pZ0JjdHVScWIy?=
 =?utf-8?B?UnhXMTBneGtOS2w4Q0N4R0tWSUx0UlhmbGd6T3F0UzkrVXdvaG92MGJXa01V?=
 =?utf-8?B?UENleWNudjhBek9yaG1ZNmFKRnpTcDlrVWYvYzNSdVQxRVBucDNxd2ZxOGdW?=
 =?utf-8?B?cGh4U1pBUnFQQm1HY0l4NllsU0xkRlBUM3pUMHQva0d0M1NEcGE3WERJSDVt?=
 =?utf-8?B?bG5pZ3Q1REZEQjNLWGhGMTc3NDUrUTFxalRMbTgrRFp6Z2EyWnl6VDRHUGI3?=
 =?utf-8?B?Y0JXeVRzdXlST3psTWh6bFBCZzRLYTZ6MnMra2d0cUZtNWRQZzUrdG1hZXB1?=
 =?utf-8?B?YTBwakk4NzUwWWVjU1ZpTXNTU1NWT29sZXJSNDk3WUFtL2NvblVhYmc1Z2NY?=
 =?utf-8?B?UUJrc0NHUGZxQXE5ekpMVjd2UUFIdUpxZlo5ZTNiUzV4R1Q2cmF4cjR4dm9K?=
 =?utf-8?B?cGQ2eld0ZktrQm5VNGR2ZmowS3IrVFhqSTMxNlp5cGRsbXdoNTRJV0tkeTdl?=
 =?utf-8?B?d2VBTjJEWUlHTXdaRXZJN29aYmxDNjdIQmpqVzRVRWMxRDlGS0J4RSt6YUtP?=
 =?utf-8?B?aStEcUgwTWR2SHdhNDV3VmI0ZWtNdi94OXFEVVZxcjdaK2tGTzhTeWFTYmoy?=
 =?utf-8?B?akJvN3BGUW4zekV6T2FSVEdKUDZDY1RlSEJhd1pVVkpWUWpHaVhlaUs1dmox?=
 =?utf-8?B?L210QkUxeEJOVW93QytyRFhwTGZ6VURlSXFDcVpGZWJrN3NaZHcyaFNOVGd3?=
 =?utf-8?B?L20vWmE4MDNzM2QwSk5ObUNWZ0RKMEdrTkhQWDI1ZlNrNWZuQ29CeWpYNk5O?=
 =?utf-8?B?WHNSOThLaGlGWldPcUhIQXJpYXQrQW84K01SRS9YRlZXM2hNVHdmSHFkMGpO?=
 =?utf-8?B?U0t6NkVUTnFKYnZPU1NNOEY4WWRaZzZNcGVWbWIrSFlYU3V3UDEzb1J4cUhK?=
 =?utf-8?B?MEVneHV5T0dkWGNNVHpLejNFOWVIWnkzR21KSGl5K2cvOGhiN1RKWGZadjVv?=
 =?utf-8?B?Y0xLdVZLWnR6MFQwdlM4L3paLzdJTGRHTzR6eDlXK2M4U2ZSeE51cGQwZHNv?=
 =?utf-8?B?RXJlekw0U1F0SVV3VUFhMUxVU3QwZXBXZ2kvVG5KQzdKUndTc3JtK0VzL1F2?=
 =?utf-8?B?WHpORjVHT0FrbUhuTHdhelVNNndoWGttQ2lqcXZORU12SUl1WDdPajlWWkFi?=
 =?utf-8?B?cmZTWXhnenFSbmE4enNGR2lKOXdicU1vRnJLU1Q2MjNmU3RKcGV1aVg5L0E3?=
 =?utf-8?B?aE9OSm9lZVJLUHpRV3VkN0hucXhlZHBPQ2ZiWWFmRXk1aXcxdWMzTU9CNTBs?=
 =?utf-8?B?ZHJTY2F5VTZtSGxzRy8ycmZrZXk4RnRLYUxVZnlzejZtckFiRERNU3BQR1By?=
 =?utf-8?B?anlsZ2dQT05qcU9Cd0Fzc3ZxQ2pZekxYWHdGZE9CaGczeVE2UVE1N1g3RkJL?=
 =?utf-8?B?ellBTTM4MTgzd1dlSjJSZ1I0TC8wUmZHZnJGWkRlRllIK0lFeFAvMCsxZXhj?=
 =?utf-8?B?aTdjcUMxWlBOOFBOVFg3UnA0VmlNRUMrTWJ4dDhyQUdNRGw5VUNPMGhpRE0v?=
 =?utf-8?B?NEdhZ2dOYW05SWZSSyszMkN1WTBVdTRVL2pMM0VFVk8vZUtvQmZoQnN2U0Zy?=
 =?utf-8?B?Z3NlUDlkbTdKS0R2YmphTnplU3NVbGFoZTREeXhXbmdMWmttT0RzTTdzNHk2?=
 =?utf-8?B?SWFUdWxYTlBjd2U5TUV4TDE2c3NVN0hTZm9XVmpwT3E0dUlOS1BaZENwVnhH?=
 =?utf-8?B?bmI2QnhDa1BDckI4dWw5SkdIbEtRVDZQbmtYNlArZGthOUZlQUl2SUJyU3JY?=
 =?utf-8?B?VlhZNmFsNkVSdlVLQlpQcHQvR1JNeXZFemFQRSthOXZhblB4d1JZM2lTbmt1?=
 =?utf-8?B?TWVhWkI5UHVmN3hnV0gxckp4TXBSOFVhaWQzRlk4VmoveXVPc2JlREF3cys0?=
 =?utf-8?Q?y1fsKUCu837sB0llsZTs4p0D8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9dffb9-7ad6-42b3-f50b-08dbce3ad146
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 11:27:01.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mm4NJpYclOsuQ4i5QSRKVYOoGKUnlEHrqfveGfLGHc0xLTADJa4FvqVjUDAWlbmpqWXUPSwwdMBzW+cfvMX0NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9146

On 29.09.2023 00:24, Stefano Stabellini wrote:
> On Thu, 28 Sep 2023, Jan Beulich wrote:
>> On 28.09.2023 15:17, Simone Ballarin wrote:
>>> On 28/09/23 14:51, Jan Beulich wrote:
>>>> On 28.09.2023 14:46, Simone Ballarin wrote:
>>>>> On 13/09/23 10:02, Jan Beulich wrote:
>>>>>> On 12.09.2023 11:36, Simone Ballarin wrote:
>>>>>>> Add or move inclusion guards to address violations of
>>>>>>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>>>>>>> to prevent the contents of a header file being included more than
>>>>>>> once").
>>>>>>>
>>>>>>> Inclusion guards must appear at the beginning of the headers
>>>>>>> (comments are permitted anywhere) and the #if directive cannot
>>>>>>> be used for other checks.
>>>>>>>
>>>>>>> Simone Ballarin (10):
>>>>>>>     misra: add deviation for headers that explicitly avoid guards
>>>>>>>     misra: modify deviations for empty and generated headers
>>>>>>>     misra: add deviations for direct inclusion guards
>>>>>>>     xen/arm: address violations of MISRA C:2012 Directive 4.10
>>>>>>>     xen/x86: address violations of MISRA C:2012 Directive 4.10
>>>>>>>     x86/EFI: address violations of MISRA C:2012 Directive 4.10
>>>>>>>     xen/common: address violations of MISRA C:2012 Directive 4.10
>>>>>>>     xen/efi: address violations of MISRA C:2012 Directive 4.10
>>>>>>>     xen: address violations of MISRA C:2012 Directive 4.10
>>>>>>>     x86/asm: address violations of MISRA C:2012 Directive 4.10
>>>>>>
>>>>>> Just to mention it here again for the entire series, seeing that despite
>>>>>> my earlier comments to this effect a few R-b have arrived: If private
>>>>>> headers need to gain guards (for, imo, no real reason), we first need to
>>>>>> settle on a naming scheme for these guards, such that guards used in
>>>>>> private headers aren't at risk of colliding with ones used headers
>>>>>> living in one of the usual include directories. IOW imo fair parts of
>>>>>> this series may need redoing.
>>>>>>
>>>>>> Jan
>>>>>>
>>>>>
>>>>> My proposal is:
>>>>> - the relative path from "xen/arch" for files in this directory
>>>>>     (i.e. X86_X86_X86_MMCONFIG_H for "xen/arch/x86/x86_64/mmconfig.h";
>>>>
>>>> X86_X86_64_MMCONFIG_H that is?
>>>>
>>>> Yet then this scheme won't hold for xen/arch/include/asm/... ? It's also
>>>> not clear whether you're deliberately omitting leading/trailing underscores
>>>> here, which may be a way to distinguish private from global headers.
>>>
>>> Each name that begins with a double or single underscore (__, _) 
>>> followed by an uppercase letter is reserved. Using a reserved identifier 
>>> is an undefined-b.
>>>
>>> I would be better to avoid them.
>>
>> I'm with you about avoiding them, except that we use such all over the
>> place. Taking this together with ...
>>
>>>>> - for the others, the entire path.
>>>>
>>>> What exactly is "entire" here?
>>>
>>> Let me try again.
>>>
>>> If we are inside xen/arch the relative path starting from this directory:
>>>    | xen/arch/x86/include/asm/compat.h
>>>    X86_INCLUDE_ASM_COMPAT_H
>>>
>>> For xen/include, the current convention.
>>> Maybe, in a future patch, we can consider removing the leading _.
>>>
>>> For the others, the relative path after xen:
>>>    | xen/common/efi/efi.h
>>>    COMMON_EFI_EFI_H
>>
>> ... this you're effectively suggesting to change all existing guards.
>> That's an option, but likely not a preferred one. Personally I'd prefer
>> if in particular the headers in xen/include/ and in xen/arch/*include/
>> didn't needlessly include _INCLUDE_ in their guard names.
>>
>> I'm really curious what others think.
> 
> If it is a MISRA requirement to avoid names that begin with single or
> double underscore, then I think we should bite the bullet and change all
> guard names, taking the opportunity to make them consistent.

Note how below you still suggest names with two leading underscores. I'm
afraid ...

> If it is not a MISRA requirement, then I think we should go for the path
> of least resistance and try to make the smallest amount of changes
> overall, which seems to be:

... "least resistance" won't gain us much, as hardly any guards don't
start with an underscore.

> - for xen/include/blah.h, __BLAH_H__
> - for xen/arch/arm/asm/include/blah.h, __ASM_ARM_BLAH_H__
> - for xen/arch/x86/asm/include/blah.h, it is far less consistent, maybe __ASM_X86_BLAH_H__ ?

There are no headers in xen/include/. For (e.g.) xen/include/xen/ we
may go with XEN_BLAH_H; whether ASM prefixes are needed I'm not sure;
we could go with just ARM_BLAH_H and X86_BLAH_H?

The primary question though is (imo) how to deal with private headers,
such that the risk of name collisions is as small as possible.

Jan

