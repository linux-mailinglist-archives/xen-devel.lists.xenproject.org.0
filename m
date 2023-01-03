Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F2F65C3A6
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 17:14:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470659.730233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCjvF-0004TW-Th; Tue, 03 Jan 2023 16:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470659.730233; Tue, 03 Jan 2023 16:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCjvF-0004QF-Q8; Tue, 03 Jan 2023 16:13:53 +0000
Received: by outflank-mailman (input) for mailman id 470659;
 Tue, 03 Jan 2023 16:13:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/j9y=5A=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pCjvF-0004Q9-2y
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 16:13:53 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9852df46-8b81-11ed-b8d0-410ff93cb8f0;
 Tue, 03 Jan 2023 17:13:45 +0100 (CET)
Received: from DS7PR03CA0156.namprd03.prod.outlook.com (2603:10b6:5:3b2::11)
 by MN2PR12MB4454.namprd12.prod.outlook.com (2603:10b6:208:26c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 16:13:46 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::dc) by DS7PR03CA0156.outlook.office365.com
 (2603:10b6:5:3b2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 16:13:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.10 via Frontend Transport; Tue, 3 Jan 2023 16:13:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 10:13:45 -0600
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Jan 2023 10:13:43 -0600
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
X-Inumbo-ID: 9852df46-8b81-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyYmyWqVNOBzOpct5pUdnvHwZxnRj+hg67YAoqMeI6qT04AXucw8gh5uvtfPoJZCSo8PW9BGSksmr6GBnCJEolOfJjgXy3MgGyyFaewB3NaKdC4ms2ps7N7AKcr8tKRV2zlLXR2dsm2EjxmC7wxBca+z3MCs0YOHpF536uigjDtvHEbD1WTzCsmL3bPM1JNOMxZL1bQ0CHg7KYs6CoGB6rKVkCwFVjITj6zQWAY25ETPLYYJO1pfaqaP3SCIJi0Jjd33wqiBT/EjGbBfvhciHmDif3Xt+dBhl0Lfk+7kEjCoif5XTfvt4n37XWErGKeBHR7DJafMEYJsUKbvpJ9ynw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAeB5DZg5O4cLoUIOlrA32lq3p/qkuMgOeXypP9e4Uc=;
 b=mRmO0bjHJ46qRqQO1tbGgGkwrsxtpvKQsQgxJY0HkAeMVzLJRRmVaDKN/fiyjoHuxnREK85lffRJKX7ihR7P6nIMb2gZko0C/7msK6ET7bnvtoJVxzxjlnK2WGviZFtNF9bSaTGyrvOYxqPRM9AQ5mMf4X0a6xhBCzoEKgx1LPPOkSuL2nPQW7L00pT2fpI8nV6gZfXf9aV5VHYAwOQ3VKPRoSkSCP3RJaSRrult5VXGgsKCTBxbIXFsN7gAEDcUh/0NqdE6n4NNlZMrEsUs++wyqteyDQBb9U6SLgUd7QEJMMFhyvSFJxNnsbtjn1t6Y4/KTqXLI/ntj1+lgQC1lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAeB5DZg5O4cLoUIOlrA32lq3p/qkuMgOeXypP9e4Uc=;
 b=bUdgB5xAVBBbzj/uXLYOBwEjNzMXxlQRU94Y8+eQfyvLEXbC+JJv8lLC/1wKrqxCQyzY4HdqXBhBP70w3XDwLVlgZMrEPn2a/eCWoeF8M4nthk2Boa9BmzxF5q171bV019nfYsrb7lS1ADwfvcNAU8nM5LSkZ2nmh2gyOyY7O5k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9c11f1d8-1f59-9993-22bd-fb7e6d1b93ae@amd.com>
Date: Tue, 3 Jan 2023 11:13:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 11/21] xen/arm: vsmmuv3: Attach Stage-1 configuration
 to SMMUv3 hardware
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
 <b0873a8cf229143544388a90334edd7c96bc78c4.1669888522.git.rahul.singh@arm.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <b0873a8cf229143544388a90334edd7c96bc78c4.1669888522.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT046:EE_|MN2PR12MB4454:EE_
