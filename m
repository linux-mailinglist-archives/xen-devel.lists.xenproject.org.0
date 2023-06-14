Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C52C72F4ED
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 08:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548452.856411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9K5L-0005ZX-PV; Wed, 14 Jun 2023 06:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548452.856411; Wed, 14 Jun 2023 06:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9K5L-0005Xn-MW; Wed, 14 Jun 2023 06:34:27 +0000
Received: by outflank-mailman (input) for mailman id 548452;
 Wed, 14 Jun 2023 06:34:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9K5K-0005Xf-5w
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 06:34:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fdcaf83-0a7d-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 08:34:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9156.eurprd04.prod.outlook.com (2603:10a6:102:22f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 06:34:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 06:34:19 +0000
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
X-Inumbo-ID: 7fdcaf83-0a7d-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KfG0yaRwi3H/4UKQTL7hkZ4Jx2vRLaxT/WJ11ouQTo9KT6LWUMHhvqkppmWgGrR538pOW/PjeOjNLXQzD/eEaNBvEurQPP8y3PihtaJdXaZRNABDYAk3sbys7SGpdtcrqCXgk6FAz5Z+E+NmnjmPRtAkXLPUHMPcdksDgpD8I4yK+79sXWLtkn4Bai1M3t8lcZLLGHTp468gbl+qG7mxSkspRshT1aVEUb4+K+/YDYAExpNsIoN4y5FsYM9lgCuOZEmpnEAkk4/CKf2eh1W6nVPifexaZ0KcYufDR/K0fCp9+PMykyWGg53JMJkAJ0R4YDBJh9qFQ8vMHvasWGnZ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uhD3DivwsvlcltU/FZHOGW0OPxHDbzzbL7bT66OREk=;
 b=PSLSAiN16i2n9cTfreGQlv3ovOZ7yWslE1Mp/Mn62zBeT6/4jxR2SJUd7N/HVkvED0S5laJFpJtsg+CizC+884BhzwGcbaXEkllVPmTg71gqmnZNdcjELxPXAZYrSqsuqPsRYotouEFMo1AmeMIgjOj8bDa09iIpA2/st95LAtAshmM0yMe8vd7Mjb3kv+0xWa+xPOItx1x9bMPEs8l6C8ZzlD8q8k1s0naM2SiUr10NfHhFv8Zoy7LbfD1kLPg2R8n+W6Q5Qe0lTMW3uQGJgEwQnbjTKliZ8wCXEx0g+wxGjO1KAj9MHek0SOl4jR1B3uF6ay7nHOQBxFjScfTohw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uhD3DivwsvlcltU/FZHOGW0OPxHDbzzbL7bT66OREk=;
 b=HJdPr7Va5+V6qZx6c5FHUZLCN3XhwCcTmqTSrs5MdnxS2YoM0EC2dU+WeDTwceDn9akU7SNg2ANLDbULDPWdPJDCIVUomLxw2tj/lxnhkG6fznYIVmKzId6HJ6foYgiB2hWqywmEdUnVpTTpRV8ZNAx6sAfAjeIx2cpEr0WhJ8lTG/9RRbsBkNLZ8K8fE9Q/zqLD/Cz3mISJUlk9aoND09OJMXyW2UiMIRjG9rdC3bxuthNHY4rS9fLA2+fvYcQ5+odttakFwg11wlIYszFUOBTKt8TCX5HS5F9jG52z+RpM07J43Y6w24YkfTRuKouA+s82a1SfthvE0gOuJIKPPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7dc57fa3-9e53-40ff-4a70-cc5d74010f96@suse.com>
Date: Wed, 14 Jun 2023 08:34:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/5] libxg: drop dead assignment to "ptes" from
 xc_core_arch_map_p2m_list_rw()
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <2dc50b58-a4e4-3e32-1876-94412b14b052@suse.com>
 <fe8cb20f-8541-19a9-a0cf-06e9206b1299@suse.com>
 <33566692-ee42-44af-a94a-5535fdf39930@perard>
 <a22f00e7-d5e4-45e1-652c-bf22ad78f567@suse.com>
 <f33ff657-0153-468f-9140-6aacf72ca2cc@perard>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f33ff657-0153-468f-9140-6aacf72ca2cc@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb5c1b8-4c3b-469c-60f2-08db6ca161c6
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3jHGjKlY4kJewOdnka3DrC+LF6ZfrG4aY2wyWu0/Tr9i10y+5mMERtiPtw6UdkG+WbiNhwhXcb9lgaXaV3cdWaIRFXDL6RYIVuHmYh0f6aU9ge/tpsnBc4claTMcUHF7atILXQ52h/+L+aha9YfROCAFFr51GF9C4Pe/WzkSRN3jtbH00zAyfCOEkuMtT0+1WFKWuzqruZ7D7B4KSgyJO+K4T0/k845GYwcALrNiEgEXo3oU9ySbniPFdEFwdzGXTbuskV+T44dwr0JetjmXko5zWaTgakt+PociHARHzo/qt/hlgxgw1JhTOZqN7AOJZXxHvHi4wsI54RBXb8PD8xRQvjqtF1mFrpJIdnP6VFI3P8kQs0GVtxVmKz55UTzc+9P+oFUGdivgxyhgBxiY/u1Os4jJRnX04EnLvzwFVVTtDJOnOtcQmkc/w+zYPcPHU0T3YRFVFIuUWvUK6j26ii3sWyuHTMNvpDFWNuQq7fUdiIv43CZM5hSYKThLWBmHDH5b6DLVx/qRUYSwKeCz+rqZ4N8Pctgskx42MjzwCnucDel3Q0l9O/MAsxx8aeWNGAgkNOH/3aNohajnHZnY4q8kC6ncIMYm9DCfwqyQF0WLwqRPetb8+q2ISASKs8D/5bY/yR4ZuRTkTCwT1J6os+WSAqQ4R1D+bM8ziM4JA3HUUP0JoxCSmZhXlMF+RAmE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199021)(8936002)(6486002)(26005)(8676002)(6512007)(41300700001)(36756003)(478600001)(38100700002)(66946007)(6916009)(66476007)(86362001)(4326008)(66556008)(31696002)(316002)(54906003)(53546011)(6506007)(5660300002)(83380400001)(186003)(2616005)(107886003)(2906002)(31686004)(70780200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OCs1SjQrZ2lYaEx6b3BOOTNmR1B0bzc4ZUV0b0ZUV0ZzZ0tWUDBjYlNMbG1y?=
 =?utf-8?B?YnZwK2JCTjNjWjNLQXh0RDRtZ1A3UDdtckNlM1E1QXZMZG90LzRBb2ZGaXR1?=
 =?utf-8?B?VjFodEFmZmVzRWxRNkpQcTRRc0s0OUE5dzFZMk8vMWtLQmJ1UG52ZVJnc0Y5?=
 =?utf-8?B?ZGJseHN5dThiS3FnTDRoU1I4c1hxYm4zY3RYS0wzV3BKV1JRK0crVG1SY1pv?=
 =?utf-8?B?U1N3cU5PdEVCeStCVFBkREhkaXhEc2RQc1AzK29FYXdUcGdURFM5YW8vTVIw?=
 =?utf-8?B?UDZMNHJseGlqZUtRSFpUa3NFUGZjL2lYOVRjanY5SVhiNEhtMGVIUGJ3cFFI?=
 =?utf-8?B?L0ZlN1d1ck9ENUdmMkc3eThVRDBCVmJIUzUra1Z3dmJ1YldaNHVhYTkxeWlp?=
 =?utf-8?B?M0xUcVY3NDFUUVZ6b3ZpcnVFc0JwZDBzd2h5c1J6WGNSbU05SUUwZExaamZD?=
 =?utf-8?B?SE9FdDJNYk5EaFFHWjlONDhmUGhhamFGczc2ZGFsclFUMDA0dHNWSzdwL1V1?=
 =?utf-8?B?N3JNd1U4Mjk3WkRQbUFiN1B4R1Q0UkczdjlXUHBJY0ExNmxLaHJiekx2OVM4?=
 =?utf-8?B?WW82djd5UVNBYnJyNVNXdi83b3hjUUpacGo1VmxtMUh1MGoyKzFrdDU5RUs5?=
 =?utf-8?B?S1lyNjl5ai9SMmhCTUJDaDN4Y2JyektPaVBOYWJrRHRtM1p1NE8yS1dDUUtV?=
 =?utf-8?B?d21MQTFOZmd1WFI5eHQyV0RGUk94Yk9BSTlLeVA5MDdBaU5vWUVaWHRmZk4v?=
 =?utf-8?B?TFVuK1NlOVZjOUdRakVrUjVwZFMwU1FLdmg2Yk1RZ2lrbGUyQkt0dS9NSFdS?=
 =?utf-8?B?ZmdIejY3ZEpkTjB0dmdPS041N0Y0ZWFhdzh6bzlQV2ZKdG9VVFFhSFkvRUFo?=
 =?utf-8?B?cEdLMWVuZDBYSi8yYXNQUFZFMmErK1djbTRnS2ZGMVpYT0Y0M3dpSm12dWNj?=
 =?utf-8?B?ZnFyaDVoT09ETGcraVM0VWR3dkxGUDB6aDBwVDZ1bEhaQld1K3A2UG11RXNG?=
 =?utf-8?B?QlJidTUvS1hKKzhOcm5wYmlzbGF2aDdNS3BEK2M5bmVodWVjcmlXUFVHcVFs?=
 =?utf-8?B?NktPUzRGc21nS1dyTjhDb1JWOWFPZWgzSnhia3JxRHZUdEJwNVB2TWpya0M3?=
 =?utf-8?B?YVNlVk0wazNZQUpoLy94bUpxOGxEanYrcXBSSjZpNUtGWHNRb0dsZWF0QzE3?=
 =?utf-8?B?N055eXdtN0NaZHhLbE5BZ1VuUThvZ0k5WXQ2QUxrYTNIVkxuQk5mZ2RERXRs?=
 =?utf-8?B?YjJOeEpxeXQxUExaaEU5cnhCeGgzcnQrTGlNaENXaUhKTzRmbWs2TkxIVHkx?=
 =?utf-8?B?djljd0JwM1MwaGVZVUM1d3o0OXBOdE5yWlY5ZHdrV3Rhd24zeDh1cVkvZmVm?=
 =?utf-8?B?bjJITzJqY2s2UjBhTU5DOFBZWEFIOUg0UEo1VUZTY1BnSlY0cUVaU1M0UjhO?=
 =?utf-8?B?a01NNEM2ZDBkRlp5Z21UMFFYL3lpcGdrdXFFSERvYmEvTEtZSk9KZ0h3TGgx?=
 =?utf-8?B?UldjSUR3Zy9LOC9yVy8ybS9VcEZjSTd1dmpPNmQ0YW5KZGc2dW80Vzl0VThH?=
 =?utf-8?B?djJGZ2J0VVNBMVpUUFRFSmVuNzJoQUNJUTNmZ2VGQXMwalZXWHF1WVcyd2E4?=
 =?utf-8?B?TlJkSEZsY1NzK1NSVW5lZDl4S0FqNmdzb0hGMGhEdTNMb2FwNmRzeStvY1pk?=
 =?utf-8?B?ZWowU2R1enh0QlpIQi9WSmxwcytHQU5BMWdLNm41MjlvRHgvdjlMMVdscGpG?=
 =?utf-8?B?QUtiNDZOQXp2QzMwaWxBYm9hV0J4RHJhYnV0U1Y2SnBScnJTaHdsVGFvblZh?=
 =?utf-8?B?UUxlQkJDWVZobW5LWjkxeDJRbzBBZTZLL3c3bFB3RWEya3orWjVybWs3NVlQ?=
 =?utf-8?B?d1RPVFA3NVJvTFFwZTUzWFBGSE1jSm96QW8rRWNQRjBQZXB3Vkd2RnlrTmFY?=
 =?utf-8?B?QW1hV2VUaDJrMU5ueDJiREdwSFcwUlJ0NHMwdHlmY0lab0xHcHRwZjJqY1F5?=
 =?utf-8?B?NXVuOVNPcDdkRi9qSUxHb0pJYWVSR2YybFI0TjFiUkYwY04rZjdueVVadEZQ?=
 =?utf-8?B?ZTBYZTJHM0xKUWxBVDFWaFlld2cwM2M0a0IrSSt4UVVob1pWYlJTSkcrR3BK?=
 =?utf-8?Q?X0Y3HchIcNYy60zVxs9xgqlng?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb5c1b8-4c3b-469c-60f2-08db6ca161c6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 06:34:19.1631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYtk+Cx3cgBlfvTMsI8wlUcPwLeeUu/yEC6mqGnTwV1MwZ2/C23wUavTjOBMqSZDNldPMTBI+NJrUblYztEXFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9156

On 13.06.2023 18:40, Anthony PERARD wrote:
> On Tue, Jun 13, 2023 at 06:08:16PM +0200, Jan Beulich wrote:
>> On 13.06.2023 18:03, Anthony PERARD wrote:
>>> On Mon, Jun 12, 2023 at 01:46:40PM +0200, Jan Beulich wrote:
>>>> The function returns immediately after the enclosing if().
>>>>
>>>> Coverity ID: 1532314
>>>> Fixes: bd7a29c3d0b9 ("tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>
>>>> --- a/tools/libs/guest/xg_core_x86.c
>>>> +++ b/tools/libs/guest/xg_core_x86.c
>>>> @@ -210,7 +210,6 @@ xc_core_arch_map_p2m_list_rw(xc_interfac
>>>>          }
>>>>  
>>>>          munmap(ptes, n_pages * PAGE_SIZE);
>>>> -        ptes = NULL;
>>>>          off = p2m_vaddr & ((mask >> shift) << shift);
>>>>      }
>>>
>>> Do we have to remove this assignment? What if someone adds code later
>>> and reuse the content of the variable `ptes`? Or what if someone adds
>>> codes after the loop, and handle an error with `goto out`, we would have
>>> a double-munmap().
>>
>> Imo it would be at that time when the assignment wants (re)adding. I
> 
> I don't believe this is going to happen because I don't think a compiler
> will find a mistake. Maybe a run of Coverity would tell that ptes is
> reused after munmap(), but by the time Coverity run on the code, it
> would be too late.
> 
>> fully agree with the tool, and I expect Misra (if it was applied to
>> the tool stack as well) would demand the very same change.
> 
> I guess the issue here is that there's two paths out of the function, the
> error path via "out" and the success path. If `ptes` is check on both
> path, then the assignment would be needed, and it would be harder to
> make a mistake; which can be done by having only one way out.
> 
> If only we could restrict the scope of `ptes` to the for loop, we
> wouldn't even need to set it to NULL.

I can do that, but then I can't resist to shrink other variables' scopes
as well, so it'll be somewhat bigger a change. Let's see how you like it.

Jan

