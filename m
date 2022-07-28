Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E370583956
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jul 2022 09:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.376635.609533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGxjx-0006Sa-4J; Thu, 28 Jul 2022 07:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376635.609533; Thu, 28 Jul 2022 07:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGxjx-0006Ps-0M; Thu, 28 Jul 2022 07:15:25 +0000
Received: by outflank-mailman (input) for mailman id 376635;
 Thu, 28 Jul 2022 07:15:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aTbt=YB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oGxjv-0006Pm-NT
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 07:15:23 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130059.outbound.protection.outlook.com [40.107.13.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b3a87d8-0e45-11ed-bd2d-47488cf2e6aa;
 Thu, 28 Jul 2022 09:15:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8406.eurprd04.prod.outlook.com (2603:10a6:102:1c4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Thu, 28 Jul
 2022 07:15:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::9da9:fa60:f04a:2a0e%7]) with mapi id 15.20.5482.011; Thu, 28 Jul 2022
 07:15:20 +0000
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
X-Inumbo-ID: 0b3a87d8-0e45-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j6Wfnin+9CQkebd4lt+u6v4B9N1lkclcO/XYsvibTSuK7zpHN5vJq0wP6NT+VdpSFO9LCVwa3GZsqZ9gSoNtkf/SQy2GVWYLoo7R/H/Ko/0bCrKVUNwiLuShVoc/CjN758BMrGaTqDR8PHDDmUD2+aeohax/I8HuDZkBi58nWJzBljUgr+IQN0Uh3jyRFpMd2hF0k5b2rqE5GCVk8xpKSWTUfcl4VSz88MM+lPbGIV1zNhNwEgzm5fHBvPBvtcBjH3nKH5zU0qgFYhU57934MBbMqNHR8ORd5Zrgwlo3BoKRVbO4Ow9tg827Qky0U2qH9kjQmgA5TxFhpqaIB8xnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdJki4lXX/9RXeJXlObYah0Eu7wwmTyIQJdhQdmEDsU=;
 b=HTuesXlDUa0jC+YV0nk9G6rz/vw0abRv8+Daf93RCd20RSudFNDVxGBwt7qf3EOhPW0rb4K70SRmeciBnjXi3u0cntIFI5vTaMWzrvjFAgOlH+hY0tb9mjr+NQXSpPWxPFxceDUlycdEuTDNn5Y5wTndt5kRj3emUCx2RBsVT/wRjy2Sao5YPdfCoFOoD5ef5F74Zk1CA1XhICF8doOr5LvHgQe2hg3IoGgsuje7uUNghbuKaa8TSmqR7++dPWKQ+9/4Vhp8Rh/ZgpDGYm51fxiuAdrk0bQOOH5bc5lO61KqviusKECSECEuf4S3BMkZP+ZlQdJvCmj3q0kxkZy94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdJki4lXX/9RXeJXlObYah0Eu7wwmTyIQJdhQdmEDsU=;
 b=1TeT2l5W/Gqoqw5pKzozRSNHJocErwoML66Fnqw8CPcejDSy9GFTHDbXW6OtsrzqOZbgn3QBjaaRH2o1blsiiTuxUzwKCpZFU6bcGs8zU2oWpYo+JJq2XhC4TQAkowH4itVe4SXHQcOokkLgn/XMMApT4OjXUBXR9P9+NTKs0XfS2VMBCWBqCSwT0H0GRIoAT9+YZ+eu9/dhMRGCM3h6mYfUswnAkEeqCwxblL/Lsf74GU9nKbDznIwXwHUDgoB/hemJ5HrpFCEVcSv/giwZfYozbLb8LMJ4TUEeRn4S/LrZpSzi/RyiZjsa+Qhq8WJgGx5OWgeRc4+7DLPOcL9R/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cfc6488d-c06e-e943-fc8c-7b12d330f263@suse.com>
