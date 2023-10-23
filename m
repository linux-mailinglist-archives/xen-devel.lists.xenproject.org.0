Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 852E37D3AE1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 17:34:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621551.968131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quww4-00027p-8Y; Mon, 23 Oct 2023 15:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621551.968131; Mon, 23 Oct 2023 15:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quww4-00024x-4T; Mon, 23 Oct 2023 15:33:44 +0000
Received: by outflank-mailman (input) for mailman id 621551;
 Mon, 23 Oct 2023 15:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVTz=GF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1quww2-00021i-Hn
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 15:33:42 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe02::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ab5004d-71b9-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 17:33:40 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB8725.eurprd04.prod.outlook.com (2603:10a6:10:2dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Mon, 23 Oct
 2023 15:33:39 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Mon, 23 Oct 2023
 15:33:39 +0000
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
X-Inumbo-ID: 8ab5004d-71b9-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5h3tR1O3G0NwyMPOurKNImK4gA+cxISZ0Gs0O8x6G1xguzGKR6Je2RXKjLtKlQiyltqS+oVkxK6TkZgPcy4vlGwQPol+BoyFJxJqkxswAmu27FGUjszizriKtu3xUJh3gQfcAHId5G2pjtjfudcUE5ATrBRBLejtftAThhyF3dozX6UOXiO7CziSK88chxzJ7mfBbdjy5D7kDpzEZeyByN/xX8zPe8kyhBRl9KzmZmjTIiEWYDeHxPkfEstOVFOCXF9LX7W/A26eZUqlePUR/PVRTS7Jt+/I/Sd+Ta6C3KPCNGtbbNKy3CtLMN/Wt3rrDfeZQhiErqT1uiLhTJ/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eu8I1csfJJwZm1xoT0r+iPBept1d5pITUiALTTVQBgs=;
 b=DiRBo9C7XteX/A7S1s+y+t6AuyViAnzZClLkNXLKZM6VoKYTHiCvVWdsRmw7kNMbd3Jz8mbdgNkaCG0DTUv899f1Om865d3hCpJKgf34ps5wgLD3cv4t4kOihw8pY92Khn7tyMikQhKS7FWvmd45Qp9a4RK9R/auui1yNqAf9kV6BcqBD6UNv+orPEKgcGj3IzXy4vZ8CAu06pI7YrGxi+nN5BQikluyaYItlGGmn4rAQ2mTTHM+1hRA1j/hOUAcF0hCorJHGqpeeqJS9llw20QPPvF8MmVSNq0WHehSV3g3g7rQrIu0Xwt+J5mtoHBcKQy5ex5X4xVzbj8b+XIbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eu8I1csfJJwZm1xoT0r+iPBept1d5pITUiALTTVQBgs=;
 b=tif3ELLJhrRXR3et34aRxpl+vKKc6570cgyMH6VqjyHpImfYRtkbFGIY9FlK5URXokLIww1lNSVFYBYVX1Yg9Ajsu1TNslRVUtRhaV8YdNi3vgVqx04SRY68biyoK7Sz+SiNVDkFqMwSPW5WGqUFhAtY7VrOntW2eXRvpnA2v5hw4diiuyAc10FkTGxP5jOrtW1fzKOxa5YxczEPVODMML2HwQacNLDVfsGILXjIlmG9/icWp7Uyxtzq8DR51Al/bAVt9irK0mjk9yfDWdmoFUjL5Fngaf8aXG5w6FBoTjIVinfaUHdPFecXpaP9wmgPPVKYR34pAa1faNFe1EgN0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8bf9817-fd54-9bf4-4302-dcee682f9172@suse.com>
Date: Mon, 23 Oct 2023 17:33:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH 3/4] xen/include: add pure and const attributes
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <fd5421162a00aa782e0776324ff6497193c1e3d3.1697638210.git.simone.ballarin@bugseng.com>
 <89778285-5cba-8fb5-70bc-710b6dd30a10@suse.com>
 <0032186f-80c7-4dba-b46e-10d4a8e2a8cb@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0032186f-80c7-4dba-b46e-10d4a8e2a8cb@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: c1daa3d9-1af6-4d7f-ac7d-08dbd3dd6df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qS5Lg+AqOi2P+tNhw5CAmbkKoD2x6w3dA64QOmn19GrK1iNfatNjlZ1nyJlrZJnBvdrMGvxWMNOlsZl6iSL+0XzHOSmPjhFR3KqqlhmaZpzkaNzkqLnHv5Bgj369xzpbie1c48dIPFZiRLqM0ob1Uak0mR9+oYOKwt0D+iaGUT+T2z/OckvUQXXrgIPWz9W+3Ltvq2xZQ4BqUn9aFBsj742Yj6vc488ELbDPqHyrZP4jmI1Epg9M9zUTLtshCBbUs0ChundWq5sTi7PQ0uD9lMk7PsXQaCHPiPW5ckxpiPiucVwPVRFKmPWzGr91vT+e+OmAN9KnBMQ5Cu0vrxoW4SiFcavEUFqTfvJREAXQK/VUsIQFzBKBNH0aRuGoEGEnna8TJQeR8Z/hIf1JCz5P9EHgbHOQOzyCCri9pLKYIQJYa7gUQi+v3cdXz3BsUuu9xPzj0OapEPIJhRe1Lkcn1jKKZoE8+ry/jSNut8Ez4z61dxCARZDzcYsP2vbf/OMLmybPcDoxWnmyFayJyIX1L6CPszz4O22hWwHyQGosmIkxi5LI29s8+TbNDPZ5W5zihqdzz92Npu1f07ks+xvpa2iOAyNAazkGsy7G7aPzEO7tzhfESa0uB00hPAFEx56SeVS1e9QF51pOmbqcUs/Arw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(39860400002)(396003)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2906002)(31696002)(5660300002)(38100700002)(41300700001)(31686004)(86362001)(8936002)(4326008)(8676002)(36756003)(2616005)(54906003)(66946007)(66556008)(6512007)(316002)(6916009)(66476007)(6486002)(6506007)(53546011)(478600001)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjdEUSt1L0sxWS80L29MYU4xVHVVVTErbEJkRjZpbGdwTWxwQjJ5K09JamVU?=
 =?utf-8?B?WDZtamFRVlErMUQ2U1ZCdm5aZUdPOVVIbUJwOS9udlk0N1lTRU1ZdVkySjJh?=
 =?utf-8?B?MDZqczVIakdmWFpVOUtQaldDTm5RQ212SlQ0WVN6SUJZTVBZVjJXMVcxYzNN?=
 =?utf-8?B?WWROc2tDQjdxRlFKQjN1dkVwek9PU1Q4MGN5RkhWbUxBNUJEVTZGRTZKSDR5?=
 =?utf-8?B?eFprbHR5TXBja2RDNmxhQmJPR0psSnYwVUVwNjNTNUczRkpCd013ZWovTkl6?=
 =?utf-8?B?YkRCTXZvR09SZUpBMVl6bzVqR216b3lraEljWHFGeWNOS0g0aFI5U2NpbTVx?=
 =?utf-8?B?U3ZxWEtmNU5uN1pSUExuNkxRYWZJOFF2UDFQeE5CRnB0YlNCaG9PRHdNZHhQ?=
 =?utf-8?B?ZllDQnVZY0RhNWRzYUJWVlpGVHdGc3FCWlFyZXhnelhJVCtoYU43b2l5aE15?=
 =?utf-8?B?VXJuTkN3U3ZuU1dtWmU1cnVDdFVubWp5UEJiWWg1RlFEaENZU2FrSGlEcjhm?=
 =?utf-8?B?ZVFOSU9pTzlpWU40TjRDa1l5M1NCdXBvbkRUQkJSTXhXMTBoZnl5Rnc0N3dB?=
 =?utf-8?B?Z3k1SW9pajA0MmhWSUJKbHl2RTRDbWdZTWo1MmtJUjU1d1BxSGYwREJvNmJr?=
 =?utf-8?B?V0VtOVFRT1Q5bzJ0SzNpZFZLZUVkSTVnUmtiSm5rcXJPbUVuenBIN0Jra0ZJ?=
 =?utf-8?B?NVZWdG9mV3VKam8vVUladFpYaC9oaVIwRTFTWmhLeEZZT3l6Wk1EbHU3ZlRw?=
 =?utf-8?B?NFNlVkdWRjRUZnU1eU0zaWEzOHBtZ1UxQXFqMys1OTFNcnhoM3QvejUxby91?=
 =?utf-8?B?eFVXUnBSQXE2cFFsSXRraEVkUFA0MFUzTTdQRGxNemRqVWMzYUMxWDJ2bHRh?=
 =?utf-8?B?YmFaSEluOHVHTjZHbTJ3MkJXRlp1MnN3L1dhOWE2RGM0OCs3KzhmdGNscGdo?=
 =?utf-8?B?R2RacWoySVBYdXdhL1ZLREtvWUZOMkIxMEY3MVhiTkgvamFVTVZrWW1VdWdG?=
 =?utf-8?B?dHIvUlhOb0syWVAvRzRiOEhRcEp1SXhkSW9ZcFlOdEs0V2RnendKdjJVdXF1?=
 =?utf-8?B?eEVock5YV2hXUGkwWldsaTZRRUhST2J0L01VQmI5WnpyVm9HSWovcEhUUUFZ?=
 =?utf-8?B?citCL3cwb1NuN0h0ZElHSE1ZVnFwVFZHZkZ6S3Z6Ulh5UEdlbUFBaHZ4Skhz?=
 =?utf-8?B?ZTExNXdud2ZDMjdkUC9tR3g5QTF5QnFEK3Jjc0V1QkRhTnJDVlE2TXZlRG82?=
 =?utf-8?B?OE9xUUU4VXNjVFhmemtBR0trd1NMcEpidStrZXV3eXNoR2hkL1NieDh4Q0Nx?=
 =?utf-8?B?cHh1ZmVFTG9JaU5iRVJiUkUzdnZkNlVKL2h2cTZrV0s1VWtLV3EzeFJyZVQz?=
 =?utf-8?B?cnE5aTgwc0VWN1dsMWxOT2hrWEtuKzlrRFJudDFpZG1PcVcrOGlZWlZzL1Rr?=
 =?utf-8?B?eDdoL3Y2MkRWZWVJdnJDNjJqMExUMjdKK3UyTERkM1hZOFB6QkkvR09mU2JQ?=
 =?utf-8?B?Um9KM01SRkcraVh5cXZJM1NybEYvLzc3K0VtZkllS0NtRTdZdjVNU04xVEI3?=
 =?utf-8?B?ZzdrUGRWYlVFMW1HcEd6dGcvcjFPQVRsUHZ6N0FKc0lyekkzdkZyS2FqT3ZN?=
 =?utf-8?B?bEVZREJGZWlXUjVVZWxkQjNXOGRQUVc5Ny8rS0tUNG9kWC9kMkUyZkFjMmxw?=
 =?utf-8?B?V1FWNkh4RzlZV0pReFRjeTZHTi9tdld6YzFhSjZXN3pndHlydDZpK0pWMVBH?=
 =?utf-8?B?anFHQkdOTDROZkFjZGFRY29kbndmR0NiRkkyVHhpTnc2V21iRG9oUzBrVzVZ?=
 =?utf-8?B?NCtrNVBrTXVVeHJmelkxY1JOdVB6SURTL3Nnc3hmeGFYOHkrWTEyR25wcCtP?=
 =?utf-8?B?VUk1NitSK2lMemxmdi85K1AzczhadDVsZWsxUDdDaEI3NDQ0YXdFdm5POG1S?=
 =?utf-8?B?ejFMbVY3SWI4aU9YRzA0aHl1VC9YUDZxQmFlZU1rR2lIdXNGS3pGTW9iSnB0?=
 =?utf-8?B?djN4VGRpQWQxZWNxYjVVa1VkSXdSK3ljSGhmL1VHQ0poTVp0NkZUSUNlOTls?=
 =?utf-8?B?c29VWUJ4WXZOcWE5bVQydzVEUjlNUzA1Q1djdkI0OWpjejlHbm0xeGttcDdR?=
 =?utf-8?Q?x+2YujkQMHTTN5vv/c/FgD3ty?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1daa3d9-1af6-4d7f-ac7d-08dbd3dd6df1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2023 15:33:39.0029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vSAX/eiWbZ8VzPlngVR28fgAv5f6cRfl9JYXYD9lpQUCPc0+OqrtDPeEpGenshbtJkiLWJerjkrs8OrcXav4Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8725

