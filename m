Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DAF692B1D
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 00:24:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493671.763662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQcku-0007A8-RA; Fri, 10 Feb 2023 23:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493671.763662; Fri, 10 Feb 2023 23:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQcku-00077u-Mr; Fri, 10 Feb 2023 23:24:36 +0000
Received: by outflank-mailman (input) for mailman id 493671;
 Fri, 10 Feb 2023 23:24:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I7PS=6G=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pQcks-00077Y-Hq
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 23:24:34 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 108daf73-a99a-11ed-93b5-47a8fe42b414;
 Sat, 11 Feb 2023 00:24:31 +0100 (CET)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DS7PR12MB8252.namprd12.prod.outlook.com (2603:10b6:8:ee::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.19; Fri, 10 Feb 2023 23:24:24 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f803:f951:a68f:663a%8]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 23:24:24 +0000
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
X-Inumbo-ID: 108daf73-a99a-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKO6qDc2uIUTY4ndQdXCVxhwGru0PPetS7fSaK0ALhkGXJkoiAIbC0hnBUaQmNgrvuJwfbOAKZJRm5+S1+IlKi/n83BVNyyril10T4Epm1uZz80K2jNsiLwEtk1VQkUKYWCdSKr8Fo2j4zCvCpQ4VJZW5JRaRYVlvgxGxzsHu7yyNUxTI5RT2UenviXm/YLt07M3lVFTTPoeY49ddhe9zZ5CVa8jrDi2l6hpIqNvl2WeCgKqeXSQo52bm1LmpZVjNgJT0iwhuNWfwo6FtNVXkeI15+47hY6GWALamJLGJYGR2EQIY/Q03DQuZyz9AbZIwPw54dJEZOQcLNMaiJD+CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nehvKniT6zbTnTg+jqNY3Bg4NdxEA5bq+i0j6ucH91Y=;
 b=dP1u0BhOKZug0Zgc2B/PHjjuNClJ+0ANu29/ygzDjaxcG3o9VsiupwQ/kfZ8msavxv5+9QnhTwuebq2CMfX/G5GKhDD6e+h8RVYbzoe1v/DaRV1dpbBPk+9gAXctzO7irIuBwbnzKNnEpY3EenA8aZQm/FuT3aOobtpRtdhPyu+dZd7wz79mlpWK27Ty5zrVVlUJm0VYGtZXlLT9QaBzfQYkGXCrnCKouS4nEezjy+xHP3OZSUkC/jQXIlJzb/7gmLzVqb7QVRaPSeqvc5UoqD2KI/wLdhLH31T/mw28iIA5C2kWvEoMHWH4mAEmV44sH+fJgGabOxhA1LAaAFKydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nehvKniT6zbTnTg+jqNY3Bg4NdxEA5bq+i0j6ucH91Y=;
 b=i2hzGamsCOx/Vjg9QPofFK49cJkcHr7V0mOKBpolPHSjUkfGGEWsGUAmyrrSd9Yg0R3ISucRVUIHHewUyFC+GiI6mYV2YK3L2xSlL0lVWLqdu0gCb32jbh9yqwbVKXL/n50OPVm3eJfd8lHe3XIDF58cSf3JWsGL9u0M4Ji/6W8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <44fca341-b40a-12cd-c97b-7f16f8de0e85@amd.com>
