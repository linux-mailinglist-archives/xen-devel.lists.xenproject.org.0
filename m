Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72B56E152C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 21:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520911.809038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn2bl-0001gC-BN; Thu, 13 Apr 2023 19:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520911.809038; Thu, 13 Apr 2023 19:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn2bl-0001eK-8B; Thu, 13 Apr 2023 19:27:49 +0000
Received: by outflank-mailman (input) for mailman id 520911;
 Thu, 13 Apr 2023 19:27:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m4jA=AE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pn2bj-0001eD-TS
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 19:27:48 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43a66ac0-da31-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 21:27:45 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by IA1PR12MB6019.namprd12.prod.outlook.com (2603:10b6:208:3d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Thu, 13 Apr
 2023 19:27:41 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::f6c3:91ae:9bd8:edea%6]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 19:27:41 +0000
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
X-Inumbo-ID: 43a66ac0-da31-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbMjtnn6XXHNi3qbL/Ikf97TDDREslIOhyTqgaN690dknApJVZ3EznKbCckGaSidZE5GSHMEIjxEF75EKCs+L4k0GozkkWRPA2slhDR8Rvj04XCtyeZYft/kd+vvD/wzuzRARlZppiztdMx69WE35nOmndg52BBt+mqX/RHp2QAhSg+LzV/afMArxAv9xYt2XJ3YaNRa4Na7kcfd8GdYL6fXgENoRqlyaKcB0fUDE3AmYYiQRMmD49UZSFLVBvnMtFf1kqXPPPeFJ0RvbvGBt6KuhC4j27nmvYzwHLzhzeNbt4DjUGC5TPLfoIVJuudC53pZbLcewzkvQc15SP3HdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PL8Oe2EKSeHiiX45CknT0nJ4Lkp6F7sg+e7i9HnZpWU=;
 b=PqyGtT/B9uS46so+lSK3vsSqJ079mvNcJwCGDZgdv9/kQ6dxXS/f6DmVqDsdWgJ869GvUaUR3FDsOsBkjoRf9Q6zGrkb0jWx/CtukU+vL5e14kh1Sgq4GNEItp2n9WWhgR7dgZ7AeIc1LNQUHXZzuC1VSub2TYRifW8zE+oDWaRtHkrZGTCsoLcBQZi9RdTaA7R1B88Mg6ub/7E2SSCSR+HSq0PdOTFZtDJigX7ur7bD5Dcp1ynBZKDTQlsV3lZ7GC0ezkO3TGDv2Cn2i9CwiPjV6Owdi4U26PzcAKyXCcj4wl3CLFEXi04vFhIbRAHmL0VdsAIM+cV2OtgVuOgjSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL8Oe2EKSeHiiX45CknT0nJ4Lkp6F7sg+e7i9HnZpWU=;
 b=YJ/LH0m8wwbb8QPXXgiK1QuAdl8ZJnwLJMunRcci6+1xj0pQtH32b27+QlSqe0jPl7o9F6UCN0RcGlNqwl1b2M1elqebMnDT6Evrl8cjCN4SKEYKqOM9DjgKfEhvqMKj3sxflq/1BdKeiXJDNXS2W8Cno+LyrxTB4ubUyQuZIg8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <7ce2f5e3-4f22-46e2-2e51-197aba861671@amd.com>
