Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 385A759968E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 10:04:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390108.627336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwz9-0006dy-UF; Fri, 19 Aug 2022 08:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390108.627336; Fri, 19 Aug 2022 08:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOwz9-0006b6-R5; Fri, 19 Aug 2022 08:04:07 +0000
Received: by outflank-mailman (input) for mailman id 390108;
 Fri, 19 Aug 2022 08:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iUym=YX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oOwz8-0006b0-4a
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 08:04:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2055.outbound.protection.outlook.com [40.107.22.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e78de6d-1f95-11ed-9250-1f966e50362f;
 Fri, 19 Aug 2022 10:04:05 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6362.eurprd04.prod.outlook.com (2603:10a6:10:106::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.16; Fri, 19 Aug
 2022 08:04:03 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2d5d:bae0:430f:70ad%4]) with mapi id 15.20.5525.010; Fri, 19 Aug 2022
 08:04:03 +0000
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
X-Inumbo-ID: 7e78de6d-1f95-11ed-9250-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BW936GgZwmmc1aX9ft/aRvrqKiAEiYZSYXzPwKhdWs1GmK2gOpMG+EW7rtkCcx1bmS5HgpwzZ8RFmvFRj584jFNBwYe57+tW7Zti7Z7XuHzOS1LbYG5pCVL2dS33QMyWGevzd9mO8fL3dHb60nrvb0zAjt8n6NAh/52V1yWcUaIPM0JjF/ZIcNZ7oxvno4WsWdfKWhQIS7UCRYgZ61gq14w6kWq9Yp0vEFyna7DY6/SBmqFaLkjBdm/hFVZAEM2LLpBlstCrbcY8hampXxZ9y6JPsJQ+GFUwj6FgAUlBZ1Z+PKaPCOpa/9Sho25ud8ouew+LbDyFjgTqPTGrjR05aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t1heRQw42PU/RdUdVApHFnf6c1JRd5ie/52S/DUdV5E=;
 b=N139ulNliRLToCGTRQXKVA89SjE70BqXdGcBQftijnkPWLRaQRNV28i9oHy+WU7Dapp1tZo1W3FmE/Z6X55EqdNgnLJj9umTdpPo3K2/J02qNcuOaemicRGz+EnXt/CPA3WPcMop7eYuNk/gD5IWSj+ingEr1DKGzB3MOqCotFY32//zZ5JO9At4ADf6DXomU+ZpcF62fxhfpguljFJJ+E0OpIi9pEtAdKCvt4ih8ietbQnOK8y4G+P1Jqn1odkdbyYpFrBH3CMvpxGhCKMV+SAUFHHA3m6N3maANX0QmcFhuRu4W0/0BJwAZpBXWMpS21HiUwhHQsNhkfKV+VMaWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1heRQw42PU/RdUdVApHFnf6c1JRd5ie/52S/DUdV5E=;
 b=Mt69DUTRnef7h43Ij1jbMMupySv0tW0JUelSo1yyF/IXl2vNzG4U6s3gFOcm8dace1Kg9ONt6fGTbuUdywXTXA/e1vg6NdUhjgYaAjT+uTccgvwWmmdv+YEffop6YAFukn2YWC00yegdPzTjNE/UWCcCyCsVBixkD6u2fP0VQGiDZlv5fMyZ1OWyHTz5GvcKhacc74zmGJ/K2k2o/U0QFqPh2MI9hMpVz1K6bnTfumZ1o7eedkrUXOJZ2i0+PMNXyxHtvUS4KX4vLJ2QnfisSvy5a/PF10cEW2RrSN26zB4YkrKHxUSki84PCVJL7BfxmVQhVPhk6O2nEmOtoh3tBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8a80c79d-975e-3866-2419-f6ac5678060b@suse.com>
Date: Fri, 19 Aug 2022 10:04:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/2] Arm32: tidy the memset() macro
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
 <PAXPR08MB74201D5D5741B9F19E3622A59E6C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <PAXPR08MB74201D5D5741B9F19E3622A59E6C9@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ed74522-ea47-409e-6645-08da81b96150
