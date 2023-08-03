Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EFC76EE63
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 17:42:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576466.902634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRaSw-0002eJ-8L; Thu, 03 Aug 2023 15:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576466.902634; Thu, 03 Aug 2023 15:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRaSw-0002cB-4z; Thu, 03 Aug 2023 15:42:18 +0000
Received: by outflank-mailman (input) for mailman id 576466;
 Thu, 03 Aug 2023 15:42:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qRaSu-0002c3-3E
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 15:42:16 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51a159d1-3214-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 17:42:14 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6897.eurprd04.prod.outlook.com (2603:10a6:208:184::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 15:41:45 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 15:41:45 +0000
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
X-Inumbo-ID: 51a159d1-3214-11ee-b268-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObjJ59AJUxZJaWbPtVMFGIWc7DPSa+pywJfhFgzv+Xza+4HwQo1Viup5ATSWVrASDFa2V87zUfEpDuGE+lnrlZcj+lgofIeB2oavJayUf4MWd8lnDT8pXDuvatGPi/gMwloYMLGsrm8bUCXrk/dr8MuXC9kWYyYq0HddTiNP8sc3d3wq/9KkbKBd3XgBYeQt40s3cqB9+LISnh8vRLnLMN6Gz9mR5xlMYXHavIgrVCb8i5gvamyZ9fTDe9dM01xN/Pd+/cuaei+HX09VK1fxmTDvJ/kJZzft0PUr2mNEVD15caILu1XER0ic88EGpEYPCmq/Fz1BJ3XWEz4ivC3Dzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9P4uoyU/0qNGHpXBbsPek+ERlXRrnBGIV/T9hzgJSIM=;
 b=U/zauUSQK3hhYo33+yNNx1NNQnAIpf8uXNZao58aDcoqSea6FogIR7qZ6r+yIi10r2nKqHo8ih9dmfCZWscWiuahzNy4dgnzmbqg0naYaJzNKTiEphH84kV/4seLrGO42xezTSpdfhKmaY4L+sxymkFOmiNfPd/EB+tgEULhEEIzSTis6Yy1/BzTpMnK/dKSyeNRd9Sf4dl3SKB/9d2Fs8wxSBVh3Ar3JwQLcFiuiVkdq8GDsDmU/OMeIkmR07ukCRnrF9KiidA9ndQ8e//Jon3RyloVSKXlil0sIgoIKCcqdVcPQPESaUH6nWuRrZlpJgZaINWAG3PA6lDM/u8LxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P4uoyU/0qNGHpXBbsPek+ERlXRrnBGIV/T9hzgJSIM=;
 b=l8UMtt8QomW5kspuQaJFjX3mxw0GXUSrtAnKnTxNb4iNzJTuiyG/gIiOZdDWuL9t4ILKTDHle+roeolIjuLQLzN5ESzZsOWVWrMX41JzNgbOLVxzINHTrvDPZRd/7Ka39LvcQ6hR7vDdy1Ul0C3pKc2HSNY2/4B4pSP3iqZIZSyaHFJwSeKkorG833XvMfH7c6wfvj0AjuBbW063w88AuSpjZ65rX/YzF/qnUUh2jG6ACoj26EAREdZbUgpx5lZ/P34BLR4JQKoxh+XiEnjWamzGAHalDU6OlYpCFibJN3dY8bgumg8M4jnX4mElKdJPNSEL3227Kts8uYDD9XdR5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <693596f9-e2b7-41ac-6d3b-5c82fd3474b5@suse.com>
Date: Thu, 3 Aug 2023 17:41:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 11/11] x86/mm: Add assertion to address MISRA C:2012
 Rule 2.1
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
 <91b2f2c9e728c1f19f7baab301299d995a074279.1690985045.git.nicola.vetrini@bugseng.com>
 <0ba36273-33ad-753c-06a5-be117b6658e0@suse.com>
 <d506555fb3653322703f50d8756f3560@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d506555fb3653322703f50d8756f3560@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0114.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aabf589-6861-48e1-2977-08db9438247d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gzzMkPdPUTUvqnq677Lk/MB2DeCKzJ0yoRu6pKMvYiAGFjwe1lGCV7xTmjc8K5kgv/KFC+76hJxd8hu3gjyHyX3VA5gPPhBvjuitiifsOeiwuyi7Zdehsy0MlQaCie8P2GIIyuveOkuVeBVypVSn5B/SwDkK5Gs78SksdSGNap7pbyP4lr74dTGrU4YBU7a/O7y+Gtl4eGKKrqoFNXkcgGmp2HqBrEgKv9ZIxYgyHDEikHMx2tihaP6uYZgON+nkPkpZi9l9eeVBgPR4KL2aRjVdxfG0ddZA9/EkO5W77qmPLkU2SiSfnfzaOq9kiq+fa4arpaOOs7xxNYoqKY1ePq3JorDz7p0DJdYLlNpJoazVSDS5H6Hhdr0DQ2UnstEqewFf905YkNeyW88gOMbkWESeMPr4PFskqXAZsA8MPZjuDouleDtXozZ8qBn0108+pkXY2JYlx5VGgUzw2yQJ3/wP+xwKdvpR6o/R6Te1lxZ74AWgO33+BVYKIskqwK88lVH3VWybqfVPbIljjZp3mpn+KaG4wIavQHx+VIJ/11sXepHHvL40J7i7lMvf6NdcYz6006hxIhEmXv4OApG1IwWbEAKRR0iz67zLg38+y0sY+HKhK5AfHNhoujJsUaIdB5eWdX5ENq5UaYvRArjlHQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(366004)(39860400002)(376002)(451199021)(66476007)(66556008)(54906003)(66946007)(41300700001)(2906002)(316002)(6916009)(4326008)(8676002)(8936002)(5660300002)(38100700002)(6506007)(26005)(186003)(36756003)(53546011)(31696002)(86362001)(2616005)(478600001)(6512007)(6486002)(7416002)(31686004)(66899021)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUNZaFBMR0huYnlTM0w1MHpTNmRwZWtYa0h4RXZnQ3ZYdTN2L05ZT3RxSDRl?=
 =?utf-8?B?b3lrV1VhRmh6NFdiYUE0SC8wSm1RUVFCb1hYelB0RWZ0UW1WdDRSUjVJKzU5?=
 =?utf-8?B?eDFWUGFTRk5KUS9WbmVBcHh5ZDhZM0EzTzdwY2xmWFFHV3IvSzg3N2hRY0ZI?=
 =?utf-8?B?TTFydy9YV05RdUV4VmVTYkdQL0VqdURIb3JBbC83Mk1JUUN3Q3ZmSDFpN1JY?=
 =?utf-8?B?WlNOcHZ0blN4TlREM0d1QVNzcVJKcVlQRm9sUjk4SExqWlk3STNWZVorTmQ1?=
 =?utf-8?B?dnBOVWxveW8yZ3A5MVRudXY1bU5UV1VWalRDY0UyNkJHUVRZRkttZlN0NTY1?=
 =?utf-8?B?SUtubzJwVHBSOHo2RlcyUzkzdW1qbzBYQUIyWlkzY1k2YzVnTENiWExib0cy?=
 =?utf-8?B?TjI0WHRoQ29HYUh5YUYwSjBxbEV5UzlzMk50bXQ2VE8rMCtnRU9ldHAvbk51?=
 =?utf-8?B?S3RXbkdmN29MbHVqcTE1Z1ZVdXU3MGpFWXFyV3RuLzRwcmFLTHZWVFZ2K21u?=
 =?utf-8?B?VStPNGhTOS82R2w4M2hGN2Exd2ordXpJUEVmOVNPZEpEeDY1M2RrSVFlOTBt?=
 =?utf-8?B?YzIrd1lpRHJ6MHlTazVsc29najVoN0FyMXZxUyt5SU9VSjRpdVVKbEZzZm9F?=
 =?utf-8?B?eERVL2hBV0Z1dklxWng0dHJRcXJyemE1SVpzZVdjMmc1Q3NPTUlQUE4rcVN2?=
 =?utf-8?B?d05Da0gwVFA4R1JidnlNN2Y5eUZ6Tjh6M0ZCVURyUVdLMXh1R0ZzaU16ekY2?=
 =?utf-8?B?My9HNWM0WElPeW4wQjh2Ty81K0hUdllDdkNtdVNhY0VtWXJ3dVl1S3grVGNV?=
 =?utf-8?B?Ukx3SWl3VFo1NkFLNXF2eUxUem1lOXJSa0hmbFJzeldOK2MzWHp6N2dwbk5S?=
 =?utf-8?B?cVNrY1F5elFHMzJqa25ZSEpRWlMvdHpSdVVwY1MwUjIyd0lVTnR0RFN3Tkx6?=
 =?utf-8?B?Q1QvVDZiTU5EbklJb1I2c29VTnljTGJxQ0JlOUdJQWdCZklwQXlrakpaMC81?=
 =?utf-8?B?RStxVDVqN29BTVErQTlSSHQ5c2pQSlI2Z2IyMWlWZC9vM2NBekxtZVhRRzJS?=
 =?utf-8?B?ZmRGVzhxeG9CVkNYcVlQWjdYdzJKQXlpREhmZjgvcjk3VGlEZlA5R1J0MWRQ?=
 =?utf-8?B?UGJvcTUwL0J6c0VzdGg5SkNzWWdCUTgxMFJOMGxscW1Mei9FVWNlQWFzMTFS?=
 =?utf-8?B?THJJTmV1akhzNnRFRXNFMmRCYkx2MDFhYVJVU1hLUnZCNnVQbTlVV3V1bzht?=
 =?utf-8?B?ZGpheDM4aFRJWHQ5VzB0Zzd4WVJTelUyeXN3ZVUvNzMzNEhmcVV1R2c2Lzgy?=
 =?utf-8?B?WTNYSUlaNjMzNzdDQ0lzVGtmZFBXRERtbXNpSFNSdE5URE1XSFBGQ2ZzK1lm?=
 =?utf-8?B?dkgxc29VajZDdHRPbCtVMllwTmJlQkxmdGtjelZYZk5kbG9acTVESVROZ2ti?=
 =?utf-8?B?TjhMZkFUZ05WQjU2TFV4K0tTNTRXOVNJczQydmFRWjNIc2NUWU5wWjRaVk9X?=
 =?utf-8?B?S2tNRmg1WXpPcVhlZGxzNjB4eWdYSnM0cUhDWkRKQU03cTcybisvTEpKT3dX?=
 =?utf-8?B?Uzc0YkU2bEZ5eERreFp1UWQzQWd0VURDbXowRWttMThodlRvcmwzTWdocGsy?=
 =?utf-8?B?VE1KclovcmNEbTNieHgxZDljdzhJeEp6ZHltOTlvenowUW1YaCtYMVBEV2ZS?=
 =?utf-8?B?S1FsZXlJbkNlWVVBMjNKeTZZakxkRG5BeDNpdFBjQWEyaWhWUFRFa0h5Y05O?=
 =?utf-8?B?MG1ML0JSa0ZvWXVaUHlHYnB6dDByZVJJbzFtcWREWHI1bTA2ZXNrdVZybjB0?=
 =?utf-8?B?cE5ZZG5UMklKWjg2dkF2ZkJCbjdqN2g5c05FM05MVVZFVlNUaW9KNk9NMzFU?=
 =?utf-8?B?K0lPNGEvcVE5Nlp5UVg0akdQMnVhbk9XRVpWZWY2TFdrYlo2QVRoOGFYc3JQ?=
 =?utf-8?B?OHROVlZzNG85aGEzYzlweXdiYWlvTmpCMHpTOENvSytVSURMU0xMWUFEWnpL?=
 =?utf-8?B?TXVFVzh5NmlpclJBRkp6Vy9LejdrNDdVWVZvRkhFK0Nob3NpRm9FeE5wQ2Iw?=
 =?utf-8?B?NXl5Q3dpU3NOangxa0FaTklKSTlJT01LTUY3ZkRJdjhkeC9FN1AwVktQYmww?=
 =?utf-8?Q?QDActZB9nIy/xrOmQ8ikr5iMe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aabf589-6861-48e1-2977-08db9438247d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 15:41:45.6011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjDZHNC4CAthHUXcIsXeuKkVPU78xmux+8jq8Mk4tBHGxu+hxUyS8YfiqpttXJgMN3FlEc8qMEORnWwCpZ4TSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6897

