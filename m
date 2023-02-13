Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3E9694641
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 13:48:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494435.764492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYFS-0008BB-6I; Mon, 13 Feb 2023 12:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494435.764492; Mon, 13 Feb 2023 12:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYFS-00087o-2h; Mon, 13 Feb 2023 12:47:58 +0000
Received: by outflank-mailman (input) for mailman id 494435;
 Mon, 13 Feb 2023 12:47:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iLJL=6J=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pRYFQ-00087f-PH
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 12:47:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a225146a-ab9c-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 13:47:55 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BY5PR12MB4997.namprd12.prod.outlook.com (2603:10b6:a03:1d6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Mon, 13 Feb
 2023 12:47:51 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 12:47:51 +0000
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
X-Inumbo-ID: a225146a-ab9c-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgKWr99RyI6RywXZG59d1iT0rlOWJa0OLavsUPo7ZnIz0mVwb5Td1v+7qnKBWToNGK7W3RYJ0wF6KK9+f0mQMm1eXqSzojwduUcbGYA4v8zJXPO52LRBvG9qdgVcAfW02B4Qag9iAN71ixn9m3WBNQLHmJi+6AtH9SS961ja/ruo5Zr8+VJ0HlQzFkMVLZ+H+zDrm1dlqKDQV30gr8XD9Cj0/EleXZ31ess9pVC1cBHYdmPoHOW+atmm6TwxvWDe3V/IQYs2Lj5rdJZ6yOfYx7HajRAmZ3IMHVU5CXjIDpIGC/QrF2ZFaIGxk9ZWi/+1RtSNLS719+N7yUxutVtlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gLM/O2Imxi/CZGa+zG8LXPbr2AgWnpvfypJndQplNZw=;
 b=bG4t+PhRYW89kKPCh1+oIxcm4qIz/AiwploYlRc8Xat2ZloYA2V4ECHYgW/A6iatAxhawyFMpxqgH/rrLVb8RkiAH1YccQHv8YKJEZRLTe/DT398sKjg7mv81Gqvy/9ExSv/pce+8EKv6nOtzAYVerbOLvF+g0Z+Avzwq02ZpIHDPXWNMzc7f95mVKQgg/ATYnqCY8jGZhYsAyeP3dil62NlUSe1KgIBvz4w/WysF9c/fTxI5krs9NuZ5UQ4hnL9Aaj42SPjCfKrSZoo7Q+ItFZZg4PDYWHhUAyj+IfzT7ccFY9O8t0BZqHNZ5MxEWkYU6mLZaw5kL3ypMINO+aIew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLM/O2Imxi/CZGa+zG8LXPbr2AgWnpvfypJndQplNZw=;
 b=0EGzXEltHMsV7iL6LPe5obGD10lZ7e3quGGkamXjMlf3m/uOygsajWS+he6j/bFqVQardKMjES7/8NIWwQH8w7R/Kbk6n1UmPvhewiLjxXPYALcQKVDFSjGSdvVj2gMhzmNvfZ8PhVTKDVdEz5s7UokxD7sCVTXy4Qw0hZutPjU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <457fc135-e7f8-b6b4-4d8a-8d6347ef5751@amd.com>
Date: Mon, 13 Feb 2023 12:47:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v3 4/9] xen/arm: Introduce a wrapper for
 dt_device_get_address() to handle paddr_t
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-5-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2302101617590.4661@ubuntu-linux-20-04-desktop>
 <5631b4ea-decf-0e9d-3749-6f0bdffb73c4@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <5631b4ea-decf-0e9d-3749-6f0bdffb73c4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BY5PR12MB4997:EE_
