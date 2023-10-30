Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 098FE7DB9AF
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 13:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625067.973943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxR86-0005g8-T3; Mon, 30 Oct 2023 12:12:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625067.973943; Mon, 30 Oct 2023 12:12:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxR86-0005dz-Q2; Mon, 30 Oct 2023 12:12:26 +0000
Received: by outflank-mailman (input) for mailman id 625067;
 Mon, 30 Oct 2023 12:12:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hhfi=GM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxR84-0005cM-HS
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 12:12:24 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe12::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94c8c32c-771d-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 13:12:23 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7961.eurprd04.prod.outlook.com (2603:10a6:10:1ee::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Mon, 30 Oct
 2023 12:12:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Mon, 30 Oct 2023
 12:12:21 +0000
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
X-Inumbo-ID: 94c8c32c-771d-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQUzbq941PQiyaaw/9yRR/NICJ8+B1/68fAklNEb/K3JOXlMdLTtgZxMTvbfhBOdYL+hkAWWy8pChaqt+VhB7vDS3xmS61jNLSL5gWL6zjHXCeu4HEEdUrh5EFrUPUfgTYlWJAsjVGjzXZva34120OB6axwVlEs+iVVJcGot9gd8fZAiGSrdqKRvXY+OuB7IG3Z+gGNEIkRFH0NK3bKP8GjFZdwfTaSn4mOKTcdYikJxrKA1VYw/gV/M8Dxsaadgj4QpH7K5Efn8bnhtiqt3sonqY4fqj8eGkBwDNmyshcO0v3O9vmX9hICKptjnolVhyywhcRo1w7K78r65olPcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHxJBS9g4VPvxUGnG/f4KLJN1mHF0ajstqPxa/WEU30=;
 b=a7yRk26TXDCsCB6KppsIhvSjRiRgwVR7zgg+rOx+Xh3qotQ540R3xb5h0x3UucBKXgBtlvzvXomIgN0iqsaTiRzoOm22JeXG7UV94ITf4r3dFx5vQ9QboyZ2Zjdq0nnzCxhTMh+KPqiS04vsMJUTmcCNHpic5oheRRAI7qHOKmUxhngZ9Rgi8Z3HcwL73bpBR/5BSIgwTMSDRuLhnLgNWFUBGVT0nLgfBhIJEmkhp6Hu2FQTLOIK6Xecf+kjnKHTWmr1aKmrMSq00Af9ZAuMxzORRARm7tx0aAOQ4eEecCQuAR/dlKhSlZWaH1I5iyoYpEhXsnQ3QLLxFr5Se/TIdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHxJBS9g4VPvxUGnG/f4KLJN1mHF0ajstqPxa/WEU30=;
 b=Atp2ZYxsTKqmyhNjiMe5rbH/vP5j5Ap01uhX8yQmnYwbyR34HMq2TMRR0WHY4aEInAmBqAZUo6QWc2317FBi9G3CFj4ufAl+BgHwK1oQzya50kJ534ScsVVZwT038DMWKtyVFVL/16FX9yPbiXjJ+m9wsoqtPPNXadhT9Q7LOXl81EJaNk0EznFATCEXRoaO7nhhE+b0jJKOP9Z/LDjRzWzU8FhDLta7XFPKYrvEubVcW1xKEhef4RYXhvdoRxHOTrCCvsv3Z8xCIa42qI8s6oLcNeBjrtvKwtP/KrefQg1Y8PxIZ/yxc1FU2pmqwAvLYdHKjZ9/wLzG37dkmXB2KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e40fba96-87ec-09a7-e095-28637d112e56@suse.com>
Date: Mon, 30 Oct 2023 13:12:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] x86/hvm/dom0: fix PVH initrd and metadata placement
Content-Language: en-US
To: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20231026064543.43369-1-xenia.ragiadakou@amd.com>
 <ac7e9bac-6d74-a5bf-d703-3c5455e581ea@suse.com>
 <7712c60b-4f89-483e-89e4-7ac8f4d0311e@amd.com>
 <809115b1-2a47-583f-2d04-72a5a21ee7da@suse.com>
 <c107d63c-25a3-4f17-a5e8-7ec3ccd94ce3@amd.com>
 <c81a8275-ecfd-7598-c119-ed83b156c0e5@suse.com>
 <b5330686-82a0-4d47-9549-2d943ca68c7e@amd.com>
 <1cc98108-3328-94d3-5f8d-ff03c965087e@suse.com>
 <92ba94d2-9e57-4241-8626-33f06f88e726@amd.com>
 <a61926bc-e3e6-e381-45de-be3a4878b6af@suse.com>
 <217d9079-3072-441a-a4ba-4db28c565bc7@amd.com>
 <08ea1b7b-c85f-337a-42c4-520e40b75288@suse.com>
 <987b5b7d-57f8-4d63-bd13-fe662b6cb87f@amd.com>
 <486c778c-4a33-703f-2811-27101d10ea9b@suse.com>
 <b203d30f-1563-45b6-9469-b25dda8df9a4@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b203d30f-1563-45b6-9469-b25dda8df9a4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: f0cbbbdc-9b14-4c7e-2e68-08dbd941774a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VSA1TjHDcaHF5kxHw5cak+W8E5xrtx1RNFGhQz+iPpR+8/KMJsqCe8HtWqniH32kq498xO+h8ujcsflWdiytHEi0Qg7lVVBazll0IctkAq5fE3cQNSsGqQzoAninKDsUDHKK59Su5324HhjZKVuKA4HWMBOJsVdfA7HhdIdseZb1D8abypengQ1B2I0GyjERVY3hWnxeewl3b6dkqy+lxfSKI+hMOFhFxRniVawejVHZ+Uf6+G2+qUqBu7YQlGVisrjL12Lxk3G/tYdM/DcX3RRjKv3OT8fAtRYA/LHVTAdPDiZ/GuGoyXaDB8Nmqk1ZI66JQj2c2zDl/rINy6sDta7wuSv+B/XikhGkLj8qoQec1h4Iz/uVzyy06x0DLH4qxNv7XLSq1IvHk4WsKQ7jlU6J6zwv12sNOmJAmPj9jGjeC0xrbEkvUMzyHpKMtpUWDEPToqc96ZsskaFqixcB9g0I8EuUZultlGe4uK6eBp/Q+4sELwTVzYsKxn7/b9zTNJG2tFNsfnYe6xfPSTooOnhJqJFBzKM1hgqGh415xp/RWemXRQZ6uXbAKuHDiTRPTF+AcfMPZTIJW8rTPHcZ5EmsAB4qAxP0iGc8eSG9yRjnKkkWdCgtx1xbWp8f1ia1Ls3ykaNVNVQS6wRlCY7/8g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(54906003)(31686004)(66899024)(316002)(83380400001)(36756003)(41300700001)(86362001)(5660300002)(31696002)(2906002)(66946007)(66556008)(26005)(6486002)(38100700002)(478600001)(8936002)(4326008)(8676002)(66476007)(53546011)(6512007)(6916009)(2616005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UVZUKzVQeUdZd1phR1didWVSY1pjMzFMZ0ZuSXR4Rk1wMWJEeWdBM0tJMlB5?=
 =?utf-8?B?ZXVVemdYM3Q3dzZST042dHM4eno0ZllTTDloR3o0bkljRHhFdE8xOEszTlhs?=
 =?utf-8?B?Y1ZqM1c4aDN5TFYvOTVMQkV6cWFwWmt6YWJzenZPZVZYOSt1QXVmVDdxUmVv?=
 =?utf-8?B?Q3hVK05IaWY4RlJQUEZ3dENrZXRyYzlDaGR4aVJ4eDF1QXdDR0xZTnlUVGxq?=
 =?utf-8?B?L2pJMTRnN3h2UnYwSDRLVTJCc09QVWhtTnBaWVVzUUhwRE4rSjc0MGorcnU0?=
 =?utf-8?B?dGEwd1g1SWhDSkJBbEU1SGFXMHZ5MHpNYjB2bXhLeTBzaWc2VndSOWYvMmhr?=
 =?utf-8?B?V0JreURoVTU3ZXMwUlVkT1Vvai9jSWlnZUIrbThrdFlwZmFUSWJyVjVCb1Ex?=
 =?utf-8?B?VGhyZWVNSVV0RERSSzErMGNmdkJkcjUyaXlpUkFNdTZFTy9BdEZkbzlZRVFj?=
 =?utf-8?B?SU5sa0U3ZDdRWGc5MHFJUndwSW1QcmJWWTdvdnUzb3VUZnhmdEVnejZBb1Vj?=
 =?utf-8?B?aElzcWxLN1BiZHkycFRTWU9pUjR4N1JpUHVvSkNkWnA0RHhIenR5OTlCbXZD?=
 =?utf-8?B?TlNpK091UUxWZkxtWGFQb0t3TjNEallBbmYzSzJyOUE3RzYrVDRteWdXQVlu?=
 =?utf-8?B?NGZzZTNhL2gvdTllSk11anhBOVJla1JDY3ZrMGVEQ2l2ZHhBbWc3Y2pTRjJr?=
 =?utf-8?B?dWhqWmFDc1lzYzJpY1JJSkhHWFpZdEM2ZUEvN0ZPQ1dxUGgxRUplYythaWhU?=
 =?utf-8?B?WnpXS0UveXd6WFFHUkFZTWVRdVY4d3c4NzBJL2FBd3RqTXBIQW1HVFZJeXRW?=
 =?utf-8?B?TGlYakVUL3dSQVZBNnRTZDQyTCtkd3lUUzRMNnd4V2FUV3djRmEvS3lMcXJ3?=
 =?utf-8?B?NEJ0SWhCZlVBT1NXdGlRWXVGRU9sQWpEbGxIZ09CdmY3bzZQUmZRTDVkY2x4?=
 =?utf-8?B?Vm05MmRHUjFEd3UvOU1veXdoRWRubHJxUTJ4cUZRZVk3UmJTbXVOTGF5cTUy?=
 =?utf-8?B?cytiR1o2QlZqdHU3M09uSEY2SzI5SHh5V21vYkJUY0xVWTRXOWhYK1cyeHN6?=
 =?utf-8?B?bHJkQ3YyVHNxbWhyZnlic0VLNHp2RmV2ZHQwKzJrYUJxc1NQL1k3TzV5dGc1?=
 =?utf-8?B?d2szWUhOb3BOMzJwanIwMG1vT2xlTENGa1p3TzkvaUpaNVA1Y1NheDlmc0ty?=
 =?utf-8?B?a0RjRTBzUmtjR1JkRzB1QTMzL3VHU3d2YXBnQnRHdkRHN2ZGNzNIV1F6OVpZ?=
 =?utf-8?B?bnhNb0RpSGpyRE53YjJkUmxuc0Z2V21RNEUvMlJ1MTBlbm82QTBpVWNYUHJu?=
 =?utf-8?B?OGF6SmVzSi9YNWZYMWtqbW5QRzcrcUI3anJXRDRRdGtlMEFpRk5UdDczUjhW?=
 =?utf-8?B?S2twaWZOY3hycHE4R09LTXd1dllzaktsMkFMR00wVW9sSkcxdTlpTWpyclcz?=
 =?utf-8?B?R2NhVWRjRkd2aG5jaytLYXlMZkZUdmJQM2FNM2I0Y0djVisyOWp3TkNlaVhM?=
 =?utf-8?B?REZXcXU2Z043L2N6eExKTkhXWlRRL2xJcTNUSVo1VVUvRjE5UkxRMUp2TWlJ?=
 =?utf-8?B?dk8zeFBHWm1EUC9yc3pHSUpXZWQ0MVlMUDhJUXFYWGtyQ1MzL0Y0Ynl0YVVY?=
 =?utf-8?B?cElSTVl1MjRLYnBRTkxaVmUvL2pwV1BwMEh0aERNc2MxVVdmcldldEt5YjlT?=
 =?utf-8?B?WStMK1dFWGR0aDFFTWdEbTJIOE5PQUZJRHUyQ2dSSnF3R2Y3N0pURkdSaEdG?=
 =?utf-8?B?ek1MY1V4azI5bTFEMGFQaXNCM29vTWFhclNzY3FPa0xSZ0NkcGRSOEhaajlS?=
 =?utf-8?B?VG9JeHhKNnFBTktjRjVwZ0RIWkRnc24rQkIzMHE1d3UzNE41b1N2amJJb0tt?=
 =?utf-8?B?Q3ptaktjbTlhVit3Yno3eGM1aThITkEvTFY3d1NIc2hqdEx2aTZCeG9pZk15?=
 =?utf-8?B?NWhsLytZMXNmZ3dHeWJZMytxZUpUVzh3VGFKbXlkWE5uNjg2aCtQbW9PazFN?=
 =?utf-8?B?cEhTS1hCdSs4SER1RDBuYTRNZE85YWF1aDU0Sk9Ga25EUndzMkxDb1k3SkhS?=
 =?utf-8?B?cG1DVTNmUFNDSjE2Sis5TnlURXMwZENWbkhnWDVSbWg1ZEZiaGhBeGRaZnN6?=
 =?utf-8?Q?cZLUG1x7eoQsYa0ra6WYdjoe9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0cbbbdc-9b14-4c7e-2e68-08dbd941774a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 12:12:20.6491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykNslQQ+Om37dfGqHpR4AeJ7qTy5HLmEC+8+7C4j5kP+kufZzEruwRCLPyorCzZIKusR2gdxQ+D0tytrPWtcgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7961

On 30.10.2023 08:37, Xenia Ragiadakou wrote:
> Jan would it be possible to sketch a patch of your suggested solution 
> because I 'm afraid I have not fully understood it yet and I won't be 
> able to implement it properly for a v2?

While what Roger sent looks to be sufficient, I still thought I'd send
my variant, which I think yields more overall consistent results. Like
Roger's this isn't really tested (beyond making sure it builds).

Jan

From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: x86/hvm/dom0: fix PVH initrd and metadata placement

Given that start < kernel_end and end > kernel_start, the logic that
determines the best placement for dom0 initrd and metadata, does not
take into account the two cases below:
(1) start > kernel_start && end > kernel_end
(2) start < kernel_start && end < kernel_end

In case (1), the evaluation will result in end = kernel_start
i.e. end < start, and will load initrd in the middle of the kernel.
In case (2), the evaluation will result in start = kernel_end
i.e. end < start, and will load initrd at kernel_end, that is out
of the memory region under evaluation.

This patch reorganizes the conditionals to include so far unconsidered
cases as well, uniformly returning the lowest available address.

Fixes: 73b47eea2104 ('x86/dom0: improve PVH initrd and metadata placement')
Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Contrary to my original intentions, with the function preferring lower
addresses (by walking the E820 table forwards), the new cases also
return lowest-possible addresses.
---
v2: Cover further cases of overlap.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -515,16 +515,23 @@ static paddr_t __init find_memory(
 
         ASSERT(IS_ALIGNED(start, PAGE_SIZE) && IS_ALIGNED(end, PAGE_SIZE));
 
+        /*
+         * NB: Even better would be to use rangesets to determine a suitable
+         * range, in particular in case a kernel requests multiple heavily
+         * discontiguous regions (which right now we fold all into one big
+         * region).
+         */
         if ( end <= kernel_start || start >= kernel_end )
-            ; /* No overlap, nothing to do. */
+        {
+            /* No overlap, just check whether the region is large enough. */
+            if ( end - start >= size )
+                return start;
+        }
         /* Deal with the kernel already being loaded in the region. */
-        else if ( kernel_start - start > end - kernel_end )
-            end = kernel_start;
-        else
-            start = kernel_end;
-
-        if ( end - start >= size )
+        else if ( kernel_start > start && kernel_start - start >= size )
             return start;
+        else if ( kernel_end < end && end - kernel_end >= size )
+            return kernel_end;
     }
 
     return INVALID_PADDR;


