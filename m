Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D6778D6D6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 17:13:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593055.925955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMs0-0003KX-7D; Wed, 30 Aug 2023 15:12:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593055.925955; Wed, 30 Aug 2023 15:12:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbMs0-0003IE-4X; Wed, 30 Aug 2023 15:12:36 +0000
Received: by outflank-mailman (input) for mailman id 593055;
 Wed, 30 Aug 2023 15:12:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a0OZ=EP=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbMry-0003I8-VM
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 15:12:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4eb6d2e-4747-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 17:12:33 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9179.eurprd04.prod.outlook.com (2603:10a6:10:2f6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 15:12:31 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 15:12:31 +0000
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
X-Inumbo-ID: a4eb6d2e-4747-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jN1Ethr0/qfeMqNL42VIPT+t+2kMAsi42Te2oEHxUOLvFG7QwJdqFuzADATmrYyLU4sS11Ah9226VZUSkgZTD24i7IRANry31M7aT58jCVvLPVxHDBxjW/1xax4O4pNnaMlWBJxS3XKwl8ENMdQeRlTrMKbIHCzJ4R9Yt3g0j+pIZMM5E0eu4dsxSEHom6InswRZU33Uqz9dfcHmBZpDGJOuQEyc1nQMkzTbhaERu0QmKmlCr3lk9cTfVW9VBXYZ8fu3u+dL3FGdikPxJHIL0xMJrGjIC+UtEMMPjHZ0Q+syqoB1bDVIsEknoRzxmYpZH5uCM2/vUtjWbcqTi/rZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzO3aEO+QNTL6cHJibhd5bsBTTNKCXbJhWQpEdGfbto=;
 b=W7F0MMofp+XCx92HS77vGyt131hZBxdvE0UzIC+XENzDBQlT/Na14rElbzwrBdMGpsuVbKli0n8vVBUjiZaoEPh28wh5hlpFSCa1BvITs4P2WNyCS48ggXwerGq5MjebUG0V4zVJCOlyC17zG4JKPbA8ZFdnlkXF7FaO4UE7UJCAg7UdQ600PvznZU/2Nksh1Uqmz2QLRqoI3oCbZ6jG8ayBJDH7GdCrPZjybO0PhspcOF2TaCNXZ2PePRfKdaHy/s3Ky9EB5kYMMc38uxpxMBJqN4sIemU3UUYp6OmRhCoMj0srhV4GvpxTwYDtScv8UcJXCQfIXvx+eADLCtUfEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzO3aEO+QNTL6cHJibhd5bsBTTNKCXbJhWQpEdGfbto=;
 b=kmAwaG69NDtGwDey3wS9VH1zyKgBjFNdFyUH+SoZkfTNU4VtzqLXichBD38jYicDX+NZvSAM578WueeQ2Jpp+CigLt8HKFLjI9BpBlyUY1ibkvT6m1SqH6KY4d691tQZzY83SvjfjLimdhw6+14oRWKwaTsTEp0Lb0pqIPVQVdgN0XbsPWVIIyTlPlsWnzp3olLhLzeOlEK1+OThQXsRGFvjugMXS4R76fZc/JXtVqgM1rFI0tO+ublyrzUyQoqD3sHYYA3a1QS34zBr7ulqGawFB2PIySujQ641nI3UMNIUKQh6FzbRhENgRyB9VwxMPrw6T3PCbQi/iTQEwrNZeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0708d6fd-2672-a0f9-e782-83e6eb66dbeb@suse.com>
Date: Wed, 30 Aug 2023 17:12:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] x86: Reject bad %dr6/%dr7 values when loading guest
 state
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-2-andrew.cooper3@citrix.com>
 <6217ca42-d5bb-40a0-53f0-ec543c8297a6@suse.com>
 <c86b8f1c-dffb-c850-3054-f31f584861c5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c86b8f1c-dffb-c850-3054-f31f584861c5@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cec998-4ae3-4afc-c98c-08dba96b885a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0pgiEUkpo1ODq3sDB0rn5GMjceDSGvQRtWW19uh9qDS0QRSO87qhNMnouu6TAxdq/vcY6JcUObK+5gnF8+LuH5+fVxhv+q0cRSSdPlzwstIGoGkkLmKdcIXWR1ObWqzgJ3kQG4V+CgcyemgR/TLZnKsu+DnBLL4FlN3aZwCoRiZAzKncXlgPYdju62bpXxrbKXRE21yI6b3ZkJH0GP2+KE/8+XwqBiFfC2gZEu89TWcbf3G1eMDhV49tbR3l2d2vENsiopeCDMbvrIbPEgLeDp+aXlI8NzWRC+o7FV1eIkdUVfwrmaQKbUoHVaYVo5WrwAcsg2iPjgEXI7ATxWuwDQmJtHAMcxnpzVrL2okoryUrfN/7P5QW7bR9MU0/mFjaZDhAGoY6n/BZZDxQHaaq0P9QB0hIC/9Ii3aj/PmEykcOJv1B6T04RUT6wnpawuU1Xj4OM7p43WauGfeScAhRWO+0x3RHBc12GY9Qt7Z8OatFlnUDCLiVM3zyjcm3GjFFDJGG+3O7C37AGuh6Us0oPDdliD0b4kdZ39LvZ+VHDJjZ2SA4fJhBVGIX9K8OwiAkFe5ZMcLxlY4MUaOhbfSq3PcHHx3Qki6iLM8uW22763ofmTDSjqVxZVgoW+KrQ+7QhzGXkCsZbs6AvUF4oy8YhQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(366004)(39850400004)(186009)(451199024)(1800799009)(36756003)(31686004)(2616005)(83380400001)(4326008)(86362001)(31696002)(41300700001)(5660300002)(8676002)(8936002)(53546011)(26005)(6506007)(6486002)(6512007)(478600001)(38100700002)(2906002)(54906003)(66476007)(66946007)(66556008)(316002)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFY0Z1R6RkZZUlpyYjJPM1RVbmxuTlg2c3FwSVdDdkxMT05CRjhBWWdraTVy?=
 =?utf-8?B?SVU3TTlJQU10SEZXbG9QZUZ4bXo0VlFsbWFvZklsVjBhNkdKSG5RUmhoTDdn?=
 =?utf-8?B?dVZqdzVNcyt5ak1IS2JjN09uWldZSVJQeDdLWG9vWDBhSzBRSHYveFJ6ZGZn?=
 =?utf-8?B?a05TM1YraVg0MnNIMWxjL2RQbGFIQ0Q2Qm40YjVNdVliMFlZVlExOWVvNEV6?=
 =?utf-8?B?YWFnWmNMVW9jVGZCeEs2SERwNWFVWUxPNG9sNU1MK1lZOTBMcHVLZzhLSGc2?=
 =?utf-8?B?YWxpeTZpK1JCMk9SckViWVlkNktoWVF2RmFLR01wVVd5dUlTeDBCQ1pqQUF1?=
 =?utf-8?B?bTd3cUxpR1pXc3A2TWpjVFJqcmltYWpUUUt6WkN5emV1V1psRWQ2RDBjZUor?=
 =?utf-8?B?SXZqWkJ3RG9ESVNydmR1d0cycTQ3MnZIclR6SHVKUGF3UjNOcGh2S1BCd2FT?=
 =?utf-8?B?cHBjQ1BETjlWZ1l1dVdiQTVCd3FUSjAzeitQQlgzaC9uZDUvWVozSDkxYUhx?=
 =?utf-8?B?YyszNUhrbzY0WndxYzZTaTFvTkxzaWdZamM2RUEva3RubnltcFN4b2FrTDFF?=
 =?utf-8?B?NGNYS3cyb1lxZm5wSlRiVkcwZ24wc3FQNENZNnRBL3V2N0NZcWVyTEVzbzFG?=
 =?utf-8?B?QndQRGtWQ0lzTy81eDRtcmtsNmRnUmJoY1lvOTQ0ZmtjcnRGOS9FQ3loTVBk?=
 =?utf-8?B?ZUc1SmJIUkdXbWtzR0R5Vmd3MGdoQktMMm1wQzVzZktTK280Rmx3VlR6SDdP?=
 =?utf-8?B?WjNmOU9uWE5sQXBjNStEOWRlamxjV2hlSk9oQll5VW5mVmFoUG91RXE4M0xQ?=
 =?utf-8?B?dzFMR2tCL0dyaStrNGhiQ2FCNm1LVUtpbzFHQVN0Rk5UanFGSnpNZ2p2S1Ni?=
 =?utf-8?B?dTFOUklIS0lKZlBUbDhvVFZOTDQ2L2Zua2NuWHBTdC9Zd21ScmQ0ejgyM0Zu?=
 =?utf-8?B?REZ3MmpxdTR6Qk80c2htNmV4ZEVleWFhUXlITm84SmN4bTVEM1p0Qjh1Wm90?=
 =?utf-8?B?U0FIRDdxaXhaQmo2czZmalN1dS9qcVR4aE03T2RNYVVIQ1VQRnZIa3V6SUUw?=
 =?utf-8?B?ZmxNWEJYWDRYMy8zTlk2WWxnWWFxV2NYZVRHWFJjVjZrc05tKzROV1NZeDdr?=
 =?utf-8?B?aHg2bWNlM2VYZFpJZWlWN3pEWjJYQWsvc0tFRmJJTlZqTHArWll5Z2I1RFdz?=
 =?utf-8?B?a1RDUGg4UUIxbVBLQS93TDVsbDBlZGhuZDg4dTVxY0xpbzRWM2tFTU9kdFRs?=
 =?utf-8?B?alJjMHVJWHNES1NLNDY3SGVBb2xZWUNnR2R6TVc3TEI5d3gyeExFbTNEWXlS?=
 =?utf-8?B?SFRKV1ZUS25MbFZyRS9qc2E2L0JsZ0pvK1JtamFYRWFYbndMVitySXBWaGcz?=
 =?utf-8?B?d2NKam9PVVV5WmhRT3ZETTZBcEpYTzhMMk5sTEQwYTlqOWxYaUdKQ3RhbVlX?=
 =?utf-8?B?RmhjMDRoK0R2dTRmQ1dXOEVQVGw0UDhsUDNwV25GZHRvV1VyS01aM1U2ZktL?=
 =?utf-8?B?WUFpOHp0bEZkZVV5ZVVScGlCYnFLRnZ5MUQwWU5SUlhQeVVQeVhJNEM1Uit5?=
 =?utf-8?B?SFl5cy8xR2tKOW9oVnZySW1OL3BQT2ZQcEJxcXN3d0xFS3FQc3l0SDZpNEZj?=
 =?utf-8?B?c3NFVlJCSmRidGhHb1FvZkJiWkVpSTNUc0FJbGNNY2NIZWV1ckhaMWVTaWtN?=
 =?utf-8?B?bEJ3cURKTW0rTkNiWlBzNVdCVStnaVI4N1doZWhucHJHSE96czdEL09RbHg5?=
 =?utf-8?B?TjVpM09hVXlDRWJmNXgzcS9rOC9LMHdobVpnNlFnVmZTcWcrNUZCMVlHbE8z?=
 =?utf-8?B?QVM2SWpTV3g3YlI3OEd1ZGZQVTZ6RERONncvaTN2K1UvaGt2TXVubWJQcHFq?=
 =?utf-8?B?bklZUTlKeDZtN1h0QjRiUWplTmRnWmJaTUc1RDdRWXl1U0NNVkdBbDVyc1hQ?=
 =?utf-8?B?V3VOdWJ1dzhxKyticGZpM1dEMjRiSlREMGUwcThGYmQ5eTFSOHViUGo0d1Q2?=
 =?utf-8?B?bUZRWnVDaSt2eGRTWktvdWYvS1pZZFdCVzQyejI5cWNkKzJHT25hODRLTGxB?=
 =?utf-8?B?YU1KbityeHA1S2VvVUFRb1oydVRYeDNqWG4wWFZNZUhvOVB6THY0VW1HMXdl?=
 =?utf-8?Q?lnydlqA4QwNq07HlpkPlKSdU/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cec998-4ae3-4afc-c98c-08dba96b885a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 15:12:31.8400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eJIgdXhj/FE+iVZ3Tsci81tQwWvbLm5vldhaRbYW3AvP1CidDB9zCkHrwJQdSXg1zmK2E/4KMN3S0G+UjF8/qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9179

