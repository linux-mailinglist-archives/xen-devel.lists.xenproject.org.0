Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFCF777350
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:50:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581980.911471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1Mi-0001eF-TE; Thu, 10 Aug 2023 08:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581980.911471; Thu, 10 Aug 2023 08:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU1Mi-0001bo-Pw; Thu, 10 Aug 2023 08:49:56 +0000
Received: by outflank-mailman (input) for mailman id 581980;
 Thu, 10 Aug 2023 08:49:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU1Mh-0001bi-4f
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:49:55 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d918dd40-375a-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 10:49:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU0PR04MB9636.eurprd04.prod.outlook.com (2603:10a6:10:320::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:49:51 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 08:49:51 +0000
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
X-Inumbo-ID: d918dd40-375a-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5qcl4Zp6brUe31k4QkNzg4nEodpYrL7orvy/BzLzeq1Zn/8hj3eo9+hHfQsJXJWEq2O2LgFI+onazADCwacPk/fNWwlXlLNgwZ1gRL0NsWhHqUWMKEQ+qs2NBS4kMWdDqXYoB75+FxsnO5MQV0XMbK2vzh+SDT304bUkM2WOyIos7qldS4pnF06zpVoNRN9L4/Y5u2klOWKcn5foy9drWuWqTSOVQaUuxtTPf5VUbJq0RM5QvmL46aorrIEovqGmcqgUXDUIIQWpYqYhVXhTAIUJ3GJwnYqNIsClrsPt0JidD8AxddKKTJBvS/B4ZBvctCMFwo/+orgOzh9ocwpFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFMvvRc9Smv0ZNt5mmqOUKJgjxlLMFe13IuIua4HKPE=;
 b=K0b1+TqG6WZdkfga1VQ/wLGOiG5Eyd0vwd2f9I+Bv+dwwjLL+NtLtQ4Q1slWBco1mJmQJa6US/9ircgNEI/xKpJSs5pcR9b7HBSEkZo9mkTc9FVOTz72zq6agQg2mw/a8bvKz5syNB1DqH9VcmoebKHyC6Kh1DBj0LtuBhUNGXBGEVY1D2ucFyAbFys+2DBVdGJqotDg2+MhSqzql+/Y5scUXqwgPlPeqALmYIEaJ+uuD4zCNj5FQl39GRJ7GZUss1Aw0jcixOdOxWM2TpKGqUdtNXQW20xxMexLn84y/tDz9N9p16TekSHpXPmgOIwDDc0U2bBTFm1riA2O2JNJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFMvvRc9Smv0ZNt5mmqOUKJgjxlLMFe13IuIua4HKPE=;
 b=IhnfEdNU9WOKwNM8hCyVDwFTqfN/iUu2H+ZneRYXd6XV/Sni/C5QVrJZ2+wekfTJUOGXH60uCwlkvNa5Ub1i4GmU79xrYzy0nGCmDvGIBGy1ehmKcxDQKfMeCtsAVXnBkKWEVNx+I+7T5Xc/oaWZK3w8vtisXd6mWL4aksT1es4nbTwZv1scyNI7k+Uzk4iELcCQDriwqR0gKB1ipSWXuTqsKGINWOv1Gv8JuRYOrDya6VqdapwbMk6HSrozZPVDA7lwJHy6VMYQt0Q2efO4brILY6UmB/c9qsTfJLEi8yZuG9rl3FeFpYKuvl62VayRKr/fNyFWOQ6SshC5he3z/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d4b019f0-70ed-22f0-4496-47bb9c385068@suse.com>
Date: Thu, 10 Aug 2023 10:49:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] xen/ppc: Implement initial Radix MMU support
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1690582001.git.sanastasio@raptorengineering.com>
 <ed166c38bbcf82ad58a14353a880d1e208cb2ff1.1690582001.git.sanastasio@raptorengineering.com>
 <55e1391e-a289-72bd-f663-62276cf4b065@suse.com>
 <ad54705c-62eb-7ce1-6d2e-49e60e6dc6f9@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ad54705c-62eb-7ce1-6d2e-49e60e6dc6f9@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU0PR04MB9636:EE_
