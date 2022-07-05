Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72171566EB6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361212.590610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8i1f-0002iU-Lp; Tue, 05 Jul 2022 12:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361212.590610; Tue, 05 Jul 2022 12:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8i1f-0002fx-IH; Tue, 05 Jul 2022 12:51:35 +0000
Received: by outflank-mailman (input) for mailman id 361212;
 Tue, 05 Jul 2022 12:51:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8i1e-0002fF-DQ
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:51:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32b1ecc0-fc61-11ec-a8e4-439420d8e422;
 Tue, 05 Jul 2022 14:51:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR04MB3089.eurprd04.prod.outlook.com (2603:10a6:206:b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Tue, 5 Jul
 2022 12:51:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:51:26 +0000
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
X-Inumbo-ID: 32b1ecc0-fc61-11ec-a8e4-439420d8e422
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsjRHB8fAJzzaVtsi0vI4ftteJvfcM3PGASdlaOgt32SJM+jJP7ep6x93PN7j0FtaElevGjjV23KuMfKIOtFJn3q2uef/ZqfjtFd4DexnKkT8cwtM0i72buO7tkw426i6TUfTYzAqEVdnrArFT0dX+qZ8T9bY2Hot1m6QqONChaanbdIn+gOWLwcrYBk8MIQfX4oyT8TlY/4mUhoHLFsR73eMK9JPyu1RcaARrPAKQA8SsY/0+tJ4z9TEmRxI34/+2kZZz9p4/uIFQUf+LEDTcFqqbr9fJEAnKNgkZqXSuaLlkQVFIpdSFovoukqcQVnwIN73DUSognVGIZd6CF05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qJN+mR+PAwJlyoU8lO+l9qqi0anunK/pXx4zylTd/KY=;
 b=G1TDMhT64Nee1aAEF9bikrkAP/KPZVg8sjtGgfjAiVkvQtb7iyIk6zYd2fAb4Boruhj54AwcL9bm4y4KSu3Zes59Og+dCkkWeuh+UOpPqWLVGTYGNaMwOfqn6Lezoa43TNLaViIpsPyj4tL9de+5+/sYdNoLmxtTOShUxVsnNUMgizKiOsdb54GRNfnslcjdcWfyju2wv6ai62X1iUlxnptwPK50w0t1+c3+XZKSKWLTU+Iv1IbYIwXkR5EizQJDiX5ny6UE/5BWfIxIlQj1YafpO4lPSwl4V0LOxsuEKrsM76ffgH7J5V3bPstCRNPZPklrQJJWVnrppIE0kaGsQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qJN+mR+PAwJlyoU8lO+l9qqi0anunK/pXx4zylTd/KY=;
 b=IFRFBDJ4fSD4mIcsCTblS1Bi1K13YUY89y1uzncyCeorbP7+Xe2rcYiaX4bbT4LKkICW2Xb1FNs/0pjzvy2SJGPhU8kH9w7acktR2SxlxtPCTn2Puu7/hQkMx63LlnD1aSmjILv5EmHaqCsSImEJJ63ALNnD85sRHnzDdx2lyQHmxNOwCx7ZfKmI8ikDCj8l96w2TDF3rxWvhuggOP1te5lUJWxFnVuhDfoPOq6X2aNX9V7el0Gs0dlbqIVrD/McyM6Ao3yS2xOkt4Oown4q1VfAODhiC5HkgrPI4rvlm5kpNVg8BSCLV87VMleQ6yh2yPRGIPsG7oTDZXB+Qmd8HA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fbbec91f-6b75-7950-9378-f3d4fbba4fec@suse.com>
Date: Tue, 5 Jul 2022 14:51:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v7 00/14] IOMMU: superpage support when not sharing
 pagetables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
