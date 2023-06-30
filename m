Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D80743E9A
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 17:21:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557549.871010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFFun-00076V-Ej; Fri, 30 Jun 2023 15:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557549.871010; Fri, 30 Jun 2023 15:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFFun-00071P-AS; Fri, 30 Jun 2023 15:20:05 +0000
Received: by outflank-mailman (input) for mailman id 557549;
 Fri, 30 Jun 2023 15:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9zhT=CS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qFFul-0006QR-O1
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 15:20:03 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 920928b9-1759-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 17:19:58 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Fri, 30 Jun
 2023 15:19:53 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Fri, 30 Jun 2023
 15:19:53 +0000
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
X-Inumbo-ID: 920928b9-1759-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OcAACk59eTE/CxByIFgv3w07bwDwr5B4V620dJCN7sq3pj67kC8eRas2DngMCzFy4cmmeQPdeWSPTDpSXFkoEQ27mrBv+HLjDflkBhaaUgZZK5T2klRh/DoRVgi8uNp9RSDzs1Wh0ynT4JyxrlGdrAfdwjyMKlnCbojZBVNqyjNa6zrfJ7a2piDn5oUONdCbUOaehMHFO3WDPnM3WKaIqt9tBo0H0a+H9ppNxhT8pxHNr7xpxtT/fY8QsclNuNPzwVKtXw3QzIo/OUPf5TE+C8M08RjSLuOsUlXf25TuVy2tfUMYeFq8Yz5W/kGBVK+rsYpOt3Aab2qoYCtYwRNIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6FWPYGymkiF9pdeUVvwpn6KXQgMTyIhMMqX0NA7flc=;
 b=IrCkM3JWHMal3GI/Bf6QWUg7MmYwoXiySn9fWKsfSgU3oceR8C4YELW4wl3vJDOFL0TaluwFwUT/JWrmb434ekL8ux7nxsu4rLu6TQpNlKqUo4usQtHQ+zu8VdVHcgQctikCQMjHpLfKgFITzfP4pfh+4pixttHMQQKvAf1QOvY+fYNF66wyuHcFl6AbP+XHMfBRD/vgBGrUi1Iyhl7Kk4DClTL/zgZ+KgkNrvRtUFLeLLL5CEgYhWnSDeu4Lfu4U5GsrvAO9iyCH2Mij/7eJ5Do0T50tQ6PEnpQB9e54FVb/dDgZDbRxbGTp34W8/VYbCQ45800weCL3TUghzSHmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6FWPYGymkiF9pdeUVvwpn6KXQgMTyIhMMqX0NA7flc=;
 b=aI6JwVkNIlYmyv+S3pwmVrNRpmJMfD1XUhnzmzFShZH8tj9J5gp/O3JSbfoWwe5jQ6lJMj6wyXDiQmIbrqh8570apXMjEqEntUBMOX+yBnVpEvXWuQ4c2M3KyXNGcPjOaKVAQG1csWZ7xty4NI53aDx+cUbCfzit9KrZ5OBzSbY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <ee709651-a6fc-2485-ae2b-edf0306fbc13@amd.com>
