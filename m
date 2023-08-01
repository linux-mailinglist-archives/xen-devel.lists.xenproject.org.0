Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ED376A8A4
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 08:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573648.898534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQiVW-0006AB-Tg; Tue, 01 Aug 2023 06:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573648.898534; Tue, 01 Aug 2023 06:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQiVW-00067V-R0; Tue, 01 Aug 2023 06:05:22 +0000
Received: by outflank-mailman (input) for mailman id 573648;
 Tue, 01 Aug 2023 06:05:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OOcM=DS=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQiVV-00067N-In
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 06:05:21 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 646293f9-3031-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 08:05:19 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9722.eurprd04.prod.outlook.com (2603:10a6:10:4c7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Tue, 1 Aug
 2023 06:05:16 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Tue, 1 Aug 2023
 06:05:16 +0000
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
X-Inumbo-ID: 646293f9-3031-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=md+UJ0ui4xmgE5wH7Cot6YDK40K77/akSoOAW/VQPIYpexG+wPHUlBIVSfGM2IxayzDgDrgLIcHScbf3nVfXqUqImenSb4DpbApg6sajbSRwiHziEZQiTSI0Mbd0J8DwETF+W8GuGtQvuIvAnRv7F2DGHKpk3Wgn7uLu40sshN0di/BP8iJ8MN3RE8u5A3kzxWoXinqX2Oot3lsuKd6Pu0Y4rdDbMgHe9nvdjtoAfKTiNiphY1oc0vkJUZHJMqMN++oLQ2SJg8A8cdqcPh6Y3Q4Yw1HbjP/hBiLe0BdBBL3AdkO7G8ar7DoCI49ykCsKAonPnsGWMG3AoCuR40ZbGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AhPl0SC7stn5KY8OCYXi8U52DpOh3sVv03quWlKBUJo=;
 b=IpuYTLiXv4m4hQvk9VeYpeem7Duo/9uLbSTBHXTdNVtkk9wbIv1rQsdkjOfo7HSDkhHFBQCC16us+r8Ki6AahDx4vnrkQIvUK2r75Zbk+YZhNpx2+dM7U43vfV8zhliTjQ9jqI0HisiRNtSi6TM+AIJtnSj3KuCDxR0oDUtaVheGT01VJwcadXEyeLzuHHf8sF2qwS4dBrTiZKGCSkKxL0hwZPv9wKCjGDYcH/z2potYJoAu3qNTpRtSqXvbixz3vp5xCRh5x/oQ0pf/9DuB/DxqtT7jab7INuJFWwVAZ2qGzhIdqXavR9KL3PH4DS0O/N0ulZ3/gE+ciINDUwcd3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AhPl0SC7stn5KY8OCYXi8U52DpOh3sVv03quWlKBUJo=;
 b=G0LKhQ41OV2tZsaCl/RzCQfmQ3zZhwuRXAspdh3B4bS64kvNJgl5F5MMLqCxLw6Impv0EwR6oMSmm/SgxVndMP5B3hwV4Q04hh0MiBsVxBs+PAcQTUwcD/0Xj0vuBlno91JoK9w7yVlMIbkoYIC1gK0+0qzK4qCrPmJWsJO05pGwzvqYK0wkjXqeByNYtV0K+CSmlWgmBAqQubo+4o/fFFyFD1SAfQF4BNdIvtl9NgyQVU9BbVXy/QHeZ//zpm251cTq4MmhokN70jXbR/Xf9ymskVf8jrZHWCLQA8O0Jq0IOuFEdpoMXyyXXMyRpl6g9AB/iqqhUJBWo6kw3Gz0cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <72b624be-b379-6419-38cb-880bb19741c6@suse.com>
Date: Tue, 1 Aug 2023 08:05:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 2/5] xen/ppc: Switch to medium PIC code model
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
 <335ce2a18f8cce679dd8b30d11560989131b4337.1690579561.git.sanastasio@raptorengineering.com>
 <904d9448-1fd8-bcd7-2cbd-c9e5752dec66@suse.com>
 <a329ee02-0ae3-c8a4-5f82-5ea58d865321@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a329ee02-0ae3-c8a4-5f82-5ea58d865321@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0247.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9722:EE_