Date: Fri, 10 Feb 2023 15:24:22 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN][RFC PATCH v4 12/16] xen/arm: Implement device tree node
 removal functionalities
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, julien@xen.org, Luca.Fancellu@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-6-vikram.garhwal@amd.com>
 <b1b5c81a-733d-6bf3-c711-0af5b68009db@amd.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <b1b5c81a-733d-6bf3-c711-0af5b68009db@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:a03:331::28) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DS7PR12MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f20fc56-805e-48b5-b60d-08db0bbdf1f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	izjVo3pPRmfPD+V9tOO1OGI0gq1KSz6sfGOHxPgpIuOfRvE7I6WZQDmTuEZCeBE/EJCHNmoDEA0EeOWbmuQ5N/bd68bcdl6CxjB/NRWisB6V2mQnkbA5dbr8tKJd11ktxWckpeUYUVOPZ2j8f4GgHEd3fCB1V4EFIHm2bdVSYXBmeJuPqHM9sY9TX4udeuLXpvr85LByh+igfCVW/vsqcnVWNJGrvQioStKB6l0RpRHvNebjFgtFbIDL9VbCfRRdJGaib/eyBdsOqOfe+MAJeE4z9RdCcW4qfA4xHszXRSNASBABI9BPRiWrHVTuBB15z97Bwdvib+nLGcFRNQNd8V4CVqFJtU/KsYnhj0bc6d/2dxdERKhgvqwfXy1e9P91m1UL7A5FJXb98pchlwXjCDL8RQLYC2PQJhUbVN5PbXgskraK6qeBb861pRbvO8mHyblJNjtWot4Sl8i2W1fQbUDnUD+df0OK0HH1+4vSzCySQeocLlxrBsf7IEVGWC1bXotKuF/zhkAZP8PxId4C8KLFcsik80sfKIPqmR23SVBxV7i/t/80Z3yIg9S9eTX/NA3TX9dcPNz2Jt5DX0MofT1nkb3UZt/DERtJmvBcQzmefFp4SVKRJIUoTfcmd4PU2phrRAabdon0n7Vwluqi34O8TDDzLbvFZFtrNc8hIa2n0xrJ9OCpngk83WSJosPlFCStR68os1t6kUk/JAG7aP67E0WLc63N19+PQlsIPDDXeD/XtRIdyfW6nWi1xQ+V3lT0PXWm5izJqHUBi6Cq0uflkP8MvEx3SsN2MD/t+6To6qt7Wip6BhXPgMLVkYoR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199018)(66946007)(66556008)(4326008)(66476007)(8676002)(36756003)(38100700002)(86362001)(31696002)(316002)(44832011)(5660300002)(41300700001)(30864003)(8936002)(2906002)(83380400001)(26005)(186003)(6506007)(53546011)(2616005)(54906003)(31686004)(6512007)(478600001)(966005)(6486002)(403724002)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2U0Y254c2E3eExWSUNNSWdKWkxPSy9HRGR5TjZaWVNscTU4U3JJaERqWGJF?=
 =?utf-8?B?cDZBZ0ZseHN2eEx4MEUyb0FXTGtaaGZteE5sdFpuaDZFb2NFSVdURHpTMlQ3?=
 =?utf-8?B?VTFGd1Jqa2pzT3M1YVZRaCt4dlFWRDJZS0VPMjF1RFJiYmZDK3lONHBEMUd6?=
 =?utf-8?B?Z1VDQ1ptaUlCUC9aTEZQa2k4cW10d1gyL0psSmtQUzRQQWRCUkg3SjZRbmVw?=
 =?utf-8?B?QlBzNWcvNTFEZUNzSEdIVDhuOHV3WVBReTBDRzc0K3NSMHF6bzJnMlp2OGJi?=
 =?utf-8?B?U0xtaTNNU2NRdURCWnoxL3B1UWF6NjZ6QzJPVC9uaVVXY1BvZzQwa1JmNWgv?=
 =?utf-8?B?cmUrdzlvRGw1WDluOVJOQktUclp0UmIzMlpQc0o2dVRYMGVjUWR1dm15bjhN?=
 =?utf-8?B?YWZBdklZNU94bEozTitvcXNWN0ZxUkVJQ0MwYlNpRERtVnIxNVA2QndINmdi?=
 =?utf-8?B?anFQczdZelFSY09HQ3JIU0V1NWxqbHhwYlk4RE14cDFiS3Y3QnY1SFRORlhP?=
 =?utf-8?B?SEF5aVZaMVNXdWd6WjBZUlIzUGllSzYrWklTNkNxYlN2QUo0SHlmQXdjNHVC?=
 =?utf-8?B?c3RUVmFqZ2xybU1DZzIwVHFVV3N3TUxqb1hNemczU0tOU2pQOTdVNmQvUXpP?=
 =?utf-8?B?VXZOWnhQSjcvRzd3RmcyMWZMalpVUWlsN0M3Y0Vhc1BXQ3Naa3p2SUxxcklq?=
 =?utf-8?B?V1phQTNNZDFSNjFHMCtWVlFabE9xTi9BMk1CdUd6Vldpdy9EODFpbnJaZ3pT?=
 =?utf-8?B?WFpWazRoK1dOWkppaXROb3Z5Zmt2MmN6Um5JSkV1d1YwYlFQODRZUHB3S0N6?=
 =?utf-8?B?KzROY0VDRGIrdHBZd3dGa0t0cTQwZ0xuZzN2b25QWHNhUld5Vlk0djRpUk9I?=
 =?utf-8?B?OWJ2L3h4TXBNNXk1M2NZRmQvenVCeDdJMzk2TFZSNjlEZm9JNENsTmpZSnlj?=
 =?utf-8?B?Ti9IN2tidXhsTEp1dEU5ZXJFWGtUbDcrZmFsOUZ1dVZ5cWl6MWxQeXhDdFN5?=
 =?utf-8?B?OGY1TkNHS1hDZE11aHQraDRoY3NjM285STRLYm9SY1dqdTk4VW1VdkVDckJv?=
 =?utf-8?B?c011NzE1WENrczlORXp1QkxVYjE1RFA3OXFlUGZNbDZUdGZMMWpOUkM1bkxq?=
 =?utf-8?B?VkFJS1pKT1JEL0J3bDAzOUowNUdIRWxzNHZ4VkxKL3FzSDVSK1lhcDBUSXRK?=
 =?utf-8?B?amdWZmphVzRIN21pMFpFbm9ud0hUQWZNV0xsYzdWK0hiSFhzeUJENmRZcDMx?=
 =?utf-8?B?cmRYeXB2SXA2K002SXEyNWFSelI5alRvNmI0aGFvS21QYzR1SWNqNkRBRUh5?=
 =?utf-8?B?TFVoL0dXQVZZcWYrcGF1L3U0RE9YbUJQZ0tNK0J4S0lXK3B6NVRQeE5QSHly?=
 =?utf-8?B?ZmFQcC9jZVJPNGJ2RDJFdDE1QUxkZkhWTi9rMFpiMWJkcHNLY1pSQm1VK1VG?=
 =?utf-8?B?RGYwejg0S3c1VStsRHhMVXkrV1NnNEdBUXBnTVQ5dXNmR3BJRGF3T1J3WmE5?=
 =?utf-8?B?TldaajRVamtqYk5zUTBOalhNcVFnOThLUjVuZzM1WHRPeEM2VEZpcWtDQ3JM?=
 =?utf-8?B?aWQrZG1rVEhsWDhqUHZRQ25GQUpFOGhSdHptSk9DSHRSaWhCQmZyUDRYSE5E?=
 =?utf-8?B?YnU0OFFxQUhsak5qczg0VWhTdHBpTVJMR0NPc0ZjRnFRcUNNamh3bkNBbTR6?=
 =?utf-8?B?ZG10eXVXZTMraXN4SURqdXdWSm51VzQ4dFlSNHpZLytreGF5ajQzUU9zWmFs?=
 =?utf-8?B?TEVVWXBBV1hDcnRPcEhMNDNHVi9FYTQ4Z2Rtb0prZWlpTVJlL3dERDlCdzhK?=
 =?utf-8?B?aGZQR1loK1VOU0YxeStyeHVrd21hWFg1RWtteGp4VU56d0U2ZDAvQndGbHU3?=
 =?utf-8?B?N01HNkNDbEU1MnB1ZzYyeGQvbGp5SUk3SWFWUW10R2pzM2I0THZpeXkrUm9K?=
 =?utf-8?B?amZSRTMyUGhHVHRWMFhZZ3UyREc5L0d6Z083M0s3TVdRQllGTnlaZ2dpL2Iy?=
 =?utf-8?B?WnMwOFB0M0JYMEQvNkZsckhLMXM3d1gvTlZQcEl0VkJmbXJaZ1JINHBuQXJm?=
 =?utf-8?B?RnU2d0JqZTM1SUhseUlnUERxclZINWJXQ1VwNlN0MWhPRGRJZkN5SnpvOFpN?=
 =?utf-8?Q?mejY975zKoTj/r063Svjok3hF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f20fc56-805e-48b5-b60d-08db0bbdf1f0
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 23:24:24.0752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15TEUbUvmLy+l9EXyRBEKnSvsQntVNA04IYRyBVRz0nKpIH0lfVb1BBmd0nVmRc+UIFdyAgymw3JrTPnS3o/LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8252

