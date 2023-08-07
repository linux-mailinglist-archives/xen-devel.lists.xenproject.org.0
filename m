Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D09F7722F4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 13:44:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578303.905734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyeB-0002JS-UF; Mon, 07 Aug 2023 11:43:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578303.905734; Mon, 07 Aug 2023 11:43:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSyeB-0002Gf-R1; Mon, 07 Aug 2023 11:43:39 +0000
Received: by outflank-mailman (input) for mailman id 578303;
 Mon, 07 Aug 2023 11:43:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2NL=DY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qSyeA-0002GZ-2B
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 11:43:38 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4ed8060-3517-11ee-b27e-6b7b168915f2;
 Mon, 07 Aug 2023 13:43:36 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB9424.namprd12.prod.outlook.com (2603:10b6:8:1b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 11:43:29 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::4541:2a3d:737d:b194%5]) with mapi id 15.20.6652.025; Mon, 7 Aug 2023
 11:43:32 +0000
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
X-Inumbo-ID: a4ed8060-3517-11ee-b27e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHJexwoFqvydswbM/fv8aCGmg1tRTiWwi8RanMUf3lrsfd77ZbLqL06nDI4ZDB2cKKjJ3rs/76PU7JEH5i9RwNzoymE7OxuR3b+kq5qstMHCH+qgr29cOkfYIEkeI5jStKmdE5V0FB7PUCwDwycX/m1Ot3SnBXBZ0f6jWBRGxI2d6EcPh1vCv78fWd4o4o82yAgY1fmHtI6EW2GJ0gFYxqibSqRCDNDKPlJt71eTs2wSbmnwQ2CQlpJWVygYrtWG4qyCm9v6UuxHm/kHkmsJ9D3fFnEsMxSXunPyLoljANWHz5e6w36CUWiYdzHvKlHodCZzmIZVPBZ4QyO/MLwmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw1okKu3nBH6WxItlWol5D5VupEkzRThDOrgmot4L/4=;
 b=KV6Fvst94EaN8d1SeRnxEThrsFMKhEPku6R8neJGBvzR0V5AcrvrecgGWfxICl2AYTE50Sl+mgmZdPXokujweS8/01BBIoWo5VClg98IMRyXPA3HaTKVGOobKDTLwr7ckSMiGb+oHGCyXQ7FhJR7/zgTm/IbTCAVHq1BZGg1NuLUviEoYFQeLI7s2RnPzxWPtpYMWPjC0wgEynn1Awk91UrQs+2bPh0vfoYH8dSkNfMIcc4TP/elj++mUktLtj8Kpczj/5NCuFTKOx/U3Q3UlR69ybypnqnfw/vlusXPZmlLXaixhiJvkelu28VY4Oo9BJNG090aPdl95uxu03K+lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bw1okKu3nBH6WxItlWol5D5VupEkzRThDOrgmot4L/4=;
 b=5ObRrhAf8uOdKqXWtKzBbU3ua+KU7ehfOPGH4QIUN/AIFSC6MKFH+TNhrPSkfiex2u9WanH2JeOEFXWZt+88i7MkGc+354S28ric0kti8cs3zANfCtqrKKTADWcZ2u5p8cuJfUCsgFzhVhDgWZ9LbKqXjrI0xoOPiAqj4kBpm9g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <1366a5b1-4bf4-20d6-73a7-ad1735ab8c10@amd.com>
