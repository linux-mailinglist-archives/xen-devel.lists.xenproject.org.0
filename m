Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E1478B559
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 18:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591705.924164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaf4C-0003Be-1v; Mon, 28 Aug 2023 16:26:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591705.924164; Mon, 28 Aug 2023 16:26:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaf4B-00039K-VH; Mon, 28 Aug 2023 16:26:15 +0000
Received: by outflank-mailman (input) for mailman id 591705;
 Mon, 28 Aug 2023 16:26:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXm6=EN=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qaf4A-00039E-I8
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 16:26:14 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9979ec00-45bf-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 18:26:12 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 16:26:08 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 16:26:08 +0000
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
X-Inumbo-ID: 9979ec00-45bf-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ThboRlM2bXloFDDSBoX0ruarrsfrdsHr/wQOpCN4QeGdlkSBW39fjHUBU2ZvAdj7I9b8I5CMqm/kpje2j+WWmp33wJ/P0LPJefCBSEUpLRKUt4hT2+Zu7r5Yhr0XRyxDGzTcuI5/tLpDXRZcS73nGHyCNwLdvGrAIPBZzkILyDhMq6rBT1EorsHxKupQd+tmq4m+Dl584i4R77d6kgU8PMUJjUVdxBpOG3pSrxbVvGsSzPqBUPzFox3xHw8+2FJLz4c+ckbSSi/NfSQVIojXD5eQ8yXyhjD0qdGVKHiZTrLdP7FGDc4i+jSNDOoyW0BP+OtlsuY/BgTQ15NcZZy2mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXmdMzSEja3wi+N5voDPl/XQCMRdAnxTFEmHTgMtlyA=;
 b=Oke17ENXr+s+JPsNdLI6rVavDpaKGNx4wcxVMn+Z4im+TMFXiiqIO0iHmWKChHnh514Hi09+QctpsLS7HZ/SQ2hS+eWL5OIMzePJXhODeNHgQYjOfoF8NlMwyTBV612/Td+Mp9KcMxtw7M3g6/MCz6f2M9sNOt1U2DV6fi45TYt8i9Jg7AD9S1XFZfvnS63rdTJMhvD3xvN8LAOnBR9kRzug58hVikhWky8GCMJ5Wp69myfSBldRQemk/zJEoRHcqi4XjS+WDH87WO1ZwXbfYuJH3rNeBFjQcDtCmxAWMVuh9WfzMArLmVPXACEelj9L8DVMLGrlLgbXkMf5MMeXXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KXmdMzSEja3wi+N5voDPl/XQCMRdAnxTFEmHTgMtlyA=;
 b=UZQzGNan1cOVzICP5zVhdXoYu7PUXCDI4GdNu6BOYxpawESdjFGI/7VJSiEEw/5/pflSE0vdrtl8OsL51Z1W9g3OiYIigWVwhXe5M5g+Bog3MXXlz2YZWUfwQOglMB7JgNb6W2W8i7j/yCgtDhTe+HPog+cyMiR1Lebqrn0RRTg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 28 Aug 2023 09:26:04 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, julien@xen.org
