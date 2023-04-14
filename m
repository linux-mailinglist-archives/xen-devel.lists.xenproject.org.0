Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056216E2957
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 19:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521177.809555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnNDW-00058d-TO; Fri, 14 Apr 2023 17:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521177.809555; Fri, 14 Apr 2023 17:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnNDW-00056U-Qg; Fri, 14 Apr 2023 17:28:10 +0000
Received: by outflank-mailman (input) for mailman id 521177;
 Fri, 14 Apr 2023 17:28:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YiN8=AF=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pnNDV-00056O-2w
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 17:28:09 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7fba173-dae9-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 19:28:07 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Fri, 14 Apr
 2023 17:28:03 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea%6]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 17:28:03 +0000
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
X-Inumbo-ID: b7fba173-dae9-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vh+BYD92ONCseAd15jP65tOXddlfxL6EBES9X0czPozkCzcIlbm/BR6kIvZlnPtX90eLbRL8KEyl+3LKKJaAfWzH0BorPS4WPOXSu9Hp78k6izHsDvD7SKAB2jLVJXMi5ilHifiPmOOgrSLdsiDVHvIQBUVboWBabKHFeK+q72gjJ18DTMSuT6aq/xvlhbIt4yE+V9+uOBodvO3nM60RFCC16UstAY9gL9LktdZSqo79bwr4cm14/LlRybOp3JLhv0gRvU8pdjiUHqgWmhXG7Kqa2uBTZfhX1Yiq1/R/2vmZ5Vz2671d85ELyJbgBA9NttE3N/EG25S8yKhz2PXS9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+qGWBdzemzbWug6XwXX7zGjoSLRS1maroLJGXzCB7I=;
 b=RYjHC7wR7FtvlSgmJLENuIUBOLPYQWOJJrBqpFtFiqR+wPJuHEIruJgyABzmgvELnEQyR7J5kbU1aNkMEx5bT8Uws5I9CjpY/A4LU/ifAW/MKRaPghs5DFVCnKHgtrHFfbqu7/EEYV2axjKPC9g0x8BB3Jm82yVZSsb2iwB04/Guuo8Fu+UUZp/Y5Zv/ge26+VO38Hp5TrgaJNkfQoB+BUeNLbtNJNRId3itYveXrGL9IS+8Pq1qEu7LL8sV6s/VUv3SXML+c1WQCQ/NHAp5PIW9Pu9L0NVHAyBYOs0v6GD7mBOncs6xyXO66Lizc1F+3yOjXBcQSrwszRKDxXV+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+qGWBdzemzbWug6XwXX7zGjoSLRS1maroLJGXzCB7I=;
 b=GyMroG+PWGqLtMIr5nQZstGlk0lm2WTO966wP7bV8jhMAFh5rk+1GTDe6aTgB2f3f0S1W/DQN1GYf2LRUds3liBrqRZzWJf96yapPw1FgarqN2GQ0EYWfrQzvKH2Fu31WVXEN/7JWXvpWxiLCRcyQmyBVHd7YlNsAkemnXIP1aU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5871c848-5d44-1040-9679-7dff25161714@amd.com>