Date: Thu, 13 Apr 2023 12:27:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 03/17] xen/arm: Add CONFIG_OVERLAY_DTB
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-4-vikram.garhwal@amd.com>
 <e40e323b-6eec-2cdc-62ac-d7c6eff59bd8@amd.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <e40e323b-6eec-2cdc-62ac-d7c6eff59bd8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0110.namprd05.prod.outlook.com
 (2603:10b6:a03:334::25) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|IA1PR12MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d7d03c-dbb7-47dd-a556-08db3c552620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gDmkD2xtf4RrQB3t3mQz5aloJo1G7rh0jt6/qTdhLsX2YZwlPYJqCfAANhCLqLLSob0LYhvGxuNuPAK1uyNrxtewRmEJ21ftovZpWgrY68F/oYJfDcmHlmb/JR48sJVRganQroFlcieaJi3lxPbk/tAmxnYeF9jDh1tOpQHRNlTmnFfHPy6EZN7QwgabUuNxMpQebLn15oVabAgUPxMTXuUdyYRKctWNQUxst7UkT2jZcpyMJCUuTqaOmIpY8EOm0yX0dT7mTXS1azWOe8gv5Vc6N2LUu97t1ut2Qt97Ji8DANU8tgyFVoPtNUKjfZ9ECvZs6jxdPr0XLppr+fGJiXiGxfsxOZPgT5YvKdjk905VB1ixbKIPNszMhyuaLu0Y9XkewUAYBOvjmwhB31ZTvEedVdsRm7hs//6+sZJn5GJZQqjEwdNJR3zdsJu0oL71G5NSd710jIVYSaolNOqrg+lsHuqr/pm0VmiN/2pkd8Kk2qqWA5/qJBsASG3eskC9sQJSRr9DQuXHyHMm+KF5Fs1lI/aHem60xGRBQcmFPTMD2xUrE7I6Uj1+ULCKhi0qDE70YQybhkpwMZDAiqHfhycbekXHhOSzQ78HyoRYGHIRh2qWe1dGS28wAEtflUT6ImjlLjuKh9l9zrbZXooENg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199021)(86362001)(31686004)(38100700002)(31696002)(36756003)(41300700001)(8936002)(6512007)(6666004)(6486002)(44832011)(478600001)(5660300002)(4326008)(316002)(186003)(2616005)(53546011)(54906003)(2906002)(26005)(8676002)(6506007)(66556008)(66476007)(66946007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG05UzF6V3FZM09LVXZkSlE4RlZ5VmZtUHNES1Z2SUVQdGdldDRsRnN5T0ZN?=
 =?utf-8?B?b2h4OUd1R29CL1pSLy9PZlprVWhxa3MzVDZBTUJoajNONnpGaXh3cWFwYnBY?=
 =?utf-8?B?RmpKcjBLUW9ncTRzSDhlcE04SHN2MXNRZFJkRjRTeEU2ZE43bkMwY05XUmU2?=
 =?utf-8?B?WDNjbXlvMmpjMWpJekpCVWwwV21RYVJYSnczVEpVaE9UTk5VeTJFbFhxeGE5?=
 =?utf-8?B?VFp0eFhHSDB0YzB5cXUvaEcrTENjTC9CaURjWlB2SkxTbEhFZ2FnNDBIc3lI?=
 =?utf-8?B?dWhUU2xzZHhBcDg5K2I3ZUdQUGQ1NFNKQnYwRUMrNFpSWHZHVWRpUVVXbENr?=
 =?utf-8?B?WTR0MmdWeGc4WGJwRUFORW5abkJvNGdMdDF4TWhMT2tiZWFoSUVJTHJPL1BV?=
 =?utf-8?B?ZW9NY2ZkNzB2TWtmU2xsWlM2cFRuaXJTZjJGK3B6MzZSWHozc3BnYWNNZ01s?=
 =?utf-8?B?dmpON0wrak0yd0s3Uzlra1krb0ZKeE9SZGlXZWpqMlRsWjRTVVZHTTdUUG1x?=
 =?utf-8?B?ZTI1RVlaeFd2Yzh0UzBsZFhLWk0wNVQ4RU0yV0MwclYvR1NpT1FQSGtaWW9F?=
 =?utf-8?B?UTNXajlsY2tjOW1tVTRDc1l5eVRRWVRXUUpRRGNKT1RGcytxSmpiVVgyZ1FO?=
 =?utf-8?B?RGlqQ0o4NUoxV1J3elJPWlZtU2V3NnptRDJWK3hXUHoycmliY0hWbXVJeG1o?=
 =?utf-8?B?MlJ3SFdLRVRUL0h0SXhOaG4yalU0dVdwWHFmb3dadkFBbVk2UDhFdVRaaXdO?=
 =?utf-8?B?K1QweUJZbHRYTGRob2Z2QXpQbS8zVFlxTUpjeGxPSVVHczV2Q2FCeUJJM3l1?=
 =?utf-8?B?ZFlNR3hSYUpRbFIzdTBXOWtUMkhhU29kd2RobjdXZ2FBRzFOZ29tWVVnNjR4?=
 =?utf-8?B?V25RTWN2MTVaR2l6ZTE3aktXelFoVHd4MUVUZUxNUjdDUGJic3g3YmxQOElv?=
 =?utf-8?B?cDlYZVVTa01GUmxXZm9NRmYrTEZDRnVENENyQVdUdEhNTWcybG5xc2F6Smg5?=
 =?utf-8?B?ZmV0d2dVdkNZemx6VVpsbU16TlAweTcxY3RadUU0Q0paMnJRUzZOeVNXR2Nk?=
 =?utf-8?B?QjVENUMrRExaUlQweHoxVWNKWWd2RXNvc2VBQTFDWEJOallQcEpBdXFqK294?=
 =?utf-8?B?eHlnZHRZR3Nhd0dqQ213NDZuQkVxeEZwS05MWFZnTkZETTZiTy9HS2JoRVBn?=
 =?utf-8?B?YmZKYUNucWlLQnl2cUVlMGJqQ3U1djNoaUQ3RTBEMENuMWQ1eHFRSUR5TWxK?=
 =?utf-8?B?SDlyaC8yWFRPSmU1SlhXeThJOXpUMXppVTZ4V3hZNDFqbE8rb3daZEUycktt?=
 =?utf-8?B?Y0VCT0oyUVJXeVZVTnk5dmx4dEczRm1LNDh6OXIyMWJRSzJBYTJGdFNRYWIv?=
 =?utf-8?B?NVd3c3dQMGw3dXpFT3pwVGhJUktJbHJMenUwT0lSK0dkUzR1L0FzcDNjOXpO?=
 =?utf-8?B?QlI0MGNTSEZaYS9aK0p5RDZuc2pWZjlFWXZzOW01SXlrelliTWxtdHpER1p5?=
 =?utf-8?B?OFp6WHZNV1RHczhwVU9UdTNZWkozNURiUEZlOGpWZ3V3TWFqcWVza3h6cFZP?=
 =?utf-8?B?WjczZy9VUGRhb0xLaktNSk9pSHBndUN6aXhaWlRVbTJXODVaQzh5bkJNVFJo?=
 =?utf-8?B?TjFrRmtudnBpSHZ4U0ZaY0c1cUYvU0lwMjcrNk1TSjdmZ0VPb3lUdXQydFh0?=
 =?utf-8?B?akhlTVkrWUdSZGhsMTlaaWRKWk51ZitXV0tjWmxQL3RrWmJBR0xuZm1zZm5m?=
 =?utf-8?B?OHF1Tk02R1RhaWRybms3THFPN1IrZE93aGVmVkpsckM4VDNON3FtOFhlMXlQ?=
 =?utf-8?B?aHgzU3ZvN2NFWnVUbDJMamxUb2tyeDQ2T1JiTjNtYUhjYnNuUTdySENaMnRQ?=
 =?utf-8?B?UE42eHFubnBJOTZabjdyVHdva085dXNsOGtrZjlDRmw5b3JDMVVkYXRXUVFZ?=
 =?utf-8?B?SnRpbFZNcjAxM2xRa3ZyRGJ6NStIbElwUEtmS3ZSRXJnbEhMTUpjWFJnbktv?=
 =?utf-8?B?WGVydzkrbnpVNllHL040RUh2VWhSSmN2RUw5aGpoc0poTTZxMG5wTU83bDlV?=
 =?utf-8?B?a0JJcTV2WnROTldob214NUJCcnhiYVNrbVNwVEJQcFpaaTFsRU1UYU95alBZ?=
 =?utf-8?Q?bm2sOC8UWTO15zriBFeqPiOf6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d7d03c-dbb7-47dd-a556-08db3c552620
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 19:27:41.4652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Anuavt911F1VhPcn77OI1VJE/xNiqwIfTOzStT5Aw0EORqbVu4yXVbNVH2INyGTAW5FQwsq1vQfVoXRRvTxtBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6019