Date: Mon, 7 Aug 2023 12:43:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v4 01/13] xen/arm64: head.S: Introduce
 enable_{boot,secondary}_cpu_mm
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
 <20230801034419.2047541-2-Henry.Wang@arm.com>
 <79de42d1-35db-79b1-da2a-f08a72fa53d7@amd.com>
 <AS8PR08MB7991B7C1B78531B9322934E2920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <AS8PR08MB7991B7C1B78531B9322934E2920CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::21) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a018b9-fdc3-48e1-6d7a-08db973b862a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A4viv9/dyX6zzMXaDwL9gJOrghBEY7P+fBa0uEpBhqNsmiuye38U+hL5/eGbbLghzOwe8+AwqAtqmEHEO9vy9AUP4Nfcv9kDPIr1R2wyAYSNEv49CwuKr6D+HAJWJDA8Y6FSoxG+AvJqQPIbBs9gp0rHu8r3nzK+zoZ4uTdrT9Y/ZLAKNU+dHpvnub++FsOfVTzS9zWXR06LplMUflt0pHVtqVjq5x5rT2ny8JmOe0LUEODv93WfjLYXiAh900ASuWwkYFlAQ+MO2/mpDwxbkx6u8bNIhca0eR59GpD9nNKrcCgbulT1D6SyoNVgyqvcXweAwGDJKKLU9xjsXVv2pD8l9ZnOhnasexQxaX+MGX40Q4/0IEfPbCpOFTOQdzC1wQZxymEB02NpdYMHwFr/WyGWR5UvK2VBZqUkCLGla2RvUJnhD44Ki8vsFO3RjcaiDrXj2eGr4Us43Qflg9DWRbjEXtgFJtPQhedcMwZe57zp2CiHylylzHWE5mmhaAvQoa65ZcExi/glfpMWxoL7kQ1RaV2V153+cwn2oICblnIieTbJy5OB1Irv0fj0ra4z1e8PUSrBJD/t3meNFN+K3Umq45RBJ+jmOIP5yttj1xEnWo50PBmsENmzGBNQzTwLazleYuSTMQjOgNs1T+BG9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(376002)(136003)(1800799003)(186006)(451199021)(83380400001)(31686004)(2616005)(54906003)(110136005)(2906002)(4326008)(5660300002)(8936002)(316002)(8676002)(66946007)(66556008)(66476007)(38100700002)(966005)(6512007)(478600001)(31696002)(6666004)(6486002)(41300700001)(36756003)(6506007)(26005)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czZpQytjc0xyVzZoQmtlbnN1MmdJdTlwck5tdS9LS2lsUkpsbFE4SGorMVFU?=
 =?utf-8?B?WHZJY0R0MWtoa1k2MkJPTElrOHlBVm12dTc3djlNek1oTXkrWDdqMEYycWlS?=
 =?utf-8?B?QnExYUNOYkZuY012NERxMmtjQnY5akh4eHRncFI4Zk5XQ1Z1RFFSSmkzTHdE?=
 =?utf-8?B?cGFoMVJKNEc2ZmFucnhIeUpKd0pFZWMvL054bW90VHA4czZuSmx4a0hMcG00?=
 =?utf-8?B?YjFzWHAvaGhzZnA5WGw1SUhUOG1BS09uMW90VHJPVFFnTnpYS0Vlc0dSQ21M?=
 =?utf-8?B?NG4yYlF5LzdSZWpOMG1RcG1HU25wc0lMMXM0aWRzYkFBdmR4VXp6cFZHUUov?=
 =?utf-8?B?d0U5Z3BHVVRVQ0NGWG9XNC8zaUJFWG5uWWFRbTVnMm1wSVM3NjNZZkNOMDBh?=
 =?utf-8?B?N1VXUmt1RW9scGlvQjNhMEVVV1U0UnQxbFc1S0RrRktlTXRTd0p3eHFvVlNa?=
 =?utf-8?B?dDJXQTNiRDNwTzh3aXBOOWVrMHg2S3VUWElDR0NxVUVFeGlHeURMelVnRVBo?=
 =?utf-8?B?aldPOHczZXlzT1gvQzI0WXVDZHdCRzNWNnJnYkUvT3h2YWp2amd1cFpPbHdT?=
 =?utf-8?B?UGJidUpjZHVNdTkvVHZLSnd0TUZrSkxTR0txZ3JraENwcVRYaGpKOGpVSXp2?=
 =?utf-8?B?ZlpMK2NvbGk4OWFtNmlvbkF6TVZpU0dyYURwaDJ2a1dpQXpRMWRLOEhLaXZ2?=
 =?utf-8?B?QmRjS3dpMklHOS9PeDFnTklOTjNFMHUrVkErSWgvbnJQTHRZNVMyMG9ZNWdJ?=
 =?utf-8?B?d0dtbWpEYzBQdGk1a09penJoTUdBQUlHakFRYWlWa0l1L21PSERKcHZ6VEFD?=
 =?utf-8?B?dVNCVGZQa2xQN0VJRU00UW9yVXVtQ1U2M3h6VVNJMWErNXBCTzU3dk1xTG1y?=
 =?utf-8?B?N0NjSjVZcDRDSmRQUzE0YjAzWlU2dlNEOFJhZ3JpdHB2bEkxMFFUL0VkN0hh?=
 =?utf-8?B?WkFjZEovU3pDWWJBMUQ5aVdMa1Y0Z0hyOEtVL2llM0F4RVlXWk9MQks1dmxP?=
 =?utf-8?B?SlB0VGNldHpiV0duZ3IxeW9DRFcvWkkxd2x6VnBRMVdtZXo2VmsyaklKVVRu?=
 =?utf-8?B?YU5VdjFvRE80MFhhWjFHdGNsTDJLNFRveTBaY1ptenpUZEtzYkJkNkpFY1Vu?=
 =?utf-8?B?ci9kMTg4QmQvVFl0WFN0Y0JTbmdyRXNLRVpLdStKRFVDWEdrTE1OUXpyVFlH?=
 =?utf-8?B?d21GOVF2cGN3M0ZOTzhjRnE4Zm1JMzRXdVdPRktGY2RhRUVQSXJlNitmbVYy?=
 =?utf-8?B?ZVVnQ2JaV2VvSXUrakJjYzRPRkxkc0YyTUR0aFlDRDJqZjhaMHVqcWJzdnVV?=
 =?utf-8?B?WVB2SU5UcVRGa0l5RVJGcE5ZN1lQMk4yM3F0N2UyNk80V0VFVldaRHR4QUU3?=
 =?utf-8?B?RzMzeG1Rb05hU29KZTZ1eDdDOTB0UzRXNWdhWWdNRnIxQldOV29WUEdCclZq?=
 =?utf-8?B?aURiMVh5cXdaSm1sQlIyb1NtQlk5WVJjRGxVN0x6WDFYcU5Dc0tKSXRnTGNy?=
 =?utf-8?B?OXNwVnlnUWY4YkFkQVBNZG90QytrOUpmMGIvdDVrbkJlOHdXbTI1QkM3Y1R5?=
 =?utf-8?B?UGw3cTNPYy8vT1dNMlh4UE4ySzc4THlwWVFtZGp3ZzMrdjExcVN3WEdBdld4?=
 =?utf-8?B?SkpneXZwRmVMaTZZVXBOMEhla3phRGJ2M0hKaC9KYURMaGpYUFJzR0FoRk0r?=
 =?utf-8?B?SksxaWN5MjAvYlZheERHM2FYbnYrNEhaWVhCeHlpcUNBdE93TUJtT3hxaFJo?=
 =?utf-8?B?VmRySmxQSG1ycVBkWjR4dVFKSVl6ME41elZ3VHFOVEFHL3o2czBnWmlkRUR4?=
 =?utf-8?B?MjV5UCtGK05tRFRja0lZOElJYXFseGJtMGQrTk9kNHZxR2dsdzZOMG9GY01N?=
 =?utf-8?B?ajAvbm10NHhoWnd6eCtId1U0UUh3cHplQi9OYTAwYWxubXgrUVRWY1lKOFl6?=
 =?utf-8?B?Qnd1d3NhQnU5aXZEYURRVC9oZU4xZlJRaDF1UWZxQVdHeEZ3cCtYTktsUGtX?=
 =?utf-8?B?WVNoRklkTW9lU0o0bERGU1hESVRmbTB1RmNLMjJISkxvVkhwV0tuL2lIOEh1?=
 =?utf-8?B?S0dBM1NqZU9WbWJ4TE9IQm5TaWVvcHJZeVlJeE9RRmZtc1lvZ00vQ2s0K01G?=
 =?utf-8?Q?DGJViCVxiUwGB9vOppcWYHu9B?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a018b9-fdc3-48e1-6d7a-08db973b862a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 11:43:31.9712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7GCW1+OpzSAf743qE3y+N/DSKIC3pbiPZG/oOeoVZEN8Dz/T3PPEuCqKPdOufVYFKiC4PzdSOp6sKec2vTX0Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9424


