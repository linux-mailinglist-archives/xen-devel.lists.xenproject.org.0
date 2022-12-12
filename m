Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE6964A7D9
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 20:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459904.717688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4o70-0004lb-09; Mon, 12 Dec 2022 19:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459904.717688; Mon, 12 Dec 2022 19:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4o6z-0004ir-Sv; Mon, 12 Dec 2022 19:05:13 +0000
Received: by outflank-mailman (input) for mailman id 459904;
 Mon, 12 Dec 2022 19:05:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Fw1=4K=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p4o6x-0004ii-HZ
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 19:05:11 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e49be6aa-7a4f-11ed-8fd2-01056ac49cbb;
 Mon, 12 Dec 2022 20:05:08 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4314.namprd12.prod.outlook.com (2603:10b6:5:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 19:05:04 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::9856:da7:1ff1:d55c%5]) with mapi id 15.20.5880.018; Mon, 12 Dec 2022
 19:05:04 +0000
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
X-Inumbo-ID: e49be6aa-7a4f-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RYhnyXMVmvzyoXYPMrQ2V2fLwALrx9ACZVVkyavSCrxMqIqlNy5zS6gjdP6OZxpXxARjNuF4ppFYas9OW4Kh18sey1K5xj+dT6eB1tEo2gilqEA0zJ3yeTxtgbv5GMoCdwmJGg/h9S8Oya3pVqtCTR044iVGdOBkI5tu8HLRjRorf0HD3WJNnCpj4EXe4Di8juoxzg0PJQWDYHoaBLFx4Rj2KWYY6CRrC1G0F7fac2uPahfxAK12gsXyeElj8IOLjGaXCsP8EjCKIxW9TLD/reT2ug9/rvwpyKblID3tDGWpvDCStaVDc9Dc4jjZj3mXl8X7PxiN6/eXs9hRLUaoaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEZXZeErdk83RonLV+Lo70oeJpn/6T2RZsJL5Oy5xp8=;
 b=Czsyi4DWKYkkxtWI044Rn7L/+DatdkNAGwP0PLaREPtagblOnH5Xq6xuzddQrxW14JczM1DebmfWWggVkGwAfaALnd7FIxoYv6YNc0iLh3j7u10uOxHkp6lrf067OADcsDGUhhOvKAaS41ESs8WahnHp5TFKSQqgmrnPFbGlvHEyK4/ie7PQ3igext407kCKrwrixPIbC1DH6Rl5QbmNYBvPb08QcDkOVyxeyOQ2vkHMe7k6Hq+vwdfUUT2/ps14lh+D7G/bNMbJPkFJazJk8qiqHNy9HWjuMJYCGjujkzrPexYYoYhHOD3oI8YD3YAyX/K9QGcm1c7NwqUdrMDG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KEZXZeErdk83RonLV+Lo70oeJpn/6T2RZsJL5Oy5xp8=;
 b=acNbYPeL5bYr+GTFR3eUHpYH7kH5fArpMdscgppwq4VOHqyI4i2qXyAe8T0szZyQ/W2QobFFpAvVNHvA7+k3sVKaCpqWxaZmlBLFo5zunp3A0GLSA2HodihhLk4wbcK+Wv2qF0IoJJ/q4vjAxsBDattalbCeKEolJAMRqq8Mgb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Content-Type: multipart/mixed; boundary="------------QsNICmmrM0E0tkn0xo3lyUHh"
Message-ID: <bc40d270-d29a-8a77-5f0a-fc343eefc816@amd.com>
Date: Mon, 12 Dec 2022 19:04:58 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v1] xen/Arm: Probe the entry point address of an uImage
 correctly
To: Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
 <1ad3ee8c-991f-6e15-255f-ccc24dd5b84f@xen.org>
 <e8aff19a-4992-9d35-4e78-9e64aec384f9@amd.com>
 <00ab59fa-d449-255b-bfe3-aaacb87e34dd@xen.org>
 <ca2db58b-0183-8972-0336-25bcabc99824@amd.com>
 <00793926-ef60-405b-e450-b42ccf939f5e@amd.com>
 <ba76ce47-b999-7daa-3248-0f0be6f49131@amd.com>
 <f69e17c7-ff85-636d-1176-1556cd1c519a@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <f69e17c7-ff85-636d-1176-1556cd1c519a@xen.org>