X-MS-Office365-Filtering-Correlation-Id: 69ecb7e3-2a62-4b38-10b1-08db9255470f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X/m6gVkH9KyiqGPMc5pBAtnNilw7wUTzH1oi2qQbO/ZN957RFgAH/oW3B5+ipIJ8FCSewGEubyOjhe9BdEB1Npx2WSRDUUli6edYr5qDoTawoAeBq9cLFWqTPgVvt6ouuAk9VAxkEaGD63YOY5BzT7QEvps1VUnuPxTIeo5KM/TIaUJJ9xjERYhNy+VWNsv5BrBwxMwUTvymkBobNVxMfH8URNp9wTUY/P1v6PLGFaIjL6fYo+CxVgJ/7scw+o9vnQMxWGfv9J5hSwaJblBbT9oqs1vNqFzTrYA7DFXICMeA2/8dtqvmxS8s0JMyvLaa/RCZ0NJ70B7j89F+0TGD1v7UmfDwvMtsjE4OPozLUMcqVw8LubcYhkJsv75WLiZegkQiCLdD9ATT8QdoRQBZVYpcXSTR4Pw7RiIXM6hLsVsHpkEET8nuaSqg64u5bKrSpoU6H6M+MrnF2rFcOuBsmQAjIzk8hklV7BbuTfpByu65u3zdYKByw7ChOkLUWaaw8TWVSUEyGFZy0uJsioQfu9L2PsdVFJvkQWYnBrhSJU2ScSxruHRgIBksO0Z9TUa8DA5UAvut0aMNnpGjng87Kh3HqCHyEXrey8V61mXHXC7T3tGm80pT1bx88uRnXk9sbDVO9ROMg/slmHfdYhCp8A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(36756003)(478600001)(38100700002)(31696002)(86362001)(6512007)(6486002)(2616005)(53546011)(186003)(26005)(8676002)(8936002)(6506007)(31686004)(5660300002)(4326008)(2906002)(66556008)(6916009)(66946007)(66476007)(41300700001)(54906003)(316002)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0JsSVFGbG90OGVyYlJaTHppT2l5RGkwSVFiUFU1UFBFU0ZyMVE2MFg1RXpq?=
 =?utf-8?B?dnBjV0hYb3ovY21wWWZwT21icTNCQnpQenNyQ0RIaVNMU0h2MDViRWRXMzR2?=
 =?utf-8?B?VkZlWDltTzBzeENTWElNOFlkcHpFS1N4bVFYbk5KbXN6bGFMQ1U1U05yeVNP?=
 =?utf-8?B?L2M5Smw1c1Z4aEZKekhwdDdSZm1TeVZKZFVKSi8yNmdCaldxRndsTXU1RGdK?=
 =?utf-8?B?R09Zb2lRM0Jna1ZRazZjRUQ5L0pEV1Z2VkRseXBGZzFydjFjTHVJaUVXOW1w?=
 =?utf-8?B?d1Iva01BYmZpZ1ZQanVNQldzdmN2L1lUK2l5cTlIRTlTcW1kclZqNUtBVzBQ?=
 =?utf-8?B?eFJ6aFpKS2c2cW9kekljY0ZBcU15UW1UZWR0M2VNM2F0cWJvdzhGWjNKSFFl?=
 =?utf-8?B?UmsrZlJPS2pVaHMzeWc2cXMwUnZlZU1lUFpQRE0rZjFmZlRPeGViTU4xODla?=
 =?utf-8?B?R3REeXFxZWJydGdpekZZQlBJbW1pdWlvUFEzbEtJWTNaLzRVUzh6ZnUrbkZk?=
 =?utf-8?B?c0VoZVRCZ1hRSER0MFVoOUJsbVNtQ0Q2TWJvZ3FlcnFNQzB2aVpZNjloV3hh?=
 =?utf-8?B?czM0VGNUYmkzQU5hSlVrdGFiclJ1ZnZacis3YTAyNWpzQllUNHdYc3I2MUwv?=
 =?utf-8?B?TlFUdTRvVFNVY0hNb2R0SVFTTmxPSE9FelJUUVNTMWl5OUpyVFhSK1A3dWtY?=
 =?utf-8?B?R0FMdVlZRHBhRnBUd3V2N0RDYWh6MGJZQk9mSVdGSHBybHF5SFRjTHhlMWlM?=
 =?utf-8?B?VytmUXpFV3hSSEJOWTVSMmJsNkJES3FCSEZ6TGp6TFdFS0p6dVBaMGN4TXRJ?=
 =?utf-8?B?ajE5MEpXKzY4WWd2dUo3V0RQVDV6amNYZWxST2xSVFpXUCtBM2l3NHRXUUhZ?=
 =?utf-8?B?ZWREcE5nMzN3TGlKOG50bzd2L2o0eG1ua0p1cjYxTTdaNjlIQ0xrYnJCWjBr?=
 =?utf-8?B?ZlJNSjlSemJ0M3N4MlROcWEwcEtxY3NMaTlxR3NvMmNJdTE0MG1PRGZZWWsw?=
 =?utf-8?B?S2JzNEZoQis1M0l5WVZZdm5jR3lJaHdESi9YUUxsVzBRdEpPV3hXZGYwMDdk?=
 =?utf-8?B?cVNQNWdGamU0TGh4MUFaVVZEMkVTVTJsb3Rtdyt5QjBNNUtNeFBKTGNvRkRt?=
 =?utf-8?B?alhWblVqeWFJd1poeksweG5HMk9YV0FEWjd3ZWJXOXljdW82cjhLZFZ5TVBD?=
 =?utf-8?B?dmFKaisrRHdPcU0vNjBiSUx1VGRPalNRQ3V0QW5UdGY4dmRGMG11UWpnQlN2?=
 =?utf-8?B?NUd1TU04MWJEdUJXZ0tEQmhqRktIYlZ6QjN3SzRtM1dsTVZpWGNKZGhacWt1?=
 =?utf-8?B?eGRoTVJPbmNIa282cDY3TCtiNFpDYjJKMmdMTzNQdjBUMGhhandwUmEvTTgv?=
 =?utf-8?B?eHhPK0N5OVlhaGVrd2YvQ1VFalRsR09mdTNrTUZlZU5TRU5QTFZlOWJLeXNh?=
 =?utf-8?B?SDRERG9jb2MwVm1mb05JNzRES2V2TDJId2dSUXpYSFNDTVExQ0xaZm0xM2E4?=
 =?utf-8?B?L0pGNnZnNnMvZWlZcTY1VmE4U3VIeTQzY3ZHaEhLdTBGZzFwa294V0RUa2Vn?=
 =?utf-8?B?UG8rZnBsbFV5ZUxpbWxVUEhsNjJtVDBLK3A2bVhlQ2ZqaENjT2dmcFBoZkVh?=
 =?utf-8?B?dDl3bUVXOFNzMnc2MkFyQ1I0eVJEVm01aDZxdWVmN3k2cDQ1bndlOVNCOFZV?=
 =?utf-8?B?M1NKeFBJZW5QUklEV1NRS2JKZFltNXl3c3FRZDhFdHlub0l3ZUpremZCWTM4?=
 =?utf-8?B?WGJ0VldkNDkzZ0JJYTZBVFo5V0N1Zis5OUdDUG5IekwvMDU2akhobE1QVDVO?=
 =?utf-8?B?U285UVdtZVJweXNtMTJMQWI5SXBEWUw3S2tVelBtUldkSUw1OTBtVXBFWTFR?=
 =?utf-8?B?UjJIaDZTMVNMWExxc3RIQXFHd2F3UStoMzVWOVArbUFYa1lLQURMUEwxQlZH?=
 =?utf-8?B?b3gxS0FqbnZkRE5hK1BCNkFOc1hsb29jUHgzZWV2NXZnb2NzYUxIeWNtV3ls?=
 =?utf-8?B?R0VQYzU4YkNHbGtML29yNXJRM0I0cWJSakJUQXlyTFovOVdOb05SSnBBMFNs?=
 =?utf-8?B?WlFSZWozSEZ4aCtKam53ZDJJWEswK0JOVGJPbEQ2UXN1c0Y1ZERaUFhwTS9m?=
 =?utf-8?Q?DbgkTQDdDinlgLsvopAKJ639+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69ecb7e3-2a62-4b38-10b1-08db9255470f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 06:05:16.6374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RNkwsQnnezv7FycZYTKaL8IZiiFLQ/9aJnde5anzKeSi126KWPqxjS+iRB9Xi6bcJeOj2eNgeCvgE+CwTr0+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9722

