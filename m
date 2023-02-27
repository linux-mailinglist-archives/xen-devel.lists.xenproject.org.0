Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C4C6A43E6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 15:13:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502597.774465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeF8-0004eM-GI; Mon, 27 Feb 2023 14:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502597.774465; Mon, 27 Feb 2023 14:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWeF8-0004bJ-D4; Mon, 27 Feb 2023 14:12:42 +0000
Received: by outflank-mailman (input) for mailman id 502597;
 Mon, 27 Feb 2023 14:12:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWeF6-0004bD-BK
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 14:12:40 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca17dedd-b6a8-11ed-a82a-c9ca1d2f71af;
 Mon, 27 Feb 2023 15:12:38 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7941.eurprd04.prod.outlook.com (2603:10a6:20b:2a6::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 14:12:36 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 14:12:36 +0000
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
X-Inumbo-ID: ca17dedd-b6a8-11ed-a82a-c9ca1d2f71af
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vg9npoC7ScTv/fZCCxnHmB5YgU+nK+JS1kmCVBiUl96+L0L798vdy9uVO2umSuwLp9AZhf4P3aoxpTkl4525D8Y06ItOGuM7AXS07vAhsEAj3r3wZmQuqmvJcSUah30gBu0sL2QtI0UZIVbq8OhqEyMzTkAi3L1drEm93cHxXSzLpqHcvq+HInNPDaPaGobCfj+i+DUSvhmRIyajXa9Zo9/FMB1LcCxGD/2f788n3aebXtIp/mWfEHd82VOKc3AoVJjEb40foWjNxrFGqNzH+ClJ5gEnanxkN9l6T3CLXZcliEeRfy9ehcFk2BUJE9QPg8tJNdxXxpIsS0Y0qJ6/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQ91IXZhrrx8D3X41KN6MM1VzZYrwKvYfNIp7BnIAt0=;
 b=Ewf1qV8EL5hkH/Illq4y8AuW9StEH+pUEPFjWPFs4bvUuwX1TQGZFtCO2NbwcC4jqsy5+Xsaa0+3ZiFFj4f0yMNtgLe+Z/p6MyNxPPWvPxW7/UtacpcYejizUYt0r33AO0N/xRK9nZvwTPZMXszyzbAUCpZfztkhEeVPPltl2Xa0HtVnSrrJ6uBYuTWDqOOQhexQGrgPktXqTcjYPTqJG+Vp2B+XvSu41UITjH8A0Llk4eYxGabsnS992iI4vwGj1wEzjEDoR6kJk/N2bIESyWXgAm8S5Xk6+ghxDF4YAdcKSDgYW0JP5qJECkjmvDa+8IXcYOYYhp/4XpLDhd1V0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQ91IXZhrrx8D3X41KN6MM1VzZYrwKvYfNIp7BnIAt0=;
 b=JrCbX/hc/Xqj4BFTYytbaoJTBcr6Dt6ZlscEgC2uJUhelJc8mwhuVGRdg3gIrIkVPepFIjJ6Q4MOxb1AxfemYAd3HnL++zX1EdCvnUledbFn/2rb8Xw942gWYzzpeYZXvHtXZ7/SIBypabTMvGqQT8hZ1eCbzdl520A1NUEvtzuZ+Sxi2qZxM9kwnwHddelIpzUvMwUDXuY63GeZN1jIG7JyPedj4vxSgX//C0eCE4xUMQyqGOicSK8Ohr//JNdj7JZ2zgUyuv48gCiJO0XYDh9uB+5LITM3WWSX1ncog5JV+dpMeJHyryZOIT/FvfQTcELMudD3qKltWoBXdP7MJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0e933169-a5a6-08b3-aae3-8ebef988fb8a@suse.com>
Date: Mon, 27 Feb 2023 15:12:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/3] tools: add offsetof() to xen-tools/libs.h
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20230227120957.10037-1-jgross@suse.com>
 <20230227120957.10037-4-jgross@suse.com>
 <8865a525-b55d-9b4f-ad2c-fe1f70afd0ba@suse.com>
 <809b25b3-1e8e-43ee-dc3a-1a54a938c9f7@suse.com>
 <da345d46-3027-f0fa-bef7-04494da35ac0@suse.com>
 <6a888edc-0b5b-117d-a216-ff28ad7bdc41@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6a888edc-0b5b-117d-a216-ff28ad7bdc41@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0085.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: 043223cf-e31b-4817-bafd-08db18ccad67
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VkJS7bVRZrluhw8qCIAG4NycxbxFiJZYgrbjiPe5wZyUlrQ/o7zOdZmGgex8Y79/oE1ET6XhRttEDiMqPJh+ufUDdnQiRzUzBHj70YDmBLcCGUeaRrn4K3+uFDpOnwNieG13hWDfjBL71bu3pnMIv6ynMncs0y05ffcNsiOzj7S30nOmtBmLtWQeo7Es9FFNFQryZMUR5Ys93Igwg3UI7kDJva8nOfbruVE4wbW9/QxXG0O2cD+ICqAGPWssxnd4Tk2P0nqJRHf1UmxPYiMWD2fBTxG8jMHr49njBDw2CsTwC7rA+9N3dl/m0gsII8ALbd1UriBrrN3Mdr3j0HVUTMzBCISdaOBoCB3u+yTxtWtR5IRFmgoewy4+aojalFo4wnJ/wyfe4MVTf2k0WBSc42kGVfG4Fya+xw9yugC1WdcxHTLDahTqhoW3SY9zdTDDM7lf+we+QBkAI1jknf64bgTmPTPOlB3Q0O+zQVA7A/HFoavVIDkmY1ogZsrFFHp0FEYeBIjBRj90HMix1e7OXS6EX1+aW2ak3QBuEfIr2uBTmohnThB0n9BZF6ohDlk2w5i/2QXjFEYZri4eBe58P8mDXaJyOc++aqxgxUSLGts+3wJIqn4XVmNSj1SkekoUo4FafejoQSvT3CMS7q4A8lJMJaKzSf2aVb326u3Nhp/CX5g60jZE/dNBxNFOEOByeZOERGk9+WAZQ/SMJJ13I6kQiEeNmecaFiycRamHyf0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(346002)(136003)(396003)(39860400002)(451199018)(8936002)(2906002)(5660300002)(31686004)(41300700001)(66476007)(66556008)(66946007)(4326008)(8676002)(316002)(110136005)(6636002)(54906003)(478600001)(6486002)(26005)(186003)(6512007)(53546011)(6506007)(2616005)(86362001)(36756003)(31696002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE05UmtXZm12eHF5YjlMNzlGeEgxdE5RaWVTTTJ0OGtZQVBtMGdabEZCdjBB?=
 =?utf-8?B?NWRaS1VSV2ZOdTN0S3BkOW16NDZtdHc4NWdTOVI1WW9md3N3Nmo0dlIvNFVD?=
 =?utf-8?B?NDRqemQvSWxqZDNTeDNkQnUxM1kvN1Y2am9XNk9zZmhuUUR0SThsakpTZUxD?=
 =?utf-8?B?VEt5OCtXcmVVS0NOdVZPT0RaQXRpTUsvTVdrMWhnMllZMmNBN3Q5YThUVy9k?=
 =?utf-8?B?WHIydkY0MXR1TFNBdjkrbXUwZlZJUGh4Y2ViUmg2dUJLT296YUp6N3ZtUFV5?=
 =?utf-8?B?K1hpQXRjTUhQSTBPQ1ZrbmpPZWhNZnlxNmZJd1h5TnRaZ3U0Wnh6RkthelhZ?=
 =?utf-8?B?ZVdWRW92Qit4QXpkT3Rhc2VXSU40UkU0emFOdkJLSVNib2E0a3R2TnIzWDZS?=
 =?utf-8?B?WDNiekVLRThYQ2I5cXlIS1ZKc01OTm5GazNiV0k2R3Jkc3AxcHI4dzF4aUdu?=
 =?utf-8?B?czhxL3lFaDRJMGpWMVdaaWlJeUZPQlZnZjZDbGpTekRQVHFKUlErMnlYa2U0?=
 =?utf-8?B?QzZvSWxqQnZ5a0lVU1F4SktWckpZQmZIamxuekhXdFhYaUNtM2RzYUNXSmVm?=
 =?utf-8?B?ZEhxV3BRdzl1d0MvVjFxeTY5SytzajQrZEpaajRMTUdvZkhWOG4wNElxNHdj?=
 =?utf-8?B?K2Q3QllnMUtzSm5JNXV1czREV3BMNWMxNjVJYW5GQ0hwWHdDQnYrR1BUdEdx?=
 =?utf-8?B?cVRnWDFKK2xkMHl3Y0hFaFVPYldFSkRjcE9NWUsvVFU2WWg3Wk81S01HUVVw?=
 =?utf-8?B?YkFMSGEzWjRhN0UwRWY3cWdRT2N5Q0Q1djJzaEZRUDN1NlVCMk5lZmR0YjdS?=
 =?utf-8?B?b1F6ak5tZTc2Sk5ZbWt6bzFLcFdGZkMxcUpJcTZ5bEZWbDJCWW4rY1dDMEt5?=
 =?utf-8?B?VzdwM0dmdHpDZ2xCc1N0Q0xTcXFXQlIzY1RzdEViVFdwcGh4K1V6TUNjZ1Rx?=
 =?utf-8?B?ckUwQUFESmE5U09wMVlLUGRBc0VpVzRmcnRBMHcyUldqbHY3U25NRUM1N2Zm?=
 =?utf-8?B?Skh1U1doS01TdS9hWUhJdnZpdDlpcTZtNW1VcWYwSlVzVVdwbHgwdWdMaVc4?=
 =?utf-8?B?TFJBVzNwR3puYXV3L1dFamR0dENxNHNZTW00cU9hcGUvdXdTM1RleGhocHRo?=
 =?utf-8?B?YWI0bGpnTU0rTHdkZGt5ZG1Dd3Q3TDkwQzAvZ0I1OVJpVVZyNFdscWtuWEk4?=
 =?utf-8?B?Vkxrb0tEU2F3cXBZZ0NSSU5Hazhld09vN3V5dmFpcS9EajRMUnR4b3MrMFVZ?=
 =?utf-8?B?aWtLUjBwOHozeUl6clF1c212ajVQbWVJK1oyaWlZVEJoelVFZjc1ejhUa0NJ?=
 =?utf-8?B?TEdoNkh4M2NiQVZBcDBENjQvZHg0OC8zSllGWEtWMWoyQ2dROXgyWUdZSWt2?=
 =?utf-8?B?dVVURUw2UHRrN2J6WG0ySjE3MDNnS2YzOFFZTWJaM1FYSFpzTERxdWlPalY4?=
 =?utf-8?B?WEg4UGcxZDROTitYaWlUZ0JoVDhOY1FsZnBVYWpVYkc5bzJiQXhuQmh0VEZC?=
 =?utf-8?B?aHFBZDY1NU1TdVRaeWZRenFsdG0wRmlzbHNnUEI0c1ZFZW5BK0tkZVFUSkFN?=
 =?utf-8?B?TEJKVE1aMndFd2dsVGlyNzRQQTFNUmpxbVVSN0I5K081NENyT1BHVU9NRmpj?=
 =?utf-8?B?eUJEckZOelRISTBUMVMvTUdVMXN1bjlWY2ZNTzd6ZWd2RTlQbDFOUURrMmdP?=
 =?utf-8?B?aWNpM0x2V2hBRy9vc3pvTmFnTVFjb3cyU1Y2aXlEVEJjbzQzL3pZZWJFOG1F?=
 =?utf-8?B?L24wVmRGcGRxTXB5cFdVRDI2T0M5Y2FSWjJ5RHNoTVlNSDZvNmJlUG9tLzM3?=
 =?utf-8?B?R1YvNUNUSFUxekVqckVaekVkQ1N0OUpaTGt0eGtiOUh5K0lkS2tTNlYvbGZt?=
 =?utf-8?B?eEtXRTFYeHVzWlpZR1pQU0JsbDh2TGptOVd3YkwzMjRhblN4Q0xwVjVibEs1?=
 =?utf-8?B?ZTR1TnlOb0x4RkxMZGRkVVZ5dG9mbTI3VjNYQnlGWXRlTVZnOFR5ekJySXl1?=
 =?utf-8?B?NDlUVWU5UDF3NEswN1dldXMyZDNXbG02QlZsejlnVm9iK2k0VGhPaElmSmFz?=
 =?utf-8?B?SGlJQTEraVdkTndwRTZiZmNxQnM2N3dWKzRGUWNoYlNkUFdFa2V1dEJpak8x?=
 =?utf-8?Q?IJWqisnwyidRojT13hsGd6a1a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 043223cf-e31b-4817-bafd-08db18ccad67
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 14:12:36.5802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HggwvHDGoxmo5BYxEzM0WFVPgXSlmHE2dIIhTiwn0szcmLSHLgByfTArOlWlwEmzme7YJM/ZfxsvTVR5Kda6Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7941

On 27.02.2023 15:06, Andrew Cooper wrote:
> On 27/02/2023 12:43 pm, Jan Beulich wrote:
>> On 27.02.2023 13:34, Juergen Gross wrote:
>>> On 27.02.23 13:31, Jan Beulich wrote:
>>>> On 27.02.2023 13:09, Juergen Gross wrote:
>>>>> --- a/tools/firmware/hvmloader/util.h
>>>>> +++ b/tools/firmware/hvmloader/util.h
>>>>> @@ -30,9 +30,6 @@ enum {
>>>>>   #define SEL_DATA32          0x0020
>>>>>   #define SEL_CODE64          0x0028
>>>>>   
>>>>> -#undef offsetof
>>>>> -#define offsetof(t, m) ((unsigned long)&((t *)0)->m)
>>>>> -
>>>>>   #undef NULL
>>>>>   #define NULL ((void*)0)
>>>>>   
>>>>> diff --git a/tools/firmware/include/stddef.h b/tools/firmware/include/stddef.h
>>>>> index c7f974608a..926ae12fa5 100644
>>>>> --- a/tools/firmware/include/stddef.h
>>>>> +++ b/tools/firmware/include/stddef.h
>>>>> @@ -1,10 +1,10 @@
>>>>>   #ifndef _STDDEF_H_
>>>>>   #define _STDDEF_H_
>>>>>   
>>>>> +#include <xen-tools/libs.h>
>>>> I'm not convinced firmware/ files can validly include this header.
>>> This file only contains macros which don't call any external functions.
>>>
>>> Would you be fine with me adding a related comment to it?
>> If it was to be usable like this, that would be a prereq, but personally
>> I don't view this as sufficient. The environment code runs in that lives
>> under firmware/ is simply different (hvmloader, for example, is 32-bit
>> no matter that the toolstack would normally be 64-bit), so to me it
>> feels like setting up a trap for ourselves. If Andrew or Roger are fully
>> convinced this is a good move, I won't be standing in the way ...
> 
> We still support 32bit builds of the toolstack on multiple
> architectures, so I don't see bitness as an argument against.

Bitness by itself wasn't the argument. Mixed bitness is what concerns
me.

> I am slightly uneasy adding a header like this, but it really is only
> common macros and I don't see how it could possibly change from that
> given the existing uses.  OTOH, removing things like the problematic
> definition of offsetof() is an improvement.
> 
> I'd probably tentatively ack this patch, seeing as it is a minor
> improvlement, but I think there's a middle option too.  Rename libs.h to
> macros.h or common-macros.h?  IMO that would be something that's far
> more obviously safe to include into firmware/, and something rather more
> descriptive at all of its include sites.
> 
> Thoughts?

Maybe. One fundamental requirement would need to be made prominently
visible in such a header: It has to be entirely self-contained, i.e.
it may in particular not gain any dependencies on configure's output.

Jan