Subject: Re: [XEN][PATCH v10 14/20] common/device_tree: Add rwlock for dt_host
Message-ID: <ZOzKnGiPPv9r8yzj@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-15-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230825080222.14247-15-vikram.garhwal@amd.com>
X-ClientProxiedBy: BY5PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::34) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|PH7PR12MB5757:EE_
X-MS-Office365-Filtering-Correlation-Id: da5568e6-d9ce-4232-25f5-08dba7e37bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TEZC3+rbChQYix2D0cpVVpvbfZpU1uNC8Kj3smzLY7/y9UO6jPETiH/Nj21Fzigq1McAPhfTBUsWQEBfyJU3hGOhQdh89LemSPH51XlTUE59u3f1qngtRAkXfEt4VBazI2hZj8YPHvSazg1ZvguekP//fkm2ERTcd2wiu8RM85KOyndkh/zxxkrxF1stm1n1VEX6hIszNDWB/WZiy2EX8m4AwYGB6OSnLFiBEh5+Uxl1hogtpyN+oc4oy8b8+VqJwMq+gWPWUcVISYt3vgYCekApVObrrV0LwRq9u6sozed0k4YNiB8CRMOPM6Foj2UAO7hWO5wKSvXAp98WhVvCfBBO7mv3WYJ5VQKiExGz6ROI7xZcub4ckRHOuLS8yCtHIgrrBONFHlYWGPLpCUQgw48CF7/uuVKVXr5PCkXQChcBLpaXKGZcLNGmSlxWvhuMF3HYBqnrtnWB7VQcW15nTT1i9MTVUtvJwiXf0F+/jrp80/NrnPY80VDWaSU2FuoMqMsoNV5LNkgoA6RAX1kTs24mPa8LkVdESeVHXiW/Sgp91y5KqVi3h1TaehIKHOcK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199024)(1800799009)(186009)(478600001)(83380400001)(26005)(2616005)(6486002)(6506007)(6512007)(6666004)(86362001)(44832011)(2906002)(316002)(38100700002)(5660300002)(4326008)(6916009)(8676002)(41300700001)(66476007)(8936002)(66946007)(36756003)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXFRNU1iazB0WEJubVNZTTg0Y0RqeWJlWlljcnlPcGNEdHFSb05MWW5xUjBC?=
 =?utf-8?B?bDd6NGs1ekM2SFhNR0tEV3FaVUttSUtnZEwrVVQzOHEvOVFuZnBpYk5Rejh5?=
 =?utf-8?B?S2pyek9ESk9BNFlEYXQydXlXL2hOZDkzbllEZXdwMGdjVlFObVR0M0VES1lZ?=
 =?utf-8?B?VDZpejI1ZFJKb0Q2bEpvcXBPSnhTcmVtc0JkeTM3SVd5MkRoTWN6bnVlZDJh?=
 =?utf-8?B?cCt5WXVSRXdJeDYxbE02dXBsSWlPZDBBNnphWWh0RFh5YVE3YUhxVVVvSnNo?=
 =?utf-8?B?bVJWUThxaHkxaFVwTUY4KzJ4YnF2VTFuUzJHekxtZkZsVDM1dkpxWlQvTXR3?=
 =?utf-8?B?YW95cnRTQ0o1ZXZmbGtqeVBCZjk5QlpSWDdUeS9sbXU1QzhWZW1zWFVyWUpQ?=
 =?utf-8?B?NUR4ZUxpNjZaUDEzWnloMGllakNXNHRTYUdrY2Vreko1MERMZkMyWmwyR3N0?=
 =?utf-8?B?MDArb0xIR0JGS081WEVkZWwrWjB2YUYwYnVLOTBnanRJQU1qbkorOVlVVStm?=
 =?utf-8?B?cTUyc3BYUFFRZUUxeVh6aENZK01lVExtV2NrWkRnSURCcmlRUy9tNDR4Wm82?=
 =?utf-8?B?dFplcytlaXIzdU12cWNsVys3SFdXUklTaXM5NnNaWHpEdkY0c3ZCYVVyRC9V?=
 =?utf-8?B?Znkwa3VhL0ZFcldhaG5ROE82VDBNYzBVQWx1WStQSVBjYVRlUzBVdlhVNjlz?=
 =?utf-8?B?VFRkbFZYWm5JU0pNeU51c0xMejdRMjFzYjZzcW5CVFBPdDUvMjl2MVlwNEky?=
 =?utf-8?B?R09vMllhNjU4VzVoRVgvVDZ2aHYxS1JqN1dVUVhpYm93ZzZIWGR3UGM1V3Bp?=
 =?utf-8?B?N2ErTEVnME1SRS9EVytPQ3Njc2tWOHlLVk50L1ovTTlwLzlxWE9DV0FENGZM?=
 =?utf-8?B?d0QwTjk5c0FtcUxmd3JSazZ5THRPcFloNXRZTEQzT0J0NmJncWNOWUpTOHpH?=
 =?utf-8?B?bXFsem9KVGVvTlFScjBkM2lndVpSWlBsV1pCdzlRVTQ1ZTVTcXFVeWVsZ2dY?=
 =?utf-8?B?UUQzSGRiSTNubjdQOXY3QjJ3alFGMUg4eWhOenBEMUhGSGgwMGVKV2pXRzd3?=
 =?utf-8?B?S2txZk16MlBPOE0ycGM4Rzh5cXJZZDJmWDI3Mkt3d0QzSC9BV1N4YVI1bU4w?=
 =?utf-8?B?RWliZlkzMTg0ekdOekhVUnhPRzBGOVBmcDNlSWZndGZ5TTE4cDdqUUlIbUxS?=
 =?utf-8?B?Mm5VdzNIZ3MySDNST0ZSd3VaVjh0c050anB1ZUt5a1ptalRlVldCMDg3U1J5?=
 =?utf-8?B?UXR1dk43VjViMFcwRkw1MUJqbFhpTTY5U056MTAzZmVMd252TldWTXJQVlpH?=
 =?utf-8?B?RElYZTcwQ2d5cC9lY3htcmFHTUZNejRrTnpTa2p4NDR3TnducGZTdlFvY0Np?=
 =?utf-8?B?a1BQdjBlTEVXeUIyZmk0b2NWYVJqQnQwclR0RFhqRCt2anR0R2k4SmpnWk00?=
 =?utf-8?B?RUJlMkk5WnNMZzhRMlN1R1V1djlYRGJEcGVpaWRkVWUvajd1VHp0OW1ucEdF?=
 =?utf-8?B?QmgzL3NvRWZyR05uazJDRnpncE9aazI5SUNNMUxITWJRckJvRjdwN1RRT3ZY?=
 =?utf-8?B?WHM1YnI3Q2lvTExhc3pQYVpTR2VqV2k1V2I1ZlhLSEFNSldBVzhtREdUZ05B?=
 =?utf-8?B?VDUrMkpBWEV6NWw1YXFTZkJMT1I1dWdwa3FtWGFJUDRqQVZ2ZmlaWVI3T3hT?=
 =?utf-8?B?VXdxN2xjaWwvWlhqV1R0YnJibytNOHZ6d2VEWmdhOGNhdnBKUXNxTHREdXNQ?=
 =?utf-8?B?MVBrdFd2MnI0WTlsbWM5UmZFTzBXb1lLbWZLNlFSN2tiUERZREo0MkdhTVYw?=
 =?utf-8?B?dGFMUjZCYkRZN3VCQlQvQzJlWXlGQUdEblVWQ2RzeXluQmIyYnJ3NXR0QWlt?=
 =?utf-8?B?THBMNE9qWDdvQ2FzaGpNNGF0T2pkbjd6dklSbXc3NThhOWlHNlRHN1c4cGNJ?=
 =?utf-8?B?VE1TQk1JRHVYTnRnM3d4enp2cmp4VnNvWE5XMTJNbWt4UnpwQ1R6RDBJL0hq?=
 =?utf-8?B?M3hPcmJEbHc1aEFmeVZNM2ZXWmZsNy9DN2ZHblV6MzNnRWNVQmpaNGd3TllM?=
 =?utf-8?B?T2swdm9LWEFFOFVtbXVNdzc0dDVabUlJUnhXcHVmZzhkQ2RsS0l5QmNURENY?=
 =?utf-8?Q?vQtsSlUtSfhaE1fDRUSe77u29?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5568e6-d9ce-4232-25f5-08dba7e37bd3
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 16:26:08.4901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VnHNf5BDrW/FgigfUNdISfhSNjGtD/0Rfp7+AwDEaLntV2ZY5ElHn5hRVuO5JwiSBRbaU/izrkF/Vrydl4iwbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5757

