Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4167809B3
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 12:10:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585918.917128 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwQT-00056h-Bf; Fri, 18 Aug 2023 10:09:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585918.917128; Fri, 18 Aug 2023 10:09:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWwQT-00053w-7Q; Fri, 18 Aug 2023 10:09:53 +0000
Received: by outflank-mailman (input) for mailman id 585918;
 Fri, 18 Aug 2023 10:09:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWwQR-00052V-DZ
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 10:09:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5de09de4-3daf-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 12:09:50 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM0PR04MB6819.eurprd04.prod.outlook.com (2603:10a6:208:17f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 10:09:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 10:09:47 +0000
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
X-Inumbo-ID: 5de09de4-3daf-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGRXzqI25WETH3D2B1Y2QqLSwYAWNztmqVo8cqSJK2fhful8Sz/1YBu9fkD9fSp37b0zS5BhnCxA/pZWD+0OLsiFmaYmBRHzYK0ucmqp7B9FKvpVVu2nUki5WURWw2cg2BSOmGtfea8018eo3T8Ae/o3HVyBXuGax744oKfOhD0dWSGVtmhDO0M4RIG+Cxmq6x0H4rCqOKUWN4yNteRqUkF9tBIoKWwDUrIA4wZLewSuCe6hj/m1yKDK60Uy35rAwDlZ2kTq0OwtLJb//oUGn1qEizN1wJJVlFd2wk1stgh2l+atgkvBnHL/4epB/mzm0WoAf3cdsGgdKsYtrszRLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=be7miB0zMoix+KB8bHKkeixlneqDcDvmw3XQR9SImSc=;
 b=GLvN56TcczRkeXLV+eLrAvKV880ykq/heRWM3calGrSY6ldWvLtf+T/8PyAaTfvZyL3wn8HQICmx1JL/9Mxb+54BtO0yVUn5OHUt653CcvnC0t+YJhapvQBbkYNTbTDm6kauHcy7I8YE6NsSVSfjSED0gadbxHgFBpigXrvKBWKCKenAxP9zA1rBcIXSLC6bgpjoC8jF1rNxOkNm176MnFAyBTFUXWomOdSC/d1dpvT58dFiYV00YWn10xkeawGlhLrzzKERUBSJx8ChD5zVBV6ugsJrEN/WofkQUna0Fwq4DSWHlywvHC8o0Biihx2d0IZCFk1xmbVvG34GIwBP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=be7miB0zMoix+KB8bHKkeixlneqDcDvmw3XQR9SImSc=;
 b=0nBImBKBBstxithPqR/gBW4DPIEm7Dusm69tRLjCrLBXur/D5CfY8ZootZpk4wxjzfvV36JhEa5EoRGazlD4qubzrzNflK4sjAg7nek5NpjZ/DxmJa01tA38gwfVpQknd44oYgeanBaaPHSdNUKu4Nd8cUc/5O1LPC4eZOGIHI2EdINR+AFzLcfCy4uRyslIM2oE1fHUXrOGAeHtAjmvtxEQa61yCIxJVrDplEYP/vV+sBstyvlV51BPDjnysGIdNwRSBqyG6DX0BtxrNuIhp9lpuhhK6fq2KGBDl2fpSe2/p0kJDZ4599jcCUMdj9lHGLMpi6ZK2zg1wZB9yulDpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <76efe3d1-d89b-cd60-2112-740510467a1d@suse.com>
Date: Fri, 18 Aug 2023 12:09:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] rombios: Work around GCC issue 99578
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230817204506.34827-1-andrew.cooper3@citrix.com>
 <622e33b5-7fae-ba1e-0100-667cd9b50ceb@suse.com>
 <e5f790ac-2f8d-7da8-8e6e-5691615e7d59@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e5f790ac-2f8d-7da8-8e6e-5691615e7d59@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM0PR04MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d5cd98-9959-49fe-afdb-08db9fd34083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QgAr+1qiYq3As4o3Bo7fxP6K3/DjDe4/6iglL6/9XIDnkEyfqTpWE5gcyqSV+RA+JoSc5jTsshgikAixc2y5oLuv+wNS/h/66frp6ZHYveFa2k00hvVR5EwuwbKSFtPEJRjolvdmGPV4/TnykG/Vm3+GHLuckgShjd5BtNDOnifEHh3MLgcwrgrQQurEgD6IZ5KvS2A+UQReDmj3S/1R0oVDxWfw4E0XcwOrRWUM14p6rKj/RojzCe3EkklRdKjrPpvssnU5BBB2ZQMvoOqrlj9V/6siaAe1Re8Gcb28QZOrV9B1reH5H9CD/70FLBkWoZ8q8VEMGqnhjAvPLi/vniwao9JGTpEfzU50vPc7K6UkNwP8Qcajik6+7O/a356mJbZLdDH7apijV8ypOXzXKtjk5eigRP76rwlSY/zIHhn64oeXFsCH1/iP1bWwIktAiJhMzxEkntVe23COc/UA9Qo7TTtjRhu5N2c3N6K0wX4qpIKS62AnPqN8r2nktKHqRjMyMMB53ZUBk3CuhKdfJqvqXihq1f/IQanjHjkqB71QtR0saRQIM99rbbSarpmESVRq73V5wblBGVcPchT0K/aKdQ+6fO0ySwgPTyCVjB2inJKLLQXfq65+leNP81owu7Xp3ZxYghSaxvWpNJVUfg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199024)(1800799009)(186009)(316002)(2616005)(6666004)(26005)(6486002)(6506007)(53546011)(6512007)(83380400001)(4326008)(5660300002)(8936002)(8676002)(2906002)(478600001)(41300700001)(6916009)(54906003)(66476007)(66556008)(66946007)(38100700002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzZrVmlsb2dBK2hDaGVlRktMZUpTYmxibFZyUytsd08zbkpVWURoRk52ZTJm?=
 =?utf-8?B?aG9md2JNcUNPSkxSRDFEUmtyVitodkozUEd6UWIvcFp6QUZhNnA3VkVjYTNi?=
 =?utf-8?B?ZDZJUnVFWHkyZ01FQXdOOWtEdXpUUlB4T3lCU0ZGY3hZc2UyQUdlUEp0WnIy?=
 =?utf-8?B?RGVYVXRueENIbTZYZmc0bXQwNnBvRzFsV3drMTlpQnhmbUNhQmlLUE03aGo5?=
 =?utf-8?B?RW5VQVBWQWhVRW1oQW5JOVdFQ0I0QUxlTHJOTTlSWVlUSkhrM3Y1MTc4TUpB?=
 =?utf-8?B?ekh4M2VCMTN1R3FDNnpSaGRuclpFRUJGYVUySUx3ZnpVc1BnaUhiZ2NGcGc2?=
 =?utf-8?B?ZGw4eFRTZWlJUnhJZDdlY1YydWFTZWdDQlAzVlJzdUZDdWdzZHk0bmdOVjhv?=
 =?utf-8?B?SXFWcy9xcXBvTDBxYjV6RGdyZWE4VXpZNlM3aE8ra3pLK1V0NXlzYVZPNnd5?=
 =?utf-8?B?Snk2Y25QWlVVNmIycFdIVzhHVVlUQWFjc1JhSXZDbmFWVFJqTlhodXZtNVVu?=
 =?utf-8?B?UzBENjd0THR4RWE5ekFiUDZLanF4ckk0NW1TZFgvUGJsRDVsMURjcVMrcG1X?=
 =?utf-8?B?R1VyaDRlNWxXWnZ5QnpTMEZsYkdKc0UvNzdqMFcyRlFGWkYyQS9rS3Eva0tF?=
 =?utf-8?B?UFhTOVoyQS9oR0xjM0JZTmJvSExBNnduZmRMTDRwcjdFdkpNRkhLdDhpQkJz?=
 =?utf-8?B?VEdYVkhwWUUvbjdPdUl3RW0wYUpIaER3VENYREc2UUYxN0lDZHdlVXNXbjJ0?=
 =?utf-8?B?dWxYT0oyTVVLV1YyNlJIaXJ0Y01jbkFhTG93Ym80cm5jczFEUGt4YndTTGRT?=
 =?utf-8?B?dW85MzZuRnhsVXl0UkM2Ykk1WnZlNW0ybERzM2tTOGZlMG05Tk51ZW95Q01X?=
 =?utf-8?B?K2ZpRWRJVTRQVFIrcWV1QzRwYnkrTXR1ZktuWXgraTdjSEN0bm8yM0NhVHht?=
 =?utf-8?B?SU5pRVJmaE9kVDN0TytXdnVIaERDTlNDR3JleCtMYS9KeW1iUVBYTzVsZ0tj?=
 =?utf-8?B?SHhpWW1aZTBoY0UvVjNQRGlzcUtHZ01hRlFjQWdVZm5jN2pKZVdIRkxudmti?=
 =?utf-8?B?c3RSS3FRa3pMQWd4b3lPVTg2MDJuN2xTendyYnVNRlJnSUw4MU84Q1lJYVhZ?=
 =?utf-8?B?c2pKakRxdklkanY5L1pxQUcrZEhIeUFhVzhwODhPL0l5S2N4V05NYXU4ZDNS?=
 =?utf-8?B?bGRFanM5QzZYenByb29aY0xhc0NwYWlFYVdrd0hsY2FTOUN4WXpHRHE5b3Rl?=
 =?utf-8?B?aHB0MWloQ2NqRWEyNmt4bS9MckJjc0JDaWtsZGdHeXQrNzNRQkRaTkRrajl6?=
 =?utf-8?B?RXMvVVNUc3BTT2hHQ05sNng0T0ZTdGl3bk1SNGYzRjFuVCtxc3N4RnFBWjcr?=
 =?utf-8?B?ZklsZzZhQ0tRQXhaQlhNRDJiNVo1MTFSbkEzYjUrRVFXcHVManV3bitVNGIv?=
 =?utf-8?B?K2JJWUF0NzR6WFhDU09EbUxpRmc1VFpHZjc3eG96U0Q1bnhUNDJDc1U5aDcv?=
 =?utf-8?B?QzhQeVVWUWZ4eEhxYXJoRVpLODFoTWg5VWI5b1Flc0xWbHAxeWxiQlRNVE54?=
 =?utf-8?B?aG9zRTJqTDNFT0tqVUllelBxMnNaOTc1VjZZNzNMUVlWWVlMY0lETVovZThB?=
 =?utf-8?B?TmppS2x5dUtqUG9RemY4dk5mbGxOSlRoZk1WU2h3TGV6YW1haTFTU0E5ZmE3?=
 =?utf-8?B?RUJ1VzUxR2dsRy9MK3Nvblkrb25CdnRJNDdTczFHM0FlY1FCa3h0M3ZCLy9s?=
 =?utf-8?B?djNkRWZIRjBqWmw1ZTVWbVh1ODNGeDVBZUVmVWpHQzVSemJTbzZqQ0pCY2hs?=
 =?utf-8?B?cXluQ2cxczJ6bjdENWdVV3NWQ0d1S2Frb2o2c1N1ZFlLd2hVQTVId3dNRmFX?=
 =?utf-8?B?TzNjWDY5L3EreTAwNlNuQkJXb28xMkppTGNlcnZZbGNOMWRMMzFKYUhIZVlJ?=
 =?utf-8?B?WEhBeThpZks1UldFblZOV1B0a1FGTjM1OU1JVGIwYlZJVlBGZlE0aWUyTnl4?=
 =?utf-8?B?aEViWjZZQmxEb3drS1VWTGlwaEREWEpydXpOZlpqZTBOd0dxRE13WitpRTZu?=
 =?utf-8?B?MEYrOXlmRW5wNUFsYlRjMERJbXR6NmQvbHNHZnR6SXVUNnVVRmh0SWh1a1F6?=
 =?utf-8?Q?ZQLRhDWIsjeesbQkeHwoVzRiC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d5cd98-9959-49fe-afdb-08db9fd34083
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 10:09:47.4225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f34vjM6lSO4lioRBZmZkds08safzJ+fD3LTObubuP1+XMDqUpqVWXJxolvpJCu4aHI4Vt7oI8i+2x77S6yHB4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6819

On 18.08.2023 11:44, Andrew Cooper wrote:
> On 18/08/2023 7:50 am, Jan Beulich wrote:
>> On 17.08.2023 22:45, Andrew Cooper wrote:
>>> GCC 12 objects to pointers derived from a constant:
>>>
>>>   util.c: In function 'find_rsdp':
>>>   util.c:429:16: error: array subscript 0 is outside array bounds of 'uint16_t[0]' {aka 'short unsigned int[]'} [-Werror=array-bounds]
>>>     429 |     ebda_seg = *(uint16_t *)ADDR_FROM_SEG_OFF(0x40, 0xe);
>>>   cc1: all warnings being treated as errors
>>>
>> Yet supposedly the bug was fixed in 12.1 (and the fix also backported to
>> 11.3). Did you spot anything in ADDR_FROM_SEG_OFF() and this particular
>> use of it that is different from the patterns mentioned in that bug?
> 
> $ gcc --version
> gcc (GCC) 12.2.1 20221121
> 
> At a guess, only a partial fix was backported into 12.1.  AIUI, it was
> an area of logic which had already seen significant development in 13
> before the behaviour was reverted.

Hmm, for 12 I didn't think there was any backporting involved.

> The only thing interesting about ADDR_FROM_SEG_OFF() is the constant
> folding required for the expression to become *(uint16_t *)0x40e, which
> (I suspect) is why it compiles fine at -Og but fails at -O2.

Oh, the relevant aspect may be that is is below 4k (which I think is
their heuristic offset to guess "almost NULL" dereferencing).

>>> This is a GCC bug, but work around it rather than turning array-bounds
>>> checking off generally.
>> I certainly agree here. I guess it's not worth trying to restrict the
>> workaround for rombios (I will want to try doing so in the hypervisor).
> 
> Can I translate this to an ack?

You can now:
Acked-by: Jan Beulich <jbeulich@suse.com>

I wanted to at least have a vague idea of why this fails with gcc12,
when I thought it shouldn't. In light of the 4k aspect maybe the bug
reference wants adjusting / dropping.

Jan

