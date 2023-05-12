Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA4700D8A
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 19:01:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533877.830866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxW7k-0003dm-7O; Fri, 12 May 2023 17:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533877.830866; Fri, 12 May 2023 17:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxW7k-0003aS-49; Fri, 12 May 2023 17:00:08 +0000
Received: by outflank-mailman (input) for mailman id 533877;
 Fri, 12 May 2023 17:00:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLzh=BB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pxW7Y-0002k1-Ai
 for xen-devel@lists.xenproject.org; Fri, 12 May 2023 17:00:06 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e89::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51d14ad0-f0e6-11ed-8611-37d641c3527e;
 Fri, 12 May 2023 18:59:13 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM8PR12MB5432.namprd12.prod.outlook.com (2603:10b6:8:32::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.22; Fri, 12 May
 2023 16:59:09 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::ef8d:bf8a:d296:ec2c%7]) with mapi id 15.20.6363.033; Fri, 12 May 2023
 16:59:09 +0000
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
X-Inumbo-ID: 51d14ad0-f0e6-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2ni2uqUoz+ZlJOZ7rgc8Lw81x05aEGzFT0PT3w0/aAeNYENXtUD6cGiDSN5ftgAbIGB4Khi6O/xfzV43j6jc0cME/tmoJ4wrkVRQW49ahygh775D+4LyFApu5qYOqLnVzPWnfP/fqi7LdrUYCYLW2GhpooYjIkBxitOx42UAAme5/hMYp0unbRsA0O3Cn5bP8Q/VRyxCbAYTcYIHzZTlBbNS5VbEDKJ6ullrdCaZgNo1L0bq58Id57CLq7tHTopWOd69oexK+GCG2V0heZSubDz9yosKxdwR5O16A75C7KqQ2HLvbeGN7XxaYsy4HRJIe8p1Duf0DFs8zFsEbIj1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRkMx6RQ7X55tGOeMtLQIs0nrQ3yn4Iyrsnob6SPxaE=;
 b=k0bal5zEQK89jcyzWKkUhbxwzZ0s+t5dky1eABuWDjg/+nZ4WZ6v/wPsof5DxBLWXIaltdIO1MC7Qmt3EGyoVYwKUl3XShURWMpZzerK9RWEz3nYpkC3zktun6iDpcIb8mNaJ5Aksb9/XNqhX3g3TYeTTVWt1IPiAyy9uG7XvrNEU/kgOi4IaNGcRdCSpAPCN8ncN378B8xckFSUIQtjEpbS91ps5Yuczu6XTNtMNQ3xPdjNAuFa7NHW0ED+sbIteZW45DILJI//pSv+Wpk3vw9/HOusgPsCR7pUYDgiKj1KoxMa70IKXpBDNuFDGluDZXVH6nam8Y0WByRSys2IPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRkMx6RQ7X55tGOeMtLQIs0nrQ3yn4Iyrsnob6SPxaE=;
 b=YSHxSiOyG+cN1QOEf3gSCYmxqUKby432C7Pj5wMGhrMk6UjQPrXmjAWtoJgSAH1Vzo37hJ2wQOQlJYF02r0XB+7w7AvmZyFEVVdC+2sFWT1jaB2BU9y6YKjUpuv6ShJSaYWA1m/L2jXsIepQATQiRrA+gNixhsqkO2TCTpwro80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <1dadc8b9-00be-55f9-e8b7-f867eacf20b1@amd.com>
Date: Fri, 12 May 2023 17:59:02 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH 2/2] xen/arm: smmuv3: Advertise coherent table walk if
 supported
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
 <20230512143535.29679-3-michal.orzel@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230512143535.29679-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0411.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::20) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM8PR12MB5432:EE_
