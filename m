Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 422CE748933
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 18:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559426.874398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5M7-0002ok-Bb; Wed, 05 Jul 2023 16:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559426.874398; Wed, 05 Jul 2023 16:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH5M7-0002n3-8O; Wed, 05 Jul 2023 16:27:51 +0000
Received: by outflank-mailman (input) for mailman id 559426;
 Wed, 05 Jul 2023 16:27:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gl5h=CX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qH5M5-0002mx-U7
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 16:27:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e89::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e06593eb-1b50-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 18:27:48 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by SJ2PR12MB8652.namprd12.prod.outlook.com (2603:10b6:a03:53a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 16:27:44 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 16:27:44 +0000
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
X-Inumbo-ID: e06593eb-1b50-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDB+52/djLom5DrtcEKV/WpVFlvpAJLBkBTcf2McfnwxfVV3Xa0cl3rOF41bWy/FzkimEQcX4Pz6n+f9mP+YxlZsToYoZFaUCs+pxaGFTzcgkbqdX/GCIYdg2e4WgRGoZ4zq9qJ67lNn/6BP+UE8T2HUfG6Kd3Ka+/Tn0rN85zcBhuV2788oVJ7Agsy5HDJ7skLxDx7/COtmnMvQOB7aISwoU0+jJk+1WrX6DE2gYKH0M3JJg8s33AAzH9E6M8ZsTa0oQNXDuBdB58qGHFqCW9HxqQCdva/C3uEq8kxCuEBYVpVNgsuEFFqrry+3SMzsUqgE1loe6azAI7bjVvkfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vrpqg61jSmVONtw1lmX8Dqjztw4DVbBAsbJXAywOIw=;
 b=Yxt0PQWRhwM/txL0aJrmD9Wl+yYyqRaZu7ROHDSa9uh7gp3dV2YKTyXOEaO3ZbVDuGYH7SA9tTDBJCSFMXMhY2A8mucLBwkdXqvCbgFIM1r4ZbV8UMnavhOUz6PnJyLl4H1Jjnupv2Oxe89dUOYdD6955cXtF4M/pNUb+Aaz0YfLEPc9WVSX7IPePmmyejLlpHneBlMoR1y9k01lIHwaq+NP1Hd6tz1rCVcXp7zSqQzwy6BOFsI/J5frr3xPIs0cMBS79OFDMDUSLEXP6gtbXN9h7P6bmFd1HHBSwp0qE88Jh6PWt+bgdl9M039Pm01ypqT522oX6JdNUJLpnwzRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vrpqg61jSmVONtw1lmX8Dqjztw4DVbBAsbJXAywOIw=;
 b=BGNehqwAQCrJDrVFUh26lmOHWnXdypsXFc2JVHr64bruX6vELvYulKbes8kx6sEqFnEe6u/+W+h37JzGLlLkQdY66rE4RNWX5HJzSOC8LxNIHNVvIC0uEb/CNFWPywH1b92nhOMZGC+f523J2zZW4sPZylMlHjZ00J72sluteZk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <09bbbd4f-08fb-9159-5ff9-16389b4c46d5@amd.com>
Date: Wed, 5 Jul 2023 17:27:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 45/52] xen/mpu: insert an new entry into guest physmap
 in MPU system
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-46-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-46-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0184.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|SJ2PR12MB8652:EE_
X-MS-Office365-Filtering-Correlation-Id: bc8c5c5a-6350-4f15-a731-08db7d74c29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aOReQf4wu9OXczFMjuGoJuu1i0nHQEDbozxhdDuLHGXgnKGXfqrTwzH/wpalz3YnGqEojyAOf6wKdxA/h5bTbMFuji9eDsYkRgxrSftSpk2Odn+Ma1oE+vjW/FHQpCcEYBSPmd7H3GIrr+sVaR/+vTR7w5ByySr0zWd0a4s/cKl3kWeQQt8CnsJ/RlKg0mKfp54gTtcE3npii2cINAa6NLNDDFkoKbGEQLgTtWH+ci83EUdAx8VXMyYMbqurWgv2fTNrvR8lODfucKeXtFcczhnvUAfb3/cnxTDwU+Jgu5vAxJkywG6hMcuDn0nShsZwwFucoVOixKXpb8fJtx4Ar6zsOOqKUQ7NdObx/bllnbNkWOwem45cFsk2BKB9SS2DmwQxQ+RXQv/1Any2fGj65tIcVOiwm8yNaGEmcEFPqoK2kvr/chigwh8TWZKEaFOTllFOilmxZJrjRt+4DVmoMO8lyKsNkIadkC/aYxtPLzp/rxazgMp/TE7ckBfyUTJsBcCHTQggZ8wdFOGqOWZ2jK7k9/Cqqv97icYpBSvElr2vIN7KYqU6bCQTyPDe0Zvt3aTRZRnb00NBIYxcBgczldJerntf7/nHjaob4hXgN8Vys1QS+3fYSbJds9a7OPRii7K9ZpFxJfEmPshHuTMm6Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(26005)(31686004)(66556008)(66946007)(36756003)(66476007)(4326008)(316002)(478600001)(8676002)(8936002)(5660300002)(2906002)(54906003)(41300700001)(6486002)(6512007)(31696002)(38100700002)(6666004)(83380400001)(6506007)(186003)(53546011)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFNQZFpUaGV6aWNsL3RQc2JCN3FoZHB1em0zQzkxZGFZTFpzWUt2c3NoSllN?=
 =?utf-8?B?Q0M5d3hKMXVKZ1d6NDh0RkdldFNhbFV2dDk2aVJPdU8wM0xHaWRrVU84ak5X?=
 =?utf-8?B?K0VTN3FIN3YrRGpkMWtTTnFKWlJxYWlQVGJnekZBbjBqeE11RHFnMUZuMkhQ?=
 =?utf-8?B?MjFudEduMHJydDNidjRFN3lEdVlJV2RRSktEakNnRmdtU3kraGc0bEdJK0sx?=
 =?utf-8?B?dm8vY2MyeWpEYlNiYmVxckhhTk9xdjRwOC9QYVNNS1JRUDBUMlpja2c3Nnli?=
 =?utf-8?B?N1V3cXhwZGNDRWZ4WStKeDVQN0hZS0JyRlBNWE00ODlpdFluaWgzTVZZai9i?=
 =?utf-8?B?dHNYWS9YZGV3Z3EydDlBdkIybHhZOEhOaEplS0JyQmZ5QUZuTUdIeGhqQmpS?=
 =?utf-8?B?TC8yeHQ0OFp1Y2FYS1FTZ0NlcmRBdkkvMVAwcWtTVjBvMDY1c0ZwbUlOaGV3?=
 =?utf-8?B?QWpFbXJTbHBrUWVlaHdlaGNrOE53YWpuMHV1eVZNY1pXZUxPRy8ycGFpQTBi?=
 =?utf-8?B?ZlcrZWltc1JrcmlCaWwrbmE0KzA0a1grUDdGWmV6aFFvcitPMEVwUVhUelNY?=
 =?utf-8?B?a3oyaXM1dlFpTVZUVXU4bUhiZVdEOFVYanVHcHBuR1p4YURGVmFJVytnUzdV?=
 =?utf-8?B?ZlRCejRRTWZzZWRVek1acjl5bDZDaUhhYXRCS1EvTlZUMFYyNDB4akJkOWJ1?=
 =?utf-8?B?WUhqK0dHZkZENmcvRGVteXlSYkNuVElHK1hZTDdIWEYzU2NzUEtFMU5VMmli?=
 =?utf-8?B?OStKOWRocTZmd2dXVzFEOEprbGNMak90WWtwYTFQblloY2tYQ0xMYittbnBH?=
 =?utf-8?B?K1BZQ0pTWGthS29seXVrK1hWWG1mY2pxM1dDZy9IaWxUYmc5RVJZbVZjOHZJ?=
 =?utf-8?B?cllMQ1V0STI0VXZIaFl2Z29oWndvcWJEYXd6UndaMHhZWDJTdExreUtYQy85?=
 =?utf-8?B?Qm53OEQ2dTNkRVhCVEx3akF0WHBHSlFORkUxUlE4cE9nczR1dWlIbGRWUE0r?=
 =?utf-8?B?WU9wN3ZOQnMrMUF6T3BYVzdTaTlUaUxYQUhjMHlYeUJxM28va3p4Yng4M1dY?=
 =?utf-8?B?R2JuKzE4S2MrUmZmSUFKbzROS2JiZmhGTXc0eUpUZjR5TXZmOW41L1JNSUIr?=
 =?utf-8?B?ckF3WFROek1QZlZSSzdjMXpyaTA1R0VBaFRnMEt6aEMxdFFWMmEyR0NDWmRq?=
 =?utf-8?B?akk1cC9HRmdHUER0OEhNYUFjVkVNUno3VXZuWjlUQWhsWXdBWEhRZjRtZDU4?=
 =?utf-8?B?ZVpBenkwUXQvZnR4QlRFZVhoQ1Z3ZEgzcW5ycGpYb0RMNDV1amVUb2hlUC9i?=
 =?utf-8?B?WTI0cFJFdEg4UUVRbUh4ZEFBc1MvbVdFdW1vd3BTYU1KN21yZFBFR2UyTjlV?=
 =?utf-8?B?a0xRRnNtUkE0ZUdCS1VrdTl4NHh4UkxnS1JqTEpLS213Rkt4T1JCakN3dnBR?=
 =?utf-8?B?WWtrY0diV0lpeVFiL21HN2VXNi9lY3o5dmsxTWF5TG9UajJOdEpoWGsxc21D?=
 =?utf-8?B?eFdMcnRQZFlxL1NvSXVSeEFoc1ZDYjVCS0owTUdDM2tVd2xRQmo4NExNMlhs?=
 =?utf-8?B?WHVtcy9yL0hRTURKSHlQUklXZmxBa2hPa2JqSW8xOUorL2tFb3JaQ01XTHA0?=
 =?utf-8?B?ZHhCQm5PZEh4WVM2andDN2xSRVAzcUtSdTVSM042Rmtwa2pZcVA2QW00am5V?=
 =?utf-8?B?Q2xQTGpNYWFuREw0TkhRYWp5WWlQSUh5WERDMFBFeHM0SmtiLzlUS05QY1Vo?=
 =?utf-8?B?RjhDblI5RXVkMXFoTmFNS0xGV0tOaU1qNjVLbVF4d2wxaG13ZktQMWpqTXdF?=
 =?utf-8?B?ZlcwWXF1Z3h2dTdkR0tqbDlpV3NDWURuUnVqLzgwL1l4RmdERUZ2d0cvek05?=
 =?utf-8?B?MFUvaUxoSm82dUpKQjE5MDA2ZGczbTl5ek9XTjlOMU5RcHIzd0hWVHdZcVNk?=
 =?utf-8?B?d0p0ajB2NjRKVjR6YTYzUkhxOEp2dHBzMTdTVVppREhwM0tRVlRXbGRweHZv?=
 =?utf-8?B?OU5NNkI1RHZCT05GVGswV29KNXpWd0dGOUZPMnYrNlFJQkhTMzVnR040WWky?=
 =?utf-8?B?NkNoU2JJOWxSb1NXUTJHbFkvMVpTMmZEUFdsU1AxWHcwZmtSekRCejlUQisy?=
 =?utf-8?Q?a9lqfU1FizX59be9RXgqyFBuW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc8c5c5a-6350-4f15-a731-08db7d74c29a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 16:27:43.8710
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bec8LmMVCE4ehEPVQ6774KmRRhlbc4rv0p4HYYt+AVXJm5B09h98AHYMAo2OXGx397E3J+/TBODZeYZDXyKwLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8652