X-ClientProxiedBy: LO2P123CA0096.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::11) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c43c88-ea7d-4d30-82c0-08dadc73c708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ASyl7l+lubHHqzR4wrBFGtJmo5pD8+/LrQFRWi7n56sJCWe+0s2DLFzLqQhIKp/h8rEJ++9wBI2T3azwe4YXS3HRF6WluhdmOLifWiVKi2P6R+11GWNSUo5CbeBymzDNvdLo2s5xo1sGsvxjL9djyg38fC2VGdcKmxksnrj0Nz/qLPsoOydxsLXdz8UD/5i4GFv/OcjSQrUC7zmn/DC0SFudokW8f+B1as/AbCMy3I2ARXWSgeU71FSBN+rB8HWk8spZpn5yH1+s/I8yzL9cBP24efeyV/aSB4UQcSx/Qh2fgS9f/TBAq/3YAQEgaP42DUoLaH3hio64K6s/o8km07zKjT0ZDPzKGJJpQ0tntmAt4dE107XyhDrJCaHaunzJ0MkvinAS5ub8poZcsf5msFGLpdxXs4528zqnxpR6HU2J9qNoSR/6bI1qKsV46DuqWHqgWeWj0hFgrIPouEr9nl1i/gpWRlsWf1sQVWX8wIBU929YACOC7um8GFTqOr+NzmE1F5TXaRm1Uuy4R2sEUa9SU+e5STwxb+qS9uSobsBj+iwG4Um841p6lXATD6JPCzhKgnc5obk3nqK4iHXJ8WcFfBQkZK3lpogUmdNmLAPAWMFVh5E8twBKKxB3IzoNBd7SQU6fW7F7HI7vY9P00DC84ImIpRv9LQoHo8E0u1caYkQ0ogiYY2Lf11Y9tJat6mskNNuT6EoCDY8qJ0ir7tntdixEAHpQoDievaoqX0+5732l+xfkvePwbzckk+O8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199015)(6512007)(31696002)(36756003)(8936002)(41300700001)(235185007)(26005)(5660300002)(6486002)(966005)(478600001)(53546011)(66946007)(66476007)(6506007)(8676002)(33964004)(4326008)(66556008)(316002)(6666004)(110136005)(31686004)(83380400001)(2906002)(38100700002)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUp5Q2YzVzErYkdXcmUxeWZYYUQzUldsUnNjL1dVTmF2Y2cva3FCZWdLUTB0?=
 =?utf-8?B?SmFnV0ZCMjJBYmVwMTlxYkZ0Z2xIcmxrNHV2U2dRbHFyMWpCTzV6M1JKcHE0?=
 =?utf-8?B?RmN4R1NiMGh3THRiN2NnK3BmU3JXSkxkQTg0cjlrV0lwc3RtRzNBaCtZWXdh?=
 =?utf-8?B?NzRGUWkyTjRDTGs1L2hzcnQ1ZGJOY0pGbTVNZk8vbVFJT1ViSkF6OWtiZ2E5?=
 =?utf-8?B?cXFZaHl2SUdPTnNhYVBjQlpzQmlWN3pEN0hocWdTRjNxdUx3ZzRNMlpqL2JK?=
 =?utf-8?B?NmZOUEFmc2pub0NuQXdRVFBhTThFK0cwQ2x0djE1WnpmTUVkbmVhUXJUSk9v?=
 =?utf-8?B?UVk2cktRVkI4N1pudzlxdUhvMWF6YTlIS25kV1JadEVqenlEdTVGMDd0dC96?=
 =?utf-8?B?dWIzbFZ5MC94VW5QMUUyZlVTcHZITFRPcEVGMWMwYWUwcTNjL3dQVFpnOEV0?=
 =?utf-8?B?aUw1U2VFL21Kcm83WWh4aDJWM2JqamQ3RXZucVRKZFp6NWVoSFVGaTRuK21O?=
 =?utf-8?B?VGxxMlQrbW45NEJQaUIrTW9rUzVVbkgrZXVpa2o5dmpVc1pkZ1ArVFloWnNs?=
 =?utf-8?B?VFZQc3lWdlRyeXhzaUEyeGxUQVBBLzVqbUlPWlgwMEtvVkFhbXU4UmtTczZl?=
 =?utf-8?B?UHI4bW9EWEFoMG1rMmlwOVJhc2g2Z1l0RW03K0MyUkxwMEk2WEdwdWw1bi9H?=
 =?utf-8?B?VjQvTS9Sbkkyb00yL3R3RlpISTVIay80eE9jZEZRWk1najNUblQxdUsvd21r?=
 =?utf-8?B?M3BxdEYvbXk1MWE3d211MURRMy9aQlZhNGRLQmRaNitXZXlWK3JyeVBJTkFW?=
 =?utf-8?B?WWVBb3hnU1NFNlFIOGRPL2dmTEtxMzJpTC94ZDd4bTlsTytwMTVxcWVCMDk0?=
 =?utf-8?B?czVNeXpVOUZhZ3hhZ3JTY2J6SnVCNzdoU3JlejhRZFlRMnZTbER6M0hXQ0ov?=
 =?utf-8?B?Si9rK3M1MGUrYkkzQ1F1dzNsU2U3MVJxS2NVM1IzR0lzL2pwU3NpWWZmNWlR?=
 =?utf-8?B?QkR6Mlduemp6YXVJMndreEovRTh0UjdMZmtXTmc2S09TVC9QMVNNaFI0M1hN?=
 =?utf-8?B?cGhyaVU4aWNaNDdDa3FDVUwzZEVRcWszZi9pY00yMHNKaFo1U1haYXd0QVNm?=
 =?utf-8?B?QytZVkFjUy9CUTBGWVdZYzVHOG5FSUM3NVgwU0o4WHlOaXIwVitZb2NWcDVF?=
 =?utf-8?B?Z0Fac0pPN0ZzbExmRndLSzRMSlZqZ1ZlSFhndW9IMmovTG9yQSs0eElTbUE1?=
 =?utf-8?B?Y05OVjBBUm8zMHoxaUtpdmE5SVY5VGFoeGtvbnVVR0oyaFlidUp2VTB6YUJq?=
 =?utf-8?B?UG5CK3kvVFBUR2pDOW1uR2Y5K2wvQk9YMWdhaFhlbWRMeE5pWE9vcmJwa253?=
 =?utf-8?B?clp6dHFIK05FclZXdDlPRHQ2Tk9ZcEp1dEZRcVlGRWdJUXFGa2VMdklpU2l0?=
 =?utf-8?B?ci80bHNYbTczL3BqRDZwVjg1UUd3Q0JRaE0rRFJoU0FZUFZRRXZyWHBsYkxx?=
 =?utf-8?B?M3hwdDkvQURaQTFZQitYTjhVTk0wQUpoaXRmWmh0Zmx2UTBMRis4WVZEUDgr?=
 =?utf-8?B?amx3Z3Qwb3hHT05kcmVGelk0UWpqdW4rZC8rSmhwNGZlbmFKcEM2MUtuK3Ex?=
 =?utf-8?B?dzRlN05DL2JpeTdPbGpjd0JLcyt1TDJwZE5PUDB6MHpCaFVIY1V6SGFWK0Fa?=
 =?utf-8?B?bGJhYm95MktpTVViU01ueGRTZEFQN1pYWGRIU2hjWTA3K3hZK2x3NHQyWTIw?=
 =?utf-8?B?Y0JvZ3R1UlFaOGovSk5aNmtTTG9WYXBRVmlOa0tHVGVMYWIzMzR6R2Y2QlBx?=
 =?utf-8?B?TWMrSndaQTcvMzZGbDBwd1VpQVNKNWFmaTZaRlo1UmY5NXhiVk5SOE5TcFY2?=
 =?utf-8?B?ekRMM1ZlS200Q0Q2NU5pR04xKzNaY3BqWGRpUVRUZ3h1ZnRCdDlRaGtpbzAw?=
 =?utf-8?B?U0RsOW51TjQrKzZySXdWTXR5NHZZQjJCL2FLYjRQSEVhLzZxZHpjOFpNNDFi?=
 =?utf-8?B?SU51VVppZzdzQTlMbEtXL0UwYTlKVVAzWjhqQVNEc3RWaDNQTTExK05OVlRH?=
 =?utf-8?B?SHRHUEZjTHNVTU9DZU1xcDU0UktodFdZRGxGK1ZBMWhrUWpZUjVSL0VEcWpa?=
 =?utf-8?Q?UleC+4LVBc+W8TEBxP19pUI1j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c43c88-ea7d-4d30-82c0-08dadc73c708
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 19:05:04.7888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCun4sneGzuCt+Z00rXVQbXIFZcJTcQCm9FjG4PR/ozJNMPs9BCbwKYguZsXn9IVdJyMry4mSHcveR3ucSYF9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4314

