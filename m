Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECE978BFDF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 10:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592037.924660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qatjo-0005uy-Tb; Tue, 29 Aug 2023 08:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592037.924660; Tue, 29 Aug 2023 08:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qatjo-0005tC-QO; Tue, 29 Aug 2023 08:06:12 +0000
Received: by outflank-mailman (input) for mailman id 592037;
 Tue, 29 Aug 2023 08:06:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jKbG=EO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qatjn-0005t6-3j
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 08:06:11 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e77f4341-4642-11ee-9b0c-b553b5be7939;
 Tue, 29 Aug 2023 10:06:07 +0200 (CEST)
Received: from MW4PR03CA0136.namprd03.prod.outlook.com (2603:10b6:303:8c::21)
 by DS0PR12MB6583.namprd12.prod.outlook.com (2603:10b6:8:d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 08:06:04 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:303:8c:cafe::45) by MW4PR03CA0136.outlook.office365.com
 (2603:10b6:303:8c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35 via Frontend
 Transport; Tue, 29 Aug 2023 08:06:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.2 via Frontend Transport; Tue, 29 Aug 2023 08:06:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 03:06:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 29 Aug
 2023 03:06:02 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 29 Aug 2023 03:06:01 -0500
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
X-Inumbo-ID: e77f4341-4642-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9DLE78xIl+acbLtx6RHcPBpBInNI0c08sbAFwRaurYSq0ud2Kkba+uySh6JJUnlC+YFUka4x2N5nlU7KAPLG77ONFqVU3zBqaGOV0Qpv81/NxmW6ykZpS4mySNurpktaqm8D2HNyeCaqRBQhXyhD2j6gRFYfJ0J9oNHBNNre4TWEkHoxCo31bUR9GJ29ILMEp+HaJ9lM0uYjJncsbnrcJ0K4T5EVol8JwDREYtgyQyqeKrPOgSBmR1Xhj8JotjSNWbGnKV9SNTdthN5efpGTZnNCL846tlE49fFOBb9/VIwVyJl7tvwVyY847mx4MKM33ZL+vCuDL1vXRyqSpXT4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xjlMyVt3p2CWSMNmgQxsm5mIpeTRot1yu7yCKswk6No=;
 b=QoFgLHDrEn48S7cMIliuMTE07NjM36qd+WmrE9dg4mgqHZ49HU707lvclSjNVOQixyFPJPaOXg03r1qvms2MzseU/N4ydD/ZiOth1SU7skyYhHbUDPEHcSqp7EpTpe8lDT1a9MIXbNZheS91i7nBhRjk9RBivJmPcH3lmS+b73i9iK4sWxwa27UqDabxVxyvUGwotl+SvKhDox5YbtpyOS5r9ObTovsmv7ZdRxTx5peUCjIhzH1yvR7l67bcQZTITVD5b+9Un6HQGTwHYUjTLlTva8yEX4c9aAwIOcZXa3fKl0bXkM4JXUp6jcxfR11seAJR1qo24Lw4cpz+lMk5Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xjlMyVt3p2CWSMNmgQxsm5mIpeTRot1yu7yCKswk6No=;
 b=0ZnXYmvnn+ZtI/9PI1Susv+kHp0VavlJ9XJoFLlW5Sabf5oL7mOvF44N+p80tg2ayG95AZbCDdZsiQpBVa7Ftf/jJwBR8ahyUAR2JN6uXx9BSKD+W4SPU+HxLOE58/ynbDZwyC5qwxsHqlyrNhilLBKun2oX4QRAWjoCpslffjU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <301f4799-ff57-c697-94ab-62eb39397c44@amd.com>
Date: Tue, 29 Aug 2023 10:05:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN][PATCH v10 09/20] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-10-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230825080222.14247-10-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|DS0PR12MB6583:EE_
X-MS-Office365-Filtering-Correlation-Id: 60f23293-b6d8-45d6-f03d-08dba866ca04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YJdRXEpSHHYZxPf6PoF8jkFDitJsYaiKtjaJ7wXHNfGvBMHiFVxeXD+Bw+KxLq36aJn7gjgXYfSEq4JvaXTDO5WbG9HAo2rXtAP0tPzML6QG2+41hhV2PgvF4D6eYsVvO6nlchB5mk88fsR78UC2rbuxXriEu1epVPo0Xo5t8qRoV9bfCnCam5dgt/QiMqJOwj1rxY5sRY1WLhAq+v/g9m3wDla+Kic1SAPRms5jyGxJENh1/XHeIxi7V7LAaWWvsL1Qf6oiOYYlZJGn3Yz85xzto5Gf5ACB3Vp2pLpOyu8UWLGhtgnujZDcphaNZe1TRM2YayY5xr7ycZrBbJ201ioSBJTueK0T0purW+uJ1QeweoVxp6BJ82AivWQ1mpWVj2LQcfCbjRg4sNgtZbxxxXFgXlTQKhB3zfFNp3FxKCvSTDENAVct3UW4xg0ziipUMljIwSWJReFZxiO+gauWKfCHJBJU5Ngd1Ctcd9W5Ais/ABBE90ybIEQcqyAWAJkwsLUKt1QLCqveHvcVh/63YEmYjC3FBWWB9fnc84PpBxf+o4KTLmY3MlH9f4tuZOkl5yDFNBppn9OG+cUjuj+uMEi0CD5NCukevXvTNIjnn9qpuGuK3+U/dhviYZB+H/CL15IyEadCH5DyivzfiJbQYwX3sR6PcvLdMmKg8XUs5iocPyNPOKL/1/9BI2rgTgBEsUSBswfXRpwSw3uqnNvl1vXXmxoNW+1GiIQQxcBsJ6CP88PX0zeEUo/9z4dPAaEA4aP0JRwrEF3hWrOr9hv56dWR1eQIIcmDYIDhVTaN/wvj4RTVfcXB9H9VAkbei3KA
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(186009)(451199024)(1800799009)(82310400011)(40470700004)(36840700001)(46966006)(31686004)(6666004)(5660300002)(70206006)(40460700003)(36756003)(2616005)(31696002)(86362001)(81166007)(356005)(47076005)(40480700001)(36860700001)(82740400003)(2906002)(83380400001)(336012)(478600001)(426003)(53546011)(110136005)(26005)(8676002)(70586007)(8936002)(54906003)(41300700001)(316002)(16576012)(4326008)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 08:06:03.0946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60f23293-b6d8-45d6-f03d-08dba866ca04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6583