On 07/08/2023 12:35, Henry Wang wrote:
> Hi Ayan,
>
>> -----Original Message-----
>> Hi Henry,
>>
>>> At the moment, on MMU system, enable_mmu() will return to an
>>> address in the 1:1 mapping, then each path is responsible to
>>> switch to virtual runtime mapping. Then remove_identity_mapping()
>>> is called on the boot CPU to remove all 1:1 mapping.
>>>
>>> Since remove_identity_mapping() is not necessary on Non-MMU system,
>>> and we also avoid creating empty function for Non-MMU system, trying
>>> to keep only one codeflow in arm64/head.S, we move path switch and
>>> remove_identity_mapping() in enable_mmu() on MMU system.
>>>
>>> As the remove_identity_mapping should only be called for the boot
>>> CPU only, so we introduce enable_boot_cpu_mm() for boot CPU and
>>> enable_secondary_cpu_mm() for secondary CPUs in this patch.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>> With two comments
>>
>> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>
>> Tested-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Thanks, and...
>
>>> +/*
>>> + * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
>>> + * The function will return to the virtual address provided in LR (e.g. the
>>> + * runtime mapping).
>>> + *
>>> + * Inputs:
>>> + *   lr : Virtual address to return to.
>>> + *
>>> + * Clobbers x0 - x5
>>> + */
>>> +enable_secondary_cpu_mm:
>> I will prefer "enable_secondary_cpu_mmu" as it is MMU specific. And ...
> ...actually this as well as...
>
>>> +/*
>>> + * Enable mm (turn on the data cache and the MMU) for the boot CPU.
>>> + * The function will return to the virtual address provided in LR (e.g. the
>>> + * runtime mapping).
>>> + *
>>> + * Inputs:
>>> + *   lr : Virtual address to return to.
>>> + *
>>> + * Clobbers x0 - x5
>>> + */
>>> +enable_boot_cpu_mm:
>> prefer "enable_boot_cpu_mmu" as it is MMU specific as well.
> ...this, are the name suggested by Julien in [1], so probably I will stick
> to these names, unless he would prefer the proposed names. I would
> personally prefer the names that Julien suggested too, because from
> the comments above these two functions, these functions not only
> enable the MMU, but also turn on the d-cache, hence a more generic
> name (using "mm"), is more appropriate here I guess.
>
> [1] https://lore.kernel.org/xen-devel/c10bc254-ad79-dada-d5fb-9ee619934ffb@xen.org/

This is fine. My concern is minor.

If this file is going to contain MPU specific logic as well in future, 
then suffixing a *_mmu might help to distinguish the two.

- Ayan

>
> Kind regards,
> Henry
>
>> - Ayan