--------------QsNICmmrM0E0tkn0xo3lyUHh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 09/12/2022 19:19, Julien Grall wrote:
> Hi Ayan,

Hi Julien,

I checked with the Zephyr mantainers. Their response is provided [1].

>
> On 09/12/2022 19:10, Ayan Kumar Halder wrote:
>>> zImage and Image are image protocols, uImage is not. It is just a 
>>> legacy u-boot header (no requirements
>>> \wrt booting,memory,registers, etc.). It can be added on top of 
>>> anything (even vmlinux or a text file).
>>> So I guess this is why Xen states that it supports zImage/Image and 
>>> does not mention uImage.
>>> A header is one thing, the boot requirements are another. Supporting 
>>> uImage is ok but if we specify
>>> that it must be a u-boot header added on top of zImage/Image.
>>
>> Let me first confine to Arm32 only.
>>
>> zephyr.bin has to be loaded at a fixed address with which it has been 
>> built.
>>
>> So, we could either use zImage header (where 'start_address' can be 
>> used to specify the load address).
>>
>> Or uImage (where -a  is used to specify the load address).
>>
>> Adding uImage header on top of zImage does not make sense.
>>
>> Now for Arm64,  we do need to parse the zImage header
>>
>> #ifdef CONFIG_ARM_64
>>      if ( info->type == DOMAIN_64BIT )
>>      {
>>          return info->mem.bank[0].start + info->zimage.text_offset;
>>      }
>> #endif
>>
>> Again, adding uImage header on top of zImage header does not make 
>> sense as well.
>>
>> Also, I believe zImage boot requirements are specific for linux kernel.
>
> Correct. But then this is what Xen tries to adhere to when preparing 
> the guest. So...
>
>> zephyr or any other RTOS may not follow the same boot requirements.
>
> ... if Zephyr or any other RTOS have different requirements, then we 
> may need to modify Xen.
>
> Can you describe the expectation of Zephyr for the following components:
>   - State of the memory/cache:
>     * Should the image be cleaned to PoC or more?
>         * What about the area not part of the binary (e.g. BSS)?
>         * What about the rest of the memory
Zephyr is expected to run as a baremetal binary. When loading from Xen 
or uboot, the interrupts should be disabled before jumping to Zephyr.

