Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B88065D0A2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 11:27:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471101.730810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD0zB-0000ea-A9; Wed, 04 Jan 2023 10:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471101.730810; Wed, 04 Jan 2023 10:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD0zB-0000cd-76; Wed, 04 Jan 2023 10:27:05 +0000
Received: by outflank-mailman (input) for mailman id 471101;
 Wed, 04 Jan 2023 10:27:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+XhT=5B=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pD0z9-0000cS-SM
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 10:27:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 542d4b2a-8c1a-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 11:27:02 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8074.eurprd04.prod.outlook.com (2603:10a6:10:24a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 10:27:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 10:27:01 +0000
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
X-Inumbo-ID: 542d4b2a-8c1a-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mslr9fnSh/7Xy49QUClU2PK1DtCoL+fyNGTnyc3WBjM4CazDLIfG5q8k7EqquoC043UoixidCnHlCNDC3QQZcGwHuiqN99Xx4TYvdmyl+0qjYC1nRUXhlQzqxaA9fiYr76uEE4yn+WF7iLl+jKmnJlOFmcxG2e9PXrEhmV6a7Y1lx1IG8Y/cmdBQ7wYT7tIEgBcPGRQzsRM2lmtv/6SQIIRCkyD8U1e9L9YXP1fh1RivI1c4AmbCuXcIYXVp9hnlJOu4hapIrjSV4VInoTm+++IZwnTAidneYfL9whOw8vTd3h69cxkKQI7C/um/DGed2UxQ+5BvApUuXA3TPkUzdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tx015fr3bjIhPCp331DUzfxXuxihO+fi9PQYrtpxUYk=;
 b=btmbypBYR+HPRjanODVX7MV6/8K4CUqg9ST+eVHpol9qCKipmW/Hn+Iyk8zIBU7T6DDCl8H6tPem1c5EktjMhn+EnLvjgTf7uppRT5ZvdRxP/raaVEFkl7/D1Fab3Ap5yvYLXKxG7zjD7NgNUUdSAdFzkwoaqV/K3yTSio9gFSOPjMyhO1mkgWf1QDZeIS/hUWWzeeh+PBwp+BDuL5Evnsn4rmR6in2s2QO8fBK4ogcVp3IOrYcWIJCuN/sSICqAdpGs0Omi+Hp7mBQ358kNR1Kx5hRbqIiMIozp5S9I6GDnVUgwu5g/YWPDEBnWFYyXVJBCdDJLjfDD95BJIP1XmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tx015fr3bjIhPCp331DUzfxXuxihO+fi9PQYrtpxUYk=;
 b=5jTSAepkHFrBJXxUZjb4a1iM44PJAXD+7iIrku5nIyN4SygtTuXeXSXsWtPZqy1SOWi391CIf+oIqt7EfQITFQnF+gCXT5FCcWRBFsxIPmnAo/UzQodS+1Gv3aioFse/VhiI/FOH5UPyRbggWUBFDLWSmRyi+B95G0cxlDC5BnJKoSB6LPSm2Lgm4iTcGXMazFJXeO1DaclAWdwZEW61El2TcEMh00GHjkKrrIqcEcYuXJCE3ykd0/yutgcomOLwGbpZcwMEeC0WhKmIrBtMP+w8l0rxrtsDqU0vMUljQtnZMZxOCC5pO6XWOtjSZGSopbiVMTgCBZVtVxNGhbWAig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <01584e11-36ca-7836-85ad-bba9351af46e@suse.com>
Date: Wed, 4 Jan 2023 11:27:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 06/22] x86: map/unmap pages in restore_all_guests
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-7-julien@xen.org>
 <478e04bc-6ff7-de01-dfb9-55d579228152@suse.com>
 <f84d30cb-e743-60f8-a496-603323b79f37@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f84d30cb-e743-60f8-a496-603323b79f37@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f95ef90-8dd0-497e-51d9-08daee3e3784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T+1yW+o7Qnjt+lVjetaPFSzisAz8qBiQDidy1G0vpDD/eRo7poUU2Z4K/hNCWAhTxF73b/Zl91YZNYlDxruEwmxecrt4cNUhrNR54Oic4zk9o8LLkbH3iRIdI48EODsq5hqnrLm/A4rahEmpEvlz6p8bGfNsWxemA/nodo8Di7qt8re8bf9DNCBOIq0XNOowRSAPEQiehDggBlvtPUZuAzUspmIeGaxOds/tEW02r/WYMT6/io8ao4zikMBusE4TthwTBaSKZ8dNjivQEBM+tfzCSPLp4Z9rjddOBL7Blp1QkUzkWyKtJsMOwp4TAiqsyfJbB1AemxUO9/44+uh32ceBKJ7awlbvtHLmKONRJqu6aNChEpLHxPwd6SyHsOpC7in34zGKxmdRl36D/6EqngDzytyJ7G+MZsv9Irh/ZgONnCPRFs1yg83UKmPt7kDUbmK/uCCESvZrPBh7ZfUIZsPA1SQEVG3Ln7hn0qzmYlR9d2sZBVbOMtTtbSmYslgXwQB/FY96/OO1HWgN8jLkozoiz12mKlqRcDlIVTSEwp2K4J2e6UxT70IJxe0WU4E02dI3SnWUURubu9uz23u0N/Kfo7YyelcOZDRd3GNcF2Q+0h6Vp2+ICLkc84hzJNcVxHnm+l+4FiXb4MIEcyF7MMjHQn5mxnReHXRzM8V2ObK02KzNX0aL1P3R4BcNPmPG9haQPdJkI2al+PCwk4Uwj798xA96ewCSwpMR/foT1tk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(83380400001)(53546011)(26005)(2616005)(6506007)(6512007)(186003)(31696002)(36756003)(86362001)(38100700002)(8676002)(4326008)(41300700001)(2906002)(5660300002)(8936002)(31686004)(6486002)(478600001)(66946007)(316002)(66556008)(66476007)(54906003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlpldnlueFo2WktUcGQwMGdYWHJoK2xIcVhhemFQSzh5TndNRWZoY281cldF?=
 =?utf-8?B?S05BS0xYeTg5ZEp3cUlxeld6d3Q0blBFalZZK2JhRCtHaHRUdlczRnZmcXdk?=
 =?utf-8?B?ekFpbnpaUXQyU3RIeU1jZGF5WmN5bTRVZVg0NzlwMklSQlVpeThTRVdYWDU3?=
 =?utf-8?B?Rm5lTWF5cVl3aFZ5L3ZFOGZSK1ZiWVJQNTBzc2lQUFZWeW5zTzlCV3FMU242?=
 =?utf-8?B?ZEVmbnNmR1N3RWJQY2FpU3U3RUlIS3pYYWVGWi9uWGJ3SkoyYWp4VUg1UHVr?=
 =?utf-8?B?cjc2akJsN3oreUlzampQOE5sUGYvSS9PWmhnUlRIVkI5emtrZHhJU0xaeWk1?=
 =?utf-8?B?ejVRUEZveGRLUGw1TGloUzJpb20yV1NJWVVEUUFsOVhzRi9OcUwyUE5EUDZr?=
 =?utf-8?B?QTIwbFB0OHpFTkkxczlCdFd5SEd3d2hXNCs1dWpCRHAxNWRRVVNkVENmYWZl?=
 =?utf-8?B?aDVtVWpYWVNoaWRySVl5a2lOYlZMRnhHUFFCcHhpYjhiSkMvV1dvTzdxV3d0?=
 =?utf-8?B?c3lsbnhWdDljdGlvZncvOVEySTZqZ1hOUTJmSTh1QlVCY2RKWjkyQUFLL1NX?=
 =?utf-8?B?eEp3QWdBUkNOVGQyRUxhL09MQjFSWUJiQXVFY2Y0bkhLVzR4Qk5ZTXR5dXJh?=
 =?utf-8?B?aFNJMHlVb3Bxb1M1VkZSL2c2Nlg1K2M1a2Y3OEc5UWYvSHhUbGxxSktVNlR1?=
 =?utf-8?B?a3JKVkxQaFFWYzdDNVhtMTJ0eEhaYjdJc09pb05yZnZkZ0l0OWpYVG9mQ1ZQ?=
 =?utf-8?B?b1lDVVpIeW5aWVcvbFU2WFRLbm5DSmNDNUIrUzd6T3BlR09TWU1tOGZWOFlY?=
 =?utf-8?B?cHNJU2NjL1lUS3FFVjVVNzFBMEkwV2l3V2RxSlZWMVUxVUNyZkptUm5zckk2?=
 =?utf-8?B?elNtdjFiQTRSZWVaRzFqYTZLYkgrdXJhSmRuK2lqRjREZGhNemszWUZZSmls?=
 =?utf-8?B?MWMwL3FQUEQ2ZVFTeXNPclFtNUVKOTNEcmVTYVlDQTVVYzByUTB4R0J4dDFG?=
 =?utf-8?B?NVNZMzlHc05QY2pGNDlnTU9LTGZQQjB2enFaVHVDdGx6Ly9zOFhFQ3QvT0Jo?=
 =?utf-8?B?Z1QxU3l3cTBueVlqS2xZWm1rUlJ3eEs5UTk5aHZEaTAvY2c2NlZKbk1XSFc4?=
 =?utf-8?B?M0Q0MUVqcGdPUVBQSkdCWE5WeTRiWDIyazJiU1VxOElaalJFbnVSSTFpV0xv?=
 =?utf-8?B?U3FQODNRTEFvRVZJb1FrSHo4SllFbFFzVkh0WjVIVTNBWnRUVkw5WmpGY3dl?=
 =?utf-8?B?OVZXWUNzOFBrMDhua2x2Y2xiWnBuZTRkcVQzdzlLS2k0bEEzYTcraEpIcDFz?=
 =?utf-8?B?VU01S0hTbkF5Z0JwTHRzckxka0NyR2FpWE5UemxFd3ZjKzdFUzJKQUp0cUdq?=
 =?utf-8?B?amxnRERSOXo1K2k1aTFZUHVja3FyY2NSbTRZMjRibGNUa0JDNktMUDd0L2tS?=
 =?utf-8?B?WkFVazBoQTFaMU9YQTV5QjlucmxqSWZwa1NIMVZEeWVzeGlIZ0Z3K1VHOW9r?=
 =?utf-8?B?ejR2K0x0eFFieUlpTFh5c3pmRnBrb0lkbEMvNEtmOWpNT3ZrcUxYUlJxRFBP?=
 =?utf-8?B?eFRmcGJSQkZYcHIrUUZsUVNOcGlJbWhjQzJQZlZPSHh4OXVVLzNNNTBid2Q1?=
 =?utf-8?B?MlBwVXpDRHBKTXhwb01vUWxyQnFsa0wyUWVRSU1zaEEzeGdkelNQb2tsZU9m?=
 =?utf-8?B?bkJPdW42Vzh5Mm1UaHNIZVpIYmZpbDFucEtGTXc1U3JZemNrWmtvR054Y01P?=
 =?utf-8?B?YTBtREwzU0xBWnZFcnlsYWI1TTBpYWt6RUFpZHB1ZE81aU5XZllNOUxxZ01G?=
 =?utf-8?B?UUM1eVNaME8vRTdkdG1OanFlYzVuM1R0MSsvWjRwZno5NnZkenVIV1Y2N3RM?=
 =?utf-8?B?Uks0RlZPbXF0ZXptWXJaVzlCSEY0bzIwalZJWldleXRLcmMvS1ZjeWJTaWRZ?=
 =?utf-8?B?eWx1b3UrMEY3VVBJNWlzbWFlNFFheFdIVUlhVG9IQy9mSnVWanRZRkw1S3ZY?=
 =?utf-8?B?ZURtSktucGI2dmdtYXF2NVBESTdxL2JyOHZxWW9TWUNZcnVad3hwRmlaRWhi?=
 =?utf-8?B?NGswRjRFcEs5QnB4SWlIcWVqVGNXcDBXeE1MQjA1aXdiTGI5a00razZvNXNm?=
 =?utf-8?Q?kK2ew9qPQzqhfvlNL8ZUWwoF2?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f95ef90-8dd0-497e-51d9-08daee3e3784
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 10:27:01.4241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2vgT1tWJOGUkUJou7l9W4T6VnhB2tFoQlaAmvc6CJXjSgwOHCAkCP4l53SYaNJOv+Pph592ydMm4TaAlmRmWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8074

On 23.12.2022 13:22, Julien Grall wrote:
> Hi,
> 
> On 22/12/2022 11:12, Jan Beulich wrote:
>> On 16.12.2022 12:48, Julien Grall wrote:
>>> --- a/xen/arch/x86/x86_64/entry.S
>>> +++ b/xen/arch/x86/x86_64/entry.S
>>> @@ -165,7 +165,24 @@ restore_all_guest:
>>>           and   %rsi, %rdi
>>>           and   %r9, %rsi
>>>           add   %rcx, %rdi
>>> -        add   %rcx, %rsi
>>> +
>>> +         /*
>>> +          * Without a direct map, we have to map first before copying. We only
>>> +          * need to map the guest root table but not the per-CPU root_pgt,
>>> +          * because the latter is still a xenheap page.
>>> +          */
>>> +        pushq %r9
>>> +        pushq %rdx
>>> +        pushq %rax
>>> +        pushq %rdi
>>> +        mov   %rsi, %rdi
>>> +        shr   $PAGE_SHIFT, %rdi
>>> +        callq map_domain_page
>>> +        mov   %rax, %rsi
>>> +        popq  %rdi
>>> +        /* Stash the pointer for unmapping later. */
>>> +        pushq %rax
>>> +
>>>           mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
>>>           mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
>>>           mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
>>> @@ -177,6 +194,14 @@ restore_all_guest:
>>>           sub   $(ROOT_PAGETABLE_FIRST_XEN_SLOT - \
>>>                   ROOT_PAGETABLE_LAST_XEN_SLOT - 1) * 8, %rdi
>>>           rep movsq
>>> +
>>> +        /* Unmap the page. */
>>> +        popq  %rdi
>>> +        callq unmap_domain_page
>>> +        popq  %rax
>>> +        popq  %rdx
>>> +        popq  %r9
>>
>> While the PUSH/POP are part of what I dislike here, I think this wants
>> doing differently: Establish a mapping when putting in place a new guest
>> page table, and use the pointer here. This could be a new per-domain
>> mapping, to limit its visibility.
> 
> I have looked at a per-domain approach and this looks way more complex 
> than the few concise lines here (not mentioning the extra amount of 
> memory).

Yes, I do understand that would be a more intrusive change.

> So I am not convinced this is worth the effort here.
> 
> I don't have an other approach in mind. So are you disliking this 
> approach to the point this will be nacked?

I guess I wouldn't nack it, but I also wouldn't provide an ack. I'm curious
what Andrew or Roger think here...

Jan