On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> Function p2m_set_entry/__p2m_set_entry is responsible for inserting an entry
> in the p2m. In MPU system, it includes the following steps:
> - checking whether mapping already exists(sgfn -> mfn)
> - constituting a new P2M MPU memory region structure(pr_t) through
> standard entry region_to_p2m_entry()
> - insert the new entry into domain P2M table(p2m->root)
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - new commit
> ---
>   xen/arch/arm/include/asm/arm64/mpu.h |   3 +-
>   xen/arch/arm/include/asm/mpu/mm.h    |   6 +
>   xen/arch/arm/include/asm/p2m.h       |   3 +
>   xen/arch/arm/mpu/mm.c                |   4 +-
>   xen/arch/arm/mpu/p2m.c               | 172 +++++++++++++++++++++++++++
>   5 files changed, 185 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index c5e69f239a..444ca716b8 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -61,7 +61,8 @@ typedef union {
>           unsigned long ap:2;       /* Acess Permission */
>           unsigned long sh:2;       /* Sharebility */
>           unsigned long base:42;    /* Base Address */
> -        unsigned long pad:16;
> +        unsigned long pad:12;
> +        unsigned long p2m_type:4; /* Ignore by hardware. Used to store p2m types.*/

This will change based on the outcome of " [PATCH v3 31/52] xen/mpu: 
make early_fdt_map support in MPU systems".

Anyhow, we can't use RES0 bits for software purposes.

- Ayan

>       } reg;
>       uint64_t bits;
>   } prbar_t;
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 4df69245c6..0abb0a6c92 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -14,6 +14,12 @@ extern void *map_mm_range(paddr_t pa, size_t len, unsigned int attributes);
>   extern void unmap_mm_range(paddr_t pa);
>   extern bool is_mm_range_mapped_transient(paddr_t pa, paddr_t len);
>   extern pr_t *alloc_mpumap(void);
> +#define MPUMAP_REGION_FAILED    0
> +#define MPUMAP_REGION_FOUND     1
> +#define MPUMAP_REGION_INCLUSIVE 2
> +#define MPUMAP_REGION_OVERLAP   3
> +extern int mpumap_contain_region(pr_t *table, uint8_t nr_regions,
> +                                 paddr_t base, paddr_t limit, uint8_t *index);
>
>   #endif /* __ARCH_ARM_MM_MPU__ */
>
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index c3598d514e..68837b6df7 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -67,6 +67,9 @@ struct p2m_domain {
>   #else
>       /* Current Virtualization System Control Register for the p2m */
>       uint64_t vsctlr;
> +
> +    /* Number of MPU memory regions in P2M MPU memory mapping table. */
> +    uint8_t nr_regions;
>   #endif
>
>       /* Highest guest frame that's ever been mapped in the p2m */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index de5da96b80..8cdb7d7219 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -378,8 +378,8 @@ out:
>    *  MPUMAP_REGION_INCLUSIVE: find an inclusive match in #table
>    *  MPUMAP_REGION_OVERLAP: overlap with the existing mapping
>    */
> -static int mpumap_contain_region(pr_t *table, uint8_t nr_regions,
> -                                 paddr_t base, paddr_t limit, uint8_t *index)
> +int mpumap_contain_region(pr_t *table, uint8_t nr_regions,
> +                          paddr_t base, paddr_t limit, uint8_t *index)
>   {
>       uint8_t i = 0, _index = INVALID_REGION_IDX;
>
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> index 8f728f8957..4838d5b625 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -166,6 +166,178 @@ int p2m_init(struct domain *d)
>       return rc;
>   }
>
> +static void p2m_set_permission(pr_t *region, p2m_type_t t)
> +{
> +    switch ( t )
> +    {
> +    case p2m_ram_rw:
> +        region->prbar.reg.xn = XN_DISABLED;
> +        region->prbar.reg.ap = AP_RW_ALL;
> +        break;
> +
> +    case p2m_ram_ro:
> +        region->prbar.reg.xn = XN_DISABLED;
> +        region->prbar.reg.ap = AP_RO_ALL;
> +        break;
> +
> +    case p2m_invalid:
> +        region->prbar.reg.xn = XN_P2M_ENABLED;
> +        region->prbar.reg.ap = AP_RO_ALL;
> +        break;
> +
> +    case p2m_max_real_type:
> +        BUG();
> +        break;
> +
> +    case p2m_mmio_direct_dev:
> +    case p2m_mmio_direct_nc:
> +    case p2m_mmio_direct_c:
> +    case p2m_iommu_map_ro:
> +    case p2m_iommu_map_rw:
> +    case p2m_map_foreign_ro:
> +    case p2m_map_foreign_rw:
> +    case p2m_grant_map_ro:
> +    case p2m_grant_map_rw:
> +        panic(XENLOG_G_ERR "p2m: UNIMPLEMENTED p2m permission in MPU system\n");
> +        break;
> +    }
> +}
> +
> +static inline pr_t region_to_p2m_entry(mfn_t smfn, unsigned long nr_mfn,
> +                                       p2m_type_t t)
> +{
> +    prbar_t prbar;
> +    prlar_t prlar;
> +    pr_t region;
> +
> +    prbar = (prbar_t) {
> +        .reg = {
> +            .p2m_type = t,  /* P2M Type */
> +        }};
> +
> +    prlar = (prlar_t) {
> +        .reg = {
> +            .ns = 0,        /* Hyp mode is in secure world */
> +            .en = 1,        /* Region enabled */
> +        }};
> +
> +    BUILD_BUG_ON(p2m_max_real_type > (1 << 4));
> +
> +    switch ( t )
> +    {
> +    case p2m_invalid:
> +    case p2m_ram_rw:
> +    case p2m_ram_ro:
> +    case p2m_max_real_type:
> +        prbar.reg.sh = LPAE_SH_INNER;
> +        prlar.reg.ai = MT_NORMAL;
> +        break;
> +
> +    default:
> +        panic(XENLOG_G_ERR "p2m: UNIMPLEMENTED p2m type in MPU system\n");
> +        break;
> +    }
> +
> +    region = (pr_t) {
> +        .prbar = prbar,
> +        .prlar = prlar,
> +    };
> +
> +    /*
> +     * xn and ap bit will be defined in the p2m_set_permission
> +     * based on t.
> +     */
> +    p2m_set_permission(&region, t);
> +
> +    /* Set base address and limit address */
> +    pr_set_base(&region, mfn_to_maddr(smfn));
> +    pr_set_limit(&region, (mfn_to_maddr(mfn_add(smfn, nr_mfn)) - 1));
> +
> +    return region;
> +}
> +
> +/*
> + * Check whether guest memory [sgfn, sgfn + nr_gfns) is mapped.
> + *
> + * If it is mapped, the index of associated MPU memory region will be filled
> + * up, and 0 is returned.
> + * If it is not mapped, -ENOENT errno will be returned.
> + */
> +static int is_gfns_mapped(struct p2m_domain *p2m, gfn_t sgfn,
> +                          unsigned long nr_gfns, uint8_t *idx)
> +{
> +    paddr_t gbase = gfn_to_gaddr(sgfn),
> +            glimit = gfn_to_gaddr(gfn_add(sgfn, nr_gfns)) - 1;
> +    int rc;
> +    pr_t *table;
> +
> +    table = (pr_t *)page_to_virt(p2m->root);
> +    if ( !table )
> +        return -EEXIST;
> +
> +    rc = mpumap_contain_region(table, p2m->nr_regions, gbase, glimit, idx);
> +    if ( (rc == MPUMAP_REGION_FOUND) || (rc == MPUMAP_REGION_INCLUSIVE) )
> +        return 0;
> +    else if ( rc == MPUMAP_REGION_FAILED )
> +        return -ENOENT;
> +
> +    /* Partially mapped */
> +    return -EINVAL;
> +}
> +
> +int __p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned int nr,
> +                    mfn_t smfn, p2m_type_t t, p2m_access_t a)
> +{
> +    pr_t *table;
> +    mfn_t emfn = mfn_add(smfn, nr);
> +    uint8_t idx = INVALID_REGION_IDX;
> +
> +    /*
> +     * Other than removing mapping (i.e MFN_INVALID),
> +     * gfn == mfn in MPU system.
> +     */
> +    if ( !mfn_eq(smfn, INVALID_MFN) )
> +        if ( gfn_x(sgfn) != mfn_x(smfn) )
> +        {
> +            printk(XENLOG_G_ERR "Unable to map MFN %#"PRI_mfn" at %#"PRI_mfn"\n",
> +                   mfn_x(smfn), gfn_x(sgfn));
> +            return -EINVAL;
> +        }
> +
> +    if ( is_gfns_mapped(p2m, sgfn, nr, &idx) != -ENOENT )
> +    {
> +        printk(XENLOG_G_ERR "p2m: unable to insert P2M MPU memory region 0x%"PRIpaddr"-0x%"PRIpaddr"\n",
> +               gfn_to_gaddr(sgfn), gfn_to_gaddr(gfn_add(sgfn, nr)));
> +        return -EINVAL;
> +    }
> +
> +    table = (pr_t *)page_to_virt(p2m->root);
> +    if ( !table )
> +        return -EEXIST;
> +    table[p2m->nr_regions] = region_to_p2m_entry(smfn, nr, t);
> +    p2m->nr_regions++;
> +
> +    p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn, _gfn(mfn_x(emfn)));
> +    p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, _gfn(mfn_x(smfn)));
> +
> +    return 0;
> +}
> +
> +int p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned long nr,
> +                  mfn_t smfn, p2m_type_t t, p2m_access_t a)
> +{
> +    /*
> +     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
> +     * be dropped in relinquish_p2m_mapping(). As the P2M will still
> +     * be accessible after, we need to prevent mapping to be added when the
> +     * domain is dying.
> +     */
> +    if ( unlikely(p2m->domain->is_dying) )
> +        return -ENOMEM;
> +
> +    return __p2m_set_entry(p2m, sgfn, nr, smfn, t, a);
> +}
> +
>   /*
>    * Local variables:
>    * mode: C
> --
> 2.25.1
>
>