I/D caches need to be disabled as well.

The image should be cleaned to PoC. The BSS is cleared as part of the 
Zephyr boot process with z_bss_zero() and data is copied with 
z_data_copy(), see [2] for more details.

>   - State of the co-processor registers:
>         * Can we call the kernel with I-cache enabled?
I cache needs to be disabled before calling kernel.
>         * ...
>   - State of the general purpose registers:
>         * For instance, Linux expects a pointer to the device-tree in r0

Zephyr does not make any assumption about the state of the GPR at boot. 
Also, Zephyr is built with a device tree.

- Ayan

>
> Cheers,
>
[1] https://lists.zephyrproject.org/g/devel/message/8805

[2] 
https://github.com/zephyrproject-rtos/zephyr/blob/main/arch/arm64/core/prep_c.c#L54

--------------QsNICmmrM0E0tkn0xo3lyUHh
Content-Type: message/rfc822; name="Queries regarding the boot requirements
 for Zephyr on Arm platform.eml"
Content-Disposition: attachment; filename*0="Queries regarding the boot
 requirements for Zephyr on Arm pl"; filename*1="atform.eml"
Content-Transfer-Encoding: 7bit

Received: from PH0PR12MB7907.namprd12.prod.outlook.com (2603:10b6:510:28d::11)
 by SN6PR12MB2621.namprd12.prod.outlook.com with HTTPS; Mon, 12 Dec 2022
 14:05:49 +0000