On 25/08/2023 10:02, Vikram Garhwal wrote:
> Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
> 
> Moving spin_lock to caller was done to prevent the concurrent access to
> iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
> patches in this series introduces node add/remove feature.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> 
> ---
> Changes from v9:
>     Make iommu_dt_device_is_assigned_locked() static and delete header.
>     Move dtdevs_lock before iommu_dt_device_is_assigned_locked().
> Changes from v7:
>     Update commit message.
>     Add ASSERT().
> ---
> ---
>  xen/drivers/passthrough/device_tree.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 1c32d7b50c..5d84c07b50 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -83,16 +83,17 @@ fail:
>      return rc;
>  }
>  
> -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> +static bool_t
> +iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
This does not apply cleanly due to recent change from bool_t to bool. Please rebase for v11 (the function
should then fit in a single line I think).

>  {
>      bool_t assigned = 0;
>  
> +    ASSERT(spin_is_locked(&dtdevs_lock));
> +
>      if ( !dt_device_is_protected(dev) )
>          return 0;
>  
> -    spin_lock(&dtdevs_lock);
>      assigned = !list_empty(&dev->domain_list);
> -    spin_unlock(&dtdevs_lock);
>  
>      return assigned;
>  }
> @@ -223,17 +224,24 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>          if ( ret )
>              break;
>  
> +        spin_lock(&dtdevs_lock);
Why is this lock placed here instead of ...
> +
>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
>          {
> -            if ( iommu_dt_device_is_assigned(dev) )
> +
... here, right before iommu_dt_device_is_assigned_locked()?
> +            if ( iommu_dt_device_is_assigned_locked(dev) )
>              {
>                  printk(XENLOG_G_ERR "%s already assigned.\n",
>                         dt_node_full_name(dev));
>                  ret = -EINVAL;
>              }
> +
> +            spin_unlock(&dtdevs_lock);
>              break;
>          }
>  
> +        spin_unlock(&dtdevs_lock);
You could then remove this one.

With the remarks addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

