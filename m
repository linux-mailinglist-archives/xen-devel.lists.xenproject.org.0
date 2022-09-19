Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D505BC472
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 10:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408542.651273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCIO-0000nq-Qk; Mon, 19 Sep 2022 08:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408542.651273; Mon, 19 Sep 2022 08:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaCIO-0000l5-NE; Mon, 19 Sep 2022 08:38:28 +0000
Received: by outflank-mailman (input) for mailman id 408542;
 Mon, 19 Sep 2022 08:38:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6dDj=ZW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oaCIM-0000ky-VD
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 08:38:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d13b24c-37f6-11ed-bad8-01ff208a15ba;
 Mon, 19 Sep 2022 10:38:25 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8983.eurprd04.prod.outlook.com (2603:10a6:10:2e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 08:38:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5632.021; Mon, 19 Sep 2022
 08:38:22 +0000
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
X-Inumbo-ID: 6d13b24c-37f6-11ed-bad8-01ff208a15ba
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BP7O15ebqzjkH7aEN5ti0fwTNAS7hGJBdLMoyg9Chx2Dsd/ZYL7XeyeugMMFJ1pmU3wJSYHHDD/Bz9lRpLJoiV25ObBRZnB0ATIs2j/eqTwOVAI2+CIpzXpywDdYXrLvVU61bC64+MiovKh3zvbdMmMyQSu7X/1rDH3/cYh3dgMILWz6jRkwkMDmNmvn4Z0aP57uabnts81YqtPqx2IynGzXZ44OLz8eJ8kQeCPl+jCy0tS4oE494f6B2AHSh5jWdjOIR8IVnw2I4MDfMeiWqwIWULJAL0ysZRTElKISErbvEQanDtcRWrmoFB02Boe/YCZ/VVbLGVDRChudperMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k8DWXVniuDY2a1GkNtaQhvHV30BSkuH4wDwj9+9FosE=;
 b=XoqbnuutVymRxxDNacLwV40qgBDEMLBqn5k4Unb2gYpLscm9J73ushToGQNwwIRjtE37U+gwsAGQ1EkMpVh88rkz5W9i15NtOS0+gYu76N7LRMCuh5H9oSgLO+jufsSwnRN6NaXRFQEZCnJ/BHkrJmPLhatkC4hi9U9SEv30gd7pPihJ8OpUGsufY/5/1fUpigTeaNryZlwV7v/GN3MICqPmYNMW7tbDVR+4XvaCw3frjTIhPsefu7AUqjvPyWxAoHTZFwsb4LnZcUMdcxBIbYmrWDLOGkXfkYRCROn9PYHOtUp7wQl/N/Nbxk+v/cvT8n62gBGDjuEWN9RkvLk7cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8DWXVniuDY2a1GkNtaQhvHV30BSkuH4wDwj9+9FosE=;
 b=UO+WuKDxWhzdOokIj+vrnwN1DxetUuYzJodHVuGAuCM3likz2pbxP5xhaaZrejH6vifAvVerDaSwfYa6RwsaA6rMZBOrS9ppzSdDjBNEciX0NWnVdlFNZVF1SJyEjjbG0Du6vP9tzWObA6OAbbSO+s+TeDi8+o82YhCh243UxQBSvBDveBHilfghOKW5Sj6GXs9Gc/TIcBgwN0JRZnBLQdva8kUAlcXSlBjdpea70jQbzuCUeHs17ZZYZWDb8VLKxoMkto77veNrqLy7yQuaCzUFEcRyVz2Yrre2nPuvfjjS3hggOQ+tkcNC0s/+Qtr/1OYA1SwPo6jiNK/dW4j55w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8ba1ede9-cd8c-01ec-939c-e0915d7c18b4@suse.com>
Date: Mon, 19 Sep 2022 10:38:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 12/12] xen/arm: add cache coloring support for Xen
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-13-carlo.nonato@minervasys.tech>
 <93471d92-bc61-56fd-5b52-413303d35da1@suse.com>
 <CAG+AhRVRQ9ey9NzsDo4Np+z0V=sX-uGYL_zLhJ9Z9zFb3v+Hkg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG+AhRVRQ9ey9NzsDo4Np+z0V=sX-uGYL_zLhJ9Z9zFb3v+Hkg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0042.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::30)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8983:EE_