Date: Fri, 14 Apr 2023 10:28:01 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 01/17] xen/arm/device: Remove __init from function
 type
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-2-vikram.garhwal@amd.com>
 <836d2629-b097-9a8e-7aea-3f83fd13228f@amd.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <836d2629-b097-9a8e-7aea-3f83fd13228f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0067.namprd17.prod.outlook.com
 (2603:10b6:a03:167::44) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b53a4c2-4231-41cc-31c7-08db3d0d9a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8YN+Q9iv3xL1MStN8j3WUuFr8K0PoWhsPsuHzjeR0YcsyxE4/7p3tHCL4FSvDzcGOW7pdB+1ThyVdjq6P4XOhwt8AKbR/+2IMih4R8NQNZFTqXyM846IbEtyqT/CCq1hK4buV8Skbqnam0kO1CVjXnioCmdctVPSDCgMSF9JK5KTJunkUlKrgtcgMQyn1FqhlWVnHtojs3Z63oQ/vNA4vvGiYAV9zotUP3uM8QMF2Utzp3NpK6Yr5sMjHhxA+Cvd9Em7RT7kesZhfGjyUXAn6AjfNdw2I8sseyQJRz8Xwjn1Zx4btvZQjQ8LqMalaisq87vWW8kilfWKOIbJUJlSmE7OYIc8M1OwKWdvpvXJC5OfnixYtzCoLtNm1MNDboFIg7I3/I95NlpxN8EabZA/U94TH5Tius9Fwt7cBrPln5dDVXMAFsaXtJ9cT8D/h3wziRryuzKHAUQ4s8NEKwbEZWY5TPKlEXDQSKjxdkQBJ21lJJld0RBw8ytEkeDEfn9EhNLZz3KZDxNRnCq42pL5zCjG1Ri8R52dtGk0zQ7Be58FPyVNsw/80wYLqlxwMmabN6DZeeViBXudjcDC7qw+047FhYGoY8eOk3uomrqIUA5ZlIdwr/iaQf+5umpmtgY+rP4a/waITIe60uee1shTNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(2616005)(38100700002)(6506007)(83380400001)(316002)(478600001)(26005)(186003)(6486002)(54906003)(53546011)(6512007)(36756003)(5660300002)(66946007)(2906002)(41300700001)(31696002)(66476007)(4326008)(44832011)(8676002)(66556008)(86362001)(8936002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGg4TjIrRVFkcURnc1BMY0d5VTJ1MTNqZ2MwZ0N2UVJmNXByeXZ4VHVyajVJ?=
 =?utf-8?B?RGwyZ2orbnhLSWVyY01nK0owM0dtN0V3bFZGVzJ1RlJkRDcrRklNYzdVcXRQ?=
 =?utf-8?B?WG5CM3lkS0lLZmtRVUNTaVdhU3g2L0xjMTBRaUpPcVFjYnduTGpVRVpjNXQ4?=
 =?utf-8?B?Qy9ER2l6ZExTZkhtU0hQbmpDRFNhdU9GVzRJdTF2eVhGTlc1NTVkcXpjT04w?=
 =?utf-8?B?alA2eWw0MkU4VmtrS01iOHUyM1JGeXFVRkRGOUVhZjB4bDRyRFNPemM4dDJ5?=
 =?utf-8?B?Yk5adkpnTFJBeVRheW1PUkNYMGxFOW13ZXNEbU9YT201aVZuN2E5WEFLVDBN?=
 =?utf-8?B?TG5WRWtxcmFReDRHdnRVVXZrRDNQZCtuVll4bkozSHBsUWozbjJ2UjNVNTBT?=
 =?utf-8?B?VGRQcUVZaW1sUlYxakc4Z04zZlpiMVdWNWYzV3k4czVPKyswVklHdFJBczJp?=
 =?utf-8?B?NDRNdnVJUTNuMmp0MDd5OW9kSzd1aGM2dDVxSVV5MmRycHpkZG4yeU1zSTh6?=
 =?utf-8?B?bHlMQncvRXc3dDdWMnV2aWZUa3UxN0FvYzdSZVNvWHJ2S21BNjI0R1JUQ01X?=
 =?utf-8?B?cGdUVXBMQnpETXYza3d2N1N3NGlNV0UxQ2JTWGw4N3N1QmhWc01sU0FFTXB2?=
 =?utf-8?B?OUlrK0VFdldiR1dYeG1mUWxJNFhTbHF6MWhRbGxTbE5HcmZsa0J4dFRlT01F?=
 =?utf-8?B?WTgrWnR5VlJyb1dWRHFnV3Y5MGxNM1JpWUJuNmJteFBzU1psTkJHbE4vcmlQ?=
 =?utf-8?B?YUkzRFIxMmpZb1puUWJiZk5jSC9KSW1La1dPallRdGdmajcySXRDVkhpVGN0?=
 =?utf-8?B?d0FmTFFvZnJyTUsvQ2NDNVlyTDJoQ1ErSnZLYVhRUFRDKzU5Y0kwaHFQb0R4?=
 =?utf-8?B?cDMrMU1qbStsd2VidEhCUFNrTE5VYU42a3VhRXIzMkoyVTFXemFKcFpYcjA3?=
 =?utf-8?B?aUtvTmx2c3FHb1JnclB6ZWdnczRHS1FRNFJweW9ha2trZ2pnTDg0Z3JFSkVW?=
 =?utf-8?B?TjRSMmhDS3c3NGs0dUxqSWJobUZkSFV4Um1ydWZIdzRqWDF2T1lWbHZEZWZP?=
 =?utf-8?B?RlFJbzJEVU0vSS8zM2ZqMlBVd3ArMGU4YkdzT0l3TkJhQUl6ZE82TFl2TVQ1?=
 =?utf-8?B?Tms4OEkwdFFRL0lZZ0E3MnlWNmdwOG1Hc1Y1OW0xVmp5b2pPMUFyQU1LK0ps?=
 =?utf-8?B?d1RSK09Qd3k4ZTYybGtSNitTZmxnZXNld0FiVXhpOUh0SGkySUxVaGhpZzFT?=
 =?utf-8?B?aklMTGdIVW96TFZreDYrWXBXQkExZUdpYWprUXNIS3R6dk43QjIzbEN4dERy?=
 =?utf-8?B?bXA0REVVTU0wMElkaUlPV3dGNDduOE5aQ2hRVVdubTJCaHNUMi9XQXhMNEFR?=
 =?utf-8?B?MnNXTWZlYlB1S01aakNRSXdRd2YrRHVjVkRLbW1hT01TWTlWak5Gd1p4Mzdw?=
 =?utf-8?B?V2ZOTEYrMExtQWhsaHowUWJvTWc2aktNYnRPWHBoUlBhSUlKa0xjMVVLTFBy?=
 =?utf-8?B?ZEtteVFnZExsbGhBenF1VTBBQTNlNTVPUEhPb2psTkRXckI1RVdRSE1RNThS?=
 =?utf-8?B?dUNvdER5VHA1OERrOFVvYld5WXVZZWt4YzJFS0ZKN2lvdkJ3WHUzUVpjdFFu?=
 =?utf-8?B?cUNRSlB0Tm1maFhiaXk5RHpHSnRza3Z6YmhJSUk2enZSdTRieTd1UHdFb1lk?=
 =?utf-8?B?ZEZHZXJtUHh3NmFVV04zUGx0ZnRvN3ptSnhXWFJrNktvekVnN05xb2MzanRC?=
 =?utf-8?B?ZHoybDdMaVhFSldTUW5MamFNNkM4SFZ1dTllVFh2M2VhaU03clNCOERjTkxY?=
 =?utf-8?B?UW5qejJNOXoxWUhML0FGYk4zYnd2bFhuMnA5OFZPb2hlS1VPR1JEYTdoL1hZ?=
 =?utf-8?B?c09hWllkTVU2K2RPdXQwSU9nYkVkck1nenJ2S1VxYjl1cUl6RzBaU09vaUNU?=
 =?utf-8?B?ekY3aUNNZk9RdmJ5ZVVyWkpTMmttbEdDeDVGRVBodFVjV1hBNFZrdTlZSjNX?=
 =?utf-8?B?UnQ2cXFRWS9DRitucVpBalVTVE5udXdzZDJ0UWQ0Y3AzendLTndSUUl2VzMw?=
 =?utf-8?B?N0s4b1lyNU1DZk5Xbk9pWDVqTkR3NStlZExOVEZRbkcwWWF4M0JkYXlwVi9P?=
 =?utf-8?Q?m/IMQvzfg2ufiKcck8k9DnDjb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b53a4c2-4231-41cc-31c7-08db3d0d9a30
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 17:28:03.5230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hx/GCMooZyJKJTm17l0XjrZ85wnujiKalKqSkUap+ncOuEKU2c1VcIpyHOE4c985m/VzNbEe6TQUR5ZXoTLuOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428

Hi Michal,

On 4/13/23 2:19 AM, Michal Orzel wrote:
> Hi Vikram,
>
> On 11/04/2023 21:16, Vikram Garhwal wrote:
>>
>> Remove __init from following function to access during runtime:
>>      1. map_irq_to_domain()
>>      2. handle_device_interrupt()
> s/interrupt/interrupts/ since there is no handle_device_interrupt() function.
>
>>      3. map_range_to_domain()
>>      4. unflatten_dt_node()
>>      5. unflatten_device_tree()
>>
>> Move map_irq_to_domain() prototype from domain_build.h to setup.h.
>>
>> To avoid the breaking the build, following changes are also done:
> 'avoid breaking' instead of 'avoid the breaking'.
>
>> 1. Move map_irq_to_domain(), handle_device_interrupt() and map_range_to_domain() to
> s/interrupt/interrupts/
>
>>      device.c. After removing __init type,  these functions are not specific to
>>      domain building, so moving them out of domain_build.c to device.c.
>> 2. Remove static type from handle_device_interrupt().
>>
>> Overall, these changes are done to support the dynamic programming of a nodes
>> where an overlay node will be added to fdt and unflattened node will be added to
>> dt_host. Furthermore, IRQ and mmio mapping will be done for the added node.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   xen/arch/arm/device.c                   | 145 ++++++++++++++++++++++++
>>   xen/arch/arm/domain_build.c             | 142 -----------------------
>>   xen/arch/arm/include/asm/domain_build.h |   2 -
>>   xen/arch/arm/include/asm/setup.h        |   6 +
>>   xen/common/device_tree.c                |  16 +--
>>   5 files changed, 159 insertions(+), 152 deletions(-)
>>
>> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
>> index ca8539dee5..fec6e29c42 100644
>> --- a/xen/arch/arm/device.c
>> +++ b/xen/arch/arm/device.c
>> @@ -12,6 +12,9 @@
>>   #include <xen/errno.h>
>>   #include <xen/init.h>
>>   #include <xen/lib.h>
>> +#include <xen/iocap.h>
>> +#include <asm/domain_build.h>
> I can't see why do we need to include this header.
I will recheck if this is really needed.
>
>> +#include <asm/setup.h>
> You should keep the alphabetical order so:
> - iocap goes after init.h
> - setup.h goes after device.h
Will change it.
> Apart from that, it looks ok so:
Thanks!
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>
> ~Michal
>