Date: Fri, 30 Jun 2023 16:19:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 33/52] xen/mpu: initialize frametable in MPU system
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-34-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-34-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::19) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DS0PR12MB7874:EE_
X-MS-Office365-Filtering-Correlation-Id: ab76a130-1c4d-472e-c872-08db797d7437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AdkuArJLOjmEqCNWKSA0GJJi0SH2dG2siixR/tLKBIiVGFpFtzcphTSg7k/8Z2U39sq/QeIhAKto4l2vfmEInrp6DzWoj5Q48MK7xtznhBxH+1mMgMFGmyAgkC1hf9u4JsEgLnU+DMmGjh7b7QT3PrTKWb5/3t4yktead5xLGtcCnQUi1AsUIUIbxKv6iX7BVQt4LH/kz6RtMqApu5jPgcn9de3Kn3lvg/Ou78UJU+xRBY6zIhFoHaaiy789ERO1xQCDkuVrp5vKF54bBbR7g5M8J/371pieVpNWTHCGD6rOFpuOY8ZnivSKzSdDWJ/1uF4wPvTLV8Wkx1xAZ84Jtuvt4+Bv3Lmax7a3cNwWS0PMX3JYHY4bZr0qa3v74NJ5OPHQU+cDw6WH0XIQ6kWH+1/3C7msEWL87qzUdxFn3YoNhLgXbSb5bfzZWXkLB9RMQMjiKl74ETybZvNC48aPYbFjX9CMZEf75NwmUX3y+mxEnvJaf3VjoTpV1tMLU+eVs/wxL7Yk8UXQdcoceaofkdsINuTIVS3GnhaL0+aBWePrGoxV5JH+yY+2Ne+mXmXRkVG9AEZ3Ln/fDJNvln2PCssEVq7AeB1twncL1nXCOHZO3HRVQzRkT39krIJyCdw064WzMdn3+/7IWI1axtM7zQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(396003)(39860400002)(136003)(451199021)(2906002)(186003)(6486002)(2616005)(6666004)(38100700002)(83380400001)(6512007)(53546011)(6506007)(26005)(41300700001)(31696002)(54906003)(316002)(36756003)(478600001)(66556008)(66476007)(66946007)(4326008)(31686004)(5660300002)(8936002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0ZxaVJNU0QrUXFFampMSEVRNDk2Q1NDR3pmVENENU4wMm9iZ0NoTU1DdlVR?=
 =?utf-8?B?TjVFKzVoQXhoOTlvc0dXRjNmb3BNaUU4OGxTNXNUTjE4NlVzaXYvK09QdWVn?=
 =?utf-8?B?NFpSTGVFOGZtN05FaHliUW1EbDEvVkJlN3pmRjA5MUIvMXNHZ0plVTUyQ1d5?=
 =?utf-8?B?alNGdklUaDFUc2FEeisxVjEyK0Z3bGVBV0NPTTBoUjVhbDdiN00wUjR0SDA2?=
 =?utf-8?B?K1lBaVhmQXg4d1RsbHdRRFVDTFFiUmlKa2hWbVhnSUhucDkrZjE4UG5hd0pu?=
 =?utf-8?B?RUUvZVh1SDJ3dTU3U1NXM3dJOXNxa1ltT1I2YU5jZE40RXRvWHA0VUJjdDVS?=
 =?utf-8?B?UGJmNFNuTTJvMzE0cFovSjR4Ymo0TGxMUmpOTmUzUVd2RDNSZkZUK3ZaaitB?=
 =?utf-8?B?QTVEcWhBM05HMkRSZ2hIU04rNXdlUlUxaTMxcVIrMll2TCtNbUVPcVQ3SHZD?=
 =?utf-8?B?VEtPK2RibnN0SXNnWnNYNUQ2eitDTWoxcFFod011WTcvWldhK0lFVWV4NmE2?=
 =?utf-8?B?ZE1OOTZTTW9vMmxob2ltVFFrRVpKZXVJNm1XWGxITEdNMjdxYkxKOUxocVQz?=
 =?utf-8?B?UmxwSXVNTE1ialpvZ0xzMWNpQWtDZ09USk5JaFNLMzJTZ3FUSEd1OXpTZU15?=
 =?utf-8?B?cXFFdzZqWlBRMzllOGVSY0RMb1lHWTlMK2tOR1crZlI3ZGJIZ3NsajJ4VWlK?=
 =?utf-8?B?YlpRcFExSStTWEVXY09UVWtBTXhneThZbFpweEVVMENxSDcwRGdhL1hIZEhM?=
 =?utf-8?B?WXZRdHZDT2k5T3RWV21jYis0c3FYeHM2dmZOekVNN2JueU5oUm5QNTR3M2dR?=
 =?utf-8?B?aXZyZ3FvSXZlNEhRUjlXaStNU1JJUjFVQmlIQmExT1VIYzRWWXIzN0JGVnVy?=
 =?utf-8?B?VDJKMVdEUzlyS0xtN09SN1RTaklnWkhSdktML3MvRENQVjEzV2J4ay9jcVVW?=
 =?utf-8?B?TXJEaFRDY255RTJabU9QTEdvZFBzaXJuZHdDUEVsOE1aK1dKdTFBc2h2Q0Jl?=
 =?utf-8?B?MVVMN21zNzBaRVh2T2tDNDJLRlorZFFMRjFjV1I1OGJQbmcvWXdlUklYb2o3?=
 =?utf-8?B?WXZzZTQvczFIRm9KSzFzMnZyTGw2bGhNY2dqWmllMWpIVlhEZFNsQWFMWnpo?=
 =?utf-8?B?Rk03ZkNTaW1MR05pdTIyMDlGTEthM2U2c3dqblo2WG5JWjkrSHNScWQ5cE12?=
 =?utf-8?B?S1lnYmJZN3gxV21hWFR4R3ZhTm5ROHpJMlljNkdLbEFKTzJwVHJ5ejZ3Um9X?=
 =?utf-8?B?RU1wREtocHc5OUJMRE5yb3BtT2YrNTZ1R1BGQnYrRXg5T0txYVpoSVlGR21m?=
 =?utf-8?B?a29kemdXWkxYdUR6RnM4Q0wxanNBaTVKd1dZWC8vWkwrcXFsaXNlaEJDS2Uz?=
 =?utf-8?B?UnBNZGNWcmVrRk9uUGV4cFJjdHdjcEdyMjQycnAyTG1LbUpOeTE0Y3FPQVJF?=
 =?utf-8?B?cm1pcWRuU25PaDIvWWxicVMyLy9aNEpNNk1EWEpscHo4QUdnQi8zMzJ6TEl0?=
 =?utf-8?B?U1B5NU1NWU1BZllTUGQydHdCeXBBU3ZpOXZRMFl0ZlpDVVRZV0wvRG5iVWJ5?=
 =?utf-8?B?dUxpODlib2xzMExZb3lJeG84NC8rZEFXU3V3Z1BzSnczZ2hzbmsxRUhJS0Fs?=
 =?utf-8?B?K2E4c3dEV0RsWFptbTFpNVhsdllwVEtvVWY2bkdVeW4xWStRdUN6TFNNcUJR?=
 =?utf-8?B?UzM3WmgweGdFYTVlU2xIYmZEemNyZER2aFlaU081ZGtrM003KzV1dE1nanJ5?=
 =?utf-8?B?R2F0Q295SmoxMldzQWk0UFFoSWhuNFhyeFM0aDZDTGxBYnR6SGxPK25KUGpY?=
 =?utf-8?B?ZjQvNFRyWFZ0eXBWMjV5Mlh5WHNJc3VTazVlQXd5YzczRVMvTnpFdk91VjZF?=
 =?utf-8?B?d1VEaUFCdUJuS0ozM2J3UUJadTErVEp6N1F4ZUJKTWhkamlPZTJ3L3JleUNU?=
 =?utf-8?B?NTBPMlJkVTdBYmdIQ3N5QmhscE1hN3ZucnBLSXlBOFQ3TDRDdVlQZXJ5OXVY?=
 =?utf-8?B?NFRSR3lyL09PNzVqZTJiRUJmd21ldEMxL1NsU3FhQWY1Qk5aQkRUaWR6cVMx?=
 =?utf-8?B?QTlNa1BWSDUxVTB0aGRrMzlNRkhRc1FXN3cwVlZsOFhlRDZUTjJjZ1hmSjk5?=
 =?utf-8?Q?Qlu9sh8cKlvN9F1APVMEHpkoH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab76a130-1c4d-472e-c872-08db797d7437
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 15:19:53.2876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5mwnCr6WQJoDQA/rCtpAQl60zT1cBQEr9ADoIgwL50WSa52oeHbPYh4po3XOzuzL+J5iq7JXBr+hXK052b5m2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874

Hi Penny,

On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Xen is using page as the smallest granularity for memory managment.
> And we want to follow the same concept in MPU system.
> That is, structure page_info and the frametable which is used for storing
> and managing the smallest memory managment unit is also required in MPU system.
>
> In MPU system, since we can not use a fixed VA address(FRAMETABLE_VIRT_START)
> to map frametable like MMU system does and everything is 1:1 mapping, we
> instead define a variable "struct page_info *frame_table" as frametable
> pointer, and ask boot allocator to allocate appropriate memory for frametable.
>
> As frametable is successfully initialized, the convertion between machine frame
> number/machine address/"virtual address" and page-info structure is
> ready too, like mfn_to_page/maddr_to_page/virt_to_page, etc
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - add ASSERT() to confirm the MFN you pass is covered by the frametable.
> ---
>   xen/arch/arm/include/asm/mm.h     | 14 ++++++++++++++
>   xen/arch/arm/include/asm/mpu/mm.h |  3 +++
>   xen/arch/arm/mpu/mm.c             | 27 +++++++++++++++++++++++++++
>   3 files changed, 44 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index daa6329505..66d98b9a29 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -341,6 +341,19 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
>   #define virt_to_mfn(va)     __virt_to_mfn(va)
>   #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
>
> +#ifdef CONFIG_HAS_MPU
> +/* Convert between virtual address to page-info structure. */
> +static inline struct page_info *virt_to_page(const void *v)
> +{
> +    unsigned long pdx;
> +
> +    pdx = paddr_to_pdx(virt_to_maddr(v));
> +    ASSERT(pdx >= frametable_base_pdx);
> +    ASSERT(pdx < frametable_pdx_end);
> +
> +    return frame_table + pdx - frametable_base_pdx;
> +}
This should go in xen/arch/arm/include/asm/mpu/mm.h. Then you don't need 
ifdef
> +#else
>   /* Convert between Xen-heap virtual addresses and page-info structures. */
>   static inline struct page_info *virt_to_page(const void *v)
>   {
> @@ -354,6 +367,7 @@ static inline struct page_info *virt_to_page(const void *v)
>       pdx += mfn_to_pdx(directmap_mfn_start);
>       return frame_table + pdx - frametable_base_pdx;
>   }
Consequently, this should be in xen/arch/arm/include/asm/mmu/mm.h
> +#endif
>
>   static inline void *page_to_virt(const struct page_info *pg)
>   {
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index e26bd4f975..98f6df65b8 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -2,6 +2,9 @@
>   #ifndef __ARCH_ARM_MM_MPU__
>   #define __ARCH_ARM_MM_MPU__
>
> +extern struct page_info *frame_table;
If you define frame_table in xen/arch/arm/include/asm/mm.h , then you 
don't need the above declaration.
> +extern unsigned long frametable_pdx_end;
Also you don't need extern as this is only used by xen/arch/arm/mpu/mm.c.
> +
>   extern int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);

You don't need extern here as it should be used only in 
xen/arch/arm/mpu/mm.c

Currently, I see the following in xen/arch/arm/mm.c,

int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
                      unsigned int flags)
{
#ifndef CONFIG_HAS_MPU
     return xen_pt_update(virt, mfn, nr_mfns, flags);
#else
     return xen_mpumap_update(mfn_to_maddr(mfn),
                              mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
#endif
}

int destroy_xen_mappings(unsigned long s, unsigned long e)
{
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
     ASSERT(IS_ALIGNED(e, PAGE_SIZE));
     ASSERT(s <= e);
#ifndef CONFIG_HAS_MPU
     return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, 0);
#else
     return xen_mpumap_update(virt_to_maddr((void *)s),
                              virt_to_maddr((void *)e), 0);
#endif
}