On 31.07.2023 21:09, Shawn Anastasio wrote:
> On 7/31/23 10:58 AM, Jan Beulich wrote:
>> On 28.07.2023 23:35, Shawn Anastasio wrote:
>>> --- a/xen/arch/ppc/ppc64/head.S
>>> +++ b/xen/arch/ppc/ppc64/head.S
>>> @@ -1,9 +1,11 @@
>>>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>>>  
>>>  #include <asm/asm-defns.h>
>>> +#include <asm/asm-offsets.h>
>>>  
>>>      .section .text.header, "ax", %progbits
>>>  
>>> +
>>>  ENTRY(start)
>>
>> Nit: Stray change?
>>
>>> @@ -11,16 +13,19 @@ ENTRY(start)
>>>      FIXUP_ENDIAN
>>>  
>>>      /* set up the TOC pointer */
>>> -    LOAD_IMM32(%r2, .TOC.)
>>> +    bcl	    20, 31, .+4
>>
>> Could you use a label name instead of .+4? Aiui you really mean
>>
>>> +1:  mflr    %r12
>>
>> ... "1f" there?
> 
> Yes, good point. I'll point out that this form of the `bcl` instruction
> is specifically defined in the ISA specification as the recommended
> way to obtain the address of the next instruction, and hardware
> implementations presumably optimize it. Using a label instead of +4
> would of course be fine as long as the label immediately follows the
> bcl, but if the label was elsewhere then the optimization that the ISA
> allows for this specific instruction might not be hit. Just something
> that should be kept in mind in case this code is ever refactored.

Hmm, not really. If there was refactoring, the calculations using 1b
would also need adjusting. That's why it's relevant that all "sides"
agree on using one and the same label. (A similar "optimization"
exists in x86 as well, just fyi, so we have precedent of that.)

> I'll change it to 1f in v2.

Thanks.

Jan