X-MS-Office365-Filtering-Correlation-Id: 224f5d43-8e7e-417a-4b2b-08daeda57d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mDwQhiGyCkNz/XfPANZsWewMcPHUMJnbjL3NXCv8QtCOF+6CIPpzNgFq72cnsx5+keAitAsFFFXgAiYmNnVVaC0R8j6uwZcnzDuJY0gTRwkcZfMD/KR9kIo02WY+ryifJi6eycE8NT/ccc9DKZ6JIX4VTKTl34iNCGvxb2sJBIHULiIo9q1oZNW7ayjRjVEf1dVfHq+gP624WSOIdWyQtQXeinqcMjpgDvdh+RjFRE5nUm3oRDjKKSskn/M1F5UH33SkeWm3Rogrnu9JmKnt/cq0/LYeUZedVK3uBFEZm5btt59X+Cz7M2M3ZrGK2BmYewl/yQs7jVkVMDydljrN29V3dsHsm8WLwWPfXTdwP5o9r5zfcMfbBhFw1SIi16jDz5SD0FG8txOfJ3ANsyJ2jk9zPjMtYHEtbcBds/Zp+nh4KZC/lchLuhUkG2Fe5va2K7BVr6+u8B+78BsmHP6xklX324pEhLLDRLY9r9XGJcXMenpTJGkh+TVOAS/pWZ4aUp12D9k/hJJFu4HlmL2Tmrb8HP3Qx4qGxndNN3xxIqYJUQRyjj4tK+pefYbAusgjdfTyz1WaQMNOqVDeh/eRHowk5zrbqiPgwW7g7vejReUD1wpvOWYJopCJKZ28Mrqa6KZcTprOvhx0RdrAyOQXnHHmd7YKEScRXnacEKCPglxFRj5jXBjXtfqh7pLg/DCLSP0VwEnic92U6gj5MzpG8zysMBpM+HNKTCE8m3SkF+YlXH0anKiLiX/l7e8jWuU/Px5oBvUr0oghHo1wnA8OKnV1qrHoSCGGYmDXE56/KtSvmf15o3UpfQFeEHKl/IKYxsQ2bqpPJdYTssIJjUy11jpl+puEScldh1eWybfVsTU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(46966006)(36840700001)(40470700004)(70206006)(8676002)(70586007)(4326008)(81166007)(36756003)(2616005)(426003)(47076005)(336012)(41300700001)(40460700003)(54906003)(16576012)(316002)(110136005)(31696002)(2906002)(356005)(86362001)(36860700001)(5660300002)(82740400003)(82310400005)(40480700001)(44832011)(8936002)(83380400001)(53546011)(478600001)(186003)(26005)(31686004)(22166006)(43740500002)(36900700001)(473944003)(414714003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 16:13:45.8109
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 224f5d43-8e7e-417a-4b2b-08daeda57d96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4454

On 12/1/22 11:02, Rahul Singh wrote:
> Attach the Stage-1 configuration to device STE to support nested
> translation for the guests.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c  | 79 ++++++++++++++++++++++++++
>  xen/drivers/passthrough/arm/smmu-v3.h  |  1 +
>  xen/drivers/passthrough/arm/vsmmu-v3.c | 18 ++++++
>  xen/include/xen/iommu.h                | 14 +++++
>  4 files changed, 112 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 4f96fdb92f..c4b4a5d86d 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -2754,6 +2754,37 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev)
>         return NULL;
>  }
> 
> +static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
> +                               u32 sid)
> +{
> +       int i;
> +       unsigned long flags;
> +       struct iommu_domain *io_domain;
> +       struct arm_smmu_domain *smmu_domain;
> +       struct arm_smmu_master *master;
> +       struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> +
> +       /*
> +        * Loop through the &xen_domain->contexts to locate a context
> +        * assigned to this SMMU
> +        */
> +       list_for_each_entry(io_domain, &xen_domain->contexts, list) {
> +               smmu_domain = to_smmu_domain(io_domain);
> +
> +               spin_lock_irqsave(&smmu_domain->devices_lock, flags);
> +               list_for_each_entry(master, &smmu_domain->devices, domain_head) {
> +                       for (i = 0; i < master->num_streams; i++) {
> +                               if (sid != master->streams[i].id)
> +                                       continue;
> +                               spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> +                               return io_domain;
> +                       }
> +               }
> +               spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> +       }
> +       return NULL;
> +}
> +
>  static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
>                                 struct device *dev)
>  {
> @@ -2909,6 +2940,53 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>         xfree(xen_domain);
>  }
> 
> +static int arm_smmu_attach_guest_config(struct domain *d, u32 sid,
> +               struct iommu_guest_config *cfg)
> +{
> +       int ret = -EINVAL;
> +       unsigned long flags;
> +       struct arm_smmu_master *master;
> +       struct arm_smmu_domain *smmu_domain;
> +       struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> +       struct iommu_domain *io_domain = arm_smmu_get_domain_by_sid(d, sid);
> +
> +       if (!io_domain)
> +               return -ENODEV;
> +
> +       smmu_domain = to_smmu_domain(io_domain);
> +
> +       spin_lock(&xen_domain->lock);
> +
> +       switch (cfg->config) {
> +       case ARM_SMMU_DOMAIN_ABORT:
> +               smmu_domain->abort = true;
> +               break;
> +       case ARM_SMMU_DOMAIN_BYPASS:
> +               smmu_domain->abort = false;
> +               break;
> +       case ARM_SMMU_DOMAIN_NESTED:
> +               /* Enable Nested stage translation. */
> +               smmu_domain->stage = ARM_SMMU_DOMAIN_NESTED;
> +               smmu_domain->s1_cfg.s1ctxptr = cfg->s1ctxptr;
> +               smmu_domain->s1_cfg.s1fmt = cfg->s1fmt;
> +               smmu_domain->s1_cfg.s1cdmax = cfg->s1cdmax;
> +               smmu_domain->abort = false;
> +               break;
> +       default:
> +               goto out;
> +       }
> +
> +       spin_lock_irqsave(&smmu_domain->devices_lock, flags);
> +       list_for_each_entry(master, &smmu_domain->devices, domain_head)
> +               arm_smmu_install_ste_for_dev(master);
> +       spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
> +
> +       ret = 0;
> +out:
> +       spin_unlock(&xen_domain->lock);
> +       return ret;
> +}
> +
>  static const struct iommu_ops arm_smmu_iommu_ops = {
>         .page_sizes             = PAGE_SIZE_4K,
>         .init                   = arm_smmu_iommu_xen_domain_init,
> @@ -2921,6 +2999,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
>         .unmap_page             = arm_iommu_unmap_page,
>         .dt_xlate               = arm_smmu_dt_xlate,
>         .add_device             = arm_smmu_add_device,
> +       .attach_guest_config = arm_smmu_attach_guest_config

Please append a trailing comma here, even if it is the last element

>  };
> 
>  static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
> index e270fe05e0..50a050408b 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -393,6 +393,7 @@ enum arm_smmu_domain_stage {
>         ARM_SMMU_DOMAIN_S2,
>         ARM_SMMU_DOMAIN_NESTED,
>         ARM_SMMU_DOMAIN_BYPASS,
> +       ARM_SMMU_DOMAIN_ABORT,
>  };
> 
>  /* Xen specific code. */
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index 916b97b8a2..5188181929 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -223,8 +223,11 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>  {
>      int ret;
>      uint64_t ste[STRTAB_STE_DWORDS];
> +    struct domain *d = smmu->d;
> +    struct domain_iommu *hd = dom_iommu(d);
>      struct arm_vsmmu_s1_trans_cfg s1_cfg = {0};
>      uint32_t sid = smmu_cmd_get_sid(cmdptr[0]);
> +    struct iommu_guest_config guest_cfg = {0};
> 
>      ret = arm_vsmmu_find_ste(smmu, sid, ste);
>      if ( ret )
> @@ -234,6 +237,21 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
>      if ( ret )
>          return (ret == -EAGAIN ) ? 0 : ret;
> 
> +    guest_cfg.s1ctxptr = s1_cfg.s1ctxptr;
> +    guest_cfg.s1fmt = s1_cfg.s1fmt;
> +    guest_cfg.s1cdmax = s1_cfg.s1cdmax;
> +
> +    if ( s1_cfg.bypassed )
> +        guest_cfg.config = ARM_SMMU_DOMAIN_BYPASS;
> +    else if ( s1_cfg.aborted )
> +        guest_cfg.config = ARM_SMMU_DOMAIN_ABORT;
> +    else
> +        guest_cfg.config = ARM_SMMU_DOMAIN_NESTED;
> +
> +    ret = hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
> +    if ( ret )
> +        return ret;
> +
>      return 0;
>  }
> 
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 4f22fc1bed..b2fc027e5e 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -230,6 +230,15 @@ int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
> 
>  #endif /* HAS_DEVICE_TREE */
> 
> +#ifdef CONFIG_ARM
> +struct iommu_guest_config {
> +    paddr_t     s1ctxptr;
> +    uint8_t     config;
> +    uint8_t     s1fmt;
> +    uint8_t     s1cdmax;
> +};
> +#endif /* CONFIG_ARM */
> +
>  struct page_info;
> 
>  /*
> @@ -302,6 +311,11 @@ struct iommu_ops {
>       */
>      int (*dt_xlate)(device_t *dev, const struct dt_phandle_args *args);
>  #endif
> +
> +#ifdef CONFIG_ARM
> +    int (*attach_guest_config)(struct domain *d, u32 sid,
> +                               struct iommu_guest_config *cfg);
> +#endif
>  };
> 
>  /*
> --
> 2.25.1
> 
> 

