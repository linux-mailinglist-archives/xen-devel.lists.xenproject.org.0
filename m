Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21D6949D9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 16:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494675.764843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaLP-0008O7-Mj; Mon, 13 Feb 2023 15:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494675.764843; Mon, 13 Feb 2023 15:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRaLP-0008L4-I8; Mon, 13 Feb 2023 15:02:15 +0000
Received: by outflank-mailman (input) for mailman id 494675;
 Mon, 13 Feb 2023 15:02:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRaLN-0008Ky-UK
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 15:02:13 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64cb15d4-abaf-11ed-93b5-47a8fe42b414;
 Mon, 13 Feb 2023 16:02:12 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6952.eurprd04.prod.outlook.com (2603:10a6:20b:107::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 15:02:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 15:02:09 +0000
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
X-Inumbo-ID: 64cb15d4-abaf-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g98SUnCFshHsIxLc2gb/gn4hxPZ0/a54GYD8+v+s+8eDHRg+POltfwJ6BmrCSnrV+sHEb/2qchFXRJD3WPzcdgtanfFUNrUr4Uee8Oi86+vbayRw+JSSBSd9Pid+pudFa2I++s65fpLLvDdytJZpv4YJZkz23Xk/+eF4GhogcUXkHh6WP9PDID3MvXrfu0zCxWwK7yobH9y3y6JwBJ5Cr76uXh1Zreemn8fdBaifKP9/daLcNJQJsEwyu/YKGmei0gtwxXsqHiuYKPi8bcoEyX3+W6jRCBtB60ncx8hPlN57ftXmQ6Jczs50vNEGDbW1tkKF8s08TbC/ApwHRqAddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZv9Md6+lu19ooIb0ctvUsQHPY93LbVvBpO/ur3mqFY=;
 b=c7wJQr8qNj8wfo52Qw8S6U8Fe+j5zfyBRmv1Bqy+nva/+V9hTUGhha/2qoR8VGVRvAKw0ZYWcb0XfemT8f3DfsQL63+vlSDndhiGlhEhkaynpjLEjSi/0MFgOGNavQ/PXhJBxrJD9quyyx5eB3JT+AefUT3z/l8Z09TYxKV+kP2+GL43Ten57c44cgRiRS+AmoRryXf4bpV13sYNh7ZRRdN/e4UBMMo1+U95TESk3nFAGuef8JzFZxj7BMEX18v8BL+GAP2p6IWz1T6SN0GhXkpS817c7xwc59+vbdsCNr4u7bEvUSCPblmNn4qTIWQWwzVnknyw7ovU6SLl90jlFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZv9Md6+lu19ooIb0ctvUsQHPY93LbVvBpO/ur3mqFY=;
 b=xc+2ktGrBumwh14B74lXlWOQJJvTQJ4Qes3LOeiPzx+aE+Md+7aMR53YnPtGWhd4BB7ziM+3K54DS/qX+U03CEoRDLZi7MR2jA8+VSm/KSgSGgC13ezOMUMkAAZFAcZOBvVE+rZ9bp3Dmleatrs4cHrwP4thG7/Cab2/IR/fmoZxg+U/PnWYZxr4AO4hV2FTxyMLpwys/iOiZHdsx5ztA8YPmV1xmWtmXHZXl+s7sfWjv2sdijW0TzaJkQYYUigWCmh4Z9WnjiCVINNuXBAUtntaGlmpzO4E5CNXokPlj0rFAq6TveLozLE59B1KRG7sm/yFU0nKZKIKsUsBl/q/aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72b13300-57b5-022c-75a1-7fa588752f27@suse.com>
Date: Mon, 13 Feb 2023 16:02:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <64aba76d-1746-9f6c-109a-e8c3bf1e1b61@xen.org>
 <e0ab939d-30f0-f9d9-1913-6e63e7023d0a@suse.com>
 <1b079086-ffb7-2716-8092-b69ede4aec8c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <1b079086-ffb7-2716-8092-b69ede4aec8c@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6952:EE_
X-MS-Office365-Filtering-Correlation-Id: f4832199-a6b1-4146-128f-08db0dd347a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wN4dPTgSpgOA9EAUXWg+42ZPJR2EIRFJOmhomzOlSqHJkqmmhrR9lYZVC/2x+k/zg0sW/zzszwq4lieHrOcajdPLGhN0uIdFJ7MQaizDcNWSvcQY6z5XmEuDkkpZDpMFZ5AYmL4euZLegD0EokAm6VNSYmNNKGCM1LU08tOMjBdpFDR1JpQDUH9CrIoAKUYLX7tQgIEbYwWHcFffA6ROZjhWMfPKmKG/KmntuHqb2MvsLf/VRNEBYzKvbx+Amt1k4zZSmlsdtHEJLCk58Qzi8cR57Qzcm46xixZLKupUNZq5BeNIbLU5X2VuoZ7BOKdEAQK1VUSzUtp3zoR+YI8GO8CYzfCpa33baI3bUSGu/n7jgq/MYtKxXzjc8Z+FwjrB3Hj5hCuxZ+r7PWI9LMmoVe9bwRqpgu6/QMI9ZfVGMVjeJEsfe/C9xeOeK/6IbbSdkMOWwr76sZA2uQYXpVQUi+Hid+sG4mXX8T4ymDgzdprI539TLBOOSAsHvi0dVzxIz2nkJOIdJvSidQGXGKvP8G39LsPiauVRoAi1JZXZEuCS2/CeX7HefNUBbJynR2FlSScfC+zB5NIuLkLnMFBMT5WkCzcJxaTnpr6Bbp4/iNITb/WLIinc2VldclQ2a/12H/f/xbB7Wa2knXte9IY0Ri9l7HvlyaphcO12xEINZDglSAPeQqrUSKC1dwbqExtAhoqVpSziOrz6KPFZyZNIhjVbfgRTl5BV61jWcvx8TqREuJyVlNwy1kYlWU/9unBl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39850400004)(366004)(376002)(396003)(136003)(451199018)(26005)(186003)(31686004)(31696002)(86362001)(54906003)(83380400001)(36756003)(6486002)(316002)(6512007)(53546011)(6506007)(2906002)(38100700002)(5660300002)(478600001)(2616005)(8936002)(8676002)(6916009)(66556008)(66476007)(4326008)(66946007)(41300700001)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UHlaaUxFZFBwSHNnNUdkSHA5WUxYT2FSWGpEU0ZaR2JTenVRcEhCeUtabW1J?=
 =?utf-8?B?UDdLSFpucjZJRlpORyt5ZTQvRFpIL2k2UjhVUldwam5QaFJ6aWRPQUhqOFVN?=
 =?utf-8?B?L3ZDa2RYOTU1YW9iZjQ0ZXVkTnB6NmI2dVpDREtrWUl6MlhrRFRtYXh1Q3hV?=
 =?utf-8?B?M3YzTU9hVU5KaTRZRTJMV1RDdDVya0dnQVlIUG1OY0tOa2lieDM1eEhOUHhr?=
 =?utf-8?B?Z0lFaUx2MUJZdm5Kd3NSMTRkZU5nWUhtRUREL21HeitCcHY4OFVuL1lWdmFw?=
 =?utf-8?B?cUo2VWVnVEo0akJiN3JCdE9nRjViQ2xIYzZvb3dOYmtUVmxFbm5EU0F1dW44?=
 =?utf-8?B?YWxhSU5DUFA1cS9qVWcxeHhmSUxnd0VvSTg1Q2p5ODZXdzJUSFBzQXlkV2dV?=
 =?utf-8?B?a3lzM0xUbVNQSnJvRnl5T1dXZmhhMUZWWnVmQVFqaE45VHNyTjRrTjBLaXht?=
 =?utf-8?B?UktTR094OVN0bVlHTFp5QzdndEJFSHZqNG9lbWVML2Rhb3k2QUI4NTUrdmM3?=
 =?utf-8?B?UURVVXZLV1NPY1BPcDRuYzFFMDM2YTVKNmxidEFibWNSRUsrTlpIUkJCVGs4?=
 =?utf-8?B?ZTFSU2RDOVZFUFhvbSsvWTNFOUlidHIybllsOXBMa1R2aVFRWTgxMDAyN1JE?=
 =?utf-8?B?eWQ1L25CLy9qYjVRZ25BS2Y5cVRhdGtoL1hxSUpmcWFERnNKWUNVeDVjWUZM?=
 =?utf-8?B?QUZZMkltTnNCakVpd2c3cXlSWnQrY3JOZDJJc0FINkFGU2ErdEdBcWMrNW1u?=
 =?utf-8?B?QUszSm5zK1ptQVhSVldKRHA5YnFTNGp1NWdDMXUrSFAwRWQvUlR3T3g3Tmhr?=
 =?utf-8?B?RTc5WFF2cGhEdDJzUW02OFFUdXh5K1RiSHdjSWhTWGt1UVR1b1lXU0FKU3Vp?=
 =?utf-8?B?UHZxK1krYU4zOUh5N2lYMXZhWFo3SC9lTm1tNkpDMjN6ZXdxaGtiaTdsWEZF?=
 =?utf-8?B?NkZzbnFYaXZEVDV2QkRpcVJmZHhIb2hKU0VDVmwwUUd3dFVKTmdSR3QvYmRZ?=
 =?utf-8?B?SHQrT3R6aHZLeFpDbjlSSFo0OStoRnUrd29jRUE2b1p5ZlpJWjRHM1ZHbjdM?=
 =?utf-8?B?SEdBd3NpRXJ6OGpnbnEwV2NCa0pldjl2a2t6T0tqOW1HZ2JXYzNORXowTC9T?=
 =?utf-8?B?Q3RwMUZYMnM1WjJFRERaOVQwN0ZQcENJaHRzUE1PRW1jMEptK1gxdTZzVXBT?=
 =?utf-8?B?Z2NyaHpKRXdmV2pyeE83c05YWlpsTWlTK3FKRzAyOVlqMUxLSXBKYkx3dnND?=
 =?utf-8?B?cjVtUUNVVURDYVR5WlN1bzNYMmkxanVHeUw2cFZaS3lZeUQ0cWh1LzAzYjJz?=
 =?utf-8?B?aUxmalVrSnNscWhzNkhoU29pNXF1MnkwR3MrU0R5dkpNU3I2UlNacUx3UVk5?=
 =?utf-8?B?ci9xZ2Y4WmdBNzlEZnlkNVNaZ2NSQVI0eEJxRzZ5dEsreEZEYzBwUHNsNUti?=
 =?utf-8?B?K1BpT2xaV3ZNOEVGQ1hOL1dUUm5yZGRNajlmY0I4SVZWZXluM09yUW1yQzNl?=
 =?utf-8?B?ZDR1WWlVRjRCYTRURS9vaWx4RUIvVlJib1BYWUJPVEtsdHpiREgzb1RIUnFt?=
 =?utf-8?B?SGJ6Z1dVQzBjR25VQ1orZU5JSXY3WjFNMVdGOXRQNWdjdWhUR1JvVmJUWktt?=
 =?utf-8?B?QjRGU3ZlUmNxWFR3RmcydGxVZjIrVGtqNkJqM1pnN0FMdm0wYm5vM0RjTVh2?=
 =?utf-8?B?QXhLWHFXMlZtRy9reitqWlNIb2FUQ3E3M0xEV1IwWDhubEFXd0Q0Yy8rT0dw?=
 =?utf-8?B?dXZCenhWOERxWFJocnBqRXA5VlpHVS9zUGFyZVVxbTdqTm4xTnNUUlNXNWZ3?=
 =?utf-8?B?blVHb29NMlVrR0xNK3JBWjNnWUVSY08vYTlDd2tIYlFCMUdRR29KdjhoVXFB?=
 =?utf-8?B?Qm40SW81QTUwdUZrYUk2QW9qSytybEM1REhzYXhxK0IvYnRkcGpZM3lHQmdn?=
 =?utf-8?B?YmRWM2JackY0ZXFHVUlRQXpyb1A4RytPanA5MHVmdXl5d0M3VUhrUEdKS3pL?=
 =?utf-8?B?VERlZnpOVGlWUHpLellsQ0tUcTNnS3RwejcyMm9rRmVKUjhSbzM5Qmg3TDNa?=
 =?utf-8?B?QmQ0YUJqRDBNekVnMGFoTWtvSUhlUGNRWFdlWnZqbmdvSXNiUDE3RjRsbkxt?=
 =?utf-8?Q?8W6extmcAR5V7U0YpOF+G7H28?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4832199-a6b1-4146-128f-08db0dd347a5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 15:02:09.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dg59qbpjiwjA/Za4JupaN82iCsYjs+Xa6yV3IGJkaxU+q7dTjpC+BaZReDtjvjbcRhpFvdI4Y9YJxB8NROfgkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6952

