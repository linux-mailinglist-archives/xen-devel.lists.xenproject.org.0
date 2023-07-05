Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C05DE74859E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 16:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559205.873987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH34q-0007kc-Q3; Wed, 05 Jul 2023 14:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559205.873987; Wed, 05 Jul 2023 14:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH34q-0007iq-ND; Wed, 05 Jul 2023 14:01:52 +0000
Received: by outflank-mailman (input) for mailman id 559205;
 Wed, 05 Jul 2023 14:01:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl5h=CX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qH34p-0007hY-Ko
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 14:01:51 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe59::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ba43835-1b3c-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 16:01:49 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Wed, 5 Jul
 2023 14:01:46 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 14:01:46 +0000
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
X-Inumbo-ID: 7ba43835-1b3c-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJQXhN6KvalqVqKRocGPGV0bHkzrsOjRiDPQC5IJUCR/4tOL01cEM1aHo9yY1kb2FSUokTqq6EnKS3axad/NAwSCjo2ZuDflLNX+N6DHubkpiH2g49qKxaFVgaS0NvCvTFGLEqeCE6t38ZAYWHzDpobS8U5CbepVewVx/UdsldRsUsBsadmMBTWUsrMj3gajY1ltgdlR3CkIZdUDIiA5muZ6ff4Azi9Z+EAYuDrTlyIjyduK+ZbeGAKWqLSwpRVWyxeRqTGYWk6+yRD1BlP0tKOYY2a3nAt5Q6LI1a5lF7od9oPYtjN5tVon98FvZTUkS2pgw6vaMPo2f3ilwEm4tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnV1Oz20FfKAim9cI+eKjVqxL+7UpJ7EFksK3UnlPaA=;
 b=ThvmnrmE6OIDjqrIUEq/n1iHJr0tebVlVLJCYY1gQ3+Wuk50kRagpd6wuSB80OhIj7AAW6MbD7nz1XYaqHZ/7ryfXg4X9qzYH8bLk18nXce4LR7NkiPQ6XXKpdUcvuvc5jvIvQ7D6fx4Gfx+8WIv81Rbkn+tsqxfdnoBjGuRwQlM83cEQJ4XYZhHPwBmr0ocjGPG6J2j16T4GrXQ3sBnrTrWZRFAWLuuEe70tSa+du4hmX7OziUlwZuLKlYXam6/Kaq7qerPmApuQZZSoNvk/fozfbUH277zr3vRLMBj2k+rUxD/FRdF7N0pmuVrZu3wc7zzCUuTEYqnh11DVXlU7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnV1Oz20FfKAim9cI+eKjVqxL+7UpJ7EFksK3UnlPaA=;
 b=GIjCQPhPJwFa0gbuKTA0Sm0pEsfBMzfxhfIUpwZIhSIBRl0K1KF4My7yb8CcrYn0NF69D1kJDXrZivKnhVxNw2J9Lz5J83YOTZFVocxWxWEsYi4k+tzb1jH3wtmH7sPWhqHTgJTy0maLkyBzvxUIhIvWRjIILcaubD9pm0rXP00=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <60afd920-6fdb-5403-e096-57f86e4ed35e@amd.com>
