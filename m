Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF427D4739
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 08:15:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621679.968369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvAh3-00024J-Qf; Tue, 24 Oct 2023 06:15:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621679.968369; Tue, 24 Oct 2023 06:15:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvAh3-00021V-Nw; Tue, 24 Oct 2023 06:15:09 +0000
Received: by outflank-mailman (input) for mailman id 621679;
 Tue, 24 Oct 2023 06:15:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvAh1-000216-JW
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 06:15:07 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac68b274-7234-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 08:15:05 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS4PR04MB9575.eurprd04.prod.outlook.com (2603:10a6:20b:4fd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 06:14:35 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 06:14:35 +0000
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
X-Inumbo-ID: ac68b274-7234-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O56b9hzFx3NbtpMMUXJdYBdECBsMnkC42KGy+Ek1mXgD+/P59PaspsJswV0XU4+fRykAAUojfuj/m+8TiS2QeOokRdErktWTtA9TJMympFahSlxALt0aR6Y5hJ1IValNy2rPOZtmA6NzJ7CQeoenNDJT8PI2wrvStRjwP6evgJy02x4N703mT0ju0d7OGTidRwgcfLWvaZivBGnBMD11Z2hUcRDxbmooqb4r4dc2FUwuy1EZ9wk36enO1tI2VREcQeHiy7IT44zi1ZAqzjgzxhLzmzbuxinDjc5VEeg6qZpY8JvCL5cWuIQiJpAokOCDgveqMuZwpmrQ+DQStwfRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqtUNM+2AYnlBvGcxbzF+bWVLLpWpIqj+6EYPKzDNSc=;
 b=gPCaGB4oUeIKPBIYq7c1ZuHS2DRAzTwMMJmjFvUsonCPb/Loac8JjyswexfZdvqcwtV8dgVH5lOMvlxWFNftO0SsABfk0rVmXPqq28WTnmjxlwCBeLGoVg9v4cAmj428OM1WqKn4neY7c0xBQt2Y3yGBHazu6qO7dsEklAUmqzZp1dAgZsCpR3e6PVpEvhFCZrRjniIZhCXQQsm4p4eYABx7HyVC3JKHCndBYyH5Kgp2XzhEDo92WVXN5Ody92nX6P64bv+UZOAM2lh50XE/lsy42LPELL4rJMXs91B8s0UaCcIunvzVkG4OS8J3WBwkTwfq/2eQ/WA43Y3a/5rqIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqtUNM+2AYnlBvGcxbzF+bWVLLpWpIqj+6EYPKzDNSc=;
 b=TVLoi9aC7CgJcNj2obSmnljGUbkz2+k3h0TZ6MKxcBu5j71vjoUg0wLNFzL6/9KLwAGBuPJrhJ95R569GYuFPHXVIc0Qy38ui0W+JtuEA+1PkxWxeowhXPTDqR6qxKiQ5fXiqXakPqmAmYshet7SP/ezIfq2yarK7TiatF+gcj2oUk27jXM0dIMgee0hujS0cEyFKCP9TDxcJm3CdKts8EuKFsoJZbh6rN2Jdw/MVO6yJOsxAU1XTRhqVshfBJ+/sVm5pLmLMB2f4rrPKOKz33ogFnyyJPwDm32/3R/Adb9bwFTUDHA4WqIYJQpVqj7gwu9dPchFDYxHODuLaZFUyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dd33e92f-03aa-cf3c-23d7-dcf9cce23c8e@suse.com>
Date: Tue, 24 Oct 2023 08:14:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen/include: add macro LOWEST_BIT
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697815135.git.nicola.vetrini@bugseng.com>
 <546cf30aa43d6d0687a9a6c6d23b11128e5783e8.1697815135.git.nicola.vetrini@bugseng.com>
 <f504772a-68b4-fbfa-e7d4-8d22992c7944@suse.com>
 <f23a1f95916bd61ddcd5002428d8876c@bugseng.com>
 <6d113a237846c7a41aa083e806f172e7@bugseng.com>
 <5475d9e5-ec1c-7f71-ee77-59ec2e6ee01e@suse.com>
 <alpine.DEB.2.22.394.2310231340320.3516@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310231340320.3516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS4PR04MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8d162c-aac3-4ab7-130e-08dbd4587e9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ahKwEyMfs+45nVrw/EhR9STvuXX63MMXGHS1rYmMXMQlr9hFZK9rK6nq74Cpb8Nw7caUjui4TqU8em8bJwsU8gytKoG9UpcpXj0wob3oHzGDYoA5+dWo/CoMrNafyijFqlJyT2txp1rYAUmmna/hhdNPTzGS9TZY/QWPH4UJSue7CxDy+UgciNppiJhCH/eS8hNMApLnTWimW4/beZIvxlZ5ueLTvMRcvG/ol4+RI8m5i97TpCmryecq2pQlhKyjqmFf2zDtt9QD1h/x2CNHq8cPBXxCWUNr+rW+34vlwSvGpLcWhcqIKJjFEqlV4/lPJI73133Gh3XFwfMaiMDcrqRBW98twWsnlzRB/gXiMnJufshtF7yqW+BpjbCPeF6fqZlZTLsvhQdEXWHsr/0IA7sjXLcR41DiBb3Sts7xRRaKHXKekGJVuYrCGkrf0zVPcdWk2qa6zbxKwfITEewu7FptV2ok84DwFFTljh1V2bhtWg/RThDjcV3FkkL/jDfX9yUhek4W6o9HH1sxv+Z2vQHyGnnlBJWnBl6PeDwpcuRGFzkAvuQVJpgOga62z2tZV8wB/kROPXZMM0ODyPsNm5XC6mA3lNokSasLKIIqQPM+xx7iue0540bgZ9mHnUn2dwNwE/FwKZXqT7cXoZgzHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(66946007)(2616005)(6512007)(6506007)(7416002)(41300700001)(8676002)(5660300002)(4326008)(53546011)(2906002)(8936002)(478600001)(6486002)(66476007)(54906003)(86362001)(316002)(6916009)(66556008)(31696002)(38100700002)(26005)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzVmbk92ZElyL0k1NVhnL2ZWc3V4aFp2ZjlleldOR3hIdEV5TUNNZmVaS283?=
 =?utf-8?B?UmQ3VWtwVjRoYmpNSml6SHdJR1Z3KzNlb3N4aTNhS05TeDNnV3VqSC9PWWF5?=
 =?utf-8?B?RXB6TWtzVVI1dWZWWmtYczBJY0ZSMnB2QUdtK2NiUTliZldSTFNLYTRhZExU?=
 =?utf-8?B?NjBpZWZUY0tqQk0yZ01nRUJOeVhlZUhFeTFqZkZ2ZVIxeXp2SWlGOFJQMktJ?=
 =?utf-8?B?NEpqYkpXZUVaTDhDT29FSmFUOTdRcmtsMWlhVG1IT3Z4blBNQ2pVcldGMkNO?=
 =?utf-8?B?dzU4b0JxMURXcHNpK1ZOcTY3bktXa205OWxwWHJvd2NiT3RjdFVlQlBCTGtn?=
 =?utf-8?B?UlcyZXZQUlcxRUNUS3h1bWdIcVpBeGVpbVcvVWJuK2xVVWZCR1JlT2t1WnJN?=
 =?utf-8?B?RDJ2SE9IQXBiV2pjaU94YTgrMzBnbWM2MjhMUitXSFJnVUpPMFZRTFJlTzRa?=
 =?utf-8?B?eUxzd1FGcFB2SGkvYWRHS1l6S0RPLzBRMkhXQzhxdDE1Q0ZpSGU3SFdCVkVT?=
 =?utf-8?B?NitVSHNyU2xtbHVnajJVUC9rS2JZWUxOWSswRmUvbCsvWjYrM1JUcWtwNkNq?=
 =?utf-8?B?ay8vWGljSWVSQkJKMDBIcE5aa2t4ZURSTStUaTg2ei8zN3pPRXgyeUpSS1o3?=
 =?utf-8?B?bkh2NXhaQzArdmxTT2d2Qzl5QlhUT3ZlWCs0QXI4azduMEhaQ2lRLzM0a3FP?=
 =?utf-8?B?NmtBK2pOQUxDelU2aVRoelNCMlUwdEgxTEFxbElNengrd1NBMk1IZWNrMG5l?=
 =?utf-8?B?RXhaZHVoWHFtdTdOSzUvdFZQd3pDM1ovbVZOUmJyQmo1ai9MRlI0OTZWa1pM?=
 =?utf-8?B?UW1LbFNlNVlxa3crKytsRnN4OEMzbGx4cGFuU1pCODkvTHNUcyt6UU9CZU8w?=
 =?utf-8?B?THZqdWIzNkt2U3NmNHNqcldwN1pJT1JhdndBc1haaVMrdXRRd3V4STVPbTFq?=
 =?utf-8?B?SUZmWFFoNXJsVXVwYy9pdTZjYm1TeWNWVXkrU05teVdkSXVxa2NqZ1E2NkxR?=
 =?utf-8?B?eGZTUmdmaWx2MXVGMjY2Q2cxZ05QYU1NLzBTeWFtUStVVXBHYzkrdVM1dVhw?=
 =?utf-8?B?aU85YnAzbWM0azczYmFTTDVGOWJROUhISk04ZEZSd3VOc09ZSDJtOE1tRks1?=
 =?utf-8?B?NDZlcnlHT3k4c1dxQXp4ZXh0OUdySzE3NklBN0tMdmtyaWRGbm5MTldCVnFY?=
 =?utf-8?B?ZkpXUktadXFlZXpIY05nK05nZEovTW9jc3R6cXd2aDdQaHdlOGpodHFqNUt0?=
 =?utf-8?B?VEFBVW1KNm1wRjROYTVwNS9SZWNBQ2dKZmJKenVrRkxuYTNjaE9hOGsxYTVo?=
 =?utf-8?B?VFJFZXh2WGw0a2F1anF3V1FiWDV5WHJVc2tSR25uSTg0eXAzSlNHajJFcTJN?=
 =?utf-8?B?RU9SOVpRdVZoSG9QRVFuaERSZFVvWG01aitCZW9jeGhFYVQyb3hDNFBERVMw?=
 =?utf-8?B?WnF6dDlYYlZldlJjNEpaTU5qbWVHL3pjcEllRWpPMXhrNTc5VGRLWG1lYTBR?=
 =?utf-8?B?UTZ1N2IzeTZnanNHM2tyeUxpV3VCY0I5Y1FEcGRlUzBncjhKajhNTFNIeXM4?=
 =?utf-8?B?U2oveEFVT0xuaDFlTjR5WXQ0aFlqcXZPYUt2cVJmeUQ0MDZuZEZpZ0hjZzdp?=
 =?utf-8?B?NXgvOXNMUTRnQUJoSHJraXQ2R2podjNoWCszYkFNc0h6SGwyTWVKeVNhRWFS?=
 =?utf-8?B?SldYSUJJMzR5UXFaZkJmRUZDSklpOWRCZ0s5b0VSN1VKeVI1YXJ3YUp2OHNT?=
 =?utf-8?B?endpT2Vsa0gzYWVXZEdMaEp6STd3VWU4TXFoYUhVVlhXOTkwSFRRUDhiS1U0?=
 =?utf-8?B?dTRDd0dNNTRVRExuOXpnL2JvdzMwVEtMN3lTWUNBU0xYOTFPbEFJdVNUVSt0?=
 =?utf-8?B?cE1HbnpldHhHRHJBNERXNVMxUFFaVENWYWtWeDVRcHkyeDlkQjg0VzM4c05z?=
 =?utf-8?B?cFZsNW5FSTdXRXF3TEordjVtSEYvMWdmVFBDNlM3U1Y5QnhxUUoyU3kxdGV5?=
 =?utf-8?B?YzNBcTJsc3BoZUhDTCs0MnZ6VFVLUHdEc2VyS25MczZZUEN1VEJLMWhEakc4?=
 =?utf-8?B?dVE3Z09UaHhJV0hWUUpOSktnWHU3b1JuQ3g3M3hXVEZEMGo1NUFOV281c0hV?=
 =?utf-8?Q?RbvkgKd8idn3l4Xdy13FA1t0h?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8d162c-aac3-4ab7-130e-08dbd4587e9f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 06:14:35.1542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bZVwK40as0KiBhdpU2vVnH/N1FLqvk1j7NMfI5fkpP3K6Kuh+zZzLw5GSRD687HWb1VCIJ/ItAxNxdNuflYcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9575

On 23.10.2023 22:44, Stefano Stabellini wrote:
> On Mon, 23 Oct 2023, Jan Beulich wrote:
>> On 23.10.2023 15:19, Nicola Vetrini wrote:
>>> On 23/10/2023 11:19, Nicola Vetrini wrote:
>>>> On 23/10/2023 09:48, Jan Beulich wrote:
>>>>> On 20.10.2023 17:28, Nicola Vetrini wrote:
>>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>> @@ -246,6 +246,12 @@ constant expressions are required.\""
>>>>>>    "any()"}
>>>>>>  -doc_end
>>>>>>
>>>>>> +-doc_begin="The macro LOWEST_BIT encapsulates a well-known pattern 
>>>>>> to obtain the value
>>>>>> +2^ffs(x) for unsigned integers on two's complement architectures
>>>>>> +(all the architectures supported by Xen satisfy this requirement)."
>>>>>> +-config=MC3R1.R10.1,reports+={safe, 
>>>>>> "any_area(any_loc(any_exp(macro(^LOWEST_BIT$))))"}
>>>>>> +-doc_end
>>>>>
>>>>> This being deviated this way (rather than by SAF-* comments) wants
>>>>> justifying in the description. You did reply to my respective
>>>>> comment on v2, but such then (imo) needs propagating into the actual
>>>>> patch as well.
>>>>>
>>>>
>>>> Sure, will do.
>>>>
>>>>>> --- a/docs/misra/deviations.rst
>>>>>> +++ b/docs/misra/deviations.rst
>>>>>> @@ -192,6 +192,13 @@ Deviations related to MISRA C:2012 Rules:
>>>>>>         See automation/eclair_analysis/deviations.ecl for the full 
>>>>>> explanation.
>>>>>>       - Tagged as `safe` for ECLAIR.
>>>>>>
>>>>>> +   * - R10.1
>>>>>> +     - The well-known pattern (x & -x) applied to unsigned integer 
>>>>>> values on 2's
>>>>>> +       complement architectures (i.e., all architectures supported 
>>>>>> by Xen), used
>>>>>> +       to obtain the value 2^ffs(x), where ffs(x) is the position of 
>>>>>> the first
>>>>>> +       bit set. If no bits are set, zero is returned.
>>>>>> +     - Tagged as `safe` for ECLAIR.
>>>>>
>>>>> In such an explanation there shall not be any ambiguity. Here I see
>>>>> an issue with ffs() returning 1-based bit position numbers, which
>>>>> isn't in line with the use in 2^ffs(x). (Arguably use of ^ itself is
>>>>> also problematic, as that's XOR in C, not POW. I'd suggest 2^^ffs(x)
>>>>> or 2**ffs(x).)
>>>>>
>>>>
>>>> Makes sense, I think I'll use an plain english explanation to avoid
>>>> any confusion
>>>> about notation.
>>>>
>>>>>> --- a/xen/include/xen/macros.h
>>>>>> +++ b/xen/include/xen/macros.h
>>>>>> @@ -8,8 +8,11 @@
>>>>>>  #define DIV_ROUND(n, d) (((n) + (d) / 2) / (d))
>>>>>>  #define DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
>>>>>>
>>>>>> -#define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
>>>>>> -#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
>>>>>> +/* Returns the 2^ffs(x) or 0, where ffs(x) is the index of the 
>>>>>> lowest set bit */
>>>>>> +#define LOWEST_BIT(x) ((x) & -(x))
>>>>>
>>>>> I'm afraid my concern regarding this new macro's name (voiced on v2) 
>>>>> hasn't
>>>>> been addressed (neither verbally nor by finding a more suitable name).
>>>>>
>>>>> Jan
>>>>
>>>> I didn't come up with much better names, so I left it as is. Here's a 
>>>> few ideas:
>>>>
>>>> - LOWEST_SET
>>>> - MASK_LOWEST_SET
>>>> - MASK_LOWEST_BIT
>>>> - MASK_FFS_0
>>>> - LOWEST_ONE
>>>>
>>>> and also yours, included here for convenience, even though you felt it
>>>> was too long:
>>>>
>>>> - ISOLATE_LOW_BIT()
>>>>
>>>> All maintainers from THE REST are CC-ed, so we can see if anyone has
>>>> any suggestion.
>>>
>>> There's also LOWEST_BIT_MASK as another possible name.
>>
>> While naming-wise okay to me, it has the same "too long" issue as
>> ISOLATE_LOW_BIT(). Considering x86, in the BMI ISA extension, has an
>> insn doing exactly that (BLSI), taking inspiration from its mnemonic
>> may also be an option.
> 
> I don't mean to make things difficult but I prefer LOWEST_BIT or
> MASK_LOWEST_BIT. It is clear at first glance. BLSI is not as clear,
> unless you work on the specific ISA with BLSI.
> 
> In general, I do appreciate shorter names, but if one option is much
> clearer than the other, I prefer clarity over shortness.

That's fine with me, but note that neither LOWEST_BIT nor MASK_LOWEST_BIT
really provide the aimed at clarity. The shortest that I could think of
that would be derived from that would be LOWEST_SET_BIT_MASK() (albeit
even that leaves a bit of ambiguity, thinking about it for a little
longer). The main point I'm trying to make that _if_ we need a wrapper
macro for this in the first place (note the other thread about macros
still requiring deviation comments at all use sites for Eclair), its name
needs to somehow express the precise operation it does (or, like would be
the case for BLSI, make people not recognizing the name go look rather
than guess).

Jan