X-MS-TrafficTypeDiagnostic: DB8PR04MB6362:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Km/CQlJGyzJXjXzYFyeGT3Yz4hudmPHRBVSc1mV1pVtYRijE1yrrGH3S2cL5pRnx6purcGXm9+MT2EusaVC0ITev1znKxyjzWNsQ+iHbG4UtGBZG2wzkhPml1tITxyG2ZAYqpGCJ4BJrNlViHA73nH/LfhcKvziQOrwpgHcOjaHQeQCpqgPyjjlgw2j+1NxwG5ntQF22/3YzUtm5XzClOjNJSCvZgeBlzuDFkIyuIxP7EVNKmsi5PxtmeMof6vHUsu+LnysgNhnalnUpeyl8Z7l55PMk2px4e7/YO9e7DOnXNZ8ZelrOdGuOq5jnJsVQb4TbFmGsgzfI9lkg6eEazSaSrF+i7xhrXg/BetcJn8qkzegKxdnkbRWvVGEegYQurBTKxwsA/BjUBqzRuGmf3Fcvafla5AJexcWymGp7ui4+xqTQHqHphFjuy/QA2qywMJnyGTigeJX98EO+35jAseAevWVikAJ5J5U0UDJZuYtN5fP7Fv5UakibPHfGvrtLyUhTMcGpVHmODYndtiX8gLX1jECh19Jq6NMkRcZDdMX41Jck5GHMH6qSpuY9uS7vFaacmXi2tkxVAQZrM1KlYimUMV6+0GSdwNjmgyS+TL8Vjp5IGybRc1a6mTANjLWzZ4ApcJLMJQi5ETP4bHQgul71Lwv+VTlC1ttgajYl7rs3ua8QGtZIkzj9D4/or7irB1EQp0xi2j3kftQlW3SQfFHeqI1vfmb/kwKC0DP7Aq0SejHqavcGWu+0wIZ3QwU/X8spG0WO/u6xDcqhaqKrpubE3fj1U9hGxREu3myIlbQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(396003)(376002)(346002)(6486002)(41300700001)(6916009)(86362001)(478600001)(31696002)(66556008)(8676002)(66946007)(4326008)(66476007)(54906003)(316002)(83380400001)(2616005)(186003)(6512007)(26005)(6506007)(53546011)(8936002)(38100700002)(2906002)(4744005)(31686004)(5660300002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VDJQZ2ZnbmFqZGtwR2dzOTVUT1RvYXAxdUQxU2pHV0xOK05FeU1qQ29LRm1Z?=
 =?utf-8?B?cXYzakw1U3JpUmZHYlF5S0dkaWM4VEFsTG8vZkJ3dWhxbGZOQUUwUVlDZ3pt?=
 =?utf-8?B?UmpjNW5oZi9yZGRFUlFGU2hFYnU4SVl5ODNlMlk4cjRNUGx6TDc3SG5PNEQ0?=
 =?utf-8?B?OWlKRW01a2VmZzFUWTBHL1M5Z3p0NW8xT2lhMnJjOUxCUjcxdmZvOUlMUHVm?=
 =?utf-8?B?V2ZNTlM1ZlBMbjI4T281MnFaUlpLU1M3blFxODBNL1lyQURIUFUvdUlCTlZr?=
 =?utf-8?B?MHMxRW1DemF3QmZrK25xREVJcVk2ZFlaYVFMbFZJUnNsdm5Hd0laRnJyNkU3?=
 =?utf-8?B?eStpa0pHbHFLWXhaMDZxUGlNLzZ1b0ZEOWhlZmQ5YlhxVVJ1UzA4L0JYT1lW?=
 =?utf-8?B?TDhPdnE5K00wYVBBdDNDZU1jZWI1dkU3RnNiOXpERU9HWFZxNHh6dWJBaW5t?=
 =?utf-8?B?N1pTZHo2eURKL3pRRVBtS3NCYUNXdlB1WFdoblhhTTRiaWhoS2hUSGRBZm4z?=
 =?utf-8?B?Z1Jkbll3Um8xbjhGSGlqU1JSdUgxNngvTE5KOWZZdXErT3NKOHAyK0dEZjQ4?=
 =?utf-8?B?QmFLdy9nbDhmQTFyUTdBdXFqOWFvVEkrTkU4RXUwL1FYbTJyblhCZWRraXlV?=
 =?utf-8?B?aDlJL29Yc3B4bGZNSENpVkFDOTljbmg4dzljOUFmQ0tlTHJWVEhjL2p3TmdJ?=
 =?utf-8?B?V2F3dEVJdDJKUXRpUkl2OHBSSlVmZm13UVZ5MEtXbEpGNGJHdHJkNlRqRjlU?=
 =?utf-8?B?QjBJamVWbG9BczdlRkR3RzJ3dmFjSVUyMis1Wkx4eXorZDVHL3dtdWxuZExk?=
 =?utf-8?B?V1MrOVk1bzA3aXZkT2d5N2UvNnlCNENuZlgyR2Q2T0Q0RnM2WUV6Z3Z0SVVV?=
 =?utf-8?B?UUc0WlRNaXRRd21UZTAyRU5LL05JM0YrRkhxMzlNMDROUit1M0RLaDd0M3Bh?=
 =?utf-8?B?cHpFdGhkZ3ZKYkkyWUhrbmVZQk1lQncyZ0YvVnE0VFBkS2dnT3RnMVh1MXEz?=
 =?utf-8?B?SVVJMmQ3ZTJ6MW9ESCtRVEp3Q2g2UmEzREpGSlYyUVhpdFFJQ3JsY1VqczlP?=
 =?utf-8?B?UHNYVGF2cTE5SkJSd3VEZlJibjZkMVFPQStYMTlsWkVqNkdtUnNtVUhwckFH?=
 =?utf-8?B?R0JhRUMrTGdRWGI3NjQwSDB4TnFXV25pTmJkWkEwWjF0V256dEFnVlp2QkMr?=
 =?utf-8?B?aXZ5Nko5ak5kN2xDTytzc2F5Sy8ybGFrK0d0eVo4RG13eDF5bW1KUjJYdlFF?=
 =?utf-8?B?dFJFK0VEclN0S0lJcGdCcVBja0NNR2JqL3FWaTVaQkRQb0tyVHFrclo2Rjdl?=
 =?utf-8?B?MTQ3SUlBdTBYOFBrUlVndTJOQ2cva1RSdmZMMEpWdE1wZ1YrVkNnTkplWEtx?=
 =?utf-8?B?L3YvNU1jZDVMWGdFTXlpVklnUWxIblJyQ3FBWEd0Nm9iYUF0S2dIWDRMVC9P?=
 =?utf-8?B?dVBDdTRWdjhzR2FxcENvazVFZE05RTAvLzVUaG9Pb3I2U1l0bjhiY3NVYWtJ?=
 =?utf-8?B?QjM2anB1R2VWNUJ0UGoxY0lpYkx1MzZtcWVpQ1pmVUZrYmdhSTZ1cjY4a3d3?=
 =?utf-8?B?Uyt5M1VZaXRKcnhCMVJuelBidXdFb3h5SnFJVHZsNFdTTnlPZWdoTnZMMGo5?=
 =?utf-8?B?Wnhpb0pHZ1BDUjgzc29WWUVZQjBmT3V3TTVqOU1Ddy8rTkZma0puSFhGbVUx?=
 =?utf-8?B?eHJyaGV1YnVPQjlZZXA5SVN5dm4xa3E5alB4ZDlSek5vQklrMEFvSFFKNWNZ?=
 =?utf-8?B?MFo4T1hBN2lWQzBjUkxhTUE3VW1zVW9peUxEbVMxaW1Vck1EWmh2RVpKYkxV?=
 =?utf-8?B?ckRqdmRSSE1QNlFGNU1uRHdyamZ2RTBtWkdPVzdBSjlPMis2OGQ0TTBDV1RG?=
 =?utf-8?B?enBsc3A0dmovaVI1VGJLMGRRM2NvbCtGRWxVMkprcDAyejJiVkVSc2cyMng5?=
 =?utf-8?B?Z1AwSUEycmpZWElOcUhQUDU1RTM1UlkraW1TNjAvWVFEdVJRaFpqQ05PVVpY?=
 =?utf-8?B?T1c0blFMYUdxQ254SEFSdStxbmsxYk84b283UHBaQi9CZXNwQmlVZHlvNzl2?=
 =?utf-8?B?cjV0NzBiUVVCUW4zczBNMG16OS9kVjRhV0RIRk92aitFNmVOQzBPcXIxNGdI?=
 =?utf-8?Q?EFF1FHNE8mSbmS2fqnEp+oFG3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed74522-ea47-409e-6645-08da81b96150
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2022 08:04:02.9657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04iqRon6cbX5JuM5AM5CCazXNY5ZkOD7ZJGChf2PV5q1AOFOwIOQ8IhH0w+OpaRgPuWGYxny6LgxPuZ1z/djuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6362

On 19.08.2022 09:59, Wei Chen wrote:
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Jan
>> Beulich
>> Sent: 2022年8月19日 15:50
>>
>> - add parentheses where they were missing (MISRA)
>> - make sure to evaluate also v exactly once (MISRA)
>> - remove excess parentheses
>> - rename local variables to not have leading underscores
>> - apply Xen coding style
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> I wonder whether "if ( n_ )" is really helpful: It's extra code in all
>> callers passing a non-constant size, just to cover a pretty rare case
>> which memset() is required to deal with correctly anyway, and which
> 
> What rare case we need to use n_ that can make memset happy?

I'm afraid I don't understand the question.

Jan

> As your
> comment, I read the code again, but it seems to work fine without n_.
> 
> Cheers,
> Wei Chen