Date: Wed, 5 Jul 2023 15:01:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 36/52] xen/mpu: implememt ioremap_xxx in MPU
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-37-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-37-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0192.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::17) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 381acf25-5b73-48b9-b3ac-08db7d605e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fvyEJldpMY/NONDyGPdTLwQkoHKbfnkMLwo1ZHqZQHjCJZIv/kwMPx9CEwfo+BsoNMVplbxfNnIBVuUtDdxdEhFvfh5Z5FKXEM6EEQTZ6oZjsAHXEnJvEuBOGcjZX3o77k04tzq03GbUE71hmZjyJo+nvdKpT/eak3wYPPSEIe5NdeHDpIqwSfaNszUrXRr31Yj+eEpV58xdU0G25kNy29vxGDYb/YtQEyOFzVPT876T1MO/CGO4m0s+/lgN6bylQrWTGec3UdzTt2AHmx+nHupvrW9RtxQi4wB5FWyDtTh9i/FR309VonoSaI0vZTHQ0UNj5eVzTTB+J4qY4vbcEHaYsGEL1czQ7KToYff+VMacVOIEmr0gDTvALf5cQ46OB34UjrhG6wbbdRnr69VH2AuHmmeblgkzniCBCMuRco9e9DVsZu8nLvw2SfqXvdKvpCIgdrjsCODaauX3BwFxJJDHFB8aFkAwua3lphxsHc67X3q7xFmipQQlNGAAid1ke1oZKYU7kHzn8hjHqXjSAyuVHXjUG8YVilt/nmIV22eaOq36+iKykmwrmuxoNQ611CwPJE+7m7AZBAysiLtbAyi7bYeBomM05FQo5X8LtSfPUgkuGkXrqWD2cyweqgA/jEVdQb8pDLEzBlJ1q8PdjT8JUjpdMFn/QuiAj6yukM0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199021)(2616005)(54906003)(6666004)(6512007)(6486002)(478600001)(53546011)(186003)(6506007)(26005)(2906002)(8936002)(5660300002)(41300700001)(8676002)(4326008)(66556008)(66476007)(316002)(66946007)(38100700002)(31696002)(36756003)(83380400001)(31686004)(66899021)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTJINWdvRXQ1NU1sVG5QV0NtTFNQYUhMQW5xY2M3V2FidzRjR0QzQkY5MEtt?=
 =?utf-8?B?a2ZieTVGc0x3bTZzSE52RGZ1SkplaGJNTGVnK1hBV1ZSQk96emc1allrR0ZK?=
 =?utf-8?B?dFhqVkMrSUZKTjU1L3BVeENTZC95U0ppVDZhb1czUUkxSHY0TlphV1V2K3BD?=
 =?utf-8?B?ay9qZjJoWWZrek5JNTV5THltT0tPa3J6Nlc5Uk56UHFGWFd1bGYyMFhWSmEy?=
 =?utf-8?B?ekVmU1Q1U1BmazRXZWlyMXk2NUhJVzkwUGFpTjJqbGJxZVpqdGpaM2s2R0lH?=
 =?utf-8?B?TU5oQkhtVkMrdkJnVHd1TDlVMEhxMy8yQXZHKytVUU1LK0Z0NmwyN1h1OFo2?=
 =?utf-8?B?QjZJUlU5QjVLVEJKR2lJNHU0eWUvWnlvWUJZQWpTSjdqSXZlcDBHMkI5SG50?=
 =?utf-8?B?eVRkZWRZVG9VNUN2eHVmeFZkVFRQMzg1Z08yaUFxWVVhcTU4TFBnd045ajk0?=
 =?utf-8?B?MEh2VGpDcDRWb3A2QkZSTjEvN2N4ZWhQZ3MvK0xia3BVMm1mdTQ3TlV6djdr?=
 =?utf-8?B?eXczQmptalRCa3pEcldUU1krdElxenV4bEJHanM1a1p6ZWtHRkhvMmhZaWRL?=
 =?utf-8?B?NDRQcUtzbUVvdEk0NXpFN3B2NWtJTSs0ZVMwUU5OdmhlSVlrUVQrYVZlZWNx?=
 =?utf-8?B?VkNuMW1EWGdOSW8zdk9ETEVKV1dCeHdaOVFCZFltcXVsV1VqNkZrNjZFL1dj?=
 =?utf-8?B?Uk5Oa21lZ243OGw2MjRSd1RDSzhwMVBsRll0YmI4V3FmalFPdy9hTzJnQTJF?=
 =?utf-8?B?SjUrclluTmhDYW9TVEZUYUE3RjE2VDl5NWdHVzZ6LzFRUUpHdXZyKzFTWlJ3?=
 =?utf-8?B?YUFJRmZyWEhMbnd6L1RKbDJ2MVQxOFo2clRIaVgzM3RaTXVCQ2ZBWHRLZ3Fl?=
 =?utf-8?B?c295MUFON0hwVTE0TG5MT2VXV1RzUGFqM3ZYNTV0cVZ4NDArcDJpcHBPVk5L?=
 =?utf-8?B?Yi9kMTVtbmhUS015dmI1TnhPWitnRnYvcnFyOWE3UkpYTThqVEp5NllaTlll?=
 =?utf-8?B?TCs3REE0Q3VpczZtUlptZjM3aDg1QWhzeG1YQTlZNktrR3Y5b0h4ZnZycW1n?=
 =?utf-8?B?SnRDUVRJd1J1TjlSa2IwSXhCN3pUY3RmQ1lmS1E4dWUyVE5UczFFZW9YNzFu?=
 =?utf-8?B?dWlOaFMrV0RocXNRMmVTT0RDbjJEcW96RkFGOXpQV3pXZnU4VXBNaWRrdHp1?=
 =?utf-8?B?a1loKzIxNEZQN1pvSkFpKy9wZEJxODBkWDhRd2FyanYwN3JlOWtyMi94ekUw?=
 =?utf-8?B?MWRacFRVSHBjNHJ1VHI4S0ljM1ptNmkwT2EzN1N1emx3Z2xxUFNNMktuUjNs?=
 =?utf-8?B?dE41SmNEWEg5UC9HbFBjZVY1Yzd2dDhQZEZGZG9iZHdJMUprcXBOaVpyb1dh?=
 =?utf-8?B?ZS9KR291NG1kaDBLQjFOMjM0NU5FTFhWV2hiajhDcDZmSndZNnNXMWhDWXRO?=
 =?utf-8?B?VXJPSTJyeGNXYVEvdVdzOVRhQlI3YWIweTQrTW9JbmE5T2N6aEUyY0YxaU9N?=
 =?utf-8?B?VHRDeGhiekF5VUt6TFJ3dit2SXF0bjYrOUx4aWM4eDcrVmRnUnRnN3pLMndx?=
 =?utf-8?B?SC9XZndLUTBhbG12SVVGTjloMk13Y1c5MmJucDM2VDJUZVkzWEZiTmVzQUZN?=
 =?utf-8?B?REk1TnRIeFIrZGlyNDZZbUFQMVQ3WmRxMkhEdUJOOERuQ203bkFwaWplM3VZ?=
 =?utf-8?B?VkVGelFyaVRzbWkxSy9tQ0ZaYjc1K0pwcFhza2plM1p1S1EybUhmTUMxbGZN?=
 =?utf-8?B?VlBNODlFbVU5S1JrUTZ4YkJWYWd3ejRuejZ3cWNaeUVUeGtxQVR1aUhhaVVX?=
 =?utf-8?B?UEo1cnVaNVMzaVJqT0tJOEI2dTJSandYWTJBbmhDNmZPOW5CUER0cGUxZkVo?=
 =?utf-8?B?czAyNTF3M1NJODhvZm1vU1hTUmVzZzBEMldaWWQ0UllUS2wzQTk3S3grSHdk?=
 =?utf-8?B?WCtBTWRUc21hcjIxMTZSRlFzdXJSWDh5Z2ZUaEcxSHlad3M0NmVTend4akgz?=
 =?utf-8?B?UWd3RndTUDdSSktYNGx5OGw4cWo1VjRVemJTaXF4dnVVaUNpdjRMMGZlTURM?=
 =?utf-8?B?VU8xRUxmS1FnZUNSbTZWSSs3VVppaHBqdzArenlLcDhMRHNuOEJVTzlsL3dz?=
 =?utf-8?Q?xRwhExJpmW0+Yn2p/7SzFJK03?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381acf25-5b73-48b9-b3ac-08db7d605e55
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 14:01:45.8421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mUdIq9W0MDOKnE3STecwM82MXIk0zF5iClXtp22gGmvN673wrtRHcvKSO+abA3VyTJ/U5G/ocsH3FhsrCxtgbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604