X-MS-Office365-Filtering-Correlation-Id: 40abf111-4026-47b9-599a-08db0dc0849a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nHxbAi4fzKC6Bxbc39NscT5UBM/EsTW5pnmRppC0WG6NYAVnMNaIp8iJRATSlApaah9tMZqvah6X+XGD1bUh0YBPYEKOtQfotyPfZeGSkXxbjdZI/KWNomXOFO7cWUiQdX2aD8LtYBUSpSzZFoFp6WlSXoMgVNst+2oaeJterKsxlxtBEmLhmlixb6wuBIDEZOTHORP83i0Ef8al0hrL33F9p51ZkUuq/iOMbWYx+qZnUqvh+I+FgCtc6YS8OBlGYa6tRww7EL+e7RDe5Z4K3tzcDEqEQ7maP4pjp1amXAT0e2fUsZ3fENIKCvw1WdUQLgQJzS9lsf5IV+8VhHymaec8C8Gp+GHgLiFxEdbh0hnI12C2z1d7K9lcP2saLux5VBZmqJocrAn4I7OjERdjBSJcLjKYkhaZcxhiqal0uyTEh6ydQG1NbhQaNsY4+ysgvH7K0TnxS+Arm7u1QfKNG2EfmAVyW65djWh1s832OGKGmjYc+FU/jYAGNTeTwqbBNEtW17sI5ly0MsOAjZILJeY5d3qEbDlrwly/h9dCGtlXsg1xvHQnZvpUj/uBFYVpkWf9JGJ1/nSl2l1/XSsW9WikHV4iBqf/XHDAmGzXeMdmBj50+rQJxpLbaV0kymysjT3cdA0rB51uNjw1Sshp9t+plck4B32c9HEU3jwUZEG/nTOCF4xM+TxZrBjaZTYeOjMiG3kUMq3bpniZAAELD/2CnGHGPSmtNYv8wcLTN6xWBIxN4IO9CTQbzWIdIMur
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199018)(2906002)(66899018)(186003)(8936002)(5660300002)(26005)(6486002)(36756003)(6506007)(6666004)(53546011)(478600001)(7416002)(31686004)(2616005)(31696002)(83380400001)(66476007)(6512007)(38100700002)(316002)(6636002)(8676002)(4326008)(66556008)(66946007)(41300700001)(110136005)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUpOS2phYkJaOFo0QXFRODRIS2RxQnpXUmNueDB4R3Q4cld1MndpL2pJcDZR?=
 =?utf-8?B?S3lGNFRxcVNqRkZGS3F6eDBRbU1uL2ZzMlZyVWNnUjZRYm83V1VBSkovMkcx?=
 =?utf-8?B?cHVnaHM2YW9BTnRvSitCMnBEeGY5bi8wLzY3Z2pXR0xad2svNEhmNVNkS1Vy?=
 =?utf-8?B?QURhU2NuTTdOS1c0TjRhaElBY2tYc1JZODZNVWpxdzhWdVRadHVDcXJtRCtl?=
 =?utf-8?B?WENwNUhaY0hod2xqZFE1RXZwRmtoU1BCdmZsRHAzUUpzamhxbXVDT0JpSmN0?=
 =?utf-8?B?QjJhZE9WZ0tFaVprbGsxTWlqUEFZNWp3Rjh2UFAraEtwQURHcmJGQ3Z0bGRI?=
 =?utf-8?B?RHYxY1pFK0dUWEsrcE15Vzc0UTlrczJnSjYzU2Q4czZvR1BnMVZka3FtRGFh?=
 =?utf-8?B?bWoxdGs2Tk5lUUFyWlFHTjNFdVNBVkcxSkg1bmJQUWR0bElRWG5rckpXaWRP?=
 =?utf-8?B?UzZLRWtPVGl1UzFabmd5bUV3d3pEL2o1MGNURENkOWZkS29xVzJkWG5sZVM0?=
 =?utf-8?B?L1JDVzcyWlhXc1ZqRTZXR2YzZHJhOHJBam40OEo2OWEyNSt6Nk1rTVNLcTRB?=
 =?utf-8?B?STVpTjFneWVuckR4MEJRazFIMzFDd1pYL1dlcXNRcTcyak14Umx6VXpmN3RL?=
 =?utf-8?B?OE9pa0N3S3oxTjBicjd3SEpxYzh6ME1kdXc1NElLZUQvQUZ6NnRoZWc5SVFJ?=
 =?utf-8?B?WlNyZGJuQUVCVFpsVHhhckJPbEtBK2hWRUFMdEdLMlE3eXZJaFVBV3FsU1hI?=
 =?utf-8?B?STRBU2U0elRPd0lkOEYzaEltYjBubzhxRWJNNWNOMTBQWUFNeVFXZk1uWk9B?=
 =?utf-8?B?ZFBLb0E1ejAySjNiRjZ6K1lQVDBPajVydzR4OFlMR3JmMGkrTHMwQjNCRTRK?=
 =?utf-8?B?ODNWZGU3bDVhRHZRMjg5OEFGZEw2TUxEeExvbkYrRTY4YjRFd0dyeUxLdWkv?=
 =?utf-8?B?RnVZUDFSL2crNmNyVHlYY0daNmNjRHZ2d3FYY0lpNHVPMHluWXY0Z1NzSUhi?=
 =?utf-8?B?bFpIS252dG5ObEhPMmpCemRrR25mdmdDcHRXeXIwaFRZUlUwbnRITUkwY1Vy?=
 =?utf-8?B?WGJxSXBTTzhEZit5M1RHWVdzR2lWR0Y5cnJMYndiRjF2cDFKMXdYbjJuQjI4?=
 =?utf-8?B?amF1bWFIOHRlcmVjZXFwaUhGVHp5aHBCd0FodXBuL2tnZDFGRU1TT1AxMlZR?=
 =?utf-8?B?OTBkM2gyMldja24vVUNEWFl5OEFaNFNvUTlEYlBTMmxZczVaWmdLSjR6bi9S?=
 =?utf-8?B?dEVDUGtrR0QxdkxvRHZJKzg2VjJjVGlZck8wZFFGZUJERmN3S3Y3Z1FVKzlX?=
 =?utf-8?B?RUlranljTVRZWmRUOUxyWnYvMmFXMzhqQTB4M0gyUDhGc3hyVmlGYWRuT1BD?=
 =?utf-8?B?VTJoUUt2U0FQTTN4MFMxQzRNVlVKMlVOUFdiV2hkb1Y2RWhQZEJETjQwWnpY?=
 =?utf-8?B?aTNZaHptdGZINVhwK2h3TWpIckx2WllIS3BRN3dIUWFJOW9hNDZaSHd6SlN3?=
 =?utf-8?B?MmVpY0xucEpYZUhKQ1VONnVHaVMvN2t6ZmVoNTloa29JNDcvMkR0dlhjd1Bk?=
 =?utf-8?B?K1d2NWduemdwb2N6U29vUjlCZUJzUi9ISU40d3ZhWG1wSm5wYm0yTVZkU0h4?=
 =?utf-8?B?aUg5aTBSWmdUWmdhSjkyYTJWaHpJS09VUFcrQ25ySWp3R0JraEkyQk9lRkU3?=
 =?utf-8?B?M3I3akh5REZIUW9JZ2JLVjlzZExvL09nWVFDQVI0YU15NktCK052T2FZVWNS?=
 =?utf-8?B?U3BqUzg4WG1pQ01mQWNkZENuUzdjYjlPRkRBSFlpU0xnZ2VMVDV1ZjZaOUJO?=
 =?utf-8?B?RW5ZNTlUTW4xWnFuNGFWYW14VW5GTnpnTmV5S283Z3Zhcldnb0VMMEtmaVNY?=
 =?utf-8?B?bzBvUU9xQVpkU2o0K3VENGI1NUN2ZlBUaXhwKzduWjVTUGFBQldYanc2SCtj?=
 =?utf-8?B?M093SkJSK3o3NHJGNkRxdjNFWFVCM09CS1RnemtUcEQzWnlSNnc1QWk4SXMx?=
 =?utf-8?B?ZExPczBoNFpTNkJtdDdvcFRMZU50b0IxaUpHNXg2a0xncGd5VDQ3VjBuRkd4?=
 =?utf-8?B?NVBLMnZqR2NXOVk0SlQvWDdaMzcyMTRlam5nU2VuczdJT2pRa3VTMWxqR1Yy?=
 =?utf-8?Q?37DJNSY4FoHmSYcaMaYdLcLJ5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40abf111-4026-47b9-599a-08db0dc0849a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 12:47:51.4678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aq5ypWk47mqU/m9lx9rL5jqpab84Knaqb+g9SY1Sm9NxBOVg0ThZNQYBSi36fm5IXiQBSQ7Lv3YRLKlLOyXoEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4997


