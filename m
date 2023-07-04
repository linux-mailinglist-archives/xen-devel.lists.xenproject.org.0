Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E374780B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 19:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558598.872837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGk9d-00011m-EI; Tue, 04 Jul 2023 17:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558598.872837; Tue, 04 Jul 2023 17:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGk9d-0000yF-BI; Tue, 04 Jul 2023 17:49:33 +0000
Received: by outflank-mailman (input) for mailman id 558598;
 Tue, 04 Jul 2023 17:49:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gy6C=CW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qGk9b-0000y9-QR
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 17:49:32 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f71fbe0-1a93-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 19:49:29 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA1PR12MB6140.namprd12.prod.outlook.com (2603:10b6:208:3e8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 17:49:25 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 17:49:24 +0000
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
X-Inumbo-ID: 1f71fbe0-1a93-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tnipih9W3SzV6nCC0hl/DvU47MjzDp4iDMAeZKBlMLE3M3kOQj2tt9byU4y5Yh4jc0PmpNosk/8Oos+XhEqXPjSDm5cuOyIx0z9a651e+0ij2CuZKk5O80+IylPV9tY10QMD5UIhNBs9UdfIHkxBzx/cKhh+TCR9Agc5KbfXhi2DHxnvDbCSKKsGKueT74z3MJ+EJ8GTNCdOdooOSmnWLQ036d5TKfpi+nfwj2RJILEZ7zmxJKLgZ9Xsmuvd1C095GiRgypChbRp8R6fAcDsJ0JIGwoW2DAlWous35lAlbSr7qeyhW4RgnRcZ1Aj1oHDhHL0zoPPJdQI0DgQUIxMLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yGlU24WHe213eNFj1Lqzcqyl9YI7crMqyTQ4h3q0I3U=;
 b=VrQT1Q/C+PAk6Ojc7CAQra1cYiClxBbEKHdfM1cNB5tezSOJ0CyMdS7VVrAyoWU9KjADKesZtGwrvUgcFj6swPdj/db3jp+inMZhgT+frGxn4ZVYOgWy/jFC5kLiSwX8zq/uEppvBOBAabKS4uzvYi3njEt66bIeXQ+e6F+PUobfYqqjTdxh7/ai/6gzy/DGCb9Zlz9RhpgULQ0Zj2cEXnePBpYf2JoescYJghOyE/awkgNV7IEWqS4b0kEJMqJNyFolFyOi3bVhRvZyz78bN4mngBeWc8Jm/jTQNmCy8EZDRtZ2Hr9EhV3lgd74uFGWw85rbb/Ndg3JAicMfS1hDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGlU24WHe213eNFj1Lqzcqyl9YI7crMqyTQ4h3q0I3U=;
 b=EXQjW5VTF37xDhnqJeSR+FjZUVD/HfOgDU7rUQZa79JFsyZgvd6JlQd0CzfEnXvqvX/eMPRX3LArQZ1dPwBoqjd6/deRoCOsik0XulpMjP3nfu3U2jHxh98nKaLS90s2Fn5rIHQB2ogLA2je/zj2p4fS1szzky8++usEbYrA+ow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <516dc7aa-4487-cd7c-f9dc-42738314e3f4@amd.com>
Date: Tue, 4 Jul 2023 18:49:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 42/52] xen/mpu: implement setup_virt_paging for MPU
 system
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-43-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-43-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0356.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::32) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA1PR12MB6140:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4ef72b-b4e8-4cf5-42b8-08db7cb70167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BBfFTunHatp/JrwwW40x0xe7jSOtephOMRUGkoQYecDePZQfCFdGGyLK5CuSvi5g4iZAPhDJ4hVog6KUBNMLNOKAaCosC8/L5vjbSwFF3H3nfuw4MYT7o0Ga1JjRHoTjlBK9X64/D66d5By4IcU4w5blonH8dxA9s0G76SLJhHvHmI4m2jE62JKmIw2qhZaspjk75YQO5BKPhxRtjj/WUJ5m823RJh4p8QNAJnT4V9i7Qd7BuJ2CM/psOpSDjWpr9JYqWPagCQWZhDBh7h3Y1uOadylSTwEkWon5nU+vtlu/ySV6wDIKdGcg9yUCTEXOvqeEVhzxrW+Isyr2CSl18MI0BXcqGkP5GtUbp0NQZdppHTSpnkb6sqO+MGp2gDMrxZgGXTLKEISEw42Z7xtb9Tu2rB7MnFVPpHlU4X36yXHqroKSu7bVIgKY4r5cwiGdGk/xeZQuUZgOpcUre9YFTGY9tyC82GMpm0UQTjpcaDiFPPzf/4KecS1XXyEV0cmAWJmr9w2KhCcRsW20F93HKI0m7+mFffLicihc2koTQIYuW18mdFrVSwe7MJ5c7SSB4z6YTaYrvMbB47yQfb7l+rv5jwAMS1m6VWdPmf8DfuBOyTklXzMDIHcL1EbvY8kje79c7uc4zuiUINz90X0/iQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(31696002)(41300700001)(38100700002)(6486002)(6666004)(2616005)(186003)(83380400001)(53546011)(26005)(6506007)(6512007)(54906003)(478600001)(2906002)(36756003)(316002)(66556008)(4326008)(66476007)(66946007)(8936002)(8676002)(31686004)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzRKaW9nNmdpK0hmajBYRXFXa0tGTXo0NHNnMVdBTE0vNUVSdVRZNlJFUldx?=
 =?utf-8?B?ZDFqcjlsMDlRenJLbEZqOGlaeHRKWDhwZWwwMlNxQklRSUtRdTNKQWZVM1NJ?=
 =?utf-8?B?ZFY1T2NTbGM0ODNSdFlTUkgzNkVva2t2Mms0Y1RsbGJvSXhhT2p5a09wVkVZ?=
 =?utf-8?B?UEFXdEd5a2VaS2tpQ2lRcnZ5ZURyd0x3WDJna0tubGpVTlJCMEQvYk9KcCtG?=
 =?utf-8?B?M096T01vaHNoWnJJb2c0V2R2SnBxYktLN3R6cXZiZEljVGxVQXJKRWU4M0Nu?=
 =?utf-8?B?cmc4SVFpd3VJWG0zalRrYnczWE1UWEcraWtwNTIxOUw4Vkp6M3NWSGVHeXF6?=
 =?utf-8?B?a0FTR0FhRVNRUjZhOTBnN3BYTWNXaXl1ODdnTTZFWGxZVzhJaVphZjlPdGsx?=
 =?utf-8?B?MkN2cWJxeUc5Vk9uNk9LWE5FTG1UMERVcll6SWVsTjBUVXJNZnRkUkdiL0hP?=
 =?utf-8?B?dDJ3VkVlaFBZSXFRZmhlWW84SndocSt0UnV6QVRvYnlycnZqS0hhMTdpQkpU?=
 =?utf-8?B?a1BKWCsza3Q1WXZvWGJKK09BcUY1Q1FYY2VuWjE3V2J1Yk9EZ0NCeWVEVkhL?=
 =?utf-8?B?Q29rekhYSlhDL05PSFgrL2M2YXdlZk9JUG1odzFzWmNYTHlnWis1ampuQVpt?=
 =?utf-8?B?L0ZzN1ExWVUvZVhyUE51RWFWNDRSMzJlbWpBNVlEREwrU2l5Tm8xck44OVA1?=
 =?utf-8?B?Zy8rQWFmdDdvdzBwOE42WXVTKzVBVXR0dnBGMmtRQkRpcDhEeFQ2VXlZSUMv?=
 =?utf-8?B?YUVUVWc5UURmeVliWE4rSWJORmpqdVJ1dHpkNlZpck1Pa016bktCRE85Y3dq?=
 =?utf-8?B?ZHFQeXU0dkJmS3pqdkFXSzhTOS9uTmszWndNcEYycDVNWllIOEVOTGFoaXVC?=
 =?utf-8?B?Zm1rbXdzakpPQWE1YTRMRUFobGhZZnBGWEpjbVFYVlNXNmlYbVZ6dTRDVGJX?=
 =?utf-8?B?NFNSVnYwanNkVUVob1YrUHVWZmhobG4vNlhHSWZRWHRBQTVxTTZkZXNnQktj?=
 =?utf-8?B?VVNVWVVsQWhuZ1BRc01KSEtXTThMS0pXdm9vcFgwbm5pOFVnQVk1ZitVMXlR?=
 =?utf-8?B?c1lRR0YwdzZtbndoUy9ZQS9MNVVxVzhIMmVUNVZLSFRUUUlKRDRNUTdDVzVC?=
 =?utf-8?B?dzdUZVBDOHRRdmVkZXF3aW9FWkJmb3FnVHR4b1NlNVppMXN4cEpnRlpSOUFn?=
 =?utf-8?B?MmdSd1MzNm1vbVAxSTBpMFJXV0YvcTd1eGpudDJqZDdnNkVEWm5OcjIzU0Vy?=
 =?utf-8?B?QjNUN0x3dmhOY3FoOUhOWDlIVHpRZFN5VE9YdUppV3NBc09JRCtWdmN0clNr?=
 =?utf-8?B?bWlpSHZkU2cyZmJpdTlWdWRxVko1WGhCT3hvVC9nVmVzTU9OeU1oUWxRN3ZH?=
 =?utf-8?B?YVVIakU4TlhOaTdaT3VZdncydVNkazZFUmZDaGtFU1IwNUFkbGpUbFh0WmVP?=
 =?utf-8?B?SnE4WC9mU3FreC8zbFc0R2s0alhUdGFwd2h5YjZDd3dzbDVqelVrSHdxMnc0?=
 =?utf-8?B?RTNhbjNsNzVacS94SGRWWitrTHlmQ0ZKdjVXRmt3amVxNlRVTWtlM1puN1Fj?=
 =?utf-8?B?eE43Z29WSDMzZG1PTDc4QXlVVkFEamZzb2d5Q1pqSW9LSXJDVTRxWXB3NnIy?=
 =?utf-8?B?SWNWclNQYnZNVDhrODJpT1Y5R0hBbnowMkgyWHd4Ym5HdGJmNHZlbDB3ZFdt?=
 =?utf-8?B?Y0RnSzRWQzdmZFNNVGlLc0h3RElHME5IcnJpM2Uyc0JudHdGNmtnYXFpMjE5?=
 =?utf-8?B?NUEwNXFjOUQ2TjJRbHhXTVlPYW91QnZERnd3MUR6ZS8rejAwbmZZN0xoNTZn?=
 =?utf-8?B?cUdWWVUzQ3BNUkFvYXhiNG9ZV0JxckJGQ3I5cUViUTlUREJpTnllRXBxNUht?=
 =?utf-8?B?U3BNcjRMSXMya1p2ZStBTEg5VjhzajE0Q1lCUWxCL0haeGgvOThHMm93U3di?=
 =?utf-8?B?OExmUWVYK21BbndMWmowSk9aL1dvOWM4aWpXV0RVazUwdUdPSGZRV1NyUmQ4?=
 =?utf-8?B?UUdySkpzM0RvMURTYUVHaFVuMjArRFlMWFB4OGFQVmlNaFFUNWxQb1dOSzdq?=
 =?utf-8?B?VnFjSjZKTXY2QUJoaU5QTE9JbDc2M1V5TnRlMHRiNkpZeFZSQXJ5djRYTE9P?=
 =?utf-8?Q?lUbWSZ9Sk+mPHrOdBvaiYYdNl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4ef72b-b4e8-4cf5-42b8-08db7cb70167
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 17:49:24.8686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTC0KwjnbCuVFzY2VkA4LrQIfGOTQzc4k9+lT+3YGBkhJvIPXkeKjxadI+p0zfVCEDAyvHlq5UUeEyzV5NJqaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6140

