Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC1A6FEBBA
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 08:25:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533120.829508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwzjv-0003P9-9B; Thu, 11 May 2023 06:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533120.829508; Thu, 11 May 2023 06:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwzjv-0003MS-5k; Thu, 11 May 2023 06:25:23 +0000
Received: by outflank-mailman (input) for mailman id 533120;
 Thu, 11 May 2023 06:25:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CrlD=BA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pwzjt-0003MK-Cm
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 06:25:21 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0614.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99c66f46-efc4-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 08:25:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9095.eurprd04.prod.outlook.com (2603:10a6:20b:446::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Thu, 11 May
 2023 06:25:17 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::8e41:82b6:a27f:2e0c%4]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 06:25:17 +0000
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
X-Inumbo-ID: 99c66f46-efc4-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeeUcyFCRI82HHdCj8qbYaZlTDR9M0IHjFz+XiBDfVSjSekrN2hxLmTaUkkUOfSdNUmA1RHdmk3RqMNOkSBM8tJb2+EuZwGhPA22Xfs+kaHTlds63fWnKEVMnVTvCocKEYAT59snP6Sa82AcULbURKYygog6yoVhtAiOP+6tLcbFXv1MJxC29NmGoYFCuuyagSlPDP5AJQzz/+uLOB2C0FnzkSH78jt5Gzkjq52YeerQb/NhCo5JYlyek32O44PxfuNJDlEa83UzrUKzHWUIk7eqMDskxdELBT1EBpwWg1CSQs0TLQTRZqRv7bbDarhHCZ2vj9sgMT1Sst9Q47BzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXrwMBcrWt2CFGtRdG26GLGiO6lMsVKCulPnAkeuZQg=;
 b=G7omN41XQ9NAc2tNaA+HGrbkwcodEry6uA73zXUqAYui9cIG6u6GHrcf8pE2A+LxbMAUKJDo+/z97KJbih2T3fkhWuOPVJqR7KoxLEgc/jjF/8HPRXy+OkeF5mREl+HUvoE0Ag8C/OBuaBbFlKQZclHS3V566suiVsN/aztqHpwxUKuUeh/2NnCEXX05SHWG4rkkNkTALjKYPmaHe2AbcDjDA36NEFzU7hnl8zSqFxrf42/LktNBhWnwfnyFufX3Q+CuSIH4rLun9R/hvWjDJ0wI3HkBChzds+ysSsrLcSaBSkiV2XPv2As+O4JD1GgyMVlBCXHa2bXEG4SzwUmgLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXrwMBcrWt2CFGtRdG26GLGiO6lMsVKCulPnAkeuZQg=;
 b=AkaJpJvIDPjCPEVqsgGNf0oLTAK1ZUPS9lTZNEKfKKJzdRr9RwLRdy7ZUd83iB1nb5m6jjs687s8SGP9ul1kqFE/0b8Ow8m+uAANmAPH8Ejds7dYTQA6EgP6ogIpLf4jsxfNtuZDdYL8JPMRZAtJqTqrbjKrBZ7npYFYbMvU8m9HiKXl7CJuBvqAHAEenl/W/unZ/H4IKWy2iYwzV0wFNInTiWomPNndLXLb63mF6ofakyehzYigZSvZVwJs1DdQO365p8+tIqLpj/1ejfuJ6ct8j48Pkn5CzvDiAUKAcNhQ8FBErS6HXralOQq7xXEtfOw1hmkcQF78hpMt89CLOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <da5579aa-c37e-a67f-002a-23b6f6cec7e2@suse.com>
Date: Thu, 11 May 2023 08:25:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 09/14 RESEND] xenpm: Print HWP parameters
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230501193034.88575-1-jandryuk@gmail.com>
 <20230501193034.88575-10-jandryuk@gmail.com>
 <256fc66c-066f-3f0c-b34b-a237e9268f22@suse.com>
 <CAKf6xpu=KiSkjGpyRYBCpYh67XhdtmjvwLjthkpTbE+HoNQm7g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAKf6xpu=KiSkjGpyRYBCpYh67XhdtmjvwLjthkpTbE+HoNQm7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9095:EE_
