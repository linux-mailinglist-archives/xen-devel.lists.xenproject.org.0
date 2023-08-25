Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4707A787FC2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 08:23:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590508.922810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZQD3-0001fa-KB; Fri, 25 Aug 2023 06:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590508.922810; Fri, 25 Aug 2023 06:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZQD3-0001d8-GQ; Fri, 25 Aug 2023 06:22:17 +0000
Received: by outflank-mailman (input) for mailman id 590508;
 Fri, 25 Aug 2023 06:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZQD2-0001d1-JP
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 06:22:16 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba9c38aa-430f-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 08:22:14 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SA1PR12MB7366.namprd12.prod.outlook.com (2603:10b6:806:2b3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 06:22:09 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6699.028; Fri, 25 Aug 2023
 06:22:09 +0000
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
X-Inumbo-ID: ba9c38aa-430f-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FAVHyIuQb5N7f7cOJsBepNaRKta3sa++9Gt/9LJfzs/aNKFWB0mjzU+bWNSQMCJgiK04U9yTwI5d1fMW/gSrp7dEJkvgKF91w8AsXGPBVDZdgF8rqMfGtO/TQ2Jemj1wFJyqABKZgEsKFISV5Ffdff+IcSJCGvhN05LzUnC5Lx1F4CKIWlx/CENxnfuECjToCt36r8HR0qoh995fOQJIH+FMSioUen0gcuv0imBOkqgv7QouBm6Eu9kha5X9vDDXk556RoJEQ0o155SK6MdnQWhAWRAXKro98G89pYoSsJEehgrkb48w3WAM5pvXfT4DkilxAcBJHsI0VypLcZOUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3cIqwmI5tfC8NIIgNtIEior/RVx6YKPz+5TvIpeSxo=;
 b=EhD84ThVxqGB3Ejfd1ChR9cmZ3jiw7xgVHkw7W4u28NVjiLxSsvdJBOjAzdWnwqtgBN5Ye2kLRzWz4IgHa6lsH3HRjRRFIsQeE5HtevxwgZueWvJZiPEu49WqbiYQoOJSfXgs2ll4DevypLpLwVuRcNYHqmXsYhvdzcmsqiTs6by8/vkwfb6zF6GccOoAYbEyiUqEoPZQYDgJWPFQwzJe+w5FjyePoLch5nOxWEJNBbm8Q9YPr4le+L8litOTQHRHtQwDhmkvkCvjmESPVPfIMxw/GPmHkzSR0BcWi5EBCUs1JD3qTiyI5uZL/TH0sOE+DhFcaEqSCdQTTAmzVvDtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3cIqwmI5tfC8NIIgNtIEior/RVx6YKPz+5TvIpeSxo=;
 b=n63V+E7x/naXoiZfU0MvU5vT1MrIEqn0FNKHcapgDRteQtIyqaFtlRrajbOY1PCR0DAifZ02pmkNNIAiRXwXypEeAXUdrBj2Nu0LVurQVeMEkt7CSEzmiRjWeQdgOZd86/b5F2N/ax3mSZcaiHkLB7pRqoxQZuxo7S6FmbwIqXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 24 Aug 2023 23:22:00 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com
Subject: Re: [XEN][PATCH v9 14/19] common/device_tree: Add rwlock for dt_host
Message-ID: <ZOhIiLg0thx3Q2N_@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-15-vikram.garhwal@amd.com>
 <d5e658e4-e30e-4783-8fcc-0bd93126abf3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d5e658e4-e30e-4783-8fcc-0bd93126abf3@xen.org>
X-ClientProxiedBy: SJ0PR03CA0085.namprd03.prod.outlook.com
 (2603:10b6:a03:331::30) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SA1PR12MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cd02d88-28a0-4ad0-ba0c-08dba5339c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BKJ+wOTq8PcWNhQ8TykBpTzUMZhbyQZOJZwATOl6IlXvzYxuI0nUHATTUaG73iVrvHGsFb9TDwhlpptSj8ISugnb+DjdRuOHtiwyB8bLZZ1piwMYR9A1iROQ7gEv4AaA6Pn4w3XaciJYBxycNaWYjezM25Dwsj3BIHi1SZYkTYn+0YbolPD6bu5nDGRaN0nQVztFC7VI4O/wgvMaLkI+bG+uPU8qLSNQlGhUoQxw3eySQhnxBP6CMjuyEBQAA2gMlDS45KiEuvzlC6iD4PPOTMwF0OWK221/Y/IjrSZptnO+13241oa/l+KCY3+bzJONUxRESpSj7SbfDYi8SX44FM5zuSF4aD5UmFPo6J9SeZaukhL+yyNmlE1EVY0PlCQBwAExjlOD9vSFBp7MVeVn5PpSU+aq0BKOBZn99iTYbTieZhw1PkH9aVV4Z5yqoTluBIp43BjNulEPh6YcyhD7K4pKb9J+aQU+yq1QDXiQt5azeSx/VSOaj69AsO3V30I+3tI2Jr4HjPjLPJ2U1SpVOLHhxChm4Ki0a+9LDrfMM1wUxxesSXzZjCwZVb6p7jmv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(136003)(376002)(39860400002)(366004)(1800799009)(451199024)(186009)(44832011)(83380400001)(6512007)(26005)(478600001)(2616005)(5660300002)(2906002)(8936002)(4326008)(8676002)(38100700002)(6916009)(66476007)(66556008)(66946007)(86362001)(41300700001)(6506007)(53546011)(6486002)(36756003)(6666004)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0x1c0ZESHVDbkMzNWRLdmlrZ3d1RXphSVM2cWc3anhaenFUcG5FdHloZ1l1?=
 =?utf-8?B?bVRpUE5PSjgreGJKcWJmVkEvMitxb1pIa2FSR2FaaGZvek8xRGVVUDJOais2?=
 =?utf-8?B?WmVsWm1JNEdkeTJqbVRIV1Yzd0gxMWs0eHhIbjA5RnRKWDR2ZU1FY0xFeXhX?=
 =?utf-8?B?d1RXaVAvYlNnSE9jTDJHOUI4WjZ6bWlEV2plb0ZxNkFpVC9BWC9Lc3dZUnM2?=
 =?utf-8?B?bitabC9ZTTVwZEMrQmQvZktMVjZCY3lGa21Eb0F3K2w4WkJyMWRVN0FmSkZV?=
 =?utf-8?B?cG1wOExtb0Q1ZUpZUGRSK3ZUTk5OcjlwN3ROa2didHJTM0g3T1hOODFOZkpo?=
 =?utf-8?B?c3ZFak9tNTV2NGQ4QTZ6dE1IWG41eURsVThHd3BmeWVyZnM0YXBTZ29RNGxW?=
 =?utf-8?B?UnNRSVBVUW1IT1dLenV6RTcwajNlR2xpSm9BQlNmRHhzRWQxOUxnSHlGSGJj?=
 =?utf-8?B?ZFdjWkw4ZSt5WEFaaFVDQWttcU9ZeEFST2g0VTE5NGpCZDAvYkRSNjVITlJ1?=
 =?utf-8?B?V21TUUI3N2RvR3VsaHFiUUNPb3lwZzFHUzRyckpza05VRWc1THlFWDgzd0tX?=
 =?utf-8?B?QWpqcHFyMzdycmF3MllyT05WSXh6VCtTSVpSLy8wK3U0cjhQd3Rqb0tObHl5?=
 =?utf-8?B?a09BL25oaVU3N2I1bWRYT09oL29QMjR1azVYWlh6MTR6c3lPdFNZYVVwUzBt?=
 =?utf-8?B?dzBMNGxnOFBRZlA2WnVzZUcxYUlSSGc3a21MQlc3VTAzQ0RXS2F0TUgwbXdz?=
 =?utf-8?B?SzZQdGlyRmZsc2ZKNW9uVUNvOXRvVmF0WlpFMjZNeE5oVXZSekMzSERYWXNx?=
 =?utf-8?B?U3gybnNrYW0xbERHVDAwZWNBU1AwN0lLeTdQY3pZWHlsL3U3ekdYb1orM2RZ?=
 =?utf-8?B?UjJmUzJ1VGVuemJ2YnVQNmJRQkZzL2M4R1JjUDN5ZzdFWDJVb2JHOUNZTE56?=
 =?utf-8?B?L3ZJdmRwcGVRVGVXeUhTK3RnNjB6WFdpRFVhMUFMWXRYaTUyYVF5SjdpSGdQ?=
 =?utf-8?B?UzJKVURHSDAyTjI2Z3VUcCt5R0EwTXVBMlVpRE1WNkpNVFJ4b0NzNXVyeEJt?=
 =?utf-8?B?cUNBamQrNXNBNkc4a0NacHB4YmFqQmhlaGQyN2V1TzIwWEhvY1FQWHZpczBz?=
 =?utf-8?B?eVl4VFdUNzd6WVR2K0dTYnhOaFJqQUkyTUtsYk50eUFFekp0TUNIMzZSUHp0?=
 =?utf-8?B?bCtoenRRQkN5OElXUlMxTGtZMkIyZnU4QVNrcFJmdG1vVms4YXRKSFVXQlZj?=
 =?utf-8?B?aU1KSEUxcC9RQ2dFNEhFU29ka01wbUt5dWw1NUo0R0F6WUhFbWFma3JEY1FC?=
 =?utf-8?B?U2tmOXpPN3dOY2JBb0hGOWRSREFGK05lNTZUbm03SjdRUlRhMUwzWGk3TFJ0?=
 =?utf-8?B?V0RJUmlWSENCMFMxR1BId21Sd1kwZURrZGtrcGVCQWQ0YjVCSmpHWXdEeHl3?=
 =?utf-8?B?Zmh6N2hseDF3RG1aWDJpRzdpVWxTUE5zOTJWTDdTK3dmT3FxcUlGSEN6STht?=
 =?utf-8?B?eXdUZjY0K1JSb01WRjBBVzhDb2sxUVlaTUlFQkdBRVJ0a3VzOGw3NDFRSFFE?=
 =?utf-8?B?WkJ3YlpaOUZaZDVKYldiZUJETk9PeXlqbFMrcDV4MWpDbkJXV1FDWGg5Smlj?=
 =?utf-8?B?RGFXSEJyQWhjaFgxd0VmbGJPc1NFamVuL0dxMEVsSGZDVVh1ZDZ4YWlCY2RR?=
 =?utf-8?B?THVTMkZic2tsVGpxb2Z2VE9QZi9BVXYwSk9pQThaNWN4R1hLR05neERxckpv?=
 =?utf-8?B?dU5ramNEQ3krTzQ2OWNnRS9lUEJDVHNyL2xpaFBDekxReWcrVnhGMk9TV0k3?=
 =?utf-8?B?Q1ZVVEo5UDNXa2U2enRSRXN2Q1BxMnhOKzN3cWpCM1M3SkZRcGhjU2VwT2Y1?=
 =?utf-8?B?amJRTHJFS1JMTFRIbHI4blZsTjdwTGdtdUs3MEJ6b0E4RVppWUNubFR0MS93?=
 =?utf-8?B?TEwrS01jYVpCYWI4WlVBSDFqbHRlWWFzMG5NUWdVTzZRY2dJVUYrNzlYUUto?=
 =?utf-8?B?M3BVUFVXWU5PWkZid0EvMkRNYldNTFVoU0xjaEN1TWovYmh0SllPMkRLSzBS?=
 =?utf-8?B?cnFoZFdwTGl0TjduNzhEMWVaRkVVMkR4UnkzTXFtZkRVRjBBdlVFdDFRRm5Y?=
 =?utf-8?Q?zMiAjL732MkoMA/Jv0s/jaYc+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd02d88-28a0-4ad0-ba0c-08dba5339c6d
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 06:22:09.1466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXp9yP1UhMvIdmPcjKiyquhP7LuoPgw7UlkIymh+P/TtI+ga56BGXRR4mDhdj968ofJplDC4/nSMeFNfoxK4ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7366

Hi Julien,
On Wed, Aug 23, 2023 at 11:06:59PM +0100, Julien Grall wrote:
> Hi Vikram,
> 
> On 19/08/2023 01:28, Vikram Garhwal wrote:
> >   Dynamic programming ops will modify the dt_host and there might be other
> >   function which are browsing the dt_host at the same time. To avoid the race
> 
> Typo: I think you want to write 'functions'
> 
> >   conditions, adding rwlock for browsing the dt_host during runtime. dt_host
> >   writer will be added in the follow-up patch titled "xen/arm: Implement device
> >   tree node addition functionalities."
> 
> I would prefer if we avoid mention the name of the follow-up commit. This
> will reduce the risk that the name of the commit is incorrect if we decide
> to commit this patch before the rest of the series is ready.
> 
> Also, the commit message seems to be indented. Was it intended?
> 
> > 
> >   Reason behind adding rwlock instead of spinlock:
> >      For now, dynamic programming is the sole modifier of dt_host in Xen during
> >          run time. All other access functions like iommu_release_dt_device() are
> >          just reading the dt_host during run-time. So, there is a need to protect
> >          others from browsing the dt_host while dynamic programming is modifying
> >          it. rwlock is better suitable for this task as spinlock won't be able to
> >          differentiate between read and write access.
> 
> The indentation looks odd here as well.
> 
Changed above comments in v10.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > 
> > ---
> > Changes from v7:
> >      Keep one lock for dt_host instead of lock for each node under dt_host.
> > ---
> > ---
> >   xen/common/device_tree.c              |  5 +++++
> >   xen/drivers/passthrough/device_tree.c | 15 +++++++++++++++
> >   xen/include/xen/device_tree.h         |  6 ++++++
> >   3 files changed, 26 insertions(+)
> 
> I am not sue where to put the comment. I noticed that you didn't touch
> iommu_remove_dt_device() and iommu_add_dt_device(). Does this mean the
> caller is expected to held the lock? If so, then this should be documented
> and an ASSERT() should be added.
Added ASSERT in iommu_(add,remove,assign and deassign)_dt_device(),
> 
> > 
> > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > index 0f10037745..6b934fe036 100644
> > --- a/xen/common/device_tree.c
> > +++ b/xen/common/device_tree.c
> > @@ -31,6 +31,7 @@ dt_irq_xlate_func dt_irq_xlate;
> >   struct dt_device_node *dt_host;
> >   /* Interrupt controller node*/
> >   const struct dt_device_node *dt_interrupt_controller;
> > +rwlock_t dt_host_lock;
> >   /**
> >    * struct dt_alias_prop - Alias property in 'aliases' node
> > @@ -2137,7 +2138,11 @@ int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
> >       dt_dprintk(" <- unflatten_device_tree()\n");
> > +    /* Init r/w lock for host device tree. */
> > +    rwlock_init(&dt_host_lock);
> 
> Calling rwlock_init() from unflattent_device_tree() seems to be incorrect as
> it would lead to re-initialize the lock every time we are create a new DT
> overlay.
> 
> Instead you want to replace the definition of dt_host_lock with:
> 
> DEFINE_RWLOCK(dt_host_lock)
> 
Changed this. DEFINE_RWLOCK is added to device-tree.c and this is removed.
> > +
> >       return 0;
> > +
> 
> Spurious change?
> 
> >   }
> >   static void dt_alias_add(struct dt_alias_prop *ap,
> > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > index 4cb32dc0b3..31815d2b60 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -114,6 +114,8 @@ int iommu_release_dt_devices(struct domain *d)
> >       if ( !is_iommu_enabled(d) )
> >           return 0;
> > +    read_lock(&dt_host_lock);
> > +
> >       list_for_each_entry_safe(dev, _dev, &hd->dt_devices, domain_list)
> >       {
> >           rc = iommu_deassign_dt_device(d, dev);
> 
> So iommu_deassign_dt_device() is now called with the read lock. I am
> assuming the intention is all the caller will need to fist held the lock. If
> so, then I think this would require an ASSERT() in
> iommu_deassign_dt_device() and a comment on top of the function because it
> is exported.
> 
> I am guessing that iommu_assign_dt_device() is in the same situation.
> 
> 
> > @@ -121,10 +123,14 @@ int iommu_release_dt_devices(struct domain *d)
> >           {
> >               dprintk(XENLOG_ERR, "Failed to deassign %s in domain %u\n",
> >                       dt_node_full_name(dev), d->domain_id);
> > +
> > +            read_unlock(&dt_host_lock);
> 
> Coding style: Usually we add the newline before the return. So I would
> switch around the two lines.
> 
> >               return rc;
> >           }
> >       }
> > +    read_unlock(&dt_host_lock);
> > +
> >       return 0;
> >   }
> > @@ -251,6 +257,8 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >       int ret;
> >       struct dt_device_node *dev;
> > +    read_lock(&dt_host_lock);
> > +
> >       switch ( domctl->cmd )
> >       {
> >       case XEN_DOMCTL_assign_device:
> > @@ -304,7 +312,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >           spin_unlock(&dtdevs_lock);
> >           if ( d == dom_io )
> > +        {
> > +            read_unlock(&dt_host_lock);
> >               return -EINVAL;
> 
> NIT: Rather than adding the unlock here, you could use:
> 
> rc = -EINVAL;
> break;
> 
> > +        }
> >           ret = iommu_add_dt_device(dev);
> >           if ( ret < 0 )
> > @@ -342,7 +353,10 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >               break;
> >           if ( d == dom_io )
> > +        {
> > +            read_unlock(&dt_host_lock);
> >               return -EINVAL;
> > +        }
> 
> NIT: Same here.
> 
> >           ret = iommu_deassign_dt_device(d, dev);
> > @@ -357,5 +371,6 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >           break;
> >       }
> > +    read_unlock(&dt_host_lock);
> 
> Coding style: Please add a newline.
> 
Changed all above coding styles.
> >       return ret;
> >   }
> > diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
> > index e507658b23..8191f30197 100644
> > --- a/xen/include/xen/device_tree.h
> > +++ b/xen/include/xen/device_tree.h
> > @@ -18,6 +18,7 @@
> >   #include <xen/string.h>
> >   #include <xen/types.h>
> >   #include <xen/list.h>
> > +#include <xen/rwlock.h>
> >   #define DEVICE_TREE_MAX_DEPTH 16
> > @@ -216,6 +217,11 @@ extern struct dt_device_node *dt_host;
> >    */
> >   extern const struct dt_device_node *dt_interrupt_controller;
> > +/*
> > + * Lock that protects r/w updates to unflattened device tree i.e. dt_host.
> > + */
> 
> The wording suggests that any update to any node would require to hold the
> write lock. However.. it looks like you are only holding the read when
> setting is_protected in the SMMU remove callback. Is this intended?
> 
> Or maybe you expect is_protected by to protected by dtdevs_lock? If so, then
> I think it would be good to spell it out. Possibly on top of is_protected.
> 
Yes, dtdevs_lock will be held to avoid concurrent calls to SMMU remove.
> Lastly, there are plenty of place in Xen where the lock is not taken. They
> mostly seem to be at boot, so I would mention that for boot only code, then
> lock may not be taken.
Updated.
> 
> Lastly, this is a single line comment, so the coding style should be:
> 
> /* ... */
> 
> > +extern rwlock_t dt_host_lock;
> > +
> >   /**
> >    * Find the interrupt controller
> >    * For the moment we handle only one interrupt controller: the first
> 
> Cheers,
> 
> -- 
> Julien Grall

