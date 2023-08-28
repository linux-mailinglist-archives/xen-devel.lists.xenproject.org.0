Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9522178B562
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 18:29:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591718.924184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaf77-0004PL-RP; Mon, 28 Aug 2023 16:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591718.924184; Mon, 28 Aug 2023 16:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaf77-0004My-OR; Mon, 28 Aug 2023 16:29:17 +0000
Received: by outflank-mailman (input) for mailman id 591718;
 Mon, 28 Aug 2023 16:29:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXm6=EN=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qaf76-0004Mm-Ot
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 16:29:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e88::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06f04b8e-45c0-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 18:29:15 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by DM4PR12MB5843.namprd12.prod.outlook.com (2603:10b6:8:66::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 16:29:12 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 16:29:12 +0000
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
X-Inumbo-ID: 06f04b8e-45c0-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxvBQprhS/i+qtzcLjG+9kazbxSNxMD4Ohi+PoJUHiN2mkem1kXvKvxQ/Qh6OxpwPOa51kbP6HR9v0y5oxs7PStGplK+JwB8EbUEoRXYNn8ACoxnrWv+axqklGKMiFbIgzUM7hoICnb1eYpsOTzH70GLebr+jcRHIYrwiYOXDWLUkcRqQ6DUQEA1Sv7GBDb43iHOYcnZl/JXLEhvG4EXDp9tCvzWKZiLx95jsptWQ8q4qQC2H1CKCwvUetlarc6DruzOrtt3oFwemUvfZ6AP3NTo1LsOAD7LDMOgu0N5oYTh0T7AiDYuWCDy8LzgVA8bOb9VfUEIdJhqtoHDD9XitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sH8fOpIa/VdTb5+hMeaiMFFThm9UBQvalLHuR+YsZSM=;
 b=SiN+npcCIywwOc4wOBeQQdsPKdaSG9XwMTcAnLyQ9d/RkwhsDG9G0ling1gytCYiDHqCscOtMh4tBkWqH/xEQacC9IQtFXWk1j6NAMdLANaOB1SNCUSbYxcs1FTEMqHkIBAL0clY5QWDlK0HC+FVKXyArTWdt+H75G6jm8V0DoKk+jgn354m2uVDkN0Ol9NkkzB97SF6SYQhEqqqxPfRB1HhImf4w1DrgJCutcHTo0EEMXPLoUgkgh7JfOEGmyt5c9yjUXrWP1RUnGBA8sWzcHNkYu2WBcdMZntVF7PEWRmnxaRi/8T4Hf5loBagB2HPXe+ZY0mvK4Btpmst+ZoSMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sH8fOpIa/VdTb5+hMeaiMFFThm9UBQvalLHuR+YsZSM=;
 b=Y6yQck0+oIl4FD1/Eq7xBw9rVeNGTVyeJMMSBR0uIYJXRIAocaxh5T4vlSgFMWQMUhF9OJr/MGnIY2xZl+xELtxExwzNxz10qUcXP7YS9v3R812wJBRPGfKqAW/drqQqbZEbeofN1USMyxl5fVDj0OEdsps8bxGAGanEVF3NM0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 28 Aug 2023 09:29:09 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, julien@xen.org
Subject: Re: [XEN][PATCH v10 10/20] xen/iommu: protect iommu_add_dt_device()
 with dtdevs_lock
Message-ID: <ZOzLVUgaNybkmgap@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-11-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230825080222.14247-11-vikram.garhwal@amd.com>
X-ClientProxiedBy: SJ0PR05CA0085.namprd05.prod.outlook.com
 (2603:10b6:a03:332::30) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|DM4PR12MB5843:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b4b5b5-dbae-4fee-3e9e-08dba7e3e999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gxP5/9P35Wzr5YygsZwFK7cmk8J/HEupb3B3bXiZfRjF1i76OUNyw+Dpznq4I+ao1CXV0AhABM7ljxqzW0k9ivtOTAXmgSmv9tWcgLgihSgpL9ZNWCXJGjEYc519LBdw9TXdtgjeaKKSjRfiqWCJBdv/SD0IOJ8HwDBGY7mf4TEcqaRyFvSwTcwie0BpuMEHGQlTiCWz4WXdzxfH5pxV/wn3GWRP1cqE4kAZptT2E/j1kayNlCIkQNcyKGIEzkfB1kLt9BO+ahbIKtnjkRELi0MwM0F7xP9MGaocgmhdrFfRbXRaKDZBwXvZ/VVusPAZJ0eAdV3OW9esd92f0SDJ9ihPTaKLacvp5kFA85WQYHzQSmsp8v816yEDXjoe/frPyxED02Qse9yzZ/HvFKWtqcJzJvasl6aZbDT2T1np+g/Mz5lXJ8+oYKLM0VOyj6Hq/M97igMDrH6ChmqpIAQS7ST6/4m8k4jJdG66FAj5/WzXmhTK0Yppmjyu2B0KFgkdOm9AcvMYWDWG5uJy/5KWom0aEBw5IIts7M/J3GemY1JCUcf5jelzI3P0LscHFUI2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(346002)(376002)(396003)(186009)(1800799009)(451199024)(6512007)(6666004)(6506007)(2616005)(6486002)(86362001)(44832011)(2906002)(6916009)(4326008)(8676002)(8936002)(66946007)(66556008)(36756003)(66476007)(41300700001)(5660300002)(316002)(38100700002)(478600001)(83380400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEFlbU52N3ltTm9JYTZ6Y2wzN3h3WU0zdWRDYmM1eVMzcHl3c1FiK24yRUlz?=
 =?utf-8?B?aEo1Ti9YL2hOR0JhbjgwczEvYlFrczcvOE1aaEl3N0VuWmY3cG9PRlpiNXY4?=
 =?utf-8?B?ZDBpRzFJcEhrUjE3SzREOEhFWjdvbTROUXBzSjQvRzFaVzZvenYwUFBqSjFn?=
 =?utf-8?B?WVFkek91UzRjaHVNb1l1czNrUUY4ZENueUdwSGYrUktEOGVQbFdxdTJMOEpD?=
 =?utf-8?B?VlROTkF2QVRvOHVzLzFOeEdHMkNBZVQ5QjBSL2NYY01KQU90WW9DbmQvb1lq?=
 =?utf-8?B?WEl5Qm8zeVpGUlBNdDBoM1JmYlY5TU44QWNrMUJ3UkxqZXc4L0JPL3FmeU85?=
 =?utf-8?B?cUtkeXpQU2RZUjRIWTIxdjJ4MVVpeElpbmFrMEtNdVRxSVZrTVlKOG5zUExH?=
 =?utf-8?B?UFpjU1R0UTBnNTk3VXpBWG1mczNFUDVSaDNMZndmcWpyZTJheXExWks3Nk5y?=
 =?utf-8?B?bDVYZmpYRU50UHY4QUJXc3AzbURNNDNXaW1USlA0cU5MQkJ3YndzRk1Cb0lq?=
 =?utf-8?B?T0JwOGNrYW1iNmJwUmUwZFFWVERLbWVZbmM5dm9rNGhpZDkvYTcvWnEwYlM0?=
 =?utf-8?B?Qi9haTFOQlMzVHBYeE5lL0t6THlwS1VNa016cnluM01UaTFRdFA2YXpzNHJH?=
 =?utf-8?B?ZnVXdGJ5VTBkQjlXUHRRcmhBamVTN0sxcnRyUVNNcDgwM0xEaEF5VTZOT3Nw?=
 =?utf-8?B?SE5jV3pxYXBSbVFkeWluSlVKUms4R0N0dXRNR1ZseWorUjJyQWY4TXNORWF6?=
 =?utf-8?B?Ym1lVWI3N1ZWUUZmb3Fxb0ZCdEg0R1gxWW5OQTJtUGc2R1BZY1VoOHNWVW4z?=
 =?utf-8?B?NUt3VXM1QisrTjRNVFh4NFBQeGdsckNDRFlSRFN6QzNtakZXSEVFVXZNQ0RE?=
 =?utf-8?B?aTBZZ0NoQlQ5a2xxWEw0NFh2MlAwZ09PbVRsUWRYNm03dDZyUDRIclY0YU1T?=
 =?utf-8?B?Y2J1Q25wSnNGcU84RUFXOXhGM3FJdlA0dXZyelhTV3QvTFhPWmtIZFRSMTI0?=
 =?utf-8?B?dHVVSExtbWJTelo3MHVCdzhJcjRXZFZzNGJsUm41RDF3NGdvV2dwY2VGMFI2?=
 =?utf-8?B?dEwvSnNCSStVM09RYzM5YmM1YjY2a0JwSnlYWTliOG51QkZIMEdPTW1hTkto?=
 =?utf-8?B?UjlsL05qc0FBL2RaeDJCdnRzdmVjT3luTHcrRncrcW1wdVYzeC9ITXRGMW9r?=
 =?utf-8?B?NXZHOURuQklnVDkxRnBycDBJMjVMVlZ0UmwxUVM0VUpDaHRGWlVGSU9sNEJa?=
 =?utf-8?B?OHYvdUpOcnlMbk8yUHpRL3BnV0hVcTFtK3ZBVzFsdDJab1EzcmJkV2ZWRjg3?=
 =?utf-8?B?c0s1YkdiMFlIR1d1eVdnNStxTkx5SVpSOXZ2VHVGaWw5eXdvRHFSUS9uUVZ2?=
 =?utf-8?B?Y1BFdy9vWHhTSjZuTUFEbUxwUzhRYlI0bkdtcTMxT20xSUxweHgwaElyblF3?=
 =?utf-8?B?M3hFcXlzcGRvZ3M5L2dxV1RGRUY4NzlkNVRPSmJCY3oydUtSKzlSbEpQTGR0?=
 =?utf-8?B?S0k3QTV2QTJqUzZGakRIWmpHaTFEU2RxUG84ZDFFQmVyLzBCQVB0Q0xFaFJK?=
 =?utf-8?B?Ym5ZeDl0QTFUbVNrajJ3eFlpOEkzc2t6V2J3bTdJKzEzeEt0OVRWRFJhRG15?=
 =?utf-8?B?UlVCZDhWZ1Z4cnBtTVBEb0wyVzM2c0kwWFo4ZTFmOG5KWm1JKzVIbFROeXR0?=
 =?utf-8?B?dUs1OUdGQnBuTklwZGRod2ZsTHBLcU1pNlh4MEwyTXE3bG9PUlphcHNtakJ2?=
 =?utf-8?B?R0VtaHFqbDczK3Jrbk9ORkpyeEl4RVVITXBCZ3NWYnRNNXFWOWNKVm55cWNx?=
 =?utf-8?B?UEZDOTVCZFpSZkg5MDBuaUpNaDM4Ti9EaHArQnFPK21Vbm9aU1lCUFhiMlc2?=
 =?utf-8?B?dDM1c2FQTTZ4N3JPOWJRMkdjWFVmRU5zVVNDOUxjVVNNc0RYM3YwNWw2SGpq?=
 =?utf-8?B?Ty92TTZpbzg2ZUYwTXJIblNKVi90VlgzUWplTWlUNFVuZE9vZy9lQzQ0bjNJ?=
 =?utf-8?B?ZUx4Q1BKQUtSU29aMEFHZW9QZDdyQnNxekNaZmhlNTR5ejJyaVdWYVVxd0Q4?=
 =?utf-8?B?WElIWWFSSDVmbTlSNExZU0U5V1QwaUVJNllTb1JjVkRQUFpaT0l4WEZwSU1V?=
 =?utf-8?Q?YCa8Ju7l9fHjz78+orS0agi9V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b4b5b5-dbae-4fee-3e9e-08dba7e3e999
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 16:29:12.3283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRf+EEoyhGrhlAMIJYFc/1rn2O6RxAMoPufu21Mr3OjvCFBvOqONMPXjz/+RHbRVhho4WG8hCISPLB3oOK3l9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5843

On Fri, Aug 25, 2023 at 01:02:12AM -0700, Vikram Garhwal wrote:
> Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access
> to add/remove/assign/deassign.
> With addition of dynamic programming feature(follow-up patches in this series),
> this function can be concurrently accessed by while making a device
> assign/deassign for passthrough and by dynamic node add/remove using device tree
> overlays.
There was a comment from Julien on v9 on commit message. In v11, I Will remove
references to PCI because this is misleading.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> ---
>     Changes from v7:
>         Update commit message and fix indent.
> ---
> ---
>  xen/drivers/passthrough/device_tree.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 5d84c07b50..1202eac625 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -148,6 +148,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
>      if ( dev_iommu_fwspec_get(dev) )
>          return 0;
>  
> +    spin_lock(&dtdevs_lock);
> +
>      /*
>       * According to the Documentation/devicetree/bindings/iommu/iommu.txt
>       * from Linux.
> @@ -160,7 +162,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
>           * these callback implemented.
>           */
>          if ( !ops->add_device || !ops->dt_xlate )
> -            return -EINVAL;
> +        {
> +            rc = -EINVAL;
> +            goto fail;
> +        }
>  
>          if ( !dt_device_is_available(iommu_spec.np) )
>              break;
> @@ -191,6 +196,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
>      if ( rc < 0 )
>          iommu_fwspec_free(dev);
>  
> + fail:
> +    spin_unlock(&dtdevs_lock);
>      return rc;
>  }
>  
> -- 
> 2.17.1
> 
> 