On 23.10.2023 17:23, Simone Ballarin wrote:
> On 23/10/23 15:34, Jan Beulich wrote:
>> On 18.10.2023 16:18, Simone Ballarin wrote:
>>> --- a/xen/include/xen/pdx.h
>>> +++ b/xen/include/xen/pdx.h
>>> @@ -164,7 +164,7 @@ static inline unsigned long pfn_to_pdx(unsigned long pfn)
>>>    * @param pdx Page index
>>>    * @return Obtained pfn after decompressing the pdx
>>>    */
>>> -static inline unsigned long pdx_to_pfn(unsigned long pdx)
>>> +static inline __attribute_pure__ unsigned long pdx_to_pfn(unsigned long pdx)
>>>   {
>>>       return (pdx & pfn_pdx_bottom_mask) |
>>>              ((pdx << pfn_pdx_hole_shift) & pfn_top_mask);
>>
>> Taking this as an example for what I've said above: The compiler can't
>> know that the globals used by the functions won't change value. Even
>> within Xen it is only by convention that these variables are assigned
>> their values during boot, and then aren't changed anymore. Which makes
>> me wonder: Did you check carefully that around the time the variables
>> have their values established, no calls to the functions exist (which
>> might then be subject to folding)?
> 
> There is no need to check that, the GCC documentation explicitly says:
> 
> However, functions declared with the pure attribute *can safely read any 
> non-volatile objects*, and modify the value of objects in a way that 
> does not affect their return value or the observable state of the program.

I did quote this same text in response to what Andrew has said, but I also
did note there that this needs to be taken with a grain of salt: The
compiler generally assumes a single-threaded environment, i.e. no changes
to globals behind the back of the code it is processing.

Jan

