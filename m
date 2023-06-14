Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EE37302C4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 17:05:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548926.857165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9S3q-0004fV-Vs; Wed, 14 Jun 2023 15:05:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548926.857165; Wed, 14 Jun 2023 15:05:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9S3q-0004dC-Sk; Wed, 14 Jun 2023 15:05:26 +0000
Received: by outflank-mailman (input) for mailman id 548926;
 Wed, 14 Jun 2023 15:05:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9S3p-0004d1-C0
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 15:05:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on061d.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2c81e20-0ac4-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 17:05:23 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8506.eurprd04.prod.outlook.com (2603:10a6:20b:431::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 15:05:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 15:05:19 +0000
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
X-Inumbo-ID: e2c81e20-0ac4-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBh75qghp+5CWCBmv0xt6Psy4vsw3xe2pJSRPuAH1rVGV1JD/JNOQLRvxMMzutTer/puPjROKgstdZmrUvnE9uHCqzbgfrpawujMBLqDaIJE4YfMYsFb3fqppxEzHx+5LFRRXiHWshnveZD1mC3e8ip1mOeEAb5wH1yq06QbEf0esK7fLraayawu1T5uzsiuiDXkPR+OOcYLWoRYWpmpxIezQ72bhmkVulYa5gubIshpkgeXf11VLm0ZuelRD3/tkEDrG3Trbbm01nOrMKeOTAezqtlqPiYrrC1HcJXr9kQWbXOy4vefBmTKzj9/QBoBllXb1MCSZp5g5GJbXIbKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY0fDI1COrRAPItFK+DtKq5z44jVdpW5FeMRvsr/wGY=;
 b=ag881cgLObosxLOZIB+We69bNjkZB5yH9hSFVpu3oa/jdGQxsx+kIFogTmseTXoNHWsw0LJUcP3IeSLgaIMeVl/nuNJlJ/zRhP+Nf0XnZ5FIvW+6efI5ubnzdxtHIEEJDISDKv6SJvjoitjz567P/gHSHNWUuLwA3lawFDyKCm5UuNr8V8W8M/MxRaI215fLLAOEFmNi9du4LfdHvZr5neBdbea2E5xRTYJghXTfG4PO1zGFFwn+xJKB898f/fYjKr6ym4MxT6syrV4ZmFoVfxR0b21W3qw4BxRazAYYowLVlwOt2RIiYnpTcZNdNBQKW0KiHv0kdmo6B5oEQ1rbVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LY0fDI1COrRAPItFK+DtKq5z44jVdpW5FeMRvsr/wGY=;
 b=KYMXA143jQTiL1LDw1oAr6iNos79eTBOoVzpS/mvLWci78j15tveigYw58u3mN2qi7zI35ffEsPYK5Sei11WLALvNCwo/tGwCUsAtMOEt72ZvwQXYS0U8B9MRkS7/Fokpuv/awF3xOn8Lonnm38wjpbYK7Lw2Q4FuiA0BO7boeKdOxlkmSVffkivvPZp1pGwNrGqK0zyv4h4EHLodloogh+Zn5uBf5M/AS763ivMPx/dfRgq5yGu+LiU0dQOdovtmy/dzP/MdcJYhqSrsUjT/XXSipDNL3jzP/JPxIrAg9nb7ESRmdgyZeUoHDeiXZFERlrvw17khBCrU+RRkGssjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6bac57d5-c30e-f763-3abe-b3f335f366f7@suse.com>
Date: Wed, 14 Jun 2023 17:05:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] xen: fixed violations of MISRA C:2012 Rule 3.1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <e139df541183df7c92b3bd73841cf1fb2851e054.1686575613.git.nicola.vetrini@bugseng.com>
 <ed434d9d-3baa-0b8c-2882-df9841564a58@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ed434d9d-3baa-0b8c-2882-df9841564a58@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8506:EE_
