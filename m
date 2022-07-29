Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97980584B62
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 08:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377305.610448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHJ9F-0000kB-HN; Fri, 29 Jul 2022 06:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377305.610448; Fri, 29 Jul 2022 06:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHJ9F-0000hx-Dw; Fri, 29 Jul 2022 06:06:57 +0000
Received: by outflank-mailman (input) for mailman id 377305;
 Fri, 29 Jul 2022 06:06:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oHJ9C-0000hr-Ne
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 06:06:55 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10085.outbound.protection.outlook.com [40.107.1.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a39b0f15-0f04-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 08:06:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8372.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.25; Fri, 29 Jul
 2022 06:06:49 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Fri, 29 Jul 2022
 06:06:49 +0000
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
X-Inumbo-ID: a39b0f15-0f04-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzsUdF3VG1L8HjKvhR1hLljjbLeEYC150ofxDS35zyD5k1rYOUahtJK8O7DAFeCUV+C9mgJOO0i8Byjc7NOs68RZGGFWFa85HRkN0KpJcf1mdHF3BQXEKNiGLTtmJgls2oyy+RM9b8dbC1yqE0nbMKVVRVCkwEnOdwUdNS1VWzpaYVDLYeB5n/UXaeehapEmtMtx1Uxo1U9pEl0iy27EyNvxwHkNq2KB8BBHanXOJV57FSKjGinn9gbTWkP1/JYSAyr8sqTRLf5orsn6IZ2zYk2Bez6D5sXY2z612nMX+3e3iYVOCndgrIaas+LL4VPFxAcwIyPE+1GhHpA/D/QajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0/77bOgMdn5xbfR/VFB2ZYeKWpba+foG2spqaIxxxU=;
 b=GMjL/z3NuvIL1xDUjlnvEsVA51WcQaPM/3Xv/TvUI8DGXg25BtDzBZlRQwq7nzK46g2pVTHe8NK0jE9/bC0GgxgVvTSxzVRAUeNDsgjXgUspszsAkeJILHVud4MGYrL3UVpJI/Pl7hOeAMUoM0tLbSeCHdgl/tpmDBE9TDsv0FIcCSt16LHKFQrtstBV383SbNW7KgIs9Ofl9V5gEjrC1N7pPh/ArJ/nfVsLZBrcWcJxSkDQN57c0UJkD9fkKtmtBT7QthixqnRSPYiNhC7sNbCpKAG39xaFYKWnNvxBksRxZAslR4aHiG0K6rexGDGyYQfC0a/h7PeH3ERmK+GIbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0/77bOgMdn5xbfR/VFB2ZYeKWpba+foG2spqaIxxxU=;
 b=RD6krOlWyOnZ1UdU2kkUu3m02qT4ZAMWgOxvSBA2BV0J99DVBUyhMTo9KAEHNVhrK072kFkqHYP89PutvWQEfkdapUoK7C//rE2bqTqCl7ZqNdQOqsWcb9+kOLk2tqte+ClmqmJyjMcw+ZReHlSskGZOyyWLnmukVniOVaCUxDryxzoy3jn9PwmvhEGWvLmeilFgu4FYvXlYP25duXOmtHSiAuQdqfrIAdb+Oylg4l32416ygdCYUddjJFMCI/lJZVERUMz0qya0MihujBI6TVXs/oweU5/JAodk/JOsLY+Pec4M111U+deBItQu7zBFj/7YhKrM83SDrbQwWRtSUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1286f79-65be-a7fb-0661-2b682ab3d4a8@suse.com>
Date: Fri, 29 Jul 2022 08:06:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 10/11] xen/arm: translate virtual PCI bus topology for
 guests
Content-Language: en-US
To: Oleksandr <olekstysh@gmail.com>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-11-olekstysh@gmail.com>
 <6e1a842f-e577-0f01-5046-f96c3c75db5b@suse.com>
 <b0f69f8b-d163-f984-e5ec-88a0a158eafc@gmail.com>
 <8e839472-f49d-a464-34aa-c7b26b9c50de@gmail.com>
 <cfc6488d-c06e-e943-fc8c-7b12d330f263@suse.com>
 <3752a158-85a1-e758-36eb-2feb0c5be954@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3752a158-85a1-e758-36eb-2feb0c5be954@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e11e5bc3-8e7c-4eec-244e-08da7128863c