Date: Thu, 28 Jul 2022 09:15:18 +0200
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8e839472-f49d-a464-34aa-c7b26b9c50de@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b566d3e-91ee-429d-1073-08da7068ee25
X-MS-TrafficTypeDiagnostic: PAXPR04MB8406:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wii1An8ZU32pKRMeRFxM1pMgfu58PhHA0+piv2wr9OGw0LAbIYK04kAMd2aQsHHsSp0tfpG9Cjj5IZK4xsAMdw+vzyqgrMbo8RoR/GMiKJt9lcG39TOMLiOOMPg0dX8Q/GY5LMeIqoJQv3criLP1QWBQKt+/2UgG9PoRLeVaNjLZtx2vb5KH6B+owJ4ag1FhEMgecqi1A2gwiNBktBVVLwCDRI/1oG2E1ZVna+SXK/u4C1rmRhvsqI7jvmBoR7NNBcXXI8cAm2V2iJCBa7hvqkODtvFouw2vzrH1OfL+pEyY6GvrLNRO0dI4Etammvljq3tZOJkLMquUrm6HEHWlixmxFf4JFOc0ESYz0sPCrYhEKS3WdP8fTb3Cb6abgy4AYJ9rWMGJieLqwGeMCynVPaWscENdWwwsrPN7eX60Ixxm1n+9HDrdPjUsike2Z7CTjOicioM9qI5V130djc6AjuVo1jSNzP+xfcxSHLvegQTdoE7zQVBvkriw77rkVo/9gl4SpbIznBQVCkLLmAstW4ZeMMHSTPLtMeBRIB78A8u7wk3vLdFl9RppHFtDf4j74N1a8Rm1Ty1z7M7+CvrUzHGKiOUyQE7hW8yxKhGrxa540F78q+6osWxOUMKIDPsIwEzsaVxdw75ESIRJlkP55oo/O6OM1I0PXGNXFyPKZ4uOjFaM3KI29vNNfJiWuI9sTtTrCU8ihu4tto0eUMDk9VvARcEWJZgvKulF7MQrEt3yuO/Uqz+iZ6SPfDmlaLssKC0aIjj4QBGXJpA5KbJKqnJq72gENGluicwDSrSav43CWZfmBwbnroZ/4juy7qDuVhcpR7Rr61fiWGkSQXZ/Lw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(376002)(39860400002)(136003)(346002)(31696002)(86362001)(83380400001)(38100700002)(66476007)(66556008)(66946007)(8676002)(4326008)(316002)(6916009)(54906003)(2906002)(8936002)(26005)(5660300002)(6512007)(6506007)(53546011)(2616005)(186003)(41300700001)(6486002)(478600001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVl3bmp6bkdTZ2FSYVEvbW9DVlB5NmRnV0ZZQ21KM2ZZTWpjSmR3ck56Zncx?=
 =?utf-8?B?d0RoS241aWlMak5BaDNWOU1selAvM1NGMEg5TEd4aEUrNmxaVkJPOVNzUUhF?=
 =?utf-8?B?Z0JoMnlhVUVJWktZV09hUUpraXNhU1oxaXRGaThFL1BDYVBjN09rWFYwSFIx?=
 =?utf-8?B?RXhweDcxOStxNk9tY3NKN0dpTXpmOG1Qb3Y2YmtwaG9kdFZOaGkvWEJVR0lt?=
 =?utf-8?B?VnVtRGVRN1cxdXh2dFRkSnNOdW84cXM0R1dtUm1PaWJwbitiV2g0ZWNnK09o?=
 =?utf-8?B?bVF3V2o5VkRCL2F4N3dNeHZldHlNK0VqelBicmtuSVNEOFZOejN6QUpjNWJT?=
 =?utf-8?B?aFVmUW5jMFJOOC9tN1MrVnV5L3VoYUI5TWJQTjRzTGZlUFBLQmY3NzY2TFd1?=
 =?utf-8?B?RDZNZ1N2bHhhclRCR2xveFd3eDZnVlFkOFphd2tyRWlFaWdMeTRaNUZpRi9B?=
 =?utf-8?B?MXlSdDdmWnQrcVkzaWlHNzNZSVA3eElIdTBEOGh3aHJIaEJJUFdDTjUzdGl0?=
 =?utf-8?B?RVVRVXZjcnUyejZFYWhVUGlya0h5ZCszeWs4THhyd2dSR1hjd0tKVmpqWmhH?=
 =?utf-8?B?c0RHVGprem10UXRWODV1TmVuNHRHb01TcjVuNDBJazJ1WVp2RkVUWkRWZFAx?=
 =?utf-8?B?RjZQcWtSSkVMaXNqQzJOWFJ1ZWZISFZ0VUpUY2NlR2dHNk84MCtvaEFmQzg0?=
 =?utf-8?B?bTF1NWMyc0VlSlQyc09Nd2l5ZzllTjBUejdQdnJUUzB1OGFHZVNsVXZaVWx0?=
 =?utf-8?B?S0pCcnhHOWRGVHJOSGNHZ3NEQUQ0OUtmV2xXcEZqbmcxZVMvNWFvTGtMeHlF?=
 =?utf-8?B?L1VEYXFoN3NQQkVvMnRzZ25rNnhISDBkVkdpQ1lIajFrLzZLaVZoengyOEZ4?=
 =?utf-8?B?RUEyN214Zk9pcFlUY080cXNsMXBxd1dlV05tK2hxUnl5OVE3bjNNWjVnNTVO?=
 =?utf-8?B?Mk83TXhabkxPYWRaQk42VG1IZ3ZuRkRvNjB6Q09OdDR3bll2cXZYWFpvKzU5?=
 =?utf-8?B?Y2x5T3VZazFDRVUvYkM5bWR2MzdsdWR0OWdUTWVtQmxSMUI2WVhHMDUzbTNE?=
 =?utf-8?B?bVNQcXZRaDUxUXRJNlBlVFV2QWxpVTdkUU5MSUg5VGlRVDdscnNlbncyNVIx?=
 =?utf-8?B?eDhCeDU4YjF0b3Nkc2M2ZU4rUkxqUVBYV1RFaHAvNGhsUHUvUXlBc09ub0hB?=
 =?utf-8?B?L2xxSTUxZEJBcDhaY1A2NG9TOEg5R0xUMzIzM1pObThpdHpFZHU0WXlLb0pq?=
 =?utf-8?B?RU85TEw4dmpOdDhoT1JlK3dtZWV5eDZCam5Mb3VJVG9kVXdlOTYvK0RGM0Mx?=
 =?utf-8?B?Q0ZIeVRFeHdFcjViZ0ZsUjZhT1pPNDZ5TGFQdWtmUkV2ZXlQamlwUDIya3NL?=
 =?utf-8?B?RWlXVEZKUkhZN0lMTHBFZmczeEJ0RXRwcXFpcGtFZW1zaURMbm0xdVNWcGow?=
 =?utf-8?B?ZHF1Tit1NmUvMHJMdFJEblZ4aGdLajNQVnJtdjhZMnZZd1h3SFZrUnRmS0ph?=
 =?utf-8?B?RHdqTXJtMUVDa2pWSE80QlREL2RCcExsNDJCQ2RieE42S0l1c1MvMmZNNThT?=
 =?utf-8?B?YUJ2TEdNRUxMR1MvdytuUTZDeGlDRDRVU3E4QTFSYnR2NnhEZ01sbmtvaFlZ?=
 =?utf-8?B?dHFEblV1TFpEd1JyaTNqUWRjNFJNS0VMUitqdXBBUWp2VWtlZm5QQUZyTktt?=
 =?utf-8?B?b28zbHdaNHlHSWlXRW5IK3lnS0lJelRkU3JzQ3AzUkJOTDRsK2ZiVHgrRzRY?=
 =?utf-8?B?VWRDMTE2YXBWWEFjMGsrb29seEdhbUUvdUlvNGZaYXVGOCtTd1NpaXJHVlBk?=
 =?utf-8?B?c3phQUxDcThSUW1QZ0dsaHJ6Y0dKbXJTaU8wcTlxS3VuVkttb3ZEekZIYkQ1?=
 =?utf-8?B?UlRPUnBXVmUxcWVJbmxIN0lvQUVKc3JqQkFCLytCMTdYRStqNEJSZnpFcUxi?=
 =?utf-8?B?cUN5RGd3Ym9PcjArM2FxejBRZ0E0UCtSOUNacnhJaFE0LzVwSU02S2ZIOE5M?=
 =?utf-8?B?L3R5bm5ONXE1MFJyTHROdnRJMTBjV3FWVlAwazJVSEFIZHZKUElkT29XaTFY?=
 =?utf-8?B?Rk1kemRHVmhpaWgyekM4enNlME5rUWFwNnA1bjBlWHNGNkdrcWdVSWJGMFdx?=
 =?utf-8?Q?pIoln4nEgb/Xc3pk+tsRkMWWZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b566d3e-91ee-429d-1073-08da7068ee25
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 07:15:20.2381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ad1F+XNDEnKmQAN5sQeowuBahZxRumOQ51ILv3e4OJ8yNRgFlT+gvhiqRT7rLGDinsqjoyePCAu+ipPFXh4YFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8406

On 27.07.2022 21:39, Oleksandr wrote:
> On 27.07.22 20:54, Oleksandr wrote:
>> On 26.07.22 18:16, Jan Beulich wrote:
>>> On 19.07.2022 19:42, Oleksandr Tyshchenko wrote:
>>>> --- a/xen/arch/arm/vpci.c
>>>> +++ b/xen/arch/arm/vpci.c
>>>> @@ -41,6 +41,16 @@ static int vpci_mmio_read(struct vcpu *v, 
>>>> mmio_info_t *info,
>>>>       /* data is needed to prevent a pointer cast on 32bit */
>>>>       unsigned long data;
>>>>   +    /*
>>>> +     * For the passed through devices we need to map their virtual 
>>>> SBDF
>>>> +     * to the physical PCI device being passed through.
>>>> +     */
>>>> +    if ( !bridge && !vpci_translate_virtual_device(v->domain, &sbdf) )
>>>> +    {
>>>> +        *r = ~0ul;
>>>> +        return 1;
>>>> +    }
>>> I'm probably simply lacking specific Arm-side knowledge, but it strikes
>>> me as odd that the need for translation would be dependent upon 
>>> "bridge".
>>
>>
>> I am afraid I cannot answer immediately.
>>
>> I will analyze that question and provide an answer later on.
> 
> 
> Well, most likely that "valid" bridge pointer here is just used as an 
> indicator of hwdom currently, so no need to perform virt->phys 
> translation for sbdf.
> 
> You can see that domain_vpci_init() passes a valid value for hwdom and 
> NULL for other domains when setting up vpci_mmio* callbacks.

Oh, I see.

> Alternatively, I guess we could use "!is_hardware_domain(v->domain)" 
> instead of "!bridge" in the first part of that check. Shall I?

Maybe simply add a comment? Surely checking "bridge" is cheaper than
using is_hardware_domain(), so I can see the benefit. But the larger
arm/vpci.c grows, the less obvious the connection will be without a
comment. (Instead of a comment, an alternative may be a suitable
assertion, which then documents the connection at the same time, e.g.
ASSERT(!bridge == !is_hardware_domain(v->domain)). But that won't be
possible in e.g. vpci_sbdf_from_gpa(), where apparently a similar
assumption is being made.)

Jan

