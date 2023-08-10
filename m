Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66B2777308
	for <lists+xen-devel@lfdr.de>; Thu, 10 Aug 2023 10:34:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581909.911371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU17I-0003In-1U; Thu, 10 Aug 2023 08:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581909.911371; Thu, 10 Aug 2023 08:33:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qU17H-0003Gg-U0; Thu, 10 Aug 2023 08:33:59 +0000
Received: by outflank-mailman (input) for mailman id 581909;
 Thu, 10 Aug 2023 08:33:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oMcx=D3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qU17G-0003Ga-DY
 for xen-devel@lists.xenproject.org; Thu, 10 Aug 2023 08:33:58 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2075.outbound.protection.outlook.com [40.107.13.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ec5d1b2-3758-11ee-8613-37d641c3527e;
 Thu, 10 Aug 2023 10:33:45 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9701.eurprd04.prod.outlook.com (2603:10a6:10:300::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 08:33:26 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Thu, 10 Aug 2023
 08:33:25 +0000
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
X-Inumbo-ID: 9ec5d1b2-3758-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fN2v9kFvHdGvFINtlIDqZ0Nygd7V7MjP84snU4WXaBj+01iYBkhpfEtUV7w6M1dFf9WZqZvjN9Z+PN2i7n2gfkbLVFtplX3lMreCUiaVc9zZLPuDg+/Mo4OYU0T4Pw2PQFLvXfWwI7J8+IMkvWaV1Nk+JOl/3jbr8yGIqW9/RGC7alzqRjmu6xmsSNo2YlJGfN/gP8BikYsuo1WD3jo1YumhN0KZi1HhYqXzhFg3Hx1KAigHahlgi7MjAx89NQsG+go1e/i4L0h6tX7wRuFlH4fZXvxmnQmQ5NeEMe2CZt9HuTiGIDBx6BCapk/Gj+A6WUHZl0bKHWtPlC2CfAoa2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3OkJbBC03VMDXwYdmp17cOWGy0bysdttfteuH7xhkg=;
 b=OnEcLM2QPCYcibQBM0f3ZfxA+v90EXNyQrQoqDnvs/VCpt7lEqQ/qVJUTXqBAyOKBmYynF8t55o7Xj5SBzLamrikNrllPxkB4ZX8SpQq6DsqjmuLoOb6xyu+ERJfSLU5MOk4QLKDsxBsXdRLbsU7GZ7kIrZX/pureb0DE9u9+ZhXLkVAQQXrt9a1QqWoJWiNdVItnGVUbYKZDHvo0Dw82h/oJXn1MdCkaFUk99WkOmcQbS5iv86cIPcmo/MuFmy68T0PceV1S43BYDDZ4FNfW8OWeVWksF00VOMOJ2VmHLkRZ8OjAHimDx2gfFm+QKYxH7UTRfD0d21OspxRdntT7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z3OkJbBC03VMDXwYdmp17cOWGy0bysdttfteuH7xhkg=;
 b=FBZV6wMIwrYqNRWUTph0SzordFgBJMSQHkeZqTVgjLe9vFCdxTsxTGQF9AMQBzTpRraOIu/gFpMNKiREjnF2nyOoPEKL3f1BytyeOznnCtXj81BtYd8pXi/ZgJqC5MXGJ6O0aUjooh0gbvwBihgKtvPpYCUXKYP2oKoZb6GgH2WiP4CYCKrLRyVSWfAJasLqby4SHrp4nld46NVipzShBzwecQwLAb9fPdAMqfB+P11Sm9YIbvSS0u6J3ZMC7o9G20LvIDsazigDAPfqn51HSFKGi39QgrL2rsZ3y6CbaOkO1id5Pk+ViYms60NF1mh2CXpjf+xY+m1bIPIuDcTu/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bbaf7e36-55db-904b-d3e8-ba782addd9b5@suse.com>
Date: Thu, 10 Aug 2023 10:33:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 7/8] x86/i8259: address MISRA C:2012 Rule 8.4
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1691575243.git.nicola.vetrini@bugseng.com>
 <41edfbbbc8fae317ebee791633259d7b5c88a2c6.1691575243.git.nicola.vetrini@bugseng.com>
 <d752a7b5-4b8b-8394-8e72-bcdffce1fb82@suse.com>
 <1cfa92d52d89b2013218cef1c518ab4d@bugseng.com>
 <30cd1bdb-be77-a192-eca7-6fcd60eca610@suse.com>
 <alpine.DEB.2.22.394.2308091313270.2127516@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2308091313270.2127516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: 068b13c1-3f47-4ed4-0302-08db997c7725
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	69o1cNUiQrK6cM612r3zI1VJHClOktwO1PKG1nJwpuHo4lXl2/6ieMLjzoxfhCPQor93/miG8cDvQWTej5QP12V4F6OVvXyvkG0vYOGP+kInAVxeDVIzLi2NI1uEUsnSLLCSWRqgdN3WhK54SRi6MfQZur965+7qD8RCE+bDAQHjrj7YxPsUSW1M4FFooNG99G7XSCDaXHSYDtHzSJcCyJAz0382hDatYyTeQC2rkyq1RXBxECLHgzlmt1spSv1lGCLw4n+yv2egdhLrFtxur52q+TFv9ZrIapZ36lb4nzEBQhnOEZfxq6LyuI7CrqDd7TcJUvUReGiw7ESs9aciIIWqAwxBNb/WRPSQE2hmM5oJ1yQQLiNFEnV0uwJt9tynmlUhC3W6MaLtZuVyVq9L4EMlu2Euhfb6N9KBFuzfCy5hqmrGjmiJf0OYMzykTJzq0JYPcV6M61TGKM7+KLaesY0bQ3O+tPYuTlSiJW81duEbo9QB8+on/3/vWmuxj+/VA2vh77q//OzH0cehHcTW3AxdBkzwu7csxdhlV9XWGghEI1Yhcb3xDq7U4+qryDb8xRwqagKl1SCOiuKsiJSOQB56agr7myJWCILjl/cOTfOJkxAB2P7uQEl1a8YmNCkv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(376002)(396003)(39860400002)(136003)(186006)(451199021)(1800799006)(54906003)(2906002)(53546011)(6512007)(36756003)(6506007)(966005)(26005)(31696002)(86362001)(6486002)(478600001)(2616005)(66946007)(6916009)(316002)(4326008)(66556008)(8676002)(66476007)(8936002)(7416002)(5660300002)(41300700001)(31686004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2ZXekJkZzY4dm1RRk9GRTZiMWttU095Y0pZUS94Rm1vVkJ0QUh1UXk1UEti?=
 =?utf-8?B?YlgvYTNJQW9uT2dsWWhnamlYVE5GMmxuTXlGb2dYcmE5Ujg0V2V0a0tody9u?=
 =?utf-8?B?MWxsMU1xUXZ1SjFxZTFWVmozdHFFZkFxa0xIcmxTdHI4VWQ5cC9GY2lhVkdG?=
 =?utf-8?B?UEY2QTNtN3JncFVKd1pWRnY3bmllbksxdSsrYmJ3U0hXQWVna2FYOUpJMXlU?=
 =?utf-8?B?WGwxNGFoV2twVUtpbjZZSUlsTmY0QjcxdEI4Qi95Uldhd3dLK21XWDBhYW9W?=
 =?utf-8?B?NHZSbFF0RE01MEw4ZSt3cWVNMVJBRkxlTE96NHF0MGR4UzBsNmIyRHQyc3I0?=
 =?utf-8?B?UnZya21mNTJiTUh6RzhrNERJNlNBRldoYUoxL0I4V2djV2paL0w5UU0vaFd0?=
 =?utf-8?B?NXFqQ1kvM0VkVTlhYUlISWlwc1o1bnVqcjJrcUxZYUdSV2xRS0xhWVlHR2dV?=
 =?utf-8?B?bWZQdHU2bG5vRjhrNW9pWWdMOE8rRTZla01VY0prd0VBbytaQVBOVldvSUV5?=
 =?utf-8?B?L1Zxc1RKaE03MHRzeWIzUTFiQ0VWZTZsYjUyM1c4UEdJTDZWVVZRZnhiUzNz?=
 =?utf-8?B?ejJaTmlWaHRuN1JmUTM4ZWwyR2tHYkRuaWFteUc3RVgraUxqMjZ1U2xIdTZa?=
 =?utf-8?B?SmhEMTQ5SklSQ2xHbVM3Ky9PVm15Ni9nWlMyQzJnMmtKTzR5VXZJaVY1Mm5l?=
 =?utf-8?B?dEZNMVAvQXpZalF6YTVuL3VoMjhUTzBwdk1Oc3Z3cXgxSTg1bG9MaEUwZmFG?=
 =?utf-8?B?NE9wUmpGc0dQVlBBMTFnUXhSaGxoK0dsUGxHcVhMeFpnUTZWaVpjR2UzdUpT?=
 =?utf-8?B?VU9uWUE5ZytnaHlCMk9ENHJMZ0d4a2xMSDcvblZCakdTR09TQVRVdWc4eVRT?=
 =?utf-8?B?allld0VYVG4zTVpLZTh6SFBCOE9JbXM4MWRlUkxKYVJNeGlBR2wyZDFFY3V6?=
 =?utf-8?B?L3dsQ0RZazBsVWJjTGZzeFFqYmFyYlZraVpObSszdnV6S1RJUWVNclRIMXdQ?=
 =?utf-8?B?cTMrdU9HaG83RktUSXR5V2Z1SGZ5NWpCRGpJTEVaZkJ4UEtEc291OEdGRTcz?=
 =?utf-8?B?OTNnYmxXeCtaYVNyR05YQVIxNTczRjFhZGdiQllhRC9GUG1TZEE3VnpmNTNS?=
 =?utf-8?B?THVnTFdKNSt2NTRlcWR1MnNlb1UwZmVBTHl3cisvUWJZZUtqeDEvMFBrV0pi?=
 =?utf-8?B?TUFoYi9GTHJlNzBSRU52WkVYZStURWVFblFSNzlhUU02bml4TnlQbjdNWjBD?=
 =?utf-8?B?MG1IdmR2c0JuQ3ErdFFYTUE3UTk5SnRSUVFhKytUSmtrd0gxVjVRQ3JwcFJj?=
 =?utf-8?B?dDNVT2QzSlF4M3kxa3c1VmZSSUtncG83MW1KV3ZQdXUyTlFONDIzR0wvL3F0?=
 =?utf-8?B?TVo3NmJodGJZM2dqMUluYk92M3M3RWxXZzU3YnVxYnkzNEptOHZyRUJqQUdL?=
 =?utf-8?B?VUtpa0hYWlpXaGozSHpScXFhYWNNcnA2SXhsamRhalJjamlDck1qMU5xd3Q4?=
 =?utf-8?B?VS93aEdMV0VucFRyeVE5RXhEVXVudnZ3UjVzZGVuaTlHMGxPNy9kNGhTdHE4?=
 =?utf-8?B?VHR4UVk5YVc0UUtIK0o0eDVDWWpSRERIUG9aZjFpbk5zVEI2ZFZ4bEZ5WG1w?=
 =?utf-8?B?UEp5eFg0QnZwM2Z5WWRjV2EyWHMyUFZwejUwd2ZTN2FzaDFMU1V1U0JEaksx?=
 =?utf-8?B?S2FxTVpmejN2cm5QSFZ2VHZiOXgxQ0hyUnllNEtZSG9zYytxVWVqUENkYSt5?=
 =?utf-8?B?ZjdMckRLbFFFNmxpNEs5a1FzUEUxK0x4bU1HZzh6ZENVc25XZGVDV3B5MWtz?=
 =?utf-8?B?ZzFUS2VQS2pGQkVKb2JnTVdSSDMyU3BwRkV5cWJobVZSWjM4UDEyWHU2eEpF?=
 =?utf-8?B?NEN1VytxeUxlMFpFbng3WVdHMXJ0TFljVlJIMG9Nc3g4VmVCdE5rSjRLbFVr?=
 =?utf-8?B?UUpFS05nMVRrVFhBek1kNDJMdU1DWFVGNCtWZDVtbW11NWRrMFQ4NGc0QmQ0?=
 =?utf-8?B?TnVTeEtxMTVab1J3RlphWCttajZ2Q3BKSDZxNXhaV05vdHgzR1QvenU4NVkw?=
 =?utf-8?B?Q3RmbVZmRzBUYlRHSytKbWM2VjJlUHE4Vlc0cmNxWkx4OXVycE41UjdhQnAw?=
 =?utf-8?Q?lM5gc15bdbz8qyR/hDcZSvL3k?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 068b13c1-3f47-4ed4-0302-08db997c7725
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 08:33:25.8244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OmF55/a+qBbiCkFcIqD/lD9QD9tI6tsJimRh/PhuGZFHB8GzkW1cEx0ummc4hxUswbx6coKMladloVoT3SGKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9701

On 09.08.2023 22:15, Stefano Stabellini wrote:
> On Wed, 9 Aug 2023, Jan Beulich wrote:
>> On 09.08.2023 16:17, Nicola Vetrini wrote:
>>> On 09/08/2023 14:52, Jan Beulich wrote:
>>>> On 09.08.2023 13:02, Nicola Vetrini wrote:
>>>>> The additional header file makes the declaration for the function
>>>>> 'init_IRQ', defined in this file visible, thereby resolving the
>>>>> violation of Rule 8.4.
>>>>>
>>>>> No functional change.
>>>>>
>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>> ---
>>>>>  xen/arch/x86/i8259.c | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/xen/arch/x86/i8259.c b/xen/arch/x86/i8259.c
>>>>> index 6b35be10f0..9b02a3a0ae 100644
>>>>> --- a/xen/arch/x86/i8259.c
>>>>> +++ b/xen/arch/x86/i8259.c
>>>>> @@ -19,6 +19,7 @@
>>>>>  #include <xen/delay.h>
>>>>>  #include <asm/apic.h>
>>>>>  #include <asm/asm_defns.h>
>>>>> +#include <asm/setup.h>
>>>>>  #include <io_ports.h>
>>>>>  #include <irq_vectors.h>
>>>>
>>>> A patch adding this #include has been pending for almost 3 months:
>>>> https://lists.xen.org/archives/html/xen-devel/2023-05/msg00896.html
>>>
>>> So do you prefer going forward with that patch or this one (mentioning 
>>> it
>>> in the additional commit context of course)?
>>
>> I would prefer using the much older patch, but of course this requires
>> someone providing R-b or A-b.
> 
> Hi Jan, normally I'd be happy to do that but that patch makes other
> changes that I don't feel confident enough to Ack.

I understand that in general, but for this specific case ...

> For instance:
> 
> +    for ( offs = 0, i = pic_alias_mask & -pic_alias_mask ?: 2;
> +          offs <= pic_alias_mask; offs += i )
> 
> pic_alias_mask is declared as unsigned int.

... you're concerned of me negating it? That's a common pattern to determine
the largest power-of-2 factor. I'm unaware of a good alternative.

Jan