X-MS-Office365-Filtering-Correlation-Id: 82bf18dd-7ed7-480e-9af4-08da9a1a4f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lQPxLEsj1sxUcIks3yspxgPn6YCL34+WPczpe8L3G94o6x4CT8bZWpsdKh2oz4++cUcUUqQukLhoDrzbDIPsYQWWNlp7DwiIoKOOufLYzt278TO7GESvO3mt7SqzOiNKY0g7Dakiv+6CPHRm9yjJvuu4QepN3qO/sOHLXlw/Cp3GY+pC+iEMaGmW80SsUaUMOxHHcg/XVyVqcPv13Z7BPg+wA+7reLSckY+yb6WVURrprU6DvRYypd35Q4fHfK+oOvKvQBwAUwrFiuYngZge/JE9TiYk004mOSJZdyEeSBDHbeMaAUkM6SjI3zafpJ+nWyXE0TT9fyPYJQKD3scc7oe2nrrCqshFdJkNzrglAw+g/QgrgyzFZkW3zLk+qjGGxcNyeS+FQgFPNHTGhSCrAJlYmXZIO1tfDuNNi2p00YH2EemyoJikkeI6ebnviFL3Xe3fhYmyYGbv8CSymd8LB4+19y2/SZdbwOqAS9rR5o1YnWd5jb7bvvUXJQ1LHFefxQTC6VlFuyacQRm9wsfsS0w9B409iE5pT9x8sTWPrE4L2jZt54b22fYKsHGiMBV6r2UwB1wevjPzrLr723kiV3JCCBxazIbvJyNXvdqwscJG0A4RJvj9iS4sJwGWY5tRsUTmckybpQ9AmKLef9sRtGnLnXodIZL4w4T5RQuTF3kru4ds49jlJXNmVoUpdioLpnghdwVQKSx7pjOle6ETcCgjUZlkoUcNe+hNLI3obVly6PhpslwNPpXVL9K156mhSnUU3bv53kwWcWbNnJjIcVgZnzZlLcvxCoXvm0hcGX0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199015)(2616005)(83380400001)(186003)(31696002)(38100700002)(86362001)(5660300002)(41300700001)(7416002)(8936002)(66556008)(8676002)(4326008)(66476007)(66946007)(2906002)(6916009)(26005)(6506007)(6512007)(53546011)(316002)(6486002)(478600001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTRBdDVKM3Qwalk2MTMwUDVuc0VCS21KbkhHeTc4YWZGazg5Sk85Zk5nZE54?=
 =?utf-8?B?aEtGMzFEMDVTaXBhZ3p0NWZRZkFGb2wxRndkUEFxbk1RZTJ2QjV3ZkY4Tk43?=
 =?utf-8?B?L2NNWnBBeGF5aTlQbVp0allWamhLak9sRWxnRjFPWExwVFArT0l4dnJVL1pX?=
 =?utf-8?B?V2U3MVhLdFVmUXFXSnJybHMyRDVwTHZQaUV2TzkwUEIyY0tTZFdBUmlLVkNi?=
 =?utf-8?B?QTg1UmFralpiK1BEcFV2WEpsVTJvbUtjeENzaFpWdWlPTHdmeW5OaTBQUXVv?=
 =?utf-8?B?bVB2cy9EcysvbW5OTGhjekY0bnIyeUhVT21DejN5WEw2dW90OFdsTzdMWE9Y?=
 =?utf-8?B?MnZIQWhLeDR6emhsalp0MWQwWWNQR01xcTdFemt3aURqTDU4TnVYOUZkMzZH?=
 =?utf-8?B?bkhSeW9XRy9ZNXZxK2o1WGQ3Nk9hTVpLNnBCek9CQzJabHBiSjBLN0MzUmY5?=
 =?utf-8?B?cUtBVWFEYkU2TUFUTnh5UTY5TmlROGdBS2RZL3ZEZkRGTm1sNkEzeGJFc3lH?=
 =?utf-8?B?ZVpnM2dCUDZxeTJFTU1JMWtCUEpHNjZCVEhER0xzZ0xmYUxvZUpQWTdtck1Y?=
 =?utf-8?B?Zms5VHJ2Smh5M1ZwT2IrQngxMXQ0YWdBMUZWTnFVb1VHS1VmZGg4aFJwbGJL?=
 =?utf-8?B?VDNzQU1NNFU0NVhLV3dhdTlCeG95Y1NKbTREc09UZ3NsWmVKajh3OXJCd0R4?=
 =?utf-8?B?NUxhcGNTbW1lL0VrTUFTZWoxN1NNSzhzVzRHYnhRYk5VYkdlT0g4N2RsdmdP?=
 =?utf-8?B?WXk5R0FyS3REWVFCSGRjTUFkQXo5NXo1ZWt2akZKRmpiUVpoclRjUmVXbzRj?=
 =?utf-8?B?MjhVRWlUTlo1ZlBYNmxNUGk3UWkzN2QwaWNod3d6Sk80c1dRZUd2ZC9haWU2?=
 =?utf-8?B?TUpvaG1vQUtMZlUyVk53LzJnMW9WWEpTKzFaWXRESDZIdDdqQ3ZST21UWDQ3?=
 =?utf-8?B?K2JZU0RoaGh6UEdNbys0WXltZHlkVDVDZFhGaWZOemNUL0VFUFFxNk5SZHM4?=
 =?utf-8?B?ZHVKVjJmWFNhZEptVkFjRlZicmpIa1ErdVRnU2ZuY1RtbWRNRlF2Y2tqcVFv?=
 =?utf-8?B?d2tQUTFUalJSYXp5K2JoS3lLbmFidUsralpUYytiMTdsUWJxekN6TTdXNkFv?=
 =?utf-8?B?eEFHNDlHcStGRFhNNmR3eEh4dTB1bk5uK1lLak9oZ3VjSWs2MVhXeFcwYVlq?=
 =?utf-8?B?M1pKczlmcTJuVXZuQ29DbmZDZElPTEVRMHlQeHpnVEphUmM3UmJNNG1lMUM0?=
 =?utf-8?B?R2xHWXlma1QxdlhxKzJmR21hR1ozdVJuUk5oMnVmcVVuMjdzTXVlVWFzRzlP?=
 =?utf-8?B?aGRvRk5tbmdnNVMxR1RGc29RUnZiQ0YrbS82Um9YcTdVeDIxVDJPWGJMekJF?=
 =?utf-8?B?ZVpaRjRYdVVScUNWaGoxVFZVMEdoc1MxdWMzdFgrc1NXMzNXOVdOZG9sWUQy?=
 =?utf-8?B?bGFibWYxVjAwWnE5MGY4d2ZZMkE0dVYxcXd0eElDWjJMSTd1NnJoQ1hrZzZZ?=
 =?utf-8?B?c0Y2KzhNNWFkYlorNFAzWUY5YmtsTmVtcXZmTWRPbjd3MTYzcWZpQjAwKzJ1?=
 =?utf-8?B?Y2ZjRFFNbW5JcHM1UDlzN2ZxUTdKcEdRMU13c0xsZE1XSjlsUy9kVDh4TWFE?=
 =?utf-8?B?V00rSWVRdjVJc3BHdm9LdWplOXlkZnFaWmxVNGJOeG9JWHpSc2VkelIvYUE1?=
 =?utf-8?B?aEx4dmVyK3FWeU1GLy9JK2gxMUwvR1RZOWh4VWlsR3JrbXMyVDRCcVgrQ1JO?=
 =?utf-8?B?NDdYa05DYWliRFpiOE4wb0dnbThVRllJcjY3ZmN4WFBOdm4yclQ3cjZDNWdF?=
 =?utf-8?B?MEtxL1ExL2dOMlNVRzd6MVk3NWh0aEtYaXMwSEFTSDlRblhYeUI5QmFVazBo?=
 =?utf-8?B?Ni95akY2NmlIZGJNMVRJSWhUZWtSVVpIakNOcm9WcXh6TDF3WnlNWWc5VXZQ?=
 =?utf-8?B?a0tCL1JZR2pUdFF4TS9mQmRqRlhINzAvNS9CdTE2Qkh0YzlWQ2ZnbElGdUxE?=
 =?utf-8?B?WjV0VVRlQTJtdE9WZCs1aE1Tc3pmeExxbmZ4UVQxQ3FUT2ZpMFNQMzB2YVdG?=
 =?utf-8?B?OENWdyt2SjJoQWJjZ3IrRloxOFZRd3A2eWhGa25UamR5Z29XZEhkZzNrMHpB?=
 =?utf-8?Q?slR9H/aRaGNRMDiOVZQ68VPOA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bf18dd-7ed7-480e-9af4-08da9a1a4f76
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 08:38:22.0909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04hQ3ZoND57VEHq7Av4A3LPiNhoG6Lok9ZL33pwN+0jgv/jUGWAeDsRnMEXUHFhKAzyvg8jZdYKRTaBpTc/kdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8983

On 16.09.2022 18:07, Carlo Nonato wrote:
> On Thu, Sep 15, 2022 at 3:25 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 26.08.2022 14:51, Carlo Nonato wrote:
>>> @@ -218,6 +221,28 @@ void *__vmap(const mfn_t *mfn, unsigned int granularity,
>>>      return va;
>>>  }
>>>
>>> +#ifdef CONFIG_CACHE_COLORING
>>> +void * __vmap_colored(const mfn_t *mfn, unsigned int nr, unsigned int align,
>>> +                      unsigned int flags, enum vmap_region type)
>>> +{
>>> +    void *va = vm_alloc(nr, align, type);
>>> +    unsigned long cur = (unsigned long)va;
>>> +    paddr_t pa = mfn_to_maddr(*mfn);
>>> +
>>> +    for ( ; va && nr-- ; cur += PAGE_SIZE )
>>> +    {
>>> +        pa = next_xen_colored(pa);
>>
>> This may alter the address, yet the caller expects that the original
>> address be mapped. I must be missing something?
> 
> If the original address color is assigned to Xen, then next_xen_colored()
> simply returns that address. If this isn't the case, then you're right: the
> address changes to the correct, colored, one. The caller should expect
> this behavior since this is the colored version of vmap, the one that takes
> into account the Xen coloring configuration.

That's (to me at least) very surprising behavior, and hence needs
properly calling out in a code comment at the least.

Personally I'm not convinced of having a function with this behavior,
and instead I think the normal vmap() should do. As long as you're
only allowing for order-0 allocations, that shouldn't be an issue
anyway.

>>> +        if ( map_pages_to_xen(cur, maddr_to_mfn(pa), 1, flags) )
>>> +        {
>>> +            vunmap(va);
>>> +            return NULL;
>>> +        }
>>> +        pa += PAGE_SIZE;
>>> +    }
>>> +    return va;
>>> +}
>>
>> Afaics you only consume the first slot of *mfn. What about the other
>> (nr - 1) ones?
> 
> Not sure I understood. The first slot is used as the starting point and then
> the addr of that mfn plus next_xen_colored() are the mechanism used to select
> the next mfns. Probably the first argument of vmap_colored is a bit
> misleading.

Yes - it shouldn't be an array if it's not used as one.

Jan