On 03.08.2023 11:30, Nicola Vetrini wrote:
> On 03/08/2023 11:20, Jan Beulich wrote:
>> On 02.08.2023 16:38, Nicola Vetrini wrote:
>>> --- a/xen/arch/x86/mm/p2m-pod.c
>>> +++ b/xen/arch/x86/mm/p2m-pod.c
>>> @@ -1045,6 +1045,7 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const 
>>> gfn_t *gfns, unsigned int count
>>>      }
>>>
>>>      return;
>>> +    ASSERT_UNREACHABLE();
>>>
>>>  out_unmap:
>>>      /*
>>
>> In the description you say "before", but here you add something _after_
>> "return". What's the deal?
> 
> In this case the unreachable part is that after the label (looking at it 
> now, I should have
> put the assert after the label to make it clear), because earlier all 
> jumps to
> 'out_unmap' are like this:
> 
>    ASSERT_UNREACHABLE();
>    domain_crash(d);
>    goto out_unmap;
> 
> As I understood it, this is a defensive coding measure, preventing pages 
> to remain mapped if,
> for some reason the above code actually executes. Am I correct?

The comment there says "probably". So the label and following code might
be used for another error condition as well. Furthermore both paths
presently using "goto out_unmap" already have ASSERT_UNREACHABLE(), so
it's hard to see why we would need yet one more.

Jan