On 13.02.2023 14:56, Julien Grall wrote:
> On 13/02/2023 13:30, Jan Beulich wrote:
>> On 13.02.2023 14:19, Julien Grall wrote:
>>> On 13/02/2023 12:24, Jan Beulich wrote:
>>>> On 03.02.2023 18:05, Oleksii Kurochko wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/include/xen/bug.h
>>>>> @@ -0,0 +1,127 @@
>>>>> +#ifndef __XEN_BUG_H__
>>>>> +#define __XEN_BUG_H__
>>>>> +
>>>>> +#define BUG_DISP_WIDTH    24
>>>>> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>>>>> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>>>>> +
>>>>> +#define BUGFRAME_run_fn 0
>>>>> +#define BUGFRAME_warn   1
>>>>> +#define BUGFRAME_bug    2
>>>>> +#define BUGFRAME_assert 3
>>>>> +
>>>>> +#define BUGFRAME_NR     4
>>>>> +
>>>>> +#ifndef __ASSEMBLY__
>>>>> +
>>>>> +#include <xen/errno.h>
>>>>> +#include <xen/stringify.h>
>>>>> +#include <xen/types.h>
>>>>> +#include <xen/lib.h>
>>>>
>>>> Again - please sort headers.
>>>>
>>>>> +#include <asm/bug.h>
>>>>> +
>>>>> +#ifndef BUG_FRAME_STUFF
>>>>> +struct bug_frame {
>>>>
>>>> Please can we have a blank line between the above two ones and then similarly
>>>> ahead of the #endif?
>>>>
>>>>> +    signed int loc_disp;    /* Relative address to the bug address */
>>>>> +    signed int file_disp;   /* Relative address to the filename */
>>>>> +    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
>>>>> +    uint16_t line;          /* Line number */
>>>>> +    uint32_t pad0:16;       /* Padding for 8-bytes align */
>>>>
>>>> Already the original comment in Arm code is wrong: The padding doesn't
>>>> guarantee 8-byte alignment; it merely guarantees a multiple of 8 bytes
>>>> size.
>>>> Aiui there's also no need for 8-byte alignment anywhere here (in
>>>> fact there's ".p2align 2" in the generator macros).
>>>
>>> I would rather keep the pad0 here.
>>
>> May I ask why that is?
> 
> It makes clear of the padding (which would have been hidden) when using 
> .p2align 2.

But you realize that I didn't ask to drop the member? Besides (later in
the reply to Oleksii) suggesting to make "line" uint32_t, you zapped the
relevant further part of my reply here:

"I also wonder why this needs to be a named bitfield: Either make it
 plain uint16_t, or if you use a bitfield, then omit the name."

I thought that's clear enough as a request to change representation,
but not asking for plain removal. The part of my reply that you commented
on is merely asking to not move a bogus comment (whether it gets corrected
up front or while being moved is secondary to me).

Jan