X-MS-Office365-Filtering-Correlation-Id: 930343de-02a9-4620-67db-08db530a33ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Owe6Ek5H5Zou9mnRaOMdgAD5HYOBCLAMQRUa8jCnww5g5DggVt/bUMsFBhdpmDC84k/RxS372yeiA0Yi5e8Mxli7PggkSiu0OA/ujZqNCrkBieiDzezeZq3aR6MPuDfi2uRzQ4u7lOeDxwRzogRdc/kgEeAHXglct3SlnOzsTflu0NbtPUttP53oL5V9TwSZn5Pke0HXriYo4u4jbLo284YDmWekJXnMzNRpcjocDFpsMgsL1SqBR4bUbW4A1NgoVfN5Kk4ig7Ri0eVWoirWSN+ZFvQREkp+/FEIEgVyfpXjqk908+MfOl280GnizkNAI4zPfn6iU650GfAbA5gRq3krQFc32aon8j9IZUquK+z6ykiEzmUTwudS9Kq1bGM4DKNXrg0HB8koK2yQVXr3f7EkmHVtRBEqzrhKeAzxP9nNmIVuRbGLgy3PnAJuf4vq6w75SLm59bMZDfx1KfozBui2dTIHh8RFN5KvJndEmhpZfdYRyHjuhbOqQy1zWNvpCFoTe9LNwZTGJwjd8hRsxBvhWxKGRPF+0EWqFi0zjz16lgFxDDv2ykg8tgKLbpBIVDjwr+ze2BTJ57jpf9PIG9SuWuDcr38gTkRACBHzouLgcNr49HpN1o5+ZtbwmN1g6Rfk1gla0CSGx/LPuWVsgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199021)(38100700002)(36756003)(31696002)(31686004)(8676002)(8936002)(6486002)(478600001)(5660300002)(6512007)(6506007)(26005)(186003)(2616005)(53546011)(83380400001)(2906002)(316002)(66946007)(6666004)(66556008)(66476007)(41300700001)(54906003)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bzZyOXNBc0R4Z0NmYnd5ZVFLTlhmeFh6dEx2QTJHMC8xdlh2aUkyUjduZk5h?=
 =?utf-8?B?ZUxvcmovZHFRdHBjSmQ1SjZiL2xFVVpLWjJEbmhqUVhsYXJoUnM4dDQvVFY5?=
 =?utf-8?B?bEdWMTVySkUvaXBoN0diUjh6R1ZIK0VGUnVFNlFhb2hVbHEwWEkzMVNJQWtq?=
 =?utf-8?B?Q3Q5ME42cFB2WnlVdXZOcUlSNlJPdTRUZkl4K2FZcVN1YXVoZGNMWU5hWElo?=
 =?utf-8?B?Wm9qWGN3YllueHpmQlZnbU1HV2E5MWU1SnlvNTlTazF3clR5cXFpMjVWd2xK?=
 =?utf-8?B?MWtGeEx5d2g1QlFQOURoU0dhMzhRNEtiUCt4UHoyOUJvOXJ6endhTzlCekdv?=
 =?utf-8?B?RkdVdjhxVFZ2QThoVndqSUVyQnc2Y2lwckkyaldKUWE3UWFKUWtrZkxpMlBI?=
 =?utf-8?B?WERjckxVS2djYzYxVmxtZkRXMG9jOU9DTVhiTFZhQTFuckhlRjhFYks0Lzdl?=
 =?utf-8?B?d2gxL3oxemJwT3VlZDBiQU9yYzNCSUlRQTZ6MUxMRndPMTZsVlhhMmoyTlRM?=
 =?utf-8?B?V21NbWI3c1hHSDNlVW9iVGY3Zi9oVzVwd1ZvNlI1dXhxRVcrQWJWL3l3TTJZ?=
 =?utf-8?B?ZklQdnhxV21CUC9SQktkdjhqTFMrTkEzMVlQWldVNlJKVjAycHhGQ0xmd0ph?=
 =?utf-8?B?RTNad0JUYXJoaTJGVTlFenNPbkNLUXFGZHd5VmkrRGpLOVpkRWJHTU4wVDg0?=
 =?utf-8?B?QWp6bjFrWXdmOWtEYXFyTGxXakt4R2UrbWpMMXM0N1NZTEpVSlhtaXJDQVRy?=
 =?utf-8?B?ZTZhd3lrUURmcy9ReGtZL1ZIU0lMbW5qMDJ2eGhRMFZ4N3doRGNOaHFpK05y?=
 =?utf-8?B?RjRDbE5IMjFnbUp5Vmx2cXV2NVZNNVd4cWJFaklpYko5eDVhQ1A4V1dZZUJY?=
 =?utf-8?B?ek1YUlNTZzZwSnU3S0VXZVhna0lWQ1hRTGlVcmQzWU1KK2p2OTM1czNXWDdU?=
 =?utf-8?B?L1Q4YmxzZFVFZUFGN1BLc1FmTHhvQXhraXVrakdDcUJwZmdlTnFNNFpBWDVK?=
 =?utf-8?B?QWZSRnlVK3ByQ0dhVHdkaXlvSmNOZGk4VXkrazQxcXVCNmNycmIxTC9UR2xC?=
 =?utf-8?B?Y3BvdzJaZFVCQ2t6ZFhpUzRObTZQVyt5R2JTTU9vSTBXWDVQMEs5TUtIdUZ2?=
 =?utf-8?B?WWdJemN6ZTl0bWhGaXpMN1hnemdLcldkNlhvMGFhQlVwdzZ2WUVSaU9CSzFB?=
 =?utf-8?B?TG01MEFBUUVzUTRTTXgxY0NuNTBjWFpPMG5RSTZDZEhHSVFtelhIdFJGTXRr?=
 =?utf-8?B?ZjJJc3BMWkVudGZXWEQ5djRYWWNQUTVVdG5LSVc3a0JVQjJRM2FKMDBhLzIr?=
 =?utf-8?B?U2l6aE1Zek5xVzgxV2xzS1NRN280c0FkK0V1elYvcG9tOXJMWEF6N0ozV3ox?=
 =?utf-8?B?dURTMjZBZ2RPRG5USll4V0w0cUVoVzFSSjdSdWZTK0NsSUdaRnFBZ252Rjkz?=
 =?utf-8?B?RFhQdDN0UDNMNHhvYXBDelNrTC9lS3RyRjdRVUdUUW94NjNZTkErdjVZRWpD?=
 =?utf-8?B?b3o0OXhpSlozSms0SEwwMmVaZE9LUitDWGFvdkR5QnRyaGZXRC9Rak14YWlY?=
 =?utf-8?B?c2ljcXNLRURqVHlWYXFHVmhQMzRrQWRHZ3F1WCtkRVlxQ215K3pjZFhHb1FH?=
 =?utf-8?B?N2tpNStTZ2JHOUVqUmhqVHpJY1graWRrVi9kQWtsVEoyeUJLZXEzQTZBSDhP?=
 =?utf-8?B?ZzBsREQ5b01ReVlJODdBYzlFdE9ZcXM2YjlzR015OFRaMmlwY0J4QUhmazVK?=
 =?utf-8?B?MVhDRDFmS3VBSlhxd1U5dkNIa0oxUEc5WndHMUhtVFVqYVV3dFgvRlgxd1JE?=
 =?utf-8?B?d1FyeUNHam4xUFhrTlpvMnFZNXF5Q0FodkhCU1BtK3RaTVAxamRQSzQ4a2pP?=
 =?utf-8?B?dC9RZEZ4MW0wSUhYOFlPakUySWU1TFpMZ1RwaHNIQlNQeFdYMjNjUkszdWRN?=
 =?utf-8?B?Q01Ld0U2eEl6RjRibGZ6cllrdy85RHZJSlFsVTNGNUpmNENxQko4RWVHR0Ex?=
 =?utf-8?B?NGZTenkydHNLNVVQeEIvYWpVVk9EVFVzRHJRQitYQ0xMSGZ0VFJ1eXo5dyth?=
 =?utf-8?B?OWluQ3NiV2Fiekg5V2Jra2lMUUhzZGpoSHZlSXBqWlJOY1VTWUlkSzNGSHBO?=
 =?utf-8?Q?WjY4JlGwje7laaJw/vhkQTODd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 930343de-02a9-4620-67db-08db530a33ed
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2023 16:59:09.1811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJvIVsdg9UiPpN0Yn6Q8VClry3/y8ubZk580L+UVStau/d2EEwYuSTWQAw5OJ3HT/Q9yb0yAR1sD65t2oobIXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5432

