Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFE724E29
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 22:34:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544236.849864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6dNB-0003pS-AS; Tue, 06 Jun 2023 20:33:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544236.849864; Tue, 06 Jun 2023 20:33:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6dNB-0003mN-73; Tue, 06 Jun 2023 20:33:45 +0000
Received: by outflank-mailman (input) for mailman id 544236;
 Tue, 06 Jun 2023 20:33:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNFn=B2=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q6dNA-0003mH-Gn
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 20:33:44 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d37014c-04a9-11ee-b232-6b7b168915f2;
 Tue, 06 Jun 2023 22:33:43 +0200 (CEST)
Received: from MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 20:33:40 +0000
Received: from MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::61d6:7feb:e8e8:bc4]) by MN2PR12MB4408.namprd12.prod.outlook.com
 ([fe80::61d6:7feb:e8e8:bc4%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 20:33:40 +0000
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
X-Inumbo-ID: 6d37014c-04a9-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBs6eQ9npMemXf9nxgz5nIMThxdQNdNjE1L2nhZssx1QzJoIutc8zFs3gcjQ/AJSQhkQfF5x0NeIfrstWWqPR3cHG3LezXpN9DhOQErNwYYLlEmHpKXJrmXWVmv6/ktpP9z8GdMRqPq4pZo49ARGHnf5cP18lwchk/ZlQmWC1shou5kUiWhCHS+Ly6Wm87unJuRzyt3ueHeBYBvyi3bLoREvww1h1e2CgadzPm7zA37i2Q3U4XolLmW2CxF/Qc90Ri/FCk4gNkrB0RwHx9nMI4hn5CpZJps8qrNuMDtjbhbVkYCC0N75UEkpWEOTkK6KiZarGMYAq26t0dQFVT1USA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/6+p8zqO5QnQqWj79oCRJlUkmOshIvTqZgbo1ZyT3XQ=;
 b=UDCoauNnxdrNW22Z3Jur5W83a8aCe66COHNXUaj1vhpXMVtL6JgjgqVsl7DhFgmTRI92irxDmJRNxrxtW9wAAOVAbZ5jXL37TYwV12cstEY8K3AYUbwy0BdN5d70vUHf4WYdiqtyArOUovjDpnKIU40hBZMCv9KtNN1XRimGozU282ZCBpyLIE0zRhCgCr3zplkSgpRSd3fTry3HPQCfAxb4LPmHr01wVbgPe7/xrABQT5kfILqAavDBN5q0OoP+qVYdIAAU0Z3xcns95EPWZGs5a/lzSxXvz13KMcR1GmbhVhApKCCMrbhaX5QdMVAyIm/jS9s/vubUogCx2/2KAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/6+p8zqO5QnQqWj79oCRJlUkmOshIvTqZgbo1ZyT3XQ=;
 b=4Z1YXclgIpwsyjx5XL7AKGQylmUnmeaeXE50ZoaY3EgMOsnmM8FSnp7ZlvCgjUP21ABLDn3wYlcY4jRnfjpK1W8J7C+UNeeTi2FPGqJaN3VFoUz5yDt2w47uljV0wznYsvxP2N8OnruNncmbKJJu7idX6ou1Z2khD1/J7LlOFSA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ec06ab67-1868-dbe3-7b7f-491846183efb@amd.com>
Date: Tue, 6 Jun 2023 13:33:36 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v7 09/19] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, jbeulich@suse.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-10-vikram.garhwal@amd.com>
 <a818b17e-c471-7920-d650-fa9736b514f3@amd.com>
 <1d4705b1-8e0d-ace9-333c-1e23d30c8afb@xen.org>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <1d4705b1-8e0d-ace9-333c-1e23d30c8afb@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To MN2PR12MB4408.namprd12.prod.outlook.com
 (2603:10b6:208:26c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4408:EE_|DM6PR12MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: c5eb1b42-b7a3-48fd-62ac-08db66cd4fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7FION6idDjnP/qlPmdGDQ8xr99S1aOuYVFvllyyR5b8QfoTeQomSKGbMdiwj18N9AfN34YiMJXx9ACttWAH35sAt6w7x8e/1LrXpUXhIWQ9Dijo79fhKTroVhjTBjIJUFY6U3h6WI3mcLZR8/9E8t8wx/U/QrXzmo9cM5dUqJrPk/CA4tmBizlSoUEZgSwSSlKsqFjNUfswUoxwYAyN9orlH/kVbRIo9Z8cCpS+jDweeco3b/WOHfsAbsgQp31vXsDnN6ZDJV8DIj5x6CT2pitbjN/7Q+Uh9ytOs3Wy16RVuM0slheKSmdlkU1j0K1FyER1NNHQvwqLI2bOhNiu2sujdQKvRQ9C9yOoKzEwqvYNz+PEaS75/smDRj3/1094kxb4V/Lr5Jn07F1WwfnCTn4mXALwZU6aqaAbin0DoNvkuGr2gu673q9HSRlhJU1RNMQb+1k9ceVfmclY+YVchfRxdZHRT6335faBELw/3NlJI9cR+eLk3plTgOyZI8gXlPLhxeU/r3zt2QjeBwX3Csm3WMdPe9q4akvytxsXGqdPGS3D3Bka+qEIRrkotm1WKx3mVclJm4SAbagb5ZfOjEhLPC/JUsJKbF5ermVh0hNw2+iVuTxTZ1vm1JcbVQ1uCSNaATcxrhsoIWIkQvCy1IA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4408.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(66556008)(8936002)(66476007)(4326008)(66946007)(8676002)(316002)(54906003)(110136005)(41300700001)(2906002)(478600001)(31686004)(5660300002)(44832011)(6486002)(6512007)(6506007)(53546011)(26005)(186003)(83380400001)(6666004)(31696002)(86362001)(36756003)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bnh3Mnh3VkVTVGJmTzlLemJFc0ZEcXM1VDhYWFl0Sy9uanNpMkVEZEVkNE9O?=
 =?utf-8?B?MTB1dmZVN2pRNERqRkt3ODJhWDd0cDVRQzJhdDd0dytzZGZzL3BFdVI5U2NC?=
 =?utf-8?B?dmR6MnplRU1JbE1ER1UvSWJkcUhIUU9zSWcwM1hjRTMrZXJwdWtMRmtvREpH?=
 =?utf-8?B?djRzWDE0d1pDcmw0NVN2anVUMXhVdWRobHBzdUtZdW9sTXg5QnNqMlZSTElJ?=
 =?utf-8?B?YldhU1ZwNjNKWkRlY1B3dmk0aFZZd2VDVlVEZ29Ob0Q5RWRJTExRZzNveDQy?=
 =?utf-8?B?Qi9kcXQyTlNiZEtDc0RaVFpUUnQxU2VXa1llUW1pVUhlMzA3THRiWFprYjJE?=
 =?utf-8?B?UjRyRWFDWTNKaWEyeW5kc1hCNUFzK1ROa3hjNEtZQzVWTGFmeDhlaDRlZnU4?=
 =?utf-8?B?MDBTN3BJNEhkSVQ4aXpnTmhaNDhaS290YUl4RVNINVQxK29DNWcwTExCMklW?=
 =?utf-8?B?WkxUUHBSNVlGMzhTYmF6S1F5SlU2Y2dvUkFtSlcyellXSWxhSGVhbDFIbjl4?=
 =?utf-8?B?S2d6Sm5ONS9zNXpZcFZEbGd1akZWb0dKWDM3Z3pXRXFUL1RsczZuNzBYZytH?=
 =?utf-8?B?YmRDUUR4bVhnZTBuZ0JDN1lRZVM2Y2hXTEhEZVpwZlhpNmJiZlptUlBHYlFx?=
 =?utf-8?B?TG5kbEpUaHMzTU5la2lObXJENnB0eHZtNk5wdk9KTTloRzB0clptU1d4YXd4?=
 =?utf-8?B?Zm1XWjBHRW1GZGUrWjVkSXh6bEI2clg5dXp0aTVJakNnb3k2c2F1TE1FSUJE?=
 =?utf-8?B?V0ErQkdwVUpPQjJlUEhBRG5BUUlXd2dtQ2RnNVRCMk1DdkJMV3IvNVdYMllw?=
 =?utf-8?B?UHRmaHdwdUU0ZnduZzBuV0hvNXZmbG5zY2RKWFlISmFRU1ZDRkhCZjJxQWNu?=
 =?utf-8?B?aFhaRU4yUmlkUXl1SG45aEIvT3A3N2J5SkMyYVA1MElNelNoM2FwblMyYWc2?=
 =?utf-8?B?T3J1RG5aSlBDbVpHQk9oV1ZORDlGaU40aXhzRHNLSE9FRTAvREdUQjhBbjQ5?=
 =?utf-8?B?b1FUU3lkUUVYYnJXdC9pQnpYaXo2REpsa2pDcTZMbmFOUnM0QThTVGdQTGVo?=
 =?utf-8?B?WXd0Y28yTmVGb0xFRWxyUlhmSWlRVjBHYVpGaFV0Rml4RTg2NzNqVG9ReTZM?=
 =?utf-8?B?Q21mL3ZTdlhTMWF6NG9hTU5tcW0xNGpsNW9ZZ3dnNlNaTnphbkc3T2F5MnBp?=
 =?utf-8?B?cWh2aVBVWGhFUW9Va1FjdU5ZeFM0RmdWQ0JTVFAvVVdqdE9PNVZVV0Q3YkZk?=
 =?utf-8?B?enBDRy9tTFJQeGpCbGFvb1UvQlNnTnJUZjBaaG9JQ3RSWWpvclZqVTNyYjNY?=
 =?utf-8?B?S29zbUY4NTB3ZnM5ZU0wQUpjYW5VQXhOTU9kd2dReGltZmJ3dlhDbVVzV1pF?=
 =?utf-8?B?T1h4cmlWZG9zMlpqc2REUzMvdUlKRXBvbVcyMGlNQnZGK1lObHBpSWhKSHl5?=
 =?utf-8?B?TmNKaW1rWU1qdzJYL2xkYi8wME5lSWZDY0o5SzB0V0phL3dvd1BpbWR2cVRo?=
 =?utf-8?B?aHZPcW1hTXowdG5VSHJQek1JOTBnM3BFSERWSU5DNVpLckxoTnAxN3BEbkJz?=
 =?utf-8?B?RUppUmtYM0lWaFgxSFBXSitSUmNQbkNuV0drL00wT1JtSDZRT3FGRU10S3pj?=
 =?utf-8?B?UlpxVEVrSVBNbjNxRXVGQ3k3N3d0NDFvOS9jZGVvRVFYc3FKOFJFbXhsZzRr?=
 =?utf-8?B?WTN6Zm1qVDBUYStVOTEwWDd1Z3ZDVEtmd3MwNUFxRVpXcjdVamVVcUJUQ0VK?=
 =?utf-8?B?NnpqVzF3a1lMU21IOUFTY2RvNHRZcUtXMEZPUFN1Y1VxODI3MjEyUGZIQVJP?=
 =?utf-8?B?ZFByaGF6bU5aOFdSbFlyWU00RXRKV0pHMjZXTlpsNjRRZy9hcTRwWndOSUFL?=
 =?utf-8?B?ZzA3bithekJnMkRKellWTVhUbDFPbDFDbTEwbkpFMVczdU0yVGw5SFJiRXNB?=
 =?utf-8?B?VmFlazNsVTh5bWh2N3AvZGU4TTNueE1ZK0hhbmVPNmhZMTliWW9rTUhqWXh6?=
 =?utf-8?B?SlBsRXpHTDRuaWpsZE1YcUVYeEJ6Z3dpWnkrOERsaU8vbm5zYnpkMjNtMHlr?=
 =?utf-8?B?QjdRc1FMYnhIVUtQVng5Uk9SbnFVWDVIZnBWVFo1KzAxdHd6Tmt2Qi9EcFov?=
 =?utf-8?Q?FMz6qsVhlLju4P82K4Oggct6I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5eb1b42-b7a3-48fd-62ac-08db66cd4fd9
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4408.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 20:33:39.8972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EtuZSyXWexCU4cTIDDkJrNtyqQ18F/wa7YsSF2uj7LNZTKyDb05QQsOEUjQvVq1lD5S6hn37H2WZSBdrmpUqQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139

Hi,

On 6/5/23 12:22 PM, Julien Grall wrote:
> Hi,
>
> On 02/06/2023 08:45, Michal Orzel wrote:
>>
>> On 02/06/2023 02:48, Vikram Garhwal wrote:
>>> diff --git a/xen/include/xen/iommu-private.h 
>>> b/xen/include/xen/iommu-private.h
>>> new file mode 100644
>>> index 0000000000..5615decaff
>>> --- /dev/null
>>> +++ b/xen/include/xen/iommu-private.h
>>> @@ -0,0 +1,27 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> + /*
>> incorrect indentation (<< 1)
>>
>>> + * xen/iommu-private.h
>>> + *
>>> + *
>>> + * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights 
>>> Reserved.
>>> + * Written by Vikram Garhwal <vikram.garhwal@amd.com>
>> I'm not sure if placing the copyright is appropriate, given a single 
>> prototype for a function
>> not really implemented by you with just spinlocks removed. But I 
>> might be wrong.
>
> I agree. If you want to add a copyright then it should be the one from 
> the original author.
>
> But in this case, I don't think we should add an copyright as there is 
> nothing really interesting in the header.

Thanks for pointing this out and explaining the process. Will remove in 
next version.
>
> Cheers,
>