X-MS-Office365-Filtering-Correlation-Id: 02df30b9-5325-4e32-cb3b-08db6ce8c4a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WhtzvtoEl/gBNLWuUOfsiCi2z0gscLONB+aIIilFHlMaFAeFL5uZ2L1V16dJrQkRrJUEaLtgCGqdryMdEiXZ9Mgwd6kGsicG6lpUZvVtjZ8+rWyCMvGYlDRadUS9X/y7p9pWxK98bZ3P++6gHMJBo15vUrHp+0t893AMUFidpGagbFOAq4FXIwbNrr4BpP9KjkiZ5vtdxjo/S1+DKcN+eG3rIAWRFKPdPZ94OIHykgowEDIWOhxTDZqLpvxHGAyVP07NkrEKviH8vpfi0r9sycxMZIrBBFRL6Q+/NCb9P0JJKnl591gbUFWFrKcEZdsD/uv+1U3K+dJ4R5JlSibqz8rkk/87yjSS2PJE+Kb2XrJs3BCDmawM6G6ZUTqYYwGQ8JKXbmuMc/jfKTFM9CLBG2nmlCg64hzV3KZJqDBgJSF7h7vMRud3R5MOrdvcBbL9gJ49/NyfDx4geXMaV+J1ZDV3J4G4NW2iKvvtOpXKylR0x1hs1krtFo22bKA1YLrW02qa3GJnRYy31MkwiW3WASGR1k2ZBfo43lG+g4Tv/4FR1gVXD2Ov1qOgG6QYYbQ1hpAJPvKcYguDlRZ/WPrpQ/Zn5V0HROKOePRUZM+hO/lQRehNfE4tWqChIazd4ss0M4+ivkqXZBMYEVw3Sed98Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(366004)(39860400002)(346002)(451199021)(8936002)(6486002)(26005)(8676002)(6512007)(41300700001)(38100700002)(36756003)(478600001)(86362001)(66946007)(6916009)(4326008)(66476007)(66556008)(31696002)(316002)(54906003)(6666004)(53546011)(6506007)(5660300002)(83380400001)(186003)(2616005)(7416002)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVZQQ3h6N0pKVHlySTV5S1U1Nm9vTlpNaFRIY0VrR3k2N0NPZS8zVzRjcGVK?=
 =?utf-8?B?T3U0MksvbC9YWU5TWGYxVXo1RlJyMnYrRGRiU3hxZkR5Q3Zsa3NSSExYUVg4?=
 =?utf-8?B?MFFYQmhVNXBjRnFmY2x0R1V4dmdKWDg5S1k0MGZVYnR0anNBY3RrbUxuVysz?=
 =?utf-8?B?cmlwZkZWcGY3VTNkNUxEODhqckhoTjNTdVovREtQUE1zTStVOWR3cnI4NHVT?=
 =?utf-8?B?Q0txT093Q3FROE5nNGJ2a2g5Z2YwYlQ3RTJRZVVrOGR6Z2Z4bXBzM24reEl5?=
 =?utf-8?B?MWszMWc0dEhUMCthREUxVVJ6N3hYaWF2b1VsUzhER1NidXlnL0ppQVc3eUI3?=
 =?utf-8?B?NVR4MGhFVGkxL2VLQy8zZHhsM1FJSXgvaDlpb1hsM213a2FLWDJpY2NLLzZW?=
 =?utf-8?B?RTlxbnpvY2JtVE5WclNNQndiaG45dEc3bzJVOGw1SXc4dElkVytPRmdQZDdC?=
 =?utf-8?B?V1BwMjdMOUdKMVBhU1pVdTBIOXdEMGxEb2tIb0hsZU1FbmpyUFl5WDYzM1ZS?=
 =?utf-8?B?NkVhUlk4T29rdGVZdVBEQ2FUNFljWXFoa2JCKyt0MThJckp6YkE1cDRxc2VF?=
 =?utf-8?B?a0IzeGFPcWpXL0tCQ1dDVVQyMkJOZ2dOSUxvOVgrelF4MW85MzI4TG5NcHlk?=
 =?utf-8?B?MStlQ2FEWmRHYnowZ0lsdlZWSUQ4cHcrdXJEZVdTcG1sZkNOY0M4Q0R3eEIx?=
 =?utf-8?B?dmh5NXVaMUZRRGgxMWJTWFZ5Zjh2VUxid1A0SWVhMzJRNzVIZzR3bXdqaXgr?=
 =?utf-8?B?T3dsS1JXSDVYVE5MWDVnUDQvc09JdHRKaUV3L3JOMVZRUnJVb2JaTUZ1UWZ5?=
 =?utf-8?B?d3NxRVZ6TXJ5ejNUMWo5RDhuby80K2VzclZ6UWVFaHVpZExML3ZueCtvSWZw?=
 =?utf-8?B?TS9Jdmw0SDJlZTNtay9UL25DMzUwTmNSeHdhYzNqNkNIV01xSlExeTJuT3l1?=
 =?utf-8?B?OUhZTnNaUUxoSEVRbUhrNitWeDRRS01DbGs5MFlnUVBTb3BvTUJkN1BNMDJt?=
 =?utf-8?B?Qkl6Tmh2Qll2MHdzUEhoTVoyemU2QmZvL01sVjJFMzlXN3JOcWNyV1hEaFR4?=
 =?utf-8?B?RFJ2V1Vranh6NUF3cStMZFhCenNINTVYVnQvWDgwdEt0Y29mcFBUWGVadC93?=
 =?utf-8?B?dll4Lzgyc3BrU0poQlZWcktYNEIrUWZ3a1UycU5WaXF4dFpBelA5TzErVmdV?=
 =?utf-8?B?djE4VDNKNERCa3d5ZXNFeVNKMnZEQWhLMlJhbE1RYVUrNnBOaTIramhBMGNT?=
 =?utf-8?B?bVNEUy83dWRRMkx1aFR0b1QvQnpSMDdKRnAydElRcGFDYklsenZyN0U0UXY2?=
 =?utf-8?B?V2dJQ3RjRlV1bVo0VXBCSVpUd2IrZjZIa1A2c1M3MW13ZGZsQWtUZUZESUd2?=
 =?utf-8?B?Sjh1K09YL2tTQ1AweEZrdDBTVllRcWQwV0FqQ0VDaHJlVVFIUG9NVkZkMW43?=
 =?utf-8?B?aHZxZzdMMEhsUm83cjM3VVpmeGROUTNjTFJYMmRrdVFYQnZoOStXQzFPWURs?=
 =?utf-8?B?cDgwaFppS3dmcGEvR3M3aTlzWlByUkhRT0ZjRFRQOXBsaExldXlTaUl4UFhG?=
 =?utf-8?B?K085MzcraVNNd3FReUhRWVphUEMzL2FUaDlPbndJWksxOFptUGdKMWxQSzE3?=
 =?utf-8?B?Q3I3SkhIVi9jZDJKZGVVM0Y0bmhJWmVkdjZ2cHRhVFplVWhUb2dhVkxiWjJ1?=
 =?utf-8?B?cDBOa1pOQkhtL0pYcE5PMmFGckdwT1NDa2ZmRGxZVmo4Q1MzL0cwazN2alNS?=
 =?utf-8?B?aWovcXBhUnl6OVZ4Z1J3bXFhT2g3V0xtZHRWWll6akhWeE1JamphdkNVSHJl?=
 =?utf-8?B?UEs4TGY1VCtJZ3ZLVjBZM0NFV3JhOEhSOEs2VTMwN20vSENIaHpDQVV5NmFV?=
 =?utf-8?B?aUdtQ01zWUwrbE4zWGxDck84bWtKWnBTcVp5eXF3UnR4VFF6ajNOZkJuNEJq?=
 =?utf-8?B?RjFHZWY0MnhIZ2hjSjRudHJGa0dxVlZSMWUwTU93Wi9hT3JpMkdoSXA3TG5z?=
 =?utf-8?B?M2VNMFdhcUxwd1V5ckhEZ2dCRDFsWVBwQlVqQk5CWVY0dnB5ZmVBRDhjYjVs?=
 =?utf-8?B?SktobWVrdVU1WTdLUWt3U2VsdWpIcXhjanpkd3JCR2RBQkFISWRRbjU5WmJR?=
 =?utf-8?Q?mZCdd57Q3ObCszk/0oFGpFZYm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02df30b9-5325-4e32-cb3b-08db6ce8c4a4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 15:05:19.1803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K5ie2tnsAlRjj5KBUIOI/w/g+6i+t1tlshYwqaR5a/YW6KwsIjRdCvF65a8O6hrOfYVuIkX4Ks2IXyV5dfeizA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8506