Hi Michal,

On 1/24/23 1:01 AM, Michal Orzel wrote:
> Hi Vikram,
>
> You received extensive feedback for v3 from others, so I will limit my review to just coding
> and general comments.
>
> On 07/12/2022 07:18, Vikram Garhwal wrote:
>>
>> Introduce sysctl XEN_SYSCTL_dt_overlay to remove device-tree nodes added using
>> device tree overlay.
>>
>> xl dt_overlay remove file.dtbo:
>>      Removes all the nodes in a given dtbo.
>>      First, removes IRQ permissions and MMIO accesses. Next, it finds the nodes
>>      in dt_host and delete the device node entries from dt_host.
>>
>>      The nodes get removed only if it is not used by any of dom0 or domio.
>>
>> Also, added overlay_track struct to keep the track of added node through device
>> tree overlay. overlay_track has dt_host_new which is unflattened form of updated
>> fdt and name of overlay nodes. When a node is removed, we also free the memory
>> used by overlay_track for the particular overlay node.
>>
>> Nested overlay removal is supported in sequential manner only i.e. if
>> overlay_child nests under overlay_parent, it is assumed that user first removes
>> overlay_child and then removes overlay_parent.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   xen/common/Makefile          |   1 +
>>   xen/common/dt_overlay.c      | 411 +++++++++++++++++++++++++++++++++++
>>   xen/common/sysctl.c          |   5 +
>>   xen/include/public/sysctl.h  |  19 ++
>>   xen/include/xen/dt_overlay.h |  55 +++++
>>   5 files changed, 491 insertions(+)
>>   create mode 100644 xen/common/dt_overlay.c
>>   create mode 100644 xen/include/xen/dt_overlay.h
>>
>> diff --git a/xen/common/Makefile b/xen/common/Makefile
>> index 3baf83d527..58a35f55b2 100644
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -7,6 +7,7 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
>>   obj-$(CONFIG_HAS_DEVICE_TREE) += device_tree.o
>>   obj-$(CONFIG_IOREQ_SERVER) += dm.o
>>   obj-y += domain.o
>> +obj-$(CONFIG_OVERLAY_DTB) += dt_overlay.o
>>   obj-y += event_2l.o
>>   obj-y += event_channel.o
>>   obj-y += event_fifo.o
>> diff --git a/xen/common/dt_overlay.c b/xen/common/dt_overlay.c
>> new file mode 100644
>> index 0000000000..477341f0aa
>> --- /dev/null
>> +++ b/xen/common/dt_overlay.c
>> @@ -0,0 +1,411 @@
>> +/*
>> + * xen/common/dt_overlay.c
> New files should start with SPDX comment expressing license.
>
>> + *
>> + * Device tree overlay support in Xen.
>> + *
>> + * Copyright (c) 2022 AMD Inc.
>> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms and conditions of the GNU General Public
>> + * License, version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +#include <xen/iocap.h>
>> +#include <xen/xmalloc.h>
>> +#include <asm/domain_build.h>
>> +#include <xen/dt_overlay.h>
>> +#include <xen/guest_access.h>
>> +
>> +static LIST_HEAD(overlay_tracker);
>> +static DEFINE_SPINLOCK(overlay_lock);
>> +
>> +/* Find last descendants of the device_node. */
>> +static struct dt_device_node *find_last_descendants_node(
>> +                                            struct dt_device_node *device_node)
>> +{
>> +    struct dt_device_node *child_node;
>> +
>> +    for ( child_node = device_node->child; child_node->sibling != NULL;
>> +          child_node = child_node->sibling )
>> +    {
>> +    }
>> +
>> +    /* If last child_node also have children. */
>> +    if ( child_node->child )
>> +        child_node = find_last_descendants_node(child_node);
> Please add a blank line here.
>
>> +    return child_node;
>> +}
>> +
>> +static int dt_overlay_remove_node(struct dt_device_node *device_node)
>> +{
>> +    struct dt_device_node *np;
>> +    struct dt_device_node *parent_node;
>> +    struct dt_device_node *device_node_last_descendant = device_node->child;
>> +
>> +    parent_node = device_node->parent;
>> +
>> +    if ( parent_node == NULL )
>> +    {
>> +        dt_dprintk("%s's parent node not found\n", device_node->name);
>> +        return -EFAULT;
>> +    }
>> +
>> +    np = parent_node->child;
>> +
>> +    if ( np == NULL )
>> +    {
>> +        dt_dprintk("parent node %s's not found\n", parent_node->name);
>> +        return -EFAULT;
>> +    }
>> +
>> +    /* If node to be removed is only child node or first child. */
>> +    if ( !dt_node_cmp(np->full_name, device_node->full_name) )
>> +    {
>> +        parent_node->child = np->sibling;
>> +
>> +        /*
>> +         * Iterate over all child nodes of device_node. Given that we are
>> +         * removing parent node, we need to remove all it's descendants too.
>> +         */
>> +        if ( device_node_last_descendant )
>> +        {
>> +            device_node_last_descendant =
>> +                                        find_last_descendants_node(device_node);
>> +            parent_node->allnext = device_node_last_descendant->allnext;
>> +        }
>> +        else
>> +            parent_node->allnext = np->allnext;
>> +
>> +        return 0;
>> +    }
>> +
>> +    for ( np = parent_node->child; np->sibling != NULL; np = np->sibling )
>> +    {
>> +        if ( !dt_node_cmp(np->sibling->full_name, device_node->full_name) )
>> +        {
>> +            /* Found the node. Now we remove it. */
>> +            np->sibling = np->sibling->sibling;
>> +
>> +            if ( np->child )
>> +                np = find_last_descendants_node(np);
>> +
>> +            /*
>> +             * Iterate over all child nodes of device_node. Given that we are
>> +             * removing parent node, we need to remove all it's descendants too.
>> +             */
>> +            if ( device_node_last_descendant )
>> +                device_node_last_descendant =
>> +                                        find_last_descendants_node(device_node);
>> +
>> +            if ( device_node_last_descendant )
>> +                np->allnext = device_node_last_descendant->allnext;
>> +            else
>> +                np->allnext = np->allnext->allnext;
>> +
>> +            break;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/* Basic sanity check for the dtbo tool stack provided to Xen. */
>> +static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
>> +{
>> +    if ( (fdt_totalsize(overlay_fdt) != overlay_fdt_size) ||
>> +          fdt_check_header(overlay_fdt) )
>> +    {
>> +        printk(XENLOG_ERR "The overlay FDT is not a valid Flat Device Tree\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +/* Count number of nodes till one level of __overlay__ tag. */
>> +static unsigned int overlay_node_count(void *fdto)
>> +{
>> +    unsigned int num_overlay_nodes = 0;
>> +    int fragment;
>> +
>> +    fdt_for_each_subnode(fragment, fdto, 0)
>> +    {
>> +        int subnode;
>> +        int overlay;
>> +
>> +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
>> +
>> +        /*
>> +         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
>> +         * overlay >= 0. So, no need for a overlay>=0 check here.
>> +         */
>> +        fdt_for_each_subnode(subnode, fdto, overlay)
>> +        {
>> +            num_overlay_nodes++;
>> +        }
>> +    }
>> +
>> +    return num_overlay_nodes;
>> +}
>> +
>> +static int handle_remove_irq_iommu(struct dt_device_node *device_node)
>> +{
>> +    int rc = 0;
>> +    struct domain *d = hardware_domain;
>> +    domid_t domid = 0;
> No need for this assignment.
>
>> +    unsigned int naddr, len;
>> +    unsigned int i, nirq;
>> +    u64 addr, size;
> We should not be using types like these anymore. Use uint64_t.
>
>> +
>> +    domid = dt_device_used_by(device_node);
>> +
>> +    dt_dprintk("Checking if node %s is used by any domain\n",
>> +               device_node->full_name);
>> +
>> +    /* Remove the node iff it's assigned to domain 0 or domain io. */
>> +    if ( domid != 0 && domid != DOMID_IO )
>> +    {
>> +        printk(XENLOG_ERR "Device %s as it is being used by domain %d. Removing nodes failed\n",
>> +               device_node->full_name, domid);
>> +        return -EINVAL;
>> +    }
>> +
>> +    dt_dprintk("Removing node: %s\n", device_node->full_name);
>> +
>> +    nirq = dt_number_of_irq(device_node);
>> +
>> +    /* Remove IRQ permission */
>> +    for ( i = 0; i < nirq; i++ )
>> +    {
>> +        rc = platform_get_irq(device_node, i);;
>> +
>> +        if ( irq_access_permitted(d, rc) == false )
>> +        {
>> +            printk(XENLOG_ERR "IRQ %d is not routed to domain %d\n", rc,
>> +                   domid);
>> +            return -EINVAL;
>> +        }
>> +        /*
>> +         * TODO: We don't handle shared IRQs for now. So, it is assumed that
>> +         * the IRQs was not shared with another devices.
>> +         */
>> +        rc = irq_deny_access(d, rc);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR "unable to revoke access for irq %u for %s\n",
>> +                   i, device_node->full_name);
>> +            return rc;
>> +        }
>> +    }
>> +
>> +    /* Check if iommu property exists. */
>> +    if ( dt_get_property(device_node, "iommus", &len) )
>> +    {
>> +
> Remove extra line.
>
>> +        rc = iommu_remove_dt_device(device_node);
>> +        if ( rc != 0 && rc != -ENXIO )
>> +            return rc;
>> +    }
>> +
>> +    naddr = dt_number_of_address(device_node);
>> +
>> +    /* Remove mmio access. */
>> +    for ( i = 0; i < naddr; i++ )
>> +    {
>> +        rc = dt_device_get_address(device_node, i, &addr, &size);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
>> +                   i, dt_node_full_name(device_node));
>> +            return rc;
>> +        }
>> +
>> +        rc = iomem_deny_access(d, paddr_to_pfn(addr),
>> +                               paddr_to_pfn(PAGE_ALIGN(addr + size - 1)));
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR "Unable to remove dom%d access to"
>> +                   " 0x%"PRIx64" - 0x%"PRIx64"\n",
>> +                   d->domain_id,
>> +                   addr & PAGE_MASK, PAGE_ALIGN(addr + size) - 1);
>> +            return rc;
>> +        }
> What about removing p2m mappings (comment from Julien on v3)?

The main purpose of this series to address first part of dynamic programming i.e.
making Xen aware of new device tree node which means updating the dt_host with overlay node
information. Here we are adding/removing node from dt_host, and checking/set IOMMU and IRQ
permission but never mapping them to any domain. Right now, mapping/Un-mapping will happen
only when a new domU is created/destroyed using "xl create".

To map IOREQ and IOMMU during runtime, there will be another small series after this one where we
will do the actual IOMMU and IRQ mapping do a running domain and will call unmap_mmio_regions()
to remove the mapping.

Here is the patch for that series:
	https://github.com/Xilinx/xen/commit/76fcd5defc1c7c375cb99ac73a4d1138aa87d474
I will clean it and send once current series is done.

Also, If you see addition part of this series, we put "skip_mapping = true" which means
map_range_to_domain()->map_range_p2mt() is never called. The only thing function which will
be called is iomem_permit_access() while adding the node and here we are calling opposite
function to remove the access.

Please let me know if my explanation is not clear.

I addressed rest of your comments in next series.

Regards,
Vikram

>
>> +
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/* Removes all descendants of the given node. */
>> +static int remove_all_descendant_nodes(struct dt_device_node *device_node)
>> +{
>> +    int rc = 0;
>> +    struct dt_device_node *child_node;
>> +
>> +    for ( child_node = device_node->child; child_node != NULL;
>> +         child_node = child_node->sibling )
>> +    {
>> +        if ( child_node->child )
>> +            remove_all_descendant_nodes(child_node);
>> +
>> +        rc = handle_remove_irq_iommu(child_node);
>> +        if ( rc )
>> +            return rc;
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/* Remove nodes from dt_host. */
>> +static int remove_nodes(const struct overlay_track *tracker)
>> +{
>> +    int rc = 0;
>> +    struct dt_device_node *overlay_node;
>> +    unsigned int j;
>> +
>> +    for ( j = 0; j < tracker->num_nodes; j++ )
>> +    {
>> +        overlay_node = (struct dt_device_node *)tracker->nodes_address[j];
>> +        if ( overlay_node == NULL )
>> +        {
>> +            printk(XENLOG_ERR "Device %s is not present in the tree. Removing nodes failed\n",
>> +                   overlay_node->full_name);
>> +            return -EINVAL;
>> +        }
>> +
>> +        rc = remove_all_descendant_nodes(overlay_node);
>> +
>> +        /* All children nodes are unmapped. Now remove the node itself. */
>> +        rc = handle_remove_irq_iommu(overlay_node);
>> +        if ( rc )
>> +            return rc;
>> +
>> +        read_lock(&dt_host->lock);
>> +
>> +        rc = dt_overlay_remove_node(overlay_node);
>> +        if ( rc )
>> +        {
>> +            read_unlock(&dt_host->lock);
>> +
>> +            return rc;
>> +        }
>> +
>> +        read_unlock(&dt_host->lock);
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/*
>> + * First finds the device node to remove. Check if the device is being used by
>> + * any dom and finally remove it from dt_host. IOMMU is already being taken care
>> + * while destroying the domain.
>> + */
>> +static long handle_remove_overlay_nodes(void *overlay_fdt,
>> +                                        uint32_t overlay_fdt_size)
>> +{
>> +    int rc = 0;
>> +    struct overlay_track *entry, *temp, *track;
>> +    bool found_entry = false;
>> +
>> +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
>> +    if ( rc )
>> +        return rc;
>> +
>> +    if ( overlay_node_count(overlay_fdt) == 0 )
>> +        return -ENOMEM;
>> +
>> +    spin_lock(&overlay_lock);
>> +
>> +    /*
>> +     * First check if dtbo is correct i.e. it should one of the dtbo which was
>> +     * used when dynamically adding the node.
>> +     * Limitation: Cases with same node names but different property are not
>> +     * supported currently. We are relying on user to provide the same dtbo
>> +     * as it was used when adding the nodes.
>> +     */
>> +    list_for_each_entry_safe( entry, temp, &overlay_tracker, entry )
>> +    {
>> +        if ( memcmp(entry->overlay_fdt, overlay_fdt, overlay_fdt_size) == 0 )
>> +        {
>> +            track = entry;
>> +            found_entry = true;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if ( found_entry == false )
>> +    {
>> +        rc = -EINVAL;
>> +
>> +        printk(XENLOG_ERR "Cannot find any matching tracker with input dtbo."
>> +               " Removing nodes is supported for only prior added dtbo. Please"
>> +               " provide a valid dtbo which was used to add the nodes.\n");
>> +        goto out;
>> +
>> +    }
>> +
>> +    rc = remove_nodes(entry);
>> +
>> +    if ( rc )
>> +    {
>> +        printk(XENLOG_ERR "Removing node failed\n");
>> +        goto out;
>> +    }
>> +
>> +    list_del(&entry->entry);
>> +
>> +    xfree(entry->dt_host_new);
>> +    xfree(entry->fdt);
>> +    xfree(entry->overlay_fdt);
>> +
>> +    xfree(entry->nodes_address);
>> +
>> +    xfree(entry);
>> +
>> +out:
>> +    spin_unlock(&overlay_lock);
>> +    return rc;
>> +}
>> +
>> +long dt_sysctl(struct xen_sysctl_dt_overlay *op)
>> +{
>> +    long ret = 0;
> No need for assignign a value that will be reassigned anyway.
>
>> +    void *overlay_fdt;
>> +
>> +    if ( op->overlay_fdt_size <= 0 || op->overlay_fdt_size > 500000 )
> FWICS, you want to limit the fdt size to 500KB which should be 512000.
> Also, it would be clearer to use KB(500). Otherwise such value is a bit ambiguous.
> Also overlay_fdt_size cannot be < 0.
>
>> +        return -EINVAL;
>> +
>> +    overlay_fdt = xmalloc_bytes(op->overlay_fdt_size);
> If you alloc the bytes here and the op will not be XEN_SYSCTL_DT_OVERLAY_REMOVE,
> then you will end up without freeing it.
>
>> +
>> +    if ( overlay_fdt == NULL )
>> +        return -ENOMEM;
>> +
>> +    ret = copy_from_guest(overlay_fdt, op->overlay_fdt, op->overlay_fdt_size);
>> +    if ( ret )
>> +    {
>> +        gprintk(XENLOG_ERR, "copy from guest failed\n");
>> +        xfree(overlay_fdt);
>> +
>> +        return -EFAULT;
>> +    }
>> +
>> +    switch ( op->overlay_op )
>> +    {
>> +    case XEN_SYSCTL_DT_OVERLAY_REMOVE:
>> +        ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
>> +        xfree(overlay_fdt);
>> +
>> +        break;
>> +
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return ret;
>> +}
> Don't you want to put EMACS comments block here?
>
>> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
>> index 02505ab044..bb338b7c27 100644
>> --- a/xen/common/sysctl.c
>> +++ b/xen/common/sysctl.c
>> @@ -28,6 +28,7 @@
>>   #include <xen/pmstat.h>
>>   #include <xen/livepatch.h>
>>   #include <xen/coverage.h>
>> +#include <xen/dt_overlay.h>
>>
>>   long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>   {
>> @@ -482,6 +483,10 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>               copyback = 1;
>>           break;
>>
>> +    case XEN_SYSCTL_dt_overlay:
> If you protect xen_sysctl_dt_overlay with ARM ifdefery as Jan suggested,
> then you should move this handling to arch_do_sysctl.
>
>> +        ret = dt_sysctl(&op->u.dt_overlay);
>> +        break;
>> +
>>       default:
>>           ret = arch_do_sysctl(op, u_sysctl);
>>           copyback = 0;
>> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
>> index 5672906729..4bc76bbe27 100644
>> --- a/xen/include/public/sysctl.h
>> +++ b/xen/include/public/sysctl.h
>> @@ -1079,6 +1079,23 @@ typedef struct xen_sysctl_cpu_policy xen_sysctl_cpu_policy_t;
>>   DEFINE_XEN_GUEST_HANDLE(xen_sysctl_cpu_policy_t);
>>   #endif
>>
>> +#define XEN_SYSCTL_DT_OVERLAY_ADD                   1
> I'm not sure whether the ADD macro should be added in this patch.
>
>> +#define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
>> +
>> +/*
>> + * XEN_SYSCTL_dt_overlay
>> + * Performs addition/removal of device tree nodes under parent node using dtbo.
>> + * This does in three steps:
>> + *  - Adds/Removes the nodes from dt_host.
>> + *  - Adds/Removes IRQ permission for the nodes.
>> + *  - Adds/Removes MMIO accesses.
>> + */
>> +struct xen_sysctl_dt_overlay {
>> +    XEN_GUEST_HANDLE_64(void) overlay_fdt;
> FWICS, this is the output variable and it would be beneficial to add a comment.
> Also, usually IN variables appear first.
>
>> +    uint32_t overlay_fdt_size;  /* Overlay dtb size. */
>> +    uint8_t overlay_op; /* Add or remove. */
> These are the input variables, so the comment should be e.g. /* IN: Overlay dtb size */
>
>> +};
>> +
>>   struct xen_sysctl {
>>       uint32_t cmd;
>>   #define XEN_SYSCTL_readconsole                    1
>> @@ -1109,6 +1126,7 @@ struct xen_sysctl {
>>   #define XEN_SYSCTL_livepatch_op                  27
>>   /* #define XEN_SYSCTL_set_parameter              28 */
>>   #define XEN_SYSCTL_get_cpu_policy                29
>> +#define XEN_SYSCTL_dt_overlay                    30
>>       uint32_t interface_version; /* XEN_SYSCTL_INTERFACE_VERSION */
>>       union {
>>           struct xen_sysctl_readconsole       readconsole;
>> @@ -1139,6 +1157,7 @@ struct xen_sysctl {
>>   #if defined(__i386__) || defined(__x86_64__)
>>           struct xen_sysctl_cpu_policy        cpu_policy;
>>   #endif
>> +        struct xen_sysctl_dt_overlay        dt_overlay;
>>           uint8_t                             pad[128];
>>       } u;
>>   };
>> diff --git a/xen/include/xen/dt_overlay.h b/xen/include/xen/dt_overlay.h
>> new file mode 100644
>> index 0000000000..30f4b86586
>> --- /dev/null
>> +++ b/xen/include/xen/dt_overlay.h
>> @@ -0,0 +1,55 @@
>> +/*
> Missing SPDX comment at the top of the files.
>
>> + * xen/common/dt_overlay.h
> Incorrect path.
>
>> + *
>> + * Device tree overlay support in Xen.
>> + *
>> + * Copyright (c) 2022 AMD Inc.
>> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms and conditions of the GNU General Public
>> + * License, version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +#ifndef __XEN_DT_SYSCTL_H__
>> +#define __XEN_DT_SYSCTL_H__
>> +
>> +#include <xen/list.h>
>> +#include <xen/libfdt/libfdt.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/rangeset.h>
>> +
>> +/*
>> + * overlay_node_track describes information about added nodes through dtbo.
>> + * @entry: List pointer.
>> + * @dt_host_new: Pointer to the updated dt_host_new unflattened 'updated fdt'.
>> + * @fdt: Stores the fdt.
>> + * @nodes_fullname: Stores the full name of nodes.
>> + * @nodes_irq: Stores the IRQ added from overlay dtb.
>> + * @node_num_irq: Stores num of IRQ for each node in overlay dtb.
>> + * @num_nodes: Stores total number of nodes in overlay dtb.
>> + */
>> +struct overlay_track {
>> +    struct list_head entry;
>> +    struct dt_device_node *dt_host_new;
>> +    void *fdt;
>> +    void *overlay_fdt;
>> +    unsigned long *nodes_address;
>> +    unsigned int num_nodes;
>> +};
>> +
>> +struct xen_sysctl_dt_overlay;
>> +
>> +#ifdef CONFIG_OVERLAY_DTB
>> +long dt_sysctl(struct xen_sysctl_dt_overlay *op);
>> +#else
>> +static inline long dt_sysctl(struct xen_sysctl_dt_overlay *op)
>> +{
>> +    return -ENOSYS;
>> +}
>> +#endif
>> +#endif
> Don't you want to put EMACS comments block here?
>
>> --
>> 2.17.1
>>
>>
> ~Michal


