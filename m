Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195616E459C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 12:50:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521974.811028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMQi-0001uV-0v; Mon, 17 Apr 2023 10:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521974.811028; Mon, 17 Apr 2023 10:49:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poMQh-0001rk-Tn; Mon, 17 Apr 2023 10:49:51 +0000
Received: by outflank-mailman (input) for mailman id 521974;
 Mon, 17 Apr 2023 10:49:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncOi=AI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1poMQg-0001re-MY
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 10:49:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 926a6bd4-dd0d-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 12:49:49 +0200 (CEST)
Received: from BN9PR03CA0476.namprd03.prod.outlook.com (2603:10b6:408:139::31)
 by IA1PR12MB6187.namprd12.prod.outlook.com (2603:10b6:208:3e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 10:49:43 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::af) by BN9PR03CA0476.outlook.office365.com
 (2603:10b6:408:139::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 10:49:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.31 via Frontend Transport; Mon, 17 Apr 2023 10:49:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 05:49:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 05:49:42 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 17 Apr 2023 05:49:41 -0500
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
X-Inumbo-ID: 926a6bd4-dd0d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+op2pTk/8syq7/tZu+ELKYFFGWJQRq2IeC1NIFtRycExFYABc0vuxTHJYIjG9DUk+JofV82p4MxDBKzfPI8N5MkjlzHxCNl+yInpuK+hjX6n/5dnMxobKT7SoVVR95R8hUYh2XiJvp9FkCjGAkAafRYJIay8I5LBTajVjmCk1FYCjQfv6SQ1507ogMhC1Du1giBZFpfUXSfY+9uW9i4HgjwENTi59QoZIV+dTGlaFtOtz2ZX4TclH1I9n1ubzePk3xIUm06T57lDdRgo1BZpQd97UFtQD1BxONCLIx/h5nMBBASfWqa3AzsxzYYMW34CBqOCKtLveCuR5VByABEyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0h/tw2Xxd4md3b/WR2PSFmwygza9eelOtUn0TBTW5o4=;
 b=BD7SsnnCRiZ+ZQL7c4wk2N7RW+GOoZninqtt4pcIQ7dP3L9fLKdZzD48XbIRn5j1DiG9jEL6KpT3hdJHx4YxYmVx5z+MphH1RpzYkjY51WH8jpxPxdYux4G8juRnlBHZfpq3YzRcFXpDKAp2lq/y9kgPAQeGNhHEoKBAaUEur3wvTW4DGq1q+W8kvQa83w63XpaqD37r54lnWzes7FnTxPN8tJHPgdlRDGjmZSCmup4U13HrcSkS+f5KdapdK3R5nXKn3vJ+rlZL0Z0XgKXwqwkArlrX6yrV73HtuT4JMyyO9fwjkFfmzT0WGaswSzKsvMsBwvSMWjc0pu5q1A+HRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0h/tw2Xxd4md3b/WR2PSFmwygza9eelOtUn0TBTW5o4=;
 b=i5jXhbEoTCXMGJmn6VNGHsrxowhAgoKRXlFKI1O+c6dnWdbfqKVDbi7GfjGSaEQrdiaQhZCG9k4KSWIYybBNnpsyjVEWOASr8pyoqoeLMv7hhxxtroLt/YQvATt9OSS4fjDEGbZDx+1WtvMvbOnATkuoNgqb0lxFudhhx/kwDLs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <dee8bad5-6f5f-7fc7-dab7-78811ee7c2d2@amd.com>
Date: Mon, 17 Apr 2023 12:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [XEN][PATCH v5 10/17] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
 <20230411191636.26926-11-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230411191636.26926-11-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT025:EE_|IA1PR12MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: b9313c41-7a47-40e9-8721-08db3f3173f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Wcl5UX4nrxw7xDSkp0GoOa1mKPsBLLJYBCTH4q3hikUSoGpkql5tOby9dKkStqY3LUl8Syj/L0CWa8L9iyrElhq2bGPuTK/aCXPHju61U1A16wGpiVXzHdyUKxv+k0QOI6dr9hMOiXW2xdeDOC9i1UHLy+imaLlD2zh8ZyQ4FnM1vNBeQ2qB9v3HiP8yheGcim6ixUc71ahW+IwJc3ws9Kxvm2Ssv3Ut+FkDaXKORMwTsNfMUOKxdUPIERz3p8OP6qf0r6OGwrX67RWZ9BZC2eYl9sbG7bBebON40erXIfrqvMmAdM4eBrbXbrG1i+Tukf1x0HxtPOLtWrUtsieRgGQIj4B5HP27ia5saFLl8qUgLG6B8d6XZ5gBO8M7Ot3jMnKb+gyZS6EsujV8rCDCWrjCFeabfBSl5fjc2wYEN6ve2XHl2mUm0NLPQCLasCbzsid3T/4M4OJPJYaMgnVLjmefnHHEHmVH4sTL11cWA8AlB2joMIJveKRcwuI0HT7POA5oldWxhEf1+5upjXEdw8F7o94M/JfAY5iXJLsBPmHnne6ijlBoGqdLPH/lQl2w3sEZ5Lmog95c93lnPa/Ejuk+7UutHCOS8TrUjvz5V+3ZopP0MUCmA75NRWIBNM8pSpaNyZw+L6aT7+yGJGNACQSSwqMYLqhpFc3+5yHMic1i/lojaeHwvM14eUL1PSnJLmsf7jnzyivzoAERiK5LOZHEFdZUQ7LOuNgaWV17jVvYjRa18Fqz7DxUBDQeMVvZAYI1FNbPv2fMI3CI4AJFhQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(478600001)(8936002)(8676002)(316002)(41300700001)(82740400003)(4326008)(40480700001)(70586007)(70206006)(81166007)(54906003)(110136005)(356005)(40460700003)(186003)(2906002)(36756003)(53546011)(26005)(336012)(86362001)(31696002)(83380400001)(426003)(47076005)(82310400005)(2616005)(36860700001)(31686004)(16576012)(5660300002)(44832011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 10:49:43.3835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9313c41-7a47-40e9-8721-08db3f3173f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6187

Hi Vikram,

On 11/04/2023 21:16, Vikram Garhwal wrote:
> 
> 
> Remove master device from the IOMMU. This will be helpful when removing the
> overlay nodes using dynamic programming during run time.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> ---
>  xen/drivers/passthrough/device_tree.c | 38 +++++++++++++++++++++++++++
>  xen/include/xen/iommu.h               |  2 ++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 457df333a0..a77a217f3d 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -126,6 +126,44 @@ int iommu_release_dt_devices(struct domain *d)
>      return 0;
>  }
> 
> +int iommu_remove_dt_device(struct dt_device_node *np)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    struct device *dev = dt_to_dev(np);
> +    int rc;
> +
> +    if ( !ops )
> +        return -EOPNOTSUPP;
> +
> +    spin_lock(&dtdevs_lock);
> +
> +    if ( iommu_dt_device_is_assigned_locked(np) )
> +    {
> +        rc = -EBUSY;
> +        goto fail;
> +    }
> +
> +    /*
> +     * The driver which supports generic IOMMU DT bindings must have
> +     * these callback implemented.
s/these/this since you are checking for a single callback.

> +     */
> +    if ( !ops->remove_device )
> +    {
> +        rc = -EOPNOTSUPP;
> +        goto fail;
> +    }
> +
> +    /* Remove master device from the IOMMU if latter is present and available. */
80 chars length exceeded -> please fix.
Apart from that, similarly to comment inside iommu_add_dt_device(), I would also write
something that the driver is responsible for unsetting is_protected flag.

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