Received: from MN2PR05CA0049.namprd05.prod.outlook.com (2603:10b6:208:236::18)
 by PH0PR12MB7907.namprd12.prod.outlook.com (2603:10b6:510:28d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 14:05:46 +0000
Received: from BL02EPF0000EE3C.namprd05.prod.outlook.com
 (2603:10b6:208:236:cafe::e9) by MN2PR05CA0049.outlook.office365.com
 (2603:10b6:208:236::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.5 via Frontend
 Transport; Mon, 12 Dec 2022 14:05:45 +0000
Authentication-Results: spf=pass (sender IP is 209.85.167.49)
 smtp.mailfrom=baylibre.com; dkim=pass (signature was verified)
 header.d=baylibre-com.20210112.gappssmtp.com;dmarc=bestguesspass action=none
 header.from=baylibre.com;compauth=pass reason=109
Received-SPF: Pass (protection.outlook.com: domain of baylibre.com designates
 209.85.167.49 as permitted sender) receiver=protection.outlook.com;
 client-ip=209.85.167.49; helo=mail-lf1-f49.google.com; pr=C
Received: from mail-lf1-f49.google.com (209.85.167.49) by
 BL02EPF0000EE3C.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.8 via Frontend Transport; Mon, 12 Dec 2022 14:05:44 +0000
Received: by mail-lf1-f49.google.com with SMTP id y25so18752010lfa.9
        for <ayankuma@amd.com>; Mon, 12 Dec 2022 06:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLMmebaaMCtyxMIw1nZMh6MtuGLBCZuUml0Oiz4f3o0=;
        b=hC8sCtz0kfXxPsBP4PE2htBT8NRzgJJvwM0i3DsORF+z7xxm2c0D8nx5o9HL7CFusJ
         R5PmcIvoR4UzwiWFD4Be2jD5siMs1cxgAgFZY/e89xDwvSPXGt3qAd/V7nbXwTITzxWJ
         S8Ng4+YEC1PMmo5ROcprFh96w+OrtcY3hwIDu+n9AfA98b+2xaS7d2B0Ka6ec8/zVn0J
         N/XiimuKzktNWRsuDO4Zt5udgrFLioa2IOhnEKMenXQTBPO5mP6+3ur26YZPsfoQ5ht9
         d3aWTUYKvFtfK5DiwaIvEZsSF6Ynecd3qrH2O2B/Rj+n98fOOChTM9lYIYIcZ7ai2cOf
         X1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xLMmebaaMCtyxMIw1nZMh6MtuGLBCZuUml0Oiz4f3o0=;
        b=DXUsep1eqZFr1dFe7UYzPg46yjYIfIF4h4KuS2n6e2Z/gC9fjIAd53yfA23/85BsaS
         c8SwAUrpHO+d8AZ1hvpbAVXxJHKeAuU9f7vLCoWmCqm/iXiotXTxEbLoJWVQV/bhGfAF
         f/ctz4ZHwxHWgrGiTiAljHRq+Ar2mi84hAWQBuZDEFQNFI21RvOfv4RUet2SpN694hyu
         vYBznSnCQ0XLIygVFSD0RscR6XE0rfUB8bkEozLfwwvzO9rHTovpE5OhSTf2ya16LML0
         6Bah4tQM1lMPMlAMF432OF4HrsDdB6L393Acizw4yirTA9xGrX9hnfK6ukanC6AUE6qL
         lRFQ==
X-Gm-Message-State: ANoB5pnlUgFdwGHg/SnsgW1YAeiAMVKmsqb/dhMtH7tqaA3Q3TOjIhoc
	dIn6gwnFGhuNEFN1g20RKhipdjXopISN6FJxG44=
X-Google-Smtp-Source: AA0mqf57/7rJH2dwFASECU/D3DlNkMT7WFbNsBLY/C9pCVDmp15fXwr1xk/rdyh59AfnTlOQ1L3r3A==
X-Received: by 2002:a05:6512:2018:b0:4b5:79ca:e62d with SMTP id a24-20020a056512201800b004b579cae62dmr6396197lfb.16.1670853942774;
        Mon, 12 Dec 2022 06:05:42 -0800 (PST)
Return-Path: ccaione@baylibre.com
Received: from ?IPV6:2a0e:41a:894f:0:9141:8c72:a760:459e? ([2a0e:41a:894f:0:9141:8c72:a760:459e])
        by smtp.gmail.com with ESMTPSA id d24-20020a194f18000000b00492ce573726sm1643600lfb.47.2022.12.12.06.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Dec 2022 06:05:41 -0800 (PST)
Message-ID: <ed0b9a2c-9635-b9fe-bcae-826c97eb9e32@baylibre.com>
Date: Mon, 12 Dec 2022 15:05:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Queries regarding the boot requirements for Zephyr on Arm
 platform
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, Jaxson Han <jaxson.han@arm.com>,
 "npitre@baylibre.com" <npitre@baylibre.com>
Cc: Julien Grall <julien@xen.org>, devel@lists.zephyrproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <f69e17c7-ff85-636d-1176-1556cd1c519a@xen.org>
 <caba6ccf-6589-209c-e3e9-a140eb31a56c@amd.com>
From: Carlo Caione <ccaione@baylibre.com>
In-Reply-To: <caba6ccf-6589-209c-e3e9-a140eb31a56c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MS-Exchange-Organization-ExpirationStartTime: 12 Dec 2022 14:05:45.0879
 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id:
 a8eefc18-bf7a-4a4c-ed48-08dadc49f664
X-EOPAttributedMessage: 0
X-EOPTenantAttributedMessage: 3dd8961f-e488-4e60-8e11-a82d994e183d:0
X-MS-Exchange-Organization-MessageDirectionality: Incoming
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3C:EE_|PH0PR12MB7907:EE_
X-MS-Exchange-Organization-AuthSource:
 BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-MS-Office365-Filtering-Correlation-Id: a8eefc18-bf7a-4a4c-ed48-08dadc49f664
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-Organization-SCL: 1
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report:
 CIP:209.85.167.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail-lf1-f49.google.com;PTR:mail-lf1-f49.google.com;CAT:NONE;SFS:(13230022)(4636009)(451199015)(7596003)(7636003)(356005)(1096003)(5660300002)(8676002)(31686004)(34756004)(4326008)(83380400001)(54906003)(336012)(36756003)(110136005)(6636002)(53546011)(26005)(966005)(31696002)(86362001)(2616005)(43740500002);DIR:INB;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 14:05:44.8691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8eefc18-bf7a-4a4c-ed48-08dadc49f664
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-AuthSource:
 BL02EPF0000EE3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7907
X-MS-Exchange-Transport-EndToEndLatency: 00:00:04.7739864
X-MS-Exchange-Processed-By-BccFoldering: 15.20.5880.018
X-Microsoft-Antispam-Mailbox-Delivery:
 ucf:0;jmr:0;auth:0;dest:I;ENG:(910001)(944506478)(944626604)(920097)(930097);
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ckRHOUxkZUMvTDVEeXBjYzdaMWlzM2RCV3l5Tmt0QzZEK2s3V08rZUJhTGI0?=
 =?utf-8?B?WDREcDBtRVBibjcxeHdJblpjT2R5cERXdU5BdTVlUTVzZGxhZnVMajJmaGs2?=
 =?utf-8?B?RXc1Y2FJQS95VEdabUFGdTBlQit5MWJnTzl0WWVlZ3hSU1piQ1Z5bG5ISjUy?=
 =?utf-8?B?UDRFMnZpTFNjT0FFWDh5MEZlVXNSdzhWTVFKYUF0TzVFY2ZMUWUvZDlnVGM2?=
 =?utf-8?B?eDdER05XQW1yNUJPVUxVQmlrYlY5dXJ2ZWt6S0RaQndIQkhSNWMzQitkVDVp?=
 =?utf-8?B?ZytOM3ZzblVGUnV0WWZKek1oWi9OSnhOeUNrL3VTd09xcEx4NURZTVpobE9s?=
 =?utf-8?B?eXRHVkp6MWU2VWlGTldnMHI0SHpKU3BMcytyK25kS2FDV3pQOW81OXpUdW9V?=
 =?utf-8?B?U3dMQkxyaGx0RzliT3k0a3oxb3VnMDFkdVNvaU1IVzB2bjBzTjhGaTlXelN3?=
 =?utf-8?B?cy91Nk5KdzVSWE4yZGVDTzJvcEtlSG9leDhkNGRMMnpNUHdLZzE2RTZERExI?=
 =?utf-8?B?MXZqK0VvaDdqeERtd1I5WkJmUEhOVFg5YkIxSk5PMlN0MlpiTzIvbkRJd0Ni?=
 =?utf-8?B?ZlZzZGRneGgzbmdjRmE5akpQb3llVnI5Y1VtREk0aDhYOVpvblgzTFkyOUFD?=
 =?utf-8?B?YUZhZUJLUXhVYXhmV2hqTE5CZDNDMjlzNWN4NEU1TnRBeWVSQjMrWkFJRzNS?=
 =?utf-8?B?TjFLR0tnOFIvNk9peFpOUVA0SmFOeWFQNk5ianlTYVI1UUM4SE9Lc2RJblN0?=
 =?utf-8?B?eEJJd0FEZDF3U1VlTS9pMWVmd3ArbDk1TmV1K2ljVVBtdFdIY3lBbTNIS2tV?=
 =?utf-8?B?eUVwb0x2d2lJeGdDZytCbnArZnhwWDQraTNvRkpTd0J5Q0laUkgvWTBWS0hk?=
 =?utf-8?B?MzlyWEJsVG8wbUNZbjNHeVZDRERvUTA2UXdTMVhsdFQ1SHFxR1FVazFQSzlJ?=
 =?utf-8?B?bnQyUkJsWG05UzFWV3VheG1LY05oYmRMYVptd05iQURUUFVvTFBRVzExbkVz?=
 =?utf-8?B?VUg1cklTVlgvdjByM2tzUXNUUktJRzFpQ3l5MWM2TW5aZWFUNStXSjBVM2lB?=
 =?utf-8?B?Z3dyS1F3bmE1SkNvRlEwbDJCNkNiZ3RMb3ZCVFY1TnNPYXhkTkFiUnpaalFS?=
 =?utf-8?B?K0JYRitPNjJLSUk2OE5kdE1ORmtVZm9Cdk9oRW9LRXNuU1RTVnZoWU9VcVo2?=
 =?utf-8?B?ZmdnTXlKenlHc2VWaklyN3RsTzgxSUF1dTNweXhxVHhITk5GSWFpYlhTbjJo?=
 =?utf-8?B?djh2ZmZ3MnVxaTJrdFY2cVlEUy83cFJiaXNaeXJFKy9qNDVYYzBVU2R0UzJh?=
 =?utf-8?B?OXlxelE4MUlDcTBLMjFRdTZ5R25Ea0JiTk4vbkZqOHo5aTdxdXBCMVlRR04z?=
 =?utf-8?B?NVJIQkNKUDZjOWJMSjY4bDNPdTFsSmR6YlZTRi9IT0xkbGVWRHNWZWNScmMr?=
 =?utf-8?B?cmo1VmFGYVFZMklHbEVHTEh6c3J2Vk5ZZG51RW4xU3Nscmo0MXBDNE9EVHdD?=
 =?utf-8?B?VEczeWN0TS9TRzhidVVWQ2s3OWFyK00wbitNTzBvUUpBOTVqNmJhdFVSRmxx?=
 =?utf-8?B?dGkzV2J6NnBjYzBDcHE1Q1ltd3dIMnJ4OENDa0hOWVdDbXgwblVaRmZKNHlH?=
 =?utf-8?B?UDhVelM0MHlJbVRpbFlQRlFPS2YrUzg4T0ZvUmtDV3NNbUxVZldCbGdVSEVs?=
 =?utf-8?B?bUV5bWpLdm93WllGZExDWkt6U1ZYa05jTEhqTnM4Y2lDeFdLWDdvU2NtRllB?=
 =?utf-8?B?QWxiOFZlTHdiMjRLWEFIUE9ENXFDeU1jdVhOWE50aURxTWhVSU1IeE82bXY2?=
 =?utf-8?B?OGRZWWRjaUNNWkFJTzJna1BkMVFZOURybjU1WGYxcW1sTHdOaU5vR0RZZFZl?=
 =?utf-8?B?dHkxcU5MaGNKMy84aHVDeUNYZldra283cThtdjQzT1FNWjZxeDZFK25PUE11?=
 =?utf-8?B?RVFzd2ZsN0RrLzl6dHBsdnRqdmloemtsUzFTVDFFczBJVVh6NTI2R05jemE5?=
 =?utf-8?B?bHoxUE1na1lUZThuQmRIQ2plT2Z0ZTlhOEV4NXlHSGlhb1ZHRjFTQzlSc2M1?=
 =?utf-8?B?Vi9hZ0U5TGZzeDB1czhYSG1MNjcxNmorbkt5QURCaEdrVU5kTlJyOEtpNlpm?=
 =?utf-8?B?ZEFtOUJBcXlmeG9KS0htWUZ1YjdZSHNuanJ0M1VPZ2didnVkUzgyRGtnK2V0?=
 =?utf-8?B?TzUvUkFwU0dtNHhvRVNpT3RPUVJyM1J2STNUbTJJTEVIaksyamhDNTU0Mkha?=
 =?utf-8?B?Qkp2d3g3VUdmdXhOV0tJcTNnaDhGeDVDVG9rWWFRVzZ5QTV5RlhheFBXcXFz?=
 =?utf-8?B?Q2xtM0tIejNUT0lhbzVlMkVCUEh1bHdCZ25XVXFEcjlpQ0VSbXlzMEVudFRy?=
 =?utf-8?B?MWFJVmZHb2dCell0Z0lwNmNvNVRXemswTlJJK1NYL2FxNmgyZ1dzcmNiN1B0?=
 =?utf-8?B?NU42RzJ1WDNYejBDUGNoeEl4VEswMFpYdnIvZ1FsS0tVblRFQmlTa21FR0Uv?=
 =?utf-8?B?bGx4ZWFFS3VEVnF6TFgwNDRFNUJtUlNMS0tXL0tXRmNRcGF5K0dUUjBrY1lt?=
 =?utf-8?Q?e+n8zDiWU=3D?=
MIME-Version: 1.0

On 12/12/2022 13:37, Ayan Kumar Halder wrote:
> Hi Zephyr Arm Team,

Hello,

> A) Zephyr is expected to run as a baremetal binary. When loading
> from Xen or uboot, the interrupts should be disabled.

Correct. We disable the interrupts at boot for good measure before but
in theory you want the interrupts to be disabled before jumping to Zephyr.

> There is nothing mentioned about the state of caches, but I assume 
> I/D caches will have to be disabled. Otherwise, there is a chance of 
> reading stale instructions from I cache.

Correct. When zephyr is chain-loaded by u-boot we usually disable I/D
caches from u-boot itself before jumping.

> The state of the system should be similar to how it is out of reset 
> state (SVC or EL1).

Yes, the only caveat is that in Zephyr you have to set CONFIG_ARMV8_A_NS
whether you are booting from EL3 or EL1.

> When Zephyr is loaded in memory, I am expecting the image to be 
> cleaned to PoC. However, I am not very sure on this.

The BSS is cleared as part of the boot process with z_bss_zero() and
data is copied with z_data_copy(), see [1] for more details.

> A) I assume I cache needs to be disabled.

Yup.

> A) The general purpose registers can be in an in-determinate state.

We do not make any assumption about the state of the GPR at boot. If
there is an hidden dependency, that is a bug to fix.

> A) Zephyr is built with a device tree. Thus, it does not expect 
> pre-determined values in r0, r1, etc.

Correct.

Ciao!

[1]
https://github.com/zephyrproject-rtos/zephyr/blob/main/arch/arm64/core/prep_c.c#L54

-- 
Carlo Caione


--------------QsNICmmrM0E0tkn0xo3lyUHh--

