Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346DF566E8C
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 14:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.361124.590445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hsE-0001Dm-VM; Tue, 05 Jul 2022 12:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 361124.590445; Tue, 05 Jul 2022 12:41:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8hsE-0001Aa-RG; Tue, 05 Jul 2022 12:41:50 +0000
Received: by outflank-mailman (input) for mailman id 361124;
 Tue, 05 Jul 2022 12:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o8hsC-0001AP-Op
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 12:41:48 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140058.outbound.protection.outlook.com [40.107.14.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4e23004-fc5f-11ec-bd2d-47488cf2e6aa;
 Tue, 05 Jul 2022 14:41:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0401MB2613.eurprd04.prod.outlook.com (2603:10a6:4:37::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 12:41:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 12:41:44 +0000
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
X-Inumbo-ID: d4e23004-fc5f-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kW430Gk2YoxrYANo+bhtELxsYYWIpXOrauMdAocVVvCNtDNE/MsF46uUb5ojNafuxyrIOx/eXUjlUUeghziTt7Ex7rpbu1LHyWB8RWEW128T4+aXN6MkAIin8ml8GWs4E/XP1RwYzUMO3sHoWnp1NNOv3lwUbAqHBtfrlfYLx6X329vgmvcOvg/DOxd62eghOBreu8ECs1usy8/EMZOT5gzmRinB/boJFYPj4d6X4fkCSmk2/Er1//MCrkVKftEACFCYbtXiswSCutdJ27IRxw5DxnhDLsOAiDFoK2tm+lTBqAMhs+6jbxT3wih+7lq0Q+pJPPiOTY/VtrsE5z5YFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SZgNX/Ze/9TuUARcqgxwlervi79kuR7lK9LTAC8e/6E=;
 b=Dp0JpIWeH1ZrVIrw9tJdc6ttcsl26637yVXi6YlaLBJlSOfqQAtijCsdOlReaE7ZXnB2b0frXnatKgHB4J1wwQ3Br31i5eHinfCC7taIZAXz4zV67GZZ3s9Qvn5uZR4fETy2ZUhiXqVvNTj4xI0FdLk/p2dOsHDJV0WoL0d9fpBU58jb/Jj0QDdaDeQeOAQETJGVT2teOpcYA/cv95tuvTIXLxOdXZELWC4JygAOH+Y7y1oT5AUCwf1USPg2+39OVnZlmhQkbQxrr4NIXCQTUUCfIqmvarZd2zqdERFzkTDvRL5rcKWq4o6KKIZoLz+AJ+q8TI1lDQ1TVmZqeQ9KDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZgNX/Ze/9TuUARcqgxwlervi79kuR7lK9LTAC8e/6E=;
 b=ta1faLds2kSrjJue/pDu+PZM3Mw/Qw7dlkq4sFhk4y+AV3YiHwlC28cHWP2ikfiC4/vUAX0p69yneuJtyzMYU9J6qEH/HakCXLf7DYeQT5ZN9HegtgwSs0pwrkYB3CnEKLKIBSAcIasH3xuuUJ0fJ47B1yd2zJRsXnoMxCc4t+TQyekjpbKtV4uh068Wkjuj83yPrdcx+rmUMOKJLriDWPs7kwK6NnQi4IaFxSHJgjyyWxMRsA22t/YECpn/oUmQw2eOGzT7rxGLT3UAMnnqF7+lgsDEL/aH0Lg6NhJ25JtzrAN1936YK9BbcosNv+8wv24/5II5etTibG23BpzY/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4c9d4b32-d4db-3a4f-fe92-6022e63c3f82@suse.com>
Date: Tue, 5 Jul 2022 14:41:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 00/14] IOMMU: superpage support when not sharing pagetables
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0187.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e2bb20e-a6bb-4ed4-d40d-08da5e83b7fb
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2613:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	205ZuG3/hvh4fvlE1/539LlfFtBDgdk66Yu0fkeGQpqA91xlapAslboHDTQaybGLTOQ95He6s6G6Ai62B9jXXXzWZ6E1+O+WtzTt2iyh4EKnqFBWAJjtuuhUaqwwkXwy/Nd8ViHqutk4ljW/4okFw9s/yi/5/jrm9PYkgxSxVQb1eb5Pysrd9x7C6VWoiXYggTdtqrX98U77zM5nHCFnXcfW2Q3IFXcmguBvxu6EylPzA6IDWt8ejJ/CuU/rCTj/+5d7DvJdCM/IbO7tevOkOtJrLRGjrQQedBZv2sMOTFUbgub/d8R72MulVDekow7dek4k2NVpDyV4bFLMn9bXGaDs4+pT1y4kVq4jY3u7tIIz1ohxXvkgauTSFMr2QvV3DJvOERcl+5kG5VJ5t62xfFO0q1+Ug/KsPM3dgwFuG11nuWpaIvjEVv0xeUbfT61tp1SW2pumOCwJQ/wSiUDuy8zkkqY4o3KGFIOhbR+IQA/C+qA/J3yFri50FGdeyK+P0HFeiolaW1uxi7KLhPUJmXZe1NDGBpDYDbxZxbQsbnouf542qsbmdZsGFfZpVqHvEUIJCcbAWzhvKLSF0eBaNBYCOP7CWq+kYxIENVKP0VbugXRo0f0v8hDMqecNT52j4t4iL613gkIrMY2oDSqi0rSQXCPizjW2/Co0A0dP9i5Kyp9LQ+5C1UNe+xHsrjVDi+dOfnxc9VewSGEVXbWk24NQRbEXo0jtrJywsj1LPemVR2PWwu34OSq8zSGGaDk/uoWumnBP5IRKf4XIJWQmCt8OgowNhcyPriiIYF4ha1+AXeyOGi9Qs28cFFiJPKNoVXtNZ6T/AufS3oZQfRTxbDi8cH8ejXxGEpqlHVezF6TWZHYFD73LfJu0LjA1vYKU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(396003)(366004)(39860400002)(346002)(8936002)(31696002)(38100700002)(966005)(6486002)(478600001)(86362001)(66946007)(4326008)(6512007)(8676002)(66476007)(66556008)(5660300002)(2616005)(26005)(186003)(36756003)(316002)(6916009)(31686004)(54906003)(6506007)(41300700001)(83380400001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWZFRTZYN0lKL1c4N1NrbXhDNXh5Vk1rZzVmVnh2RmN4RnBvSUZxY0hYUWs4?=
 =?utf-8?B?eHQxNHBNSURJWGo5d3ZrOTdycDNINzFiOUpFcDgzUzdCdzhVZEo2NDJVZ0JW?=
 =?utf-8?B?QkRWSFEwVkxkTjJzSzNrbEFVRXVIQnlSMU1xYTFVVkhreHJMUGticDAxZ092?=
 =?utf-8?B?aktwRUNmeXZMWmtMM0oxWFBRdDdubHBGRWk1UVFFQ3FSdW9yUVl1TzFQMjM2?=
 =?utf-8?B?TVZzbzMwcWo0bzNQSnRXNEd4N3NhV2NQd2JtbFZZVnQzRzh4enBibUt1bkdv?=
 =?utf-8?B?enltaklKSDBsYTJGM3RXMEpPK01sSmxkZlBvZklKQ0xFU3ROY3VZWWZ1S2dW?=
 =?utf-8?B?TmpuYVpXTTJVU0ZYMDlHSjRhRVZ1ako2ME0vd0FmdVdsSmliM0tWZ01najVU?=
 =?utf-8?B?NmlDT3lXeWxJM0p4cGNTcGs0b09YY3JIQm1hdDdEREhUOXhPbm9DOVFTcEpP?=
 =?utf-8?B?bjF3OGxDZ3FFRXlUWVZKTXlUQ2dnaE1xM3JKUWU5Mm5LTnV3MDZGbnJxQUl1?=
 =?utf-8?B?cUJoSWdDNTZNTEE3RHlqMGdSUmlrWDcwcTU0SW9qeFNRRFpObEtnd0kvTEE0?=
 =?utf-8?B?Q1VOMGpDekhISjhEUGU5K0FRWHhQcmpScDVSelZVYmx1aVlCZ2NNUklCUUFq?=
 =?utf-8?B?UXZnUXhKVVJFZFp4V0hCb05KS3NBWFhBRUtPaFZNZGlpeDBRNlJkQXRBd0Nk?=
 =?utf-8?B?d1lHbWh4UUcyODZiZ1BzcDVDUFN2cHZyNmpqTFhUTjI4RlBZaVZpMG9aZytG?=
 =?utf-8?B?NlMxazFIRm4rR0wxUVdBQ0FiSjZLd0V6YXo5ZFdxRkxwWmFoRFQzWkRIRENO?=
 =?utf-8?B?THJPSTR0eEZYaTJTN21vZmF2aDhrM0F3d3ptNEVXaVNRSXdUeE9mNFYwWVBk?=
 =?utf-8?B?T05zejk2TWV2bERGYjRSQ0o3cmd3eTQrekVmVFRvcjRnOTRxOXA0UjR6bThp?=
 =?utf-8?B?b2hDcXN5eUZUYTlkOFEzaFpOMDUrSXVvU0p4dFk0VE5wUVBJMjJDbllyVEVF?=
 =?utf-8?B?QVlTT1hZWnFaeFpKU3hEMW9oOVA0YkE0Wm1XK3N5RSt3cDN2dlVzZjM1Ylpo?=
 =?utf-8?B?emhzTGlpNEpKYy91RWNubDcybjcwYVVEbEVsdk14dld3d0xGdTBFS21qd3FB?=
 =?utf-8?B?K1JkOVdPV3pYcW0vSTVYNVJBWVFXUEg5d3R0UjdIKzkzMUE3VTJhenBLNGJu?=
 =?utf-8?B?eGR1VTFWS1J5TVQreDVQVW1BUjYwOTJZM0VXaE5TMXBNVWIvVHJZTHVUSVUz?=
 =?utf-8?B?VnZKN1NhaU80elZxb0JveDNqSXZTR3pCUWk5MUV1c2M2ckxSU2RBMlVDZ0lq?=
 =?utf-8?B?cVRpdG9IdUsvQzl2K2hCK283ZXVOSzFmc1JMOEN2c1BwOFI4c2JoTVVGWVEz?=
 =?utf-8?B?aXkwcXA2dTNsbHozNkJsbzhuakdtMkhXQjMxZE9ZVTBWSTNON0ZxOFZIanpi?=
 =?utf-8?B?WUY3QjlpOEVSYWZNY2NSWTRqVDJvUS9nQVZDVXVrc2Y2ZWs0OU5uMnFRKzQv?=
 =?utf-8?B?MDFWdm1Ld3k0UWdOYW1MRnAzYjR1QndtcVF0d1JJQXEreVNwNkJLclZyTi9O?=
 =?utf-8?B?TFg1WmZ1aVlxeWVzaFQvTEtxaHZHdU13cWUyOHJTNjd1SHNZWXRJM3gvQXFP?=
 =?utf-8?B?ZmN2WmxDSDMwR2FZNGVDckdteWdCcG81d25wUFpIQVlVSi9GQm9MZ2dRVnZy?=
 =?utf-8?B?MnZyWS9MakgxUzI5SUNMQWhzTENUQlJ4SzhVZGxWenhmVVJOUmQrNkRVMUo1?=
 =?utf-8?B?ZWt3NkZPQlh6QS9ERUVuMlZ4OThuQzZMZGxaUUh2dWZicFNBZEZnQ2pNNFpr?=
 =?utf-8?B?VXZiNHV4TFZOYUI1TkZtTFc0b1RCQkt5b2MraWlPMk00S0w4blU1YjcrS2xn?=
 =?utf-8?B?UDZUL2t4bFNFb1NUQ0pXeWxsZGJLWk9Qa09KbkUyZytyYk01VTZpK0lMMXdq?=
 =?utf-8?B?U2xwRjZlci9waldvc3JRVFFla1hzMSs5aHJpMjJOM2I4V3loeDRKQy9Gd2NT?=
 =?utf-8?B?Q2N4Vmd0V2QxaE1McjhLWW9xZWhSTWNQeVlSbW1oZ05pZlZxWW9BSUFvb0FC?=
 =?utf-8?B?YnM1b2MzWEpPaThSOUM5SDV6b2krNFVmb1E3dlVhclhtSlE1M0NHT2dzd1R0?=
 =?utf-8?Q?EiXJ05kE+NmkgAYDxM3zcoOrb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2bb20e-a6bb-4ed4-d40d-08da5e83b7fb
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 12:41:44.8213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: maVDqHorIcbulMuiCrEC/gbbZx0Sx8AX5BYpWqpf0IMKsf9KF0sLaf/xrxp27ryZntM0Tpkg69SqLtIZ/SXcDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2613

For a long time we've been rather inefficient with IOMMU page table
management when not sharing page tables, i.e. in particular for PV (and
further specifically also for PV Dom0) and AMD (where nowadays we never
share page tables). While up to about 3.5 years ago AMD code had logic
to un-shatter page mappings, that logic was ripped out for being buggy
(XSA-275 plus follow-on).

This series enables use of large pages in AMD and Intel (VT-d) code;
Arm is presently not in need of any enabling as pagetables are always
shared there. It also augments PV Dom0 creation with suitable explicit
IOMMU mapping calls to facilitate use of large pages there. Depending
on the amount of memory handed to Dom0 this improves booting time
(latency until Dom0 actually starts) quite a bit; subsequent shattering
of some of the large pages may of course consume some of the saved time.

Known fallout has been spelled out here:
https://lists.xen.org/archives/html/xen-devel/2021-08/msg00781.html

See individual patches for details on the v7 changes.

01: iommu: add preemption support to iommu_{un,}map()
02: IOMMU/x86: perform PV Dom0 mappings in batches
03: IOMMU/x86: support freeing of pagetables
02: IOMMU/x86: new command line option to suppress use of superpage mappings
03: AMD/IOMMU: allow use of superpage mappings
04: VT-d: allow use of superpage mappings
05: x86: introduce helper for recording degree of contiguity in page tables
06: IOMMU/x86: prefill newly allocate page tables
07: AMD/IOMMU: free all-empty page tables
08: VT-d: free all-empty page tables
09: AMD/IOMMU: replace all-contiguous page tables by superpage mappings
10: VT-d: replace all-contiguous page tables by superpage mappings
11: IOMMU/x86: add perf counters for page table splitting / coalescing
12: VT-d: fold dma_pte_clear_one() into its only caller

While not directly related (except that making this mode work properly
here was a fair part of the overall work), at this occasion I'd also
like to renew my proposal to make "iommu=dom0-strict" the default going
forward. It already is not only the default, but the only possible mode
for PVH Dom0.

Jan