Hi Michal,

On 4/13/23 2:58 AM, Michal Orzel wrote:
> Hi Vikram,
>
> On 11/04/2023 21:16, Vikram Garhwal wrote:
>>
>> Introduce a config option where the user can enable support for adding/removing
>> device tree nodes using a device tree binary overlay.
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   SUPPORT.md           | 6 ++++++
>>   xen/arch/arm/Kconfig | 5 +++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index aa1940e55f..0a31f40af4 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -822,6 +822,12 @@ No support for QEMU backends in a 16K or 64K domain.
>>
>>       Status: Supported
>>
>> +### Device Tree Overlays
>> +
>> +Add/Remove device tree nodes using a device tree overlay binary(.dtbo).
>> +
>> +    Status: Supported for ARM
> Hmm, so here you say supported but in Kconfig - unsupported.
> I think, this should be:
> Status, ARM: Tech Preview
> or Experimental
Experimental sounds better to me.
Will update it.
>> +
>>   ### ARM: Guest ACPI support
>>
>>       Status: Supported
>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>> index 239d3aed3c..1fe3d698a5 100644
>> --- a/xen/arch/arm/Kconfig
>> +++ b/xen/arch/arm/Kconfig
>> @@ -53,6 +53,11 @@ config HAS_ITS
>>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
>>           depends on GICV3 && !NEW_VGIC && !ARM_32
>>
>> +config OVERLAY_DTB
>> +       bool "DTB overlay support (UNSUPPORTED)" if UNSUPPORTED
>> +       help
>> +         Dynamic addition/removal of Xen device tree nodes using a dtbo.
>> +
>>   config HVM
>>           def_bool y
>>
>> --
>> 2.17.1
>>
>>
> ~Michal