X-MS-TrafficTypeDiagnostic: AS8PR04MB8372:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	P0FRuVLu8PW2DGoYOATKknZNdUBEcOInwMetXxUGCgpwuFH739u8XcncyxAFHUBM93CpA7rW35XfAg4te9QvdzABPRSzEVmdZPbKUXAN1raMfpqLljC3VkjmTEVtMFgojbUDR8or4tn7W8iTiR3PKr4zkX5P4m9IvRntcBta+jBbDY+493ORWmjR5C42xJjQ72Tj8AGPQbrdb+4IiPBwPqCaZ+21jhpTUYvsIzil3rmimDW+GmJ/gtqgDUKWvDUOieYg+mmCu7nORzCaIvz7DLiVd9qajNGNieSHFnP3GefbG/5pQPT611CyukCxBTElRAQM6awX6auTsin0jiBpId9qWuCnWMo2aqiPCNqzselJTpht9pwZ3siP2RvSomxEOoqfxGQPCwa6YtNKdim+lST1DhwcQ6WNspMHwLpvUn9LUsSLcd2MPyWLgDeS/h4zYytpdcyMWR2s3N/jFbESQxyhTZvtjlql3fZFpuSmueAYiSw/RJSm6ciLTTTBRgzSpAd5l6kPnz5y2kiQ1YFsCpBAwnFqmmvffznVlVOTmtDOPqpH580of/v5bl+AsWPeYdvdUoOzoucnFnHRTOteIOq/3Ozrs+dw5IK/xMSjfqTF8j7BBZyhV+ZVjn+jg0h3YlP6RmHbYzAjuCw15/xNYlFUPsr2bt6IgOBlvoQPfbDxTdSuU0Fn8i4TnnTn8MWosn7bbE1N7/4h1DFpDSRy4Ope+mKUCbSfbfS9jbh6r9F+6ee36EjQbv/W4vE+BbGk3tSNb7XAG0SkbLOvoSPldnjpHwtXpjx1i2W1kvBu/xI9s1WyCMGw3Q7vW6eDykn6lQnBNcYPNUPVWYcRZPL3kQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(346002)(366004)(396003)(86362001)(31696002)(31686004)(478600001)(5660300002)(8936002)(316002)(186003)(4326008)(66556008)(2616005)(66476007)(6486002)(26005)(38100700002)(8676002)(6916009)(54906003)(83380400001)(2906002)(6506007)(66946007)(6512007)(53546011)(41300700001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TERHbUFJS29qaVZIUE16cWpVYTdCU2ZYVUUxTkxtYVk4cEpsR1QycDl2R1M3?=
 =?utf-8?B?elF0SXhEOTRWbWxFSmF2R2cxa3l3OXBMMGRNazI5dVVjOEk3SUZnck5GZkdS?=
 =?utf-8?B?U0NBUnlnZzlZS1BmaXZhRU1mT3RYZHkxZjd5c2w2UWpHa2xEWEQyREYySHFn?=
 =?utf-8?B?dUMySmM4V3B3VW5zQjhTdXdJT0FkR0xlTC9hcTc5SzRTOWxXazNLMGdTTjhH?=
 =?utf-8?B?RCtOQmFFaHN4TlljTERNTjE5S05BU3hoaDVBY1lpTHh4MUhXTEV1Z2tDVG41?=
 =?utf-8?B?d2ZqTkU4TDNpSjBlUWdSZk4venEycWhqdWdqL2llL0d3d1hCRExWS2tuV0Q0?=
 =?utf-8?B?aFQwSFoyaHp4ZEhOKzNsY1Jnei80dHVVSEY0bUx6K2FqeEpyak5mN244NWRn?=
 =?utf-8?B?bzI4K1lBaEFiU3NSMnZac1BFUVB0TlFRVExHTWFPUHZKd3cyMEROMms4R3lU?=
 =?utf-8?B?bkF4amE5RmlwR21hZ05tMlFaUGJpNkdhaDJocXNYN3pFcmQwakNhM3lZdGow?=
 =?utf-8?B?bVQzWGZuME9WaUZqazB2K3Z2Ym1iYnNRMysvRkgyVkR1MUtNWFo1V3RzdGFL?=
 =?utf-8?B?b2JEQmptcE9mUS9pVkZLODhKajRCbXFHRjVxdEZVV0NlcXo3NGNsaE1xN2Ji?=
 =?utf-8?B?WEZRMStPZVRCc1lpQ3U0Q002M1FERSt6R1cxMEkycitFbHJEazJVUi9DUExI?=
 =?utf-8?B?eXFRVnlTSkRTaHpRZ3d5emhhVXQwQ3g3NmIxSTlvS3dOT05BeWlhdi9aOHdI?=
 =?utf-8?B?TnR5bDQ2WlRMeURLeUxlakZQRnNZS2tUdWpDaUUrT1JjT0trWWhsQk1RMTQ3?=
 =?utf-8?B?bmc1UDhXMVB0QWJZU1puZ0xsRGRJSVpPV0YzdXdLelFMSkV6RHErTVorczBy?=
 =?utf-8?B?VlFQUkdFaGJzWnR1b1ZhYU1TZGVyMVdpbjBDZTR2VXB2L0tMcGRORTA2NkN1?=
 =?utf-8?B?c09wVk1NNVlkU2hLcllFYlFZcWZwa1AzOTRBakRVSkpYeHBFQWd4WDQ3WTB1?=
 =?utf-8?B?SWhYSlBwZnp0SGVrY09LZUtqVm9CeFo4djl5REswcytmY3h1SlhXK01qQ3Fw?=
 =?utf-8?B?OXFOTk82MVdFdk0wcG82a1VCUGpaTlVDN3ROUEVtdWpzYS9oVGl3aG5UUzVy?=
 =?utf-8?B?WWhmQWpoL0NBaVdPdmVjdFVGb08zcFVPbWpCaVJCVXNFNE8zZ0s1TjNUcmZD?=
 =?utf-8?B?clB1SEtXd2pCNVRMYzJHblcycy9VZXBqMFdIcmpleThBTjZ6bmQ5bjlHVDAy?=
 =?utf-8?B?cWd5OGEyZGc4S2JENGtxQnlRb0UxOTZ3Z0JJclN4V3Q4ZTZ6R0NPNkxYdURW?=
 =?utf-8?B?VTZteWhqYU83bGU4T2pGWXQyWHRTWXBSODUrdUMrNU9FRW1NSW82dlpvampC?=
 =?utf-8?B?MGd4TkhIZXdwMm5zV3YwYWlCcGcvVllYRmNTS0MzNS9yZHVGT3N3cGUyNzQw?=
 =?utf-8?B?allGakVTbVhIcWpWRVd4Z0hZUjVsMXpXSnRCVFoxUHhqSjBiSjB0cUlPRGZ2?=
 =?utf-8?B?cTBqaThnTkd5b01tZ3VxNVMwZkhpeVhpck9UZGY2NlVZemhxSVdneUsrWWc2?=
 =?utf-8?B?NDVWSEl3THp6ZExPajVuOVJ4WTl5a01VWlcxOXE1STc0Q3R5QnkxWFI4ak1N?=
 =?utf-8?B?c0VRRTlXb1ErcXJYaWFnMnBqbzc4bENUVDdFSEQ2bU12ZHRCSW9VSFMwaXov?=
 =?utf-8?B?OTd3a0RhUjRUNjVCSHFBUC9ycVAvNmxlOE1qWmwxNTM3NHNWNHU5amRlUGVU?=
 =?utf-8?B?RWZyTmdtNlJxVHJCdEN2UHFOTGwwc0pMOEdYM0gvWXpZeDFDd01ROXkzNzFW?=
 =?utf-8?B?c01Kc1RlTFdIclhpb0lMTzR2Y0g5VUxhY3hkT3hmamhYV1lrQWRYci90VWcw?=
 =?utf-8?B?aThJKzB2eXlqenZScU5TK3Q3YStNdnBhSDUyakxqbk1LeG5pblNIb3F5TmtK?=
 =?utf-8?B?L3U1cVhwdE1hVlV3c1RDa1U1NFJoUEx1QnN5MzhNYmljTnl1eHlEYW43UDFs?=
 =?utf-8?B?akUvNEIwSlF3RXlYYk1GQTcwU3ViY2xyZkhjaTcxK3pQMGVYRFFZNVQxUURS?=
 =?utf-8?B?UHJ0SllvZDQySGFjR01wMUpwRTkrcVQydjBMMThCQjQyVWZEVzM5U3hOeHAx?=
 =?utf-8?Q?YbapSkfQz5perPdBKVuESCpl3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11e5bc3-8e7c-4eec-244e-08da7128863c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2022 06:06:49.2315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q/9h69EU07Ls0w69Wp6Lq+b25Lbz4VHqqQqdhwdXJJBOso7jDBLgo6YPGLmZarknIpSM9AgnPRsx4lzA4muB5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8372

On 28.07.2022 18:35, Oleksandr wrote:
> On 28.07.22 10:15, Jan Beulich wrote:
>> On 27.07.2022 21:39, Oleksandr wrote:
>>> On 27.07.22 20:54, Oleksandr wrote:
>>>> On 26.07.22 18:16, Jan Beulich wrote:
>>>>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>>>>> --- a/xen/arch/arm/vpci.c
>>>>>> +++ b/xen/arch/arm/vpci.c
>>>>>> @@ -41,6 +41,16 @@ static int vpci_mmio_read(struct vcpu *v,
>>>>>> mmio_info_t *info,
>>>>>>        /* data is needed to prevent a pointer cast on 32bit */
>>>>>>        unsigned long data;
>>>>>>    +    /*
>>>>>> +     * For the passed through devices we need to map their virtual
>>>>>> SBDF
>>>>>> +     * to the physical PCI device being passed through.
>>>>>> +     */
>>>>>> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
>>>>>> +    {
>>>>>> +        *r = ~0ul;
>>>>>> +        return 1;
>>>>>> +    }
>>>>> I'm probably simply lacking specific Arm-side knowledge, but it strikes
>>>>> me as odd that the need for translation would be dependent upon
>>>>> "bridge".
>>>>
>>>> I am afraid I cannot answer immediately.
>>>>
>>>> I will analyze that question and provide an answer later on.
>>>
>>> Well, most likely that "valid" bridge pointer here is just used as an
>>> indicator of hwdom currently, so no need to perform virt->phys
>>> translation for sbdf.
>>>
>>> You can see that domain_vpci_init() passes a valid value for hwdom and
>>> NULL for other domains when setting up vpci_mmio* callbacks.
>> Oh, I see.
>>
>>> Alternatively, I guess we could use "!is_hardware_domain(v->domain)"
>>> instead of "!bridge" in the first part of that check. Shall I?
>> Maybe simply add a comment? Surely checking "bridge" is cheaper than
>> using is_hardware_domain(), so I can see the benefit. But the larger
>> arm/vpci.c grows, the less obvious the connection will be without a
>> comment.
> 
> 
> Agree the connection is worth a comment ...
> 
> 
> 
>>   (Instead of a comment, an alternative may be a suitable
>> assertion, which then documents the connection at the same time, e.g.
>> ASSERT(!bridge == !is_hardware_domain(v->domain)). But that won't be
>> possible in e.g. vpci_sbdf_from_gpa(), where apparently a similar
>> assumption is being made.)
> 
> 
>     ... or indeed to put such ASSERT _before_ vpci_sbdf_from_gpa().
> 
> This will cover assumption being made in both places.
> 
> 
> diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
> index a9fc5817f9..1d4b1ef39e 100644
> --- a/xen/arch/arm/vpci.c
> +++ b/xen/arch/arm/vpci.c
> @@ -37,10 +37,24 @@ static int vpci_mmio_read(struct vcpu *v, 
> mmio_info_t *info,
>                             register_t *r, void *p)
>   {
>       struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    pci_sbdf_t sbdf;
>       /* data is needed to prevent a pointer cast on 32bit */
>       unsigned long data;
> 
> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
> +
> +    sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
> +    {
> +        *r = ~0ul;
> +        return 1;
> +    }
> +
>       if ( vpci_ecam_read(sbdf, ECAM_REG_OFFSET(info->gpa),
>                           1U << info->dabt.size, &data) )
>       {
> @@ -57,7 +71,18 @@ static int vpci_mmio_write(struct vcpu *v, 
> mmio_info_t *info,
>                              register_t r, void *p)
>   {
>       struct pci_host_bridge *bridge = p;
> -    pci_sbdf_t sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +    pci_sbdf_t sbdf;
> +
> +    ASSERT(!bridge == !is_hardware_domain(v->domain));
> +
> +    sbdf = vpci_sbdf_from_gpa(bridge, info->gpa);
> +
> +    /*
> +     * For the passed through devices we need to map their virtual SBDF
> +     * to the physical PCI device being passed through.
> +     */
> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
> +        return 1;
> 
>       return vpci_ecam_write(sbdf, ECAM_REG_OFFSET(info->gpa),
>                              1U << info->dabt.size, r);
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index d4601ecf9b..fc2c51dc3e 100644
> 
> 
> Any preference here?
> 
> 
> Personally, I think that such ASSERT will better explain the connection 
> than the comment will do.

Indeed I'd also prefer ASSERT()s being put there. But my opinion is
secondary here, as I'm not a maintainer of this code.

Jan