In-Reply-To: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0127.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d198bfb3-9b6b-46d4-da67-08da5e851281
X-MS-TrafficTypeDiagnostic: AM5PR04MB3089:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8V4o7klWHQ/Ws2WRJGc/AK5wJyQ37F/RhbrQYXG9rbki72jhJWwZbf/+H+83fcjRQ8Dk3pDjWdlZOCUKjh/THfgKZ+YPUXagxeUdBahEW6fKbrB8a9zVsRHIex5mn1YoTcNkPGeWXCa1nt2x8qCFB+o5VN6ZGZ9XSkH7gnyCiabSesBUEyhJ+6wJgaRwHPpOcFypxgWPkLPAIuURHte30r/lv4qQ4VLUr0hyQ6OpukxMdvawl+e+YlTxKLkM9FOTbUhAh9T61UCAVwaqu/kJvmonCZSt0e5brtqFImfU/Q5wzaxzj4FxMmd2NDQCs3GdVwb9IdvaaqJjd9sZNmdYGrJx/8UvjXOkefXCIn7Qfk+aoBRmi5IVMM99FvolpWHDj903jBBUlqNrmt44E+wvsKrtGbs6F/kxW4Fnh6z6KtmW3bq4T7T0p3PZfVz/g+6PJUtD/Yo1MhV+YtVIThfdU8Xdu1e9XX6EXL2fnKbV8cI8RHCDYlGNQP9KOLr1PtD1LYg9sYrAgr04uWQke3kP64joihuxiIMw1eYM9RMpNvaryrqSKFq78VTvmj89b8JU/RwOqhOv8hFFMT5GT3kET8n9ecLjAAr3JuJ7Gs39o16ZdBHS3MNoeKBjxYR3/zYn8aRFxIaMv1Thz0YeD0PxytN457BOaxzujI27+miT3V4cPRaZqDi/TRdM9LMjw5e+ieeEn2Ud4hQZ9JxQ55VC+jVJDgAtleh17uWa0iBiqi04SBW3awv1fgmd5Wq5NCsu1/mP8XYYF0oFW2uzcyKl6cKKcacD79kU9Lf1cgOog6NKNyMfrl2oL1KhB+858nBVfKTabGCf//9ykvj2P/LK/U+yXVAsgHyd8CZ68gklQL+rGt2yczWjukEUJKVQ/FgI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(39860400002)(376002)(136003)(346002)(478600001)(8936002)(5660300002)(966005)(6486002)(86362001)(31696002)(2906002)(6916009)(54906003)(316002)(41300700001)(2616005)(66476007)(66556008)(66946007)(186003)(83380400001)(53546011)(6506007)(31686004)(38100700002)(36756003)(4326008)(8676002)(26005)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3ArNWFPSzkwcUs3dEFoYmlGeHhFUmRZZFJlV2dXQVR2S0Ftc3NvSksrQzVz?=
 =?utf-8?B?R1VzZWJSeFlNSm9CRFpiZkt2cE1zWDYyR2c4Q0NqMGVqK1pseU5McUZ0Q1c0?=
 =?utf-8?B?aE1CeUFzT3V0MnRIYjNWdjdwQVY2RERudCs4czRHYXVjRlZwNEJPRmxLR1dy?=
 =?utf-8?B?dkgxQlR3SGJ6UWkrTkVpWEQvTGpiUlllOGRUWDFBWnNodjhoNVcrL0p0cnlr?=
 =?utf-8?B?bXN6YmJhZld2R3Z5L2tPYkFoN25VSmxCQzA2SDlZcGdwTmRiamthSTc1RlZu?=
 =?utf-8?B?dktSdXVCVXF5ZmZOTnBRYW1QWDB1T0g0aGp6SmVjSHo0MUxYMVo4U21hM21N?=
 =?utf-8?B?OTZiay9RUGYzNmNDR2JJaU5naG5YM25ZTjVHR2UzaDVKRmduZlBSZjdUdzh2?=
 =?utf-8?B?blhrTmt5ZmV5c1BIby9xS09mc2VSK0lWTnBXdjVHN0N4NEZFMkowbDkrVmFS?=
 =?utf-8?B?OVlnU0tDWFlDRDJkR0dmNEVDaVNNTE1zOG1WalhEcFFSUU05Qm0wTFVQU25E?=
 =?utf-8?B?YzFQajVFdTMvcmpHWStMVG1VNEdWYWxPeDZKMHkzQ2cvWUNEbVpZbmRVdHJ1?=
 =?utf-8?B?UjZYb09NaE45OTRZeU96Ly9RNzFrWEdtNG8xUDZnaldIaXYvRTFOU0w2OVlk?=
 =?utf-8?B?ekZuamNZTEVJK3R4OGx6ZHV0TnZlanZlNVVJOWVINDVyODNKNXd5L3VicnVM?=
 =?utf-8?B?V28rUDNZTzBoZHdRT2EwNG1zTWZRYjMxUWkycnEyd1Z4VTlQRi9PVWpuZDky?=
 =?utf-8?B?eTA1K21wSjZaMFNrUzFmM3RYVTJwc1ZJVGJIVWIrOXV3dkFjS29CR2R4L0ow?=
 =?utf-8?B?dkNuQ0JLYlEyVzRaS3NMNTFXd01RR2ZyWkxKM2tqdlhSVzBiNUpSeVpEN3ZK?=
 =?utf-8?B?eXMzdWpyUXdWSnhEdnNGdCsrbWJlOUtGd3BJYld0VklQbXBvdmtibkhFT1FD?=
 =?utf-8?B?M0U0TWVSK3ZMTXBjWlRWRmFIZHVPMzAvdE51b093ajBIQTE1aXB2cHhRa1A0?=
 =?utf-8?B?c1paM1VBQUxEWDNmSnNLazlRRW84WG1IL3F3VFc2OHFEYTRDdkw0L3lmc2M4?=
 =?utf-8?B?RENmY05HaFVvR3BoNWJrN2RHRHNKTXpCbFV6Nk5xMG9MMlBDd2ZoSEh4ZDRN?=
 =?utf-8?B?c0FnRWJvQ25zUDUyd01RSkdMVkJ0OHpKZkNmWm5RQnNjL09rK01TRXhPaTdS?=
 =?utf-8?B?b2VqNWlyVnk2NDVUSnIwNmRHek1JZXBOMzg4cDFCUFpIUGtIYWtZMWxyZnBx?=
 =?utf-8?B?NXlTNWJWOHo2T3BqZG5GTWpXaTcwOXJVUTJMa2pxNG9FVXNGbmp1TmduaXBB?=
 =?utf-8?B?SS96ZjNTRHFkRTg2dm1QTllhbURtODliTlVqdHh5RDhBaEd1aE1xVm5wVVRr?=
 =?utf-8?B?RXJ0Q3hRNmcyREZTTlR0RXBIWmkvRWFWSCtzT2tJODVQVitGMXFaQU43N0RY?=
 =?utf-8?B?RThjTmI2Wk1YL1J1dU5zd0FlU2lJcW40WnVKMmZjbHhkQWVsSkgxRU9tOS8y?=
 =?utf-8?B?ZjRqR1YxVTM4SHBkWFZab3MzeXJuVHZOU0NQNkd2aHIvZm9YeWJhaHNKcXJL?=
 =?utf-8?B?Qm1zUWgyaHM0VlFlQnRrejZkelI5SzNpU0V2SXJPcStmbTJjcEF2ckplQzZF?=
 =?utf-8?B?OWY2TUw3Qm84SElPdFNqZ3RjWE1URld6ek1HR3ovQnY4d2I0UVpXTTZ5bnFX?=
 =?utf-8?B?V3JuUjRiNlBwS3dBU0FnTTRkaXVzdmUxbnpVcEFxUnBlbWh5ajRSalk4c0hG?=
 =?utf-8?B?T2t1QUt2V0tCK1RtaG5uc3VLTExzSzZhbUV3QklpNTJMZGxCS2dlVmdBc0FC?=
 =?utf-8?B?em1IVGdEMzVWTzJyZE04T2x3OWFOME5WS2VqYjh4MURqUjU4Z1p2ZEg2Y0hP?=
 =?utf-8?B?TEczSit3dklERDZZc2N4TGR5QVI4ZTBQUHZiMEYrZWxvR210Q21lRlQzY2dn?=
 =?utf-8?B?bzY0cUJDY0dJYmZLNEdkMjB2UEJZeFNBWVliOE5NMXR4WjZSaDBJYjJ6NHYx?=
 =?utf-8?B?YWlxSUFPeWNnSEF0Y2NDYXJ1YnB5cy9rdTRhN1Z5TU5lUE1GZ1VaZUkrcnlV?=
 =?utf-8?B?bEdzOGFvMkJIQTlKT21sQTQwWTBXdW5jbzY1aWd5UkRLaDAyRys5TTYzQXU1?=
 =?utf-8?Q?EKBxoWKv2yZ8StaEe+gT5ookO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d198bfb3-9b6b-46d4-da67-08da5e851281
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:51:26.1913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +c88wqrz6MfYjTQwL+05MWVeGDbYH0LC0XSxotzlNH9gegHunuDFlBarGVgvb4w1yqoQPb9I/7o0BSZnfsAMDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3089

