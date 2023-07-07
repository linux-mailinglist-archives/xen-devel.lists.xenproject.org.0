Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CEE74AE04
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 11:47:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560326.876171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHi3D-0002Ff-LB; Fri, 07 Jul 2023 09:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560326.876171; Fri, 07 Jul 2023 09:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHi3D-0002CX-GZ; Fri, 07 Jul 2023 09:46:55 +0000
Received: by outflank-mailman (input) for mailman id 560326;
 Fri, 07 Jul 2023 09:46:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ruU0=CZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHi3B-0002CR-EF
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 09:46:53 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3324844d-1cab-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 11:46:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB7058.eurprd04.prod.outlook.com (2603:10a6:208:195::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 09:46:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Fri, 7 Jul 2023
 09:46:22 +0000
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
X-Inumbo-ID: 3324844d-1cab-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g3sMOCiqhA+R9XyvcUw5qVGIhvGgdQ6sRL5NWJ4ikzVHnARrl6FM8+QgKUmyS8zlHVUjpYMga/orJqioWyC7vYfvN4b8C892x0VLBEHfPN+iYSJ20PKolFbM/XpdjnVkSfQLVEE4ynKzDB9p7b1dY5+01mNZUl/NxU0hQlXt3if7D3XwiK9w9B/n31mSyAKhSocoE27rHDxG2zlf3xxJG/Ll834W3o5HwVAzZzY8SISZ73AjoZkdmkziZ6gSi+Va3UKpFZRAC14ki5d4ub8YKOFmLliFc3kNBjO2brOtfgksn0FDq+XtvOypCUH6/1n44jzSN97j/2RfzoJZp4ghWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iovSgwMsl9qSueX0ei/pPybtYiazGAWYTp8thLiQ7z0=;
 b=IGuCy7ixwEHJz2xDsRvenUu856NNuFMcb4ViL4I0JfvBpEk2v+tDxP1ojDJ/SuBI9Xxh8TLNDg+R4HPDhoH8+9d1ed5z5rtHEBYjyQwkJd08KNDEVQ5UP59LAWKjn31XpAbiN25N8aWpM0pNfST69AZb76kvAJjAMaOnE3sGkw5MmiCNc1hSVL2Qmjd3UUhxKAxNz3CKqZSWEHpSr5HJ6PiayHUSadKyFzstj3TWa7QRniDF8wL7aTkZgLbLUw63tWD9NhzU6r5xpVZvqPzdJWzQvxMKJPCIPmG3dE/MskQg8+AaamMIG4UD8iEdez2MVVzW9O12D4RpsP3ewnYeUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iovSgwMsl9qSueX0ei/pPybtYiazGAWYTp8thLiQ7z0=;
 b=zodgklskigt3zToaSQ3v6KWTLLwQm2k9p2N3E3jFY4gjdSj6NaOFFw/d5Fp80nPJDkR0bngSPQv/MPQ3mA6ttF3P4Q9UVn6AmAXs2yWpNJWl4TRRuMdmmDKgZGxUf6/jp+ZFuebWuSAvTmmuZI/PFHmiNp96EDJUAgRvvqoYplEiKZRkIvwF5bJc/g5qSs8pFWybYC4hD8LwZwgLolZvPcoyf+jbDkhtHEFKAgnrndDnx5lCFG6vs639RosgDYmDjqp3TcubG/py/Twq1O4VYL/uVEBl0EZ9JtNnWpM4suUxlteEiEshKsH1KY/1JiJuqX3/JSW+b9CzPlJ3v5rEWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f6c16d46-5804-a838-cf61-71fc671e394b@suse.com>
Date: Fri, 7 Jul 2023 11:46:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 12/13] xen/x86: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
 <a343fc97-84df-48e6-1c91-cd933c6e5210@suse.com>
 <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
 <f93f0561-abea-bdae-223e-d69932e435c4@suse.com>
 <CAFHJcJuP7hH01ZiwNe0HHBM=JpBtsF9sDD7fushyBxDQ9UZicw@mail.gmail.com>
 <fb29cca6-454c-82ed-b6a8-ac9814f81cfa@suse.com>
 <CAFHJcJuCddmwMAB=26tVBfgThQWLZb5kZU3GBdC0aTTcvJ4O1w@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAFHJcJuCddmwMAB=26tVBfgThQWLZb5kZU3GBdC0aTTcvJ4O1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB7058:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f8726f2-7f4d-4ca9-3602-08db7ecf05cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vXBhRWLF5rQtZFlWkdUCg+ZL90t/FAxrf5cdphTxhXw9XqWDhCeFMlMJocY9nxSqsRc46xqAfp4r1SPeTjXR09o4UpT4DqPMgy06mPKc9ThFtxfNpQc6Q26B6jrQqLvqdL3hL/IEUGJkgNoI5FwBvTFgmTWN1xFKV+L6JIStFX0ttJZsKfnzixrsJRnNBw+jwj7DbSrdYFLR045b6ubqjw0wRqWJ2gOMraFycXf2aQlg+BMyp9aO83j5DiC1nZHB05KTXlKN4swgC6Mgqcsw1byQhfrp58S1lTZs7JbWfKVLp5b0wNq6E1yTgWxtp9iLTS53tPO8ZqBUy90dvLVaGpqwmfNg5eWmgmEPFj22tVK5WuVLnIdZDeAgXt9Pl2Nxq6CWcxEl+AA6nhy7RrjElwjsSUMelxXaLLGRulhb3tmw3RVYTtG8tFUG2DqYLB3xbdLKB4Ymreg8/Wy1pN7ke/Go/ys25Xq1NhVbMgFW7QB7Mkr0rgthDho3VetAbF7kmxpHx6rdNFqXz0mA+2uH1a9Ws2bFvBLIcus1F77RQim5Ny4AdzVBENaXCqFcj7Zc2bLlmi9Xgr+UgNZ0d8VpyMyuuILRAgQPHh6q2dBKprZ1+FfjtABB4pZuwVOPkoJNqcJFseDfa79jPtt3Yw9IVg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(136003)(366004)(396003)(39860400002)(451199021)(478600001)(6486002)(6666004)(54906003)(53546011)(6506007)(26005)(186003)(6512007)(66946007)(2906002)(41300700001)(316002)(66476007)(6916009)(4326008)(66556008)(5660300002)(7416002)(8936002)(8676002)(38100700002)(86362001)(31696002)(36756003)(2616005)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WCs3cElpL0htaE55L2NISlE1Q1B2eWk2eTZ1aDZYdW00VnloeUhwb1h3aTBF?=
 =?utf-8?B?RGxIdk9tR3JzOGhHRFFLS1NZUlJRcG44U0RFSXlUSy9wWk1TakQ0YXJYWEVM?=
 =?utf-8?B?VmxBN1lJWStkUTZGMFNNbDhmT0lPYXhoMldOKy8xcHFTd2VqKzVXZTVsV3pJ?=
 =?utf-8?B?QWdNNEJKQyszTEIzTnh1aXBMajVXc2FwbnlPN1NYMUxzMm0xSGJZRGFPSi9D?=
 =?utf-8?B?WjJaNXRrMFYwamxJb1cwUXhUVnhDQW5sZk5pNUxiWlBzK2ZNdWJ0OFJMWjhu?=
 =?utf-8?B?aUZ6SVVSZDVYemlHZXMyY01UZjFZTWh1eEEzOHdhb0hoTU1pYUVVQTVDZEtQ?=
 =?utf-8?B?dms2ZjJoY3ZmclBCOUFVcG9YbGMyYXhRSlJuTDNlOVBCMk5xT29idFcxdUZk?=
 =?utf-8?B?SFBqMmJBN2JKSERlaExLTjVUOUh6T0taN0trWWhhcTRZTDNnN016SERaNU9S?=
 =?utf-8?B?ZG05UlZoTmRlcnZCRk5IWGhqSUxqTG90NXlObDZMTDVGbWQ3bGN4QzVWd0Mz?=
 =?utf-8?B?OFhIMDR2YS8rVXpDWTh3STlJZ2FsTFhCcmpZN0I0VGErSE1pK2tCWE5acVA1?=
 =?utf-8?B?OXpSbzFvNGVsRHZ1VlZzdTBzcWFvNEJrakNjZVRKUnpHdnBnMUZFY29iR29Q?=
 =?utf-8?B?bXgzdjYvdTZhQmtSMmJQeFJ5L3M5ZFdoR09yalJJQmdhM1NqVW9tVXhTYjlv?=
 =?utf-8?B?WmdEdUZweUljOWFOMmNVQk95TE5zeFdsa09NMW1WYm5zUkJJVWxZMWlrWEww?=
 =?utf-8?B?bElRdXJjR3ZxVkJubUUxN0tVaE9WTUw3RGxsZ1VRUVpXMms3L2twOTQvbEhj?=
 =?utf-8?B?M2hoL3A0d1l3VDBqZGRLQUpweVpOYitlc2NSdUJ0UVQ5VFAxTnNQZzVRT0pB?=
 =?utf-8?B?UTlQMXNuRjFCemYzQUZzcEJnZDU0WlMxOW91b3ZweUZDQzluV1RwV2lJb3Mz?=
 =?utf-8?B?U2ZFZ3RpVXgvS25WWC96Y1JtUFBGc0pCcVUzRjFiMjFWZ2sxbXduRkNOdXRw?=
 =?utf-8?B?MDRRaDA2QlNGNExvdk9ORm52aDhkdGlwV2NrRzRHZllwM2tjM0lteEpYU1N0?=
 =?utf-8?B?RDRrT1g3ZnpIWU1BSHE2QXlRWVNkWkFYN2V3L3EzdExYeXJxQUoyQXZUWG13?=
 =?utf-8?B?VzlMV2dJS2ppNW43bytHcWx0ZjBUeVRwbG9GUXJwVHc0ckI1SmwwRjBEUXhs?=
 =?utf-8?B?UVF0ak5vaVlaVVhRSTVPNUs2QS9XSzZaRWJrZ3RXKy8xSGIxSEk4OEhVOUgr?=
 =?utf-8?B?VFh1Q2MzaHE1U0daajhwL0dRdE1xdytIcXJLb2NneGlxcEhoSXFzWDk3VE5F?=
 =?utf-8?B?ZVB1YlBCSlpnQjMwaEdGRWFnN3JyUUFMayt5RjJGaWtGazZUdTZwamNSZlI2?=
 =?utf-8?B?Qms5dGJGVzBqR2E0TUhwbWtsaTVKbFJlbWNCQjRhUERodUk0UmFZS1diV2RQ?=
 =?utf-8?B?RFZwUjBqaVIwQkZqWldaOTdYRjI0bnc0b0VZbUxyYTk2MVByckc5eHlBVmZk?=
 =?utf-8?B?TnU3ZEcycmQ5SFVwdlRiVndyVHJIQ3lyeFplMFI4aHZITzhIZ1B5TS8rYmVS?=
 =?utf-8?B?S1ZxM29uNlVXM3d1VGpjYVY5S0pvRStyZmFJRzlMY0pDKzYvYzlRRDdTYjJU?=
 =?utf-8?B?ZnhjakFlUnJrcTZLdklDR1pSaE1KWkRqbmVSSkFBcUwvRmlLUEZldytBN001?=
 =?utf-8?B?UEZ4dEVoZzdwLzJUSGxhbVFZeEhjanFOQ2N1b2NqZ1hvVFdSUUFJOWdpNEZG?=
 =?utf-8?B?aDBKL0R3MERYR0tKeVJva0l2L1Q1dEJjQ0Y3MHpsek05eU0ra1VNeFlPTURu?=
 =?utf-8?B?Ri9MaEJ0Y0lyck14WTlwelFQd0ExMkJ5amhXSS92ZjVkS2NQcU5JbW8vTlUx?=
 =?utf-8?B?TzV3MW5tZnZMMnBiRldHRHJvNVc2M3pJeE1BRnp1SVNhd1lOc3Rtc2VkT29a?=
 =?utf-8?B?VUh4bUI5cktOdXdiMEtqUmZuTUpQWUlRU1lLZ3BXd2pKMUovNy9LNTdFcHpJ?=
 =?utf-8?B?MzZ3MFlPbXh2L1NhZ2VOd1pFV2IrUXY3R2RlVVYwRE5hZHFrbXoxWEZrL2FH?=
 =?utf-8?B?YlJZdmQvcHRhRkEyVW9rd1d2R29MMTlmYk5wMGxlajFZMkZlYTJHYXpoY3VV?=
 =?utf-8?Q?PyDxopSWyVfVVOg2xM7uKWl2d?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8726f2-7f4d-4ca9-3602-08db7ecf05cf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 09:46:22.5217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11NwAtNSNJnRNFDDCMHcQLpnVOSGplpDA+NK0oVKS2xbmMq90Hopzq8eKjvtgtqqSUEPuuVPTCH+kVdarvIb7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7058