X-MS-Office365-Filtering-Correlation-Id: cab958de-d93e-44ab-1e71-08db51e87ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ApKWb8Q3XDgyfI96uvschLwkUVpjhyzqKSGx4+WQ2XRqjBTsRbwcIbM5OfwKcRZZbz3zMVz8/sR3vvHJBWmrlwt9wKRq/PZ2Ua6Jv5JmMU9lg7nooQX+r0UCmE99f7VStOwDfC9DbKw/ahwqrzxadismmsigCxeD8LEEannd6GDyhz6w6xG30I7koBnQW0mTqe1+N+nTeD8dzkc+FJvJztEeLSx1nrMy33zQKhCAlvXpMOC3Cm0F7ecQTmUwMSk/lCDlDVzR4cgpIwQjwis1aKwStIQegWMDwB7LsJaJp+5/Ez1tKmp+FCUmIVn55qgGzbu0r7+05L76WqKJsFkYXCHVovOTsL2XUB2iZNQzgGAyFxAwgLB+OOO96WON63zkQKaMx02UsGpjZvvzXYsnd2mGsF/q2pPQSd91wnommv9y8JJAkmram6wOua4HHvpo8SaUmb8imNyboSNvlw0qzomXTSarQs2XKoW1v3K7cqg/kEl8EEv382UxHxtLvx7Zp5Sie2lvF9Xp/5ANzEn20yu9stFlOWnX+ANfV0gU3YHeddKItHuWXAbdAHFsa4/PmPQOGMphyCkTPHECTIA0FCm7SO2XucIdlEUtu9nz8cBUGmiarMvhNBQEWIJqlD2v1dYKp54RGEroY9ArcrCmUQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(31686004)(66556008)(66946007)(6916009)(66476007)(478600001)(6486002)(6666004)(54906003)(316002)(86362001)(36756003)(4326008)(31696002)(2616005)(6506007)(2906002)(6512007)(53546011)(26005)(8936002)(8676002)(5660300002)(41300700001)(38100700002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1FraGtwNnNiYjUyVjVtTitPTXJWZ2pjWXFpRHNKS2lBRENZRCs1bVNwbWlZ?=
 =?utf-8?B?NHZsTE14Vmw4blVXR3pTZVRaVUVPUU5vQ0svelRneE1QY2VFVE5wdWNCRzFU?=
 =?utf-8?B?SVRGQzhGWjlrR29Eakk1aDFaY2ZqRGRmZ1d2NWxxNkxqYXBxcWhrUENsSGVn?=
 =?utf-8?B?aU9UdGxXanN2b1BPTHVhaTdybXd0OG1yWnRscGFzeXR2T0xXQ3R4QjV1Wlpz?=
 =?utf-8?B?UzhWQlJCanpLNDhuQnBTK0lJR3EwWWdSUkwrMXBaNkk5WHpOMVFhOVhKT25r?=
 =?utf-8?B?bHZ1WURuTk5xaGZOZEJEWkNrT05yVlRxT285SzU4Mzk1S3ZmSlVFK0ZCMlVH?=
 =?utf-8?B?VTZRNHcvQ0JYUW5rMEJCN3JkeGkvMTNzdzRpaFphRjJzZDFKb3VCeVUvVGRn?=
 =?utf-8?B?WUVqT0pSY2lJdGdtS2VRTHlPUGViMnBRc3I0M3NpeHJsWG9jSXNYWUN5NHRv?=
 =?utf-8?B?NlZpSFdkd2hsSlgzVlpLMHlBVkduNkI1c0RkS1lvNGhST0FTUE5JM3c3Kzkr?=
 =?utf-8?B?Z1FWSFZrRW55UkdpaXJvYmZ2MEFBd001L0hIaXRWYnhjNlJOSGViM1ljOGpS?=
 =?utf-8?B?UFZWcnBORzVQVlUxUXFGWUpDU0dLVE9QSU5WeHRzODZrWnpXdFlkYWc5TTlx?=
 =?utf-8?B?ZDgydW11cmhQUzhSeDE4bFRkODRYQW5OVWhZc1VKN0MweE9ZZEx3UW0rOHlu?=
 =?utf-8?B?WVJIaUowUS9QWVhIU1h4ak5NTFRydkVtbDdLMU9mOERhTjhSb3VWMWdsQjRw?=
 =?utf-8?B?MXRrZExLek9KSmdoNWF0S1lvRkp5aTExOFB1WlEvby9DcDZEMS9MY25nUi9x?=
 =?utf-8?B?Rm0zaWdaQ3dVN3MxTDdlNmMrZUNoSU9ORVgvcGxUaVlZcThoazAvV1BEb2to?=
 =?utf-8?B?bkZxZEE3TjY1Z25oL1NtMmVrUEpuWDg0TTBlcDdCaVhVT1dCdnY1UzJyOTFO?=
 =?utf-8?B?b3RaZnFMNnlGVVdVZlJSTitib3BLVzJMVndlTEkzVHhMVGJEQm5wUjlhNi8x?=
 =?utf-8?B?aEJYUnVvcWxxNFNPZ3NTRzVsRUJBa0lIK3FDRlBXSmFnOFRBQisweHFWcmtC?=
 =?utf-8?B?T201a0t5NVQrVmlNYWZvc1hsTi9WNWJ5VGpvVTRNcGJRWkJIQW5ISXBoY01G?=
 =?utf-8?B?YUViaHJ2WE16OVVJb2JBcC9CVzc2N2FzUUtZN0Y5M2hLRUJra3ZIUEtmVlV4?=
 =?utf-8?B?SDg0NEdiSjg4YjdtbjlDVzZzaDA3MXlTNkFSUzlWRjIxTkduQVhvWDB5dFFO?=
 =?utf-8?B?K29CeXRZdGNLalIzandlT3FyVWF4OEdVbjdYSVJVTmh4NU1BcmpQL1h1M2U0?=
 =?utf-8?B?S3dVekVobkJ6QThiQWkzdmtYRXFHelZnVzhrbWx4Y1BUVkhBb0YzMDl6WnRp?=
 =?utf-8?B?Z0NzNm01MHR1VWp5Q1RSUFcvTWFIT09VYitRWmtNTDVHTWFTZjZiUXp2Tzdo?=
 =?utf-8?B?ZFR3ODFVdnVlTW05YmdPbjYrZUJKaXE4djhlb2Nja25vaWVuZkwvU0hnMlNY?=
 =?utf-8?B?eDh2WVJxa1psYkRKUnNCWHhFLzhEM0hvVkYyU0F5QjVQRnJCMXZhVW52cmpN?=
 =?utf-8?B?RkdQQ2hpaWozQXl4V0o3Z1cwSFNObkdsMFU1alltVWJkcGdxbkU2by8vL0lU?=
 =?utf-8?B?dTZVd1RaSWV1UCtyaUZxT0dZbmV5aEVHMHJ6bDVVV1BFWCttd0JRdTh1bWtK?=
 =?utf-8?B?VDF4ODBNWVhpajFIdGhxSHZpZGM2NW1hSjhqUmlFcFpTTjBBdVpLN2ZiWjFj?=
 =?utf-8?B?MG84K094ZkNxZGlnYVp2TS9jWUYxSVpJVTdrSmFZR0VscERabVpPaWxpZkpU?=
 =?utf-8?B?djhkWFFaaXdxd0N2R0Jyc21QZE1UT01kaDZEeC9OZ3ZtSlFtdjVDY3pGZlRG?=
 =?utf-8?B?akZ2M0hzcXg5MUlndEpwZ2JBNE5XMDVRVms0cTJYNHU3RThKbE9zN01taDlM?=
 =?utf-8?B?aUhEdHdhejdTR3NFMXZGZHJNS1lMVkdCM1Q4c2RCbVR5TVhmTHZFdmtQbEdN?=
 =?utf-8?B?VkpsOTRkWmRUSGMyaURsajJZUVNBMXNuSzNvNjA0U0dOL0ttL3p0S1VvVGRo?=
 =?utf-8?B?aitqOTlDc3BjU2N5bHhXUHVJa0dRNFNvTFFicTJodmNpd2oyendwbjJzVUVt?=
 =?utf-8?Q?prXjksmm+b0lhH/ZyLKpYgQQH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab958de-d93e-44ab-1e71-08db51e87ca5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 06:25:16.9882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8U2/E0nNeX0ieeHZEIZThXEBfizFFhhkL0jztCYyjjxBFtWa6Z6Mr/CtTKj8w5Y9+RMuSN0Lw7oigQTvK8pqcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9095

On 10.05.2023 20:11, Jason Andryuk wrote:
> On Mon, May 8, 2023 at 6:43 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 01.05.2023 21:30, Jason Andryuk wrote:
>>> --- a/tools/misc/xenpm.c
>>> +++ b/tools/misc/xenpm.c
>>> @@ -708,6 +708,44 @@ void start_gather_func(int argc, char *argv[])
>>>      pause();
>>>  }
>>>
>>> +static void calculate_hwp_activity_window(const xc_hwp_para_t *hwp,
>>> +                                          unsigned int *activity_window,
>>> +                                          const char **units)
>>> +{
>>> +    unsigned int mantissa = hwp->activity_window & HWP_ACT_WINDOW_MANTISSA_MASK;
>>> +    unsigned int exponent =
>>> +        (hwp->activity_window >> HWP_ACT_WINDOW_EXPONENT_SHIFT) &
>>> +            HWP_ACT_WINDOW_EXPONENT_MASK;
>>
>> I wish we had MASK_EXTR() in common-macros.h. While really a comment on
>> patch 7 - HWP_ACT_WINDOW_EXPONENT_SHIFT is redundant information and
>> should imo be omitted from the public interface, in favor of just a
>> (suitably shifted) mask value. Also note how those constants all lack
>> proper XEN_ prefixes.
> 
> I'll add a patch adding MASK_EXTR() & MASK_INSR() to common-macros.h
> and use those - is there any reason not to do that?

I don't think there is, but I'm also not a maintainer of that code.

>>> +    unsigned int multiplier = 1;
>>> +    unsigned int i;
>>> +
>>> +    if ( hwp->activity_window == 0 )
>>> +    {
>>> +        *units = "hardware selected";
>>> +        *activity_window = 0;
>>> +
>>> +        return;
>>> +    }
>>
>> While in line with documentation, any mantissa of 0 results in a 0us
>> window, which I assume would then also mean "hardware selected".
> 
> I hadn't considered that.  The hardware seems to allow you to write a
> 0 mantissa, non-0 exponent.  From the SDM, it's unclear what that
> would mean.  The code as written would display "0 us", "0 ms", or "0
> s" - not "0 hardware selected".  Do you want more explicity printing
> for those cases?  I think it's fine to have a distinction between the
> output.  "0 hardware selected" is the known valid value that is
> working as expected.  The other ones being something different seems
> good to me since we don't really know what they mean.

Keeping things - apart from perhaps adding a respective comment - is
okay, as long as we don't know any better.

Jan