On 30.08.2023 16:35, Andrew Cooper wrote:
> On 29/08/2023 3:08 pm, Jan Beulich wrote:
>> On 29.08.2023 15:43, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/domain.c
>>> +++ b/xen/arch/x86/domain.c
>>> @@ -1074,8 +1074,27 @@ int arch_set_info_guest(
>>>  #endif
>>>      flags = c(flags);
>>>  
>>> +    if ( !compat )
>>> +    {
>>> +        if ( c(debugreg[6]) != (uint32_t)c(debugreg[6]) ||
>>> +             c(debugreg[7]) != (uint32_t)c(debugreg[7]) )
>>> +            return -EINVAL;
>>> +    }
>>> +
>>>      if ( is_pv_domain(d) )
>>>      {
>>> +        /*
>>> +         * Prior to Xen 4.11, dr5 was used to hold the emulated-only
>>> +         * subset of dr7, and dr4 was unused.
>>> +         *
>>> +         * In Xen 4.11 and later, dr4/5 are written as zero, ignored for
>>> +         * backwards compatibility, and dr7 emulation is handled
>>> +         * internally.
>>> +         */
>>> +        for ( i = 0; i < ARRAY_SIZE(v->arch.dr); i++ )
>>> +            if ( !access_ok(c(debugreg[i]), sizeof(long)) )
>> Don't you mean __addr_ok() here, i.e. not including the
>> is_compat_arg_xlat_range() check? (Else I would have asked why
>> sizeof(long), but that question resolves itself with using the other
>> macro.)
> 
> For now, I'm simply moving a check from set_debugreg() earlier in
> arch_set_info_guest().
> 
> I think it would be beneficial to keep that change independent.

Hmm, difficult. I'd be okay if you indeed moved the other check. But
you duplicate it here, and duplicating questionable code is, well,
questionable.

Jan