On 07.07.2023 10:04, Simone Ballarin wrote:
> Il giorno ven 7 lug 2023 alle ore 09:04 Jan Beulich <jbeulich@suse.com> ha
> scritto:
> 
>> On 07.07.2023 08:50, Simone Ballarin wrote:
>>> Il giorno gio 6 lug 2023 alle ore 18:22 Jan Beulich <jbeulich@suse.com>
>> ha
>>> scritto:
>>>
>>>> On 06.07.2023 18:08, Simone Ballarin wrote:
>>>>> Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beulich <jbeulich@suse.com
>>>
>>>> ha
>>>>> scritto:
>>>>>
>>>>>> On 05.07.2023 17:26, Simone Ballarin wrote:
>>>>>>> --- a/xen/arch/x86/apic.c
>>>>>>> +++ b/xen/arch/x86/apic.c
>>>>>>> @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)
>>>>>>>       * Setup the APIC counter to maximum. There is no way the lapic
>>>>>>>       * can underflow in the 100ms detection time frame.
>>>>>>>       */
>>>>>>> -    __setup_APIC_LVTT(0xffffffff);
>>>>>>> +    __setup_APIC_LVTT(0xffffffffU);
>>>>>>
>>>>>> While making the change less mechanical, we want to consider to switch
>>>>>> to ~0 in this and similar cases.
>>>>>>
>>>>>
>>>>> Changing ~0U is more than not mechanical: it is possibly dangerous.
>>>>> The resulting value could be different depending on the architecture,
>>>>> I prefer to not make such kind of changes in a MISRA-related patch.
>>>>
>>>> What do you mean by "depending on the architecture", when this is
>>>> x86-only code _and_ you can check what type parameter the called
>>>> function has?
>>>
>>> Ok, I will change these literals in ~0U in the next submission.
>>
>> Except that I specifically meant ~0, not ~0U. We mean "maximum value"
>> here, and at the call site it doesn't matter how wide the function
>> parameter's type is. If it was 64-bit, ~0U would not do what is wanted.
> 
> ~0 is not a MISRA-compliant solution since bitwise operations on signed
> integers have implementation-defined behavior. This solution definitively
> violates Rule 10.1.

So if we adopted that rule (we didn't so far), we'd have to e.g. change
all literal number shift counts to have U suffixes, no matter that
without the suffix it is still entirely obvious that the numbers are
unsigned? I'm afraid that'll face my opposition ...

Jan

