Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B91A7256AA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 10:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544438.850230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6o5A-0002Ez-8s; Wed, 07 Jun 2023 07:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544438.850230; Wed, 07 Jun 2023 07:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6o5A-0002DK-5W; Wed, 07 Jun 2023 07:59:52 +0000
Received: by outflank-mailman (input) for mailman id 544438;
 Wed, 07 Jun 2023 07:59:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6o58-0002DE-9n
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 07:59:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46583ede-0509-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 09:59:49 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9337.eurprd04.prod.outlook.com (2603:10a6:20b:4e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 07:59:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 07:59:47 +0000
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
X-Inumbo-ID: 46583ede-0509-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPnyfHi2Dxv/5nEk/ywkeoMhsL+Y7o4g3R0RWOw3oF+zVN5V2Q+9N+m3tEACU4wg4ICnRNCdTweoqdzOBhxyTqH26xGVgk4WVLo8ra3e/Ovi8NY08cBEGIwWOyWbWKBYbtpK6hygLY7/eDSRqiibc7M4W8dYVEViXKj5ZyedSOXcQlrkvGIlV66NUSSzRf8BZqSbAU5ebAJ/DWCvdOGJMa7Etk0defKJjxgrUC986BDd/dYC0Bkj3VkQfUXxli9d4Av7DYw9xW+TNKAMVhgwE8/8S6XzYhi8l3dP4TczTAUZyTjTy+5Ubjrfs47+KGAdDgIiOIlyMnlcLvYbmSxoug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zf8NJiitQcqSXr0G/SCMmKgkqguEKzJtyTQSegb1qsc=;
 b=QEfJ6tfaXnnDMVpo3BDerdBPuYAYHGnD33c5hNVjs/mcQsnZTzecPR0AvCZZojBPVruRN/oOJWqRTz9dFoKvjYQD/YDlY7C/k3FPepcKUYjU1feUY3JpwP7iFndk/BQEdb0F1yk/0MB7kyoVH6+E/SUlEkXmYahuq7yzQqK7hoYCdtio/wNVjvAfziU/j3ANrfCpxIkRK5AN+c0C7JjURHwW6Z7pxj+qdwSm2ikqwWMt0xbUli6pvnWE0VrKvhasmpZc9dqSMofEtGmmDYL6hFQQE1eIEMCvV9rEyC7rEzpXH8H2QsLoIzs9Prm4d0qGKfXlu0AB8OcGrd37ceKCCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zf8NJiitQcqSXr0G/SCMmKgkqguEKzJtyTQSegb1qsc=;
 b=iA4Nkm5mvADldWK8Keg3YAPRgVLHKRjRlNPdTOBmM2ArEMjzw2pW4lAiyVIRtC0bka18KcbDNJpYu0LOP3KNBs/Ug3eo3omrhlB7zpEjYjlE1MwmkpMLdSIpGAPQq+CRJVGtc5xNJrLDqZ0iJ5Hf23qfDLLQiemLplDTJ/000Wp4pIIneGDlu91AsDmPtYHK85U9QV5QcrUc73k3svuX0IygbbC6V8EL+5X9TDxG0Uae5SWBwSdtP9C/5hWsYhu7kjA5NdzP1KdPOq+Iry0yllt8t1cx0ZEvKoiH9xjYkkBSuBGAWvBFyjuFZUVa4p5hijTE+DRjj9WO8KpSbOPZTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <74765c0b-f463-896d-8f69-ecb1cf55cee0@suse.com>
Date: Wed, 7 Jun 2023 09:59:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4 4/7] iommu/arm: Introduce iommu_add_dt_pci_sideband_ids
 API
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-5-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230607030220.22698-5-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0112.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: cadb3803-d59d-4a4a-2464-08db672d296e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QVlLhGu8rdc03m0kd8sYPQ5aJdZkfoD0imLNJkFmSLrLOysHHDxTqF60sx8vSOIljfb60HdRY3oL8BkkhOfRTWQvav8ypTv0O+zWWoLu2pY8dsjArxLaup4psgof2Tj+avOR5jc0KyB60ZKZfbU7nehVWdOcqTz2VLzdv8msZ4rXBQ+qUnNWnYBkf/uhj0JsER8f36hmO0oQfGPMZ88ZLw9whKzg6KSIX82jptqLGwjwzzjyUNMm22msNWrLxMJ+AZzzc4/XMiHqfbWZyx/lDmbbYw7L/uhCfSSr56TbrvrjQVhpBGjIY09AmXm+fWLeyfzTklEm8X0oaiC4zQz2bQstTK14Gvff2M8y1ycr2SCpiXqgOOgloN8M3trU3niE2DtqJ9MiBkEMNXsoggtjYWvm6xQ6bqr5OG/CHBdjKeEAmSuy6g8ibv3sERXGs8gX4VgVAh+6zIkW4dhdtlgIUwRWhJ5fjvcwvd6jz101wWwWe35hszVriKP2aLni6TI0z75oELjj1Mwuthy/luNx8MskiBNV3b/jkzbf6ZZg/pk2ySpCVOYRnhhWsR5e+BkkqwXdERo6ZVtNqMuGYGX6PG93MIy+Qikmg0O4cfDCuzFPAG5na86TEGsYJiRWDB+tlAnT/AjQgKbxkHqYMdmvNw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(8676002)(8936002)(478600001)(54906003)(41300700001)(6506007)(5660300002)(316002)(6486002)(26005)(31686004)(4326008)(66476007)(6916009)(66556008)(66946007)(53546011)(6512007)(2616005)(186003)(83380400001)(2906002)(38100700002)(31696002)(36756003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YU9mSlQyRnFuUCtTVTl3YTB6MUtPd1g4RVNVL0NUZVR6MzVlcGFGWHB6UmY5?=
 =?utf-8?B?Yjh5TkN2b3FrY1cvYXNXR0wwWWp4UU8xUlhVZi9yWk8vMGo2bE43UldZOVBL?=
 =?utf-8?B?TmtxNjZwMmVuUDFUU0hnMlY1OUoyR3h3K245Wmp4NzhPQlZNVDFiQlUyOGQw?=
 =?utf-8?B?Y0xBL1NjTWpGWTV3bGlMUWIwcndyZm9uMUUxZUV3clIxTkZDTG1FdWVaNWJt?=
 =?utf-8?B?RlJZRVNiQnZVZjV3emJVbzY3RFFVYTdsazhaMHhVNXZrVUN5dXd0cnVDVHQ0?=
 =?utf-8?B?YnNnMno3QlRjMlgxSXZmNXRKc3doa3lzOStWN0pMdW9FSkR0UzRJZ3k1a1d1?=
 =?utf-8?B?b0FGZXA5Y1FpSDZiM3pkSU5LVmNHMzNlKzFOSytaSXE1dnQzUEpoVWxRVDBP?=
 =?utf-8?B?bW92K0RkOVpOVUwrZE51a0pzd2puSWt6UnBYWnhrb245bDlCU21NcVdjRDRn?=
 =?utf-8?B?bnl1SUVic1hCR0dKSnNmOFBaZHR4UFFpdnBmeXIrR0RBb1RsQk5rWkNnenVk?=
 =?utf-8?B?OVZ4bjVWOUp2ZjNKcUlVZnFuYllBQ0s4bktsTWRKRHhyZThCVTMyRlVmY29y?=
 =?utf-8?B?S2E4enpIVDQ2dkhXK01PUGlDTGV3a2FTVEVtRDBxbjlYZEZnZGpxbHowblY4?=
 =?utf-8?B?ckRDcWlzT1QvVkx1NU92Mk1LUWFFUTRPZzFWRTF4VmFGWlVHSWwvQTBoZkNk?=
 =?utf-8?B?VW81dUo5YXNaT1JFRlMyU3prMXpXdVBBbFJnUy9nV0dVeEpCdDkyZ2M2RWRl?=
 =?utf-8?B?NTNMMnVNUWRMaW53R3FyNXZ2cTNhVlhaUXZyQTJwNFJlUk01cDJKNXRsbDUz?=
 =?utf-8?B?azkyMlNFZEZLZVhocWtTRHR3SlN0TFFRSTBhTk13cVlGZzVCNkEvTUhBWExr?=
 =?utf-8?B?b09nM2lYSVYrQXYrOWJjRURXVnV2bEIreWJvOWVJMDNNUjhwNE91S3Y2ZWh2?=
 =?utf-8?B?Z0IrSXFyTmk3ekg3dXhwZElKRHQ0Tzc1SkFKeXMxMk5iZ2pIVWIrSGdhMzFt?=
 =?utf-8?B?TTZPdVNKRzFJaDV3RjhzMG90QytlamVTQkI1OHBaNGdIMlBRLzhReWRhVFhS?=
 =?utf-8?B?UlQ4NlNjWWZ6UE94TFFwOHR4aEpzNllONHBYOWZ2UzdEZGIxd3BwS2Y4VE9y?=
 =?utf-8?B?dGRvTUZhek9Fcll1TlJrcyswY09pdnRyTjZwZFJnSlVDUWE2SVBlaCtsZEFH?=
 =?utf-8?B?c2ZpMjE3MmlZaXNkYXB5NFR3cjlRRVN3by9sYVczR3drM010SDZRWkVuOWJa?=
 =?utf-8?B?UEp2WE1aTTVrUWorWkcxUEY5dkJrM0RxS0ZuRnYzWWFPbVFuMkEySVQ1eGFJ?=
 =?utf-8?B?MzdLbEg1Y2NlOVUwcnc3RVp3M3hjdDM3Y2I1Vk5DOU1IUDRPR1g0SFdJUHVy?=
 =?utf-8?B?aE13UHZZQUJtSGxJV3R6TkhJVjFrcG1wLzgzUVFZMENFU3RnRnJhTERCRzBK?=
 =?utf-8?B?SVZ3cVZFS1lkNWxVMEJpTHNFVUlNTGlBZndmSWgxMjlTNWZ3cm9LWHZvRU5G?=
 =?utf-8?B?U0Z5emsreGdYVStXRlAvbEd4SEFoSlBuR2RUb1BaeTZnUE1QZFpaS3gyZTRM?=
 =?utf-8?B?MU8vdDNkSXU1dExhczZySE52NmpDSGgvVXlCSmYwWmhPY0VCRVpNMUIxNHZS?=
 =?utf-8?B?TXlZVk9jdmNBblQrbE1WZUxLTWNva25mQm5qMFo1QXJ5YnRESTlTZVp0WENa?=
 =?utf-8?B?dC9RN1g5RkErbGQ0a1QxVElHNkpCeDNzRHhOSytEK2pTbkkzUzFmcnhZYnNR?=
 =?utf-8?B?bzF0cFZFckNNTlQ2NVBjbUlpeEdqeFpLZEpTTkFxM1dvQys5TVRKV21SZEdy?=
 =?utf-8?B?V3dIUWdud0J1TFd1Tm55T01vMndhekR3VGlnOXU3UUZ0MWxPczZvVEJ4K0xP?=
 =?utf-8?B?YWZ6clMrZTQzVG5WZmc2aVFTbnE3cEplMmZlQk5oWUM3ZGphYTgxYTFGVWxE?=
 =?utf-8?B?bTd3d2FtK3NkdjV0NC8rZUhtL2NKNGpVeE0xem05ajdaV2N1bUVmaHlsVlRh?=
 =?utf-8?B?OW5QUFJSUTFFb0dKSGlmTEhWM3lhR0FNYTMyelV6N1E0RkdzT28yV1JZREEz?=
 =?utf-8?B?NXlaNC9iMm54ZXpxUUxvanVENEdJQnVOSDN4OHVGemtKUnNpaEw0QWhnL25n?=
 =?utf-8?Q?ggVuXcLCTkorz7LkRNIkcUfa8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadb3803-d59d-4a4a-2464-08db672d296e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 07:59:47.0517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSUr1LP3KJuxNxNJYe9oMIER6UGeztxmUaz1UHQSSTNSgyKjSj/KuzpHKiD3PvQ32uW0y1Fid4s+sPDlpcmlcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9337

On 07.06.2023 05:02, Stewart Hildebrand wrote:
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -26,6 +26,9 @@
>  #include <xen/spinlock.h>
>  #include <public/domctl.h>
>  #include <public/hvm/ioreq.h>
> +#ifdef CONFIG_ACPI
> +#include <asm/acpi.h>
> +#endif

This header is supposed to be usable without #ifdef, and then ...

> @@ -228,12 +232,28 @@ int iommu_release_dt_devices(struct domain *d);
>   *      (IOMMU is not enabled/present or device is not connected to it).
>   */
>  int iommu_add_dt_device(struct dt_device_node *np);
> +int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev);
>  
>  int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
>                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
>  
> +#else /* !HAS_DEVICE_TREE */
> +static inline int iommu_add_dt_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    return 0;
> +}
>  #endif /* HAS_DEVICE_TREE */
>  
> +static inline int iommu_add_pci_sideband_ids(struct pci_dev *pdev)
> +{
> +    int ret = 0;
> +#ifdef CONFIG_ACPI
> +    if ( acpi_disabled )
> +#endif

... you don't need #ifdef here either.

> +        ret = iommu_add_dt_pci_sideband_ids(pdev);
> +    return ret;
> +}

Also (nit) please follow (partly unwritten, I admit) style guidelines:
A blank line between declaration(s) and statement(s), and another one
ahead of a function's main "return".

Jan