On 05.07.2022 14:41, Jan Beulich wrote:
> For a long time we've been rather inefficient with IOMMU page table
> management when not sharing page tables, i.e. in particular for PV (and
> further specifically also for PV Dom0) and AMD (where nowadays we never
> share page tables). While up to about 3.5 years ago AMD code had logic
> to un-shatter page mappings, that logic was ripped out for being buggy
> (XSA-275 plus follow-on).
> 
> This series enables use of large pages in AMD and Intel (VT-d) code;
> Arm is presently not in need of any enabling as pagetables are always
> shared there. It also augments PV Dom0 creation with suitable explicit
> IOMMU mapping calls to facilitate use of large pages there. Depending
> on the amount of memory handed to Dom0 this improves booting time
> (latency until Dom0 actually starts) quite a bit; subsequent shattering
> of some of the large pages may of course consume some of the saved time.
> 
> Known fallout has been spelled out here:
> https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html
> 
> See individual patches for details on the v7 changes.
> 
> 01: iommu: add preemption support to iommu_{un,}map()
> 02: IOMMU/x86: perform PV Dom0 mappings in batches
> 03: IOMMU/x86: support freeing of pagetables
> 02: IOMMU/x86: new command line option to suppress use of superpage mappings
> 03: AMD/IOMMU: allow use of superpage mappings
> 04: VT-d: allow use of superpage mappings
> 05: x86: introduce helper for recording degree of contiguity in page tables
> 06: IOMMU/x86: prefill newly allocate page tables
> 07: AMD/IOMMU: free all-empty page tables
> 08: VT-d: free all-empty page tables
> 09: AMD/IOMMU: replace all-contiguous page tables by superpage mappings
> 10: VT-d: replace all-contiguous page tables by superpage mappings
> 11: IOMMU/x86: add perf counters for page table splitting / coalescing
> 12: VT-d: fold dma_pte_clear_one() into its only caller

And I realize I've successfully screwed up numbering here. The order
of patches if correct, though - it's just that from the 4th patch
onwards all numbers are off by 2.

Jan