Hi Penny,

Most of these are specific to ARM_64, thus we can add "#ifdef 
CONFIG_ARM_64" as follows :-

On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> For MMU system, setup_virt_paging is used to configure stage 2 address
> translation regime, like IPA bits, VMID allocator set up, etc.
> Some could be inherited in MPU system, like VMID allocator set up, etc.
>
> For MPU system, we could have the following memory translation regime:
> - PMSAv8-64 at both EL1/EL0 and EL2
> - VMSAv8-64 at EL1/EL0 and PMSAv8-64 at EL2
> The default option will be the second, unless the platform could not support,
> which could be checked against MSA_frac bit in Memory Model Feature Register 0(
> ID_AA64MMFR0_EL1).
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - no change
> ---
>   xen/arch/arm/Makefile                 |  1 +
>   xen/arch/arm/include/asm/cpufeature.h |  7 ++
>   xen/arch/arm/include/asm/p2m.h        |  8 +++
>   xen/arch/arm/include/asm/processor.h  | 13 ++++
>   xen/arch/arm/mpu/p2m.c                | 92 +++++++++++++++++++++++++++
>   5 files changed, 121 insertions(+)
>   create mode 100644 xen/arch/arm/mpu/p2m.c
>
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index feb49640a0..9f4b11b069 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -47,6 +47,7 @@ obj-y += mmu/p2m.o
>   else
>   obj-y += mpu/mm.o
>   obj-y += mpu/setup.o
> +obj-y += mpu/p2m.o
>   endif
>   obj-y += mm.o
>   obj-y += monitor.o
> diff --git a/xen/arch/arm/include/asm/cpufeature.h b/xen/arch/arm/include/asm/cpufeature.h
> index 894f278a4a..cbaf41881b 100644
> --- a/xen/arch/arm/include/asm/cpufeature.h
> +++ b/xen/arch/arm/include/asm/cpufeature.h
> @@ -250,6 +250,12 @@ struct cpuinfo_arm {
>               unsigned long tgranule_16K:4;
>               unsigned long tgranule_64K:4;
>               unsigned long tgranule_4K:4;
> +#ifdef CONFIG_HAS_MPU
> +            unsigned long __res:16;
> +            unsigned long msa:4;
> +            unsigned long msa_frac:4;
> +            unsigned long __res0:8;
> +#else
>               unsigned long tgranule_16k_2:4;
>               unsigned long tgranule_64k_2:4;
>               unsigned long tgranule_4k_2:4;
> @@ -257,6 +263,7 @@ struct cpuinfo_arm {
>               unsigned long __res0:8;
>               unsigned long fgt:4;
>               unsigned long ecv:4;
> +#endif
>
>               /* MMFR1 */
>               unsigned long hafdbs:4;
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index f62d632830..d9c91d4a98 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -16,8 +16,16 @@ extern unsigned int p2m_ipa_bits;
>
>   extern unsigned int p2m_root_order;
>   extern unsigned int p2m_root_level;
> +#ifdef CONFIG_HAS_MPU
> +/*
> + * A 4KB Page is enough for stage 2 translation in MPU system, which could
> + * store at most 255 EL2 MPU memory regions.
> + */
> +#define P2M_ROOT_ORDER 0
> +#else
>   #define P2M_ROOT_ORDER    p2m_root_order
>   #define P2M_ROOT_LEVEL p2m_root_level
> +#endif
>
>   #define MAX_VMID_8_BIT  (1UL << 8)
>   #define MAX_VMID_16_BIT (1UL << 16)
> diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
> index 685f9b18fd..fe761ce50f 100644
> --- a/xen/arch/arm/include/asm/processor.h
> +++ b/xen/arch/arm/include/asm/processor.h
> @@ -389,6 +389,12 @@
>
>   #define VTCR_RES1       (_AC(1,UL)<<31)
>
> +#ifdef CONFIG_HAS_MPU
&& ARM_64 /* As these are specific to ID_AA64MMFR0EL1 */
> +#define VTCR_MSA_VMSA   (_AC(0x1,UL)<<31)
> +#define VTCR_MSA_PMSA   ~(_AC(0x1,UL)<<31)
> +#define NSA_SEL2        ~(_AC(0x1,UL)<<30)
> +#endif
> +
>   /* HCPTR Hyp. Coprocessor Trap Register */
>   #define HCPTR_TAM       ((_AC(1,U)<<30))
>   #define HCPTR_TTA       ((_AC(1,U)<<20))        /* Trap trace registers */
> @@ -449,6 +455,13 @@
>   #define MM64_VMID_16_BITS_SUPPORT   0x2
>   #endif
>
> +#ifdef CONFIG_HAS_MPU
&& ARM_64 /* As these are specific to ID_AA64MMFR0EL1 */
> +#define MM64_MSA_PMSA_SUPPORT       0xf
> +#define MM64_MSA_FRAC_NONE_SUPPORT  0x0
> +#define MM64_MSA_FRAC_PMSA_SUPPORT  0x1
> +#define MM64_MSA_FRAC_VMSA_SUPPORT  0x2
> +#endif
> +
>   #ifndef __ASSEMBLY__
>
>   extern register_t __cpu_logical_map[];
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> new file mode 100644
> index 0000000000..04c44825cb
> --- /dev/null
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -0,0 +1,92 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <xen/lib.h>
> +#include <xen/mm-frame.h>
> +#include <xen/sched.h>
> +#include <xen/warning.h>
> +
> +#include <asm/p2m.h>
> +#include <asm/processor.h>
> +#include <asm/sysregs.h>
> +
> +void __init setup_virt_paging(void)
> +{
> +    uint64_t val = 0;
> +    bool p2m_vmsa = true;
> +
> +    /* PA size */
> +    const unsigned int pa_range_info[] = { 32, 36, 40, 42, 44, 48, 52, 0, /* Invalid */ };

As this file is common between ARM_32 and ARM_64 and the following is 
specific to ARM_64, please add

#ifdef CONFIG_ARM_64

> +
> +    /*
> +     * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
> +     * with IPA bits == PA bits, compare against "pabits".
> +     */
> +    if ( pa_range_info[system_cpuinfo.mm64.pa_range] < p2m_ipa_bits )
> +        p2m_ipa_bits = pa_range_info[system_cpuinfo.mm64.pa_range];
> +
> +    /* In ARMV8R, hypervisor in secure EL2. */
> +    val &= NSA_SEL2;
> +
> +    /*
> +     * The MSA and MSA_frac fields in the ID_AA64MMFR0_EL1 register
> +     * identify the memory system configurations supported at EL1.
> +     * In Armv8-R AArch64, the only permitted value for ID_AA64MMFR0_EL1.MSA is
> +     * 0b1111. When ID_AA64MMFR0_EL1.MSA_frac is 0b0010, the stage 1 of the
> +     * Secure EL1&0 translation regime can enable PMSAv8-64 or VMSAv8-64
> +     * architecture.
> +     */
> +    if ( system_cpuinfo.mm64.msa == MM64_MSA_PMSA_SUPPORT )
> +    {
> +        if ( system_cpuinfo.mm64.msa_frac == MM64_MSA_FRAC_NONE_SUPPORT )
> +            goto fault;
> +
> +        if ( system_cpuinfo.mm64.msa_frac != MM64_MSA_FRAC_VMSA_SUPPORT )
> +        {
> +            p2m_vmsa = false;
> +            warning_add("Be aware of that there is no support for VMSAv8-64 at EL1 on this platform.\n");
> +        }
> +    }
> +    else
> +        goto fault;
> +
> +    /*
> +     * If PE supports both PMSAv8-64 and VMSAv8-64 at EL1, then VTCR_EL2.MSA
> +     * determines the memory system architecture enabled at stage 1 of the
> +     * Secure EL1&0 translation regime.
> +     *
> +     * Normally, we set the initial VTCR_EL2.MSA value VMSAv8-64 support,
> +     * unless this platform only supports PMSAv8-64.
> +     */
> +    if ( !p2m_vmsa )
> +        val &= VTCR_MSA_PMSA;
> +    else
> +        val |= VTCR_MSA_VMSA;
> +
> +    /*
> +     * cpuinfo sanitization makes sure we support 16bits VMID only if
> +     * all cores are supporting it.
> +     */
> +    if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
> +        max_vmid = MAX_VMID_16_BIT;
> +
> +    /* Set the VS bit only if 16 bit VMID is supported. */
> +    if ( MAX_VMID == MAX_VMID_16_BIT )
> +        val |= VTCR_VS;
> +

#endif

- Ayan

> +    p2m_vmid_allocator_init();
> +
> +    WRITE_SYSREG(val, VTCR_EL2);
> +
> +    return;
> +
> +fault:
> +    panic("Hardware with no PMSAv8-64 support in any translation regime.\n");
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.25.1
>
>