Hi Penny,

On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> A set of function ioremap_xxx are designed to map deivce memory or
> remap part of memory temporarily for short-time special purpose, like
> using ioremap_wc to temporarily remap guest kernel non-cacheable, for
> copying it to guest memory.
>
> As virtual translation is not supported in MPU, and we always follow the
> rule of "map in demand" in MPU, we implement MPU version of ioremap_xxx,
> through mapping the memory with a transient MPU memory region.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - adapt to the new rule of "map in demand"
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h |   4 +
>   xen/arch/arm/include/asm/mm.h        |   6 +
>   xen/arch/arm/mpu/mm.c                | 185 +++++++++++++++++++++++++++
>   3 files changed, 195 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index aee7947223..c5e69f239a 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -121,6 +121,10 @@ static inline bool region_is_valid(pr_t *pr)
>       return pr->prlar.reg.en;
>   }
>
> +static inline bool region_is_transient(pr_t *pr)
> +{
> +    return pr->prlar.reg.tran;
> +}
>   #endif /* __ASSEMBLY__ */
>
>   #endif /* __ARM64_MPU_H__ */
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index cffbf8a595..0352182d99 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -227,6 +227,7 @@ void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int attributes);
>   extern int map_staticmem_pages_to_xen(paddr_t start, paddr_t end);
>   extern int unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end);
>
> +#ifndef CONFIG_HAS_MPU
>   static inline void __iomem *ioremap_nocache(paddr_t start, size_t len)
>   {
>       return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
> @@ -241,6 +242,11 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
>   {
>       return ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
>   }
> +#else
> +extern void __iomem *ioremap_nocache(paddr_t start, size_t len);
> +extern void __iomem *ioremap_cache(paddr_t start, size_t len);
> +extern void __iomem *ioremap_wc(paddr_t start, size_t len);
> +#endif
>
>   /* XXX -- account for base */
>   #define mfn_valid(mfn)        ({                                              \
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 9d5c1da39c..3bb1a5c7c4 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -624,6 +624,191 @@ int __init unmap_staticmem_pages_to_xen(paddr_t start, paddr_t end)
>       return xen_mpumap_update(start, end, 0);
>   }
>
> +/*
> + * Check whether memory range [pa, pa + len) is mapped in Xen MPU
> + * memory mapping table xen_mpumap.
> + *
> + * If it is mapped, the associated index will be returned.
> + * If it is not mapped, INVALID_REGION_IDX will be returned.
> + */
> +static uint8_t is_mm_range_mapped(paddr_t pa, paddr_t len)
> +{
> +    int rc;
> +    uint8_t idx;
> +
> +    rc = mpumap_contain_region(xen_mpumap, max_xen_mpumap, pa, pa + len - 1,
> +                               &idx);
> +    if ( (rc == MPUMAP_REGION_FOUND) || (rc == MPUMAP_REGION_INCLUSIVE) )
> +        return idx;
> +
> +    if ( rc == MPUMAP_REGION_OVERLAP )
> +         panic("mpu: can not deal with overlapped MPU memory region\n");
> +    /* Not mapped */
> +    return INVALID_REGION_IDX;
> +}
> +
> +static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
> +{
> +    if ( region->prbar.reg.ap != PAGE_AP_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING "region permission is not matched (0x%x -> 0x%x)\n",
> +               region->prbar.reg.ap, PAGE_AP_MASK(attributes));
> +        return false;
> +    }
> +
> +    if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING "region execution permission is not matched (0x%x -> 0x%x)\n",
> +               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
> +        return false;
> +    }
> +
> +    if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
> +    {
> +        printk(XENLOG_WARNING "region memory attributes is not matched (0x%x -> 0x%x)\n",
> +               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
> +/*
> + * Check whether memory range [pa, pa + len) is mapped with memory
> + * attributes #attr in Xen MPU memory mapping table xen_mpumap.
> + *
> + * If it is mapped but with different memory attributes, Errno -EINVAL
> + * will be returned.
> + * If it is not mapped at all, Errno -ENOENT will be returned.
> + */
> +static int is_mm_range_mapped_with_attr(paddr_t pa, paddr_t len,
> +                                        unsigned int attr)
> +{
> +    uint8_t idx;
> +
> +    idx = is_mm_range_mapped(pa, len);
> +    if ( idx != INVALID_REGION_IDX )
> +    {
> +        pr_t *region;
> +
> +        region = &xen_mpumap[idx];
> +        if ( !is_mm_attr_match(region, attr) )
> +            return -EINVAL;
> +
> +        return 0;
> +    }
> +
> +    return -ENOENT;
> +}
> +
> +/*
> + * map_mm_range shall work with unmap_mm_range to map a chunk
> + * of memory with a transient MPU memory region for a period of short time.
> + */
> +static void *map_mm_range(paddr_t pa, size_t len, unsigned int attributes)
> +{
> +    if ( xen_mpumap_update(pa, pa + len, attributes | _PAGE_TRANSIENT) )
> +        printk(XENLOG_ERR "Failed to map_mm_range 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
> +               pa, pa + len);
Don't you want to return NULL or something from here ?
> +
> +    return maddr_to_virt(pa);
> +}
> +
> +static void unmap_mm_range(paddr_t pa)
> +{
> +    uint8_t idx;
> +
> +    /*
> +     * The mapping size in map_mm_range is at least PAGE_SIZE.
> +     * Find the MPU memory region mapped through map_mm_range, and associated
> +     * idx will be returned.
> +     */
> +    idx = is_mm_range_mapped(pa, PAGE_SIZE);
> +    if ( idx == INVALID_REGION_IDX )
> +    {
> +        printk(XENLOG_ERR "Failed to unmap_mm_range MPU memory region at 0x%"PRIpaddr"\n",
> +               pa);
> +        return;
> +    }
> +
> +    if ( !region_is_transient(&xen_mpumap[idx]) )
> +    {
> +        printk(XENLOG_WARNING "Failed to unmap MPU memory region at 0x%"PRIpaddr"\n, as it is not transient\n",
> +               pa);
> +        return;
> +    }

Does this mean you only allow unmapping of transient memory ?

So, is the non transient memory always expected to be mapped throughout 
the lifetime of the system ?

> +
> +    /* Disable MPU memory region and clear the according entry in xen_mpumap */
> +    control_mpu_region_from_index(idx, false);
> +}
> +
> +/*
> + * It works with "iounmap" as a pair to temporarily map a chunk of memory
> + * with a transient MPU memory region, for short-time special accessing.
> + */
> +void *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
> +{
> +    return map_mm_range(round_pgdown(pa), round_pgup(len), attributes);
> +}
> +
> +/* ioremap_nocache is normally used to map device memory */
> +void __iomem *ioremap_nocache(paddr_t start, size_t len)
> +{
> +    int rc;

For this function and others (ioremap_xxx()), don't we need to check if 
the memory is transient ?

- Ayan

> +
> +    /* Check whether it is already mapped as device memory */
> +    rc = is_mm_range_mapped_with_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
> +    if ( rc == -ENOENT )
> +        return ioremap_attr(start, len, PAGE_HYPERVISOR_NOCACHE);
> +    else if ( rc != 0 )
> +        return NULL;
> +
> +    /* Already mapped */
> +    return maddr_to_virt(start);
> +}
> +
> +/*
> + * ioremap_cache which is working with iounmap as a pair, is normally used to
> + * map a chunck of cacheable memory temporarily for short-time special purpose.
> + */
> +void __iomem *ioremap_cache(paddr_t start, size_t len)
> +{
> +    int rc;
> +
> +    rc = is_mm_range_mapped_with_attr(start, len, PAGE_HYPERVISOR);
> +    if ( rc == -ENOENT )
> +        return ioremap_attr(start, len, PAGE_HYPERVISOR);
> +    else if ( rc != 0 )
> +        return NULL;
> +
> +    /* Already mapped */
> +    return maddr_to_virt(start);
> +}
> +
> +/*
> + * ioremap_wc which is working with iounmap as a pair, is normally used to
> + * map a chunck of non-cacheable memory temporarily for short-time special
> + * purpose.
> + */
> +void __iomem *ioremap_wc(paddr_t start, size_t len)
> +{
> +    int rc;
> +
> +    rc = is_mm_range_mapped_with_attr(start, len, PAGE_HYPERVISOR_WC);
> +    if ( rc == -ENOENT )
> +        ioremap_attr(start, len, PAGE_HYPERVISOR_WC);
> +    else if ( rc != 0 )
> +        return NULL;
> +
> +    /* Already mapped */
> +    return maddr_to_virt(start);
> +}
> +
> +void iounmap(void __iomem *va)
> +{
> +    unmap_mm_range(virt_to_maddr(va));
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> --
> 2.25.1
>
>