X-MS-Office365-Filtering-Correlation-Id: 244cc519-05c0-4bc6-c034-08db997ec25b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iOe1A4yU0ds1dS71rFpTYPatF7bGCX9m4fzN9Z3Kv1NGZADnegXSzbnlv5nPuAYR4jkl5mEyqtu5txNaPynCLtUQ6K61NpSl0tc1k56Aw0DZOQlWorSTE8zz5cpZfIJz4pmVJdalOSeaSBSckmLYTYkfnsiSw4zSJgUuAProH+NND9Gt+pQfk5MZjAUeDD8zYDQu0x48Jn0oDITSUXz2MSoYv4etio4Re5cJIQ5kQk8cRuNxaKwUWLk9PtNkxdngVJMdK+Fb2GmTH2lUSH8nIM9H+3WLf3zUeytXzLQMzuC+YN3ZYaYpu3cZAPtiy6dwZMKVqylkvGiPWSoNYshwQ9mUyQtCVnQNfwND+HrigHvzsWjY0ZdvnU9cJPjzSh97ew4X/uNVhPtJ3XYGZEuSS2sdXYJJoGlQx4/3WjeQSzw+nirat67zkqkC3BCHowviQciqCjtTnUOB/wcuSZPAl+C8QUYO0djk0+VmfoUgVC7EMmKrtxIrRqDSVobI42ofkFtcGFPLhEfrPY/qr0XxvHEowmWcZWHiQ5FsdF3ogAhSRkYa1nE1iJmoLkRnmh+j0YrykNpAZyFS+Yk0/iup9IQhYZamxFFMOTCeRUydn8eVo2Rrhv7FjwDpJsXCvwGtoTamxEjWSNosVNn9nOppeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(136003)(396003)(346002)(376002)(1800799006)(451199021)(186006)(2616005)(478600001)(31696002)(86362001)(6512007)(2906002)(36756003)(6486002)(6506007)(26005)(53546011)(83380400001)(54906003)(316002)(31686004)(6916009)(66476007)(66556008)(66946007)(4326008)(38100700002)(41300700001)(5660300002)(8936002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHZqbHhSbVVJeC82cUpqVVNhOFVBVkNOZ3E3ajU4dGpsMGxQeHA4YTQ1NG44?=
 =?utf-8?B?RHh5TVJDZGtNbTFBaUw3Tm91TEJxMGJBbVVsQW5BeHNTMlJjallSdDBUZkZX?=
 =?utf-8?B?T1ZvUGRFYzVldE5TYlJnS1o4S054VUtBNjVwSnh0Tm1ET1lmUmdBTEd6d3Rq?=
 =?utf-8?B?cUJOKzRadERuUTc0OUxmR1N3UEtyZHlFZmVIV2JrQ21NL2R5YlJiMHpCc1N4?=
 =?utf-8?B?SWZHUlFrNVdVamxSeGtLdWZFK2VzNHJMTUNtbVZxbE04TTJVdm1QRTlDSm9O?=
 =?utf-8?B?a3RveTVQdlVFSGJzR1lraFBqR0J6dmNEdU1YSXVaM0dudHFtalFvSHhBOEtt?=
 =?utf-8?B?NlZlaG1vbEFjN3FSRndxeFcvRmF0N0FjYzhqRFRwZGwvVXpVRkFyZ1dPa0pi?=
 =?utf-8?B?U2x2eWx6dldlOWN2NUFNRFF5aFRSZ0dhRmRkUG9WbEJVa1dwejNaTTE2NGRG?=
 =?utf-8?B?cUdwcVJ2TDVJN3V2QjJrRWFzaUZzRVZxdEhXSXhXWEFzNTA3aGJnWFlUVnpy?=
 =?utf-8?B?L09yeE0zZkx0VkFtSC80RjFVdUZFTDVQUHMzSXppdEQ4aUlaSktWWGlsdVdN?=
 =?utf-8?B?enFBcTltem8wOFZLeDl6NFphUHdIU1gvRlRPdiswMWNVbU1MZnhrVWNpaC9D?=
 =?utf-8?B?cU92VGNzcnhZTjJoYVExZk9kYVNiSi9PZ3VjTWFNV1Jnb1g0VVJKM2NUNy8w?=
 =?utf-8?B?aTZDQU9UN2tsT0Z2eFRBYUc1TXJZa0dNRnBKdjBpUUJBZ2Rvc2ZmcisydWQ0?=
 =?utf-8?B?YzBsRndHaGlaV0c5TjIrclNmRlREbzVWS1kxNFZJZENleVE3YzN4Ui82SHVm?=
 =?utf-8?B?US9KMkRPSHA2TG5GNjg2UzZtU1NBZTR1YjlFdFI2QnBTa2VTV3lobEVrZFFn?=
 =?utf-8?B?WDJSSmQ3eGluYTZkeUFDNmNBaXNMRy9DTDdnUnh5VjRJOEVKUy9WdWV2bElO?=
 =?utf-8?B?cG0zZ05nbXhNT0FPbGhzZCtIR21WcnhsemJmTDRRc0RYdkpEeWxzMGd6ajhm?=
 =?utf-8?B?V1A1S2pEQThLUDhpQ0wwcmQ3Y3hxTWxQeldjM3hPeVNEOGZtMExYSTh2dGNu?=
 =?utf-8?B?SFlXSUlkRGFETmQ4bmNrWlh2TTV4cy81K3JKeS8wOGR5Mm9mWXc1eWZpNXpV?=
 =?utf-8?B?aFBIa096OWlOU05NZTBXcHVjS1RIek1sc0Zsb2grcG1BZGJjc2kwMDAwT0Iw?=
 =?utf-8?B?V3BISXBmUGsxR3BXU3ZBREJjRzlnWXkxL2lZQTNxWlZDYnR6WnBjWTYwQjIy?=
 =?utf-8?B?SDJjYitzdUFKbDBVbS9uZFYrT0FoSHpoaHlSOGkzV0lhWDZOMXRHTk9kVHk1?=
 =?utf-8?B?UWtBMjZUK0MxVFYrcEp1T1dnUmJ6RHJGc3RJSzYxLzNoUkRkbmVXNCtDR3d3?=
 =?utf-8?B?UTZsYjdKSm1ZVldYcFUvblF6ZDZHWUVDTk00WExyVXRYanhPNmhRZ1Vla1BC?=
 =?utf-8?B?OVVESURqMk5KQnRob2o5OXdaK1prY3N2U3VUMjlGc3FldlY4WUNxZ3h4T3Nu?=
 =?utf-8?B?cHd0engzdEFWNFFVUmJIM0xiTmVJcmhTOFpuQ2t1d0FLMVBmc2N1TEE4bGRl?=
 =?utf-8?B?WVh3cWhlb0NIT3o1RHJ4cmVMME9FbXF0dE1qYUJlNVUxT3NjOFJFTTYzMUJN?=
 =?utf-8?B?L0RqejdSZDVUZkhmRXBPNG1rOGdYNkNZSERWUEFBYnUyZHRSSThOS2J0N3pX?=
 =?utf-8?B?WDFZUnFjV0VRUUY2cktYOGYzUWM1NmpKbGZrTXFrUE1peDBaZjg1SFBYdjd1?=
 =?utf-8?B?NSsrb0ZrYVFWOU1OWGtpZFR4eUdOdG9wWnk5Q29FTVBpOVVjaTBNZHhlRGEv?=
 =?utf-8?B?eXpwZWZQb29SRS9ZOG9jcVdkY1FYUWJpVU1WQmJZeXVuM2cwRG1vOWd0MHNY?=
 =?utf-8?B?NUlldEhseHJzWTVNSTVvYzFkTXIybncyZGpLNGh0b1IwQ0RvRGt3cXhRTFRK?=
 =?utf-8?B?cFRwOTRCMDZQU2h2bDYzeFZoMzgxcDZCQWRBVEx0VkVGcXg1Z2tDb2hDSkxI?=
 =?utf-8?B?dTFRWnFVOTBrdXNSVEVpUjZpUnRBQ2llT2RRZW5OemttVDdCc1RpdWNyRTJq?=
 =?utf-8?B?VHYyRko4eEt0dDduQkcyRVNyQ0FDc2RWUWtKS1ZMZHFKbncwVURsSnFOMndQ?=
 =?utf-8?Q?jFmGmeB8QyAsOvOqnbagXPl6n?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 244cc519-05c0-4bc6-c034-08db997ec25b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 08:49:51.0104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uiOrIWqSdSuJonoxe7rzIqKqDe0okYDdWVk2DWX/KKNWT+3wh21iziQ5hBR1aK+Uk3BWlXEyPSPOWfcDCd7DFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9636

On 09.08.2023 22:54, Shawn Anastasio wrote:
> On 8/1/23 8:18 AM, Jan Beulich wrote:
>> On 29.07.2023 00:21, Shawn Anastasio wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/ppc/include/asm/page.h
>>> @@ -0,0 +1,178 @@
>>> +#ifndef _ASM_PPC_PAGE_H
>>> +#define _ASM_PPC_PAGE_H
>>> +
>>> +#include <xen/types.h>
>>> +
>>> +#include <asm/bitops.h>
>>> +#include <asm/byteorder.h>
>>> +
>>> +#define PDE_VALID     PPC_BIT(0)
>>> +#define PDE_NLB_MASK  0xfffffffffffffUL
>>> +#define PDE_NLB_SHIFT 5UL
>>> +#define PDE_NLS_MASK  0x1f
>>> +
>>> +#define PTE_VALID     PPC_BIT(0)
>>> +#define PTE_LEAF      PPC_BIT(1)
>>> +#define PTE_REFERENCE PPC_BIT(55)
>>> +#define PTE_CHANGE    PPC_BIT(56)
>>> +
>>> +/* PTE Attributes */
>>> +#define PTE_ATT_SAO            PPC_BIT(59) /* Strong Access Ordering */
>>> +#define PTE_ATT_NON_IDEMPOTENT PPC_BIT(58)
>>> +#define PTE_ATT_TOLERANT       (PPC_BIT(58) | PPC_BIT(59))
>>> +
>>> +/* PTE Encoded Access Authority*/
>>> +#define PTE_EAA_PRIVILEGED PPC_BIT(60)
>>> +#define PTE_EAA_READ       PPC_BIT(61)
>>> +#define PTE_EAA_WRITE      PPC_BIT(62)
>>> +#define PTE_EAA_EXECUTE    PPC_BIT(63)
>>> +
>>> +/* Field shifts/masks */
>>> +#define PTE_RPN_MASK  0x1fffffffffffUL
>>> +#define PTE_RPN_SHIFT 12UL
>>> +#define PTE_ATT_MASK  0x3UL
>>> +#define PTE_ATT_SHIFT 4UL
>>> +#define PTE_EAA_MASK  0xfUL
>>
>> Did you consider introducing just *_MASK values, utilizing MASK_INSR()
>> and MASK_EXTR() instead of open-coded shifting/masking?
>>
> 
> I actually wasn't aware of MASK_INSR/MASK_EXTR when writing this. I've
> just looked into it though, and I don't think using them makes the code
> much cleaner. Specifically I'm looking at the implementations of
> `pte_to_paddr` and `pde_to_paddr` which both need to ensure that the
> returned value retains its original shift.
> 
> For example, with pte_to_paddr, this change would be:
> -     return be64_to_cpu(pte.pte) & (PTE_RPN_MASK << PTE_RPN_SHIFT);
> +     return MASK_EXTR(be64_to_cpu(pte.pte), PTE_RPN_MASK) << PTE_RPN_SHIFT;
> 
> In addition to updating the definitions of the *_MASK macros to include
> the right-most padding zeros.
> 
> - #define PTE_RPN_MASK  0x1fffffffffffUL
> + #define PTE_RPN_MASK  0x1fffffffffff000UL

This is the important change. With that the above will be

     return be64_to_cpu(pte.pte) & PTE_RPN_MASK;

and in cases where you want the un-shifted value you'd use MASK_EXTR().

>>> +/*
>>> + * Calculate the index of the provided virtual address in the provided
>>> + * page table struct
>>> + */
>>> +#define pt_index(pt, va) _Generic((pt), \
>>
>> Earlier on I did ask about the minimum compiler version you require for
>> building the PPC hypervisor. Iirc you said about any, but here you're
>> using another feature where I'm not sure how far back it is available.
>> As indicated back then, it would be nice if ./README could gain
>> respective information.
>>
> 
> I'm locally building with gcc 10 (shipped with Debian 11), and the Xen
> CI image for ppc64le builds uses gcc 11 I believe. _Generic and the
> other features I'm using are certainly available further back, but I
> haven't personally tested anything earlier. If there's no objections,
> I'm tempted to just codify gcc 10 as the minimum supported compiler
> version and leave it up to users if they want to try testing on earlier
> versions.

Spelling out what you know works is good enough for starters. As you
say, people can propose updating when found too high.

>>> +    for ( page_addr = map_start; page_addr < map_end; page_addr += PAGE_SIZE )
>>> +    {
>>> +        struct lvl2_pd *lvl2;
>>> +        struct lvl3_pd *lvl3;
>>> +        struct lvl4_pt *lvl4;
>>> +        pde_t *pde;
>>> +        pte_t *pte;
>>> +
>>> +        /* Allocate LVL 2 PD if necessary */
>>> +        pde = pt_entry(lvl1, page_addr);
>>> +        if ( !pde_is_valid(*pde) )
>>> +        {
>>> +            lvl2 = lvl2_pd_pool_alloc();
>>> +            *pde = paddr_to_pde(__pa(lvl2), PDE_VALID, XEN_PT_ENTRIES_LOG2_LVL_2);
>>
>> paddr_to_pde() doesn't mask off the top bits. Are you relying on
>> lvl2_pd_pool_alloc() using PIC addressing to get at the value it
>> then returns?
>>
> 
> I'm not sure I understand the question here. The pointer returned by
> lvl2_pd_pool_alloc() will indeed have the top address bits set in
> accordance with the link address, even before paging is enabled because
> of the relocation code and jump to XEN_VIRT_START in patch 2. This is
> fine though, since I call __pa() to strip off these bits before passing
> it to paddr_to_pde.

I'm sorry, I managed to overlook the __pa().

>> Also this and the similar lines below look to be a little too long.
> 
> Yeah, I noticed this as well, but my understanding was that lines longer
> than 80 columns were permitted in cases where they don't hurt
> readability. In any case, I can fix this.

There's only one general exception to line limit: printk() (and alike)
format strings want to live all on one line (unless there are embedded
\n), to allow reasonably grep-ing for them.

>>> +void radix__tlbiel_all(unsigned int action)
>>
>> Is the double underscore in here intentional?
>>
> 
> It matches the original Linux file from which this routine was imported
> (referenced in the file's top-level comment).
> 
> As I understand it, this is meant to indicate a private function that
> shouldn't be called outside of radix-specific MMU or TLB code.  As
> Linux's radix support code spans multiple files, a static function
> wouldn't work for that.

We haven't adopted that style yet(?), but I'm also not opposed to you
doing locally.

Jan