On 11/02/2023 09:10, Julien Grall wrote:
> Hi,
Hi Julien/Stefano,
>
> On 11/02/2023 00:20, Stefano Stabellini wrote:
>> On Wed, 8 Feb 2023, Ayan Kumar Halder wrote:
>>> dt_device_get_address() can accept u64 only for address and size.
>>> However, the address/size denotes physical addresses. Thus, they should
>>> be represented by 'paddr_t'.
>>> Consequently, we introduce a wrapper for dt_device_get_address() ie
>>> dt_device_get_paddr() which accepts address/size as paddr_t and inturn
>>> invokes dt_device_get_address() after converting address/size to u64.
>>>
>>> The reason for introducing doing this is that in future 'paddr_t' may
>>> be defined as u32. Thus, we need an explicit wrapper to do the type
>>> conversion and return an error in case of truncation.
>>>
>>> With this, callers now invoke dt_device_get_paddr().
>>> dt_device_get_address() is invoked by dt_device_get_paddr() only.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from -
>>>
>>> v1 - 1. New patch.
>>>
>>> v2 - 1. Extracted part of "[XEN v2 05/11] xen/arm: Use paddr_t 
>>> instead of u64 for address/size"
>>> into this patch.
>>>
>>> 2. dt_device_get_address() callers now invoke dt_device_get_paddr() 
>>> instead.
>>>
>>> 3. Logged error in case of truncation.
>>>
>>>   xen/arch/arm/domain_build.c                | 10 +++---
>>>   xen/arch/arm/gic-v2.c                      | 10 +++---
>>>   xen/arch/arm/gic-v3-its.c                  |  4 +--
>>>   xen/arch/arm/gic-v3.c                      | 10 +++---
>>>   xen/arch/arm/pci/pci-host-common.c         |  6 ++--
>>>   xen/arch/arm/platforms/brcm-raspberry-pi.c |  2 +-
>>>   xen/arch/arm/platforms/brcm.c              |  4 +--
>>>   xen/arch/arm/platforms/exynos5.c           | 32 +++++++++----------
>>>   xen/arch/arm/platforms/sunxi.c             |  2 +-
>>>   xen/arch/arm/platforms/xgene-storm.c       |  2 +-
>>>   xen/common/device_tree.c                   | 36 
>>> ++++++++++++++++++++--
>>>   xen/drivers/char/cadence-uart.c            |  4 +--
>>>   xen/drivers/char/exynos4210-uart.c         |  4 +--
>>>   xen/drivers/char/imx-lpuart.c              |  4 +--
>>>   xen/drivers/char/meson-uart.c              |  4 +--
>>>   xen/drivers/char/mvebu-uart.c              |  4 +--
>>>   xen/drivers/char/ns16550.c                 |  2 +-
>>>   xen/drivers/char/omap-uart.c               |  4 +--
>>>   xen/drivers/char/pl011.c                   |  6 ++--
>>>   xen/drivers/char/scif-uart.c               |  4 +--
>>>   xen/drivers/passthrough/arm/ipmmu-vmsa.c   |  8 ++---
>>>   xen/drivers/passthrough/arm/smmu-v3.c      |  2 +-
>>>   xen/drivers/passthrough/arm/smmu.c         |  8 ++---
>>>   xen/include/xen/device_tree.h              |  6 ++--
>>>   24 files changed, 105 insertions(+), 73 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 4d7e67560f..c7e88f5011 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -1692,13 +1692,13 @@ static int __init find_memory_holes(const 
>>> struct kernel_info *kinfo,
>>>       dt_for_each_device_node( dt_host, np )
>>>       {
>>>           unsigned int naddr;
>>> -        u64 addr, size;
>>> +        paddr_t addr, size;
>>>             naddr = dt_number_of_address(np);
>>>             for ( i = 0; i < naddr; i++ )
>>>           {
>>> -            res = dt_device_get_address(np, i, &addr, &size);
>>> +            res = dt_device_get_paddr(np, i, &addr, &size);
>>
>> One thing to be careful here is that "start" and "end" in
>> find_memory_holes are defined now as paddr_t and passed to
>> rangeset_add_range and rangeset_remove_range.
>
> I am a bit puzzled why you are saying "now". Without Ayan's patch addr 
> was 64-bit so...
>
>>
>> rangeset_add_range and rangeset_remove_range take an unsigned long as
>> parameter, so in an arm32 configuration with paddr_t set to 64-bit it
>> would result in truncation
>
> ... the problem you are talking about would already exist.
>
> I would consider to store a frame number rather than the full address 
> because we can only deal with page-aligned region.
>
> Stefano (or Ayan) can you look at it?

I have sent out a patch to address this "[XEN v6 2/2] xen/arm: 
domain_build: Use pfn start and end address for rangeset_{xxx}_range()".

- Ayan

>
> Cheers,
>

