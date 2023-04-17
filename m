Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A2B6E435C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 11:15:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521869.810837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKwr-0007Vj-8W; Mon, 17 Apr 2023 09:14:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521869.810837; Mon, 17 Apr 2023 09:14:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poKwr-0007Tq-5P; Mon, 17 Apr 2023 09:14:57 +0000
Received: by outflank-mailman (input) for mailman id 521869;
 Mon, 17 Apr 2023 09:14:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncOi=AI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1poKwp-0007Tk-Dw
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 09:14:55 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20622.outbound.protection.outlook.com
 [2a01:111:f400:7eab::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fa2a60f-dd00-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 11:14:53 +0200 (CEST)
Received: from MW3PR05CA0007.namprd05.prod.outlook.com (2603:10b6:303:2b::12)
 by SA0PR12MB4429.namprd12.prod.outlook.com (2603:10b6:806:73::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 09:14:50 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::7f) by MW3PR05CA0007.outlook.office365.com
 (2603:10b6:303:2b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.19 via Frontend
 Transport; Mon, 17 Apr 2023 09:14:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.19 via Frontend Transport; Mon, 17 Apr 2023 09:14:49 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 04:14:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 04:14:48 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 17 Apr 2023 04:14:46 -0500
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
X-Inumbo-ID: 4fa2a60f-dd00-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIzLYJWBGan3eQCeTnX+dk6lz0ch4c0hDh+aourpwyDZNtasE0BctTrwDLfv9/WSvvO76YM0DBv94kP0p+/5nIMmSd5dVeAKII1035kzLPJVqTZLsOLdX4zu463DZf71XjzQCvY2PkGJ+7OK9SQiDwN6mb0uaQllt/mpdEtDJszYhmA48IeSlU7Ol/q9Jqt5hcZB9TitFx4aRGYB6O58qqMM95Ox7qCv7LfVI9q6hGxkt5INsOUZXsaTZRTgU9ReEWs3xY+2RgxmHPDhE3sBOEiE39Sj8EzJu+cyGaVP9sVR9xxr2qusxNXj/q7akquKQkYTZB70kIihAt9q0lYTVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZrJ9heFh4JrBPCgTPG9XVKHRb96aOeDIXYtPn+itCg=;
 b=ndkicFCyq0sB3pm6wpYp7aqoqJTPPpLe3n/p6a7WHri+uHQBVF28Dmyjccllqzsj6sGGJYU5RmvmJKuRFho+Skdk6ZXWjsJUlJvgJQytQsribxjH16t106YAqCMXoEmtrs0A2TVGZ2a+PvwbxhTcAC4OK1GFblaZRiqZEqG/e4FLVZIo+momlHv2T0M/sifpJ2l0RXXM1Ci/y/I67wVyDF6fLT/nnyvWFemST3EACT1yxd/F8mmKyTaB6V4Cvr331bw5sPshOiYfmJIAWTf3nUlggOxdVbZD4VtCDTSiVmAqyj+ppEubKhRbHU/1w7lCzLa2SQGynLspElXxAsyiFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZrJ9heFh4JrBPCgTPG9XVKHRb96aOeDIXYtPn+itCg=;
 b=UK/CuwIH0R81QDgg0j8nDCaOOyfUKBvEWVYRnaiprKltM/CxjXOso20hoZCz0fXiFUViUvdsuFzrSzHMfo+SEH9muH2h/ckzhVD0BfDZh8vSAJkCKrzhuBq8edxSD7fIHEWpM3Jc//N2nB7uuNLOVN9YpHXnUiL7NvCKhWRMfbU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b03f23e0-e66f-520a-20eb-7038e19d1649@amd.com>
Date: Mon, 17 Apr 2023 11:14:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 08/17] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-9-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230411191636.26926-9-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT035:EE_|SA0PR12MB4429:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e37a0ef-b664-4ab9-5b24-08db3f24320c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sVgdy0L91du4CMgiBqHk9uQx6N5l9m+rdeUzd/V7Yg6P9WeKOJswYevVADLMTJmT1ALyKKPMmdQADY3oUAKINar6fyIiJsaNoZvUMDL57JJQ3DiRwEXb5hldoU0R81wT2nBPQIOk6sHjNamQq6w4T0QmRhaS6du78EJNqoZ+7q0joxRMKbo+bHLe/EQ4rvyGp3K7HJzroOkrN+mdqr9E3Rg+AzBf+5Rm5v9cWBVtHDwS4cRB1WYMl78fq2CwCCyfLdzNYzpwMMXL3SeccP177DFR2Hn5xcYOx//FFrlFCinQCjA6netXJUoE3wx0hu6BENct8brdRYsNfgi6he+M6ZSrJuUHDhmcFrg5VteDgM0JFH1t/Yuq8x20s4St07gtvA05oQpvkMHQF8+hIsvDBi3G+hdUCoXX9NuQ5HOJTQUFyp+R8r/SrXiTAuzlCmii3ATcTbShKreiWZQBMS5lzanKY0Gv84WYSeGcuE7YuSB7nc7mzay+4NPVrA9I9YN2qy8Aha6T5zl7uOxaWMNDXcNGpCVVqbSSxScmk/vuCoUVXWJUEXOJbgpVqMMXOdj6cntzkT9JTPKDyZyMobFiQ7/yTn5sLL4TAbpLzK3yrOtmWEmAX5xkbKqCuR11DGejNSYSBAE7BZrAjrxZRZ8zB1MGEnSkDCjS0iJlw7/LLiNEDXQNAi/SNHivRIzWsAMg6g6VUp2nH74MIkcrOLMWeOrQc0reZQCY7HloCl03LYOfQtlBAtreGDspRJTOEBivSFOJPRQ1jo11f/JWcpJ14Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(5660300002)(40460700003)(2906002)(4326008)(70586007)(36756003)(70206006)(16576012)(44832011)(86362001)(8936002)(81166007)(82310400005)(41300700001)(478600001)(356005)(8676002)(316002)(82740400003)(31696002)(40480700001)(54906003)(110136005)(26005)(336012)(31686004)(426003)(53546011)(36860700001)(2616005)(47076005)(186003)(83380400001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 09:14:49.2381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e37a0ef-b664-4ab9-5b24-08db3f24320c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4429

Hi Vikram,

It looks like you didn't take into account any of my remarks made for v4.
I will repeat them here.

On 11/04/2023 21:16, Vikram Garhwal wrote:
> 
> 
> Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_lock().
s/lock/locked

> 
> Moving spin_lock to caller was done to prevent the concurrent access to
> iommu_dt_device_is_assigned while doing add/remove/assign/deassign.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/drivers/passthrough/device_tree.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 1c32d7b50c..bb4cf7784d 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -83,16 +83,15 @@ fail:
>      return rc;
>  }
> 
> -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> +static bool_t
> +    iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
This should not be indented.

>  {
>      bool_t assigned = 0;
> 
>      if ( !dt_device_is_protected(dev) )
>          return 0;
> 
> -    spin_lock(&dtdevs_lock);
>      assigned = !list_empty(&dev->domain_list);
> -    spin_unlock(&dtdevs_lock);
> 
>      return assigned;
>  }
> @@ -213,27 +212,43 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>          if ( (d && d->is_dying) || domctl->u.assign_device.flags )
>              break;
> 
> +        spin_lock(&dtdevs_lock);
> +
>          ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>                                      domctl->u.assign_device.u.dt.size,
>                                      &dev);
>          if ( ret )
> +        {
> +            spin_unlock(&dtdevs_lock);
> +
Please, do not add blank line between spin_unlock and break. It does not improve readability.

>              break;
> +        }
> 
>          ret = xsm_assign_dtdevice(XSM_HOOK, d, dt_node_full_name(dev));
>          if ( ret )
> +        {
> +            spin_unlock(&dtdevs_lock);
> +
same here.

~Michal

