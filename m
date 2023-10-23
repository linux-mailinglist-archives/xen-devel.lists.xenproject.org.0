Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1017D2CF8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 10:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621079.967122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqUv-0002d3-4a; Mon, 23 Oct 2023 08:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621079.967122; Mon, 23 Oct 2023 08:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quqUv-0002aF-0N; Mon, 23 Oct 2023 08:41:17 +0000
Received: by outflank-mailman (input) for mailman id 621079;
 Mon, 23 Oct 2023 08:41:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quqUt-0002a7-Q4
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 08:41:15 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec4684ac-717f-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 10:41:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8038.eurprd04.prod.outlook.com (2603:10a6:20b:2aa::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 08:41:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 08:41:11 +0000
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
X-Inumbo-ID: ec4684ac-717f-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gtrz49B1HaDzFdkLqfHMjoApTTLnbSrlLB6Y7VxCzJ5124Or5hfS4Z5HQ+x5srEchttY5Trc4vvu91332jKSmXNGoas4iYZuPaCoC5pYygcApikcsXKzh17pjRln7A6n/mh6PPtMsTrzzbTWhTbmNkyEvkrJpm2xlC7pW2OLX5oAqHkRpEBUba651pL5MDvPkGhh1pF85EPyYB9ESKpWRlppDF6LSUvgGMBfpSbz6G7l9jK4GAIXPn+xJlQY35ddcGwf/ZlGrs1FmC32hC4EFANaFylfyffLSjEMOXTkh2TWyBfsvZcX4vs6+5m6Li1+KtS6Gv6FRrwwSK6me7PfXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVd1Mm+Lqy+aVWN4TcF8Mh2zMJ7dKskwVphQLFL5jlI=;
 b=kUj222LYeQpH9aDyvsbKFGFQ4+r7wKd1Qx4SBqeGVoCHP0PBleOex+MJY38P9zzbwqT9tRYBIL5cidGPqpfvyXivRo7YNOSmiImZJcEOyRMoik/vlnBq2FBZzRRHM/7S81nVyLR6ZzZKoZ/beJXaSx37y6woZAbcxay7u4BVMOQo4JQjdGyRTFvax8Cj8XkZiKZ98ZGNT2TKw+G9r31VWW68cySFUehok7mqNj/KLWwwdcP81kocTRJgx1Vj4usp164IeEr4Yecj132uKIAlVNo1Jrxg5tSi9AopNifuYEVlhs2gxd5GPDVBLxqBNVBXNN0xui3MBraTtfX+CF/stA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVd1Mm+Lqy+aVWN4TcF8Mh2zMJ7dKskwVphQLFL5jlI=;
 b=NR74KEg0JqJQYxamBCRUa3xXEcPs6C6ScVLkHA1TXhnEKTSFKT9cd+RIIhzTbYwEoaUjuzh7oajXwEX5Iic9qYtX7KQvxlj0rRC8lIQrYVvYE7ZH7UAHRaw/5+Zp5uohkhL8X9XRInKtTG4nxFMDhlidqxrlGEbxigrJwUzmDj0jIavGcjEG2AUvjT8IGbKy6MYCHg8cTGCSHE+S8asPNKO/Q+6wTM2yS2HefacjnuLnqA+pVHTHC3FlVKdcyIS075cBpUCA+ndv3/K3rhwQNyvZ4o8Q9UWfsvt4h9oXcEzvCJrBbozL5nHosMM4N9BeZBAlZ3Osi7TMIl72mIwo5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5909924e-965a-fe20-6b93-7599acd02d38@suse.com>
Date: Mon, 23 Oct 2023 10:41:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.19] xen/xmalloc: XMEM_POOL_POISON improvements
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231020202649.1802700-1-andrew.cooper3@citrix.com>
 <2902d6cc-169b-a70f-ce10-10925e837fb6@suse.com> <ZTYunVMy-d0cxEa6@macbook>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZTYunVMy-d0cxEa6@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::22) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: eb13f2ac-2b47-4943-abff-08dbd3a3cf7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G8ncbmLWqA9PIf9aKndfM1YMHzsDVyjwJ/hmWcoaE9tmgXwBBRt4XCfTRSTqoRbgj3kio0/pN7TnCOuqo1onbX5bpoY/D8412nBEdB6UYlywLzWITNv6eFFQ+mGX0vwBj/vwUihriPTCe3EMy2vkeTsVEC/OMPkHABk9ChOSLPQDHDOgurTv3h/lVpxU5KJ84+FC7BEZOjj55FBp9PfPu1MrIjJv6M7G1YYzH45G5AXYntRf7saZCJJe55bT2et5iYgKpFvZReCSNBXe2pi5mVYLR+Eb/DL89L+c0C8S5zypJDoRctO7VttXODYK8/WpyuxTMVN9etdkseXcNiwTXoH7+hRHIJr4evxXojzJi4s6/QEqQxNpUW5ujG0M2wRpCqgF2WcVQQDzF9gk8i47gBODzDpdXWEHtX+8Wu1P9cKQQgfVvOzi2/ZGQQhnLrU3mtqWEGsNb1Nbm0YsrWgb5DQq/DZe7tAN+UAs4CEykJCnc5+BRvOz1n9inCL9ZeTX442wI9nPQUsKUlWkKuFbQUo8QtU32ekAMIkIssnv/FzX5pzwZYIbTRcBsfaCEDp4iDdxovlJvTSHTCYRvwTcDzw5sUWLnh+4jt/3+bPMFUJjIsjb9rmV201KCDQt3mQ111DYzG2XaejOvqGPho9Nwg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(31686004)(4326008)(8936002)(8676002)(5660300002)(2906002)(4744005)(41300700001)(26005)(83380400001)(53546011)(6506007)(38100700002)(6512007)(2616005)(86362001)(36756003)(31696002)(54906003)(66476007)(66556008)(478600001)(6486002)(66946007)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFJhdEs3NWlBbDlhL1ZnRy9VUVZBNCt2SThtVGVVQmlVZFUzQ3Y5N0ZaRUhm?=
 =?utf-8?B?N2ozTlhjUHNpMTc2a1hxRjluN1F3amRLZGcrNXo3bXJ5WU9IbWNXdmp3Zjg3?=
 =?utf-8?B?djBVN21DelhLUXVWbnBzTElaZjVRODFNWmFEYlNtOVlnM2tXTjZjMjRPZTU4?=
 =?utf-8?B?TnViblh2VlZaV1VEaDZKSXUxS3lvSjZnbEtTZVk4dFI0d0lmLzFDLzBhRjUx?=
 =?utf-8?B?elNXcHpTNkxOb2RsRU8vb2tZVUN4YmFtUUdLUGsxcnozNUkyV2N2dkNTTzJF?=
 =?utf-8?B?Nm1idktTc2ExUTVZUWpmdDhqbEdPb3BDdm4vWkROSWVwRU1xK1FhWTdYWUR4?=
 =?utf-8?B?REZwMzFlOHJaS3B6NGdKVHJzRjcrRkgrTDZNNHB1Z2VPNnl3NjcvbmRjTk1w?=
 =?utf-8?B?VWhRU0JtNFJNN1JsTVVpakJlbGFKaDRZRC9lUW56aHd1WnJaWU9jWDZReVR2?=
 =?utf-8?B?a1A3NmdHZ3FvcXNDNVNpRXpUYnNhWUVkbGt1QzhrK3NzOHFKc25zdmJhNXdW?=
 =?utf-8?B?dU1MM3ltLzA0ZEdwNWpxb3pXL29GRmo3SGVkSno4bUdDRmhqa1ZnbFlUNEVR?=
 =?utf-8?B?cE8wc1F5eGdFeHhTRjZhcTZlcnI5a1A1Qk5OTUNOeTEveWt5eXhUZFpESmtS?=
 =?utf-8?B?cXFnTGY2cXpHODYrVW9XV3F1TGF5ZGFnc2FiYmdreTE2azYrZ3hsOCtQUEFj?=
 =?utf-8?B?MkdPNmEvTk1rbGcwUHpMWkQwL0JTWXN1QlRDZlRVd05ka29VdkNpQ1kvT3Nq?=
 =?utf-8?B?Z25UZ21tZlIybllLcDVlUkYraFFodzFiMm1hTU1PN0RnVy9jY1ZJN1hyQ3Qy?=
 =?utf-8?B?ZGtOT0xMNjFXM3p2TnpOblRQQ1dLZXIyN2dYaVR0eUl5bFBsR0VXbWdRZTRD?=
 =?utf-8?B?OXNsUHd1dWlTUFVla0g4SWZkOFYzdVRMSHkyMStENUZSL3RjczZ6TXcvUXY0?=
 =?utf-8?B?RFpzeHlqTWNZVmRMb24yaloyalRQdUFVWmdzNWltbkJTanBXemtVZnBYVklB?=
 =?utf-8?B?RmJsM1hoeEMrUTNiYkw1bnhGK2tES3JSZkM4aTR3UEVaZDFqaGdWN2F1UXRE?=
 =?utf-8?B?TUxKYW5BQ0xQNXpRdzNzdzNEZk11QjYzQnVYcmRPeXdyYnF4c3JxNloxMC9M?=
 =?utf-8?B?UWlWa0F5UkNNd3BtNnNXWElWc1JrS1F6Ui9aRkdLVHdvSTA5ai8vZ042UkNP?=
 =?utf-8?B?YWpXOTlDYlE1TXY5aE9LajFmckp3blhNTTBNaFMwSEk2clJWdWNUVUNjSUM5?=
 =?utf-8?B?aksvUkhBd3FjSzRzenN1Wlp4bGRITE94Wm45NnhzVlpWYjZHbkRHYU9WYlFD?=
 =?utf-8?B?Z3laakdjUnJublQwNW4zcCtJdDNFbjFnZTl6RGRRMmp4WUpTcHhvdk5GRU9p?=
 =?utf-8?B?UFl1ai9BZUs4S2dYMkZjc2lZa0l0NVd3Z1VueUNwRlkvdExXYk1LVDhVdUhQ?=
 =?utf-8?B?V3NWSitMdE9nMFJuM2FaTDc5dXQ4bmRQOTVNUHJRZVdzRU9pa2JVSTdzSTRO?=
 =?utf-8?B?QUlXdzVuRHF0akdTNmFVRVF0N0xMeGFNMm1NQVlqOHpKTENReXVhYjU1RGQx?=
 =?utf-8?B?M2pXYXJ4NVZzUFQ0cDJQYk5xVld6NjdXL1ZHbVJ0Y0RMY21aOEdjc1NPTXhL?=
 =?utf-8?B?TEdJQ3owemloZEJva1ZpckZUd0xIUjR2MGpXaklGWCt0S0UvejYzSnVOb3No?=
 =?utf-8?B?SGYzQ0hXTTBkazA4dG96UGNWNEQ3NStISGJZMzNoa1N1dlcxSDM2SGRVektC?=
 =?utf-8?B?SElOOWxKdSsxeXNMU1hLMjJYNDROeFpuVjNpUWFzdWhPVVFSMFJLMlFLTkNH?=
 =?utf-8?B?V3FUbXY4T0sxc0tQOXdtZFRVZi9udExUeHJtU2J3T3pzUkl6b0dHdEVLMXVO?=
 =?utf-8?B?L0ROYkVFN3VYRldaL0JmWUw3UGpsZWNxZ1A4b1p0TGpEWGo1b3dPc25OOS9q?=
 =?utf-8?B?WG9Kb1FJdGdwdS82Z2pWS0RVNnplYTgvQllVM1p4N0VyL3czaDFKYTB5U1Rj?=
 =?utf-8?B?dGMyaFozdU5Pdjd3TWhNcy96Q1ZGVUNnWlpkLzFaME55RWh4b1EzeUlXazdw?=
 =?utf-8?B?RnFmaksrRllsVm5seTZSa2FDRTY0T1NuYzM4Q3dCZnlvbnhJR3pvK3JRRmJ1?=
 =?utf-8?Q?eG4NP++qwka6/lOM+fXySGGpY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb13f2ac-2b47-4943-abff-08dbd3a3cf7a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 08:41:11.8166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fi+sqsZQYwyQH4pKKteHYuT72CfypWsj7sTIdSWm+TPyK2q/2ilwhboLV31SrsgYX09smtVAtY0h4hQZbaZ1XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8038

On 23.10.2023 10:28, Roger Pau Monné wrote:
> On Mon, Oct 23, 2023 at 10:04:21AM +0200, Jan Beulich wrote:
>> On 20.10.2023 22:26, Andrew Cooper wrote:
>>> However, upping to a BUG() can't provide any helpful message out to the user.
>>>
>>> I tried modifying BUG() to take an optional message, but xen/bug.h needs
>>> untangling substantially before that will work, and I don't have time right now.
>>
>> I agree with Julien's suggestion of using panic() in the meantime, as a
>> possible alternative.
> 
> We might care about the stack trace, so would be helpful to print it,
> maybe WARN + panic?

Perhaps, yes.

>> Question though is whether it's better to halt the
>> system right away, as opposed to e.g. permitting orderly shutdown to cover
>> the case where the corruption ends up not being "deadly".
> 
> Hm, won't this be risky, as we could then possibly corrupt data on disk
> for example?

It is risky - you never really know which of the two options is better.

Jan