On Fri, Aug 25, 2023 at 01:02:16AM -0700, Vikram Garhwal wrote:
> Dynamic programming ops will modify the dt_host and there might be other
> functions which are browsing the dt_host at the same time. To avoid the race
> conditions, adding rwlock for browsing the dt_host during runtime. dt_host
> writer will be added in the follow-up patch for device tree overlay
> functionalities."
> 
> Reason behind adding rwlock instead of spinlock:
>    For now, dynamic programming is the sole modifier of dt_host in Xen during
>        run time. All other access functions like iommu_release_dt_device() are
>        just reading the dt_host during run-time. So, there is a need to protect
>        others from browsing the dt_host while dynamic programming is modifying
>        it. rwlock is better suitable for this task as spinlock won't be able to
>        differentiate between read and write access.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v9:
>     Update commit message and fix indentation.
>     Add ASSERT() for iommu_deassign_dt_device() and iommu_remove_dt_device().

Copy-pasting Julien's comment here for keeping comments with latest version:
"We also need to add ASSERT(system_state <= SYS_STATE_active || check lock);
in iommu_add_dt_device() and iommu_assign_dt_device()."

I will make the changes in v11.
Regards,
Vikram

>     Fix code styles.
>     Remove rwlock_init in unflatten_device_tree() and do DEFINE_RWLOCK in
>         device-tree.c
> Changes from v7:
>     Keep one lock for dt_host instead of lock for each node under dt_host.
> ---
> ---
>  xen/common/device_tree.c              |  1 +
>  xen/drivers/passthrough/device_tree.c | 24 ++++++++++++++++++++++--
>  xen/include/xen/device_tree.h         |  7 +++++++
>  3 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> index f38f51ec0b..b1c2952951 100644
> --- a/xen/common/device_tree.c
> +++ b/xen/common/device_tree.c
> @@ -31,6 +31,7 @@ dt_irq_xlate_func dt_irq_xlate;
>  struct dt_device_node *dt_host;
>  /* Interrupt controller node*/
>  const struct dt_device_node *dt_interrupt_controller;
> +DEFINE_RWLOCK(dt_host_lock);
>  
>  /**
>   * struct dt_alias_prop - Alias property in 'aliases' node
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 3fad65fb69..b81dab5a48 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -62,6 +62,8 @@ int iommu_deassign_dt_device(struct domain *d, struct dt_device_node *dev)
>      const struct domain_iommu *hd = dom_iommu(d);
>      int rc;
>  
> +    ASSERT(rw_is_locked(&dt_host_lock));
> +
>      if ( !is_iommu_enabled(d) )
>          return -EINVAL;
>  
> @@ -114,6 +116,8 @@ int iommu_release_dt_devices(struct domain *d)
>      if ( !is_iommu_enabled(d) )
>          return 0;
>  
> +    read_lock(&dt_host_lock);
> +
>      list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
>      {
>          rc = iommu_deassign_dt_device(d, dev);
> @@ -121,10 +125,14 @@ int iommu_release_dt_devices(struct domain *d)
>          {
>              dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
>                      dt_node_full_name(dev), d->domain_id);
> +            read_unlock(&dt_host_lock);
> +
>              return rc;
>          }
>      }
>  
> +    read_unlock(&dt_host_lock);
> +
>      return 0;
>  }
>  
> @@ -134,6 +142,8 @@ int iommu_remove_dt_device(struct dt_device_node *np)
>      struct device *dev = dt_to_dev(np);
>      int rc;
>  
> +    ASSERT(rw_is_locked(&dt_host_lock));
> +
>      if ( !iommu_enabled )
>          return 1;
>  
> @@ -251,6 +261,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>      int ret;
>      struct dt_device_node *dev;
>  
> +    read_lock(&dt_host_lock);
> +
>      switch ( domctl->cmd )
>      {
>      case XEN_DOMCTL_assign_device:
> @@ -294,7 +306,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>          spin_unlock(&dtdevs_lock);
>  
>          if ( d == dom_io )
> -            return -EINVAL;
> +        {
> +            ret = -EINVAL;
> +            break;
> +        }
>  
>          ret = iommu_add_dt_device(dev);
>          if ( ret < 0 )
> @@ -332,7 +347,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>              break;
>  
>          if ( d == dom_io )
> -            return -EINVAL;
> +        {
> +            ret = -EINVAL;
> +            break;
> +        }
>  
>          ret = iommu_deassign_dt_device(d, dev);
>  
> @@ -347,5 +365,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>          break;
>      }
>  
> +    read_unlock(&dt_host_lock);
> +
>      return ret;
>  }
> diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> index 44d315c8ba..a262bba2ed 100644
> --- a/xen/include/xen/device_tree.h
> +++ b/xen/include/xen/device_tree.h
> @@ -18,6 +18,7 @@
>  #include <xen/string.h>
>  #include <xen/types.h>
>  #include <xen/list.h>
> +#include <xen/rwlock.h>
>  
>  #define DEVICE_TREE_MAX_DEPTH 16
>  
> @@ -218,6 +219,12 @@ extern struct dt_device_node *dt_host;
>   */
>  extern const struct dt_device_node *dt_interrupt_controller;
>  
> +/*
> + * Lock that protects r/w updates to unflattened device tree i.e. dt_host during
> + * runtime. Lock may not be taken for boot only code.
> + */
> +extern rwlock_t dt_host_lock;
> +
>  /**
>   * Find the interrupt controller
>   * For the moment we handle only one interrupt controller: the first
> -- 
> 2.17.1
> 
> 