int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int 
flags)
{
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
     ASSERT(IS_ALIGNED(e, PAGE_SIZE));
     ASSERT(s <= e);
#ifndef CONFIG_HAS_MPU
     return xen_pt_update(s, INVALID_MFN, (e - s) >> PAGE_SHIFT, flags);
#else
     return xen_mpumap_update(virt_to_maddr((void *)s),
                              virt_to_maddr((void *)e), flags);
#endif
}

It would be better to have 2 implementations for map_pages_to_xen(), 
destroy_xen_mappings() and modify_xen_mappings() in 
xen/arch/arm/mpu/mm.c and xen/arch/arm/mmu/mm.c.

>   extern void setup_staticheap_mappings(void);
>
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 7bd5609102..0a65b58dc4 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -27,6 +27,10 @@
>   #include <asm/page.h>
>   #include <asm/setup.h>
>
> +/* Override macros from asm/mm.h to make them work with mfn_t */
> +#undef mfn_to_virt
Why do we have to do this ?
> +#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
> +
>   #ifdef NDEBUG
>   static inline void __attribute__ ((__format__ (__printf__, 1, 2)))
>   region_printk(const char *fmt, ...) {}
> @@ -58,6 +62,9 @@ static DEFINE_SPINLOCK(xen_mpumap_lock);
>
>   static DEFINE_SPINLOCK(xen_mpumap_alloc_lock);
>
> +struct page_info *frame_table;
> +unsigned long frametable_pdx_end __read_mostly;
> +
>   /* Write a MPU protection region */
>   #define WRITE_PROTECTION_REGION(pr, prbar_el2, prlar_el2) ({    \
>       const pr_t *_pr = pr;                                       \
> @@ -513,6 +520,26 @@ void __init setup_staticheap_mappings(void)
>       }
>   }
>
> +/* Map a frame table to cover physical addresses ps through pe */
> +void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
> +{
> +    mfn_t base_mfn;
> +    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
> +                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
> +    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
> +
> +    frametable_base_pdx = paddr_to_pdx(ps);
> +    frametable_size = ROUNDUP(frametable_size, PAGE_SIZE);
> +    frametable_pdx_end = frametable_base_pdx + nr_pdxs;
> +
> +    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 1);
> +    frame_table = (struct page_info *)mfn_to_virt(base_mfn);
> +
> +    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
> +    memset(&frame_table[nr_pdxs], -1,
> +           frametable_size - (nr_pdxs * sizeof(struct page_info)));
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> --
> 2.25.1
- Ayan