On 14.06.2023 16:28, Andrew Cooper wrote:
> On 13/06/2023 8:42 am, Nicola Vetrini wrote:
>> diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
>> index 75bdf18c4e..ea6ec47a59 100644
>> --- a/xen/common/xmalloc_tlsf.c
>> +++ b/xen/common/xmalloc_tlsf.c
>> @@ -140,9 +140,10 @@ static inline void MAPPING_SEARCH(unsigned long *r, int *fl, int *sl)
>>          *fl = flsl(*r) - 1;
>>          *sl = (*r >> (*fl - MAX_LOG2_SLI)) - MAX_SLI;
>>          *fl -= FLI_OFFSET;
>> -        /*if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>> -         *fl = *sl = 0;
>> -         */
>> +#if 0
>> +        if ((*fl -= FLI_OFFSET) < 0) // FL will be always >0!
>> +        fl = *sl = 0;
>> +#endif
>>          *r &= ~t;
>>      }
>>  }
> 
> This logic has been commented out right from it's introduction in c/s
> 9736b76d829b2d in 2008, and never touched since.
> 
> I think it can safely be deleted, and not placed inside an #if 0.

I have to admit that I wouldn't be happy with deleting without any
replacement. Instead of the commented out code, how about instead
having ASSERT(*fl >= 0)? (What isn't clear to me is whether the
commented out code is actually meant to replace the earlier line,
rather than (optionally) be there in addition - at least it very
much looks like so. With such an uncertainty I'd be further
inclined to not remove what's there.)

Jan