Hi Michal,

On 12/05/2023 15:35, Michal Orzel wrote:
> At the moment, even in case of a SMMU being I/O coherent, we clean the
> updated PT as a result of not advertising the coherency feature. SMMUv3
> coherency feature means that page table walks, accesses to memory
> structures and queues are I/O coherent (refer ARM IHI 0070 E.A, 3.15).
>
> Follow the same steps that were done for SMMU v1,v2 driver by the commit:
> 080dcb781e1bc3bb22f55a9dfdecb830ccbabe88
>
> The same restrictions apply, meaning that in order to advertise coherent
> table walk platform feature, all the SMMU devices need to report coherency
> feature. This is because the page tables (we are sharing them with CPU)
> are populated before any device assignment and in case of a device being
> behind non-coherent SMMU, we would have to scan the tables and clean
> the cache.
>
> It is to be noted that the SBSA/BSA (refer ARM DEN0094C 1.0C, section D)
> requires that all SMMUv3 devices support I/O coherency.
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> There are very few platforms out there with SMMUv3 but I have never seen
> a SMMUv3 that is not I/O coherent.
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index bf053cdb6d5c..2adaad0fa038 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2526,6 +2526,15 @@ static const struct dt_device_match arm_smmu_of_match[] = {
>   };
>   
>   /* Start of Xen specific code. */
> +
> +/*
> + * Platform features. It indicates the list of features supported by all
> + * SMMUs. Actually we only care about coherent table walk, which in case of
> + * SMMUv3 is implied by the overall coherency feature (refer ARM IHI 0070 E.A,
> + * section 3.15 and SMMU_IDR0.COHACC bit description).
> + */
> +static uint32_t platform_features = ARM_SMMU_FEAT_COHERENCY;
> +
>   static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
>   {
>   	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> @@ -2708,8 +2717,12 @@ static int arm_smmu_iommu_xen_domain_init(struct domain *d)
>   	INIT_LIST_HEAD(&xen_domain->contexts);
>   
>   	dom_iommu(d)->arch.priv = xen_domain;
> -	return 0;
>   
> +	/* Coherent walk can be enabled only when all SMMUs support it. */
> +	if (platform_features & ARM_SMMU_FEAT_COHERENCY)
> +		iommu_set_feature(d, IOMMU_FEAT_COHERENT_WALK);
> +
> +	return 0;
>   }
>   
All good till here.
>   static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
> @@ -2738,6 +2751,7 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>   				const void *data)
>   {
>   	int rc;
> +	const struct arm_smmu_device *smmu;
>   
>   	/*
>   	 * Even if the device can't be initialized, we don't want to
> @@ -2751,6 +2765,14 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>   
>   	iommu_set_ops(&arm_smmu_iommu_ops);
>   
> +	/* Find the just added SMMU and retrieve its features. */
> +	smmu = arm_smmu_get_by_dev(dt_to_dev(dev));
> +
> +	/* It would be a bug not to find the SMMU we just added. */
> +	BUG_ON(!smmu);
> +
> +	platform_features &= smmu->features;
> +

Can you explain this change in the commit message ?

- Ayan

>   	return 0;
>   }
>   

